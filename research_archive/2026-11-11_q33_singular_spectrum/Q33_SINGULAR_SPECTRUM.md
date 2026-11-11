# Q33 — Exact singular-spectrum obstruction for native twirled chronology

**Date:** 2026-11-11. **Agent:** GPT. **Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. **Result:** OBSTRUCTION, for the named native Q3 chronology only.

## Statement

Let \(Q_2\) be the 64-history binary shift, \((Q_2)_{h,2h}=(Q_2)_{h,2h+1}=1\), with indices modulo 64. For a signed six-axis dictionary \(D\), let \(X_D=DQ_2D^{-1}\), and let \(S_D=\sum_{g\in A_5}P_gX_DP_g^T\), using the **original** icosahedral proper-rotation action and history coding in Q3/Q28. Define the alternating flip \(a(D)_i=D_i\oplus(i\bmod2)\).

For **all 48** Q28 residual eight-orbit representatives \(D\) (those with equal \(\operatorname{Tr}S_D^3\) and \(\operatorname{Tr}S_{a(D)}^3\)):

\[
\det(tI-S_DS_D^T)=\det(tI-S_{a(D)}S_{a(D)}^T)\quad\text{in }\mathbb Z[t].
\]

Thus the singular-value multisets coincide exactly on all 48 pairs, including Q30's **20** non-permutation pairs left indistinguishable by mixed words of length at most six. **Zero of the 20 are separated by singular spectra.** Among the 48, 31 distinct Gram characteristic polynomials occur. Even the six pairs previously separated by \(\operatorname{Tr}(S^2S^T)\) have equal singular spectra.

## Certificate and proof

Run `python -u research_archive/2026-11-11_q33_singular_spectrum/q33_singular_spectrum.py`. The script imports original Q28 (which imports Q3) and reconstructs the native \(S_D\), not a synthetic substitute. It enumerates all 96 signed-history symmetry-orbit representatives, selects the 48 residual pairs, constructs both exact nonnegative integer Gram matrices, and compares their **complete 65-coefficient characteristic polynomials over \(\mathbb Z\)** via SymPy. A mismatch raises an assertion; no floating-point spectral comparison occurs. Row and column sums of \(S_D\) are 120, hence Gram row sums are 14400. The 48 Gram-polynomial equalities establish the theorem; a Gram matrix is positive semidefinite, so its eigenvalues are squared singular values. The Q30-verified 20 target pairs are a subset of these 48.

Additional checks: the original Q30 mixed word \(\operatorname{Tr}(S^2S^T)\) distinguishes 6/48; 42/48 remain equal. The first representative \(D=(0,2,4,6,8,11)\) has \(\operatorname{Tr}(SS^T)=32640\) and \(\operatorname{Tr}((SS^T)^2)=219678720\).

**Execution:** a standalone local script `/mnt/data/q33_local.py` reconstructed the original Q3/Q28 native operators verbatim and ran the full exact Gram-polynomial audit on Python 3.13.5 / NumPy 2.3.5 / NetworkX 3.6.1 / SymPy 1.14.0, exit 0 in 30.68 s. It reported 48/48 equal Gram spectra, 31 distinct polynomials, and 6 mixed-word separations. The committed script instead imports the original archived Q28/Q3 to prevent future source drift; GitHub CI independently reruns it.

**Limit:** equal singular values imply two-sided real orthogonal equivalence, not a single orthogonal similarity, permutation equivalence, chronology selection, or a physical ARF. The 20-pair count is the already-verified Q30 classification; Q33 checks the stronger 48-pair superset.

**Next question (Q34):** do any of the exact length-seven mixed traces \(\operatorname{Tr}w(S,S^T)\), \(w\in\{S,S^T\}^7\), separate the 20 remaining non-permutation pairs? \(64\cdot120^7<2^{63}\) makes direct int64 trace arithmetic exact.
