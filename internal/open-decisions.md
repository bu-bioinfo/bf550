# Open Decisions (INTERNAL)

> **Internal planning index — not published to the course site.** Tracks the design
> decisions still to be made. Most are also GitHub discussion issues; comment there.
>
> Canonical structure: the published [schedule](../docs/schedule.md),
> [calendar](../docs/calendar.md), and [problem sets page](../docs/assignment-framework.md).
> [`course-structure.md`](course-structure.md) is **superseded** and retained for its reasoning.
> Superseded drafts and all answer-bearing material are in the private `bf550-instructor` repo.

> **Redesign, 14 Aug 2026.** The staggered design/build pipeline was replaced by weekly
> simulation-first problem sets. Decisions that existed only to serve the old machinery — the
> seat rotation, two problems in flight, the divergence rubric, the separate check-in bank — are
> closed as moot and removed below. See [`course-structure.md`](course-structure.md) for what was
> superseded and [`practice-assessment-alignment.md`](practice-assessment-alignment.md) for why.
>
> **Partial reversal, 16 Aug 2026.** Two of those — **the seal and the divergence analysis** — are
> reinstated inside the weekly format as sections 2 and 3 of each problem set, because removing them
> left computational thinking with no home: D2 (decompose) and D3 (select) had disappeared from the
> assignments entirely, and three of the five documented countermeasures against the widening-gap
> risk went with them. The expensive machinery stays retired — no seats, no strip, no separate
> check-in bank, no cycle vocabulary. **The divergence rubric is therefore reopened and is now
> blocking**, since divergence is graded every week rather than on six heavy problems.
>
> The load objection that closed "two problems in flight" applies to this in weaker form — a design
> section and a build section are in flight each week — and needs piloting rather than assertion.

## Blocking

| Decision | Where it surfaces | Tracking |
|---|---|---|
| **Session roles within a week** — the site says the topic opens in meeting 1 and the rest are working sessions. Whether the three meetings get named functions, and what happens in short weeks (1, 2, 13, 15 have fewer than three), is unresolved | schedule, calendar | new — needed before the textbook fixes its per-week structure |
| **Grade weights need sign-off.** Now problem sets 40 / midterm 10 / Act III 10 / project 35 / participation 5. Changed because check-ins were absorbed into the per-set no-AI questions — and because the previous published weights summed to **105%** | assessment | new |
| **Midterm moved to Mon Nov 2** (was Wed Oct 21) to close Act II after GLMs. Later than a conventional midterm; continuous weekly assessment is the argument that it is acceptable | assessment, calendar | new |
| **Divergence rubric** — reopened 16 Aug. Now graded weekly, not on six heavy problems, so it needs to be cheap to apply and consistent across graders. Nothing in the CT literature to borrow: performance-based assessment of design-under-seal does not exist elsewhere | assessment | reopened — [computational-thinking-basis §8](computational-thinking-basis.md#8-what-is-ours-and-open) |
| **Weekly load with three sections** — practice + design + build against a ~6.5 hr envelope including reading. The build section alone is roughly the current six-question set. Something has to shrink; likely some current build questions become practice | assignments | new — needs piloting before term |
| Finalize biological anchor problems, **written as questions rather than tasks** | schedule | [#1](https://github.com/bu-cds-bf550/bu-cds-bf550.github.io/issues/1) + author rule 1 |
| Select & provision the student coding agent — **and the textbook tutor, probably the same procurement** | syllabus, /about/ | [#3](https://github.com/bu-cds-bf550/bu-cds-bf550.github.io/issues/3) |

## Structure & pedagogy

| Decision | Where it surfaces | Tracking |
|---|---|---|
| **How Bayesian?** MLE/MAP + simulation-based uncertainty vs. full posterior/MCMC | lectures (cycles 3, 5, 7) | [course-structure §9](course-structure.md#9-open-and-pending) |
| **Simulation's scope** — leaning: front-load cycles 2–4 + Share-session diagnostic, not every cycle | lectures, Share sessions | [ml-pedagogy-design §2.1](ml-pedagogy-design.md#21-the-scope-of-simulation) |
| **Decomposition stopping rule** — how far down D2 should go | design-stage template | [computational-thinking-basis §8](computational-thinking-basis.md#8-what-is-ours-and-open) |
| **Productive uncertainty** — how much per problem, and whether to disclose the policy | assignments | author rule 3; disclosure currently assumed to happen once at term start |
| **What a strong D4 (anticipate failure) looks like** — least-taught step in the literature, no rubric anywhere | assessment | [computational-thinking-basis §8](computational-thinking-basis.md#8-what-is-ours-and-open) |
| Does D1 ("what process produced this data?") strain on non-probabilistic cycles like trees? | design-stage template | [computational-thinking-basis §8](computational-thinking-basis.md#8-what-is-ours-and-open) |
| Is computational thinking assessed anywhere **unaided**? | assessment | check-ins currently cover code reading only — **priority raised**, see [practice-assessment-alignment §7](practice-assessment-alignment.md#7-the-gap-nobody-was-looking-for) |
| **Exam-authoring constraint** — write down that both exams test *code reading*, not topic recall, before any items exist | assessment | [practice-assessment-alignment §3](practice-assessment-alignment.md#3-worry-3-is-real-but-it-is-an-exam-authoring-problem) |
| **Reframe synthetic/property tests as self-checking technique** — the answer to "how do I know I computed it right" with no trustworthy oracle | assignments, textbook | [practice-assessment-alignment §6.2](practice-assessment-alignment.md#62-three-sources-of-truth-arriving-at-different-times) |
| **TA briefing: the correct-student-vs-planted-defect case** — a student whose hand-computation is right while the given code is wrong experiences success as failure | advising, TA training | [practice-assessment-alignment §6.5](practice-assessment-alignment.md#65-residual-risk) |
| **Widening-gap monitoring** — how to track per-student check-in trajectories so struggling students' illusion of competence (Prather et al. 2024) is caught early | assessment, advising | [computational-thinking-basis §4.3](computational-thinking-basis.md#43-the-empirical-warning-the-widening-gap) |
| Per-problem deliverable rubrics and toolchain | assignments | [#5](https://github.com/bu-cds-bf550/bu-cds-bf550.github.io/issues/5) — bundle now settled ([course-structure §5](course-structure.md#5-what-the-student-actually-has-to-learn)) |

## Textbook & tutor

| Decision | Where it surfaces | Tracking |
|---|---|---|
| **Textbook toolchain: Quarto** recommended; environment pinning (`uv` vs conda) should match the course toolchain decision | textbook | [textbook-implementation §1](textbook-implementation.md#1-toolchain-quarto) |
| **Textbook repo** — create `bf550-textbook` under the org and add to session scope | textbook | [textbook-implementation §2](textbook-implementation.md#2-repository-its-own-repo) |
| Worked notebooks — textbook repo or course repo? Leaning: textbook (they are ungraded corpus) | textbook | [textbook-implementation §9](textbook-implementation.md#9-open-questions) |
| Exemplar chapter for stage 2 — ch. 3 or ch. 4? Leaning: ch. 4 | textbook | [textbook-implementation §9](textbook-implementation.md#9-open-questions) |
| Fetch chapter prose on demand, or bundle it in the skill? | textbook skill | [textbook-ai-design §10](textbook-ai-design.md#10-open-questions) |
| How does the tutor know which week it is — infer from chapter, or a date table? | textbook skill | [textbook-ai-design §10](textbook-ai-design.md#10-open-questions) |
| One skill, or a separate notation-decoder skill? | textbook skill | [textbook-ai-design §10](textbook-ai-design.md#10-open-questions) |
| **Authoring order** — the book must exist before the skill is useful, so the skill is realistically a year-two artifact unless a subset of chapters is prioritized | textbook | [textbook-ai-design §10](textbook-ai-design.md#10-open-questions) |
| **Design homogenization** — reduced but not zero; watch in year one, consider a tutor-discouraged control problem | Share-session share-out | [textbook-ai-design §8](textbook-ai-design.md#8-residual-risks) |
| No usage visibility with BYO agents — lose the "where is the book unclear" feedback loop | textbook revision | [textbook-ai-design §8](textbook-ai-design.md#8-residual-risks) |
| **Optional MCP server** (stage 6) — decide after a semester of skill use whether telemetry justifies the hosting, uptime, and institutional cost | textbook skill | [textbook-ai-design §4.1](textbook-ai-design.md#41-skill-or-mcp-server) |
| **Ask BU about logging student queries** before building any server that records them; anonymous/aggregate logging likely avoids the issue | textbook skill | [textbook-ai-design §4.1](textbook-ai-design.md#41-skill-or-mcp-server) |

## Course administration

| Decision | Where it surfaces | Tracking |
|---|---|---|
| **Synthesis project: presentation format at 50–60 students** — traditional presentations don't fit; candidates: poster/gallery session, parallel TA-run tracks, recorded lightning talks + structured peer review, written artifact + oral spot-defense sample | schedule, assessment | *(class size is internal-only)* [#6](https://github.com/bu-cds-bf550/bu-cds-bf550.github.io/issues/6) |
| Synthesis project scope: individual vs. team (team-of-2 would halve presentation and grading volume) | schedule, assessment | [#6](https://github.com/bu-cds-bf550/bu-cds-bf550.github.io/issues/6) |
| **Public git history still contains answer keys.** Assignment drafts and the v1 planted-defect inventories moved to the private `bf550-instructor` repo on 14 Aug 2026, but this repo is public and removal from HEAD does not remove them from history — the v1 archive README named planted defects with verified numbers. Options: accept (the material is superseded and being re-cut) or rewrite history (destructive; breaks clones and forks; needs an explicit decision). **Not done.** | repo hygiene | new |
| **Agentic grading assistance** — whether/how TAs use agents; needs a policy note before term | assessment | new |
| Written midterm logistics | assessment | [#7](https://github.com/bu-cds-bf550/bu-cds-bf550.github.io/issues/7) |
| BU/program policy statements; program-outcome mapping | syllabus, learning-objectives | [#8](https://github.com/bu-cds-bf550/bu-cds-bf550.github.io/issues/8) |
| AI attestation wording | syllabus | [#9](https://github.com/bu-cds-bf550/bu-cds-bf550.github.io/issues/9) |
| Credit-hour expectations | /about/ rationale | [course-design-rationale](course-design-rationale.md) |

## Settled

| Decision | Outcome |
|---|---|
| The design stage | **Design is a universal stage for every problem**, not a seat. Three seats remain (Implementer, Verifier, Reverse engineer) and are labels rather than a rotation |
| Story ↔ code exercises | Live in the **check-in quizzes**, not the problem framework |
| Design/implement sequencing | **Staggered pipeline** — design problem *N* in cycle *N*, build it in cycle *N+1* ([course-structure §2](course-structure.md#2-why-the-stagger-rather-than-one-problem-per-cycle)) |
| Design-step names | **D1 Frame · D2 Decompose · D3 Select · D4 Anticipate** — ours, grounded in but not adopted from any published CT framework ([computational-thinking-basis](computational-thinking-basis.md)) |
| Method selection in early cycles | D3 asks *"what properties would the right method need?"* early, maturing into genuine selection as the toolbox fills |
| Where content gets delivered | Flipped: the textbook carries first exposure (~2 hr/cycle), the Design session activates and elaborates, the Share session's critique clinic delivers by demonstration |
| Contact format & session naming | **Three 105-min sessions per cycle, named ① Design · ② Build · ③ Share** — never by weekday, because the stream drifts against the calendar ([course-structure §4.1](course-structure.md#41-the-session-stream-holidays-and-the-fall-2026-grid)). Fall 2026 grid published at `/calendar/` |
| Topic sequencing | **Three acts organized by "what is unknown?"** — regression to cycle 7, trees to cycle 9 post-midterm, clustering one cycle, t-SNE/UMAP a demo ([course-structure §4](course-structure.md#4-the-pipeline-calendar)) |
| Final assessment | **Act III exam, cycle 13 Design session (Mon Nov 30)** (cycles 9–11, no-AI code reading, 15%) + midterm cycle 8 (Wed Oct 21, 15%); **nothing in finals period** — the last four sessions are project studio. Weights 30/10/15/15/30/5, superseding [#2](https://github.com/bu-cds-bf550/bu-cds-bf550.github.io/issues/2) |
| Design-stage AI level | **AIAS 2** (published on the front page as "AI for brainstorming only") |
| Load shedding | `log.md` merged into `notes.md`; graded check-ins roughly every other cycle; the Design session's reading check-in is ungraded telemetry; the Share session runs as two blocks; published re-entry rule (missed design → hindsight critique) |
| Depth branches | **Deferred to a future offering** — complexity cut for the first run; full design + reintroduction checklist in [future-depth-branches.md](future-depth-branches.md). **Issue still to file** on `bu-cds-bf550/bu-cds-bf550.github.io` (ready-to-paste text in that doc §7) |
| Tutor delivery & textbook content | The textbook contains **no graded assignments by design**, so nothing needs sealing. The tutor ships as a **portable skill** students install; no visibility tiers ([textbook-ai-design §1](textbook-ai-design.md#1-the-founding-constraint-no-assignments-in-the-textbook)) |

Student-facing pages deliberately omit these notes; they live here and in the issues.
