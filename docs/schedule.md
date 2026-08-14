---
title: "Schedule"
permalink: /schedule/
toc: true
toc_sticky: true
---

The course runs in **weeks**. Each week has one topic, one problem set, and three 105-minute
meetings. The [detailed calendar]({{ site.baseurl }}/calendar/) gives every date; this page explains
what the topics are and why they come in this order.

## Everything is a process you can build

The spine of this course is a single habit: **before you analyze data, write down — as runnable
code — the process you think produced it.** That code is a *simulator*. Because you chose its
settings, you know the true answer, so you can check whether your analysis recovers it. When you
later move to real data, where nobody knows the true answer, the simulator is what tells you whether
your method can be trusted at all.

Every week you build a process, then see what you can get back out of it. The processes get more
realistic as the term goes on, and they get there by **composition** — each week takes something you
already built and does one new thing to it.

| Operation | What it means | Where it shows up |
|---|---|---|
| **Repeat** | Do it many times | Sampling variability; multiple testing |
| **Mix** | Flip a coin to decide which process runs | Classification, contamination, clustering |
| **Nest** | A setting is itself random | Overdispersion; realistic count data |
| **Condition** | A setting depends on something you measured | Regression, in all its forms |

That is the whole structural vocabulary. There is no separate "how this course works" to learn on
top of the statistics — the way the course is organized *is* the statistics.

## The arc: what is unknown?

Three acts, organized by one escalating question — *what is unknown, and how would you know your
answer is right?*

- **Act I — the unknown is a number** (weeks 1–3). Build a process, estimate what went into it, put
  an honest error bar on it, and find out why real data is messier than your first model.
  *Knowing you're right:* you set the truth yourself.
- **Act II — the unknown is an answer you have examples of** (weeks 4–9). Supervised learning:
  generative models, evaluation, then models that condition on what you measured.
  *Knowing you're right:* held-out data. Closes with the midterm.
- **Act III — nobody gives you the answer** (weeks 10–12). Prediction with no generative story, then
  structure with no labels at all. *Knowing you're right:* there is no ground truth — stability,
  internal validation, and skepticism are all you have. Closes with the Act III exam, after which
  the term belongs to your synthesis project.

> *Topics are subject to change; the [detailed calendar]({{ site.baseurl }}/calendar/) is
> authoritative for dates.*

## Week by week

| Week | Act | Operation | Topic | The question you're answering |
|---:|:--:|---|---|---|
| 1 | I | build | Simulating a process; binomial counts; sampling variability | *If 68 of 100 people taste PTC, how common is the allele?* |
| 2 | I | repeat | Null distributions; what a p-value is; multiple testing | *You scanned 1,000 loci and some came up significant. Should you believe any of them?* |
| 3 | I | nest | Overdispersion; why counts vary more than they should | *Your null says this is impossible and real data does it constantly. Which one is wrong?* |
| 4 | II | mix | Bayes' theorem; estimating probabilities from counts | *What species did this sequence come from?* |
| 5 | II | mix + repeat | Naive Bayes: classification as a generative story | *Which reads are rRNA, and how confident can you be about any single call?* |
| 6 | II | — | Evaluation: overfitting, cross-validation, leakage, calibration | *Does the classifier actually work, or does it just look like it does?* |
| 7 | II | condition | Logistic regression: modeling the boundary directly | *Is this variant pathogenic?* |
| 8 | II | condition | Linear regression and regularization | *Can expression predict dose response?* |
| 9 | II | nest + condition | Generalized linear models: Poisson and negative binomial regression | *Are these genes really differentially expressed?* |
| 10 | III | — | Trees, forests, and boosting: prediction with no probability story | *Which genes mark treatment response?* |
| 11 | III | latent | Dimensionality reduction: PCA (t-SNE/UMAP as demo) | *What structure hides in this expression matrix?* |
| 12 | III | mix, hidden | Clustering: mixture models → k-means; validating *k* | *Do these cells form distinct types — and how many?* |

Three things in that table are worth pointing out.

**Week 3 pays for itself in week 9.** Nesting one random process inside another is what produces
the negative binomial distribution, and the negative binomial is what nearly every RNA-seq tool in
the field is built on. By week 9 you will have built that model yourself rather than invoking it.

**Weeks 4 and 12 are the same model.** A mixture generates data from one of several sources. In
week 4 you know which source each observation came from; in week 12 you never find out. That is the
entire difference between classification and clustering, and it is why Act III is shorter than it
looks.

**Week 10 deliberately breaks the pattern.** Trees and forests have no generative story — you
cannot write down a process that produced the data and then invert it. Simulation does not
disappear there; its job changes, from being the model you are building to being the test bed you
evaluate on. Noticing what a method assumes when it assumes nothing is the point of Act III.

## The two exams

Each of the later acts closes with a short, closed-book, **no-AI code-reading exam** — the same
skill you practice in the no-AI questions on every problem set, assessed all at once.

- **Midterm — Mon Nov 2:** Acts I and II, estimation through generalized linear models.
- **Act III exam — Mon Nov 30:** weeks 10–12 — trees, dimensionality reduction, clustering.

**There is no exam during finals period.** After Nov 30, the rest of the term belongs to the
synthesis project.

## The synthesis project

The course in miniature, and the culminating assessment: design a generative process for a
biological question you care about, then show what a method can and cannot recover from it. Same
move you will have made twelve times by then, on a problem you chose. The last two and a half weeks
of the term are project studio, with instructors and TAs in the room.
