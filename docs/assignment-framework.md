---
title: "Problem Sets"
permalink: /assignments/
toc: true
toc_sticky: true
---

Every assignment has the same three sections, in the same order, every unit:

| | Section | What it is | Typical AI level |
|---|---|---|:--:|
| **1** | **Practice** | Short exercises on this unit's ideas | 3 |
| **2** | **Design** | Your approach to this unit's problem, before you see ours | 2 |
| **3** | **Build** | Last unit's problem — now that our materials have unsealed | 1 – 4 |

The shape never changes, so you always know what you are walking into. What changes is the biology.

## Why you build the data

Almost every question in this course begins by asking you to write a *simulator*: code that produces
a dataset from settings you choose. Then you analyze what it produced and see whether you can
recover the settings you started from.

This solves a problem that has no other good solution. When you analyze real data, nobody knows the
right answer — that is what makes it research. So how do you ever find out whether your method
works? You test it on a world you built, where you know the answer because you set it.

It also solves a smaller and more immediate problem: **you can check your own work.** There is no
answer key in this course, and there does not need to be one.

## Section 1 · Practice

A handful of short exercises on the material from this unit. Warm-ups: run a small simulation, read
a short function, sanity-check a number, plot something and say what you see.

**Practice is graded on completion, not correctness.** Get it done, get it wrong, fix it — all fine.

**This is the section where you should ask for help freely.** Use the agent, use the tutor, ask a
classmate, ask us. If you are stuck on a warm-up, being stuck is the information: something from the
reading did not land, and the fastest way to find out *what* is to talk it through with something
that will answer you. There is no version of this course where struggling silently on a practice
problem is the virtuous choice.

## Section 2 · Design

You get a biological question and nothing else. No starter code, no method named, no instructions.
Something like:

> *Which of these sequencing reads are ribosomal RNA, and how confident can you be about any single
> call?*

Write down how you would approach it, in four parts:

- **Frame** — what process produced this data? What is generating the numbers you are looking at,
  and what are you willing to ignore?
- **Decompose** — what has to be computed or estimated? Break the question into pieces small enough
  that each one is something you could look up a method for.
- **Select** — early in the term: what would the right method need to be able to do? Later, once you
  have a toolbox: which method, and why that one rather than the alternatives?
- **Anticipate** — how could your answer be wrong, and how would you know? Every model is a
  simplified version of the process that made the data — in George Box's words, *all models are
  wrong, but some are useful*. Say where yours is most likely wrong, and what that would look
  like — especially where it would look like it worked when it did not.

That last one is the hardest, the least taught anywhere, and the one this course cares about most.

**Design is graded for being on time, not for being right.** A design that turns out to be wrong
earns full credit. You are committing to an approach before you have seen ours, so some of your
commitments will not survive contact — that is the mechanism working, not failing. A design that
hedges everything so it cannot be wrong is worth less than one that takes a clear position and
misses.

**Why level 2 and not level 4.** Use the agent to think out loud, look things up, and check your
vocabulary. Do not ask it for the approach and write down what it says. The framing, the
decomposition, and the failure analysis need to be yours — because next unit's section 3 compares
*your* reasoning to ours, and if the design was the agent's there is nothing to compare.

## Section 3 · Build

Our materials for the problem you designed in the previous unit now unseal. This section runs in two parts.

### First, the divergence analysis

Before you build anything, compare what we did to what you committed to. Briefly, in writing:

- Where did our approach differ from yours?
- What did we handle that you did not think of?
- **Where was your design better than ours?**

We mean that third question sincerely. **The code and materials we hand you are written by people
with opinions and deadlines.** They sometimes contain choices you should argue with, and
occasionally a genuine mistake. Finding those earns credit. Deferring to us because we are the
instructors earns nothing.

This is the one part of the course an agent cannot help you with after the fact, because your design
was committed before the materials existed. For most students it is also where the learning actually
happens.

### Then, the six questions

They are not labeled by type and you do not need to memorize a structure, but the shape repeats, and
by unit three you will recognize it:

- **Build the process.** Turn a description of some biology into code that generates data.
- **Convince yourself it's right.** Check your simulator against settings whose answers you already
  know for reasons that have nothing to do with your code.
- **Explore what it does.** Vary something, run it many times, look at what changes.
- **Push it until it breaks.** Violate one of its assumptions on purpose and watch what happens to a
  method that trusted that assumption.
- **Read someone else's code.** Say precisely what it does, and find where it does not do what it
  claims.
- **Go deeper, your way.** Choose at least one of three optional directions (below).

The middle questions carry most of the biology. The last two carry most of the skill you will be
examined on.

## Checking your own work

The second build question every unit is the one students underestimate. You have no answer key, and
the code you are handed may be wrong — so how do you know?

You run your simulator on settings where the answer follows from the *structure* of the situation
rather than from any computation. If the allele frequency is zero, nobody can be a carrier. If two
classes are exactly symmetric, the probability has to be one half. If a cluster contains one point,
that point is its center. None of those require trusting your code, your agent, or us.

Constructing cases like that is a real professional skill and one of the most transferable things in
this course. It is also how you will be expected to check anything, ever, once nobody is grading you.

## Why the design section is sealed

Because a design you can revise after seeing the answer is not a design, it is a summary.

The seal is structural, not an honor system. You cannot look at our approach to this unit's problem
because it does not exist yet — it unseals in next unit's set, alongside the build section that uses
it. Nobody has to promise not to peek.

It has a second effect we think matters more. You implement each idea **a unit after you first meet
it**, so you build things after they have had time to settle rather than on the day you were
introduced to them.

```
Set 4                    Set 5                    Set 6

Practice  · topic 4      Practice  · topic 5      Practice  · topic 6
Design    → problem 4 ┐  Design    → problem 5 ┐  Design    → problem 6
Build     ← problem 3 └→ Build     ← problem 4 └→ Build     ← problem 5
```

The first set has no build section, and the last has no design section. Everything between carries
all three.

## Working sessions

**Every class meeting includes working time** — roughly 45 minutes to an hour with instructors and
TAs in the room, on the set in front of you. Each meeting in the unit has a natural target: the
first opens the new topic and the new problem, so the design section is the natural thing to start;
later meetings are for the build.

You are not expected to finish a set in class. You are expected to get far enough in, with help
available, that the rest is tractable alone.

Class is also where **designs get compared across the room.** Several genuinely different approaches
to the same problem show up every unit, and seeing four of them side by side — including the ones
better than yours — teaches something individual feedback cannot.

## AI use, question by question

Every question states its [AI level](https://aiassessmentscale.com/) — not every section, every
*question*. Most units look like this:

| | Typical level | Why |
|---|:--:|---|
| Practice | **3** — collaboration | Ask freely. Being stuck is a signal, not a failing. |
| Design | **2** — planning | Think with the agent; the framing and the judgment are yours. |
| Building simulators, exploring, breaking things | **4** — full AI | Describe the process in words and let the agent write it. The specification is the thinking; the typing is not. |
| Checking your own work; reading code | **1** — no AI | These are the skills the exams assess, and the ones that quietly disappear if you delegate them. |
| Depth questions | **3** — collaboration | Draft with the agent, then evaluate and revise what it gives you. |

There are **two no-AI questions in every set.** That is deliberate. Both exams are code-reading
exams, so those questions are not a hurdle bolted onto the course — they are the rehearsal,
happening every unit, in the ordinary course of the work. By the midterm you will have done more
than a dozen of them.

## Going deeper, your way

The last question every unit offers three directions, and **you must do at least one:**

- **Math** — derive the result your simulation approximated.
- **Compute** — make it fast, robust, or scalable, then use the speed to answer a question the slow
  version could not.
- **Bio** — find the assumption real data violates, and show what it costs.

**These are directions, not difficulty levels.** They deliberately cut across the backgrounds people
arrive with, so there is no single ladder to be low on — the mathematically-inclined and the
wet-lab-experienced are each ahead in a different one. Each may assume knowledge the course itself
does not cover, which is the point: every one of you has the prerequisites for at least one of them.

Pick by curiosity, not by what sounds impressive. Partial progress with a clear account of where you
got stuck earns nearly full credit.

## Practicing without spending your grade

Beyond section 1, every textbook chapter carries practice problems built the same way, on different
content, **with worked solutions.** Ungraded and optional. If you want more repetitions before
attempting the graded set — or want to check whether you actually followed the reading — that is
what they are for.

## If you miss a unit

The set stays open with no penalty for a further unit. Questions that depend on earlier
units ship with a reference implementation, so one bad unit never blocks the next.

If you miss a **design**, it converts to a **hindsight critique** — a different prompt on the same
problem, worth the same credit, with no pretence that the seal held. One missed unit costs one unit,
never more.

## What we're looking for

Answers in complete sentences. A number with no sentence around it earns no credit — the number is
almost never the point, and in a course where an agent can produce any number you ask for, the
sentence is the only part that shows you understood it.

On the checking questions, **state your prediction before you run anything.** A prediction that
turned out wrong, which you caught and corrected, earns full credit. A result reported with no
prediction does not, even when it is right.
