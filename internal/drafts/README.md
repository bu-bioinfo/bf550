# Redesign Drafts (INTERNAL)

> **Working drafts, August 2026.** Problem sets written under the simulation-first redesign, to test
> whether the authoring rules survive contact with real assignments. Nothing here is released.
> Background: [`../practice-assessment-alignment.md`](../practice-assessment-alignment.md) and
> [`../ml-topic-inventory.md`](../ml-topic-inventory.md).

## The authoring rules being tested

1. **Every required question is completable without algebra.** Analytical work is available, but only
   in the depth branches. This is what makes the set usable across the incoming-background range.
2. **At least one required question is AIAS 1** — no AI. In practice each set has two: a
   predict-then-verify question and a code-reading question.
3. **Conventional numbered format.** No strip, no seat names, no session labels, no cycle machinery.
   Structure that helps the author stays invisible to the student.
4. **The simulation is the oracle.** Because the student sets the parameters, they know the truth, so
   every question is self-checking without an answer key.

## The composition scheme

Each week adds one operation to processes the student has already built. Five primitives
(Bernoulli, categorical, Poisson, normal, gamma/beta) and five operations:

| Week | Operation | What it produces |
|---:|---|---|
| 1 | — | One process, one parameter. Binomial counts from allele frequency. |
| 2 | **Repeat** | Sampling variability across many tests; the null distribution; multiple testing |
| 3 | **Mix** | Choosing between sub-processes; composition estimation; identifiability |
| 4 | **Nest** | A parameter that is itself random; overdispersion; assumption violation |
| 5+ | **Condition** | A parameter as a function of a covariate → regression, logistic, GLM |
| later | **Chain** | The next draw depends on the last → sequence models |

The ordering is forced by the mathematics rather than chosen, which is what keeps the course
architecture from being one more thing to memorize.

## The repeating internal rhythm

Never named to students, but consistent every week:

| Q | Role | AIAS |
|--:|---|:--:|
| 1 | Build the process | 4 |
| 2 | Predict, then verify against structure you know | **1** |
| 3 | Explore what it does | 4 |
| 4 | Push it until it breaks | 3 |
| 5 | Read code, find the flaw | **1** |
| 6 | Depth — choose at least one of math / compute / bio | 3 |

## Status

| Draft | Verified | Notes |
|---|---|---|
| [`week01-problem-set.md`](week01-problem-set.md) | yes | PTC tasting; grid-search estimation |
| [`week02-problem-set.md`](week02-problem-set.md) | yes | 46 of 85 "discoveries" are false |
| [`week03-problem-set.md`](week03-problem-set.md) | yes | identifiability made visible in one plot |
| [`week04-problem-set.md`](week04-problem-set.md) | yes | false positive rate 0.05 → 0.37 |

"Verified" means the phenomena and the planted defects were confirmed by running the assignment at
the stated parameters; the numbers are recorded in each file's instructor notes. It does **not** mean
the time estimates have been piloted — those remain guesses.

## Known decisions still open

- **Week 4 question 4 depends on working week 2 code.** Decide before release whether to ship a
  reference implementation of the week 2 test. Leaning yes.
- **Plotting helpers.** Questions 3 and 4 across all four sets carry boilerplate that could eat the
  time budget. A small course module would help; it must not do the modelling.
- **Time estimates are unpiloted.** Weeks 2–4 are marked ~5 hr against a ~6.5 hr envelope, which
  leaves little room for the reading.
- **Grading load.** Question 6 is free-form across three branches. At 50–60 students this is the
  expensive part; the rubrics are deliberately generous to keep it cheap.
