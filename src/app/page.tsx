import { getAllCertifications } from "@/server/services/certification-service";
import { db } from "@/db";
import { attempts } from "@/db/schema";
import { eq, desc } from "drizzle-orm";
import { connection } from "next/server";
import type { CertificationCard } from "@/types";
import { HomeClient } from "./home-client";

export default async function HomePage() {
  await connection();

  let certs: CertificationCard[] = [];

  try {
    const allCerts = await getAllCertifications();

    certs = await Promise.all(
      allCerts.map(async (cert) => {
        // Get best score for this certification (across all users — personal app)
        const bestAttempt = await db
          .select({ score: attempts.score })
          .from(attempts)
          .where(eq(attempts.certificationId, cert.id))
          .orderBy(desc(attempts.score))
          .limit(1);

        const lastAttempt = await db
          .select({ startedAt: attempts.startedAt })
          .from(attempts)
          .where(eq(attempts.certificationId, cert.id))
          .orderBy(desc(attempts.startedAt))
          .limit(1);

        return {
          id: cert.id,
          title: cert.title,
          slug: cert.slug,
          description: cert.description,
          icon: cert.icon,
          questionCount: cert.questionCount,
          passingScore: cert.passingScore,
          timeLimitMinutes: cert.timeLimitMinutes,
          bestScore: bestAttempt[0]?.score ?? null,
          lastAttemptAt: lastAttempt[0]?.startedAt ?? null,
        };
      }),
    );
  } catch {
    // Database not initialized yet — show empty state
  }

  return <HomeClient certifications={certs} />;
}
