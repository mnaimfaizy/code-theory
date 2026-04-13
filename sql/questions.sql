-- Table: questions
-- Generated: 2026-04-13T05:48:40.421Z
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
  FOREIGN KEY ("certification_id") REFERENCES "certifications" ("id") ON DELETE CASCADE,
  FOREIGN KEY ("source_id") REFERENCES "question_sources" ("id")
);


-- Data: 1016 row(s)
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
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a5e986b2-7573-41b9-8289-cbe5c93258fd', '9872b186-472e-4391-a150-7239315fc8b1', 'Which inheritance chain correctly describes `document.body` from the most specific built-in class to the more general ones shown on the page?', 'The chapter shows that `document.body` is an `HTMLBodyElement`, which inherits from `HTMLElement`, then `Element`, then `Node`, then `EventTarget`.', 'medium', 'approved', '5fbd2cd6-e6dd-4be2-bcbd-900e68273e6b', 0, '2026-03-31T23:04:29.759Z', '2026-03-31T23:04:29.759Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7dfc2b31-31c4-4140-b84a-279d3203e651', '9872b186-472e-4391-a150-7239315fc8b1', 'What numeric `nodeType` value identifies a text node?', 'The page lists the key `nodeType` values used most often: `1` for element nodes, `3` for text nodes, and `9` for the document object.', 'easy', 'approved', '5fbd2cd6-e6dd-4be2-bcbd-900e68273e6b', 1, '2026-03-31T23:04:29.774Z', '2026-03-31T23:04:29.774Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f9a0196c-70ab-49c1-abdf-66f09ce285bc', '9872b186-472e-4391-a150-7239315fc8b1', 'Why can `nodeName` be used on comments or the `document` object while `tagName` cannot?', '`tagName` exists only for element nodes. `nodeName` is defined for any `Node`, so it can describe non-element nodes such as comments and the document itself.', 'medium', 'approved', '5fbd2cd6-e6dd-4be2-bcbd-900e68273e6b', 2, '2026-03-31T23:04:29.778Z', '2026-03-31T23:04:29.778Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7a470a99-0b8a-4868-ad57-c3afc06e9be8', '9872b186-472e-4391-a150-7239315fc8b1', 'If you want the literal text `<b>Winnie-the-Pooh!</b>` to appear on the page rather than a bold HTML element, which property should you assign to?', '`textContent` inserts text safely and treats special characters literally. `innerHTML` would parse the string as markup and create real HTML elements.', 'easy', 'approved', '5fbd2cd6-e6dd-4be2-bcbd-900e68273e6b', 3, '2026-03-31T23:04:29.784Z', '2026-03-31T23:04:29.784Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8918d9e6-369e-41f5-963c-6317504b39e9', '9872b186-472e-4391-a150-7239315fc8b1', 'After code replaces an element using `elem.outerHTML = ...`, what is true about the original JavaScript variable that referenced that element?', 'Assigning to `outerHTML` replaces the element in the DOM, but it does not mutate the original JavaScript object. The old variable still points to the removed element, not the new markup that took its place.', 'medium', 'approved', '5fbd2cd6-e6dd-4be2-bcbd-900e68273e6b', 4, '2026-03-31T23:04:29.788Z', '2026-03-31T23:04:29.788Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e650b053-96fa-4239-829b-7e94f9f77587', '9872b186-472e-4391-a150-7239315fc8b1', 'In the page''s terminology, what is a JavaScript host environment?', 'A host environment is the platform where JavaScript runs, such as a browser or Node.js runtime. It provides platform-specific objects and functions in addition to the JavaScript language core.', 'easy', 'approved', 'd42e547f-82a5-4c2a-bf8e-d8b497221ff4', 5, '2026-03-31T23:04:35.377Z', '2026-03-31T23:04:35.377Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('46bd692e-602e-45cd-9d47-c75f64e075f5', '9872b186-472e-4391-a150-7239315fc8b1', 'What are the two roles of the global `window` object in a browser?', 'The article says `window` serves both as the global object for JavaScript code and as the browser window object that exposes browser-specific methods and properties.', 'easy', 'approved', 'd42e547f-82a5-4c2a-bf8e-d8b497221ff4', 6, '2026-03-31T23:04:35.380Z', '2026-03-31T23:04:35.380Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0344dd54-4f38-4f4b-92b0-d78bfcbc4645', '9872b186-472e-4391-a150-7239315fc8b1', 'Which browser object lets code read the current URL and redirect the browser to another page?', 'The page lists `location` under the BOM and shows `location.href` being read and then reassigned to redirect the browser.', 'easy', 'approved', 'd42e547f-82a5-4c2a-bf8e-d8b497221ff4', 7, '2026-03-31T23:04:35.383Z', '2026-03-31T23:04:35.383Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('871b766b-ab96-4d25-8869-1c58429cf3df', '9872b186-472e-4391-a150-7239315fc8b1', 'According to the page, which specification covers browser functions such as `alert`, `setTimeout`, and `location`?', 'The summary notes that the HTML specification covers the BOM in broad terms, including browser-specific functions like `setTimeout`, `alert`, and `location`.', 'medium', 'approved', 'd42e547f-82a5-4c2a-bf8e-d8b497221ff4', 8, '2026-03-31T23:04:35.387Z', '2026-03-31T23:04:35.387Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('43fc4bda-401f-4e1c-934c-ca506a4e4717', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement best matches the relationship between the DOM and CSSOM on this page?', 'The DOM represents the document structure and content, while CSSOM represents stylesheets and style rules. The article also notes that in practice developers often add or remove CSS classes instead of directly editing CSS rules.', 'medium', 'approved', 'd42e547f-82a5-4c2a-bf8e-d8b497221ff4', 9, '2026-03-31T23:04:35.389Z', '2026-03-31T23:04:35.389Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a8b68439-2046-438c-bf22-a89af085609c', '9872b186-472e-4391-a150-7239315fc8b1', 'An element has a non-standard HTML attribute `something=''non-standard''`. Which API should you use to read it reliably?', 'Non-standard attributes do not automatically create DOM properties. The page shows that `getAttribute(''something'')` reads the exact attribute value from the HTML.', 'easy', 'approved', '785d44a5-6a6b-4da5-be6a-07e28f9d03ad', 10, '2026-03-31T23:04:41.056Z', '2026-03-31T23:04:41.056Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d227b733-a520-48c8-8c22-37ebed791ba7', '9872b186-472e-4391-a150-7239315fc8b1', 'For a checkbox written as `<input checked>`, which statement is correct about the attribute and property shown on the page?', 'The page uses the checkbox example to show that attributes and properties can differ in both type and representation. `getAttribute(''checked'')` yields an empty string, while `input.checked` is the boolean value `true`.', 'medium', 'approved', '785d44a5-6a6b-4da5-be6a-07e28f9d03ad', 11, '2026-03-31T23:04:41.062Z', '2026-03-31T23:04:41.062Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7c82d962-ffc3-4678-a077-4ac0458974f5', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about `input.value` synchronization is correct according to the page?', '`input.value` is a key exception to the usual two-way synchronization expectation. Changing the `value` attribute updates the property, but changing the property does not rewrite the attribute in HTML.', 'medium', 'approved', '785d44a5-6a6b-4da5-be6a-07e28f9d03ad', 12, '2026-03-31T23:04:41.066Z', '2026-03-31T23:04:41.066Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('dc9efbef-f858-4b74-bb3b-190a2561eeac', '9872b186-472e-4391-a150-7239315fc8b1', 'When you need the `href` exactly as written in HTML, which should you read?', 'The page shows that the DOM `href` property is normalized to a full absolute URL. `getAttribute(''href'')` returns the original attribute value as written in the markup.', 'easy', 'approved', '785d44a5-6a6b-4da5-be6a-07e28f9d03ad', 13, '2026-03-31T23:04:41.068Z', '2026-03-31T23:04:41.068Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7c7489d5-f5dc-43fa-aea3-74ea0dfb9697', '9872b186-472e-4391-a150-7239315fc8b1', 'Which JavaScript expression reads the value of a `data-order-state` attribute using the dedicated API shown on the page?', 'The page explains that `data-*` attributes are exposed through `dataset`, and multiword names become camel-cased. So `data-order-state` becomes `dataset.orderState`.', 'easy', 'approved', '785d44a5-6a6b-4da5-be6a-07e28f9d03ad', 14, '2026-03-31T23:04:41.073Z', '2026-03-31T23:04:41.073Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('fd747a89-11af-4eb5-be03-fa90ff1e9419', '9872b186-472e-4391-a150-7239315fc8b1', 'You are checking whether a link is external and you need its `href` exactly as it appeared in the HTML, not the browser-resolved absolute URL. Which API is the safest choice?', 'This combines the searching and attributes material, but the key point comes from the attributes chapter: DOM properties like `href` can be normalized into full URLs, while `getAttribute(''href'')` returns the original value written in the markup.', 'medium', 'approved', 'df0dec2c-3da0-490c-9462-58919b5dc881', 15, '2026-03-31T23:04:46.926Z', '2026-03-31T23:04:46.926Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7b2ac525-e1c4-4d46-9526-b698b32f7d9c', '9872b186-472e-4391-a150-7239315fc8b1', 'A script in `<head>` tries to run `document.body.querySelectorAll(''div'')`. Why can this fail even though `window` already exists?', '`window` exists as the global browser object, but `document.body` can still be `null` if the browser has not parsed the `<body>` yet. DOM search methods cannot run on a missing node.', 'medium', 'approved', 'df0dec2c-3da0-490c-9462-58919b5dc881', 16, '2026-03-31T23:04:46.931Z', '2026-03-31T23:04:46.931Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('aad8f50a-8059-4ae2-89ff-2fec63189286', '9872b186-472e-4391-a150-7239315fc8b1', 'Code stores `const items = document.getElementsByTagName(''li'')`, and later appends a new `<li>` to the list. What happens to `items.length` without running another query?', 'This combines searching with DOM modification. `getElementsByTagName` returns a live collection, so when the DOM changes and a new matching element is appended, the collection updates automatically.', 'medium', 'approved', 'df0dec2c-3da0-490c-9462-58919b5dc881', 17, '2026-03-31T23:04:46.934Z', '2026-03-31T23:04:46.934Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('00a66b0a-9a8f-4f1f-b33d-4cf3f5464de1', '9872b186-472e-4391-a150-7239315fc8b1', 'What really happens when code runs `container.before(''<p>Hello</p>'')` with the modern insertion API?', 'The modifying-document chapter explains that the modern insertion methods accept strings, but they insert those strings as text, not HTML. To insert actual markup, you would need `insertAdjacentHTML` or a real DOM node created in code.', 'medium', 'approved', 'df0dec2c-3da0-490c-9462-58919b5dc881', 18, '2026-03-31T23:04:46.937Z', '2026-03-31T23:04:46.937Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('eaf74ea0-6659-4ae8-ab41-d83d5a62a00a', '9872b186-472e-4391-a150-7239315fc8b1', 'Why is it a bug to replace an element with `outerHTML` and then keep using the old variable to call methods like `classList.add()`?', '`outerHTML` replaces the element in the DOM, but the old variable still points to the removed original node. Any later method calls affect that stale object reference, not the new element now in the document.', 'medium', 'approved', 'df0dec2c-3da0-490c-9462-58919b5dc881', 19, '2026-03-31T23:04:46.939Z', '2026-03-31T23:04:46.939Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('52ad2077-03d5-4fcf-b717-a36a7a6571a4', '9872b186-472e-4391-a150-7239315fc8b1', 'Why can `document.body` be `null` for a script that runs inside `<head>`?', 'A script can only access what the browser has already parsed. If it runs inside `<head>`, the browser may not have reached `<body>` yet, so `document.body` does not exist at that moment.', 'easy', 'approved', '41131eeb-3b42-43da-b9f9-3ce17d21946e', 20, '2026-03-31T23:04:54.298Z', '2026-03-31T23:04:54.298Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('6e85c249-9d2d-4027-af62-b16fa7fdd0e2', '9872b186-472e-4391-a150-7239315fc8b1', 'What does `childNodes` include that `children` does not?', '`childNodes` contains all child nodes, including text and comment nodes. `children` contains only element nodes.', 'easy', 'approved', '41131eeb-3b42-43da-b9f9-3ce17d21946e', 21, '2026-03-31T23:04:54.301Z', '2026-03-31T23:04:54.301Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('bf636672-cd9f-41b2-860c-935580af0c12', '9872b186-472e-4391-a150-7239315fc8b1', 'Why does `document.body.childNodes.filter(...)` not work directly?', '`childNodes` is an iterable DOM collection, but it is not a real array. That means array methods such as `filter` are unavailable until the collection is converted with `Array.from(...)`.', 'medium', 'approved', '41131eeb-3b42-43da-b9f9-3ce17d21946e', 22, '2026-03-31T23:04:54.303Z', '2026-03-31T23:04:54.303Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('30ffd786-7354-449a-9b42-9e265a895506', '9872b186-472e-4391-a150-7239315fc8b1', 'For `document.documentElement`, what is the difference between `parentNode` and `parentElement`?', 'The root `<html>` element has `document` as its parent node, but `document` is not an element. So `parentNode` returns `document`, while `parentElement` returns `null`.', 'medium', 'approved', '41131eeb-3b42-43da-b9f9-3ce17d21946e', 23, '2026-03-31T23:04:54.305Z', '2026-03-31T23:04:54.305Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e8f3253f-086b-4bf2-95ac-7c5377fcaed6', '9872b186-472e-4391-a150-7239315fc8b1', 'Which expression gets the second cell in the first row of a table using the table-specific navigation helpers shown on the page?', 'The chapter shows that tables expose `rows` and rows expose `cells`. The second cell in the first row is therefore `table.rows[0].cells[1]`.', 'easy', 'approved', '41131eeb-3b42-43da-b9f9-3ce17d21946e', 24, '2026-03-31T23:04:54.307Z', '2026-03-31T23:04:54.307Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9bb2f388-06de-4cc8-a588-a9101ffe545f', '9872b186-472e-4391-a150-7239315fc8b1', 'In a normal HTML document, what do spaces and newlines between tags usually become in the DOM?', 'The page stresses that spaces and newlines are valid characters, so they usually become `#text` nodes in the DOM unless one of the few top-level exclusions applies.', 'easy', 'approved', '8e1e7b02-2bb7-4d1d-9e78-4fe14cad1f16', 25, '2026-03-31T23:05:01.369Z', '2026-03-31T23:05:01.369Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c460c307-2b99-489b-b0ef-23a14a8cd1b0', '9872b186-472e-4391-a150-7239315fc8b1', 'Which whitespace is specifically ignored for historical reasons when the browser builds the DOM?', 'The article lists two top-level exclusions and one of them is that spaces and newlines before `<head>` are ignored for historical reasons.', 'medium', 'approved', '8e1e7b02-2bb7-4d1d-9e78-4fe14cad1f16', 26, '2026-03-31T23:05:01.374Z', '2026-03-31T23:05:01.374Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1ebe02b9-d634-4e1d-a5c5-94f7be6fbf76', '9872b186-472e-4391-a150-7239315fc8b1', 'If a source HTML table omits a `<tbody>` element, what does the browser typically do in the DOM?', 'The page calls out tables as a special case: the browser inserts a `<tbody>` into the DOM even if it is not present in the source HTML.', 'easy', 'approved', '8e1e7b02-2bb7-4d1d-9e78-4fe14cad1f16', 27, '2026-03-31T23:05:01.378Z', '2026-03-31T23:05:01.378Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('074a0349-511b-4930-a3b4-8f0c7408096a', '9872b186-472e-4391-a150-7239315fc8b1', 'What happens to an HTML comment such as `<!-- comment -->` when the DOM tree is created?', 'The page explains that everything in HTML becomes part of the DOM, even comments. They appear as `#comment` nodes.', 'easy', 'approved', '8e1e7b02-2bb7-4d1d-9e78-4fe14cad1f16', 28, '2026-03-31T23:05:01.380Z', '2026-03-31T23:05:01.380Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('420c7c15-5caa-4171-a1d0-5860c92c2d6f', '9872b186-472e-4391-a150-7239315fc8b1', 'What does the browser generally do when it encounters malformed HTML with missing closing tags while building the DOM?', 'The chapter explains that browsers auto-correct malformed HTML during DOM creation. They close tags and restore missing structure to form a usable DOM tree.', 'medium', 'approved', '8e1e7b02-2bb7-4d1d-9e78-4fe14cad1f16', 29, '2026-03-31T23:05:01.384Z', '2026-03-31T23:05:01.384Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('67219a81-23e4-48fc-b23e-c25cb7290320', '9872b186-472e-4391-a150-7239315fc8b1', 'Which browser object represents the actual page loaded into a tab and lets JavaScript read or change the document''s HTML and CSS?', 'The page distinguishes the main browser objects clearly: `window` represents the tab, `navigator` represents browser identity and state, and `document` represents the actual page loaded into the window. DOM manipulation happens through the `Document` object.', 'easy', 'approved', '934bd75e-b94b-4658-bff9-94af39fec8d8', 30, '2026-03-31T23:05:07.502Z', '2026-03-31T23:05:07.502Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('cd5ceee9-3199-469e-bdb0-f996ad0cafe1', '9872b186-472e-4391-a150-7239315fc8b1', 'In the DOM tree example, `IMG` sits inside `SECTION`, which sits inside `BODY`. Which statement is correct about `IMG` relative to `BODY`?', 'The article defines a child as directly inside another node and a descendant as anywhere inside another node. Because `IMG` is two levels below `BODY`, it is a descendant of `BODY` but not its direct child.', 'easy', 'approved', '934bd75e-b94b-4658-bff9-94af39fec8d8', 31, '2026-03-31T23:05:07.507Z', '2026-03-31T23:05:07.507Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('47bc194f-2df8-4a11-8093-b160649fef26', '9872b186-472e-4391-a150-7239315fc8b1', 'What happens when code calls `sect.appendChild(linkPara)` after `linkPara` already exists earlier in the same section?', '`appendChild()` moves the existing node reference to the new position. It does not create a duplicate. The page explicitly notes that copying would require `cloneNode()` instead.', 'medium', 'approved', '934bd75e-b94b-4658-bff9-94af39fec8d8', 32, '2026-03-31T23:05:07.509Z', '2026-03-31T23:05:07.509Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('39be0561-1a88-4c1b-bdf0-e5d7dac5c659', '9872b186-472e-4391-a150-7239315fc8b1', 'When setting an inline style through `HTMLElement.style`, which JavaScript property name corresponds to the CSS property `background-color`?', 'The article points out that style property names use lower camel case in JavaScript even when the CSS form is hyphenated. So `background-color` becomes `backgroundColor`.', 'easy', 'approved', '934bd75e-b94b-4658-bff9-94af39fec8d8', 33, '2026-03-31T23:05:07.510Z', '2026-03-31T23:05:07.510Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c69ed431-2791-4e84-a7e1-4a86a8379bf5', '9872b186-472e-4391-a150-7239315fc8b1', 'In the dynamic shopping list exercise, why does the handler call `preventDefault()` before adding a new item?', 'The input is inside a form, so pressing Enter would submit the form and refresh the page. `preventDefault()` stops that default behavior so the script can add the list item instead.', 'easy', 'approved', '934bd75e-b94b-4658-bff9-94af39fec8d8', 34, '2026-03-31T23:05:07.512Z', '2026-03-31T23:05:07.512Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ab998219-e801-40d3-83ac-36c0808b814d', '9872b186-472e-4391-a150-7239315fc8b1', 'Which method creates a new element node such as a `<div>`?', 'The chapter introduces `document.createElement(tag)` as the standard way to create a new element node. `createTextNode` is for text nodes, not elements.', 'easy', 'approved', 'b577e2da-96ee-4a17-b0b7-bdca861fc8df', 35, '2026-03-31T23:05:13.195Z', '2026-03-31T23:05:13.195Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9e6ba53d-1bde-4bdf-bbcb-26a21f0d9f4f', '9872b186-472e-4391-a150-7239315fc8b1', 'What happens when code runs `div.before(''<p>Hello</p>'')` using the modern insertion methods described on the page?', 'The modern insertion methods can accept strings, but strings are inserted as text nodes, not parsed as HTML. To insert actual HTML markup, the chapter recommends `insertAdjacentHTML`.', 'medium', 'approved', 'b577e2da-96ee-4a17-b0b7-bdca861fc8df', 36, '2026-03-31T23:05:13.202Z', '2026-03-31T23:05:13.202Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('5da18688-a3a9-4b34-bb4b-5c7fbfc97232', '9872b186-472e-4391-a150-7239315fc8b1', 'Which call inserts HTML immediately before an existing element named `div`?', '`insertAdjacentHTML(where, html)` inserts markup relative to an existing element. The position code `beforebegin` means immediately before the element itself.', 'easy', 'approved', 'b577e2da-96ee-4a17-b0b7-bdca861fc8df', 37, '2026-03-31T23:05:13.206Z', '2026-03-31T23:05:13.206Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('83fe88e7-725a-42fc-978c-cbe1db2aaa8e', '9872b186-472e-4391-a150-7239315fc8b1', 'If you insert an existing node into a new place using methods like `after` or `append`, what happens to the node in its old place?', 'The article states that insertion methods automatically remove an existing node from its old place when moving it. No manual `remove()` call is needed first.', 'easy', 'approved', 'b577e2da-96ee-4a17-b0b7-bdca861fc8df', 38, '2026-03-31T23:05:13.209Z', '2026-03-31T23:05:13.209Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('5bb89ede-98aa-46b2-ac57-e192315664d7', '9872b186-472e-4391-a150-7239315fc8b1', 'Why is `document.write` rarely suitable after the page has already loaded?', 'The chapter notes that `document.write` only works safely during page loading. If it is called after loading, it wipes out the existing document content and replaces it.', 'medium', 'approved', 'b577e2da-96ee-4a17-b0b7-bdca861fc8df', 39, '2026-03-31T23:05:13.215Z', '2026-03-31T23:05:13.215Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('fdc0e085-c4fd-43ef-9926-2086de76ebb2', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about `getElementById` matches the page?', 'The chapter explicitly notes that `getElementById` is called on `document`, not on arbitrary elements. It searches the whole document for that unique id.', 'easy', 'approved', '77ba4a15-7578-45c7-bbc5-8b4a55fbdecf', 40, '2026-03-31T23:05:19.354Z', '2026-03-31T23:05:19.354Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('14ae547e-a7d6-4395-adf1-1c374e4a7328', '9872b186-472e-4391-a150-7239315fc8b1', 'What does `elem.querySelector(css)` return?', '`querySelector` returns only the first matching element. The page compares it to `querySelectorAll(css)[0]`, but notes that `querySelector` is faster and shorter because it searches for only one.', 'easy', 'approved', '77ba4a15-7578-45c7-bbc5-8b4a55fbdecf', 41, '2026-03-31T23:05:19.357Z', '2026-03-31T23:05:19.357Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('22bbf6df-4e9a-4091-b27a-a880d92f0efc', '9872b186-472e-4391-a150-7239315fc8b1', 'What does `elem.closest(css)` do?', '`closest` walks upward from the element through its ancestors and returns the nearest one that matches the selector. The element itself is checked first.', 'medium', 'approved', '77ba4a15-7578-45c7-bbc5-8b4a55fbdecf', 42, '2026-03-31T23:05:19.359Z', '2026-03-31T23:05:19.359Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('5806c9cc-e7fb-49c4-825b-1b6be4263ceb', '9872b186-472e-4391-a150-7239315fc8b1', 'Which collection updates automatically when matching elements are added to the DOM after the collection has already been stored?', 'The page shows that `getElementsBy*` methods return live collections, while `querySelectorAll` returns a static collection that does not auto-update.', 'medium', 'approved', '77ba4a15-7578-45c7-bbc5-8b4a55fbdecf', 43, '2026-03-31T23:05:19.361Z', '2026-03-31T23:05:19.361Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('142fb398-df9d-4333-9652-18ec0a245283', '9872b186-472e-4391-a150-7239315fc8b1', 'Why does the page recommend avoiding id-named global variables like using `elem` directly for `<div id=''elem''>`?', 'The page says that relying on element ids as globals can cause naming conflicts and makes code harder to understand when the HTML is not visible. In real code, `document.getElementById` is preferred.', 'medium', 'approved', '77ba4a15-7578-45c7-bbc5-8b4a55fbdecf', 44, '2026-03-31T23:05:19.363Z', '2026-03-31T23:05:19.363Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0eef86c2-1942-4acd-8f0a-5b18b4181110', '9872b186-472e-4391-a150-7239315fc8b1', 'Which API is the best fit when you want to add one CSS class without overwriting the element''s other classes?', '`classList` is designed for individual class operations such as `add`, `remove`, `toggle`, and `contains`. Assigning to `className` replaces the whole class string.', 'easy', 'approved', 'eb58358c-7a0d-4d83-8bbc-e8565dae16f3', 45, '2026-03-31T23:05:25.204Z', '2026-03-31T23:05:25.204Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e11e87ca-e3f1-4cab-8f36-d8d51bf16eea', '9872b186-472e-4391-a150-7239315fc8b1', 'Which JavaScript property corresponds to the CSS property `background-color` when using `elem.style`?', 'The page shows that CSS property names become camel-cased when accessed through `style`. Therefore `background-color` becomes `backgroundColor`.', 'easy', 'approved', 'eb58358c-7a0d-4d83-8bbc-e8565dae16f3', 46, '2026-03-31T23:05:25.208Z', '2026-03-31T23:05:25.208Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4b70b56f-454e-4f19-b64a-addf624d95c7', '9872b186-472e-4391-a150-7239315fc8b1', 'How can you remove an inline `display` style so that normal CSS rules apply again?', 'The chapter says not to delete style properties directly. Instead, assign an empty string such as `elem.style.display = ''''`, or use `removeProperty`, so the browser treats the property as unset.', 'medium', 'approved', 'eb58358c-7a0d-4d83-8bbc-e8565dae16f3', 47, '2026-03-31T23:05:25.211Z', '2026-03-31T23:05:25.211Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9ef68246-9cbe-42d8-946b-3aac1bd491a0', '9872b186-472e-4391-a150-7239315fc8b1', 'What usually happens if you set `document.body.style.margin = 20` without a CSS unit?', 'The page warns to include CSS units like `px`. Without a valid unit, the assignment is ignored and the property remains empty.', 'easy', 'approved', 'eb58358c-7a0d-4d83-8bbc-e8565dae16f3', 48, '2026-03-31T23:05:25.217Z', '2026-03-31T23:05:25.217Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7948d1c5-434e-4532-9a7f-b9dd31187fb0', '9872b186-472e-4391-a150-7239315fc8b1', 'Which API should you use to read the final style values after CSS classes, inheritance, and the cascade have all been applied?', '`elem.style` only reflects inline styles from the `style` attribute. The page explains that `getComputedStyle(elem)` returns the resolved style values after the cascade and class-based styles are applied.', 'easy', 'approved', 'eb58358c-7a0d-4d83-8bbc-e8565dae16f3', 49, '2026-03-31T23:05:25.221Z', '2026-03-31T23:05:25.221Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('96181263-3750-43ec-be8b-78571ff23d26', '9872b186-472e-4391-a150-7239315fc8b1', 'In the MDN random-color example, what does the second argument to `btn.addEventListener("click", changeBackground)` represent?', 'The first argument names the event to watch, and the second argument is the handler function that runs when that event fires. In the example, `changeBackground` is the code that reacts to the click.', 'medium', 'draft', '785809ba-9c4a-48fd-9fc8-d409d1f50827', 50, '2026-04-01T00:17:25.535Z', '2026-04-01T00:17:25.535Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1820e8c5-f706-4cbf-a99e-1fab75d103f9', '9872b186-472e-4391-a150-7239315fc8b1', 'Why does MDN recommend `addEventListener()` instead of assigning `element.onclick = ...` in more complex programs?', 'Handler properties such as `onclick` can be overwritten and only hold one listener for that event. `addEventListener()` scales better because it supports multiple listeners and cleaner removal when needed.', 'medium', 'draft', '785809ba-9c4a-48fd-9fc8-d409d1f50827', 51, '2026-04-01T00:17:25.551Z', '2026-04-01T00:17:25.551Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8925da20-912f-4e35-b6a4-ef78cf03114a', '9872b186-472e-4391-a150-7239315fc8b1', 'In MDN''s event object example, what does `e.target` refer to?', '`e.target` points to the element the event occurred on. In the example, that is the button that was clicked, so the handler changes the button color instead of the whole page.', 'medium', 'draft', '785809ba-9c4a-48fd-9fc8-d409d1f50827', 52, '2026-04-01T00:17:25.555Z', '2026-04-01T00:17:25.555Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('51ab675e-4ea9-48c7-b5e0-a1c216ea02ce', '9872b186-472e-4391-a150-7239315fc8b1', 'In the form validation example, why is `e.preventDefault()` called inside the `submit` handler?', 'Calling `preventDefault()` stops the browser from performing its normal form submission. That gives the page a chance to show a validation message instead of navigating away immediately.', 'medium', 'draft', '785809ba-9c4a-48fd-9fc8-d409d1f50827', 53, '2026-04-01T00:17:25.561Z', '2026-04-01T00:17:25.561Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2d784b33-9a34-4ff9-b62a-43e1ae06dbd0', '9872b186-472e-4391-a150-7239315fc8b1', 'Which event registration style does MDN explicitly describe as bad practice on modern pages?', 'MDN warns against inline handler attributes like `onclick="..."` because they mix HTML with JavaScript, scale poorly, and are often blocked by stricter security setups.', 'medium', 'draft', '785809ba-9c4a-48fd-9fc8-d409d1f50827', 54, '2026-04-01T00:17:25.565Z', '2026-04-01T00:17:25.565Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('069eede3-5ff1-48e8-aee1-f3b8e7403591', '9872b186-472e-4391-a150-7239315fc8b1', 'A `button` sits inside a `div`, which sits inside `body`. If all three have click handlers in the default phase and the button is clicked, which order runs?', 'In the bubbling phase, the event runs on the clicked element first and then moves outward through its ancestors. That is why the button handler runs before the div handler, which runs before the body handler.', 'medium', 'draft', 'a7894614-8328-4a3e-be43-79315f449a8d', 55, '2026-04-01T00:17:33.848Z', '2026-04-01T00:17:33.848Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9d52193b-825e-4aa1-8b23-e487de5b2f80', '9872b186-472e-4391-a150-7239315fc8b1', 'In MDN''s video player example, why did clicking the video also hide the surrounding box before the fix?', 'The video is nested inside the box. Clicking it runs the video''s handler, then the click bubbles to the box and triggers the box handler too, which hides the box.', 'medium', 'draft', 'a7894614-8328-4a3e-be43-79315f449a8d', 56, '2026-04-01T00:17:33.854Z', '2026-04-01T00:17:33.854Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('33f34d2e-c82c-4611-828e-81a2e6ff6673', '9872b186-472e-4391-a150-7239315fc8b1', 'Which change switches an event listener into the capturing phase?', 'Capturing is enabled by passing the capture option when registering the listener. Without it, most listeners run in the default bubbling phase.', 'medium', 'draft', 'a7894614-8328-4a3e-be43-79315f449a8d', 57, '2026-04-01T00:17:33.857Z', '2026-04-01T00:17:33.857Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('914554ea-7dbb-4fe2-87bf-ff388dab5726', '9872b186-472e-4391-a150-7239315fc8b1', 'In the tile-coloring delegation example, which property identifies the specific tile the user clicked?', 'Delegation usually attaches one handler to a parent and inspects the original clicked element. `event.target` points to that innermost clicked tile, while `event.currentTarget` would be the container.', 'medium', 'draft', 'a7894614-8328-4a3e-be43-79315f449a8d', 58, '2026-04-01T00:17:33.860Z', '2026-04-01T00:17:33.860Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1d5e3e0d-6a2a-447d-bdf3-263707228c56', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement correctly compares `event.target` and `event.currentTarget` during bubbling?', '`event.target` stays tied to the original deepest element that started the event. `event.currentTarget` changes depending on which listener is currently running in the propagation chain.', 'medium', 'draft', 'a7894614-8328-4a3e-be43-79315f449a8d', 59, '2026-04-01T00:17:33.863Z', '2026-04-01T00:17:33.863Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0738e072-093d-411b-b6bc-3b761d469696', '9872b186-472e-4391-a150-7239315fc8b1', 'Which `addEventListener` option removes a listener automatically after it fires once?', 'The `once` option tells the browser to invoke the listener a single time and then remove it automatically. The other common options control capture or passive behavior, not one-time execution.', 'medium', 'draft', 'cddea692-85a2-4e47-9342-6ca59b90db2f', 60, '2026-04-01T00:17:41.691Z', '2026-04-01T00:17:41.691Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ce06e3ed-2f86-4033-9dca-44a0d1e8b8a7', '9872b186-472e-4391-a150-7239315fc8b1', 'During bubbling, which value keeps pointing to the original deepest element that started the event?', 'The event source does not change as the event travels upward. `event.target` stays fixed on the original element, while `event.currentTarget` changes at each handler level.', 'medium', 'draft', 'cddea692-85a2-4e47-9342-6ca59b90db2f', 61, '2026-04-01T00:17:41.699Z', '2026-04-01T00:17:41.699Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7129be74-e53b-43a8-a89c-98d5884b7b1a', '9872b186-472e-4391-a150-7239315fc8b1', 'What event-handling pattern puts one listener on a shared ancestor to manage many similar child elements?', 'That pattern is event delegation. It relies on bubbling so one container-level listener can inspect `event.target` and decide which child was interacted with.', 'medium', 'draft', 'cddea692-85a2-4e47-9342-6ca59b90db2f', 62, '2026-04-01T00:17:41.702Z', '2026-04-01T00:17:41.702Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7320a9ab-ae88-48ee-b87e-a02817f9b6c1', '9872b186-472e-4391-a150-7239315fc8b1', 'In the nested context menu example, why is checking `event.defaultPrevented` in an outer handler often better than calling `stopPropagation()` in the inner one?', 'Checking `defaultPrevented` lets outer handlers know the event was already handled without cutting off propagation completely. That preserves visibility for analytics or other higher-level behavior.', 'medium', 'draft', 'cddea692-85a2-4e47-9342-6ca59b90db2f', 63, '2026-04-01T00:17:41.704Z', '2026-04-01T00:17:41.704Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('daa339db-2864-46bc-b95c-f75ba85211f8', '9872b186-472e-4391-a150-7239315fc8b1', 'If you need to dispatch your own event with extra data such as `{ name: "John" }`, which API is intended for that?', '`CustomEvent` is designed for user-defined events and provides the `detail` field for passing extra payload data to listeners. That keeps custom data separate from built-in event properties.', 'medium', 'draft', 'cddea692-85a2-4e47-9342-6ca59b90db2f', 64, '2026-04-01T00:17:41.707Z', '2026-04-01T00:17:41.707Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2a27673a-4cec-4628-8af3-17452c5aa5bc', '9872b186-472e-4391-a150-7239315fc8b1', 'Which `event.button` value usually represents the secondary, right mouse button?', 'In standard mouse events, `event.button` uses numeric codes. The secondary or right button is represented by `2`, while the primary left button is `0`.', 'medium', 'draft', 'b30d9065-cabb-4bfa-8f09-6a651165f7fd', 65, '2026-04-01T00:17:49.519Z', '2026-04-01T00:17:49.519Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b4005870-4305-47a2-8b6f-626e9ccf5d93', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about `mouseenter` and `mouseover` is correct?', '`mouseenter` is simpler because it does not bubble and ignores moves between an element and its descendants. `mouseover` does bubble and will fire again when moving into child elements.', 'medium', 'draft', 'b30d9065-cabb-4bfa-8f09-6a651165f7fd', 66, '2026-04-01T00:17:49.523Z', '2026-04-01T00:17:49.523Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('5f9bbe97-1ce5-495e-8f25-c4980553549c', '9872b186-472e-4391-a150-7239315fc8b1', 'Which pointer-event property lets you distinguish one active finger or stylus contact from another during multi-touch interactions?', '`pointerId` uniquely identifies each active pointer contact. That makes it possible to track multiple fingers or pens separately during the same interaction.', 'medium', 'draft', 'b30d9065-cabb-4bfa-8f09-6a651165f7fd', 67, '2026-04-01T00:17:49.528Z', '2026-04-01T00:17:49.528Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('341cb421-4bb3-4aa3-9802-e6095c688838', '9872b186-472e-4391-a150-7239315fc8b1', 'For a hotkey that should keep working even if the user switches keyboard layout, which property is usually safer to check?', '`event.code` is tied to the physical key location, so it remains stable across layout changes. `event.key` follows the produced character, which may change when the user switches layouts.', 'medium', 'draft', 'b30d9065-cabb-4bfa-8f09-6a651165f7fd', 68, '2026-04-01T00:17:49.535Z', '2026-04-01T00:17:49.535Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3afdc6be-6855-4c97-bda5-9b20b3921d86', '9872b186-472e-4391-a150-7239315fc8b1', 'Why can''t `event.preventDefault()` inside an `onscroll` handler stop the scroll that just happened?', 'The `scroll` event fires after scrolling has already occurred, so canceling it there is too late. To prevent scrolling, you must stop the earlier cause of the scroll or use CSS such as `overflow` controls.', 'medium', 'draft', 'b30d9065-cabb-4bfa-8f09-6a651165f7fd', 69, '2026-04-01T00:17:49.583Z', '2026-04-01T00:17:49.583Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('afde7f56-ace4-4a05-9623-353d0e5e851f', '9872b186-472e-4391-a150-7239315fc8b1', 'A single click handler is attached to a container, and the user clicks a nested button inside it. Which statement is correct inside that handler?', 'In delegated event handling, the handler runs on the container, so `event.currentTarget` is the container. The original clicked element remains available as `event.target`, which is the nested button.', 'easy', 'draft', '46606c46-6c4d-418e-b387-c7df5e179c61', 70, '2026-04-01T00:17:56.798Z', '2026-04-01T00:17:56.798Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('337d693f-1478-401f-9656-781378095535', '9872b186-472e-4391-a150-7239315fc8b1', 'A backdrop click closes a video box, but clicking the video itself should only play the video. What is the most direct fix?', 'The problem is caused by bubbling from the video up to the backdrop container. Calling `stopPropagation()` inside the video''s click handler stops that upward travel, so the backdrop close logic does not run.', 'easy', 'draft', '46606c46-6c4d-418e-b387-c7df5e179c61', 71, '2026-04-01T00:17:56.801Z', '2026-04-01T00:17:56.801Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f40d87c6-ec1b-4f89-9d71-f080f4829d66', '9872b186-472e-4391-a150-7239315fc8b1', 'You are building a custom drag interaction that should work for mouse, touch, and pen, and should keep receiving move events even if the pointer leaves the thumb. Which approach best matches the source material?', 'Pointer events unify mouse, touch, and pen input. `setPointerCapture(event.pointerId)` keeps later pointer events retargeted to the dragged element until the pointer is released or canceled.', 'easy', 'draft', '46606c46-6c4d-418e-b387-c7df5e179c61', 72, '2026-04-01T00:17:56.804Z', '2026-04-01T00:17:56.804Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8ea20cc9-0f98-4d58-ab82-81efe91303ad', '9872b186-472e-4391-a150-7239315fc8b1', 'A nested button shows its own custom context menu. You want outer analytics or document-level handlers to still observe the event, but not open another context menu. Which approach is preferred?', 'Calling `preventDefault()` handles the browser action, and letting outer code check `event.defaultPrevented` avoids duplicate menu behavior without cutting off propagation entirely. That is cleaner than creating a dead zone with `stopPropagation()`.', 'easy', 'draft', '46606c46-6c4d-418e-b387-c7df5e179c61', 73, '2026-04-01T00:17:56.806Z', '2026-04-01T00:17:56.806Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0b410daf-cfbd-4b00-9df6-48e0ac732437', '9872b186-472e-4391-a150-7239315fc8b1', 'For an Undo shortcut that should keep working after keyboard layout changes and also support macOS, which check is safest?', '`event.code` stays tied to the physical key position even if the user changes keyboard layout, and cross-platform Undo shortcuts should accept either Ctrl or Meta so macOS users are covered.', 'easy', 'draft', '46606c46-6c4d-418e-b387-c7df5e179c61', 74, '2026-04-01T00:17:56.810Z', '2026-04-01T00:17:56.810Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a99c2788-03ef-4969-9e1b-0308f02c01a6', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement best defines a callback function?', 'A callback is a function passed into another function as an argument and later invoked inside that outer function to help complete some routine or action.', 'easy', 'approved', '0532d932-8e5b-41ce-98c6-e1b76f0106fb', 75, '2026-04-01T00:41:21.707Z', '2026-04-01T00:41:21.707Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('49a3c580-57cc-41b3-8a97-84c7c0dfebd3', '9872b186-472e-4391-a150-7239315fc8b1', 'In a callback-based API, what is the caller responsible for?', 'MDN notes that the API provider, also called the caller, decides when to call the callback, what arguments to pass into it, and may also use its return value to guide behavior.', 'easy', 'approved', '0532d932-8e5b-41ce-98c6-e1b76f0106fb', 76, '2026-04-01T00:41:21.711Z', '2026-04-01T00:41:21.711Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d4386881-81dd-4687-86d9-dd2e19157c0f', '9872b186-472e-4391-a150-7239315fc8b1', 'Consider this code:

```js
let value = 1;

doSomething(() => {
  value = 2;
});

console.log(value);
```

If `doSomething` invokes its callback synchronously, what is logged?', 'If the callback runs synchronously, `value = 2` happens before `console.log(value)`, so the logged value is `2`.', 'medium', 'approved', '0532d932-8e5b-41ce-98c6-e1b76f0106fb', 77, '2026-04-01T00:41:21.717Z', '2026-04-01T00:41:21.717Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f88a8981-52db-4c8b-91b0-db2652663b75', '9872b186-472e-4391-a150-7239315fc8b1', 'Which pair below consists of asynchronous callback examples mentioned by MDN?', 'MDN lists `setTimeout()` and `Promise.prototype.then()` as asynchronous callback examples because their callbacks run later, after some asynchronous work or scheduling step.', 'easy', 'approved', '0532d932-8e5b-41ce-98c6-e1b76f0106fb', 78, '2026-04-01T00:41:21.722Z', '2026-04-01T00:41:21.722Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b5aa3d52-9bc6-4801-8f11-ff2ef34a65d5', '9872b186-472e-4391-a150-7239315fc8b1', 'What additional behavior may the caller expect from a callback besides simply running it?', 'The caller may inspect the return value of the callback and use that result to decide what to do next.', 'medium', 'approved', '0532d932-8e5b-41ce-98c6-e1b76f0106fb', 79, '2026-04-01T00:41:21.726Z', '2026-04-01T00:41:21.726Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0d41b749-7408-4dc3-829a-ea79ae399fdc', '9872b186-472e-4391-a150-7239315fc8b1', 'According to MDN, what is a closure?', 'A closure is not just the inner function by itself. It is the function together with the lexical environment it closed over when it was created.', 'easy', 'approved', 'ca2b863c-32c2-4fd8-9ea1-8b8873285356', 80, '2026-04-01T00:41:27.363Z', '2026-04-01T00:41:27.363Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9808ce8b-5ff3-4aaf-a834-37d61bd4b833', '9872b186-472e-4391-a150-7239315fc8b1', 'Why does this code still log `''Mozilla''` even after `makeFunc()` has finished running?

```js
function makeFunc() {
  const name = ''Mozilla'';
  function displayName() {
    console.log(name);
  }
  return displayName;
}

const myFunc = makeFunc();
myFunc();
```', '`displayName` closes over the lexical environment where `name` exists. Returning the function does not break that reference.', 'medium', 'approved', 'ca2b863c-32c2-4fd8-9ea1-8b8873285356', 81, '2026-04-01T00:41:27.366Z', '2026-04-01T00:41:27.366Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9535e51f-33ef-402a-9af5-ece72002d381', '9872b186-472e-4391-a150-7239315fc8b1', 'Why do `add5(2)` and `add10(2)` return different results in the `makeAdder` example even though they come from the same function body?', 'Each returned function shares the same function body definition, but each one closes over a different lexical environment. One remembers `x = 5`; the other remembers `x = 10`.', 'medium', 'approved', 'ca2b863c-32c2-4fd8-9ea1-8b8873285356', 82, '2026-04-01T00:41:27.368Z', '2026-04-01T00:41:27.368Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('06c2a6b8-a971-4eec-ae59-c97cd59cbaf3', '9872b186-472e-4391-a150-7239315fc8b1', 'In MDN''s loop example that attaches `onfocus` handlers, why do all callbacks end up showing the help text for the last item when `var item` is used?', 'Because `var` is function-scoped, each callback closes over the same `item` variable. By the time the callbacks run, that shared variable refers to the last entry.', 'medium', 'approved', 'ca2b863c-32c2-4fd8-9ea1-8b8873285356', 83, '2026-04-01T00:41:27.372Z', '2026-04-01T00:41:27.372Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('5c202775-86a1-4dc9-a9fb-867b5d322d86', '9872b186-472e-4391-a150-7239315fc8b1', 'Which change fixes the classic loop-closure problem without adding an extra factory function?', 'Using block-scoped bindings such as `let` or `const` gives each iteration its own binding, so each closure keeps the correct value.', 'easy', 'approved', 'ca2b863c-32c2-4fd8-9ea1-8b8873285356', 84, '2026-04-01T00:41:27.376Z', '2026-04-01T00:41:27.376Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('43511cc2-b8dd-4c3b-8b23-12282273bd76', '9872b186-472e-4391-a150-7239315fc8b1', 'What best explains why the second call returns `2` here?

```js
const handler = (function () {
  let count = 0;
  return function () {
    count += 1;
    return count;
  };
})();

console.log(handler());
console.log(handler());
```', 'The outer function is an IIFE, so it runs once immediately. It returns an inner function that closes over `count`, which stays private but persists between calls.', 'medium', 'approved', '69fac5aa-4f75-4918-b713-79b7dbc6e0d2', 85, '2026-04-01T00:41:33.051Z', '2026-04-01T00:41:33.051Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('cbb07fef-c9c0-4d3c-af3f-82c035d3ed4f', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement is true about this code?

```js
function run(task) {
  return task(3);
}

function double(n) {
  return n * 2;
}

console.log(run(double));
```', '`double` is being passed as a value because functions are first-class. Since `run` accepts a function argument, `run` is a higher-order function, and `double` acts as a callback in that call.', 'easy', 'approved', '69fac5aa-4f75-4918-b713-79b7dbc6e0d2', 86, '2026-04-01T00:41:33.064Z', '2026-04-01T00:41:33.064Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('fbf964d0-d211-42c7-887f-06df97f7c37d', '9872b186-472e-4391-a150-7239315fc8b1', 'What role does the arrow function play here?

```js
const numbers = [1, 2, 3];
const doubled = numbers.map((n) => n * 2);
```', '`map()` is a higher-order array method. The arrow function is the synchronous callback that `map()` invokes for each element, which is possible because functions are first-class values.', 'easy', 'approved', '69fac5aa-4f75-4918-b713-79b7dbc6e0d2', 87, '2026-04-01T00:41:33.070Z', '2026-04-01T00:41:33.070Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('06fac181-8574-4673-aca0-e1cb140a859f', '9872b186-472e-4391-a150-7239315fc8b1', 'What is logged by this code, and why?

```js
let value = 1;

setTimeout(() => {
  value = 2;
}, 0);

(() => {
  console.log(value);
})();
```', 'The IIFE runs immediately, but the `setTimeout` callback is asynchronous and runs later. So the log happens before `value` changes to `2`.', 'medium', 'approved', '69fac5aa-4f75-4918-b713-79b7dbc6e0d2', 88, '2026-04-01T00:41:33.074Z', '2026-04-01T00:41:33.074Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('646e3bb0-35bd-4f8d-bec7-6f36b66c61e4', '9872b186-472e-4391-a150-7239315fc8b1', 'Which scenario is the best fit for an async IIFE?', 'An async IIFE is useful when you want to run several awaited statements immediately, keep temporary variables out of the global scope, and do it in a place that expects a single expression.', 'easy', 'approved', '69fac5aa-4f75-4918-b713-79b7dbc6e0d2', 89, '2026-04-01T00:41:33.078Z', '2026-04-01T00:41:33.078Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('cc3c6a47-29ef-4d6e-b8cd-3154217d7cdb', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement best matches MDN''s definition of a first-class function in JavaScript?', 'A first-class function is treated like any other value. That means it can be assigned to a variable, passed into another function, and returned from another function.', 'easy', 'approved', '829f5646-0bf6-465a-a953-7e59c5e95749', 90, '2026-04-01T00:41:38.741Z', '2026-04-01T00:41:38.741Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('768058b9-edb2-4939-b810-b2d915f45f42', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this code demonstrate?

```js
const foo = () => {
  console.log(''foobar'');
};

foo();
```', 'The important part is that the function is stored in the variable `foo` and invoked through `foo()`. This shows that JavaScript functions can be handled like values.', 'easy', 'approved', '829f5646-0bf6-465a-a953-7e59c5e95749', 91, '2026-04-01T00:41:38.746Z', '2026-04-01T00:41:38.746Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('494d6ab0-68dd-4b62-9ba6-16de287c38ed', '9872b186-472e-4391-a150-7239315fc8b1', 'What role does `sayHello` play in this example?

```js
function sayHello() {
  return ''Hello, '';
}

function greeting(helloMessage, name) {
  console.log(helloMessage() + name);
}

greeting(sayHello, ''JavaScript!'');
```', '`sayHello` is passed into `greeting` as a value and then called inside it. In this role, it is also a callback function.', 'easy', 'approved', '829f5646-0bf6-465a-a953-7e59c5e95749', 92, '2026-04-01T00:41:38.748Z', '2026-04-01T00:41:38.748Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('fedeb8a2-db3a-465c-b8b2-16bef38d789c', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this function demonstrate?

```js
function sayHello() {
  return () => {
    console.log(''Hello!'');
  };
}
```', 'The example shows that a function can be the return value of another function because functions are treated as values in JavaScript.', 'medium', 'approved', '829f5646-0bf6-465a-a953-7e59c5e95749', 93, '2026-04-01T00:41:38.751Z', '2026-04-01T00:41:38.751Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('6e551c43-5b5b-4314-8f16-67bcfaca638a', '9872b186-472e-4391-a150-7239315fc8b1', 'According to MDN, which statement about naming a function assigned to a variable is true?', 'Naming a function can make stack traces and debugging clearer, but you still invoke it through the variable that holds it.', 'easy', 'approved', '829f5646-0bf6-465a-a953-7e59c5e95749', 94, '2026-04-01T00:41:38.754Z', '2026-04-01T00:41:38.754Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('229c1e35-0ff3-4ab5-8f90-561dd65633d9', '9872b186-472e-4391-a150-7239315fc8b1', 'Which option defines a higher-order function as described in the article?', 'The article defines a higher-order function as one that either accepts one or more functions as arguments or returns a function as its result.', 'easy', 'approved', '853bd4ff-b270-4154-bf2e-c20b228d5153', 95, '2026-04-01T00:41:44.184Z', '2026-04-01T00:41:44.184Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('994132ad-7765-42aa-aa2a-c2f246ef0ff7', '9872b186-472e-4391-a150-7239315fc8b1', 'Why is a function like `calculate(radius, logic)` more reusable than writing separate functions for every circle calculation?', 'The repeated loop stays in one place while the changing behavior is passed in as `logic`. That makes the code more concise, modular, and easier to extend.', 'easy', 'approved', '853bd4ff-b270-4154-bf2e-c20b228d5153', 96, '2026-04-01T00:41:44.193Z', '2026-04-01T00:41:44.193Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('83efb722-6d50-4c1f-890d-093c4ff4bcf8', '9872b186-472e-4391-a150-7239315fc8b1', 'According to the article, which method is the best fit when you want to transform every element of an array into a new array without mutating the original array?', 'The article uses `map()` for transformations. It applies a callback to each element and returns a new array, leaving the original array unchanged.', 'easy', 'approved', '853bd4ff-b270-4154-bf2e-c20b228d5153', 97, '2026-04-01T00:41:44.197Z', '2026-04-01T00:41:44.197Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('30fa2439-08e3-4df2-982f-ad5c7abf9f45', '9872b186-472e-4391-a150-7239315fc8b1', 'If you want only the users whose age is greater than 30, which method from the article is intended for that job?', '`filter()` is used to select a subset of data that passes a condition. In the article, it returns only the users whose `age > 30`.', 'easy', 'approved', '853bd4ff-b270-4154-bf2e-c20b228d5153', 98, '2026-04-01T00:41:44.217Z', '2026-04-01T00:41:44.217Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('429aaf49-ad04-4c93-9010-f6c4f04807fe', '9872b186-472e-4391-a150-7239315fc8b1', 'In the article''s `reduce()` example for finding the maximum value, no explicit initial accumulator is passed. What becomes the starting accumulator value?', 'When `reduce()` is called without an explicit initial value, the first array element is used as the initial accumulator. In the example, that first value is `5`.', 'medium', 'approved', '853bd4ff-b270-4154-bf2e-c20b228d5153', 99, '2026-04-01T00:41:44.220Z', '2026-04-01T00:41:44.220Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e62575c3-4f87-4125-b1a0-c4b6f8681308', '9872b186-472e-4391-a150-7239315fc8b1', 'What is an IIFE in JavaScript?', 'IIFE stands for Immediately Invoked Function Expression. It is a function expression that runs as soon as it is defined.', 'easy', 'approved', 'e816a9d4-d737-41fb-a8c9-e3d7d0eff2d5', 100, '2026-04-01T00:41:50.166Z', '2026-04-01T00:41:50.166Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('142ab23b-deb7-41d0-900e-36a34cd63b1f', '9872b186-472e-4391-a150-7239315fc8b1', 'Why is the function usually wrapped in parentheses in a standard IIFE like this?

```js
(function () {
  // statements
})();
```', 'The parentheses help the parser treat the function as an expression instead of a function declaration, which lets it be invoked immediately.', 'easy', 'approved', 'e816a9d4-d737-41fb-a8c9-e3d7d0eff2d5', 101, '2026-04-01T00:41:50.170Z', '2026-04-01T00:41:50.170Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2ea40b49-5cc6-4357-9704-657a49446637', '9872b186-472e-4391-a150-7239315fc8b1', 'Which use case below matches MDN''s description of why developers use IIFEs?', 'MDN lists avoiding global namespace pollution as a common IIFE use case because the function creates its own local scope.', 'easy', 'approved', 'e816a9d4-d737-41fb-a8c9-e3d7d0eff2d5', 102, '2026-04-01T00:41:50.174Z', '2026-04-01T00:41:50.174Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('cc303f09-4d5b-487d-86f3-6b6647e427a7', '9872b186-472e-4391-a150-7239315fc8b1', 'Why might a developer choose an async IIFE?', 'An async IIFE creates a fresh async context so `await` can be used even when the surrounding code is not already inside an async function.', 'easy', 'approved', 'e816a9d4-d737-41fb-a8c9-e3d7d0eff2d5', 103, '2026-04-01T00:41:50.177Z', '2026-04-01T00:41:50.177Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8057f7b8-13f8-412e-b803-e6ded3cba92c', '9872b186-472e-4391-a150-7239315fc8b1', 'Why does MDN say an IIFE is more powerful than the comma operator in this context?', 'The comma operator can only chain expressions. An IIFE can execute many statements inside its own scope and use local variables and control flow before returning a value.', 'medium', 'approved', 'e816a9d4-d737-41fb-a8c9-e3d7d0eff2d5', 104, '2026-04-01T00:41:50.180Z', '2026-04-01T00:41:50.180Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('acf542bd-bdd7-4b9c-a067-fe6688f3304d', '9872b186-472e-4391-a150-7239315fc8b1', 'Why should a promise-returning operation inside a `.then()` handler usually be returned from that handler?', 'MDN warns that not returning a promise creates a floating promise. The chain loses track of that async work, so later handlers can run before the work is finished and they will not receive its fulfillment value.

Example:

```js
doSomething()
  .then((url) => fetch(url))
  .then((response) => response.json());
```', 'medium', 'approved', 'd6acf4d6-91b8-4ab5-b638-e3e25aa97800', 105, '2026-04-01T01:49:32.363Z', '2026-04-01T01:49:32.363Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('af518629-ccf4-4179-ae8a-f449ffabfaec', '9872b186-472e-4391-a150-7239315fc8b1', 'In a flat promise chain, what does `.catch(failureCallback)` represent?', 'The page states that `catch(failureCallback)` is shorthand for `then(null, failureCallback)`. In practice, a single `.catch()` at the end usually handles rejections and thrown exceptions from earlier steps in the chain.', 'easy', 'approved', 'd6acf4d6-91b8-4ab5-b638-e3e25aa97800', 106, '2026-04-01T01:49:32.366Z', '2026-04-01T01:49:32.366Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('46b6f81e-6c63-4f8a-b3cc-b3d8614fad34', '9872b186-472e-4391-a150-7239315fc8b1', 'Given this code, which failures are handled by the inner `.catch(() => {})`?

```js
doSomethingCritical()
  .then((result) =>
    doSomethingOptional(result)
      .then((optionalResult) => doSomethingExtraNice(optionalResult))
      .catch(() => {})
  )
  .then(() => moreCriticalStuff())
  .catch((e) => console.error(e.message));
```', 'MDN uses nesting to show catch scoping. The inner catch only handles failures from the optional branch inside its nested scope. A failure in `doSomethingCritical()` still skips to the outer catch.', 'hard', 'approved', 'd6acf4d6-91b8-4ab5-b638-e3e25aa97800', 107, '2026-04-01T01:49:32.369Z', '2026-04-01T01:49:32.369Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('84637761-5caa-439a-b4d4-c52b3527c1dd', '9872b186-472e-4391-a150-7239315fc8b1', 'Which promise composition tool should you choose when you need all concurrent operations to finish, even if one or more reject?', 'The composition section contrasts `Promise.all()` with `Promise.allSettled()`. `Promise.all()` rejects as soon as one promise rejects, while `Promise.allSettled()` waits until every operation has completed.', 'medium', 'approved', 'd6acf4d6-91b8-4ab5-b638-e3e25aa97800', 108, '2026-04-01T01:49:32.372Z', '2026-04-01T01:49:32.372Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ec992651-f33a-4125-9489-f5b90d43f7bc', '9872b186-472e-4391-a150-7239315fc8b1', 'What is logged by this code?

```js
Promise.resolve().then(() => console.log(2));
console.log(1);
```', 'Promise callbacks never run synchronously, even for an already-resolved promise. They are queued as microtasks, so the current synchronous work finishes first.

Result:

```text
1
2
```', 'easy', 'approved', 'd6acf4d6-91b8-4ab5-b638-e3e25aa97800', 109, '2026-04-01T01:49:32.374Z', '2026-04-01T01:49:32.374Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8c1b796e-529f-4d2e-9321-5e7419e1a593', '9872b186-472e-4391-a150-7239315fc8b1', 'According to the `Promises, async/await` overview, which topic appears first in the section?', 'The overview starts with `Introduction: callbacks`, which frames the older async style before moving into promises and `async`/`await`.', 'easy', 'approved', '8c342cdc-0d50-4be6-a47f-77fed9899104', 110, '2026-04-01T01:49:39.104Z', '2026-04-01T01:49:39.104Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d37c349f-bb04-4a97-b1e9-414ea1c523f4', '9872b186-472e-4391-a150-7239315fc8b1', 'Which listed lesson title most directly suggests converting callback-based code into promise-based code?', '`Promisification` is the lesson title that explicitly points to wrapping or converting callback-style APIs so they can be used with promises.', 'easy', 'approved', '8c342cdc-0d50-4be6-a47f-77fed9899104', 111, '2026-04-01T01:49:39.107Z', '2026-04-01T01:49:39.107Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2bec7139-87fc-42f2-a630-ba6059093838', '9872b186-472e-4391-a150-7239315fc8b1', 'If you want to understand why promise handlers run after the current synchronous code, which lesson title from this overview is the best match?', 'The overview includes a dedicated `Microtasks` lesson. That topic is the one most directly tied to promise callback scheduling.', 'medium', 'approved', '8c342cdc-0d50-4be6-a47f-77fed9899104', 112, '2026-04-01T01:49:39.111Z', '2026-04-01T01:49:39.111Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9e46b637-6de3-48e7-9f88-219fecea9649', '9872b186-472e-4391-a150-7239315fc8b1', 'Which lesson title in the overview is the clearest place to look for helpers such as `Promise.all()` or `Promise.race()`?', 'The tutorial roadmap includes a lesson named `Promise API`, which is the most direct match for static promise helpers and related built-in methods.', 'medium', 'approved', '8c342cdc-0d50-4be6-a47f-77fed9899104', 113, '2026-04-01T01:49:39.113Z', '2026-04-01T01:49:39.113Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a7fded08-348b-43e6-ab33-0a1f2a2d3eb7', '9872b186-472e-4391-a150-7239315fc8b1', 'Which topic comes immediately before `Async/await` in the overview sequence?', 'The page orders the lessons as `... Promise API`, `Promisification`, `Microtasks`, and then `Async/await`. That places `Microtasks` directly before the final `Async/await` lesson.', 'easy', 'approved', '8c342cdc-0d50-4be6-a47f-77fed9899104', 114, '2026-04-01T01:49:39.115Z', '2026-04-01T01:49:39.115Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d271f245-0ade-4a41-a0d5-c0adff33b2c2', '9872b186-472e-4391-a150-7239315fc8b1', 'Why do data-driven sites often use JavaScript network requests instead of reloading the entire page for every update?', 'The MDN article explains that fetching only the data needed for one section makes updates faster and avoids redownloading unchanged page chrome such as headers or sidebars.', 'easy', 'approved', 'c236ee41-933e-4499-be41-f90e42739751', 115, '2026-04-01T01:49:46.495Z', '2026-04-01T01:49:46.495Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('806f0348-9ecb-486b-8e1f-344b23d623fe', '9872b186-472e-4391-a150-7239315fc8b1', 'In MDN''s Fetch examples, why is `response.ok` checked before reading the body?', 'The article''s pattern is to throw an error when the HTTP status is not successful. That moves the failure into the promise chain so the shared `.catch()` can handle it.', 'medium', 'approved', 'c236ee41-933e-4499-be41-f90e42739751', 116, '2026-04-01T01:49:46.498Z', '2026-04-01T01:49:46.498Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8ad68808-2784-47c4-bfae-80da75c9d93b', '9872b186-472e-4391-a150-7239315fc8b1', 'Which response method from the article should you call when the server returns JSON that you want as a JavaScript object?', 'The Can Store example fetches `products.json` and then returns `response.json()`, which resolves to the parsed JavaScript object.', 'easy', 'approved', 'c236ee41-933e-4499-be41-f90e42739751', 117, '2026-04-01T01:49:46.504Z', '2026-04-01T01:49:46.504Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e57ecd09-f7ff-445b-9eea-be470d6df423', '9872b186-472e-4391-a150-7239315fc8b1', 'Why does MDN say the local Fetch examples should be run through a local web server instead of opening the HTML file directly from disk?', 'The page explicitly warns that modern browsers will not run these HTTP requests from a local file because of security restrictions. Serving the files avoids that problem.', 'medium', 'approved', 'c236ee41-933e-4499-be41-f90e42739751', 118, '2026-04-01T01:49:46.507Z', '2026-04-01T01:49:46.507Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('28992570-e1ae-4452-b718-330274007ee6', '9872b186-472e-4391-a150-7239315fc8b1', 'Compared with the `XMLHttpRequest` example on the page, what is a key reason MDN recommends using Fetch when possible?', 'MDN notes that Fetch is simpler and has more features. In the example, Fetch keeps the work in a promise chain, while XHR needs `load` and `error` listeners plus surrounding `try...catch`.', 'medium', 'approved', 'c236ee41-933e-4499-be41-f90e42739751', 119, '2026-04-01T01:49:46.511Z', '2026-04-01T01:49:46.511Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f0d7b11d-2b59-456c-89f9-43939ae5849b', '9872b186-472e-4391-a150-7239315fc8b1', 'When does the promise returned by `fetch(url, options)` resolve?', 'The article describes Fetch as a two-stage process. First, the promise resolves with a `Response` object when the server responds with headers. Reading the body happens in a second async step such as `response.json()`.', 'medium', 'approved', '34ade2df-22a2-4603-b9e1-5628ae631b50', 120, '2026-04-01T01:49:55.947Z', '2026-04-01T01:49:55.947Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('08956886-056a-4801-99ea-a6a46cf1bf39', '9872b186-472e-4391-a150-7239315fc8b1', 'Which situation causes the `fetch` promise itself to reject, according to the article?', 'The page explicitly says abnormal HTTP statuses such as 404 or 500 do not reject the fetch promise. Rejection is for request-level failures such as network problems or an unreachable site.', 'medium', 'approved', '34ade2df-22a2-4603-b9e1-5628ae631b50', 121, '2026-04-01T01:49:55.953Z', '2026-04-01T01:49:55.953Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1140ec09-ae3d-4491-a1cc-e2d04a31dab2', '9872b186-472e-4391-a150-7239315fc8b1', 'Why does this sequence fail?

```js
const text = await response.text();
const parsed = await response.json();
```', 'The article states that the response body can be read only once. After `response.text()` consumes it, a second body-reading method such as `response.json()` has nothing left to parse.', 'hard', 'approved', '34ade2df-22a2-4603-b9e1-5628ae631b50', 122, '2026-04-01T01:49:55.957Z', '2026-04-01T01:49:55.957Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('252c6d8f-c6c4-45a9-880f-1bf192c868e7', '9872b186-472e-4391-a150-7239315fc8b1', 'When sending JSON with `fetch`, which header value does the article explicitly set for the request body?', 'The POST example stringifies the object and sets `Content-Type` to `application/json;charset=utf-8` so the server knows the body is JSON, rather than letting a plain string default to `text/plain`.', 'easy', 'approved', '34ade2df-22a2-4603-b9e1-5628ae631b50', 123, '2026-04-01T01:49:55.959Z', '2026-04-01T01:49:55.959Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('dc3cf2ab-9f3b-4fa5-96cc-8d383df8ab9d', '9872b186-472e-4391-a150-7239315fc8b1', 'Why is it usually unnecessary to set `Content-Type` manually when the Fetch request body is a `Blob`?', 'In the image-upload example, the `Blob` already carries a type such as `image/png`. Fetch uses that built-in type as the request `Content-Type`.', 'medium', 'approved', '34ade2df-22a2-4603-b9e1-5628ae631b50', 124, '2026-04-01T01:49:55.963Z', '2026-04-01T01:49:55.963Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0482eb8d-3ce4-4ac0-b664-609eb5df9f57', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about the global `JSON` object is correct?', 'MDN states that `JSON` is a namespace-style global object, not a constructor. Its methods such as `parse()` and `stringify()` are static, similar to `Math`.', 'easy', 'approved', 'c3c89d7e-f0cd-4531-b129-6e2574878dc0', 125, '2026-04-01T01:56:42.025Z', '2026-04-01T01:56:42.025Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0ef70739-5392-4ca6-96c9-29b4f71a741e', '9872b186-472e-4391-a150-7239315fc8b1', 'Which value is valid JSON according to the MDN reference?', 'Valid JSON requires double-quoted property names and string literals, no trailing commas, and only supported JSON data types. The other options violate those rules.', 'medium', 'approved', 'c3c89d7e-f0cd-4531-b129-6e2574878dc0', 126, '2026-04-01T01:56:42.034Z', '2026-04-01T01:56:42.034Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('33d831b1-9253-4bf1-beb3-89f225152faa', '9872b186-472e-4391-a150-7239315fc8b1', 'Which static method parses a JSON string and can optionally transform the resulting values during parsing?', '`JSON.parse()` converts a JSON string into a JavaScript value. MDN notes that it can optionally transform produced values and properties during parsing.', 'easy', 'approved', 'c3c89d7e-f0cd-4531-b129-6e2574878dc0', 127, '2026-04-01T01:56:42.039Z', '2026-04-01T01:56:42.039Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4d533817-a669-43d5-b009-31c111c6abe5', '9872b186-472e-4391-a150-7239315fc8b1', 'What problem are `JSON.rawJSON()` and the `JSON.parse()` reviver''s `context.source` parameter intended to help with?', 'MDN uses these APIs in its lossless number serialization examples. `JSON.rawJSON()` lets you emit precise JSON number text, and `context.source` lets a reviver reconstruct a high-precision value from the original source text before JavaScript number rounding becomes a permanent problem.', 'hard', 'approved', 'c3c89d7e-f0cd-4531-b129-6e2574878dc0', 128, '2026-04-01T01:56:42.044Z', '2026-04-01T01:56:42.044Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('5ce7af96-e2e3-428b-ba7a-e028616617a4', '9872b186-472e-4391-a150-7239315fc8b1', 'Why can a `JSON.parse()` reviver not always recover a very large number from its `value` parameter alone?', 'MDN points out that by the time the reviver receives `value`, the JSON number has already been parsed as a JavaScript number, so rounding may already have happened. That is why `context.source` matters for exact recovery.', 'hard', 'approved', 'c3c89d7e-f0cd-4531-b129-6e2574878dc0', 129, '2026-04-01T01:56:42.051Z', '2026-04-01T01:56:42.051Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('492c37c2-4c40-41e1-8e77-4ede9f9fe3f9', '9872b186-472e-4391-a150-7239315fc8b1', 'After the superhero JSON has been parsed into `superHeroes`, which expression reads the third power of the second hero?', 'MDN walks through this exact access path: `members` is an array, the second hero is index `1`, and `powers` is another array where the third element is index `2`.', 'medium', 'approved', '6e031437-549f-4ef6-a4e8-de2b8503e78d', 130, '2026-04-01T01:56:49.120Z', '2026-04-01T01:56:49.120Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('34b8385a-abbe-472b-ba2c-cafd267f3d17', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about valid JSON values is true according to the article?', 'The article explains that JSON can be an object, an array, or even a single primitive such as `29`, `"Dan Jukes"`, or `true`.', 'medium', 'approved', '6e031437-549f-4ef6-a4e8-de2b8503e78d', 131, '2026-04-01T01:56:49.124Z', '2026-04-01T01:56:49.124Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('41e752df-6bc6-43c7-965b-700ee278e68f', '9872b186-472e-4391-a150-7239315fc8b1', 'Which syntax rule is required for valid JSON?', 'MDN''s syntax restrictions are strict: strings and property names must use double quotes, comments are not allowed, trailing commas are not allowed, and JSON cannot contain unsupported values such as `undefined`.', 'easy', 'approved', '6e031437-549f-4ef6-a4e8-de2b8503e78d', 132, '2026-04-01T01:56:49.127Z', '2026-04-01T01:56:49.127Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('64fa780e-cb2c-495f-8109-e5f16dff8924', '9872b186-472e-4391-a150-7239315fc8b1', 'In the article''s `populate()` example, what is the role of these two lines?

```js
const response = await fetch(request);
const superHeroes = await response.json();
```', 'The first awaited call gets the network `Response`. The second awaited call reads the response body and parses the JSON into a normal JavaScript object that the page can use with dot and bracket access.', 'medium', 'approved', '6e031437-549f-4ef6-a4e8-de2b8503e78d', 133, '2026-04-01T01:56:49.129Z', '2026-04-01T01:56:49.129Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('fa0493c3-d32a-4c39-99fc-60f6e51ddae9', '9872b186-472e-4391-a150-7239315fc8b1', 'If you receive raw JSON text instead of calling `response.json()`, which built-in method should convert that text into a JavaScript object?', 'The article''s `heroes-finished-json-parse.html` variation fetches the response as text and then calls `JSON.parse(superHeroesText)` to produce the object.', 'easy', 'approved', '6e031437-549f-4ef6-a4e8-de2b8503e78d', 134, '2026-04-01T01:56:49.132Z', '2026-04-01T01:56:49.132Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a465f787-bbe3-4b10-8d21-b40bcef1a660', '9872b186-472e-4391-a150-7239315fc8b1', 'Which kinds of properties does `JSON.stringify()` skip automatically in the article''s examples?', 'The tutorial notes that JSON is data-only, so JavaScript-specific values are skipped. It explicitly names function properties, symbolic keys and values, and properties storing `undefined`.', 'medium', 'approved', '1efe47cc-fb78-4bf1-9c64-e075ad13446e', 135, '2026-04-01T01:56:56.310Z', '2026-04-01T01:56:56.310Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3c2ce3ba-6b06-4b74-8620-07f009540983', '9872b186-472e-4391-a150-7239315fc8b1', 'Why does `JSON.stringify(meetup)` throw in the `room` and `meetup` example?', 'The example creates a circular reference: `meetup.place` points to `room`, and `room.occupiedBy` points back to `meetup`. Default JSON serialization cannot handle that loop.', 'easy', 'approved', '1efe47cc-fb78-4bf1-9c64-e075ad13446e', 136, '2026-04-01T01:56:56.316Z', '2026-04-01T01:56:56.316Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c912758e-e0d2-4c39-9aaf-aef78a6a6cbf', '9872b186-472e-4391-a150-7239315fc8b1', 'What can a `replacer` function do when passed as the second argument to `JSON.stringify()`?', 'The tutorial shows that `replacer` is called for each key/value pair. It can return a transformed value or `undefined` to omit a property, which is how the example skips `occupiedBy`.', 'medium', 'approved', '1efe47cc-fb78-4bf1-9c64-e075ad13446e', 137, '2026-04-01T01:56:56.319Z', '2026-04-01T01:56:56.319Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('57eec49a-a8ba-459f-b8a6-cbf85b00e9b5', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the purpose of the third `space` argument in `JSON.stringify(value, replacer, space)`?', 'The article is explicit that the `space` parameter is for pretty formatting only. It changes indentation in the output string but does not change the underlying data or parsing rules.', 'easy', 'approved', '1efe47cc-fb78-4bf1-9c64-e075ad13446e', 138, '2026-04-01T01:56:56.325Z', '2026-04-01T01:56:56.325Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8cacf3c4-9c4a-4fc8-be56-bc47b6ab577c', '9872b186-472e-4391-a150-7239315fc8b1', 'How does the article suggest restoring ISO date strings back into `Date` objects during parsing?', 'The `Using reviver` section passes a function as the second argument to `JSON.parse()`. When the key is `date`, it returns `new Date(value)` instead of leaving the parsed value as a plain string.', 'medium', 'approved', '1efe47cc-fb78-4bf1-9c64-e075ad13446e', 139, '2026-04-01T01:56:56.327Z', '2026-04-01T01:56:56.327Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('76ed21fd-87f7-4b78-907a-02731116fb56', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the bug in this function?

```js
function loadUser(url) {
  return fetch(url)
    .then((response) => {
      if (!response.ok) {
        throw new Error(`HTTP ${response.status}`);
      }
      response.json();
    })
    .then((data) => data.name);
}
```', 'This combines the Fetch two-stage model with MDN''s warning about floating promises. `response.json()` returns a promise, but the handler does not return it, so the next `.then()` receives `undefined` instead of parsed JSON data.', 'hard', 'approved', '63195f6b-8f2f-4087-a59a-6f0587173742', 140, '2026-04-01T01:57:04.195Z', '2026-04-01T01:57:04.195Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9117554a-d805-4899-a7b3-afa6c920f89a', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about consuming a JSON HTTP response body is correct?', 'Both patterns are valid for a JSON response: `await response.json()` and `await response.text()` followed by `JSON.parse(text)`. But the body can only be consumed once, so you cannot use both body-reading paths on the same `Response` object.', 'hard', 'approved', '63195f6b-8f2f-4087-a59a-6f0587173742', 141, '2026-04-01T01:57:04.201Z', '2026-04-01T01:57:04.201Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a262e23d-3627-48bb-a063-645897049c1b', '9872b186-472e-4391-a150-7239315fc8b1', 'Why is this `try...catch` block not enough to treat HTTP 404 as a failed request?

```js
try {
  const response = await fetch(''/api/user/123'');
  const data = await response.json();
  console.log(data);
} catch (error) {
  console.error(''Request failed'');
}
```', 'Fetch rejects for transport-level failures such as network errors, not for every non-2xx HTTP status. A 404 may still resolve with a `Response`, so you should check `response.ok` and throw your own error when appropriate.', 'medium', 'approved', '63195f6b-8f2f-4087-a59a-6f0587173742', 142, '2026-04-01T01:57:04.205Z', '2026-04-01T01:57:04.205Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('23131a00-0764-4202-aa41-10c928527a3f', '9872b186-472e-4391-a150-7239315fc8b1', 'If an object defines a custom `toJSON()` method and you send it with `fetch()` like this, what gets sent in the request body?

```js
await fetch(''/api/user'', {
  method: ''POST'',
  headers: { ''Content-Type'': ''application/json;charset=utf-8'' },
  body: JSON.stringify(user)
});
```', '`fetch()` sends whatever string `JSON.stringify(user)` returns. If `user` has a custom `toJSON()` method, `JSON.stringify()` calls it and serializes the returned value instead of the raw object shape.', 'hard', 'approved', '63195f6b-8f2f-4087-a59a-6f0587173742', 143, '2026-04-01T01:57:04.207Z', '2026-04-01T01:57:04.207Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c12c554f-7932-40a4-b0c3-67a2ce616c36', '9872b186-472e-4391-a150-7239315fc8b1', 'Why might a developer deliberately choose `response.text()` plus `JSON.parse(text, reviver)` instead of `response.json()` for some API responses?', '`response.json()` is convenient, but it does not let you supply a custom reviver. If you want parsing-time transformations such as turning ISO date strings into `Date` objects, fetching text and then calling `JSON.parse()` with a reviver gives you that control.

Example:

```js
const text = await response.text();
const meetup = JSON.parse(text, (key, value) =>
  key === ''date'' ? new Date(value) : value
);
```', 'hard', 'approved', '63195f6b-8f2f-4087-a59a-6f0587173742', 144, '2026-04-01T01:57:04.210Z', '2026-04-01T01:57:04.210Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b1d99263-4793-4ead-b287-a11cac26fb7d', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement best describes `Array.prototype.every()`?', '`every()` checks whether all elements satisfy the predicate. It returns `false` as soon as one element fails, and returns `true` only if no failing element is found.', 'easy', 'approved', 'b36ca9d9-8d51-453d-81c1-3f7df61e2cd8', 145, '2026-04-01T05:23:41.640Z', '2026-04-01T05:23:41.640Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2552bfe8-4c72-4b70-9073-10dc13c5b31e', '9872b186-472e-4391-a150-7239315fc8b1', 'What does `[].every(() => false)` return?', 'MDN notes that `every()` is vacuously true for empty arrays. Because there is no element that fails the condition, the result is `true`.', 'medium', 'approved', 'b36ca9d9-8d51-453d-81c1-3f7df61e2cd8', 146, '2026-04-01T05:23:41.647Z', '2026-04-01T05:23:41.647Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('cbe9e1f1-867d-49f4-b5bd-71f6ef213763', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the result of this expression?

```js
[2, , 2].every((x) => x === 2);
```', '`every()` skips empty slots in sparse arrays. The callback only sees the two explicit `2` values, so the expression evaluates to `true`.', 'hard', 'approved', 'b36ca9d9-8d51-453d-81c1-3f7df61e2cd8', 147, '2026-04-01T05:23:41.649Z', '2026-04-01T05:23:41.649Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1ff56f25-cae4-40ef-92ec-ab3371b28c3d', '9872b186-472e-4391-a150-7239315fc8b1', 'Given this helper, what is the result?

```js
const isSubset = (array1, array2) =>
  array2.every((element) => array1.includes(element));

isSubset([1, 2, 3, 4, 5, 6, 7], [5, 8, 7]);
```', 'The result is `false` because `8` is not included in the first array. Since `every()` requires all checks to pass, a single missing value makes the whole result `false`.', 'medium', 'approved', 'b36ca9d9-8d51-453d-81c1-3f7df61e2cd8', 148, '2026-04-01T05:23:41.651Z', '2026-04-01T05:23:41.651Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('dbd22e24-6968-4c9a-952e-0fc401092e5f', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this code return?

```js
const arrayLike = {
  length: 3,
  0: "a",
  1: "b",
  2: "c",
  3: 345
};

Array.prototype.every.call(arrayLike, (x) => typeof x === "string");
```', '`every()` is generic. It inspects keys `0` through `2` because `length` is `3`; index `3` is ignored. All visited values are strings, so the result is `true`.', 'hard', 'approved', 'b36ca9d9-8d51-453d-81c1-3f7df61e2cd8', 149, '2026-04-01T05:23:41.663Z', '2026-04-01T05:23:41.663Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2f5b2302-2397-4a83-b84b-2e2ea2e067b1', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement best describes `Array.prototype.filter()`?', '`filter()` creates a shallow copy containing only the elements for which the callback returns a truthy value. It does not mutate the original array, and if nothing passes, it returns an empty array.', 'easy', 'approved', '89c14c70-3ba9-4b0b-b475-ab54f7532719', 150, '2026-04-01T05:23:46.045Z', '2026-04-01T05:23:46.045Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('574a4021-ce28-40ad-b151-a005cfbf9abc', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the result of this code?

```js
[0, 1, 2, 3].filter((n) => n % 2);
```', '`filter()` keeps elements whose callback result is truthy, not necessarily strictly `true`. `n % 2` is truthy for odd numbers and falsy for even numbers and zero, so the result is `[1, 3]`.', 'medium', 'approved', '89c14c70-3ba9-4b0b-b475-ab54f7532719', 151, '2026-04-01T05:23:46.050Z', '2026-04-01T05:23:46.050Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('cc871411-5ac4-4abd-937d-44338f7b3b13', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this code evaluate to?

```js
[1, , undefined].filter((x) => x === undefined);
```', '`filter()` skips empty slots in sparse arrays, so the hole is never tested. The actual `undefined` value at the last position is tested and kept, so the result is `[undefined]`.', 'medium', 'approved', '89c14c70-3ba9-4b0b-b475-ab54f7532719', 152, '2026-04-01T05:23:46.054Z', '2026-04-01T05:23:46.054Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7c8aefed-f24f-4930-805f-a9acd86877c8', '9872b186-472e-4391-a150-7239315fc8b1', 'What does `filter()` return when no elements pass the test?', 'If the callback never returns a truthy value, `filter()` returns an empty array. It still returns a new array rather than `null`, `undefined`, or the original array.', 'easy', 'approved', '89c14c70-3ba9-4b0b-b475-ab54f7532719', 153, '2026-04-01T05:23:46.056Z', '2026-04-01T05:23:46.056Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('06c2c445-59f6-4b15-8bc4-b47672df6433', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the result of this code?

```js
const arrayLike = {
  length: 3,
  0: "a",
  1: "b",
  2: "c",
  3: "a"
};

Array.prototype.filter.call(arrayLike, (x) => x <= "b");
```', '`filter()` is generic and works on array-like objects by reading `length` and integer keys. Since `length` is `3`, index `3` is ignored, and only `''a''` and `''b''` satisfy the predicate.', 'hard', 'approved', '89c14c70-3ba9-4b0b-b475-ab54f7532719', 154, '2026-04-01T05:23:46.057Z', '2026-04-01T05:23:46.057Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a4444ef6-bed9-40b1-aa8a-8e80cac90fb8', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement best describes `Array.prototype.find()`?', '`find()` returns the first element whose callback result is truthy, then stops iterating. If no element matches, it returns `undefined`. This is different from `filter()`, which returns all matches in a new array.', 'easy', 'approved', '8a6a775a-9ae0-444c-8d97-b392aa54529a', 155, '2026-04-01T05:23:50.797Z', '2026-04-01T05:23:50.797Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3826108c-fb05-40c3-878c-f6458db33bf2', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this expression return?

```js
const inventory = [
  { name: "apples", quantity: 2 },
  { name: "bananas", quantity: 0 },
  { name: "cherries", quantity: 5 }
];

inventory.find(({ name }) => name === "cherries");
```', '`find()` returns the actual element, not its index. Here the first matching object is `{ name: ''cherries'', quantity: 5 }`.', 'easy', 'approved', '8a6a775a-9ae0-444c-8d97-b392aa54529a', 156, '2026-04-01T05:23:50.800Z', '2026-04-01T05:23:50.800Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('81dfdcfb-2761-4a9c-a20c-f48b529f6c45', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the result of this code?

```js
function isPrime(n) {
  if (n < 2) return false;
  if (n % 2 === 0) return n === 2;
  for (let factor = 3; factor * factor <= n; factor += 2) {
    if (n % factor === 0) return false;
  }
  return true;
}

[4, 6, 8, 12].find(isPrime);
```', 'No element in the array satisfies the predicate, so `find()` returns `undefined`.', 'medium', 'approved', '8a6a775a-9ae0-444c-8d97-b392aa54529a', 157, '2026-04-01T05:23:50.802Z', '2026-04-01T05:23:50.802Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('801a259d-ca41-4406-ac1f-f4c88526952d', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about sparse arrays and `find()` is correct?', 'Unlike many other iterative methods, `find()` visits every index, including holes. MDN says empty slots in sparse arrays behave the same as `undefined` for `find()`.', 'hard', 'approved', '8a6a775a-9ae0-444c-8d97-b392aa54529a', 158, '2026-04-01T05:23:50.803Z', '2026-04-01T05:23:50.803Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3277f9b9-de3d-4d22-a5b8-73be45a0fb8e', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this code return?

```js
const arrayLike = {
  length: 3,
  "-1": 0.1,
  0: 2,
  1: 7.3,
  2: 4
};

Array.prototype.find.call(arrayLike, (x) => !Number.isInteger(x));
```', '`find()` is generic and reads `length` plus integer keys from an array-like object. The value at key `1` is `7.3`, which is the first value that makes the predicate truthy, so that value is returned.', 'hard', 'approved', '8a6a775a-9ae0-444c-8d97-b392aa54529a', 159, '2026-04-01T05:23:50.806Z', '2026-04-01T05:23:50.806Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('da70d012-f7f5-4e93-9fc1-10363ea6917d', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement best describes `Array.prototype.findIndex()`?', '`findIndex()` returns the index of the first element whose callback result is truthy, or `-1` if no element matches. It stops as soon as a match is found.', 'easy', 'approved', '4fbd30d5-818b-40d9-8372-c2ad06e4e33c', 160, '2026-04-01T05:23:55.234Z', '2026-04-01T05:23:55.234Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('74c5ed4a-f3bf-4fde-99e3-20619f7fb596', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the result of this expression?

```js
[5, 12, 8, 130, 44].findIndex((element) => element > 13);
```', 'The first element greater than `13` is `130`, which is at index `3`, so `findIndex()` returns `3`.', 'easy', 'approved', '4fbd30d5-818b-40d9-8372-c2ad06e4e33c', 161, '2026-04-01T05:23:55.240Z', '2026-04-01T05:23:55.240Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('bfd21ec1-9673-4130-a0f6-0bb45b29b4bc', '9872b186-472e-4391-a150-7239315fc8b1', 'What does `findIndex()` return when no element matches the predicate?', 'If the predicate never returns a truthy value, `findIndex()` returns `-1`. That sentinel value signals that no index was found.', 'easy', 'approved', '4fbd30d5-818b-40d9-8372-c2ad06e4e33c', 162, '2026-04-01T05:23:55.243Z', '2026-04-01T05:23:55.243Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b1dbf908-b316-4013-8f6d-b139f5e8c943', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this expression return?

```js
[1, , 3].findIndex((x) => x === undefined);
```', '`findIndex()` visits empty slots in sparse arrays and treats them like `undefined`, so the hole at index `1` satisfies the predicate and the returned index is `1`.', 'hard', 'approved', '4fbd30d5-818b-40d9-8372-c2ad06e4e33c', 163, '2026-04-01T05:23:55.245Z', '2026-04-01T05:23:55.245Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3b34be48-1348-498a-8343-1d457f878803', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this code return?

```js
const arrayLike = {
  length: 3,
  "-1": 0.1,
  0: 2,
  1: 7.3,
  2: 4
};

Array.prototype.findIndex.call(arrayLike, (x) => !Number.isInteger(x));
```', '`findIndex()` is generic and operates on array-like objects. The first non-integer value among indices `0` through `2` is `7.3` at index `1`, so it returns `1`.', 'hard', 'approved', '4fbd30d5-818b-40d9-8372-c2ad06e4e33c', 164, '2026-04-01T05:23:55.248Z', '2026-04-01T05:23:55.248Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('6655b345-a704-4c95-9220-c63ed6845575', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement best describes `Array.prototype.forEach()`?', '`forEach()` executes a callback once for each assigned array element, is primarily used for side effects, and always returns `undefined`. Because of that, it is not chainable in the same way as `map()` or `filter()`.', 'easy', 'approved', 'c648ff5f-781f-4fa0-9e9c-552fc71b0d6f', 165, '2026-04-01T05:23:59.305Z', '2026-04-01T05:23:59.305Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('aa3723a3-c3a1-4f00-ae0d-fc36e521ce7c', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the main reason `forEach()` is the wrong tool when you need to stop iteration early?', 'MDN is explicit that there is no way to stop or break a `forEach()` loop other than throwing an exception. If you need early termination, use a loop or methods like `some()`, `every()`, `find()`, or `findIndex()`.', 'medium', 'approved', 'c648ff5f-781f-4fa0-9e9c-552fc71b0d6f', 166, '2026-04-01T05:23:59.309Z', '2026-04-01T05:23:59.309Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0983d8dc-c683-4a9f-b180-2a8cb6403f5b', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this code log?

```js
const ratings = [5, 4, 5];
let sum = 0;

const sumFunction = async (a, b) => a + b;

ratings.forEach(async (rating) => {
  sum = await sumFunction(sum, rating);
});

console.log(sum);
```', '`forEach()` expects a synchronous callback and does not await promises returned from an async callback. The `console.log(sum)` runs before those async updates finish, so the logged value is still `0`.', 'hard', 'approved', 'c648ff5f-781f-4fa0-9e9c-552fc71b0d6f', 167, '2026-04-01T05:23:59.311Z', '2026-04-01T05:23:59.311Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('678af69c-9c98-40a8-88d6-6ebd5d6bcac2', '9872b186-472e-4391-a150-7239315fc8b1', 'What happens when `forEach()` is used on a sparse array like `[2, 5, , 9]`?', '`forEach()` only invokes the callback for assigned indexes. In `[2, 5, , 9]`, index `2` is a hole, so it is skipped entirely.', 'medium', 'approved', 'c648ff5f-781f-4fa0-9e9c-552fc71b0d6f', 168, '2026-04-01T05:23:59.314Z', '2026-04-01T05:23:59.314Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('00d0f424-1fa2-456b-b439-0317edd2a5d8', '9872b186-472e-4391-a150-7239315fc8b1', 'In MDN''s `Counter` example, why does passing `this` as the second argument to `forEach()` matter when using a normal function expression?', 'The second argument to `forEach()` is `thisArg`. With a normal function expression, that value becomes `this` inside the callback, allowing the callback to update the `Counter` instance. MDN also notes that an arrow function could rely on lexical `this` instead.', 'hard', 'approved', 'c648ff5f-781f-4fa0-9e9c-552fc71b0d6f', 169, '2026-04-01T05:23:59.318Z', '2026-04-01T05:23:59.318Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('46e91418-92bd-4d24-88e9-b265beace547', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement best describes `Array.prototype.map()`?', '`map()` calls the callback for each assigned element and builds a new array from the callback return values. The original array is not replaced by the returned array. If you only want side effects, MDN recommends `forEach()` or a loop instead.', 'easy', 'approved', '0eaf9603-e435-44b3-bed8-168646b49b81', 170, '2026-04-01T05:24:03.206Z', '2026-04-01T05:24:03.206Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a239bafe-f85e-4813-80b1-236d83c9fb20', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the result of this code?

```js
["1", "2", "3"].map(parseInt);
```', '`map()` passes three arguments to its callback: element, index, and array. `parseInt` treats the second argument as the radix, so the calls become `parseInt(''1'', 0)`, `parseInt(''2'', 1)`, and `parseInt(''3'', 2)`, producing `[1, NaN, NaN]`.', 'medium', 'approved', '0eaf9603-e435-44b3-bed8-168646b49b81', 171, '2026-04-01T05:24:03.208Z', '2026-04-01T05:24:03.208Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('17a9a4b1-67bd-4da8-b71f-ca69489722c5', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this code log?

```js
const result = [1, , 3].map((x, index) => {
  console.log(index);
  return x * 2;
});

console.log(result);
```', 'For sparse arrays, `map()` skips empty slots entirely. The callback runs for indexes `0` and `2`, and the returned array stays sparse, so the result is `[2, empty, 6]` rather than `[2, undefined, 6]`.', 'medium', 'approved', '0eaf9603-e435-44b3-bed8-168646b49b81', 172, '2026-04-01T05:24:03.210Z', '2026-04-01T05:24:03.210Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3f2d8f41-dc9f-43f2-bf40-0510ff792e01', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the value of `filteredNumbers` after this code runs?

```js
const numbers = [1, 2, 3, 4];
const filteredNumbers = numbers.map((num, index) => {
  if (index < 3) {
    return num;
  }
});
```', 'If a `map()` callback returns nothing for an element, the corresponding slot in the new array gets `undefined`. `map()` does not remove the element. To remove elements, MDN recommends `filter()` or `flatMap()`.', 'medium', 'approved', '0eaf9603-e435-44b3-bed8-168646b49b81', 173, '2026-04-01T05:24:03.211Z', '2026-04-01T05:24:03.211Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9cb73eaa-bf7c-4af7-912c-8177c73ca1e5', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this code return?

```js
const arrayLike = {
  length: 3,
  0: 2,
  1: 3,
  2: 4,
  3: 5
};

Array.prototype.map.call(arrayLike, (x) => x ** 2);
```', '`map()` is generic. It only needs a `length` and integer-keyed properties, so it works on array-like objects. Because `length` is `3`, index `3` is ignored and the result is `[4, 9, 16]`.', 'hard', 'approved', '0eaf9603-e435-44b3-bed8-168646b49b81', 174, '2026-04-01T05:24:03.212Z', '2026-04-01T05:24:03.212Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('fbd0f4bd-bc41-4ae0-95c3-49a691d1693a', '9872b186-472e-4391-a150-7239315fc8b1', 'What are the values of `a` and `b` after this code runs?

```js
const a = [].every(() => false);
const b = [].some(() => true);
```', 'For empty arrays, `every()` is vacuously true and returns `true`, while `some()` returns `false` because there is no element that satisfies the predicate.', 'hard', 'approved', '624928e4-c92b-4f60-94c8-325f926b7385', 175, '2026-04-01T05:24:07.111Z', '2026-04-01T05:24:07.111Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('29462821-6111-4efb-b5b7-31b774414907', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about sparse-array holes is correct for `[1, , 3]`?', 'MDN distinguishes two groups here: `map()`, `filter()`, `forEach()`, `every()`, and `some()` skip holes, while `find()` and `findIndex()` visit holes and treat them like `undefined`.', 'hard', 'approved', '624928e4-c92b-4f60-94c8-325f926b7385', 176, '2026-04-01T05:24:07.113Z', '2026-04-01T05:24:07.113Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('98a1cd45-e767-4009-9f9a-d7d1c1234633', '9872b186-472e-4391-a150-7239315fc8b1', 'Which option correctly matches the results of these two expressions?

```js
const a = ["1", "2", "3"].map(parseInt);
const b = ["1", "2", "3"].map(Number);
```', '`map(parseInt)` is a classic callback-arity trap because `map()` passes the index as the second argument and `parseInt` treats that as radix. `Number` takes a single argument, so `map(Number)` behaves as expected.', 'hard', 'approved', '624928e4-c92b-4f60-94c8-325f926b7385', 177, '2026-04-01T05:24:07.117Z', '2026-04-01T05:24:07.117Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('23f41870-406f-4b0b-a19d-729b05a4b7b7', '9872b186-472e-4391-a150-7239315fc8b1', 'What are the values of `a` and `b` after this code runs?

```js
const users = [{ id: 1 }, { id: 2 }];
const a = users.forEach((user) => user.id);
const b = users.map((user) => user.id);
```', '`forEach()` ignores callback return values and itself returns `undefined`. `map()` collects callback return values into a new array, so `b` becomes `[1, 2]`.', 'medium', 'approved', '624928e4-c92b-4f60-94c8-325f926b7385', 178, '2026-04-01T05:24:07.120Z', '2026-04-01T05:24:07.120Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('621a4e3d-f104-441d-91e4-a1e48a488909', '9872b186-472e-4391-a150-7239315fc8b1', 'What are the values of `a` and `b` after this code runs?

```js
const arr = [4, 6, 8];
const a = arr.find((n) => n > 10);
const b = arr.findIndex((n) => n > 10);
```', 'When no element matches, `find()` returns `undefined` and `findIndex()` returns `-1`. That difference matters when you need the element versus the position.', 'medium', 'approved', '624928e4-c92b-4f60-94c8-325f926b7385', 179, '2026-04-01T05:24:07.123Z', '2026-04-01T05:24:07.123Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a9271ee5-a5d2-45b7-92b8-db062bce40cd', '9872b186-472e-4391-a150-7239315fc8b1', 'What are the values of `a` and `b` after this code runs?

```js
const inventory = [
  { name: "apples", quantity: 2 },
  { name: "bananas", quantity: 0 },
  { name: "cherries", quantity: 5 }
];

const a = inventory.find((item) => item.quantity > 0);
const b = inventory.filter((item) => item.quantity > 0);
```', '`find()` returns the first matching element, so `a` is the apples object. `filter()` returns all matching elements in a new array, so `b` contains both apples and cherries.', 'hard', 'approved', '624928e4-c92b-4f60-94c8-325f926b7385', 180, '2026-04-01T05:24:07.124Z', '2026-04-01T05:24:07.124Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('dfc3c131-0ca1-46eb-ad88-e9c4f7f69a9c', '9872b186-472e-4391-a150-7239315fc8b1', 'MDN shows this pattern for testing whether all values are even:

```js
const allEven = array.reduce((acc, cur) => acc && cur % 2 === 0, true);
```

Which replacement is the most semantically appropriate and may stop earlier once the answer is known?', 'MDN explicitly calls out that testing whether every element satisfies a condition is a better fit for `every()`. It is clearer and can short-circuit as soon as a failing element is found.', 'hard', 'approved', '624928e4-c92b-4f60-94c8-325f926b7385', 181, '2026-04-01T05:24:07.127Z', '2026-04-01T05:24:07.127Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b666b38f-aa86-4d9e-b2b2-5db1e1e2c855', '9872b186-472e-4391-a150-7239315fc8b1', 'For `const obj = { 100: "a", 2: "b", 7: "c" };`, which set of outputs is correct?', 'For integer-like property names, enumeration uses numeric order. That means keys are `[''2'', ''7'', ''100'']`, values are `[''b'', ''c'', ''a'']`, and entries are `[[''2'', ''b''], [''7'', ''c''], [''100'', ''a'']]`.', 'hard', 'approved', '624928e4-c92b-4f60-94c8-325f926b7385', 182, '2026-04-01T05:24:07.129Z', '2026-04-01T05:24:07.129Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('5d542f5c-6cdf-41c0-9fa6-829a23441b95', '9872b186-472e-4391-a150-7239315fc8b1', 'Which trio is correct for the string primitive `"foo"`?', 'Strings are coerced to objects with enumerable index-like properties. That is why `Object.keys(''foo'')` yields index strings, `Object.values(''foo'')` yields characters, and `Object.entries(''foo'')` yields index-character pairs.', 'hard', 'approved', '624928e4-c92b-4f60-94c8-325f926b7385', 183, '2026-04-01T05:24:07.130Z', '2026-04-01T05:24:07.130Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('66d86fd1-02a4-4c20-a520-b0a9759d954b', '9872b186-472e-4391-a150-7239315fc8b1', 'What is true after this code runs?

```js
const target = { meta: { version: 1 } };
const source = { meta: { version: 2 }, flag: true };
const result = Object.assign(target, source);
result.meta.version = 3;
```', '`Object.assign()` mutates and returns the target object, so `result === target`. It also performs a shallow copy, which means `target.meta` and `source.meta` point to the same nested object after assignment. Updating `result.meta.version` therefore also changes `source.meta.version` to `3`.', 'hard', 'approved', '624928e4-c92b-4f60-94c8-325f926b7385', 184, '2026-04-01T05:24:07.134Z', '2026-04-01T05:24:07.134Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4023372a-44f8-461d-8dfe-417919c160ce', '9872b186-472e-4391-a150-7239315fc8b1', 'When `reduce()` is called without an `initialValue`, what are the accumulator and current value on the first callback invocation for `[10, 20, 30]`?', 'Without an `initialValue`, `reduce()` uses the element at index `0` as the initial accumulator and begins iteration at index `1`. For `[10, 20, 30]`, the first call receives `accumulator = 10` and `currentValue = 20`.', 'medium', 'approved', '1e7da090-b303-4b5c-a26a-2a2449f99140', 185, '2026-04-01T05:24:11.141Z', '2026-04-01T05:24:11.141Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b9493f77-48f1-46e0-8f65-37dc95544f2b', '9872b186-472e-4391-a150-7239315fc8b1', 'What happens here?

```js
[].reduce((a, b) => a + b);
```', 'Calling `reduce()` on an empty array without an `initialValue` throws a `TypeError`, because there is no first element available to seed the accumulator.', 'easy', 'approved', '1e7da090-b303-4b5c-a26a-2a2449f99140', 186, '2026-04-01T05:24:11.145Z', '2026-04-01T05:24:11.145Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c68bb268-6979-4f62-b862-a1d15620446b', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this expression return?

```js
[50].reduce((a, b) => Math.max(a, b));
```', 'If the array has only one element and no `initialValue` is provided, `reduce()` returns that element directly and does not invoke the callback at all.', 'medium', 'approved', '1e7da090-b303-4b5c-a26a-2a2449f99140', 187, '2026-04-01T05:24:11.147Z', '2026-04-01T05:24:11.147Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e3c70b99-309d-4789-a1cb-b1b7600a35e1', '9872b186-472e-4391-a150-7239315fc8b1', 'Which option correctly matches the results of these two expressions?

```js
[1, 2, , 4].reduce((a, b) => a + b)
[1, 2, undefined, 4].reduce((a, b) => a + b)
```', '`reduce()` skips holes in sparse arrays, so the first expression becomes `1 + 2 + 4`, which is `7`. But explicit `undefined` is still visited, so `1 + 2 + undefined` becomes `NaN`, and the final result remains `NaN`.', 'hard', 'approved', '1e7da090-b303-4b5c-a26a-2a2449f99140', 188, '2026-04-01T05:24:11.150Z', '2026-04-01T05:24:11.150Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b16aab9f-d77a-46c6-9522-ac2a3d82bd6f', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about `reduce()` is correct?', 'Unlike several other iterative array methods, `reduce()` does not accept a `thisArg`. Also, if you mutate an object or array accumulator inside the callback, you still must return it so the next iteration receives the accumulator value.', 'hard', 'approved', '1e7da090-b303-4b5c-a26a-2a2449f99140', 189, '2026-04-01T05:24:11.152Z', '2026-04-01T05:24:11.152Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0f41c95a-0f97-418a-8dba-d84d92692028', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement best describes `Array.prototype.some()`?', '`some()` checks whether at least one element satisfies the predicate. It returns `true` as soon as one matching element is found, otherwise it returns `false`.', 'easy', 'approved', '205d16f9-8ec6-4094-bc79-55878e07e4da', 190, '2026-04-01T05:24:14.982Z', '2026-04-01T05:24:14.982Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('bac69c05-a5b3-4ff0-b8a5-3dfd0c7ba351', '9872b186-472e-4391-a150-7239315fc8b1', 'What does `[].some(() => true)` return?', 'For an empty array, `some()` returns `false`, because there is no element that satisfies the condition.', 'medium', 'approved', '205d16f9-8ec6-4094-bc79-55878e07e4da', 191, '2026-04-01T05:24:14.984Z', '2026-04-01T05:24:14.984Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ee8212a2-0efa-4a5b-9763-71956f391391', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the result of this expression?

```js
[1, , 3].some((x) => x === undefined);
```', '`some()` skips empty slots in sparse arrays, so the hole is never tested. Neither `1` nor `3` is `undefined`, so the result is `false`.', 'hard', 'approved', '205d16f9-8ec6-4094-bc79-55878e07e4da', 192, '2026-04-01T05:24:14.986Z', '2026-04-01T05:24:14.986Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('5c90a49d-393c-454e-9d2f-4b831d205b19', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this code evaluate to?

```js
const arr = [1, 2, 3];
const result = arr.some((x) => {
  arr.push(4);
  return x === 4;
});

result;
```', 'MDN notes that `some()` saves the array length before the first callback invocation. Elements added beyond the original length are not visited, so the pushed `4` is never checked and the result is `false`.', 'hard', 'approved', '205d16f9-8ec6-4094-bc79-55878e07e4da', 193, '2026-04-01T05:24:14.988Z', '2026-04-01T05:24:14.988Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0157386b-7fcf-47d1-bfda-ce5bb87291a7', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this code return?

```js
const arrayLike = {
  length: 3,
  0: "a",
  1: "b",
  2: "c",
  3: 3
};

Array.prototype.some.call(arrayLike, (x) => typeof x === "number");
```', '`some()` is generic and reads indices `0` through `2` because `length` is `3`. All those visited values are strings, so no element passes the predicate and the result is `false`.', 'hard', 'approved', '205d16f9-8ec6-4094-bc79-55878e07e4da', 194, '2026-04-01T05:24:14.989Z', '2026-04-01T05:24:14.989Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('97ca8e40-288e-42b5-80eb-ea5ed4687d88', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement best describes `Object.assign()`?', '`Object.assign()` copies enumerable own properties from one or more source objects into a target object, mutates that target, and returns the modified target object.', 'easy', 'approved', '5cd7df9e-b73e-49aa-b030-2be8e6525544', 195, '2026-04-01T05:24:19.482Z', '2026-04-01T05:24:19.482Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d7cb35b4-a999-4557-9e4b-99b2b5942e65', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the result of this expression?

```js
Object.assign({}, { a: 1, b: 1, c: 1 }, { b: 2, c: 2 }, { c: 3 });
```', 'Later source objects overwrite properties from earlier sources. That is why `b` becomes `2` and `c` becomes `3` in the final result.', 'medium', 'approved', '5cd7df9e-b73e-49aa-b030-2be8e6525544', 196, '2026-04-01T05:24:19.484Z', '2026-04-01T05:24:19.484Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('47301cbe-ccec-431a-b137-083c62ff4f5c', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about `Object.assign()` and nested objects is correct?', '`Object.assign()` performs a shallow copy. If a property value is a reference to another object, only that reference is copied, so nested objects are still shared.', 'medium', 'approved', '5cd7df9e-b73e-49aa-b030-2be8e6525544', 197, '2026-04-01T05:24:19.487Z', '2026-04-01T05:24:19.487Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2c11129a-ed9a-40fe-ac18-53773d07470f', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about `null` and `undefined` in `Object.assign()` is correct?', '`null` or `undefined` as the target throws a `TypeError`, because the target must be converted to an object. However, `null` and `undefined` sources are ignored and do not throw.', 'hard', 'approved', '5cd7df9e-b73e-49aa-b030-2be8e6525544', 198, '2026-04-01T05:24:19.491Z', '2026-04-01T05:24:19.491Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('20c69f64-f4f9-41f1-b85d-34e945c48c3c', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the value of `copy` after this code runs?

```js
const obj = {
  foo: 1,
  get bar() {
    return 2;
  }
};

const copy = Object.assign({}, obj);
```', '`Object.assign()` uses `[[Get]]` on the source and `[[Set]]` on the target, so getters are invoked and their returned values are assigned. The getter itself is not copied as an accessor descriptor. The result is `{ foo: 1, bar: 2 }`.', 'hard', 'approved', '5cd7df9e-b73e-49aa-b030-2be8e6525544', 199, '2026-04-01T05:24:19.493Z', '2026-04-01T05:24:19.493Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7b552d15-e158-4c06-8beb-380bde0861e6', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement best describes `Object.entries()`?', '`Object.entries()` returns an array of the object''s own enumerable string-keyed key-value pairs. Each entry is a two-element array where the first value is the key string and the second is the property value.', 'easy', 'approved', 'f663456c-76bd-41c2-98dc-159211c90750', 200, '2026-04-01T05:24:23.356Z', '2026-04-01T05:24:23.356Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('012dc0dd-d6ee-4452-af34-448bbf665570', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this expression return?

```js
Object.entries({ 100: "a", 2: "b", 7: "c" });
```', 'The enumeration order follows numeric key ordering for integer-like keys, so the result is `[[''2'', ''b''], [''7'', ''c''], [''100'', ''a'']]`.', 'medium', 'approved', 'f663456c-76bd-41c2-98dc-159211c90750', 201, '2026-04-01T05:24:23.359Z', '2026-04-01T05:24:23.359Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('017cfe67-6189-4404-8587-7013f82384a4', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the result of `Object.entries("foo")`?', 'Strings are coerced to objects whose index-like properties are enumerable, so the result is `[[''0'', ''f''], [''1'', ''o''], [''2'', ''o'']]`.', 'medium', 'approved', 'f663456c-76bd-41c2-98dc-159211c90750', 202, '2026-04-01T05:24:23.361Z', '2026-04-01T05:24:23.361Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('601b10fb-1685-4e49-8a3c-2582e9248774', '9872b186-472e-4391-a150-7239315fc8b1', 'Which expression converts an object''s own enumerable string-keyed pairs into a `Map`?', 'The `Map` constructor accepts an iterable of entries, so `new Map(Object.entries(obj))` converts the object''s enumerable key-value pairs into a `Map`.', 'medium', 'approved', 'f663456c-76bd-41c2-98dc-159211c90750', 203, '2026-04-01T05:24:23.363Z', '2026-04-01T05:24:23.363Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('16d84b9d-eff2-4e3e-9c49-20b222a9c43d', '9872b186-472e-4391-a150-7239315fc8b1', 'Which key-value pairs are excluded from `Object.entries(obj)`?', '`Object.entries()` includes only own enumerable string-keyed properties, so inherited properties and non-enumerable own properties are excluded.', 'medium', 'approved', 'f663456c-76bd-41c2-98dc-159211c90750', 204, '2026-04-01T05:24:23.367Z', '2026-04-01T05:24:23.367Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('40cff2d8-7995-4e17-ae83-eb76d58137c0', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement best describes `Object.keys()`?', '`Object.keys()` returns an array of the object''s own enumerable string-keyed property names. It does not include inherited properties, non-enumerable properties, or symbol keys.', 'easy', 'approved', 'de0435dc-cda2-4da7-803c-e3d6b6e80414', 205, '2026-04-01T05:24:26.892Z', '2026-04-01T05:24:26.892Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f81263e4-de6b-4a20-90ae-e6b344b831fc', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this expression return?

```js
Object.keys({ 100: "a", 2: "b", 7: "c" });
```', 'For integer-like keys, JavaScript enumerates them in ascending numeric order, so the result is `[''2'', ''7'', ''100'']` rather than insertion order.', 'medium', 'approved', 'de0435dc-cda2-4da7-803c-e3d6b6e80414', 206, '2026-04-01T05:24:26.894Z', '2026-04-01T05:24:26.894Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('641b9fdb-9f72-43c3-978a-6e617ed9450b', '9872b186-472e-4391-a150-7239315fc8b1', 'How does `Object.keys(obj)` differ from a `for...in` loop over `obj`?', 'MDN states that `Object.keys()` corresponds to the same order as `for...in`, but unlike `for...in`, it does not enumerate properties from the prototype chain.', 'medium', 'approved', 'de0435dc-cda2-4da7-803c-e3d6b6e80414', 207, '2026-04-01T05:24:26.897Z', '2026-04-01T05:24:26.897Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e2319099-078c-4a79-8ca8-69fd133514bf', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the result of `Object.keys("foo")`?', 'Non-object arguments are coerced to objects. Strings expose index-like own enumerable properties, so `Object.keys(''foo'')` returns `[''0'', ''1'', ''2'']`.', 'medium', 'approved', 'de0435dc-cda2-4da7-803c-e3d6b6e80414', 208, '2026-04-01T05:24:26.900Z', '2026-04-01T05:24:26.900Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3b5b5224-91bd-4e74-adf9-43ea9a76e366', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about invalid arguments to `Object.keys()` is correct?', '`undefined` and `null` cannot be coerced to objects and therefore throw a `TypeError`. Other primitives are coerced, though most of them have no enumerable own properties.', 'medium', 'approved', 'de0435dc-cda2-4da7-803c-e3d6b6e80414', 209, '2026-04-01T05:24:26.901Z', '2026-04-01T05:24:26.901Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0c601d39-df64-4b16-808a-622a1a19d4a1', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement best describes `Object.values()`?', '`Object.values()` returns an array of an object''s own enumerable string-keyed property values. It excludes inherited properties, non-enumerable properties, and symbol-keyed properties.', 'easy', 'approved', '95e98c8c-2189-4047-ab52-0281587ffd31', 210, '2026-04-01T05:24:30.604Z', '2026-04-01T05:24:30.604Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a2e54f58-6328-48da-8ec9-ef07190684c3', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this expression return?

```js
Object.values({ 100: "a", 2: "b", 7: "c" });
```', 'Because numeric-like keys are enumerated in numeric order, the corresponding values come back as `[''b'', ''c'', ''a'']`.', 'medium', 'approved', '95e98c8c-2189-4047-ab52-0281587ffd31', 211, '2026-04-01T05:24:30.606Z', '2026-04-01T05:24:30.606Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('5f34deea-5687-4985-a5d5-1a292e403a0d', '9872b186-472e-4391-a150-7239315fc8b1', 'Which property values are excluded from `Object.values(obj)`?', '`Object.values()` only includes own enumerable string-keyed properties. That means prototype properties and non-enumerable properties are excluded.', 'medium', 'approved', '95e98c8c-2189-4047-ab52-0281587ffd31', 212, '2026-04-01T05:24:30.609Z', '2026-04-01T05:24:30.609Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('17b8e1af-82b2-4a0f-8fd9-8e0eb4fd5e2b', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the result of `Object.values("foo")`?', 'Strings are coerced to objects with index-like own enumerable properties, so `Object.values(''foo'')` returns `[''f'', ''o'', ''o'']`.', 'medium', 'approved', '95e98c8c-2189-4047-ab52-0281587ffd31', 213, '2026-04-01T05:24:30.611Z', '2026-04-01T05:24:30.611Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('790b1f54-90f4-4959-92cf-51b2c4f439e0', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about invalid arguments to `Object.values()` is correct?', '`undefined` and `null` cannot be coerced to objects and therefore cause a `TypeError`. Other primitives are coerced first.', 'medium', 'approved', '95e98c8c-2189-4047-ab52-0281587ffd31', 214, '2026-04-01T05:24:30.614Z', '2026-04-01T05:24:30.614Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('132381e2-2519-4e7a-bbe1-a29d8c4a765f', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this code log?

```js
let [firstName, , title] = [
  "Julius",
  "Caesar",
  "Consul",
  "of the Roman Republic",
];
console.log(title);
```', 'Extra commas skip unwanted array items. Here the second value is ignored, so `title` receives the third value, `"Consul"`.

Example:

```js
const [a, , b] = [10, 20, 30];
// a is 10, b is 30
```', 'easy', 'approved', '2478ce6f-1220-4ae3-b6d1-d3c798fa7e9d', 215, '2026-04-01T06:22:26.830Z', '2026-04-01T06:22:26.830Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('49bc4492-1408-4f8f-8658-22cc9ee33454', '9872b186-472e-4391-a150-7239315fc8b1', 'Why is this valid JavaScript?

```js
let [one, two, three] = new Set([1, 2, 3]);
```', 'Destructuring on the right-hand side works with any iterable, not only arrays. A `Set` is iterable, so its yielded values can be assigned into variables in order.

Example:

```js
let [a, b, c] = "abc";
// a, b, c become ''a'', ''b'', ''c''
```', 'medium', 'approved', '2478ce6f-1220-4ae3-b6d1-d3c798fa7e9d', 216, '2026-04-01T06:22:26.841Z', '2026-04-01T06:22:26.841Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('90ef9271-d01d-4de7-8d26-5d4abfe2b511', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this code log?

```js
let user = {};
[user.name, user.surname] = "John Smith".split(" ");
console.log(user.name, user.surname);
```', 'Destructuring can assign into any assignable target on the left side, including object properties. The first split value goes to `user.name` and the second goes to `user.surname`.

Example:

```js
let obj = {};
[obj.a, obj.b] = [1, 2];
```', 'medium', 'approved', '2478ce6f-1220-4ae3-b6d1-d3c798fa7e9d', 217, '2026-04-01T06:22:26.844Z', '2026-04-01T06:22:26.844Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('5ed7f4d3-35bf-4cc1-be39-5328bdb9843e', '9872b186-472e-4391-a150-7239315fc8b1', 'Why does this assignment need parentheses?

```js
let title, width, height;
({ title, width, height } = { title: "Menu", width: 200, height: 100 });
```', 'Without parentheses, JavaScript treats `{ ... }` in the main code flow as a block statement. Wrapping the destructuring assignment in parentheses makes it an expression instead.

Example:

```js
let x;
({ x } = { x: 1 });
```', 'medium', 'approved', '2478ce6f-1220-4ae3-b6d1-d3c798fa7e9d', 218, '2026-04-01T06:22:26.847Z', '2026-04-01T06:22:26.847Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('373dd1da-7adb-460d-8c50-1809d5d6d581', '9872b186-472e-4391-a150-7239315fc8b1', 'Why is `= {}` often added to a destructured function parameter?

```js
function showMenu({ title = "Menu", width = 100, height = 200 } = {}) {
  // ...
}
```', 'The whole parameter gets a default empty object so the function can be called with no arguments. Without `= {}`, calling `showMenu()` would try to destructure `undefined` and throw.

Example:

```js
showMenu(); // works because the entire parameter defaults to {}
```', 'medium', 'approved', '2478ce6f-1220-4ae3-b6d1-d3c798fa7e9d', 219, '2026-04-01T06:22:26.851Z', '2026-04-01T06:22:26.851Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('6195d0b6-1af4-4180-9650-c6f9f211adf4', '9872b186-472e-4391-a150-7239315fc8b1', 'What is required to make this object destructuring assignment valid?

```js
let a, b;
({ a, b } = { a: 1, b: 2 });
```', 'Parentheses are required when object destructuring is used as an assignment expression without a declaration keyword. Otherwise `{ a, b } = ...` is parsed as a block statement instead of an object pattern.

Example:

```js
let a, b;
({ a, b } = source);
```', 'easy', 'approved', 'b955d1f0-cddd-4210-bc39-369f5e6dda64', 220, '2026-04-01T06:22:31.058Z', '2026-04-01T06:22:31.058Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1173db91-508b-46ba-bf95-d9654dd34964', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about default values in destructuring is correct?', 'A destructuring default runs only when the value is missing or `undefined`. It does not replace `null`.

Example:

```js
const { b = 2 } = { b: undefined }; // b is 2
const { c = 2 } = { c: null }; // c is null
```', 'medium', 'approved', 'b955d1f0-cddd-4210-bc39-369f5e6dda64', 221, '2026-04-01T06:22:31.062Z', '2026-04-01T06:22:31.062Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('98fbd85f-0d82-43b5-8f85-6073ff819791', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this code log?

```js
const [first, second] = new Map([
  [1, 2],
  [3, 4],
]);
console.log(first, second);
```', 'Array destructuring uses the iterable protocol. A `Map` is iterable over its entry pairs, so the first two yielded values are `[1, 2]` and `[3, 4]`.

Example:

```js
const [pair] = new Map([[1, 2]]);
// pair is [1, 2]
```', 'medium', 'approved', 'b955d1f0-cddd-4210-bc39-369f5e6dda64', 222, '2026-04-01T06:22:31.066Z', '2026-04-01T06:22:31.066Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ea085d40-728d-4d37-be31-707c57c7a896', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about rest in destructuring is correct?', 'In destructuring, the rest part collects the remaining values. For arrays, the rest element must be last and cannot have a trailing comma.

Example:

```js
const [first, ...others] = [1, 2, 3];
// others is [2, 3]
```', 'medium', 'approved', 'b955d1f0-cddd-4210-bc39-369f5e6dda64', 223, '2026-04-01T06:22:31.071Z', '2026-04-01T06:22:31.071Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1cf8346b-c0fb-4b9d-b74e-3ba2b2f6b2c2', '9872b186-472e-4391-a150-7239315fc8b1', 'Why is the first statement valid while the second one is not?

```js
const numbers = [];
const obj = { a: 1, b: 2 };
({ a: numbers[0], b: numbers[1] } = obj);

// const { a: numbers[0], b: numbers[1] } = obj;
```', 'Assignment patterns can assign into any assignable target, such as array elements or object properties. Binding patterns create new bindings, so targets like `numbers[0]` are invalid there.

Example:

```js
({ a: result.value } = obj); // valid assignment target
```', 'hard', 'approved', 'b955d1f0-cddd-4210-bc39-369f5e6dda64', 224, '2026-04-01T06:22:31.076Z', '2026-04-01T06:22:31.076Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('220af1f7-c418-46ab-a85b-bf4f7ce3af55', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this log?

```js
function collect(label, ...values) {
  return `${label}:${values.length}`;
}
const data = [10, 20, 30];
console.log(collect(''items'', ...data));
```', 'Spread expands `data` into three arguments, while the rest parameter gathers those extra arguments into the `values` array. The template literal then formats the result as `items:3`.

Example:

```js
collect(''x'', ...[1, 2]); // ''x:2''
```', 'medium', 'approved', '655cb3d6-7115-4b0c-af25-ab11d49f72d2', 225, '2026-04-01T06:22:35.949Z', '2026-04-01T06:22:35.949Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1c964e3e-8ffd-4540-b5b8-0972da92d1bd', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this log?

```js
const { port = 3000 } = { port: null };
console.log(`Port=${port}`);
```', 'Destructuring defaults do not replace `null`; they only apply to `undefined` or missing values. The template literal therefore interpolates the actual value `null`.

Example:

```js
const { x = 1 } = { x: undefined }; // x is 1
```', 'medium', 'approved', '655cb3d6-7115-4b0c-af25-ab11d49f72d2', 226, '2026-04-01T06:22:35.953Z', '2026-04-01T06:22:35.953Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3ab528ca-c189-4356-8790-e11eaf53cc62', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about these two operations is correct?

```js
const obj = { a: 1 };
const a = { ...obj };
const b = [...obj];
```', 'Object spread enumerates own properties, so `{ ...obj }` works. Array spread requires an iterable, and a plain object is not iterable by default, so `[...obj]` throws.

Example:

```js
const ok = { ...[1, 2] }; // { 0: 1, 1: 2 }
```', 'hard', 'approved', '655cb3d6-7115-4b0c-af25-ab11d49f72d2', 227, '2026-04-01T06:22:35.955Z', '2026-04-01T06:22:35.955Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a104f175-334f-4772-813f-16861a41746a', '9872b186-472e-4391-a150-7239315fc8b1', 'Assume a module exports this object:

```js
export const config = {
  theme: { mode: ''dark'' },
};
```

Another module runs:

```js
import { config } from ''./config.js'';
const clone = { ...config };
clone.theme.mode = ''light'';
```

What is true?', 'Module exports are shared, and object spread is shallow. `clone` is a new top-level object, but `clone.theme` still points to the same nested object as `config.theme`, so changing `mode` affects both.

Example:

```js
clone === config; // false
clone.theme === config.theme; // true
```', 'hard', 'approved', '655cb3d6-7115-4b0c-af25-ab11d49f72d2', 228, '2026-04-01T06:22:35.957Z', '2026-04-01T06:22:35.957Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2434e310-f6df-44cf-829b-1a0c2c1758c8', '9872b186-472e-4391-a150-7239315fc8b1', 'Which line correctly grabs a default export from a dynamic import?

```js
// assume ./user.js has a default export
```', 'Dynamic import resolves to a module object. The default export lives on its `default` property, so destructuring it as `{ default: User }` is a clean way to access it.

Example:

```js
const { default: User } = await import(''./user.js'');
```', 'medium', 'approved', '655cb3d6-7115-4b0c-af25-ab11d49f72d2', 229, '2026-04-01T06:22:35.962Z', '2026-04-01T06:22:35.962Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('676d9b39-f9c9-408f-80ea-33e2503d3dfe', '9872b186-472e-4391-a150-7239315fc8b1', 'What is true if `index.js` contains only this line?

```js
export * from ''./user.js'';
```

Assume `user.js` has a default export.', '`export *` re-exports named exports, but it does not re-export the default export. To re-export a default, a separate statement such as `export { default as User } from ''./user.js'';` is needed.

Example:

```js
export * from ''./user.js'';
export { default as User } from ''./user.js'';
```', 'hard', 'approved', '655cb3d6-7115-4b0c-af25-ab11d49f72d2', 230, '2026-04-01T06:22:35.965Z', '2026-04-01T06:22:35.965Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('86091cc0-0597-492a-a60f-712799f7e926', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about invalid escape sequences is correct?

```js
function log(str) {
  return [str[0], str.raw[0]];
}
```', 'A tagged template may preserve a malformed escape in the raw literal, but an untagged template literal with the same malformed escape is a syntax error.

Example:

```js
log`\unicode`; // cooked entry is undefined, raw entry is ''\unicode''
```', 'hard', 'approved', '655cb3d6-7115-4b0c-af25-ab11d49f72d2', 231, '2026-04-01T06:22:35.987Z', '2026-04-01T06:22:35.987Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('fd25a26a-4134-4027-a50a-fc0272a234f8', '9872b186-472e-4391-a150-7239315fc8b1', 'What is still required here, even if this code is inside a JavaScript module?

```js
let a;
({ a } = { a: 1 });
```', 'Modules change scope and strictness rules, but they do not change how the parser reads a bare `{ ... }` at statement position. The assignment still needs parentheses so it is parsed as an expression.

Example:

```js
let value;
({ value } = source);
```', 'medium', 'approved', '655cb3d6-7115-4b0c-af25-ab11d49f72d2', 232, '2026-04-01T06:22:35.989Z', '2026-04-01T06:22:35.989Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1df7f21d-966b-45b2-b2d5-b14ee5e799ef', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this log?

```js
function skipFirst(...[, second, third]) {
  return `${second}-${third}`;
}
console.log(skipFirst(''a'', ''b'', ''c'', ''d''));
```', 'The rest parameter gathers all arguments into an array, the destructuring pattern skips the first one, and the template literal formats the next two. So the result is `b-c`.

Example:

```js
skipFirst(1, 2, 3); // ''2-3''
```', 'medium', 'approved', '655cb3d6-7115-4b0c-af25-ab11d49f72d2', 233, '2026-04-01T06:22:35.995Z', '2026-04-01T06:22:35.995Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('cb1754f6-dabf-4469-8e76-527f00ae9175', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the likely output in a browser for this module script?

```html
<script type="module">
  console.log(`Button:${typeof button}`);
</script>
<button id="button">Click</button>
```', 'Module scripts are deferred by default in the browser, so they run after the HTML has been parsed. That means the script can see the button declared later in the document, and the template literal logs `Button:object`.

Example:

```html
<script type="module">console.log(typeof button);</script>
<button id="button"></button>
```', 'hard', 'approved', '655cb3d6-7115-4b0c-af25-ab11d49f72d2', 234, '2026-04-01T06:22:36.000Z', '2026-04-01T06:22:36.000Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('76090157-5b40-4978-921f-29cc227e8fb5', '9872b186-472e-4391-a150-7239315fc8b1', 'Which setup is required to use `import` and `export` directly in the browser?', 'In the browser, modules must be loaded with `<script type="module">`, and they should be served over HTTP(S) rather than opened via `file://`.

Example:

```html
<script type="module" src="main.js"></script>
```', 'easy', 'approved', '9bca1bd3-5fba-40a9-8fca-919f0a05272f', 235, '2026-04-01T06:22:40.336Z', '2026-04-01T06:22:40.336Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a15f567e-db6a-4967-8d00-c4079ba1ea40', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about module code is correct?', 'Modules always run in strict mode, and each module has its own top-level scope. Top-level names are not automatically shared across other scripts.

Example:

```js
// user.js
export const user = "John";

// hello.js
import { user } from ''./user.js'';
```', 'medium', 'approved', '9bca1bd3-5fba-40a9-8fca-919f0a05272f', 236, '2026-04-01T06:22:40.341Z', '2026-04-01T06:22:40.341Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9ccc2407-73ad-42d4-b47b-d6ef1739929b', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the practical effect of a module being evaluated only once?', 'A module''s top-level code runs only on the first import. Its exported objects are then shared across importers, so later imports see mutations made through the same exported object.

Example:

```js
// admin.js
export let admin = { name: "John" };
```', 'medium', 'approved', '9bca1bd3-5fba-40a9-8fca-919f0a05272f', 237, '2026-04-01T06:22:40.342Z', '2026-04-01T06:22:40.342Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('94f9da21-2806-400c-94c5-83736b0f4f9f', '9872b186-472e-4391-a150-7239315fc8b1', 'Why is this browser import invalid?

```js
import { sayHi } from ''sayHi'';
```', 'Browsers do not support bare module specifiers by default. The import must use a relative or absolute URL such as `./sayHi.js`.

Example:

```js
import { sayHi } from ''./sayHi.js'';
```', 'medium', 'approved', '9bca1bd3-5fba-40a9-8fca-919f0a05272f', 238, '2026-04-01T06:22:40.345Z', '2026-04-01T06:22:40.345Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f130f008-37d9-4db8-96db-6297cfcc4431', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about `import()` is correct?

```js
const module = await import(''./user.js'');
```', '`import()` is a special syntax that returns a promise resolving to a module object. If the module has a default export, it is available as `module.default` or via destructuring such as `{ default: User }`.

Example:

```js
const { default: User } = await import(''./user.js'');
```', 'hard', 'approved', '9bca1bd3-5fba-40a9-8fca-919f0a05272f', 239, '2026-04-01T06:22:40.351Z', '2026-04-01T06:22:40.351Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('76496959-371a-4382-870a-6f6293ac35ac', '9872b186-472e-4391-a150-7239315fc8b1', 'Which declaration obeys the syntax rules for rest parameters?', 'A function may have only one rest parameter. It must be the last parameter, cannot have a default value, and cannot be followed by a trailing comma.

Example:

```js
function f(a, b, ...theArgs) {}
```', 'easy', 'approved', '9ccd43c3-3cb5-4dc9-9121-606f0db1e960', 240, '2026-04-01T06:22:44.802Z', '2026-04-01T06:22:44.802Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1d26f20e-12b0-47b7-98f7-c0c712ea192d', '9872b186-472e-4391-a150-7239315fc8b1', 'Why are rest parameters usually easier to work with than `arguments`?', 'Rest parameters are real arrays, so array methods like `sort()`, `map()`, and `forEach()` work on them directly. The `arguments` object is only array-like.

Example:

```js
function sortRestArgs(...theArgs) {
  return theArgs.sort();
}
```', 'medium', 'approved', '9ccd43c3-3cb5-4dc9-9121-606f0db1e960', 241, '2026-04-01T06:22:44.807Z', '2026-04-01T06:22:44.807Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b5c6d1de-b84e-4550-925a-ff67b9063b9a', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the value of `f.length` here?

```js
function f(a, b, ...rest) {}
console.log(f.length);
```', 'The `length` of a function counts parameters before the rest parameter. The rest parameter itself is not counted.

Example:

```js
function g(...rest) {}
console.log(g.length); // 0
```', 'medium', 'approved', '9ccd43c3-3cb5-4dc9-9121-606f0db1e960', 242, '2026-04-01T06:22:44.811Z', '2026-04-01T06:22:44.811Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('427d4acd-366c-4688-80a9-3ceed72b3a44', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement correctly compares `...rest` and `arguments` in this function?

```js
function demo(a, b, ...rest) {
  // ...
}
```', '`rest` contains only the extra arguments after `a` and `b`, bundled into a real array. `arguments` contains all passed arguments, including `a` and `b`.

Example:

```js
demo(1, 2, 3, 4);
// rest is [3, 4], arguments contains 1, 2, 3, 4
```', 'medium', 'approved', '9ccd43c3-3cb5-4dc9-9121-606f0db1e960', 243, '2026-04-01T06:22:44.816Z', '2026-04-01T06:22:44.816Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d0417a1e-5a15-4206-8ce2-ea4a33cc80ae', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this function return?

```js
function ignoreFirst(...[, b, c]) {
  return b + c;
}
console.log(ignoreFirst(1, 2, 3, 4));
```', 'The rest parameter collects all arguments into an array, and the destructuring pattern skips the first element. That means `b` becomes `2` and `c` becomes `3`, so the result is `5`.

Example:

```js
function pick(...[, second]) { return second; }
```', 'hard', 'approved', '9ccd43c3-3cb5-4dc9-9121-606f0db1e960', 244, '2026-04-01T06:22:44.821Z', '2026-04-01T06:22:44.821Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b6ba8cd3-19a9-4fbe-8262-5d72fd0ade5b', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this log?

```js
function sum(a, b) {
  return a + b;
}
console.log(sum(1, 2, 3, 4, 5));
```', 'Without a rest parameter, extra arguments are simply ignored by the function body. Only the first two arguments are used here.

Example:

```js
function pair(x, y) { return [x, y]; }
pair(1, 2, 3); // [1, 2]
```', 'easy', 'approved', '7c4e6fcf-0d8c-46d4-82f0-d188d226e4aa', 245, '2026-04-01T06:22:49.373Z', '2026-04-01T06:22:49.373Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('94fe8c73-866a-46e4-955e-9b6bbf160f66', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this code alert?

```js
function f() {
  const showArg = () => arguments[0];
  return showArg();
}
console.log(f(1));
```', 'Arrow functions do not have their own `arguments` object. They close over the `arguments` object of the nearest normal function, so `showArg()` reads `f`''s first argument, which is `1`.

Example:

```js
function outer() {
  return (() => arguments[0])();
}
```', 'medium', 'approved', '7c4e6fcf-0d8c-46d4-82f0-d188d226e4aa', 246, '2026-04-01T06:22:49.376Z', '2026-04-01T06:22:49.376Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('51b8a452-226b-43ab-8361-2a07395c901c', '9872b186-472e-4391-a150-7239315fc8b1', 'Why does `Math.max(arr)` fail to do what `Math.max(...arr)` does?

```js
const arr = [3, 5, 1];
```', '`Math.max` expects a list of numeric arguments, not a single array. Spread turns the iterable into a normal argument list.

Example:

```js
Math.max(...[3, 5, 1]); // 5
```', 'medium', 'approved', '7c4e6fcf-0d8c-46d4-82f0-d188d226e4aa', 247, '2026-04-01T06:22:49.380Z', '2026-04-01T06:22:49.380Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a435d4e6-2390-4876-a687-147753ec4d71', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement correctly compares `Array.from(obj)` and `[...obj]`?

Assume `obj` is array-like but not iterable.', '`Array.from` works with both iterables and array-like objects. Spread works only with iterables, so `[...obj]` fails for a merely array-like value.

Example:

```js
const arrayLike = { 0: ''a'', 1: ''b'', length: 2 };
Array.from(arrayLike); // [''a'', ''b'']
```', 'hard', 'approved', '7c4e6fcf-0d8c-46d4-82f0-d188d226e4aa', 248, '2026-04-01T06:22:49.383Z', '2026-04-01T06:22:49.383Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8c51684a-f51e-43cf-9fac-edfb30811635', '9872b186-472e-4391-a150-7239315fc8b1', 'What is true after this copy?

```js
const arr = [1, 2, 3];
const arrCopy = [...arr];
```', 'Spread creates a new array with the same elements, so the contents match but the reference is different.

Example:

```js
arr === arrCopy; // false
```', 'easy', 'approved', '7c4e6fcf-0d8c-46d4-82f0-d188d226e4aa', 249, '2026-04-01T06:22:49.385Z', '2026-04-01T06:22:49.385Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1bf5fd9b-889d-4a20-b2f6-ad77e550e5f4', '9872b186-472e-4391-a150-7239315fc8b1', 'Why does this throw a TypeError?

```js
const obj = { key1: "value1" };
const array = [...obj];
```', 'Array literal spread requires an iterable value. Plain objects are not iterable by default, so `[...obj]` fails.

Example:

```js
const chars = [..."abc"]; // works because strings are iterable
```', 'easy', 'approved', 'e195b52d-3efa-41f5-9851-8d6daeb3eac3', 250, '2026-04-01T06:22:53.933Z', '2026-04-01T06:22:53.933Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c48fa8ec-3550-4f0c-9dae-7a021e498833', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the value of `obj` after this code runs?

```js
const array = [1, 2, 3];
const obj = { ...array };
```', 'Object spread enumerates own properties. For arrays, the indices are enumerable own properties, so the new object gets numeric keys `0`, `1`, and `2`.

Example:

```js
const obj = { ...[10, 20] };
// { 0: 10, 1: 20 }
```', 'easy', 'approved', 'e195b52d-3efa-41f5-9851-8d6daeb3eac3', 251, '2026-04-01T06:22:53.936Z', '2026-04-01T06:22:53.936Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('287d8764-7865-468d-813c-190a96b1f689', '9872b186-472e-4391-a150-7239315fc8b1', 'Why can this kind of copy still affect the original nested data?

```js
const a = [[1], [2], [3]];
const b = [...a];
b.shift().shift();
```', 'Spread makes a shallow copy. The outer array is new, but its nested arrays still reference the same inner arrays from the original.

Example:

```js
const source = [{ id: 1 }];
const copy = [...source];
copy[0].id = 2; // source[0].id also becomes 2
```', 'medium', 'approved', 'e195b52d-3efa-41f5-9851-8d6daeb3eac3', 252, '2026-04-01T06:22:53.942Z', '2026-04-01T06:22:53.942Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c803158c-cc75-4270-a8a3-b309bdf34b35', '9872b186-472e-4391-a150-7239315fc8b1', 'Why does this pattern avoid adding an `undefined` element when the condition is false?

```js
const isSummer = false;
const fruits = ["apple", "banana", ...(isSummer ? ["watermelon"] : [])];
```', 'When the condition is false, an empty array is spread, so nothing is added. That differs from inserting `isSummer ? "watermelon" : undefined`, which would still create a third element.

Example:

```js
const list = [1, ...(false ? [2] : [])]; // [1]
```', 'medium', 'approved', 'e195b52d-3efa-41f5-9851-8d6daeb3eac3', 253, '2026-04-01T06:22:53.947Z', '2026-04-01T06:22:53.947Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a12f360c-3ce6-4777-9b20-9248ec9bd7a6', '9872b186-472e-4391-a150-7239315fc8b1', 'What happens here?

```js
const obj = { ...true, ..."test", ...10 };
```', 'Object spread enumerates own properties. Only strings contribute enumerable own properties, so the result contains character indices from `"test"` and nothing useful from `true` or `10`.

Example:

```js
const result = { ..."hi" }; // { 0: "h", 1: "i" }
```', 'hard', 'approved', 'e195b52d-3efa-41f5-9851-8d6daeb3eac3', 254, '2026-04-01T06:22:53.948Z', '2026-04-01T06:22:53.948Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d7fae52e-a52a-4ce5-a2fa-9deb2109e8ce', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about these two template literals is correct?

```js
`line 1
line 2`

`line 1 \
line 2`
```', 'A newline written directly inside a template literal becomes part of the resulting string. Escaping the newline with a backslash keeps the source readable but removes the actual line break from the result.

Example:

```js
console.log(`a
b`); // two lines
console.log(`a \
b`); // one line
```', 'medium', 'approved', 'e1d57273-71b9-4b18-8bf8-0611add2c84a', 255, '2026-04-01T06:22:58.470Z', '2026-04-01T06:22:58.470Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('daf9bef2-10e0-422e-9516-42f19a7e84d7', '9872b186-472e-4391-a150-7239315fc8b1', 'How can you include a literal backtick or `${...}` text inside a template literal?', 'Inside a template literal, a backtick can be escaped with `\`` and a dollar sign can be escaped as `\${...}` to prevent interpolation.

Example:

```js
`\`` === ''`'';
`${1}` !== `\${1}`;
```', 'easy', 'approved', 'e1d57273-71b9-4b18-8bf8-0611add2c84a', 256, '2026-04-01T06:22:58.473Z', '2026-04-01T06:22:58.473Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2dbc1929-2bbf-4ba0-9359-e3a9f6b05527', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about tagged templates is correct?', 'A tag function receives an array of string chunks as its first argument and the substitution values as later arguments. It may return any value, not just a string.

Example:

```js
function tag(strings, ...values) {
  return { strings, values };
}
```', 'medium', 'approved', 'e1d57273-71b9-4b18-8bf8-0611add2c84a', 257, '2026-04-01T06:22:58.475Z', '2026-04-01T06:22:58.475Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a49c8273-7520-4627-a785-0fabf1cbbf95', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the purpose of `strings.raw` or `String.raw` with template literals?

```js
String.raw`Hi\n${2 + 3}!`;
```', 'Raw access preserves escape sequences as typed instead of cooking them into actual characters. That is why `String.raw` keeps `\n` as two characters, backslash and `n`.

Example:

```js
String.raw`Hi\n5!`; // ''Hi\\n5!'' as a JavaScript string value
```', 'medium', 'approved', 'e1d57273-71b9-4b18-8bf8-0611add2c84a', 258, '2026-04-01T06:22:58.477Z', '2026-04-01T06:22:58.477Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('fc2e9e0e-44f1-4d94-a454-1eca3373163e', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about invalid escape sequences is correct?', 'Invalid escape sequences are syntax errors in normal template literals, but tagged templates are allowed to preserve them in the raw strings. In the cooked array entry, the value becomes `undefined`.

Example:

```js
function log(str) {
  console.log(str[0], str.raw[0]);
}
log`\unicode`;
```', 'hard', 'approved', 'e1d57273-71b9-4b18-8bf8-0611add2c84a', 259, '2026-04-01T06:22:58.479Z', '2026-04-01T06:22:58.479Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('aa6f5690-9065-46d1-b068-4433a7291e88', '9872b186-472e-4391-a150-7239315fc8b1', 'What happens when a function called from inside a `try` block throws an exception and that exception is not handled inside that called function?', 'MDN states that if any statement in the `try` block, or in a function called from within the `try` block, throws an exception, control immediately shifts to the `catch` block.', 'easy', 'approved', '018bc29d-35cd-4ce5-9188-1b7786ffe8d2', 260, '2026-04-01T06:45:54.033Z', '2026-04-01T06:45:54.033Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9138fe44-2dc0-4706-a887-abb2080f78ed', '9872b186-472e-4391-a150-7239315fc8b1', 'According to MDN, which statement about a `finally` block is correct?', 'The `finally` block runs whether or not an exception is thrown, and it runs before execution continues after the `try...catch...finally` statement.', 'easy', 'approved', '018bc29d-35cd-4ce5-9188-1b7786ffe8d2', 261, '2026-04-01T06:45:54.037Z', '2026-04-01T06:45:54.037Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4e285b25-6126-446d-a86e-aa8d0f612d6e', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this function log?

```js
function f() {
  try {
    throw ''bogus'';
  } catch (e) {
    return true;
  } finally {
    return false;
  }
}

console.log(f());
```', 'MDN explicitly notes that if `finally` returns a value, that value becomes the return value of the entire construct, overwriting earlier `return` statements and even thrown exceptions.', 'medium', 'approved', '018bc29d-35cd-4ce5-9188-1b7786ffe8d2', 262, '2026-04-01T06:45:54.038Z', '2026-04-01T06:45:54.038Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a2efc395-bf19-46f0-ad9d-bb771253d4e5', '9872b186-472e-4391-a150-7239315fc8b1', 'Why does MDN recommend using `new Error(''The message'')` when throwing your own exceptions instead of throwing a raw string such as `''Error2''`?', 'Using `Error` gives the thrown value standard error properties like `name` and `message`, which makes custom exceptions easier to inspect alongside system exceptions.', 'medium', 'approved', '018bc29d-35cd-4ce5-9188-1b7786ffe8d2', 263, '2026-04-01T06:45:54.040Z', '2026-04-01T06:45:54.040Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('dfa9b564-81a8-40ab-838b-1d3cd7cb9324', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the scope of the identifier declared in `catch (err)`?', 'MDN explains that JavaScript creates the catch identifier when the catch block is entered, and that it lasts only for the duration of that catch block.', 'easy', 'approved', '018bc29d-35cd-4ce5-9188-1b7786ffe8d2', 264, '2026-04-01T06:45:54.042Z', '2026-04-01T06:45:54.042Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('85172963-1f9b-48d6-af5d-8bf793a82f76', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about the `throw` keyword matches the MDN guide?', 'MDN explicitly shows that JavaScript can throw strings, numbers, booleans, or objects. It also notes that some thrown objects are more effective than others for error handling.', 'easy', 'approved', '018bc29d-35cd-4ce5-9188-1b7786ffe8d2', 265, '2026-04-01T06:45:54.043Z', '2026-04-01T06:45:54.043Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a4005a5a-d1b3-4372-b357-07b95d9d416c', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this code guarantee?

```js
openMyFile();
try {
  writeMyFile(theData);
} catch (e) {
  handleError(e);
} finally {
  closeMyFile();
}
```', 'MDN uses this pattern to show resource cleanup. `closeMyFile()` runs even if `writeMyFile(theData)` throws.', 'medium', 'approved', '018bc29d-35cd-4ce5-9188-1b7786ffe8d2', 266, '2026-04-01T06:45:54.044Z', '2026-04-01T06:45:54.044Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('6fe8c690-9096-40dc-924c-0212cb4d028b', '9872b186-472e-4391-a150-7239315fc8b1', 'According to MDN, what do the `name` and `message` properties of an error object represent?', '`name` identifies the general class of error, while `message` provides a more specific description.', 'easy', 'approved', '018bc29d-35cd-4ce5-9188-1b7786ffe8d2', 267, '2026-04-01T06:45:54.045Z', '2026-04-01T06:45:54.045Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('cf595298-4fb6-4c54-a206-291cb29d94a5', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement best describes MDN''s note about nested `try...catch` statements?', 'MDN notes that an inner `try` without its own `catch` must include a `finally` block, and then the enclosing `catch` is checked.', 'hard', 'approved', '018bc29d-35cd-4ce5-9188-1b7786ffe8d2', 268, '2026-04-01T06:45:54.046Z', '2026-04-01T06:45:54.046Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('fb128979-b630-48f2-b92c-1167b49bd572', '9872b186-472e-4391-a150-7239315fc8b1', 'Why does MDN advise using `console.error()` instead of `console.log()` when logging from a `catch` block?', 'MDN says `console.error()` formats the message as an error and adds it to the list of error messages generated by the page, which makes debugging clearer.', 'easy', 'approved', '018bc29d-35cd-4ce5-9188-1b7786ffe8d2', 269, '2026-04-01T06:45:54.047Z', '2026-04-01T06:45:54.047Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('cd8a450b-0bb8-4fda-bff5-096246a40308', '9872b186-472e-4391-a150-7239315fc8b1', 'In SitePoint''s `divide(v1, v2, dp)` examples, what built-in error occurs when `toFixed(dp)` receives `-1`?', 'SitePoint uses `toFixed(-1)` as a concrete example of a `RangeError`, because the decimal-place argument must be in an allowed range.', 'easy', 'approved', '6ff7593a-8222-41e2-98ad-f1abdbe19b99', 270, '2026-04-01T06:45:57.929Z', '2026-04-01T06:45:57.929Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0134c428-ae7b-402c-a160-0d16e2d871d9', '9872b186-472e-4391-a150-7239315fc8b1', 'After JavaScript throws an exception inside a function, what does SitePoint say the interpreter does next?', 'The article explains that the interpreter looks for an exception handler in the current function, then moves up the call stack until it finds one or reaches the top level.', 'medium', 'approved', '6ff7593a-8222-41e2-98ad-f1abdbe19b99', 271, '2026-04-01T06:45:57.933Z', '2026-04-01T06:45:57.933Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('be595ce5-55ca-4541-9e41-90fd2c28429b', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this function always log?

```js
function divide(v1, v2, dp) {
  try {
    return (v1 / v2).toFixed(dp);
  } catch (e) {
    return ''ERROR'';
  } finally {
    console.log(''done'');
  }
}
```', 'SitePoint uses `finally` to show code that runs after either the `try` or the `catch` path. `console.log(''done'')` runs regardless of success or failure.', 'easy', 'approved', '6ff7593a-8222-41e2-98ad-f1abdbe19b99', 272, '2026-04-01T06:45:57.935Z', '2026-04-01T06:45:57.935Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7b821bbe-e5ed-40be-a97b-9851dc6bb0a5', '9872b186-472e-4391-a150-7239315fc8b1', 'SitePoint makes which warning about `return` inside a `finally` block?', 'The article states that a `return` in `finally` becomes the return value for the whole function, ignoring returns from `try` or `catch`.', 'medium', 'approved', '6ff7593a-8222-41e2-98ad-f1abdbe19b99', 273, '2026-04-01T06:45:57.937Z', '2026-04-01T06:45:57.937Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('909a8099-ae1a-4e86-b419-7a24f88d5f20', '9872b186-472e-4391-a150-7239315fc8b1', 'If an inner handler does `throw new Error(''ERROR'', { cause: e })`, what can the outer `catch` inspect to recover the original error type?', 'SitePoint demonstrates wrapping an error while preserving the original one in `cause`. The outer handler can inspect `e.cause.name` to learn the underlying type.', 'medium', 'approved', '6ff7593a-8222-41e2-98ad-f1abdbe19b99', 274, '2026-04-01T06:45:57.939Z', '2026-04-01T06:45:57.939Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1ab936c5-9c7d-49f0-b5c3-4ec8bf6219bd', '9872b186-472e-4391-a150-7239315fc8b1', 'Why is `throw new RangeError(''Decimal places must be between 0 and 8'')` a better fit than a generic `Error` in SitePoint''s example?', 'The problem is specifically an out-of-range value, so `RangeError` conveys more precise intent and aligns with built-in JavaScript semantics.', 'medium', 'approved', '6ff7593a-8222-41e2-98ad-f1abdbe19b99', 275, '2026-04-01T06:45:57.941Z', '2026-04-01T06:45:57.941Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ede064f6-c55a-4577-9c8a-a9a4b3ff90fc', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the main benefit of SitePoint''s custom `DivByZeroError extends Error` example?', 'A dedicated error type lets the application distinguish divisor problems from other failures while keeping normal error behavior and properties.', 'medium', 'approved', '6ff7593a-8222-41e2-98ad-f1abdbe19b99', 276, '2026-04-01T06:45:57.942Z', '2026-04-01T06:45:57.942Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1c5ad1d1-7394-470a-be42-8d381b1e951b', '9872b186-472e-4391-a150-7239315fc8b1', 'Why does this outer `try...catch` fail to catch the error?

```js
function asyncError(delay = 1000) {
  setTimeout(() => {
    throw new Error(''I am never caught!'');
  }, delay);
}

try {
  asyncError();
} catch (e) {
  console.error(''This will never run'');
}
```', 'The callback throws later, after the surrounding `try...catch` has already finished. SitePoint uses this example to show that callback-based async errors do not behave like synchronous exceptions.', 'hard', 'approved', '6ff7593a-8222-41e2-98ad-f1abdbe19b99', 277, '2026-04-01T06:45:57.945Z', '2026-04-01T06:45:57.945Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('82ddb63b-dd12-4494-aef8-be84ced69ed9', '9872b186-472e-4391-a150-7239315fc8b1', 'Where should SitePoint''s promise-based `wait(delay)` function validate an invalid `delay` so the function stays consistently asynchronous?', 'The article explicitly warns that the validation must happen inside the promise executor. Throwing before returning the promise would make error cases synchronous and success cases asynchronous.', 'hard', 'approved', '6ff7593a-8222-41e2-98ad-f1abdbe19b99', 278, '2026-04-01T06:45:57.946Z', '2026-04-01T06:45:57.946Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7f40d1d6-08e6-4d6c-80cb-a63550a4aa1c', '9872b186-472e-4391-a150-7239315fc8b1', 'According to SitePoint, what is the async/await equivalent of handling a rejected promise with `.catch()` and then running cleanup with `.finally()`?', 'The article shows an immediately invoked `async` function that uses `try`, `catch`, and `finally` around `await wait(''INVALID'')`.', 'medium', 'approved', '6ff7593a-8222-41e2-98ad-f1abdbe19b99', 279, '2026-04-01T06:45:57.947Z', '2026-04-01T06:45:57.947Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d815170d-6b71-4b49-9f92-204d46a8c15d', '9872b186-472e-4391-a150-7239315fc8b1', 'Which kind of errors can `try...catch` handle according to javascript.info?', 'The tutorial explicitly distinguishes runtime errors from parse-time errors. `try...catch` works only when the code is valid enough to run.', 'easy', 'approved', 'eb07b310-bf5a-429d-8f02-098df5e2c746', 280, '2026-04-01T06:46:01.924Z', '2026-04-01T06:46:01.924Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f6c680ae-a4a3-4f71-8211-54abe3d71ff1', '9872b186-472e-4391-a150-7239315fc8b1', 'Why does this code fail to catch the error?

```js
try {
  setTimeout(function () {
    noSuchVariable;
  }, 1000);
} catch (err) {
  alert(''won''t work'');
}
```', 'javascript.info explains that the callback runs later, after the engine has already left the original `try...catch`. The handler must be placed inside the scheduled function.', 'medium', 'approved', 'eb07b310-bf5a-429d-8f02-098df5e2c746', 281, '2026-04-01T06:46:01.927Z', '2026-04-01T06:46:01.927Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('209c06be-b409-4790-99e9-8654a4e49062', '9872b186-472e-4391-a150-7239315fc8b1', 'Which properties does javascript.info highlight as the main built-in fields on an error object, with `stack` noted as a widely used non-standard addition?', 'The tutorial names `name` and `message` as the primary standard properties and calls out `stack` as a common non-standard debugging property.', 'easy', 'approved', 'eb07b310-bf5a-429d-8f02-098df5e2c746', 282, '2026-04-01T06:46:01.929Z', '2026-04-01T06:46:01.929Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8f7516e9-8a9b-4f18-a01d-c0462d100574', '9872b186-472e-4391-a150-7239315fc8b1', 'When is `catch { ... }` without an error parameter appropriate?', 'javascript.info calls this optional catch binding. It is appropriate when you do not need to inspect the error object.', 'easy', 'approved', 'eb07b310-bf5a-429d-8f02-098df5e2c746', 283, '2026-04-01T06:46:01.931Z', '2026-04-01T06:46:01.931Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('757f5ad9-8160-4d0b-a432-6a5f0b61421b', '9872b186-472e-4391-a150-7239315fc8b1', 'After `JSON.parse(json)` succeeds, why does javascript.info deliberately do `throw new SyntaxError(''Incomplete data: no name'')` when `user.name` is missing?', 'The goal is to treat semantically incomplete data as an error in the same error-handling path as malformed JSON, so one `catch` block can handle both cases cleanly.', 'medium', 'approved', 'eb07b310-bf5a-429d-8f02-098df5e2c746', 284, '2026-04-01T06:46:01.932Z', '2026-04-01T06:46:01.932Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('514eb20c-2ea2-4bcc-b6c3-f24cdc436b97', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the core rethrowing rule described by javascript.info?', 'The tutorial emphasizes that a `catch` block should handle only errors it knows about and rethrow everything else to avoid masking unrelated bugs.', 'medium', 'approved', 'eb07b310-bf5a-429d-8f02-098df5e2c746', 285, '2026-04-01T06:46:01.933Z', '2026-04-01T06:46:01.933Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('50a015a1-72bd-4c02-bfea-a27de625cbf4', '9872b186-472e-4391-a150-7239315fc8b1', 'Why does javascript.info prefer `err instanceof ValidationError` over checking `err.name === ''ValidationError''` when custom error hierarchies are expected to grow?', '`instanceof` remains correct for subclasses such as `PropertyRequiredError`, so it keeps working as the hierarchy expands.', 'hard', 'approved', 'eb07b310-bf5a-429d-8f02-098df5e2c746', 286, '2026-04-01T06:46:01.936Z', '2026-04-01T06:46:01.936Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d6512409-a01f-4f9f-abb4-5aca4a7d0d79', '9872b186-472e-4391-a150-7239315fc8b1', 'What must a child constructor do when defining a custom class that extends `Error`?', 'javascript.info says calling `super(message)` is mandatory, because JavaScript requires `super` in a child constructor. The examples also reset `name` unless a shared base class does that automatically.', 'medium', 'approved', 'eb07b310-bf5a-429d-8f02-098df5e2c746', 287, '2026-04-01T06:46:01.940Z', '2026-04-01T06:46:01.940Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8c585235-8702-4fb1-98da-71c3a2255293', '9872b186-472e-4391-a150-7239315fc8b1', 'What extra information does `PropertyRequiredError` carry beyond the inherited error message?', 'The tutorial adds a `property` field so code can tell exactly which required property was missing.', 'easy', 'approved', 'eb07b310-bf5a-429d-8f02-098df5e2c746', 288, '2026-04-01T06:46:01.944Z', '2026-04-01T06:46:01.944Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('86bbcc1c-03aa-4285-8942-38b5d92c78d9', '9872b186-472e-4391-a150-7239315fc8b1', 'What problem does `ReadError` solve in javascript.info''s wrapping-exceptions pattern?', '`ReadError` lets outer code care about one higher-level category, while still preserving the original low-level error in `cause` for deeper inspection when necessary.', 'hard', 'approved', 'eb07b310-bf5a-429d-8f02-098df5e2c746', 289, '2026-04-01T06:46:01.945Z', '2026-04-01T06:46:01.945Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2d4215b7-bfea-48b9-b8f4-702d0a11b565', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this function return?

```js
function f() {
  try {
    throw new Error(''boom'');
  } catch (err) {
    throw err;
  } finally {
    return ''done'';
  }
}
```', 'Both MDN and the other sources emphasize the same subtlety: a `return` from `finally` overwrites an earlier `return` and can also suppress a thrown or rethrown exception. That makes the function return `''done''`.', 'hard', 'approved', '70e298a7-e9fe-4293-8e8b-abb361cb0802', 290, '2026-04-01T06:46:06.050Z', '2026-04-01T06:46:06.050Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('56837c47-f38c-44d1-9823-2d4e5564b14a', '9872b186-472e-4391-a150-7239315fc8b1', 'Which thrown value is the best fit if you want reliable `err.name`, `err.message`, and `instanceof` checks across a growing custom error hierarchy?', 'MDN and javascript.info both argue for throwing `Error`-based objects rather than arbitrary primitives. Extending `Error` also enables inheritance-aware `instanceof` checks for subclasses.', 'medium', 'approved', '70e298a7-e9fe-4293-8e8b-abb361cb0802', 291, '2026-04-01T06:46:06.054Z', '2026-04-01T06:46:06.054Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c80a1539-6c8b-48de-82f5-9becaf749375', '9872b186-472e-4391-a150-7239315fc8b1', 'Why won''t a synchronous outer `try...catch` catch an exception thrown later inside a `setTimeout` callback?', 'Both SitePoint and javascript.info make the same point: `try...catch` only wraps the current synchronous execution path. A timer callback runs later, after that scope has already completed.', 'medium', 'approved', '70e298a7-e9fe-4293-8e8b-abb361cb0802', 292, '2026-04-01T06:46:06.057Z', '2026-04-01T06:46:06.057Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3a4992e4-ab91-41f5-baeb-ea5d0dc0d408', '9872b186-472e-4391-a150-7239315fc8b1', 'Assume `class PropertyRequiredError extends ValidationError {}`. What is the result of `err instanceof ValidationError` when `err` is a `new PropertyRequiredError(''name'')`?', 'javascript.info highlights this as the main advantage of `instanceof` in custom hierarchies: subclass instances still satisfy checks against their parent classes.', 'medium', 'approved', '70e298a7-e9fe-4293-8e8b-abb361cb0802', 293, '2026-04-01T06:46:06.058Z', '2026-04-01T06:46:06.058Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e7918223-084a-4751-9bb4-581550e4074b', '9872b186-472e-4391-a150-7239315fc8b1', 'What does this log?

```js
try {
  try {
    console.log((1).toFixed(-1));
  } catch (e) {
    throw new Error(''Calculation failed'', { cause: e });
  }
} catch (e) {
  console.log(e.message);
  console.log(e.cause.name);
}
```', 'SitePoint''s `toFixed(-1)` example yields a `RangeError`. Wrapping it with `new Error(''Calculation failed'', { cause: e })` preserves the original error in `cause`, so the outer catch logs the wrapper message and the original type.', 'hard', 'approved', '70e298a7-e9fe-4293-8e8b-abb361cb0802', 294, '2026-04-01T06:46:06.059Z', '2026-04-01T06:46:06.059Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1270b9a0-61d2-499c-a3ef-8f89ccfbe736', '9872b186-472e-4391-a150-7239315fc8b1', 'What does `try { risky(); } finally { cleanup(); }` guarantee if `risky()` throws and there is no `catch` in the same construct?', 'MDN and javascript.info both show that `finally` runs for cleanup even when there is no local handler. Without a `catch`, the exception still continues outward after cleanup.', 'medium', 'approved', '70e298a7-e9fe-4293-8e8b-abb361cb0802', 295, '2026-04-01T06:46:06.060Z', '2026-04-01T06:46:06.060Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8657812d-d6c9-401b-81e9-56756ad782bf', '9872b186-472e-4391-a150-7239315fc8b1', 'After successful `JSON.parse`, an application throws `new SyntaxError(''Incomplete data: no name'')` because a required property is missing. Which interpretation is correct?', 'This is not a parse-time syntax failure in the source text. It is an intentionally thrown application error chosen so incomplete data can flow through the same `catch` logic as malformed JSON.', 'hard', 'approved', '70e298a7-e9fe-4293-8e8b-abb361cb0802', 296, '2026-04-01T06:46:06.061Z', '2026-04-01T06:46:06.061Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0f1d480c-cd5b-4a61-8ca0-eedb2bec1724', '9872b186-472e-4391-a150-7239315fc8b1', 'Which `catch` strategy best handles expected validation failures without accidentally swallowing unrelated programming bugs?', 'Rethrowing unknown errors is the safest pattern across the sources. It lets the current layer handle only what it truly understands.', 'hard', 'approved', '70e298a7-e9fe-4293-8e8b-abb361cb0802', 297, '2026-04-01T06:46:06.062Z', '2026-04-01T06:46:06.062Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f7ee52dd-0453-4522-889e-1f911c70dd8a', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the advantage of a base class like `MyError` that sets `this.name = this.constructor.name`?', 'javascript.info uses `MyError` to remove repetitive manual `name` assignments. Subclasses still inherit from `Error`, and each instance automatically reports its own class name.', 'medium', 'approved', '70e298a7-e9fe-4293-8e8b-abb361cb0802', 298, '2026-04-01T06:46:06.063Z', '2026-04-01T06:46:06.063Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2771f171-08dd-4ce3-9b69-72423bfa11e0', '9872b186-472e-4391-a150-7239315fc8b1', 'Which design best simplifies high-level caller logic when a `readUser` flow may fail with malformed JSON, missing properties, or more specific validation subclasses?', 'Wrapping exceptions into a higher-level `ReadError` keeps outer callers from repeating low-level type checks everywhere, while still preserving the underlying reason in `cause`.', 'hard', 'approved', '70e298a7-e9fe-4293-8e8b-abb361cb0802', 299, '2026-04-01T06:46:06.064Z', '2026-04-01T06:46:06.064Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('df4d8c84-6460-4f3f-b68e-c1738e3713c0', '9872b186-472e-4391-a150-7239315fc8b1', 'Which description best matches Angular at a high level?', 'Angular is positioned as a full web framework rather than a small helper library. Its overview emphasizes tools, APIs, and libraries that help teams build fast, reliable applications that scale with both the team and the codebase.', 'easy', 'approved', 'd498d7c9-1c3a-4998-b3bd-4cf26ebf6b2d', 300, '2026-04-01T07:15:45.088Z', '2026-04-01T07:15:45.088Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('6875ead0-6a0a-4f6f-9f41-01932a4c9411', '9872b186-472e-4391-a150-7239315fc8b1', 'Why are Angular components valuable in larger applications?', 'Angular components help teams organize user interfaces into well-encapsulated parts. That makes large applications easier to understand, evolve, and maintain than one large, tangled codebase.', 'easy', 'approved', 'd498d7c9-1c3a-4998-b3bd-4cf26ebf6b2d', 301, '2026-04-01T07:15:45.097Z', '2026-04-01T07:15:45.097Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8e2544ef-f454-423c-9e2f-d61a9355eec6', '9872b186-472e-4391-a150-7239315fc8b1', 'What is one major reason Angular is often attractive to large organizations and long-lived projects?', 'Angular highlights predictable releases, long-term support, backward-compatibility goals, and migration tooling. Those qualities matter when many teams and products depend on the same platform over time.', 'medium', 'approved', 'd498d7c9-1c3a-4998-b3bd-4cf26ebf6b2d', 302, '2026-04-01T07:15:45.100Z', '2026-04-01T07:15:45.100Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('28863d22-4ac8-4091-8439-8954e4dfca3b', '9872b186-472e-4391-a150-7239315fc8b1', 'How does Angular describe UI work at a high level, according to MDN''s framework overview?', 'MDN describes Angular as a component-based framework with declarative HTML templates that are compiled into optimized JavaScript instructions. The point is to let developers describe UI instead of manually performing repetitive DOM updates.', 'medium', 'approved', 'd498d7c9-1c3a-4998-b3bd-4cf26ebf6b2d', 303, '2026-04-01T07:15:45.103Z', '2026-04-01T07:15:45.103Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ed3a0771-7cfd-4e68-9d34-91ced6484226', '9872b186-472e-4391-a150-7239315fc8b1', 'Which language is most closely associated with Angular in the MDN comparison and Angular''s own documentation?', 'Angular is strongly associated with TypeScript in both MDN''s comparison table and Angular''s documentation. That orientation is part of why teams often choose it for large, structured applications.', 'easy', 'approved', 'd498d7c9-1c3a-4998-b3bd-4cf26ebf6b2d', 304, '2026-04-01T07:15:45.106Z', '2026-04-01T07:15:45.106Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e73d798b-81b7-4dc3-8c7e-4e4be0447eb7', '9872b186-472e-4391-a150-7239315fc8b1', 'What problem does Angular''s routing toolkit primarily address?', 'Routing is about moving between views in an application while preserving expected navigation behavior. Angular''s toolkit explicitly includes route guards, data resolution, and lazy loading to help applications manage that complexity.', 'medium', 'approved', 'd498d7c9-1c3a-4998-b3bd-4cf26ebf6b2d', 305, '2026-04-01T07:15:45.108Z', '2026-04-01T07:15:45.108Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c9c67753-b950-45e1-9d93-7dff379c1b37', '9872b186-472e-4391-a150-7239315fc8b1', 'At a high level, what is Angular dependency injection for?', 'Dependency injection helps Angular applications share services and behavior cleanly across components. It reduces tight coupling and makes large codebases easier to organize.', 'medium', 'approved', 'd498d7c9-1c3a-4998-b3bd-4cf26ebf6b2d', 306, '2026-04-01T07:15:45.109Z', '2026-04-01T07:15:45.109Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0c72a28a-f6f0-4bbe-86e5-1c9f1c436b0c', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about modern Angular rendering strategies is accurate?', 'Modern Angular supports more than one rendering strategy. Its overview explicitly calls out server-side rendering, static site generation, and hydration in addition to client-side application behavior.', 'medium', 'approved', 'd498d7c9-1c3a-4998-b3bd-4cf26ebf6b2d', 307, '2026-04-01T07:15:45.110Z', '2026-04-01T07:15:45.110Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('82f8af27-7543-4ba0-9847-18b6bf9a3164', '9872b186-472e-4391-a150-7239315fc8b1', 'Which set of tools best reflects Angular''s emphasis on developer experience?', 'Angular invests in setup, debugging, editor support, and upgrade tooling. The CLI, DevTools, language service, and update tooling are all part of that story.', 'easy', 'approved', 'd498d7c9-1c3a-4998-b3bd-4cf26ebf6b2d', 308, '2026-04-01T07:15:45.112Z', '2026-04-01T07:15:45.112Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9ac951c5-a9e9-46ba-8f22-ce6196506ab5', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement correctly distinguishes Angular from AngularJS?', 'Angular was released as a rewrite from the team behind AngularJS. Treating them as if they are the same thing hides major architectural and ecosystem differences.', 'medium', 'approved', 'd498d7c9-1c3a-4998-b3bd-4cf26ebf6b2d', 309, '2026-04-01T07:15:45.113Z', '2026-04-01T07:15:45.113Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b9787a0c-5f7f-4621-b263-a0f3c5168844', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement best describes React at a high level?', 'MDN notes that React is technically a library for rendering UI components, even though people often use the word framework as shorthand because React is frequently combined with companion libraries such as ReactDOM or React Native.', 'easy', 'approved', '7cc2fc1a-9b02-4dcc-9c9f-0a60f23336ce', 310, '2026-04-01T07:15:50.206Z', '2026-04-01T07:15:50.206Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('007955b8-20d2-4b7e-a3f4-5316f49b6ceb', '9872b186-472e-4391-a150-7239315fc8b1', 'What is the core idea behind React components?', 'React apps are made out of components. Each component is a reusable piece of UI with its own logic and appearance, which makes large interfaces easier to assemble and reason about.', 'easy', 'approved', '7cc2fc1a-9b02-4dcc-9c9f-0a60f23336ce', 311, '2026-04-01T07:15:50.214Z', '2026-04-01T07:15:50.214Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1052d3a5-4be2-4264-9d77-055bff884bb1', '9872b186-472e-4391-a150-7239315fc8b1', 'What role does JSX usually play in React applications?', 'JSX lets developers describe UI with HTML-like markup inside JavaScript. It is optional, but React documents it as the common and convenient way to author component output.', 'easy', 'approved', '7cc2fc1a-9b02-4dcc-9c9f-0a60f23336ce', 312, '2026-04-01T07:15:50.275Z', '2026-04-01T07:15:50.275Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('da9f8cbe-5afa-496d-b15d-18f7e66f04e3', '9872b186-472e-4391-a150-7239315fc8b1', 'What generally happens in React when component state changes?', 'When state changes through a setter like `setCount`, React calls the component function again and updates the rendered output to reflect the new state. That is the basis of state-driven UI in React.', 'medium', 'approved', '7cc2fc1a-9b02-4dcc-9c9f-0a60f23336ce', 313, '2026-04-01T07:15:50.283Z', '2026-04-01T07:15:50.283Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0ea24865-646b-4796-84be-6e7de54ac4f1', '9872b186-472e-4391-a150-7239315fc8b1', 'Why does React encourage a `key` when rendering lists?', 'Keys help React track which items were inserted, deleted, or reordered among siblings. Stable identifiers make UI updates more predictable and efficient.', 'medium', 'approved', '7cc2fc1a-9b02-4dcc-9c9f-0a60f23336ce', 314, '2026-04-01T07:15:50.286Z', '2026-04-01T07:15:50.286Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ece2122b-ddbb-4769-9f0f-27362e4e9899', '9872b186-472e-4391-a150-7239315fc8b1', 'How should a click handler usually be attached in React JSX?', 'Passing `onClick={handleClick}` gives React a function to call later. Writing `onClick={handleClick()}` would invoke it immediately during rendering, which is usually not what you want.', 'easy', 'approved', '7cc2fc1a-9b02-4dcc-9c9f-0a60f23336ce', 315, '2026-04-01T07:15:50.290Z', '2026-04-01T07:15:50.290Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('786292f1-ea6d-4053-8503-1ddabf35ca5c', '9872b186-472e-4391-a150-7239315fc8b1', 'What does `useState` give a React component?', '`useState` returns the current state value and a setter function. Together they let a component remember information between renders and update the screen when that information changes.', 'easy', 'approved', '7cc2fc1a-9b02-4dcc-9c9f-0a60f23336ce', 316, '2026-04-01T07:15:50.293Z', '2026-04-01T07:15:50.293Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7f6e75b2-ce63-42d5-8a19-ab62483b15a0', '9872b186-472e-4391-a150-7239315fc8b1', 'What does ''lifting state up'' mean in React?', 'Lifting state up means moving shared state to the nearest common parent so multiple child components stay synchronized from a single source of truth.', 'medium', 'approved', '7cc2fc1a-9b02-4dcc-9c9f-0a60f23336ce', 317, '2026-04-01T07:15:50.295Z', '2026-04-01T07:15:50.295Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('eab4eab5-f986-4ca9-aa73-b46e2f086b1a', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement about React and platforms is accurate?', 'React focuses on the component model for UI. ReactDOM adapts it to the web, and React Native applies similar ideas to mobile applications.', 'easy', 'approved', '7cc2fc1a-9b02-4dcc-9c9f-0a60f23336ce', 318, '2026-04-01T07:15:50.298Z', '2026-04-01T07:15:50.298Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('65fd8f86-6506-4f4a-9553-843018143a31', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement best captures React''s scope in a typical frontend stack?', 'React is intentionally focused on the UI layer. Teams commonly add routing, data fetching, or broader application frameworks around it depending on their needs.', 'medium', 'approved', '7cc2fc1a-9b02-4dcc-9c9f-0a60f23336ce', 319, '2026-04-01T07:15:50.299Z', '2026-04-01T07:15:50.299Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('30e7c19c-ec67-473b-86f5-2f44988573e3', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement best describes Vue at a high level?', 'Vue describes itself as a JavaScript framework for building user interfaces on top of standard HTML, CSS, and JavaScript. It is meant to feel approachable while still scaling to more complex applications.', 'easy', 'approved', 'db1ef90f-377f-46b0-896c-e021ee94b169', 320, '2026-04-01T07:15:56.746Z', '2026-04-01T07:15:56.746Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ba476423-d9de-4f4d-b379-6ccd645a26e9', '9872b186-472e-4391-a150-7239315fc8b1', 'Which two ideas does the Vue introduction call its core features?', 'The Vue introduction explicitly identifies declarative rendering and reactivity as the two core features demonstrated in its opening example.', 'easy', 'approved', 'db1ef90f-377f-46b0-896c-e021ee94b169', 321, '2026-04-01T07:15:56.748Z', '2026-04-01T07:15:56.748Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('374918fe-7302-4aea-b00b-585302f2ba22', '9872b186-472e-4391-a150-7239315fc8b1', 'What does Vue mean by calling itself ''The Progressive Framework''?', 'Progressive means Vue can be adopted incrementally. A team can use it for a small interactive enhancement, a full single-page app, server-side rendering, static site generation, or other larger architectures as needs grow.', 'medium', 'approved', 'db1ef90f-377f-46b0-896c-e021ee94b169', 322, '2026-04-01T07:15:56.752Z', '2026-04-01T07:15:56.752Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('6d66f771-0b67-49ce-9d72-3ea3f3600089', '9872b186-472e-4391-a150-7239315fc8b1', 'Why are Vue Single-File Components useful in many projects?', 'Single-File Components keep a component''s template, logic, and styles together in one file. That improves cohesion and is the recommended authoring format in build-tool-based Vue applications.', 'medium', 'approved', 'db1ef90f-377f-46b0-896c-e021ee94b169', 323, '2026-04-01T07:15:56.755Z', '2026-04-01T07:15:56.755Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('cadd6b6e-45f3-466b-8679-aa817b57a104', '9872b186-472e-4391-a150-7239315fc8b1', 'In what kind of scenario is Vue especially easy to adopt without a full build setup?', 'Vue can enhance static HTML without a build step, which makes it useful for progressive enhancement and smaller integrations where a team does not want to commit immediately to a full SPA toolchain.', 'easy', 'approved', 'db1ef90f-377f-46b0-896c-e021ee94b169', 324, '2026-04-01T07:15:56.761Z', '2026-04-01T07:15:56.761Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('92c75064-c525-4730-8ced-49a8850fc326', '9872b186-472e-4391-a150-7239315fc8b1', 'Which two major API styles can Vue components be authored with?', 'Vue supports both the Options API and the Composition API. They are different interfaces that sit on top of the same underlying system.', 'easy', 'approved', 'db1ef90f-377f-46b0-896c-e021ee94b169', 325, '2026-04-01T07:15:56.766Z', '2026-04-01T07:15:56.766Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9f65f541-a6b1-4342-a9f2-99e7af3964bb', '9872b186-472e-4391-a150-7239315fc8b1', 'What is a common reason beginners may find Vue''s Options API approachable?', 'Vue describes the Options API as more beginner-friendly because it groups logic into familiar sections like `data`, `methods`, and lifecycle hooks, while hiding more of the reactivity details.', 'medium', 'approved', 'db1ef90f-377f-46b0-896c-e021ee94b169', 326, '2026-04-01T07:15:56.770Z', '2026-04-01T07:15:56.770Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('fdd3a3a1-31e4-4386-9583-d836d544892d', '9872b186-472e-4391-a150-7239315fc8b1', 'Why do experienced teams sometimes prefer Vue''s Composition API for larger features?', 'The Composition API is more flexible for composing and reusing logic across complex features. That flexibility is especially valuable when components become large or behavior needs to be shared in structured ways.', 'medium', 'approved', 'db1ef90f-377f-46b0-896c-e021ee94b169', 327, '2026-04-01T07:15:56.773Z', '2026-04-01T07:15:56.773Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a933f7f4-b6ee-43dc-beb5-3776ebab8b00', '9872b186-472e-4391-a150-7239315fc8b1', 'What does Vue''s reactivity system do for a developer at a high level?', 'Vue reactivity tracks changes in JavaScript state and updates the DOM efficiently. Developers describe the desired UI while Vue handles the low-level DOM synchronization.', 'easy', 'approved', 'db1ef90f-377f-46b0-896c-e021ee94b169', 328, '2026-04-01T07:15:56.776Z', '2026-04-01T07:15:56.776Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9a8a054b-a845-4abd-b524-e6685e0765e6', '9872b186-472e-4391-a150-7239315fc8b1', 'Which statement best captures how Vue templates help developers express UI?', 'Vue templates extend HTML with directives and interpolation so developers can describe what the UI should look like based on state instead of manually assembling DOM nodes.', 'medium', 'approved', 'db1ef90f-377f-46b0-896c-e021ee94b169', 329, '2026-04-01T07:15:56.781Z', '2026-04-01T07:15:56.781Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('467afe64-077e-42c3-a02c-c6bdc5762b2b', '9872b186-472e-4391-a150-7239315fc8b1', 'A team wants a framework with official routing, dependency injection, strong upgrade tooling, and a TypeScript-oriented story for large codebases. Which choice best fits that goal?', 'Angular is the best fit when a team wants an all-in-one framework orientation: built-in routing, dependency injection, strong tooling, and TypeScript-first positioning. That combination is a major part of Angular''s value proposition for larger organizations.', 'hard', 'approved', 'dcf50a09-f3eb-4480-b456-aee816275230', 330, '2026-04-01T07:16:03.549Z', '2026-04-01T07:16:03.549Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('89c48592-605f-45f5-b4c0-2da4bbd5abd7', '9872b186-472e-4391-a150-7239315fc8b1', 'A mostly server-rendered site needs small pockets of interactivity added gradually without forcing a full SPA architecture on day one. Which framework''s identity best matches that use case?', 'Vue''s progressive design makes it a strong fit when you want to add interactivity gradually to existing pages rather than commit immediately to a full SPA architecture. Its docs explicitly describe enhancement of static HTML without a build step.', 'hard', 'approved', 'dcf50a09-f3eb-4480-b456-aee816275230', 331, '2026-04-01T07:16:03.554Z', '2026-04-01T07:16:03.554Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3013e900-a34b-47bc-a6c3-52365b693397', '9872b186-472e-4391-a150-7239315fc8b1', 'A team wants a flexible UI layer that can pair with different ecosystem libraries and also has a well-known path to both web and native mobile UIs. Which choice best matches that description?', 'React is commonly chosen when teams want a flexible UI layer they can pair with different libraries or use across web and native targets. MDN highlights ReactDOM for web and React Native for mobile.', 'hard', 'approved', 'dcf50a09-f3eb-4480-b456-aee816275230', 332, '2026-04-01T07:16:03.556Z', '2026-04-01T07:16:03.556Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e594c785-e895-4ea2-ab34-f429f1ebcaf5', '9872b186-472e-4391-a150-7239315fc8b1', 'Which mapping is correct?', 'A correct mental map is Angular -> declarative templates compiled at build time, React -> JSX in component functions, and Vue -> HTML-based templates with reactive bindings. Keeping these distinctions clear helps when choosing a framework or reading unfamiliar code.', 'hard', 'approved', 'dcf50a09-f3eb-4480-b456-aee816275230', 333, '2026-04-01T07:16:03.559Z', '2026-04-01T07:16:03.559Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('90687b38-2403-4159-b0ad-349ff9e93998', '9872b186-472e-4391-a150-7239315fc8b1', 'What core problem do Angular, React, and Vue all help reduce compared with manually building and updating DOM nodes in vanilla JavaScript?', 'All three frameworks reduce the manual DOM bookkeeping needed to keep UI aligned with changing state. That is one of the core reasons frameworks became popular in the first place.', 'medium', 'approved', 'dcf50a09-f3eb-4480-b456-aee816275230', 334, '2026-04-01T07:16:03.561Z', '2026-04-01T07:16:03.561Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3b01bce0-8523-49b1-9e5d-800efed439a4', '9872b186-472e-4391-a150-7239315fc8b1', 'Which set of pairings is fully correct?', 'These pairings reflect each framework''s common identity: React and lifting state up, Vue and progressive adoption, Angular and dependency injection. The wrong answers deliberately mix ideas across frameworks.', 'hard', 'approved', 'dcf50a09-f3eb-4480-b456-aee816275230', 335, '2026-04-01T07:16:03.563Z', '2026-04-01T07:16:03.563Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('277f322e-01fc-4e74-a6e4-6981b3e3b304', '9872b186-472e-4391-a150-7239315fc8b1', 'If a single-page app built with any of these frameworks uses client-side routing, which accessibility concern becomes especially important?', 'In client-routed apps, the browser does not automatically announce a new page or reset focus the way it would on a traditional page load. Teams must account for that explicitly for accessibility.', 'hard', 'approved', 'dcf50a09-f3eb-4480-b456-aee816275230', 336, '2026-04-01T07:16:03.565Z', '2026-04-01T07:16:03.565Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ae2c666c-d825-4190-b6e9-1a7f0d64beef', '9872b186-472e-4391-a150-7239315fc8b1', 'Which trade-off is shared by Angular, React, and Vue when they are used carelessly?', 'Frameworks improve developer experience through abstraction, but the trade-off is real: extra code, runtime cost, and the risk of poor semantic HTML or accessibility if a team is careless about priorities.', 'hard', 'approved', 'dcf50a09-f3eb-4480-b456-aee816275230', 337, '2026-04-01T07:16:03.567Z', '2026-04-01T07:16:03.567Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('599de73d-b079-4e18-b858-2da19f557c02', '9872b186-472e-4391-a150-7239315fc8b1', 'Which framework is explicitly described by MDN as technically a library for rendering UI components, even though developers often treat it like a framework in practice?', 'React is the one MDN explicitly describes as a library for rendering UI components, while also acknowledging the common habit of treating it as a framework in everyday discussion.', 'medium', 'approved', 'dcf50a09-f3eb-4480-b456-aee816275230', 338, '2026-04-01T07:16:03.568Z', '2026-04-01T07:16:03.568Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ef1ef3b5-fc6f-459a-bf8c-4ebfe5fa3a7b', '9872b186-472e-4391-a150-7239315fc8b1', 'Which order correctly identifies the technologies behind these high-level cues?

1. `@click` with `{{ count }}` in a template
2. `<MyButton />` inside component markup
3. Declarative HTML templates compiled to optimized JavaScript instructions', 'The snippet cues match Vue (`@click` and `{{ count }}`), React (`<MyButton />` JSX component usage), and Angular (declarative templates compiled at build time). Recognizing these signatures helps when switching between codebases.', 'hard', 'approved', 'dcf50a09-f3eb-4480-b456-aee816275230', 339, '2026-04-01T07:16:03.571Z', '2026-04-01T07:16:03.571Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d853c733-bf6c-4222-8747-597bd8dea922', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why should arrow functions generally not be used as object methods?', 'Arrow functions do not create their own `this` binding. They capture `this` from the surrounding scope, which makes them a poor fit for methods that need the receiver object.', 'easy', 'approved', '46f4d17d-072f-48f7-acd0-a2e8f9749f0b', 0, '2026-04-01T19:55:06.166Z', '2026-04-01T19:55:06.166Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('574df331-4099-4593-bedd-76d25b061621', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What happens when this code runs?

```js
const Foo = () => {};
const foo = new Foo();
```', 'Arrow functions cannot be used as constructors. Calling them with `new` throws a `TypeError`, and they do not have a `prototype` property.', 'easy', 'approved', '46f4d17d-072f-48f7-acd0-a2e8f9749f0b', 1, '2026-04-01T19:55:06.180Z', '2026-04-01T19:55:06.180Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('67f421d1-b28c-4144-b145-a6c9a3e276d7', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why does `func()` return `undefined` here?

```js
const func = () => { foo: 1 };
```', 'When braces follow the arrow, JavaScript parses them as a block body unless the object literal is wrapped in parentheses. Here `foo:` is treated as a label, not as an object property.', 'medium', 'approved', '46f4d17d-072f-48f7-acd0-a2e8f9749f0b', 2, '2026-04-01T19:55:06.187Z', '2026-04-01T19:55:06.187Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('df5706a9-ad1f-49f0-a3e5-355520cdddd0', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What does `foo(3)` return here?

```js
function foo(n) {
  const f = () => arguments[0] + n;
  return f();
}
```', 'Arrow functions do not have their own `arguments` object, so `arguments[0]` refers to the enclosing function''s first argument, which is `3`. That makes the result `3 + 3`.', 'hard', 'approved', '46f4d17d-072f-48f7-acd0-a2e8f9749f0b', 3, '2026-04-01T19:55:06.195Z', '2026-04-01T19:55:06.195Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('740881b5-4b5c-4742-a5e9-f18007682d32', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why does this assignment need extra parentheses around the arrow function?

```js
callback = callback || (() => {});
```', 'Arrow functions interact with precedence differently than many operators. Without parentheses, `callback || ()` would be parsed as the parameter list of an arrow function, which is invalid.', 'hard', 'approved', '46f4d17d-072f-48f7-acd0-a2e8f9749f0b', 4, '2026-04-01T19:55:06.201Z', '2026-04-01T19:55:06.201Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('eaabb6ec-91d1-4b9b-88b0-f7da73a8a998', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is returned here?

```js
function multiply(a, b = 1) {
  return a * b;
}

multiply(5, undefined);
```', 'Default parameters are used when no value or `undefined` is passed. Because `b` is `undefined`, the default `1` is used.', 'easy', 'approved', '14976a9a-0a7d-4841-b07b-e53b9c5b8858', 5, '2026-04-01T19:55:15.032Z', '2026-04-01T19:55:15.032Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f3ac21e1-474e-4075-9a8f-c4f2a2b721b0', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Given this function, what is logged by `test(null)`?

```js
function test(num = 1) {
  console.log(typeof num);
}
```', '`null` does not trigger the default. The parameter value is still `null`, and `typeof null` is `"object"`.', 'medium', 'approved', '14976a9a-0a7d-4841-b07b-e53b9c5b8858', 6, '2026-04-01T19:55:15.045Z', '2026-04-01T19:55:15.045Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('00c3789c-48d4-4f06-b3f1-8843b35ee966', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What do these two calls return?

```js
function append(value, array = []) {
  array.push(value);
  return array;
}

append(1);
append(2);
```', 'Default parameter expressions are evaluated at call time. Each call gets a fresh array, so the results are `[1]` and `[2]`.', 'medium', 'approved', '14976a9a-0a7d-4841-b07b-e53b9c5b8858', 7, '2026-04-01T19:55:15.056Z', '2026-04-01T19:55:15.056Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('cf274d1f-9462-46fb-8f55-7c26f0ee7a1e', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What does `f()` log here?

```js
function f(a, b = () => console.log(a)) {
  var a = 1;
  b();
}

f();
```', 'Default parameter initializers are evaluated in their own scope. The `a` captured by the default arrow refers to the parameter `a`, which is `undefined` in `f()`.', 'hard', 'approved', '14976a9a-0a7d-4841-b07b-e53b9c5b8858', 8, '2026-04-01T19:55:15.065Z', '2026-04-01T19:55:15.065Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('74a7876f-f8d3-4819-93b8-e6677b5211de', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What does this call return?

```js
function preFilledObject({ z = 3 } = {}) {
  return z;
}

preFilledObject();
```', 'The parameter defaults to `{}`, and then destructuring applies the property default `z = 3`, so the function can be called with no arguments.', 'medium', 'approved', '14976a9a-0a7d-4841-b07b-e53b9c5b8858', 9, '2026-04-01T19:55:15.073Z', '2026-04-01T19:55:15.073Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('97487e8f-35fe-45a6-afbc-42872f4cc840', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the value of `c` here?

```js
const { c = 2 } = { c: null };
```', 'Destructuring defaults are only used when the property is missing or explicitly `undefined`. Because `c` is `null`, the default is ignored.', 'medium', 'approved', '8b8aefd3-c70d-4ab8-8233-655166ffcae5', 10, '2026-04-01T19:55:31.526Z', '2026-04-01T19:55:31.526Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('73c9ee97-f975-431a-ac06-c87416ff2225', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why are parentheses required in this assignment form?

```js
({ a, b } = obj);
```', 'Without parentheses, `{ a, b }` at the start of a statement is parsed as a block, not as an object destructuring assignment target.', 'medium', 'approved', '8b8aefd3-c70d-4ab8-8233-655166ffcae5', 11, '2026-04-01T19:55:31.539Z', '2026-04-01T19:55:31.539Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('65d4607e-b06f-4774-9038-992d7c0edf4b', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which right-hand side can be used with array destructuring without throwing solely because it is iterable?', 'Array destructuring uses the iterable protocol, so a `Set` can be destructured, while plain objects without `Symbol.iterator` cannot.', 'medium', 'approved', '8b8aefd3-c70d-4ab8-8233-655166ffcae5', 12, '2026-04-01T19:55:31.545Z', '2026-04-01T19:55:31.545Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('edb52f38-d5ac-43ea-97e0-2d00f47992bb', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why is this pattern invalid?

```js
const [head, ...tail,] = [1, 2, 3];
```', 'The rest element must be the last element in the destructuring pattern and may not have a trailing comma.', 'hard', 'approved', '8b8aefd3-c70d-4ab8-8233-655166ffcae5', 13, '2026-04-01T19:55:31.553Z', '2026-04-01T19:55:31.553Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('28139f5f-4ef1-4732-af68-87e17fcc804b', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is logged by this code?

```js
const obj = {
  self: "123",
  __proto__: { prot: "456" },
};
const { prot } = obj;
console.log(prot);
```', 'Object destructuring follows property access semantics, so if a property is not found directly on the object, JavaScript continues along the prototype chain.', 'hard', 'approved', '8b8aefd3-c70d-4ab8-8233-655166ffcae5', 14, '2026-04-01T19:55:31.558Z', '2026-04-01T19:55:31.558Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('29b283e1-74aa-4e35-81f7-8cdcbfea0a04', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the primary purpose of the JavaScript double-bang operator (`!!`)?', 'The article describes `!!` as shorthand for converting any value into its boolean representation, producing a clear `true` or `false` result.', 'easy', 'approved', '571598dd-2029-4a7e-a653-be75cd8f2e98', 15, '2026-04-01T19:55:51.934Z', '2026-04-01T19:55:51.934Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('912989db-05fe-4ba2-98f3-6a8dfc263cb1', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is logged by this code?

```js
const stringValue = "Hello";
const booleanValue = !!stringValue;
console.log(booleanValue);
```', 'A non-empty string is truthy, so applying `!!` converts it to the boolean value `true`.', 'easy', 'approved', '571598dd-2029-4a7e-a653-be75cd8f2e98', 16, '2026-04-01T19:55:51.958Z', '2026-04-01T19:55:51.958Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4c350293-b8fc-496e-b70c-2cbf57aa1b4a', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is logged by this code?

```js
const numberValue = 0;
const booleanValue = !!numberValue;
console.log(booleanValue);
```', '`0` is a falsy value in JavaScript, so `!!0` becomes `false`.', 'easy', 'approved', '571598dd-2029-4a7e-a653-be75cd8f2e98', 17, '2026-04-01T19:55:51.975Z', '2026-04-01T19:55:51.975Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('5305c3d2-21ce-4c44-a1e1-c5f451b14dd9', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the result of evaluating `!![]` in JavaScript?', 'An empty array is still a truthy value in JavaScript, so converting it with `!!` produces `true`.', 'medium', 'approved', '571598dd-2029-4a7e-a653-be75cd8f2e98', 18, '2026-04-01T19:55:51.985Z', '2026-04-01T19:55:51.985Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('dad264ee-3bef-4577-bb64-8aac3d1466db', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which statement best describes the tradeoff in rewriting a check like this?

```js
const isReady = (status) => !!status;
```', '`!!status` is concise, but it converts every falsy value to `false`, not just a hand-picked subset such as `undefined`, `null`, and `0`.', 'hard', 'approved', '571598dd-2029-4a7e-a653-be75cd8f2e98', 19, '2026-04-01T19:55:51.999Z', '2026-04-01T19:55:51.999Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d9c8aac4-043b-480b-877d-6b58639157e4', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What does `import(modulePath)` return?', 'The dynamic `import()` expression returns a promise that resolves to the module namespace object.', 'easy', 'approved', '259e512f-9c69-4f60-a5cc-fbaea49ffaf9', 20, '2026-04-01T19:56:12.746Z', '2026-04-01T19:56:12.746Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('efe55b26-50f4-4341-bd69-6cc4c13557bf', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Where can dynamic imports be used according to the page?', 'The article states that `import()` can be called from any place in the code and that dynamic imports work in regular scripts without `script type="module"`.', 'medium', 'approved', '259e512f-9c69-4f60-a5cc-fbaea49ffaf9', 21, '2026-04-01T19:56:12.772Z', '2026-04-01T19:56:12.772Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('58773339-9d9a-461d-a68e-05f8b8cdce48', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'If a dynamically imported module uses a default export, how do you access it?', 'The default export is available on the `default` property of the module object returned by `import()`.', 'medium', 'approved', '259e512f-9c69-4f60-a5cc-fbaea49ffaf9', 22, '2026-04-01T19:56:12.792Z', '2026-04-01T19:56:12.792Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0b296374-dd4c-469c-82ca-b1cb5e341cd2', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why can''t static `import` be used conditionally or with a dynamically computed module path?', 'The article explains that static imports are intentionally simple and fixed so tooling can analyze, bundle, and tree-shake modules ahead of time.', 'hard', 'approved', '259e512f-9c69-4f60-a5cc-fbaea49ffaf9', 23, '2026-04-01T19:56:12.805Z', '2026-04-01T19:56:12.805Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0cfbeba6-f389-4ae9-af9c-b4af1e486f7b', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why can''t you do something like `const loader = import; loader(''./mod.js'')`?', 'Although `import()` looks like a function call, the page emphasizes that it is special syntax, not an ordinary function value that can be reassigned or called via `call` or `apply`.', 'hard', 'approved', '259e512f-9c69-4f60-a5cc-fbaea49ffaf9', 24, '2026-04-01T19:56:12.821Z', '2026-04-01T19:56:12.821Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4cf44ef9-374d-4970-9d9f-81f2778fe89a', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is an IIFE in JavaScript?', 'An IIFE is a function expression that runs immediately after it is defined.', 'easy', 'approved', 'f4eace95-2dcf-4702-b735-e532f7a0b283', 25, '2026-04-01T19:56:34.601Z', '2026-04-01T19:56:34.601Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a8d35c16-935e-432b-9bbe-f2f2794c35ad', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which snippet creates a new async context so `await` can be used in otherwise non-async code?', 'MDN lists the async IIFE form explicitly for creating a new async context.', 'medium', 'approved', 'f4eace95-2dcf-4702-b735-e532f7a0b283', 26, '2026-04-01T19:56:34.661Z', '2026-04-01T19:56:34.661Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('6790504f-dd9c-4bc7-90d3-84f50fa8fe1a', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why does an IIFE usually wrap the function in parentheses before calling it?', 'The function must be parsed as an expression, not as a function declaration. Parentheses are the usual way to force that interpretation.', 'medium', 'approved', 'f4eace95-2dcf-4702-b735-e532f7a0b283', 27, '2026-04-01T19:56:34.678Z', '2026-04-01T19:56:34.678Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9bb67055-1c23-4de1-a78e-a743a5ca7b8e', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which use case is explicitly mentioned for IIFEs on the MDN page?', 'One of the listed use cases is creating a new scope so names do not leak into the global namespace.', 'easy', 'approved', 'f4eace95-2dcf-4702-b735-e532f7a0b283', 28, '2026-04-01T19:56:34.691Z', '2026-04-01T19:56:34.691Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7110372b-749b-4315-888b-99f2092761af', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why does MDN describe an IIFE as more powerful than the comma operator?', 'The comma operator can only sequence expressions. An IIFE can execute many statements, create local variables, use control flow, and optionally return a value.', 'hard', 'approved', 'f4eace95-2dcf-4702-b735-e532f7a0b283', 29, '2026-04-01T19:56:34.704Z', '2026-04-01T19:56:34.704Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f76a86f2-dd26-4474-8bde-cadc45be4daf', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Scenario: A dashboard receives `config` from an API. Sometimes `config` is missing, and `config.retries` may legitimately be `0`. Which expression safely reads the value and falls back to `3` only when the value is missing?', '`config?.retries ?? 3` handles both hazards correctly: optional chaining protects the property access, and nullish coalescing preserves `0` while still defaulting on `null` or `undefined`.', 'hard', 'approved', 'bdb62b26-adfb-4602-b9b4-57003562f77a', 30, '2026-04-01T19:56:55.805Z', '2026-04-01T19:56:55.805Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('09d8ec6f-95a0-4261-b896-ee508d461ec1', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Scenario: You want to lazy-load an admin module only when a button is clicked, and the page is a regular script rather than a module script. Which approach best matches the provided references?', 'Dynamic import works in regular scripts. Using an async arrow function as the click handler gives you an `await` context exactly when the user triggers the load.', 'hard', 'approved', 'bdb62b26-adfb-4602-b9b4-57003562f77a', 31, '2026-04-01T19:56:55.823Z', '2026-04-01T19:56:55.823Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('619de68f-853b-48a0-95a3-1b215ba27e39', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Scenario: An object method schedules work with `setTimeout` and must keep access to the instance''s `this`. Which implementation is the best fit?', 'The outer method should remain a normal method so it receives the object as `this`. The inner callback should be an arrow function so it closes over that method''s `this`.', 'hard', 'approved', 'bdb62b26-adfb-4602-b9b4-57003562f77a', 32, '2026-04-01T19:56:55.837Z', '2026-04-01T19:56:55.837Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('03f11b1f-6e8f-4bb5-8bdf-4f1bc389fd77', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Scenario: You are designing a chart helper that should be callable with no arguments, while still safely destructuring `size`, `coords`, and `radius`. Which function signature is the best fit?', 'Defaulting the entire parameter to `{}` prevents destructuring errors when nothing is passed, and the property defaults fill in missing values cleanly.', 'medium', 'approved', 'bdb62b26-adfb-4602-b9b4-57003562f77a', 33, '2026-04-01T19:56:55.848Z', '2026-04-01T19:56:55.848Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b29b30a4-6df5-4eb2-aa41-6ace441dea7e', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Scenario: You need to run several startup statements, use `await` once, and avoid leaking temporary variables into the global scope in a regular script. Which pattern best matches that need?', 'An async IIFE creates a one-off local scope and also provides an async context for `await`, which is exactly the use case highlighted on the IIFE page.', 'hard', 'approved', 'bdb62b26-adfb-4602-b9b4-57003562f77a', 34, '2026-04-01T19:56:55.860Z', '2026-04-01T19:56:55.860Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e94a9d41-4ffe-4c20-b148-eed83e547ced', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the value of `retries` here?

```js
const settings = { retries: 0 };
const retries = settings?.retries ?? 3;
```', 'Optional chaining safely reads the property, and `??` only falls back for `null` or `undefined`. Because `0` is neither, the result stays `0`.', 'hard', 'approved', 'e2f141ae-2a6d-4359-9ad5-f500f2b3935f', 35, '2026-04-01T19:57:16.812Z', '2026-04-01T19:57:16.812Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('763c9fd6-6b0a-4d12-8753-f179f14ae7b5', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the value of `title` here?

```js
const settings = { title: "" };
const title = settings?.title || "Untitled";
```', '`settings?.title` safely reads the empty string, but `||` treats `""` as falsy and replaces it with the fallback. `??` would preserve the empty string instead.', 'hard', 'approved', 'e2f141ae-2a6d-4359-9ad5-f500f2b3935f', 36, '2026-04-01T19:57:16.828Z', '2026-04-01T19:57:16.828Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('69c61609-8b4f-4b54-870e-8d3906417a35', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the value of `normalizedPort`?

```js
const config = { port: null };
const { port = 80 } = config;
const normalizedPort = port ?? 80;
```', 'The destructuring default does not apply because the property exists and is `null`, not `undefined`. The later `??` check does apply, so `normalizedPort` becomes `80`.', 'hard', 'approved', 'e2f141ae-2a6d-4359-9ad5-f500f2b3935f', 37, '2026-04-01T19:57:16.839Z', '2026-04-01T19:57:16.839Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3c61aeff-4953-4978-ac8f-46dd1c19d014', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the value of `result`?

```js
const merge = (...objects) => ({ ...objects });
const result = merge({ a: 1 }, { b: 2 });
```', '`objects` is an array because of the rest parameter. Spreading that array into an object literal creates numeric keys for each array index rather than merging the nested objects.', 'hard', 'approved', 'e2f141ae-2a6d-4359-9ad5-f500f2b3935f', 38, '2026-04-01T19:57:16.846Z', '2026-04-01T19:57:16.846Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a4fccfa6-4635-41ea-91c2-2d8ffb616b33', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What happens when this code runs?

```js
const user = null;
const name = (user?.profile).name ?? "guest";
```', 'Parentheses end the continuous optional chain. `user?.profile` becomes `undefined`, then `.name` is attempted on `undefined`, so a `TypeError` is thrown before `??` can apply.', 'hard', 'approved', 'e2f141ae-2a6d-4359-9ad5-f500f2b3935f', 39, '2026-04-01T19:57:16.859Z', '2026-04-01T19:57:16.859Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1894c14c-6f28-4f8b-897f-4067300d897c', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the result of parsing this line?

```js
console?.log`Ready`;
```', 'A tagged template cannot use an optional chain as its tag target, so the parser rejects this as invalid syntax.', 'hard', 'approved', 'e2f141ae-2a6d-4359-9ad5-f500f2b3935f', 40, '2026-04-01T19:57:16.870Z', '2026-04-01T19:57:16.870Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ad2c95ec-3fff-41df-9c67-c0a3df796214', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What are `first` and `rest` here?

```js
const [first, ...rest] = new Set([1, 2, 3]);
```', 'Array destructuring works on any iterable. `Set` yields `1`, `2`, and `3`, so `first` gets `1` and `rest` becomes a new array containing `[2, 3]`.', 'medium', 'approved', 'e2f141ae-2a6d-4359-9ad5-f500f2b3935f', 41, '2026-04-01T19:57:16.884Z', '2026-04-01T19:57:16.884Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('439041a3-ff9d-47ae-80f0-a1c34f8d4270', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What happens when `load()` is called here?

```js
function load(mod = buildName()) {
  function buildName() {
    return "./tool.js";
  }
  return mod;
}

load();
```', 'Default parameter initializers run in a scope outside the function body. The `buildName` declared in the body is not visible there, so calling `load()` throws a `ReferenceError`.', 'hard', 'approved', 'e2f141ae-2a6d-4359-9ad5-f500f2b3935f', 42, '2026-04-01T19:57:16.891Z', '2026-04-01T19:57:16.891Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('eaa75679-b7e2-4323-8a56-3ae760d0b84b', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is logged here?

```js
const original = { nested: { level: 1 } };
const clone = { ...original };
clone.nested.level = 2;
const { nested: { level } } = original;
console.log(level);
```', 'Object spread is shallow, so `clone.nested` and `original.nested` still reference the same object. After the mutation, destructuring `level` from `original` yields `2`.', 'hard', 'approved', 'e2f141ae-2a6d-4359-9ad5-f500f2b3935f', 43, '2026-04-01T19:57:16.897Z', '2026-04-01T19:57:16.897Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('aefc964c-9b39-4e34-9911-2df5999b2689', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which snippet correctly lazy-loads a module''s default export, waits for it, and immediately calls it from a regular script?', 'The correct approach uses an async IIFE to get an `await` context, then destructures the `default` export from the promise result of `import()`.', 'hard', 'approved', 'e2f141ae-2a6d-4359-9ad5-f500f2b3935f', 44, '2026-04-01T19:57:16.902Z', '2026-04-01T19:57:16.902Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('40c0ea78-bc8f-4c50-8ec4-f5fff0cf85be', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the value of `retries` here?

```js
const retries = 0 ?? 5;
```', '`??` only falls back when the left-hand side is `null` or `undefined`. Since `0` is neither, the result remains `0`.', 'easy', 'approved', 'f80d7f61-7d8a-42b5-acce-497525e25c9e', 45, '2026-04-01T19:57:37.510Z', '2026-04-01T19:57:37.510Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2a46b527-913f-461e-b061-ffccc66d7193', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What happens if JavaScript parses this expression exactly as written?

```js
null || undefined ?? "foo";
```', 'MDN states that `??` cannot be combined directly with `||` or `&&` without parentheses. This form throws a syntax error.', 'medium', 'approved', 'f80d7f61-7d8a-42b5-acce-497525e25c9e', 46, '2026-04-01T19:57:37.523Z', '2026-04-01T19:57:37.523Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b61a5a77-a663-42f8-8dab-e700a3c3cf21', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Consider the following code:

```js
function b() {
  console.log("b");
  return false;
}
function c() {
  console.log("c");
  return "fallback";
}

console.log(b() ?? c());
```

Which statement is correct?', 'Because `b()` returns `false` rather than `null` or `undefined`, the right-hand side is not evaluated. The expression logs `false` after logging `b`.', 'hard', 'approved', 'f80d7f61-7d8a-42b5-acce-497525e25c9e', 47, '2026-04-01T19:57:37.532Z', '2026-04-01T19:57:37.532Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('caca148d-d81d-462f-9f16-d2e0a63ce9bc', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What does this code print when `foo.someBarProp` is missing?

```js
const foo = { someFooProp: "hi" };
console.log(foo.someBarProp?.toUpperCase() ?? "not available");
```', '`foo.someBarProp?.toUpperCase()` evaluates to `undefined`, and `??` replaces that nullish result with the fallback string.', 'easy', 'approved', 'f80d7f61-7d8a-42b5-acce-497525e25c9e', 48, '2026-04-01T19:57:37.543Z', '2026-04-01T19:57:37.543Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8f9cdafb-1f83-4eaf-995c-79b1a01ec9f8', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which statement about operator precedence is correct for `??` according to MDN?', 'MDN states that `??` has lower precedence than `||` and higher precedence than the conditional operator (`?:`).', 'medium', 'approved', 'f80d7f61-7d8a-42b5-acce-497525e25c9e', 49, '2026-04-01T19:57:37.555Z', '2026-04-01T19:57:37.555Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('45253347-fad6-4c69-a24e-72c866c81294', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the value of `city` in the following code?

```js
const customer = { details: {} };
const city = customer.details?.address?.city;
```', 'Optional chaining stops when `address` is `undefined`, so the full expression evaluates to `undefined` instead of throwing.', 'easy', 'approved', '65b86ed4-0423-4a47-8136-2fd6298ffbec', 50, '2026-04-01T19:57:58.006Z', '2026-04-01T19:57:58.006Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('45fd594b-41e5-42e9-b7d5-62b62e13f7b6', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is logged by this code?

```js
const potentiallyNullObj = null;
let x = 0;
const value = potentiallyNullObj?.[x++];
console.log(x);
```', 'Because the left side is `null`, optional chaining short-circuits before evaluating the bracket expression, so `x++` never runs.', 'medium', 'approved', '65b86ed4-0423-4a47-8136-2fd6298ffbec', 51, '2026-04-01T19:57:58.024Z', '2026-04-01T19:57:58.024Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1c5a58a8-5bd1-4f14-9f8e-2e8c89c2478c', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What happens when this code runs?

```js
const api = { maybe: 123 };
api.maybe?.();
```', 'Optional chaining on a function call only suppresses the error when the property is `null` or `undefined`. If the property exists but is not callable, JavaScript still throws a `TypeError`.', 'hard', 'approved', '65b86ed4-0423-4a47-8136-2fd6298ffbec', 52, '2026-04-01T19:57:58.065Z', '2026-04-01T19:57:58.065Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('52f7fc01-0356-4d0b-b5f1-62629220158c', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why does this code throw?

```js
const potentiallyNullObj = null;
const prop = (potentiallyNullObj?.a).b;
```', 'Short-circuiting only applies across one continuous optional chain. Parentheses end that chain, so `.b` is evaluated on `undefined` and throws.', 'hard', 'approved', '65b86ed4-0423-4a47-8136-2fd6298ffbec', 53, '2026-04-01T19:57:58.076Z', '2026-04-01T19:57:58.076Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('822bce26-e02c-4da4-82bf-b5ec00e34a1f', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which expression is a `SyntaxError` because the constructor in a `new` expression cannot be an optional chain?', 'MDN explicitly notes that `new` cannot be applied to an optional chain, so `new Intl?.DateTimeFormat()` is invalid syntax.', 'medium', 'approved', '65b86ed4-0423-4a47-8136-2fd6298ffbec', 54, '2026-04-01T19:57:58.087Z', '2026-04-01T19:57:58.087Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('fda00a63-0beb-4a5f-a8d1-00ebf0154485', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which function declaration is valid JavaScript syntax?', 'A function can only have one rest parameter, it must be the last parameter, it cannot have a default value, and it cannot have a trailing comma.', 'easy', 'approved', '537b66a4-c572-442f-857a-f7c902866f7e', 55, '2026-04-01T19:58:19.009Z', '2026-04-01T19:58:19.009Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('227891ce-54d3-409f-bbaf-8f468bca2895', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why are rest parameters usually easier to work with than the `arguments` object?', 'Rest parameters are real arrays, so methods like `sort()`, `map()`, and `pop()` can be used directly. `arguments` is only array-like.', 'medium', 'approved', '537b66a4-c572-442f-857a-f7c902866f7e', 56, '2026-04-01T19:58:19.023Z', '2026-04-01T19:58:19.023Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a621028e-77db-49e4-81c2-954c91347038', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the value of `example.length` here?

```js
function example(a, b, ...rest) {}
console.log(example.length);
```', 'The rest parameter does not count toward a function''s `length`, so only the named parameters before it are counted.', 'medium', 'approved', '537b66a4-c572-442f-857a-f7c902866f7e', 57, '2026-04-01T19:58:19.035Z', '2026-04-01T19:58:19.035Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3821b9d7-1144-42c5-8465-d9f61eb90e8a', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What does this function return?

```js
function ignoreFirst(...[, b, c]) {
  return b + c;
}

ignoreFirst(100, 10, 20, 30);
```', 'The rest parameter collects all arguments into an array, and the destructuring pattern skips the first element. That makes `b = 10` and `c = 20`.', 'hard', 'approved', '537b66a4-c572-442f-857a-f7c902866f7e', 58, '2026-04-01T19:58:19.044Z', '2026-04-01T19:58:19.044Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d996fee4-f55b-4327-80c6-81b9a07a7d13', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Given this function call, what is the value of `manyMoreArgs`?

```js
function myFun(a, b, ...manyMoreArgs) {}
myFun("one", "two", "three", "four");
```', 'Rest parameters collect all arguments after the named parameters into an array. Here that means the third and fourth arguments are gathered.', 'easy', 'approved', '537b66a4-c572-442f-857a-f7c902866f7e', 59, '2026-04-01T19:58:19.051Z', '2026-04-01T19:58:19.051Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('60d113ed-8358-43a0-a9c4-1b3c75783cf7', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What happens here?

```js
const obj = { key1: "value1" };
const arr = [...obj];
```', 'Array literals and argument lists can only spread iterables. A plain object without `Symbol.iterator` is not iterable, so this throws a `TypeError`.', 'easy', 'approved', '742be74c-862a-492d-b10e-35d3998780aa', 60, '2026-04-01T19:58:41.003Z', '2026-04-01T19:58:41.003Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('28f4a2a6-1105-45fd-8f5a-f31d101e960d', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the value of `obj` after this code runs?

```js
const array = [1, 2, 3];
const obj = { ...array };
```', 'Object spread enumerates own enumerable properties. For arrays, the enumerable properties are the numeric indices, so the result is an object with keys `0`, `1`, and `2`.', 'medium', 'approved', '742be74c-862a-492d-b10e-35d3998780aa', 61, '2026-04-01T19:58:41.018Z', '2026-04-01T19:58:41.018Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('fdbeba12-151e-489e-9c8c-2ae0cf315159', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why is `b` not a deep clone in this example?

```js
const a = [[1], [2], [3]];
const b = [...a];
b.shift().shift();
```', 'Spread only performs a shallow copy. The inner arrays are still shared references, so mutating a nested array through `b` also affects `a`.', 'hard', 'approved', '742be74c-862a-492d-b10e-35d3998780aa', 62, '2026-04-01T19:58:41.032Z', '2026-04-01T19:58:41.032Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('6e2c8742-b211-4db7-b520-8bd7da6f44b9', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the resulting value of `mergedObj`?

```js
const obj1 = { foo: "bar", x: 42 };
const obj2 = { foo: "baz", y: 13 };
const mergedObj = { x: 41, ...obj1, ...obj2, y: 9 };
```', 'When duplicate property names appear, the last assigned value wins. The final values are `x: 42`, `foo: "baz"`, and `y: 9`.', 'medium', 'approved', '742be74c-862a-492d-b10e-35d3998780aa', 63, '2026-04-01T19:58:41.045Z', '2026-04-01T19:58:41.045Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a476fe9b-12be-4fc7-84e4-8d56047f3846', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which statement correctly compares object spread with `Object.assign()`?', 'MDN notes that `Object.assign()` mutates the target object and triggers setters on it, while object spread creates a new object and does not trigger setters on the target literal.', 'hard', 'approved', '742be74c-862a-492d-b10e-35d3998780aa', 64, '2026-04-01T19:58:41.054Z', '2026-04-01T19:58:41.054Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('19acfbed-b7ec-4965-bfc5-be1fe671528f', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the resulting string here?

```js
const text = `line 1
line 2`;
```', 'Template literals preserve actual newline characters written in the source, so the string contains two lines.', 'easy', 'approved', '267121b2-4921-480c-a23f-a3b9e7666333', 65, '2026-04-01T19:59:01.657Z', '2026-04-01T19:59:01.657Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('262f5e8f-55a9-47b4-ba0a-0101f6c7fee3', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is logged by this code?

```js
const a = 5;
const b = 10;
console.log(`Fifteen is ${a + b} and
not ${2 * a + b}.`);
```', 'The expressions inside `${...}` are evaluated and inserted into the string, so the result is the same message shown in the MDN example.', 'easy', 'approved', '267121b2-4921-480c-a23f-a3b9e7666333', 66, '2026-04-01T19:59:01.672Z', '2026-04-01T19:59:01.672Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7b42b101-3b29-48b3-8da7-e30ab2bd87db', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why is this code invalid?

```js
console.log?.`Hello`;
```', 'MDN notes that optional chaining cannot be used as the tag of a tagged template. The parser rejects this with a syntax error.', 'hard', 'approved', '267121b2-4921-480c-a23f-a3b9e7666333', 67, '2026-04-01T19:59:01.679Z', '2026-04-01T19:59:01.679Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0514787a-d12c-4f98-b790-6994ae8c6c7e', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'In a tagged template, what is the first argument passed to the tag function?', 'The first argument is an array of the literal string segments. Its length is always the number of substitutions plus one.', 'medium', 'approved', '267121b2-4921-480c-a23f-a3b9e7666333', 68, '2026-04-01T19:59:01.689Z', '2026-04-01T19:59:01.689Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ad37d946-48b2-4b0a-bddf-4f07c048312b', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the value of `str` here?

```js
const str = String.raw`Hi\n${2 + 3}!`;
```', '`String.raw` preserves the backslash escape as raw text, so the result contains the two characters `\` and `n` rather than a newline.', 'hard', 'approved', '267121b2-4921-480c-a23f-a3b9e7666333', 69, '2026-04-01T19:59:01.700Z', '2026-04-01T19:59:01.700Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e4c9cf5c-3abb-46e0-b7d0-1bdcb019affc', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A metrics widget starts polling every second and captures an ever-growing `samples` array. When the widget is removed from the page, memory keeps trending upward. Which fix is the best first step?

```js
function mountWidget() {
  const samples = [];
  const id = setInterval(() => {
    samples.push(readMetric());
  }, 1000);

  return function unmount() {
    widget.remove();
  };
}
```', 'The main problem is that the interval remains active, so the callback and `samples` remain reachable. Proper teardown should clear the timer before dropping other references; otherwise the array continues to grow.', 'hard', 'approved', '3debca89-80fd-4a36-a500-0a2140060559', 70, '2026-04-01T21:04:33.052Z', '2026-04-01T21:04:33.052Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f078173d-d3c4-48fc-a42f-64de7a3ff86f', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A modal manager caches DOM nodes for fast reuse. After the modal is removed, heap snapshots still show detached nodes. Which remediation is most appropriate?

```js
const registry = { modal: document.getElementById(''modal'') };
function closeModal() {
  registry.modal.remove();
}
```', 'Removing the element from the document is not enough if application code still references it. The registry entry and any associated event listeners need to be cleaned up as part of teardown so the detached subtree can become unreachable.', 'hard', 'approved', '3debca89-80fd-4a36-a500-0a2140060559', 71, '2026-04-01T21:04:33.076Z', '2026-04-01T21:04:33.076Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f866f61d-2d49-4623-b0ca-74a9066b1a6c', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A request pipeline stores metadata by request object, and once a request completes there is no business need to enumerate or count old entries. Which data structure is the best fit?', 'When keys are objects and you do not need deterministic iteration or size, a `WeakMap` matches the use case well because the metadata should not outlive the request objects unnecessarily.', 'medium', 'approved', '3debca89-80fd-4a36-a500-0a2140060559', 72, '2026-04-01T21:04:33.096Z', '2026-04-01T21:04:33.096Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9d72eb5d-c01d-4114-8d2c-24dd6ac3c518', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'An image service caches large `Blob` objects by URL string. Engineers want cache hits when possible, but they can tolerate recomputing entries and must avoid unbounded growth. Which redesign is best aligned with the sources?', 'String keys rule out `WeakMap`, so the useful pattern is a regular `Map` with `WeakRef` values plus cleanup or an explicit size bound. Otherwise dead entries can still pile up because the `Map` strongly retains the keys and wrapper objects.', 'hard', 'approved', '3debca89-80fd-4a36-a500-0a2140060559', 73, '2026-04-01T21:04:33.112Z', '2026-04-01T21:04:33.112Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e45c624b-4700-4550-8dfb-411edab27222', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A legacy function replaces a large object every second. Memory keeps growing even though old objects should be obsolete. The code structure looks like the classic shared-closure leak. What is the best targeted fix?', 'This is the subtle closure case where an unused sibling closure keeps a previous large object retained through shared lexical scope. The right fix is to remove the unnecessary capture or null out the older reference before publishing the replacement object.', 'hard', 'approved', '3debca89-80fd-4a36-a500-0a2140060559', 74, '2026-04-01T21:04:33.128Z', '2026-04-01T21:04:33.128Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('6c5c0dff-527c-44c7-b1fa-e691d9a616be', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which sequence best matches the JavaScript memory life cycle described by MDN?', 'The lifecycle is allocate, use, then release. In JavaScript, allocation and release are usually implicit, but the lifecycle itself is still the same as in other languages.', 'easy', 'approved', '541447ef-152b-4341-b74a-7cfc3b70aa00', 75, '2026-04-01T21:23:39.131Z', '2026-04-01T21:23:39.131Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3391b21d-e05c-4915-9f83-e456f8f444e8', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the main reason modern JavaScript engines use mark-and-sweep style garbage collection instead of relying on pure reference counting?', 'Mark-and-sweep starts from roots and collects anything unreachable, so circular structures are fine if no root can reach them. Pure reference counting can fail on cycles because each object still points at the other.', 'medium', 'approved', '541447ef-152b-4341-b74a-7cfc3b70aa00', 76, '2026-04-01T21:23:39.159Z', '2026-04-01T21:23:39.159Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('019faeda-7546-488d-a5ec-3a6485a27fe8', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the most accurate explanation of this `WeakMap` example?

```js
const wm = new WeakMap();
const key = {};
wm.set(key, { key });
```', 'MDN points out that `WeakMap` entries are not just ordinary strong references with a weak key bolted on. Engines use ephemeron-like behavior so the value''s back-reference does not automatically make the key strongly reachable through the map itself.', 'hard', 'approved', '541447ef-152b-4341-b74a-7cfc3b70aa00', 77, '2026-04-01T21:23:39.175Z', '2026-04-01T21:23:39.175Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ba347b20-5e95-4fcc-b6dd-54d5bc9636a6', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why are `WeakMap` and `WeakSet` intentionally not iterable?', 'If weak collections were iterable, code could inspect which keys are still alive and indirectly observe garbage collection behavior. Their API is intentionally limited so GC remains mostly invisible.', 'medium', 'approved', '541447ef-152b-4341-b74a-7cfc3b70aa00', 78, '2026-04-01T21:23:39.195Z', '2026-04-01T21:23:39.195Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ea859873-472d-4e8f-a6f5-1ad28d00ed32', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which statement is the safest guidance when using `WeakRef` and `FinalizationRegistry` in production JavaScript?', 'MDN explicitly warns that these APIs are for optimization, not correctness. Collection timing is nondeterministic and finalizer callbacks may run late or not at all, so they are inappropriate for critical cleanup paths.', 'medium', 'approved', '541447ef-152b-4341-b74a-7cfc3b70aa00', 79, '2026-04-01T21:23:39.215Z', '2026-04-01T21:23:39.215Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d44d0a6a-f67b-48e3-9755-51ca9f66d1c6', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which set best matches the values that javascript.info describes as inherently reachable roots?', 'The article defines roots broadly as the currently executing function and its locals, the functions on the current chain of calls and their locals, and global variables. Other values are reachable only if a root can reach them through references.', 'easy', 'approved', '38f47b33-8173-4b3e-bcb3-133783f8a7b5', 80, '2026-04-01T21:23:51.474Z', '2026-04-01T21:23:51.474Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('69a4dd8c-ceac-493f-bd7b-220fa718dccd', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Consider this code:

```js
let user = { name: "John" };
let admin = user;
user = null;
```

Why is the object still retained?', 'Overwriting `user` removes only one reference. The object is still reachable through `admin`, which is itself reachable from a root, so the object must stay alive.', 'medium', 'approved', '38f47b33-8173-4b3e-bcb3-133783f8a7b5', 81, '2026-04-01T21:23:51.497Z', '2026-04-01T21:23:51.497Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('34fd2b5a-4902-4622-ac85-a1b4652cda5b', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why can a whole island of interlinked objects still be collected after `family = null` in the article''s example?', 'Mutual references inside the island are not enough. What matters is whether any path from a root reaches that island. Once the root reference is severed, the entire group becomes unreachable and can be reclaimed.', 'hard', 'approved', '38f47b33-8173-4b3e-bcb3-133783f8a7b5', 82, '2026-04-01T21:23:51.513Z', '2026-04-01T21:23:51.513Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9738bfdb-9445-42a8-b7e3-4fced97bce7f', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'The article says, "Outgoing references do not matter. Only incoming ones can make an object reachable." What is the best interpretation of that statement?', 'An object''s own pointers to other objects do not keep the object alive. It stays alive only if a reachable root or another reachable object points to it.', 'medium', 'approved', '38f47b33-8173-4b3e-bcb3-133783f8a7b5', 83, '2026-04-01T21:23:51.529Z', '2026-04-01T21:23:51.529Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('858aee8a-44f1-46bf-b6bd-ae9d98dc469f', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which garbage-collection optimization mentioned by javascript.info specifically reduces long pauses by splitting the collector''s work into smaller parts?', 'Incremental collection divides the work into multiple smaller collections. Generational collection separates new and old objects, while idle-time collection tries to schedule work when the CPU is idle.', 'medium', 'approved', '38f47b33-8173-4b3e-bcb3-133783f8a7b5', 84, '2026-04-01T21:23:51.542Z', '2026-04-01T21:23:51.542Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f65ecddf-0d0b-47de-bb71-80fe79fa5718', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What leak risk is demonstrated by this code in non-strict browser JavaScript?

```js
function foo() {
  bar = "hidden global";
}
```', 'An undeclared assignment creates an accidental global in sloppy mode, attaching it to the global object. That turns the value into part of the root set unless it is later cleared or reassigned.', 'medium', 'approved', '54705ef0-8c49-4286-aca9-37913f95e96c', 85, '2026-04-01T21:24:03.396Z', '2026-04-01T21:24:03.396Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('91264262-2824-4904-8b0a-e5915ce35672', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why can this pattern leak memory even after the DOM node disappears?

```js
const someResource = getData();
setInterval(() => {
  const node = document.getElementById(''Node'');
  if (node) {
    node.innerHTML = JSON.stringify(someResource);
  }
}, 1000);
```', 'The active interval keeps the callback reachable, and the callback closes over `someResource`. Even if the node later disappears, the callback and everything it still references remain alive until the interval is cleared.', 'medium', 'approved', '54705ef0-8c49-4286-aca9-37913f95e96c', 86, '2026-04-01T21:24:03.418Z', '2026-04-01T21:24:03.418Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('31bbe9cc-171e-4b04-8ae8-505cf3e8228e', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A script stores a reference to a `<td>` element, then later removes the whole table from the DOM. According to the Auth0 article, what subtle retention risk remains?', 'Keeping a reference to a leaf node can retain much more than the leaf. Because DOM nodes are connected through parent-child relationships, a referenced cell can keep the containing table reachable as well.', 'hard', 'approved', '54705ef0-8c49-4286-aca9-37913f95e96c', 87, '2026-04-01T21:24:03.435Z', '2026-04-01T21:24:03.435Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('89c5cf32-8a3b-4499-b19b-211d69947c9e', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'In the closure leak example, why can `originalThing` remain retained even though the `unused` function is never called?', 'The problem is shared closure scope, not function invocation. `unused` and `someMethod` share a lexical environment, so the reference captured by `unused` can keep `originalThing` alive as long as `someMethod` remains reachable via `theThing`.', 'hard', 'approved', '54705ef0-8c49-4286-aca9-37913f95e96c', 88, '2026-04-01T21:24:03.451Z', '2026-04-01T21:24:03.451Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2597d2ae-5023-4d37-8e52-f51718bdfafb', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which observation in Chrome DevTools is the strongest sign of a periodic memory leak, according to the Auth0 article?', 'Normal GC often produces a sawtooth pattern. The red flag is that the low points after collections keep rising over time, often alongside steadily increasing node counts. That means some allocations survive each cycle and accumulate.', 'medium', 'approved', '54705ef0-8c49-4286-aca9-37913f95e96c', 89, '2026-04-01T21:24:03.462Z', '2026-04-01T21:24:03.462Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('94bd134f-68bb-436f-a4c2-adf6b0e42fdf', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'According to the LogRocket article, where are primitive values and reference types typically stored?', 'The article uses the common mental model that primitive values are stored on the stack, while reference types like objects, arrays, and functions live on the heap with references held elsewhere.', 'easy', 'approved', 'f915ad3b-9c89-4b8a-8b2f-c9a3b5372f5f', 90, '2026-04-01T21:24:14.069Z', '2026-04-01T21:24:14.069Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c72927f9-982e-4ccb-a451-9997cc1999ac', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why does the reference-counting algorithm struggle with code like this?

```js
let person = { name: ''Joe'' };
let employee = { id: 123 };
person.employee = employee;
employee.person = person;
person = null;
employee = null;
```', 'Reference counting only sees that the objects still reference one another, so it cannot conclude they are free. Mark-and-sweep improves on this by checking whether any root still reaches the cycle.', 'medium', 'approved', 'f915ad3b-9c89-4b8a-8b2f-c9a3b5372f5f', 91, '2026-04-01T21:24:14.089Z', '2026-04-01T21:24:14.089Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9cf8e034-1d9c-4ef0-915f-b08fdf11f680', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What actually leaks in this closure-based example?

```js
function outer() {
  const largeArray = [];
  return function inner(num) {
    largeArray.push(num);
  };
}
const appendNumbers = outer();
```', 'The outer function finished, but the returned `inner` function still closes over `largeArray`. Because that closure remains reachable through `appendNumbers`, the array can keep growing and remain live.', 'hard', 'approved', 'f915ad3b-9c89-4b8a-8b2f-c9a3b5372f5f', 92, '2026-04-01T21:24:14.106Z', '2026-04-01T21:24:14.106Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('82578f83-f6a0-4ff5-88e9-5a33f3c9873a', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why is explicitly saving and later clearing an interval considered a best practice for leak prevention?', 'A recurring timer keeps its callback alive. If that callback closes over large data structures or DOM references, they also stay reachable until the timer is stopped.', 'medium', 'approved', 'f915ad3b-9c89-4b8a-8b2f-c9a3b5372f5f', 93, '2026-04-01T21:24:14.118Z', '2026-04-01T21:24:14.118Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('25f19d70-fb5b-4823-bab6-c81e353f7fe9', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which DevTools workflow does the LogRocket article recommend for finding detached DOM nodes?', 'The article recommends taking a heap snapshot in Chrome DevTools and filtering for `Detached` nodes in the summary. That helps surface nodes removed from the DOM but still referenced by JavaScript.', 'medium', 'approved', 'f915ad3b-9c89-4b8a-8b2f-c9a3b5372f5f', 94, '2026-04-01T21:24:14.134Z', '2026-04-01T21:24:14.134Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e5845814-8826-4234-b924-36feb900bd41', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'According to the Medium article, which stages of the memory lifecycle are implicit in JavaScript?', 'The article states that the lifecycle still has allocation, use, and release, but JavaScript makes the first and third stages implicit through automatic allocation and garbage collection.', 'easy', 'approved', '4a723294-a1cb-49e3-8d37-926b846c5106', 95, '2026-04-01T21:24:26.839Z', '2026-04-01T21:24:26.839Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('564bbb73-572f-4cc4-ad0f-44ce42935993', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why does the article present mark-and-sweep as more robust than reference counting for reclaiming circular structures?', 'Reference counting fails when two otherwise unreachable objects keep each other''s counts above zero. Mark-and-sweep instead asks whether a root can still reach the objects, so unreachable cycles can be collected.', 'medium', 'approved', '4a723294-a1cb-49e3-8d37-926b846c5106', 96, '2026-04-01T21:24:26.860Z', '2026-04-01T21:24:26.860Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f5c4a7f4-ec2f-42b6-babd-3942e12e37a9', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which Orinoco collection mode described in the article still pauses the main JavaScript thread, but spreads garbage-collection work across helper threads?', 'Parallel collection is still a stop-the-world approach, but helper threads share the work. Incremental collection uses the main thread in pieces, while concurrent collection aims to let the main thread continue running JavaScript.', 'hard', 'approved', '4a723294-a1cb-49e3-8d37-926b846c5106', 97, '2026-04-01T21:24:26.877Z', '2026-04-01T21:24:26.877Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ff798377-2323-4a46-9dde-b7efff40a826', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which collection mode leaves the main JavaScript thread free to continue running while helper threads perform garbage collection in the background?', 'The article describes concurrent collection as the hardest mode because the main thread keeps executing while helper threads collect in the background, creating synchronization challenges and possible invalidation of prior work.', 'hard', 'approved', '4a723294-a1cb-49e3-8d37-926b846c5106', 98, '2026-04-01T21:24:26.891Z', '2026-04-01T21:24:26.891Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('cbcef1a6-2dd9-488e-aed7-d1e816c0a8eb', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'In the closure leak example discussed in the article, what is the effect of setting the previously captured object to `null` before replacing it?', 'The article''s point is not that closures disappear, but that the retained payload can be made much smaller. Nulling the previously captured object breaks the costly retention chain while preserving the general control flow.', 'medium', 'approved', '4a723294-a1cb-49e3-8d37-926b846c5106', 99, '2026-04-01T21:24:26.904Z', '2026-04-01T21:24:26.904Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e6631f0a-eb0f-4568-b13c-b8dcb2b8ecdb', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the most accurate explanation of the retention risk in this code?

```js
function start() {
  const cache = { huge: new Array(1_000_000).fill(''x'') };
  setInterval(() => {
    console.log(cache.huge.length);
  }, 1000);
}

start();
```', 'The interval callback remains reachable from a root while the timer is active. Because the callback closes over `cache`, the large array also stays reachable, even though `start` has already returned. This combines reachability rules with the timer leak pattern described across multiple sources.', 'hard', 'approved', 'efb0bdc5-465f-4b7b-896f-b07a672d6dae', 100, '2026-04-01T21:24:38.278Z', '2026-04-01T21:24:38.278Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('6bdea6f9-38f9-4028-9e54-849275bc90c0', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'You need a cache keyed by URL strings. Values are large objects that can be recomputed, so it is acceptable if a cached value disappears. Which design best fits the constraints from the sources?', 'A `WeakMap` cannot use string keys, and its values are not weakly held. MDN suggests a `Map` whose values are `WeakRef`s when string keys are required and cached values are optional. In practice, you still need cleanup or bounds because the `Map` and `WeakRef` wrappers themselves remain strongly held.', 'hard', 'approved', 'efb0bdc5-465f-4b7b-896f-b07a672d6dae', 101, '2026-04-01T21:24:38.334Z', '2026-04-01T21:24:38.334Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f169c153-f4e4-42a8-9db8-b5ccdb998e62', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why can removing a table from the DOM still fail to free most of its memory when code keeps a reference to one child cell?', 'A retained child node can keep its ancestors reachable through the DOM''s bidirectional relationships. Removing a subtree from the live DOM is not enough if JavaScript still holds a reference into that subtree.', 'hard', 'approved', 'efb0bdc5-465f-4b7b-896f-b07a672d6dae', 102, '2026-04-01T21:24:38.348Z', '2026-04-01T21:24:38.348Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9a42707d-2aa8-46f1-8f79-a1911cd9d0f8', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'In the classic `replaceThing`-style closure leak, which change most directly reduces retention without changing the fact that a method still closes over local state?', 'The leak is caused by an unnecessary captured reference to the previous large object. Nulling the previously captured object or removing the sibling closure that captures it breaks the expensive retention chain while preserving the overall API shape.', 'hard', 'approved', 'efb0bdc5-465f-4b7b-896f-b07a672d6dae', 103, '2026-04-01T21:24:38.367Z', '2026-04-01T21:24:38.367Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e4c13b1f-e215-41e7-96ce-689ee22ed19a', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which profiling pattern most strongly indicates a real leak instead of normal garbage-collection churn?', 'A normal allocation-heavy app often shows a sawtooth heap graph. The more suspicious signal is that after each collection, the baseline remains higher than before, often alongside steadily increasing node counts. That suggests some objects are still reachable across collections.', 'hard', 'approved', 'efb0bdc5-465f-4b7b-896f-b07a672d6dae', 104, '2026-04-01T21:24:38.382Z', '2026-04-01T21:24:38.382Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('95e2efe5-ac1d-4adc-b789-f3a4b98505db', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A developer runs `node --expose-gc --inspect app.js` and manually triggers garbage collection while debugging. Which statement is most accurate?', 'Debug flags can help you observe memory behavior, but they do not change the fundamental rule: objects are reclaimable only when they become unreachable. Exposing GC is a debugging aid, not a fix for retention bugs.', 'medium', 'approved', 'efb0bdc5-465f-4b7b-896f-b07a672d6dae', 105, '2026-04-01T21:24:38.392Z', '2026-04-01T21:24:38.392Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('672bda85-d046-4c5f-bc84-c20168085d42', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Two objects refer only to each other, and no root can reach either one. Which comparison is correct?', 'Under a pure reference-counting mental model, the cycle could stay around because each object still has a reference. Under modern mark-and-sweep-based engines, the lack of any root path makes the entire cycle collectible.', 'hard', 'approved', 'efb0bdc5-465f-4b7b-896f-b07a672d6dae', 106, '2026-04-01T21:24:38.406Z', '2026-04-01T21:24:38.406Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c9a4c652-60ac-4b93-8ed1-423716e43c50', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which requirement should push you away from `WeakMap` and toward a regular `Map`?', 'Weak collections are intentionally non-iterable and do not expose stable size semantics, precisely to avoid making GC liveness observable. If your API requires deterministic iteration or a trustworthy count of entries, you need a regular `Map` instead.', 'medium', 'approved', 'efb0bdc5-465f-4b7b-896f-b07a672d6dae', 107, '2026-04-01T21:24:38.418Z', '2026-04-01T21:24:38.418Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('037baf86-506f-418a-8fa8-a1ef8c814c7b', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which change most reliably prevents this code from turning a temporary buffer into a hidden root?

```js
function process(data) {
  buffer = data;
  // ...
}
```', 'The bug is the undeclared assignment. Declaring the variable in the intended scope and running under strict mode or ES modules prevents accidental globals from silently becoming roots on the global object.', 'medium', 'approved', 'efb0bdc5-465f-4b7b-896f-b07a672d6dae', 108, '2026-04-01T21:24:38.427Z', '2026-04-01T21:24:38.427Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('96fed79b-331a-4ba8-87b4-3ffd60ff42ad', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why can this cache still grow indefinitely even though each stored value is wrapped in a `WeakRef`?

```js
const cache = new Map();
async function getBlob(url) {
  const cached = cache.get(url)?.deref();
  if (cached) return cached;

  const blob = await fetch(url).then((res) => res.blob());
  cache.set(url, new WeakRef(blob));
  return blob;
}
```', 'The `Map` still strongly retains its string keys and the `WeakRef` wrapper objects. If dead entries are never removed, the container can grow forever even when the blobs themselves are reclaimed. This is why MDN pairs `WeakRef` cache patterns with optional `FinalizationRegistry` cleanup and why bounded caches remain important.', 'hard', 'approved', 'efb0bdc5-465f-4b7b-896f-b07a672d6dae', 109, '2026-04-01T21:24:38.438Z', '2026-04-01T21:24:38.438Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b1a95578-8910-4b0a-911d-14525aaecdd3', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A developer walks up the prototype chain of a normal `Date` instance with `Object.getPrototypeOf()`. Which chain is correct?', 'A `Date` instance inherits first from `Date.prototype`, then from `Object.prototype`, and then the chain ends at `null`. That is why `Date` instances can use both date-specific methods like `getTime()` and generic object methods like `toString()`.

Example:

```js
const myDate = new Date();
Object.getPrototypeOf(myDate) === Date.prototype; // true
Object.getPrototypeOf(Date.prototype) === Object.prototype; // true
```', 'medium', 'approved', 'dba26c2a-c401-47dc-ba24-2f5f6f47c893', 110, '2026-04-01T23:14:01.372Z', '2026-04-01T23:14:01.372Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a3c0259e-8196-44e8-a54d-4a6de388c2cc', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What happens after this change?

```js
const myDate = new Date(1995, 11, 17);

myDate.getTime = function () {
  return "shadowed";
};
```

What will a later call to `myDate.getTime()` use?', 'The call uses the function stored directly on `myDate`, because own properties are checked before the prototype chain. Defining an own property with the same name as an inherited one is called shadowing.

Example:

```js
console.log(myDate.getTime()); // "shadowed"
```', 'medium', 'approved', 'dba26c2a-c401-47dc-ba24-2f5f6f47c893', 111, '2026-04-01T23:14:01.418Z', '2026-04-01T23:14:01.418Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f9cea8d0-7901-40aa-b957-aecd8643d818', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What does `Object.create(personPrototype)` do in this example?

```js
const personPrototype = {
  greet() {
    console.log("hello!");
  },
};

const carl = Object.create(personPrototype);
```', '`Object.create()` makes a new object whose prototype is the object you pass in. The method is not copied as an own property; it is found later through prototype lookup.

Example:

```js
Object.getPrototypeOf(carl) === personPrototype; // true
```', 'easy', 'approved', 'dba26c2a-c401-47dc-ba24-2f5f6f47c893', 112, '2026-04-01T23:14:01.424Z', '2026-04-01T23:14:01.424Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e269f3ef-3dd9-4b42-9a46-229ad8df3875', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why is `Object.hasOwn(irma, "name")` `true` while `Object.hasOwn(irma, "greet")` is `false` in the constructor-based example?', '`name` is assigned in the constructor, so it exists directly on each instance as an own property. `greet` is placed on `Person.prototype`, so instances inherit it instead of owning a separate copy.

Example:

```js
function Person(name) {
  this.name = name;
}
Person.prototype.greet = function () {};
```', 'medium', 'approved', 'dba26c2a-c401-47dc-ba24-2f5f6f47c893', 113, '2026-04-01T23:14:01.431Z', '2026-04-01T23:14:01.431Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('601e1466-4f0d-479a-9511-1a2f47215070', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A learner says, "The property that points to an object''s prototype is named `prototype`." Which correction is accurate?', 'For ordinary objects, the actual prototype link is not a standard property named `prototype`. The standard way to inspect it is `Object.getPrototypeOf(obj)`. Constructor functions do have a `.prototype` property, and that object becomes the prototype of instances created with `new`.

Example:

```js
function Person() {}
const p = new Person();
Object.getPrototypeOf(p) === Person.prototype; // true
```', 'hard', 'approved', 'dba26c2a-c401-47dc-ba24-2f5f6f47c893', 114, '2026-04-01T23:14:01.435Z', '2026-04-01T23:14:01.435Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9b4469f1-0bb3-4c18-b1e4-acd4d39bc8ed', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which statement best distinguishes `[[Prototype]]` from `__proto__`?', '`[[Prototype]]` is the internal prototype link described by the language specification. `__proto__` is a historical getter/setter that exposes that link. They are related, but they are not the same thing.

Example:

```js
const animal = { eats: true };
const rabbit = { __proto__: animal };
```', 'medium', 'approved', '1ec15229-c205-4cd9-85db-8037adfad7c5', 115, '2026-04-01T23:14:06.871Z', '2026-04-01T23:14:06.871Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a7a96b87-df99-4bc3-8092-0530ed127ebe', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What are the three outputs from this code?

```js
let animal = { jumps: null };
let rabbit = { __proto__: animal, jumps: true };

console.log(rabbit.jumps);
delete rabbit.jumps;
console.log(rabbit.jumps);
delete animal.jumps;
console.log(rabbit.jumps);
```', 'The first read finds the own `rabbit.jumps`, so it prints `true`. After deleting that own property, lookup falls through to `animal.jumps`, which is `null`. After deleting `animal.jumps` too, the property is nowhere in the chain, so the result is `undefined`.

Example:

```js
// own property first, then prototype, then undefined
```', 'hard', 'approved', '1ec15229-c205-4cd9-85db-8037adfad7c5', 116, '2026-04-01T23:14:06.874Z', '2026-04-01T23:14:06.874Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('02a3839c-f83b-4d71-bba9-81d9768afdc9', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'In the setter example below, which object''s state changes after the assignment?

```js
let user = {
  name: "John",
  surname: "Smith",
  set fullName(value) {
    [this.name, this.surname] = value.split(" " );
  },
  get fullName() {
    return `${this.name} ${this.surname}`;
  }
};

let admin = {
  __proto__: user,
  isAdmin: true
};

admin.fullName = "Alice Cooper";
```', 'The setter is found on the prototype, but `this` is still the object before the dot at call time, which is `admin`. That means the assignment updates `admin.name` and `admin.surname`, not `user`''s state.

Example:

```js
console.log(admin.fullName); // Alice Cooper
console.log(user.fullName);  // John Smith
```', 'medium', 'approved', '1ec15229-c205-4cd9-85db-8037adfad7c5', 117, '2026-04-01T23:14:06.878Z', '2026-04-01T23:14:06.878Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2fe07e61-c271-4090-b1e1-6afb834df5f6', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What becomes `true` after this code runs?

```js
let animal = {
  sleep() {
    this.isSleeping = true;
  }
};

let rabbit = {
  name: "White Rabbit",
  __proto__: animal
};

rabbit.sleep();
```', 'The method is inherited from `animal`, but `this` is still `rabbit` when `rabbit.sleep()` is called. As a result, the write creates `rabbit.isSleeping`, not `animal.isSleeping`.

Example:

```js
console.log(rabbit.isSleeping); // true
console.log(animal.isSleeping); // undefined
```', 'medium', 'approved', '1ec15229-c205-4cd9-85db-8037adfad7c5', 118, '2026-04-01T23:14:06.882Z', '2026-04-01T23:14:06.882Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0a5f781e-88f2-40d4-aa99-7d5464b172df', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why can a `for..in` loop list an inherited property like `eats`, but normally not list inherited `hasOwnProperty`?', '`for..in` visits enumerable properties, including inherited ones. A user-defined inherited property like `eats` is typically enumerable, but `hasOwnProperty` comes from `Object.prototype` with `enumerable: false`, so the loop skips it.

Example:

```js
for (const key in rabbit) {
  // may see `jumps` and inherited `eats`
}
```', 'hard', 'approved', '1ec15229-c205-4cd9-85db-8037adfad7c5', 119, '2026-04-01T23:14:06.887Z', '2026-04-01T23:14:06.887Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f4802cb9-b1c3-49e6-92fe-e88f0ad50b83', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What happens if code tries to instantiate a class declaration before the declaration line has been evaluated?', 'Class declarations are not usable before initialization the way function declarations are. They follow temporal dead zone rules similar to `let` and `const`, so accessing them too early results in a `ReferenceError`.

Example:

```js
const box = new Rectangle(); // ReferenceError
class Rectangle {}
```', 'medium', 'approved', '24e8bafb-9241-4279-972a-fca3f125226c', 120, '2026-04-01T23:14:11.644Z', '2026-04-01T23:14:11.644Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e856ef86-c395-4857-a7bf-e92cb5f2b56c', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'In the class below, where is `calcArea()` installed?

```js
class Rectangle {
  calcArea() {
    return 1;
  }
}
```', 'Instance methods declared in a class are installed on the class''s prototype, not copied into each instance. This is one reason classes are built on top of JavaScript''s prototype system.

Example:

```js
Rectangle.prototype.calcArea instanceof Function; // true
```', 'medium', 'approved', '24e8bafb-9241-4279-972a-fca3f125226c', 121, '2026-04-01T23:14:11.649Z', '2026-04-01T23:14:11.649Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a986e2e7-fa4a-469d-bbab-78fa9939a574', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which access pattern is correct for the static members in this class?

```js
class Point {
  static displayName = "Point";
  static distance(a, b) {
    return Math.hypot(a.x - b.x, a.y - b.y);
  }
}
```', 'Static fields and methods live on the class itself, not on instances. That means `Point.displayName` and `Point.distance(...)` are valid, while `instance.displayName` and `instance.distance` are not inherited as instance members.

Example:

```js
console.log(Point.displayName);
```', 'medium', 'approved', '24e8bafb-9241-4279-972a-fca3f125226c', 122, '2026-04-01T23:14:11.651Z', '2026-04-01T23:14:11.651Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7b08f16d-2623-4b34-b523-225962281b40', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which rule must a subclass constructor follow before it can use `this`?', 'In a derived class, `super()` must run before `this` can be used. That call initializes the base-class portion of the instance. Using `this` too early causes an error.

Example:

```js
class Dog extends Animal {
  constructor(name) {
    super(name);
    this.kind = "dog";
  }
}
```', 'medium', 'approved', '24e8bafb-9241-4279-972a-fca3f125226c', 123, '2026-04-01T23:14:11.654Z', '2026-04-01T23:14:11.654Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('36cd9afe-935b-4485-a49b-7d66e16fdcdc', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What happens here when `speak()` is called without an object receiver?

```js
class Animal {
  speak() {
    return this;
  }
}

const obj = new Animal();
const speak = obj.speak;
speak();
```', 'Code inside a class body is always strict mode. If a class method is extracted and then called without a receiver, `this` becomes `undefined` instead of being rebound to a global object. If the method tries to access a property on `this`, that usually becomes a `TypeError`.

Example:

```js
class Box {
  value = 1;
  getValue() {
    return this.value;
  }
}
const fn = new Box().getValue;
fn(); // TypeError
```', 'hard', 'approved', '24e8bafb-9241-4279-972a-fca3f125226c', 124, '2026-04-01T23:14:11.656Z', '2026-04-01T23:14:11.656Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9eff92db-106a-47be-a554-11e426b8a4e5', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which statement is correct about this code?

```js
function Person(name) {
  this.name = name;
}

Person.prototype.describe = function () {
  return `Person:${this.name}`;
};

class Admin extends Person {}

const admin = new Admin("Lee");
```

Assume no other code runs.', 'Classes can extend another constructor, not just another class declaration. `Admin` inherits from `Person`, so `admin.describe()` is found through the prototype chain on `Person.prototype`, and `this.name` resolves to the instance field initialized by `Person`.

Example:

```js
console.log(admin.describe()); // Person:Lee
```', 'hard', 'approved', '412b2f42-4cfd-433c-9d85-3fb4d786b1d0', 125, '2026-04-01T23:14:16.800Z', '2026-04-01T23:14:16.800Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('03879b43-8dc3-414f-937e-91cd2236fb98', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is `serviceB.config.retries` after this code runs?

```js
const base = {
  config: { retries: 3 }
};

const serviceA = Object.create(base);
const serviceB = Object.create(base);

serviceA.config.retries = 1;
```', 'Both `serviceA` and `serviceB` inherit the same `config` object reference from `base`. The property lookup finds that shared object, and mutating `retries` changes that same object for both children. Prototype lookup does not deep-clone nested objects.

Example:

```js
console.log(serviceB.config.retries); // 1
```', 'hard', 'approved', '412b2f42-4cfd-433c-9d85-3fb4d786b1d0', 126, '2026-04-01T23:14:16.813Z', '2026-04-01T23:14:16.813Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('db0718f7-73c6-4aec-b5b8-0292f47cafee', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What does this expression return?

```js
class Animal {
  speak() {
    return this.sound;
  }
}

const rabbit = Object.create(Animal.prototype);
rabbit.sound = "hop";

rabbit.speak();
```', 'Class instance methods live on `Animal.prototype`, so an object created directly from that prototype can still call them. During the method call, `this` becomes `rabbit`, so `this.sound` resolves to `rabbit.sound`.

Example:

```js
console.log(rabbit.speak()); // hop
```', 'hard', 'approved', '412b2f42-4cfd-433c-9d85-3fb4d786b1d0', 127, '2026-04-01T23:14:16.819Z', '2026-04-01T23:14:16.819Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('15699137-3fee-439c-8a04-ee41a39cf2bf', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What happens when `fn()` is called here?

```js
class Box {
  value = 1;

  getValue() {
    return this.value;
  }
}

const box = new Box();
const fn = box.getValue;

fn();
```', 'Class bodies run in strict mode. Once `getValue` is extracted from `box`, it no longer has a receiver object, so `this` becomes `undefined` during `fn()`. Accessing `this.value` then throws a `TypeError`.

Example:

```js
const bound = box.getValue.bind(box);
bound(); // 1
```', 'hard', 'approved', '412b2f42-4cfd-433c-9d85-3fb4d786b1d0', 128, '2026-04-01T23:14:16.824Z', '2026-04-01T23:14:16.824Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('28f71da5-c5ec-4ce5-9aca-c75f6360bc57', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the value of `new Derived().kind`?

```js
class Base {
  constructor() {
    this.kind = "base";
  }
}

class Derived extends Base {
  kind = "derived";

  constructor() {
    super();
    this.kind += "!";
  }
}
```', '`Base` sets `this.kind` to `base`, then the derived instance field initializer runs before `super()` returns to the rest of the derived constructor, overwriting it with `derived`. Finally, the derived constructor appends `!`, producing `derived!`.

Example:

```js
console.log(new Derived().kind); // derived!
```', 'hard', 'approved', '412b2f42-4cfd-433c-9d85-3fb4d786b1d0', 129, '2026-04-01T23:14:16.832Z', '2026-04-01T23:14:16.832Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0e946eef-4869-45bf-896f-82fe059fcfea', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the value of `child.label` here?

```js
const parent = {
  get label() {
    return this.name.toUpperCase();
  }
};

const child = Object.create(parent);
child.name = "api";

child.label;
```', 'The getter is found on `parent`, but it is invoked as `child.label`, so `this` is `child`. That means the getter reads `child.name` and returns `API`. This is the same receiver rule that applies to inherited methods in general.

Example:

```js
console.log(child.label); // API
```', 'hard', 'approved', '412b2f42-4cfd-433c-9d85-3fb4d786b1d0', 130, '2026-04-01T23:14:16.834Z', '2026-04-01T23:14:16.834Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('42607626-90a7-41d6-9863-35aec3a7b598', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What are `A.version` and `B.version` after this code runs?

```js
class A {
  static version = 1;
}

class B extends A {}

B.version = 2;
```', '`B` initially inherits access to the static property through the constructor chain. The assignment `B.version = 2` creates or updates an own static property on `B`, shadowing the inherited one rather than mutating `A.version`.

Example:

```js
console.log(A.version, B.version); // 1 2
```', 'hard', 'approved', '412b2f42-4cfd-433c-9d85-3fb4d786b1d0', 131, '2026-04-01T23:14:16.840Z', '2026-04-01T23:14:16.840Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('5c2b871e-5cb8-4210-83d9-d09ac0d4ce73', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What does `Cache.store.get("id")` return after this code runs?

```js
class Cache {
  static store = new Map();
}

class UserCache extends Cache {}

UserCache.store.set("id", 1);
```', 'Until `UserCache` shadows `store` with its own static property, `UserCache.store` resolves to the inherited `Cache.store` value. Because that value is a `Map` object, both names refer to the same mutable object, so reading through `Cache.store` returns `1`.

Example:

```js
console.log(Cache.store.get("id")); // 1
```', 'hard', 'approved', '412b2f42-4cfd-433c-9d85-3fb4d786b1d0', 132, '2026-04-01T23:14:16.859Z', '2026-04-01T23:14:16.859Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f63554ad-196b-4740-86d8-2edc3444c9a5', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What does `counter.inc()` return here?

```js
class Counter {
  #n = 0;

  inc() {
    this.#n += 1;
    return this.#n;
  }
}

const counter = new Counter();
counter["#n"] = 10;

counter.inc();
```', 'Private fields are separate from ordinary public properties, even if the public property name looks similar. `counter["#n"] = 10` creates a normal property whose key is the string `#n`; it does not touch the private field `#n`, which still increments from `0` to `1`.

Example:

```js
console.log(counter.inc()); // 1
```', 'hard', 'approved', '412b2f42-4cfd-433c-9d85-3fb4d786b1d0', 133, '2026-04-01T23:14:16.861Z', '2026-04-01T23:14:16.861Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1e456c31-af77-4f91-a4fe-a6e4f13338c7', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is `admin.level` after this code runs?

```js
function Person() {}
Person.prototype.level = 1;

class Admin extends Person {
  level = 2;
}

const admin = new Admin();
delete admin.level;

admin.level;
```', 'The class field `level = 2` creates an own property on the instance that shadows the inherited `Person.prototype.level`. Deleting the own property removes the shadow, so later lookup falls back to the prototype value `1`.

Example:

```js
console.log(admin.level); // 1
```', 'hard', 'approved', '412b2f42-4cfd-433c-9d85-3fb4d786b1d0', 134, '2026-04-01T23:14:16.863Z', '2026-04-01T23:14:16.863Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('97f7a5fa-7ab4-474f-aa98-f36b5a7be660', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Scenario: A team wants shared behavior without duplicating methods.

```js
const sessionPrototype = {
  tasks: [],
  add(task) {
    this.tasks.push(task);
  }
};

const a = Object.create(sessionPrototype);
const b = Object.create(sessionPrototype);

a.add("deploy");
```

Why does `b.tasks` also contain `"deploy"`, and what is the best fix?', '`tasks` is a mutable array stored on the prototype, so both `a` and `b` reach the same array through prototype lookup. The correct fix is to put mutable state like arrays on each instance instead of on the shared prototype.

Example:

```js
const a = Object.create(sessionPrototype);
a.tasks = [];
```', 'hard', 'approved', 'be4044de-f1b0-408e-b19f-704a6176d19a', 135, '2026-04-01T23:14:21.708Z', '2026-04-01T23:14:21.708Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c1031fd7-b735-4b05-9f90-36f9b6d5661b', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Scenario: A teammate extracts a class method and calls it later.

```js
class Reporter {
  prefix = "[prod]";

  log() {
    return this.prefix;
  }
}

const reporter = new Reporter();
const run = reporter.log;
run();
```

What is the most accurate explanation and fix?', 'The method lost its receiver when it was extracted into `run`. Because class bodies are strict mode, `this` becomes `undefined` in `run()`. The fix is to bind the method or wrap the call so it runs with `reporter` as the receiver.

Example:

```js
const run = reporter.log.bind(reporter);
```', 'hard', 'approved', 'be4044de-f1b0-408e-b19f-704a6176d19a', 136, '2026-04-01T23:14:21.712Z', '2026-04-01T23:14:21.712Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('af224f80-4b4c-49b7-86f6-05c47b617faa', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Scenario: A config object inherits defaults, but a loop starts seeing extra keys.

```js
const defaults = { retry: 3 };
const options = Object.create(defaults);
options.timeout = 1000;

for (const key in options) {
  console.log(key);
}
```

The team wants to iterate only the object''s own keys. Which change most directly guarantees that?', '`for..in` includes enumerable inherited properties, so `retry` can appear. Switching to `Object.keys(options)` guarantees that the loop sees only own enumerable keys on `options`.

Example:

```js
for (const key of Object.keys(options)) {
  console.log(key);
}
```', 'medium', 'approved', 'be4044de-f1b0-408e-b19f-704a6176d19a', 137, '2026-04-01T23:14:21.713Z', '2026-04-01T23:14:21.713Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7e64fd3c-ea3f-45fb-8064-cae4a220c5a6', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Scenario: A derived class constructor crashes at runtime.

```js
class Service {
  constructor() {
    this.ready = false;
  }
}

class ApiService extends Service {
  constructor() {
    this.ready = true;
    super();
  }
}
```

Why does it fail?', 'In a derived class, `super()` must run before `this` can be used. Until the parent constructor has initialized the base instance, accessing `this` is illegal.

Example:

```js
class ApiService extends Service {
  constructor() {
    super();
    this.ready = true;
  }
}
```', 'medium', 'approved', 'be4044de-f1b0-408e-b19f-704a6176d19a', 138, '2026-04-01T23:14:21.715Z', '2026-04-01T23:14:21.715Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ead3cd6c-748a-48ef-a985-43243cea3697', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Scenario: One instance starts behaving differently after a quick hotfix.

```js
class User {
  role() {
    return "member";
  }
}

const a = new User();
const b = new User();

a.role = function () {
  return "admin";
};
```

Why does `a.role()` now return `"admin"` while `b.role()` still returns `"member"`?', 'The assignment creates an own `role` property on `a`, which shadows the shared method on `User.prototype`. `b` still uses the original prototype method because only `a` was patched.

Example:

```js
console.log(Object.hasOwn(a, "role")); // true
console.log(Object.hasOwn(b, "role")); // false
```', 'hard', 'approved', 'be4044de-f1b0-408e-b19f-704a6176d19a', 139, '2026-04-01T23:14:21.716Z', '2026-04-01T23:14:21.716Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('6a376018-08a2-4841-810c-e71fd3325a71', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the output order for this code?

```js
setTimeout(() => console.log("timeout"), 0);
Promise.resolve().then(() => console.log("promise"));
console.log("code");
```', '`console.log("code")` runs synchronously in the current task. The promise handler is a microtask, so it runs immediately after the current task finishes. The timeout callback is a macrotask, so it runs only after the microtask queue has been drained.', 'easy', 'approved', '4cbb3688-abcc-49fd-93ba-13af1350e6a3', 140, '2026-04-02T05:39:17.710Z', '2026-04-02T05:39:17.710Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d3867f33-54bc-4747-a8d5-0751c589d03c', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A loop updates the DOM thousands of times inside one long-running function. Why does the user usually see only the final state after the function returns?', 'The article states that rendering never happens while the engine is executing a task. DOM mutations can accumulate, but painting waits until the current task finishes.', 'easy', 'approved', '4cbb3688-abcc-49fd-93ba-13af1350e6a3', 141, '2026-04-02T05:39:17.766Z', '2026-04-02T05:39:17.766Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2f515df8-d3e6-476a-a4c2-efaecd231157', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'According to the article''s syntax-highlighting example, what is the recommended way to keep the browser responsive during a CPU-heavy job on the main thread?', 'The article recommends splitting large work into smaller chunks and scheduling the next chunk with `setTimeout()`. That yields back to the event loop between chunks so the browser can handle input and painting.', 'medium', 'approved', '4cbb3688-abcc-49fd-93ba-13af1350e6a3', 142, '2026-04-02T05:39:17.780Z', '2026-04-02T05:39:17.780Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9d67d61f-f61f-41b6-9fab-849144123d85', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why does the article move the next `setTimeout(count)` call to the beginning of `count()` instead of leaving it at the end?', 'Browsers apply a minimum delay to many nested timeouts, commonly around 4 ms. Scheduling the next timeout earlier lets that delay start counting sooner, reducing the total completion time of the chunked algorithm.', 'hard', 'approved', '4cbb3688-abcc-49fd-93ba-13af1350e6a3', 143, '2026-04-02T05:39:17.784Z', '2026-04-02T05:39:17.784Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('47a19268-54ac-416f-b660-9069c4e5317c', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A developer wants a visible progress counter while processing a large dataset in the browser. Which design from the article makes the progress indicator visibly advance?', 'The progress indicator becomes visible only when work is split across separate tasks, because the browser can paint between task boundaries. A single synchronous loop prevents intermediate rendering.', 'medium', 'approved', '4cbb3688-abcc-49fd-93ba-13af1350e6a3', 144, '2026-04-02T05:39:17.794Z', '2026-04-02T05:39:17.794Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('75d1975c-cac5-4a09-bd2b-81638a020edf', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Inside a click handler, you want to dispatch a custom event only after the click event has fully bubbled through the DOM. What does the article recommend?', 'Wrapping the custom event dispatch in `setTimeout(..., 0)` postpones it to a later task, so the current click event finishes bubbling and all current handlers complete first.', 'medium', 'approved', '4cbb3688-abcc-49fd-93ba-13af1350e6a3', 145, '2026-04-02T05:39:17.802Z', '2026-04-02T05:39:17.802Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('766d6dd4-3d42-43a6-bdac-8cc2c128f9fd', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which statement best describes `queueMicrotask()` in the article''s event loop model?', 'A microtask scheduled with `queueMicrotask()` runs after the current macrotask finishes but before rendering and before the next macrotask begins. That is why it is useful for asynchronous work that still needs the same environment state.', 'medium', 'approved', '4cbb3688-abcc-49fd-93ba-13af1350e6a3', 146, '2026-04-02T05:39:17.808Z', '2026-04-02T05:39:17.808Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('471bdf1e-1f74-4e7d-92c1-ff929e4c0633', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A developer swaps `setTimeout(count)` for `queueMicrotask(count)` in the progress-bar example and expects smoother rendering. What actually happens?', 'The microtask queue is drained before rendering, so repeatedly enqueueing microtasks keeps execution in the same turn of the event loop. The DOM updates still do not paint progressively, so the interface remains visually blocked.', 'hard', 'approved', '4cbb3688-abcc-49fd-93ba-13af1350e6a3', 147, '2026-04-02T05:39:17.811Z', '2026-04-02T05:39:17.811Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('bfbed5f5-9f31-43c5-9f9c-f81eb1ae1cef', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What browser symptom most strongly indicates that one task is monopolizing the event loop for too long?', 'The article explicitly notes that when a task takes too long, the browser may show a warning such as `Page Unresponsive` because it cannot process user events or other work.', 'easy', 'approved', '4cbb3688-abcc-49fd-93ba-13af1350e6a3', 148, '2026-04-02T05:39:17.815Z', '2026-04-02T05:39:17.815Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('13305be7-ed95-4689-b01f-4c82d5985ab7', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'When is a Web Worker the better tool than chunking work with `setTimeout()` on the main thread?', 'The article points to Web Workers for long, heavy calculations that should not block the main event loop. Workers run in another thread, have their own variables and event loop, and cannot access the DOM directly.', 'medium', 'approved', '4cbb3688-abcc-49fd-93ba-13af1350e6a3', 149, '2026-04-02T05:39:17.818Z', '2026-04-02T05:39:17.818Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3164c739-cf82-40e2-9d5c-eebf3a94b4c6', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'In MDN''s execution model, which part is responsible for providing APIs such as the HTML DOM or Node.js capabilities?', 'MDN distinguishes the JavaScript engine from the host environment. The engine executes ECMAScript itself, while the host supplies environment-specific APIs such as the DOM in browsers or server APIs in Node.js.', 'easy', 'approved', '24f7131c-002d-4cbb-a3f7-daf2f18c2e67', 150, '2026-04-02T05:39:22.180Z', '2026-04-02T05:39:22.180Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f23f6e9b-ab5e-4908-ad78-c7dfedd88f6d', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which combination correctly describes the three core facilities an agent maintains for JavaScript execution?', 'MDN describes an agent as maintaining a heap of objects, a queue of jobs, and a stack of execution contexts. These structures serve different purposes: memory, scheduling, and active execution.', 'easy', 'approved', '24f7131c-002d-4cbb-a3f7-daf2f18c2e67', 151, '2026-04-02T05:39:22.183Z', '2026-04-02T05:39:22.183Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4e4306e4-0c7f-48f1-a908-bd8bbf7f2f48', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why does this code reliably log `1` and then `2` instead of exhibiting a race condition?

```js
const promise = Promise.resolve();
let i = 0;
promise.then(() => {
  i += 1;
  console.log(i);
});
promise.then(() => {
  i += 1;
  console.log(i);
});
```', 'MDN''s `run-to-completion` rule says each job runs fully before the next job starts. Even though both handlers are scheduled quickly, one callback completes before the other begins, so the updates are deterministic.', 'medium', 'approved', '24f7131c-002d-4cbb-a3f7-daf2f18c2e67', 152, '2026-04-02T05:39:22.185Z', '2026-04-02T05:39:22.185Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('745d7b43-ed17-4a8f-8bec-7cfb4a7aba6e', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'According to MDN, when is a job considered complete so that the next job can be pulled from the queue?', 'MDN states that a job is considered completed when the stack is empty. Only then can the event loop move on to another queued job.', 'easy', 'approved', '24f7131c-002d-4cbb-a3f7-daf2f18c2e67', 153, '2026-04-02T05:39:22.187Z', '2026-04-02T05:39:22.187Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('09cf0cca-139f-4efd-8a18-8fabf0c9af3b', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'In HTML event loops as summarized by MDN, which queued work has higher priority?', 'MDN notes that HTML event loops divide jobs into tasks and microtasks, and that the microtask queue is drained before the task queue is pulled again.', 'medium', 'approved', '24f7131c-002d-4cbb-a3f7-daf2f18c2e67', 154, '2026-04-02T05:39:22.190Z', '2026-04-02T05:39:22.190Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a6a3c75c-97a9-4b44-90fc-83f85d1b3200', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which statement about agents on the web matches MDN''s execution model?', 'MDN explains that each worker creates its own agent, while one or more windows may belong to the same agent. This is important because not every browsing context gets an entirely separate executor.', 'medium', 'approved', '24f7131c-002d-4cbb-a3f7-daf2f18c2e67', 155, '2026-04-02T05:39:22.192Z', '2026-04-02T05:39:22.192Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8e02fdfb-b5e6-4883-916e-158580b51688', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why can `instanceof Array` return `false` for an array created in another realm, even though `Array.isArray()` returns `true`?', 'MDN explains that each realm has its own intrinsic objects, including its own `Array.prototype`. An array from another realm does not inherit from the current realm''s `Array.prototype`, so `instanceof Array` can fail.', 'hard', 'approved', '24f7131c-002d-4cbb-a3f7-daf2f18c2e67', 156, '2026-04-02T05:39:22.194Z', '2026-04-02T05:39:22.194Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('251b1006-226c-44be-b2f9-80a4ad33a8b2', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'While a same-agent `fetch()` is still waiting on the network, what does MDN say about the JavaScript execution model?', 'The model is designed to be non-blocking for normal asynchronous APIs. While the network request is in flight, the agent can still process other work; the completion logic is added later as a callback job.', 'medium', 'approved', '24f7131c-002d-4cbb-a3f7-daf2f18c2e67', 157, '2026-04-02T05:39:22.195Z', '2026-04-02T05:39:22.195Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c2407a01-f00d-47eb-b6ec-65c2d2233bda', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which APIs does MDN call out as notable legacy exceptions to the usual ''never-blocking'' guidance?', 'MDN explicitly calls out `alert()` and synchronous XHR as legacy cases that block and are best avoided.', 'easy', 'approved', '24f7131c-002d-4cbb-a3f7-daf2f18c2e67', 158, '2026-04-02T05:39:22.197Z', '2026-04-02T05:39:22.197Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3a51c27a-697c-4b59-b7c4-e200fa861542', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which pair is described by MDN as being able to share memory because they are in the same agent cluster?', 'MDN lists a `Window` object and a dedicated worker that it created as being in the same agent cluster, which means they can share memory via `SharedArrayBuffer` if the platform permits it. A shared worker created by a window is listed separately as not being in the same cluster.', 'hard', 'approved', '24f7131c-002d-4cbb-a3f7-daf2f18c2e67', 159, '2026-04-02T05:39:22.198Z', '2026-04-02T05:39:22.198Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('bb10af0f-72d6-421d-9114-2f00fcdcbb68', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'After a task finishes running, what does the microtask guide say happens before the browser moves to the next task?', 'The guide says the event loop executes microtasks until the microtask queue is empty before proceeding to the next task. Rendering may then occur before the next iteration continues.', 'easy', 'approved', '38c5a972-7bf2-4124-bc91-5b35d1151d53', 160, '2026-04-02T05:39:25.845Z', '2026-04-02T05:39:25.845Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('5325e50e-48ae-495e-84d6-e40a35ee592b', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'If a running microtask enqueues another microtask with `queueMicrotask()`, when does the newly added microtask run?', 'The guide emphasizes that the event loop keeps processing microtasks until the queue is empty. New microtasks added during that drain run before the next task starts.', 'medium', 'approved', '38c5a972-7bf2-4124-bc91-5b35d1151d53', 161, '2026-04-02T05:39:25.850Z', '2026-04-02T05:39:25.850Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a150cc05-2682-4c7c-84a8-539554e39dc4', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the main risk of recursively enqueueing microtasks without a stopping condition?', 'Because the event loop keeps running microtasks until the queue is empty, recursive microtask scheduling can keep the loop busy indefinitely and starve later tasks such as timers, user input, or rendering.', 'medium', 'approved', '38c5a972-7bf2-4124-bc91-5b35d1151d53', 162, '2026-04-02T05:39:25.852Z', '2026-04-02T05:39:25.852Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('229d412b-c821-44f6-b404-d00fa086a77c', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why does the guide recommend `queueMicrotask()` over using an already-resolved promise as a microtask hack in framework or library code?', '`queueMicrotask()` avoids the quirks of using promises as a scheduling trick. Thrown errors are reported as standard exceptions instead of rejected promises, and it avoids the extra time and memory overhead of creating and destroying promises.', 'hard', 'approved', '38c5a972-7bf2-4124-bc91-5b35d1151d53', 163, '2026-04-02T05:39:25.853Z', '2026-04-02T05:39:25.853Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8d261aaa-0e11-4659-a6aa-112d3898815a', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'On which global execution contexts does the guide say `queueMicrotask()` is exposed?', 'The method is exposed on the global context through `Window` in browser windows and `WorkerGlobalScope` in workers. The guide frames it as available on the current global context for that environment.', 'easy', 'approved', '38c5a972-7bf2-4124-bc91-5b35d1151d53', 164, '2026-04-02T05:39:25.855Z', '2026-04-02T05:39:25.855Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('46dae36a-3160-4bc3-a1f6-d57ac05927e5', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A custom element dispatches `load` synchronously on a cache hit, but asynchronously through promise handlers on a cache miss. What fix does the guide recommend to keep ordering consistent?', 'The guide''s solution is to wrap the cache-hit path in `queueMicrotask()`. That way both branches finish their `load` dispatch work in microtasks, making the timing consistent whether data was cached or fetched.', 'hard', 'approved', '38c5a972-7bf2-4124-bc91-5b35d1151d53', 165, '2026-04-02T05:39:25.856Z', '2026-04-02T05:39:25.856Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('55d2d7a0-ad61-4fa0-b75b-09d001274304', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why does the batching example schedule a microtask only when `messageQueue.length === 1`?', 'The first message schedules one microtask that will flush the whole batch at the end of the current turn. Later messages in the same turn only append data; they do not schedule duplicate flush operations.', 'medium', 'approved', '38c5a972-7bf2-4124-bc91-5b35d1151d53', 166, '2026-04-02T05:39:25.857Z', '2026-04-02T05:39:25.857Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d280501d-6404-45ae-ba4f-a7355bfa8fd8', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the output order for this code?

```js
const callback = () => console.log("timeout");
const urgentCallback = () => console.log("microtask");

console.log("start");
setTimeout(callback, 0);
queueMicrotask(urgentCallback);
console.log("end");
```', 'The main script runs first, so `start` and `end` log synchronously. Once that task finishes, the microtask queue is drained, so `microtask` appears next. The timeout callback is a separate task and runs afterward.', 'medium', 'approved', '38c5a972-7bf2-4124-bc91-5b35d1151d53', 167, '2026-04-02T05:39:25.859Z', '2026-04-02T05:39:25.859Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('648385b3-4281-42c4-a344-442f3dd2ff9d', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A function calls `queueMicrotask()` and then returns, but the surrounding top-level script still has more synchronous statements to run. When does the microtask execute?', 'The guide states that the microtask does not run just because the function returned. It runs when the current top-level task exits and the execution stack is empty.', 'hard', 'approved', '38c5a972-7bf2-4124-bc91-5b35d1151d53', 168, '2026-04-02T05:39:25.860Z', '2026-04-02T05:39:25.860Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('67b6298c-b9f1-4104-9d66-056eb98e6c1b', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which two mechanisms does the guide explicitly say use the microtask queue for their callbacks?', 'The guide explicitly names JavaScript promises and the Mutation Observer API as using the microtask queue.', 'easy', 'approved', '38c5a972-7bf2-4124-bc91-5b35d1151d53', 169, '2026-04-02T05:39:25.861Z', '2026-04-02T05:39:25.861Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0e87c4cd-1db8-478f-9823-844369e78b58', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the output order for this code?

```js
console.log("A");
setTimeout(() => console.log("B"), 0);
queueMicrotask(() => {
  console.log("C");
  Promise.resolve().then(() => console.log("D"));
});
Promise.resolve().then(() => {
  console.log("E");
  setTimeout(() => console.log("F"), 0);
});
console.log("G");
```', 'The synchronous part logs `A` then `G`. At the microtask checkpoint, the queued microtasks run FIFO: the explicit `queueMicrotask()` callback logs `C` and enqueues `D`, then the promise handler logs `E` and schedules timeout `F`, then the newly queued promise microtask logs `D`. Only after the microtask queue is empty do tasks run, so `B` precedes `F` because it was scheduled first.

Example:

```text
A -> G -> C -> E -> D -> B -> F
```', 'hard', 'approved', '17f9e935-e139-4bf7-9174-7139b6723c64', 170, '2026-04-02T05:39:29.569Z', '2026-04-02T05:39:29.569Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('29d7bae7-0514-4115-969e-d026d7400c16', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Consider this code:

```js
setTimeout(() => console.log("timeout"), 0);
function spin() {
  queueMicrotask(spin);
}
spin();
console.log("scheduled");
```

What is the most accurate description of what happens next?', 'The script logs `scheduled` before the microtask checkpoint. Then the first queued microtask runs, schedules another microtask, and the queue never becomes empty. Because the event loop keeps draining microtasks before moving to the next task, the timeout can be starved indefinitely and the page can become unresponsive.', 'hard', 'approved', '17f9e935-e139-4bf7-9174-7139b6723c64', 171, '2026-04-02T05:39:29.571Z', '2026-04-02T05:39:29.571Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4864b33e-93b4-4e77-b190-a608b11677d5', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A component dispatches `load` synchronously on a cache hit but uses `fetch(...).then(...).then(...)` on a cache miss. Which change best preserves a consistent observable order for callers?', 'The cache-hit branch should enqueue its state update and `load` dispatch with `queueMicrotask()`. That aligns the synchronous branch with the promise-based branch, which also completes through microtasks, so listeners see consistent order regardless of the data source.', 'hard', 'approved', '17f9e935-e139-4bf7-9174-7139b6723c64', 172, '2026-04-02T05:39:29.575Z', '2026-04-02T05:39:29.575Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1af5370e-b602-4c42-b8b6-d755d5bc368d', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A team moves expensive JSON parsing into a dedicated worker and sends the results back to the main thread with `postMessage()`. Which statement is correct?', 'A dedicated worker has its own agent and event loop, so the main thread can remain responsive while the parsing happens in parallel. The worker cannot directly access the DOM, so UI updates still have to happen on the main thread when messages arrive.', 'hard', 'approved', '17f9e935-e139-4bf7-9174-7139b6723c64', 173, '2026-04-02T05:39:29.578Z', '2026-04-02T05:39:29.578Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4c79a373-e600-46a5-80bc-94df6edb5218', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A developer replaces `setTimeout(count, 0)` with `queueMicrotask(count)` in a chunked progress-bar implementation, expecting smoother UI updates. What is the most likely result?', 'The progress bar will still fail to paint incrementally because the browser drains microtasks before rendering. Task chunking creates render opportunities; microtask chunking keeps execution inside the same turn until the microtask queue empties.', 'hard', 'approved', '17f9e935-e139-4bf7-9174-7139b6723c64', 174, '2026-04-02T05:39:29.581Z', '2026-04-02T05:39:29.581Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('20aece8a-54ca-49a6-af66-c6d427a04ca0', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which statement best captures the difference in error behavior between these two scheduling techniques?

```js
Promise.resolve().then(() => {
  throw new Error("from promise");
});

queueMicrotask(() => {
  throw new Error("from microtask");
});
```', 'MDN notes that promise-based microtask hacks report thrown errors as rejected promises, whereas `queueMicrotask()` reports them as standard exceptions. That is one reason `queueMicrotask()` is preferred when the goal is scheduling rather than promise composition.', 'hard', 'approved', '17f9e935-e139-4bf7-9174-7139b6723c64', 175, '2026-04-02T05:39:29.583Z', '2026-04-02T05:39:29.583Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('735b0fb1-f865-491d-8098-18881f4bd375', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the output order for this code?

```js
function schedule() {
  queueMicrotask(() => console.log("micro"));
  console.log("inside");
}

console.log("before");
schedule();
Promise.resolve().then(() => console.log("promise"));
console.log("after");
```', 'The synchronous logs happen first: `before`, `inside`, `after`. The microtask scheduled inside `schedule()` does not run when the function returns; it waits until the current task ends. Because it was enqueued before the promise reaction, it runs first at the microtask checkpoint.

Example:

```text
before -> inside -> after -> micro -> promise
```', 'hard', 'approved', '17f9e935-e139-4bf7-9174-7139b6723c64', 176, '2026-04-02T05:39:29.585Z', '2026-04-02T05:39:29.585Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3c6d117c-5d52-4651-9a60-5afb60110f42', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'If a same-origin parent window and its child iframe happen to share the same event loop, what is the safest conclusion for performance debugging?', 'When two browsing contexts share an event loop, their tasks take turns on the same executor. That means a long task in one can delay the other''s event processing and responsiveness, even though they are distinct realms.', 'hard', 'approved', '17f9e935-e139-4bf7-9174-7139b6723c64', 177, '2026-04-02T05:39:29.587Z', '2026-04-02T05:39:29.587Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('cc9ec24c-32b4-4891-a7a1-39f5d1fceb53', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why can moving `setTimeout(count, 0)` to the beginning of each chunk reduce total completion time without giving up responsiveness?', 'The browser may apply a minimum delay to nested timeouts. Scheduling the next timeout earlier lets that delay count down while the current chunk does work, so the next task becomes runnable sooner while still yielding between chunks.', 'hard', 'approved', '17f9e935-e139-4bf7-9174-7139b6723c64', 178, '2026-04-02T05:39:29.588Z', '2026-04-02T05:39:29.588Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('35d6f278-0f63-49bf-8d43-ee38907d2986', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A reviewer claims that two `.then()` handlers attached to an already-resolved promise might interleave at statement granularity and both log `2`. Which response is correct in the same agent?', 'That claim is incorrect for same-agent execution. Promise reactions are queued jobs, and each job runs to completion before the next one begins, so one handler will finish all of its statements before the second starts.

Example:

```js
const p = Promise.resolve();
let i = 0;
p.then(() => { i += 1; console.log(i); });
p.then(() => { i += 1; console.log(i); });
```

This deterministically logs `1` and then `2`.', 'hard', 'approved', '17f9e935-e139-4bf7-9174-7139b6723c64', 179, '2026-04-02T05:39:29.590Z', '2026-04-02T05:39:29.590Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2c515690-0512-4c07-8380-9fda23f35ae1', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A browser-based code editor freezes for seconds while tokenizing a very large file. The tokenization algorithm does not need direct DOM access until the final painted result is ready. Which redesign is the strongest choice?', 'A dedicated worker is the strongest redesign here because the heavy computation does not need direct DOM access. Workers have their own event loop and keep the main thread free for input, layout, and painting; the main thread can apply the final rendered result when the worker posts it back.', 'hard', 'approved', '1e129f0c-0a19-4961-af1f-afa965653a62', 180, '2026-04-02T05:39:34.114Z', '2026-04-02T05:39:34.114Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8113fa86-300e-4c2b-862a-781e2baf12c4', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A custom element fetches remote data on a cache miss but returns cached data immediately on a cache hit. Test failures show that `load` listeners fire in different relative positions depending on whether the data was cached. What is the best fix?', 'The cache-hit path should use `queueMicrotask()` to defer the state update and `load` dispatch into the microtask queue. That balances the synchronous branch with the promise-based branch so listeners observe the same timing model in both cases.', 'hard', 'approved', '1e129f0c-0a19-4961-af1f-afa965653a62', 181, '2026-04-02T05:39:34.117Z', '2026-04-02T05:39:34.117Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e52cf343-330e-4689-957d-e7c9ba703fb4', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'An analytics SDK receives several `track()` calls during one click handler and wants to send one batched network request before later timeout callbacks run. Which implementation best fits the sources?', 'Queue each message into an array and, only when the first message arrives in that turn, schedule a single microtask to flush the batch. That lets all additional `track()` calls in the same turn join the batch before later tasks like timeouts are processed.', 'hard', 'approved', '1e129f0c-0a19-4961-af1f-afa965653a62', 182, '2026-04-02T05:39:34.119Z', '2026-04-02T05:39:34.119Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d28bf1aa-6c17-4ae4-8a88-43b7c25d847c', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A team splits a long-running main-thread calculation into recursive `queueMicrotask()` calls and updates a DOM progress bar inside each chunk. Users report that the page still looks frozen until the very end. What is the best explanation and fix?', 'The page still looks frozen because microtasks are drained before rendering, so the browser does not get a paint opportunity between chunks. If the work must remain on the main thread and the UI must visibly progress, the chunks should be scheduled as tasks with `setTimeout()` instead of microtasks.', 'hard', 'approved', '1e129f0c-0a19-4961-af1f-afa965653a62', 183, '2026-04-02T05:39:34.122Z', '2026-04-02T05:39:34.122Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b6f999ea-d7c7-462e-935e-f8f54a3aedd4', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A menu component must emit a custom `menu-open` event only after the current click event has fully bubbled and all current click handlers have finished. Which implementation is most appropriate?', 'Scheduling the custom dispatch with zero-delay `setTimeout()` moves it into a later task. That guarantees the current click event finishes bubbling and all current handlers complete before `menu-open` is dispatched.', 'medium', 'approved', '1e129f0c-0a19-4961-af1f-afa965653a62', 184, '2026-04-02T05:39:34.125Z', '2026-04-02T05:39:34.125Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7a18f20a-4fff-4d8e-b95d-ea405bdaf84d', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What does this code log?

```js
const ul = document.querySelector(''ul'');
const fragment = new DocumentFragment();
fragment.append(document.createElement(''li''));
fragment.append(document.createElement(''li''));
ul.append(fragment);

console.log(fragment.childElementCount);
```', 'Appending the fragment moves its children into the live DOM and leaves the fragment empty, so `childElementCount` becomes `0`.

Example:

```js
const fragment = new DocumentFragment();
fragment.append(nodeA, nodeB);
parent.append(fragment);
// fragment is now empty
```', 'hard', 'approved', '366e48c2-7810-4d8e-8669-6354a7bcf60a', 185, '2026-04-02T06:21:57.320Z', '2026-04-02T06:21:57.320Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('26e50187-d1b4-4770-8188-a7e73b147265', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which statement best matches MDN''s description of `DocumentFragment`?', 'MDN describes `DocumentFragment` as a minimal document object with no parent that is not part of the active document tree. That is why you can stage DOM subtrees inside it without directly affecting the live document until insertion.', 'medium', 'approved', '366e48c2-7810-4d8e-8669-6354a7bcf60a', 186, '2026-04-02T06:21:57.324Z', '2026-04-02T06:21:57.324Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b9853b71-981c-4e6a-86dc-d406e56f356f', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which lookup capability is explicitly available on `DocumentFragment` according to MDN?', 'MDN lists `querySelector()`, `querySelectorAll()`, and `getElementById()` on `DocumentFragment`, which means you can inspect the staged subtree before inserting it into the live document.', 'medium', 'approved', '366e48c2-7810-4d8e-8669-6354a7bcf60a', 187, '2026-04-02T06:21:57.326Z', '2026-04-02T06:21:57.326Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0482d1ae-44b9-46c4-ab65-27669dd3f95e', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which statement is most consistent with MDN''s performance guidance for `DocumentFragment`?', 'MDN explicitly says the performance benefit is often overstated and sometimes marginal or even slower in certain engines. The guidance is to optimize for readability rather than assume automatic speedups.

Example:

```js
const fragment = new DocumentFragment();
// clear intent: stage a subtree, then append once
```', 'hard', 'approved', '366e48c2-7810-4d8e-8669-6354a7bcf60a', 188, '2026-04-02T06:21:57.327Z', '2026-04-02T06:21:57.327Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('e98fe5f7-a8f4-4fe7-aa63-117a1d7d9adb', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'How does the `<template>` element relate to `DocumentFragment` according to MDN?', 'MDN notes that `<template>` elements contain a `DocumentFragment` in `HTMLTemplateElement.content`, which makes them useful for storing reusable DOM subtrees until they are cloned or inserted.', 'medium', 'approved', '366e48c2-7810-4d8e-8669-6354a7bcf60a', 189, '2026-04-02T06:21:57.330Z', '2026-04-02T06:21:57.330Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4612c814-0941-4536-aae5-f2b0cdb80464', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'You need to add 1,000 new `<li>` elements to an existing `<ul>`. According to the source, which refactor most directly reduces repeated reflows?', 'Using `DocumentFragment` lets you build the subtree off the live DOM and append it once, so the live document is updated once instead of on every iteration.

Example:

```js
const fragment = document.createDocumentFragment();
for (let i = 0; i < 1000; i++) {
  const li = document.createElement(''li'');
  li.textContent = `Item ${i}`;
  fragment.appendChild(li);
}
container.appendChild(fragment);
```', 'medium', 'approved', '15798bba-96b1-47d7-801d-e25dfa772522', 190, '2026-04-02T06:22:01.031Z', '2026-04-02T06:22:01.031Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('be98fb44-17c4-47ab-808b-781c0373b9c1', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A parent element is already cached in a variable. Which descendant lookup best matches the source''s recommendation?

```js
const parentElement = document.getElementById(''parent'');
// choose the preferred lookup for #child
```', 'Once the parent is already cached, querying within that subtree narrows the search scope and avoids searching the full document unnecessarily. The article also notes that `getElementById` is not the method you use on the parent for this case.

Example:

```js
const child = parentElement.querySelector(''#child'');
```', 'medium', 'approved', '15798bba-96b1-47d7-801d-e25dfa772522', 191, '2026-04-02T06:22:01.034Z', '2026-04-02T06:22:01.034Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('92dd6ec9-8c96-4db2-8a16-ec801e89036e', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'You receive user-generated text from a form and need to render it into the page. Which approach aligns best with the source''s guidance?', 'The source warns that `innerHTML` parses markup and can execute script content from untrusted input. When you only need plain text, prefer `textContent` or `innerText`. If markup is required, sanitize and validate first.

Example:

```js
messageElement.textContent = userInput;
```', 'hard', 'approved', '15798bba-96b1-47d7-801d-e25dfa772522', 192, '2026-04-02T06:22:01.036Z', '2026-04-02T06:22:01.036Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ea1ad680-b89f-4921-911e-ed83b51c63fa', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A dashboard renders many action buttons dynamically inside one container. Which event-handling strategy best fits the source''s recommendation for performance and maintainability?', 'Event delegation attaches a single listener to a parent element and handles descendant interactions through the event object. That reduces the number of listeners and works well when content changes dynamically.

Example:

```js
parentElement.addEventListener(''click'', handleClick);
```', 'medium', 'approved', '15798bba-96b1-47d7-801d-e25dfa772522', 193, '2026-04-02T06:22:01.039Z', '2026-04-02T06:22:01.039Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1d675516-f42e-47ba-a9c6-3c797af989f5', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Your script tag runs before the DOM nodes it needs to modify have been parsed. What does the source recommend?', 'The source recommends waiting for `DOMContentLoaded` so DOM-manipulation code runs after the HTML document has loaded, preventing failures from selecting elements that do not exist yet.

Example:

```js
document.addEventListener(''DOMContentLoaded'', () => {
  // DOM code here
});
```', 'easy', 'approved', '15798bba-96b1-47d7-801d-e25dfa772522', 194, '2026-04-02T06:22:01.041Z', '2026-04-02T06:22:01.041Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('b107fcd3-f7cb-48d9-b271-b753283b34db', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A search UI rebuilds 300 suggestion rows on every keystroke. The current code appends each row directly to the live list and attaches an individual click listener to every suggestion after each render. Which refactor is the strongest improvement from the combined source guidance?', 'The strongest root-cause fix is to build the rows in a `DocumentFragment`, append once, and use a single delegated click listener on the list container. That reduces unnecessary live-DOM churn and avoids reattaching many equivalent listeners on every render.', 'hard', 'approved', '325540e0-c771-4d9c-a826-dbe27993c631', 195, '2026-04-02T06:22:41.751Z', '2026-04-02T06:22:41.751Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('a997ab73-774a-4e8f-98c6-f6a2e143c6eb', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A delegated list handler checks `event.target.tagName === ''BUTTON''`. It works until designers wrap button labels in `<span>` icons, after which some clicks stop triggering the action. What is the best fix?', 'Once nested markup exists, the clicked target may be the child `span` rather than the button. The robust fix is to walk up from the real target with `closest(''button'')` and guard for `null`.

Example:

```js
const button = event.target.closest(''button'');
if (!button) return;
```', 'hard', 'approved', '325540e0-c771-4d9c-a826-dbe27993c631', 196, '2026-04-02T06:22:41.753Z', '2026-04-02T06:22:41.753Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('96e11837-9d09-4984-94c4-4644d2090744', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A parent container has an analytics listener, but a child button handler now calls `event.stopPropagation()`. Product requires analytics to observe the click even when the child action blocks bubbling to other ancestors. Which change best satisfies that requirement?', 'If the analytics listener is attached during the capturing phase, it runs before the button''s bubbling-phase handler calls `stopPropagation()`. That preserves the analytics observation without forcing the child handler to stop using propagation control for its own logic.', 'hard', 'approved', '325540e0-c771-4d9c-a826-dbe27993c631', 197, '2026-04-02T06:22:41.758Z', '2026-04-02T06:22:41.758Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('354ef4d4-24ab-4495-8f2b-c1c6487201d3', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A note-taking app saves drafts with `localStorage.setItem(''draft'', value)`. The developer relies on `window.addEventListener(''storage'', ...)` in the same tab to refresh the preview after each save, but the preview does not update. What is the best fix?', 'The same tab does not receive a `storage` event for its own write. The correct design is to update the current tab''s preview immediately after `setItem`, and keep the `storage` listener only for synchronizing other same-origin tabs.

Example:

```js
localStorage.setItem(''draft'', value);
renderPreview(value);
```', 'hard', 'approved', '325540e0-c771-4d9c-a826-dbe27993c631', 198, '2026-04-02T06:22:41.763Z', '2026-04-02T06:22:41.763Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7e602eb5-b66b-4724-8922-a38804406912', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A team prototypes an app by opening `index.html` directly from disk with a `file:` URL. `localStorage` seems to behave differently across browsers, and sometimes separate files do not share the data they expect. Which root-cause fix best matches the sources?', 'MDN says `file:` URL behavior for `localStorage` is undefined and browser-dependent, so the app should not rely on it. The robust fix is to serve the app from a proper local HTTP origin during development, which gives predictable same-origin storage semantics.', 'hard', 'approved', '325540e0-c771-4d9c-a826-dbe27993c631', 199, '2026-04-02T06:22:41.765Z', '2026-04-02T06:22:41.765Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('fba18c3a-ce70-4369-843a-023c65123c81', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What does this code log?

```js
const ul = document.querySelector(''ul'');
const fragment = new DocumentFragment();

for (const label of [''A'', ''B'']) {
  const li = document.createElement(''li'');
  li.textContent = label;
  fragment.append(li);
}

ul.append(fragment);
console.log(fragment.childElementCount, ul.children.length);
```', '`DocumentFragment` is not part of the active tree, and appending it moves its children into the real DOM. After insertion the fragment is empty, while `ul.children` now contains the inserted elements.

Example:

```js
parent.append(fragment);
// fragment is empty now
```', 'hard', 'approved', '40e2e7db-c37d-4cbf-ab4f-18d2e88acadf', 200, '2026-04-02T06:22:45.442Z', '2026-04-02T06:22:45.442Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('66aa9b6d-5e3f-470e-9f46-e28ff1fa3633', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A delegated handler is attached to a parent element: 

```js
parent.addEventListener(''click'', (event) => {
  if (event.target.tagName === ''BUTTON'') {
    console.log(''run'');
  }
});
```

The markup is `<button><span>Save</span></button>`, and the user clicks the `span`. What is the most accurate outcome?', '`event.target` is the actual clicked element. If the user clicks the nested `span`, `tagName` is `SPAN`, so the condition fails. The robust fix is to use traversal from the clicked node, such as `event.target.closest(''button'')`.

Example:

```js
const button = event.target.closest(''button'');
if (button) {
  console.log(''run'');
}
```', 'hard', 'approved', '40e2e7db-c37d-4cbf-ab4f-18d2e88acadf', 201, '2026-04-02T06:22:45.446Z', '2026-04-02T06:22:45.446Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('12b0f6c9-aa72-4452-a2ce-617b8b176e8c', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Consider this listener setup:

```js
outer.addEventListener(''click'', () => console.log(''outer''), true);
inner.addEventListener(''click'', () => console.log(''inner''));
button.addEventListener(''click'', () => console.log(''button''));
```

When the button is clicked, what order is logged?', 'The outer listener runs in the capturing phase because of the third argument `true`. The button listener then runs at the target, and the inner listener runs later during bubbling. So the order is outer, button, inner.', 'hard', 'approved', '40e2e7db-c37d-4cbf-ab4f-18d2e88acadf', 202, '2026-04-02T06:22:45.448Z', '2026-04-02T06:22:45.448Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('829c7c2e-b1bc-41da-b7d5-3a7af4acb43b', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Now consider this variation:

```js
outer.addEventListener(''click'', () => console.log(''outer''), true);
inner.addEventListener(''click'', () => console.log(''inner''));
button.addEventListener(''click'', (event) => {
  event.stopPropagation();
  console.log(''button'');
});
```

When the button is clicked, what is logged?', 'The capture listener on `outer` runs before the event reaches the target. Then the button handler runs and stops further propagation. That prevents the bubbling listener on `inner` from running, but it cannot undo the already-executed capture handler on `outer`.', 'hard', 'approved', '40e2e7db-c37d-4cbf-ab4f-18d2e88acadf', 203, '2026-04-02T06:22:45.451Z', '2026-04-02T06:22:45.451Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8a60fb9f-6042-417d-87ce-97879ae0e338', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Given formatted markup like this:

```html
<div id="container">
  <p>One</p>
  <!-- note -->
  <span>Two</span>
</div>
```

What is the safest expectation for `container.firstChild.nodeName` and `container.firstElementChild.nodeName`?', 'Whitespace created by formatting becomes a text node, so `firstChild` may be `#text`. The element-specific property skips that and returns the first element child, which is the `P` element.

Example:

```js
console.log(container.firstChild.nodeName);        // #text
console.log(container.firstElementChild.nodeName); // P
```', 'hard', 'approved', '40e2e7db-c37d-4cbf-ab4f-18d2e88acadf', 204, '2026-04-02T06:22:45.452Z', '2026-04-02T06:22:45.452Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('7a09eb59-b67f-4700-ad4c-61064a1cb7f8', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A page in Tab A runs this code and expects its own `storage` listener to fire immediately:

```js
window.addEventListener(''storage'', () => console.log(''changed''));
localStorage.setItem(''theme'', ''dark'');
```

Another same-origin tab is open. Which result is correct?', 'The `storage` event is for cross-document notification. The tab that performs `setItem` does not receive a `storage` event for its own write, but other same-origin tabs do. So Tab A should update its own UI directly after writing, while Tab B can react through the event.', 'hard', 'approved', '40e2e7db-c37d-4cbf-ab4f-18d2e88acadf', 205, '2026-04-02T06:22:45.456Z', '2026-04-02T06:22:45.456Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f8ee417d-f435-4a48-8486-b9b7af05ef33', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A draft is saved under `http://example.com/app` with `localStorage.setItem(''draft'', ''v1'')`. A user later opens `https://example.com/app` and reads `localStorage.getItem(''draft'')`. What is the best expectation?', 'Protocol is part of the origin, so HTTP and HTTPS do not share the same `localStorage` area. The secure page should not expect to see data stored under the insecure origin.', 'hard', 'approved', '40e2e7db-c37d-4cbf-ab4f-18d2e88acadf', 206, '2026-04-02T06:22:45.458Z', '2026-04-02T06:22:45.458Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d3a5f1de-cd6e-4a20-94bd-30caa83d18ba', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the strongest reason to avoid this pattern for arbitrary keys?

```js
const key = ''length'';
localStorage[key] = 5;
```', 'Object-like access is fragile because user-generated keys can collide with built-in members such as `length`, and the `storage` event does not fire for object-like access. The safer API is `setItem(key, value)`.

Example:

```js
localStorage.setItem(key, ''5'');
```', 'hard', 'approved', '40e2e7db-c37d-4cbf-ab4f-18d2e88acadf', 207, '2026-04-02T06:22:45.459Z', '2026-04-02T06:22:45.459Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ac811e1e-07b6-4043-8094-89160656d318', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A team must render 500 rows quickly and keep the code maintainable. Which refactor best fits the combined guidance from the sources?', 'The best synthesis is to construct DOM nodes off the live tree in a `DocumentFragment`, use `textContent` for plain text updates, and rely on CSS classes instead of repeated inline style writes. That minimizes unnecessary direct live-DOM work while keeping the code readable and maintainable.', 'hard', 'approved', '40e2e7db-c37d-4cbf-ab4f-18d2e88acadf', 208, '2026-04-02T06:22:45.461Z', '2026-04-02T06:22:45.461Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('516f6837-ceb4-4994-a59f-dab753f70ec8', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A code review comment says: ''Replace all direct appends with `DocumentFragment`; it is always a major performance win.'' Which response best matches the combined source guidance?', '`DocumentFragment` is useful for batching and for expressing intent clearly, but MDN explicitly warns that the performance benefit is often overstated and can be marginal. The stronger engineering position is to use it when it improves batching or clarity, not to assume universal speedups.', 'hard', 'approved', '40e2e7db-c37d-4cbf-ab4f-18d2e88acadf', 209, '2026-04-02T06:22:45.463Z', '2026-04-02T06:22:45.463Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2c6a04a8-89af-4b92-b3aa-9b79cfecf844', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Consider this simplified markup:

```html
<body>
  <h1>Welcome</h1>
  <p>Read this.</p>
</body>
```

Which statement is true?', 'In the DOM tree, `<body>` is the parent node of both `<h1>` and `<p>`. Siblings are nodes that share the same parent, so here `<h1>` and `<p>` are siblings, not parent and child of each other.', 'easy', 'approved', 'ffafca19-a10d-414b-82d6-797d3e641363', 210, '2026-04-02T06:22:49.113Z', '2026-04-02T06:22:49.113Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('de1be6aa-4427-4882-80ff-39cd5b997dac', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'For this element, which statement is correct?

```html
<title id="demo">DOM Tutorial</title>
```', 'W3Schools emphasizes that the element node itself does not directly contain the text value. It contains a text node child, which is why `firstChild.nodeValue` and `childNodes[0].nodeValue` reach the text content.', 'medium', 'approved', 'ffafca19-a10d-414b-82d6-797d3e641363', 211, '2026-04-02T06:22:49.116Z', '2026-04-02T06:22:49.116Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0348dfc1-db9b-4e86-a4e3-2ff99466bc01', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which property gives access to the full document root rather than just the document body?', 'W3Schools calls out two special root-access properties: `document.body` for the body element and `document.documentElement` for the full document element, which is the `<html>` root.', 'medium', 'approved', 'ffafca19-a10d-414b-82d6-797d3e641363', 212, '2026-04-02T06:22:49.120Z', '2026-04-02T06:22:49.120Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('c8a8f95e-77d5-4e4b-b762-6c4bfedbaf5b', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What does `nodeName` contain for an HTML element such as `<h1 id="id01">My First Page</h1>` according to the source?', 'The page states that `nodeName` of an element node is the same as the tag name, and notes that for HTML elements it is uppercase. So an `<h1>` element yields `H1`.', 'medium', 'approved', 'ffafca19-a10d-414b-82d6-797d3e641363', 213, '2026-04-02T06:22:49.133Z', '2026-04-02T06:22:49.133Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('bb8d0ec1-14d3-45f0-b1ff-8b7273cd0419', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'According to the source, which `nodeType` value represents the HTML document itself?', 'The source lists `DOCUMENT_NODE` as type `9`, describing it as the HTML document itself, the parent of `<html>`. This is a useful distinction from `ELEMENT_NODE`, which is type `1`.', 'hard', 'approved', 'ffafca19-a10d-414b-82d6-797d3e641363', 214, '2026-04-02T06:22:49.138Z', '2026-04-02T06:22:49.138Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('055ceab2-dcb5-4591-9837-7049a353e04c', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Given a container that includes text nodes, a comment, and two child elements, which property returns only the element children?', 'The handbook explains that `childNodes` includes all child nodes, including text and comment nodes, while `children` returns only element nodes. That makes `children` the safer default when you mean actual HTML elements.', 'medium', 'approved', '6e57695b-e3c0-48d7-a635-8758df22db47', 215, '2026-04-02T06:22:52.583Z', '2026-04-02T06:22:52.583Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('2ba01328-f26e-43fd-8661-abd16f1de893', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A formatted HTML block contains whitespace before its first child element. Which property is safer if you want the first child element specifically?', '`firstChild` may return a text node created by whitespace and formatting. `firstElementChild` skips non-element nodes and returns the first element child directly.', 'medium', 'approved', '6e57695b-e3c0-48d7-a635-8758df22db47', 216, '2026-04-02T06:22:52.589Z', '2026-04-02T06:22:52.589Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3c331fb2-4fe8-4b1a-b38f-0667f652adb8', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'When there are text nodes between sibling elements, what is the practical difference between `nextSibling` and `nextElementSibling`?', '`nextSibling` traverses to the next node, which may be a text node or comment. `nextElementSibling` skips non-element nodes and returns the next element. This distinction matters in formatted markup with whitespace between elements.', 'hard', 'approved', '6e57695b-e3c0-48d7-a635-8758df22db47', 217, '2026-04-02T06:22:52.591Z', '2026-04-02T06:22:52.591Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('be4599aa-82b8-4425-8027-1aa76d8f3324', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which statement best captures the handbook''s distinction between a node and an element?', 'The handbook defines nodes as the general building blocks of the DOM, which includes text, comments, attributes, and elements. Elements are only one specific kind of node, corresponding to HTML tags such as `<div>` or `<p>`.', 'medium', 'approved', '6e57695b-e3c0-48d7-a635-8758df22db47', 218, '2026-04-02T06:22:52.592Z', '2026-04-02T06:22:52.592Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('1dadda8f-46e5-48b4-9798-c667b2716ed6', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'When starting from a selected DOM element in ordinary HTML traversal, what is the handbook''s practical takeaway about `parentNode` versus `parentElement`?', 'The handbook says that, in practical element traversal, the parent of an element or node will usually be an element, so either property gives you the right parent in common cases. The distinction is still conceptual, but the practical outcome is often the same.', 'hard', 'approved', '6e57695b-e3c0-48d7-a635-8758df22db47', 219, '2026-04-02T06:22:52.594Z', '2026-04-02T06:22:52.594Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('21a754f8-160d-4db7-9fc4-39f0b2ed72ea', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which sequence reflects the full DOM event flow described in the article?', 'The article divides DOM event flow into three phases: capturing, target, and bubbling. That full model is broader than simply saying an event bubbles up.', 'medium', 'approved', 'cad6e676-ee6d-4fd1-b7b1-7796ea6a5720', 220, '2026-04-02T06:22:56.289Z', '2026-04-02T06:22:56.289Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('08c214ae-52c5-41c9-afb8-edd5d5e35491', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the default phase for listeners added with `addEventListener` according to the article?', 'The article states that all listeners added with `addEventListener` are in the bubble phase by default unless you explicitly opt into capture with the third argument set to `true`.', 'easy', 'approved', 'cad6e676-ee6d-4fd1-b7b1-7796ea6a5720', 221, '2026-04-02T06:22:56.293Z', '2026-04-02T06:22:56.293Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('44f296c2-3558-4c9b-b8a5-e7cf12f2b801', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Inside a click handler, which event-object property identifies the actual element that received the click?', 'The article uses `event.target` repeatedly to identify the concrete DOM element that was clicked. That is the property delegation code relies on when a parent listener handles child interactions.', 'easy', 'approved', 'cad6e676-ee6d-4fd1-b7b1-7796ea6a5720', 222, '2026-04-02T06:22:56.295Z', '2026-04-02T06:22:56.295Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('cd4a7a3c-0e64-4b9f-babe-ae7ea87c32fc', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why does event delegation work according to the article?', 'The article explains that event delegation uses bubbling so a parent element can observe events that originated in its child elements. That lets one ancestor listener handle multiple descendants efficiently.', 'medium', 'approved', 'cad6e676-ee6d-4fd1-b7b1-7796ea6a5720', 223, '2026-04-02T06:22:56.297Z', '2026-04-02T06:22:56.297Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('f594685f-5c1b-4047-a58f-9c593691c56b', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which statement about `event.stopPropagation()` is supported by the article?', 'The article says `stopPropagation()` prevents ancestor listeners from being triggered for that event. It also explicitly notes that the method can be used during the capturing phase as well, not only during bubbling.', 'hard', 'approved', 'cad6e676-ee6d-4fd1-b7b1-7796ea6a5720', 224, '2026-04-02T06:22:56.302Z', '2026-04-02T06:22:56.302Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('58279704-7ba4-44c6-8e36-647d9e3bae69', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'In the article''s basic delegation example, where is the `click` listener attached?', 'The article shows event delegation by attaching a single `click` listener to the parent `div`, not to the button itself. The button click bubbles up, and the parent handles it.', 'easy', 'approved', '17f96088-bc08-450a-ba62-152ea4d1056c', 225, '2026-04-02T06:22:59.851Z', '2026-04-02T06:22:59.851Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('81a741e8-194e-44a1-a239-28e03e151838', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why does the delegated example check `if (event.target.tagName === ''BUTTON'')`?', 'The parent `div` can receive bubbled clicks from any descendant. The `tagName` guard ensures the shared handler runs its button logic only when the actual target element is a `BUTTON`.', 'medium', 'approved', '17f96088-bc08-450a-ba62-152ea4d1056c', 226, '2026-04-02T06:22:59.855Z', '2026-04-02T06:22:59.855Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ca37e3c1-0e6e-468f-8f49-0c9d4b2a30b5', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the main advantage shown when a new button is added to the delegated parent after the JavaScript has already been written?', 'Because the listener sits on the shared parent, newly added matching children are handled automatically without adding new listeners for each button. That is one of the key maintenance benefits of delegation.', 'medium', 'approved', '17f96088-bc08-450a-ba62-152ea4d1056c', 227, '2026-04-02T06:22:59.858Z', '2026-04-02T06:22:59.858Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('734353a6-9ccc-4454-b1bd-e9d98f474f40', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why does the article use `querySelectorAll(''button'')` instead of `getElementsByTagName(''button'')` in the non-delegated example?', 'The article says `querySelectorAll` returns a `NodeList`, which supports `forEach`, while `getElementsByTagName` returns an `HTMLCollection`, which does not have `forEach` in that example.', 'medium', 'approved', '17f96088-bc08-450a-ba62-152ea4d1056c', 228, '2026-04-02T06:22:59.861Z', '2026-04-02T06:22:59.861Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('3882d47d-581d-4b86-97b2-b084510fe18a', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Given this delegated handler, what happens if the user clicks inside the `div` but not on a button?

```js
div.addEventListener(''click'', (event) => {
  if (event.target.tagName === ''BUTTON'') {
    console.log(''button was clicked'');
  }
});
```', 'The condition filters the delegated logic so it runs only when the actual target element is a button. If the click target is some other descendant or the container itself, the handler runs but the branch does nothing.', 'hard', 'approved', '17f96088-bc08-450a-ba62-152ea4d1056c', 229, '2026-04-02T06:22:59.866Z', '2026-04-02T06:22:59.866Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('811faf65-c637-460c-aa16-6ff91cacf605', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A click happens on a button nested inside `#inner`, which is nested inside `#outer`. All three elements have `click` listeners added with default `addEventListener` usage. In what order do the handlers run according to the source?', 'The handbook says browsers use bubbling by default. That means the event is handled on the target first, then bubbles outward through ancestors. So the default order is button, then inner ancestor, then outer ancestor.', 'medium', 'approved', '139f61eb-7a51-44af-89b9-1b75e632599b', 230, '2026-04-02T06:23:03.459Z', '2026-04-02T06:23:03.459Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ec57c28d-d624-41d6-b3ad-9116293f3cf5', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'How do you switch the same nested click example from bubbling order to capturing order according to the source?', 'The handbook says to pass `true` as the third argument to `addEventListener`. That registers the listeners for the capturing phase, which runs from the outermost ancestor down to the target element.

Example:

```js
outerDiv.addEventListener(''click'', handler, true);
```', 'medium', 'approved', '139f61eb-7a51-44af-89b9-1b75e632599b', 231, '2026-04-02T06:23:03.463Z', '2026-04-02T06:23:03.463Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('0899faed-468c-4532-9378-8e64d1498ff7', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A button listener calls `event.stopPropagation()` in the handbook''s nested example. What is the result?', '`stopPropagation()` prevents the event from continuing through the DOM. In the handbook''s example, once the button handler calls it, the ancestor handlers on `#inner` and `#outer` do not run.

Example:

```js
button.addEventListener(''click'', function (event) {
  event.stopPropagation();
  console.log(''Click on button'');
});
```', 'hard', 'approved', '139f61eb-7a51-44af-89b9-1b75e632599b', 232, '2026-04-02T06:23:03.466Z', '2026-04-02T06:23:03.466Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('8b24c1fc-b6f8-4dc4-90d0-c10624b0ae7c', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which statement correctly contrasts event bubbling and event capturing as presented in the source?', 'The source describes bubbling as target-to-outermost propagation, while capturing is the opposite: outermost ancestor down to the target. Understanding that direction is the core event-flow distinction.', 'medium', 'approved', '139f61eb-7a51-44af-89b9-1b75e632599b', 233, '2026-04-02T06:23:03.467Z', '2026-04-02T06:23:03.467Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ac85523d-c46a-4edd-a09f-a70c90fdcb02', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why does the handbook pass `event` as a parameter to the click handler in the `stopPropagation` example?', 'The event object is how the handler accesses `stopPropagation()`. Without receiving the event object, the handler cannot call that method on the current event. The handbook explicitly points that out after the example.', 'easy', 'approved', '139f61eb-7a51-44af-89b9-1b75e632599b', 234, '2026-04-02T06:23:03.471Z', '2026-04-02T06:23:03.471Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('4318d1e6-03ff-4f4f-bbec-6fec52e21c4e', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which statement about `localStorage` is correct according to the article?', 'The article says `localStorage` is shared across all tabs and windows of the same origin, and its data remains after browser restart and even OS reboot. That persistence and origin scoping are its defining characteristics.', 'easy', 'approved', 'd4cb9284-758b-410a-ac4e-80fe76c0881a', 235, '2026-04-02T06:23:07.084Z', '2026-04-02T06:23:07.084Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('48d96422-40ca-4d6d-b629-f11a79c0e586', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Why does the article recommend `getItem` and `setItem` over object-like access such as `localStorage.test = 2`?', 'Object-like access is allowed for historical reasons, but the article warns it is not recommended because user-generated keys can clash with built-in names such as `length`, and storage events do not fire for object-like access. Using the official methods avoids those pitfalls.', 'hard', 'approved', 'd4cb9284-758b-410a-ac4e-80fe76c0881a', 236, '2026-04-02T06:23:07.087Z', '2026-04-02T06:23:07.087Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('d79b6e11-d888-42da-bbfc-a531f7b9feee', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What happens if you store an object directly in `localStorage` without converting it first?', 'The article says both keys and values must be strings, so non-string values are converted automatically. A plain object becomes the string `[object Object]`, which is why JSON serialization is the recommended approach for objects.

Example:

```js
localStorage.user = JSON.stringify({ name: ''John'' });
const user = JSON.parse(localStorage.user);
```', 'medium', 'approved', 'd4cb9284-758b-410a-ac4e-80fe76c0881a', 237, '2026-04-02T06:23:07.091Z', '2026-04-02T06:23:07.091Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ca15dc81-fe48-4217-976c-ef00eba508f1', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Two same-origin tabs are open. Tab A calls `localStorage.setItem(''now'', Date.now())`. How does the `storage` event behave according to the article?', 'The article says the `storage` event fires on all same-origin windows that can access the storage except the one that caused the change. That means Tab B receives the event, but Tab A does not receive it from its own write.', 'hard', 'approved', 'd4cb9284-758b-410a-ac4e-80fe76c0881a', 238, '2026-04-02T06:23:07.094Z', '2026-04-02T06:23:07.094Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('31189ef2-d777-4b26-9757-ee9fd1a473ef', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is the safest way highlighted in the article to iterate only over stored keys, without pulling in prototype members like `getItem` or `setItem`?', 'The article notes that `for...in` traverses prototype members too, so you either need a `hasOwnProperty` guard or should use `Object.keys(localStorage)`, which returns only the object''s own keys.', 'medium', 'approved', 'd4cb9284-758b-410a-ac4e-80fe76c0881a', 239, '2026-04-02T06:23:07.096Z', '2026-04-02T06:23:07.096Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('ea0a2973-20f1-4516-9353-3f5ab3f304d1', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'A user stores data on `http://example.com` and later visits `https://example.com`. According to MDN, what should a senior engineer expect from `localStorage`?', 'MDN says `localStorage` is specific to the document''s protocol, so HTTP and HTTPS versions of the same host get different storage objects. Data written on HTTP is not automatically visible on HTTPS.', 'hard', 'approved', 'd6cfe8db-9584-4885-9fe3-df6861903e06', 240, '2026-04-02T06:23:10.649Z', '2026-04-02T06:23:10.649Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('99de661a-a57e-4af0-ab5e-8c9348ed2877', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which statement about stored keys and values matches MDN''s description of `localStorage`?', 'MDN says keys and values are stored in UTF-16 string format, and integer keys are converted to strings automatically. That matters when you rely on type-sensitive comparisons or key enumeration behavior.', 'medium', 'approved', 'd6cfe8db-9584-4885-9fe3-df6861903e06', 241, '2026-04-02T06:23:10.653Z', '2026-04-02T06:23:10.653Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('cfd16e2e-38d9-4fcd-9d34-302977d4e336', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'Which situation can cause a `SecurityError` when accessing `window.localStorage` according to MDN?', 'MDN lists two broad causes: invalid origins such as `file:` or `data:`, and policy decisions that block persistence, such as browser settings that prevent saving data. Blocking cookies may also be interpreted this way by browsers.', 'hard', 'approved', 'd6cfe8db-9584-4885-9fe3-df6861903e06', 242, '2026-04-02T06:23:10.655Z', '2026-04-02T06:23:10.655Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('9edcf45a-a4f5-45d8-93b0-b0b85fe63b8d', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What does MDN say about `localStorage` in a private or incognito browsing session?', 'MDN says `localStorage` in private browsing behaves like normal session-persistent storage only within that private context, and it is cleared when the last private tab is closed.', 'medium', 'approved', 'd6cfe8db-9584-4885-9fe3-df6861903e06', 243, '2026-04-02T06:23:10.656Z', '2026-04-02T06:23:10.656Z');
INSERT INTO "questions" ("id", "certification_id", "text", "explanation", "difficulty", "status", "source_id", "order_index", "created_at", "updated_at") VALUES ('21b6eaf0-3bae-42d3-963d-3d1d9b159c9a', '29925618-9a2e-4885-a234-b44e0cf6eba8', 'What is MDN''s position on relying on `localStorage` behavior for `file:` URLs?', 'MDN says the requirements for `file:` URL behavior are undefined and may vary by browser. Even though current browsers often appear to give each `file:` URL its own storage area, that behavior is not guaranteed and should not be relied on.', 'hard', 'approved', 'd6cfe8db-9584-4885-9fe3-df6861903e06', 244, '2026-04-02T06:23:10.657Z', '2026-04-02T06:23:10.657Z');
