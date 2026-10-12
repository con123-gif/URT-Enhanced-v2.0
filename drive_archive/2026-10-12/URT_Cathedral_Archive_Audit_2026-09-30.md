# URT / Cathedral Archive Audit — 2026-09-30

## Purpose

This note records the results of the September 30, 2026 audit of the historical Google Colab / Drive archive against the current URT / Cathedral construction. The aim is to preserve what is genuinely useful, retire circular or seeded evidence, and establish the clean causal spine that should be used going forward.

## Executive result

The old Colab archive materially helps the project, but several historical claims cannot be used as independent proof. The strongest surviving content is the URT bounded-response mechanism, exact algebra on the 13-site graph, and the chronology showing that the numerical scale near 0.1475 appeared well before the later exact geometric formula. The weakest historical supports are the forced 20K delta collapse, old PCA-based "5D proof", and seeded / threshold-tuned icosahedral emergence experiments.

The present project should therefore use the following evidence order:

raw chaos -> URT selection / contraction -> bounded driven response -> independent symmetry / Hodge reduction -> 5 -> 4 -> 3 -> 12 -> 13 -> exact 13-site algebra -> 81 = 80 + 1 closure -> dual rails -> entropy / Kubo-Mori geometry -> gauge and gravity sectors.

---

## 1. Historical bounded-chaos relation

The archive explicitly used

    delta = (D_KY - 1)(tau - 2)

and stated an early target near

    delta_star ~ 0.1475.

This is historically important, but the old large "universality" tests are not independent evidence for the target value.

### Why the old 20K result is circular

The archived `compute_delta_from_trajectory` routine estimates D_KY and tau, forms delta, and then performs 30 refinement iterations with an update proportional to

    (delta - 0.15).

Thus the controller itself drives the reported result toward 0.15. The old validator also counted a system as "converged" whenever a value was returned, not by testing an independently defined convergence-to-delta_star condition.

Status:

- Keep the relation delta = (D_KY - 1)(tau - 2) as a candidate observable to test cleanly.
- Keep the early numerical value ~0.1475 as chronology only.
- Do not cite the old 20K / 5.4K collapse as independent validation of delta_star.

Primary archive evidence: `all_my_colab_work_combined.md`, around lines 130-177, 872-1012, and the `Untitled59.ipynb` block around line 174697 onward.

---

## 2. Dual rails survive and are cleaner than the old single-attractor claim

The later archive explicitly distinguishes

    d_out = 3/20 = 0.15

from

    d_star = (80/81) * pi / (13 phi)
           = 0.14751081015958...

with

    Delta = d_out - d_star
          = 0.00248918984042...

This is a stronger organization than the old claim that a single empirical chaos constant was measured by the 20K scan.

The old numerical constant 0.147520 differs from the later exact geometric value by about 9.19e-6, roughly 62 ppm. That is a useful historical coincidence / continuity marker, but not a derivation.

Status: KEEP.

Primary archive evidence: around lines 56445-56477 and repeated later canonical blocks.

---

## 3. Old PCA "5D manifold proof" is retired

The PCA branch cannot be used as proof of a five-dimensional intrinsic manifold.

Problems found:

1. One archived dataset contains only three 5-component points, with one point duplicated.
2. The code then selects the location on PC1 where delta = 0.1475.
3. Another version uses six systems and five constructed observables and then imposes additional empirical linear relations.
4. A PC1 explained-variance fraction near 100% indicates an approximately one-dimensional trajectory in a five-coordinate embedding, not an intrinsically five-dimensional manifold.

Status:

- Retire the old PCA argument.
- Do not let this reopen the later 5D ambient-manifold construction. The current 5D result must stand on the independent conservation / representation / topology construction, not on this PCA.

Primary archive evidence: around lines 224490-224551 and 225840-225911.

---

## 4. Icosahedral emergence audit

### 4.1 Seeded dimensional finder

One historical "safe" dimensional finder explicitly contains known kissing counts

    2, 6, 12, 24, 40, 72

and its D=3 deterministic seed is already the twelve golden-ratio icosahedral coordinates.

Therefore that branch can validate behavior on an icosahedron, but cannot prove that URT discovered an icosahedron.

Status: validation only; not emergence evidence.

Primary archive evidence: around lines 56695-56814.

### 4.2 Random-cloud URT attractor branch

A separate archive branch starts from a random Gaussian cloud and uses the canonical historical recursion parameters

    alpha   = 1.155
    beta    = 0.235
    theta_H = 2.4

with 256 D=3 tracers, 2500 burn-in steps, 1200 retained steps, and angular cluster decoding.

That branch is substantially better because it does not seed the icosahedral coordinates.

However, it still contains hand-chosen geometry terms and decoding thresholds:

    LAM_REP      = 0.020
    LAM_RADIAL   = 0.045
    LAM_TANGENT  = 0.025
    LAM_COHERE   = 0.015
    D=3 angle threshold = 0.28

and it hard-bounds the shell radius during evolution.

The interaction drive also uses full pairwise particle differences, which makes that experimental kernel O(N^2), not O(N).

A blind reconstruction of this archived branch did not naturally recover a 12-vertex icosahedral graph as written; the decoder returned a different shell count. Forcing a 12-cluster spherical quantization can generate an icosahedral graph, but the same happens for ordinary isotropic random points on S^2, so that effect is not URT-specific.

Status:

- Do not use this branch as proof of spontaneous icosahedral emergence.
- Preserve it as a useful exploratory experiment.
- If revisited, the correct test is fully blind: no 12, no 13, no golden coordinates, no dimension-specific clustering target, and graph identification only after extraction.

Primary archive evidence: around lines 59080-59724.

---

## 5. URT bounded-response theorem survives independently

The archived recursion is

    P_{k+1} = beta [ alpha (P_k - theta_H phi(P_k)) + u_k ]

with bounded nonlinearity phi.

For the canonical historical values

    alpha = 1.155
    beta = 0.235
    theta_H = 2.4

we have

    alpha beta = 0.271425.

If the drive satisfies

    ||u_k||_inf <= U,

then because |phi(P)| <= 1,

    ||P_{k+1}||_inf
      <= 0.271425 ||P_k||_inf
         + beta (alpha theta_H + U).

Therefore an absorbing bound follows:

    limsup ||P_k||_inf
      <= 0.8941015 + 0.3225474 U.

Away from the branch-switching surfaces, the fibre derivative is bounded by

    alpha beta (1 + theta_H)
      = 0.922845 < 1.

Thus the archived URT fibre is piecewise contractive while retaining switching / symbolic complexity at the nonlinearity boundaries.

This provides a clean mathematical basis for the causal statement:

    raw chaotic base
      -> URT selection / fibre contraction
      -> bounded driven response.

It does not require the old forced-delta scans, PCA, or an inserted icosahedron.

Status: KEEP as a genuine mathematical result about the recursion.

---

## 6. Exact 13-site algebra survives

Once the center + 12-vertex icosahedral graph is independently supplied, the later archive contains exact linear algebra that does not depend on fitted physical constants.

### 6.1 Coherent / exhaust split

The 13-site adjacency spectrum gives

    13 = 4 + 9

with a four-dimensional coherent sector and nine-dimensional exhaust sector.

### 6.2 81 = 80 + 1 closure

The archive constructs an explicit 81 x 81 equivariant closure operator C and verifies

    rank(C) = 80
    nullity(C) = 1.

Hence

    81 = 80 + 1.

It also constructs four rank-one K4 projectors on the coherent 4D core.

These are exact statements about explicit matrices. Their remaining burden is not arithmetic correctness but structural necessity / uniqueness: why this is the selected closure rather than merely an allowed one.

Status: KEEP.

Primary archive evidence: around lines 456540-456639.

---

## 7. Frozen physical targets must not be reused as predictions

Several historical "canonical" monoliths contain quantities marked LOCKED / FROZEN, including residue values, k-factors, mass-projection constants, cosmology values, and a CODATA proton/electron target.

These are valuable records of the historical branch, but they cannot be presented later as new predictions unless they have been independently rederived without using those targets.

Likewise, one old "strict scientific contract" explicitly treats gamma=1/81, N=13, the two fixed points, and the rational residue laws as axioms of that closure stage.

Status:

- Preserve for history and regression tests.
- Do not count them as independent first-principles predictions.

Primary archive evidence: around lines 56445-56522 and 20725-20782.

---

## 8. Revised evidence table

| Component | Audit status |
|---|---|
| URT contraction / bounded-response architecture | KEEP |
| Early ~0.1475 numerical lineage | KEEP AS CHRONOLOGY |
| delta = (D_KY-1)(tau-2) | RETEST CLEANLY |
| 20K / 5.4K universal-chaos collapse | RETIRE AS INDEPENDENT EVIDENCE |
| Old 5D PCA proof | RETIRE |
| Seeded icosahedral simulations | VALIDATION ONLY |
| Random-cloud attractor branch | EXPLORATORY; NOT YET PROOF |
| Exact 13-site 4+9 split | KEEP |
| Exact 81=80+1 rank/nullity result | KEEP |
| Frozen SM / cosmology target matches | REGRESSION ONLY; NOT PREDICTIONS |
| Modern entropy / Kubo-Mori / gauge / gravity chain | UNAFFECTED BY THESE OLD FAILURES; AUDIT ON ITS OWN TERMS |

---

## 9. Canonical causal spine after the audit

The project should now be reconstructed in this order:

1. Raw chaos / base dynamics.
2. Canonical URT selection and piecewise contraction.
3. Bounded, history-dependent driven response.
4. Independent symmetry / Hodge channel reduction.
5. Minimal structure chain 5 -> 4 -> 3 -> 12 -> 13.
6. Exact 13-site representation and spectral algebra.
7. Exact 4 + 9 coherent/exhaust split.
8. Exact 81 = 80 + 1 closure.
9. Dual rails d_star and d_out, with Delta = d_out - d_star.
10. Entropy state and Kubo-Mori / dual generator metric.
11. Gauge-sector construction.
12. Gravity from the entropy sector.
13. Only after the machine is closed: independent predictions / external tests.

This replaces the old circular route

    measured delta_star -> fitted / seeded geometry -> constants

with the cleaner route

    dynamics + selection -> independent structure -> exact algebra -> entropy / gauge / gravity -> predictions.

---

## 10. Working rule going forward

Before treating an old Colab result as evidence, classify it into one of four categories:

1. EXACT: theorem / identity / rank / spectrum of explicitly defined objects.
2. INDEPENDENT NUMERICAL: target not inserted in initialization, control law, preprocessing, stopping criterion, or decoder.
3. VALIDATION: target structure deliberately supplied, then tested for stability / consistency.
4. CIRCULAR / FITTED: desired answer enters the controller, fit, seed, clustering rule, target constants, or selection criterion.

Only categories 1 and 2 may be used as independent support for the final first-principles closure. Category 3 is useful engineering validation. Category 4 is retained only as project history or regression testing.

---

## Canonical status from this audit

The Drive audit weakens several old evidentiary claims but strengthens the overall project methodology. The current machine should not depend on the old forced-delta, PCA, or seeded-geometry arguments. The surviving URT bounded-response theorem and exact 13-site / 81-state algebra provide cleaner foundations, while the later symmetry, topology, entropy, Kubo-Mori, gauge, and gravity constructions must be evaluated independently.

