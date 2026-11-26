import New.Columns.LocalStatement
import New.Endgame.ShortAndEnough
import Mathlib.Tactic

/-!
RUN61 — 26 Nov 2026. Source-matched human proof of the aggregate marked
index and uniform local-to-global divisibility assembly. Native probes
and scalar certificates PREPARED ONLY. Credit Alpöge, Sernau, Anthropic
collaborators and Claude. Compact pin lsernau/grh-lean@
72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0, Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion-first),
manuscript a1cd58ab264179f0e35001a50da0853ef4b9d858.
Protocol/queue/expansion/AGENTS/continuity/state/log checked. Predecessor
80b3640898569b44560601494b596cd77f7bfd17 (RUN60). Peers 3e2e639b
(split complement pairing), e82befc5 + ec29276e (projector), 3347d944
(deep-form cost), 5d295d09 (paired Fourier) supply DISTINCT pieces;
do not redo those derivations. Integration 3c29c488 and 5974a9fe.
No new finite diagnostics: follow latest completion-first directive.

Source ledger relative to grh-compact/src:
New/Core/ModuleIndex.lean 214cc116f97852925f444db42bfa36cf563af508
  IndexDvd 20, trans 31, map 37, sup 46, comp 50, HasType 55, prod 60.
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
  hasType_prod_markOperator_pow 233-240, gaugeLe_Bmu_of_isMarked,
  gaugeLe_collisionSum, gaugeLe_pow_jetCeil_smul,
  exists_indexDvd_Bmu_divisible 285-end.
New/Columns/MarkedPrimeType.lean 5433d457d06b8f0e209209be1407fe1971ef86f8
  IsMarked.hasType_markOperator 15-67.
New/Columns/TwistedHeckeType.lean ccae44b8b21d1bface80bc3c8b10370a48c8ea48
  Columns.hasType_markOperator 146-239; gaugeLe_Bmu_at_N 113-135.
New/Columns/JetExponentBound.lean bedef08c7c1707f74e9afce0c8008b88ba37dc8a
  le_loss 30, exists_isMarked 53-59, inducedPlace_eq_or_star_iff 64-68,
  IsMarked.card_le 70, mul_collisionSum_le_loss 138-144.
New/Curve/LiveSum.lean 3efab3907b063bb2c59d182df981ad62862f8a1b
  loss 39, jetCeil 49, IsServed 57.
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834
  scale and m_mem 29-32, a 101.
New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e
  c_ge 21, hasLogBound_f 154-156, a bound 177.
New/Exchange/CrudeModularData.lean 2be49b2690280e070d21691f8a569fc81e113b2b
  IsMarked 77, IsFullMark 85, markExponent 98.
New/Columns/SizeEstimates.lean 0b666c5f3cead375b65b97c6af8a25675486b473
  allowedLoss 83, sum_allowedLoss_mul_log_le 88.
New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a
  Data.short_forms 138-162.

1. The actual module-index calculus does not assume a finite-index
lattice over a DVR. O=embValRing is the native valuation ring.
IndexDvd(M,N,z) means for EVERY finite tuple phi in M, a square
matrix A over O with det A dividing z sends the tuple into N.
Given witnesses A and B for successive conditions, BA sends the
original tuple into the last module and det(BA)=det B det A
divides the product. Pushforward: write each phi_i=f(x_i)+n_i
with x_i in M and n_i in N'; a single matrix A that sends x
into N sends phi into N' when f(N) is contained in N'. Pullback:
apply the same witness to the tuple of images. In particular, for
an endomorphism f preserving M and scalar a0=p^s, the map rule
sends IndexDvd(M,N+a0 M,z') to
IndexDvd(f M+a0 M,f N+a0 M,z'), since f(a0 M) is in a0 M.
Compose with IndexDvd(M,f M+a0 M,z) to get the native comp.
For a list of operators preserving M, induction gives the
same ordered product's HasType at the SAME cutoff s, with
integer exponents added. No commutation or eigenspace choices.
For the empty list use identity and exponent zero. This derives
the native trans/map/comap/comp/prod chain.

2. Exact aggregate index at hasType_prod_markOperator_pow.
Fix the SAME D,p, Lambda marked, M=integralColumns, dC=dim Column,
s=jetCeil(p), Y the product in Lambda.attach.toList order.
Write B=log b, t=a/p, L=log x, L1=log x1, and f=#infinitePlaces.
Single marked operator bound from IsMarked.hasType_markOperator:
    (128 A_l B/(mp) + s/x^14 + x^40) dC.
This is a separate nontrivial supplier; retain the actual twisted
Hecke type, letter-map and size conditions. The finite disjoint
fibers of inducedPlace among tops give sum_l A_l <= a #tops <= fa.
Also #Lambda<=f. The m-fold ordered list gives, BEFORE any bounds,
    c <= [128 B/p sum_l A_l
           +m #Lambda (s/x^14+x^40)] dC.
Here s=ceil(2 m f t) <=2m f t+1. Consequently
    c/dC <= 128 f B t + 2m^2 f^2 t/x^14
                           + m f (x^-14+x^40)
where the divided expression is only notation for the coefficient
of dC; the proof does not divide by dC, including dC=0.
The f^2 in the middle term must NOT be dropped.

All scalar comparisons follow from native data. Magnitudes.c_ge
and scale imply B>=128, x>=8, L1>=10^6 L, B>=10^6 L1.
The actual f bound is f<=exp(11L+log(B)/5+P.c).
Since P.c<=log(B)/10^12 and 100 log(B)<=L, it gives f<=x^12.
Also m<=2 sqrt(x) by m_mem; hence
    2m^2 f/x^14 <= 8/x <= 1.
Thus the middle term is <= f t.
For the last term, m(x^-14+x^40)<=4 x^(40+1/2).
The logarithmic comparison
    log 4 + (39+1/2)L + L1 <= B
follows from x>=8 (log4<=L), L1>=10^6 L and B>=10^6 L1.
It gives 4 x^(40+1/2) <= x exp(B)/exp(L1) <= a/p,
using a>=x exp(B), p<x1. Hence the last term is <= f t.
Now 128 B+2 <=3 B^2, so
    c <= (128 B+2) f t dC <=3 f B^2 t dC <=3 loss(p) dC.
This explicitly supplies the native aggregate bound, retaining its
original constant. In particular there is an INTEGER l satisfying
IndexDvd(M,Y^m M+p^s M,p^l) and l<=3 loss(p) dC.
No eigenvalue-by-eigenvalue bound or new lattice assumed.

3. Full-mark witness, exact uniform quantifiers and rounding.
For a served p, g=placeOfInt(-p), d=o0(p) is its order in the
quotient defining tops, and c=g^d. The tops in a given orbit
of l or conjugate l are exactly c^j tau for tau a top inducing l:
membership in tops means d divides the exponent, and the native
inducedPlace_eq_or_star_iff gives the converse. Since d is odd,
c swaps conjugate places (inducedPlace_neg_pow_mul_of_odd). Thus
both primes occur, the orbit length is even and the parity classes
are equinumerous. Pick one member of each conjugate pair by any
fixed total ordering; this is the native exists_isMarked witness.
No dependence on a twist or a datum. The same orbit t(j)=c^j tau
is injective mod ord(c), covers exactly the two fibers and yields
A_l=a #even in MarkedPrimeType. Keep the native residue-field
identity, Frobenius congruence via frob_ext and HeckeSizes bridges
as additional actual supplier hypotheses: orbit parity alone does
not prove the Frobenius-twisted Hecke type.

Fix p, D and integer beta satisfying beta<g_p-err_p+1, with
g_p=gain(p) on nonsplitPrimes and zero otherwise. The local
module S MUST precede all twists ϑ, good Ψ and columns in the
quantifiers. For small nonsplit served p let ell=loss(p)>=1
(the native le_loss and size bound), err=3ell, and use precisely
S=Y^m M+p^s M. Part 2 supplies its integer index bound. For
every phi in S write phi=Y^m u+p^s v with u,v in M. These
summands need not separately be ramified. RUN55/59/60's full-mark
gauge bound is p^(2ell-g_p) on the first, and the cutoff
gauge bound is p^(ell-g_p) on the second. The ultrametric sum
bound, and beta<g_p-3ell+1<=g_p-2ell, imply
    gauge(p^(-beta) B_mu(phi)) <= 1,
since the scalar p^(-beta) has p-adic norm p^beta. No need to
replace the real gain/err by integer quantities.
For small nonsplit unserved p, use S=M, l=0. The native
m collisionSum <= ell gives gauge<=p^(2ell-g_p), and the
same rounding argument applies.
At p=N, necessarily outside nonsplitPrimes, choose S as the
native Fourier-power integral preimage (comap from
exists_indexDvd_fourierOp_pow), not a twist-dependent kernel.
The index theorem is a retained level supplier. Its gauge
bound is p^(3mfb), err=4mfb, and mfb>=1, so
beta<-4mfb+1<=-3mfb. This proves the required scaled
integrality on ramified phi using gaugeLe_Bmu_at_N.
For other primes use S=M, l=0: the gain and err vanish, so
integer beta<1 implies beta<=0. The native gaugeLe_one
applies (the discriminant prime d belongs to the small
nonsplit set by the scale and chiK(d)=0).
This is the exact case split in exists_indexDvd_Bmu_divisible.
Keep all primitive gauge and level-Fourier suppliers; this
proof discharges the uniform module assembly, not those suppliers.

4. Actual short_forms consumer: rational normalization and
the finite projection index. Put beta_p=ceil(g_p-err_p).
Then beta_p<g_p-err_p+1 and
q=prod_{p in nonsplitPrimes union {N}} p^floor(err_p-g_p)
  =prod_p p^(-beta_p).
Positive rational q is the SAME for all embeddings and all
projections. Its valuation at p is -beta_p, so multiplying by
q has the same p-integrality effect as p^(-beta_p).
Pull S back along the ramified-column inclusion. For each
projection f_s=q projectedPoincare(s), the exact seesaw identity
and goodProjTranslate_mem_integralForms bridge the local
B_mu result to Theta(ϑ) f_s on that pullback. These are retained
actual geometric inputs, not arbitrary linear maps with
assumed integral values.

For a finite projection set t0, each f_s has the same index
certificate p^l relative to N'=preimage of integral forms by
Theta(ϑ). Any finite tuple in the sum of f_s(M_ram) and N'
has a decomposition into those summands. Apply the single
operator's index witness to its preimage tuple, then apply
the next witness to the already transformed preimage tuple;
earlier summands stay in N' under O-linear combinations.
After all #t0 witnesses, the composite determinant divides
p^(#t0*l). This proves the native IndexDvd.sup argument
on the actual projection family. In particular the log
index is bounded at p by
    #t0 * dC * err_p * log(p).
Summation for arbitrary finite prime sets, using native
sum_allowedLoss_mul_log_le, gives exactly
    #t0 * dC * budget.
This supplies the second field of short_forms from the
uniform local bounds. The first, archimedean height field
still uses native span_short_ramifiedColumns, normSqAt_goodProjTranslate_le,
weylNormSq_Bmu_le and heightPerRow_le. Do not infer it from this
index calculation alone.

Status and frontier. Local source graph (context key compact pin,
D,p,Lambda,M,cutoff s, ordered Y): individual marked type ->
HasType.prod + disjoint-fiber/scale bound -> aggregate type;
full-mark and cutoff gauge + aggregate type -> uniform S;
unserved + level + other branches -> local beta-integrality ->
rational q, comap and sup with seesaw -> short_forms index ->
A+B covolume -> star_inequality. Original/reduced graph and axiom
archives preserved; no global deletion. Remaining at individual type:
actual exists_depth_factorization/root lemma and the last assembly
hasType_twisted_hecke, with the peer projector, pairing and dimension
suppliers; the class-representative/operator intertwining and
HeckeSizes at Columns.hasType_markOperator and IsMarked.hasType_markOperator.
Also level Fourier and same-stage pairing/support/phase premises,
plus B/C distinct branches. Not a proof of the prime bound or RH.

Native lean/lake/elan not on local PATH (checked). Old-pin rh_scan,
rh_prune, rh_reduce, rh_auto, rh_auto_frontier not executed on compact;
not silently using old-pin coverage. Actual run 45803534769 jobs
and integration receipt d07359dc7 re-read: overall_task_passed=false,
six native B/C probes, A module timeout; wrapper successful only.
No new native validation; no new synthetic or arithmetic regression.
Probe below checks actual root-relevant declarations/axioms if
compiled by shared approved compact runner. Independent audit requested.

RESUME HERE: editor integrate sections 1-4 with RUN55-60 and the
peer projector/pairing/deep-dimension proofs; prime lane next work
at exists_depth_factorization 77-137 (primitive factor excess
condition at the exact threshold), then hasType_twisted_hecke
217-261 and its actual class-representative caller; coordinate
with kernel and acceleration to avoid duplicate work.
HANDOFF TO integration, editor, theta, kernel, formal audit.
-/

namespace CompactPrimeRun61

theorem aggregate_budget (B f t H C : ℝ)
    (hB : 128 ≤ B) (hf : 0 ≤ f) (ht : 0 ≤ t)
    (hH : H ≤ f*t) (hC : C ≤ f*t) :
    128*f*t*B + H + C ≤ 3*f*t*B^2 := by
  have hft : 0 ≤ f*t := mul_nonneg hf ht
  have hb0 : 0 ≤ B := by linarith
  have hh : 128*B+2 ≤ 3*B^2 := by
    nlinarith [mul_nonneg (sub_nonneg.mpr hB) hb0]
  nlinarith [mul_le_mul_of_nonneg_left hh hft]

theorem full_mark_rounding (beta gain loss : ℝ)
    (hl : 1 ≤ loss) (hb : beta < gain - 3*loss + 1) :
    beta ≤ gain - 2*loss := by linarith

theorem level_rounding (beta M : ℝ)
    (hm : 1 ≤ M) (hb : beta < -4*M+1) : beta ≤ -3*M := by linarith

end CompactPrimeRun61

#check IndexDvd.comp
#check HasType.prod
#check Data.IsMarked.hasType_prod_markOperator_pow
#check Data.exists_indexDvd_Bmu_divisible
#check Data.short_forms
#print axioms Data.IsMarked.hasType_prod_markOperator_pow
#print axioms Data.exists_indexDvd_Bmu_divisible
#print axioms CompactPrimeRun61.aggregate_budget
#print axioms CompactPrimeRun61.full_mark_rounding
