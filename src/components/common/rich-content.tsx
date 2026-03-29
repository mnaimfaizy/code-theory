"use client";

import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";
import { Prism as SyntaxHighlighter } from "react-syntax-highlighter";
import { vscDarkPlus } from "react-syntax-highlighter/dist/esm/styles/prism";
import { cn } from "@/lib/utils";

interface RichContentProps {
  content: string | null | undefined;
  className?: string;
  compact?: boolean;
}

const baseClassName =
  "max-w-none text-sm leading-7 text-foreground [&>*:first-child]:mt-0 [&>*:last-child]:mb-0 [&_a]:font-medium [&_a]:text-primary [&_a]:underline [&_a]:underline-offset-4 [&_blockquote]:my-4 [&_blockquote]:rounded-2xl [&_blockquote]:border-l-4 [&_blockquote]:border-primary/40 [&_blockquote]:bg-primary/5 [&_blockquote]:px-4 [&_blockquote]:py-3 [&_code]:font-mono [&_h1]:mt-7 [&_h1]:text-2xl [&_h1]:font-semibold [&_h2]:mt-6 [&_h2]:text-xl [&_h2]:font-semibold [&_h3]:mt-5 [&_h3]:text-lg [&_h3]:font-semibold [&_hr]:my-5 [&_hr]:border-border [&_li]:marker:text-primary/60 [&_ol]:my-3 [&_ol]:space-y-1 [&_ol]:pl-5 [&_p]:my-3 [&_pre]:my-0 [&_strong]:font-semibold [&_table]:my-4 [&_table]:w-full [&_table]:overflow-hidden [&_table]:rounded-xl [&_table]:border [&_table]:border-border/70 [&_tbody_tr]:border-t [&_tbody_tr]:border-border/60 [&_td]:px-3 [&_td]:py-2 [&_th]:bg-muted/70 [&_th]:px-3 [&_th]:py-2 [&_th]:text-left [&_th]:font-semibold [&_ul]:my-3 [&_ul]:list-disc [&_ul]:space-y-1 [&_ul]:pl-5";

const compactClassName =
  "text-[0.95rem] leading-6 [&_blockquote]:my-3 [&_h1]:text-xl [&_h2]:text-lg [&_h3]:text-base [&_ol]:my-2 [&_p]:my-2 [&_table]:my-3 [&_ul]:my-2";

function getLanguageLabel(language: string) {
  const normalized = language.toLowerCase();

  if (normalized === "tsx" || normalized === "jsx") return "React";
  if (normalized === "ts") return "TypeScript";
  if (normalized === "js") return "JavaScript";
  if (normalized === "sh" || normalized === "bash" || normalized === "shell") {
    return "Shell";
  }
  if (normalized === "md" || normalized === "markdown") return "Markdown";
  if (normalized === "yml") return "YAML";
  if (normalized === "plaintext" || normalized === "text") return "Text";

  return normalized.toUpperCase();
}

export function RichContent({ content, className, compact }: RichContentProps) {
  if (!content?.trim()) {
    return null;
  }

  return (
    <div className={cn(baseClassName, compact && compactClassName, className)}>
      <ReactMarkdown
        remarkPlugins={[remarkGfm]}
        components={{
          pre: ({ children }) => <>{children}</>,
          code: ({ className: codeClassName, children, ...props }) => {
            const raw = String(children).replace(/\n$/, "");
            const languageMatch = /language-([\w-]+)/.exec(codeClassName ?? "");
            const isBlock = Boolean(languageMatch) || raw.includes("\n");

            if (!isBlock) {
              return (
                <code
                  className="rounded-md border border-border/70 bg-muted px-1.5 py-0.5 text-[0.92em] text-foreground"
                  {...props}
                >
                  {children}
                </code>
              );
            }

            const language = languageMatch?.[1] ?? "text";

            return (
              <div className="not-prose my-4 overflow-hidden rounded-2xl border border-slate-900/80 bg-[#1e1e1e] shadow-[0_22px_60px_-36px_rgba(15,23,42,0.9)]">
                <div className="flex items-center justify-between border-b border-white/8 bg-[#181818] px-4 py-2">
                  <div className="flex items-center gap-1.5">
                    <span className="h-2.5 w-2.5 rounded-full bg-[#ff5f56]" />
                    <span className="h-2.5 w-2.5 rounded-full bg-[#ffbd2e]" />
                    <span className="h-2.5 w-2.5 rounded-full bg-[#27c93f]" />
                  </div>
                  <span className="text-[11px] font-medium uppercase tracking-[0.28em] text-slate-400">
                    {getLanguageLabel(language)}
                  </span>
                </div>
                <SyntaxHighlighter
                  language={language}
                  style={vscDarkPlus}
                  PreTag="div"
                  showLineNumbers={raw.includes("\n")}
                  wrapLongLines
                  customStyle={{
                    margin: 0,
                    padding: "1rem 1.25rem",
                    background: "transparent",
                    fontSize: "0.9rem",
                    lineHeight: "1.7",
                  }}
                  lineNumberStyle={{
                    minWidth: "2.5rem",
                    paddingRight: "1rem",
                    color: "rgba(148, 163, 184, 0.7)",
                  }}
                  codeTagProps={{
                    style: {
                      fontFamily: "var(--font-geist-mono)",
                    },
                  }}
                >
                  {raw}
                </SyntaxHighlighter>
              </div>
            );
          },
        }}
      >
        {content}
      </ReactMarkdown>
    </div>
  );
}
