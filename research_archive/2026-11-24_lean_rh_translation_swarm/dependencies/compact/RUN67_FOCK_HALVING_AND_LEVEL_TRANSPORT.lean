import New.Rows.ComparisonForms
import New.Rows.HeckeValueHeight
import Lib.Weil.Fock.FockHarmonicCoeff

/-!
# RUN67 — close the small-shift analytic supplier and level character cancellation
27 Nov 2026. Human source-matched derivation; native replay NOT RUN.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission 9f4a2272265e847b3a46422b02d4b37e976bee10;
manuscript blob 944957c6f43b63df7a845472b31492dc0ca1cb8f,
observed head 8b6f39e940b14f7d14fc248b0846455327415564.
Previous RUN66 aaf2100d4a493a2bd9318dcfd7da088ef5a3419d.
Latest peer commits 219694f2, cbe51302, 3209e00b, cbcefcda, 0eea741e,
82c6ba00, f3101086, 8b6f39e9 checked by commit summaries; integration manuscript
actual period paragraph inspected. Distinct from CM, Bessel and Selmer work.

## Native sources and exact caller
Lib/Weil/Fock/FockHarmonicCoeff.lean a2d4e8450b0f5daea826885ad4ec55ddbc3bf076:
exists_enorm_le_mul_weightedNorm_of_sub (entire body).
Lib/Weil/Fock/MixedFockModel.lean a2617ad4e9dd8d0a5fc48f535464511e658bdf91:
weightedNorm_zero, weightedNorm_realHeisOp_le, norm_le_weightedNorm,
weightedNorm_polyVector_ne_top, isRapidDatum_vacVector.
Lib/Weil/DualPair/KernelDecay.lean 591247fdbe42900da1ac55c3c9d2ff733f235804:
exists_norm_name_le (actual hC application to L composed with integrated).
New/SiegelWeil/AuxPairVanishing.lean 8613d2aaed78ee56e6866907ddda2d7a8e951eee:
smul_chosenGLRep_eq, descentsVanish_of_reflectionSum (lv).
New/Rows/StackedDeterminants.lean daff82b60b82df78d82e94c9e1a4f5d0fb0673d4:
firstBlockHom, auxLevel, auxLevelChar, chosenGLRep, formAction.
Lib/Adelic/Unitary/CongruenceLevel.lean 07e6502ac533d1868d68f817a00bdd2ac95f4616:
levelOf, mem_levelOf, reduction.
New/Forms/AuxiliaryPair.lean 0133ff2b5d6fd5937eb267026ed1959c8788c312:
pairWeil_upsilon (separate datum action, not a replacement for form action).
New/Rows/MemberOrthogonality.lean aca8828d477a4510ab80964e1572f34ef220a2c1:
descentsVanish_hypSum calls reflection extension and descentsVanish_add_planes;
stdClassSum_period_eq_zero and its divided-splitting consumer. Actual root chain
continues through ComparisonForms and HeckeValueHeight (RUN65 caller ledger).

## 1. The actual small-shift estimate is a supremum halving, not finite-difference iteration
Fix N a natural number, normalized real Fock measure, vacuum e,
unitary/isometric Heisenberg translations T_z and bounded complex linear
functional ell. Write m_N(v)=integral (1+||z||)^N |v(z)| dz.
The coherent-state reconstruction formula (native map_eq_integral)
and triangle inequality give, if
   M = sup_z |ell(T_z e)|/(1+||z||)^N,
then |ell(v)| <= M m_N(v). This follows by integrating the pointwise
coefficient bound, not by assuming v itself is a polynomial.
M is finite: 0 <= M <= ||ell|| ||e|| by isometry. The vacuum has all
moments finite, and m_0(v)=||v|| in this native norm.

Define U(y,w)=e-beta(w,1)^2 T_y e, precisely the source's u.
At (0,0) this is zero; norm continuity of the translations and
phase implies ||U|| tends to zero. By the triangle inequality
and the moment translation inequality,
   m_(2N)(U) <= [1+(1+||y||)^(2N)] m_(2N)(e).
The scalar phase has modulus one. By Cauchy-Schwarz with respect
to |U(z)| dz, which has finite mass, 
   m_N(U)^2 <= m_0(U) m_(2N)(U).
Choose one positive integer n, depending only on N and the fixed
Fock space, so that for ||(y,w)|| <= 1/n the product of ||U||
and the explicit bracketed vacuum moment above is <1/4.
This is the exact closed-ball continuity step in the native proof.
It yields m_N(U) <= 1/2; no derivative norm and no iteration
length depending on ell, z or t enters.

## 2. The global estimate, with all boundary cases
Assume t>=0 and the native small-shift premise when t<1:
for EVERY v and EVERY upper bound B on
|ell(v)-ell(T_y v)| for all ||y||<=t, one has |ell(v)|<=B.
Let K=||ell|| ||e|| n^N t^N.
If t=0, that premise with B=0 implies ell(v)=0 for every v;
this includes N=0 with t^0=1. If ell=0 the result is immediate
even for an infinite weighted norm (use the extended-real zero product).
Otherwise take t>0. For fixed z with t >= 1/[n(1+||z||)],
isometry gives
   |ell(T_z e)|/(1+||z||)^N <= K.
This covers every z when t>=1; no small-shift premise is needed there.
In the other case, for ||y||<=t set w=y*conj(z) entrywise.
Then ||w||<=t||z|| and max(||y||,||w||)<=1/n.
The exact Heisenberg product law in the source gives
   T_z e - T_y T_z e = T_z U(y,y*conj(z)).
The relative phase beta(w,1)^2 is required here; it is NOT valid
to drop it before computing the difference. Hence
   |ell(T_z e)-ell(T_y T_z e)|
      <= M m_N(T_z U)
      <= (M/2)(1+||z||)^N.
Apply the small-shift premise to T_z e with that uniform B.
Divide by the strictly positive weight to get normalized value <=M/2.
Combining both branches and taking the supremum gives
                     M <= max(K,M/2).
If M>K then M>0 and both entries of max(K,M/2) are <M,
contradiction. Thus M<=K and coherent reconstruction yields
   |ell(v)| <= ||e|| n^N ||ell|| t^N m_N(v).
This proves the native small-shift bound in extended nonnegative
reals, with the coefficient C=||e|| n^N. If m_N(v)=infinity and
the coefficient is positive the inequality is automatic; the
zero coefficient cases were handled first (for N=0 use t^0=1).
There is no assertion that the supremum is attained. The source
uses le_of_halving and exactly this coherent-state split.
Retain standard Heisenberg product/isometry, weighted norm
translation and coherent reconstruction as the explicitly named
foundations; all actual small-shift premises remain required.

At exists_norm_name_le apply the result to the composite L with
integrated fixed finite datum, exponent N+A and t=max(2,K0)rho/H
(native height variable t there). This is valid for every vector,
as required by the composite functional, not just for the target
polynomial. RUN66 derived the rational fundamental-domain shift
premise and cancellation H^N * H^A * H^(-N-A). With rho=1
(definite side) and N=0 the resulting bound is uniform in g,h.
Thus the analytic estimate previously retained in RUN66 now has
a human derivation; native finite stabilizer, height transport,
source-term induction and measure premises still enter.

## 3. Exact level-character covariance at lv (other period branch)
Let J be the chosen inclusion of rank r and J^t its coordinate
retraction. Fix actual y in levelSpace(pi,O.levelGroup,O.levelChar)
and k in K0 with reduction tau. At j in M, tau_j J=J s_j.
At j in Q, tau_j^t J=J s_j^t, equivalently J^t tau_j=s_j J^t.
Use S=firstBlockHom(s_M), namely S_j=diag(s_j,I) at M
relative to J and its complement, S_j=I at Q. Set j0=S^-1 tau.
At M, j0 J=J, so j0 is in the column stabilizer. At Q,
J^t j0=s_j J^t, so j0 preserves the complementary coordinate
subspace and its chosen block is s_j. These are precisely
auxLevel, not the stronger requirement that k fixes the level.
Choose h=liftResidue(S) and u=h^-1 k. Reduction multiplicativity
and reduceFamily_liftResidue give reduce(u)=j0, hence u lies in
levelGroup by mem_levelOf. The native levelSpace action on y gives
   pi(u)y = [prod_(j in Q) psi_j(det s_j)^(-1)] y.
By chosenGLRep definition, for s_M,
   chosenGLRep(s_M)y = [prod_(j in M) psi_j(det s_j)] pi(h)y.
Every det s_j is nonzero and the multiplicative characters are
nonzero on units (also true for trivial psi). Therefore
   pi(k)y = pi(h)pi(u)y
           = [prod_(j in M union Q) psi_j(det s_j)^(-1)]
                chosenGLRep(s_M)y.
This is exactly smul_chosenGLRep_eq; the M factor cancels, the Q
factor survives. No character trivialization, commutation of k
with h, or arbitrary transpose interchange. Q nontriviality is
needed only in reflection branch (b), not in this lemma.
At lv in descentsVanish_of_reflectionSum, tau comes from I+A B^t
and s from I+B^t A, both reductions, with the exact chosen-block
and off-block conditions. RUN66 proves the needed integral
coset shift from the annihilator. The above supplies precisely
the weighted translate of y before algFormCoeff_algFormRep and
the Weil kernel equivariance. Preserve the conjugation and the
Schwartz-Bruhat coset expansion, not an assertion that formAction
alone acts on every datum. At descentsVanish_hypSum both the
reflection and tower branches are used, with distinct premises.
The resulting shared class-period supplier feeds the distinct
comparison-form and rank-one test-form consumers of RUN65.

## Graph and audit
Original source-visible edges preserved:
C -> MemberOrthogonality class period -> descentsVanish_hypSum
 -> reflection lv -> smul_chosenGLRep_eq -> levelSpace action
 AND add_planes -> boundedness -> exists_norm_name_le ->
 exists_enorm_le_mul_weightedNorm_of_sub.
Reduced exposition replaces the last analytic node by coherent
reconstruction + vacuum continuity + Cauchy-Schwarz + halving,
and the level node by S^-1 tau + level character + exact cancellation.
No global elaborated dependency deletion; both branches and all
unresolved primitive A/B/C leaves remain in the graph. Context key
(pin,N,Fock signs,ell,t,actual pair,level,psi,s_M,s_Q,consumer,role).
No URT, no speedup claim, no claimed-RH theorem imported.
Local command -v lean/lake/elan returned none. Original engines
are on a different pin; no cross-pin PASS. Actual state branch
compute directory inspected: three compact jobs, no newer primitive
result. RUN29 status a56e2d3afb99ed8275e81fd63c8494306e57c43f
and targeted_results.json 088cd2ec0e935ee1a282f10096949bcf671cc804
fetched again. Run 45803534769: TiltingLemma and Filling.Moments
each three named checks with only propext, Classical.choice,
Quot.sound; module_1 timeout 124; all_requested_checks_ok=false,
full_RH_replay=false. Workflow orchestration success is NOT
mathematical batch success. New declarations below prepared only;
no native rh_scan/prune/reduce/auto execution and no new axiom
audit claimed. Request next shared bounded replay; do not queue
competing builds or modify workflows.

RESUME HERE: expand the actual remaining finite-place
pairWeil_name_of_mem / lift_equivariant bridge at lv, with
the explicit coset support and character scalars; then verify
highestVector_cyclic at MemberOrthogonality.descentsVanish_hypSum,
including its actual fixed highest-vector input and conjugation.
Use RUN65/66/67 together for the class period; do not rederive
the halving, rank contraction or level character. HANDOFF TO
integration/editor and audit/kernel. Human reconstruction incomplete.
-/

namespace CompactPeriod67

/-- Exact scalar supremum step in the coherent-state bound. -/
theorem halving_supremum (M K : ℝ) (hK : 0 ≤ K)
    (h : M ≤ max K (M / 2)) : M ≤ K := by
  by_contra hn
  have hKM : K < M := lt_of_not_ge hn
  have hhalf : M / 2 < M := by linarith
  exact (not_lt_of_ge h) (max_lt hKM hhalf)

/-- The two nonzero character factors at M and Q, in their actual
normalization. Only the M character cancels against the chosen action. -/
theorem level_scalar (a b c : ℂ) (ha : a ≠ 0) (hb : b ≠ 0) :
    (a * b)⁻¹ * (a * c) = b⁻¹ * c := by
  field_simp

#check exists_enorm_le_mul_weightedNorm_of_sub
#check norm_le_weightedNorm
#check weightedNorm_realHeisOp_le
#check exists_norm_name_le
#check AuxPair.smul_chosenGLRep_eq
#check AuxPair.descentsVanish_of_reflectionSum
#print axioms exists_enorm_le_mul_weightedNorm_of_sub
#print axioms AuxPair.smul_chosenGLRep_eq
#print axioms halving_supremum
#print axioms level_scalar

end CompactPeriod67
