---
title: "Assessment & AI Policy"
permalink: /assessment/
toc: true
toc_sticky: true
---

Your grade in BF550 reflects the two things the course is really about: **statistical and
machine-learning judgment**, and **code literacy**. It does not reward typing code from
memory. Because you're encouraged to use coding agents, every assessment is labeled with a
clear AI-use level so you always know what's expected.

## What you'll be graded on

The synthesis project is the course's culminating assessment, and **there is no exam during
finals period** — the last two and a half weeks of the course belong to your project.

| Component | What it measures | AI level | Weight |
|---|---|:--:|--:|
| Problem sets (12) | problem framing + applied ML + code literacy + agent use | per question | 40% |
| Written midterm — Mon Nov 2 (code reading) | Acts I–II, under exam conditions | 1 | 10% |
| Act III exam — Mon Nov 30 (code reading) | units 10–12, under exam conditions | 1 | 10% |
| Synthesis project | end-to-end judgment on a problem you chose | 4 | 35% |
| Participation | engagement in working sessions | — | 5% |

### Problem sets

One per unit, due Monday at 11:59 pm, in three sections. **Practice** — short warm-ups on this unit's
ideas, graded on completion, and the place to ask for help freely. **Design** — your own approach to
this unit's problem, committed before you see ours, graded for being on time rather than for being
right. **Build** — last unit's problem, whose materials have now unsealed: you open with a
divergence analysis against the design you committed, then work six questions in which you build a
generative process, check it against cases whose answers follow from structure, explore it, break
it, read someone else's code, and choose at least one depth direction. The
[problem sets page]({{ site.baseurl }}/assignments/) explains the format; the
[schedule]({{ site.baseurl }}/schedule/) lists every deadline.

**Being wrong in a design is expected and safe.** It is the comparison that teaches, and the
comparison only works if you committed to something before you saw our approach.

**There is no answer key, and there doesn't need to be one** — you set the parameters that generated
your data, so you already know the truth. Checking your own work is a graded skill here, not an
afterthought: on those questions, state your prediction *before* you run anything. A prediction that
turned out wrong, which you caught and corrected, earns full credit.

If you miss a unit, the set stays open with no penalty until the following Monday. Questions that
depend on earlier units ship with a reference implementation, so one bad unit never blocks the next.

### The no-AI questions

**Two questions in every problem set are AI level 1.** One asks you to verify your own simulator
without help; one asks you to read code and say precisely what it does and where it fails. They are
not a hurdle bolted onto the course — both exams are code-reading exams, so these questions are the
rehearsal, happening every unit in the ordinary course of the work. By the midterm you'll have done
more than a dozen of them.

Watch your own trajectory on them. It's the most honest signal you'll get about whether your unaided
skills are growing alongside your agent-assisted work.

### The two exams

Each act of the course closes with a **closed-book, no-AI code-reading exam (level 1)**: read
provided snippets, describe their behavior, recover their intent, spot edge cases and bugs —
the same skill every unit's no-AI questions rehearse, assessed all at once.

- **Midterm — Mon Nov 2:** Acts I and II — simulating processes, estimation, Bayes, evaluation, and
  regression through generalized linear models.
- **Act III exam — Mon Nov 30:** units 10–12 — trees and forests, dimensionality reduction, and
  clustering.

### Synthesis project

The capstone and the course's **culminating assessment**: design a generative process for a
biological question you care about, then show what a method can and cannot recover from it — with
every decision justified mathematically or biologically. It is the same thing you will have done
twelve times by then, on a question you chose. The last two and a half weeks of the term are project studio. It's
**AI level 4** — use the agent freely; your design, your checks, and your critique are what's graded.

## AI use levels

This course uses the [AI Assessment Scale (AIAS)](https://aiassessmentscale.com/). Each
assignment names a level so the expectations are explicit:

| Level | Name | What it means for you |
|------:|------|---|
| 1 | No AI | Work on your own — two questions on every problem set, and both exams. |
| 2 | AI Planning | Use AI to brainstorm or outline; develop the ideas yourself. |
| 3 | AI Collaboration | AI helps draft; you critically evaluate and revise its output. |
| 4 | Full AI | Use the agent throughout; you direct it, verify it, and own the result. |
| 5 | AI Exploration | Open-ended, creative use. |

**Levels are set per question, not per assignment.** A single problem set routinely spans levels 1
through 4. Using a coding agent at level 4 is expected, not a shortcut — what's graded is your
specification of the process, your checks, and your critique, the parts an agent can't produce for
you.

## Academic integrity in an AI-positive course

- Using a coding agent on a level-4 assignment is **expected** — it's not a violation.
- What *is* a problem is presenting an agent's work as understanding you don't have: an
  annotation that doesn't match the code, "hand-calculated" test values you didn't actually
  work out, or a critique that misreads the implementation. These show up naturally, because
  the deliverables require you to demonstrate that you understand.
- The level-1 questions and the exams give an AI-free picture of your own code literacy alongside
  your agent-assisted work.
