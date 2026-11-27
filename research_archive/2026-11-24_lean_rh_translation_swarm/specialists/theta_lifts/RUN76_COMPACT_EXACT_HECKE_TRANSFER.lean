import New.Columns.LocalStatement
import Mathlib.Tactic

/-!
# RUN76 — exact degree extraction removes the extra Hecke transfer denominator
27 Nov 2026. Human source-matched reduction; native certificates PREPARED,
not compiled. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
original swarm pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Mission current blob c960cfc62fc12f5c44f9327d0cd5507ab386c7ea read,
including mandatory pipeline and 27 Nov completion-first reconciliation.
RUN75 968a30c3, acceleration RUN63 f2750806 (blob b4dba667),
latest mission peer rational-phase and identity-only reductions read.
AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, continuity read.
No URT, no claimed RH import.

Exact source ledger (grh-compact/src):
* New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547:
  exists_hecke_transfer 54–100, exists_move_markOperator 149–179,
  gaugeLe_markOperator_pow 184–194, gaugeLe_Bmu_of_isMarked 255–260.
* Lib/Weil/Unramified/SphericalHecke.lean 37493fc793c98f8e31d1d2e101e77a4ac2a4023b:
  heckePolyEval, heckePolyOp, sum_coeff_invOfUnit_smul_eq.
* New/Columns/JetExponentBound.lean bedef08c7c1707f74e9afce0c8008b88ba37dc8a:
  IsMarked.sum_inducedPlace_sub_star_eq_zero, le_jetExponent,
  IsMarked.sum_lowColumns_le, IsFullMark.collisionSum_evenPlaces_eq_zero.
* New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e:
  hundred_mul_m_le_k, n_mono, le_m.
* New/Curve/LiveSum.lean 3efab3907b063bb2c59d182df981ad62862f8a1b:
  deltaP = ceilLogM(p)*f*(n(m)+ceilLogM(p)).
* New/Columns/MarkedPrimeType.lean 5433d457d06b8f0e209209be1407fe1971ef86f8
  and New/Columns/TwistedHeckeType.lean ccae44b8b21d1bface80bc3c8b10370a48c8ea48:
  actual remaining marked HasType consumers, NOT discharged below.
Readable same-pin ValuationAtNonSplitPrimes.lean blob
31b24a14cc0b6663385f339d303d656d3feffb7f consulted.

## 1. Actual common polynomial relation (retained geometric premise)
Fix the actual H,hQ,hLambda,l,hl,hw,j<m of exists_hecke_transfer.
Set r=ceilLogM(p), q=l.q=p^(2h), n0=n(0)=k, nJ=n(j),
nF=n(j+1). Here h>0, 2h<=f from the inert order and m even.
Let C be chain of j+1 lifts for ANY x in the same support.
Let B_i=T_target,i(C phi), A_i=C(T_source,i phi).
The native induction S in exists_hecke_transfer gives the polynomial
identity
  sum_i U^i p^(h*i*(i-1)) B_i
    = Q(U) sum_i U^i p^(h*i*(nF-n0)+h*i*(i-1)) A_i
where
  Q(U)=prod_{a<j+1, k'<t+1} (1+U*p^(h*nJ+2h*k')*u_a),
  u_a=(chainChar(theta,a+1).baseChange.atUnif l).
The signs cancel because the native argument is -U times the
rank rescaling, while heckePolyEval uses (-X)^i.
The actual character norm <=1 follows from the source weight balance
over the two conjugate induced places: exponent of p is zero.
Retain the native unramified rank twists, vacuum projection and
hecke_transfer_of_pairing, with equivariance at every stage. The
polynomial relation is not newly proved from local representation theory.
The same Q works for all x and phi, as its factors contain neither.

## 2. Extract before taking norms; exact cancellation
Write O=embValRing and Q(U)=Q0(p^(h*nJ)*U).
All coefficients of Q0 belong to O, Q0(0)=1.
In O[[V]] there is a unique inverse Q0^-1=sum_{d>=0} z_d V^d:
z_0=1, z_d=-sum_{k=1}^d (Q0)_k z_(d-k). Thus z_d in O
for ALL d, without division by a nonunit. Consequently
  [U^d]Q(U)^-1 = p^(h*nJ*d)*z_d.
At degree r, multiply the native polynomial identity by Q^-1.
Only i<=r contribute, and r<=n0<=nF. Exact result:
  sum_{i<=r} p^(h*nJ*(r-i)+h*i*(i-1)) z_(r-i) B_i
   = p^(h*r*(nF-n0)+h*r*(r-1)) A_r.
Define the sharper stage- and place-specific scaling
  deltaSharp = h*r*(nF-n0).
After cancelling the common p^(h*r*(r-1)), the coefficient identity
becomes
  sum_{i<=r} p^(h*(r-i)*(nJ-r-i+1)) z_(r-i) B_i
    = p^deltaSharp A_r.                                      (*)
The exponent equality is an exact identity in integers, not an
inequality after separate absolute values:
  nJ*(r-i)+i*(i-1)-r*(r-1)=(r-i)*(nJ-r-i+1).

Check sign at actual indices. Since p>=2 and m>=10000,
p^m>=m (induction), so r=clog_p(m)<=m. Magnitudes supplies
100*m<=k=n0<=nJ. Thus for i<=r, nJ-r-i+1>=0 and every
coefficient in (*) belongs to O. At i=r it is exactly 1 (z_0=1).
The argument is valid even r=0 and includes the constant coefficient.
No dependence on eigenvectors, no cancellation of potentially zero
character values and no bound on number of factors of Q needed.
This removes the quadratic binomial denominator from the transfer
at the exact degree used by the marked repair. The new statement
is strictly a refinement of this local transfer, not a proof of RH.

## 3. Bridge back to original consumer and peer numerical suppliers
Original deltaP=r*f*(n(m)+r) >= deltaSharp by 2h<=f and
nF<=n(m), n0<=nF. Multiply every coefficient in (*) by
p^(deltaP-deltaSharp) in O to obtain precisely the original
exists_hecke_transfer conclusion. Spherical condition unchanged.
Thus no change at exists_move_markOperator or
gaugeLe_markOperator_pow is required for a replacement.
Alternatively, the actual induction over distinct marks can use
deltaSharp(l,j) per marked place at each stage: transfer scaling
s=p^(A_l-deltaSharp) has norm p^(deltaSharp-A_l), giving the
same estimate with sum_l deltaSharp(l,j) instead of #Lambda*deltaP.
This is dominated by the old stage exponent, so the published
full-mark conclusion follows with the same numerical hypotheses.

Do NOT redo RUN63. Match precisely its two inequalities to the
native caller lines 255–260: write
E=#(tops intersect evenPlaces Lambda)*a/x1, L=loss, G=gain,
U=f logB^2*(a/p)<=L. Full marking implies collisionSum=0,
and Lambda is nonempty since a top exists (native uses 1 in tops).
The served hypothesis yields chiK=-1 and hence rebate coefficient 1.
For each j<m,
  #Lambda*deltaP+r*sum_even R <= L/m+E,
  JET >= G/m+E-U/m.
Subtract first, then sum over m stages to get L+U-G<=2L-G.
This is the exact peer interface, including U<=L rather than
an assumption that the two loss terms coincide. RUN63 quantitative
scale derivations and geometric hypotheses remain subject to independent
audit; no new numerical derivation is asserted here.

Original graph unchanged: unramified pairing -> polynomial induction
 -> sum_coeff_invOfUnit_smul_eq -> exists_hecke_transfer
 -> exists_move_markOperator -> gaugeLe_markOperator_pow
 -> gaugeLe_Bmu_of_isMarked -> exists_indexDvd_Bmu_divisible.
Candidate human replacement: retain pairing and polynomial identity;
replace generic denominator estimate by (*) and integral inverse
recurrence, with explicit original-statement bridge. Original and
native reduced graphs and axiom evidence preserved, no claim of
global dependency retirement. In particular the geometric unramified
pairing theorem, spherical vacuum, and marked HasType (including
TwistedHecke elementary divisors) remain open at their actual consumers.

Verification: command -v lean/lake returned neither executable.
CI 45577239749 and 45576756833 state receipts actually report pass
for older conditional root and native engines. Compact run
45803534769 Actions jobs success but actual compute status.json
reports ERROR (5147.99s, targeted checks failed or not reached).
No fresh native PASS, rh_prune/rh_scan/rh_reduce/rh_auto/frontier
not run against this compact proof; scalar certificates below PREPARED
for native shared replay; no finite test asserted.

RESUME HERE: prove the exact unramified pairing polynomial supplier
or audit its existing derivation; prioritize actual marked HasType at
MarkedPrimeType -> Columns.hasType_markOperator -> T.hasType_twisted_hecke
(geometry of parahoric/coset pullback and small elementary divisors).
Do not repeat RUN63 or this transfer algebra. Audit the stronger
inverse-coefficient factorization and try compiling the caller bridge
on the shared compact cache. Keep RH window premise and all unresolved
A/B/C primitive obligations visible.
HANDOFF TO integration, audit, acceleration, kernel.
-/

namespace ThetaRun76

theorem degree_factor (n r i : ℤ) :
    n*(r-i)+i*(i-1)-r*(r-1) = (r-i)*(n-r-i+1) := by ring

theorem degree_nonneg (n r i : ℤ) (hi : i ≤ r) (hn : 2*r ≤ n) :
    0 ≤ n*(r-i)+i*(i-1)-r*(r-1) := by
  rw [degree_factor]
  exact mul_nonneg (sub_nonneg.mpr hi) (by linarith)

theorem full_mark_stage (m L G U E A J : ℝ) (hm : 0 < m)
    (hA : A ≤ L/m+E) (hJ : G/m+E-U/m ≤ J) :
    A-J ≤ (L+U-G)/m := by
  rw [sub_div, add_div]
  linarith

#print axioms degree_factor
#print axioms degree_nonneg
#print axioms full_mark_stage
end ThetaRun76

#check Data.IsGoodDatum.exists_hecke_transfer
#check Data.IsGoodDatum.exists_move_markOperator
#check Data.IsGoodDatum.gaugeLe_Bmu_of_isMarked
#check Data.IsMarked.hasType_markOperator
#check Data.le_jetExponent
#check Data.IsMarked.sum_lowColumns_le
#print axioms Data.IsGoodDatum.exists_hecke_transfer
#print axioms Data.IsMarked.hasType_markOperator
