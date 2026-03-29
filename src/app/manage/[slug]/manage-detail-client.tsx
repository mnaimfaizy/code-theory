"use client";

import { useState } from "react";
import { motion } from "framer-motion";
import { RichContent } from "@/components/common/rich-content";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog";
import {
  Plus,
  ArrowLeft,
  FileText,
  Link2,
  CheckCircle,
  Clock,
  XCircle,
} from "lucide-react";
import { useRouter } from "next/navigation";
import { toast } from "sonner";

interface QuestionOption {
  id: string;
  text: string;
  isCorrect: boolean;
  orderIndex: number;
}

interface Question {
  id: string;
  text: string;
  explanation: string | null;
  difficulty: string | null;
  status: string;
  options: QuestionOption[];
}

interface Certification {
  id: string;
  title: string;
  slug: string;
  description: string | null;
  timeLimitMinutes: number | null;
  passingScore: number;
}

interface Props {
  certification: Certification;
  questions: Question[];
}

const statusConfig: Record<
  string,
  {
    label: string;
    icon: React.ReactNode;
    variant: "default" | "secondary" | "outline" | "destructive";
  }
> = {
  approved: {
    label: "Approved",
    icon: <CheckCircle className="h-3.5 w-3.5" />,
    variant: "default",
  },
  draft: {
    label: "Draft",
    icon: <Clock className="h-3.5 w-3.5" />,
    variant: "secondary",
  },
  rejected: {
    label: "Rejected",
    icon: <XCircle className="h-3.5 w-3.5" />,
    variant: "destructive",
  },
};

export function ManageDetailClient({
  certification,
  questions: initialQuestions,
}: Props) {
  const router = useRouter();
  const questions = initialQuestions;
  const [addOpen, setAddOpen] = useState(false);
  const [ingestOpen, setIngestOpen] = useState(false);
  const [ingesting, setIngesting] = useState(false);
  const [adding, setAdding] = useState(false);

  // Add question form state
  const [qText, setQText] = useState("");
  const [qExplanation, setQExplanation] = useState("");
  const [qOptions, setQOptions] = useState([
    { text: "", isCorrect: true },
    { text: "", isCorrect: false },
    { text: "", isCorrect: false },
    { text: "", isCorrect: false },
  ]);

  // Ingest form state
  const [sourceUrl, setSourceUrl] = useState("");

  async function handleAddQuestion() {
    if (!qText.trim() || qOptions.some((o) => !o.text.trim())) {
      toast.error("Fill all fields");
      return;
    }

    setAdding(true);
    const res = await fetch("/api/questions", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        certificationId: certification.id,
        text: qText,
        explanation: qExplanation || null,
        difficulty: "medium",
        options: qOptions,
      }),
    });

    if (res.ok) {
      toast.success("Question added");
      setAddOpen(false);
      setQText("");
      setQExplanation("");
      setQOptions([
        { text: "", isCorrect: true },
        { text: "", isCorrect: false },
        { text: "", isCorrect: false },
        { text: "", isCorrect: false },
      ]);
      router.refresh();
    }
    setAdding(false);
  }

  async function handleIngest() {
    if (!sourceUrl.trim()) return;
    setIngesting(true);

    const res = await fetch("/api/ingest", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        certificationId: certification.id,
        url: sourceUrl,
      }),
    });

    if (res.ok) {
      const data = await res.json();
      toast.success(`Generated ${data.generated ?? 0} draft question(s)`);
      setIngestOpen(false);
      setSourceUrl("");
      router.refresh();
    } else {
      toast.error("Ingestion failed — is a local LLM running?");
    }
    setIngesting(false);
  }

  const approved = questions.filter((q) => q.status === "approved");
  const drafts = questions.filter((q) => q.status === "draft");

  return (
    <div className="mx-auto max-w-4xl px-4 py-8">
      {/* Header */}
      <motion.div
        initial={{ opacity: 0, y: -10 }}
        animate={{ opacity: 1, y: 0 }}
        className="mb-6"
      >
        <Button
          variant="ghost"
          size="sm"
          onClick={() => router.push("/manage")}
          className="mb-3 -ml-2 gap-1"
        >
          <ArrowLeft className="h-4 w-4" /> Back
        </Button>

        <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
          <div>
            <h1 className="text-2xl font-extrabold tracking-tight">
              {certification.title}
            </h1>
            <p className="text-sm text-muted-foreground mt-1">
              {approved.length} approved · {drafts.length} draft ·{" "}
              {certification.passingScore}% to pass
              {certification.timeLimitMinutes
                ? ` · ${certification.timeLimitMinutes} min`
                : ""}
            </p>
          </div>

          <div className="flex gap-2 shrink-0">
            <Dialog open={ingestOpen} onOpenChange={setIngestOpen}>
              <DialogTrigger asChild>
                <Button variant="outline" size="sm" className="gap-1">
                  <Link2 className="h-4 w-4" />
                  Import URL
                </Button>
              </DialogTrigger>
              <DialogContent>
                <DialogHeader>
                  <DialogTitle>Import from URL</DialogTitle>
                </DialogHeader>
                <div className="space-y-3 pt-2">
                  <div>
                    <Label>Documentation URL</Label>
                    <Input
                      value={sourceUrl}
                      onChange={(e) => setSourceUrl(e.target.value)}
                      placeholder="https://docs.example.com/guide"
                    />
                  </div>
                  <p className="text-xs text-muted-foreground">
                    Requires a local LLM running (e.g. Ollama, LM Studio).
                    Content will be fetched, chunked, and used to generate MCQ
                    drafts.
                  </p>
                  <Button
                    onClick={handleIngest}
                    disabled={ingesting || !sourceUrl.trim()}
                    className="w-full"
                  >
                    {ingesting ? "Processing…" : "Generate Questions"}
                  </Button>
                </div>
              </DialogContent>
            </Dialog>

            <Dialog open={addOpen} onOpenChange={setAddOpen}>
              <DialogTrigger asChild>
                <Button size="sm" className="gap-1">
                  <Plus className="h-4 w-4" />
                  Add Question
                </Button>
              </DialogTrigger>
              <DialogContent className="max-w-lg max-h-[90vh] overflow-y-auto">
                <DialogHeader>
                  <DialogTitle>Add Question</DialogTitle>
                </DialogHeader>
                <div className="space-y-4 pt-2">
                  <div>
                    <Label>Question Text</Label>
                    <p className="mt-1 text-xs leading-5 text-muted-foreground">
                      Markdown is supported, including fenced code blocks and
                      short example sections.
                    </p>
                    <Textarea
                      value={qText}
                      onChange={(e) => setQText(e.target.value)}
                      placeholder={
                        "Explain what this code prints:\n```ts\nconst items = [1, 2, 3];\nconsole.log(items.at(-1));\n```"
                      }
                      className="mt-1 min-h-28"
                    />
                  </div>

                  {qOptions.map((opt, idx) => (
                    <div key={idx} className="flex items-start gap-2">
                      <span className="mt-3 font-mono text-sm w-6">
                        {String.fromCharCode(65 + idx)}.
                      </span>
                      <Textarea
                        value={opt.text}
                        onChange={(e) => {
                          const updated = [...qOptions];
                          updated[idx] = {
                            ...updated[idx],
                            text: e.target.value,
                          };
                          setQOptions(updated);
                        }}
                        placeholder={`Option ${String.fromCharCode(65 + idx)}${idx === 0 ? "\n\nExample:\n```ts\nitems.at(-1)\n```" : ""}`}
                        className="min-h-20 flex-1"
                      />
                      <Button
                        variant={opt.isCorrect ? "default" : "outline"}
                        size="sm"
                        className="mt-2 shrink-0 text-xs"
                        onClick={() => {
                          setQOptions(
                            qOptions.map((o, i) => ({
                              ...o,
                              isCorrect: i === idx,
                            })),
                          );
                        }}
                      >
                        {opt.isCorrect ? "✓ Correct" : "Mark"}
                      </Button>
                    </div>
                  ))}

                  <div>
                    <Label>Explanation (optional)</Label>
                    <p className="mt-1 text-xs leading-5 text-muted-foreground">
                      Use this for the reasoning and a small worked example when
                      that helps the learner.
                    </p>
                    <Textarea
                      value={qExplanation}
                      onChange={(e) => setQExplanation(e.target.value)}
                      placeholder={
                        "State why the correct answer is right, then add an Example section if useful.\n\nExample:\n`Array.prototype.at(-1)` returns the last item."
                      }
                      className="mt-1 min-h-28"
                    />
                  </div>

                  <Button
                    onClick={handleAddQuestion}
                    disabled={adding}
                    className="w-full"
                  >
                    {adding ? "Adding…" : "Add Question"}
                  </Button>
                </div>
              </DialogContent>
            </Dialog>
          </div>
        </div>
      </motion.div>

      {/* Question list */}
      {questions.length === 0 ? (
        <div className="text-center py-16 text-muted-foreground">
          <FileText className="h-16 w-16 mx-auto mb-4 opacity-40" />
          <p className="text-lg font-medium">No questions yet</p>
          <p className="text-sm mt-1">
            Add questions manually or import from documentation.
          </p>
        </div>
      ) : (
        <div className="space-y-3">
          {questions.map((q, i) => {
            const s = statusConfig[q.status] ?? statusConfig.draft;
            return (
              <motion.div
                key={q.id}
                initial={{ opacity: 0, y: 8 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: i * 0.03 }}
              >
                <Card>
                  <CardContent className="pt-4">
                    <div className="flex items-start justify-between gap-3 mb-2">
                      <div className="min-w-0 flex-1">
                        <RichContent
                          content={q.text}
                          compact
                          className="font-medium text-sm [&_p]:my-0"
                        />
                      </div>
                      <Badge
                        variant={s.variant}
                        className="gap-1 shrink-0 text-xs"
                      >
                        {s.icon}
                        {s.label}
                      </Badge>
                    </div>
                    <div className="space-y-2">
                      {q.options
                        .sort((a, b) => a.orderIndex - b.orderIndex)
                        .map((opt, idx) => (
                          <div
                            key={opt.id}
                            className={`text-xs px-2 py-1 rounded ${
                              opt.isCorrect
                                ? "bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-300"
                                : "bg-muted text-muted-foreground"
                            }`}
                          >
                            <span className="mb-1 block font-mono text-[11px] uppercase tracking-[0.2em] opacity-70">
                              {String.fromCharCode(65 + idx)}
                            </span>
                            <RichContent
                              content={opt.text}
                              compact
                              className="[&_p]:my-0"
                            />
                          </div>
                        ))}
                    </div>
                    {q.explanation && (
                      <div className="mt-3 rounded-xl bg-muted/50 px-3 py-3 text-sm">
                        <div className="mb-1 font-semibold text-foreground">
                          Explanation
                        </div>
                        <RichContent content={q.explanation} compact />
                      </div>
                    )}
                  </CardContent>
                </Card>
              </motion.div>
            );
          })}
        </div>
      )}
    </div>
  );
}
