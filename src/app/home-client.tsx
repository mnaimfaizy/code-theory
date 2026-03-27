"use client";

import { motion } from "framer-motion";
import { CertificationCard } from "@/components/quiz/certification-card";
import { Button } from "@/components/ui/button";
import { Sparkles, Plus, BookOpen } from "lucide-react";
import Link from "next/link";
import type { CertificationCard as CertCardType } from "@/types";

interface Props {
  certifications: CertCardType[];
}

export function HomeClient({ certifications }: Props) {
  return (
    <div className="mx-auto max-w-6xl px-4 py-8">
      {/* Hero section */}
      <motion.div
        initial={{ opacity: 0, y: -10 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.5 }}
        className="mb-10"
      >
        <div className="flex items-center gap-2 mb-2">
          <Sparkles className="h-5 w-5 text-primary" />
          <span className="text-sm font-medium text-primary tracking-wide uppercase">
            Code Theory
          </span>
        </div>
        <h1 className="text-3xl sm:text-4xl font-extrabold tracking-tight">
          Master Your
          <span className="block text-primary">Certifications</span>
        </h1>
        <p className="mt-3 text-muted-foreground max-w-lg">
          Choose a certification below to start practicing. Take timed or
          untimed quizzes, track your progress, and level up your skills.
        </p>
      </motion.div>

      {/* Certifications grid */}
      {certifications.length > 0 ? (
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {certifications.map((cert, i) => (
            <CertificationCard key={cert.id} cert={cert} index={i} />
          ))}
        </div>
      ) : (
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: 0.2 }}
          className="flex flex-col items-center justify-center rounded-2xl border-2 border-dashed border-border/60 bg-muted/30 px-6 py-16 text-center"
        >
          <BookOpen className="h-12 w-12 text-muted-foreground/50 mb-4" />
          <h2 className="text-lg font-semibold">No certifications yet</h2>
          <p className="mt-1 text-sm text-muted-foreground max-w-sm">
            Create your first certification to start building a question pool
            and taking quizzes.
          </p>
          <Link href="/manage">
            <Button className="mt-6 gap-2">
              <Plus className="h-4 w-4" />
              Create Certification
            </Button>
          </Link>
        </motion.div>
      )}

      {/* Quick stats footer */}
      {certifications.length > 0 && (
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: 0.4 }}
          className="mt-10 flex flex-wrap items-center justify-between gap-4 rounded-xl bg-muted/40 px-5 py-4"
        >
          <div className="flex gap-8">
            <div>
              <p className="text-2xl font-bold">{certifications.length}</p>
              <p className="text-xs text-muted-foreground">Certifications</p>
            </div>
            <div>
              <p className="text-2xl font-bold">
                {certifications.reduce((sum, c) => sum + c.questionCount, 0)}
              </p>
              <p className="text-xs text-muted-foreground">Total Questions</p>
            </div>
          </div>
          <Link href="/manage">
            <Button variant="outline" size="sm" className="gap-1.5">
              <Plus className="h-3.5 w-3.5" />
              New Certification
            </Button>
          </Link>
        </motion.div>
      )}
    </div>
  );
}
