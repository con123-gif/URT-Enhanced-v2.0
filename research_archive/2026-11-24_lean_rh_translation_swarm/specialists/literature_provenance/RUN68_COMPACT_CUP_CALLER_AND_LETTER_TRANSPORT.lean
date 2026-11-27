import New.Selmer.OnePlaceDefect

/-!
# RUN68 — 27 Nov 2026: exact sparse/two-size caller budgets and letter transport
Human source-matched derivations; prepared scalar certificates, NOT compiled.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207
(main rechecked unchanged), Lean 4.35.0, Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion-first);
manuscript blob 52c0ccfd0dc525f446dd8bc935a7df71912c8709.
Latest peers read: 7d33beab (period coefficient/zero-orbit),
447982c7 (tame exponent, inspected actual diff), aee9e04a,
58afe07e, 4c982eab, f5180dc, 08696edb, dfa8fce.
Do not duplicate editor D budget or RUN56 cut/profile theorem,
RUN67 low-jump colength payment or Galois RUN68 tame descent.

Actual compact bodies and source hashes (grh-compact/src):
New/Selmer/CrystallineBound.lean 7b7ba1c2ac12f09651b5c1285109ff0435258e79
  crystalline_defect_le
New/Lift/SparseThickLetters.lean c7ac57b4aca6855d8ed64542e0b247b221325395
  SidePairing.scaledCupBounds_sparse_thick / scaledCupBounds_two_sizes
New/Selmer/OnePlaceDefect.lean 709e688740863f10dbbb284446ca20c0ba2a280a
  block_defect_le_at_place
New/Selmer/ThickSpacing.lean 66fcffeac3f881a562db9163cd66a207e15bdf19
  cmSign_eq_of_thick, placeClass_ratio
New/Data/Different.lean 44f64349db3642e89b752cc92979999edac5c185
  dvd_norm_c₀, c₀InE_mul_one_sub, pow_d_ne_neg_one
Lib/PadicHodge/WachKisin/KummerChartExists.lean
  f90f19a17f77be0aff920a5db18ae389d5898561
  differentExp, exists_kummer_chart.

## 1. Small-prime sparse-thick call — all numerical hypotheses
Write p=ell, v=lambdaLoss(h,b,p), K=floor(2v/Q).
Keep the native Q>0, p prime, hQ, hG, hb, hm, hδ, hη, hU/hU',
hL, c, chart, letter, support/sign hypotheses. In particular
 h>=99(Q²+(V+1)Q+Q+V+m), G>=99h³,
 b>=99G(h³+1), 99((η+V)Q+η+h)<=h³, δ<η,
 2 log(4b)<m, 2b<p(v+1).
V is the source width W at crystalline_defect_le; distinguish it
from the enlarged width at SparseThickLetters. h>=99, m>=1,
G>=h³, b>=G, δ+V<=G, h<=b. As editor independently derived D,
in the small-prime branch p<=Q we have 2(b+δ)<h²K.
It follows immediately that K>198Gh (strict, using hb).
No further estimate of lambdaLoss is required for this branch.

Instantiate the EXACT sparse-thick call with
 B=b+δ, G0=G+δ, η0=2G, W0=9G, X=K,
 J=floor(log_p(h³)), β_i=if T_i then B else G0.
The actual opposite windows enlarge from η to 2G. The thin
center satisfies G0+V<=2G=η0, and V+4η0<=9G=W0.
η0>=1. Since p^J<=h³,
 11(p^J+1)W0 <=99G(h³+1)<=b<=B.
The exact chart ramification e obeys 1<=e<=h.
The defining log inequality p^(J+1)>h³ and D imply
 e(2B)<=h(2B)<h³K<p^(J+1)K,
 8e<=8h<=h³<p^(J+1).
These are the actual hδ and h₈ of the sparse supplier, with
X=K, not an assumed unramified chart at small primes.
The chart different COST is defined as
 d=0 if e=1, else v_p(e)+1.
In particular d<=log_p(e)+1<=m, including e divisible by p.
For every natural H with 1<=H<=4b, floor(log_p H)<m:
 log_p H <= log(4b)/log p <2log(4b)<m
since log p>=log 2>1/2. Apply to H=e,h³,2B.
Consequently J+1<=m, log_p(2B)<m, and
 4(J+1+d+log_p(2B))W0 <=108mG
 <= (108/99)hG <198hG<K.
The inequality with rational coefficients is only a proof of the
natural-number comparison, no rounding is introduced.
The sign assumption is exactly hu (for p<=Q it says constant
signs), and hT becomes the forward-Frobenius three-letter
exclusion by the actual letter Teichmuller map. See section 3.
Thus ALL numerical premises of scaledCupBounds_sparse_thick
are supplied, and its exponent is 10^4*K*(J+1)<=10^4*K*m.
This is the exact caller bridge; the inner cut/cokernel/safe-pair
theorem is retained with its existing human derivations.

## 2. Large prime, large valuation — all two-size call hypotheses
Now p>Q, v>=h³. In particular v>=Q. Let B,G0 be as above,
η0=η, W0=V+4η. The source hu gives unramified chart and p>=7.
The exact division identity gives KQ<=2v<(K+1)Q, hence
 KQ>=2v-Q+1>=v+1.
This one integer inequality pays all three size guards:
 (i) p(v+1)<=pKQ<=Kp², so B<=2b<p(v+1)<=Kp².
 (ii) QG0<=2QG<=99G(h³+1)<=b.
 Thus 2QG0<=2b<p(v+1)<=QKp, so 2G0<Kp
 by cancellation of positive Q.
 (iii) QW0<=4Q(η+V)<=4h³/99<=v+1<=KQ;
 hence W0<=K.
Also 5W0<=20(η+V)<=20h³/99<=G<=G0,
G0<=B, η>=1 and V+4η<=W0 by equality.
All inequalities are uniform in rank and in number of letters.
Therefore scaledCupBounds_two_sizes applies with its original
constant 10^4*K*(floor(log_p(2B))+1)<=10^4*K*m.
No need to bound a separate norm for each Frobenius letter.
Both large and small prime exponent branches now feed the SAME
normLength_defect_le, giving at most 2*10^4*rank*K*m
times local index, which is within the original 10^5 budget.
RUN67 deals independently with v<h³ and the low-jump case.
This closes the numeric caller at crystalline_defect_le at
the human level, conditional on the actual cup suppliers.

## 3. Coherent signs at ramified thick places and actual hT transport
Let P.N0=N, conductor=N1*d, as in Different.lean. N divisible
by 18480, d=N/2-1 mod N, N divides 2(d+1) but not d+1.
Then d²≡1 mod N, since N divisible by 4; d≠-1 mod N, and
1≠-1 mod N since N>2. Thus no d^n is -1 mod N.
For p|N1, write x=e(c0InE), with c0=(1+sqrt(-d))/2.
If two complex embeddings read by g,g' have opposite CM signs,
then their images of sqrt(-d) sum to zero; pulling through
the fixed p-adic/complex isomorphism gives gx+g'x=1.
Both have the same p-adic norm a by Galois isometry. Since
gx*g'x=g(x(1-x))=(d+1)/4, the actual dvd_norm_c₀ gives
a²<1 and thus a<1. But 1=|gx+g'x|<=max(a,a)=a, impossible.
This argument also holds at p=2, without division by 2 in
a residue field (we used the characteristic-zero equality).
For p|N1*d but p∤N1, p=d. The relative action of g'g^-1
on the primitive N1-th root is p^n (prime-to-p unramified
roots); apply actual placeClass_ratio with a=0, modulus N.
Both thick classes are -1 mod N, so their ratio is 1.
Opposite signs would force d^n=-1 mod N, just excluded.
This supplies cmSign_eq_of_thick, not a constant sign for
every arbitrary embedding. The actual sign function in
OnePlaceDefect uses the same selected thick embedding for
every letter when p divides the conductor; hence constant.
For actual thick g its selected sign agrees by the lemma.

For p∤conductor, inertia fixes all conductor roots and hence
e(E) by fixes_emb_of_fixes_rootsOfUnity (E embeds in the full
cyclotomic field by Different.lean). Thus the completion
group contains inertia and exists_kummer_chart gives the
unramified chart (e=1,E=z+p). For F(g)=coeffEmb(O,g)(ζ),
ζ primitive M=p^f-1, equality F(g)=F(g') implies relative
action fixes every M-th root, hence the chart coefficient
ring Λ. In the unramified chart theta(z)=-p, also fixed.
The native chart_isChartOf identifies this simultaneous
fixer as contained in the completion group; hence by
IsCompletionGroup.complexEmbOf_eq_iff the two complex
embeddings agree. This is stronger than an equality of
signs and proves the actual same-letter T and s assignments
via the chosen representative (epsilon_spec). No claim for
arbitrary charts or ramified same-letter thin embeddings.

For the remaining hT, let M=p^f-1 and N'=prime-to-p part
of N1; take ζ_N'=e(P.ζ)^p^a with p^a the p-primary factor
of N1. The actual chart supplies y in the completion group
acting on the residue field as p^f-Frobenius (hy).
Since y fixes e(E), y(ζ_N')=ζ_N'; since N' prime to p,
the Frobenius action on these roots is p^f, so N'|M.
This is the order-projection cancellation in OnePlaceDefect,
not an assumption N1|M. For two representatives with
F(g')=F(g)^(p^j), the primitive-root character equality C
says g'g^-1 has cyclotomic character p^j mod M.
Reducing modulo N' yields
 (g'g^-1)(ζ_N')=ζ_N'^(p^j).
For three thick letter values z,z^(p^A),z^(p^(A+B)) choose
the actual thick representatives of all three. Relative to
the third, the first and second have exponents A+B and B.
RUN67 bounds 0<B<A+B<=24s<27s, so not_thick_of_short_arc
excludes the middle representative. This is the quantified
hT at CrystallineBound. The transport uses the actual
completion group, root of exact order, and chosen chart;
no generic "same residue implies same embedding" principle.
This completes the source-matched letter/sign bridge.

## 4. Literature provenance and boundaries
Iovita–Marmora, On the continuity of the finite Bloch–Kato
cohomology, Rend. Sem. Mat. Univ. Padova 134 (2015), 239–272,
DOI 10.4171/RSMUP/134-6, publisher abstract
https://ems.press/journals/rsmup/articles/13465 :
for crystalline representations of an unramified base with
weights in [0,r], r<=p-2, p>=3 and e(r-1)<=p-1, functoriality
of finite Bloch–Kato images modulo p^n under congruence maps.
The native two-size/sparse-thick weights can greatly exceed
p and the small-prime chart can be ramified; the published
hypotheses are not implied. This is NOT a direct supplier.
Gao–Liu arXiv:2411.11084 abstract https://arxiv.org/abs/2411.11084
concerns integral Sen filtration vanishing and torsion;
no claim from the abstract of the required simultaneous
cup exponent for opposite signed multi-letter windows.
Čoupek–Gazaki–Marmora arXiv:2603.26035 abstract
https://arxiv.org/abs/2603.26035 gives exactness of BK
functors on the stated semistable extensions and an Ext
factorization for Kummer cup products of good-reduction
abelian varieties. It does not, on this evidence, supply
our all-lattice quantitative cut exponent. No replacement
of the native integral safety/Ext supplier by a citation.
These are statement/abstract screens, not a claimed
full-text theorem match or blanket impossibility result.

Local source graph:
block_defect_le_at_place -> crystalline_defect_le ->
(sparse_thick OR two_sizes OR few_low_jumps) ->
scaledCupBounds -> mem_cupOrthogonal -> normLength.
New human bridges: chart sign/letter transport; exact size
and different guards for both exponent branches. Existing
cut selection, safe-pair profile, long-gap and colength
arguments retained at their actual contexts; Galois RUN68
addresses the separate tame supplier. No new external
premises beyond the native foundational ones; no globally
deleted edges. Original/reduced graphs and axioms unchanged.
Cache key compact pin, same D,p,place,O,Γ,chart, e,f,
actual roots and jumps, pair, index, exact K and modulus.

Execution: command -v lean/lake/elan and toolchain listing
empty. Native engines unavailable locally; old-pin engines
do not validate compact work. Actual CI output reread:
cathedral-research-state/compute/rh-compact-primitives-replay-20261126/
outputs/targeted_results.json (run 45803534769; six named
checks with propext, Classical.choice, Quot.sound; A build
timeout 124; all_requested_checks_ok=false, full_RH_replay=false).
No new PASS or fabricated tests. Prepared scalar certificates
below; exact native declarations probed, not asserted as
new proofs. No Main or claimed RH theorem imported.

RESUME HERE: integrate sections 1–3 into crystalline_defect_le
and OnePlaceDefect, with RUN56 cut/profile and RUN67 payment;
independently audit Galois RUN68 good-root correction and
remaining actual cup/Ext safety argument, starting at the
exact LongGap/Pairing consumer. Retain the initial z-power,
integral frame, Galois-difference, value-field and exact
safe-pair Ext suppliers wherever still unclosed.
HANDOFF TO integration, editor, formal audit, Galois, native runner.
Human RH reconstruction incomplete.
-/

namespace RHRun68

theorem floor_budget (v Q K : ℕ) (hQ : Q ≤ v)
    (h : 2*v < (K+1)*Q) : v+1 ≤ K*Q := by
  rw [Nat.add_mul, one_mul] at h
  omega

theorem thick_guard (b δ p v Q K : ℕ)
    (hδ : δ ≤ b) (hQ : Q ≤ p) (hK : v+1 ≤ K*Q)
    (h : 2*b < p*(v+1)) : b+δ < K*p^2 := by
  have h1 : v+1 ≤ K*p := hK.trans (Nat.mul_le_mul_left K hQ)
  have h2 := Nat.mul_le_mul_left p h1
  have h3 : b+δ ≤ 2*b := by omega
  calc
    b+δ ≤ 2*b := h3
    _ < p*(v+1) := h
    _ ≤ p*(K*p) := h2
    _ = K*p^2 := by ring

theorem thin_guard (b G p v Q K : ℕ)
    (hG : Q*G ≤ b) (hK : v+1 ≤ K*Q)
    (h : 2*b < p*(v+1)) : 2*G < K*p := by
  have h1 := Nat.mul_le_mul_left 2 hG
  have h2 := Nat.mul_le_mul_left p hK
  by_contra! hn
  have h3 := Nat.mul_le_mul_left Q hn
  have e1 : 2*(Q*G) = Q*(2*G) := by ring
  have e2 : p*(K*Q) = Q*(K*p) := by ring
  omega

theorem width_guard (Q W K v : ℕ) (hq : 0 < Q)
    (hW : Q*W ≤ v+1) (hK : v+1 ≤ K*Q) : W ≤ K := by
  by_contra! hn
  have h := Nat.mul_lt_mul_of_pos_left hn hq
  have e : K*Q = Q*K := Nat.mul_comm _ _
  omega

#check crystalline_defect_le
#check block_defect_le_at_place
#check cmSign_eq_of_thick
#check placeClass_ratio
#check Lift.KummerChart.differentExp
#check Lift.KummerChart.PairingSide.SidePairing.scaledCupBounds_sparse_thick
#check Lift.KummerChart.PairingSide.SidePairing.scaledCupBounds_two_sizes
#print axioms crystalline_defect_le
#print axioms cmSign_eq_of_thick
#print axioms RHRun68.floor_budget
#print axioms RHRun68.thick_guard
#print axioms RHRun68.thin_guard
#print axioms RHRun68.width_guard
end RHRun68
