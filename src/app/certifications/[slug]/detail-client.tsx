"use client";

import Link from "next/link";
import { useEffect, useRef, useState } from "react";
import { motion } from "framer-motion";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Separator } from "@/components/ui/separator";
import {
  buildQuizStartHref,
  getDefaultQuizDurationMinutes,
  getDefaultQuizQuestionCount,
  getQuizDurationOptions,
  getQuizQuestionCountOptions,
  MAX_QUIZ_DURATION_MINUTES,
  MIN_QUIZ_DURATION_MINUTES,
  MIN_QUIZ_QUESTION_COUNT,
  sanitizeQuizDurationMinutes,
  sanitizeQuizQuestionCount,
} from "@/lib/quiz-options";
import {
  ArrowLeft,
  BookOpen,
  Clock,
  Gauge,
  ListOrdered,
  Play,
  Shuffle,
  Sparkles,
  Target,
  Timer,
  TimerOff,
  Trophy,
} from "lucide-react";
import { cn } from "@/lib/utils";

interface CertProps {
  id: string;
  title: string;
  slug: string;
  description: string | null;
  icon: string | null;
  timeLimitMinutes: number | null;
  passingScore: number;
}

interface AttemptSummary {
  id: string;
  mode: "fixed" | "random";
  timed: boolean;
  questionCount: number;
  timeLimitSeconds: number | null;
  score: number | null;
  passed: boolean | null;
  startedAt: string;
  completedAt: string | null;
}

interface Props {
  certification: CertProps;
  questionCount: number;
  attemptHistory: AttemptSummary[];
}

export function CertificationDetailClient({
  certification,
  questionCount,
  attemptHistory,
}: Props) {
  const defaultQuestionCount = getDefaultQuizQuestionCount(questionCount);
  const defaultDuration = getDefaultQuizDurationMinutes(
    certification.timeLimitMinutes,
  );
  const preferenceStorageKey = `code-theory:quiz-setup:${certification.id}`;
  const [mode, setMode] = useState<"random" | "fixed">("random");
  const [timed, setTimed] = useState(false);
  const [selectedQuestionCount, setSelectedQuestionCount] =
    useState(defaultQuestionCount);
  const [selectedDuration, setSelectedDuration] = useState(defaultDuration);
  const hasLoadedPreferencesRef = useRef(false);

  const canStart = questionCount > 0;
  const questionOptions = getQuizQuestionCountOptions(questionCount);
  const durationOptions = getQuizDurationOptions(
    certification.timeLimitMinutes,
  );
  const estimatedSecondsPerQuestion = timed
    ? Math.round((selectedDuration * 60) / Math.max(selectedQuestionCount, 1))
    : null;
  const paceLabel = !estimatedSecondsPerQuestion
    ? "No timer pressure"
    : estimatedSecondsPerQuestion >= 90
      ? `~${Math.round(estimatedSecondsPerQuestion / 60)} min/q`
      : `~${estimatedSecondsPerQuestion}s/q`;
  const startHref = canStart
    ? buildQuizStartHref({
        certificationId: certification.id,
        mode,
        timed,
        questionCount: selectedQuestionCount,
        timeLimitMinutes: selectedDuration,
      })
    : "#";

  useEffect(() => {
    let cancelled = false;

    queueMicrotask(() => {
      if (cancelled) {
        return;
      }

      try {
        const savedPreferences =
          window.localStorage.getItem(preferenceStorageKey);

        if (savedPreferences) {
          const parsed = JSON.parse(savedPreferences) as Partial<{
            mode: "random" | "fixed";
            timed: boolean;
            questionCount: number;
            timeLimitMinutes: number;
          }>;

          setMode(parsed.mode === "fixed" ? "fixed" : "random");
          setTimed(parsed.timed === true);
          setSelectedQuestionCount(
            sanitizeQuizQuestionCount(parsed.questionCount, questionCount) ??
              defaultQuestionCount,
          );
          setSelectedDuration(
            sanitizeQuizDurationMinutes(parsed.timeLimitMinutes) ??
              defaultDuration,
          );
        }
      } catch {
        try {
          window.localStorage.removeItem(preferenceStorageKey);
        } catch {
          // Ignore storage access failures.
        }
      }

      hasLoadedPreferencesRef.current = true;
    });

    return () => {
      cancelled = true;
    };
  }, [
    defaultDuration,
    defaultQuestionCount,
    preferenceStorageKey,
    questionCount,
  ]);

  useEffect(() => {
    if (!hasLoadedPreferencesRef.current) {
      return;
    }

    try {
      window.localStorage.setItem(
        preferenceStorageKey,
        JSON.stringify({
          mode,
          timed,
          questionCount: selectedQuestionCount,
          timeLimitMinutes: selectedDuration,
        }),
      );
    } catch {
      // Ignore storage access failures.
    }
  }, [
    mode,
    preferenceStorageKey,
    selectedDuration,
    selectedQuestionCount,
    timed,
  ]);

  const handleQuestionCountChange = (value: string) => {
    const parsed = Number.parseInt(value, 10);

    if (Number.isNaN(parsed)) {
      setSelectedQuestionCount(defaultQuestionCount);
      return;
    }

    setSelectedQuestionCount(
      sanitizeQuizQuestionCount(
        Math.max(MIN_QUIZ_QUESTION_COUNT, parsed),
        questionCount,
      ) ?? defaultQuestionCount,
    );
  };

  const handleDurationChange = (value: string) => {
    const parsed = Number.parseInt(value, 10);

    if (Number.isNaN(parsed)) {
      setTimed(true);
      setSelectedDuration(defaultDuration);
      return;
    }

    setTimed(true);
    setSelectedDuration(
      sanitizeQuizDurationMinutes(
        Math.min(
          MAX_QUIZ_DURATION_MINUTES,
          Math.max(MIN_QUIZ_DURATION_MINUTES, parsed),
        ),
      ) ?? defaultDuration,
    );
  };

  return (
    <div className="mx-auto max-w-3xl px-4 py-8">
      <Link
        href="/"
        className="mb-6 inline-flex items-center gap-1.5 text-sm text-muted-foreground transition-colors hover:text-foreground"
      >
        <ArrowLeft className="h-4 w-4" />
        Back to certifications
      </Link>

      <motion.div
        initial={{ opacity: 0, y: -10 }}
        animate={{ opacity: 1, y: 0 }}
        className="mb-8"
      >
        <h1 className="text-2xl font-extrabold tracking-tight sm:text-3xl">
          {certification.title}
        </h1>
        {certification.description && (
          <p className="mt-2 text-muted-foreground">
            {certification.description}
          </p>
        )}
        <div className="mt-4 flex flex-wrap gap-2">
          <Badge variant="secondary" className="gap-1">
            <BookOpen className="h-3 w-3" />
            {questionCount} questions
          </Badge>
          {certification.timeLimitMinutes && (
            <Badge variant="secondary" className="gap-1">
              <Clock className="h-3 w-3" />
              Recommended {certification.timeLimitMinutes} min
            </Badge>
          )}
          <Badge variant="outline">Pass: {certification.passingScore}%</Badge>
        </div>
      </motion.div>

      <motion.div
        initial={{ opacity: 0, y: 10 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.1 }}
      >
        <Card className="mb-6">
          <CardHeader>
            <CardTitle className="text-lg">Practice Setup</CardTitle>
          </CardHeader>
          <CardContent className="space-y-5">
            <div>
              <p className="mb-2 text-sm font-medium">Question Order</p>
              <div className="grid grid-cols-2 gap-2">
                <button
                  onClick={() => setMode("random")}
                  className={cn(
                    "flex items-center gap-2 rounded-lg border-2 p-3 text-sm font-medium transition-all",
                    mode === "random"
                      ? "border-primary bg-primary/5 text-primary"
                      : "border-border hover:border-primary/30",
                  )}
                >
                  <Shuffle className="h-4 w-4" />
                  Random
                </button>
                <button
                  onClick={() => setMode("fixed")}
                  className={cn(
                    "flex items-center gap-2 rounded-lg border-2 p-3 text-sm font-medium transition-all",
                    mode === "fixed"
                      ? "border-primary bg-primary/5 text-primary"
                      : "border-border hover:border-primary/30",
                  )}
                >
                  <ListOrdered className="h-4 w-4" />
                  Fixed Order
                </button>
              </div>
            </div>

            <div>
              <div className="mb-2 flex items-center justify-between gap-3">
                <p className="text-sm font-medium">Question Count</p>
                <span className="text-xs text-muted-foreground">
                  {questionCount} approved available
                </span>
              </div>
              <div className="grid grid-cols-2 gap-2 sm:grid-cols-4">
                {questionOptions.map((count) => {
                  const isSelected = selectedQuestionCount === count;
                  const isFullSet = count === questionCount;

                  return (
                    <button
                      key={count}
                      onClick={() => setSelectedQuestionCount(count)}
                      className={cn(
                        "rounded-lg border-2 px-3 py-3 text-left text-sm font-medium transition-all",
                        isSelected
                          ? "border-primary bg-primary/5 text-primary"
                          : "border-border hover:border-primary/30",
                      )}
                    >
                      <span className="block text-base font-semibold">
                        {isFullSet ? `All ${count}` : count}
                      </span>
                      <span className="text-xs text-muted-foreground">
                        {isFullSet ? "Full practice set" : "Focused session"}
                      </span>
                    </button>
                  );
                })}
              </div>
              <div className="mt-3 rounded-xl border bg-background/70 p-3">
                <div className="flex items-center justify-between gap-3">
                  <p className="text-sm font-medium">Custom amount</p>
                  <span className="text-xs text-muted-foreground">
                    1 to {questionCount}
                  </span>
                </div>
                <div className="mt-3 flex items-center gap-3">
                  <Input
                    type="number"
                    min={MIN_QUIZ_QUESTION_COUNT}
                    max={questionCount}
                    step={1}
                    inputMode="numeric"
                    value={selectedQuestionCount}
                    onChange={(event) =>
                      handleQuestionCountChange(event.target.value)
                    }
                    disabled={!canStart}
                    className="h-10 max-w-32"
                  />
                  <span className="text-sm text-muted-foreground">
                    questions per session
                  </span>
                </div>
              </div>
            </div>

            <div>
              <div className="mb-2 flex items-center justify-between gap-3">
                <p className="text-sm font-medium">Time Window</p>
                <span className="text-xs text-muted-foreground">
                  Presets start at 10 minutes
                </span>
              </div>
              <div className="grid gap-2 sm:grid-cols-[minmax(0,1fr)_minmax(0,2fr)]">
                <button
                  onClick={() => setTimed(false)}
                  className={cn(
                    "flex items-center gap-2 rounded-lg border-2 p-3 text-sm font-medium transition-all",
                    !timed
                      ? "border-primary bg-primary/5 text-primary"
                      : "border-border hover:border-primary/30",
                  )}
                >
                  <TimerOff className="h-4 w-4" />
                  Untimed
                </button>
                <div className="grid grid-cols-3 gap-2 sm:grid-cols-4">
                  {durationOptions.map((minutes) => {
                    const isRecommended =
                      certification.timeLimitMinutes === minutes;
                    const isSelected = timed && selectedDuration === minutes;

                    return (
                      <button
                        key={minutes}
                        onClick={() => {
                          setTimed(true);
                          setSelectedDuration(minutes);
                        }}
                        className={cn(
                          "rounded-lg border-2 px-3 py-3 text-left text-sm font-medium transition-all",
                          isSelected
                            ? "border-primary bg-primary/5 text-primary"
                            : "border-border hover:border-primary/30",
                        )}
                      >
                        <span className="flex items-center gap-1.5 text-base font-semibold">
                          <Timer className="h-4 w-4" />
                          {minutes}m
                        </span>
                        <span className="text-xs text-muted-foreground">
                          {isRecommended ? "Recommended" : "Timed practice"}
                        </span>
                      </button>
                    );
                  })}
                </div>
              </div>
              <div className="mt-3 rounded-xl border bg-background/70 p-3">
                <div className="flex items-center justify-between gap-3">
                  <p className="text-sm font-medium">Custom timer</p>
                  <span className="text-xs text-muted-foreground">
                    {MIN_QUIZ_DURATION_MINUTES} to {MAX_QUIZ_DURATION_MINUTES}{" "}
                    minutes
                  </span>
                </div>
                <div className="mt-3 flex items-center gap-3">
                  <Input
                    type="number"
                    min={MIN_QUIZ_DURATION_MINUTES}
                    max={MAX_QUIZ_DURATION_MINUTES}
                    step={5}
                    inputMode="numeric"
                    value={selectedDuration}
                    onChange={(event) =>
                      handleDurationChange(event.target.value)
                    }
                    onFocus={() => setTimed(true)}
                    className="h-10 max-w-32"
                  />
                  <span className="text-sm text-muted-foreground">
                    minutes before auto-submit
                  </span>
                </div>
              </div>
            </div>

            <Separator />

            <div className="rounded-2xl border bg-muted/30 p-4">
              <div className="mb-4 flex items-center gap-2">
                <Sparkles className="h-4 w-4 text-primary" />
                <p className="text-sm font-semibold">Practice Summary</p>
              </div>
              <div className="grid gap-3 sm:grid-cols-3">
                <div className="rounded-xl border bg-background/80 p-3">
                  <span className="flex items-center gap-2 text-xs uppercase tracking-wide text-muted-foreground">
                    <Target className="h-3.5 w-3.5" />
                    Questions
                  </span>
                  <p className="mt-2 text-lg font-semibold">
                    {selectedQuestionCount} question
                    {selectedQuestionCount === 1 ? "" : "s"}
                  </p>
                </div>
                <div className="rounded-xl border bg-background/80 p-3">
                  <span className="flex items-center gap-2 text-xs uppercase tracking-wide text-muted-foreground">
                    <Clock className="h-3.5 w-3.5" />
                    Session
                  </span>
                  <p className="mt-2 text-lg font-semibold">
                    {timed ? `${selectedDuration} minutes` : "Self-paced"}
                  </p>
                </div>
                <div className="rounded-xl border bg-background/80 p-3">
                  <span className="flex items-center gap-2 text-xs uppercase tracking-wide text-muted-foreground">
                    <Gauge className="h-3.5 w-3.5" />
                    Pace
                  </span>
                  <p className="mt-2 text-lg font-semibold">{paceLabel}</p>
                </div>
              </div>
              <p className="mt-4 text-sm text-muted-foreground">
                Practice sessions pull from approved questions only, so each run
                stays aligned with the reviewed pool.
              </p>
            </div>

            <p className="text-xs text-muted-foreground">
              This setup is remembered on this device for this certification.
            </p>

            <Link
              href={startHref}
              className={cn(!canStart && "pointer-events-none")}
            >
              <Button
                size="lg"
                className="w-full gap-2 text-base"
                disabled={!canStart}
              >
                <Play className="h-5 w-5" />
                {canStart ? "Start Practice Session" : "No questions available"}
              </Button>
            </Link>
          </CardContent>
        </Card>
      </motion.div>

      {attemptHistory.length > 0 && (
        <motion.div
          initial={{ opacity: 0, y: 10 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.2 }}
        >
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2 text-lg">
                <Trophy className="h-5 w-5 text-primary" />
                Recent Attempts
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="space-y-2">
                {attemptHistory.map((attempt) => (
                  <Link
                    key={attempt.id}
                    href={`/results/${attempt.id}`}
                    className="flex items-center justify-between rounded-lg border px-4 py-3 transition-colors hover:bg-accent"
                  >
                    <div className="flex items-center gap-3">
                      <Badge
                        variant={attempt.passed ? "default" : "destructive"}
                        className="text-xs"
                      >
                        {attempt.passed
                          ? "PASSED"
                          : attempt.score !== null
                            ? "FAILED"
                            : "IN PROGRESS"}
                      </Badge>
                      <span className="text-sm text-muted-foreground">
                        {attempt.questionCount} questions ·{" "}
                        {attempt.mode === "random" ? "Random" : "Fixed"} ·{" "}
                        {attempt.timed && attempt.timeLimitSeconds
                          ? `${Math.round(attempt.timeLimitSeconds / 60)} min`
                          : "Untimed"}
                      </span>
                    </div>
                    <div className="flex items-center gap-3">
                      {attempt.score !== null && (
                        <span className="text-sm font-bold">
                          {attempt.score}%
                        </span>
                      )}
                      <span className="text-xs text-muted-foreground">
                        {new Date(attempt.startedAt).toLocaleDateString()}
                      </span>
                    </div>
                  </Link>
                ))}
              </div>
            </CardContent>
          </Card>
        </motion.div>
      )}
    </div>
  );
}
