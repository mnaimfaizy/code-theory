-- Table: questions
-- Generated: 2026-03-30T05:32:06.490Z
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


-- Data: 236 row(s)
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
