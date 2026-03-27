import { auth } from "@/lib/auth";
import { redirect } from "next/navigation";
import { getDraftQuestions } from "@/server/services/review-service";
import { getAllCertifications } from "@/server/services/certification-service";
import { ReviewClient } from "./review-client";

export default async function ReviewPage() {
  const session = await auth();
  if (!session?.user) redirect("/sign-in");

  const certifications = await getAllCertifications();
  const drafts = await getDraftQuestions();

  return (
    <ReviewClient
      certifications={certifications.map((c) => ({
        id: c.id,
        title: c.title,
        slug: c.slug,
      }))}
      initialDrafts={drafts}
    />
  );
}
