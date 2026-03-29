"use client";

import { useState, useEffect, useCallback, useRef } from "react";
import { useRouter } from "next/navigation";
import { motion, AnimatePresence } from "framer-motion";
import { RichContent } from "@/components/common/rich-content";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Progress } from "@/components/ui/progress";
import {
  ChevronLeft,
  ChevronRight,
  Clock,
  CheckCircle,
  Flag,
} from "lucide-react";
import { cn } from "@/lib/utils";
import type { QuizAttempt, QuizQuestion } from "@/types";

interface Props {
  attempt: QuizAttempt;
  questions: QuizQuestion[];
}

export function QuizClient({ attempt, questions }: Props) {
  const router = useRouter();
  const [currentIndex, setCurrentIndex] = useState(0);
  const [selectedAnswers, setSelectedAnswers] = useState<
    Record<string, string>
  >({});
  const [submitting, setSubmitting] = useState(false);
  const [timeLeft, setTimeLeft] = useState(attempt.timeLimitSeconds ?? 0);
  const timerRef = useRef<ReturnType<typeof setInterval> | null>(null);

  const question = questions[currentIndex];
  const progress = ((currentIndex + 1) / questions.length) * 100;
  const answeredCount = Object.keys(selectedAnswers).length;

  // Timer logic
  useEffect(() => {
    if (!attempt.timed || !attempt.timeLimitSeconds) return;

    timerRef.current = setInterval(() => {
      setTimeLeft((t) => {
        if (t <= 1) {
          clearInterval(timerRef.current!);
          handleSubmit();
          return 0;
        }
        return t - 1;
      });
    }, 1000);

    return () => {
      if (timerRef.current) clearInterval(timerRef.current);
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const formatTime = (seconds: number) => {
    const m = Math.floor(seconds / 60);
    const s = seconds % 60;
    return `${m}:${s.toString().padStart(2, "0")}`;
  };

  const goToPrevious = useCallback(() => {
    setCurrentIndex((index) => Math.max(0, index - 1));
  }, []);

  const goToNext = useCallback(() => {
    setCurrentIndex((index) => Math.min(questions.length - 1, index + 1));
  }, [questions.length]);

  const selectAnswer = useCallback(
    async (optionId: string) => {
      setSelectedAnswers((prev) => ({
        ...prev,
        [question.id]: optionId,
      }));

      // Autosave to server
      await fetch("/api/quiz/answer", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          attemptId: attempt.id,
          questionId: question.id,
          selectedOptionId: optionId,
        }),
      });
    },
    [attempt.id, question.id],
  );

  useEffect(() => {
    const handleKeyDown = (event: KeyboardEvent) => {
      const target = event.target as HTMLElement | null;
      if (target && ["INPUT", "TEXTAREA", "SELECT"].includes(target.tagName)) {
        return;
      }

      const key = event.key.toLowerCase();
      const optionIndex =
        key >= "1" && key <= "4"
          ? Number(key) - 1
          : key >= "a" && key <= "d"
            ? key.charCodeAt(0) - 97
            : -1;

      if (optionIndex >= 0) {
        const option = question.options[optionIndex];
        if (option) {
          event.preventDefault();
          void selectAnswer(option.id);
        }
        return;
      }

      if (key === "arrowleft") {
        event.preventDefault();
        goToPrevious();
        return;
      }

      if (key === "arrowright") {
        event.preventDefault();
        goToNext();
      }
    };

    window.addEventListener("keydown", handleKeyDown);
    return () => window.removeEventListener("keydown", handleKeyDown);
  }, [goToNext, goToPrevious, question.options, selectAnswer]);

  const handleSubmit = async () => {
    if (submitting) return;
    setSubmitting(true);
    if (timerRef.current) clearInterval(timerRef.current);

    const res = await fetch("/api/quiz/submit", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ attemptId: attempt.id }),
    });

    if (res.ok) {
      router.push(`/results/${attempt.id}`);
    }
    setSubmitting(false);
  };

  const isLowTime = attempt.timed && timeLeft < 60;

  return (
    <div className="mx-auto max-w-6xl px-4 py-6">
      {/* Top bar: progress + timer */}
      <div className="mb-6 space-y-3">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-2">
            <Badge variant="outline" className="text-xs">
              {currentIndex + 1} / {questions.length}
            </Badge>
            <Badge variant="secondary" className="text-xs gap-1">
              <CheckCircle className="h-3 w-3" />
              {answeredCount} answered
            </Badge>
          </div>
          {attempt.timed && (
            <Badge
              variant={isLowTime ? "destructive" : "secondary"}
              className={cn(
                "gap-1 text-sm font-mono tabular-nums",
                isLowTime && "animate-pulse",
              )}
            >
              <Clock className="h-3.5 w-3.5" />
              {formatTime(timeLeft)}
            </Badge>
          )}
        </div>
        <Progress value={progress} className="h-2" />
      </div>

      <div className="grid gap-6 lg:grid-cols-[minmax(0,1fr)_280px] lg:items-start">
        <div>
          {/* Question */}
          <AnimatePresence mode="wait">
            <motion.div
              key={question.id}
              initial={{ opacity: 0, x: 20 }}
              animate={{ opacity: 1, x: 0 }}
              exit={{ opacity: 0, x: -20 }}
              transition={{ duration: 0.2 }}
            >
              <Card className="mb-6 border border-border/70 bg-gradient-to-br from-card via-card to-muted/20 shadow-[0_20px_70px_-48px_rgba(15,23,42,0.55)]">
                <CardContent className="pt-6">
                  <div className="mb-6 flex flex-wrap items-center gap-2">
                    <Badge variant="outline" className="rounded-full px-3 py-1">
                      Question {currentIndex + 1}
                    </Badge>
                    <Badge
                      variant="secondary"
                      className="rounded-full px-3 py-1 capitalize"
                    >
                      {question.difficulty}
                    </Badge>
                    <Badge
                      variant="outline"
                      className="rounded-full px-3 py-1 text-muted-foreground"
                    >
                      Use A-D or 1-4 to answer
                    </Badge>
                  </div>

                  <div className="rounded-3xl border border-border/70 bg-background/80 p-5 shadow-sm">
                    <div className="flex items-start gap-4">
                      <span className="mt-1 flex h-10 w-10 shrink-0 items-center justify-center rounded-2xl bg-primary text-sm font-bold text-primary-foreground shadow-sm">
                        {currentIndex + 1}
                      </span>
                      <div className="min-w-0 flex-1">
                        <p className="mb-3 text-xs font-semibold uppercase tracking-[0.24em] text-muted-foreground">
                          Question Prompt
                        </p>
                        <RichContent
                          content={question.text}
                          className="text-base sm:text-[1.02rem] [&_p]:text-base [&_p]:leading-7"
                        />
                      </div>
                    </div>
                  </div>

                  {/* Options */}
                  <div
                    role="radiogroup"
                    aria-label={`Question ${currentIndex + 1} answer choices`}
                    className="mt-5 space-y-3"
                  >
                    {question.options.map((option, idx) => {
                      const isSelected =
                        selectedAnswers[question.id] === option.id;
                      const letter = String.fromCharCode(65 + idx);

                      return (
                        <motion.div
                          key={option.id}
                          layout
                          whileTap={{ scale: 0.995 }}
                        >
                          <div
                            role="radio"
                            aria-checked={isSelected}
                            tabIndex={0}
                            onClick={() => void selectAnswer(option.id)}
                            onKeyDown={(event) => {
                              if (event.key === " " || event.key === "Enter") {
                                event.preventDefault();
                                void selectAnswer(option.id);
                              }
                            }}
                            className={cn(
                              "cursor-pointer rounded-2xl border p-4 transition-all outline-none",
                              "focus-visible:border-primary focus-visible:ring-2 focus-visible:ring-primary/20",
                              isSelected
                                ? "border-primary bg-primary/6 shadow-[0_18px_50px_-36px_rgba(59,130,246,0.7)]"
                                : "border-border/70 bg-card/70 hover:border-primary/30 hover:bg-accent/40",
                            )}
                          >
                            <div className="flex items-start gap-3">
                              <div
                                className={cn(
                                  "flex h-10 w-10 shrink-0 items-center justify-center rounded-2xl border text-sm font-bold transition-colors",
                                  isSelected
                                    ? "border-primary bg-primary text-primary-foreground"
                                    : "border-border bg-muted text-muted-foreground",
                                )}
                              >
                                {letter}
                              </div>
                              <div className="min-w-0 flex-1">
                                <div className="mb-1 text-[11px] font-semibold uppercase tracking-[0.24em] text-muted-foreground">
                                  Press {letter}
                                </div>
                                <RichContent content={option.text} compact />
                              </div>
                            </div>
                          </div>
                        </motion.div>
                      );
                    })}
                  </div>
                </CardContent>
              </Card>
            </motion.div>
          </AnimatePresence>

          {/* Navigation */}
          <div className="flex items-center justify-between gap-3">
            <Button
              variant="outline"
              onClick={goToPrevious}
              disabled={currentIndex === 0}
              className="gap-1"
            >
              <ChevronLeft className="h-4 w-4" />
              Previous
            </Button>

            {currentIndex < questions.length - 1 ? (
              <Button onClick={goToNext} className="gap-1">
                Next
                <ChevronRight className="h-4 w-4" />
              </Button>
            ) : (
              <Button
                onClick={handleSubmit}
                disabled={submitting}
                className="gap-2 bg-green-600 hover:bg-green-700"
              >
                <Flag className="h-4 w-4" />
                {submitting ? "Submitting..." : "Submit Quiz"}
              </Button>
            )}
          </div>
        </div>

        <aside className="space-y-4 lg:sticky lg:top-24">
          <Card size="sm" className="border border-border/70 bg-card/80">
            <CardContent className="space-y-4 pt-4">
              <div>
                <p className="text-xs font-semibold uppercase tracking-[0.24em] text-muted-foreground">
                  Session
                </p>
                <div className="mt-2 grid grid-cols-2 gap-3 text-sm">
                  <div className="rounded-2xl border border-border/60 bg-muted/40 p-3">
                    <div className="text-muted-foreground">Answered</div>
                    <div className="mt-1 text-xl font-semibold">
                      {answeredCount}
                    </div>
                  </div>
                  <div className="rounded-2xl border border-border/60 bg-muted/40 p-3">
                    <div className="text-muted-foreground">Remaining</div>
                    <div className="mt-1 text-xl font-semibold">
                      {questions.length - answeredCount}
                    </div>
                  </div>
                </div>
              </div>

              <div>
                <p className="text-xs font-semibold uppercase tracking-[0.24em] text-muted-foreground">
                  Navigator
                </p>
                <div className="mt-3 grid grid-cols-5 gap-2">
                  {questions.map((q, i) => (
                    <button
                      key={q.id}
                      onClick={() => setCurrentIndex(i)}
                      className={cn(
                        "flex h-10 items-center justify-center rounded-xl border text-sm font-semibold transition-all",
                        i === currentIndex
                          ? "border-primary bg-primary text-primary-foreground shadow-sm"
                          : selectedAnswers[q.id]
                            ? "border-primary/30 bg-primary/8 text-primary"
                            : "border-border/70 bg-muted/30 text-muted-foreground hover:border-primary/20 hover:text-foreground",
                      )}
                      aria-label={`Go to question ${i + 1}`}
                    >
                      {i + 1}
                    </button>
                  ))}
                </div>
              </div>

              <div className="rounded-2xl border border-dashed border-border/70 bg-muted/30 p-3 text-xs leading-6 text-muted-foreground">
                Use <strong className="text-foreground">A-D</strong> or{" "}
                <strong className="text-foreground">1-4</strong> to select an
                answer. Use the arrow keys to move between questions.
              </div>
            </CardContent>
          </Card>
        </aside>
      </div>
    </div>
  );
}
