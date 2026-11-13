# Q77: the joint-clock selection made exact, and what its 4+4 split is (ACTIVE PROBLEM A, attempt A4)

Date: 2026-11-13 (Claude, scheduled session). Gate A.
Status: **THEOREM (exact statements plus rigorous rational-interval enclosures of algebraic numbers). CLOSED
INTERNALLY / PHYSICAL IDENTIFICATION PENDING.** The selection is only as strong as Q73's joint-clock reading,
which stays a reading. Gate A stays open.
Certificate: `Q77_EXACT_CLOCK_SPLIT_CERTIFICATE.py` (check `research.q77_exact_clock_split`). Executed in Claude's
cloud sandbox: exit 0 in about 48 s. It re-executes Q73, and through it Q64.

## Question (Q77)

Q73 Part 3 found in float64 that the bridge on the joint history ⊗ 24-clock pieces is maximised on
{D₀, I D₀, RS D₀, SR D₀}, D₀ = (0,2,4,6,10,9), with lift σ₁. The other half of orbit 1, {R, S, IR, IS}·D₀, came
next at ×1.199, and every other class was at least ×1.584 lower. Q77 asks three things. Is there an exact
symmetry of the clock partition that realises RS? Is L^J(D) = L^J(RS D) exact? Does the first half beat the
second half exactly?

## Results

Notation: W_D = S_D·π₀ on the 88 joint pieces, B^J_D is its Lebesgue-marginal bridge projected to histories,
and L^J(D) = ∏ₓ max(tₓ, 1 − tₓ)² with tₓ = B^J_D[x, 2x] (Q73).

1. **The joint bridge splits into 32 blocks (exact).** The bipartite joint graph of π₀ has exactly 32 connected
   components, one per URT block (rows x, x+32 → columns 2x, 2x+1). They come in four shapes (row pieces,
   column pieces, edges): (2,2,4) ×4, (2,3,6) ×16, (4,2,6) ×4, (4,3,8) ×8. The shape is fixed by where the 24
   golden-offset bin boundaries cut the four cells of the block.
2. **Each block sees only one number (exact lemma).** tₓ = Fₓ(ρₓ(D)) with ρₓ = S[x,2x]·S[x+32,2x+1] /
   (S[x,2x+1]·S[x+32,2x]), the block's cross ratio. *Proof:* rescaling a row or a column of the 2×2 history
   block multiplies every joint edge out of (or into) that cell by the same factor. That is a diagonal rescaling
   of the joint matrix, and the bridge of a connected block is unique, so the bridge is unchanged. Fₓ(1) = 1/2
   exactly, because then W = π₀ on the block, which already has the marginals μ (Q73 Part 2). For the four
   (2,2,4) blocks, Fₓ is the plain-bridge value √ρ/(1+√ρ). The certificate checks the lemma against Q73's
   unrescaled float bridge on 16 classes × 32 blocks.
3. **Rigorous values (interval Newton).** Fₓ(ρ) is enclosed for all 1152 (x, ρ) pairs that occur, using 74
   distinct ρ values. The method is a Krawczyk test in exact rational interval arithmetic with √5 bracketed to
   10⁻⁴⁰, and the enclosures have width ≤ 4.2·10⁻¹⁷. On every pair, sign(Fₓ(ρ) − 1/2) = sign(ρ − 1). So the
   joint lift bit is exactly [ρₓ < 1], the same as the plain bridge, on every block that does not tie. All 20
   classes on which Q73 reported a joint lift differing from the plain one carry tied blocks (ρ = 1, t = 1/2
   exactly). Those differences were float noise at exact ties, not clock effects.
4. **Exact selection (certified, all 768 classes).** The maximiser of L^J is exactly {D₀, I D₀, RS D₀, SR D₀}
   with lift σ₁. Every orbit-1 block has ρ < 1 strictly, so there is no tie. The certified margins are:
   - half 1 / half 2: L^J(D₀)/L^J(R D₀) = 1.199147606760… (enclosure width < 10⁻¹²);
   - half 2 / best class outside orbit 1: 1.583685556064…, and the next class is orbit 3.

   So Q73 Part 3 now holds exactly, not only in float64.
5. **What the 4+4 split is (exact).**
   - The four classes of the winning half have literally the same chronology: S_{RS D₀} = S_{SR D₀} = S_{I D₀}
     = S_{D₀} as integer matrices.
   - The other four have one chronology too: S_{R D₀} = S_{S D₀} = R S_{D₀}ᵀ R. That is the time reverse of
     S_{D₀} (Q72).
   - So orbit 1 carries exactly **two** chronologies, S_{D₀} and its time reverse. The joint clock bridge prefers
     the forward one by the factor 1.1991476…. The plain bridge ties them exactly, because ρ-multisets (up to
     ρ ↔ 1/ρ) agree for D and R D on all 768 classes. The clock separates them because R moves the cross ratios
     onto blocks of different clock shape: ρ differs between D₀ and R D₀ on 16 of the 32 blocks, 14 of which
     are clock-cut.
6. **RS is not a clock symmetry (exact, certified).**
   - S_{RS D} = S_D holds on exactly 128 of the 768 classes: all six exceptional Q62 orbits and 10 others
     (S_{I D} = S_D holds on all 768).
   - On each of the other 640 classes, the certified enclosures of L^J(D) and L^J(RS D) are disjoint.
   - On all 768 classes, L^J(R D) ≠ L^J(D) with disjoint enclosures.
   - Hence **no symmetry of the joint clock construction realises RS**, and Q77's first question has the answer
     no. The ⟨RS⟩ "survival" on orbit 1 is the chronology coincidence S_{RS D₀} = S_{D₀}, not a property of the
     clock. Meanwhile the clock breaks time reversal R on every class.

## Correction to the Q73 record

Q73 said that "two distinct chronologies remain, S_{D₀} and S_{RS(D₀)}; their L^J agree to 10⁻⁹, a numerical
equality only". In fact S_{RS(D₀)} = S_{D₀} exactly, so that equality is exact. The two distinct chronologies on
orbit 1 are S_{D₀} and R S_{D₀}ᵀ R. Q73's phrase "the clock keeps ⟨RS⟩" should read: the clock bridge breaks
time reversal, and ⟨RS⟩ ∋ I fixes the chronology of orbit 1 itself. Q73's lift-difference count (20 classes)
consists of exact ties.

## Scope and limits

- Every statement is about the Q73 joint-clock reading: W_D = S_D·π₀, bridged to the Lebesgue marginals, then
  projected. Q77 makes that reading exact. It does not justify the reading.
- The forward/reverse preference is a native orientation of time only in this sense: the golden-offset clock
  bins and the dyadic history cells have different shapes on the blocks that R exchanges. Whether this is a
  physical arrow of time is not addressed. Q72 requirement (ii), R-covariance, fails for the joint bridge on
  every class.
- Nothing physical is identified. A3 (the A5 chronology coefficient and the source weights (4,2,2,0)) is
  untouched. It is GPT's current Q81 line, and Q77 does not duplicate it.

## Next

Q82 [derive] (A3 on the oriented selection): the joint clock bridge now picks out a forward chronology S_{D₀},
with lift σ₁, over its time reverse. Compute the forward-minus-reverse difference B^J_{D₀} − B^J_{R D₀} with
exact enclosures, block by block. Resolve it on σ₁'s cycles (4 + 5×12, Q69) and on the 24 clock bins. Then test
whether its normalised cycle/bin weights give the A5 chronology coefficient or a four-weight pattern to compare
with (4,2,2,0). The test is only a comparison: no fitting, and no weights inferred from ranks. It is not GPT's
Q81, which works from the P3 source quadratic form.
