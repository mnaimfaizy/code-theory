"use client";

import Link from "next/link";
import { motion } from "framer-motion";
import {
  Card,
  CardContent,
  CardFooter,
  CardHeader,
} from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import {
  BookOpen,
  Clock,
  ChevronRight,
  Code2,
  Layers,
  FileCode,
  Award,
  Zap,
  type LucideIcon,
} from "lucide-react";
import type { CertificationCard as CertCardType } from "@/types";

const iconMap: Record<string, LucideIcon> = {
  Code2,
  Layers,
  FileCode,
  Award,
  Zap,
  BookOpen,
};

interface Props {
  cert: CertCardType;
  index: number;
}

export function CertificationCard({ cert, index }: Props) {
  const Icon = iconMap[cert.icon ?? ""] ?? BookOpen;

  return (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ delay: index * 0.08, duration: 0.4 }}
    >
      <Link href={`/certifications/${cert.slug}`} className="block group">
        <Card className="relative overflow-hidden border-border/60 bg-card/50 backdrop-blur-sm transition-all duration-300 hover:border-primary/40 hover:shadow-lg hover:shadow-primary/5 hover:-translate-y-1">
          {/* Decorative gradient corner */}
          <div className="absolute -right-8 -top-8 h-24 w-24 rounded-full bg-primary/5 transition-all duration-300 group-hover:bg-primary/10 group-hover:scale-150" />

          <CardHeader className="flex flex-row items-start gap-4 pb-3">
            <div className="flex h-12 w-12 shrink-0 items-center justify-center rounded-xl bg-primary/10 text-primary transition-colors group-hover:bg-primary group-hover:text-primary-foreground">
              <Icon className="h-6 w-6" />
            </div>
            <div className="min-w-0 flex-1">
              <h3 className="font-bold text-base leading-tight truncate">
                {cert.title}
              </h3>
              {cert.description && (
                <p className="mt-1 text-xs text-muted-foreground line-clamp-2">
                  {cert.description}
                </p>
              )}
            </div>
          </CardHeader>

          <CardContent className="pb-3">
            <div className="flex flex-wrap gap-2">
              <Badge variant="secondary" className="gap-1 text-xs">
                <BookOpen className="h-3 w-3" />
                {cert.questionCount} questions
              </Badge>
              {cert.timeLimitMinutes && (
                <Badge variant="secondary" className="gap-1 text-xs">
                  <Clock className="h-3 w-3" />
                  {cert.timeLimitMinutes} min
                </Badge>
              )}
              <Badge variant="outline" className="text-xs">
                Pass: {cert.passingScore}%
              </Badge>
            </div>

            {cert.bestScore !== null && cert.bestScore !== undefined && (
              <div className="mt-3 flex items-center gap-2 text-xs">
                <div className="flex-1 h-1.5 rounded-full bg-muted overflow-hidden">
                  <motion.div
                    className={`h-full rounded-full ${
                      cert.bestScore >= cert.passingScore
                        ? "bg-green-500"
                        : "bg-orange-500"
                    }`}
                    initial={{ width: 0 }}
                    animate={{ width: `${cert.bestScore}%` }}
                    transition={{ delay: index * 0.08 + 0.3, duration: 0.6 }}
                  />
                </div>
                <span className="font-semibold text-foreground">
                  {cert.bestScore}%
                </span>
              </div>
            )}
          </CardContent>

          <CardFooter className="pt-0">
            <Button
              variant="ghost"
              size="sm"
              className="ml-auto gap-1 text-xs text-muted-foreground group-hover:text-primary"
            >
              Start Quiz
              <ChevronRight className="h-3 w-3 transition-transform group-hover:translate-x-0.5" />
            </Button>
          </CardFooter>
        </Card>
      </Link>
    </motion.div>
  );
}
