<!--
DRAFT — week 4 problem set, simulation-first redesign (Aug 2026).
Composition operation introduced: NEST (a parameter is itself random).
This is the hard test of the no-algebra rule — the beta-binomial is the first
composition whose mathematics is genuinely unfriendly. Everything required here is
done by drawing and looking; the distributional algebra is confined to 6a.
Q4 is the payoff: week 2's test, run on week 4's data, fails loudly.
-->

# Problem Set 4 — Why is real data messier than your model?

| | |
|---|---|
| **Topic** | Nesting one random process inside another; overdispersion; what happens when a test's assumption is false |
| **Biological anchor** | Your null distribution says a result is impossible. Real data produces it constantly. Which one is wrong? |
| **Est. time** | ~5 hr |
| **Due** | Before the start of week 5 |

## Purpose

**Why this matters.** Almost every statistical tool you will inherit assumes the data is less
variable than it actually is. Count data in genomics is the standard example: the models everyone
starts with predict one amount of noise, and real sequencing data has considerably more. The gap
between those two has a name, a cause, and a fix, and every serious tool in the field — DESeq2,
edgeR, and their descendants — exists largely to handle it. This week you build the gap yourself so
you can see where it comes from.

**What you'll practice.** Composing random processes (objective 1); reasoning about why a model's
reported performance does not generalize (4); diagnosing a method that fails silently (5).

**Where it goes.** You have built a process, repeated it, and mixed two of them. Now you make one
process's *setting* be the output of another process. That single move — nesting — generates most of
the realistic models in the rest of the course.

## Before you start

In week 1 you set one allele frequency and simulated from it. In week 2 you gave each locus its own
frequency, but that frequency was fixed once and then treated as known.

Real data is not like that. If you genotype the same locus in ten different sampled populations, you
do not get one frequency with sampling noise around it — you get ten genuinely different frequencies,
because the populations differ. The frequency itself is a random quantity.

That is the move this week: **the parameter is not a number, it is a draw.**

You will need a way to produce frequencies that vary around some average but stay between 0 and 1.
The **Beta distribution** does exactly this. It takes two settings, and it is convenient to think of
them as a *mean* and a *concentration*:

```python
p = rng.beta(mean * k, (1 - mean) * k)
```

Large `k` means the frequencies cluster tightly around `mean`; small `k` means they spread out widely.
You do not need to know anything else about it. Draw some and look at them.

**Deliverable:** `ps4.ipynb`.

---

## 1. Make the frequency itself random · AIAS 4

Start crude, then smooth.

1. **The crude version.** Simulate 2,000 loci where each locus's allele frequency is picked at random
   from just three possibilities — 0.15, 0.30, or 0.45 — with equal chance, and then 50 individuals
   are sampled at that frequency. Record the allele count at each locus.
2. **The smooth version.** Do the same, but draw each locus's frequency from a Beta with mean 0.30
   and concentration `k = 20`. Record the counts.
3. Plot the distribution of frequencies you drew in each version, and the distribution of counts that
   resulted.

Both versions do the same thing: the frequency varies from locus to locus instead of being fixed.
The Beta is just a smoother dial for how much.

## 2. Predict before you look · AIAS 1 — no AI

Answer first, then check against your simulation.

1. Compare the smooth version to a world where every locus has frequency exactly 0.30. Will the
   **average** count be higher, lower, or the same?
2. Will the **spread** of counts be higher, lower, or the same? Say why in one sentence, without any
   formulas.
3. If you increase `k` from 20 to 200, which of those two changes, and in which direction?
4. Suppose someone hands you a single dataset of counts and tells you it came from one of these two
   worlds, but not which. Could you tell? What would you look at?

No AI. Question 4 is asking you to design a diagnostic, not to compute anything.

## 3. Measure the gap · AIAS 4

Simulate three worlds, each with 2,000 loci and 50 individuals per locus, all with the same average
allele frequency of 0.30:

- fixed frequency 0.30 at every locus,
- Beta with mean 0.30 and `k = 100`,
- Beta with mean 0.30 and `k = 20`.

Plot all three count distributions together, and report the mean and standard deviation of each.

Then answer: the means should be nearly identical and the spreads should not. State the three
standard deviations and say how much extra variability nesting introduced in each case. This excess
is called **overdispersion** — the data is more dispersed than the simple model predicts.

## 4. Run last week's test on this week's data · AIAS 3

This is the point of the problem set.

In week 2 you built a procedure that compares two populations at a locus and returns a p-value. That
procedure builds its null distribution by assuming a **fixed** allele frequency — because that is the
world you built it in.

Take that procedure, unchanged, and apply it to data from a world where the frequency varies.

1. Generate 600 locus comparisons in which **there is no true difference between the populations** —
   but each population's frequency at each locus is drawn from a Beta with mean 0.30, first with
   `k = 100`, then with `k = 20`.
2. Run your week 2 test on all of them, with its null distribution still built the old way, assuming
   a fixed frequency of 0.30.
3. You know there are no true differences. So the fraction of comparisons with p < 0.05 should be
   about 0.05. Report what it actually is, for both values of `k`.
4. Explain, in plain language, why the test fails in the direction it does. Would a researcher using
   this test notice? What would they conclude about their biology?
5. Propose a fix. You do not need to implement a sophisticated one — describe what would have to
   change about the null distribution, and if you can, demonstrate it.

## 5. Read this code · AIAS 1 — no AI

Someone on your team wrote this to generate overdispersed counts.

```python
import numpy as np

def simulate_overdispersed(n_loci, n_individuals, mean_freq, k, rng):
    """Allele counts at n_loci, where each locus has its own frequency
    drawn from a Beta with the given mean and concentration."""
    p = rng.beta(mean_freq * k, (1 - mean_freq) * k)
    counts = []
    for _ in range(n_loci):
        counts.append(rng.binomial(2 * n_individuals, p))
    return np.array(counts)
```

It runs, returns the right number of values, and they have roughly the right average.

1. What does this function actually do, and how does it differ from the docstring?
2. You have already built the tool that exposes this. Say which comparison from question 3 would
   reveal it, and what you would expect to see.
3. Run it and confirm.
4. This function would pass a test that checks the mean of its output. Write down a test it would
   fail, with the expected value you would assert.

No AI on this question.

---

## 6. Go deeper — choose at least one · AIAS 3

**6a · Mathematical.** You measured overdispersion by simulating. Derive it. Using the law of total
variance, write the variance of the count when the frequency is itself Beta-distributed, and show
how the excess over the binomial variance depends on `k`. Check your formula against the three
standard deviations you measured in question 3. Then: the beta-binomial is not the only route to
overdispersion — show what a gamma-Poisson mixture gives you instead, and say why that particular
composition is the one RNA-seq tools use.

**6b · Computational.** Estimate `k` from data. Given counts alone, with the mean known, recover the
concentration — by grid search over `k`, comparing simulated and observed count distributions. Then
investigate the limits: how many loci do you need before your estimate of `k` is stable? Does it get
harder as `k` grows? Produce the evidence, and explain why the hard direction is hard.

**6c · Biological.** Question 4 showed a test failing because its assumption was false. Real genomics
has a specific, notorious version of this: batch effects, where samples processed together resemble
each other for reasons that have nothing to do with the biology. Modify your simulator so that
samples come in batches with batch-specific frequency shifts, and arrange the batches so they are
**confounded** with the comparison you care about. Show what happens to the false positive rate.
Then show what happens if the batches are balanced across the comparison instead. State the
experimental-design lesson in one sentence.

---

## What we're looking for

| | |
|---|---|
| **Q1** | Both versions built. The crude one is not optional — it is what makes the Beta legible. |
| **Q2** | Predictions before results, and (2) answered without formulas. (4) proposes a real diagnostic. |
| **Q3** | Three distributions on one plot, three standard deviations reported, the excess named. |
| **Q4** | Actual false-positive rates for both `k`. A plain-language explanation of the direction of failure, and an answer to "would anyone notice." |
| **Q5** | The scope error identified, tied back to Q3, and a failing test written with an expected value. |
| **Q6** | One branch, seriously attempted. |

**On AI use.** Questions 2 and 5 are AIAS 1.

---

<!--
INSTRUCTOR NOTES — not released.

THIS IS THE HARD TEST OF THE NO-ALGEBRA RULE
  The beta-binomial is the first composition whose mathematics is genuinely unfriendly, and it is
  where the temptation to teach the closed form is strongest. Everything required here is done by
  drawing and looking: Q1 draws, Q3 measures a standard deviation, Q4 counts a rate. No density is
  written down anywhere in the required work. The law of total variance is 6a's business.
  If this set survives piloting, the rule holds for the rest of the term. If it does not, this is
  where the design has to change.

WHY THE CRUDE VERSION IN Q1 COMES FIRST
  "Each locus has one of three frequencies" is a sentence any student can implement and picture.
  The Beta is then introduced as the smooth version of a thing they have already built, rather than
  as a new distribution to be accepted on faith. Do not cut this step for time — it is the whole
  accessibility strategy in miniature.

VERIFIED NUMBERS (run Aug 2026; 50 individuals/locus = 100 alleles, mean freq 0.30)
  Q3, standard deviation of counts:
      fixed p = 0.30           mean 29.8   sd  4.54
      Beta mean .30, k = 100   mean 30.2   sd  6.59
      Beta mean .30, k = 20    mean 29.8   sd 11.01
  Means match to within noise, spreads differ by more than a factor of two. Exactly the intended
  picture.

  Q4, false positive rate at nominal 0.05:
      fixed p (assumption true)   0.045     <- sanity check, the test is fine when its world is real
      overdispersed k = 100       0.148
      overdispersed k = 20        0.368
  At k=20 more than a third of comparisons with NO true difference are called significant. Students
  will have spent week 2 learning to distrust a list because of multiple testing; this shows a
  second, independent way the same list goes wrong, and this one is not fixed by a stricter
  threshold. Worth saying out loud in the Q4(5) discussion.

PLANTED DEFECT (Q5)
  rng.beta(...) is called ONCE, outside the loop, so every locus shares a single drawn frequency.
  The output has the right mean and superficially plausible counts, but it is not overdispersed at
  all — conditional on that one draw it is exactly binomial. This is a scope error, which is among
  the most common failure modes in agent-generated code, and it is invisible to a mean-based test.
  Caught by the Q3 comparison: its spread matches the fixed-p case, not the nested one.

  Verified standard deviations: at k=100 the buggy version gives sd 4.47 against a correct 6.47 and
  a fixed-p 4.51; at k=20, buggy 3.89 against correct 11.09 and fixed-p 4.61. The buggy output is
  indistinguishable from having no nesting at all, which is precisely the point.
  Q5(4) asks for a test on the STANDARD DEVIATION, which is the generalizable lesson — test the
  property the code exists to produce, not the property that is easiest to assert.

DEPENDENCY
  Q4 requires a working week 2 test. Students whose week 2 code was broken will be blocked. Either
  release a reference implementation of the week 2 test with this set, or make Q4 explicitly allow
  using a provided one. Leaning: provide it, and note that comparing it to their own is worthwhile.
  DECIDE BEFORE RELEASE.

OPEN
  - 6c (confounded batch effects) is the most valuable branch in the first four weeks and closes a
    core gap from the topic inventory. Consider promoting it to required in a later revision, or
    building week 5 around it.
  - Q4 at 600 comparisons x 2 values of k, each needing a null distribution, is the runtime risk of
    this set. Verify in piloting; the null can be built once and reused across comparisons.
-->
