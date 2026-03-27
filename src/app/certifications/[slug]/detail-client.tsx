"use client";

import { motion } from "framer-motion";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Separator } from "@/components/ui/separator";
import {
  Clock,
  Shuffle,
  ListOrdered,
  Timer,
  TimerOff,
  BookOpen,
  Trophy,
  ArrowLeft,
  Play,
} from "lucide-react";
import Link from "next/link";
import { useState } from "react";
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
  const [mode, setMode] = useState<"random" | "fixed">("random");
  const [timed, setTimed] = useState(false);

  const canStart = questionCount > 0;

  return (
    <div className="mx-auto max-w-3xl px-4 py-8">
      {/* Back link */}
      <Link
        href="/"
        className="inline-flex items-center gap-1.5 text-sm text-muted-foreground hover:text-foreground transition-colors mb-6"
      >
        <ArrowLeft className="h-4 w-4" />
        Back to certifications
      </Link>

      {/* Title */}
      <motion.div
        initial={{ opacity: 0, y: -10 }}
        animate={{ opacity: 1, y: 0 }}
        className="mb-8"
      >
        <h1 className="text-2xl sm:text-3xl font-extrabold tracking-tight">
          {certification.title}
        </h1>
        {certification.description && (
          <p className="mt-2 text-muted-foreground">
            {certification.description}
          </p>
        )}
        <div className="flex flex-wrap gap-2 mt-4">
          <Badge variant="secondary" className="gap-1">
            <BookOpen className="h-3 w-3" />
            {questionCount} questions
          </Badge>
          {certification.timeLimitMinutes && (
            <Badge variant="secondary" className="gap-1">
              <Clock className="h-3 w-3" />
              {certification.timeLimitMinutes} min limit
            </Badge>
          )}
          <Badge variant="outline">Pass: {certification.passingScore}%</Badge>
        </div>
      </motion.div>

      {/* Quiz configuration */}
      <motion.div
        initial={{ opacity: 0, y: 10 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.1 }}
      >
        <Card className="mb-6">
          <CardHeader>
            <CardTitle className="text-lg">Quiz Settings</CardTitle>
          </CardHeader>
          <CardContent className="space-y-5">
            {/* Question order */}
            <div>
              <p className="text-sm font-medium mb-2">Question Order</p>
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

            {/* Timer */}
            <div>
              <p className="text-sm font-medium mb-2">Timer</p>
              <div className="grid grid-cols-2 gap-2">
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
                <button
                  onClick={() => setTimed(true)}
                  disabled={!certification.timeLimitMinutes}
                  className={cn(
                    "flex items-center gap-2 rounded-lg border-2 p-3 text-sm font-medium transition-all",
                    timed
                      ? "border-primary bg-primary/5 text-primary"
                      : "border-border hover:border-primary/30",
                    !certification.timeLimitMinutes &&
                      "opacity-50 cursor-not-allowed",
                  )}
                >
                  <Timer className="h-4 w-4" />
                  Timed
                  {certification.timeLimitMinutes && (
                    <span className="text-xs text-muted-foreground">
                      ({certification.timeLimitMinutes}m)
                    </span>
                  )}
                </button>
              </div>
            </div>

            <Separator />

            {/* Start button */}
            <Link
              href={
                canStart
                  ? `/quiz/start?cert=${certification.id}&mode=${mode}&timed=${timed}`
                  : "#"
              }
              className={cn(!canStart && "pointer-events-none")}
            >
              <Button
                size="lg"
                className="w-full gap-2 text-base"
                disabled={!canStart}
              >
                <Play className="h-5 w-5" />
                {canStart ? "Start Quiz" : "No questions available"}
              </Button>
            </Link>
          </CardContent>
        </Card>
      </motion.div>

      {/* Attempt History */}
      {attemptHistory.length > 0 && (
        <motion.div
          initial={{ opacity: 0, y: 10 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.2 }}
        >
          <Card>
            <CardHeader>
              <CardTitle className="text-lg flex items-center gap-2">
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
                    className="flex items-center justify-between rounded-lg border px-4 py-3 hover:bg-accent transition-colors"
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
                        {attempt.mode === "random" ? "Random" : "Fixed"} ·{" "}
                        {attempt.timed ? "Timed" : "Untimed"}
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
