import { db } from "./index";
import { users, certifications, questions, questionOptions } from "./schema";
import { hash } from "bcryptjs";
import { v4 as uuid } from "uuid";

async function seed() {
  console.log("🌱 Seeding database...");

  // Create demo user
  const userId = uuid();
  const passwordHash = await hash("password123", 12);

  await db.insert(users).values({
    id: userId,
    name: "Admin",
    email: "admin@codetheory.local",
    passwordHash,
  });
  console.log("  ✓ Created demo user: admin@codetheory.local / password123");

  // Create sample certifications
  const certs = [
    {
      id: uuid(),
      title: "Junior React Developer",
      slug: "junior-react-developer",
      description:
        "Test your foundational React knowledge — components, props, state, JSX, and basic hooks.",
      icon: "Code2",
      timeLimitMinutes: 30,
      passingScore: 70,
    },
    {
      id: uuid(),
      title: "Mid-level React Developer",
      slug: "mid-level-react-developer",
      description:
        "Intermediate React concepts — context, reducers, custom hooks, performance optimization, and patterns.",
      icon: "Layers",
      timeLimitMinutes: 45,
      passingScore: 75,
    },
    {
      id: uuid(),
      title: "JavaScript Fundamentals",
      slug: "javascript-fundamentals",
      description:
        "Core JavaScript — types, closures, prototypes, async/await, and ES6+ features.",
      icon: "FileCode",
      timeLimitMinutes: 25,
      passingScore: 70,
    },
  ];

  for (const cert of certs) {
    await db.insert(certifications).values({
      ...cert,
      createdBy: userId,
      createdAt: new Date().toISOString(),
      updatedAt: new Date().toISOString(),
    });
  }
  console.log(`  ✓ Created ${certs.length} sample certifications`);

  // Add sample questions to "Junior React Developer"
  const reactCertId = certs[0].id;

  const sampleQuestions = [
    {
      text: "What is JSX in React?",
      explanation:
        "JSX is a syntax extension for JavaScript that allows you to write HTML-like code in your JavaScript files. It gets compiled to React.createElement() calls.",
      difficulty: "easy" as const,
      options: [
        { text: "A template engine for React", isCorrect: false },
        {
          text: "A syntax extension that allows writing HTML-like code in JavaScript",
          isCorrect: true,
        },
        { text: "A JavaScript testing framework", isCorrect: false },
        { text: "A CSS preprocessor for React", isCorrect: false },
      ],
    },
    {
      text: "What hook would you use to manage local component state?",
      explanation:
        "useState is the React hook for adding state variables to functional components. It returns a state value and a setter function.",
      difficulty: "easy" as const,
      options: [
        { text: "useEffect", isCorrect: false },
        { text: "useContext", isCorrect: false },
        { text: "useState", isCorrect: true },
        { text: "useReducer", isCorrect: false },
      ],
    },
    {
      text: "What is the virtual DOM in React?",
      explanation:
        "The virtual DOM is a lightweight JavaScript representation of the actual DOM. React uses it to batch and optimise updates, only applying the minimum changes needed to the real DOM.",
      difficulty: "easy" as const,
      options: [
        {
          text: "A copy of the real DOM stored in the browser's memory",
          isCorrect: false,
        },
        {
          text: "A lightweight JavaScript representation of the real DOM used for efficient updates",
          isCorrect: true,
        },
        { text: "A server-side rendering technique", isCorrect: false },
        {
          text: "A debugging tool built into React DevTools",
          isCorrect: false,
        },
      ],
    },
    {
      text: "In React, props are:",
      explanation:
        "Props (short for properties) are read-only inputs passed from parent to child components. They cannot be modified by the receiving component.",
      difficulty: "easy" as const,
      options: [
        { text: "Mutable data managed within a component", isCorrect: false },
        {
          text: "Read-only inputs passed from parent to child components",
          isCorrect: true,
        },
        {
          text: "Global variables accessible by all components",
          isCorrect: false,
        },
        { text: "CSS classes applied to components", isCorrect: false },
      ],
    },
    {
      text: "When does useEffect run by default (with no dependency array)?",
      explanation:
        "When useEffect is called without a dependency array, it runs after every render of the component — both the initial mount and every subsequent update.",
      difficulty: "medium" as const,
      options: [
        { text: "Only on the first render", isCorrect: false },
        { text: "Only when props change", isCorrect: false },
        { text: "After every render", isCorrect: true },
        { text: "Only on unmount", isCorrect: false },
      ],
    },
  ];

  for (const q of sampleQuestions) {
    const questionId = uuid();
    await db.insert(questions).values({
      id: questionId,
      certificationId: reactCertId,
      text: q.text,
      explanation: q.explanation,
      difficulty: q.difficulty,
      status: "approved",
      orderIndex: sampleQuestions.indexOf(q),
      createdAt: new Date().toISOString(),
      updatedAt: new Date().toISOString(),
    });

    for (let i = 0; i < q.options.length; i++) {
      await db.insert(questionOptions).values({
        id: uuid(),
        questionId,
        text: q.options[i].text,
        isCorrect: q.options[i].isCorrect,
        orderIndex: i,
      });
    }
  }
  console.log(
    `  ✓ Added ${sampleQuestions.length} sample questions to "Junior React Developer"`,
  );

  console.log("\n✅ Seed complete!");
}

seed().catch((err) => {
  console.error("Seed failed:", err);
  process.exit(1);
});
