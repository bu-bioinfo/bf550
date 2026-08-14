---
title: "Problem Sets"
permalink: /assignments/
toc: true
toc_sticky: true
---

One problem set a week, in a conventional format: numbered questions, due Monday night. What makes
them unusual is not the packaging — it is that **you generate the data yourself.**

## Why you build the data

Almost every question in this course begins by asking you to write a *simulator*: code that produces
a dataset from settings you choose. Then you analyze what it produced and see whether you can
recover the settings you started from.

This solves a problem that has no other good solution. When you analyze real data, nobody knows the
right answer — that is what makes it research. So how do you ever find out whether your method
works? You test it on a world you built, where you know the answer because you set it.

It also solves a smaller and more immediate problem: **you can check your own work.** There is no
answer key in this course, and there does not need to be one.

## What a week looks like

Each set has six questions. They are not labeled by type and you do not need to memorize a
structure, but the shape repeats, and by week three you will recognize it:

- **Build the process.** Turn a description of some biology into code that generates data.
- **Convince yourself it's right.** Check your simulator against settings whose answers you already
  know for reasons that have nothing to do with your code.
- **Explore what it does.** Vary something, run it many times, look at what changes.
- **Push it until it breaks.** Violate one of its assumptions on purpose and watch what happens to
  a method that trusted that assumption.
- **Read someone else's code.** Say precisely what it does, and find where it does not do what it
  claims.
- **Go deeper, your way.** Choose at least one of three optional directions (below).

The middle questions carry most of the biology. The last two carry most of the skill you will be
examined on.

## Checking your own work

The second question every week is the one students underestimate. You have no answer key, and the
code you are handed may be wrong — so how do you know?

You run your simulator on settings where the answer follows from the *structure* of the situation
rather than from any computation. If the allele frequency is zero, nobody can be a carrier. If two
classes are exactly symmetric, the probability has to be one half. If a cluster contains one point,
that point is its center. None of those require trusting your code, your agent, or us.

Constructing cases like that is a real professional skill and it is one of the most transferable
things in this course. It is also how you will be expected to check anything, ever, once nobody is
grading you.

**A standing warning:** the code and materials we hand you are written by people with opinions and
deadlines. They sometimes contain choices you should argue with, and occasionally a genuine
mistake. Finding those earns credit. Deferring to us because we are the instructors earns nothing.

## AI use, question by question

Every question states its [AI level](https://aiassessmentscale.com/) — not every assignment, every
*question*. Most weeks look like this:

| | Typical level | Why |
|---|:--:|---|
| Building simulators, exploring, breaking things | **4** — full AI | Describe the process in words and let the agent write it. The specification is the thinking; the typing is not. |
| Checking your own work; reading code | **1** — no AI | These are the skills the exams assess, and the ones that quietly disappear if you delegate them. |
| Depth questions | **3** — collaboration | Draft with the agent, then evaluate and revise what it gives you. |

There are **two no-AI questions in every problem set.** That is deliberate. Both exams are
code-reading exams, so those questions are not a hurdle bolted onto the course — they are the
rehearsal, happening every week, in the ordinary course of the work. By the midterm you will have
done roughly eighteen of them.

## Going deeper, your way

The last question every week offers three directions, and **you must do at least one:**

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

Every textbook chapter carries practice problems built the same way, on different content, **with
worked solutions.** They are ungraded and optional. If you want more repetitions before attempting
the graded set — or you want to check whether you actually followed the reading — that is what they
are for.

## What we're looking for

Answers in complete sentences. A number with no sentence around it earns no credit — the number is
almost never the point, and in a course where an agent can produce any number you ask for, the
sentence is the only part that shows you understood it.

On the checking questions, **state your prediction before you run anything.** A prediction that
turned out wrong, which you caught and corrected, earns full credit. A result reported with no
prediction does not, even when it is right.
