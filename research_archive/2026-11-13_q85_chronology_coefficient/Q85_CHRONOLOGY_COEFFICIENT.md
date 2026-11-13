# Q85: every centrally symmetric chronology leaves the coefficient c free; c is the parity-history mass (ACTIVE PROBLEM A, attempt A3 coefficient)

Date: 2026-11-13 (Claude, scheduled session). Gate A.
Status: **OBSTRUCTION (scoped).** Parts 1 and 4 are exact; Part 2 is float64 with margins far above rounding; Part 3 is a
float64 scan, not a proof. CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. The result is conditional on the Q64/Q72
selection and on the 2026-11-10 construction K_c = H + c·Abar. Gate A stays open, and c is **not derived**.
Certificate: `Q85_CHRONOLOGY_COEFFICIENT_CERTIFICATE.py` (check `research.q85_chronology_coefficient`). Executed in
Claude's cloud sandbox: exit 0 in about 14 s. It re-executes Q82, and through it Q73, Q64, Q61 and Q3.

## Reading
The task was Q85: find a native condition fixing c in H + c·Abar on D₀ = (0,2,4,6,10,9), or prove that the conditions
tried leave the family. Q82 2a showed the source weights are c-blind for Q. This session asks which chronologies X in
A_X = (I − X)ᵀ(I − X) can make them c-sensitive at all. It then tests the queued candidate (a), the selected bridge in
place of Q, in both of its archived forms:
- the Q72 history bridge;
- the Q73/Q77 joint history ⊗ 24-clock bridge B^J.

Candidate (b), the Ward/Schur two-step matching, was not attempted this session.

## Part 1: the c-blindness theorem (exact)
Let C be central inversion, h ↦ h ⊕ 63.

**Theorem.** Let A′ be any symmetric 64×64 operator that commutes with the A5 history action and with C. Then for every
c > 0:
- the eigenprojectors of H + c·A′ on the A5 quartet isotypic V = range P4 do not depend on c;
- its eigenvalues there are 16 + c·α_i and 18 + c·β_j, where α_i and β_j are eigenvalues of A′.

So the native source weights tr(P_λ U_h P_s U_hᵀ), and the residues of the source resolvent, are independent of c.
Only the pole positions move. (Where two branches cross, their weights add.)

**Proof.**
- C commutes with every A5 element and acts as (−1)^k on Walsh weight k (checked exactly).
- V lies in Walsh weights 2, 3, 4, with ranks 4, 8, 4. So V ∩ {C = +1} is the Walsh 2+4 part, where H = 16, and
  V ∩ {C = −1} is the Walsh 3 part, where H = 18.
- A′ commutes with A5, so it preserves V. It commutes with C, so it preserves both pieces.
- H is a scalar on each piece. Therefore H + c·A′ has the eigenvectors of A′ on each piece, for every c.
- Both sources lie in V: G₅ in quartet Walsh 2 and G₃ in quartet Walsh 3 (checked exactly). ∎

Every dictionary class sends history complement to code complement (checked on all 768 classes). So a history
chronology X with CXC = X gives an Abar_X that commutes with C in every dictionary.

**Native chronologies that commute with C (exact):**
- the URT transfer Q2;
- the selected reversible history P_σ₁;
- the Q72 uniform-marginal bridge, on every one of the 768 classes. C maps URT block x onto block 31 − x, with rows and
  columns both swapped, and ρ_x = ρ_{31−x} holds exactly on all classes. The bridge entry √ρ/(1+√ρ) is therefore
  C-symmetric.

**Consequence.** No condition on source weights, branch projectors or residues built from any of these chronologies can
fix c. This generalises Q82 2a from Q to every centrally symmetric chronology.

## Part 2: the Q72 bridge in place of Q (queued candidate (a), float64)
Replace Q by the Q72 bridge B_{D₀}, pull it through D₀ and take the A5 twirl.
- As Part 1 predicts, the weights are identical at c = 1/4, 1, 4 and 16.
- They are no longer (4,2,2,0):
  - P5: about (3.999943, 5.7×10⁻⁵). The former dark branch picks up a small P5 weight.
  - P3: about (1.85346, 2.14654).
- Abar_B commutes with C but not with H (‖[Abar_B, H]‖_max ≈ 0.038). It mixes only Walsh blocks that have equal H.

So this version of candidate (a) does not fix c, and it loses the exact (4,2,2,0) of Q82.

## Part 3: the joint clock bridge B^J (float64 scan, not a proof)
B^J_{D₀} and B^J_{RD₀} (Q73/Q77 history marginals) break C: ‖C B^J C − B^J‖_max ≈ 0.147. So they are the only
archived native chronologies whose weights can depend on c, and they do.

On the scan c = k/8 for k = 1…512 (that is, c up to 64):

| Chronology | Smallest P5 weight off its main branch | Smallest \|w₁−2\| + \|w₂−2\| (two largest P3 branches) |
|---|---|---|
| B^J_{D₀} | 2.5×10⁻⁴ | 0.070 |
| B^J_{RD₀} | 1.5×10⁻³ | 0.299 |

So (4,2,2,0) is attained at no scanned c. Near c ≈ 10 the exact Q crossing at 40/3 becomes an avoided crossing, and P3
weight passes between the dark branch and the lower P3 branch. The scan does not exclude a value of c between grid
points or above 64. It does show that "(4,2,2,0) under the clock bridge" is no natural candidate condition.

## Part 4: what c is on the selected orbit (exact, all 8 classes)
Abar = Abar_Q on each Walsh block k (exact symmetric elimination over Q):
- k = 1, 2, 3, 5: Abar > I.
- k = 4: the minimum eigenvalue is exactly 2/3.
- k = 6: the six-bit parity history has Abar = 1 and H = 0.
- k = 0: the constant has Abar = 0.

Abar commutes with H, so the spectrum of K_c consists of the lines 2k(6−k) + c·λ. Hence:
- **gap(K_c) = c for 0 < c ≤ 48.** The lightest nonconstant mode is the parity history, and c is exactly its mass in
  units of the two-flip energy.
- For c ≥ 48 the gap is 16 + 2c/3 (the bottom of Walsh 4 meets the parity mode at c = 48).
- The four quartet branches (P5 16 + 4c/3, P3 18 + 27c/20 and 18 + 33c/20, dark 16 + 3c/2) cross for c > 0 only at
  c = 40/3, where the dark branch meets the lower P3 branch.

So fixing c is the same problem as giving the parity history a native energy relative to H. H itself gives it zero,
which is why spec H_bits has two zeros. The spectrum offers only two special values, 40/3 and 48. No archived principle
selects either, and neither is claimed here.

## What this establishes, and what it does not
- **Established:**
  - Source weights, branch projectors and residues are c-blind for every chronology that commutes with A5 and C.
  - This class includes Q2, P_σ₁ and the Q72 bridge on all 768 classes.
  - The Q72-bridge replacement loses (4,2,2,0) and fixes nothing.
  - On orbit 1, c is exactly the parity-history mass for c ≤ 48.
- **Not established:**
  - any value of c;
  - that no C-breaking chronology fixes c (only B^J was scanned, and only on a grid);
  - candidate (b), the two-step Ward/Schur matching;
  - any pole or ARF.

## Next
A native c must be a statement about pole positions, which on orbit 1 means the parity-history mass. Q86 [derive]:
decide whether an original operator assigns the six-bit parity history w₆₃ an energy relative to H. Candidates are the
H64 zero-mode pair, the conditional 24-clock determinant (4r⁴⁸ sin²Θ for a zero mode against
2r⁴⁸[T₂₄(1 + c/2r²) − cos 2Θ] for mass c), and Q2's action on w₆₃. Compute c if one does; otherwise prove that none does.
Q87 [compute] makes the Part 3 scan rigorous, with interval enclosures for all c > 0.
