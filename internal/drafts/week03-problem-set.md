<!--
DRAFT — week 3 problem set, simulation-first redesign (Aug 2026).
Composition operation introduced: MIX (choose which process generates each observation).
Q4 is the identifiability discovery — the first time students meet a question the data
cannot answer, which is a different failure from a question answered badly.
-->

# Problem Set 3 — What is this sample made of?

| | |
|---|---|
| **Topic** | Mixtures; estimating a composition; when data cannot answer a question at all |
| **Biological anchor** | A sequenced sample is a blend of two sources. What fraction came from each — and when is that unknowable? |
| **Est. time** | ~5 hr |
| **Due** | Before the start of week 4 |

## Purpose

**Why this matters.** Almost nothing you sequence is one thing. A tumor biopsy is cancer cells plus
normal tissue. An environmental sample is many organisms at once. An ancient DNA extract is part
endogenous and part modern contamination. In every case the number you want — how much of it is the
thing you care about — is not measured directly. It has to be recovered from data that blends the
sources together.

**What you'll practice.** Building a process that chooses between sub-processes (objective 1);
estimating a quantity that is not directly observed (3); recognizing when a method's answer is
meaningless rather than merely imprecise (4, 5).

**Where it goes.** You have built one process (week 1) and repeated it (week 2). This week you
combine two processes into one, which is the move behind classification, clustering, and every
"which group did this come from" question later in the course.

## Before you start

You have a sample of DNA that is a mixture of two sources — call them **A** and **B**. A fraction
*w* of the DNA came from source A and the rest from source B. You want *w*.

You cannot see individual molecules' origins. What you can see is allele frequencies at a panel of
**200 marker loci**, and you know — from reference panels sequenced earlier — what the allele
frequency is at each marker in a pure A sample and in a pure B sample.

The logic: if a marker sits at frequency 0.8 in A and 0.2 in B, then a sample that is 30% A should
show roughly 0.3 × 0.8 + 0.7 × 0.2 = 0.38. Every marker gives you a noisy vote on *w*, and you have
two hundred of them.

**Deliverable:** `ps3.ipynb`.

---

## 1. Build the mixture · AIAS 4

Write a simulator that produces observed allele frequencies for a mixed sample.

Inputs: the true mixture fraction *w*, the marker frequencies in pure A, the marker frequencies in
pure B, and a sample size. For each marker, work out the frequency the mixture should show, then
sample from it the way you have the last two weeks — real observations, not the expected value.

Generate your reference panels first: 200 markers with A-frequencies spread between 0.6 and 0.9 and
B-frequencies between 0.1 and 0.4. These are markers chosen *because* they distinguish the sources,
which is what a real ancestry-informative panel is.

Then simulate a sample with **w = 0.30** and 50 individuals' worth of data. Plot the observed
frequencies against the A-frequencies.

## 2. Predict before you look · AIAS 1 — no AI

State each answer and your reasoning before running, then check.

1. If you set *w* = 1, what should the observed frequencies look like relative to the A panel? What
   about *w* = 0?
2. At *w* = 0.30, will the observed frequencies sit closer to the A panel or the B panel? Say why in
   one sentence.
3. Run both extremes and confirm. If either disagrees with your prediction, your simulator has a bug
   — find it before continuing.
4. Here is a subtler one. Suppose you doubled the number of markers from 200 to 400. Would that make
   your eventual estimate of *w* more precise? Now suppose instead you doubled the sample size at
   each of the original 200 markers. Would *that*? Are these the same?

No AI on this question. Question 4 is the same distinction you met last week in a new costume; say
explicitly whether your answer this week is consistent with your answer then.

## 3. Recover the mixture fraction · AIAS 4

You know the reference panels. You have observed data. You do not know *w*. Find it the way you found
the allele frequency in week 1 — run the process forwards across a grid and see which setting
reproduces what you saw.

For each candidate *w* from 0 to 1 in steps of 0.05, work out what frequencies that *w* predicts at
every marker, and measure how far your observed data sits from that prediction. Summing the squared
differences across markers is a perfectly good measure; if you use something else, say what and why.

Plot your measure against *w*.

Report your best estimate and a range you would consider consistent with the data. Compare to the
true value you used. Did you get it back?

## 4. Break it · AIAS 3

Rebuild the reference panels so the markers are **uninformative**: A-frequencies between 0.45 and
0.55, and B-frequencies also between 0.45 and 0.55. Everything else stays the same, including the
true *w* = 0.30.

Simulate fresh data and rerun your question 3 analysis exactly as written.

1. Plot the new curve beside the old one. Describe the difference in one sentence.
2. What is your estimate of *w* now? What range is consistent with the data?
3. Here is the question that matters: is your estimate *wrong*, or is it *meaningless*? Those are
   different failures. Explain which one this is and how you can tell them apart from the plot alone.
4. Your analysis code ran without error and printed a number in both cases. What would you have to
   check, in a real analysis, to know which situation you were in? Be specific — name the diagnostic.

## 5. Read this code · AIAS 1 — no AI

A collaborator sends you their mixture simulator.

```python
import numpy as np

def simulate_mixture(w, freq_A, freq_B, n_individuals, rng):
    """Observed allele frequencies for a sample that is fraction w from source A.

    w             : fraction of the sample originating from source A
    freq_A/freq_B : marker allele frequencies in the pure sources
    """
    expected = w * freq_B + (1 - w) * freq_A
    counts = rng.binomial(2 * n_individuals, expected)
    return counts / (2 * n_individuals)
```

1. What does this function compute, and how does it differ from what its docstring promises?
2. You already built the checks that catch this in question 2. Say which of them catches it, and
   what you would see.
3. Run it and confirm.
4. A researcher uses this function to simulate test data, then validates their estimation code
   against it. Their estimator recovers *w* perfectly every time. Explain how both pieces of software
   can be wrong in a way that makes each other look right.

No AI on this question. Part 4 is the important one.

---

## 6. Go deeper — choose at least one · AIAS 3

**6a · Mathematical.** Your grid search minimizes a sum of squared differences. Under what model of
the noise is that the *right* thing to minimize — and what would you minimize instead if you took
the binomial sampling seriously? Write down the likelihood for the mixture model, maximize it (by
grid or by calculus), and compare the estimate and the interval to what least squares gave you. When
does the choice matter?

**6b · Computational.** Extend the problem from two sources to *K*. You no longer have a single *w*
to scan over — you have a set of fractions that must be non-negative and sum to one, and a grid over
that space becomes impossible fast. Implement an estimator that works for K = 3 or 4, explain what
you did instead of a grid, and demonstrate it recovers known mixtures. Report where it starts to
fail.

**6c · Biological.** Real mixture problems come with a nastier version of question 4's problem: the
reference panels themselves are estimates, from finite samples, and may come from populations that
are not quite the sources in your actual mixture. Simulate this — add error to the reference panels,
or make the true sources slightly different from the references — and measure how wrong your estimate
of *w* becomes. Which matters more, panel error or sample size? Relate your answer to a real
application: tumor purity, contamination screening, or ancestry inference.

---

## What we're looking for

| | |
|---|---|
| **Q1** | Sampling, not expected values. Panels generated as specified. |
| **Q2** | Predictions before results. (4) answered consistently with week 2 and the consistency noted. |
| **Q3** | Curve plotted, estimate and range reported, compared against the truth. |
| **Q4** | The wrong/meaningless distinction drawn correctly, and a named diagnostic in (4). This is the question that carries the set. |
| **Q5** | The swap identified, tied back to the Q2 checks, and part (4) answered — mutually consistent errors. |
| **Q6** | One branch, seriously attempted. |

**On AI use.** Questions 2 and 5 are AIAS 1.

---

<!--
INSTRUCTOR NOTES — not released.

RULE CHECK
  R1 no algebra: holds. Q3 is a grid search with a sum of squares; no likelihood, no derivation.
     6a is where the likelihood lives.
  R2 >=1 AIAS-1: Q2, Q5.
  R3/R4: hold.

VERIFIED NUMBERS (run Aug 2026; 200 markers, 50 individuals, true w = 0.30)
  Informative panel (A in 0.6-0.9, B in 0.1-0.4) — SSE by w:
      w      0.0    0.1    0.2    0.3    0.4    0.5    0.6 ...  1.0
      SSE   4.98   2.44   0.95   0.51   1.11   2.76   5.46 ... 26.72
  Clear minimum at the true value. Students should recover 0.25-0.35.

  Uninformative panel (both 0.45-0.55) — SSE across the whole range of w spans only 0.255
  (0.47 to 0.73), i.e. visibly FLAT compared to the 26-unit swing above. Note for grading: the
  uninformative curve is not perfectly flat and its shallow minimum sits near w ~ 0.15, NOT at the
  true 0.30. This is better than a perfectly flat curve pedagogically — the estimate is both
  meaningless AND confidently wrong-looking, which is exactly the trap. Students who report "the
  estimate is 0.15" without noticing the curve is flat have made the error the question targets.

WHY Q4 IS THE CENTRE OF THE SET
  This is the first time students meet a question the data cannot answer. Everything up to now has
  been "your estimate has uncertainty"; this is "your estimate has no information in it, and the
  software will not tell you." The distinction between an imprecise answer and a meaningless one is
  identifiability, and it recurs at every latent-variable method later in the course — mixture
  models, clustering, deconvolution, factor analysis. Introducing it here, on a two-parameter
  problem where it is visible in a single plot, is much cheaper than introducing it at clustering.

PLANTED DEFECT (Q5)
  w is applied to freq_B instead of freq_A, so the function silently returns the mixture for (1-w).
  Caught immediately by the Q2 w=0 / w=1 checks, which is the intended callback: the checks students
  built two questions earlier are the thing that finds the bug.
  Q5(4) is the real payload. If a student simulates test data with this function AND estimates with
  a matching convention, the estimator "validates" perfectly while both are wrong. That is a real
  and common failure — validating generated code against generated data — and it is the strongest
  argument in the course for checks anchored outside the code, i.e. week 1's question 2.

OPEN
  - Should the reference panels be provided as a file rather than generated? Generating them is
    30 seconds of work and keeps everything in one notebook; providing them guarantees everyone's
    numbers match. Leaning generate, with a fixed seed specified.
  - Q6b (K sources) is markedly harder than 6a/6c. Acceptable — branches are directions, not matched
    difficulty — but watch whether anyone picks it.
-->
