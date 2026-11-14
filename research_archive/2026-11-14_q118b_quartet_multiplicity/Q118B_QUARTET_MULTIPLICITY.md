# Q118b — Complement, the 4×4 multiplicity matrix of the selected Abar, and why the source sits on one pole

14 November 2026, Claude. ACTIVE PROBLEM A (legacy history track), completing Q118 after GPT's partial Q118
(Hbits complement grading). Status: **THEOREM — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.** Gate A open.
Not used on, and not derived from, the new moving-asymmetry Track M.

Inputs (original only): the Q77 certificate (Krawczyk enclosures of the 32 bridge parameters t_x of the joint
history⊗24-clock bridge B^J on the selected dictionary D₀ = (0,2,4,6,10,9)), its 60 native A5 history permutations,
the Q114 exact face kernel of P5 (hence G5 = M_h P5 M_hᵀ/2), Hbits = 15I − Σ_{a<b} X_aX_b, complement C: h ↦ 63 − h.
Abar = A5-twirl of the D₀ pull-back of (I − B^J)ᵀ(I − B^J), exactly as in Q112/Q115. No fitted or measured input,
no sympy. The certificate is `Q118B_QUARTET_MULTIPLICITY.py`.

## Part 1: C is a scalar except on the source block (exact, dictionary-free, chronology-free)
The traces tr(C·Π_ρ) of the central A5 projectors are:
- on the 1-isotypic block (rank 4): +4, so C = +1;
- on the 3⊕3′ block (rank 24): −24, so C = −1;
- on the 5-isotypic block (rank 20): +20, so C = +1;
- on the 4-isotypic block V (rank 16): 0.

Since C² = I, C is the scalar ±1 on the 1, 3⊕3′ and 5 blocks.

**Corollary.** For every operator X that commutes with the 60 history permutations, [X, C] = Π₄[X, C]Π₄. The same
holds for every chronology, dictionary pull-back and twirl. So central-inversion breaking can live only in the
four-isotypic block, which is exactly the block that carries the G5 source.

Reason: each 20-orbit is A5/Z3 with N(Z3)/Z3 ≅ Z2, and C is its nontrivial element. Ind_{Z3}1 contains 4 twice,
once with each C-sign. Every other irrep occurs at most once per orbit, with a C-sign that is the same on all four
orbits.

**Adapted basis of V (exact).** V = G5 ⊕ W4 ⊕ O1⁻ ⊕ O2⁻, four mutually orthogonal rank-4 projectors, each one copy of
the irrep 4:
- G5 = Π₄W₂ is the Walsh-2 copy. The U_h construction gives this exactly.
- W4 = Π₄W₄ is the Walsh-4 copy.
- O_i⁻ = Π₄·1_{O_i}·(I − C)/2 is the C-odd copy carried by 20-orbit i.
- The C-even part satisfies G5 + W4 = O1⁺ + O2⁺, and G5 is the equal mix: tr(G5·O_i⁺) = 2.

In this basis Hbits = diag(16, 16, 18, 18) and C = diag(+, +, −, −) on the multiplicity space.

## Part 2: the selected Abar on V (exact at the enclosure midpoints, error carried)
The midpoint Abar is computed in exact rationals. It is symmetric and exactly A5-invariant. P_aAP_a = m_aP_a holds
exactly (Schur). The multiplicity matrix in the adapted basis, |entries| to 10 digits, is:

| | G5 | W4 | O1⁻ | O2⁻ |
|---|---|---|---|---|
| G5 | 1.3230128265 | 0.0025942436 | 0.0011828863 | 0.0011584280 |
| W4 | | 1.6481628537 | 0.0080640421 | 0.0092429670 |
| O1⁻ | | | 1.6719993531 | 0.0035341915 |
| O2⁻ | | | | 1.4309330273 |

The off-diagonal signs depend on the choice of intertwiners; the magnitudes do not. The diagonal is m_a = tr(P_aA)/4;
an off-diagonal entry is ‖P_aAP_b‖_F/2.

Every entry of the true (enclosed) operator differs from these by at most η = 48·err < 5×10⁻¹³ (the Q112 norm
argument), and every inequality below is checked with η included.
- **[Abar, C] ≠ 0** for the true selected bridge, certified. Its C-even/C-odd coupling is about 0.0124 in Frobenius
  norm, and by Part 1 it lies entirely in V. Q85 had already seen, in float64, that the bridge B^J itself breaks C
  (‖CB^JC − B^J‖_max ≈ 0.147). New here: this breaking survives the A5 twirl, and it is confined to V.
- **b² = ‖(I − G5)Abar G5‖²_F/4 = 9.47…×10⁻⁶ > 0**, certified. This is Q115's variance coefficient, now resolved by
  line: the W4 part is 6.73×10⁻⁶, and the two C-odd parts are 1.40×10⁻⁶ and 1.34×10⁻⁶.

## Part 3: the residue concentration, explained and bounded for every c > 0
Let M(c) = diag(16, 16, 18, 18) + c·M_A be the 4×4 reduction of K(c) = Hbits + c·Abar. Let e₁ be the G5 line, and
let w₁(c) be the source residue on the lowest pole.

**Theorem.** For every c > 0:
- The lowest source pole λ₁(c) is the bottom of the spectrum of K(c) on V. It is isolated, and
  |λ₁(c) − 16 − c·m_G5| ≤ c‖E‖, where m_G5 = 1.3230128… and ‖E‖ ≤ 0.0186.
- 0 < 1 − w₁(c) ≤ 1.0077×10⁻⁴ for 0 < c ≤ 9.
- 0 < 1 − w₁(c) ≤ 1.1864×10⁻³ for all c > 0.
- lim_{c→0} (1 − w₁) = ½[1 − Δ/√(Δ² + 4M²_{G5,W4})] = 6.3646×10⁻⁵, where Δ = m_W4 − m_G5.

**Proof.**
1. In the adapted basis, M(c) = D(c) + cE, where D(c) = diag(16 + c·m_G5, 16 + c·m_W4, 18 + c·m_O1, 18 + c·m_O2)
   and E is the off-diagonal part of M_A.
2. m_G5 is the strictly smallest diagonal entry, so d₁ = 16 + c·m_G5 is the smallest entry of D(c).
3. By Weyl, every eigenvalue other than the lowest is at least d₁ + Δ(c) − c‖E‖₂, where
   Δ(c) = min(c(m_W4 − m_G5), 2 + c(min m_odd − m_G5)).
4. The Rayleigh quotient of e₁ is μ = d₁, and the residual is ‖(M − μ)e₁‖ = c·b.
5. Chebyshev's inequality applied to the source spectral measure gives Σ_{k≥2} w_k(λ_k − μ)² ≤ c²b².
6. Hence 1 − w₁ ≤ b²/(Δ(c)/c − ‖E‖)². Bound ‖E‖₂ by ‖E‖_F, and use Δ(c) ≥ c(m_W4 − m_G5) for c ≤ 9 and
   Δ(c) ≥ c(min m − m_G5) for all c.
7. The lower bound follows from b > 0: e₁ is never an eigenvector of M(c).
8. As c → 0, the C-odd lines decouple (their gap is 2), and the degenerate C-even pair (both at Hbits = 16) is
   diagonalised by M_A's 2×2 block. ∎

The float64 full 64×64 spectra at c = 10⁻³, 0.1, 1, 2, 9, 10, 40/3, 48, 100 and 10⁴ agree:
- 1 − w₁ rises from 6.36×10⁻⁵ to 2.18×10⁻⁴;
- at c = 1 it is 6.47×10⁻⁵, matching Q115's 0.999935.

**What this means.** The ≈0.99993 concentration is **forced, but not exact**. It comes from the near-diagonality of
the selected Abar in the Walsh/complement basis of V. The G5–W4 coupling 0.0026 is small against the splitting
m_W4 − m_G5 = 0.325, and the C-breaking couplings are of order 10⁻³. It holds uniformly in c. It is not a
perturbative small-c effect: G5 and W4 are degenerate under Hbits, so even as c → 0 the residue stays 6.4×10⁻⁵ away
from 1.

## Consequence for ACTIVE PROBLEM A (scoped obstruction)
On the selected Q77 chronology, the source spectral data can select c in neither of two ways:
- the residues are c-insensitive to within 1.2×10⁻³ for all c > 0;
- the source pole never crosses, or nearly crosses, another branch of V. It is the isolated bottom, with gap at
  least c(0.1079 − 0.0186).

So no residue-concentration, level-crossing or avoided-crossing criterion on V can fix c. c can only enter through
the pole position 16 + c·m_G5 + O(c·10⁻⁵), which needs an independent native normalisation of the history action
against the clock. That is the Q104 transport question.

Not established:
- an exact closed form of m_G5 (the t_x are known only as certified enclosures);
- any value of c;
- any physical ARF;
- any relation to the moving Track M.

## Execution
`python research_archive/2026-11-14_q118b_quartet_multiplicity/Q118B_QUARTET_MULTIPLICITY.py`. Executed in Claude's
cloud sandbox: exit 0, 106 checks, about 45 s (most of it the Q77 certificate it re-runs). GitHub CI is on the
commit that adds it.
