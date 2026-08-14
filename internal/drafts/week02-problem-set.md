<!--
DRAFT — week 2 problem set, simulation-first redesign (Aug 2026).
Authoring rules: see week01-problem-set.md header. Same five-question shape plus
choose-one depth question. Reuses the week 1 simulator throughout — that reuse is
the "repeat" operation of the composition scheme, and it is also a workload saving.
-->

# Problem Set 2 — How many of your discoveries are real?

| | |
|---|---|
| **Topic** | Repeating a process; sampling variability across many tests; what a p-value is; multiple testing |
| **Biological anchor** | You scan 1,000 loci for allele-frequency differences between two populations. Some come up "significant." Should you believe any of them? |
| **Est. time** | ~5 hr |
| **Due** | Before the start of week 3 |

## Purpose

**Why this matters.** Last week you estimated one thing. Genomics almost never asks you to estimate
one thing — it asks you to test thousands of loci, or genes, or variants at once, and then hand your
collaborator a list. This week you find out what happens to that list when you run the same honest
procedure ten thousand times, and why a result that would be convincing on its own becomes worthless
in a pile.

**What you'll practice.** Building a null distribution by simulation (objectives 1, 4); reading a
result and judging whether it is meaningful (5); code reading (6).

**Where it goes.** You will reuse last week's simulator — this week's process is just last week's
process *repeated*. That is how the rest of the term works: each week composes something you already
built with one new idea.

## Before you start

Two populations of the same species have been separated for a long time. At most loci their allele
frequencies are the same; at a few, selection or drift has pushed them apart. You genotype 50
individuals from each population at 1,000 loci and want to know **which loci differ**.

The obvious statistic is the difference in observed allele frequency between the two populations at
each locus. The problem is that this difference is never exactly zero, even when nothing is going
on — which is the entire subject of this problem set.

Reuse your `simulate` function from problem set 1. If yours needs fixing after last week's feedback,
fix it first.

**Deliverable:** `ps2.ipynb`, code plus figures plus written answers in complete sentences.

---

## 1. A world where nothing is different · AIAS 4

Build a simulator for the whole experiment, under the assumption that **no locus truly differs**.

Give each of 1,000 loci its own allele frequency, drawn once from somewhere between 0.15 and 0.85 —
loci genuinely differ from each other, they just don't differ *between populations*. Then, at each
locus, sample 50 individuals from population A and 50 from population B **using the same frequency
for both**.

For each locus, record the observed allele frequency in A minus the observed allele frequency in B.

Plot the distribution of those 1,000 differences.

## 2. Predict before you look · AIAS 1 — no AI

Answer these *before* running anything, then check each against what you got. Show both your
prediction and the result, and say plainly where you were wrong.

1. You built a world with no true differences anywhere. Will the 1,000 observed differences be zero?
   If not, what produces them?
2. Where will the distribution of differences be centered? You should be able to say this exactly.
3. Suppose you rebuilt everything with 500 individuals per population instead of 50. What happens to
   the width of that distribution — wider, narrower, unchanged? Why?
4. Suppose instead you kept 50 individuals but used 5,000 loci. What happens to the width? This is
   not the same question as (3), and the difference between them matters.

No AI on this question.

## 3. Turning a difference into a p-value · AIAS 4

Pick a single locus from your simulation. You observed some difference there. You want to know
whether a difference that big is surprising.

You already have everything you need to answer that: simulate that locus **many times** under no
true difference, and see how often you get a difference at least as extreme as the one you observed.
That fraction is the **p-value** — the probability of seeing something this extreme when nothing is
going on. Note that "as extreme" means in either direction: a difference of −0.15 is just as extreme
as +0.15.

Compute it for that one locus and state it in a sentence.

Then do it for all 1,000 loci and plot a histogram of the p-values.

Describe the shape you get. You built this world yourself and you know there is nothing to find in
it — so what should the histogram look like, and does it?

## 4. Count the damage · AIAS 3

1. How many of your 1,000 loci have p < 0.05? You know the truth about every one of them. How many
   of those "findings" are real?
2. Now add 50 loci that genuinely differ: allele frequency 0.20 higher in population B. Run the same
   analysis on all 1,050.
3. Of the loci you would report at p < 0.05, how many are the real ones and how many are the noise?
   Give the actual counts, then say what fraction of your reported list is wrong.
4. You have to hand this list to a collaborator who will spend a year of bench work following it up.
   Propose a way to make the list more trustworthy, and show what your proposal does to both numbers
   — the real findings you keep, and the false ones you remove. Any sensible rule is acceptable here;
   defending the tradeoff is the point.

## 5. Read this code · AIAS 1 — no AI

Here is a p-value function from a colleague's analysis pipeline.

```python
import numpy as np

def p_value(observed_diff, null_diffs):
    """Fraction of the null differences at least as extreme as the observed one.

    observed_diff : the difference measured in the real data
    null_diffs    : differences simulated under no true difference
    """
    return float(np.mean(null_diffs >= observed_diff))
```

1. What does this function actually compute?
2. It behaves very differently depending on the sign of `observed_diff`. Explain what happens in each
   case, in words.
3. Construct a specific test case that exposes the problem — you should be able to state, before
   running it, what the correct answer is and what this function will return instead.
4. Run your case. Report both numbers. Then say what a researcher using this function would fail to
   discover, and whether they would ever notice.

No AI on this question.

---

## 6. Go deeper — choose at least one · AIAS 3

Directions, not difficulty levels. Each may assume background the course does not cover.

**6a · Mathematical.** You obtained your p-values by simulation. There is a closed form: the
difference of two independent binomial proportions has a known approximate distribution. Derive its
mean and variance under the null, use it to compute p-values analytically for all 1,000 loci, and
compare them to your simulated ones. Where do the two disagree most, and what does that tell you
about when the approximation can be trusted?

**6b · Computational.** Your question 3 ran a simulation for every one of 1,000 loci, and each of
those ran hundreds of replicates. Make it dramatically faster. Then use the speed to answer something
the slow version could not: how does the number of false positives at p < 0.05 behave as you scale
from 1,000 loci to 100,000? Is it linear? Show the evidence, and report how long the naive version
would have taken.

**6c · Biological.** Real population-genetic data violates a background assumption of this analysis:
loci are not independent. Nearby loci are inherited together — linkage disequilibrium. Modify your
simulator so that loci come in correlated blocks rather than independently, then rerun question 4.
Does the number of false positives change? Does your fix from 4(4) still work? Say what a genome-wide
scan should do about this.

---

## What we're looking for

| | |
|---|---|
| **Q1** | Per-locus frequencies drawn once and shared between populations. Distribution plotted. |
| **Q2** | Four predictions stated before the results. (3) and (4) distinguished correctly — more individuals narrows the distribution, more loci does not. A wrong prediction you caught is worth full credit. |
| **Q3** | Two-sided comparison. Histogram produced, and recognized as flat — with a stated reason why flat is what a world with nothing in it should give. |
| **Q4** | Actual counts, not proportions in the abstract. A proposed fix with its cost shown on both sides. |
| **Q5** | Correct diagnosis of the one-sided comparison, and a constructed case with the expected answer stated in advance. |
| **Q6** | One branch, seriously attempted. |

**On AI use.** Questions 2 and 5 are AIAS 1 — no AI at all. Note your AI use for the rest at the top
of the notebook.

---

<!--
INSTRUCTOR NOTES — not released.

RULE CHECK
  R1 no algebra required: holds. Q3 defines the p-value operationally (count how often the
     simulation is at least as extreme); nothing is derived. The closed form lives in 6a.
  R2 >=1 AIAS-1: Q2 and Q5.
  R3 analytical only in depth: holds.
  R4 conventional format: holds.

VERIFIED NUMBERS (run Aug 2026; 50 individuals/pop, 1000 loci, 400 null replicates per locus)
  Null p-values: mean 0.522, median 0.510 -> visibly flat histogram.
    p<0.01 :   8 of 1000  (expect ~10)
    p<0.05 :  46 of 1000  (expect ~50)
    p<0.10 :  92 of 1000  (expect ~100)
  With 50 real loci added at delta = 0.20:
    real detected at p<0.05 : 39 of 50   (power 0.78)
    false positives         : 46
    -> 85 total "discoveries", 46 of them wrong. MORE THAN HALF THE LIST IS NOISE.
  That last number is the whole point of the problem set. It is more persuasive than any
  statement about FDR we could make, because the student generated it.

Q2(3) vs Q2(4) IS THE KEY DISCRIMINATOR
  Increasing individuals per population narrows each locus's sampling distribution. Increasing the
  NUMBER of loci does not narrow anything — it just gives you more draws from the same distribution,
  and therefore more extreme ones. Students who conflate these have the core misconception this set
  exists to break. Worth a targeted comment in grading.

PLANTED DEFECT (Q5)
  One-sided comparison with no absolute value. A valid one-sided p-value is still uniform under the
  null, so the Q3 histogram check will NOT catch it — deliberately. What catches it is a constructed
  case with a large negative observed difference, which returns p ~ 1 instead of p ~ 0. The
  consequence is that every locus where population B is higher is invisible, so a real scan silently
  loses half its findings. Students who try to catch it with the histogram alone should be told why
  that check was insufficient; that is a genuinely useful lesson about test coverage.

  Verified: buggy p-values under the null have mean 0.523 with 4.5% below 0.05 — statistically
  indistinguishable from the correct version (0.529 / 4.8%). The histogram really does not catch it.
  A constructed case with observed difference -0.25 returns p = 1.000 from the buggy function and
  p = 0.000 from a correct one, so Q5(3) exposes it unambiguously.

OPEN
  - 5 hr estimate is a guess; Q3's 1000-loci loop is the likely overrun. If piloting shows it is too
    slow, cut to 500 loci — all the numbers scale and the punchline survives.
  - Consider providing a plotting helper for the p-value histogram.
  - Q4(4) is deliberately open ("any sensible rule"). Students will propose Bonferroni, a stricter
    threshold, or replication. All are fine. Do NOT require FDR by name; it is introduced properly
    once they have felt the need for it.
-->
