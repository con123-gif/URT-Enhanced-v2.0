import Formalism.SharpRestriction.ValuationFrobeniusEpsilon.LeastPrimeTwists.QuotientShiftIrreducible.NoetherianQuotientCalc.RuleUB
import Formalism.SharpRestriction.ValuationFrobeniusEpsilon.LeastPrimeTwists.QuotientShiftIrreducible.NoetherianQuotientCalc.RuleMono
import Formalism.SharpRestriction.ValuationFrobeniusEpsilon.LeastPrimeTwists.QuotientShiftIrreducible.NoetherianQuotientCalc.EulerRuleProductZero

/-!
# RUN30, lane 12: exact Euler defect and aggregate multiplicity

Status: human source-matched derivations; prepared Lean certificate, NOT compiled.
No new kernel/axiom verdict. No RH conclusion.

Source pin: leanprover-community/riemann-hypothesis
40e56bab026552e089d7afcfeff08d2defb9c005.
Working branch observed immediately before this commit:
91754a9c60d599d1d8f0517236f6072b94f35e12.
Current mission blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc.
Read SWARM, handoff, AGENTS, continuity, research log/protocol, latest
summary, live manuscript 329fa03ece749546346abda368fb1c814ab9b167.
Peer results read: 7073217630f609010c29cb888dcc5dc4b706fd18
(lane11 transport), 9edc3b00e987992efe44683c6427260f2991e2f0
(common determinant), 866504ea7c1a5c0a6fa628a83e21b21c1f2ade4f
(Galois three CM fields). No overlap with this local Euler calculation.
Predecessor 75a0532000a5fb57d94630cb5e38159285f67352.

## Native provenance and context-sensitive dependency graph

Base E = Formalism/SharpRestriction/ValuationFrobeniusEpsilon/
LeastPrimeTwists/QuotientShiftIrreducible/NoetherianQuotientCalc/.
Base M = Development/AutomorphicArithmetic/AutomorphicVarieties/
CommutativeAlgebra/GradedModulesLength/. Paths relative to src/.

E/EulerVanishingBelowDimension.lean a4e0126c638e85b145a4828a3bd81eac71c0aa34
E/EulerAdditivityDegreeZero.lean b59fa8cf797fe22ba1ce20bf2b1b0db07d5ba805
E/EulerRuleProductZero.lean dfd0c039671f62540981e1ac7ef744ec18947494
E/RulePos.lean 5841068893373d7d753923b9ab0d8b120daf8e0c
E/RuleMono.lean 38f7d535e33d7d1c8cc645f6bd08f3abcb39734d
E/RuleUB.lean f3f04d1fe8875783bf93eff88c480d96e796e30f
E/RuleSmall.lean a16e5a8d622766ca0f8503bfffc6d282d68bef28
E/RuleNzd.lean a30e5861d9bd5c18cb089f7feeaee29448265070
E/VanishingBelowDimensionRule.lean 65075944737e08c1396df3613ce30221427d4440
E/RuleDev.lean 0fe159538db7a2e2c113ca3e9785708e6ad52547
E/RuleFin.lean d9d1134056221583d80115c25526040ab3a87658
E/EulerAdditivityExactSequence.lean 1bfbc02eabaee8b38a8c0751a2fdf69d4b39f070
E/EulerIndependenceOfOrder.lean 7e26347a10c4b2fa394b6c072e6f65bee9329368
M/LaDifPerm.lean d327f3f89083c0ad6bf9db1b1ae1f23d5cee9626
M/AdmissibleMonoIdeal.lean 80e31b9fb109fd0b2456e96d2ed5b2e370d40461
M/AlgMemCoef.lean 9e04a261be7daddc895cbff009d6264a953fa8af
M/TwoSigned.lean c2460a5a728ec42562e60d678237aa4f8051ec53
M/LocLenAPieceIdeal2LeTwoPow.lean f685f7633ab8f10eb5d922d98668241790c770ff
M/LocLenAPieceSupSpanSqLeAdd.lean bd6717ada6677af663c02d28a5dcecd5d9cd40ed
M/LocLenQuotientWeightPieceLeOne.lean 74f993dd39166d346ca21681890f0deb9f25ed30
M/SliceHolds.lean 0f4347bf89016fe7f63ce6aeaed14c849f57d135
M/DehHolds.lean ba585c249b5fbf661ffea7dd0c19b07f59a4fd4c
M/EventuallyMQGrFiniteAnnihilator.lean 141ac8b847f836a9d22373ca0ef352c0726b3ffe
M/LocalizedLengthLeOfSurjective.lean faafd30517b9b80d81e0a801c6a2f5d3f71dad7a

Original source-call subgraph (NOT new elaborated edges):
core_holds -> low_holds, chain, up_holds;
low_holds -> la_holds, mono_quo;
la_holds -> la_peel, rulePos, order independence;
la_peel -> euler_rule_product_zero, ruleSmall, ruleNzd;
mono_quo -> ruleMono -> Pos.e1, rulePos;
chain -> ruleUB, ruleNzd, order independence, qi_holds;
ruleUB -> rulePos, UB.ann_sup_le_ann;
rulePos -> E4.dev_reduce, E4.prime_step, ruleNzd;
up_holds -> eventually_mQ_gr_finite_annihilator, tsp_holds,
locLen_mQ_gr_le_locLen_aPiece, locLen_aPiece_ideal2_le_two_pow,
locLen_quotientWeightPiece_le_one;
last -> slice_holds, deh_holds, nilpotent_modulo_kernel.
Reduced human graph replaces repetitive Euler algebra with exact
identities below, but retains all underlying conditions and source
suppliers, including M2/M3/M4, admissibility and same-host context.
Do not delete original graph/axiom evidence. No cross-host cache reuse.

## 1. Exact defect (new, no finiteness premise for algebraic identity)

For T=[(d_i,s_i)] and tail U, let F_0=F, F_i=F_(i-1)/s_i F_(i-1)
and A_i=ker(s_i:F_(i-1)->F_(i-1)) shifted by d_i.
By the native recursive definition of chi, at every degree m,

  chi(U,F_n;m)-chi(T++U,F;m)
    = sum_i chi(T_>i++U,A_i;m).

Proof: subtract the defining quotient-minus-annihilator recursion
from chi(U,F_n;m); telescope. No exchange of limits, no positivity
assumption and no numerical fitting. This identifies exactly the loss
in native RuleUB and hence the middle inequality of core_holds.
The identity itself is a formal identity for native chi (even its toNat
convention on infinite length). Interpretation as Euler length needs
the original finiteness conditions.

Under native Valid, IsGr and admitted jointly on T++U, every summand
is eventually nonnegative: the annihilator of F_(i-1) plus (s_i)
annihilates A_i, and the remaining section ideal gives admission by
ideal inclusion. Quotients and kernels are graded by ruleGr. RulePos
applies separately and the finite intersection of eventual bounds gives
the inequality. No uniform threshold across hosts is asserted.

## 2. Positivity is substantive but elementary graded devissage

Keep the original HidaSetting: noetherian local B, standard
nonnegative multigraded B-algebra, finite internally graded F, valid
homogeneous sections of nonnegative degrees, and admission
(m_B R * Irr)^N <= Ann(F)+secs(T).
By finite homogeneous prime filtration and Euler additivity reduce
to shifted R/q. Irrelevant q containing Irr have eventually zero
pieces. On a relevant homogeneous prime q, s not in q is regular,
so the first section contributes the Euler value of its quotient.
If s is in q, choose a section sigma of the same degree outside q:
take products of coordinate unit-degree sections outside q (possible
since q is prime and does not contain Irr). The actual s acts as zero;
the short exact sequence for multiplication by sigma identifies the
difference of shifted Euler values with the quotient by sigma.
Admission passes to the tail since s is in q. Induct on section count;
empty list gives nonnegative length. Thus eventual positivity follows,
not positivity of arbitrary alternating sums. This is the native
E4.dev_reduce / prime_step mechanism. No assertion that sigma is
simultaneously regular on the original module. Finiteness for the
additivity calculations is the native ruleFin: sufficiently high
pieces of admitted terminal modules are killed by a power of m_B,
and are finitely generated. For ruleMono, the kernel inherits admission
via larger annihilator; apply additivity then this positivity.

## 3. Exact uniformizer peeling remainder

Use the same degree-zero regular beta, admitted empty list on
H=F/beta F, and same degree d for all n>=1 sections beta^(c_i)y_i
as in la_holds. Preserve the joint admission and all original Valid
hypotheses. Write D=Delta_d^(n-1) product_(u in U) Delta_deg(u),
where Delta_d h(m)=h(m)-h(m-d). Then eventually

 chi([(d,beta^(c_i)y_i)]++U,F;m)
 = (sum_i c_i) D h_H(m) + chi([(d,y_i)]++U,F;m).

Proof: the six-term kernel/cokernel sequence for two composable
multiplications gives Euler additivity for their product; beta has
degree zero so no shift for its contribution. Since beta is regular,
this contribution is chi(tail,H;m). RuleSmall replaces it by the
finite difference, using admission of H itself. Replace one power
at a time, permuting sections as in native la_peel/la_holds. Every
tail has the same degrees, hence the same D. Admission survives each
replacement by ideal inclusion. Finite intersection of the eventual
identities permits the sum. For n=0 use the trivial identity, not a
negative-order difference. Native rulePos makes the final remainder
nonnegative. At low_holds the exponents are 2c_i and the earlier
RUN29 Hilbert coefficient is exactly 2^(r-1+r'), giving the original
2^(r+r') sum c_i lower bound, with no further loss.

## 4. Aggregate multiplicity and upper support audit

In the actual locLen_aPiece_ideal2_le_two_pow call, write J for the
unchanged homogeneous equations and t_i for the n=r+1+r' equations
being squared. Work in C=A/(J,t_1^2,...,t_n^2), L=(t_1,...,t_n).
Then L^(n+1)=0. Every L^j/L^(j+1) is generated over C/L by the
squarefree monomials t_I, |I|=j. On degree w it is a quotient of
the sum of (C/L)_(w-sum deg(t_i)) over those I. Localize at the
same prime P=ker sigma of A_0; exactness of localization and length
additivity for this finite filtration give

  locLen_sigma(C_w) <= sum_(I subset [n])
    locLen_sigma((C/L)_(w-sum_(i in I) deg(t_i))) <= 2^n.

No regular sequence needed. This is the aggregate version of the
actual one-square exact-at-middle map A/(J,t)(-d) -> A/(J,t^2)
-> A/(J,t). The last inequality needs the native uniform length-one
bound on ALL shifted weights, not just degree w.

Audit of length one: localize at P; choose f,g of degrees -2,+2
with tau=fg outside P (two-signed). M2 integrality gives for p in P
a monic polynomial relation; factor off its zero root, leaving a
factor with nonzero evaluation at sigma. Thus p becomes nilpotent.
The native slice_holds + deh_holds red argument kills homogeneous
nilpotents after localization; hence P kills the localized quotient.
For a weight w, pick e of degree -2w that is a unit in the localized
graded algebra (power of f or g, since tau is a unit). If all
sigma(h^2 e)=0, all weight-w elements vanish by reducedness.
Otherwise choose h0 with sigma(h0^2 e) != 0. The exact identity
(h0^2 e)h=(h h0 e)h0 gives a single generator over the residue
field. Thus length at most one. M4 is essential in the native
slice proof: impose f=1, use the degree derivation with degree -2
in characteristic zero to remove the remaining tangent direction;
et_holds supplies finite reduced generic slice. No deletion of M4.
Support finiteness/vanishing still depends on eventually_mQ_gr_
finite_annihilator (zi_holds, zii_holds, power_ideal_kills_graded_pieces)
and tsp_holds. Rees-to-weight comparison still needs the localized
kernel inclusion. The weighted valuation sum, nonnegative valuations
and actual covering T are unchanged. These are source-matched
premises, not a new uniform CountI bound.

## Verification and resume

Executed 40 source assertions across 9 files (exact Git blob IDs
and actual declaration/call strings): all matched. Lean and lake
not installed in local execution environment. This file is a prepared
certificate on native definitions, not a new CI run. Prior native
engine results 45577239749, 45576756833 reread: success 98.87/77.94 s,
propext/Classical.choice/Quot.sound, bounded scan 324 pending. Those
do not certify this file. No synthetic test or claimed URT speedup.
No fresh global graph scan: cache key remains source pin + exact
declaration + instantiated context (F,T,U,degree/prime as relevant).
Native scan/prune/reduce/auto/auto_frontier to replay in existing
pinned environment; do not count any local proof as kernel verified.

RESUME HERE: recover the actual zii_holds and tsp_holds proofs in
the upper support supplier, reducing the two-signed support condition
without removing M3/M4 or changing the actual host. Then connect to
the remaining admissibility/cohomology obligations in CountI.
-/

namespace Formalism.MainNotions.V.Pf.V2.Calc
open Filter
noncomputable section

def nativeEulerDefect {k : ℕ} {B R : Type} [CommRing B] [CommRing R]
    [Algebra B R] (ts us : List (Deg k × R)) (F : GMod B R k)
    (m : Deg k) : ℤ :=
  match ts with
  | [] => 0
  | (d,s) :: rest =>
    chi (rest ++ us) (F.ann s d) m + nativeEulerDefect rest us (F.quot s) m

theorem nativeEulerDefect_eq {k : ℕ} {B R : Type} [CommRing B] [CommRing R]
    [Algebra B R] (ts us : List (Deg k × R)) (F : GMod B R k)
    (m : Deg k) :
    chi us (F.quots ts) m - chi (ts ++ us) F m =
      nativeEulerDefect ts us F m := by
  induction ts generalizing F with
  | nil => simp [GMod.quots, nativeEulerDefect]
  | cons p ts ih =>
    obtain ⟨d,s⟩ := p
    simp only [GMod.quots, List.cons_append, chi, nativeEulerDefect]
    rw [← ih (F.quot s)]
    ring

theorem nativeEulerDefect_nonneg (k : ℕ) (X : HidaSetting k)
    (ts us : List (Deg k × X.R)) (F : X.Mod)
    (hv : Valid X.𝒜 (ts ++ us)) (hF : F.IsGr X.𝒜)
    (hA : admitted X.𝒜 (ts ++ us) F.Ann) :
    ∀ᶠ m in atTop, 0 ≤ nativeEulerDefect ts us F m := by
  filter_upwards [ruleUB k X ts us F hv hF hA] with m hm
  rw [← nativeEulerDefect_eq]
  exact sub_nonneg.mpr hm

#print axioms nativeEulerDefect_eq
#print axioms nativeEulerDefect_nonneg
end
end Formalism.MainNotions.V.Pf.V2.Calc
