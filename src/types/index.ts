export interface QuizConfig {
  certificationId: string;
  mode: "fixed" | "random";
  timed: boolean;
  questionCount?: number; // defaults to all approved questions
  timeLimitMinutes?: number;
}

export interface QuizQuestion {
  id: string;
  text: string;
  explanation: string | null;
  difficulty: "easy" | "medium" | "hard";
  options: QuizOption[];
}

export interface QuizOption {
  id: string;
  text: string;
  orderIndex: number;
}

export interface QuizAttempt {
  id: string;
  certificationId: string;
  certificationTitle: string;
  mode: "fixed" | "random";
  timed: boolean;
  timeLimitSeconds: number | null;
  questionCount: number;
  score: number | null;
  passed: boolean | null;
  startedAt: string;
  completedAt: string | null;
}

export interface QuizResult {
  attempt: QuizAttempt;
  answers: QuizAnswerResult[];
  totalCorrect: number;
  totalQuestions: number;
  percentage: number;
}

export interface QuizAnswerResult {
  questionId: string;
  questionText: string;
  explanation: string | null;
  selectedOptionId: string | null;
  correctOptionId: string;
  isCorrect: boolean;
  options: QuizOption[];
}

export interface CertificationCard {
  id: string;
  title: string;
  slug: string;
  description: string | null;
  icon: string | null;
  questionCount: number;
  passingScore: number;
  timeLimitMinutes: number | null;
  lastAttemptAt: string | null;
  bestScore: number | null;
}

export interface GeneratedMCQ {
  question: string;
  options: string[];
  correctIndex: number;
  explanation: string;
  difficulty: "easy" | "medium" | "hard";
  confidence: number; // 0-100
}

export interface LLMProviderConfig {
  baseUrl: string;
  model: string;
  apiKey: string;
}
