"use client";

import { motion } from "framer-motion";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Separator } from "@/components/ui/separator";
import {
  Trophy,
  XCircle,
  CheckCircle,
  RotateCcw,
  Home,
  ChevronDown,
  ChevronUp,
} from "lucide-react";
import Link from "next/link";
import { useState } from "react";
import { buildQuizStartHref } from "@/lib/quiz-options";
import { cn } from "@/lib/utils";
import type { QuizResult } from "@/types";

interface Props {
  result: QuizResult;
}

export function ResultsClient({ result }: Props) {
  const [showReview, setShowReview] = useState(false);
  const { attempt, answers, totalCorrect, totalQuestions, percentage } = result;
  const passed = attempt.passed;

  return (
    <div className="mx-auto max-w-3xl px-4 py-8">
      {/* Score banner */}
      <motion.div
        initial={{ opacity: 0, scale: 0.9 }}
        animate={{ opacity: 1, scale: 1 }}
        transition={{ type: "spring", bounce: 0.3 }}
        className="text-center mb-8"
      >
        <div
          className={cn(
            "inline-flex h-24 w-24 items-center justify-center rounded-full mb-4",
            passed
              ? "bg-green-100 text-green-600 dark:bg-green-900/30 dark:text-green-400"
              : "bg-red-100 text-red-600 dark:bg-red-900/30 dark:text-red-400",
          )}
        >
          {passed ? (
            <Trophy className="h-12 w-12" />
          ) : (
            <XCircle className="h-12 w-12" />
          )}
        </div>

        <h1 className="text-3xl font-extrabold tracking-tight">
          {passed ? "Congratulations!" : "Keep Practicing!"}
        </h1>
        <p className="mt-1 text-muted-foreground">
          {attempt.certificationTitle}
        </p>

        <div className="mt-6 flex items-center justify-center gap-8">
          <div>
            <p
              className={cn(
                "text-5xl font-extrabold",
                passed
                  ? "text-green-600 dark:text-green-400"
                  : "text-red-600 dark:text-red-400",
              )}
            >
              {percentage}%
            </p>
            <p className="text-sm text-muted-foreground mt-1">Score</p>
          </div>
          <Separator orientation="vertical" className="h-16" />
          <div>
            <p className="text-5xl font-extrabold">
              {totalCorrect}
              <span className="text-xl text-muted-foreground">
                /{totalQuestions}
              </span>
            </p>
            <p className="text-sm text-muted-foreground mt-1">Correct</p>
          </div>
        </div>

        <div className="mt-4">
          <Badge
            variant={passed ? "default" : "destructive"}
            className="text-sm"
          >
            {passed ? "PASSED" : "FAILED"}
          </Badge>
        </div>
      </motion.div>

      {/* Actions */}
      <motion.div
        initial={{ opacity: 0, y: 10 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.2 }}
        className="flex flex-col sm:flex-row gap-3 justify-center mb-8"
      >
        <Link
          href={buildQuizStartHref({
            certificationId: attempt.certificationId,
            mode: attempt.mode,
            timed: attempt.timed,
            questionCount: attempt.questionCount,
            timeLimitMinutes: attempt.timeLimitSeconds
              ? Math.round(attempt.timeLimitSeconds / 60)
              : undefined,
          })}
        >
          <Button variant="outline" className="w-full sm:w-auto gap-2">
            <RotateCcw className="h-4 w-4" />
            Retake Quiz
          </Button>
        </Link>
        <Link href="/">
          <Button className="w-full sm:w-auto gap-2">
            <Home className="h-4 w-4" />
            Back to Home
          </Button>
        </Link>
      </motion.div>

      {/* Review toggle */}
      <motion.div
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: 0.3 }}
      >
        <Button
          variant="ghost"
          onClick={() => setShowReview(!showReview)}
          className="w-full gap-2 mb-4"
        >
          {showReview ? (
            <ChevronUp className="h-4 w-4" />
          ) : (
            <ChevronDown className="h-4 w-4" />
          )}
          {showReview ? "Hide" : "Review"} Answers
        </Button>

        {showReview && (
          <div className="space-y-4">
            {answers.map((answer, i) => (
              <Card
                key={answer.questionId}
                className={cn(
                  "border-l-4",
                  answer.isCorrect ? "border-l-green-500" : "border-l-red-500",
                )}
              >
                <CardContent className="pt-5">
                  <div className="flex items-start gap-3 mb-4">
                    <span className="flex h-7 w-7 shrink-0 items-center justify-center rounded-lg bg-muted text-sm font-bold">
                      {i + 1}
                    </span>
                    <div>
                      <p className="font-medium">{answer.questionText}</p>
                      <div className="mt-1">
                        {answer.isCorrect ? (
                          <Badge
                            variant="outline"
                            className="gap-1 text-green-600 border-green-200"
                          >
                            <CheckCircle className="h-3 w-3" />
                            Correct
                          </Badge>
                        ) : (
                          <Badge
                            variant="outline"
                            className="gap-1 text-red-600 border-red-200"
                          >
                            <XCircle className="h-3 w-3" />
                            Incorrect
                          </Badge>
                        )}
                      </div>
                    </div>
                  </div>

                  <div className="space-y-1.5 ml-10">
                    {answer.options.map((opt) => {
                      const isCorrectOpt = opt.id === answer.correctOptionId;
                      const isSelected = opt.id === answer.selectedOptionId;

                      return (
                        <div
                          key={opt.id}
                          className={cn(
                            "rounded-lg px-3 py-2 text-sm",
                            isCorrectOpt &&
                              "bg-green-50 text-green-800 font-medium dark:bg-green-900/20 dark:text-green-300",
                            isSelected &&
                              !isCorrectOpt &&
                              "bg-red-50 text-red-800 line-through dark:bg-red-900/20 dark:text-red-300",
                          )}
                        >
                          {isCorrectOpt && "✓ "}
                          {isSelected && !isCorrectOpt && "✗ "}
                          {opt.text}
                        </div>
                      );
                    })}
                  </div>

                  {answer.explanation && (
                    <div className="mt-3 ml-10 rounded-lg bg-muted/50 px-3 py-2 text-sm text-muted-foreground">
                      <strong>Explanation:</strong> {answer.explanation}
                    </div>
                  )}
                </CardContent>
              </Card>
            ))}
          </div>
        )}
      </motion.div>
    </div>
  );
}
