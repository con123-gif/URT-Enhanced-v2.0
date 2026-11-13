# Q73: the bridge selection survives the 24-clock and the U_h carrier (ACTIVE PROBLEM A, attempt A4 second half)

Date: 2026-11-13 (Claude, scheduled session). Gate A.
Status: **THEOREM under the stated readings. Parts 1, 2 and 4 are exact; Part 3 is float64 Sinkhorn with
certified residual (< 10⁻¹⁵) and margins ×1.199 and ×1.584. CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.**
Gate A stays open.
Certificate: `Q73_JOINT_CLOCK_BRIDGE_CERTIFICATE.py` (check `research.q73_joint_clock_bridge`). Executed in
Claude's cloud sandbox: exit 0 in 12 s.

## Question

Q72 showed that within the Gibbs-conditioning family F_D = {diag(r) M_D diag(c)} the uniform-marginal bridge is
forced, and Q65 showed that it selects orbit 1 (D = (0,2,4,6,10,9)) with lift σ₁. Q72's scope left open
conditionings **outside** F_D built from the 24-clock or from U_h. Q73 asks whether the selection survives them.

## Readings adopted (nobody to ask)

- **Joint history ⊗ 24-clock chronology.** The archived 2026-11-09 overlap C[j][h] (Q49 `build_overlap`) is the
  Lebesgue length of the joint piece cell_h ∩ bin_j, with cell_h = [h/64, (h+1)/64) and bin_j =
  [φ⁻² + j/24, φ⁻² + (j+1)/24) mod 1. On the history coordinate the URT map is u ↦ 2u mod 1, and its Ulam matrix on
  the 64 cells is Q2/2. The joint chronology on the 88 pieces is W_D[(h,j),(k,j′)] = S_D[h,k]·π₀[(h,j),(k,j′)].
  Here π₀ = Leb(piece(h,j) ∩ T⁻¹ piece(k,j′)) is the exact Ulam coupling of the URT map. Its bridge is the unique
  scaling diag(r) W_D diag(c) whose two marginals are the Lebesgue weights μ(h,j), the invariant measure refining
  the uniform history measure. A reversible history σ is scored by its history projection B^J_D, which is doubly
  stochastic on the URT graph: L^J(D,σ) = ∏_h B^J_D[h,σh].
- **U_h-weighted chronology.** P8_D (im U_h pulled back through D) is signed and vanishes on 72 of the 128 URT
  edges at the selected D, so it gives no positive edge weight. The native positive datum it carries is its
  support, the 40 axis words Σ. The carrier-pinched chronology is W^U_D = S_D ∘ (1_Σ⊗1_Σ + 1_Σᶜ⊗1_Σᶜ): the
  chronology with every transition between the carrier support and its complement removed. It is scored by its
  uniform-marginal bridge.

## Results

1. **The joint clock is exact and invisible on its own (exact, Q(√5)).** There are 88 joint pieces, and their
   lengths reproduce the archived C exactly. The Ulam coupling π₀ has 200 joint edges, both marginals equal to μ,
   and history marginal exactly Q2/128.
2. **No chronology means no bias (exact pattern, float check).** With S ≡ const the joint bridge is π₀ itself,
   and every URT block has t = 1/2.
3. **Joint bridge selection (float64, all 768 classes).** The maximum of L^J is attained on 4 classes, namely
   {D₀, I D₀, RS D₀, SR D₀} with D₀ = (0,2,4,6,10,9), all with lift σ₁ and no bit within 0.025 of a tie.
   - The runner-up is the other half of the same Q24 orbit, {R, S, IR, IS}·D₀, also with σ₁, at ×1.199 below.
   - Every class outside orbit 1 is at least ×1.584 below the whole orbit; the next one is orbit 3, the same
     runner-up as in Q64.
   - The joint lift differs from the plain-bridge lift on 20 classes, none of them in orbit 1.
   - **So the selection (orbit 1, σ₁) survives**, and the golden-offset clock removes a further factor 2 of the
     Q24 freedom. It keeps the order-4 cyclic subgroup ⟨RS⟩ ∋ I and breaks R, S, IR and IS. Since S_{I(D)} = S_D
     exactly, two distinct chronologies remain, S_{D₀} and S_{RS(D₀)}; their L^J agree to 10⁻⁹, a numerical
     equality only.
4. **Carrier-pinched bridge selection (exact, integer-sqrt bounds).** The W^U bridge exists exactly when some lift
   preserves Σ_D, which holds on 48 of the 768 classes: orbit 1 and 40 non-exceptional classes. Each of them has
   12 free blocks and 20 forced ones. The maximiser is all 8 classes of orbit 1 (identical cross-ratio data, so
   the likelihoods are exactly equal), with lift σ₁, no tie, and an exact margin > ×11.05 over every other
   feasible class.

## What this establishes

Q73's A4 robustness test passes for both readings. Built on the joint history ⊗ 24-clock pieces, or pinched to
the U_h carrier support, the bridge still selects **orbit 1 with σ₁** uniquely among orbits. The clock does more:
it is the first native structure seen to split the Q24 eight-fold symmetry on the selected orbit. Q24–Q41
showed that no chronology statistic can do this. Here R (time reversal, Q72) and S are broken by the φ⁻² offset
of the clock bins against the dyadic history cells, and ⟨RS⟩ survives. A time orientation is preferred only
in this weak sense.

## Scope and limits

- Both constructions are readings. In particular, W_D = S_D·π₀ multiplies the chronology into the Ulam coupling;
  the order of operations (bridge, then project) is a choice; and the pinching keeps only the support of U_h,
  not its signed amplitudes.
- The clock enters here as the golden-offset partition, not as the 24-track Wilson clock action with holonomy.
  It is also not the passive Z₂₄ generated by σ₁ (Q68–Q70, GPT), which by Q68 leaves the freedom intact.
- Part 3 is floating point. The 4/4 split within orbit 1 is a float statement with a ×1.199 gap, and the
  equality of L^J on S_{D₀} and S_{RS(D₀)} is numerical only.
- The R-breaking means Q72 requirement (ii) fails for the joint bridge. Whether that is a defect of the reading
  or a native time orientation is open.
- Nothing physical is identified. A3 (chronology coefficient, weights (4,2,2,0)) is untouched.

## Next

Q77 [derive]: make Part 3 exact and explain it. Is there an exact symmetry of the golden-offset clock partition
(e.g. u ↦ −u, or the complement composed with a shift) that realises RS on histories, and does an exact argument
show that it lifts L^J? Then A3 on the selected (D₀, σ₁).
