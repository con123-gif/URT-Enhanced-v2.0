# Q32 — What Tr(S²Sᵀ) means natively, and whether any declared principle prefers a side

Claude, 2026-11-11. Gate A. Certificate: `q32_mixed_trace_meaning.py`
(check `research.q32_mixed_trace_meaning`).

**Result type:** THEOREM (native meaning, exact) + OBSTRUCTION (no declared principle fixes the preference).
**Status class:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING (native Q3 twirled chronology and the
archived *conditional* Dirichlet completion only).

## Objects (all archived, none new)
- X_D: the primitive transfer Q2 (h → 2h, 2h+1 mod 64) written in signed dictionary D (Q3/Q28 code map).
- S_D = Σ_{a∈A5} P_a X_D P_aᵀ = 120 R(Q): the Q3 geometric twirl (Frobenius-nearest A5 chronology, x120).
- The conditional chronology-Dirichlet completion of
  `2026-11-10_urt_arf_forward/new_gate/URT_A5_CHRONOLOGY_DIRICHLET_GAP_2026_11_10.py`:
  240 Abar_D = Σ_a P_a (2I − X_D)ᵀ(2I − X_D) P_aᵀ and 240 Kbar_D = 240 H + 240 Abar_D, with H = 15I − Σ_{i<j} X_iX_j.
  Its archived version is the case D = original frame; here it is rebuilt verbatim in every dictionary.
- C: complement h → h ⊕ 63 (central inversion of all six axes); in the Walsh basis C = (−1)^(Walsh weight).
  N = Σ_j X_j (single-bit flips); in the Walsh basis N = 6 − 2k on weight k.
- The 48 Q28 residual pairs (D, S(D)), S = alternating flip (signs of digits 1, 3, 5).

## Statements
**A. The alternating flip is multiplication by central inversion.** For every one of the 46,080 signed
dictionaries, X_{S(D)} = X_D C = C X_D. Since every A5 element is a signed axis permutation it commutes with
C, so S_{S(D)} = S_D C = C S_D (checked on all 768 eight-orbit images). Consequences, for every dictionary:
- Tr w(S_{S(D)}, S_{S(D)}ᵀ) = Tr(w(S_D, S_Dᵀ) C^{|w|}) for every word w. **Every even-length word trace is
  automatically equal** on D and S(D); for odd |w| the difference is 2 Tr(w Π_odd), Π_odd = (I − C)/2 the
  projector on odd Walsh weight (histories odd under central inversion).
- S_{S(D)} S_{S(D)}ᵀ = S_D S_Dᵀ as matrices.
- On each Walsh-weight block k (S_D commutes with H, so it is block-diagonal), spec S_{S(D)}|_k = (−1)^k spec S_D|_k.
  Hence the Q30 cospectrality of a pair is exactly the statement that the odd-weight spectrum of S_D is
  symmetric under λ → −λ.

**B. Tr(S²Sᵀ) is the unique non-spectral cubic invariant, and it is the cubic moment of the declared
Dirichlet hopping term.**
- Up to cyclic order and transposition the length-3 words are S³ and S²Sᵀ only.
- With T_D = S_D + S_Dᵀ (the additive reversibilisation), Tr(S²Sᵀ) = [Tr T³ − 2 Tr S³]/6, and with the
  stationary one- and two-step probability currents B₁ = S − Sᵀ, B₂ = S² − (S²)ᵀ (stationary law uniform,
  S/120 doubly stochastic): Tr(S²Sᵀ) = Tr S³ + ½⟨B₂, B₁⟩_F. On a pair with equal Tr S³ it measures only the
  alignment of the two-step and one-step currents: a time-reversal-even product of two time-reversal-odd
  quantities (so it cannot split R, consistent with Q28).
- **Native identity.** X_DᵀX_D = 2(I + flip of the digit-0 axis); A5 is transitive on the six axes with
  stabilisers of order 10, so its twirl is 120I + 20N in every dictionary, and
  **240 Abar_D = 360 I + 20 N − 2 T_D.** H and N are scalars on each Walsh block, so
  240 Kbar_D|_k = (480k(6−k) + 480 − 40k) I − 2 T_D|_k.
  The declared Dirichlet operator is, block by block, an affine function of the reversibilised chronology.
- On every residual pair: Tr(S_D²S_Dᵀ) − Tr(S_{S(D)}²S_{S(D)}ᵀ) = 2 Tr(S²Sᵀ Π_odd) and
  Tr(240Kbar_D)³ − Tr(240Kbar_{S(D)})³ = −48 [Tr(S_D²S_Dᵀ) − Tr(S_{S(D)}²S_{S(D)}ᵀ)].

**C. What the declared Dirichlet completion sees on the 48 residual pairs (exact integer characteristic
polynomials of every Walsh block).**
- Kbar_D and Kbar_{S(D)} are exactly cospectral on **42** pairs (all 22 permutation-conjugate pairs and all
  20 Q34/Q35 survivors) and differ on exactly the **6** pairs that Tr(S²Sᵀ) separates. So the Dirichlet
  completion adds no separation beyond Tr(S²Sᵀ), and the Q35 survivors remain unseparated by it.
- On the 6, the split lies entirely in Walsh weight 3 (H-energy 18, the home of the native 4₃) and entirely in
  the 3 ⊕ 3′ isotypic part: exact Tr(T^j P_χ), j ≤ 3, differ only for χ = 3 ⊕ 3′, and the 1, 4 (quartet)
  and 5 eigenvalues agree numerically (exact equality of those sub-spectra was not separately certified). The triplet eigenvalues of S(D) are
  the reflection of those of D about the block centre 39/2 (by A); first witness D = (0,2,4,9,6,11):
  Kbar triplets ≈ {19.0973, 19.4923, 19.6045, 19.8058} vs {19.1942, 19.3955, 19.5077, 19.9027}, each ×3.
- gap(Kbar) = 1 exactly in all 96 residual dictionaries (constant kernel, parity eigenvalue 1, every
  weight-1…5 block > 1 by exact Bareiss leading minors). Tr Kbar, Tr Kbar², the Frobenius restoration cost
  ‖Q − R(Q)‖² and the frame variance Tr V are equal on all 48 pairs.
- The exact pseudo-determinant ratio of 240 Kbar (larger-Tr(S²Sᵀ) side over smaller) is
  12838118084225620705462076487901 / 12838241249815151025009168091741 ≈ 1 − 9.594·10⁻⁶, the same on all 6
  pairs: the dictionary with the larger current alignment has the smaller Dirichlet determinant.

**D. Preference (OBSTRUCTION).** Every declared scalar selection criterion in the archive — minimal
Frobenius disturbance (R(Q)), the Dirichlet gap, Tr Kbar, the frame variance — takes equal values on all 48
pairs. Only spectral functionals of Kbar beyond the second moment (e.g. its Gaussian determinant, or the
conditional 24-clock determinant built on its eigenvalues) see the 6 splits, and the direction of preference
there is set by the sign of the exponent: a bosonic weight det^{-1/2} favours the larger Tr(S²Sᵀ), a Grassmann
weight det^{+1} the smaller. No archived principle fixes the statistics of the history modes or the sign of
that exponent. So: Tr(S²Sᵀ) **is** a native quantity (current alignment = cubic moment of the declared
Dirichlet hopping), but **no declared native principle prefers either value**.

## Proofs
- A. Writing h in digit coordinates, S(D) is conjugation of X_D by xor with 101010₂. For a history h the
  images are {2h, 2h+1}; (2(h⊕42) + b) ⊕ 42 = (2h + b) ⊕ 62 mod 64, and since both b occur, the image set is
  {2h,2h+1} ⊕ 63. The images of h ⊕ 63 are {2h, 2h+1} ⊕ 62 as sets ⊕ 1, i.e. also {2h,2h+1} ⊕ 63. Hence
  X_{S(D)} = X_D C = C X_D. A signed permutation of axes commutes with flipping all axes. The rest is
  substitution (C² = I, C central for S_D). Certified on all 46,080 dictionaries (X level) and all 768
  eight-orbit images (S level).
- B. Expand (S+Sᵀ)³ under the trace; Tr(S²Sᵀ) − Tr S³ = Σ_ij (S²)_ij (S_ij − S_ji) = ½⟨B₂, B₁⟩. The twirl of
  X_DᵀX_D is by orbit counting; certified as matrix identities on every residual dictionary.
- C. Exact Faddeev–LeVerrier characteristic polynomials over Z of all seven Walsh blocks (Cayley–Hamilton
  checked), exact isotypic traces with the integer class-function projectors, exact Bareiss minors, Python
  integers for the determinants.
- D. Equalities are exact integer comparisons; the statistics dependence is the sign of log det in
  ∓½ log det or + log det.

## Continuity notes (no earlier result changes)
Statement A makes several recent censuses immediate: Q27's S-invariance of Tr S², Q29 (Tr S⁴), Q33 (the Gram
matrices are identical, not only cospectral) and Q35 (every length-8 word) all follow from S_{S(D)} = S_D C.
They remain correct; they are not independent evidence beyond this identity. Q28, Q30, Q34 (odd lengths) are
genuine statements about the odd-Walsh sector.

## Scope and what remains open
- This is about the Q3 twirled chronology and the archived conditional Dirichlet completion (coefficient 1,
  a choice). It is not history selection and not an ARF.
- Q36 now reduces to the 32-dimensional odd-Walsh sector (weights 1, 3, 5): S_D and S_{S(D)} are orthogonally
  similar iff there is an orthogonal U with U S_D = −S_D U and U S_Dᵀ = −S_Dᵀ U on that sector (U = I on the
  even sector). For the 6 pairs this is excluded by Tr(S²SᵀΠ_odd) ≠ 0; for the 20 it is open.
- A selection between the 6 would require a declared statistics (bosonic vs fermionic) for the history modes
  of the Dirichlet completion; none exists in the archive.
