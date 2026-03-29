const URL_PATTERN = /https?:\/\/[^\s|]+/g;

export function extractUrlsFromSourceRef(sourceRef: string): string[] {
  return Array.from(new Set(sourceRef.match(URL_PATTERN) ?? []));
}

export function normalizeStoredSourceRef(
  sourceType: "url" | "file",
  sourceRef: string,
): string {
  const trimmed = sourceRef.trim();

  if (!trimmed || sourceType !== "url") {
    return trimmed;
  }

  const urls = extractUrlsFromSourceRef(trimmed);

  if (urls.length === 0) {
    return trimmed;
  }

  if (urls.length === 1) {
    return urls[0];
  }

  return urls.join("\n");
}
