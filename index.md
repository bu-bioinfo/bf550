---
link-citations: true
---

> **Provisional, in the places that are marked.** The design, the topic sequence, and the calendar
> are settled — the dates on the [calendar]({{ site.baseurl }}/calendar/) will not move. Meeting
> times, the room, and the standard BU policy statements are still to be confirmed, and the textbook
> is being written a chapter at a time. Planning happens in the open, in the
> [discussion issues](https://github.com/bu-cds-bf550/bu-cds-bf550.github.io/issues).

**Semester:** Fall 2026 · **Meeting time:** three 105-minute sessions per week _(times TBD)_ · **Location:** _TBD_

**Prerequisites:** some prior programming experience (any language) and introductory molecular
biology. A wide range of programming and math backgrounds is expected — the course is designed
for it, as you're about to read.

## Why this course is built the way it is

Two things are true at once. Machine learning has become the working language of modern
biology — and AI can now write competent code from a plain-English description. Some courses
respond to that second fact by banning AI. We do the opposite: **we assume it, provide it, and
build the course around the skills it cannot do for you.**

Here is what an AI cannot do for you. It cannot decide what question your data can actually
answer. It cannot decide what "correct" means for a problem you care about. It cannot tell you
whether the confident-looking answer it just produced is wrong. Those three skills — framing a
problem, defining correctness, and catching failure — are what this course teaches, using
machine learning on real biological data as the material.

You will read far more code than you write. That is deliberate. You come into this program with
wildly different programming backgrounds, and we are not going to pretend otherwise. Reading
code — saying precisely what it does, recovering what it was *meant* to do, judging whether it
should be trusted — is a skill almost none of you have practiced, regardless of background. It
levels the field, and in the age of AI-generated code, it is *the* skill.

The same goes for math. Some of you have a lot; some very little. Every idea in this course
arrives in the same order: first as a **story** about how data comes to exist, then as **code**
you can run and poke, and only then as **notation** — the formula, presented as a compressed
summary of something you have already played with. If you can read Python, you can learn to
read math. Formulas are never the entrance fee here; they are the souvenir.

## The rhythm

One topic a week, one problem set a week, three 105-minute meetings. The week's topic opens in the
first meeting; the rest are working sessions with instructors and TAs in the room.

**You build the data before you analyze it.** Nearly every week starts by asking you to write a
*simulator*: code that produces a dataset from settings you choose. Then you analyze what came out
and see whether you can recover the settings you put in.

That one habit does a surprising amount of work. It is how scientists actually find out whether a
method can be trusted — you cannot validate anything against real data, because with real data
nobody knows the right answer. It is also why this course does not need an answer key: **you know
the truth, because you set it.**

And it means the mathematics arrives in a bearable order. You will meet sampling variability as
three histograms getting narrower, not as a formula. You will meet a p-value as *how often the
simulation is at least as extreme*, not as an integral. You will discover overdispersion because
your own data turns out messier than your own model predicted. The formulas show up later, as
compressed summaries of things you have already watched happen.

**Each week composes.** Once you can build one process, you repeat it, mix two of them, nest one
inside another, or let its settings depend on something you measured. Those four operations —
repeat, nest, mix, condition — generate nearly every model in the first two acts. The third act
asks the harder question, *what if the thing you care about was never measured at all?*, and one
week drops the probability story altogether to show you what that costs. Either way there is no
separate "how this course works" to learn on top of the statistics. The organizing principle *is*
the statistics.

Topics and the three-act arc are on the [schedule]({{ site.baseurl }}/schedule/); every meeting
date and deadline is on the [calendar]({{ site.baseurl }}/calendar/). The course has its own
free, open textbook — [*Biological Data Analysis, Simulation First*](https://bu-cds-bf550.github.io/bf550-textbook/) — written around this
approach; one chapter a week is the reading, and you can start reading it right now.

## Using AI

You'll have a provided coding agent and a tutor for the [textbook](https://bu-cds-bf550.github.io/bf550-textbook/), and **every individual question** states
its [AI level](https://aiassessmentscale.com/) — not every assignment, every question:

- **Building simulators, exploring, breaking things — full AI, encouraged.** Describe the process
  in words and let the agent write it. Specifying what generates your data is the thinking; typing
  it is not.
- **Checking your own work, and reading code — no AI.** Two questions every week. These are the
  skills that quietly disappear if you delegate them, and they are exactly what the exams assess.
- **The two exams — no AI.** A midterm (Nov 2) and an Act III exam (Nov 30), closed-book, both
  code-reading.

The no-AI questions exist for your benefit as much as ours. Research on novices using AI finds that
the students who struggle most are often the ones most convinced they're doing fine. Two unaided
questions a week are how you and we both watch your own skill actually growing — so nobody
discovers a gap for the first time during an exam.

## What you hand in, and what it's worth

One notebook a week: your code, your figures, and your answers in complete sentences.

| | Weight | AI level |
|---|---:|---|
| Weekly problem sets (12) | 40% | Stated per question — two are no-AI every week |
| Written midterm (Mon Nov 2) | 10% | None |
| Act III exam (Mon Nov 30) | 10% | None |
| Synthesis project | 35% | Full |
| Participation | 5% | — |

The synthesis project is the course in miniature and the culminating assessment — **there is no
exam during finals period**. You design a generative process for a biological question you care
about, then show what a method can and cannot recover from it. By then you'll have done exactly
that twelve times; the difference is that this time you choose the question.

**If you miss a week** — it happens — the problem set stays open with no penalty until the
following Monday, and the questions that depend on earlier weeks always come with a reference
implementation so a bad week never blocks a good one. Ask early.
