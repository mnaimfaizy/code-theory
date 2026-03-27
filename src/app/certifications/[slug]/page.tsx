import {
  getCertificationBySlug,
  getQuestionsByCertification,
} from "@/server/services/certification-service";
import { db } from "@/db";
import { attempts } from "@/db/schema";
import { eq, desc, count } from "drizzle-orm";
import { notFound } from "next/navigation";
import { CertificationDetailClient } from "./detail-client";

interface Props {
  params: Promise<{ slug: string }>;
}

export default async function CertificationDetailPage({ params }: Props) {
  const { slug } = await params;
  const cert = await getCertificationBySlug(slug);
  if (!cert) notFound();

  const approvedQuestions = await getQuestionsByCertification(
    cert.id,
    "approved",
  );

  // Get attempt history
  const attemptHistory = await db
    .select()
    .from(attempts)
    .where(eq(attempts.certificationId, cert.id))
    .orderBy(desc(attempts.startedAt))
    .limit(10);

  return (
    <CertificationDetailClient
      certification={{
        id: cert.id,
        title: cert.title,
        slug: cert.slug,
        description: cert.description,
        icon: cert.icon,
        timeLimitMinutes: cert.timeLimitMinutes,
        passingScore: cert.passingScore,
      }}
      questionCount={approvedQuestions.length}
      attemptHistory={attemptHistory.map((a) => ({
        id: a.id,
        mode: a.mode as "fixed" | "random",
        timed: a.timed,
        score: a.score,
        passed: a.passed,
        startedAt: a.startedAt,
        completedAt: a.completedAt,
      }))}
    />
  );
}
