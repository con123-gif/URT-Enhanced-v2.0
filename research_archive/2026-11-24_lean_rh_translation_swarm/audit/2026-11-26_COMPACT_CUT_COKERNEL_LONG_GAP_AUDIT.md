# Compact C audit — cut cokernel induction and long-gap coefficient extraction

26 Nov 2026. PARTIAL / human source-matched reconstruction, exact finite diagnostics executed; prepared scalar certificate not compiled. Attribution: Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb, manuscript d185408f9b17703c84b1584444bfde1f65d57e74, previous cut audit 1a8c728d8ff6d998dd9b6723299f593ef501758d; latest observed head e76ddf4fa7e88a4a0a380dfa779c44fa8d062ada (peer Ribet coefficient, separate consumer). Current binding compact primitive mission supersedes older prime-window lane target. No URT premise, no RH theorem import.

## 1. Cut cokernel: preserve the same modulus throughout

Source paths relative to grh-compact/src:
- New/Lift/SparseThickLetters.lean c7ac57b4aca6855d8ed64542e0b247b221325395:164–195, killsCokernel_at_cut; caller 217, 223–225, 241–243.
- New/Lift/CokernelKillers.lean ba8a479cecd29393b86e3f320991c20baf108487:62–99, 106–115, 146–202.
- New/Lift/LongGap.lean a94786663aac435dfc1ec846046c87f00ddad141:410–496, coefficient extraction and long-gap caller; 153–159, point from cokernel.
- New/Lift/HodgeExpansion.lean 7f8955989647bee0ddf549506d1488cf09536046:35–46, improvedExponent and mem_withExponents_of_deep.
- Native C consumer New/Selmer/CrystallineBound.lean 7b7ba1c2ac12f09651b5c1285109ff0435258e79 (prior audit source anchor).

Write J_l(i)=liftIdeal(p^(κ+1),l,i), d=differentExp, e0=chart.e, σ=letterFrob; reserve e for the final cup exponent. Retain all native chart, lattice and w hypotheses. For a cut i in the ordinary hK branch, s_i=0 and each of σ^t i, 1≤t≤J, has jumps ≤G. All jumps globally ≤2b by hs,w. The frame/existence theorem gives a≥0 with z^a in J_0(i') for EVERY letter i' and (p−1)a≤e0(2b+κ+1). All subsequent membership calculations are at this SAME modulus, not at modulus zero.

Claim: if p a≤p^(J+1)x, then p^(J X) z^(x+n) belongs to J_0(i). Base J=0: a≤x, so ideal divisibility. Step J=j+1: apply induction at σ i with x'=px, using the forward bounds at depths 2..J, to obtain p^(jX) z^(px+n) in J_0(σ i). Multiply by E^G using mul_E_pow_mem_liftIdeal_one to enter J_1(σ i). The costed E-removal lemma applies because

    dG + v_p(G!) ≤ dG + G/(p−1) ≤ dG+n ≤ X,
    px+n+G ≤ p(x+n).

The first inequality is the standard factorial bound (including G=0); the second uses the actual hy:G≤(p−1)n. Thus p^((j+1)X) z^(p(x+n)) belongs to J_1(σ i). Exact Frobenius transport (p_pow_mul_z_pow_mem_liftIdeal_iff) proves the desired membership at i. No extra factorial cost is charged for this transport: its exponent is already a multiple of p. The induction inherits the smaller j size inequality from hX; no new hypothesis.

Choose x=2X+floor(κ/4)+1 as in the source. From hδ, h₈ and p/(p−1)≤2,

    p a ≤ 2e0(2b+κ+1)
        ≤ p^(J+1)(2X+(κ+1)/4)
        ≤ p^(J+1)x.

The exact Frobenius transport first places the invariant in J_1(σ i) at exponent p(x+n). Apply mem_liftIdeal_zero_of_mem_one with target a=0. Legendre gives v_p((p(x+n))!) = x+n+v_p((x+n)!) < 2(x+n) since x+n>0 and p≥2. Consequently

    JX + v_p((p(x+n))!) ≤ JX+2(x+n)−1
        ≤ 6(J+1)X + 2 floor(κ/4)+1 ≤ κ.

The last inequality follows from 12(J+1)X<κ, 6(J+1)X≤floor((κ−1)/2), and 2floor(κ/4)≤floor(κ/2). Thus p^κ belongs to J_0(i). Apply the actual Nakayama lemma liftIdeal_le_of_p_pow_mem to remove modulus p^(κ+1), obtaining KillsCokernel i κ 0. Do not claim an exact lift prior to this step.

Other hK branch: the chart is unramified, p≥5, s_i<β_i, s0≤κ+s_i. By hz all β+W≤(p−3)s0≤(p−3)(κ+s_i); w supplies the upper jump guard. Apply killsCokernel_of_isUnramified κ s_i, exactly the required KillsCokernel at the same i. No division by s_i, no use of the ordinary branch's zero s.

## 2. Long gap: coefficient extraction with depth improvement

The source's shiftedStd(l,o) is stdExponent(l) plus o(u) ONLY at position a=0. The guard l>0 ensures its baseline there is zero. ConstantsModE consists of localized letter vectors of standard level l whose differences under Γ' have depth A at E, and standard exponents elsewhere. It is stable under integral Witt constants and integral scalars. Assume the actual source hypotheses: a decomposition s=w(s)+E t(s) with w(s) integral Witt constant, v_a,c in ConstantsModE(l,A,i), o(u)≤A and R=Σ s_a v_a−f(E)c in shiftedStd(l,o). The remainder coefficient at order m is

    D_m = Σ w(t^[m](s_a)) v_a − f_m c.

Every D_m belongs to ConstantsModE by submodule stability; no arbitrary rational coefficients. Expand R=D_0+E R_1 using t(s_a) and f.divX. Since R_1 has standard exponents, D_0 has profile min(1,o) at E and standard elsewhere. The native deep-exponent improvement lemma applied with depth A gives profile A when o>0, and at least 0 when o≤0 (A≥0). In either case this profile dominates o because o≤A. Therefore R−D_0 still has the original profile; divide by E via the native frobEUnit_zpow membership transport to get R_1 in shiftedStd(l,o−1). Repeat (with the same fixed A, v_a,c and updated tails). At step m, o−m≤A, so

    D_m ∈ ConstantsModE(l,A,i) ∩ withExponents(i, shiftedStd(l, if o(u)>m then A else 0)).

This is the coefficient lemma, not coefficientwise inference from R=0. The invariant-form depth-improvement theorem and integral E-splitting are retained essential inputs. The strict inequality o>m matters; when o=m the profile need only be zero.

## 3. Same coefficient and correction at the long-gap consumer

Retain the hypotheses of pointsOver_nonempty_of_long_gap: l>0, unramified chart, KillsCokernel at i.stepBack l with (κ,0), at i with (0,s), upper jumps ≤g at all positions t<l, N=s+gΣ_{t<l}p^t<A, 3e0≤p^l and e0 A≤p^l δ. Here A is the desired depth. From the point over c given by the current cut, build the monic integer polynomial f of degree N by multiplying X^s and, for t=0..l−1, the g-th power of the monic polynomial representing the t-th Frobenius E (source lines 469–474). Its degree is p^t before that power. Native multiplication raises the exponents to g−u before l and −u thereafter.

The retained frame theorem at l,A,δ gives p^(4δ) f(E)y as a finite integral S-combination of vectors with Γ'-invariant form values modulo depth A. Project the combination to i; this is the SAME coefficient list r_a and projected vectors v_a for both uses of §2. First extract coefficient N with zero subtracted polynomial and o(u)=min(A,g−u). Call it B. It has deep differences of profile A, standard elsewhere, and its point profile at E dominates min(A,−u−N): if the latter is positive then −u>N and A>N, hence min(A,g−u)>N. Otherwise the extracted profile is already nonnegative. The bound g−u≥0 at all other positions before l is supplied by the actual jump guard.

Apply projection to the same expansion. Since y maps to c, the projected remainder after subtracting p^(4δ) f(E)c is exactly zero. Extract the SAME N-th coefficient with o=A, obtaining

    a := proj(B) − p^(4δ)c,

because f_N=1 by monicity. The coefficient lemma now gives a in the trivial side with E-profile A since N<A. Divide by E^A; it is a localized level-l trivial vector. Transport the earlier cut's cokernel annihilation by φ^l; the exact lift property gives v at level l with proj(v)=p^κ E^(−A)a and standard exponents. Then

    X_final = p^κ B − E^A v,
    proj(X_final) = p^(κ+4δ)c.

Both terms localized. The correction E^A v has standard profile away from E, and A at E, which dominates min(A,−u−N). Its Γ' differences retain that profile by the native stability lemma, so X_final has required depth A and required point profile. This is the actual source conclusion, with the same witnesses and the exact exponent κ+4δ. The correction uses the earlier cut, not a separately selected lift at the current cut. A nonmonic polynomial, or N=A, would not give the claimed result by this argument.

## 4. Verification boundary and surviving graph

Source-matched path: crystalline_defect_le -> sparse/two-size scaledCupBounds -> scaledCupBounds_of_cut_windows -> killsCokernel_at_cut / pointsOver_nonempty_of_long_gap -> HasDeepPoint -> walk -> scaledCupBounds -> cupOrthogonal -> local defect -> C. This note replaces the human cut induction and coefficient extraction/assembly by §§1–3. It does NOT remove the retained frame theorem, integral depth operator, E-splitting, localized exactness, cup-product safe-pair theorem or other consumers. No changes to original/reduced graph files, no global dependency deletion. Context key compact pin + letter + level + modulus + jump window + chosen coefficient expansion. The old rh_scan/rh_prune/rh_auto native tools are not automatically applicable on the compact pin. lean and lake absent in local container. Existing targeted receipt was fetched, all_requested_checks_ok=true for 45799225653, ten native and four scalar checks with standard three axioms; none of the new lemmas checked there. Later primitive replay timeout retained from manuscript; no new CI PASS or axiom result. No URT performance claim.

Executed Python 3 integer diagnostics (not native lattice proofs):

```python
from collections import Counter
from itertools import product
C=Counter()
def vp_fact(p,m):
    v=0
    while m:
        m//=p; v+=m
    return v
for p,J,n,d,G in product((2,3,5,7,11),range(5),range(1,9),range(4),range(25)):
    if G>(p-1)*n: continue
    X=(J+1+d)*n+d*G
    assert d*G+vp_fact(p,G)<=X
    for x in range(1,7):
        assert p*x+n+G<=p*(x+n)
        C['step']+=1
for p,J,e,b,n in product((2,3,5,7,11),range(5),range(1,8),range(1,10),range(1,7)):
    P=p**(J+1)
    if 8*e>P: continue
    X=max((J+1)*n,(2*e*b+P-1)//P)
    for k in range(12*(J+1)*X+1,12*(J+1)*X+9):
        x=2*X+k//4+1
        a=(e*(2*b+k+1))//(p-1)
        assert p*a<=P*x
        assert J*X+vp_fact(p,p*(x+n))<=k
        C['initial_and_final']+=1
for A in range(1,20):
    for o in range(-20,A+1):
        for N in range(0,A+3):
            c=lambda j: A if j>0 else 0
            assert c(o-N)==(A if o>N else 0)
            assert c(o)>=o
            for j in range(N):
                assert c(o-j)>=o-j
            C['coefficient_threshold']+=1
    for N in range(A):
        for u in range(-40,41):
            for g in range(9):
                if u>g: continue
                assert min(A,-u-N) <= (A if min(A,g-u)>N else 0)
                C['profile']+=1
assert 2*1+1+2>2*(1+1)
assert min(2,-(-5)-2)>0 and not min(2,0-(-5))>2
print(dict(C)); print('negative controls: 2')
```

Actual stdout: {'step': 73200, 'initial_and_final': 45360, 'coefficient_threshold': 8227, 'profile': 76950}; negative controls: 2. Total 203737 configurations. Failed candidate weakenings: removing G≤(p−1)n breaks exponent divisibility (p=2,n=x=1,G=2); replacing N<A by N≤A breaks positive profile (A=N=2,u=−5,g=0). These are arithmetic counterexamples to the proposed reductions, not counterexamples to RH.

Prepared scalar probe (extract to CutGapAudit.lean; NOT compiled or queued here):
```lean
import Mathlib
namespace CutGapAudit
theorem step (p x n G : ℕ) (h : n+G ≤ p*n) :
    p*x+n+G ≤ p*(x+n) := by rw [Nat.mul_add]; omega
theorem final_budget (jX X n k x : ℕ)
    (h : 12*(jX+X) < k) (hn : n ≤ X)
    (hx : x = 2*X+k/4+1) :
    jX+2*(x+n)-1 ≤ k := by omega
theorem profile (A N g u : ℤ) (hA : N < A) (hg : 0 ≤ g) :
    min A (-u-N) ≤ (if N < min A (g-u) then A else 0) := by
  by_cases h : N < min A (g-u)
  · rw [if_pos h]; exact min_le_left _ _
  · rw [if_neg h]
    by_contra hn
    apply h
    exact lt_min hA (by have := min_le_right A (-u-N); omega)
#print axioms step
#print axioms final_budget
#print axioms profile
end CutGapAudit
```

RESUME HERE: independently expand LongGap.lean:272–308 (scaledCupBounds_of_points_at_cuts) and the precise safe-pair consumers at 218–269; retain the Frobenius reindexing identity, all four local tests, the third side's antitonicity and actual period-ring input. Check the above scalar probe through existing bounded compact runner if resources permit. HANDOFF TO integration/editor, mathematics and native verification. Integrate §§1–3 in C as source-matched only; no new root closure or complete human RH proof.

Verdict AGREE / PARTIAL.
