# Block 4 — coupled cycle 12 and alt 16–20 integration

Date: 10 November 2026 (Europe/London).
Branch: `arf-coupled-research` off `newtons-cathedral`.
Adds only files under `research_archive/2026-11-10_coupled_arf_derivation/`.

## Coupled cycle 12 — Ward / matching / RG of y_even : y_odd
Classification: PROVED obstruction. Surviving dimension 2 (not a ray).
One-loop / EM / ARF pipeline not run.

The theories (1, 0), (0, 1) and (1, 1) all satisfy the inversion, A5
and U(1) Ward identities. The hidden Hessian is block-diagonal on
4_3 ⊕ 4_5, so no joint hidden Ward relates the two Yukawas. Six named
matching recipes (Δ², Δ, √(H_5/H_3), F singular-value ratio, F
Frobenius ratio, democratic) disagree by a factor 1/Δ² ≈ 1.61×10⁵
and are not Ward identities.

One-loop Yukawa betas are of the form β_o ∝ y_o, β_e ∝ y_e because
inversion forbids mixing: both axes are RG-fixed rays in every scheme.
Equal weights give an extra mixed ratio r_* = 1 (A = 3/4, B = 1/4);
Hodge-weighted fermions give a different mixed ratio r_* ≈ 1.1028;
V_hist-weighted hidden exchange makes the mixed r_*^2 negative. The
mixed ray is scheme-dependent and is not uniqueness.

## Alt-route integration (cycles 16–20)
Read from LEDGER_ALT.md. No ARF derived. Alt cycles 09–15 were already
on the branch from block 3; 16–20 are added in this block.

- alt16: the log-det maximiser of alt14 is not the one-loop effective
  action. Integrating fermions first gives −Tr log(K+Yh) as a functional
  of h; integrating the Gaussian hidden sector first gives a four-fermion
  theory, not det(K+Σ). The quadratic expansions of ⟨log det(K+M)⟩ and
  log det(K+Σ) have opposite sign, so the cycle-14 proxy prefers pure α
  while the actual average prefers pure β. Yukawas are not integration
  variables. The pure 3⊗5 → 4_3 ray remains CONDITIONAL, not promoted.
- alt17: Hamming-parity orbit labels do not imply source-matching.
  Each 12-orbit is 1⊕3⊕3'⊕5; orbit projectors cannot kill 3'⊗5 → 4_3
  while keeping 3⊗5 → 4_3. H2 FALSIFIED.
- alt18: none of Hodge, Hodge+Cbridge, the 24-clock product, ρ*, or
  the 2I lift breaks A5 to three nondegenerate charged masses. Spatial
  degeneracies (1, 3, 3, 5) persist; singlets stay massless.
- alt19: a unique Hodge Noether current exists on the 90 spatial edges
  and satisfies Ward, but Cbridge is non-local (36 off-edge icosahedral
  pairs) and the one-loop transverse EM response is infrared-singular
  (λ_min(Π_T) ∼ 2/(ε n), regulator-dependent ratios). No R_α comparison.
- alt20: because cycle 16 did not derive a ray, the observable pipeline
  was not run.

These results align with cycle 12: even the extra log-det principle is
not the path-integral effective action (alt16), source-matching is not
derived from history labels (alt17), and even if a Yukawa ray were
chosen the subsequent mass pattern (alt18) and EM response (alt19)
would still not produce three lepton masses or a finite R_α.

## Next question
No derived cut of the residual 2-plane remains among Ward identities,
hopping support, inversion, Hodge, F-consistency, V_hist weighting
taken as a Ward identity, one-loop RG, history/clock handedness, or
Hamming-parity labels. A later cycle should proceed only if a new
derived principle is proposed; otherwise the obstruction (dimension 2)
stands and ARF comparison remains out of scope.

No ARF was compared in this block.
