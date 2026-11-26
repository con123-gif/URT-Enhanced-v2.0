import New.Columns.LocalStatement
import Mathlib.Tactic

/-!
RUN66 — ordinary-prime integral gauge: exact scale cancellation and
the actual all-prime jet-to-column consumer. 2026-11-26.

Status: source-matched human derivation, conditional on named native
CM/frame/Weil suppliers. Independent audit and native replay pending.
Source: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10.
Predecessor RUN65 b11d25a0f3728d611453ceefbfee7c143fc16c8e.
Peer kernel RUN40 blob 594da545630e42029ac29b6b4f5dad6f81daad8e;
character RUN61 blob 1639632f280f083f5d5b66dc6fbca8e3b1372339
and RUN62 general frame; short spanning integration blob
576e1b4f592a01ef3147eba7815b39fdef8fd9a6. Do not duplicate those.
Latest inspected peer HEAD 84ff12029ec85bd14341c39bf38eb580ccc84587.

1. Torsion rescaling (actual Parameters.norm_jet_jetSeries_le_one).
Fix all the native parameters, a prime p, its specified embedding iota,
a standard V, nonzero quadratic integer delta, f in standardData V delta
and polynomial Q' which is the image of a polynomial Q over embValRing.
Put c0 = bar(delta)*d, P = periodFactor, and use the same jetScale as
the source (P and jetScale are not identified). The transfer theorem
norm_jetSeries_le reduces the desired jet bound to ALL thetaProducts
at radius |iota(c0*P)|. Its actual frame/vacuum expansion is the peer
RUN61/RUN62 supplier, not a fresh assumption about arbitrary series.

Unpack any member of this set: tight frame w_i, frame length M,
torsion denominator n, common beta, translates y_(i,k).
The two coprimality conditions p∤M,n and n*delta*y_(i,k) in Lambda
are native. Set delta' = n*delta. It is nonzero. At a matching coordinate
the linear coefficient is C = iota(beta*conj(Phi_tau(w_i)));
at a nonmatching coordinate it is zero. With |.| the iota-adic norm,
the exact identity of nonnegative real magnitudes is

 |C| / |iota(bar(delta')*d)|
 = |beta| |conj(Phi_tau(w_i))| / (|n| |delta_bar| |d|)
 = |P*conj(Phi_tau(w_i))| <= 1.

Here |beta|=|c0*P| and |n|=1. The last inequality is precisely
norm_periodFactor_mul_conj_le_one applied to the frame-integrality
field hw.1. Neither delta nor d has been assumed to be a p-unit.
No division by a zero norm: delta, n and d are nonzero, and field
embeddings are injective. In particular it is not legitimate to
assume periodFactor is itself integral.

Apply CMLattice.jet_theta_prod_integral with delta', actual y and Q.
Peer kernel RUN40 supplies the derivative-stable ring proof of that
lemma. map_jet transports the integral coefficient polynomial and
Taylor series along iota. There is no additional factorial factor.
Each product has bounded functional value, so the standardData
valuation-module transfer proves |jet(Q', T_(c0*jetScale)f)|<=1.

Source: New/Curve/ConjugatesOfJets.lean
8b841d76bb938d8a18fd4341aa832a20b13dd9e0 lines 55-96.
New/Curve/ThetaProducts.lean 044e906a110715710a4a60c0b06d73d70483afda
lines 45-51; New/Curve/FormalParameter.lean
61130bd5600a2b1f1679cfe0a18123d2c458d425 lines 24-55;
New/Curve/TightFrameExists.lean 4f2e76afa45ba54fe9040704b505b2da1865f2b4
lines 33-48. Keep each named supplier and its premises.

2. From every integral Schur entry to the operator gauge.
Fix the native lift weight h_kappa and set L=boxes kappa (card n').
Every entry of the Schur polynomial in the variable matrix has
integral coefficients (map_schur), and degree L. The Schur jet
homogeneity schurJet_jetSeries_eq_smul gives the exact matrix identity

 J(T_(c*jetScale)f) = (c/(bar(delta)*d))^L J(T_(c0*jetScale)f).

This follows by comparing both scales to T_1, then cancelling the
nonzero c0. It remains valid when c=0, with x^0=1.
Section 1 applied to every entry polynomial gives a bound
B=(|c|/|bar(delta)*d|)^L on ALL entries for ALL f in Std_delta.
Do not apply the bound only to the original datum: the operator
definition quantifies over translated data.

For integral source/target adelic elements the pair Weil action
preserves Std_delta (pairWeil_mem_standardData): integral Hom action,
standardData stability and unit-norm character multiplier. The
Heisenberg stability follows because products of translations differ
by unit-norm finite phases and their vectors add in integralAfter.
Retain the native integral vacuum action in omega_mem_standardData.
At integral charts Weyl representation matrices and inverses are
integral (including determinant powers, as determinants are units).
Thus their gauge equals the ordinary coordinate sup norm, and the
ultrametric matrix estimate has no dimension factor:
||J xi||_infty <= max_ij |J_ij| * ||xi||_infty.
For arbitrary g,h, use the native weak approximation and rational
equivariance to replace both by integral charts, transforming input
and output simultaneously. Weyl gauge invariance under rational
points and right integral factors is exactly the one used in
mem_raises_of_jet_bound. No independent choice of f for each entry
is required: its hypothesis is uniform for all f in Std_delta.
Taking x=d_adelic=y=1 in that lemma eliminates the diagonal weights.
Consequently Phi in Std_delta belongs to
(thetaKernel at c*jetScale).raises 1 1 B.
This is the actual mem_raises_of_standardData with no extra factor.

Sources: ConjugatesOfJets.lean lines 25-50,98-143;
Lib/Weil/CompactLift/BranchingPeriod.lean
9ed09fe6527b822004076503163d1a9cb8859d91 lines 121-128.
The general diagonal version of the gauge-bound lemma is retained,
not replaced by this specialization.

3. Ordinary-prime consumer: zero loss, zero index.
Fix D, p, iota, a twist theta with p coprime theta.levelNorm,
good datum Psi and any integral column v. Assume p != D.N and
p != P.d; there is NO extra condition p∤D.gProd and no splitting
condition. For every x in Psi.support and j<D.m, admissible
translations are integral after multiplication by D.piG above p:
the native modulus is theta.levelNorm * D.N, prime to p.
Use the FIRST disjunct delta=D.piG in
IsGoodDatum.translateDatum_mem_standardData, even when p divides
gProd. The actual lift scale is c=star D.piG. Since piG != 0,

          ( |star piG| / |(star piG)*d| )^L
        = |d|^(-L) = 1.

Here L is the actual stage-dependent box count, possibly zero.
Cancelling piG BEFORE imposing p!=d is essential: its norm need not
be one. The same bound holds for every stage and support point.
Apply gaugeLe_chain with t_j=id, d_j=1, r_j=0. Commutation is
automatic; joint invariance, trivial class stabilizers, finite class
expansion and integral coefficients of Psi are the original native
hypotheses/suppliers. The ultrametric sum and product are bounded by
one, with no class-cardinality or number-of-lifts penalty.
Then restrictToY: pi*pi_bar=N and both integral, so pi_bar is a
unit at every induced embedding over p!=N. The scalar branch
normalization has norm one, and the branching matrix is integral.
The restriction at the block inclusion intertwines the chart
representations (the native restrictToY_of_diag with identity
diagonal). Therefore GaugeLe 1 1 (Bmu theta Psi v).

For the actual ordinary branch of exists_indexDvd_Bmu_divisible,
p notin nonsplitPrimes and p!=N imply p!=d (d is below the native
cutoff and chiK(d)=0). allowedLoss=0, the gain term is omitted,
and integer beta<1 implies beta<=0. Hence p^(-beta) is integral.
Choose the WHOLE original integralColumns for S, l=0.
IndexDvd is reflexive with p^0=1. This is independent of theta,
Psi and v, and proves the requested universal divisibility,
including the narrower ramified-column requirement. No change to
the marked, small nonsplit or level-N branches (RUN55/61/65).

Sources: New/Columns/ChainValuation.lean
19e853dfa8c645bfcdf3b3e21183f9b432620ef7 lines 269-292,299-335;
New/Curve/IntegralVacuum.lean c34fe7625b03009fbd5954ea00209b425ca603b1
lines 51-60; New/Columns/LocalStatement.lean
9d5bd0d698b0db2850cbd306d8d400d7e99a3547 lines 244-250,285-307;
New/Seesaw/LiftCharacters.lean db457ba5fb4c37feeb4c22c6b3f47fa9e5a8eb45
lines 20-39; New/Columns/ColumnDefs.lean
104b875374798b99448625fe6ce062ea6bfbfe65 lines 90-101.

Graph preservation: original path thetaProducts + frame/vacuum +
jet_theta_prod_integral -> norm_jet_jetSeries_le_one ->
mem_raises_of_standardData -> gaugeLe_chain + restrictToY ->
gaugeLe_one -> exists_indexDvd_Bmu_divisible -> A.short_forms.
Reduced human graph compresses the torsion and homogeneous scale
ratios into one exact unit factor, then uses ultrametric propagation.
All native nodes retained; no kernel edge deletion asserted.
Context keys: source pin,D,p,iota,theta,Psi,x,j,delta,c,L,frame,
polynomial and chart. No reuse of an estimate across p or embeddings.
No imported RH theorem; no URT comparison attempted.

Verification: local command -v lean/lake and ~/.elan/bin gave no
executables. Re-read actual CI run 45803534769, state branch
compute/rh-compact-primitives-replay-20261126/status.json and
outputs/targeted_results.json: A module_1_build timed out (124,
2700.11 s); six B/C declarations checked with only propext,
Classical.choice, Quot.sound; all_requested_checks_ok=false,
full_RH_replay=false. Workflow job success is NOT A replay success.
Older native reduction engines are pinned to the long proof;
no rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier execution
claimed on this compact pin. Existing graphs and axiom evidence remain.
Certificates below are prepared, not compiled; run with matching
compact dependencies via lake env lean. No new PASS claimed.

RESUME HERE: integration/editor and kernel audit exact cancellation at
norm_jet_jetSeries_le_one and gaugeLe_one, retaining all CM/frame and
equivariance premises. On prime lane next inspect any remaining actual
A.short_forms suppliers after peer merge, especially global norm/index
assembly; if already covered, audit the root-reachable prime-window
consumer and identify the first genuinely missing lemma, not another
scalar restatement. Request independent audit of this file.
-/

namespace PrimeWindowRun66

/-- Exact scale cancellation without assuming the torsion norm is one. -/
theorem torsion_ratio (a d per w : ℝ) (ha : a ≠ 0) (hd : d ≠ 0) :
    (a*d*per*w)/(a*d) = per*w := by
  field_simp [ha, hd] <;> ring

/-- Unit loss at any box count, even when the generator is not a unit. -/
theorem ordinary_ratio (a d : ℝ) (ha : a ≠ 0) (hd : d = 1) (L : ℕ) :
    (a/(a*d))^L = 1 := by
  subst d
  simp [ha]

theorem ordinary_beta (beta : ℤ) (h : beta < 1) : beta ≤ 0 := by omega

end PrimeWindowRun66

#check Parameters.norm_jet_jetSeries_le_one
#check Parameters.mem_raises_of_standardData
#check Data.IsGoodDatum.translateDatum_mem_standardData
#check Data.IsGoodDatum.gaugeLe_one
#check Data.exists_indexDvd_Bmu_divisible
#print axioms PrimeWindowRun66.torsion_ratio
#print axioms PrimeWindowRun66.ordinary_ratio
#print axioms PrimeWindowRun66.ordinary_beta
#print axioms Data.IsGoodDatum.gaugeLe_one
#print axioms Data.exists_indexDvd_Bmu_divisible
