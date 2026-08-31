---
title: "Schedule"
permalink: /schedule/
toc: true
toc_sticky: true
---

## The arc: what is unknown?

Three acts, organized by one escalating question — *what is unknown, and how would you know your
answer is right?*

- **Act I — the unknown is a number** (units 1–3). Build a process, estimate what went into it, put
  an honest error bar on it, and find out why real data is messier than your first model.
  *Knowing you're right:* you set the truth yourself.
- **Act II — the unknown is an answer you have examples of** (units 4–9). Supervised learning:
  generative models, evaluation, then models that condition on what you measured.
  *Knowing you're right:* held-out data. Closes with the midterm.
- **Act III — nobody gives you the answer** (units 10–12). Prediction with no generative story, then
  structure with no labels at all. *Knowing you're right:* there is no ground truth — stability,
  internal validation, and skepticism are all you have. Closes with the Act III exam, after which
  the term belongs to your synthesis project.

## Fall 2026

The term is **40 class meetings**, and a **unit** is three of them — the sessions that carry one
problem set. A unit is not a calendar week. The term opens on a Wednesday and the holidays fall
unevenly, so after unit 1 a unit runs **Friday → Monday → Wednesday**: the topic and the new
problem open on Friday, you have the weekend with them, and Monday and Wednesday are working
sessions. No session is ever dropped — a holiday bends a unit rather than shortening it.

**A problem set is assigned in a unit's first session and is due at the next unit's first
session** — the same session the following set is handed out. You submit yours, then you get ours.
That ordering is the point: the set you hand in carries **your design** for a problem, and the set
handed out in that same session is where our materials for that problem unseal. The design has to
be closed before you can see ours, or the comparison the whole course is built on is worth nothing.

The **Problem set** column below reads *due / assigned* for that unit's first session. All three of
a unit's sessions carry working time on the set assigned in the first of them, so you have the
room, the instructors and the TAs for the whole of a set's life.

**Two units assign nothing — units 9 and 12.** That is deliberate: it means no problem set is ever
open while you are preparing for an exam. The midterm is Fri Nov 6, at the start of unit 10; the
Act III exam is Wed Dec 2, at the start of unit 13. It is also why there are **ten problem sets
across thirteen units** rather than one per unit.

Every meeting date links to that day's [lab]({{ site.baseurl }}/labs/) once the lab is posted —
the material we work through in class, yours to finish at your own pace afterwards.

| Unit | Sessions | Topic | Problem set Due/Assigned |
|---:|---|---|---|
| 1 | Wed {% include lab-link.html id="unit-01-1" label="Sep 2" %} · Fri {% include lab-link.html id="unit-01-2" label="Sep 4" %} · Wed {% include lab-link.html id="unit-01-3" label="Sep 9" %} | Course intro and setup; simulating a process; binomial counts | NA / **PS1**  |
| 2 | Fri {% include lab-link.html id="unit-02-1" label="Sep 11" %} · Mon {% include lab-link.html id="unit-02-2" label="Sep 14" %} · Wed {% include lab-link.html id="unit-02-3" label="Sep 16" %} | Null distributions; what a p-value is; multiple testing | **PS1** / **PS2** |
| 3 | Fri {% include lab-link.html id="unit-03-1" label="Sep 18" %} · Mon {% include lab-link.html id="unit-03-2" label="Sep 21" %} · Wed {% include lab-link.html id="unit-03-3" label="Sep 23" %} | Nesting; overdispersion; why counts vary more than they should | **PS2** / **PS3** |
| 4 | Fri {% include lab-link.html id="unit-04-1" label="Sep 25" %} · Mon {% include lab-link.html id="unit-04-2" label="Sep 28" %} · Wed {% include lab-link.html id="unit-04-3" label="Sep 30" %} | Bayes' theorem; estimating probabilities from counts | **PS3** / **PS4** |
| 5 | Fri {% include lab-link.html id="unit-05-1" label="Oct 2" %} · Mon {% include lab-link.html id="unit-05-2" label="Oct 5" %} · Wed {% include lab-link.html id="unit-05-3" label="Oct 7" %} | Naive Bayes: classification as a generative story | **PS4** / **PS5** |
| 6 | Fri {% include lab-link.html id="unit-06-1" label="Oct 9" %} · Tue {% include lab-link.html id="unit-06-2" label="Oct 13" %} · Wed {% include lab-link.html id="unit-06-3" label="Oct 14" %} | Evaluation: overfitting, cross-validation, leakage, calibration | **PS5** / **PS6** |
| 7 | Fri {% include lab-link.html id="unit-07-1" label="Oct 16" %} · Mon {% include lab-link.html id="unit-07-2" label="Oct 19" %} · Wed {% include lab-link.html id="unit-07-3" label="Oct 21" %} | Logistic regression: modeling the boundary directly | **PS6** / **PS7** |
| 8 | Fri {% include lab-link.html id="unit-08-1" label="Oct 23" %} · Mon {% include lab-link.html id="unit-08-2" label="Oct 26" %} · Wed {% include lab-link.html id="unit-08-3" label="Oct 28" %} | Linear regression and regularization | **PS7** / **PS8** |
| 9 | Fri {% include lab-link.html id="unit-09-1" label="Oct 30" %} · Mon {% include lab-link.html id="unit-09-2" label="Nov 2" %} · Wed {% include lab-link.html id="unit-09-3" label="Nov 4" %} | Generalized linear models: Poisson and negative binomial regression | **PS8** / NA |
| 10 | Fri {% include lab-link.html id="unit-10-1" label="Nov 6" %} · Mon {% include lab-link.html id="unit-10-2" label="Nov 9" %} · Wed {% include lab-link.html id="unit-10-3" label="Nov 11" %} | **MIDTERM Fri Nov 6** (no AI, closed book — Acts I & II), then trees, forests, and boosting | NA / **PS9** |
| 11 | Fri {% include lab-link.html id="unit-11-1" label="Nov 13" %} · Mon {% include lab-link.html id="unit-11-2" label="Nov 16" %} · Wed {% include lab-link.html id="unit-11-3" label="Nov 18" %} | Dimensionality reduction: PCA (t-SNE/UMAP demo) | **PS9** / **PS10** |
| 12 | Fri {% include lab-link.html id="unit-12-1" label="Nov 20" %} · Mon {% include lab-link.html id="unit-12-2" label="Nov 23" %} · Mon {% include lab-link.html id="unit-12-3" label="Nov 30" %} | Clustering: mixture models → k-means; validating *k* | **PS10** / NA |
| 13 | Wed {% include lab-link.html id="unit-13-1" label="Dec 2" %} · Fri {% include lab-link.html id="unit-13-2" label="Dec 4" %} · Mon {% include lab-link.html id="unit-13-3" label="Dec 7" %} · Wed {% include lab-link.html id="unit-13-4" label="Dec 9" %} | **ACT III EXAM Wed Dec 2** (no AI, closed book — units 10–12), then the project launches and the rest is studio | — *the project* |

**Unit 13 is the project unit** and has four sessions rather than three — it carries the term's
last meeting, Wed Dec 9, and assigns no problem set. **PS10, due Fri Nov 20, is the last one.**

### Holidays, recesses, and the two odd days

| | |
|---|---|
| Mon **Sep 7** | Labor Day — no class. Falls inside unit 1, between Sep 4 and Sep 9 |
| Mon **Oct 12** | Indigenous Peoples' Day — no class. BU substitutes a Monday schedule on **Tue Oct 13**, which is unit 6's second session. It is the only substitute day of the term; Labor Day is not made up |
| Wed **Nov 25** – Sun **Nov 29** | Thanksgiving recess — no class. Falls inside unit 12, between Mon Nov 23 and Mon Nov 30. Unit 12 assigns no set, so the recess lands in a stretch with nothing due |
| Thu **Dec 10** | Last day of classes. We do not meet Thursdays, so **Wed Dec 9** is our last meeting |
| **Dec 11–13** · **Dec 14–18** | Study period · final exams period — **no exam for this course** |

**Wed Nov 11 is a class day.** Veterans Day is not a BU holiday in Fall 2026.

## Exams

| | When | Covers | Format |
|---|---|---|---|
| **Midterm** | Fri Nov 6 | Units 1–9 — simulating processes through generalized linear models | Closed book, no AI, code reading |
| **Act III exam** | Wed Dec 2 | Units 10–12 — trees, PCA, clustering | Closed book, no AI, code reading |

Each takes the first part of its session; the rest of that session belongs to what comes next —
trees after the midterm, the project launch after the Act III exam.

**There is no exam during finals period.** After Dec 2, every remaining session is project studio.

## The synthesis project

The course in miniature, and the culminating assessment: design a generative process for a
biological question you care about, then show what a method can and cannot recover from it. The same
thing you will have done ten times by then, on a problem you chose.

| | When |
|---|---|
| **Launch** | Wed Dec 2, after the Act III exam |
| **Studio** — instructors and TAs in the room | Fri Dec 4 · Mon Dec 7 · Wed Dec 9 |
| **Proposal** | Mon Dec 7 |
| **Project bundle** | during the finals period, Dec 14–18 |
