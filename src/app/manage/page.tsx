import { redirect } from "next/navigation";
import { auth } from "@/lib/auth";
import { getAllCertifications } from "@/server/services/certification-service";
import { ManageClient } from "./manage-client";

export default async function ManagePage() {
  const session = await auth();
  if (!session?.user) redirect("/sign-in");

  const certifications = await getAllCertifications();

  return (
    <ManageClient certifications={certifications} userId={session.user.id!} />
  );
}
