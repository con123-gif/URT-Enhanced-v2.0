# Predeclaration — alt_cycle21: vacuum alignment of V_hist

Date: 2026-11-10 (Europe/London)
Route: (21) Minimise V_hist (with the F sources, full coupled form) over the hidden 4_3 ⊕ 4_5 and find the stabiliser subgroup of the minimum (A4, D5, S3, C5, C3, C2?). If it is D5 or C5, that is a derived axis selection: compute the induced splitting of 3 → 1⊕2 and whether three distinct charged masses arise without new parameters.

## Predeclared potential (not searched)
The coupled-cycle-02/03 golden-mode form, with frozen constants only:
    V_hist(h3, h5) = c3 ||h3||² + Δ² c5 ||h5||²
    c3 = 1/4 − 1/(2(18 + r² λ)),   c5 = 1/4 − 1/(2(16 + r² λ))
    r = π/e,   λ = λ_min(L2) for the charge-2 gold-angle clock
    Δ = 3/20 − 80π/(1053 φ)
This is the Schur-reduced history energy on a single Fourier mode, and equals the quadratic form whose Hessian is 2 c3 I_4 ⊕ 2 Δ² c5 I_4 (eigenvalues 2 c3 with multiplicity 4 and 2 Δ² c5 with multiplicity 4).

F-sourced version, using the archived map of coupled cycle 03:
    h3(t, f) = 2 P3[(C t) ⊙ (C f)]     (the 3 ⊗ 5 → 4_3 block)
    h5(f, f) = P5[(C f) ⊙ (C f)]       (the Sym² 5 → 4_5 block)
    and the untruncated source q(α) = (P3[(Cα)⊙(Cα)], P5[(Cα)⊙(Cα)]) for α ∈ 3 ⊕ 5.
These are read from the already-computed polarisation tensors B3, B5 of coupled cycle 03 (no refitting).

## Hypotheses
H1. V_hist is positive definite on 4_3 ⊕ 4_5. Its unique critical point is the origin, whose stabiliser in A5 is the whole of A5.
H2. No nonzero vector of 4_3, of 4_5, or of 4_3 ⊕ 4_5 is fixed by any C5 or D5 subgroup of A5. (The 4 is the deleted permutation representation on five letters; a 5-cycle cycles all five coordinates, so a C5-invariant vector is constant and hence zero in the 4; D5 contains a C5.)
H3. V_hist ∘ F is a nonnegative quartic on 3 ⊕ 5, vanishing on the 3-plane f = 0 (any t). That vacuum manifold does not select an axis in the 3: an A5-invariant function that vanishes for all t at f = 0 is independent of the direction of t. A generic point of the manifold has trivial stabiliser; the most symmetric points would have stabiliser D5, but selecting them is an extra residual-symmetry principle, not a consequence of minimising V_hist.
H4. Therefore there is no derived C5/D5 axis selection, the A5 mass degeneracies (1, 1, 3, 3, 5) are not split by this vacuum, and three distinct charged masses do not arise without new parameters.

## Integrity
No ARF target is inserted. Classification PROVED / CONDITIONAL / FALSIFIED / OPEN.
