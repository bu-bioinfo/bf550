<!--
DRAFT — week 1 problem set under the simulation-first redesign (Aug 2026).
Written to test whether the authoring rules survive contact with a real assignment:
  R1. Every REQUIRED question is completable without algebra.
  R2. At least one required question is AIAS 1 (no AI).
  R3. Analytical work is available, but only in the depth questions.
  R4. Conventional numbered format. No strip, no seats, no session labels.
Instructor notes at the bottom, outside the student-facing text.
-->

# Problem Set 1 — Where does an allele frequency hide?

| | |
|---|---|
| **Topic** | Simulating a generative process; binomial counts; sampling variability |
| **Biological anchor** | PTC tasting — if 68 of 100 people are tasters, how common is the T allele? |
| **Est. time** | ~4 hr, including toolchain setup |
| **Due** | Before the start of week 2 |

## Purpose

**Why this matters.** Almost everything you will do in this course rests on one habit: before you
analyze data, you write down — as runnable code — the process you think produced it. That code is a
*simulator*. Because you chose its settings, you know the true answer, so you can check whether your
analysis recovers it. When you move to real data later, where nobody knows the true answer, the
simulator is what tells you whether your method can be trusted at all.

**What you'll practice.** Specifying a generative process (objectives 1, 10); checking your own work
without an answer key (11); reading code and describing what it actually does (6).

**Where it goes.** Every problem set this term follows the same shape: build the process, then see
what you can get back out of it. This week the process is as simple as it ever gets — one allele, one
frequency. From week 2 onward we start stacking pieces.

## Before you start

PTC (phenylthiocarbamide) tastes bitter to some people and like nothing at all to others. The trait
is controlled largely by one gene: the **T** allele is dominant, so anyone carrying **TT** or **Tt**
is a *taster*, and only **tt** individuals are *non-tasters*.

Each person carries two alleles, one from each parent. If the **T** allele has frequency *p* in the
population and people pair up at random, then each of a person's two alleles is **T** with
probability *p*, independently.

That last paragraph is the entire generative process. Your first job is to turn it into code.

**Deliverable:** one notebook (`ps1.ipynb`) with your code, figures, and written answers. Answer in
complete sentences — a number with no sentence around it earns no credit.

---

## 1. Build the simulator · AIAS 4

Write a function that simulates a sample of people and reports how many are tasters.

```python
def simulate_tasters(n_individuals, allele_freq, seed):
    """Return the number of PTC tasters in a sample of n_individuals."""
```

Follow the process described above literally: give each person two alleles, each **T** with
probability `allele_freq`, drawn independently. Then count the people with at least one **T**.

Do not shortcut to a formula for the fraction of tasters, even if you know one. Build the people.

Run it once with `n_individuals=100`, `allele_freq=0.4`, and report the number you get.

> **Using the agent.** Describe the process to it in words — the paragraph above is already a good
> specification — and have it write the function. Then read what it produced and satisfy yourself
> that it does what you asked. Question 2 is where you check.

## 2. Convince yourself it's right · AIAS 1 — no AI

You have no answer key. There is no solution to compare against, and the agent that wrote your code
cannot tell you whether it's correct. So how do you know?

The technique — and you will use it every week — is to run your simulator on settings where you
already know the answer for reasons that have nothing to do with the code.

Identify **three** such settings and check each one. Two are given; find a third yourself.

- **`allele_freq = 0`.** Nobody carries a **T** allele. How many tasters must there be?
- **`allele_freq = 1`.** Everybody carries two. How many tasters must there be?
- **A third check of your own.** It does not have to pin down an exact number — a check that says
  "this quantity can only go up, never down" is a real check.

For each, state what the answer has to be and why *before* you run anything, then report what your
simulator actually gave. If any disagree, fix the simulator and say what was wrong.

Write this without AI assistance. The reasoning is the point, and it is the same reasoning the
midterm will ask for.

## 3. Watch the noise shrink · AIAS 4

Fix `allele_freq = 0.4`. Run your simulator 1,000 times at `n_individuals = 20`, and another 1,000
times at `n_individuals = 200`. Each run gives you a *fraction* of tasters.

Plot the two distributions of fractions on the same axes.

Then answer, in a few sentences: what stayed the same between the two, and what changed? If a
colleague sampled 20 people and told you their taster fraction, how wrong could they plausibly be?
What if they sampled 200?

## 4. Work backwards to the allele frequency · AIAS 3

You survey 100 people and find **68 tasters**. You want to know *p*, the frequency of the **T**
allele — but your simulator runs the other direction: it takes *p* and produces tasters.

So run it forwards many times and see which values of *p* are consistent with what you saw.

For each value of *p* from 0.05 to 0.95 in steps of 0.05, simulate 500 samples of 100 people and
record the taster counts. For each *p*, what fraction of those simulated samples came out **close to
68**?

You have to decide what "close" means — say, within 2 tasters either side. State the tolerance you
picked. If you make it too tight almost nothing counts and your plot is noise; too loose and every
value of *p* looks fine. Try more than one and keep the one that gives you a usable picture.

Plot that fraction against *p*.

Then answer: which value of *p* best explains your observation? Give a *range* of values you would
consider consistent with the data, and say how you decided where to cut it off. There is no single
correct cutoff — defend the one you chose.

## 5. Read this code · AIAS 1 — no AI

A colleague sends you this function and says it does the same thing as your question 1.

```python
import numpy as np

def count_tasters(n_individuals, allele_freq, rng):
    """Simulate a population and return the number of PTC tasters.

    n_individuals : number of people sampled
    allele_freq   : frequency of the dominant T allele
    """
    return int(rng.binomial(n_individuals, allele_freq))
```

It runs without error and returns sensible-looking counts.

1. In your own words, what does this function actually compute?
2. Does it match its docstring? If not, describe the mismatch precisely.
3. Design a check — the kind you built in question 2 — that would reveal the problem to someone who
   had never read the code. State what you would run and what you would expect to see.
4. Run your check against both this function and your own. Report both results.

No AI on this question, including for reading the code.

---

## 6. Go deeper — choose at least one · AIAS 3

These go past the course's baseline, in three different directions. **They are directions, not
difficulty levels** — pick the one that suits your background or your curiosity, not the one that
sounds hardest. Each may assume knowledge the course does not cover.

**6a · Mathematical.** You estimated *p* by simulation. Derive it instead: write the probability that
a randomly chosen person is a taster as a function of *p*, then solve for *p* given an observed
taster fraction. Compare your algebraic answer to the range you reported in question 4. Then explain
where the width of that range comes from — what is the variance of the taster count, and how does it
depend on *n*?

**6b · Computational.** Question 4 probably ran tens of thousands of simulations and took a while.
Make it faster without changing what it computes: vectorize the inner loop, or replace the
person-by-person construction with an equivalent draw. Report timings before and after. Then
investigate a question the brute-force version cannot answer cheaply: how many replicates per value
of *p* do you actually need before your estimated range stops moving? Show the evidence.

**6c · Biological.** Your simulator assumes every person's alleles are drawn from one frequency, and
that people pair at random. Real populations violate this constantly. Pick **one** violation —
population structure, assortative mating, selection, genotyping error — and modify your simulator so
it happens. Then run question 4's estimation procedure on data from your modified simulator, *while
still assuming the simple model*. What does the estimate do? Would you have noticed anything was
wrong if you only had the data?

---

## What we're looking for

| | |
|---|---|
| **Q1** | The simulator builds individuals from alleles, rather than jumping to a fraction. Runs and is readable. |
| **Q2** | Three checks, each with the expected answer stated *before* the result. A wrong prediction that you caught and corrected is worth full credit; an unstated prediction is not. |
| **Q3** | Both distributions plotted together, and a written answer that connects sample size to how wrong someone could be. |
| **Q4** | A plot of consistency against *p*, a stated best value, a stated range, and an honest defense of the cutoff. |
| **Q5** | Correct identification of what the function computes, and a check that would actually catch it. |
| **Q6** | One branch, attempted seriously. Partial progress with a clear account of where you got stuck earns nearly full credit. |

**On AI use.** Each question carries an AIAS level. Questions 2 and 5 are level 1: no AI, at all. Put
a one-line note at the top of your notebook stating how you used AI on the rest. We are not policing
this — the level-1 questions are the ones the exams will look like, and using AI on them costs you
the practice, not the points.

---

<!--
INSTRUCTOR NOTES — not released to students.

RULE CHECK
  R1 (no algebra required): holds. Q1 code, Q2 reasoning, Q3 plot-reading, Q4 grid search,
     Q5 code reading. The only algebra in the set is 6a, which is optional-by-branch.
  R2 (>=1 AIAS-1 question): Q2 and Q5.
  R3 (analytical work in depth only): holds — the closed form 1-(1-p)^2 appears nowhere in the
     required questions and is the substance of 6a.
  R4 (conventional format): holds. No strip, no seat names, no session references.

PLANTED DEFECT (Q5)
  rng.binomial(n, p) treats p as P(taster) rather than as the allele frequency. At p=0.4 it
  returns ~40 tasters where the correct process gives ~64. Detectable purely empirically by
  running it beside the student's own Q1 simulator, which is the intended route — no algebra
  needed to catch it. This is the most common conceptual error in the week's material, so the
  question doubles as a misconception probe.

NUMBERS (verified by running the assignment, Aug 2026)
  Truth behind Q4: 68/100 tasters corresponds to p = 0.4343. Deliberately between grid points so
  nobody reads off an exact answer.

  Q4 with tolerance +/-2, 500 sims per grid point, produces a clean unimodal curve:

      p     0.30   0.35   0.40   0.45   0.50   0.55   0.60
      hit   0.000  0.048  0.292  0.394  0.124  0.010  0.000

  Peak at 0.45, shoulders at 0.40 and 0.50, everything outside 0.35-0.55 essentially zero. Students
  should report a best value of 0.40-0.45 and a range of roughly 0.35-0.50. The curve is not
  degenerate and does not need more than 500 replicates.

  Q5 contrast at p=0.4: correct process gives ~64 tasters, the buggy binomial gives ~40. A 24-point
  gap is unmissable when run side by side.

WHAT Q2 IS REALLY FOR
  This is the replacement for the answer key. It teaches self-verification by construction as a
  named technique in week 1, before students have anything to check. If this question works, the
  oracle problem is solved structurally for the rest of the term; if students treat it as busywork,
  the whole design is in trouble. Watch it closely in year one.

WHAT 6c IS REALLY FOR
  A student who chooses population structure has, without being told, constructed a setting where
  the allele frequency itself varies — which is the beta-binomial, and week 4's nesting operation.
  The branch is a discovery route into the next unit, not a harder version of this one.

OPEN
  - Est. time (~4 hr) is a guess and needs a pilot. Q4 is the likely overrun.
  - Should the course provide plotting helpers so Q3/Q4 boilerplate does not eat the budget?
  - Grading load: Q6 is free-form across three branches. At 50-60 students this is the expensive
    part of the set. Rubric above is deliberately generous to keep it cheap.
-->
