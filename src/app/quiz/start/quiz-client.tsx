"use client";

import { useState, useEffect, useCallback, useRef } from "react";
import { useRouter } from "next/navigation";
import { motion, AnimatePresence } from "framer-motion";
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
  AlertTriangle,
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
    <div className="mx-auto max-w-3xl px-4 py-6">
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

      {/* Question */}
      <AnimatePresence mode="wait">
        <motion.div
          key={question.id}
          initial={{ opacity: 0, x: 20 }}
          animate={{ opacity: 1, x: 0 }}
          exit={{ opacity: 0, x: -20 }}
          transition={{ duration: 0.2 }}
        >
          <Card className="mb-6">
            <CardContent className="pt-6">
              <div className="flex items-start gap-3 mb-6">
                <span className="flex h-8 w-8 shrink-0 items-center justify-center rounded-lg bg-primary/10 text-primary text-sm font-bold">
                  {currentIndex + 1}
                </span>
                <h2 className="text-lg font-semibold leading-relaxed">
                  {question.text}
                </h2>
              </div>

              {/* Options */}
              <div className="space-y-2">
                {question.options.map((option, idx) => {
                  const isSelected = selectedAnswers[question.id] === option.id;
                  const letter = String.fromCharCode(65 + idx); // A, B, C, D

                  return (
                    <button
                      key={option.id}
                      onClick={() => selectAnswer(option.id)}
                      className={cn(
                        "flex w-full items-start gap-3 rounded-xl border-2 p-4 text-left text-sm transition-all",
                        isSelected
                          ? "border-primary bg-primary/5 ring-1 ring-primary/20"
                          : "border-border hover:border-primary/30 hover:bg-accent/50",
                      )}
                    >
                      <span
                        className={cn(
                          "flex h-7 w-7 shrink-0 items-center justify-center rounded-lg text-xs font-bold transition-colors",
                          isSelected
                            ? "bg-primary text-primary-foreground"
                            : "bg-muted text-muted-foreground",
                        )}
                      >
                        {letter}
                      </span>
                      <span className="pt-0.5 leading-relaxed">
                        {option.text}
                      </span>
                    </button>
                  );
                })}
              </div>
            </CardContent>
          </Card>
        </motion.div>
      </AnimatePresence>

      {/* Navigation */}
      <div className="flex items-center justify-between">
        <Button
          variant="outline"
          onClick={() => setCurrentIndex((i) => Math.max(0, i - 1))}
          disabled={currentIndex === 0}
          className="gap-1"
        >
          <ChevronLeft className="h-4 w-4" />
          Previous
        </Button>

        {currentIndex < questions.length - 1 ? (
          <Button
            onClick={() =>
              setCurrentIndex((i) => Math.min(questions.length - 1, i + 1))
            }
            className="gap-1"
          >
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

      {/* Question navigator dots */}
      <div className="mt-6 flex flex-wrap gap-1.5 justify-center">
        {questions.map((q, i) => (
          <button
            key={q.id}
            onClick={() => setCurrentIndex(i)}
            className={cn(
              "h-3 w-3 rounded-full transition-all",
              i === currentIndex
                ? "bg-primary scale-125"
                : selectedAnswers[q.id]
                  ? "bg-primary/40"
                  : "bg-muted hover:bg-muted-foreground/30",
            )}
            aria-label={`Go to question ${i + 1}`}
          />
        ))}
      </div>
    </div>
  );
}
