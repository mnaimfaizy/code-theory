-- Table: questions
-- Generated: 2026-03-31T04:30:16.461Z
-- Source: SQLite → PostgreSQL

DROP TABLE IF EXISTS "questions" CASCADE;

CREATE TABLE IF NOT EXISTS "questions" (
  "id" TEXT NOT NULL PRIMARY KEY,
  "certification_id" TEXT NOT NULL,
  "text" TEXT NOT NULL,
  "explanation" TEXT,
  "difficulty" TEXT DEFAULT 'medium',
  "status" TEXT NOT NULL DEFAULT 'draft',
  "source_id" TEXT,
  "order_index" INTEGER NOT NULL DEFAULT 0,
  "created_at" TEXT NOT NULL,
  "updated_at" TEXT NOT NULL,
  FOREIGN KEY ("source_id") REFERENCES "question_sources" ("id"),
  FOREIGN KEY ("certification_id") REFERENCES "certifications" ("id") ON DELETE CASCADE
);


-- Data: 431 row(s)
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('69d1d3bf-5137-4911-a830-ff9723f5caf6', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is JSX in React?', 'JSX is a syntax extension for JavaScript that allows you to write HTML-like code in your JavaScript files. It gets compiled to React.createElement() calls.', 'easy', 'approved', NULL, 0, '2026-03-27T07:37:11.046Z', '2026-03-27T07:37:11.046Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8b730d13-fbba-4558-9a91-d6bd2a38a4cc', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What hook would you use to manage local component state?', 'useState is the React hook for adding state variables to functional components. It returns a state value and a setter function.', 'easy', 'approved', NULL, 1, '2026-03-27T07:37:11.048Z', '2026-03-27T07:37:11.048Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4e8dbbb4-0fce-4f16-b4c5-b9feb3b6ebbc', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is the virtual DOM in React?', 'The virtual DOM is a lightweight JavaScript representation of the actual DOM. React uses it to batch and optimise updates, only applying the minimum changes needed to the real DOM.', 'easy', 'approved', NULL, 2, '2026-03-27T07:37:11.049Z', '2026-03-27T07:37:11.049Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4a77019e-661e-40a4-9be0-cf63b4f9719e', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'In React, props are:', 'Props (short for properties) are read-only inputs passed from parent to child components. They cannot be modified by the receiving component.', 'easy', 'approved', NULL, 3, '2026-03-27T07:37:11.049Z', '2026-03-27T07:37:11.049Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('fefb3d71-f092-4fb8-ac62-e4ac670db048', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'When does useEffect run by default (with no dependency array)?', 'When useEffect is called without a dependency array, it runs after every render of the component — both the initial mount and every subsequent update.', 'medium', 'approved', NULL, 4, '2026-03-27T07:37:11.050Z', '2026-03-27T07:37:11.050Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0b6f70b4-8e47-4ac6-aa72-89c5cd661e9b', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'How many default exports can a single JavaScript module define?', 'A module may expose many named exports, but the language only allows one default export. Defining more than one default export is a syntax error.', 'easy', 'approved', '682e61d7-5c66-44b8-af9d-53a5bbc28713', 5, '2026-03-28T04:31:23.608Z', '2026-03-28T04:31:23.608Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f9234936-0a18-4ef9-948e-4ef4ea4efdf2', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What does the statement `export {}` do in a JavaScript module?', '`export {}` is just an empty export list. It does not create or export an empty object.', 'easy', 'approved', '682e61d7-5c66-44b8-af9d-53a5bbc28713', 6, '2026-03-28T04:31:23.611Z', '2026-03-28T04:31:23.611Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('368715d9-ce69-4c4b-a8e6-f8c722daebc0', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'If a module changes the value of a binding after exporting it, what do importers observe?', 'JavaScript modules use live bindings. Importers observe the current exported binding value, not a frozen snapshot from import time.', 'medium', 'approved', '682e61d7-5c66-44b8-af9d-53a5bbc28713', 7, '2026-03-28T04:31:23.613Z', '2026-03-28T04:31:23.613Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('819f5758-aa28-4092-a723-f4d14e6630f2', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which syntax correctly re-exports another module''s default export under the local export name `DefaultExport`?', 'The MDN reference calls out that `export DefaultExport from "bar.js";` is invalid. To re-export a default export under a named binding, you must rename `default` explicitly.', 'medium', 'approved', '682e61d7-5c66-44b8-af9d-53a5bbc28713', 8, '2026-03-28T04:31:23.616Z', '2026-03-28T04:31:23.616Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('51244547-c26f-408a-b711-a0155fdc46ff', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What does `export * from "./mod.js";` re-export from another module?', 'Wildcard re-export forwards all named exports from the target module, but it does not forward that module''s default export.', 'medium', 'approved', '682e61d7-5c66-44b8-af9d-53a5bbc28713', 9, '2026-03-28T04:31:23.618Z', '2026-03-28T04:31:23.618Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('39d8453f-172d-446a-92a7-7830661d4516', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Is `export { x }; const x = 1;` valid JavaScript module syntax?', 'Yes. Export declarations are declarations, not reads of the value, so they are not blocked by the temporal dead zone in this case.', 'medium', 'approved', '682e61d7-5c66-44b8-af9d-53a5bbc28713', 10, '2026-03-28T04:31:23.619Z', '2026-03-28T04:31:23.619Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e5503df5-23b1-40e0-a9d9-6b531d1f81c3', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What must an HTML page do so a browser treats a script that uses `export` as a module?', 'In browsers, module scripts must be declared explicitly with `type="module"` unless the file is imported by another module.', 'easy', 'approved', '682e61d7-5c66-44b8-af9d-53a5bbc28713', 11, '2026-03-28T04:31:23.620Z', '2026-03-28T04:31:23.620Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('68a5b0a6-c893-469f-b88c-9e8e1dad8871', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which statement about `using` declarations and `export` is correct?', 'The language does not allow `export using ...` or `export await using ...`. MDN also warns that exporting a separately declared `using` value is discouraged because it will already be disposed when importers receive it.', 'medium', 'approved', '682e61d7-5c66-44b8-af9d-53a5bbc28713', 12, '2026-03-28T04:31:23.621Z', '2026-03-28T04:31:23.621Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('6cf43e64-6402-4101-948b-bc1977fa427b', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'When importing a default export from another module, how must the importing file name it?', 'Named exports must be imported by their exported names unless aliased, but default exports can be given any local name by the importer.', 'easy', 'approved', '682e61d7-5c66-44b8-af9d-53a5bbc28713', 13, '2026-03-28T04:31:23.623Z', '2026-03-28T04:31:23.623Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f2dc71d7-0a4e-425f-a715-5c8144257390', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is true about `export { foo } from "./utils.js";` compared with importing `foo` first and then exporting it?', 'The `export from` form re-exports the binding without creating a local binding you can use inside the current module. That makes it useful for barrel modules.', 'medium', 'approved', '682e61d7-5c66-44b8-af9d-53a5bbc28713', 14, '2026-03-28T04:31:23.624Z', '2026-03-28T04:31:23.624Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9e9a7fb9-677d-4e73-bee7-578f848fe493', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is the main scope behavior of a variable declared with let inside a pair of curly braces?', 'A let variable is scoped to the nearest enclosing block, so a let declared inside a block is a different binding from one with the same name outside that block.', 'easy', 'approved', '932b1bc7-cbfd-4c66-8683-817cb5a18ec6', 15, '2026-03-28T05:00:15.905Z', '2026-03-28T05:00:15.905Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3dd5ede5-a92a-4724-86cb-e990bb2795db', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What happens if code tries to read a let variable before execution reaches its declaration within the same block?', 'The variable is in the temporal dead zone from the start of the block until its declaration is reached, so reading it throws a ReferenceError instead of returning undefined.', 'easy', 'approved', '932b1bc7-cbfd-4c66-8683-817cb5a18ec6', 16, '2026-03-28T05:00:15.907Z', '2026-03-28T05:00:15.907Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2edcbb39-c4b3-4d27-9b75-9f6940d9e509', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What does typeof i do in a block before let i = 10 is reached?', 'MDN explicitly notes that using typeof on a variable that is still in its temporal dead zone throws a ReferenceError. This differs from typeof on an undeclared variable.', 'medium', 'approved', '932b1bc7-cbfd-4c66-8683-817cb5a18ec6', 17, '2026-03-28T05:00:15.908Z', '2026-03-28T05:00:15.908Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4b439371-fdd2-4ab4-90a4-2dee9d44af6e', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'At the top level of a script, how does let differ from var with respect to the global object?', 'A top-level let declaration does not create a property on globalThis, while a top-level var declaration does in script mode.', 'medium', 'approved', '932b1bc7-cbfd-4c66-8683-817cb5a18ec6', 18, '2026-03-28T05:00:15.911Z', '2026-03-28T05:00:15.911Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('72a6f8dd-1fae-49ec-9afa-f24cc4e4f5c3', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Why can declaring let foo in two different switch cases still cause a SyntaxError?', 'A switch statement has one shared block unless each case is wrapped in its own braces, so repeating the same let name across cases can be a redeclaration in the same scope.', 'medium', 'approved', '932b1bc7-cbfd-4c66-8683-817cb5a18ec6', 19, '2026-03-28T05:00:15.912Z', '2026-03-28T05:00:15.912Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d56d43bf-8bd6-4f16-8a4a-a9b91b7e7181', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which declaration is invalid according to MDN''s let redeclaration rules?', 'A let declaration inside a function body cannot reuse the name of one of that function''s parameters, because that would be a redeclaration in the same scope.', 'medium', 'approved', '932b1bc7-cbfd-4c66-8683-817cb5a18ec6', 20, '2026-03-28T05:00:15.913Z', '2026-03-28T05:00:15.913Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4cfee532-13e1-4f7e-9019-cf7d9c28269d', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which statement about let and destructuring is correct?', 'The MDN article shows that the left side of a let declaration can be a destructuring binding pattern, allowing several variables to be extracted from an array or match result at once.', 'easy', 'approved', '932b1bc7-cbfd-4c66-8683-817cb5a18ec6', 21, '2026-03-28T05:00:15.914Z', '2026-03-28T05:00:15.914Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('88f8643f-6dd1-40a4-afc1-457f7d28c858', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Why is if (true) let a = 1; a syntax error?', 'let starts a declaration, not a statement, so a lone let declaration cannot be used where JavaScript expects a single statement as the entire body of an if without braces.', 'medium', 'approved', '932b1bc7-cbfd-4c66-8683-817cb5a18ec6', 22, '2026-03-28T05:00:15.915Z', '2026-03-28T05:00:15.915Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('771255ff-c8c2-4d86-a0bb-016c47653c3e', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'In the MDN example with var x = 1 outside a block and let x = 2 inside the block, what is logged after the block ends when logging x?', 'The inner let x is a separate block-scoped binding, so once the block ends, the outer x is still 1.', 'easy', 'approved', '932b1bc7-cbfd-4c66-8683-817cb5a18ec6', 23, '2026-03-28T05:00:15.917Z', '2026-03-28T05:00:15.917Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('272fc8ef-c2d5-413f-b3b5-29b1150a0733', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'According to MDN, in which three places can JavaScript spread syntax be used?', 'MDN states that spread syntax is accepted in a function argument list, an array literal, and an object literal. Those are the three distinct contexts with spread support.', 'easy', 'approved', '0dbe4cb8-9e8b-42b6-8e6a-eb31cb000573', 24, '2026-03-28T05:20:26.530Z', '2026-03-28T05:20:26.530Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f4f84b4e-dcc8-4226-9f02-47e9c5b73d14', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What kinds of values can be spread into an array literal or a function call argument list?', 'MDN explains that array literals and argument lists only accept iterable values such as arrays and strings. Plain objects are not spreadable there unless they implement the iterator protocol.', 'easy', 'approved', '0dbe4cb8-9e8b-42b6-8e6a-eb31cb000573', 25, '2026-03-28T05:20:26.531Z', '2026-03-28T05:20:26.531Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b4d2e387-2cac-444a-91e6-3d269c937632', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What happens when you run `const obj = { key1: "value1" }; const array = [...obj];`?', 'MDN gives this exact pattern as an example of an error. A plain object is not iterable by default, so spreading it into an array throws a TypeError.', 'easy', 'approved', '0dbe4cb8-9e8b-42b6-8e6a-eb31cb000573', 26, '2026-03-28T05:20:26.532Z', '2026-03-28T05:20:26.532Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('528bf0bc-d65f-42bf-b13d-93682b21768e', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is the result of spreading an array into an object literal like `const obj = { ...[1, 2, 3] };`?', 'MDN notes that object spread enumerates own properties. Array indices are enumerable own properties, so the resulting object gets numeric string keys mapped to the array values.', 'easy', 'approved', '0dbe4cb8-9e8b-42b6-8e6a-eb31cb000573', 27, '2026-03-28T05:20:26.533Z', '2026-03-28T05:20:26.533Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('405d865f-defd-481e-8de3-57a0f28545d4', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What kind of copy does spread syntax create when you write `const arr2 = [...arr];` or `const clonedObj = { ...obj1 };`?', 'MDN explicitly describes both array and object spread copies as shallow. Nested values still share references, so spread only copies one level deep.', 'medium', 'approved', '0dbe4cb8-9e8b-42b6-8e6a-eb31cb000573', 28, '2026-03-28T05:20:26.535Z', '2026-03-28T05:20:26.535Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('baec2aba-21cc-44fa-a88b-23d3994812ab', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'When multiple objects with the same property names are spread into one object, which value wins?', 'MDN says that when duplicate property names are encountered during object spread, the last assigned value overrides earlier ones.', 'medium', 'approved', '0dbe4cb8-9e8b-42b6-8e6a-eb31cb000573', 29, '2026-03-28T05:20:26.537Z', '2026-03-28T05:20:26.537Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('14e78f88-56c3-4bc2-b6b1-1e8a3bb0cd74', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Why does MDN recommend `...(isSummer ? ["watermelon"] : [])` when conditionally adding an item to an array literal?', 'Spreading an empty array adds nothing, so the array stays clean when the condition is false. Using a conditional expression that returns `undefined` instead would add an actual `undefined` element.', 'medium', 'approved', '0dbe4cb8-9e8b-42b6-8e6a-eb31cb000573', 30, '2026-03-28T05:20:26.538Z', '2026-03-28T05:20:26.538Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2d56f504-2714-4e26-b3ea-bd11bdf42645', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Why can `new Date(...dateFields)` work while `Date.apply(null, dateFields)` is not a direct replacement for calling a constructor with `new`?', 'MDN explains that `apply()` calls the target function instead of constructing it. That means constructor-specific behavior such as `new.target` is not preserved, while spread works directly with `new`.', 'medium', 'approved', '0dbe4cb8-9e8b-42b6-8e6a-eb31cb000573', 31, '2026-03-28T05:20:26.539Z', '2026-03-28T05:20:26.539Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ee36e16a-73a5-498d-b340-b3e0e5b445d6', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is one key difference between object spread and `Object.assign()` that MDN highlights?', 'MDN points out two important differences: `Object.assign()` can mutate an existing target object and it triggers setters on that target, while object spread creates a new object and does not trigger setters the same way.', 'medium', 'approved', '0dbe4cb8-9e8b-42b6-8e6a-eb31cb000573', 32, '2026-03-28T05:20:26.540Z', '2026-03-28T05:20:26.540Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f2b59176-089d-4c2c-a840-288371e3cac3', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What caution does MDN give about using spread syntax in function calls?', 'MDN warns that spreading a very large iterable into a function call can exceed the JavaScript engine''s argument length limit. That is a runtime constraint to keep in mind when replacing `apply()` or building dynamic calls.', 'easy', 'approved', '0dbe4cb8-9e8b-42b6-8e6a-eb31cb000573', 33, '2026-03-28T05:20:26.541Z', '2026-03-28T05:20:26.541Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('889cc361-14d4-4528-a805-85e619262a08', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'In the function declaration `function collect(first, ...rest) {}`, what does `rest` contain?', 'A rest parameter gathers only the remaining arguments that come after the named parameters before it, and it stores them in a real array.', 'easy', 'approved', '2ffcfb48-a80f-471b-89fe-c2bccee1411e', 34, '2026-03-28T05:36:01.542Z', '2026-03-28T05:36:01.542Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e828f64d-30a1-4192-aba4-6ba1b8c5cd81', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which statement about rest parameters is correct?', 'Rest parameters are true arrays, unlike `arguments`, so array instance methods such as `map`, `sort`, and `forEach` can be used on them directly.', 'easy', 'approved', '2ffcfb48-a80f-471b-89fe-c2bccee1411e', 35, '2026-03-28T05:36:01.545Z', '2026-03-28T05:36:01.545Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('78293f43-97c5-412a-aaad-15633c38d6d8', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which function declaration uses a rest parameter with valid syntax?', 'A function can have only one rest parameter, it must be the last parameter, it cannot have a trailing comma, and it cannot have a default value.', 'medium', 'approved', '2ffcfb48-a80f-471b-89fe-c2bccee1411e', 36, '2026-03-28T05:36:01.549Z', '2026-03-28T05:36:01.549Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('01bbd186-a108-4fcb-985b-502c3bf80291', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is the value of `c` after `const { c = 2 } = { c: null };`?', 'Destructuring defaults are only used when the value is missing or `undefined`. Because the property exists and is `null`, the default is not applied.', 'easy', 'approved', '2ffcfb48-a80f-471b-89fe-c2bccee1411e', 37, '2026-03-28T05:36:01.551Z', '2026-03-28T05:36:01.551Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('46bef6e8-d552-4f84-be1d-f989696c5d94', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which syntax correctly reassigns existing variables `a` and `b` from an object using destructuring?', 'Object destructuring without a declaration must be wrapped in parentheses. Otherwise JavaScript treats the left side like a block instead of an object pattern.', 'medium', 'approved', '2ffcfb48-a80f-471b-89fe-c2bccee1411e', 38, '2026-03-28T05:36:01.552Z', '2026-03-28T05:36:01.552Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e13dc059-6d51-4b8a-936e-f687018d5cbe', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which value can be used on the right side of array destructuring because it is iterable?', 'Array destructuring uses the iterable protocol, so iterables such as `Map` can be destructured. A plain object with numeric keys and a `length` property is not enough unless it is iterable.', 'medium', 'approved', '2ffcfb48-a80f-471b-89fe-c2bccee1411e', 39, '2026-03-28T05:36:01.555Z', '2026-03-28T05:36:01.555Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('681f7a8a-a810-4992-8e98-8719321f3e8a', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Why should arrow functions usually not be used as object methods?', 'Arrow functions do not create their own `this` binding. In a method position, they keep the surrounding `this` instead of the object, which often leads to incorrect behavior.', 'easy', 'approved', '2ffcfb48-a80f-471b-89fe-c2bccee1411e', 40, '2026-03-28T05:36:01.557Z', '2026-03-28T05:36:01.557Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3e08fc31-b714-4a84-b248-7af8885ce4fb', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'How do you write an arrow function that implicitly returns the object `{ foo: 1 }`?', 'If the token after the arrow is `{`, JavaScript parses it as a block body instead of an object literal. Wrapping the object literal in parentheses forces expression-body parsing.', 'easy', 'approved', '2ffcfb48-a80f-471b-89fe-c2bccee1411e', 41, '2026-03-28T05:36:01.558Z', '2026-03-28T05:36:01.558Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d01f875f-b19d-4717-8346-1108e5b927ad', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What happens if you call an arrow function with `new`?', 'Arrow functions cannot be used as constructors, so using `new` with one throws a `TypeError`.', 'easy', 'approved', '2ffcfb48-a80f-471b-89fe-c2bccee1411e', 42, '2026-03-28T05:36:01.560Z', '2026-03-28T05:36:01.560Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8b68cdf0-57a8-4c31-9751-eaee9875946c', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which array method returns a new array instead of mutating the original array?', '`concat()` creates and returns a new array. Methods like `push()`, `pop()`, and `splice()` change the original array.', 'easy', 'approved', '2ffcfb48-a80f-471b-89fe-c2bccee1411e', 43, '2026-03-28T05:36:01.562Z', '2026-03-28T05:36:01.562Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d3294186-3104-4ba0-a4c2-fe6ee25320f3', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What does `Array.prototype.push()` return?', '`push()` mutates the array by adding elements to the end, and its return value is the array''s new length.', 'easy', 'approved', '2ffcfb48-a80f-471b-89fe-c2bccee1411e', 44, '2026-03-28T05:36:01.564Z', '2026-03-28T05:36:01.564Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b067174e-9e2d-4572-a24e-5c596e5a4acf', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'If no array element satisfies the test function, what does `find()` return?', '`find()` returns the first matching element value. If nothing matches, it returns `undefined`.', 'easy', 'approved', '2ffcfb48-a80f-471b-89fe-c2bccee1411e', 45, '2026-03-28T05:36:01.565Z', '2026-03-28T05:36:01.565Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('553bfa84-7af1-4a3a-9d79-580ab1a0b18d', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which promise states are considered settled?', 'A promise is settled once it is no longer pending. That means it has either fulfilled successfully or rejected with a reason.', 'easy', 'approved', '2ffcfb48-a80f-471b-89fe-c2bccee1411e', 46, '2026-03-28T05:36:01.566Z', '2026-03-28T05:36:01.566Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1ae6e15a-9420-4165-a3d0-9f6a1c6e1891', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What happens to the promise returned by `then()` if the handler throws an error?', 'Each call to `then()` creates a new promise. If the handler throws, that new promise is rejected with the thrown error.', 'medium', 'approved', '2ffcfb48-a80f-471b-89fe-c2bccee1411e', 47, '2026-03-28T05:36:01.567Z', '2026-03-28T05:36:01.567Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c1d93bf1-c822-424d-8acb-fa2bf670b41d', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which static promise method should you use when you want to wait until every input promise has settled, even if some reject?', '`Promise.allSettled()` waits for all input promises to settle and reports each outcome, instead of rejecting early when one promise fails.', 'medium', 'approved', '2ffcfb48-a80f-471b-89fe-c2bccee1411e', 48, '2026-03-28T05:36:01.569Z', '2026-03-28T05:36:01.569Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0e0c6d7a-d0a5-4085-8021-7e075783e98c', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which API should you use instead of createRoot when the page already contains HTML generated by React on the server or during the build?', 'Server-rendered or statically generated React HTML should be attached with hydrateRoot so React can reuse the existing DOM instead of destroying and recreating it.', 'easy', 'approved', 'ddd2571b-e567-45f9-a725-b966dade095b', 49, '2026-03-28T06:31:35.353Z', '2026-03-28T06:31:35.353Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2b97e975-e097-4ca1-b03e-e57a2f55b648', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What does createRoot(domNode) return?', 'createRoot does not return a DOM node or JSX. It returns a root controller object that exposes render and unmount.', 'easy', 'approved', 'ddd2571b-e567-45f9-a725-b966dade095b', 50, '2026-03-28T06:31:35.357Z', '2026-03-28T06:31:35.357Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c2cbed98-e81c-4357-8630-1431ab6378d3', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'On a page that is only partially built with React, how many separate roots can you create?', 'React supports multiple roots when only parts of a page are managed by React. Each top-level React island can have its own root.', 'easy', 'approved', 'ddd2571b-e567-45f9-a725-b966dade095b', 51, '2026-03-28T06:31:35.362Z', '2026-03-28T06:31:35.362Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e63b963d-a602-41d8-a41e-f0d47b9977b9', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What happens if you call root.render again after calling root.unmount on that same root?', 'Once a root is unmounted, that specific root instance cannot render again. You must create a new root for the same DOM node if you want to mount React there again.', 'medium', 'approved', 'ddd2571b-e567-45f9-a725-b966dade095b', 52, '2026-03-28T06:31:35.365Z', '2026-03-28T06:31:35.365Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('dfd6389d-80be-49c6-aa0e-591a9487bff3', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'When adding React to just part of an existing page, what is the recommended first step?', 'Before mounting components into an existing page, React recommends setting up a modular JavaScript environment so you can use imports, packages, and usually JSX.', 'easy', 'approved', 'ddd2571b-e567-45f9-a725-b966dade095b', 53, '2026-03-28T06:31:35.367Z', '2026-03-28T06:31:35.367Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1494807e-6b3a-4cc8-9a56-5bdd81e87f52', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'How do you mount a React component into a specific place in existing HTML without replacing the whole page?', 'You add a unique id to the existing HTML element, find it with document.getElementById, and pass that DOM node to createRoot.', 'easy', 'approved', 'ddd2571b-e567-45f9-a725-b966dade095b', 54, '2026-03-28T06:31:35.369Z', '2026-03-28T06:31:35.369Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1b0c221e-834a-469c-97b6-b1982da430ed', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'If you want an entire subroute of an existing website to be handled with React, what setup does the React documentation recommend?', 'For a whole subroute, the docs recommend treating that section like its own React app: build it with a React-based framework, set the framework base path, and route that subpath to the React app.', 'medium', 'approved', 'ddd2571b-e567-45f9-a725-b966dade095b', 55, '2026-03-28T06:31:35.370Z', '2026-03-28T06:31:35.370Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3fd08cf6-19a5-45c6-98e0-059b9e7295e0', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is createElement mainly used for in React?', 'createElement is the low-level API React exposes as an alternative to JSX. It is useful when you do not want to use JSX or cannot use it in the project.', 'easy', 'approved', 'ddd2571b-e567-45f9-a725-b966dade095b', 56, '2026-03-28T06:31:35.372Z', '2026-03-28T06:31:35.372Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a53eeb78-4d56-4de4-b572-11ab5c088675', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which value is valid for the first argument to createElement?', 'The type argument can be either a built-in tag name like ''div'' or a React component such as a function or class component.', 'easy', 'approved', 'ddd2571b-e567-45f9-a725-b966dade095b', 57, '2026-03-28T06:31:35.374Z', '2026-03-28T06:31:35.374Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e2e750f7-2126-4352-8e1c-e6b6da4f48a0', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Where do key and ref end up on the value returned by createElement?', 'key and ref are treated specially by React. They are not exposed inside element.props; they are stored directly on the returned element object.', 'medium', 'approved', 'ddd2571b-e567-45f9-a725-b966dade095b', 58, '2026-03-28T06:31:35.376Z', '2026-03-28T06:31:35.376Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d42febe4-3c97-4a95-9668-54f395099a9b', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'How should you pass children to createElement when the children come from a dynamic list?', 'Dynamic children should be passed as a single array argument so React can warn about missing keys for list items.', 'medium', 'approved', 'ddd2571b-e567-45f9-a725-b966dade095b', 59, '2026-03-28T06:31:35.377Z', '2026-03-28T06:31:35.377Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7925a9a0-153e-47c0-8650-7dfad1d3036a', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'After createElement returns a React element, how should you treat that element and its props?', 'React elements are intended to be immutable descriptions of UI. Mutating them after creation is unsupported, and React shallow-freezes them in development to enforce this.', 'medium', 'approved', 'ddd2571b-e567-45f9-a725-b966dade095b', 60, '2026-03-28T06:31:35.378Z', '2026-03-28T06:31:35.378Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7fdf6aa2-1035-4d42-bd85-df1e65fe9cdf', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is JSX in the context of React?', 'JSX is a syntax extension for JavaScript that allows you to write HTML-like markup inside a JavaScript file. It is not itself a JavaScript library — that role belongs to React.', 'easy', 'approved', 'dad01354-4a59-49bf-b001-1359e08b9438', 61, '2026-03-29T07:32:21.860Z', '2026-03-29T07:32:21.860Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('049a4723-eaa3-460a-b738-288f24ae391a', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which statement correctly describes the relationship between JSX and React?', 'JSX and React are two separate things. JSX is a syntax extension while React is a JavaScript library. They are often used together but can be used independently of each other.', 'easy', 'approved', 'dad01354-4a59-49bf-b001-1359e08b9438', 62, '2026-03-29T07:32:21.863Z', '2026-03-29T07:32:21.863Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8e09f052-c202-49b4-a74c-a6e2286d09ac', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Why does React keep rendering logic and markup together in the same component file?', 'As the web became more interactive, JavaScript logic increasingly determined the content shown. Keeping logic and markup together in components ensures they stay in sync with each other on every edit.', 'medium', 'approved', 'dad01354-4a59-49bf-b001-1359e08b9438', 63, '2026-03-29T07:32:21.865Z', '2026-03-29T07:32:21.865Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f52eaeac-d778-49c5-a3f5-368477f17349', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What does the first rule of JSX require when returning multiple elements from a component?', 'JSX requires that multiple elements be wrapped in a single root element. You can use a `<div>` or an empty Fragment `<>...</>` to satisfy this constraint.', 'easy', 'approved', 'dad01354-4a59-49bf-b001-1359e08b9438', 64, '2026-03-29T07:32:21.867Z', '2026-03-29T07:32:21.867Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b85a1c94-4f0a-4199-93b0-b730201aceb8', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is a React Fragment and what advantage does it offer over wrapping elements in a `<div>`?', 'A Fragment written as `<>...</>` groups multiple elements without adding any extra node to the browser''s DOM tree, keeping the rendered HTML clean.', 'medium', 'approved', 'dad01354-4a59-49bf-b001-1359e08b9438', 65, '2026-03-29T07:32:21.869Z', '2026-03-29T07:32:21.869Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4d78a142-9103-4a84-9797-68de2dbbb076', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What does the second rule of JSX require for self-closing HTML tags like `<img>` and `<br>`?', 'JSX requires all tags to be explicitly closed. Self-closing tags that are valid in HTML (like `<img>`) must be written as `<img />` in JSX.', 'easy', 'approved', 'dad01354-4a59-49bf-b001-1359e08b9438', 66, '2026-03-29T07:32:21.870Z', '2026-03-29T07:32:21.870Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('cba56063-9434-4842-afd0-f149efdd04c7', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Why must the HTML attribute `class` be written as `className` in JSX?', 'JSX compiles to JavaScript, and attributes map to JavaScript object keys. `class` is a reserved word in JavaScript, so React uses `className` — the corresponding DOM property name — instead.', 'easy', 'approved', 'dad01354-4a59-49bf-b001-1359e08b9438', 67, '2026-03-29T07:32:21.873Z', '2026-03-29T07:32:21.873Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('30a9159f-95ee-4c32-9bfa-565aa8b32c78', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which of the following HTML attributes keeps its original dashed format in JSX rather than being camelCased?', 'For historical reasons, `aria-*` and `data-*` attributes are written with dashes in JSX, just as they are in HTML. Most other attributes (e.g., `strokeWidth`, `tabIndex`) follow camelCase.', 'medium', 'approved', 'dad01354-4a59-49bf-b001-1359e08b9438', 68, '2026-03-29T07:32:21.875Z', '2026-03-29T07:32:21.875Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('bcf80525-dd5c-45cb-9584-096f7e98756e', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is the camelCase equivalent of the HTML attribute `stroke-width` in JSX?', 'JSX converts dashed attribute names to camelCase because the attributes map to JavaScript object keys. `stroke-width` becomes `strokeWidth`.', 'easy', 'approved', 'dad01354-4a59-49bf-b001-1359e08b9438', 69, '2026-03-29T07:32:21.876Z', '2026-03-29T07:32:21.876Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('5f5ba11a-8b5f-43f5-956c-045bdf8cffb2', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What happens when you copy valid HTML directly into a JSX `return` statement and the markup has multiple top-level elements?', 'JSX is stricter than HTML. Pasting HTML with multiple sibling root elements directly will fail because JSX requires a single root element. The fix is to wrap the elements in a `<div>` or a Fragment `<>`.', 'medium', 'approved', 'dad01354-4a59-49bf-b001-1359e08b9438', 70, '2026-03-29T07:32:21.877Z', '2026-03-29T07:32:21.877Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4b8c4f58-3f17-4be9-b736-69b7b4e3406b', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is the primary purpose of `<Fragment>` in React?', 'A `<Fragment>` groups elements so a component can return more than one element. It has no effect on the resulting DOM — no wrapper node is added. This is different from a `<div>` wrapper, which does create a DOM node and can affect layout and styles.', 'easy', 'approved', 'f1aa9b9c-66d7-4534-994c-b637fcb6bea6', 71, '2026-03-29T08:00:45.899Z', '2026-03-29T08:00:45.899Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('19e40034-75f6-418b-9e50-ee1941f55fa5', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which of the following is the shorthand syntax for `<Fragment></Fragment>`?', 'The empty JSX tag `<>...</>` is shorthand for `<Fragment></Fragment>` in most cases. It is the most common way to write a Fragment when no props are needed.

Example:

```jsx
function Post() {
  return (
    <>
      <PostTitle />
      <PostBody />
    </>
  );
}
```', 'easy', 'approved', 'f1aa9b9c-66d7-4534-994c-b637fcb6bea6', 72, '2026-03-29T08:00:45.906Z', '2026-03-29T08:00:45.906Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8b0d6ec6-9c88-498b-ad97-dd4b26df5c5f', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'You are rendering a list and each item needs a `key`. Which syntax must you use for the Fragment that wraps each item?', 'The `<>...</>` short syntax does not support props at all. When you need to pass `key` to a Fragment (e.g., when mapping a list), you must import `Fragment` from `''react''` and use the explicit `<Fragment key={…}>` form.

Example:

```jsx
import { Fragment } from ''react'';

function Blog() {
  return posts.map(post => (
    <Fragment key={post.id}>
      <PostTitle title={post.title} />
      <PostBody body={post.body} />
    </Fragment>
  ));
}
```', 'easy', 'approved', 'f1aa9b9c-66d7-4534-994c-b637fcb6bea6', 73, '2026-03-29T08:00:45.911Z', '2026-03-29T08:00:45.911Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8a208d8d-c5c6-46b8-95d7-7663e9c6bde9', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which prop can be passed to `<Fragment>` using the explicit syntax (not the short `<>` syntax)?', 'The only stable prop supported by `<Fragment>` is `key`. Attributes like `className`, `style`, or `id` cannot be passed to a Fragment because it does not produce a DOM node. The `ref` prop is available in Canary builds.', 'easy', 'approved', 'f1aa9b9c-66d7-4534-994c-b637fcb6bea6', 74, '2026-03-29T08:00:45.916Z', '2026-03-29T08:00:45.916Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7da70b09-c1ac-46b7-ba3c-69ed81b2503f', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What happens to the DOM when you wrap elements in a `<Fragment>`?', 'Fragment produces no actual DOM node. Inspecting the browser DevTools shows the Fragment''s children as plain siblings in the DOM without any wrapper element between them and their parent.', 'easy', 'approved', 'f1aa9b9c-66d7-4534-994c-b637fcb6bea6', 75, '2026-03-29T08:00:45.924Z', '2026-03-29T08:00:45.924Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ccbf54e6-963c-4059-9681-d8893ddbe713', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Consider this component:

```jsx
function CloseDialog() {
  const buttons = (
    <>
      <OKButton />
      <CancelButton />
    </>
  );
  return (
    <AlertDialog buttons={buttons}>
      Are you sure you want to leave this page?
    </AlertDialog>
  );
}
```

What is demonstrated here?', 'Like any other JSX element, a Fragment can be assigned to a variable and passed as a prop. This is useful when a component accepts a slot-like prop that may contain multiple elements without a wrapping DOM node.', 'medium', 'approved', 'f1aa9b9c-66d7-4534-994c-b637fcb6bea6', 76, '2026-03-29T08:00:45.927Z', '2026-03-29T08:00:45.927Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('58fe1e00-0369-4cfc-b62f-86cbb30a4653', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which statement about React''s state-preservation behavior with Fragments is correct?', 'React does not reset state when going from `<><Child /></>` to `<Child />` (or `[<Child />]`) and back — this equivalence is only guaranteed a single level deep. For example, going from `<><><Child /></></>` to `<Child />` does reset the state because the nesting depth changed.', 'medium', 'approved', 'f1aa9b9c-66d7-4534-994c-b637fcb6bea6', 77, '2026-03-29T08:00:45.930Z', '2026-03-29T08:00:45.930Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('417417e2-9f9c-4405-9231-9e59893e7b67', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which of the following is a valid use of `Fragment` to group text with JSX elements?', 'A Fragment can group plain text strings alongside JSX components. The short syntax `<>...</>` handles this cleanly without introducing a DOM wrapper like `<span>`, which would change the layout semantics.

Example from the docs:

```jsx
function DateRangePicker({ start, end }) {
  return (
    <>
      From
      <DatePicker date={start} />
      to
      <DatePicker date={end} />
    </>
  );
}
```', 'easy', 'approved', 'f1aa9b9c-66d7-4534-994c-b637fcb6bea6', 78, '2026-03-29T08:00:45.937Z', '2026-03-29T08:00:45.937Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('18e09d68-1ac1-44b4-b5e2-8563c4675bf5', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which import statement is required when you need to use `<Fragment key={…}>`?', 'The named export `Fragment` from the `''react''` package is the correct import. While `React.Fragment` also works in classic JSX transform setups, the docs recommend the named import. `react-dom` does not export `Fragment`, and it is not a global.', 'easy', 'approved', 'f1aa9b9c-66d7-4534-994c-b637fcb6bea6', 79, '2026-03-29T08:00:45.941Z', '2026-03-29T08:00:45.941Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b77f6f0b-30f3-4c1b-aaa3-8eb82f4b04c9', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'A colleague writes the following list render:

```jsx
function Blog() {
  return posts.map(post => (
    <>
      <PostTitle title={post.title} />
      <PostBody body={post.body} />
    </>
  ));
}
```

What problem does this code have?', 'When rendering a list, React requires each root element to have a unique `key` prop to track items efficiently. The `<>` short syntax does not support any props including `key`. The fix is to use the explicit `<Fragment key={post.id}>` form:

```jsx
import { Fragment } from ''react'';

function Blog() {
  return posts.map(post => (
    <Fragment key={post.id}>
      <PostTitle title={post.title} />
      <PostBody body={post.body} />
    </Fragment>
  ));
}
```', 'medium', 'approved', 'f1aa9b9c-66d7-4534-994c-b637fcb6bea6', 80, '2026-03-29T08:00:45.944Z', '2026-03-29T08:00:45.944Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a8b662be-009b-4c52-a16b-450df431162d', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'You have a variable `avatarUrl` holding an image URL. Which JSX attribute syntax correctly reads that variable rather than treating it as a literal string?', 'In JSX, wrapping a value in curly braces immediately after `=` (e.g. `src={avatarUrl}`) tells React to evaluate the expression as JavaScript and use its result. Writing `src="{avatarUrl}"` passes the literal string `"{avatarUrl}"` — the curly braces are treated as plain text inside the quotes.

Example:

```jsx
const avatarUrl = ''https://i.imgur.com/7vQD0fPs.jpg'';
return <img src={avatarUrl} alt="Avatar" />;
```', 'easy', 'approved', '1818ced2-f72f-45b5-ae26-749528c5d1cc', 81, '2026-03-29T09:03:41.889Z', '2026-03-29T09:03:41.889Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('6ee9c4cd-22a5-484d-acac-af86cdd040ff', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'In which two positions are curly braces valid inside JSX?', 'The React docs specify exactly two valid positions for curly braces in JSX:
1. **As text content inside a tag** — e.g. `<h1>{name}''s To Do List</h1>`.
2. **As an attribute value after `=`** — e.g. `src={avatar}`.

You cannot use curly braces as a tag name (`<{tag}>`) or as an attribute name.', 'easy', 'approved', '1818ced2-f72f-45b5-ae26-749528c5d1cc', 82, '2026-03-29T09:03:41.904Z', '2026-03-29T09:03:41.904Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3a18a883-91d0-420a-8e0d-906bc422061d', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What does the `{{` and `}}` syntax represent when used as an attribute value in JSX, for example `style={{ color: ''pink'' }}`?', '`{{` and `}}` in JSX is **not** special syntax. The outer `{ }` is the standard JSX "window into JavaScript", and the inner `{ }` is the JavaScript object literal. So `style={{ color: ''pink'' }}` is just the object `{ color: ''pink'' }` passed as the value of the `style` attribute.

Example:

```jsx
<ul style={{ backgroundColor: ''black'', color: ''pink'' }}>
  <li>Item</li>
</ul>
```', 'easy', 'approved', '1818ced2-f72f-45b5-ae26-749528c5d1cc', 83, '2026-03-29T09:03:41.907Z', '2026-03-29T09:03:41.907Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('770ea77c-d921-4d1c-b2fe-a9f4ef4d45c6', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'When writing inline styles in JSX, how should multi-word CSS properties like `background-color` be written?', 'JSX inline `style` properties are written in camelCase because the `style` attribute accepts a JavaScript object, and JavaScript identifiers cannot contain hyphens. The HTML attribute `background-color` becomes `backgroundColor` in JSX.

Example:

```jsx
// HTML: <ul style="background-color: black">
<ul style={{ backgroundColor: ''black'' }}>
```', 'easy', 'approved', '1818ced2-f72f-45b5-ae26-749528c5d1cc', 84, '2026-03-29T09:03:41.911Z', '2026-03-29T09:03:41.911Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2fc2bf97-4130-440a-9bb3-5f16f101c907', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which of the following expressions is valid inside JSX curly braces?', 'JSX curly braces accept any **JavaScript expression** — values that resolve to a result. That includes variables, function calls, ternaries, and arithmetic. Statements like `if`, `for`, and `while` are not expressions and cannot be placed directly inside JSX curly braces. Passing a plain object as a React child also throws the error "Objects are not valid as a React child".

Example:

```jsx
const today = new Date();
function formatDate(date) {
  return new Intl.DateTimeFormat(''en-US'', { weekday: ''long'' }).format(date);
}
export default function TodoList() {
  return <h1>To Do List for {formatDate(today)}</h1>;
}
```', 'medium', 'approved', '1818ced2-f72f-45b5-ae26-749528c5d1cc', 85, '2026-03-29T09:03:41.915Z', '2026-03-29T09:03:41.915Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b926802a-f626-4aff-82af-654dccb4bc0d', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which JavaScript array method is most commonly used in React to transform an array of data into an array of JSX elements?

```jsx
const listItems = people.map(person => <li>{person.name}</li>);
```', '`.map()` is the standard method for converting an array of data into an array of JSX elements in React. You call it on the source array and return a JSX node for each item.

Example:

```jsx
const listItems = people.map(person => (
  <li key={person.id}>{person.name}</li>
));
return <ul>{listItems}</ul>;
```', 'easy', 'approved', '5c3679c8-3c97-4ae1-8c59-c43cc9abf4f0', 86, '2026-03-29T09:09:03.567Z', '2026-03-29T09:09:03.567Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0b75feb3-e154-48fb-9d25-d8484cac282f', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What must every JSX element returned inside a `.map()` call have in order to avoid a React console warning?

```jsx
const listItems = people.map(person => (
  <li>{person.name}</li>  // ← something is missing here
));
```', 'Every JSX element that is a direct child of a `.map()` call must have a unique `key` prop. Without it, React displays the warning: *"Each child in a list should have a unique ''key'' prop."*

Example:

```jsx
const listItems = people.map(person => (
  <li key={person.id}>{person.name}</li>
));
```', 'easy', 'approved', '5c3679c8-3c97-4ae1-8c59-c43cc9abf4f0', 87, '2026-03-29T09:09:03.569Z', '2026-03-29T09:09:03.569Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('25718b3b-e9de-4cec-94d7-106b0b6fd74b', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is wrong with the following arrow function used inside `.map()`?

```jsx
const listItems = chemists.map(person => {
  <li>{person.name}</li>
});
```', 'When an arrow function uses a **block body** (curly braces `{}`), you must write an explicit `return` statement. Without `return`, the function returns `undefined` for every element.

Fixed version:

```jsx
const listItems = chemists.map(person => {
  return <li>{person.name}</li>;
});
```

Alternatively, use an implicit return by removing the curly braces:

```jsx
const listItems = chemists.map(person => (
  <li>{person.name}</li>
));
```', 'medium', 'approved', '5c3679c8-3c97-4ae1-8c59-c43cc9abf4f0', 88, '2026-03-29T09:09:03.594Z', '2026-03-29T09:09:03.594Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('76b21530-3cee-4da9-ac3c-588fad38f0ad', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Why does React require a `key` prop on each item when rendering a list?', 'The `key` prop lets React uniquely identify each item across renders. When the array changes — items are inserted, deleted, or reordered — React uses the keys to determine exactly what changed and applies minimal DOM updates instead of recreating the entire list.

Note: `key` is not accessible as a prop inside the component; it is used solely as a hint by React internally.', 'medium', 'approved', '5c3679c8-3c97-4ae1-8c59-c43cc9abf4f0', 89, '2026-03-29T09:09:03.599Z', '2026-03-29T09:09:03.599Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d0a327d8-8b5b-4264-b9a7-b52bb8a90906', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which of the following is explicitly warned against as a source of `key` values when rendering a list in React?', 'Using `key={Math.random()}` generates a new random key on every render. This means React can never match an item between renders, causing every component and DOM node in the list to be **recreated on every render**. This is slow and destroys user input inside list items.

Stable, recommended key sources:
- Database IDs (unique by nature)
- `crypto.randomUUID()` called **when creating** the item (not during render)
- A `uuid` library at item creation time', 'medium', 'approved', '5c3679c8-3c97-4ae1-8c59-c43cc9abf4f0', 90, '2026-03-29T09:09:03.602Z', '2026-03-29T09:09:03.602Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7be1519c-0ec7-48bd-947f-54202b5cf20d', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What should a React component return to render nothing at all?', 'A React component must always return something. To opt out of rendering entirely, return `null`. React treats `null` as an empty slot and renders nothing.

Example:

```jsx
function Item({ name, isPacked }) {
  if (isPacked) {
    return null;
  }
  return <li>{name}</li>;
}
```', 'easy', 'approved', '68d6828b-e6d8-4534-a644-cc01445a3cb8', 91, '2026-03-29T09:17:38.822Z', '2026-03-29T09:17:38.822Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f82c0bc2-17c1-4d21-a233-c0af40c89383', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which syntax correctly uses the ternary operator to conditionally render JSX inline?', 'The ternary operator `condition ? exprIfTrue : exprIfFalse` is the idiomatic way to render one of two JSX expressions inline. You read it as "if `isPacked` is true, render the first expression; otherwise render the second".

Example:

```jsx
return (
  <li className="item">
    {isPacked ? <del>{name + '' ✅''}</del> : name}
  </li>
);
```', 'easy', 'approved', '68d6828b-e6d8-4534-a644-cc01445a3cb8', 92, '2026-03-29T09:17:38.826Z', '2026-03-29T09:17:38.826Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e5ee5367-8a61-4843-9bec-79e7d0aad33c', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is a common pitfall when using the `&&` operator for conditional rendering in JSX?', 'JavaScript converts the left side of `&&` to a boolean, but if the left side evaluates to `0`, React renders the literal `0` (a falsy number) rather than nothing — because `0` is a valid renderable value.

Incorrect:
```jsx
{messageCount && <p>New messages</p>}
// Renders ''0'' when messageCount is 0
```

Correct:
```jsx
{messageCount > 0 && <p>New messages</p>}
```', 'medium', 'approved', '68d6828b-e6d8-4534-a644-cc01445a3cb8', 93, '2026-03-29T09:17:38.830Z', '2026-03-29T09:17:38.830Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('5b28a3d1-b3f1-4617-8283-52309a5ddbbd', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What does `{cond && <A />}` render when `cond` is `false`?', 'React treats `false`, `null`, and `undefined` as "holes" in the JSX tree and renders nothing in their place. When `cond` is `false`, the `&&` expression short-circuits and evaluates to `false`, so nothing is rendered.

Example:
```jsx
return (
  <li className="item">
    {name} {isPacked && ''✅''}
  </li>
);
// When isPacked is false, only name is rendered.
```', 'easy', 'approved', '68d6828b-e6d8-4534-a644-cc01445a3cb8', 94, '2026-03-29T09:17:38.834Z', '2026-03-29T09:17:38.834Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e2af2243-ce26-4e3e-9ede-503da082cd97', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which approach is the most flexible — though most verbose — for conditionally rendering JSX in React?', 'Assigning JSX to a `let` variable gives you the full power of `if` statements and enables arbitrary JSX — including whole subtrees — without the noise of nested ternaries in markup. The React docs describe it as the most verbose but most flexible style.

Example:
```jsx
function Item({ name, isPacked }) {
  let itemContent = name;
  if (isPacked) {
    itemContent = <del>{name + '' ✅''}</del>;
  }
  return <li className="item">{itemContent}</li>;
}
```', 'medium', 'approved', '68d6828b-e6d8-4534-a644-cc01445a3cb8', 95, '2026-03-29T09:17:38.839Z', '2026-03-29T09:17:38.839Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9afcebcb-c5e3-487d-a762-d04ac76a4f84', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which of the following correctly describes a React component?', 'A React component is a regular JavaScript function that returns JSX markup. React components must follow two rules: their names must start with a capital letter, and they must return JSX. They combine markup, CSS, and JavaScript into reusable UI elements.', 'easy', 'approved', '0e849fae-2c9f-4793-8da9-9fce38dda95b', 96, '2026-03-29T09:27:41.310Z', '2026-03-29T09:27:41.310Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2493865d-32c1-4ea4-850c-ac22c79d4f82', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is the purpose of the `export default` prefix when defining a React component?', '`export default` is standard JavaScript syntax (not React-specific) that marks the main function in a file so it can be imported from other files. It has nothing to do with how React renders the component or with JSX itself.', 'easy', 'approved', '0e849fae-2c9f-4793-8da9-9fce38dda95b', 97, '2026-03-29T09:27:41.313Z', '2026-03-29T09:27:41.313Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('890822ac-13f7-460e-a512-01aad6b8cf09', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'In JSX, how does React distinguish between an HTML tag and a React component?', 'React uses casing to tell HTML tags and components apart. A lowercase tag like `<section>` means a built-in HTML element. A capitalized tag like `<Profile />` means React should look for a JavaScript function or class with that name. This is why component names must start with a capital letter.', 'easy', 'approved', '0e849fae-2c9f-4793-8da9-9fce38dda95b', 98, '2026-03-29T09:27:41.316Z', '2026-03-29T09:27:41.316Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3de55a56-8120-4560-9e5e-77ec2e3b63c3', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What happens if a React component''s return statement spans multiple lines without parentheses?', 'JavaScript''s Automatic Semicolon Insertion (ASI) will insert a semicolon right after the `return` keyword when the next line does not continue the expression. This causes the function to return `undefined` and the markup below the `return` line is silently ignored. Wrapping multi-line JSX in parentheses prevents this pitfall.', 'medium', 'approved', '0e849fae-2c9f-4793-8da9-9fce38dda95b', 99, '2026-03-29T09:27:41.319Z', '2026-03-29T09:27:41.319Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('07827e07-151f-48b6-bca7-baee116bb678', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Why should you never define a React component inside another component''s function body?', 'Defining a component inside another component causes it to be re-created on every render of the parent. React sees each re-creation as a new, different component, which forces it to unmount and remount the child, destroying its state and causing bugs. Components should always be declared at the top level of the module.', 'medium', 'approved', '0e849fae-2c9f-4793-8da9-9fce38dda95b', 100, '2026-03-29T09:27:41.322Z', '2026-03-29T09:27:41.322Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d4530aeb-c425-47db-9e8b-a2c1d3a65da5', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'How many default exports can a single JavaScript file have?', 'A file can only have **one** default export, but it can have as many named exports as needed. This is a constraint of the ES Modules specification.', 'easy', 'approved', 'f7c38c45-1dfc-4f14-8a01-ec5bfff6c5d6', 101, '2026-03-29T09:37:13.082Z', '2026-03-29T09:37:13.082Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f4e1daf9-7755-4767-9cbe-2088538a21f0', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which syntax correctly imports a **named** export called `Profile` from `Gallery.js`?', 'Named exports must be imported with curly braces: `import { Profile } from ''./Gallery.js''`. Without curly braces, the import would try to resolve a default export.', 'easy', 'approved', 'f7c38c45-1dfc-4f14-8a01-ec5bfff6c5d6', 102, '2026-03-29T09:37:13.085Z', '2026-03-29T09:37:13.085Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('fcfde31e-6746-4e77-88e3-cc280f1dcac4', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What are the three steps to move a React component into its own file?', 'The official React docs describe three steps: (1) create a new JS file, (2) export the component from that file using a default or named export, and (3) import it in the file where it will be used.', 'medium', 'approved', 'f7c38c45-1dfc-4f14-8a01-ec5bfff6c5d6', 103, '2026-03-29T09:37:13.090Z', '2026-03-29T09:37:13.090Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('59d9fd97-c9ea-484e-92af-bb56946385f3', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'A file already has a default export for `Gallery`. You also want to export `Profile` from the same file without creating a new file. What is the correct approach?', 'Because a file can only have one default export, `Profile` must be exported as a **named** export using `export function Profile() {}`. It is then imported with curly braces: `import { Profile } from ''./Gallery.js''`.', 'medium', 'approved', 'f7c38c45-1dfc-4f14-8a01-ec5bfff6c5d6', 104, '2026-03-29T09:37:13.093Z', '2026-03-29T09:37:13.093Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('52c0d359-c32d-4e21-a515-1d92a3f189e6', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'In a Next.js project using file-based routing, what is true about the root component file?', 'With file-based routing (as used in Next.js), there is no single root component file shared across the whole app. Instead, each page file acts as its own root component, unlike a plain React setup where `App.js` is the common root.', 'easy', 'approved', 'f7c38c45-1dfc-4f14-8a01-ec5bfff6c5d6', 105, '2026-03-29T09:37:13.098Z', '2026-03-29T09:37:13.098Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('79768ac1-37c6-4d81-9b50-795291410899', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is the correct destructuring syntax for reading `person` and `size` props inside a React component?', 'Props are passed to a React component as a single object argument. Destructuring that object using `{ person, size }` directly in the function signature is the idiomatic way to read props. The curly braces inside the parentheses perform object destructuring, not array destructuring or positional arguments.

Example:

```jsx
function Avatar({ person, size }) {
  return <img src={person.imageUrl} width={size} />;
}
```', 'easy', 'approved', '1ef7aa0a-f6c9-4822-940a-cc23b82a526e', 106, '2026-03-29T09:45:23.508Z', '2026-03-29T09:45:23.508Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('5dc65235-8e57-4d66-9104-a0570ffa853b', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Given the following component signature, when is the default value of `100` applied to `size`?

```jsx
function Avatar({ person, size = 100 }) { ... }
```', 'A default value in destructuring is only applied when the prop is `undefined` — either because it was not passed at all, or was explicitly passed as `undefined`. Passing `null` or `0` does **not** trigger the default value, because those are defined (non-`undefined`) values.

Example:
```jsx
<Avatar person={p} />            // size = 100 (missing → default)
<Avatar person={p} size={undefined} /> // size = 100 (undefined → default)
<Avatar person={p} size={null} /> // size = null (NOT the default)
<Avatar person={p} size={0} />   // size = 0  (NOT the default)
```', 'easy', 'approved', '1ef7aa0a-f6c9-4822-940a-cc23b82a526e', 107, '2026-03-29T09:45:23.516Z', '2026-03-29T09:45:23.516Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('68ede40a-61a0-4ac4-a87d-1e3f5b100a80', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which syntax correctly forwards all props from a `Profile` component to its child `Avatar` component without listing each prop individually?', 'The JSX spread syntax `{...props}` forwards every property of the `props` object as individual props to the child component. This is useful when a component acts as a pass-through wrapper and does not use the props itself.

Example:
```jsx
function Profile(props) {
  return (
    <div className="card">
      <Avatar {...props} />
    </div>
  );
}
```
Use this with restraint — overusing it often signals that components should be refactored.', 'easy', 'approved', '1ef7aa0a-f6c9-4822-940a-cc23b82a526e', 108, '2026-03-29T09:45:23.518Z', '2026-03-29T09:45:23.518Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f5dd39a4-936d-4462-85c5-23b5bf5a822d', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'When you write `<Card><Avatar /></Card>`, how does the `Card` component access the nested `<Avatar />` JSX?', 'When JSX is nested inside a component''s opening and closing tags, React automatically passes that nested content to the component via a special `children` prop. The `Card` component can then render it anywhere inside its output.

Example:
```jsx
function Card({ children }) {
  return <div className="card">{children}</div>;
}

// Usage
<Card>
  <Avatar size={100} person={{ name: ''Lin'', imageId: ''1bX5QH6'' }} />
</Card>
```', 'easy', 'approved', '1ef7aa0a-f6c9-4822-940a-cc23b82a526e', 109, '2026-03-29T09:45:23.521Z', '2026-03-29T09:45:23.521Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c68638e2-d72c-446a-9fc8-38e7ebc571c0', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Props in React are described as immutable. What does this mean for how a component should handle the need to update its displayed data in response to user input?', 'Props are read-only snapshots that a component receives from its parent. A component must never mutate its own props directly. When a component needs to reflect new data in response to user interaction, it should use **state** (via `useState`) — or ask its parent to pass new props by lifting state up.

Example:
```jsx
// Wrong: mutating props
function Clock({ color }) {
  color = ''red''; // ❌ never do this
}

// Correct: use state in the parent and pass updated props down
```', 'medium', 'approved', '1ef7aa0a-f6c9-4822-940a-cc23b82a526e', 110, '2026-03-29T09:45:23.524Z', '2026-03-29T09:45:23.524Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4b7bffcd-20c5-4bc2-8364-8551b3640df8', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which of the following correctly attaches a click handler to a button without invoking it during render?

```jsx
// Option A
<button onClick={handleClick}>

// Option B
<button onClick={handleClick()}>

// Option C
<button onClick={alert(''clicked'')}>

// Option D
<button onClick="handleClick">
```', 'Event handlers must be **passed**, not **called**. Writing `onClick={handleClick}` gives React a function reference to invoke when the user clicks. Adding `()` — as in `onClick={handleClick()}` — calls the function immediately during rendering, before any click occurs.

Example:

```jsx
// Correct – function reference
<button onClick={handleClick}>Click me</button>

// Also correct – inline arrow function wraps the call
<button onClick={() => handleClick()}>Click me</button>

// Wrong – fires on every render, not on click
<button onClick={handleClick()}>Click me</button>
```', 'easy', 'approved', '514700f1-4dba-40bf-a279-ea0f2e0d5679', 111, '2026-03-29T19:37:16.313Z', '2026-03-29T19:37:16.313Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c1bdf417-3e12-402f-bb9d-c6a048e35da1', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'A `<button>` is nested inside a `<div>`, and both have `onClick` handlers. What happens when the user clicks the button?', 'React events **propagate (bubble) upward** through the component tree. When you click the button, React first calls the button''s `onClick`, then the event bubbles up and triggers the parent `<div>`''s `onClick`. The order is child → parent.

The only React event that does **not** bubble is `onScroll`.

Example:

```jsx
<div onClick={() => alert(''div clicked'')}>
  <button onClick={() => alert(''button clicked'')}>
    Click me
  </button>
</div>
// Clicking the button shows: ''button clicked'', then ''div clicked''
```', 'easy', 'approved', '514700f1-4dba-40bf-a279-ea0f2e0d5679', 112, '2026-03-29T19:37:16.342Z', '2026-03-29T19:37:16.342Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a1eb4b72-f14f-4958-a1d5-6924f6581bdb', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'You want to prevent a click event on a child `<button>` from reaching the parent element''s `onClick` handler. Which call should you make inside the child''s handler?', '`e.stopPropagation()` stops the event from bubbling further up the tree so parent handlers do not fire.

`e.preventDefault()` is a different method — it stops the **browser''s default behavior** (like a form reload), but does not affect propagation.

Example:

```jsx
function Button({ onClick, children }) {
  return (
    <button onClick={e => {
      e.stopPropagation(); // parent onClick will NOT fire
      onClick();
    }}>
      {children}
    </button>
  );
}
```', 'medium', 'approved', '514700f1-4dba-40bf-a279-ea0f2e0d5679', 113, '2026-03-29T19:37:16.347Z', '2026-03-29T19:37:16.347Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('dd13841c-5685-4baf-9547-4f10e4802f07', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'A `<form>` element reloads the page when the submit button is clicked. Which method on the event object prevents this default browser behavior?', '`e.preventDefault()` tells the browser not to execute its built-in behavior for that event. For a form submit, this prevents the page reload.

Do not confuse it with `e.stopPropagation()`, which stops the event from bubbling to parent elements — a completely separate concern.

Example:

```jsx
<form onSubmit={e => {
  e.preventDefault(); // stops page reload
  alert(''Submitting!'');
}}>
  <input />
  <button>Send</button>
</form>
```', 'medium', 'approved', '514700f1-4dba-40bf-a279-ea0f2e0d5679', 114, '2026-03-29T19:37:16.358Z', '2026-03-29T19:37:16.358Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9753e563-41bf-4e36-8279-c2767f95d3df', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'By convention, how should event handler props be named on custom React components?', 'The React convention for **prop names** that accept event handlers is `on` + capitalized event description, such as `onClick`, `onPlayMovie`, or `onUploadImage`.

The `handle` prefix is the convention for **function names** defined inside a component (e.g., `handleClick`, `handleMouseEnter`), not for props.

Example:

```jsx
// Custom component exposes onSmash prop
function Button({ onSmash, children }) {
  return (
    <button onClick={onSmash}>
      {children}
    </button>
  );
}

// Usage
<Button onSmash={() => alert(''Smashed!'')}>Hit me</Button>
```', 'easy', 'approved', '514700f1-4dba-40bf-a279-ea0f2e0d5679', 115, '2026-03-29T19:37:16.363Z', '2026-03-29T19:37:16.363Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('498c84c0-4495-4264-9e54-36c15d420ec2', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Every React event handler receives a React event object (sometimes called a synthetic event). Which property gives you access to the original underlying browser event?', 'The React event object exposes `e.nativeEvent`, which is the original DOM `Event` object supplied by the browser.

React does not always map its synthetic event directly to the native event of the same name. For example, for `onMouseLeave`, `e.nativeEvent` points to a `mouseout` event. If you need the raw browser event, read it from `e.nativeEvent`.

Example:

```jsx
<button onClick={e => {
  console.log(e);            // React event object
  console.log(e.nativeEvent); // original browser MouseEvent
}}>
  Click
</button>
```', 'easy', 'approved', '4dd20f2a-35c1-43c0-8cfb-32f84ac4a2b1', 116, '2026-03-29T19:43:05.223Z', '2026-03-29T19:43:05.223Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('39422308-2a8a-4428-8a3d-a50a4354f099', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Inside a React event handler, `e.target` and `e.currentTarget` can refer to different DOM nodes. What is the difference?

```jsx
<div onClick={e => {
  console.log(e.target);        // ???
  console.log(e.currentTarget); // ???
}}>
  <button>Click me</button>
</div>
```', '`e.target` is the DOM node on which the event originally fired (the innermost element the user interacted with). `e.currentTarget` is the DOM node to which the currently executing handler is attached in the React tree.

In the example, clicking the button sets `e.target` to the `<button>` element, while `e.currentTarget` is the `<div>` (where the handler lives).

Example:

```jsx
<div onClick={e => {
  // e.target    → <button> (where the click happened)
  // e.currentTarget → <div>  (where the handler is attached)
  console.log(e.target === e.currentTarget); // false
}}>
  <button>Click me</button>
</div>
```

Note: because React attaches all handlers at the root internally, `e.currentTarget` may not equal `e.nativeEvent.currentTarget`.', 'medium', 'approved', '4dd20f2a-35c1-43c0-8cfb-32f84ac4a2b1', 117, '2026-03-29T19:43:05.229Z', '2026-03-29T19:43:05.229Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('bc9afafb-f59c-4d8c-abe9-d403a8d01dc9', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which of the following is a React-specific method on the event object that is **not** part of the standard DOM `Event` interface?', 'React event objects include all standard DOM `Event` methods (`stopPropagation()`, `preventDefault()`) and properties (`bubbles`, `cancelable`, etc.), but they also add several React-specific helpers:

- `e.isDefaultPrevented()` — returns `true` if `preventDefault()` was called
- `e.isPropagationStopped()` — returns `true` if `stopPropagation()` was called
- `e.persist()` — no-op in React DOM; for React Native only
- `e.isPersistent()` — no-op in React DOM; for React Native only

Example:

```jsx
<form onSubmit={e => {
  e.preventDefault();
  console.log(e.isDefaultPrevented()); // true
  console.log(e.isPropagationStopped()); // false
}}>
  <button>Submit</button>
</form>
```', 'medium', 'approved', '4dd20f2a-35c1-43c0-8cfb-32f84ac4a2b1', 118, '2026-03-29T19:43:05.233Z', '2026-03-29T19:43:05.233Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('05ca958a-b07b-434d-a870-6d3abad89880', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'In React, the `onFocus` and `onBlur` events behave differently from their native browser counterparts. What is the key difference?', 'The native browser `focus` and `blur` events do **not** bubble. React normalizes this behavior: `onFocus` and `onBlur` **do bubble** in React, making it straightforward to detect focus entering or leaving an entire subtree by attaching a single handler on the parent.

Example:

```jsx
// This handler fires whenever any descendant gains focus,
// because onFocus bubbles in React.
<div onFocus={e => console.log(''focus entered subtree'')}>
  <input name="first" />
  <input name="last" />
</div>
```', 'easy', 'approved', '4dd20f2a-35c1-43c0-8cfb-32f84ac4a2b1', 119, '2026-03-29T19:43:05.237Z', '2026-03-29T19:43:05.237Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('aaeebdbe-9c97-476a-8ac5-b2f448f54785', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which keyboard event handler prop is **deprecated** in React and should be replaced?', '`onKeyPress` is a deprecated `KeyboardEvent` handler. The React docs explicitly call this out and recommend using `onKeyDown` or `onBeforeInput` as replacements.

Example migration:

```jsx
// Deprecated
<input onKeyPress={e => console.log(e.key)} />

// Preferred
<input onKeyDown={e => console.log(e.key)} />
```', 'easy', 'approved', '4dd20f2a-35c1-43c0-8cfb-32f84ac4a2b1', 120, '2026-03-29T19:43:05.242Z', '2026-03-29T19:43:05.242Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('da94dfd2-1939-41bc-9520-421c212473fb', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What makes a React `<input>` a **controlled** input?', 'A React input becomes **controlled** when you pass a `value` prop (or `checked` for checkboxes and radio buttons). React then forces the input to always reflect that value. You must also supply an `onChange` handler that updates the backing state; otherwise the input will be read-only and React will warn you.

Example:

```jsx
import { useState } from ''react'';

function Form() {
  const [name, setName] = useState('''');
  return (
    <input
      value={name}                        // controlled
      onChange={e => setName(e.target.value)} // required
    />
  );
}
```

`defaultValue` is for **uncontrolled** inputs — it sets the initial value but React does not manage it thereafter.', 'easy', 'approved', 'fbe7879e-3754-40b8-8462-f7a6d4d79f68', 121, '2026-03-29T19:48:15.061Z', '2026-03-29T19:48:15.061Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4c42fde4-3edc-4650-9a41-c9ca8a6c2074', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'You want a text `<input>` to start with the value `"Taylor"` but remain uncontrolled. Which prop should you use?

```jsx
<input ??? />
```', '`defaultValue` sets the initial content of an uncontrolled input. React renders the initial value but does not manage subsequent changes — the browser and the DOM handle them directly.

`value` turns the input into a **controlled** input and requires an `onChange` handler. `placeholder` displays hint text when the field is empty and does not set its actual value.

Example:

```jsx
// Uncontrolled – React sets the initial value, browser manages the rest
<input name="firstName" defaultValue="Taylor" />
```', 'easy', 'approved', 'fbe7879e-3754-40b8-8462-f7a6d4d79f68', 122, '2026-03-29T19:48:15.066Z', '2026-03-29T19:48:15.066Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a80593ad-6db7-4e35-9e17-97df174e889e', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'A controlled `<input type="checkbox">` is not updating when the user clicks it. What is the most likely cause?

```jsx
<input
  type="checkbox"
  checked={isChecked}
  onChange={e => setIsChecked(e.target.value)}
/>
```', 'For checkboxes, the checked state is exposed through `e.target.checked` (a boolean), **not** `e.target.value` (which is always the `value` attribute string). Using `e.target.value` would set your state variable to the string `"on"` or `""`  instead of `true`/`false`, so React would revert the visual state on every re-render.

Example:

```jsx
// Correct
<input
  type="checkbox"
  checked={isChecked}
  onChange={e => setIsChecked(e.target.checked)} // ✅ boolean
/>
```', 'medium', 'approved', 'fbe7879e-3754-40b8-8462-f7a6d4d79f68', 123, '2026-03-29T19:48:15.070Z', '2026-03-29T19:48:15.070Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('fd8aee7e-f97b-4e26-8547-2f344c5843b2', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What happens if you render a controlled `<input>` with a `value` prop but **no** `onChange` handler?

```jsx
<input value={name} />
```', 'When you pass `value` without `onChange`, React forces the input to stay at that value on every render. Every keystroke is immediately reverted, making it impossible to type. React also logs a console warning:

> You provided a `value` prop to a form field without an `onChange` handler. This will render a read-only field.

To fix it, either add an `onChange` handler, use `defaultValue` for an uncontrolled input, or add `readOnly={true}` to silence the warning intentionally.

```jsx
// Option 1 – controlled with onChange
<input value={name} onChange={e => setName(e.target.value)} />

// Option 2 – intentionally read-only
<input value={name} readOnly={true} />

// Option 3 – uncontrolled with initial value
<input defaultValue={name} />
```', 'medium', 'approved', 'fbe7879e-3754-40b8-8462-f7a6d4d79f68', 124, '2026-03-29T19:48:15.073Z', '2026-03-29T19:48:15.073Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d2f103b5-b6a4-419f-821f-2849c7f4b9dd', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'You receive the error **"A component is changing an uncontrolled input to be controlled"**. What is the most common root cause?', 'React classifies an input as **uncontrolled** when `value` is `undefined` or `null`, and as **controlled** when it is a string. Switching between the two during a component''s lifetime triggers this error.

The fix is to ensure `value` is always a string (never `undefined`/`null`). Initialize state to `''''` or coalesce with `??`:

```jsx
// Bug – value starts as undefined when data hasn''t loaded yet
<input value={user?.name} onChange={...} />

// Fix – guarantee a string
<input value={user?.name ?? ''''} onChange={...} />
```

Similarly, `checked` for checkboxes must always be a boolean.', 'medium', 'approved', 'fbe7879e-3754-40b8-8462-f7a6d4d79f68', 125, '2026-03-29T19:48:15.076Z', '2026-03-29T19:48:15.076Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7e6273f9-b91c-41d7-9cb1-b37127236fae', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'In React, how do you pre-select an option in an **uncontrolled** `<select>` box without making it controlled?

```jsx
<select name="fruit" ???>
  <option value="apple">Apple</option>
  <option value="orange">Orange</option>
</select>
```', 'React does not support setting the `selected` attribute on individual `<option>` elements (unlike HTML). Instead, use `defaultValue` on the `<select>` to specify the initially selected option for an uncontrolled select box.

Passing `value` without `onChange` would make it appear controlled but read-only, causing a React warning.

Example:

```jsx
<select name="fruit" defaultValue="orange">
  <option value="apple">Apple</option>
  <option value="orange">Orange</option>
</select>
```', 'easy', 'approved', '32c9004b-f8b1-4e07-9537-1df51a9d69f5', 126, '2026-03-29T19:53:58.416Z', '2026-03-29T19:53:58.416Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('759ab3ae-0d6b-483e-9a7d-f360ab364d18', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What prop must you pass alongside `value` when creating a **controlled** `<select>` in React?', 'When you pass `value` to a `<select>`, React forces it to always show that value. To let the user change the selection, you must also provide an `onChange` handler that updates the state variable synchronously.

Example:

```jsx
import { useState } from ''react'';

function FruitPicker() {
  const [fruit, setFruit] = useState(''orange'');
  return (
    <select value={fruit} onChange={e => setFruit(e.target.value)}>
      <option value="apple">Apple</option>
      <option value="orange">Orange</option>
    </select>
  );
}
```', 'easy', 'approved', '32c9004b-f8b1-4e07-9537-1df51a9d69f5', 127, '2026-03-29T19:53:58.420Z', '2026-03-29T19:53:58.420Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e36149bc-9fc4-4ff1-9e9e-79590a45933a', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'You need a `<select>` that allows the user to pick **multiple** fruits and you want `"banana"` and `"orange"` pre-selected as the initial values. Which JSX is correct?

```jsx
// Option A
<select multiple={true} defaultValue={[''banana'', ''orange'']}>

// Option B
<select multiple={true} defaultValue="banana, orange">

// Option C
<select multiple={true}>
  <option value="banana" selected>Banana</option>
  <option value="orange" selected>Orange</option>
</select>

// Option D
<select multiple={true} defaultValue="banana">
```', 'When `multiple={true}`, `defaultValue` must be an **array** of value strings — not a comma-separated string. React uses the array to match against each `<option>`''s `value`.

The `selected` attribute on individual `<option>` elements is not supported in React.

Example:

```jsx
<select
  name="fruits"
  multiple={true}
  defaultValue={[''banana'', ''orange'']}
>
  <option value="apple">Apple</option>
  <option value="banana">Banana</option>
  <option value="orange">Orange</option>
</select>
```', 'medium', 'approved', '32c9004b-f8b1-4e07-9537-1df51a9d69f5', 128, '2026-03-29T19:53:58.425Z', '2026-03-29T19:53:58.425Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9f58690e-d893-4e11-a2ac-da49d3bf8da6', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'You have a controlled `<select multiple={true}>`. Inside the `onChange` handler, how do you correctly read **all** currently selected values?

```jsx
<select
  multiple={true}
  value={selectedVegs}
  onChange={e => {
    // How to get the array of selected values?
  }}
>
```', '`e.target.value` on a multi-select only returns the **last** selected value, not all of them. The correct approach is to use `e.target.selectedOptions`, an `HTMLCollection` of the currently selected `<option>` elements, then map over their `.value` properties.

Example:

```jsx
<select
  multiple={true}
  value={selectedVegs}
  onChange={e => {
    const options = [...e.target.selectedOptions];
    const values = options.map(option => option.value);
    setSelectedVegs(values);
  }}
>
  <option value="corn">Corn</option>
  <option value="tomato">Tomato</option>
</select>
```', 'medium', 'approved', '32c9004b-f8b1-4e07-9537-1df51a9d69f5', 129, '2026-03-29T19:53:58.428Z', '2026-03-29T19:53:58.428Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('55c344e2-b29f-413f-80f7-c66312eb35da', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which of the following statements about React `<select>` is true?', 'React enforces that a form element is either always controlled or always uncontrolled for its entire lifetime. Switching from `value={undefined}` to a string value (or vice versa) will trigger the "A component is changing an uncontrolled input to be controlled" warning and unpredictable behavior.

Additionally:
- The `selected` attribute on `<option>` is not supported in React — use `defaultValue` or `value` on the `<select>` instead.
- `value` and `defaultValue` cannot be used together on the same element.
- A controlled `<select>` without `onChange` becomes read-only; `readOnly` is not a valid prop on `<select>`.', 'easy', 'approved', '32c9004b-f8b1-4e07-9537-1df51a9d69f5', 130, '2026-03-29T19:53:58.430Z', '2026-03-29T19:53:58.430Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('dead8aee-bf7c-44b1-ae77-9700d76a8efd', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is the key difference between `FormData.append()` and `FormData.set()` when the specified key already exists?', '`append()` appends the new value onto the end of the existing set of values for that key, so a key can have multiple values. `set()` overwrites all existing values for the key with the single new value.

Example:

```js
const fd = new FormData();
fd.append("color", "red");
fd.append("color", "blue");  // key now has two values
fd.getAll("color"); // ["red", "blue"]

fd.set("color", "green");    // replaces both
fd.getAll("color"); // ["green"]
```', 'medium', 'approved', 'd5348b0c-a9b2-4ce9-9754-ab83ba3171fb', 131, '2026-03-29T20:04:45.043Z', '2026-03-29T20:04:45.043Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e80b5b86-6269-4550-b01e-b112c0727d2f', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What does `FormData.get(name)` return when the key exists but has multiple values (added via `append()`)?', '`FormData.get(name)` always returns the **first** value for the given key. To retrieve all values when a key has been appended to multiple times, use `FormData.getAll(name)`, which returns an array.

Example:

```js
const fd = new FormData();
fd.append("username", "Chris");
fd.append("username", "Bob");

fd.get("username");    // "Chris"  (first only)
fd.getAll("username"); // ["Chris", "Bob"]
```', 'easy', 'approved', 'd5348b0c-a9b2-4ce9-9754-ab83ba3171fb', 132, '2026-03-29T20:04:45.048Z', '2026-03-29T20:04:45.048Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ba9bb4f5-a357-4fb8-bfd2-4bdcb5f2e6c0', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is the result of iterating a `FormData` object directly with `for...of`?

```js
for (const pair of formData) {
  console.log(pair);
}
```', '`FormData` implements the iterable protocol. Using `for...of` directly is shorthand for calling `formData.entries()`, so each iteration yields a two-element `[key, value]` array.

Example:

```js
const fd = new FormData();
fd.append("name", "Alice");
fd.append("role", "admin");

for (const [key, value] of fd) {
  console.log(key, value); // "name" "Alice", then "role" "admin"
}
// identical to: for (const [key, value] of fd.entries()) { ... }
```', 'easy', 'approved', 'd5348b0c-a9b2-4ce9-9754-ab83ba3171fb', 133, '2026-03-29T20:04:45.052Z', '2026-03-29T20:04:45.052Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('52b4d61e-6b97-4eba-8368-082ce8f170d2', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'When you construct `new FormData(form)` by passing an HTML `<form>` element, which controls are included in the resulting `FormData` object?', 'The MDN spec notes: *"Only successful form controls are included in a FormData object, i.e., those with a name and not in a disabled state."* This mirrors which fields a native form submission would send.

Example:

```html
<form id="form">
  <input name="username" value="Alice" />
  <input name="token" value="secret" disabled />
</form>
```
```js
const fd = new FormData(document.getElementById("form"));
fd.get("username"); // "Alice"
fd.get("token");    // null  — disabled, so excluded
```', 'medium', 'approved', 'd5348b0c-a9b2-4ce9-9754-ab83ba3171fb', 134, '2026-03-29T20:04:45.057Z', '2026-03-29T20:04:45.057Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('19cef575-972e-44c3-9f12-034f30269fdd', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What happens when you call `FormData.append()` with a value that is neither a `string` nor a `Blob`?

```js
const fd = new FormData();
fd.append("active", true);
fd.append("count", 72);
fd.getAll("active"); // ?
fd.getAll("count");  // ?
```', '`FormData.append()` (and `set()`) automatically converts any non-string, non-Blob value to a string before storing it. This mirrors how HTML form submissions serialise values.

Example:

```js
const fd = new FormData();
fd.append("active", true);
fd.append("count", 72);

fd.getAll("active"); // ["true"]
fd.getAll("count");  // ["72"]
```', 'medium', 'approved', 'd5348b0c-a9b2-4ce9-9754-ab83ba3171fb', 135, '2026-03-29T20:04:45.062Z', '2026-03-29T20:04:45.062Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('04128e73-b627-48bf-9cde-b03982e7e3ce', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What does "lifting state up" mean in React?', 'When two sibling components need to change together, the solution is to remove the state from both children and move it to their closest common parent. The parent then passes the information back down via props. This pattern is called "lifting state up".

Example: two `Panel` components both need to know which one is active, so the state moves up to the parent `Accordion`:

```jsx
function Accordion() {
  const [activeIndex, setActiveIndex] = useState(0);
  return (
    <>
      <Panel isActive={activeIndex === 0} onShow={() => setActiveIndex(0)} />
      <Panel isActive={activeIndex === 1} onShow={() => setActiveIndex(1)} />
    </>
  );
}
```', 'easy', 'approved', '8af18e03-cbea-47b2-9f81-dd7089a1ac92', 136, '2026-03-29T20:11:41.602Z', '2026-03-29T20:11:41.602Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a05f3c4f-9811-4680-97a8-1c660867afea', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which of the following best describes a **controlled** component in React?', 'A component is called "controlled" when the important information in it is driven by **props** passed from a parent rather than its own local state. This lets the parent fully specify its behaviour.

For example, after lifting state up, a `Panel` component becomes controlled because its `isActive` value is owned by the parent `Accordion` and passed down as a prop:

```jsx
function Panel({ title, children, isActive, onShow }) {
  // no local state — fully controlled by parent
  return (
    <section>
      <h3>{title}</h3>
      {isActive ? <p>{children}</p> : <button onClick={onShow}>Show</button>}
    </section>
  );
}
```', 'easy', 'approved', '8af18e03-cbea-47b2-9f81-dd7089a1ac92', 137, '2026-03-29T20:11:41.610Z', '2026-03-29T20:11:41.610Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('eaeeac21-c8dd-4cff-ae47-185f356400d3', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which of the following best describes an **uncontrolled** component in React?', 'It is common to call a component with some local state "uncontrolled" because its parent cannot influence whether certain behaviour occurs.

For example, the original `Panel` with its own `isActive` state variable is uncontrolled — the parent `Accordion` has no way to force a specific panel open or closed:

```jsx
function Panel({ title, children }) {
  const [isActive, setIsActive] = useState(false); // parent can''t touch this
  return (
    <section>
      <h3>{title}</h3>
      {isActive ? <p>{children}</p> : <button onClick={() => setIsActive(true)}>Show</button>}
    </section>
  );
}
```

Uncontrolled components are easier to drop into a parent but harder to coordinate with siblings.', 'easy', 'approved', '8af18e03-cbea-47b2-9f81-dd7089a1ac92', 138, '2026-03-29T20:11:41.615Z', '2026-03-29T20:11:41.615Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7365b2dd-426d-4c45-93bf-43510645a83a', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What are the three steps for lifting state up from two sibling components to their common parent?', 'The React docs describe three concrete steps:

1. **Remove state from the child components** — delete `useState` from both siblings.
2. **Pass hardcoded data from the common parent** — confirm the parent can control the children via props.
3. **Add state to the common parent and pass it down together with event handlers** — the parent owns the state and gives each child both the current value and a callback to change it.

```jsx
// After all three steps:
function Accordion() {
  const [activeIndex, setActiveIndex] = useState(0);
  return (
    <>
      <Panel isActive={activeIndex === 0} onShow={() => setActiveIndex(0)} />
      <Panel isActive={activeIndex === 1} onShow={() => setActiveIndex(1)} />
    </>
  );
}
```', 'medium', 'approved', '8af18e03-cbea-47b2-9f81-dd7089a1ac92', 139, '2026-03-29T20:11:41.619Z', '2026-03-29T20:11:41.619Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4fbde162-5706-4341-8bfc-a6473cd1236a', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What does the "single source of truth" principle mean in the context of React state?', '"Single source of truth" does **not** mean all state lives in one place. It means that for each individual piece of state, there is exactly one component that owns and manages it. Instead of maintaining duplicated copies of the same data in multiple components, you lift shared state to the closest common ancestor and pass it down to any children that need it.

This keeps data consistent: there is always one authoritative value, eliminating the possibility of siblings getting out of sync.', 'medium', 'approved', '8af18e03-cbea-47b2-9f81-dd7089a1ac92', 140, '2026-03-29T20:11:41.623Z', '2026-03-29T20:11:41.623Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b26e51f9-42c3-47c3-969d-19d4725fff66', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Why can''t a regular local variable (declared with `let` inside a component function) be used to persist data between renders?', 'Local variables are re-initialized on every render because React calls the component function from scratch each time. There is no mechanism that allows React to detect when a local variable changes, so it cannot schedule a re-render. `useState` solves both problems: it persists the value between renders AND triggers a re-render when the value changes.', 'easy', 'approved', '0c0395b4-b2e6-49f7-8c50-eadf3199cd60', 141, '2026-03-29T20:29:59.279Z', '2026-03-29T20:29:59.279Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e8025b50-a8ee-4817-b32c-ee7d2cd559cb', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What does the `useState` Hook return?', '`useState` always returns an array with exactly two items: the current state value and the setter function used to update it. The conventional destructuring pattern `const [value, setValue] = useState(initial)` takes advantage of this.

Example:

```jsx
const [count, setCount] = useState(0);
// count → current state value
// setCount → function to update state
```', 'easy', 'approved', '0c0395b4-b2e6-49f7-8c50-eadf3199cd60', 142, '2026-03-29T20:29:59.285Z', '2026-03-29T20:29:59.285Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9fa0e40b-d7ac-411d-9cde-f0f98f0a1c0b', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Where does React actually store the state of a component?', 'React keeps state outside of the component function itself — internally in React''s own memory, associated with the component''s position in the render tree. This is why state persists between renders even though the function re-executes from scratch on every render.

Example:

```jsx
function Counter() {
  const [count, setCount] = useState(0);
  // ''count'' lives in React, not in this function''s call stack
}
```', 'medium', 'approved', '0c0395b4-b2e6-49f7-8c50-eadf3199cd60', 143, '2026-03-29T20:29:59.289Z', '2026-03-29T20:29:59.289Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8dfacc50-bbf8-4713-8d62-ca70755190a6', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which of the following correctly describes a Rule of Hooks regarding where `useState` can be called?', 'Hooks must be called at the top level of a React function component or a custom Hook — never inside `if`, `for`, nested functions, or event handlers. This rule ensures that React can reliably match each Hook call to its stored state across renders.

Example:

```jsx
// ✅ Correct
function MyComponent() {
  const [value, setValue] = useState('''');
}

// 🚩 Wrong
function MyComponent() {
  if (condition) {
    const [value, setValue] = useState('''');
  }
}
```', 'medium', 'approved', '0c0395b4-b2e6-49f7-8c50-eadf3199cd60', 144, '2026-03-29T20:29:59.291Z', '2026-03-29T20:29:59.291Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('27950c77-ce5b-4134-8d6b-84dad6a678ec', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'If you render the same component twice on a page, what happens to their states?', 'Each component instance manages its own isolated state. Rendering `<Gallery />` twice creates two completely independent state stores; changing one has no effect on the other. This isolation is a core property of React state.

Example:

```jsx
<Page>
  <Gallery /> {/* index = 0, completely independent */}
  <Gallery /> {/* index = 0, completely independent */}
</Page>
```', 'easy', 'approved', '0c0395b4-b2e6-49f7-8c50-eadf3199cd60', 145, '2026-03-29T20:29:59.296Z', '2026-03-29T20:29:59.296Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('773cad26-777b-4b8a-aeb3-c7388e4e0a6b', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What are the three steps React performs to display a component on screen?', 'React goes through three distinct phases every time the screen needs to update:

1. **Trigger** — something tells React to render (initial render or a state update).
2. **Render** — React calls the component function to calculate what the UI should look like.
3. **Commit** — React applies the minimal necessary DOM changes.

The browser then paints the screen from the updated DOM.', 'easy', 'approved', '23b0b94a-5396-4cb8-b75f-4804900cf7ee', 146, '2026-03-29T20:30:06.366Z', '2026-03-29T20:30:06.366Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('94a5a0a3-dd51-416e-b140-00db60f14605', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What are the two possible causes that trigger a React render?', 'React renders a component in exactly two situations:

1. **Initial render** — when the app first loads and `root.render()` is called.
2. **State update** — when the component (or one of its ancestors) calls the setter function from `useState`.

Prop changes alone do not independently trigger a render; they do so because the parent re-renders first.', 'easy', 'approved', '23b0b94a-5396-4cb8-b75f-4804900cf7ee', 147, '2026-03-29T20:30:06.369Z', '2026-03-29T20:30:06.369Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7b18b8d1-f2b4-4d26-a0d1-f38faab20ddc', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'During a re-render, what does React call in the render phase?', 'When a state update triggers a re-render, React calls the function component whose state changed. The process is recursive: if that component returns child components, React renders those too, until there are no more nested components to process.

Example: if `Gallery` renders three `<Image />` components, React calls both `Gallery()` and `Image()` multiple times during a single render pass.', 'medium', 'approved', '23b0b94a-5396-4cb8-b75f-4804900cf7ee', 148, '2026-03-29T20:30:06.371Z', '2026-03-29T20:30:06.371Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a41cf57a-2ed2-4fec-acce-d0fa510783be', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'During the commit phase for a re-render, how does React decide which DOM nodes to update?', 'React compares the new render output with the previous one and only applies the minimal set of DOM operations needed to bring the DOM in sync. If a node has not changed, React leaves it untouched — for example, an `<input>` that appears in the same position keeps its focus and value even when a sibling re-renders.

Example: if only `<h1>` content changes, React updates only that text node and does not touch the `<input>` next to it.', 'medium', 'approved', '23b0b94a-5396-4cb8-b75f-4804900cf7ee', 149, '2026-03-29T20:30:06.374Z', '2026-03-29T20:30:06.374Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e82a0e87-0428-48d6-8c98-32d13f907c86', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is a requirement for a component''s render function to be considered correct according to React?', 'Rendering must be a **pure calculation**: given the same props and state, the component must always return the same JSX, and it must not mutate any objects or variables that existed before the render started. Impure render functions lead to confusing bugs. React''s Strict Mode calls each component twice in development specifically to surface impure renders.', 'medium', 'approved', '23b0b94a-5396-4cb8-b75f-4804900cf7ee', 150, '2026-03-29T20:30:06.379Z', '2026-03-29T20:30:06.379Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('903cd62c-a29c-4732-b8b0-6ad9138685a7', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What happens when you call a state setter function in React?', 'Calling a setter like `setIsSent(true)` does **not** change the state variable in the currently executing code. Instead, it requests a new render from React. On the next render, React will call the component function again and provide the new state value.

Example:

```jsx
setIsSent(true);
console.log(isSent); // Still false — change applies on the next render
```', 'easy', 'approved', '44daa932-6e35-4fc4-8f86-ade561005bc8', 151, '2026-03-29T20:30:12.649Z', '2026-03-29T20:30:12.649Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('65294e0a-a15f-47fe-8650-7b850c5a46a4', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Given the following component, what will the counter value be after clicking the button once?

```jsx
const [number, setNumber] = useState(0);

<button onClick={() => {
  setNumber(number + 1);
  setNumber(number + 1);
  setNumber(number + 1);
}}>+3</button>
```', 'Because `number` is fixed at `0` for the entire duration of the current render''s event handler, each call to `setNumber(number + 1)` is effectively `setNumber(0 + 1)`. React schedules the value `1` three times; the final result after re-render is `1`, not `3`.

To actually increment three times, use an updater function: `setNumber(n => n + 1)` three times.', 'medium', 'approved', '44daa932-6e35-4fc4-8f86-ade561005bc8', 152, '2026-03-29T20:30:12.656Z', '2026-03-29T20:30:12.656Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4f5c9039-c6aa-4565-ae64-f4747150025f', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Consider this code where `number` is currently `0`:

```jsx
<button onClick={() => {
  setNumber(number + 5);
  setTimeout(() => {
    alert(number);
  }, 3000);
}}>+5</button>
```
What value does the `alert` show after the 3-second delay?', 'The `setTimeout` callback captures the **snapshot** of `number` from the render in which the click happened. Even though React has already updated `number` to `5` and re-rendered by the time the alert fires, the closure still holds the old snapshot value `0`.

This demonstrates that event handler closures always see the state values from the render in which they were created.', 'medium', 'approved', '44daa932-6e35-4fc4-8f86-ade561005bc8', 153, '2026-03-29T20:30:12.659Z', '2026-03-29T20:30:12.659Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1311a078-78bc-474f-bc92-ab7ea921949d', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which statement correctly describes how React provides state to a component during a render?', 'When React renders a component, it hands it a **snapshot** of the state at that specific moment. All props, event handlers, and local variables computed during that render use the state values from that snapshot. Future state updates create a new snapshot on the next render; the current snapshot is immutable.', 'medium', 'approved', '44daa932-6e35-4fc4-8f86-ade561005bc8', 154, '2026-03-29T20:30:12.662Z', '2026-03-29T20:30:12.662Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('126615d2-dd59-4a26-928f-3d9456ee8912', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'A state variable''s value is `5` at the start of a render. An event handler calls `setNumber(number + 3)` and then asynchronously reads `number` inside a `setTimeout`. What value will `number` have inside the `setTimeout`?', 'The `setTimeout` callback closes over the `number` variable from the **render that scheduled it**, which is the snapshot where `number === 5`. Even though React updates state to `8` and re-renders the component, the old closure still sees `5`.

A state variable''s value **never changes within a render**, even in asynchronous callbacks scheduled during that render.', 'hard', 'approved', '44daa932-6e35-4fc4-8f86-ade561005bc8', 155, '2026-03-29T20:30:12.665Z', '2026-03-29T20:30:12.665Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('95b6ca7b-f5d8-4db5-98e1-e725037d47a4', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is React "batching" in the context of state updates?', 'Batching means React waits until **all code in an event handler has finished running** before processing state updates and triggering a re-render. This avoids unnecessary intermediate re-renders and keeps the UI consistent.

Example: calling `setA(1)` and `setB(2)` in the same click handler causes only a single re-render, not two.', 'easy', 'approved', '892c28ab-d5e5-46db-acb9-b7bdee9cbd67', 156, '2026-03-29T20:30:18.478Z', '2026-03-29T20:30:18.478Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('26dbc298-4ee9-42e5-9a12-7dd00de402e5', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'How do you update the same state variable multiple times within a single event handler so that each update builds on the previous one?', 'Pass an **updater function** (e.g. `n => n + 1`) instead of a value. React queues updater functions and processes them in order during the next render, each receiving the result of the previous updater as input.

Example:

```jsx
// Each call actually adds 1, resulting in +3 total
setNumber(n => n + 1);
setNumber(n => n + 1);
setNumber(n => n + 1);
```', 'medium', 'approved', '892c28ab-d5e5-46db-acb9-b7bdee9cbd67', 157, '2026-03-29T20:30:18.483Z', '2026-03-29T20:30:18.483Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('96e227ae-c466-479c-bc31-9adecfdc25a0', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Given this event handler where `number` is currently `0`, what will the state be after one click?

```jsx
<button onClick={() => {
  setNumber(number + 5);
  setNumber(n => n + 1);
}}>Go</button>
```', 'React processes the queue in order:

1. `setNumber(number + 5)` → `number` is `0`, so React queues "replace with `5`".
2. `setNumber(n => n + 1)` → updater function queued.

During the next render React processes:

| queued item | pending value | result |
|---|---|---|
| replace with 5 | 0 (ignored) | 5 |
| n => n + 1 | 5 | 6 |

Final state: **6**.', 'hard', 'approved', '892c28ab-d5e5-46db-acb9-b7bdee9cbd67', 158, '2026-03-29T20:30:18.488Z', '2026-03-29T20:30:18.488Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2676cd16-b2bc-436b-9912-d2a22bed0199', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'When are updater functions (e.g. `n => n + 1`) actually executed by React?', 'Updater functions are executed **during the next render**, not immediately when called. React queues them, then processes the queue sequentially when calculating the new state for that render. Because they run during rendering, they must be pure functions — no side effects, no direct state mutations.', 'medium', 'approved', '892c28ab-d5e5-46db-acb9-b7bdee9cbd67', 159, '2026-03-29T20:30:18.491Z', '2026-03-29T20:30:18.491Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('970032f2-f10b-4d38-92af-efd94fce780d', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Does React batch state updates across two separate, independent click events?', 'React only batches updates **within a single event**. Each intentional user event (e.g., a click) is handled independently. So two separate button clicks will each trigger their own render. This ensures that, for example, if the first click disables a form, the second click cannot accidentally submit it again.', 'easy', 'approved', '892c28ab-d5e5-46db-acb9-b7bdee9cbd67', 160, '2026-03-29T20:30:18.493Z', '2026-03-29T20:30:18.493Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('75d8a5fc-48cb-4dec-bcd1-1154317e1411', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Why should you avoid directly mutating an object stored in React state?', 'React detects state changes by comparing the old and new values. If you mutate an existing object and pass the same reference back, React sees no difference and does **not** re-render the component. You must always create a new object and pass it to the setter so React knows something has changed.

Example:

```jsx
// 🚩 Wrong — React will not re-render
position.x = e.clientX;

// ✅ Correct — new object triggers re-render
setPosition({ x: e.clientX, y: e.clientY });
```', 'easy', 'approved', 'a72f633d-8ec5-4f04-aa64-f42091a53184', 161, '2026-03-29T20:30:23.970Z', '2026-03-29T20:30:23.970Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('38d4c93d-2701-4752-9cc7-34ebdabcd3e7', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'You have a `person` object in state with `firstName`, `lastName`, and `email`. How should you update only `firstName` while keeping the other fields unchanged?', 'The object spread syntax (`...person`) copies all existing properties into the new object, and you override only the ones you want to change. This creates a brand-new object so React detects the update and re-renders.

Example:

```jsx
setPerson({
  ...person,         // copy existing fields
  firstName: e.target.value  // overwrite only this one
});
```', 'easy', 'approved', 'a72f633d-8ec5-4f04-aa64-f42091a53184', 162, '2026-03-29T20:30:23.978Z', '2026-03-29T20:30:23.978Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('224fe932-ac9d-4a83-a921-38febef455a0', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is a key limitation of the spread syntax (`...obj`) when copying objects for state updates?', 'Object spread is **shallow**: it only copies the top-level properties. Nested objects are still referenced, not cloned. If you spread and then update a nested property on the copy, you''re mutating shared state.

Example:

```jsx
// Requires spreading at every nested level
setPerson({
  ...person,
  artwork: {
    ...person.artwork,  // must also spread the nested object
    city: ''New Delhi''
  }
});
```', 'medium', 'approved', 'a72f633d-8ec5-4f04-aa64-f42091a53184', 163, '2026-03-29T20:30:23.983Z', '2026-03-29T20:30:23.983Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('bde5c6b0-18c2-4b57-9108-04cb88a5c624', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'How do you update `city` inside a deeply nested state object `person.artwork.city` without mutating state?', 'You must create new objects **all the way up** from the changed property to the root:

```jsx
setPerson({
  ...person,               // copy top-level
  artwork: {
    ...person.artwork,     // copy nested level
    city: ''New Delhi''      // override the target field
  }
});
```

Each spread creates a new object reference so React can detect the change at every level.', 'medium', 'approved', 'a72f633d-8ec5-4f04-aa64-f42091a53184', 164, '2026-03-29T20:30:23.988Z', '2026-03-29T20:30:23.988Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b701bf2e-7606-455d-8ce0-92e367d344ca', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is Immer and what problem does it solve when working with objects in React state?', 'Immer is a library (`use-immer`) that lets you write mutations against a special `draft` proxy object. Behind the scenes it produces correct immutable copies, eliminating the verbosity of manual spreading — especially for deeply nested structures.

Example:

```jsx
updatePerson(draft => {
  draft.artwork.city = ''Lagos''; // looks mutable, but Immer handles copying
});
```', 'medium', 'approved', 'a72f633d-8ec5-4f04-aa64-f42091a53184', 165, '2026-03-29T20:30:23.993Z', '2026-03-29T20:30:23.993Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('585ebb10-ab96-446d-ab5a-3bf6525ce4c5', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which of the following array methods should you **avoid** when updating an array stored in React state?', 'Methods like `push()`, `pop()`, `shift()`, `unshift()`, `splice()`, and `sort()` mutate the original array in place. Because React uses reference equality to detect changes, mutating an existing array won''t trigger a re-render. Instead, use non-mutating equivalents such as spread (`[...arr]`), `concat()`, `filter()`, `map()`, or `slice()`.', 'easy', 'approved', '1aa44aa9-a5f2-44a3-a00b-89df1a2b669a', 166, '2026-03-29T20:30:29.992Z', '2026-03-29T20:30:29.992Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('cb62fe91-627b-46be-8cd2-5b8f3fc37118', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'How do you correctly add a new item to the end of an array stored in state?', 'Instead of calling `push()` on the existing array (which mutates it), create a new array using the spread syntax and include the new item at the end.

Example:

```jsx
setArtists([
  ...artists,              // all existing items
  { id: nextId++, name }   // new item at the end
]);
```', 'easy', 'approved', '1aa44aa9-a5f2-44a3-a00b-89df1a2b669a', 167, '2026-03-29T20:30:29.997Z', '2026-03-29T20:30:29.997Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('58ae664f-fa57-4b37-86fe-f7caf9e2b586', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is the recommended way to remove a specific item from an array in React state?', '`filter()` creates a **new** array containing only the items that pass the test, leaving the original array untouched. This satisfies React''s immutability requirement.

Example:

```jsx
setArtists(
  artists.filter(a => a.id !== artist.id)
);
```', 'easy', 'approved', '1aa44aa9-a5f2-44a3-a00b-89df1a2b669a', 168, '2026-03-29T20:30:30.003Z', '2026-03-29T20:30:30.003Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('6eb5446f-8acd-4188-a03f-bf63cd7a9865', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is the key difference between JavaScript''s `slice` and `splice` methods, and why does it matter for React state?', '`slice` returns a **new** sub-array without modifying the original — safe to use with React state. `splice` **mutates** the original array by inserting or removing items — this should be avoided in React state updates because it breaks immutability.', 'medium', 'approved', '1aa44aa9-a5f2-44a3-a00b-89df1a2b669a', 169, '2026-03-29T20:30:30.009Z', '2026-03-29T20:30:30.009Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0faa9b4a-c232-421d-9492-1b8ce4473f4f', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'You spread an array into a new array and then modify a nested object inside the new array. Does this affect the original state array?', 'Spreading an array creates a **shallow copy** — the new array is different, but the objects inside it are the **same references** as those in the original. Modifying a property on one of those nested objects therefore also modifies the corresponding object in the original array, which is a state mutation.

Example:

```jsx
const nextList = [...list];
nextList[0].seen = true; // ❌ also mutates list[0]
```

To fix this, use `map()` to produce a new object for each item you want to change.', 'hard', 'approved', '1aa44aa9-a5f2-44a3-a00b-89df1a2b669a', 170, '2026-03-29T20:30:30.036Z', '2026-03-29T20:30:30.036Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('51efcfe7-ece3-45a0-b20a-d26e075239c1', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is the difference between passing a value and passing an initializer function to `useState`?

```jsx
// A
const [todos, setTodos] = useState(createInitialTodos());

// B
const [todos, setTodos] = useState(createInitialTodos);
```', 'In version **A**, `createInitialTodos()` is called on **every render** even though its return value is only used on the first render — wasteful for expensive calculations. In version **B**, only the function reference is passed; React calls it **once** during initialization and ignores it on re-renders. This is the "lazy initializer" pattern.

Note: React calls the initializer twice in Strict Mode (development only) to verify purity.', 'medium', 'approved', 'f441b1df-cd8c-4c20-a6d6-0757f5fa3d4e', 171, '2026-03-29T20:30:35.786Z', '2026-03-29T20:30:35.786Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4d81dfec-1c51-423d-9939-a09f35696334', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'After calling `setName(''Robin'')`, what does reading `name` immediately in the same event handler return?', 'The `set` function does **not** mutate the current state variable. It schedules an update for the **next render**. Reading `name` in the same event handler still returns the old value from the current render''s snapshot.

Example:

```jsx
function handleClick() {
  setName(''Robin'');
  console.log(name); // Still ''Taylor'' — not ''Robin''
}
```', 'easy', 'approved', 'f441b1df-cd8c-4c20-a6d6-0757f5fa3d4e', 172, '2026-03-29T20:30:35.791Z', '2026-03-29T20:30:35.791Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b319b639-f851-4f67-b7de-b1cd7c86fe3b', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Under what condition will React **skip** re-rendering a component after a `set` function is called?', 'React uses `Object.is` to compare the new state with the current state. If they are the same value (identical primitive or same object reference), React bails out of the render — it won''t re-render the component or its children. This is a built-in optimization.

Example:

```jsx
setCount(5); // current count is already 5
// React skips re-render because Object.is(5, 5) === true
```', 'medium', 'approved', 'f441b1df-cd8c-4c20-a6d6-0757f5fa3d4e', 173, '2026-03-29T20:30:35.794Z', '2026-03-29T20:30:35.794Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f39ccb42-7ade-4299-aab7-31674acebf47', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'You want to store a function in state. Which approach correctly stores the function without React calling it immediately?', 'React treats any function passed to `useState` or a setter as an **initializer or updater** — it calls it immediately to obtain the initial/next state value. To store a function itself, you must wrap it in an arrow function so React stores the wrapper and retrieves the inner function as the value.

Example:

```jsx
// ✅ Correct — wraps the function so React stores it, not calls it
const [fn, setFn] = useState(() => someFunction);

function handleClick() {
  setFn(() => someOtherFunction);
}
```', 'hard', 'approved', 'f441b1df-cd8c-4c20-a6d6-0757f5fa3d4e', 174, '2026-03-29T20:30:35.797Z', '2026-03-29T20:30:35.797Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('30138eb0-f3ee-4504-ab3a-08dddd094965', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'In React Strict Mode (development only), how many times will an initializer function or updater function passed to `useState` be invoked?', 'React Strict Mode calls initializer and updater functions **twice** (discarding the second result) to help catch accidental impurities — functions that mutate state or have side effects. Because the second call''s result is ignored, pure functions behave identically. This only happens in development; production is unaffected.

Example impurity that gets caught:

```jsx
// 🚩 Impure — mutates the previous state array
setTodos(prevTodos => { prevTodos.push(createTodo()); });
// Called twice → item added twice → obvious bug
```', 'medium', 'approved', 'f441b1df-cd8c-4c20-a6d6-0757f5fa3d4e', 175, '2026-03-29T20:30:35.802Z', '2026-03-29T20:30:35.802Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b81a95fa-4006-407c-8c18-398c2d873888', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What are the three steps React documentation recommends for writing a `useEffect` correctly?', 'The React docs describe exactly three steps: (1) Declare an Effect, (2) Specify the Effect dependencies, and (3) Add a cleanup function if needed. Following these steps ensures the Effect only runs when necessary and properly tears down any subscriptions or timers.', 'easy', 'approved', 'a4e1b391-d79a-4d3d-bdbf-a38b8c79502a', 176, '2026-03-29T21:17:26.179Z', '2026-03-29T21:17:26.179Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('26948941-22ce-4f7d-974d-1c13afd49b9a', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'By default, when does React run a `useEffect` callback?', 'Without a dependency array, React runs the Effect after **every** render (both the initial render and all subsequent re-renders). You control this behaviour by providing a dependency array as the second argument.', 'easy', 'approved', 'a4e1b391-d79a-4d3d-bdbf-a38b8c79502a', 177, '2026-03-29T21:17:26.181Z', '2026-03-29T21:17:26.181Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f12bb5d1-6576-4628-a53e-a81521623370', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is the purpose of the function that can be returned from a `useEffect` setup function?', 'The returned function is the **cleanup function**. React calls it before running the Effect again (when dependencies change) and once more when the component unmounts. It should undo whatever the setup did—for example, disconnecting a websocket or removing an event listener.', 'easy', 'approved', 'a4e1b391-d79a-4d3d-bdbf-a38b8c79502a', 178, '2026-03-29T21:17:26.184Z', '2026-03-29T21:17:26.184Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('5e2d83b7-bf71-42a1-bfcb-02a298d58efe', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Why does React intentionally run Effects **twice** on mount in development (Strict Mode)?', 'In Strict Mode React performs a setup → cleanup → setup cycle on mount to act as a stress-test. The goal is to expose bugs where the cleanup function does not correctly undo the setup—for example, unclosed connections that pile up as the user navigates the app.', 'medium', 'approved', 'a4e1b391-d79a-4d3d-bdbf-a38b8c79502a', 179, '2026-03-29T21:17:26.189Z', '2026-03-29T21:17:26.189Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('128e83f7-01a3-4ebe-9396-ca709b275e5d', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is the key difference between **Effects** and **event handlers** in React?', 'Event handlers run in response to a specific user interaction (e.g. a click). Effects are caused by rendering itself—they run after render regardless of which interaction, if any, triggered that render. This makes Effects ideal for synchronising with external systems that must stay connected while the component is visible.', 'medium', 'approved', 'a4e1b391-d79a-4d3d-bdbf-a38b8c79502a', 180, '2026-03-29T21:17:26.195Z', '2026-03-29T21:17:26.195Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f675983a-eb06-46ce-b6b0-12f522146dd6', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What value does `useEffect` return?', '`useEffect` always returns `undefined`. The cleanup logic is provided by returning a function **from the setup callback**, not from `useEffect` itself.', 'easy', 'approved', '1c60ab7c-a3b6-4adf-87aa-1caac8a69e65', 181, '2026-03-29T21:17:32.706Z', '2026-03-29T21:17:32.706Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('6485935a-1ef5-468d-8c0e-2a36cd823f6c', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What happens when you call `useEffect` without providing a dependency array at all?', 'Omitting the dependency array entirely means React re-runs the Effect after **every single commit** (mount and every re-render). This is different from passing an empty `[]`, which runs the Effect only on mount.', 'easy', 'approved', '1c60ab7c-a3b6-4adf-87aa-1caac8a69e65', 182, '2026-03-29T21:17:32.713Z', '2026-03-29T21:17:32.713Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e004c75f-112a-4563-8cee-e93679ef8b04', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'You have an interval inside a `useEffect` that increments a `count` state variable. The Effect specifies `[count]` as its dependency. What problem does this cause, and what is the recommended fix?', 'Because `count` is a dependency, the Effect clears and restarts the interval every time `count` changes—which happens every second. The fix is to pass a **state updater function** (`c => c + 1`) to `setCount` instead of reading `count` directly, allowing the dependency array to be `[]`.

```jsx
useEffect(() => {
  const id = setInterval(() => {
    setCount(c => c + 1); // ✅ updater form
  }, 1000);
  return () => clearInterval(id);
}, []); // ✅ no dependency on count
```', 'medium', 'approved', '1c60ab7c-a3b6-4adf-87aa-1caac8a69e65', 183, '2026-03-29T21:17:32.717Z', '2026-03-29T21:17:32.717Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('370a937e-9076-404c-8ad4-74b17e1c87b1', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which of the following is a **caveat** of `useEffect` described in the React API reference?', '`useEffect` is a Hook and must be called **at the top level** of your component or your own custom Hooks—never inside loops or conditions. Other caveats include: it only runs on the client (not during server rendering), and in Strict Mode React runs an extra setup+cleanup cycle in development.', 'medium', 'approved', '1c60ab7c-a3b6-4adf-87aa-1caac8a69e65', 184, '2026-03-29T21:17:32.721Z', '2026-03-29T21:17:32.721Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0bc3eb98-f9bd-4ae5-8d11-8f39ee7aeed1', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'When should you replace `useEffect` with `useLayoutEffect`?', '`useLayoutEffect` fires synchronously **before** the browser paints the screen. You should use it when your Effect does something visual (e.g. measuring an element or positioning a tooltip) and using `useEffect` would cause a noticeable flicker because the browser paints before the Effect runs.', 'medium', 'approved', '1c60ab7c-a3b6-4adf-87aa-1caac8a69e65', 185, '2026-03-29T21:17:32.727Z', '2026-03-29T21:17:32.727Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a93b0a02-c0de-4afd-bae6-0f72c55f268c', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What does `useRef(0)` return?', '`useRef` returns a plain JavaScript object with a single property `current` initially set to the value you passed in. For `useRef(0)` that is `{ current: 0 }`. The same object is returned on every subsequent render.', 'easy', 'approved', '0ce4beb9-281a-44a4-8839-e8b810d30a83', 186, '2026-03-29T21:17:38.630Z', '2026-03-29T21:17:38.630Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('90eeffac-1d51-4494-b733-d0a1eb45a32e', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What happens when you change the `current` property of a ref?', 'Mutating `ref.current` does **not** trigger a re-render. React is unaware of the change because a ref is just a plain JavaScript object. This is the key distinction from state: use a ref when you need to store a value between renders without causing the component to re-render.', 'easy', 'approved', '0ce4beb9-281a-44a4-8839-e8b810d30a83', 187, '2026-03-29T21:17:38.635Z', '2026-03-29T21:17:38.635Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a1c00a11-ed84-446a-b033-6e2bf66ce720', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'In the stopwatch example from the React docs, why is the interval ID stored in a **ref** rather than in **state**?', 'The interval ID is only needed by the event handlers (`handleStart` and `handleStop`) to call `clearInterval`. It is never used to calculate what is displayed on screen, so storing it in state would cause unnecessary re-renders. A ref is the right tool for values that must persist across renders but do not affect the visual output.', 'medium', 'approved', '0ce4beb9-281a-44a4-8839-e8b810d30a83', 188, '2026-03-29T21:17:38.637Z', '2026-03-29T21:17:38.637Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b5a10bca-8984-4615-912f-61406e6e77f4', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which of the following best describes a situation where you should use a **ref** instead of **state**?', 'Refs are the right choice when you need to store a value that persists between renders but whose changes do **not** need to trigger a re-render or update the UI. Common examples are timeout IDs, interval IDs, and DOM element references.', 'medium', 'approved', '0ce4beb9-281a-44a4-8839-e8b810d30a83', 189, '2026-03-29T21:17:38.640Z', '2026-03-29T21:17:38.640Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c12631ea-171f-4794-a7dc-4a82d552cce2', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'According to React best practices, when should you **not** read or write `ref.current`?', 'You should never read or write `ref.current` **during rendering**. Doing so makes the component''s behaviour unpredictable because React cannot track ref changes and cannot ensure a consistent output. The safe places to access refs are event handlers and Effects.', 'medium', 'approved', '0ce4beb9-281a-44a4-8839-e8b810d30a83', 190, '2026-03-29T21:17:38.643Z', '2026-03-29T21:17:38.643Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1e3f5432-79d4-4495-82d5-a6ee0bd3e3d7', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is the correct sequence to get a reference to a DOM node using `useRef`?', 'The three-step pattern is: (1) declare `const myRef = useRef(null)`, (2) pass it as the `ref` attribute to the JSX element (`<div ref={myRef}>`), and (3) access the DOM node via `myRef.current` inside an event handler or Effect after React has committed the DOM.', 'easy', 'approved', '8fd4f3ff-a6a3-4802-8f17-232933629805', 191, '2026-03-29T21:17:44.725Z', '2026-03-29T21:17:44.725Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('33cd430b-5b71-43a1-8305-12520be587cd', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'When does React set `ref.current` to the actual DOM node?', 'React sets `ref.current` during the **commit phase**, after the DOM has been updated. Before updating the DOM it sets affected `ref.current` values to `null`, then immediately after updating the DOM it sets them to the corresponding DOM nodes. This is why you should not access refs during rendering.', 'medium', 'approved', '8fd4f3ff-a6a3-4802-8f17-232933629805', 192, '2026-03-29T21:17:44.732Z', '2026-03-29T21:17:44.732Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c1ffd750-9bd2-431d-a088-7d2195c1e4ed', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is the recommended best practice when using refs to interact with DOM nodes managed by React?', 'Refs are an escape hatch for **non-destructive** actions: focusing an element, scrolling to it, or measuring it. You should avoid modifying, adding to, or removing children from DOM nodes that React manages, because React has its own view of the DOM and manual changes can cause inconsistencies or crashes.', 'medium', 'approved', '8fd4f3ff-a6a3-4802-8f17-232933629805', 193, '2026-03-29T21:17:44.734Z', '2026-03-29T21:17:44.734Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1b79b024-86fc-4c0c-81c5-29f366d45d36', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'How do you pass a ref from a parent component to a child component''s DOM node in React (current API)?', 'In current React you pass a ref like any other prop. The child component accepts `ref` in its props and forwards it to the underlying built-in element (`<input ref={ref} />`). There is no need for `forwardRef` in the modern API.

```jsx
function MyInput({ ref }) {
  return <input ref={ref} />;
}

function MyForm() {
  const inputRef = useRef(null);
  return <MyInput ref={inputRef} />;
}
```', 'medium', 'approved', '8fd4f3ff-a6a3-4802-8f17-232933629805', 194, '2026-03-29T21:17:44.737Z', '2026-03-29T21:17:44.737Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('89efb6ae-27fb-47c4-85dc-415252b81383', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What happens if you use a ref to forcefully call `.remove()` on a DOM element that React is also managing, and then try to show it again with `setState`?', 'Bypassing React''s DOM management by calling `.remove()` directly leaves React with an inconsistent picture of the DOM. When React then tries to re-insert the element (in response to the state change), it no longer matches what is in the DOM, which causes a crash. You should always remove React-managed elements through state or conditional rendering, not through direct DOM mutations.', 'medium', 'approved', '8fd4f3ff-a6a3-4802-8f17-232933629805', 195, '2026-03-29T21:17:44.738Z', '2026-03-29T21:17:44.738Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('838daa06-390d-42d0-9f20-b2e69d132867', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is the initial value of `ref.current` after calling `useRef(null)`?', '`useRef(null)` initialises the ref object with `{ current: null }`. The `initialValue` argument is only used for the very first render; on subsequent renders `useRef` returns the same object without re-computing the initial value.', 'easy', 'approved', '8a960c56-9b24-4f47-8ea3-ad6d135fbc00', 196, '2026-03-29T21:17:50.646Z', '2026-03-29T21:17:50.646Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('94f4b7e4-b7f2-4e14-90ad-5f1eff0cf59e', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'You display `{ref.current}` directly in JSX and increment `ref.current` in a click handler. What will the user see after clicking?', 'Because mutating `ref.current` does **not** trigger a re-render, the JSX output is never recalculated and the displayed number stays the same. If you need the UI to reflect the value, use `useState` instead.', 'easy', 'approved', '8a960c56-9b24-4f47-8ea3-ad6d135fbc00', 197, '2026-03-29T21:17:50.651Z', '2026-03-29T21:17:50.651Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('077b0e0b-0842-4de5-88ae-d779f950185a', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'According to the `useRef` API reference, which of the following is the **one acceptable exception** to the rule of not writing `ref.current` during rendering?', 'The docs mention a narrow exception: lazy initialisation of a ref that is too expensive to recreate on every render. You may write `ref.current` once during rendering inside a guard such as `if (ref.current === null) { ref.current = new ExpensiveObject(); }`. This is predictable because the condition only executes when the ref is still uninitialised.', 'medium', 'approved', '8a960c56-9b24-4f47-8ea3-ad6d135fbc00', 198, '2026-03-29T21:17:50.657Z', '2026-03-29T21:17:50.657Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a86502bd-9048-42c9-b640-9567a13b84fb', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What does React do to `ref.current` when the DOM node it points to is removed from the screen?', 'When a DOM node is removed from the screen, React sets `ref.current` back to `null`. This is the reverse of what React does when it mounts the node (setting `ref.current` to the DOM node). Always guard against `null` before accessing properties on a DOM ref.', 'easy', 'approved', '8a960c56-9b24-4f47-8ea3-ad6d135fbc00', 199, '2026-03-29T21:17:50.661Z', '2026-03-29T21:17:50.661Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a1ac5885-501c-4206-b2d4-7ad2898416dc', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'You try to pass a `ref` to your own component `<MyInput ref={inputRef} />` but get a `TypeError: Cannot read properties of null` error. What is the most likely cause and fix?', 'By default, custom components do not expose their internal DOM nodes. The fix is to accept `ref` as a prop inside `MyInput` and forward it to the underlying built-in element (`<input ref={ref} />`). React will then set `inputRef.current` to the `<input>` DOM node.

```jsx
function MyInput({ value, onChange, ref }) {
  return <input value={value} onChange={onChange} ref={ref} />;
}
```', 'medium', 'approved', '8a960c56-9b24-4f47-8ea3-ad6d135fbc00', 200, '2026-03-29T21:17:50.665Z', '2026-03-29T21:17:50.665Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a4a79307-e768-4c02-8791-745a96f219f8', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What does `useSearchParams()` return?', '`useSearchParams` returns a tuple. The first element is a `URLSearchParams` instance representing the current URL''s query string, and the second is a setter function that updates the search params and triggers a navigation.

Example:

```jsx
import { useSearchParams } from ''react-router'';

function Filters() {
  const [searchParams, setSearchParams] = useSearchParams();
  const tab = searchParams.get(''tab''); // read a param
}
```', 'easy', 'approved', '6ac5e5fd-1341-4b9a-bc39-21b4c009fa89', 201, '2026-03-29T22:38:50.715Z', '2026-03-29T22:38:50.715Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('66e086e9-c1f0-4042-95f9-f94240abecd1', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What side effect does calling `setSearchParams(...)` trigger?', 'Calling `setSearchParams` does not just update in-memory state — it causes a navigation to the new URL with the updated query string, adding a new entry to the browser''s History stack.

Example:

```jsx
const [, setSearchParams] = useSearchParams();

// This navigates to ?tab=1
setSearchParams({ tab: ''1'' });
```', 'easy', 'approved', '6ac5e5fd-1341-4b9a-bc39-21b4c009fa89', 202, '2026-03-29T22:38:50.721Z', '2026-03-29T22:38:50.721Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('aa0a7e05-49f0-448a-9fcf-d59247b65be3', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which of the following is NOT a valid argument format for `setSearchParams`?', '`setSearchParams` accepts a string, a plain object (optionally with array values for multi-value keys), an array of `[key, value]` tuples, a `URLSearchParams` instance, or a function callback. It does not accept a `FormData` object.

Valid examples:

```jsx
setSearchParams(''?tab=1'');                     // string
setSearchParams({ tab: ''1'' });                 // object
setSearchParams({ brand: [''nike'', ''reebok''] }); // multi-value
setSearchParams([[''tab'', ''1'']]);               // tuples
setSearchParams(new URLSearchParams(''?tab=1'')); // URLSearchParams
setSearchParams(prev => { prev.set(''tab'', ''2''); return prev; }); // callback
```', 'medium', 'approved', '6ac5e5fd-1341-4b9a-bc39-21b4c009fa89', 203, '2026-03-29T22:38:50.724Z', '2026-03-29T22:38:50.724Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3aae7dc2-6d94-4423-a9a6-f0ee9c1ab993', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Is `searchParams` (the first element of the `useSearchParams` tuple) safe to use as a `useEffect` dependency?', 'Yes — the React Router docs state that `searchParams` is a stable reference, meaning React''s dependency comparison will reliably detect changes. However, you should never mutate it directly without calling `setSearchParams`, or its values will silently drift from the URL.

Example:

```jsx
const [searchParams] = useSearchParams();

useEffect(() => {
  console.log(searchParams.get(''tab''));
}, [searchParams]); // safe to include
```', 'medium', 'approved', '6ac5e5fd-1341-4b9a-bc39-21b4c009fa89', 204, '2026-03-29T22:38:50.725Z', '2026-03-29T22:38:50.725Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('13cb029c-669e-4b83-8468-a4fc6ef8c409', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'You call `setSearchParams` twice in the same event handler without using the function-callback form. What issue can this cause?', 'Unlike React''s `setState`, the function-callback form of `setSearchParams` does not implement queueing. Multiple synchronous calls to `setSearchParams` will not build on the result of the previous call — the last call wins. If you need to chain updates, use a single `setSearchParams` call or manage the state manually with `useState`.

Example:

```jsx
// Problematic — second call does NOT see the first call''s changes
setSearchParams({ tab: ''1'' });
setSearchParams({ sort: ''asc'' }); // overwrites tab=1

// Correct approach — one call with both params
setSearchParams({ tab: ''1'', sort: ''asc'' });
```', 'hard', 'approved', '6ac5e5fd-1341-4b9a-bc39-21b4c009fa89', 205, '2026-03-29T22:38:50.728Z', '2026-03-29T22:38:50.728Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('bf405df4-3ff8-433c-81a1-bf76d217cada', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is the primary benefit of client-side routing compared to traditional browser navigation?', 'Client-side routing lets the app update the URL from a link click without making a full document request to the server. Instead of re-downloading HTML, CSS, and JavaScript, the app immediately renders new UI and fetches only the data it needs with `fetch`, resulting in faster page transitions.

Example:

```jsx
import { createBrowserRouter, RouterProvider, Link } from ''react-router-dom'';

const router = createBrowserRouter([
  { path: ''/'', element: <Home /> },
  { path: ''about'', element: <About /> },
]);

<RouterProvider router={router} />
```', 'easy', 'approved', '83bd7be1-46d9-433b-ade7-62e80a66b20a', 206, '2026-03-29T22:41:23.273Z', '2026-03-29T22:41:23.273Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e2088732-234e-4904-b5e0-fb9bc8b1b41e', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'In React Router v6, which component is used inside a parent route''s element to render matched child routes?', '`<Outlet />` is the component rendered by the parent route element to display whichever child route currently matches the URL. Without it, nested routes would have nowhere to appear in the UI.

Example:

```jsx
function Root() {
  return (
    <div>
      <Sidebar />
      <Outlet /> {/* renders the matching child route */}
    </div>
  );
}
```', 'easy', 'approved', '83bd7be1-46d9-433b-ade7-62e80a66b20a', 207, '2026-03-29T22:41:23.276Z', '2026-03-29T22:41:23.276Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('68740d46-f64b-4719-9e4c-376de0bd5461', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Given the route path `"projects/:projectId/tasks/:taskId"` and the current URL `/projects/abc/tasks/3`, what value does `params.projectId` hold inside a component using `useParams()`?', 'Dynamic segments prefixed with `:` are parsed from the URL and provided as string values in the `params` object. For the URL `/projects/abc/tasks/3`, `params.projectId` is `"abc"` and `params.taskId` is `"3"`.

Example:

```jsx
function Task() {
  const params = useParams();
  params.projectId; // "abc"
  params.taskId;    // "3"
}
```', 'easy', 'approved', '83bd7be1-46d9-433b-ade7-62e80a66b20a', 208, '2026-03-29T22:41:23.281Z', '2026-03-29T22:41:23.281Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('83070554-8871-4b79-9649-401b46b3d643', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'React Router uses ranked route matching. Given the two routes `"/teams/:teamId"` and `"/teams/new"`, which route matches the URL `/teams/new`?', 'React Router ranks routes by specificity. A static segment like `new` is ranked higher than a dynamic segment like `:teamId`, so `/teams/new` will always be matched by the static route `"/teams/new"` even though `"new"` could technically satisfy `:teamId`. This means you don''t have to worry about route ordering.

Example:

```jsx
// React Router picks /teams/new over /teams/:teamId
<Route path="/teams/new" element={<NewTeam />} />
<Route path="/teams/:teamId" element={<Team />} />
```', 'easy', 'approved', '83bd7be1-46d9-433b-ade7-62e80a66b20a', 209, '2026-03-29T22:41:23.285Z', '2026-03-29T22:41:23.285Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a9be2a1c-6357-40da-a172-ddc7b638511c', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'When a route throws an error during rendering or data loading and the route itself has no `errorElement`, what happens?', 'React Router automatically catches errors thrown during rendering, loading, or updating data. If the route where the error occurred has no `errorElement`, the error bubbles up to the nearest ancestor route that does define an `errorElement`, which is then rendered in place of the normal element.

Example:

```jsx
<Route path="/" element={<Layout />} errorElement={<GlobalError />}>
  {/* An error in <Login /> bubbles to the parent''s errorElement */}
  <Route path="login" element={<Login />} />
</Route>
```', 'medium', 'approved', '83bd7be1-46d9-433b-ade7-62e80a66b20a', 210, '2026-03-29T22:41:23.288Z', '2026-03-29T22:41:23.288Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('21ef3e94-f524-499e-b632-d55aca723312', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'In React Router v7 declarative mode, which pair of components wraps your route configuration?', 'In declarative mode, routes are configured by rendering `<BrowserRouter>` at the top level and `<Routes>` with nested `<Route>` elements inside it. `<Routes>` replaces the old `<Switch>` from v5 and renders only the best-matching route.

Example:

```jsx
import { BrowserRouter, Routes, Route } from ''react-router'';

ReactDOM.createRoot(root).render(
  <BrowserRouter>
    <Routes>
      <Route path="/" element={<App />} />
    </Routes>
  </BrowserRouter>
);
```', 'easy', 'approved', '7442a921-4976-4bfd-8106-a88f97a8fed5', 211, '2026-03-29T22:41:28.732Z', '2026-03-29T22:41:28.732Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('6aef5644-0e28-4c33-af6d-ad8a22eb3e88', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'When using nested routes in React Router v7, how are child routes rendered inside their parent component?', '`<Outlet />` is placed inside the parent component''s JSX to mark where the matched child route element should be rendered. Without `<Outlet />`, child routes match the URL but their elements are never displayed.

Example:

```jsx
import { Outlet } from ''react-router'';

export default function Dashboard() {
  return (
    <div>
      <h1>Dashboard</h1>
      <Outlet /> {/* renders <Home /> or <Settings /> */}
    </div>
  );
}
```', 'easy', 'approved', '7442a921-4976-4bfd-8106-a88f97a8fed5', 212, '2026-03-29T22:41:28.737Z', '2026-03-29T22:41:28.737Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('abbf85cc-d401-47e0-8085-22f4f86257ec', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What prop is used on a `<Route>` to mark it as the default child that renders at the parent''s URL?', 'The `index` prop designates a route as the default child route. It renders into the parent''s `<Outlet />` at the parent''s exact URL, acting like a default route. Note that index routes cannot have children of their own.

Example:

```jsx
<Routes>
  <Route path="/" element={<Root />}>
    <Route index element={<Home />} /> {/* renders at "/" */}
    <Route path="about" element={<About />} />
  </Route>
</Routes>
```', 'easy', 'approved', '7442a921-4976-4bfd-8106-a88f97a8fed5', 213, '2026-03-29T22:41:28.741Z', '2026-03-29T22:41:28.741Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('641f7a35-0cd0-4cca-863a-aab9e299d9bf', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'How do you make a URL segment optional in a React Router v7 declarative route path?', 'Appending `?` to a segment makes it optional. The route will match both with and without that segment present in the URL.

Example:

```jsx
// matches "/categories" and "/en/categories"
<Route path=":lang?/categories" element={<Categories />} />

// matches "/users/123" and "/users/123/edit"
<Route path="users/:userId/edit?" element={<User />} />
```', 'medium', 'approved', '7442a921-4976-4bfd-8106-a88f97a8fed5', 214, '2026-03-29T22:41:28.745Z', '2026-03-29T22:41:28.745Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('96f6e82f-2414-410b-b6a5-daa116c22075', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'In React Router v7, what does a splat (`/*`) at the end of a route path match, and how is the captured value accessed?', 'A splat (`/*`) matches any characters after the `/`, including additional slashes. The captured portion is available in the `params` object under the key `"*"`. You can destructure it with a renamed variable for clarity.

Example:

```jsx
<Route path="files/*" element={<File />} />

// Inside the component:
let params = useParams();
let catchall = params[''*''];

// Or via destructuring:
let { ''*'': splat } = useParams();
```', 'medium', 'approved', '7442a921-4976-4bfd-8106-a88f97a8fed5', 215, '2026-03-29T22:41:28.748Z', '2026-03-29T22:41:28.748Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('182c2270-dbef-4166-9134-6183f036f97a', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which of the following is a valid value for the `to` prop of React Router''s `<Link>` component?', 'The `to` prop accepts either a string path or a partial `Path` object with `pathname`, `search`, and `hash` fields. Both formats are valid.

Example:

```jsx
// String form
<Link to="/dashboard">Dashboard</Link>

// Object form
<Link
  to={{
    pathname: ''/some/path'',
    search: ''?query=string'',
    hash: ''#hash'',
  }}
/>
```', 'easy', 'approved', 'e02ee0ae-20ff-44b2-9986-4b661803170a', 216, '2026-03-29T22:41:34.221Z', '2026-03-29T22:41:34.221Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b57d4898-8046-4d51-82f9-25d37def6aea', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What does the `replace` prop on `<Link>` do to the browser''s History stack?', 'When `replace` is set, clicking the link replaces the current entry in the History stack instead of pushing a new entry. This is useful when you don''t want the user to be able to navigate back to the previous page, similar to a server-side redirect.

Example:

```
# Normal link click (A -> B -> C):
A -> B -> C

# With replace prop (A -> B, then link to C):
A -> C   (B is replaced, no going back)
```', 'easy', 'approved', 'e02ee0ae-20ff-44b2-9986-4b661803170a', 217, '2026-03-29T22:41:34.229Z', '2026-03-29T22:41:34.229Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('691bc1e7-f41f-4ccb-99ef-e1f5c1c67b08', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which `<Link>` prop causes the browser to handle the navigation as a full document request rather than client-side routing?', '`reloadDocument` tells React Router to skip client-side routing and let the browser handle the transition as a normal anchor click (i.e., a full page load). This is useful for links that must cause a server-side navigation, like a logout endpoint.

Example:

```jsx
<Link to="/logout" reloadDocument>
  Log out
</Link>
```', 'easy', 'approved', 'e02ee0ae-20ff-44b2-9986-4b661803170a', 218, '2026-03-29T22:41:34.231Z', '2026-03-29T22:41:34.231Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('51f31103-b80f-4678-a5e8-33bfa33f519e', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'When you add `state={{ some: ''value'' }}` to a `<Link>`, how can you read that value in the destination component?', 'State passed through `<Link state={...}>` is stored in `history.state` and is accessible via the `location` object returned by `useLocation()`. It is client-side only and not available during server-side rendering.

Example:

```jsx
// Sending state
<Link to="/somewhere" state={{ from: ''dashboard'' }} />

// Receiving state
function SomeComp() {
  const location = useLocation();
  console.log(location.state); // { from: ''dashboard'' }
}
```', 'medium', 'approved', 'e02ee0ae-20ff-44b2-9986-4b661803170a', 219, '2026-03-29T22:41:34.237Z', '2026-03-29T22:41:34.237Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b99e8a38-fbda-4876-892f-b6521bd14816', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which `prefetch` value on `<Link>` triggers data and module prefetching when the user hovers or focuses the link?', 'The `prefetch="intent"` value starts prefetching when the user signals intent to navigate by hovering over or focusing the link, balancing performance with resource usage. By default (`prefetch="none"`), no prefetching occurs.

Example:

```jsx
<Link to="/dashboard" prefetch="intent">
  Dashboard
</Link>
```

Other values: `"render"` (prefetch when the link renders) and `"viewport"` (prefetch when the link scrolls into view).', 'medium', 'approved', 'e02ee0ae-20ff-44b2-9986-4b661803170a', 220, '2026-03-29T22:41:34.243Z', '2026-03-29T22:41:34.243Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('992a57db-3124-4d1e-8861-a2bf18840740', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What does the `useNavigate` hook return?', '`useNavigate` returns a `navigate` function that lets you trigger programmatic navigation in response to user interactions or side effects. Its signature is `navigate(to, options?)` or `navigate(delta)` where `delta` is a number.

Example:

```jsx
import { useNavigate } from ''react-router'';

function SomeComponent() {
  const navigate = useNavigate();
  return (
    <button onClick={() => navigate(''/home'')}>Go Home</button>
  );
}
```', 'easy', 'approved', '01ed6e25-50ef-4c5f-ad30-2493f5cccef7', 221, '2026-03-29T22:41:39.701Z', '2026-03-29T22:41:39.701Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4e804134-bf0c-4d17-8f1f-f6882c3b295d', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Which call using `useNavigate` moves the user one step backward in the browser''s History stack?', 'Passing a number (delta) to the `navigate` function moves the user through the history stack. `navigate(-1)` goes back one entry (like the browser back button), while `navigate(1)` goes forward.

Example:

```jsx
const navigate = useNavigate();

// Go back — often used to close modals
navigate(-1);

// Go forward — often used in multi-step wizards
navigate(1);
```', 'easy', 'approved', '01ed6e25-50ef-4c5f-ad30-2493f5cccef7', 222, '2026-03-29T22:41:39.707Z', '2026-03-29T22:41:39.707Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c145fdad-3ab9-44c0-81f4-72fbe5f7a9fe', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'How do you navigate to a new route while replacing the current History entry instead of adding a new one?', 'Pass `{ replace: true }` as the second argument to the `navigate` function. This removes the current entry from the History stack and inserts the new location, similar to how a server-side redirect works.

Example:

```jsx
const navigate = useNavigate();

// After form submission, redirect without a back-entry
navigate(''/dashboard'', { replace: true });
```', 'easy', 'approved', '01ed6e25-50ef-4c5f-ad30-2493f5cccef7', 223, '2026-03-29T22:41:39.711Z', '2026-03-29T22:41:39.711Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1e153c6e-1463-4a23-8022-b8fea6a3f11c', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'According to the React Router docs, when is it preferable to use `redirect` from a loader or action instead of `useNavigate`?', 'The React Router docs explicitly recommend using `redirect` inside loaders and actions for redirecting logic because it is part of the server-side-friendly data flow. `useNavigate` is intended for programmatic navigation triggered by user interactions or React effects in components.', 'medium', 'approved', '01ed6e25-50ef-4c5f-ad30-2493f5cccef7', 224, '2026-03-29T22:41:39.712Z', '2026-03-29T22:41:39.712Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ab1b0e2c-a547-4036-9a76-5073dbb584c2', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'You call `navigate` with an object `{ pathname: ''/profile'', search: ''?tab=photos'', hash: ''#top'', state: { from: ''menu'' } }`. Where can the destination component read the `state` value?', 'State attached to a navigation call is stored in `history.state` and is accessible via `useLocation().state` in the destination component. It is client-side only and is not available during SSR.

Example:

```jsx
// Navigating with state
navigate({ pathname: ''/profile'', state: { from: ''menu'' } });

// Reading state in the destination
function Profile() {
  const location = useLocation();
  console.log(location.state); // { from: ''menu'' }
}
```', 'medium', 'approved', '01ed6e25-50ef-4c5f-ad30-2493f5cccef7', 225, '2026-03-29T22:41:39.715Z', '2026-03-29T22:41:39.715Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f6a9d9cd-1dfa-4dd4-82c5-aa14b55bb924', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What does `useParams()` return?', '`useParams()` returns a read-only object of key/value pairs where each key is a dynamic segment name from the matched route pattern, and each value is the corresponding string from the current URL.

Example:

```jsx
// Route: /posts/:postId
// URL: /posts/123

import { useParams } from ''react-router'';

function Post() {
  const params = useParams();
  params.postId; // "123"
}
```', 'easy', 'approved', '03315b97-2b25-40c7-a5e8-21c6a93daf66', 226, '2026-03-29T22:41:44.849Z', '2026-03-29T22:41:44.849Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('99a48610-2e26-4087-92f4-a52d791e22b8', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Given the route path `/posts/:postId` matched by the URL `/posts/123`, what is the value of `params.postId`?', 'Dynamic segment values are always strings. For the route `/posts/:postId` matched by `/posts/123`, `params.postId` is the string `"123"`, not the number `123`.

Example:

```jsx
function Post() {
  const params = useParams();
  console.log(params.postId); // "123" (a string)
  console.log(typeof params.postId); // "string"
}
```', 'easy', 'approved', '03315b97-2b25-40c7-a5e8-21c6a93daf66', 227, '2026-03-29T22:41:44.855Z', '2026-03-29T22:41:44.855Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ad9e6539-56cd-496a-bea4-2cfa55ef9574', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Do child routes have access to the dynamic params defined by their parent routes when using `useParams()`?', 'Yes — child routes inherit all params from their parent routes. A `useParams()` call inside a child component will include every dynamic segment from the entire matched route hierarchy, not just its own segment.

Example:

```jsx
// Route hierarchy:
// /posts/:postId/comments/:commentId

function Comment() {
  const params = useParams();
  params.postId;    // from parent route
  params.commentId; // from this route
}
```', 'easy', 'approved', '03315b97-2b25-40c7-a5e8-21c6a93daf66', 228, '2026-03-29T22:41:44.860Z', '2026-03-29T22:41:44.860Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d7a7b669-1651-465f-b89e-d87dfb099e70', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'For the catchall route path `"/files/*"`, how do you access the matched portion of the URL inside a component?', 'Catchall (splat) params are stored under the key `"*"` in the params object. You can access it with `params["*"]` or destructure it with a renamed variable.

Example:

```jsx
<Route path="files/*" element={<File />} />

export default function File() {
  const params = useParams();
  const catchall = params[''*''];

  // Or via destructuring with a rename:
  const { ''*'': splat } = useParams();
}
```', 'medium', 'approved', '03315b97-2b25-40c7-a5e8-21c6a93daf66', 229, '2026-03-29T22:41:44.863Z', '2026-03-29T22:41:44.863Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7a4ca653-fd28-416c-bc21-0b0b8fd53a16', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Given the route path `"/posts/:postId/comments/:commentId"`, which statement about the returned `params` object is correct?', 'Multiple dynamic segments in a single route path are all parsed and included in the same `params` object returned by `useParams()`. Both `params.postId` and `params.commentId` are available simultaneously.

Example:

```jsx
// URL: /posts/42/comments/7
export default function Post() {
  const params = useParams();
  return (
    <h1>Post: {params.postId}, Comment: {params.commentId}</h1>
    // => Post: 42, Comment: 7
  );
}
```', 'medium', 'approved', '03315b97-2b25-40c7-a5e8-21c6a93daf66', 230, '2026-03-29T22:41:44.865Z', '2026-03-29T22:41:44.865Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1cf757ca-4edc-405e-80e5-39a46e77acff', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What is the correct order of the five steps described in "Thinking in React"?', 'The article walks through a fixed sequence: (1) Break the UI into a component hierarchy, (2) Build a static version, (3) Find the minimal but complete representation of UI state, (4) Identify where your state should live, (5) Add inverse data flow. Each step builds directly on the previous one.', 'easy', 'approved', 'f25927b0-db55-41bb-aa2f-5b2099e0aced', 231, '2026-03-29T22:47:24.009Z', '2026-03-29T22:47:24.009Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('5a25e1b2-7f08-4ddb-bcf6-58c27dcd9e3f', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'When building a static version of your React app (Step 2 of "Thinking in React"), which statement is correct?', 'In a static version you pass all data via props only. State is reserved for interactivity — data that changes over time. Since a static app has no interactivity, there is no need for state yet.', 'easy', 'approved', 'f25927b0-db55-41bb-aa2f-5b2099e0aced', 232, '2026-03-29T22:47:24.013Z', '2026-03-29T22:47:24.013Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('50367fe5-13b2-488b-8cb7-22f85df0fc12', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'In the filterable product-table example from "Thinking in React", why is the filtered list of products **not** considered state?', 'A value is state only if it cannot be derived from other existing state or props. The filtered list can always be computed by applying the search text and checkbox state to the original product list, so storing it separately would violate the DRY principle.', 'medium', 'approved', 'f25927b0-db55-41bb-aa2f-5b2099e0aced', 233, '2026-03-29T22:47:24.015Z', '2026-03-29T22:47:24.015Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('906fcd9f-7746-4e8e-9639-3fc8628b9f15', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'According to "Thinking in React", when two sibling components both need the same piece of state, where should that state live?', 'React uses one-way data flow. When multiple components depend on the same state, the state is **lifted up** to their closest common ancestor so it can be passed down as props to each sibling.

Example: `SearchBar` and `ProductTable` both need `filterText`, so the state lives in `FilterableProductTable`, their closest common parent.', 'medium', 'approved', 'f25927b0-db55-41bb-aa2f-5b2099e0aced', 234, '2026-03-29T22:47:24.016Z', '2026-03-29T22:47:24.016Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c446b73d-4321-4197-9ec4-86a57c3cf055', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'What problem does "inverse data flow" (Step 5 of "Thinking in React") solve, and how is it implemented?', 'React''s one-way data flow means state only flows downward via props. When a child component (e.g. `SearchBar`) needs to update state owned by an ancestor (`FilterableProductTable`), the ancestor passes its state-setter functions as props. The child calls those callbacks in its event handlers, which triggers a re-render with the new state.

Example:
```jsx
<SearchBar
  filterText={filterText}
  onFilterTextChange={setFilterText}
/>
```', 'medium', 'approved', 'f25927b0-db55-41bb-aa2f-5b2099e0aced', 235, '2026-03-29T22:47:24.018Z', '2026-03-29T22:47:24.018Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e3f1697f-5917-4431-b8d1-36fa22cc95cb', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'JavaScript is described as the third layer of standard web technologies. Which of the following correctly identifies all three layers?', 'The three standard layers of web technology are HTML (structure/content), CSS (styling), and JavaScript (dynamic behavior). JavaScript builds on top of HTML and CSS to add interactivity.', 'easy', 'approved', 'cefcdb9d-7218-4ddd-8072-79d37cbafda1', 0, '2026-03-30T05:49:33.591Z', '2026-03-30T05:49:33.591Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d49f0c2d-4731-4342-89c7-a31566bdd896', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which technique do most modern JavaScript engines use to improve performance?', 'Modern JavaScript interpreters use just-in-time (JIT) compiling to improve performance. The source code gets compiled into a faster binary format while the script is being used, so it can run as quickly as possible. Despite this, JavaScript is still considered an interpreted language because compilation happens at run time rather than ahead of time.', 'easy', 'approved', 'cefcdb9d-7218-4ddd-8072-79d37cbafda1', 1, '2026-03-30T05:49:33.593Z', '2026-03-30T21:28:04.137Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('296a243d-f5ba-4412-a17d-0e3543e61c6b', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'A page loads `app.js` with `<script type="module" src="app.js"></script>`. What does `type="module"` tell the browser to do with that file?', '`type="module"` tells the browser to treat the file as an ES module. That enables module features such as `import` and `export`, gives the module its own scope, and defers execution by default so the script runs after HTML parsing instead of immediately.

Example:

```js
import { init } from "./ui.js";

init();
```

That import works because the browser is loading the file as a module.', 'medium', 'approved', 'cefcdb9d-7218-4ddd-8072-79d37cbafda1', 2, '2026-03-30T05:49:33.594Z', '2026-03-30T21:28:04.145Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9449553c-ca37-4d15-a1ec-df7aa19d146b', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Why is using inline JavaScript handlers like `onclick="createParagraph()"` considered bad practice?', 'Inline JavaScript handlers pollute HTML with JavaScript and are inefficient because you must add the `onclick` attribute to every element you want the script to apply to. Using `addEventListener` is the recommended approach.', 'easy', 'approved', 'cefcdb9d-7218-4ddd-8072-79d37cbafda1', 3, '2026-03-30T05:49:33.595Z', '2026-03-30T05:49:33.595Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('5f1196d0-4023-46ed-af8f-49c9cad02275', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'In browser security terms, what does it mean that each browser tab has its own "execution environment"?', 'Each browser tab runs code in its own separate execution environment. This means code in one tab generally cannot directly access or affect code in another tab or website. This isolation is a security measure to prevent malicious scripts from stealing data from other sites.', 'medium', 'approved', 'cefcdb9d-7218-4ddd-8072-79d37cbafda1', 4, '2026-03-30T05:49:33.596Z', '2026-03-30T05:49:33.596Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8c72bfbf-6515-4a2e-9b7d-a5e5ddb543b3', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which JavaScript engine is used in Chrome, Opera, and Edge?', 'V8 is the JavaScript engine used in Chrome, Opera, and Edge. SpiderMonkey is used in Firefox, and other engines like Chakra (IE) and JavaScriptCore (Safari) power different browsers.', 'easy', 'approved', 'f63a18e3-f97f-4675-9b5c-32cb5d2668a1', 5, '2026-03-30T05:49:46.653Z', '2026-03-30T05:49:46.653Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d89e4dd7-d1bc-4db0-a50d-aa7a3857b1a2', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What was JavaScript originally called before it was renamed?', 'JavaScript was initially called "LiveScript". It was renamed to JavaScript because Java was very popular at the time, and positioning it as a "younger brother" of Java was seen as beneficial. Despite the name, JavaScript has no real relation to Java today.', 'easy', 'approved', 'f63a18e3-f97f-4675-9b5c-32cb5d2668a1', 6, '2026-03-30T05:49:46.655Z', '2026-03-30T05:49:46.655Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('79c90e7c-a862-49d1-893e-5457aa3d90b3', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which of the following is something that in-browser JavaScript **cannot** do?', 'In-browser JavaScript cannot read or write arbitrary files on the hard disk, copy them, or execute programs. It has no direct access to OS functions. This limitation protects the user''s safety. JavaScript can add HTML, react to user actions, send network requests, and use local storage.', 'medium', 'approved', 'f63a18e3-f97f-4675-9b5c-32cb5d2668a1', 7, '2026-03-30T05:49:46.656Z', '2026-03-30T05:49:46.656Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('974610d3-06a6-4c52-be0d-f1f70415792e', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the name of JavaScript''s own language specification?', 'JavaScript''s language specification is called ECMAScript. As JavaScript evolved, it became a fully independent language with its own specification, and it now has no relation to Java.', 'easy', 'approved', 'f63a18e3-f97f-4675-9b5c-32cb5d2668a1', 8, '2026-03-30T05:49:46.657Z', '2026-03-30T05:49:46.657Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0ce15032-1160-4b40-a051-016d5c42864d', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'A team adopts TypeScript in a large JavaScript codebase. What is the main benefit TypeScript adds?', 'TypeScript adds optional static types and compile-time checking on top of JavaScript. That helps catch mistakes earlier in development and improves tooling such as autocomplete, navigation, and safer refactoring. TypeScript source is then transpiled to plain JavaScript before it runs.', 'medium', 'approved', 'f63a18e3-f97f-4675-9b5c-32cb5d2668a1', 9, '2026-03-30T05:49:46.658Z', '2026-03-30T23:52:03.794Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3797a31e-75a3-4879-8daa-e099319e7c8a', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which HTML tag is used to insert JavaScript code into a web page?', 'The `<script>` tag is used to add JavaScript code to an HTML page. JavaScript programs can be inserted almost anywhere into an HTML document using this tag, and the code is automatically executed when the browser processes it.', 'easy', 'approved', 'b41d7e00-00de-4c87-98f2-a420b55ebbba', 10, '2026-03-30T05:49:59.786Z', '2026-03-30T05:49:59.786Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('091cf9f8-77ea-4958-a545-9fe6e46511a1', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What happens when a `<script>` tag has both a `src` attribute and code inside it?', 'A single `<script>` tag cannot have both the `src` attribute and code inside. If `src` is set, the inline script content is ignored. To use both, you must split them into two separate `<script>` tags.', 'medium', 'approved', 'b41d7e00-00de-4c87-98f2-a420b55ebbba', 11, '2026-03-30T05:49:59.788Z', '2026-03-30T05:49:59.788Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9363089f-e8cd-4aec-82c9-40af7eb9bf35', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the main benefit of placing JavaScript in a separate external file instead of inline in the HTML?', 'When JavaScript is in a separate file, the browser can download it and store it in its cache. Other pages that reference the same script will take it from the cache instead of downloading it again. This reduces network traffic and makes pages load faster. The HTML also becomes easier to read.', 'easy', 'approved', 'b41d7e00-00de-4c87-98f2-a420b55ebbba', 12, '2026-03-30T05:49:59.789Z', '2026-03-30T05:49:59.789Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0d4afa01-4650-4c05-9bbb-579a87727bb1', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which attribute on the `<script>` tag is used to link an external JavaScript file?', 'The `src` attribute is used to specify the path to an external JavaScript file, for example `<script src="/path/to/script.js"></script>`. The path can be absolute, relative, or a full URL.', 'easy', 'approved', 'b41d7e00-00de-4c87-98f2-a420b55ebbba', 13, '2026-03-30T05:49:59.792Z', '2026-03-30T05:49:59.792Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('49b36568-0e73-4863-8dce-cbcf48d6928d', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'In modern HTML, the `type` and `language` attributes on the `<script>` tag are:', 'The old HTML4 standard required `type="text/javascript"` and supported a `language` attribute, but neither is required in modern HTML. The `type` attribute has been repurposed in modern HTML for JavaScript modules (`type="module"`), and the `language` attribute is no longer meaningful since JavaScript is the default scripting language.', 'medium', 'approved', 'b41d7e00-00de-4c87-98f2-a420b55ebbba', 14, '2026-03-30T05:49:59.817Z', '2026-03-30T05:49:59.817Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3c0ca079-c9c7-4307-ae36-8e57dde5ddd9', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does JavaScript do when it encounters a line break between two statements without a semicolon?', 'JavaScript interprets a line break as an "implicit" semicolon in most cases. This is called automatic semicolon insertion (ASI). However, ASI does not always apply — for example, when a line ends with an incomplete expression like `+`, or before square brackets `[...]`.', 'medium', 'approved', '78d25399-8a74-46fc-866b-69448a040db1', 15, '2026-03-30T05:50:06.486Z', '2026-03-30T05:50:06.486Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1b7a60c6-6f49-47a9-943c-76a7fd3cc0f0', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the output of the following code?

```js
alert(3 +
1
+ 2);
```', 'JavaScript does not insert a semicolon after `3 +` because the line ends with a plus sign, making it an incomplete expression. The engine treats all three lines as a single statement: `alert(3 + 1 + 2)`, which outputs `6`.', 'medium', 'approved', '78d25399-8a74-46fc-866b-69448a040db1', 16, '2026-03-30T05:50:06.488Z', '2026-03-30T05:50:06.488Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1a927b54-3dfd-4b70-85f4-c84203446a51', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which of the following is the correct syntax for a multi-line JavaScript comment?', 'Multi-line comments in JavaScript start with `/*` and end with `*/`. Single-line comments use `//`. Nested multi-line comments (`/* ... /* ... */ ... */`) are not supported and will produce an error.', 'easy', 'approved', '78d25399-8a74-46fc-866b-69448a040db1', 17, '2026-03-30T05:50:06.489Z', '2026-03-30T05:50:06.489Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('fd6c31b1-0190-4405-947e-275359b9c784', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Are nested multi-line comments (`/* ... /* ... */ ... */`) allowed in JavaScript?', 'Nested multi-line comments are not supported in JavaScript. Placing `/* ... */` inside another `/* ... */` will cause a syntax error. The engine sees the first `*/` as the end of the outer comment.', 'easy', 'approved', '78d25399-8a74-46fc-866b-69448a040db1', 18, '2026-03-30T05:50:06.491Z', '2026-03-30T05:50:06.491Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('53e7c29e-5a6f-4c5c-9fbb-361e92206b94', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Why is it recommended to always use semicolons between JavaScript statements, even though they can often be omitted?', 'While JavaScript''s automatic semicolon insertion handles many cases, there are situations where it fails to insert a semicolon where one is needed — for example, before `[...]`. These errors are hard to find and fix, so it is safer to always use explicit semicolons, especially for beginners.', 'medium', 'approved', '78d25399-8a74-46fc-866b-69448a040db1', 19, '2026-03-30T05:50:06.492Z', '2026-03-30T05:50:06.492Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d3fbe3a0-bf1b-4ba3-8203-9c1ef48d2b4b', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the difference between `let` and `const` when declaring variables in JavaScript?', 'Variables declared with `let` can be reassigned to a new value, while constants declared with `const` cannot have their value changed once set. However, a `const` that references an object or DOM element can still have its internal properties modified — only the binding itself is immutable.', 'easy', 'approved', '95e54fc6-bf8c-4df0-8109-fa73fe940d62', 20, '2026-03-30T05:50:13.541Z', '2026-03-30T05:50:13.541Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('597c14e2-a1bd-4d14-bae1-5a103a64e31e', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does `Math.floor(Math.random() * 100) + 1` produce?', '`Math.random()` generates a decimal between 0 (inclusive) and 1 (exclusive). Multiplying by 100 gives a range of 0–99.999..., `Math.floor()` rounds down to the nearest integer (0–99), and adding 1 shifts the range to 1–100.', 'medium', 'approved', '95e54fc6-bf8c-4df0-8109-fa73fe940d62', 21, '2026-03-30T05:50:13.542Z', '2026-03-30T05:50:13.542Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1de0b070-6ac3-47fe-a3fe-3a4ffe2cdaf0', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does `addEventListener("click", checkGuess)` do?', '`addEventListener` attaches an event listener to an element. It takes two arguments: the event type as a string (e.g., `"click"`) and the function to run when the event occurs (e.g., `checkGuess`). Note that the function is passed without parentheses — including parentheses would call it immediately instead of registering it as a handler.', 'easy', 'approved', '95e54fc6-bf8c-4df0-8109-fa73fe940d62', 22, '2026-03-30T05:50:13.543Z', '2026-03-30T05:50:13.543Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a65fb29a-d136-44d3-8ce3-8e3dc6252eba', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does the following `for...of` loop do?

```js
const fruits = ["apples", "bananas", "cherries"];
for (const fruit of fruits) {
  console.log(fruit);
}
```', 'A `for...of` loop iterates over the values in an iterable such as an array. Here, `fruit` is assigned each element from `fruits` in turn, so `console.log(fruit)` prints `apples`, then `bananas`, then `cherries` on separate lines.

This loop iterates over array values, not array indexes.', 'easy', 'approved', '95e54fc6-bf8c-4df0-8109-fa73fe940d62', 23, '2026-03-30T05:50:13.544Z', '2026-03-30T23:52:03.801Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('22d573cd-6e13-4262-9e97-e6bfbec72b7f', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does `Number(guessField.value)` do in the guessing game''s `checkGuess()` function?', 'The `Number()` constructor converts the text value from the input field (which is always a string) into a numeric type. This ensures the value can be correctly compared against the random number using strict equality (`===`) and numeric comparisons (`<`, `>`).', 'medium', 'approved', '95e54fc6-bf8c-4df0-8109-fa73fe940d62', 24, '2026-03-30T05:50:13.545Z', '2026-03-30T05:50:13.545Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('82e66cf6-2ed8-496f-b86d-3f39e6436868', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What are the two main types of errors you will encounter when writing JavaScript programs?', 'The article identifies syntax errors (spelling mistakes that prevent the program from running) and logic errors (the code runs but produces incorrect results) as the two main error types in JavaScript.', 'easy', 'approved', '94c87e62-63f5-4fd5-9fcd-4a90c55a8523', 25, '2026-03-30T06:50:09.845Z', '2026-03-30T06:50:09.845Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('cf13045f-b641-48a1-8ce1-050acdd493cf', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does a syntax error typically cause in a JavaScript program?', 'Syntax errors prevent the program from running at all, or cause it to stop working part way through. Error messages are usually provided to help diagnose them.', 'easy', 'approved', '94c87e62-63f5-4fd5-9fcd-4a90c55a8523', 26, '2026-03-30T06:50:09.847Z', '2026-03-30T06:50:09.847Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e10952c7-23ff-432b-b214-b6e79ffb7895', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which browser feature is most useful for identifying syntax errors in JavaScript?', 'The JavaScript developer console gives you error messages whenever a syntax error exists inside the JavaScript being fed into the browser''s engine, making it the primary tool for identifying such errors.', 'easy', 'approved', '94c87e62-63f5-4fd5-9fcd-4a90c55a8523', 27, '2026-03-30T06:50:09.884Z', '2026-03-30T06:50:09.884Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3dfe7a6d-2d6c-4bf2-80d6-0defc7d4c4d8', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the purpose of inserting `console.log(variable)` into your code while debugging?', 'console.log() prints the current value of a variable to the console at that point in execution, allowing you to inspect its value and verify whether the code is behaving as expected.', 'easy', 'approved', '94c87e62-63f5-4fd5-9fcd-4a90c55a8523', 28, '2026-03-30T06:50:09.887Z', '2026-03-30T06:50:09.887Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3f641d98-a35f-45b9-9690-d454e07161a4', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'The code `document.querySelector(''lowOrHi'')` returns `null` instead of the expected paragraph element. What is the most likely cause?', 'The querySelector() method requires a CSS selector. To select an element by class name, the selector must start with a dot (e.g., ''.lowOrHi''). Without the dot, the browser looks for a non-existent HTML tag named ''lowOrHi'' and returns null.', 'medium', 'approved', '94c87e62-63f5-4fd5-9fcd-4a90c55a8523', 29, '2026-03-30T06:50:09.891Z', '2026-03-30T06:50:09.891Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('302af841-fb2b-4319-ad99-d37bf287cf68', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does the `console.log()` method return in JavaScript?', 'console.log() always returns undefined. It is called solely for its side effect of printing output to the console, not for a return value.', 'easy', 'approved', '0189959f-585a-4a50-8e4c-59cc57edcece', 30, '2026-03-30T06:50:17.296Z', '2026-03-30T06:50:17.296Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9adc2d19-af5b-41d3-b40a-c3fe175469f6', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which of the following is a primary use case of `console.log()`?', 'console.log() is primarily used for debugging code, inspecting variables, tracking the flow of execution, and logging errors or warnings. Compiling JavaScript is not something console.log() does.', 'easy', 'approved', '0189959f-585a-4a50-8e4c-59cc57edcece', 31, '2026-03-30T06:50:17.300Z', '2026-03-30T06:50:17.300Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('251dac7f-08f8-4b2c-b828-d6289c46bee7', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'When you call `console.log(user)` where `user` is a JavaScript object, how does the browser console typically display it?', 'Modern browser consoles display logged objects in an expandable format that lets you explore the object''s key-value pairs interactively, rather than converting it to a string automatically.', 'easy', 'approved', '0189959f-585a-4a50-8e4c-59cc57edcece', 32, '2026-03-30T06:50:17.301Z', '2026-03-30T06:50:17.301Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4e8bb599-b93f-4fab-8837-7f006a982299', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Given the code `let fruits = ["Apple", "Banana", "Cherry"]; console.log(fruits);`, what will the console display?', 'Arrays logged with console.log() are displayed as a list of their values with index positions, e.g. [''Apple'', ''Banana'', ''Cherry'']. They are not converted to a comma-separated string, nor do they cause an error.', 'easy', 'approved', '0189959f-585a-4a50-8e4c-59cc57edcece', 33, '2026-03-30T06:50:17.305Z', '2026-03-30T06:50:17.305Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('70e637b7-911a-4757-ba5d-9bf8a71470d5', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What types of values can be passed as arguments to `console.log()`?', 'console.log() accepts any valid JavaScript expression as its argument — including strings, numbers, booleans, objects, arrays, and expressions. It is not limited to primitive values.', 'easy', 'approved', '0189959f-585a-4a50-8e4c-59cc57edcece', 34, '2026-03-30T06:50:17.307Z', '2026-03-30T06:50:17.307Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('dfcf9698-83d2-4d10-81dd-4739bc69500c', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What keyboard shortcut opens the developer tools in most browsers on Windows?', 'F12 is the standard shortcut to open developer tools in most browsers on Windows, including Chrome, Firefox, and Edge.', 'easy', 'approved', '8f12764a-2a17-4fb4-a9d8-6edd0c452796', 35, '2026-03-30T06:50:28.178Z', '2026-03-30T06:50:28.178Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('16269b57-9939-466b-8307-db1074f8daec', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'In Chrome on macOS, which keyboard shortcut opens the JavaScript Console directly?', '`Cmd+Opt+J` opens the JavaScript Console directly in Chrome on macOS. `Cmd+Shift+I` opens Developer Tools more generally, so it is a weaker distractor if the question only asks for DevTools. Making the stem explicitly about the Console removes that ambiguity.', 'easy', 'approved', '8f12764a-2a17-4fb4-a9d8-6edd0c452796', 36, '2026-03-30T06:50:28.180Z', '2026-03-30T23:52:03.801Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('882df5c0-fcc3-4aa4-9d67-c62a3f39550f', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'How do you enter multiple lines of JavaScript code in the browser console without executing each line immediately?', 'Pressing Shift+Enter inserts a new line in the console without executing the current code. Pressing Enter alone executes the code immediately.', 'easy', 'approved', '8f12764a-2a17-4fb4-a9d8-6edd0c452796', 37, '2026-03-30T06:50:28.182Z', '2026-03-30T06:50:28.182Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a01ce785-ea81-4e9d-b648-60d871bb50c4', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What must you do before you can use the developer console in Safari?', 'Safari hides its Develop menu by default. You must first go to Settings > Advanced and enable the ''Develop menu''. After that, Cmd+Opt+C toggles the console.', 'medium', 'approved', '8f12764a-2a17-4fb4-a9d8-6edd0c452796', 38, '2026-03-30T06:50:28.186Z', '2026-03-30T06:50:28.186Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e7821da2-d6b4-43e6-a2aa-43c66270b94e', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which two browsers are most commonly preferred by developers because of their superior developer tools?', 'According to the article, most developers lean towards Chrome or Firefox for development because those browsers have the best developer tools. Other browsers are generally playing catch-up to these two.', 'easy', 'approved', '8f12764a-2a17-4fb4-a9d8-6edd0c452796', 39, '2026-03-30T06:50:28.187Z', '2026-03-30T06:50:28.187Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('852b7300-ad4e-4e2e-b399-8ce6df1e2c31', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What value does a declared but uninitialized `let` variable hold?

```js
let myName;
console.log(myName);
```', 'When a variable is declared with `let` but not assigned a value, it holds `undefined`. This is different from a variable that doesn''t exist at all, which would throw a `ReferenceError`.', 'easy', 'approved', '9c4ae515-ddc9-4431-91ef-618335dfb8f5', 40, '2026-03-30T07:36:11.127Z', '2026-03-30T07:36:11.127Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('85efabc3-1b28-4f56-ab9e-30cf169880be', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which of the following is a key advantage of `let` over `var`?', '`let` prevents a variable from being declared more than once in the same scope. With `var` you can redeclare the same variable name without an error, which leads to confusing bugs. `let` was introduced in modern JavaScript specifically to address this and other issues with `var`.', 'easy', 'approved', '9c4ae515-ddc9-4431-91ef-618335dfb8f5', 41, '2026-03-30T07:36:11.129Z', '2026-03-30T07:36:11.129Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('6d9fa3c6-582c-4ec6-95d6-6e37b1a8c409', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which of the following is the recommended naming convention for multi-word JavaScript variable names?', 'The JavaScript convention is lower camelCase — the first word is entirely lowercase and each subsequent word starts with a capital letter, e.g. `myVariableName`. This is the style used throughout MDN''s JavaScript guides.', 'easy', 'approved', '9c4ae515-ddc9-4431-91ef-618335dfb8f5', 42, '2026-03-30T07:36:11.131Z', '2026-03-30T07:36:11.131Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a9f15c9f-31f2-4bb7-bcf6-9948ddc9e6c3', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the key difference between `let` and `const` when declaring a variable?', '`const` requires an initial value at declaration and cannot be reassigned afterwards. `let` can be declared without a value and can be reassigned at any time. Note that `const` does NOT make objects fully immutable — their properties can still be changed.', 'easy', 'approved', '9c4ae515-ddc9-4431-91ef-618335dfb8f5', 43, '2026-03-30T07:36:11.132Z', '2026-03-30T07:36:11.132Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e9c4a3cd-a9d4-4d7c-bdf3-c6332dc2eb9d', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'JavaScript is described as a "dynamically typed" language. What does that mean?

```js
let myNumber = ''500'';
typeof myNumber; // ?
myNumber = 500;
typeof myNumber; // ?
```', 'Dynamic typing means variables are not bound to a specific data type. The same variable can hold a string at one moment and a number at another. The `typeof` operator reveals the current type — in the example, `''string''` first and then `''number''` after reassignment.', 'medium', 'approved', '9c4ae515-ddc9-4431-91ef-618335dfb8f5', 44, '2026-03-30T07:36:11.133Z', '2026-03-30T07:36:11.133Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('62f08300-054b-4329-82ee-8f1895e770f0', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which of the following variable names is **invalid** in JavaScript?', 'Variable names in JavaScript cannot start with a digit. `1a` begins with the digit `1`, making it a syntax error. Names like `userName`, `test123`, `$`, and `_` are all valid because they start with a letter or an allowed symbol (`$` or `_`).', 'easy', 'approved', '82e69969-b676-4661-a98f-b0846a94cf45', 45, '2026-03-30T07:36:19.493Z', '2026-03-30T07:36:19.493Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('50666bb7-006a-42c5-989a-acc600365b28', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What happens when you declare the same variable twice using `let`?

```js
let message = "This";
let message = "That";
```', 'Declaring a variable twice with `let` results in a `SyntaxError: ''message'' has already been declared`. Unlike `var`, `let` does not allow redeclaration of the same variable in the same scope.', 'easy', 'approved', '82e69969-b676-4661-a98f-b0846a94cf45', 46, '2026-03-30T07:36:19.498Z', '2026-03-30T07:36:19.498Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('20b1987b-eed1-45c6-9651-802a74082310', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'When should you use UPPERCASE names for a `const` constant, according to javascript.info conventions?', 'Uppercase constant names (e.g. `COLOR_RED = "#F00"`) are used as aliases for hard-coded values that are known **before** the program runs. Constants that are computed at runtime (even if they never change afterwards) are named normally in camelCase, like `pageLoadTime`.', 'medium', 'approved', '82e69969-b676-4661-a98f-b0846a94cf45', 47, '2026-03-30T07:36:19.501Z', '2026-03-30T07:36:19.501Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('bc9312a4-f2cf-40bd-8656-81eae435ac09', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the recommended style for declaring variables in modern JavaScript according to javascript.info?', '`let` is the modern variable declaration keyword and is recommended for variables whose value may change. `const` should be used when the value will not be reassigned. `var` is considered old-school and is no longer recommended for new code.', 'easy', 'approved', '82e69969-b676-4661-a98f-b0846a94cf45', 48, '2026-03-30T07:36:19.503Z', '2026-03-30T07:36:19.503Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c0285939-b027-4c11-b661-54664f7bc15b', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which of the following best describes what happens when you assign a value without declaring a variable first, in **non-strict mode**?

```js
// no "use strict"
num = 5;
alert(num); // ?
```', 'In non-strict mode, assigning a value to an undeclared name automatically creates a global variable. This is considered bad practice and causes an error in strict mode (`''use strict''` directive). Always declare variables explicitly with `let`, `const`, or `var`.', 'medium', 'approved', '82e69969-b676-4661-a98f-b0846a94cf45', 49, '2026-03-30T07:36:19.508Z', '2026-03-30T07:36:19.508Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1fb56310-8444-4f5d-bbc0-cee2acb7c81c', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does `typeof null` return in JavaScript?', '`typeof null` returns `"object"`. This is a well-known bug in JavaScript that has been preserved for backwards compatibility since the early days of the language. `null` is NOT actually an object — it is a standalone primitive type that represents an intentionally empty value.', 'medium', 'approved', '5c301db9-e490-497a-bc78-3305af4dc505', 50, '2026-03-30T07:36:32.868Z', '2026-03-30T07:36:32.868Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ad52edf2-5da5-49cd-97e8-7d416e5b6bf4', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'How many primitive data types does JavaScript have?', 'JavaScript has **7 primitive types**: `number`, `bigint`, `string`, `boolean`, `null`, `undefined`, and `symbol`. There is also one non-primitive type: `object`. Arrays and functions are subtypes of `object`.', 'easy', 'approved', '5c301db9-e490-497a-bc78-3305af4dc505', 51, '2026-03-30T07:36:32.873Z', '2026-03-30T07:36:32.873Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('18a805bf-6aab-4f2f-a9a0-7f367ae923cb', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the result of the following expression?

```js
alert(NaN + 1);
```', '`NaN` (Not a Number) is "sticky" — any arithmetic operation involving `NaN` returns `NaN`. The only exception is `NaN ** 0`, which returns `1`. Because `NaN + 1` involves `NaN`, the result is `NaN`.', 'easy', 'approved', '5c301db9-e490-497a-bc78-3305af4dc505', 52, '2026-03-30T07:36:32.875Z', '2026-03-30T07:36:32.875Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c3884d79-a8dd-49e9-82e5-87812b5882bd', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which of the following is a valid BigInt literal in JavaScript?', 'A BigInt literal is written by appending `n` to the end of an integer literal, such as `100n`. JavaScript also provides `BigInt(...)` as a function, but that is a function call, not a literal. Tightening the question to literal syntax removes ambiguity.', 'easy', 'approved', '5c301db9-e490-497a-bc78-3305af4dc505', 53, '2026-03-30T07:36:32.878Z', '2026-03-30T23:52:03.804Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('52602054-4b11-43e8-800d-f3ec2bc977e3', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the difference between `null` and `undefined` in JavaScript?', '`undefined` is the automatic default value of a declared but unassigned variable. `null` is an intentional assignment that represents "empty" or "no value". While both represent the absence of a value, `null` is used to explicitly set a variable to have no value, whereas `undefined` usually means the programmer hasn''t assigned one yet.', 'medium', 'approved', '5c301db9-e490-497a-bc78-3305af4dc505', 54, '2026-03-30T07:36:32.881Z', '2026-03-30T07:36:32.881Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f1d0d465-750d-4003-a784-3649831dfefe', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which of the following correctly embeds a variable inside a string in JavaScript?

```js
const name = "Alice";
```', 'Template literals (backtick strings) support embedding variables and expressions using `${...}` syntax. This is called string interpolation. Regular single or double quoted strings do not support `${}` — the characters are treated as literal text.', 'easy', 'approved', 'ee2d76da-8c9b-4a98-a3cd-2f9ac688ec6c', 55, '2026-03-30T07:37:00.298Z', '2026-03-30T07:37:00.298Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b6bbbadd-9cdf-4543-b616-dec58e6b39ae', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the output of the following code?

```js
const coolBandName = "Front ";
const number = 242;
console.log(coolBandName + number);
```', 'When you use the `+` operator with a string and a number, JavaScript automatically converts the number to a string and concatenates them. The result is the string `"Front 242"`. This is called type coercion.', 'easy', 'approved', 'ee2d76da-8c9b-4a98-a3cd-2f9ac688ec6c', 56, '2026-03-30T07:37:00.302Z', '2026-03-30T07:37:00.302Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2cf95e90-728a-4d1c-acb1-bdd7ac6765ca', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which template literal feature lets you create a multiline string without using `\n` escape sequences?', 'Template literals preserve actual line breaks written between backticks, so you can create multiline strings by pressing Enter inside the string. Using `\n` inside a template literal also works, which made the original version ambiguous. This rewrite focuses on the distinctive feature of template literals: literal newlines in the source code.', 'easy', 'approved', 'ee2d76da-8c9b-4a98-a3cd-2f9ac688ec6c', 57, '2026-03-30T07:37:00.304Z', '2026-03-30T23:52:03.807Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('af53fb0f-fc02-4557-ae95-2e6c948a692a', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which method converts a numeric string to an actual number in JavaScript?

```js
const myString = "123";
// How do you convert it to a number?
```', 'The `Number()` function converts its argument to a number type. For a numeric string like `"123"`, it returns the number `123`. The `String()` function does the opposite — converting a value to a string.', 'easy', 'approved', 'ee2d76da-8c9b-4a98-a3cd-2f9ac688ec6c', 58, '2026-03-30T07:37:00.305Z', '2026-03-30T07:37:00.305Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('08a660d3-da59-424f-aa89-ae44b55afe11', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What happens if you use mismatched quote characters to declare a string?

```js
const badQuotes = ''This is not allowed!";
```', 'You must use the **same** type of quote character for the opening and closing of a string. Mixing single and double quotes causes a syntax error because JavaScript cannot determine where the string ends.', 'easy', 'approved', 'ee2d76da-8c9b-4a98-a3cd-2f9ac688ec6c', 59, '2026-03-30T07:37:00.308Z', '2026-03-30T07:37:00.308Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('cc3d1667-3d4b-4c64-ae14-706ce87d56c3', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does the following code return?

```js
"mozilla".slice(1, 4);
```', '`slice(start, end)` extracts characters from `start` up to (but **not including**) `end`. Index `1` is `''o''` and index `4` is `''l''`. So the extracted substring is `"ozi"` — the characters at indices 1, 2, and 3.', 'easy', 'approved', 'a2e8764d-af86-432e-b7df-2e9a5a4f2b0a', 60, '2026-03-30T07:37:07.543Z', '2026-03-30T07:37:07.543Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('11c6cd5f-0b2a-4526-aee8-920bc523fad5', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does `indexOf()` return when the substring is **not** found in the string?

```js
"mozilla".indexOf("x");
```', '`indexOf()` returns `-1` when the specified substring is not found anywhere in the string. This is a common pattern used to check for the absence of a substring: `if (str.indexOf(''x'') === -1) { /* not found */ }`.', 'easy', 'approved', 'a2e8764d-af86-432e-b7df-2e9a5a4f2b0a', 61, '2026-03-30T07:37:07.547Z', '2026-03-30T07:37:07.547Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e6f0df27-a207-4a64-8f99-a83dcb7c1125', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the output of the following code?

```js
const browserType = "mozilla";
const updated = browserType.replace("moz", "van");
console.log(updated);
console.log(browserType);
```', '`replace()` returns a **new string** with the replacement applied — it does not modify the original string. So `updated` is `"vanilla"` and `browserType` remains `"mozilla"`. This is a key property of string methods in JavaScript: strings are immutable.', 'medium', 'approved', 'a2e8764d-af86-432e-b7df-2e9a5a4f2b0a', 62, '2026-03-30T07:37:07.550Z', '2026-03-30T07:37:07.550Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('016d8fe4-2f8e-450b-8991-2fa6b8f9bef0', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'How do you access the **last** character of a string using its `length` property?', 'Because string indices are zero-based, the last character is at position `length - 1`. For `"mozilla"` (length 7), the last character `''a''` is at index `6`. The expression `str[str.length - 1]` is the standard pattern to get the last character.', 'easy', 'approved', 'a2e8764d-af86-432e-b7df-2e9a5a4f2b0a', 63, '2026-03-30T07:37:07.553Z', '2026-03-30T07:37:07.553Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9e5b5488-e9cf-49af-af63-fbd6a3400161', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which method replaces **all** occurrences of a substring in a string?

```js
let quote = "To be or not to be";
quote = quote.???("be", "code");
// Expected: "To code or not to code"
```', '`replaceAll()` replaces every occurrence of the target substring. `replace()` only replaces the **first** occurrence. To replace all occurrences with `replace()` you would need to use a global regular expression (`/be/g`), but `replaceAll()` is simpler and more readable.', 'easy', 'approved', 'a2e8764d-af86-432e-b7df-2e9a5a4f2b0a', 64, '2026-03-30T07:37:07.555Z', '2026-03-30T07:37:07.555Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f1b64859-f33d-492c-b4f3-85a90e12a552', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Given the following code, what are the two `typeof` results?

```js
let myNumber = "500";
console.log(typeof myNumber); // first
myNumber = 500;
console.log(typeof myNumber); // second
```', 'JavaScript is dynamically typed, so the same variable can change type. Initially `myNumber` holds the string `"500"`, so `typeof` returns `"string"`. After reassignment to the number `500`, `typeof` returns `"number"`. This is a classic demonstration of dynamic typing and why `typeof` is useful for checking the current type of a value.', 'medium', 'approved', 'a1a6bda0-5f31-493c-bf5b-9bf9a2aaa2e6', 65, '2026-03-30T07:37:15.589Z', '2026-03-30T07:37:15.589Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0cc0a598-d542-427a-8e58-35c9bee32d25', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the output of the following code, and why?

```js
const bird = { species: "Kestrel" };
bird.species = "Striated Caracara";
console.log(bird.species);
```', '`const` prevents the **variable binding** from being reassigned — you cannot do `bird = someOtherObject`. However, `const` does NOT make the object''s contents immutable. You can freely add, update, or remove properties on a `const` object. So `bird.species` is successfully changed and logs `"Striated Caracara"`.', 'medium', 'approved', 'a1a6bda0-5f31-493c-bf5b-9bf9a2aaa2e6', 66, '2026-03-30T07:37:15.593Z', '2026-03-30T07:37:15.593Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e9dfa5c1-2d99-421d-93d4-2fb64a30affa', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does the following expression evaluate to, and which concept explains it?

```js
typeof null
```', '`typeof null` returns `"object"` — a well-known historical bug in JavaScript kept for backwards compatibility. `null` is actually its own standalone primitive type, not an object. This trips up many developers who expect `"null"`. It is important to know this quirk when type-checking values.', 'medium', 'approved', 'a1a6bda0-5f31-493c-bf5b-9bf9a2aaa2e6', 67, '2026-03-30T07:37:15.597Z', '2026-03-30T07:37:15.597Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('34bac682-ee63-4827-aa89-a134eef1d8a3', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Consider the following code. What is logged, and what string method concept does it illustrate?

```js
const tagline = "MDN - Resources for developers, by developers";
console.log(tagline.indexOf("developers"));
```', '`indexOf()` returns the index of the **first** occurrence of the substring. Counting from 0 (including spaces and punctuation), `"developers"` first appears at index `20`. The method is case-sensitive and returns `-1` if not found. There is a second occurrence of `"developers"` at index `35`, but `indexOf()` only returns the first.', 'medium', 'approved', 'a1a6bda0-5f31-493c-bf5b-9bf9a2aaa2e6', 68, '2026-03-30T07:37:15.599Z', '2026-03-30T07:37:15.599Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4abe0ffe-8a53-46b2-97b9-f50243758a78', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the value of `result` after this code runs, and which two concepts are combined here?

```js
const score = 9;
const highestScore = 10;
const result = `Score: ${(score / highestScore) * 100}%`;
```', 'This combines **template literals** (backtick strings with `${}` interpolation) and **dynamic typing / numeric expression evaluation**. The expression `(score / highestScore) * 100` evaluates to `90` (a number), which is automatically converted to a string when embedded in the template literal. The result is `"Score: 90%"`.', 'medium', 'approved', 'a1a6bda0-5f31-493c-bf5b-9bf9a2aaa2e6', 69, '2026-03-30T07:37:15.600Z', '2026-03-30T07:37:15.600Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7212d9f0-0e0c-496b-86df-70772fe0ece4', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which JavaScript data type is used to represent **both** integers and floating-point numbers?', 'JavaScript has a single numeric type called `Number` that handles both integers (e.g., `5`) and floats (e.g., `6.667`). You can confirm this with `typeof`: both `typeof 5` and `typeof 6.667` return `"number"`.

Example:
```js
const myInt = 5;
const myFloat = 6.667;
typeof myInt;   // "number"
typeof myFloat; // "number"
```', 'easy', 'approved', 'babc2d55-c9b2-4fc8-9ac9-9a57df79f32b', 70, '2026-03-30T09:00:38.417Z', '2026-03-30T09:00:38.417Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ce066b08-e6f5-41ac-956f-44768cd6cd1f', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the result of the following expression?

```js
5 + 10 * 3;
```', 'Multiplication has higher precedence than addition, so `10 * 3` is evaluated first, giving `30`. Then `5 + 30 = 35`.

This follows standard mathematical operator precedence: multiply and divide before add and subtract.', 'easy', 'approved', 'babc2d55-c9b2-4fc8-9ac9-9a57df79f32b', 71, '2026-03-30T09:00:38.420Z', '2026-03-30T09:00:38.420Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1885c71e-004b-4373-8be7-f16552f763fd', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the result of this code?

```js
let myNumber = "74";
myNumber += 3;
console.log(myNumber);
```', '`myNumber` is declared as a **string** `"74"`. Using `+=` with a string on the left causes JavaScript to concatenate rather than add numerically, so the result is `"743"` not `77`.

To get numeric addition, convert first:
```js
myNumber = Number(myNumber) + 3; // 77
```', 'medium', 'approved', 'babc2d55-c9b2-4fc8-9ac9-9a57df79f32b', 72, '2026-03-30T09:00:38.422Z', '2026-03-30T09:00:38.422Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('48e4710c-062e-4958-9782-0b92403f236e', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does the `%` operator return in JavaScript?

```js
console.log(8 % 3);
```', 'The `%` operator is the **remainder** (or modulo) operator. It returns what is left over after integer division. `8 ÷ 3 = 2` remainder `2`, so `8 % 3` equals `2`.', 'easy', 'approved', 'babc2d55-c9b2-4fc8-9ac9-9a57df79f32b', 73, '2026-03-30T09:00:38.423Z', '2026-03-30T09:00:38.423Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d61db22a-337b-4c58-98a2-3180309ec558', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'A variable `num1` has the value `4`. After running `num1++`, what value does `num1` hold?', 'The postfix increment operator `++` increments the variable by 1 **after** returning its current value. So after `num1++`, `num1` becomes `5`.

Example:
```js
let num1 = 4;
num1++;
console.log(num1); // 5
```', 'easy', 'approved', 'babc2d55-c9b2-4fc8-9ac9-9a57df79f32b', 74, '2026-03-30T09:00:38.424Z', '2026-03-30T09:00:38.424Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('321aacfe-c1ec-4ede-b08e-43107f249a41', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the output of the following code?

```js
alert( ''1'' + 2 + 2 );
```', 'Operators are evaluated left-to-right. The first operand `''1''` is a string, so `''1'' + 2` triggers **string concatenation**, yielding `"12"`. Then `"12" + 2` concatenates again, producing `"122"`.

This illustrates that once a string appears on the left, subsequent `+` operations treat the right operands as strings.', 'medium', 'approved', '82e0e381-ddf2-4885-9955-93ea3b3ae132', 75, '2026-03-30T09:00:48.401Z', '2026-03-30T09:00:48.401Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b54f204f-dad4-4e4c-b1d5-4d780ce09d2f', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the difference between the **prefix** (`++counter`) and **postfix** (`counter++`) forms of the increment operator when used in an expression?', 'The **prefix** form `++counter` increments the variable **first** and returns the **new** value. The **postfix** form `counter++` increments the variable but returns the **old** value (before the increment).

Example:
```js
let counter = 1;
let a = ++counter; // a = 2 (new value returned)
let b = counter++; // b = 2 (old value returned), counter is now 3
```', 'medium', 'approved', '82e0e381-ddf2-4885-9955-93ea3b3ae132', 76, '2026-03-30T09:00:48.403Z', '2026-03-30T09:00:48.403Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('52bfdc3e-58bc-4fa7-8dae-f7d75586ef5e', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does the unary `+` operator do when applied to a non-numeric value?

```js
alert( +true );
alert( +"" );
```', 'The unary `+` operator converts its operand to a number, behaving exactly like `Number(...)`: `+true` becomes `1` and `+""` becomes `0`.

This is shorter than calling `Number()` explicitly and is commonly used to convert HTML form field values (which are strings) to numbers.', 'medium', 'approved', '82e0e381-ddf2-4885-9955-93ea3b3ae132', 77, '2026-03-30T09:00:48.404Z', '2026-03-30T09:00:48.404Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('5366bf63-a463-4cf1-bb6c-9f6903638c97', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the value of `n` after this code runs?

```js
let n = 2;
n *= 3 + 5;
```', 'Compound assignment operators like `*=` have the same precedence as `=` (very low), so **the right-hand side is evaluated first**. `3 + 5 = 8`, then `n *= 8` means `n = 2 * 8 = 16`.

This is equivalent to `n = n * (3 + 5)`.', 'medium', 'approved', '82e0e381-ddf2-4885-9955-93ea3b3ae132', 78, '2026-03-30T09:00:48.407Z', '2026-03-30T09:00:48.407Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('05436d5e-14c4-4c25-a80b-00a059b809e0', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'In the expression `a = b = c = 2 + 2`, what value do `a`, `b`, and `c` all end up holding?', 'Chained assignments evaluate **right to left**. First `2 + 2 = 4` is computed, then assigned to `c`, then `b`, then `a`. All three variables end up with the value `4`.

Example:
```js
let a, b, c;
a = b = c = 2 + 2;
alert(a); // 4
alert(b); // 4
alert(c); // 4
```', 'easy', 'approved', '82e0e381-ddf2-4885-9955-93ea3b3ae132', 79, '2026-03-30T09:00:48.408Z', '2026-03-30T09:00:48.408Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('cea18f33-00ca-4e2b-8c5d-2787f7d1c405', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the result of this comparison?

```js
alert( ''Glow'' > ''Glee'' );
```', 'JavaScript compares strings **character-by-character** using Unicode order (lexicographic). Comparing `''Glow''` vs `''Glee''`: `G === G`, `l === l`, then `o > e` — so `''Glow''` is greater and the result is `true`.', 'easy', 'approved', '269f8b43-a150-45a5-8577-4990790b3f04', 80, '2026-03-30T09:00:55.665Z', '2026-03-30T09:00:55.665Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1e761f64-9576-4af9-b198-9649e1ed96e4', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the result of the following strict equality check?

```js
alert( 0 === false );
```', 'The **strict equality** operator `===` checks both value **and** type without any conversion. `0` is a `number` and `false` is a `boolean` — different types — so the result is `false`.

This contrasts with `==`, where `0 == false` is `true` because `false` gets converted to `0`.', 'easy', 'approved', '269f8b43-a150-45a5-8577-4990790b3f04', 81, '2026-03-30T09:00:55.667Z', '2026-03-30T09:00:55.667Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9fea2c2c-507a-4d9e-8f9c-a242aae216bd', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does `null == undefined` evaluate to in JavaScript?', '`null` and `undefined` are a ''sweet couple'' — they equal each other under loose equality `==`, but **do not equal any other value**.

```js
alert( null == undefined );  // true
alert( null === undefined ); // false (different types)
alert( null == 0 );          // false
```', 'medium', 'approved', '269f8b43-a150-45a5-8577-4990790b3f04', 82, '2026-03-30T09:00:55.668Z', '2026-03-30T09:00:55.668Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4af74e09-0208-421d-9ecf-5f93673af60a', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the result of `null >= 0` in JavaScript?', 'Relational comparisons (`>`, `<`, `>=`, `<=`) convert `null` to the number `0`. So `null >= 0` becomes `0 >= 0`, which is `true`.

However, `null > 0` and `null == 0` are both `false` — a seemingly inconsistent but defined behavior. The equality check `==` does **not** perform numeric conversion for `null`.', 'hard', 'approved', '269f8b43-a150-45a5-8577-4990790b3f04', 83, '2026-03-30T09:00:55.669Z', '2026-03-30T09:00:55.669Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('dce46d1b-a61f-48b2-85ef-69834db19b72', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the result of `''2'' > ''12''` in JavaScript?', 'Both operands are **strings**, so JavaScript uses lexicographic (character-by-character) comparison — **not** numeric comparison. `''2''` starts with `''2''` and `''12''` starts with `''1''`. Since `''2'' > ''1''` in Unicode order, `''2'' > ''12''` is `true`.

If they were numbers, `2 > 12` would be `false`. This is a common gotcha when comparing strings that look like numbers.', 'medium', 'approved', '269f8b43-a150-45a5-8577-4990790b3f04', 84, '2026-03-30T09:00:55.670Z', '2026-03-30T09:00:55.670Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7a72d877-d9ca-47ad-80ba-457c5e8d63c6', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does the following code print?', 'The subtraction operator converts both operands to numbers here, so `"3" - 2` evaluates to the number `1`. Then `1 === 1` is `true` because strict equality compares both value and type.

This differs from `+`, which may concatenate when one operand is a string. The important rule in this example is about subtraction, not a blanket rule for every other operator.', 'medium', 'approved', 'd1e529b8-6558-47a0-a242-60c9df8d5010', 85, '2026-03-30T09:01:03.370Z', '2026-03-30T23:52:03.813Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e7f39f9e-1db4-4b3d-a6c4-ad468900fa32', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the value of `x` after this code runs?

```js
let x = 5;
console.log(x++);
console.log(x);
```', 'The first `console.log(x++)` uses the **postfix** form, which returns the **current** value (`5`) and **then** increments `x` to `6`. The second `console.log(x)` prints the updated value `6`.

So the two lines print `5` then `6`. Postfix increment returns the old value; the variable is updated after the expression is evaluated.', 'medium', 'approved', 'd1e529b8-6558-47a0-a242-60c9df8d5010', 86, '2026-03-30T09:01:03.376Z', '2026-03-30T09:01:03.376Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3070360f-141b-489c-b705-c130508a59d2', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does the following expression evaluate to?

```js
console.log( 2 + 2 + ''1'' );
```', 'Operators evaluate **left to right**. `2 + 2` is evaluated first (both numbers), giving `4`. Then `4 + ''1''` triggers string concatenation because `''1''` is a string, producing `"41"`.

This is the opposite of `''1'' + 2 + 2`, which would give `"122"`. The key insight: left-to-right evaluation means operand types seen so far determine whether `+` does arithmetic or concatenation.', 'medium', 'approved', 'd1e529b8-6558-47a0-a242-60c9df8d5010', 87, '2026-03-30T09:01:03.381Z', '2026-03-30T09:01:03.381Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('5162f36c-87f0-4d70-aab4-bd58143b7d85', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the result of the following comparison?

```js
console.log( false == ''0'' );
```', 'Loose equality `==` converts both operands to numbers when the types differ. `false` becomes `0`, and `''0''` becomes `0`. Since `0 == 0` is `true`, the expression returns `true`.

This is a classic JavaScript type-coercion gotcha. Using strict equality `===` avoids it: `false === ''0''` would be `false` because the types differ.', 'hard', 'approved', 'd1e529b8-6558-47a0-a242-60c9df8d5010', 88, '2026-03-30T09:01:03.388Z', '2026-03-30T09:01:03.388Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f5e569b8-da80-4e34-a9fb-362e61dc0d68', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the value of `result` after this code runs?

```js
let x = 10;
let result = ++x * 2 === 22;
console.log(result);
```', '`++x` is the **prefix** form, so `x` is incremented to `11` **before** the multiplication. `11 * 2 = 22`. Then `22 === 22` uses strict equality: both are `number 22`, so the result is `true`.

If postfix `x++` were used instead, the expression would be `10 * 2 === 22`, which is `20 === 22 = false`. This question combines prefix/postfix knowledge (operators), operator precedence (math), and strict equality (comparisons).', 'hard', 'approved', 'd1e529b8-6558-47a0-a242-60c9df8d5010', 89, '2026-03-30T09:01:03.392Z', '2026-03-30T09:01:03.392Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('bdb7e8e5-d03b-4395-ab63-4d4ac70c592d', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the correct term for a function that lives inside a JavaScript object?', 'Functions defined as properties of an object are called **methods**. The non-function properties (like `name` and `age`) are called **properties**. Both together are referred to as the object''s *members*.', 'easy', 'approved', 'eb54dac6-69e1-4beb-80cf-28c3de5a9547', 90, '2026-03-30T09:50:37.366Z', '2026-03-30T09:50:37.366Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8438a35d-6a21-4cde-9abe-a23aed76645e', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Given the following object, which expression correctly accesses `Bob`?

```js
const person = {
  name: ["Bob", "Smith"],
  age: 32
};
```', '`person.name` returns the array `["Bob", "Smith"]`, and index `[0]` gives the first element `"Bob"`. Dot notation accesses the `name` property, then bracket notation `[0]` indexes into the array.', 'easy', 'approved', 'eb54dac6-69e1-4beb-80cf-28c3de5a9547', 91, '2026-03-30T09:50:37.387Z', '2026-03-30T09:50:37.387Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a22db58b-a78a-4886-a620-0a5772d84a94', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'When must you use bracket notation instead of dot notation to access an object property?', 'Dot notation only accepts a **literal** identifier as the property name. If the property name is stored in a variable (computed at runtime), bracket notation must be used: `obj[variableName]`. Dot notation like `obj.variableName` would look for a property literally named `"variableName"`.', 'medium', 'approved', 'eb54dac6-69e1-4beb-80cf-28c3de5a9547', 92, '2026-03-30T09:50:37.399Z', '2026-03-30T09:50:37.399Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f102a9fc-85b2-43cc-8bd9-47f9851becf3', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'When a method is called as `person.method()`, what does `this` refer to inside that method?', 'In a call like `person.method()`, `this` refers to the object before the dot, which is `person`. That makes the rule about the method call site explicit. In JavaScript, `this` depends on how the function is called, so this wording is more precise than saying it always refers to the object that contains the method definition.', 'easy', 'approved', 'eb54dac6-69e1-4beb-80cf-28c3de5a9547', 93, '2026-03-30T09:50:37.408Z', '2026-03-30T23:52:03.816Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('aa9d7031-2ec0-486e-a8ea-c189939180aa', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What happens when you call a constructor function with the `new` keyword?', 'When `new` is used with a constructor, JavaScript: (1) creates a new empty object, (2) binds `this` to that new object inside the constructor, (3) runs the constructor code, and (4) returns the new object automatically.', 'medium', 'approved', 'eb54dac6-69e1-4beb-80cf-28c3de5a9547', 94, '2026-03-30T09:50:37.417Z', '2026-03-30T09:50:37.417Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('05b14841-febb-4754-98cb-2cbb1fd967e3', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does the following code print?

```js
const shopping = ["bread", "milk", "cheese", "hummus", "noodles"];
console.log(shopping.length);
```', 'The `length` property returns the number of items in the array. The array contains 5 items, so `shopping.length` is `5`.', 'easy', 'approved', '5bfee50a-d8e0-47e5-a0c9-35618a0fc57a', 95, '2026-03-30T09:50:50.336Z', '2026-03-30T09:50:50.336Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('118b9f5d-b49d-4ed4-b694-cc8335ba9489', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which method adds one or more items to the **end** of an array and returns the new length?', '`push()` appends items to the end of an array and returns the new array length. `unshift()` adds to the beginning. `pop()` removes from the end. `shift()` removes from the beginning.', 'easy', 'approved', '5bfee50a-d8e0-47e5-a0c9-35618a0fc57a', 96, '2026-03-30T09:50:50.338Z', '2026-03-30T09:50:50.338Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('28340637-1177-492f-83a2-2f67203d082b', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is returned by `birds.indexOf(''Rabbit'')` given the following?

```js
const birds = ["Parrot", "Falcon", "Owl"];
```', '`indexOf()` returns the index of the item if found, or `-1` if the item is not in the array. Since `''Rabbit''` is not in the `birds` array, it returns `-1`.', 'easy', 'approved', '5bfee50a-d8e0-47e5-a0c9-35618a0fc57a', 97, '2026-03-30T09:50:50.340Z', '2026-03-30T09:50:50.340Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d9059d4d-2045-4964-ae4e-eb587e226086', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does `map()` return when called on an array?', '`map()` calls the provided function once for each item in the original array and collects the return values into a **new array**. The original array is not modified.', 'medium', 'approved', '5bfee50a-d8e0-47e5-a0c9-35618a0fc57a', 98, '2026-03-30T09:50:50.342Z', '2026-03-30T09:50:50.342Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f49dc072-ee32-4ba2-8c4f-f55a4ddf3ae2', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which method converts a string like `"Manchester,London,Liverpool"` into an array by splitting on a comma?', '`split('','')` is a **string** method that divides the string at each comma and returns an array of substrings. `join()` does the reverse — it combines array items into a string.', 'easy', 'approved', '5bfee50a-d8e0-47e5-a0c9-35618a0fc57a', 99, '2026-03-30T09:50:50.343Z', '2026-03-30T09:50:50.343Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f2eae00d-ba2f-4178-93b2-c1463ac8591d', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which of the following correctly creates an empty object using **object literal** syntax?', 'The object literal syntax uses curly braces `{}`. `new Object()` also creates an empty object but is the "object constructor" syntax and rarely used. The other options are not valid object creation expressions.', 'easy', 'approved', '4fddc5c6-9d0f-4b38-9ecd-8124aad940de', 100, '2026-03-30T09:51:00.443Z', '2026-03-30T09:51:00.443Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('54580f05-1934-4a0e-b25a-c4b6611cfd5a', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which operator is used to **remove** a property from an object?', 'The `delete` operator removes a property from an object: `delete user.age`. It removes both the key and its value. Setting the property to `undefined` or `null` does not remove it.', 'easy', 'approved', '4fddc5c6-9d0f-4b38-9ecd-8124aad940de', 101, '2026-03-30T09:51:00.447Z', '2026-03-30T09:51:00.447Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('36b26d0b-e80d-4df0-afb0-d795b31ce626', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does the `"in"` operator do when used with an object?', 'The `in` operator checks whether a **property with the given key exists** in an object, returning `true` or `false`. Unlike comparing with `undefined`, it correctly handles cases where a property exists but its value is explicitly set to `undefined`.', 'medium', 'approved', '4fddc5c6-9d0f-4b38-9ecd-8124aad940de', 102, '2026-03-30T09:51:00.450Z', '2026-03-30T09:51:00.450Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('149ef757-da83-4ca4-99d8-048e71f00da6', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the output of the following loop?

```js
let user = { name: "John", age: 30, isAdmin: true };
for (let key in user) {
  alert(key);
}
```', 'The `for...in` loop iterates over all **enumerable property keys** of an object. It will output each key name as a string: `"name"`, `"age"`, `"isAdmin"` — in creation order (since they are non-integer keys).', 'easy', 'approved', '4fddc5c6-9d0f-4b38-9ecd-8124aad940de', 103, '2026-03-30T09:51:00.452Z', '2026-03-30T09:51:00.452Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d7fb25a7-c6fb-44c3-b5ec-68bbaa8b8cdb', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Given `function makeUser(name, age) { return { name, age }; }`, what does `{ name, age }` demonstrate?', 'This is **property value shorthand**. When a variable name matches the desired property key, you can write just the variable name once instead of `name: name`. It is syntactic sugar that makes code more concise.', 'medium', 'approved', '4fddc5c6-9d0f-4b38-9ecd-8124aad940de', 104, '2026-03-30T09:51:00.454Z', '2026-03-30T09:51:00.454Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('60ae0f06-4a6f-4e9d-b107-63e46940125a', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does the following code output?

```js
let user = { name: ''John'' };
let admin = user;
admin.name = ''Pete'';
alert(user.name);
```', 'Objects are stored and copied **by reference**. When `admin = user` is executed, both variables point to the **same** object in memory. Modifying `admin.name` also changes `user.name` because they reference the same object. The output is `''Pete''`.', 'easy', 'approved', '55f88fe3-f3a6-4a8b-afdd-7753fa453ff5', 105, '2026-03-30T09:51:11.645Z', '2026-03-30T09:51:11.645Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7737bcb5-49ed-4ce0-8af0-327854db11f3', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the result of comparing two independently created empty objects with `==`?

```js
let a = {};
let b = {};
alert(a == b);
```', 'The `==` operator for objects compares **references**, not structure. `a` and `b` are two separate objects in memory, so they hold different references. Even though they look alike, `a == b` is `false`.', 'medium', 'approved', '55f88fe3-f3a6-4a8b-afdd-7753fa453ff5', 106, '2026-03-30T09:51:11.649Z', '2026-03-30T09:51:11.649Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('49f7d169-5c8f-468a-bee7-129add30d2a5', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does `Object.assign({}, user)` produce?', '`Object.assign(dest, ...sources)` copies all enumerable own properties from source objects into `dest`. Passing an empty object `{}` as the destination returns a **shallow clone** of `user` — a new independent object with copies of all top-level properties.', 'easy', 'approved', '55f88fe3-f3a6-4a8b-afdd-7753fa453ff5', 107, '2026-03-30T09:51:11.651Z', '2026-03-30T09:51:11.651Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('6aae6e4d-64bb-471e-8a8a-3b5784b0a6e3', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which modern built-in function performs a **deep clone** of an object, including nested objects?', '`structuredClone(object)` creates a full deep copy of the object, recursively cloning nested objects. `Object.assign` only does a shallow copy. `JSON.parse(JSON.stringify(...))` is a common workaround but `structuredClone` is the modern standard.', 'medium', 'approved', '55f88fe3-f3a6-4a8b-afdd-7753fa453ff5', 108, '2026-03-30T09:51:11.653Z', '2026-03-30T09:51:11.653Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('23c00c7f-99ec-4702-9c07-016beb324c2d', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'A `const` object is declared as follows. What happens when line `(*)` runs?

```js
const user = { name: "John" };
user.name = "Pete"; // (*)
```', '`const` prevents reassigning the *variable binding* (`user = ...`), but the object itself is mutable. Properties of a `const` object can be freely changed. Line `(*)` succeeds and `user.name` becomes `"Pete"`.', 'medium', 'approved', '55f88fe3-f3a6-4a8b-afdd-7753fa453ff5', 109, '2026-03-30T09:51:11.655Z', '2026-03-30T09:51:11.655Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d2897cde-d88d-47e8-8866-533dd91051b9', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does `fruits.at(-1)` return for this array?

```js
let fruits = ["Apple", "Orange", "Plum"];
```', '`arr.at(i)` with a negative index steps back from the end of the array. `at(-1)` returns the **last** element, which is `"Plum"`. It is equivalent to `fruits[fruits.length - 1]`.', 'easy', 'approved', '45d12dc0-fdf6-4b6a-a53c-b9b9ef192b87', 110, '2026-03-30T09:51:22.455Z', '2026-03-30T09:51:22.455Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('5fa28a1f-2dfd-4ef8-a9df-d5a596c86c79', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Why is `push/pop` generally faster than `shift/unshift` on a large array?', '`push/pop` operate on the **end** of the array. No elements need to be moved or re-indexed. `shift/unshift` operate on the **beginning**, requiring every remaining element to be renumbered and shifted in memory, which is an O(n) operation.', 'medium', 'approved', '45d12dc0-fdf6-4b6a-a53c-b9b9ef192b87', 111, '2026-03-30T09:51:22.457Z', '2026-03-30T09:51:22.457Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('765625cb-7de9-4f9b-af17-f9640e7a1d6b', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which loop form is recommended when iterating over array **values** in modern JavaScript?', '`for...of` is the modern, idiomatic way to iterate over array values. `for...in` should **not** be used on arrays because it iterates over all enumerable properties (including non-numeric ones if added) and is optimised for generic objects, making it 10-100x slower.', 'easy', 'approved', '45d12dc0-fdf6-4b6a-a53c-b9b9ef192b87', 112, '2026-03-30T09:51:22.459Z', '2026-03-30T09:51:22.459Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f8ffb2ae-3013-49ce-b3d4-67a20e8e2d35', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the result of `arr.length = 0` on an array with existing items?', 'The `length` property is writable. **Decreasing** it truncates the array — elements beyond the new length are removed irreversibly. Setting it to `0` empties the array. The process is irreversible: restoring `length` to its original value does not bring the items back.', 'medium', 'approved', '45d12dc0-fdf6-4b6a-a53c-b9b9ef192b87', 113, '2026-03-30T09:51:22.460Z', '2026-03-30T09:51:22.460Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('15482b8d-8e1b-43ff-adcc-e305c67a4284', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does `new Array(2)` create in JavaScript?', 'When `Array` is called with one numeric argument, that number becomes the array length. `new Array(2)` creates an array with length `2` and two empty slots, not an array containing the number `2`.

That is different from `[2]`, which creates an array whose first element is the number `2`.', 'medium', 'approved', '45d12dc0-fdf6-4b6a-a53c-b9b9ef192b87', 114, '2026-03-30T09:51:22.462Z', '2026-03-30T23:52:03.816Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7d9b50c0-4820-4a71-a2ba-507ef6444ffc', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'After this code runs, what value does `arr` have?', '`splice(1, 1)` modifies `arr` in place by removing one element starting at index `1`, so the array becomes `["I", "JavaScript"]`.

The original version asked what the code "produces" while calling `alert(arr)`, which is ambiguous because `alert` displays the array as the string `I,JavaScript`. Asking for the value of `arr` removes that ambiguity.', 'easy', 'approved', '29b62c10-bb65-4c17-b470-19415ead6386', 115, '2026-03-30T09:51:33.254Z', '2026-03-30T23:52:03.817Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b534d893-e9e0-4a70-a964-a1fc2811f85d', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does `arr.find(fn)` return when **no element** satisfies the condition?', '`find()` iterates and returns the **first** element for which the callback returns `true`. If no element matches, it returns `undefined` — not `null`, `-1`, or `false`.', 'easy', 'approved', '29b62c10-bb65-4c17-b470-19415ead6386', 116, '2026-03-30T09:51:33.257Z', '2026-03-30T09:51:33.257Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('67d50840-0b95-48fe-9649-8262e4d72181', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which statement about `arr.filter(fn)` is correct?', '`filter()` returns a **new array** of all elements for which the callback returns `true`. If nothing matches, it returns an empty array. It does not modify the original array.', 'easy', 'approved', '29b62c10-bb65-4c17-b470-19415ead6386', 117, '2026-03-30T09:51:33.259Z', '2026-03-30T09:51:33.259Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3b673ca0-4521-4177-a291-7f1acc171049', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'How can you reliably check whether a value is an array in JavaScript?', '`Array.isArray(value)` is the reliable way to check for arrays. `typeof []` returns `"object"` — the same as for plain objects — so it cannot distinguish between them. `instanceof Array` can fail across different iframes.', 'medium', 'approved', '29b62c10-bb65-4c17-b470-19415ead6386', 118, '2026-03-30T09:51:33.260Z', '2026-03-30T09:51:33.260Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f9b6e8ec-0574-4e60-8b99-86c4caaa562b', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does `arr.reduce(fn, initial)` ultimately return?', '`reduce()` calls `fn` for each element, passing the result (accumulator) from the previous call along. After the last element, it returns the **final accumulated value** — a single value (e.g. a sum, a product, or any computed result).', 'medium', 'approved', '29b62c10-bb65-4c17-b470-19415ead6386', 119, '2026-03-30T09:51:33.262Z', '2026-03-30T09:51:33.262Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3892c886-9aaa-4c87-9ec6-23aa6cdfb7bf', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the output of the following code?

```js
const a = [1, 2, 3];
const b = a;
b.push(4);
console.log(a.length);
```', 'Just like objects, arrays are stored **by reference**. `b = a` copies the reference, not the array itself. Both `a` and `b` point to the same array. After `b.push(4)`, the array has four elements, so `a.length` is `4`.

This is the same "copy by reference" behaviour described in the object-copy article — arrays are a special kind of object.', 'medium', 'approved', '0cec46f7-191c-4534-9c48-1993ba26cf3b', 120, '2026-03-30T09:51:44.732Z', '2026-03-30T09:51:44.732Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('caed7812-fbf5-4514-b883-5f44b006d399', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'You have an array of user objects. Which expression correctly produces an array of all user names?

```js
const users = [
  { name: "Alice", age: 25 },
  { name: "Bob",   age: 30 },
];
```', '`map()` transforms each element using a callback and returns a **new array** of results. Using dot notation inside `map`, `user.name` accesses the `name` property of each object — combining knowledge of object property access with array transformation methods.', 'medium', 'approved', '0cec46f7-191c-4534-9c48-1993ba26cf3b', 121, '2026-03-30T09:51:44.734Z', '2026-03-30T09:51:44.734Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('18c7f133-372f-4625-bf01-39b98823521b', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'An object and an array each contain similar data. Which statement is **true** about how `typeof` treats them?', '`typeof` returns `"object"` for **both** plain objects `{}` and arrays `[]`. Arrays are a special kind of object in JavaScript — they are not a separate type. To distinguish an array from a plain object, use `Array.isArray(value)`.', 'medium', 'approved', '0cec46f7-191c-4534-9c48-1993ba26cf3b', 122, '2026-03-30T09:51:44.736Z', '2026-03-30T09:51:44.736Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('594b99b0-a136-44c3-87cb-b9ed66801d4c', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does the following snippet print, and why?

```js
const person = { name: "Ana" };
const clone = Object.assign({}, person);
clone.name = "Bia";
console.log(person.name);
```', '`Object.assign({}, person)` creates a **shallow clone** — a new independent object with copies of all top-level properties. Changing `clone.name` (a primitive string) does **not** affect `person.name`. The output is `"Ana"`.

If `name` had been a nested object instead of a string, both would share the same reference.', 'medium', 'approved', '0cec46f7-191c-4534-9c48-1993ba26cf3b', 123, '2026-03-30T09:51:44.738Z', '2026-03-30T09:51:44.738Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('68bd5aed-11f3-48b6-b4ac-5230490a4ce9', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Consider this code. What is stored inside `result`?

```js
const products = [
  { name: "pen",   price: 1 },
  { name: "book",  price: 12 },
  { name: "ruler", price: 3 },
];
const result = products
  .filter(p => p.price > 2)
  .map(p => p.name);
```', '`filter` first keeps only products with `price > 2`: `book` (12) and `ruler` (3). `map` then extracts the `.name` property from each. The final result is `["book", "ruler"]`.

This combines object property access (dot notation) with two array transformation methods chained together.', 'medium', 'approved', '0cec46f7-191c-4534-9c48-1993ba26cf3b', 124, '2026-03-30T09:51:44.740Z', '2026-03-30T09:51:44.740Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('872fab6e-8281-4d21-911f-576fa925b25e', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What value will `childAllowance` have after this code runs when `shoppingDone` is `false`?

```js
let shoppingDone = false;
let childAllowance;

if (shoppingDone === true) {
  childAllowance = 10;
} else {
  childAllowance = 5;
}
```', 'Because `shoppingDone` is `false`, the `if` condition evaluates to `false` and the `else` block executes, assigning `5` to `childAllowance`.', 'easy', 'approved', '939db0b0-ef18-46f0-bbeb-bb702370a04f', 125, '2026-03-30T10:37:33.688Z', '2026-03-30T10:37:33.688Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3f0ff531-2092-4e80-a286-bc0bc84755b9', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which of the following correctly describes the ternary operator syntax in JavaScript?', 'The ternary operator takes the form `condition ? valueIfTrue : valueIfFalse`. It evaluates the condition and returns one of two values depending on whether it is truthy or falsy.

Example:
```js
const greeting = isBirthday
  ? ''Happy birthday!''
  : ''Good morning!'';
```', 'easy', 'approved', '939db0b0-ef18-46f0-bbeb-bb702370a04f', 126, '2026-03-30T10:37:33.690Z', '2026-03-30T10:37:33.690Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d4cc735d-abab-43d5-b8e4-c5372c1d4c4c', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'In a `switch` statement, what is the role of the `break` keyword at the end of each `case` block?', 'The `break` statement exits the `switch` block immediately after the matched case finishes executing. Without it, execution would ''fall through'' and continue running the code in the next `case` block.', 'easy', 'approved', '939db0b0-ef18-46f0-bbeb-bb702370a04f', 127, '2026-03-30T10:37:33.692Z', '2026-03-30T10:37:33.692Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('90a6eeaa-c19c-4574-b5cb-6019b0b61fc7', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which of the following values evaluates to `false` when used as a condition in a JavaScript `if` statement?', 'In JavaScript, `0` is a falsy value — it converts to `false` when used in a boolean context. By contrast, `"false"` (a non-empty string), `[]` (an empty array), and `{}` (an empty object) are all truthy.', 'medium', 'approved', '939db0b0-ef18-46f0-bbeb-bb702370a04f', 128, '2026-03-30T10:37:33.694Z', '2026-03-30T10:37:33.694Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('726b7321-05fd-49d8-9fd4-b85f7ccf396b', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'According to the MDN guide on conditionals, when is a `switch` statement preferred over `if...else if` chains?', 'A `switch` statement is best suited for cases where you have a single expression compared against many discrete exact values. For complex conditions involving ranges, logical operators, or non-equality tests, `if...else if` is more appropriate.', 'medium', 'approved', '939db0b0-ef18-46f0-bbeb-bb702370a04f', 129, '2026-03-30T10:37:33.696Z', '2026-03-30T10:37:33.696Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4e7b7b6e-7197-4f0c-b6aa-0a10c1044a44', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What will the following code display, and why?

```js
if ("0") {
  alert("Hello");
}
```', '`"0"` is a non-empty string, so it is truthy in JavaScript. That means the `if` body runs and `"Hello"` is displayed.

This is different from the number `0`, which is falsy. Common falsy values include `false`, `0`, `""`, `null`, `undefined`, and `NaN`.', 'medium', 'approved', '13a5bf67-0b45-47bb-85c1-dfd644098712', 130, '2026-03-30T10:37:47.425Z', '2026-03-30T23:57:05.975Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('5a4ad6c0-95bb-410e-9e37-77fe528cde53', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'When the `if (…)` statement evaluates its condition, what type does JavaScript first convert the expression to?', 'JavaScript converts the condition expression to a boolean before evaluating it. Any truthy value becomes `true` and any falsy value (`0`, `""`, `null`, `undefined`, `NaN`) becomes `false`.', 'easy', 'approved', '13a5bf67-0b45-47bb-85c1-dfd644098712', 131, '2026-03-30T10:37:47.428Z', '2026-03-30T10:37:47.428Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('db9dad85-5673-4d0c-80a8-020084ef9676', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which of the following correctly uses the ternary operator to assign a value based on a condition?', 'The ternary operator syntax is `condition ? valueIfTrue : valueIfFalse`. The condition is placed first, followed by `?`, then the value if truthy, `:`, and the value if falsy.

Example:
```js
let result = (a + b < 4) ? ''Below'' : ''Over'';
```', 'easy', 'approved', '13a5bf67-0b45-47bb-85c1-dfd644098712', 132, '2026-03-30T10:37:47.430Z', '2026-03-30T10:37:47.430Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d57270be-620c-4f73-9f4b-94c51cc5fb65', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'In a chained ternary expression like the one below, which condition is evaluated first?

```js
let message = (age < 3) ? ''Hi, baby!'' :
  (age < 18) ? ''Hello!'' :
  (age < 100) ? ''Greetings!'' :
  ''What an unusual age!'';
```', 'Evaluation proceeds from left to right. The first condition `age < 3` is checked first. If it is truthy, `''Hi, baby!''` is returned immediately and no further conditions are evaluated. Only if it is falsy does it cascade to the next condition.', 'medium', 'approved', '13a5bf67-0b45-47bb-85c1-dfd644098712', 133, '2026-03-30T10:37:47.433Z', '2026-03-30T10:37:47.433Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('700a5750-7588-4f54-8099-e68399e3eb23', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'According to javascript.info, what is the intended and recommended use of the ternary `?` operator?', 'The ternary operator is designed to return one value or another depending on a condition. It should not be used as a general replacement for `if` statements to execute code branches — that''s what `if` is for. Misusing `?` for side effects reduces readability.', 'medium', 'approved', '13a5bf67-0b45-47bb-85c1-dfd644098712', 134, '2026-03-30T10:37:47.435Z', '2026-03-30T10:37:47.435Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8f412901-e29b-4526-b766-9b50de6de955', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does the following expression evaluate to?

```js
alert(null || 2 || undefined);
```', 'The `||` operator returns the first truthy value it encounters. `null` is falsy, so it moves on. `2` is truthy, so it is returned immediately. `undefined` is never evaluated.

Example:
```js
alert(null || 1);       // 1
alert(null || 0 || 1); // 1 (the first truthy value)
```', 'medium', 'approved', 'ef6dd64b-f848-43df-885f-be422006b545', 135, '2026-03-30T10:37:57.879Z', '2026-03-30T10:37:57.879Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('edc6fac3-983b-47ea-b410-32f93f6a79c5', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does `alert(1 && null && 2)` output?', 'The `&&` operator returns the first falsy value it finds. `1` is truthy so evaluation continues. `null` is falsy so it is returned immediately and `2` is never evaluated.

Example:
```js
alert(null && 5); // null
alert(0 && "no matter what"); // 0
```', 'medium', 'approved', 'ef6dd64b-f848-43df-885f-be422006b545', 136, '2026-03-30T10:37:57.883Z', '2026-03-30T10:37:57.883Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f3d8a9ed-996e-49d0-bdbe-b1d95357d227', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the correct precedence order from highest to lowest among `!` (NOT), `&&` (AND), and `||` (OR)?', 'The NOT `!` operator has the highest precedence of all logical operators, so it executes first. `&&` has higher precedence than `||`. This means `a && b || c && d` is interpreted as `(a && b) || (c && d)`.

Precedence (high to low): `!` → `&&` → `||`', 'medium', 'approved', 'ef6dd64b-f848-43df-885f-be422006b545', 137, '2026-03-30T10:37:57.885Z', '2026-03-30T10:37:57.885Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c1f54364-989e-4689-b464-bd459f39f2ca', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Given the following variables, what does the expression evaluate to?

```js
let firstName = "";
let lastName = "";
let nickName = "SuperCoder";

alert(firstName || lastName || nickName || "Anonymous");
```', '`||` returns the first truthy value. Both `firstName` and `lastName` are empty strings (falsy), so evaluation continues. `nickName` is `"SuperCoder"` which is truthy, so it is returned immediately. `"Anonymous"` is never evaluated.', 'easy', 'approved', 'ef6dd64b-f848-43df-885f-be422006b545', 138, '2026-03-30T10:37:57.887Z', '2026-03-30T10:37:57.887Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('38f38501-ddf2-4985-80f7-cee9f9865c32', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is ''short-circuit evaluation'' in the context of the `||` operator?', 'Short-circuit evaluation means `||` stops processing as soon as it finds the first truthy value and returns it immediately — without evaluating the remaining operands. This is significant when operands have side effects (like function calls).

Example:
```js
true || alert("not printed");  // alert never runs
false || alert("printed");     // alert runs
```', 'medium', 'approved', 'ef6dd64b-f848-43df-885f-be422006b545', 139, '2026-03-30T10:37:57.890Z', '2026-03-30T10:37:57.890Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4a202d7e-0cb1-47f7-8c98-01d656070e97', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What are the three parts separated by semicolons inside the parentheses of a standard `for` loop?

```js
for (___; ___; ___) {
  // code
}
```', 'The standard `for` loop has three parts: (1) an **initializer** — a variable set before the loop starts; (2) a **condition** — checked before each iteration and when falsy the loop stops; (3) a **final-expression** — runs after each iteration, typically incrementing the counter.

Example:
```js
for (let i = 1; i < 10; i++) {
  // i starts at 1, runs while i < 10, increments i each time
}
```', 'easy', 'approved', 'f9aac88d-80b3-4f8b-8743-7f6859c2ed1e', 140, '2026-03-30T10:38:08.789Z', '2026-03-30T10:38:08.789Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('fda63339-d924-43a4-9d35-21c328ce9438', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does the `break` statement do when used inside a loop?', 'The `break` statement immediately exits the entire loop, and code execution continues with whatever comes after the loop. It does not merely skip a single iteration — it terminates the loop entirely.

Example:
```js
for (const contact of contacts) {
  if (contact === searchName) {
    // found it!
    break; // exit the loop now
  }
}
```', 'easy', 'approved', 'f9aac88d-80b3-4f8b-8743-7f6859c2ed1e', 141, '2026-03-30T10:38:08.793Z', '2026-03-30T10:38:08.793Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8a90384d-be51-46c3-bdb1-b9f6fdfcad7e', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'When is `for...of` generally preferred over an index-based `for` loop for iterating through an array?', '`for...of` is simpler and less error-prone when you just want to process each item and don''t need to track the current index. An index-based `for` loop is better when you need to know the position of each item (e.g., to treat the last element differently).', 'medium', 'approved', 'f9aac88d-80b3-4f8b-8743-7f6859c2ed1e', 142, '2026-03-30T10:38:08.795Z', '2026-03-30T10:38:08.795Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f5610039-0900-4011-8df6-3a5e140ac9e0', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the key behavioral difference between a `while` loop and a `do...while` loop?', 'In a `while` loop the condition is checked **before** each execution of the body, so the body may never run if the condition starts as false. In a `do...while` loop the body executes **first**, then the condition is checked — guaranteeing at least one execution.', 'medium', 'approved', 'f9aac88d-80b3-4f8b-8743-7f6859c2ed1e', 143, '2026-03-30T10:38:08.797Z', '2026-03-30T10:38:08.797Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('47ab7b3c-9e76-4302-a4e3-88f756055cf4', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does the `continue` statement do inside a `for` loop?', 'The `continue` statement skips the remaining code in the **current** iteration and jumps to the next iteration (evaluating the loop condition first). Unlike `break`, it does not exit the loop entirely.

Example:
```js
for (let i = 1; i <= num; i++) {
  if (Math.floor(Math.sqrt(i)) !== Math.sqrt(i)) {
    continue; // skip non-perfect-squares
  }
  console.log(i);
}
```', 'easy', 'approved', 'f9aac88d-80b3-4f8b-8743-7f6859c2ed1e', 144, '2026-03-30T10:38:08.799Z', '2026-03-30T10:38:08.799Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('82ba9265-61a7-4f60-9769-357e3d47dc3a', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What will this `while` loop alert, and in what order?

```js
let i = 3;
while (i) {
  alert(i--);
}
```', 'The postfix `i--` returns the current value of `i` **before** decrementing it. So the loop alerts `3`, then `2`, then `1`. When `i` reaches `0`, the condition `while (i)` is falsy (0 is falsy) and the loop stops. `0` itself is never alerted because the postfix operator decrements after the value is passed to `alert`.

Order: 3 → 2 → 1.', 'medium', 'approved', '0e3ec32e-b41b-43c5-a092-ed5518b49a13', 145, '2026-03-30T10:38:19.258Z', '2026-03-30T10:38:19.258Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d2ce83de-61d8-48c0-9a06-3aa2334ccba5', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'In the `for` loop syntax `for (begin; condition; step)`, when does the `begin` part execute?', 'The `begin` part (the initializer) executes **exactly once** when the loop first starts. It does not repeat with each iteration. After that, only the `condition` and `step` are repeated.

```js
for (let i = 0; i < 3; i++) {
  // begin (let i = 0) runs once
  // condition (i < 3) checked before each iteration
  // step (i++) runs after each iteration
}
```', 'easy', 'approved', '0e3ec32e-b41b-43c5-a092-ed5518b49a13', 146, '2026-03-30T10:38:19.262Z', '2026-03-30T10:38:19.262Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('21dfe6d1-f1c2-4014-becb-103c59b8b780', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'According to javascript.info, when should you use the `do...while` loop form instead of `while`?', 'The `do...while` form should only be used when you want the loop body to execute **at least once** regardless of the condition. This is because `do...while` checks the condition after the body runs. In most other cases, the regular `while(…) {}` form is preferred.', 'medium', 'approved', '0e3ec32e-b41b-43c5-a092-ed5518b49a13', 147, '2026-03-30T10:38:19.265Z', '2026-03-30T10:38:19.265Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7e12844e-1e7a-4a00-a6df-04904a1f69ba', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does this loop print?

```js
for (let i = 0; i < 6; i++) {
  if (i % 2 === 0) continue;
  console.log(i);
}
```', '`continue` skips the rest of the current iteration and moves to the next one. Here, the loop skips even numbers (`0`, `2`, `4`) and logs only odd numbers.

So the output is `1`, then `3`, then `5`.', 'easy', 'approved', '0e3ec32e-b41b-43c5-a092-ed5518b49a13', 148, '2026-03-30T10:38:19.268Z', '2026-03-30T23:57:05.980Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2715959f-5959-4118-9ffe-dbcf0db89b57', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is a loop **label** used for in JavaScript?', 'Loop labels allow `break` or `continue` to target an **outer loop** from within a nested loop. Without a label, `break` only exits the innermost loop it is placed in.

Example:
```js
outer: for (let i = 0; i < 3; i++) {
  for (let j = 0; j < 3; j++) {
    if (!input) break outer; // exits both loops
  }
}
alert(''Done!'');
```', 'hard', 'approved', '0e3ec32e-b41b-43c5-a092-ed5518b49a13', 149, '2026-03-30T10:38:19.272Z', '2026-03-30T10:38:19.272Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c3e4cda4-2ae9-46a5-b583-1cc0535d47aa', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What type of equality check does a `switch` statement use when matching its expression against `case` values?', 'A `switch` statement uses **strict equality** (`===`) for all case comparisons. This means both the value and the type must match. A string `"3"` will not match a numeric `case 3:`.

Example:
```js
let arg = prompt("Enter a value?"); // user types 3 → arg is "3"
switch (arg) {
  case 3:
    alert(''Never executes!''); // "3" !== 3
    break;
  default:
    alert(''An unknown value''); // this runs
}
```', 'medium', 'approved', '9019a065-82c6-4492-8619-be0663b76fc0', 150, '2026-03-30T10:39:27.776Z', '2026-03-30T10:39:27.776Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2c1afcff-4284-4368-96f3-c97612a9cbd3', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What happens in a `switch` statement when a matched `case` block has **no** `break` statement?', 'Without a `break`, execution **falls through** to the next `case` and continues running code there — regardless of whether it matches — until either a `break` is encountered or the `switch` ends.

Example:
```js
let a = 4;
switch (a) {
  case 4:
    alert(''Exactly!''); // runs
  case 5:
    alert(''Too big'');  // also runs (fall-through!)
  default:
    alert("I don''t know"); // also runs
}
```', 'medium', 'approved', '9019a065-82c6-4492-8619-be0663b76fc0', 151, '2026-03-30T10:39:27.778Z', '2026-03-30T10:39:27.778Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('211d29c8-5a26-4ffd-8b68-68a0d4d1a76a', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What will the following `switch` statement output?

```js
let a = 2 + 2;

switch (a) {
  case 3:
    alert(''Too small'');
    break;
  case 4:
    alert(''Exactly!'');
    break;
  case 5:
    alert(''Too big'');
    break;
  default:
    alert("I don''t know such values");
}
```', '`a = 2 + 2 = 4`. The `switch` checks each case with strict equality. `case 3` does not match. `case 4` matches (4 === 4), so `''Exactly!''` is alerted, then `break` exits the switch.', 'easy', 'approved', '9019a065-82c6-4492-8619-be0663b76fc0', 152, '2026-03-30T10:39:27.779Z', '2026-03-30T10:39:27.779Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e8ea267a-70a5-4867-9e9b-bfa6253a945a', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'When a user types `3` into `prompt("Enter a value?")`, which `case` matches in this switch?

```js
let arg = prompt("Enter a value?");
switch (arg) {
  case ''0'':
  case ''1'':
    alert(''One or zero'');
    break;
  case ''2'':
    alert(''Two'');
    break;
  case 3:
    alert(''Never executes!'');
    break;
  default:
    alert(''An unknown value'');
}
```', '`prompt()` always returns a **string**. When the user types `3`, `arg` becomes `"3"` (string). The `switch` uses strict equality, so `"3" !== 3` (number) — `case 3` is not matched. No other case matches either, so the `default` block runs.

This is a common gotcha: always match the type of `prompt()` output (string) in your cases.', 'hard', 'approved', '9019a065-82c6-4492-8619-be0663b76fc0', 153, '2026-03-30T10:39:27.781Z', '2026-03-30T10:39:27.781Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0efec93d-b768-47ea-b9c0-b28ab54103b0', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which syntax correctly groups `case 3` and `case 5` together so they both run the same code block?', 'To group cases, you place them consecutively with no code between them and no `break`. The fall-through behavior means execution enters at the first matching case and continues until a `break`.

```js
case 3: // grouped
case 5:
  alert(''Three or five!'');
  break;
```

This works because with no `break` after `case 3`, execution falls through to `case 5`''s code.', 'medium', 'approved', '9019a065-82c6-4492-8619-be0663b76fc0', 154, '2026-03-30T10:39:27.783Z', '2026-03-30T10:39:27.783Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('15639996-d17e-4be4-a7ab-8a8f1ec592da', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does `alert(i)` output after this loop finishes?

```js
let i = 5;
while (i) {
  i--;
}
alert(i);
```', 'The `while (i)` condition is truthy as long as `i` is non-zero. `i` starts at `5` and is decremented each iteration: 5 → 4 → 3 → 2 → 1 → 0. When `i` reaches `0`, the condition `while (0)` is falsy (0 is a falsy value) so the loop exits. `alert(i)` then displays `0`.

This tests the knowledge that non-zero numbers are truthy and `0` is falsy — a key concept from both the ''while'' loop topic and the ''boolean conversion'' topic in conditionals.', 'medium', 'approved', 'ec97280e-1b4f-410a-96fe-75e230594765', 155, '2026-03-30T10:39:37.963Z', '2026-03-30T10:39:37.963Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('764acdac-ff0d-4296-a068-91d0c3bb30c6', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What output is produced by each iteration of this loop?

```js
for (let i = 0; i <= 2; i++) {
  switch (i) {
    case "0":
      alert("string zero");
      break;
    case 0:
      alert("number zero");
      break;
    default:
      alert("other: " + i);
  }
}
```', '`switch` uses strict equality (`===`). The loop variable `i` is always a **number** (0, 1, 2). For `i = 0`: `case "0"` (string) does NOT match `0` (number); `case 0` (number) DOES match, alerting `"number zero"`. For `i = 1` and `i = 2`: neither case matches, so `default` runs, alerting `"other: 1"` and `"other: 2"` respectively.

This is a classic trap: `case "0" !== case 0` because type matters in `switch`.', 'hard', 'approved', 'ec97280e-1b4f-410a-96fe-75e230594765', 156, '2026-03-30T10:39:37.965Z', '2026-03-30T10:39:37.965Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0a6d2b5c-92c2-4187-8432-e62dc41af0a5', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the value of `result` after this expression?

```js
let result = null || 0 || undefined || "hello" || "world";
```', 'The `||` operator returns the **first truthy value** it encounters. `null` is falsy, `0` is falsy, `undefined` is falsy — evaluation continues past all of these. `"hello"` is a non-empty string, which is truthy, so `"hello"` is returned immediately. `"world"` is never evaluated.

This combines knowledge of falsy values (null, 0, undefined) and the short-circuit behaviour of `||`.', 'medium', 'approved', 'ec97280e-1b4f-410a-96fe-75e230594765', 157, '2026-03-30T10:39:37.968Z', '2026-03-30T10:39:37.968Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4538abb0-ab78-4102-a401-9c1512b4a463', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'A developer writes this code intending to check if `x` equals `5`, `7`, or `10`:

```js
if (x === 5 || 7 || 10) {
  // run my code
}
```

What is the actual behaviour of this condition?', 'The condition `x === 5 || 7 || 10` is evaluated as `(x === 5) || 7 || 10`. Because `7` is a non-zero number (truthy), `7 || 10` is always `7` (truthy). So the entire condition is **always truthy** — the block runs regardless of `x`.

The correct way to write this is:
```js
if (x === 5 || x === 7 || x === 10)
```

This is a very common mistake when using `||` in conditions, covered in MDN''s conditionals article.', 'hard', 'approved', 'ec97280e-1b4f-410a-96fe-75e230594765', 158, '2026-03-30T10:39:37.970Z', '2026-03-30T10:39:37.970Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c1e3089f-a522-4ef6-ba22-e76dcfa8e66d', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What will `alert(found)` print, and why?

```js
let found = false;
for (let i = 0; i < 5; i++) {
  if (i === 3 && !found) {
    found = true;
    break;
  }
}
alert(found);
```', 'The loop iterates `i = 0, 1, 2, 3, ...`. When `i === 3`, the condition `i === 3 && !found` is evaluated: `3 === 3` is `true`, and `!found` is `!false = true`. So `true && true = true`. `found` is set to `true` and `break` exits the loop. `alert(found)` then displays `true`.

This combines `&&` logical operator, the `break` statement, and the `!` NOT operator — all key control flow concepts.', 'medium', 'approved', 'ec97280e-1b4f-410a-96fe-75e230594765', 159, '2026-03-30T10:39:37.971Z', '2026-03-30T10:39:37.971Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('229246fb-b7e7-46a6-aa56-bbbeecd33a34', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What term describes a function that is part of an object?', 'Functions that belong to objects are called **methods**. Regular standalone functions are simply called functions. The distinction matters when discussing `this` binding and object-oriented patterns.', 'easy', 'approved', '99ba9101-f829-40af-9271-836b525f45e5', 160, '2026-03-30T19:29:07.849Z', '2026-03-30T19:29:07.849Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('398ccb60-635e-41dd-9e50-6b6ab586abae', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which form of function creation is **hoisted**, allowing you to call the function before its definition appears in the source code?', 'A **function declaration** (e.g., `function myFunc() {}`) is hoisted to the top of its scope, so it can be called anywhere in that scope — even before the line where it is written. A function expression is not hoisted.', 'easy', 'approved', '99ba9101-f829-40af-9271-836b525f45e5', 161, '2026-03-30T19:29:07.869Z', '2026-03-30T19:29:07.869Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1452c735-8d24-44c8-8c6d-977ebb6c4786', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the default separator used by `Array.prototype.join()` when no argument is provided?', '`join()` separates array elements with a comma (`,`) when called without arguments. Passing a string argument, such as `'' ''`, uses that string as the separator instead.

Example:
```js
[''I'', ''love'', ''JS''].join();  // ''I,love,JS''
[''I'', ''love'', ''JS''].join('' ''); // ''I love JS''
```', 'easy', 'approved', '99ba9101-f829-40af-9271-836b525f45e5', 162, '2026-03-30T19:29:07.876Z', '2026-03-30T19:29:07.876Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c59204d6-d427-4132-91af-4eff92d42a5d', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which syntax correctly defines a default parameter value for the `name` parameter?', 'Default parameter values are specified with `=` directly in the parameter list: `function greet(name = ''Chris'') {}`. When the caller omits the argument, `name` receives the default value `''Chris''`.', 'easy', 'approved', '99ba9101-f829-40af-9271-836b525f45e5', 163, '2026-03-30T19:29:07.886Z', '2026-03-30T19:29:07.886Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('571a29a4-be29-4798-94dd-91f3482edd75', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Variables declared with `let` or `const` inside a function are accessible:', 'Variables declared with `let` or `const` inside a function are **scoped to that function**. They cannot be accessed from outside the function, which prevents naming conflicts and keeps code organized. This is called function scope (or block scope for `let`/`const`).', 'medium', 'approved', '99ba9101-f829-40af-9271-836b525f45e5', 164, '2026-03-30T19:29:07.892Z', '2026-03-30T19:29:07.892Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a5482402-2d82-4555-bc21-d6b26ba1c45c', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What keyword begins a function definition in JavaScript?', 'The `function` keyword is what tells JavaScript you are defining a function. It is followed by the function name, parentheses for parameters, and curly braces containing the function body.', 'easy', 'approved', '5fb5345c-079f-4643-ad65-c391288eb0cf', 165, '2026-03-30T19:29:28.767Z', '2026-03-30T19:29:28.767Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('6df83701-318f-4f00-9cef-aeb8f04fe6f8', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which DOM method creates a new HTML element dynamically?', '`document.createElement(tagName)` creates a new element node of the specified type. The new element is detached from the document until explicitly appended using methods like `appendChild()`.', 'easy', 'approved', '5fb5345c-079f-4643-ad65-c391288eb0cf', 166, '2026-03-30T19:29:28.774Z', '2026-03-30T19:29:28.774Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('bf4e1319-77d9-44d5-a1b8-ceb6bb90a9e3', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'When passing a function as an event listener callback, why should you write `btn.addEventListener(''click'', displayMessage)` instead of `btn.addEventListener(''click'', displayMessage())`?', 'When you include `()` after a function name in an event listener, JavaScript **immediately calls** that function during registration rather than waiting for the event. Without `()`, you pass a **reference** to the function so it only runs when the event fires.

Example:
```js
// Correct — runs on click:
btn.addEventListener(''click'', displayMessage);

// Wrong — runs immediately at registration:
btn.addEventListener(''click'', displayMessage());
```', 'medium', 'approved', '5fb5345c-079f-4643-ad65-c391288eb0cf', 167, '2026-03-30T19:29:28.780Z', '2026-03-30T19:29:28.780Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ca0b7ac0-900d-4aaa-bda7-dece39bbe049', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which method is used to attach a child element inside another element in the DOM?', '`Node.appendChild(child)` inserts a node as the last child of a parent node. The element must first exist in memory (created via `createElement`) before it can be appended.', 'easy', 'approved', '5fb5345c-079f-4643-ad65-c391288eb0cf', 168, '2026-03-30T19:29:28.784Z', '2026-03-30T19:29:28.784Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('322be5aa-7147-432d-b246-5387d2419cd2', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'You want a click handler to call `displayMessage(''Hello!'')` only when the button is clicked. Which pattern correctly delays that call until the click event fires?', 'Wrap the function call in another function so `addEventListener` receives a callback reference instead of running `displayMessage` immediately.

```js
btn.addEventListener(''click'', () => displayMessage(''Hello!''));
```

By contrast, `displayMessage(''Hello!'')` runs right away during event-listener registration. `bind()` can also be used, but the wrapper-function pattern is the clearest introductory answer here.', 'medium', 'approved', '5fb5345c-079f-4643-ad65-c391288eb0cf', 169, '2026-03-30T19:29:28.787Z', '2026-03-30T23:57:05.983Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('00f61f50-1494-42fd-a24c-361979772985', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What keyword is used inside a function to send a value back to the calling code?', 'The `return` keyword exits a function and optionally passes a value back to wherever the function was called. Without `return`, a function implicitly returns `undefined`.', 'easy', 'approved', '1dff3cae-5194-4b91-bf6d-c78dded14433', 170, '2026-03-30T19:29:45.026Z', '2026-03-30T19:29:45.026Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('31634b64-c842-4dbb-becf-94b265dd1df5', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does a function return when it has no `return` statement?', 'A function that lacks a `return` statement (or has a bare `return;`) implicitly returns `undefined`. This is important to remember when storing function results in variables.', 'easy', 'approved', '1dff3cae-5194-4b91-bf6d-c78dded14433', 171, '2026-03-30T19:29:45.034Z', '2026-03-30T19:29:45.034Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('cf906f57-1285-45cf-b3fe-279ee53124da', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Given the following code, what value is stored in `result`?

```js
function squared(num) {
  return num * num;
}
const result = squared(4);
```', '`squared(4)` returns `4 * 4 = 16`. The `return` statement evaluates the expression and sends the result back to the call site, where it is stored in `result`.', 'easy', 'approved', '1dff3cae-5194-4b91-bf6d-c78dded14433', 172, '2026-03-30T19:29:45.039Z', '2026-03-30T19:29:45.039Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0bff41f3-35b0-42dd-8446-d54e87753c27', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'When are return values most useful in a function?', 'Return values shine when a function is an **intermediate calculation step** — it computes a value that the calling code then uses for further operations. Functions that only produce side-effects (like displaying a message box) typically do not need to return a value.', 'medium', 'approved', '1dff3cae-5194-4b91-bf6d-c78dded14433', 173, '2026-03-30T19:29:45.041Z', '2026-03-30T19:29:45.041Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d83d600d-253c-4c96-94f4-062d210070bd', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does the following `factorial` function return when called with `0`?

```js
function factorial(num) {
  if (num < 0) return undefined;
  if (num === 0) return 1;
  let x = num - 1;
  while (x > 1) { num *= x; x--; }
  return num;
}
```', 'The function has an explicit early-return: `if (num === 0) return 1;`. By mathematical definition, 0! = 1, so the function correctly returns `1` for an input of `0`.', 'medium', 'approved', '1dff3cae-5194-4b91-bf6d-c78dded14433', 174, '2026-03-30T19:29:45.048Z', '2026-03-30T19:29:45.048Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2f28877c-40c0-449e-ba7a-5ed07034e829', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the difference between a **parameter** and an **argument** in JavaScript functions?', 'A **parameter** is the variable listed in the function declaration; an **argument** is the actual value passed when calling the function.

Example:
```js
function greet(name) {}  // ''name'' is a parameter
greet(''Alice'');           // ''Alice'' is an argument
```', 'easy', 'approved', 'ca57063e-f7fa-48cb-87b0-1bad1d7e581f', 175, '2026-03-30T19:30:06.127Z', '2026-03-30T19:30:06.127Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('5ae3fd05-2a22-471b-87bb-328917a8c9d0', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does a function return if no `return` statement is present or a bare `return;` is used?', 'A function with no `return` statement (or only `return;`) returns `undefined`. This is consistent with JavaScript''s design: every function call is an expression, and its value is `undefined` when nothing is explicitly returned.', 'easy', 'approved', 'ca57063e-f7fa-48cb-87b0-1bad1d7e581f', 176, '2026-03-30T19:30:06.133Z', '2026-03-30T19:30:06.133Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f3290519-53d4-4976-bd3b-18230f93344f', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'A function reads (but does not redeclare) a variable from its outer scope. What happens to that outer variable if the function modifies it?', 'When a function modifies an **outer variable** (one declared outside the function and not shadowed by a local variable with the same name), the change is visible in the outer scope as well.

```js
let name = ''John'';
function change() { name = ''Bob''; }
change();
console.log(name); // ''Bob''
```', 'medium', 'approved', 'ca57063e-f7fa-48cb-87b0-1bad1d7e581f', 177, '2026-03-30T19:30:06.138Z', '2026-03-30T19:30:06.138Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3afc292f-108c-4d1f-86d5-9572db9194ac', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which common function-naming prefix convention signals that a function **returns a boolean** result after performing a check?', 'By convention, function names starting with `"check…"` indicate they verify something and return a boolean (true/false). Other common prefixes: `"get…"` returns a value, `"create…"` creates something, `"show…"` displays something.', 'easy', 'approved', 'ca57063e-f7fa-48cb-87b0-1bad1d7e581f', 178, '2026-03-30T19:30:06.144Z', '2026-03-30T19:30:06.144Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('032fcf1e-bd83-4cb1-8d82-bac4fe938560', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What value does a local variable declared inside a function hold **outside** that function?', 'Local variables are **not accessible outside** the function they are declared in. Attempting to read a local variable from the global scope results in a `ReferenceError`.', 'easy', 'approved', 'ca57063e-f7fa-48cb-87b0-1bad1d7e581f', 179, '2026-03-30T19:30:06.147Z', '2026-03-30T19:30:06.147Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('cbef5985-64f9-4f5d-a7e9-710a9b3d85df', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is a **function expression** in JavaScript?', 'A function expression is a function created **as part of an expression** (e.g., assigned to a variable). It differs from a function declaration, which is a standalone statement.

```js
// Function Expression
let sayHi = function() { alert(''Hello''); };
```', 'easy', 'approved', '7ec07b19-3487-41a3-a5e0-213c6c12bdc5', 180, '2026-03-30T19:30:25.403Z', '2026-03-30T19:30:25.403Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('38e38551-0e9b-434c-ac31-5226bff8a366', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Can a **Function Declaration** be called before it appears in the source code?', 'Yes — Function Declarations are **hoisted**. Before any code runs, JavaScript processes all Function Declarations and makes them available throughout their scope. Function Expressions do not enjoy this behaviour.', 'easy', 'approved', '7ec07b19-3487-41a3-a5e0-213c6c12bdc5', 181, '2026-03-30T19:30:25.410Z', '2026-03-30T19:30:25.410Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a542d5ad-b864-432c-8623-8a8da9551dd2', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is a **callback function**?', 'A callback function is a function **passed as an argument** to another function, intended to be called at a later point — for example when an event occurs or an asynchronous operation finishes.

```js
function ask(question, yes, no) {
  if (confirm(question)) yes();
  else no();
}
ask(''Agree?'', function() { alert(''Yes!''); }, function() { alert(''No!''); });
```', 'easy', 'approved', '7ec07b19-3487-41a3-a5e0-213c6c12bdc5', 182, '2026-03-30T19:30:25.414Z', '2026-03-30T19:30:25.414Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d0005625-0547-4884-b1f0-040873a91ab0', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Why does a Function Expression have a semicolon at the end, while a Function Declaration typically does not?

```js
// A
function sayHi() { /* … */ }

// B
let sayHi = function() { /* … */ };
```', 'In example **B**, the semicolon belongs to the **variable declaration / assignment statement** (`let sayHi = …;`), not to the function syntax itself. The function expression is just the value being assigned.

JavaScript can often insert semicolons automatically, but in normal style this statement is written with a trailing semicolon. A standalone Function Declaration like example **A** is not written as that kind of assignment statement, so it typically appears without one.', 'medium', 'approved', '7ec07b19-3487-41a3-a5e0-213c6c12bdc5', 183, '2026-03-30T19:30:25.419Z', '2026-03-30T23:57:05.984Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7f6c6117-fec3-49d6-9ffe-7fe8916a8dba', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'A Function Declaration is inside an `if` block. In strict mode, what is its visibility **outside** that block?', 'In **strict mode**, a Function Declaration inside a code block (`{}`) is **limited to that block**. It is not visible outside. To make a function conditionally available outside a block, use a Function Expression assigned to a variable declared outside the block.

```js
let welcome;
if (age < 18) {
  welcome = function() { alert(''Hello!''); };
} else {
  welcome = function() { alert(''Greetings!''); };
}
welcome(); // works
```', 'medium', 'approved', '7ec07b19-3487-41a3-a5e0-213c6c12bdc5', 184, '2026-03-30T19:30:25.422Z', '2026-03-30T19:30:25.422Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('41c1d4c0-5dcf-47f1-b7ca-bb8cc10a6029', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which of the following correctly rewrites this function as an arrow function?

```js
let double = function(n) { return n * 2; };
```', '`n => n * 2` is the concise arrow function form. When there is exactly **one parameter**, parentheses can be omitted. When the body is a **single expression**, curly braces and `return` can also be omitted — the expression is implicitly returned.', 'easy', 'approved', '5bbb6524-5939-40f5-a21b-01199d5a3ca5', 185, '2026-03-30T19:30:44.332Z', '2026-03-30T19:30:44.332Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3b5865fc-2950-4916-b5ce-bfa381395cb3', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'An arrow function with **no parameters** must be written with:', 'Even when there are no parameters, arrow functions require an **empty pair of parentheses** before the `=>`.

```js
let sayHi = () => alert(''Hello!'');
```', 'easy', 'approved', '5bbb6524-5939-40f5-a21b-01199d5a3ca5', 186, '2026-03-30T19:30:44.336Z', '2026-03-30T19:30:44.336Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('02b34395-dbb6-4e78-aac5-ad8c4db2ff20', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'When does a multiline arrow function need an explicit `return` statement?', 'When the arrow function body is wrapped in **curly braces** (`{}`), an explicit `return` is required — just like a regular function. Without curly braces (single-expression form), the expression is implicitly returned.', 'easy', 'approved', '5bbb6524-5939-40f5-a21b-01199d5a3ca5', 187, '2026-03-30T19:30:44.339Z', '2026-03-30T19:30:44.339Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('83c6252d-1f7b-486a-bffc-a7bfba9d4420', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is the result of calling `sum(1, 2)` with the arrow function below?

```js
let sum = (a, b) => {
  let result = a + b;
  return result;
};
```', 'The function explicitly returns `a + b = 1 + 2 = 3`. Because the body uses curly braces, `return` is mandatory — and it is present here, so the function correctly returns `3`.', 'easy', 'approved', '5bbb6524-5939-40f5-a21b-01199d5a3ca5', 188, '2026-03-30T19:30:44.341Z', '2026-03-30T19:30:44.341Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f20b60f9-fa57-4b3b-bde8-809e70758f00', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Arrow functions are described as coming in two flavors. Which of the following correctly describes **both** flavors?', 'Arrow functions have two forms:
1. **Without curly braces** — `(...args) => expression`: the expression is evaluated and implicitly returned.
2. **With curly braces** — `(...args) => { body }`: multiple statements are allowed, but `return` must be explicit.', 'medium', 'approved', '5bbb6524-5939-40f5-a21b-01199d5a3ca5', 189, '2026-03-30T19:30:44.342Z', '2026-03-30T19:30:44.342Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('bfedcef7-1774-4ea3-91d6-205ead36eca2', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Consider the following code. What does it log?

```js
let value = greet();
console.log(value);

function greet() {
  console.log(''Hi!'');
}
```', 'Two things happen:
1. `greet()` IS callable before its definition because it is a **function declaration** (hoisted).
2. `greet()` has no `return` statement, so it returns `undefined`.

Output:
```
Hi!
undefined
```

This question combines **hoisting** (from function-expressions) with **implicit return values** (from function-basics and return-values).', 'medium', 'approved', '1a8b8b5f-b34d-4d42-a754-98d8f1ee7818', 190, '2026-03-30T19:31:06.597Z', '2026-03-30T19:31:06.597Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7423e26f-3cde-4384-8b99-3a6f8bc6e51c', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What does the arrow function below return when called as `process(5)`?

```js
const process = n => { n * 2; };
```', 'The arrow function uses **curly braces** but has no `return` statement. In the curly-brace form, a value is only returned with an explicit `return`. Without it the function returns `undefined`.

To fix it:
```js
const process = n => n * 2;      // implicit return (no braces)
const process = n => { return n * 2; }; // explicit return (braces)
```', 'medium', 'approved', '1a8b8b5f-b34d-4d42-a754-98d8f1ee7818', 191, '2026-03-30T19:31:06.605Z', '2026-03-30T19:31:06.605Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4f1b6357-64d6-4489-9fbf-5c557ec652d5', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'A developer writes this event listener. The message box appears **immediately** when the page loads, not when the button is clicked. What is the cause?

```js
btn.addEventListener(''click'', displayMessage(''Error!'', ''warning''));
```', 'Adding `()` after `displayMessage` **invokes** the function immediately during `addEventListener` registration. The return value (likely `undefined`) is then registered as the ''callback'', so nothing happens on click.

Correct form:
```js
btn.addEventListener(''click'', () => displayMessage(''Error!'', ''warning''));
```

This question combines the **function invocation operator** (from MDN Build your own function) with **passing functions as values** (from javascript.info function-expressions).', 'medium', 'approved', '1a8b8b5f-b34d-4d42-a754-98d8f1ee7818', 192, '2026-03-30T19:31:06.608Z', '2026-03-30T19:31:06.608Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1ed6d01e-fc9a-453f-b0ee-f09ccf0da527', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'What is logged by the following code?

```js
let x = 10;

function outer() {
  let x = 20;
  function inner() {
    console.log(x);
  }
  inner();
}
outer();
```', '`inner()` reads `x`. It has no local `x`, so it looks up the scope chain and finds `x = 20` inside `outer` — the **closest enclosing scope**. The global `x = 10` is shadowed by `outer`''s local `x`.

This question blends **function scope and closures** (MDN Functions) with **local vs outer variables** (javascript.info function-basics).', 'medium', 'approved', '1a8b8b5f-b34d-4d42-a754-98d8f1ee7818', 193, '2026-03-30T19:31:06.612Z', '2026-03-30T19:31:06.612Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1e63b5d0-cc32-4280-b8e2-766753bed6f4', '7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'Which rewrite of `checkAge` removes the unnecessary `else` while keeping the same behavior as the original?

```js
function checkAge(age) {
  if (age > 18) {
    return true;
  } else {
    return confirm(''Did parents allow you?'');
  }
}
```', 'The original function already returns immediately when `age > 18`, so the `else` is unnecessary. The direct rewrite keeps the same branching logic without changing the structure of the condition itself.

```js
function checkAge(age) {
  if (age > 18) return true;
  return confirm(''Did parents allow you?'');
}
```

The arrow-function version using `||` can also produce the same result, which made the original multiple-choice set ambiguous.', 'medium', 'approved', '1a8b8b5f-b34d-4d42-a754-98d8f1ee7818', 194, '2026-03-30T19:31:06.616Z', '2026-03-30T23:57:05.984Z');
