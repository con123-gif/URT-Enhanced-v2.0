# Newton’s Cathedral — full K64 reconstruction of the historical ARF poles

**Date:** 9 November 2026 · **Execution status:** exact symbolic projector checks PASS against the **original unmodified** 29 October 2026 64×64 chiral-hybridisation source, retrieved from the user's ChatGPT Library. **No GitHub or Library writes**, no third-party source material.

## Original research sources

1. `Cathedral_64_Chiral_Hybridization_2026-10-29.md` (Library) and its corresponding `cathedral_64_chiral_hybridization_2026_10_29.py` — explicit full 64×64 matrix in the original `12_A+12_B+20_A+20_B` basis, chiral coupling and protected hidden blocks. Its already-established characteristic polynomial contains `(z−7)^9` and `(z−5)^8`.
2. `Cathedral_64_History_Double_Gap_Theorem_2026-10-29.md` (Library) — exact two-sheet hidden `3(4),5(8),7(4)` spectrum as a subrepresentation of the 64-state coupled operator.
3. `Newton_Cathedral_v89_Universal_Projection_SelfEnergy_Theorem.md` and `Newton_Cathedral_v101_Full_ARF_Operator_Ledger.md` (Library) — original ARF resolvent concept and full four-line historical formula.
4. `conversation_archive/2026-09-01_to_2026-09-10.md` (primary GitHub) — original September 9 self-energy `Σ_ARF(z)=(δ★³/9)/(7-z)+(γ/8)/(5-z)`; full four-line source derivation historically open.

## Exact new operator connection

Let `K=K64` be the previously specified and archived real symmetric 64×64 coupled vertex/face history matrix. Its original exact source has `Tr(K)=304`, `Tr(K²)=1826`. Let `P7` and `P5` denote the **spectral projectors of the full K** onto exact energies 7 and 5, respectively.

- Its energy-7 space has dimension 9: the *five-dimensional icosahedral outer-vertex eigenvalue-6 sector*, shifted to 7 by the centered-cell construction, plus the *four-dimensional antisymmetric hidden face eigenvalue-5 sector*, shifted to 7 by two-sheet coupling.
- Its energy-5 space has dimension 8: the *four-dimensional symmetric hidden-face eigenvalue-5 sector* plus the *four-dimensional antisymmetric hidden-face eigenvalue-3 sector*, shifted to 5.
- The additional chiral vertex–face hybridisation does not mix or shift these modes: the hidden couplings vanish by `BP_hidden=0`, and the vertex fiveplet is in `12_A`, while the interaction links `12_B` to antisymmetric face fields.

Thus, **inside the full 64-dimensional original matrix**, exact identities hold:

`P7²=P7=P7ᵀ`, `K P7=7 P7`, `Tr(P7)=9`;

`P5²=P5=P5ᵀ`, `K P5=5 P5`, `Tr(P5)=8`;

`P7 P5=0`.

We explicitly reconstructed these projectors using original combinatorial incidence, not numerical eigenspace fitting:

- `P_vertex_7 = -(L_I (L_I²−10L_I+20 I12))/24`, rank 5;
- `P_hidden_7 = P_hidden-face-eig5 ⊗ P_relative`, rank 4;
- `P_hidden_5 = P_hidden-face-eig5 ⊗ P_common + P_hidden-face-eig3 ⊗ P_relative`, rank 8.

These yield the spectral rational functions, away from the poles:

`Tr[P7 (K−zI)^−1] = 9/(7−z)`;

`Tr[P5 (K−zI)^−1] = 8/(5−z)`.

Since `K` has two zero modes, at `z=0` these are interpreted as **projected/reduced inverses** (or as meromorphic limits of the displayed projected resolvents), not an ordinary inverse of the singular full `K`.

With original frozen `γ=1/81` and `δ★=80π/(1053φ)`, the following **specified source-weighted trace** therefore gives exactly the September ARF:

\[
\begin{aligned}
 \Sigma_{\mathrm{trace}}(z)
 &= \gamma\delta_\star^3\operatorname{Tr}\big[P_7(K-zI)^{-1}\big]
  +\frac{\gamma}{64}\operatorname{Tr}\big[P_5(K-zI)^{-1}\big]\\
 &=\frac{\delta_\star^3}{9(7-z)}+\frac{\gamma}{8(5-z)}
 =\Sigma_{\mathrm{ARF}}(z).
\end{aligned}
\]

At zero frequency,

`delta_eff = delta★ − Σ_ARF(0) = delta★ − delta★³/63 − gamma/40 = 0.147151219732012...`.

This precisely recovers both ARF **residues and pole positions from real pre-existing full K64 eigenprojectors plus stated source weights**. It establishes a stronger structural connection than merely rewriting two rational numbers as arbitrary Schur couplings.

## What is and is not derived

**Derived with exact source code:** projectors, ranks, block origins, energies, meromorphic trace identities and their complete equality to the historical ARF poles **under the explicitly displayed source weights**. No fitted numerical mass/coupling is used.

**The unresolved physical-selection rule:** why the scalar vacuum observable couples to `P7` with weight `γ δ★³` as an **unnormalized** trace while it couples to `P5` with weight `γ/64` as a **history-normalized** trace. Their exact rational outputs are now geometric, but **their relative normalization is not forced by the primitive** `q=(π/e)exp(2πi/φ²)`. This is the precise micro-to-observable theorem needed, not a reason to restart the Cathedral or its existing finite proofs.

The separate historical `β=1/4` triple-return identity is exact: `β³/(1−β³)=1/63`. It is a compatible independent recursion; proving primitive URT forces that selector and its identification with the same 7-pole is still a source-level step.

The v101 ledger expression `τ8(P_4_5 K5^−1)` must be interpreted carefully: if the projector rank is 4 and `K5=5I`, its value is `4/(8×5)=1/10`, not `1/40`. The **full coupled 64-state normalized trace** above gives `8/(64×5)=1/40` with no ad hoc correction. This is a concrete route for reconciling the older ledger, not an unauthorized edit of it.

## Electromagnetic numeric reconciliation — not yet physical identification

The historical ARF electromagnetic scalar, **using the corrected rather than bare rail**, is

`alpha_inverse_ARF = 137 + delta_eff²/π² + 3/(64φ) + 1/(79φ²) = 137.035999312395663...`.

The older current GitHub `newtons_cathedral/arf.py` computes the same expression with **bare** `delta★` despite a comment invoking `d_eff`, yielding `137.036010048149703...`; the difference is `0.000010735754...` and deserves reconciliation. This audit does not change that code.

NIST CODATA-2022 recommends `α^−1 = 137.035999177(21)` (https://physics.nist.gov/cuu/pdf/all.pdf), so the ARF-corrected expression differs by `+1.35395663×10^−7`, about 6.45 quoted standard uncertainties **if interpreted as an exact physical prediction**. Therefore numerical proximity alone is not a validated physical identification. The separately frozen October alpha polynomial is an independent branch and must not be swapped silently to improve the comparison.

## Exact execution

`CATHEDRAL_ARF_FULL_K64_SPECTRAL_PROOF_2026-11-09.py` executes the **original** `cathedral_64_chiral_hybridization_2026_10_29.py` as the only operator source and then checks all the full 64×64 projector identities, trace invariants, exact two-pole residues, numerical spectrum, ARF rail and electromagnetic arithmetic. Original source files were read from the user's Library and left unchanged. `OPENBLAS_NUM_THREADS=1 python CATHEDRAL_ARF_FULL_K64_SPECTRAL_PROOF_2026-11-09.py --source /path/to/cathedral_64_chiral_hybridization_2026_10_29.py`.

**Status:** Exact full-operator ARF spectral reconstruction **conditional on the displayed vacuum-source weights**. The original four-line ARF source/pole/current/continuum identification is not claimed complete.
