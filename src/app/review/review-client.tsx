"use client";

import { useState } from "react";
import { motion } from "framer-motion";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { CheckCircle, XCircle, ClipboardCheck, Inbox } from "lucide-react";
import { useRouter } from "next/navigation";
import { cn } from "@/lib/utils";

interface QuestionOption {
  id: string;
  text: string;
  isCorrect: boolean;
  orderIndex: number;
}

interface DraftQuestion {
  id: string;
  certificationId: string;
  text: string;
  explanation: string | null;
  difficulty: string | null;
  status: string;
  options: QuestionOption[];
}

interface CertRef {
  id: string;
  title: string;
  slug: string;
}

interface Props {
  certifications: CertRef[];
  initialDrafts: DraftQuestion[];
}

export function ReviewClient({ certifications, initialDrafts }: Props) {
  const router = useRouter();
  const [drafts, setDrafts] = useState(initialDrafts);
  const [processing, setProcessing] = useState<string | null>(null);

  const certMap = new Map(certifications.map((c) => [c.id, c.title]));

  async function handleAction(
    questionId: string,
    action: "approve" | "reject",
  ) {
    setProcessing(questionId);

    await fetch("/api/review", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ questionId, action }),
    });

    setDrafts((prev) => prev.filter((d) => d.id !== questionId));
    setProcessing(null);
  }

  return (
    <div className="mx-auto max-w-4xl px-4 py-8">
      <motion.div
        initial={{ opacity: 0, y: -10 }}
        animate={{ opacity: 1, y: 0 }}
        className="mb-8"
      >
        <h1 className="text-2xl sm:text-3xl font-extrabold tracking-tight flex items-center gap-3">
          <ClipboardCheck className="h-7 w-7 text-primary" />
          Review Queue
        </h1>
        <p className="mt-1 text-muted-foreground">
          {drafts.length} draft question{drafts.length !== 1 ? "s" : ""}{" "}
          awaiting review.
        </p>
      </motion.div>

      {drafts.length === 0 ? (
        <div className="text-center py-16 text-muted-foreground">
          <Inbox className="h-16 w-16 mx-auto mb-4 opacity-40" />
          <p className="text-lg font-medium">No drafts to review</p>
          <p className="text-sm mt-1">
            Import content from documentation to generate draft questions.
          </p>
        </div>
      ) : (
        <div className="space-y-4">
          {drafts.map((draft, i) => (
            <motion.div
              key={draft.id}
              initial={{ opacity: 0, y: 10 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: i * 0.04 }}
            >
              <Card>
                <CardContent className="pt-5">
                  <div className="flex items-start justify-between gap-4 mb-3">
                    <div>
                      <Badge variant="outline" className="text-xs mb-2">
                        {certMap.get(draft.certificationId) ?? "Unknown"}
                      </Badge>
                      <h3 className="font-semibold">{draft.text}</h3>
                    </div>
                    <Badge
                      variant="secondary"
                      className="shrink-0 text-xs capitalize"
                    >
                      {draft.difficulty ?? "medium"}
                    </Badge>
                  </div>

                  {/* Options preview */}
                  <div className="space-y-1.5 mb-4">
                    {draft.options
                      .sort((a, b) => a.orderIndex - b.orderIndex)
                      .map((opt, idx) => (
                        <div
                          key={opt.id}
                          className={cn(
                            "rounded-lg px-3 py-2 text-sm",
                            opt.isCorrect
                              ? "bg-green-50 text-green-800 font-medium dark:bg-green-900/20 dark:text-green-300"
                              : "bg-muted/50",
                          )}
                        >
                          <span className="font-mono mr-2">
                            {String.fromCharCode(65 + idx)}.
                          </span>
                          {opt.text}
                          {opt.isCorrect && " ✓"}
                        </div>
                      ))}
                  </div>

                  {draft.explanation && (
                    <div className="rounded-lg bg-muted/50 px-3 py-2 text-sm text-muted-foreground mb-4">
                      <strong>Explanation:</strong> {draft.explanation}
                    </div>
                  )}

                  {/* Actions */}
                  <div className="flex gap-2 justify-end">
                    <Button
                      variant="outline"
                      size="sm"
                      className="gap-1 text-red-600 hover:text-red-700 hover:bg-red-50"
                      onClick={() => handleAction(draft.id, "reject")}
                      disabled={processing === draft.id}
                    >
                      <XCircle className="h-4 w-4" />
                      Reject
                    </Button>
                    <Button
                      size="sm"
                      className="gap-1 bg-green-600 hover:bg-green-700"
                      onClick={() => handleAction(draft.id, "approve")}
                      disabled={processing === draft.id}
                    >
                      <CheckCircle className="h-4 w-4" />
                      Approve
                    </Button>
                  </div>
                </CardContent>
              </Card>
            </motion.div>
          ))}
        </div>
      )}
    </div>
  );
}
