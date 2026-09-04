---
title: "Problem Sets"
permalink: /assignments/
toc: true
toc_sticky: true
---

A problem set is **one list of questions on one unit's material.** It opens when the next unit
starts — after you have read the chapter, heard the lectures, and done the labs — and it is due
when the unit after that starts. Every set has the same shape, so you always know what you are
walking into. What changes is the biology.

## What a set looks like

The notebook opens with **the problem**: a biological question with more facts in it than any
answer will use. Then comes **our design** of it, in four short parts:

- **Frame** — what process produced this data, and which of the facts we are setting aside, and why.
- **Decompose** — the pieces that have to be computed, numbered. One of them is the answer.
- **Select** — the method, named, with the chapter section it comes from and the function
  signatures your code will have.
- **Verify** — the kinds of check the set carries, and why those.

Then the questions. **Question *k* builds piece *k* of the Decompose list.** Each question is
three cells: our prose saying what to compute, **a code cell that is yours**, and **a check cell
that tests your code.** A few questions ask for a sentence instead of code — read our design, read
a piece of code, say what the checks cannot see — and you answer those in a markdown cell you add.

Beside the notebook is **`data.csv`**: a dataset we generated from the process the Frame
describes. We know exactly what went into it. That is what lets every check mean something and
every question have an answer.

## The check cells

Run a check cell after you write the code above it. Each check prints one line:

- ✅ with the claim it confirmed — *p = 0: no draw is T*.
- ❌ with the claim, what came back, and what we expected.
- ⬜ if the function is not written yet.
- ⚠️ with the error message if your code raised one.

The cell closes with a count. Every expected value in a check has a comment above it saying where
it came from — a boundary the process forces, a relationship that must hold at every setting, a
number that follows from what we planted. Read those comments. They are the habit you will be asked
to copy.

**The checks only ever call your functions, with arguments they choose.** Experiment as much as you
like in cells of your own — a different grid, another tolerance, a bigger sample. The checks do
not care what else you ran.

**In sets 2 to 4 the checks are ours.** From set 5 the question describes the cases in prose —
three of them, each with the value or the direction to expect — and the check cell is yours to
write. You will have read a dozen of ours by then.

## Checking your own work

The checks you will write from set 5 are the skill students most underestimate. The code you are
handed may be wrong, the code your agent writes may be wrong, and there is no one to ask — so how
do you know?

You check against cases where the answer follows from the *structure* of the situation rather than
from any computation. If the allele frequency is zero, nobody can be a carrier. If a tolerance is
as wide as the whole class, every simulated class counts. And then you check a relationship that
has to hold in between — because two boundaries are not coverage. A simulator with the inheritance
backwards passes both p = 0 and p = 1 and fails only at p = 0.4. Constructing cases like that is
one of the most transferable things in this course, and it is how you will be expected to check
anything, ever, once nobody is grading you.

## AI use, question by question

Every question states its [AI level](https://aiassessmentscale.com/), and **the level is a
maximum** — the most AI use we recommend, and a pointer to where your attention belongs. You may
always use less.

| | Level | What it means here |
|---|:--:|---|
| Code questions | **3** — collaboration | Have the agent draft if you like. Then read what it wrote, run the checks, and say in a comment what you kept from it. |
| Interpretation | **2** — planning | Think with the agent; the sentence you write is yours. |
| Read our design · read this code · what the checks cannot see | **1** — no AI | These are the skills the exams assess, and the ones that quietly disappear if you delegate them. |

**Three no-AI questions in every set.** Both exams are code-reading exams, so those questions are
not a hurdle bolted onto the course — they are the rehearsal, happening in every set, in the
ordinary course of the work. Using AI on them costs you the practice, not the points.

Add one line at the top of your first markdown cell saying how you used AI in the set.

## Before you submit

**Kernel → Restart Kernel and Run All Cells**, and confirm every check cell closes with a ✅ count.
The grader runs your notebook top to bottom in a fresh kernel, so a function defined out of order,
or a variable left over from an earlier attempt, will not be there for it.

Our cells — the prose, the setup, the checks — are marked read-only in the notebook. JupyterLab
enforces that; VS Code does not. If you change one by accident, nothing is lost: the grader uses
our copy of every check cell, not yours. `git diff` will show you what changed.

## What earns credit

| | What we look at |
|---|---|
| **Code questions** | The checks pass. The function follows the process the design describes rather than shortcutting to a formula. The comment says what came from the agent. |
| **Read our design** | Which numbered piece is the answer, which fact in the Frame the data lets you check, the value you expect before you run. |
| **Interpretation** | Correct where a number is asked for; a reading of the plot that says what you see and what it means. |
| **Read this code** | What it computes, where it does not match its docstring, and which check it would fail. |
| **What the checks cannot see** | One way every check could pass and the answer still be wrong — specific to this problem, not a generic risk list. One place your reasoning differs from ours, defended. One decision your code made that the question did not ask for. |
| **Your own checks** *(sets 5–10)* | Present, passing, and each expected value with the line that derives it. |

Answers in complete sentences. A number with no sentence around it earns no credit — the number is
almost never the point, and in a course where an agent can produce any number you ask for, the
sentence is the only part that shows you understood it.

## Working sessions

**Every class meeting includes working time** — roughly 45 minutes to an hour with instructors and
TAs in the room. The set open during a unit is the one on the *previous* unit's material, so the
questions in front of you are about ideas you have already met, and the room can be used for
getting unstuck rather than for first exposure.

You are not expected to finish a set in class. You are expected to get far enough in, with help
available, that the rest is tractable alone.

## Practicing without spending your grade

Every textbook chapter carries practice problems built the same way, on different content, **with
worked solutions.** Ungraded and optional. If you want more repetitions before the graded set — or
want to check whether the reading landed — that is what they are for.

## If you miss a set

The set stays open with no penalty for a further unit. One missed set costs one set, never more.
