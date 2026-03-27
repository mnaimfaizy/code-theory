"use client";

import { useState } from "react";
import { motion } from "framer-motion";
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
  const [questions, setQuestions] = useState(initialQuestions);
  const [addOpen, setAddOpen] = useState(false);
  const [ingestOpen, setIngestOpen] = useState(false);
  const [ingesting, setIngesting] = useState(false);
  const [adding, setAdding] = useState(false);

  // Add question form state
  const [qText, setQText] = useState("");
  const [qExplanation, setQExplanation] = useState("");
  const [qDifficulty, setQDifficulty] = useState("medium");
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
        difficulty: qDifficulty,
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
                    <Textarea
                      value={qText}
                      onChange={(e) => setQText(e.target.value)}
                      placeholder="What is...?"
                      className="mt-1"
                    />
                  </div>

                  {qOptions.map((opt, idx) => (
                    <div key={idx} className="flex items-center gap-2">
                      <span className="font-mono text-sm w-6">
                        {String.fromCharCode(65 + idx)}.
                      </span>
                      <Input
                        value={opt.text}
                        onChange={(e) => {
                          const updated = [...qOptions];
                          updated[idx] = {
                            ...updated[idx],
                            text: e.target.value,
                          };
                          setQOptions(updated);
                        }}
                        placeholder={`Option ${String.fromCharCode(65 + idx)}`}
                        className="flex-1"
                      />
                      <Button
                        variant={opt.isCorrect ? "default" : "outline"}
                        size="sm"
                        className="shrink-0 text-xs"
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
                    <Textarea
                      value={qExplanation}
                      onChange={(e) => setQExplanation(e.target.value)}
                      placeholder="Why is this the correct answer?"
                      className="mt-1"
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
                      <h3 className="font-medium text-sm">{q.text}</h3>
                      <Badge
                        variant={s.variant}
                        className="gap-1 shrink-0 text-xs"
                      >
                        {s.icon}
                        {s.label}
                      </Badge>
                    </div>
                    <div className="flex flex-wrap gap-2">
                      {q.options
                        .sort((a, b) => a.orderIndex - b.orderIndex)
                        .map((opt, idx) => (
                          <span
                            key={opt.id}
                            className={`text-xs px-2 py-1 rounded ${
                              opt.isCorrect
                                ? "bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-300"
                                : "bg-muted text-muted-foreground"
                            }`}
                          >
                            {String.fromCharCode(65 + idx)}. {opt.text}
                          </span>
                        ))}
                    </div>
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
