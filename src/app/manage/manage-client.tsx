"use client";

import { useState } from "react";
import { motion } from "framer-motion";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog";
import { Plus, Settings, BookOpen, ChevronRight } from "lucide-react";
import Link from "next/link";
import { useRouter } from "next/navigation";

interface Certification {
  id: string;
  title: string;
  slug: string;
  description: string | null;
  icon: string | null;
  timeLimitMinutes: number | null;
  passingScore: number;
  questionCount: number;
}

interface Props {
  certifications: Certification[];
  userId: string;
}

export function ManageClient({ certifications, userId }: Props) {
  const router = useRouter();
  const [isCreating, setIsCreating] = useState(false);
  const [title, setTitle] = useState("");
  const [description, setDescription] = useState("");
  const [timeLimit, setTimeLimit] = useState("");
  const [passingScore, setPassingScore] = useState("70");
  const [creating, setCreating] = useState(false);

  async function handleCreate(e: React.FormEvent) {
    e.preventDefault();
    setCreating(true);

    const slug = title
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, "-")
      .replace(/^-|-$/g, "");

    const res = await fetch("/api/certifications", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        title,
        slug,
        description: description || undefined,
        timeLimitMinutes: timeLimit ? parseInt(timeLimit) : undefined,
        passingScore: parseInt(passingScore),
        createdBy: userId,
      }),
    });

    setCreating(false);
    if (res.ok) {
      setIsCreating(false);
      setTitle("");
      setDescription("");
      setTimeLimit("");
      setPassingScore("70");
      router.refresh();
    }
  }

  return (
    <div className="mx-auto max-w-4xl px-4 py-8">
      <motion.div
        initial={{ opacity: 0, y: -10 }}
        animate={{ opacity: 1, y: 0 }}
        className="flex items-center justify-between mb-8"
      >
        <div>
          <h1 className="text-2xl sm:text-3xl font-extrabold tracking-tight">
            Manage Certifications
          </h1>
          <p className="mt-1 text-muted-foreground">
            Create, edit, and manage your certification question pools.
          </p>
        </div>

        <Dialog open={isCreating} onOpenChange={setIsCreating}>
          <DialogTrigger asChild>
            <Button className="gap-2">
              <Plus className="h-4 w-4" />
              <span className="hidden sm:inline">New Certification</span>
              <span className="sm:hidden">New</span>
            </Button>
          </DialogTrigger>
          <DialogContent>
            <DialogHeader>
              <DialogTitle>Create Certification</DialogTitle>
            </DialogHeader>
            <form onSubmit={handleCreate} className="space-y-4 mt-2">
              <div className="space-y-2">
                <Label htmlFor="cert-title">Title</Label>
                <Input
                  id="cert-title"
                  placeholder="e.g. Junior React Developer"
                  value={title}
                  onChange={(e) => setTitle(e.target.value)}
                  required
                />
              </div>
              <div className="space-y-2">
                <Label htmlFor="cert-desc">Description</Label>
                <Textarea
                  id="cert-desc"
                  placeholder="What does this certification cover?"
                  value={description}
                  onChange={(e) => setDescription(e.target.value)}
                  rows={3}
                />
              </div>
              <div className="grid grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="cert-time">Time Limit (minutes)</Label>
                  <Input
                    id="cert-time"
                    type="number"
                    placeholder="e.g. 30"
                    value={timeLimit}
                    onChange={(e) => setTimeLimit(e.target.value)}
                    min={1}
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="cert-pass">Passing Score (%)</Label>
                  <Input
                    id="cert-pass"
                    type="number"
                    value={passingScore}
                    onChange={(e) => setPassingScore(e.target.value)}
                    min={1}
                    max={100}
                    required
                  />
                </div>
              </div>
              <Button type="submit" className="w-full" disabled={creating}>
                {creating ? "Creating..." : "Create Certification"}
              </Button>
            </form>
          </DialogContent>
        </Dialog>
      </motion.div>

      {/* Certifications list */}
      <div className="space-y-3">
        {certifications.map((cert, i) => (
          <motion.div
            key={cert.id}
            initial={{ opacity: 0, y: 10 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: i * 0.05 }}
          >
            <Link href={`/manage/${cert.slug}`}>
              <Card className="hover:border-primary/30 hover:shadow-sm transition-all cursor-pointer">
                <CardContent className="flex items-center justify-between py-4">
                  <div className="flex items-center gap-4">
                    <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-primary/10 text-primary shrink-0">
                      <BookOpen className="h-5 w-5" />
                    </div>
                    <div>
                      <h3 className="font-semibold">{cert.title}</h3>
                      <div className="flex gap-2 mt-1">
                        <Badge variant="secondary" className="text-xs">
                          {cert.questionCount} questions
                        </Badge>
                        <Badge variant="outline" className="text-xs">
                          Pass: {cert.passingScore}%
                        </Badge>
                      </div>
                    </div>
                  </div>
                  <ChevronRight className="h-5 w-5 text-muted-foreground" />
                </CardContent>
              </Card>
            </Link>
          </motion.div>
        ))}

        {certifications.length === 0 && (
          <div className="text-center py-12 text-muted-foreground">
            <Settings className="h-12 w-12 mx-auto mb-4 opacity-40" />
            <p>No certifications yet. Create one to get started.</p>
          </div>
        )}
      </div>
    </div>
  );
}
