# ML Topic Inventory — What a Complete Syllabus Could Contain (INTERNAL)

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

> **Reference inventory, August 2026.** Built to answer a specific worry: that BF550's
> design→build architecture delivers depth on a small number of methods while leaving graduates
> unable to *recognize* methods they will meet in their first week of work. The inventory maps
> 111 topics across twelve domains and scores each against the twelve-cycle schedule, so the cut
> is made deliberately rather than by omission.
>
> Companion deliberation: [`practice-assessment-alignment.md`](practice-assessment-alignment.md).
> Browsable version: <https://claude.ai/code/artifact/2614a230-202d-4cf0-9d13-0a9fb40105f9>

## How to read the columns

**Coverage** — status against the schedule in [`course-structure.md`](course-structure.md) §4:

| Value | Meaning |
|---|---|
| `taught` | Has a Design session or a Build problem |
| `touched` | Appears inside another topic, without its own treatment |
| `absent` | Not in the course |

**Priority** — what a BF550 graduate needs, which is deliberately *not* the same as what they
should implement:

| Value | Meaning |
|---|---|
| `core` | Must be able to build it, or reason about it at build depth |
| `recognize` | Must be able to name it, choose it, and critique it — **not** implement it |
| `optional` | Defensible to drop entirely from a first graduate course |

The `recognize` tier is the load-bearing idea. Learning objective 3 already asks students to
*choose* a method and justify the choice, and that is assessable over a far wider set of methods
than any student could implement in a term.

## Totals

| Coverage | Count |
|---|--:|
| taught | 32 |
| touched | 24 |
| absent | 55 |
| **total** | **111** |

Against 13 Design sessions in the Fall 2026 calendar.

## The three findings

**1. The depth is not the problem.** Every `taught` topic is taught to implementation depth —
specified, tested, built. That is deeper than a conventional lecture course reaches, and it is
what the studio and Share time buys. Trading that time for coverage would spend the course's
best asset to fix a different problem.

**2. The breadth gap is concentrated, not diffuse.** Of 55 absent topics, most are correctly
absent. Eleven are both `core` and `absent`:

- Gradient descent and convexity (A)
- Loss functions as likelihoods (A)
- Grouped and nested cross-validation (B)
- Batch effects and confounding (C)
- Normalization: CPM, TPM, quantile, VST (C)
- Generalized linear models; Poisson and negative binomial regression (E)
- Boosting: AdaBoost, gradient boosting (F)
- Hierarchical clustering; linkage, dendrograms (I)
- Distance metrics: Euclidean, correlation, Jaccard (I)
- Graph-based clustering: Louvain, Leiden (I)
- Benchmark contamination and leakage in public data (L)

Three are especially awkward for a *bioinformatics* program: **NB-GLMs** (DESeq2 and edgeR are
NB-GLMs, and cycle 2's problem is literally differential expression, so students meet the question
but never the field's actual answer to it); **hierarchical clustering** (every published expression
heatmap); and **graph-based clustering** (the Seurat/Scanpy default, what they run on day one).

**3. Recognition and implementation are separable.** Thirty-one topics are marked `recognize`.
They need a name, a shape, a characteristic failure, and a reason to reach for them — not a build
slot. This is where most of the breadth gap can be closed without spending studio time.

## Four levers considered, cheapest first

1. **Widen the reading, not the calendar.** The course is flipped; first exposure is the chapter.
   Nothing requires one cycle = one algorithm. Cycle 9 becomes "trees → forests → boosting" as a
   family arc; cycle 11 becomes "k-means → hierarchical → Leiden" as three answers to one question.
   Costs zero calendar and closes roughly half the core gaps.
2. **Give Share sessions a contrast method.** "Break the method" extends naturally to breaking it
   *against a rival* on the same data. ~12 additional named methods across the term, met as
   comparisons rather than builds — the natural home for the `recognize` tier.
3. **Reclaim cycle 12.** "Frontiers: neural nets, not examined" is three sessions producing no
   assessed learning — the largest recoverable block, and deep learning (domain K) is the largest
   mismatch between what the course teaches and what a 2026 graduate is assumed to know.
4. **Depth branches, revisited.** [`future-depth-branches.md`](future-depth-branches.md) already
   describes the mechanism for breadth-without-build-time. Its stated reintroduction trigger is
   boredom in the strong tail; coverage is a second, independent trigger. Still a year-two answer —
   the reason it was cut (too many moving parts in year one) stands.

## What to protect

Domain L — specification before implementation, verifying generated code, reading implementations
for assumptions — is the one area where BF550 is ahead of the field rather than behind it. Whatever
gets cut, that should not.

## The inventory

### A. Mathematical foundations

The substrate everything else stands on. BF550 covers this well in Act I, and the probabilistic framing is the course's spine — but optimization is conspicuously missing, which becomes a problem the moment gradient-based methods appear.

| Topic | Why it matters in biology | Coverage | Priority |
|---|---|:--:|:--:|
| Distributions: binomial, Poisson, negative binomial | Read counts are NB-distributed; this single fact drives every RNA-seq tool | touched | core |
| Joint, marginal, conditional probability | The vocabulary for every generative model in the course | taught | core |
| Bayes' theorem; prior, likelihood, posterior | Variant calling, species assignment, diagnostic testing | taught | core |
| Maximum likelihood estimation | The unifying justification for nearly every estimator taught | touched | core |
| Sampling distributions, CLT, standard error | Act I's entire payload — the honest error bar | taught | core |
| Hypothesis testing and p-values | Still the lingua franca of every paper students will read | taught | core |
| Multiple testing: Bonferroni, FDR | 20,000 genes tested at once; without this every result is noise | taught | core |
| Bootstrap and permutation tests | The escape hatch when the null distribution is unknown — very common | touched | core |
| Linear algebra: projection, eigendecomposition, SVD | PCA is SVD; without it PCA is a black box students can only run | touched | core |
| Gradient descent and convexity | How logistic regression, SVMs, and every neural net are actually fit | absent | core |
| Loss functions as likelihoods | The idea that unifies the whole syllabus: MSE is Gaussian, cross-entropy is Bernoulli | absent | core |
| Information theory: entropy, KL divergence | Tree splitting criteria, sequence conservation, model comparison | absent | recognize |

### B. The learning problem

The conceptual frame that separates someone who can run scikit-learn from someone who can be trusted with a result. BF550's strongest domain — cycle 5 carries most of it.

| Topic | Why it matters in biology | Coverage | Priority |
|---|---|:--:|:--:|
| Supervised vs. unsupervised vs. self-supervised | The first fork in choosing a method; self-supervision now dominates protein models | taught | core |
| Train / validation / test discipline | The most commonly violated rule in published bioinformatics | taught | core |
| Overfitting, underfitting, capacity | p ≫ n means every bio model overfits by default | taught | core |
| Bias–variance tradeoff | Explains why regularization and ensembling work at all | touched | core |
| Cross-validation: k-fold, stratified, leave-one-out | Small-n biology makes fold choice consequential, not cosmetic | taught | core |
| Grouped and nested cross-validation | Samples from one patient or one batch are not independent | absent | core |
| Data leakage | Feature selection before CV inflates accuracy — a career-ending error | taught | core |
| Curse of dimensionality | The defining regime of omics: 20,000 features, 40 samples | touched | core |
| No free lunch; inductive bias | Why "which algorithm is best" is the wrong question | touched | recognize |

### C. Data, features, and the bio-specific traps

The domain where bioinformatics diverges most sharply from a generic ML course, and where a graduate is most likely to be the only person in the room who notices the problem. Currently the thinnest area relative to its practical weight.

| Topic | Why it matters in biology | Coverage | Priority |
|---|---|:--:|:--:|
| Batch effects and confounding | The single most common cause of false discovery in genomics | absent | core |
| Class imbalance | Pathogenic variants, rare cell types — the positive class is always tiny | touched | core |
| Normalization: CPM, TPM, quantile, VST | Library size differences will dominate any unnormalized expression analysis | absent | core |
| Feature scaling and standardization | PCA and k-means are meaningless on unscaled heterogeneous features | touched | core |
| Missing data: MCAR / MAR / MNAR, imputation | Dropout in single-cell data is MNAR and imputing it naively invents biology | absent | recognize |
| Feature engineering and encoding | k-mers, one-hot sequence encoding, pathway scores | touched | recognize |
| Feature selection: filter, wrapper, embedded | Biomarker discovery is a feature-selection problem wearing a lab coat | touched | core |
| Outliers and robust statistics | One failed library can distort an entire differential expression run | absent | recognize |

### D. Supervised learning — generative

Models that describe how the data was produced. This is BF550's pedagogical entry point into ML and it works well. The notable absence is HMMs, the classical bioinformatics workhorse.

| Topic | Why it matters in biology | Coverage | Priority |
|---|---|:--:|:--:|
| Naive Bayes (multinomial, Gaussian, Bernoulli) | Taxonomic classification of reads; the standard in metagenomics | taught | core |
| The conditional independence assumption and its violation | Adjacent k-mers are correlated; the model works anyway, and knowing why matters | taught | core |
| Pseudocounts and smoothing | Unseen k-mers zero out a whole product without it | taught | core |
| Linear and quadratic discriminant analysis | The Gaussian sibling of naive Bayes; still used in cytometry | absent | recognize |
| Hidden Markov Models; Viterbi, forward–backward | Gene finding, profile alignment, chromatin state segmentation (ChromHMM) | absent | recognize |
| Position weight matrices and motif models | Transcription factor binding; the oldest ML in the field | absent | recognize |
| Generative vs. discriminative as a design choice | When you want to simulate data vs. only draw a boundary | taught | core |

### E. Supervised learning — linear and discriminative

Two BF550 cycles cover this. The gap that stands out for a bioinformatics program is the generalized linear model for count data — the mathematics behind DESeq2 and edgeR, which is the most widely used statistical machinery in all of genomics.

| Topic | Why it matters in biology | Coverage | Priority |
|---|---|:--:|:--:|
| Linear regression, assumptions, diagnostics | The base case for every model that follows | taught | core |
| Logistic regression | The default clinical-risk model; interpretable odds ratios | taught | core |
| Ridge (L2) regularization | Makes regression possible at all when features outnumber samples | taught | core |
| Lasso (L1) and elastic net | Sparse biomarker panels — selection and fitting in one step | touched | core |
| Generalized linear models; Poisson and negative binomial regression | DESeq2 and edgeR are NB-GLMs; this is the field's workhorse | absent | core |
| Multinomial / softmax regression | Multi-class cell type assignment | absent | recognize |
| Mixed models and random effects | Repeated measures, patient-level clustering, pseudo-replication | absent | recognize |
| Support vector machines; margins | Was the default for expression classification for a decade | absent | recognize |
| Kernels and the kernel trick | String and graph kernels for sequences and molecules | absent | optional |

### F. Supervised learning — nonparametric and ensembles

Where the practical state of the art for tabular biological data actually lives. BF550 teaches trees and forests but stops before boosting, which is what most working bioinformaticians reach for first on a real prediction task.

| Topic | Why it matters in biology | Coverage | Priority |
|---|---|:--:|:--:|
| k-nearest neighbors | Cell type label transfer in single-cell pipelines | absent | recognize |
| Decision trees; splitting criteria, pruning | Interpretable rules a clinician will actually read | taught | core |
| Bagging and random forests | The robust default for omics classification for twenty years | taught | core |
| Feature importance and its pathologies | Impurity importance is biased toward high-cardinality features — routinely misread as biology | taught | core |
| Permutation importance | The honest alternative, and it exposes correlated-feature problems | touched | core |
| Boosting: AdaBoost, gradient boosting | Sequential error-correction — a genuinely different ensemble idea from bagging | absent | core |
| XGBoost / LightGBM in practice | Wins most tabular biological prediction tasks; students will be asked about it in interviews | absent | recognize |
| Stacking and model ensembling | How competition-grade predictors are actually assembled | absent | optional |
| Gaussian processes | Spatial transcriptomics, dose–response curves with uncertainty | absent | optional |

### G. Evaluation, selection, and interpretation

Cycle 5 is the anchor here and it is well-placed. Two gaps carry real professional weight: precision–recall analysis under imbalance, and modern interpretability, which is increasingly what a bioinformatician is asked to produce for a wet-lab collaborator.

| Topic | Why it matters in biology | Coverage | Priority |
|---|---|:--:|:--:|
| Confusion matrix; precision, recall, F1 | Sensitivity and specificity are the clinical vocabulary for the same quantities | taught | core |
| ROC curves and AUC | Universal in the literature; also universally over-trusted | taught | core |
| Precision–recall curves under imbalance | ROC looks excellent on a 1%-positive problem where the model is useless | touched | core |
| Calibration; reliability curves, Platt scaling | A pathogenicity score reported to a clinician must mean what it says | taught | core |
| Regression metrics: RMSE, MAE, R² | Dose–response and expression prediction | taught | core |
| Choosing a threshold for a decision | The point where a model becomes a clinical action | touched | core |
| Model selection: AIC, BIC, validation curves | Choosing k, choosing λ, choosing complexity | touched | recognize |
| Hyperparameter search: grid, random, Bayesian | Where the leakage sneaks back in if the search sees the test set | absent | recognize |
| Baselines and null models | The majority-class baseline that quietly beats a published model | touched | core |
| SHAP, LIME, partial dependence | What a collaborator asks for: "which genes drove this prediction?" | absent | recognize |
| Uncertainty quantification; conformal prediction | Abstaining on hard cases rather than guessing — increasingly expected clinically | absent | optional |

### H. Dimensionality reduction

One BF550 cycle. PCA is taught properly, which is the right priority, but NMF is a notable omission given how central mutational signature analysis has become.

| Topic | Why it matters in biology | Coverage | Priority |
|---|---|:--:|:--:|
| PCA; loadings, scree plots, variance explained | The first plot made on any expression matrix, and the first batch-effect detector | taught | core |
| PCA as SVD | Connects the method to the linear algebra rather than leaving it a recipe | touched | core |
| t-SNE and UMAP | Every single-cell paper has one; almost every reader over-interprets it | touched | core |
| Why t-SNE/UMAP distances and cluster sizes must not be read literally | The critique a graduate must be able to deliver in a lab meeting | touched | core |
| Non-negative matrix factorization | Mutational signatures and cell type deconvolution both rest on NMF | absent | recognize |
| ICA and factor analysis | Separating mixed biological signals | absent | optional |
| MDS and distance-based embedding | Ecology and microbiome ordination (PCoA) is standard practice | absent | optional |
| Autoencoders as nonlinear reduction | The bridge from PCA to deep representation learning | absent | recognize |

### I. Clustering

One BF550 cycle, built around k-means and mixture models. The two methods a graduate will actually encounter most — hierarchical clustering in every heatmap, and Leiden in every single-cell pipeline — are both absent.

| Topic | Why it matters in biology | Coverage | Priority |
|---|---|:--:|:--:|
| k-means and k-means++ | The pedagogical entry point; fast and everywhere | taught | core |
| Gaussian mixture models and EM | Soft assignment with a probability story; k-means as its limiting case | taught | core |
| Choosing k: elbow, silhouette, gap statistic | The question with no ground truth — Act III's thesis in miniature | taught | core |
| Hierarchical clustering; linkage, dendrograms | The default in every expression heatmap ever published | absent | core |
| Distance metrics: Euclidean, correlation, Jaccard | Correlation distance is standard for expression and changes every result | absent | core |
| Graph-based clustering: Louvain, Leiden | The actual standard in Seurat and Scanpy — what students will run on day one | absent | core |
| Density-based clustering: DBSCAN | Handles noise points and non-spherical shapes k-means cannot | absent | recognize |
| Spectral clustering | The mathematical link between graphs and clusters | absent | optional |
| Cluster stability and consensus clustering | The only honest defense of a cluster count in a paper | touched | core |

### J. Structured and specialized methods

Methods keyed to a data structure rather than a learning paradigm. Entirely absent from BF550, and mostly defensibly so — but survival analysis and causal reasoning are hard to justify omitting from a biomedical program.

| Topic | Why it matters in biology | Coverage | Priority |
|---|---|:--:|:--:|
| Survival analysis; Kaplan–Meier, Cox regression | Every cancer genomics paper ends in a survival curve | absent | recognize |
| Confounding, DAGs, and causal thinking | Separates "associated with" from "causes" — the field's chronic failure | absent | recognize |
| Network and graph methods; propagation | Pathway analysis, protein interaction networks, gene prioritization | absent | recognize |
| Bayesian networks and graphical models | Gene regulatory network inference | absent | optional |
| Hierarchical and empirical Bayes | Sharing information across genes — how limma and DESeq2 stabilize variance | absent | recognize |
| Time series and trajectory inference | Pseudotime ordering in developmental single-cell studies | absent | optional |
| Mendelian randomization | Causal inference from genetic instruments in epidemiology | absent | optional |
| Reinforcement learning | Experimental design, molecular optimization — rare in practice | absent | optional |

### K. Deep learning

Currently one unexamined "frontiers" session. This is the largest single mismatch between what BF550 teaches and what a 2026 graduate is expected to be conversant in — every seminar they attend and every job they interview for assumes some fluency here.

| Topic | Why it matters in biology | Coverage | Priority |
|---|---|:--:|:--:|
| Perceptron to multilayer network | Shows a neural net is stacked logistic regressions — continuous with the syllabus | touched | core |
| Backpropagation and automatic differentiation | Demystifies training; the same gradient descent from domain A | absent | recognize |
| Activations, initialization, normalization layers | The practical difference between a net that trains and one that does not | absent | optional |
| Regularization: dropout, weight decay, early stopping | Same bias–variance problem, new instruments | absent | recognize |
| Convolutional networks | Regulatory genomics: DeepBind, Basset, Enformer read sequence with CNNs | absent | recognize |
| Recurrent networks and LSTMs | Sequence modeling before transformers; still in older tools | absent | optional |
| Attention and transformers | ESM, AlphaFold, and every current protein and DNA language model | absent | recognize |
| Embeddings and representation learning | Protein embeddings as features for downstream models — a very common workflow | absent | recognize |
| Transfer learning and fine-tuning | How a lab with 200 samples uses a model trained on millions | absent | recognize |
| Variational autoencoders | scVI is a VAE and is standard single-cell infrastructure | absent | optional |
| GANs and diffusion models | Protein and molecule generation (RFdiffusion) | absent | optional |
| Graph neural networks | Molecular property prediction; interaction networks | absent | optional |

### L. Practice in the AI era

BF550's genuine differentiator, and already its strongest suit — this is the domain where the course is ahead of the field rather than behind it. Worth protecting when the cuts are made.

| Topic | Why it matters in biology | Coverage | Priority |
|---|---|:--:|:--:|
| Specifying a method before implementing it | The core professional skill the course is built around | taught | core |
| Verifying generated code with hand-computed tests | The only defense against a plausible, wrong implementation | taught | core |
| Reading an implementation to recover its assumptions | What you do with any inherited pipeline or published tool | taught | core |
| Method selection and defending the choice | Where breadth without implementation becomes assessable | taught | core |
| Reproducibility: environments, seeds, provenance | A result nobody can rerun is not a result | touched | core |
| Benchmark contamination and leakage in public data | Homologous sequences across train and test inflate every published score | absent | core |
| Fairness, bias, and population representation | Polygenic scores trained on European cohorts transfer poorly and harm patients | absent | recognize |
| Model cards and documentation of limits | Increasingly required for clinical and regulatory deployment | absent | optional |
| How LLMs work; prompting, RAG, hallucination | Students use these daily; most have no model of the failure modes | touched | recognize |

