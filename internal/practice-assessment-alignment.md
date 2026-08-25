# Practice, Assessment, and the Oracle Problem (INTERNAL)

> ## ⚠ Predates the current architecture
>
> Written before **14 Aug 2026**, when the staggered design/build pipeline was replaced by weekly
> simulation-first problem sets, and before **16 Aug 2026**, when the seal and divergence analysis
> returned as sections 2 and 3 of every set. Passages below referring to **Design / Build / Share
> sessions**, **cycles**, **seat names** (Implementer / Verifier / Reverse engineer), the **strip**,
> the **model card**, or **check-in quizzes** describe machinery the course no longer uses.
>
> **Canonical now:** the published [schedule](../docs/schedule.md) and
> [problem sets page](../docs/assignment-framework.md), plus
> `AUTHORING.md` and `GLOSSARY.md` in the private `bf550-instructor` repo.
>
> Retained for its reasoning, which mostly still applies. Not retained as instructions.

> **Deliberation record, August 2026.** Captures a design review that started as "are we covering
> enough ML?" and turned into three sharper questions: what practice each build seat actually
> generates, whether the two exams can fairly test it, and — the one with no clean answer yet —
> how a student checks a hand-computation when nothing in the materials is trustworthy by design.
>
> Companion inventory: [`ml-topic-inventory.md`](ml-topic-inventory.md). Nothing here is decided;
> the open items are indexed in [`open-decisions.md`](open-decisions.md).

---

## 1. The concern as originally stated

Three linked worries, in the instructor's words:

1. Students get no practice with most covered topics except what is built into the builds.
2. On builds where they are not writing code, they effectively get no practice at all.
3. It is therefore unfair to examine topics students had no chance to practice — which bears
   directly on the midterm (15%) and the Act III exam (15%).

And a constraint that bounds every answer: **more out-of-class work would make the course too
heavy.**

## 2. Worry 2 is inverted — the non-code seats are the *strongest* topic practice

This is the most consequential finding in the review, because acting on the original intuition
would have made things worse.

Rank the seats by how much of the method's mathematics passes through the student's own hands:

| Seat | Exercise type | What the student produces | Topic practice |
|---|---|---|---|
| **Verifier** | B (spec + code → tests) | Tests with **hand-calculated expected values** | **Strongest** — hand-computation *is* the exam skill |
| **Reverse engineer** | C (code + tests → spec) | A specification recovered by close reading | **Strong** — close reading *is* the exam format |
| **Implementer** | A (spec + tests → code) | Agent-generated code, annotated, with a failure log | **Weakest on the method itself** |

The Verifier seat requires computing a posterior, a sigmoid, or a centroid by hand in order to
write the docstring. The Implementer seat delegates the code to an agent; what it practices well is
*direction and verification*, which is valuable and is assessed elsewhere — but it is the seat where
the least of the method's arithmetic is exercised.

**Consequence:** responding to the worry by converting more cycles to code-writing would *reduce*
topic practice. The seats that look like "no practice" are the ones best aligned to the exams.

## 3. Worry 3 is real, but it is an exam-authoring problem

Both exams are specified as **code-reading** exams, and the biweekly check-in quizzes (10%, no-AI)
rehearse exactly that skill five times before the midterm. The practice-to-assessment loop for the
*skill* is therefore already sound and already distributed.

The failure mode is drift: a code-reading exam quietly becoming a topic-recall exam ("compute this
posterior", "why does ridge shrink coefficients"). *That* is the question with no rehearsal behind
it. A well-built code-reading question about naive Bayes does not require having implemented naive
Bayes — it requires reading fluency plus knowing what the method is trying to do, and that floor is
set by the reading and the Design session, which every student gets for every topic regardless of
seat.

**This should become a written authoring constraint before any exam items exist.**

## 4. The workload arithmetic, which bounds every remedy

At 4 credits, students owe roughly 12 hr/week. Class consumes 5.25 (3 × 105 min). The remaining
~6.75 is already committed:

| Item | Estimate |
|---|--:|
| Reading (one chapter + worked notebook; stated to students) | ~2.0 hr |
| Design worksheet (D1–D4) for problem *N* | ~2.0 hr |
| Finishing the starred artifact + `notes.md` for problem *N−1* | ~2.5 hr |
| **Total outside class** | **~6.5 hr** |

There is no slack. **Any added practice must re-target time already spent, or live in class.** This
single constraint eliminates problem sets and admits the four moves below.

One relief valve already exists and is worth remembering: the design stage is graded on *committing
on time, not on quality* ([`course-structure.md`](course-structure.md) §7), which is what makes it
safe to be wrong.

## 5. Four admissible moves

1. **Author the check-ins against coverage.** They are already biweekly, no-AI, code-reading, 10%,
   and five land before the midterm — and they are currently unspecified. Authoring rule to adopt:
   *each check-in reads code from a topic the student did not build that cycle.* Closes the coverage
   gap at zero added student workload, because the quiz was happening anyway.
2. **Assign seats pedagogically, not for authoring convenience.** §5 currently says which piece is
   withheld "varies for authoring reasons." Give the **Verifier** seat to the most examinable topics
   — naive Bayes, logistic regression, evaluation metrics — so students hand-compute exactly what
   the exam will show them as code. The seat had to be *some* seat; choosing it deliberately is free.
3. **Use Share block 1 as in-class rehearsal.** ~50 min per cycle is already budgeted to
   "generalize + critique clinic" on the previous topic. Two or three hand-computations or
   code-reading items there is rehearsal inside allocated time, with TAs present.
4. **Rebalance weights toward the rehearsed instrument.** The two high-stakes exams carry 30% while
   the check-ins rehearsing the identical skill carry 10%. If fairness is the worry, that ratio is
   backwards. **Check-ins 20% / midterm 10% / Act III 10%** holds the no-AI share at 40% while
   shifting weight onto the distributed, low-stakes, well-practiced instrument. Costs nothing and
   changes nothing about what students do.

## 6. The oracle problem

> *"If we're expecting them to hand-compute answers, how will the students know if they computed
> them correctly?"*

### 6.1 Why the obvious answer is wrong here

The Verifier seat is given a working implementation, so the reflex answer is "run it." **In this
course that is the wrong move**, because author rule 3 plants *"a real defect that does not announce
itself"* as one of four kinds of productive uncertainty. The provided implementation is a
**counterparty, not an answer key**. A student who back-fills the docstring value from the code's
output writes a passing test around a planted bug and has nothing to say in the divergence analysis.

Hand-computation is not busywork adjacent to the build — **it is the instrument that detects the
planted defect.** The shortcut does not merely skip learning; it defeats the assessment.

### 6.2 Three sources of truth, arriving at different times

| Source | When | Trustworthy alone? |
|---|---|---|
| **By construction** — a case whose answer follows from its structure | Immediate | **Yes** |
| **The given implementation** | Immediate | **No** — may carry a planted defect |
| **Share session block 1** | Within the cycle | Yes, but delayed |

**By construction** is the only self-sufficient one, and it is the real professional answer: compute
a case you know independently. A pure-GC window has GC fraction 1.0. Two exactly symmetric classes
give a posterior of 0.5. A single-point cluster's centroid is that point. Permuted labels give a
near-uniform p-value.

This is **already latent in the framework** — Type B requires a synthetic test and a property-based
test — but they currently read as extra test genres rather than as *the technique for checking
yourself when nothing will check you*. Reframing them costs a paragraph in
[`assignment-framework.md`](../docs/assignment-framework.md) and is probably the single highest-value
edit identified in this review.

**Triangulation is what breaks a tie.** Two sources give a disagreement; three give a diagnosis. If
the hand-computation and a constructed case agree against the implementation, the implementation is
wrong — a finding worth writing up. If the hand-computation disagrees with both, it is arithmetic.
The third source is free because the student builds it.

### 6.3 For the seats with no mechanical oracle

Reverse engineer (a recovered spec) and the Type D critique have no automatic check at all. Their
oracle is **social and delayed**: Share block 1. This means Share attendance is not enrichment — for
those seats it is the only place a student learns whether they were right. Worth stating plainly to
students, and worth weighing when considering any change that erodes Share time.

### 6.4 Two changes that would make this hold

- **Commit the prediction before running it.** The course already owns this pattern — the design is
  committed before materials unseal. Push it one level down: the hand-calculated value lands in a
  commit *before* the test is executed. Git history is the attestation, no new tooling, and it turns
  the implementation from an answer key into something that grades a prediction already made.
  Without this, the shortcut is undetectable in the final artifact.
- **Put a worked numeric example in each chapter's notebook.** §6's scaffolding argument — a fully
  worked design for an *analogous* problem — applies equally to arithmetic. A student comparing only
  final numbers is stuck; one who can compare *intermediate quantities* against a worked analogous
  case can localize the error alone. Ungraded, so no student workload and no TA time.

### 6.5 Residual risk

The student who computes **correctly** while the implementation carries the planted defect
experiences success as failure, and needs enough confidence to trust their own arithmetic over
working-looking code. That asymmetry lands hardest on students with the least background — the
widening-gap dynamic already flagged in
[`computational-thinking-basis.md`](computational-thinking-basis.md) §4.3. Studio is where a TA has
to catch it. **This belongs in the TA briefing; the materials do not handle it.**

## 7. The gap nobody was looking for

The review began with "are we covering enough ML?" The coverage gap turned out to be real but
narrow and cheaply closed (see the inventory). The larger misalignment is elsewhere:

**Computational thinking is never assessed unaided.** The design stage is where D1–D4 lives, it is
AIAS level 2, and it is explicitly *not graded on quality*. The course's most distinctive skill —
the one the whole architecture exists to teach — has no unaided assessment anywhere. The check-in
bank is the likely place to fix it, and this is already an open decision; this review raises its
priority.

## 8. Status

Nothing above is decided. The review also surfaced a **stale calendar derivation** — see
[`open-decisions.md`](open-decisions.md) — and was followed by a decision to consider a broader
re-envisioning of the course, on the grounds that the accumulated machinery has become hard to hold
in one head. **That re-envisioning may supersede parts of this document**; it is recorded so the
reasoning survives either way.
