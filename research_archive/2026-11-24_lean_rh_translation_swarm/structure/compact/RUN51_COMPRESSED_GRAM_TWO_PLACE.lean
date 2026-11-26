import New.Endgame.LongForms

/-!
# Compact URT specialist RUN51 — one invariant chart and two-place determinant bound
26 November 2026. HUMAN SOURCE-MATCHED DERIVATION / native replay NOT RUN.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Current mission blob 23f64d503b7d64bb13b9667156b499021038d742 (both 26 Nov amendments),
manuscript blob e0cf5402bda7772a8ab2556b61d9d67859b36630.
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, current compact lane RUN50, continuity
and legacy research state/log/protocol excerpts. Latest peers ef865994 (prime
remainder), c7cde9ac (comparison descent), 15c60307 (kernel resource block),
d18891b2 (odd-Sha), 28039ee4 (source graph), bd1a2355 (denominator determinant).
Manuscript 6d already derives the determinant identity and height combination,
but leaves the compressed operator's two local determinant estimates as inputs.
This note supplies their mathematical arguments, including the tested projection.

Source blobs:
New/Rows/LiftVolumeHeight.lean 87938141d4103b485fd5a7125721798f65f973f1
New/Rows/ComparisonForms.lean 14ef893c54f5db837ea7e4f143b2b1a444b89b5a
New/Selmer/FitTwists.lean c62935a73ccbef6c7fc42f45c83f111e811a5825
Lib/General/LinearAlgebra/CommonEigenvectors.lean 681596f77b313c9d195bc6ab4dab3c2442c23665
Lib/Adelic/CuspForms/LevelForms.lean fffc85cdb75f20ad53d25ed6100b330e6b458896
New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05
New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65
New/Rows/HeckeValueHeight.lean f61d2e3c521863d4f814e3338e37c4e2c2fd1f84.

## 1. Exact coordinate normalization (finite case of exists_auerbach)

Fix the actual D,j,twist and L=range(goodLift) as in the caller; write d=dim L,
h=smallHookNumber j>0, gl for the comparison form map, K=h P_L gl gl*|L,
and assume gl* separates L. In this paragraph the field embedding iota is
fixed; no compatibility with conjugation is assumed.

For any finite separating family of linear forms lambda_a on L, choose d
of them with maximum iota-absolute determinant relative to a reference basis.
The maximum is positive since separation implies span of the dual. The dual
basis z_b of L satisfies lambda_(a_i)(z_b)=delta_ib. Replacing row b of the
chosen determinant by lambda_a multiplies it exactly by lambda_a(z_b),
by expansion of the replacing row in the chosen dual basis. Therefore
|iota(lambda_a(z_b))|<=1 for EVERY a,b. The d=0 case uses the empty basis
and determinant 1. This is a finite version of the actual native Auerbach
lemma, with no limiting compactness argument needed here. The same chart
must be used for both K's coordinate rows and its input vectors.

## 2. Nonarchimedean bound in the actual LiftVolumeHeight context

At the actual prime ell, choose one delta_c for each small-class representative
using exists_mul_mem_integralAbove as in the source. Write R_c for the weight
representation at delta_c. In the notation of the native proof, the table
f_a for a=(table block, Weyl coordinate) is zero outside its block and there
is the complex conjugate of R_c^{-1} applied to the conjugate of the
corresponding integral fockPairing(nablaBasis Z, nablaBasis Z) column.
The Weyl Gram times Fock pairing identity gives the source's exact Y:
  <f_a, zeta> = h conjugate((R_c conjugate(zeta_block))_coordinate).
Here and below inner products are conjugate-linear in the first entry.
The integral fockPairing column and the chosen integralAbove trivialization
give weylGauge<=1 for conjugate(f_a) at phi composed with conjugation for
EVERY phi over ell (the native weylGauge_embFin and weylGauge_le_one_iff).
Thus gl(f_a) is integral at every phi by the native int hypothesis.
These are the actual columns, not an arbitrary orthonormal basis whose
integrality would be unjustified. Keep the Weyl/Fock pairing identity
and integralAbove/gauge transport as explicit upstream facts.

Take lambda_a(z)=<f_a,gl* z>. The displayed Y and invertibility of R_c imply
these functionals separate L, using sep. Apply step 1 at the actual complex
to p-adic embedding. Its bounds, together with Y and rationality of h,
give gauge<=1 for conjugate(h gl* z_b) at iota composed with conjugation,
since its transported coordinates are exactly the conjugates of the lambda
values before applying that conjugate embedding. Thus y'_b=gl(h gl* z_b)
is integral at iota; it is tested by tst at h z_b (not an independent vector).
Set y_a=gl(f_(a_a)) with the selected indices. For this one family,
  [K]_ab = lambda_(a_a)(K z_b)
         = <gl(f_(a_a)), P_L gl(h gl* z_b)>
         = <y_a,P_L y'_b>.
First equality is the exact coordinate relation, second adjointness.
This identifies det K before any norm. Applying the native DenominatorLe
definition to these d families now gives
  |iota(det K)| <= exp(d r beta_ell).
No termwise denominator or factorial loss; no assertion that phi commutes
with conjugation; y_a integral at all embeddings, y'_b at the selected one.
This is norm_det_compressedGramOp_padic_le, with the native int, sep, tst
and DenominatorLe inputs retained.

## 3. Tested projection at every conjugate metric

Here use precisely the good-lift range, the split off-level w supplied by
frequently_isSplit_notMem_places, and the central idempotent e0 of FitTwists.
Let E be its action and H=H_w(testValue w). For each sigma put
H^dagger_sigma=H_(conj w)(sigma^{-1}(conj(sigma(testValue w)))).
The two native adjoint identities say E is self-adjoint for innerAt sigma
and H^dagger_sigma is the adjoint of H. H commutes with H^dagger_sigma
since w differs from conj w, both are off level. Thus, for v in ker H,
the squared sigma-norm of H^dagger_sigma v equals the squared sigma-norm
of H v, namely zero. Positivity gives H^dagger_sigma v=0. Consequently
ker E and range H are perpendicular to L for every sigma, since
L is contained in range E intersect ker H. At the identity metric,
ker H^dagger_1=ker H (normality gives both inclusions). Hence
  (L + ker E + range H)^perp = L^perp intersect range E intersect ker H.
The actual IsTested(e0,L^perp) condition says y is orthogonal to the
right-hand space, so y=z+x with z in L and x in ker E+range H.
Then z=P_L y for the ordinary inner product and the SAME decomposition
is orthogonal for every sigma. Pythagoras gives
  normSqAt(P_L y,sigma) <= normSqAt(y,sigma).
Only one eligible w is used for this archimedean step; the original
all-w IsTested is retained for DenominatorLe and other consumers.
This is normSqAt_starProjection_le, not a claim that every arbitrary
projection contracts every conjugate metric. The actual group-action and
Hecke adjoint/commutation suppliers remain cited.

## 4. Archimedean determinant with conjugate-paired automorphisms

Keep the actual untwisted comparison norm hypothesis S:
  h normSqAt(gl eta,sigma) <= exp(B) sum_a weylNormSq(sigma eta_a).
Here B=2rB0 in the actual caller. For any eigenvalue alpha of K choose
nonzero eigenvector z, set zeta=gl* z (nonzero by sep), and
sigma'=conj o sigma o conj. Define w=conj o sigma^{-1} o conj o sigma
applied entrywise to zeta. Then sigma'(w)=sigma(zeta) exactly.
Since the table Gram matrices have integral entries, the exact table
inner identity is
  sigma(<w,zeta>)= Q := sum_a weylNormSq(sigma zeta_a)>0.
Using Kz=alpha z, adjointness, and h rational positive gives
  |sigma(alpha)| Q
    = h |sigma(<gl w,P_L gl zeta>)|
    <= h sqrt(normSqAt(P_L gl zeta,sigma)) sqrt(normSqAt(gl w,sigma'))
    <= h sqrt(normSqAt(gl zeta,sigma)) sqrt(normSqAt(gl w,sigma'))
    <= exp(B) Q.
The middle line uses step 3 for the tested vector gl zeta; the first
inequality is the actual LevelForms.norm_map_inner_le, which follows
from weighted finite-class-sum Cauchy-Schwarz with the two conjugate
embeddings of the coefficient vectors. Both occurrences of S have the
same Q because sigma'(w)=sigma(zeta). Cancel only now, using Q>0.
Taking the product over the d roots of the characteristic polynomial
with multiplicities proves |sigma(det K)|<=exp(d B).
No assumption that sigma preserves positivity of arbitrary complex numbers
or adjoints, and no separate estimates on eigenvector coordinates. This is
the actual norm_det_compressedGramOp_arch_le.

## 5. Same witness and caller, unchanged native constants

For the actual IsFitFamily theta, step 2 at theta(iota)^j gives the
finite bounds with beta_ell from O.denominator_le j and step 4 at the
trivial twist gives the arch bound with B=2rB0. The native comparison
adjoint identity u*gl=gamma A with A surjective and gamma nonzero implies
gl*|L injective, det K nonzero, as already derived in manuscript 6d.
With auxiliary number det K_1 the two estimates supply
  HeightLe(3 d r B0, iota -> det K_theta/det K_1)
using the SAME local allowances beta_ell and their sum<=B0.
The exact determinant identity in 6d turns this ratio into the
single-lift volume ratio after multiplying by the inverse Hecke product
ratio to the d-th power (with the native allowed twist scalar conversion).
Use heightLe_inv_heckeValueProd_div, not a new independent Hecke estimate.
LongForms.heightLe_volume_ratio_sq then multiplies over the actual m lifts
and combines the same chain constant, and integral_forms_long uses the
same y, delta,V and theta as heightLe_volume_rows.
The manuscript's constants, quantifiers and remaining source suppliers
are unchanged. This fills a connected local mathematical explanation, not
a deletion of the Selmer, separation, comparison-form integrality, comparison
norm, Hecke-value or uniform scale suppliers. The new human graph has
finite maximal minor -> same-coordinate pairing -> local determinant,
tested projection -> conjugate-paired Cauchy -> arch determinant,
both -> HeightLe witness -> original volume ratio -> C -> star.
Original graph and all existing axiom evidence remain untouched; this is a
source-role graph, not kernel extraction.

## Controlled URT comparison and negative checks

Used the fixed q=(pi/e) exp(i 2pi/phi^2) recurrence A_v=1+q sum A_child
from structure/rh_algebra_urt_read.mjs (563488ceb7c23a385899eb7d82de9d92eb5cbe65).
On the following hand-inspected actual local supplier/consumer graph
(some edges are instantiated interface providers, not proof-term edges):
heightLe_liftVolume_ratio -> det_compressedGramOp, padic, arch,
exists_comparison_forms, heightLe_inv_heckeValueProd_div;
padic -> exists_auerbach, DenominatorLe, comparisonForm_mem_integralForms;
arch -> projection, norm_map_inner_le, normSqAt_comparisonForm_le;
projection -> innerAt_groupAlgAction, innerAt_heckePolyOnForms, heckePolyOnForms_comm;
exists_comparison_forms -> comparisonForm_mem_integralForms,
normSqAt_comparisonForm_le, inner_adjoint_comparisonForm,
eq_zero_of_integral_fNatural_tableTheta, tableTheta_adjoint_eq_zero.
Executed JS recurrence with memoization: root |A|=7.10778485645,
path-count including self=20; padic 2.81214634893 / 4; arch 2.04369192700 / 7;
projection 2.81214634893 / 4; exists_comparison_forms 5.08632174401 / 6.
Compared with ordinary path-count ordering, q ranks padic above arch even
though arch has more transitive occurrences. Both branches are required
and comparison forms is already claimed by peer c7cde9ac. No evidence of
speed/coverage gain; conventional dependency ordering used for this batch.
No native graph benchmark, no O(N) proof-search claim.

A fixed harmonic ordering of candidate chart rows cannot replace the max
minor test: already in dimension one, choosing lambda_1=p*x ahead of
lambda_2=x makes the latter's coordinate 1/p, of norm p. Therefore harmonic
ordering may only break ties or order a search preserving the max test.
Exact small regression controls, executed in JS (not actual D instances or
proof of the universal theorem): all 3x2 integer matrices in [-2,2]^6,
p=2,3,5, skip rank<2. 45,072 matrix-prime configurations; 270,432 exact
Cramer-coordinate valuation assertions succeeded for the maximum minor.
First nonzero minor failed on 6,112 configurations. Reproduce:
  pairs=[[0,1],[0,2],[1,2]];
  det=(a,b)=>a[0]*b[1]-a[1]*b[0];
  v=(n,p)=>{if(!n)return Infinity;let k=0;while(n%p===0){n/=p;k++}return k};
  for i=0..15624 decode six base-five digits minus 2 into rows a;
  for p of [2,3,5], ds=pairs.map(([j,k])=>det(a[j],a[k]));
  f=first index ds!=0; skip if none; m=index of minimal v(ds,p);
  for row r and selected pair [j,k], assert
  v(det(r,a[k]),p)>=v(ds[m],p) and v(det(a[j],r),p)>=v(ds[m],p);
  repeat with f and count configurations with any failed coordinate.
These tests validate the finite determinant arithmetic only, not the
actual automorphic or Selmer data. Another rejected shortcut: positivity
of K under the identity embedding does not imply its eigenvalues stay
positive under arbitrary complex automorphisms (sqrt(2) can map to -sqrt(2)).
The conjugate-paired argument above replaces that invalid step.

## Verification and handoff

Local command -v lean; command -v lake returned no executable.
Actual CI record compute/rh-compact-union-graph-20261126/status.json on
cathedral-research-state, blob ea44d71556e0d21703e72fcd61bbaf2bee0ec563,
run 45781154005: status error, RESOURCE_BLOCKED; workflow success only
means recording succeeded. No native PASS; old-pin engine cannot verify
compact statements. The checks below are prepared native source audits,
not formalizations of the new prose. No original graph or axiom record
changed; no upstream final RH theorem used as a proof shortcut.

RESUME HERE: integrate steps 1–4 into manuscript section 6d in place of
the named local determinant black boxes, independently audit the Weyl/Fock
Y identity and finite integralAbove gauge transport, then pursue the
remaining rank-one Hecke-value test-form supplier in HeckeValueHeight.
HANDOFF TO integration, mathematics C, formal audit and shared kernel lane.
-/

#check exists_auerbach
#check DenominatorLe
#check AuxPair.normSqAt_starProjection_le
#check LevelPlaces.LevelForm.norm_map_inner_le
#check Data.norm_det_compressedGramOp_padic_le
#check Data.norm_det_compressedGramOp_arch_le
#check Data.heightLe_liftVolume_ratio
#check Data.heightLe_volume_ratio_sq
#check Data.integral_forms_long
#print axioms exists_auerbach
#print axioms AuxPair.normSqAt_starProjection_le
#print axioms Data.norm_det_compressedGramOp_padic_le
#print axioms Data.norm_det_compressedGramOp_arch_le
#print axioms Data.heightLe_liftVolume_ratio

-- Independent elementary last cancellation, prepared only.
theorem run51_cancel_positive_energy (a b Q : ℝ) (hQ : 0 < Q)
    (h : a * Q ≤ b * Q) : a ≤ b :=
  le_of_mul_le_mul_right h hQ
