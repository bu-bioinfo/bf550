---
title: "How This Course Works"
permalink: /about/
toc: true
toc_sticky: true
---

BF550 is an applied statistics and machine-learning course for life scientists. The goal is
to build your **intuition for how machine-learning methods work and when to use them**, and
to apply that intuition to real molecular-biology and genomics problems. This page explains
how the course is structured and what to expect.

## What you'll learn

You'll come away able to:

- Recognize the major **classes of machine-learning algorithms** — supervised vs.
  unsupervised, classification, clustering, feature-importance and tree-based methods,
  dimensionality reduction — and understand how they differ.
- **Choose the right method** for a given biological question and dataset, and explain why.
- **Read and understand code**: say precisely what a piece of code does, recover the idea
  behind it, and judge whether it's well designed for the problem.
- **Work effectively with AI coding agents** — break a problem down, direct an agent to
  build a solution, and verify that the result actually does what you intended.

The emphasis throughout is on *judgment*: framing the problem, picking the method, and
checking the answer.

## Reading code is the focus

You come into this program from many different starting points — some of you have written a
lot of code, some very little. **This course focuses on reading and understanding code, not
on writing it from scratch**, so wherever you start, you'll be building the same core skill:
*code literacy*.

Code literacy is more than syntax. It means being able to:

- read a snippet and explain exactly what it does, including the tricky edge cases;
- look at code plus its tests and reconstruct the specification it was built to meet;
- see how a program is organized to solve a problem, and where its complexity and risk live;
- tell whether a piece of code — yours, a classmate's, or an AI's — actually works as
  intended.

These are the skills that make you effective with any codebase, and they're exactly the
skills you need to use AI coding tools well.

## Using AI coding agents

You'll be **provided with coding-agent tools, and you're encouraged to use them.** This
course is built around them rather than against them.

The work you turn in is structured so that the agent handles what it's good at (generating
code) while *you* do the thinking that matters: framing the problem, deciding what has to be
computed, choosing an approach, and anticipating how the answer could be wrong. In practice that
means **committing to an approach before you generate anything, then checking the result
against a case whose answer you already know for reasons that have nothing to do with the
code.**

Each assignment tells you exactly what level of AI use is expected (see
[AI levels](#two-things-youll-see-on-every-assignment) below), so there's never any
ambiguity about what's allowed.

## How the course fits together

| Component | What you do |
|---|---|
| **Three meetings a week** (105 min each) | The week's topic opens in the first; the rest are working sessions with instructors and TAs in the room. |
| **Weekly problem set** | Build a generative process, check it, explore it, break it, read code, and choose a depth direction. |
| **Two no-AI questions every week** | Verify your own work unaided, and read code closely. Direct rehearsal for both exams. |
| **Two written exams** | Code reading under exam conditions (no AI): a midterm and an Act III exam. |
| **Synthesis project** | Design a generative process for a question you chose, and show what a method can and cannot recover from it. |

Problem sets ask you to build the data before you analyze it, so you always know the true answer and
can check your own work without an answer key. See the
[problem sets page](https://bu-cds-bf550.github.io/assignments/) for the format.

## Two things you'll see on every assignment

**Clear expectations (Purpose / Task / Criteria).** Every assignment states up front *why*
you're doing it, *what* exactly to do, and *how* it will be evaluated — so you always know
what success looks like before you start. (This follows the
[TILT](https://www.tilthighered.com/resources) transparent-assignment framework.)

**An AI use level.** Every *question* is labeled with a level on the
[AI Assessment Scale (AIAS)](https://aiassessmentscale.com/), telling you how much AI use is
expected — a single problem set routinely spans levels 1 through 4:

| Level | Name | What it means |
|------:|------|---------------|
| 1 | No AI | Work on your own (e.g. the code-reading check-ins and midterm). |
| 2 | AI Planning | AI for brainstorming/outlining; you develop the ideas yourself. |
| 3 | AI Collaboration | AI helps draft; you critically evaluate and revise its output. |
| 4 | Full AI | Use the agent throughout; you direct it, verify it, and own the result. |
| 5 | AI Exploration | Open-ended, creative use. |

Building simulators, exploring, and the project are **Level 4** — use the agent freely, with your design,
specifications, tests, and verification as the work that's graded. The code-reading
check-ins and midterm are **Level 1**, so you and we can both see your unaided reading skills
grow over the term.
