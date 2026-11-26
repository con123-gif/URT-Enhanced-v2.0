import New.Columns.LocalStatement
import Mathlib.Tactic

/-!
RUN65, 26 November 2026: actual shifted column lattice, Fourier pullback
and level-prime divisibility consumer. HUMAN SOURCE-MATCHED; no native
replay of this file, no global obligation declared kernel-closed.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10; latest completion-first
amendment and mandatory engine read; AGENTS, swarm, queue, expansion,
continuity, state and latest manuscript checked. Resume RUN64 ac8374d8.
Peers checked integration 059f9ed6, acceleration f2750806, kernel e1c6215b,
theta 44a5d463, Weil ce737b234; no duplicate A marked-column/Weil work.

Native ledger (relative to compact src):
New/Seesaw/LiftCharacters.lean db457ba5fb4c37feeb4c22c6b3f47fa9e5a8eb45,
  adeleExtension_map_diagN 78-82, lastColDatum_conj_ne_zero_iff 84-95,
  atPlaces_conj_mem_mirabolic 97-101, fourierOp_mem_column 112-123,
  exists_indexDvd_fourierOp_pow 128-169 (actual body).
Lib/Adelic/CuspForms/ClassReps.lean ae1cca5dba16666224c91ff6a90eaaec2e1e5b33,
  exists_mul_mem_integralAbove 21-25, weylGauge_embFin 29-31,
  weylGauge_mul 35-39, weylGauge_le_one_iff 44-46, integralFormsAt 62-64.
Lib/Adelic/Landherr/WeakApprox.lean e8816c3371564926a990319105823b644028e9e1,
  weak_approximation (Cayley proof).
Lib/GLn/SchurModule/WeightRepBasic.lean 7417d8c31f21090bfa515568339b768290093d02,
  weylGauge 81-82, integralAbove 88-89, map_weightRep 117-119.
Lib/GLn/SchurModule/Hook.lean ab7abf3a41078f15118fab5fc04a07523a0c1c2f,
  sum_tableauWeight 25-26.
New/Core/ModuleIndex.lean 214cc116f97852925f444db42bfa36cf563af508,
  IndexDvd 20, comap 24-25, trans 31-33, map 37-41, of_det_dvd 68-73.
New/Seesaw/NamesAtSplitLevel.lean f404d684189e658efb32374c500cd05900e12ba7,
  fourierOp 106-107, mirabolic 109-112, mirabolic_fix_fourierOp 178-187,
  mem_integralAbove_of_inclGL_eq 387-390.
New/Columns/ChainValuation.lean 19e853dfa8c645bfcdf3b3e21183f9b432620ef7,
  sum_height_mul_kappa_le 211-212.
New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e,
  k bound 143-144, a bound 177, k_pos 197.
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834,
  scale 29-30, b 57-58.
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547,
  exists_indexDvd_Bmu_divisible 285 onward, specifically level-N branch.
New/Columns/TwistedHeckeType.lean ccae44b8b21d1bface80bc3c8b10370a48c8ea48,
  gaugeLe_Bmu_at_N 113-135. RUN63, RUN64 supply the human chain proof.

1. The actual class-wise shifted evaluation, with correct orientation.
Fix admissible D, the SAME p-adic embedding iota above N, stage zero,
column level K, O=embValRing, H=integralAbove(X_0,N). Write
P=nonInducedPlaces, S0=piPlaces, d0=diagPointN 0,
d_B=embedGL(diagN on B)^(-1) for any set B of places.
Let C be the ambient column space, L_s=integralFormsAt C s.
Thus phi in L_s iff phi in C and gauge at g*s of phi(g) <=1 for
ALL g; do NOT use the gauge of phi(g*s) instead.
For each double coset c choose gamma_c rational by weak approximation
so, writing x_c=embFin(gamma_c)c.out,
  A_c=x_c*d0*d_B in H, and J_c=d_B*A_c*d_B^(-1) in H.
Both conditions hold for the SAME gamma_c: the two open conditions
at all N-adic places contain the identity in the target intersection
H intersect d_B^(-1) H d_B; translate by (c.out*d0*d_B)^(-1)
and use density of rational points at the finite set of places above N.
This is exactly exists_mul_mem_integralAbove 21-25. Weak approximation
itself is retained as a standard unitary-group theorem with the exact
finite-set/density hypotheses, or its pinned Cayley proof; no strong
approximation on an anisotropic group is assumed.

For any g choose g=embFin(eta)c.out*k with k in K.
The native conjugated-mirabolic lemma gives
k'=d0^(-1)*k*d0 in H: at P it lies in the integral GL,
and every other prime above N is the conjugate of one in P.
Column forms are right K-invariant (trivial level character).
After cancelling the rational left factors using weylGauge_embFin,
the value to gauge is v_c=phi(x_c), and its gauge point for L_d0 is
  x_c*k*d0 = x_c*d0*k' = A_c*d_B^(-1)*k'
            = d_B^(-1)*J_c*k'.
Since J_c*k' is in H, right-integral gauge invariance makes this
exactly the gauge at d_B^(-1) of v_c. No triangular estimate or
independent representative per vector is used.
At x_c the source L_(d0*d_B) gauge point A_c is in H, so all
coordinates v_c are O-integral. The SAME class-wise evaluation
E:phi -> (v_c)_c is therefore O-linear and sends the source
lattice into O^I, I=StdClasses(K) x WeylIndex(X_0,kappa).
At the target it suffices that E(phi)=Z y with y in O^I, where
  Z_(c,i),(c,i)=N^(sum_tau tableauWeight(i,tau,last)).
Indeed Z is Schur of the diagonal(1,...,1,N) at EVERY tau,
and d_B^(-1) maps at each tau to that diagonal if
star(inducedPlace tau) in B, and identity otherwise (78-82).
Gauge uses the inverse of this matrix. The product with Z
is the Schur diagonal with last entry 1 or N at each tau, never
N^(-1). All these entries are integral. The column determinant
weight is zero in this caller (native simp of weylRep,lastEntry).
Hence the gauge is <=1 for ALL g. This proves the exact consumer
in LiftCharacters 136-150; in particular the original determinant
pullback suffices without asserting arbitrary gauges equal.

2. Actual uniform finite-family index.
Let t(a)=sum_(c,i) sum_tau tableauWeight(i,tau,a).
The diagonal Z above has determinant N^t(last), not a product of
separate worst-case bounds. IndexDvd.of_det_dvd for valuation domains
gives IndexDvd(O^I,Z O^I,N^t(last)); its Hermite argument applies
to every finite family, even dependent, not a basis assumption.
For clarity, the block rows of [I,-Phi;0,Z^T] admit the valuation
Hermite reduction used in native ModuleIndex 68-73. If D_H is the
block triangular result and W the unimodular row multiplier, the
top-left relation block M satisfies det M * det lower block
= unit * det Z; the top-right equation expresses each M-combination
of Phi in the image of Z. This is the stated finite-family property.
Equivalently retain this exact previously translated native lemma
(RUN61); no discrete-valuation or finite-cardinality assumption.
Apply IndexDvd.map along the inclusion O^I -> C^I and comap
along E (the two hypotheses just proved), yielding for every B:
  IndexDvd(L_(d0*d_B), L_d0, N^t(last)).
The exponent is independent of B. In particular B=S0 gives
d0*d_B=1 and the desired initial index from unshifted columns.

3. Fourier preservation and exact iteration.
Write u=d_P, F=fourierOp(nonInducedRep 0).
As in NamesAtSplitLevel 106, F phi(g) =
  sum_y psiN(y_last) phi(g*d0*u*J_y*d0^(-1)),
where y_last is a unit and J_y is embedGL of the selected integral
invertible matrix whose last row and column reduce to y. Each
J_y is in H, and |iota psiN|=1 (additive character of finite
order, including the sign fixed in RUN64).
F keeps C, not just a space with a larger level. Indeed for k in K
set G=atPlaces(P,d0^(-1)*k*d0), which lies in the mirabolic.
If a G b belongs to the mirabolic, put
k''=conjEmbedGL(a)*k*conjEmbedGL(b).
Away from primes above N this is k. At P its conjugate by d0
is a G b, and the inverse is also mirabolic. The native
lastColDatum_conj_ne_zero_iff applied to k'' and its inverse gives
integral matrices on both halves and exactly the column-level
congruences at the places in S0, as required by mem_columnLevel.
Consequently k'' in K. The hypothesis of mirabolic_fix_fourierOp
is thus fulfilled on phi: pi(a)R(k)pi(b)phi=R(k'')phi=phi.
The lemma is a change of variable y -> reduction(kappa)y:
u^(-1) G u is integral invertible with last row e_last modulo N
(lastRowDatum_conj_u0 for G and its inverse); its reduction
permutes the unit-last vectors and preserves their last entries,
so the character coefficients are identical. For the selected
integral lifts J_y, the factor
J_(kappa y)^(-1) kappa J_y fixes e_last modulo N, and is in
the mirabolic, giving precisely the transformed summand. No
inversion of a Gauss sum, no unramified assumption on phi.

For phi in L_d0, write h=g*d0*u*J_y*d0^(-1). Then
  h*d0=(g*d0*u)*J_y.
Right H-invariance and the defining gauge of phi at h give
gauge(g*d0*u,phi(h))=gauge(h*d0,phi(h))<=1.
The ultrametric sum and unit coefficient show F phi in L_(d0*u).
This is exactly the input of the B=P lattice estimate above.
Pull back that estimate under F and compose (IndexDvd.trans)
repeatedly, starting with L_1 -> L_d0. More explicitly, define
L^(r)=(F^r)^(-1)(L_d0) inside the ambient forms. For phi in
L^(r), F^r phi in L_d0 hence F^(r+1) phi in L_(d0*u).
Pull back the B=P index under F^(r+1), yielding
IndexDvd(L^(r),L^(r+1),N^t(last)). Multiplication of the
finite-family matrices multiplies their determinants, so for q>=0
  IndexDvd(L_1,(F^q)^(-1)L_d0,N^((q+1)*t(last))).
This includes the base q=0 (not zero cost). All F powers use
the SAME embedding, level, matrix Z and fixed D; the witnesses
may differ with the finite family, as allowed by IndexDvd.
No claim that the target lattice is contained in L_1 is needed.

4. Exact determinant symmetry and numerical caller guard.
For rank k=n_0, Schur of diag(2 at a,1 elsewhere) at ALL tau
has determinant 2^(sum_i sum_tau tableauWeight(i,tau,a)).
Permuting coordinates simultaneously at all tau conjugates
these matrices by the Schur image of an invertible permutation
matrix. Their determinants are equal, even if the permutation
does not literally permute the standard tableau basis.
Thus t(a)=t(last) for all a. Summing the tableau weights in
each component counts its boxes once, by sum_tableauWeight:
  k*t(last) = sum_(c,i,tau) sum_(h<k) h*kappa(tau,h)
            <= #I*f*a.
Here a is the data scale, not a coordinate index. The last
inequality is the actual sum_height_mul_kappa_le 211-212.
The native free class evaluation, trivial class stabilizers
classAut_columnLevel_eq_bot and finrank_levelSpace_smoothFormRep
give #I=dim_C Column. Do not replace by dimension of ramified
columns. Retain those exact class and Weyl basis inputs.
By Magnitudes, a <= exp(logB+logX+1) and k >= exp(5logX-2).
Since logX >= 3/4 from the scale condition and P.c>=64,
a/k <= exp(logB-4logX+3) <= b.
Put q=varrho+1, m=2q, q>=1. Hence
  e=(q+1)t(last) <= m*f*b*dim_C(Column)
                   <= 4*m*f*b*dim_C(Column).
The original final constant 4 is retained; this is a proof
of the actual guard, not a request to change allowedLoss.
The exact witness is e=(q+1)t(last), a natural number.

5. Level-N local consumer at Theorem A.
For p=N (the non-nonsplit branch), allowedLoss=4mfb.
Pull back the finite-family result by the column inclusion
as in the actual exists_indexDvd_Bmu_divisible. The SAME
submodule is S=(F^q)^(-1)L_d0 in columns, independent of twist
and good datum. For ramified phi in S, RUN63/RUN64 give
GaugeLe(1,N^(3mfb),Bmu(theta,Psi)phi) with the actual finite
Weil, jet, good-datum and character hypotheses retained.
The premise beta<1-4mfb and mfb>=1 imply beta<-3mfb or
beta<=-3mfb. Since |iota(N^(-beta))|=N^beta,
  gauge(N^(-beta) Bmu phi)<=N^(beta+3mfb)<=1.
Thus the claimed level-N uniform index and divisibility branch
follows with the original allowedLoss and exact quantifiers.
This closes the shifted-lattice gap in the RUN64 human argument
conditional on the named standard and peer inputs. It does not
by itself establish A, the global prime error, or the human RH proof.

Local source graph (not elaborated; preserve original):
weak approximation + conjugated mirabolic + gauge invariance +
Schur weight identity + valuation-domain IndexDvd -> h(B)
-> initial h(S0) and F-preserves-column/F-maps-L_d0
-> iterative comap -> determinant symmetry + class dimension + scale
-> exists_indexDvd_fourierOp_pow -> level-N local divisibility.
Reduced human graph uses one fixed Z and one class evaluation for
each B, with no separate norm losses; all surviving standard/native
inputs kept. Cache keys include D, level, embedding, B, exact
weight and the same class choices. No claim of global graph pruning.

Execution: lean/lake/elan absent from local PATH (actual command).
No local compact rh_scan/prune/reduce/auto/frontier run. No new
numerical diagnostics per completion-first mission. Actual receipt
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804 reread on state branch:
run 45803534769, A build returncode 124 at 2700.11s, six other named
B/C checks with propext, Classical.choice, Quot.sound only;
all_requested_checks_ok=false, full_RH_replay=false. Old native
engine runs 45577239749 and 45576756833 on old pin do not validate
this replacement. Prepared group/algebra checks and native axiom
probes below, not executed. Independent audit requested.

RESUME HERE: integration/editor combine RUN63-65 with actual
LocalStatement level-N branch, retaining all finite Weil/CM jet
hypotheses. Prime lane next inspect the unmarked small-nonsplit
and ordinary p branch at LocalStatement 244-276 for any still
unproved standardData supplier, coordinate with acceleration
f2750806 and kernel e1c6215b; if already covered, take the actual
short-column spanning caller rather than duplicate scale bounds.
HANDOFF TO integration, theta, editor, kernel and independent audit.
-/

namespace CompactPrimeRun65

theorem shifted_class_factor {G : Type*} [Group G] (x d k b : G) :
    x * k * d = b⁻¹ * (b * (x * d * b) * b⁻¹) * (d⁻¹ * k * d) := by
  group

theorem fourier_gauge_point {G : Type*} [Group G] (g d u j : G) :
    (g * d * u * j * d⁻¹) * d = (g * d * u) * j := by
  group

theorem index_budget (q m t R : ℝ) (hq : 1 ≤ q) (hm : m = 2*q)
    (ht : 0 ≤ t) (hR : t ≤ R) :
    (q+1)*t ≤ 4*m*R := by
  have hq' : 0 ≤ q+1 := by linarith
  have hm' : q+1 ≤ 4*m := by linarith
  have hR' : 0 ≤ R := ht.trans hR
  exact (mul_le_mul_of_nonneg_left hR hq').trans
    (mul_le_mul_of_nonneg_right hm' hR')

theorem beta_guard (a beta : ℝ) (ha : 1 ≤ a) (hb : beta < 1-4*a) :
    beta+3*a ≤ 0 := by linarith

#print axioms shifted_class_factor
#print axioms fourier_gauge_point
#print axioms index_budget
#print axioms beta_guard
end CompactPrimeRun65

#check Data.exists_indexDvd_fourierOp_pow
#check Data.fourierOp_mem_column
#check Data.gaugeLe_Bmu_at_N
#check Data.exists_indexDvd_Bmu_divisible
#print axioms Data.exists_indexDvd_fourierOp_pow
#print axioms Data.fourierOp_mem_column
#print axioms Data.gaugeLe_Bmu_at_N
#print axioms Data.exists_indexDvd_Bmu_divisible
