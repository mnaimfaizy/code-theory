import { auth } from "@/lib/auth";
import { redirect, notFound } from "next/navigation";
import {
  getCertificationBySlug,
  getQuestionsByCertification,
} from "@/server/services/certification-service";
import { ManageDetailClient } from "./manage-detail-client";

export default async function ManageDetailPage({
  params,
}: {
  params: Promise<{ slug: string }>;
}) {
  const session = await auth();
  if (!session?.user) redirect("/sign-in");

  const { slug } = await params;
  const cert = await getCertificationBySlug(slug);
  if (!cert) notFound();

  const questions = await getQuestionsByCertification(cert.id);

  return <ManageDetailClient certification={cert} questions={questions} />;
}
