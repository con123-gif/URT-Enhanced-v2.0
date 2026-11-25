import Formalism.LocalToGlobal.GlobalTheory.GL5.PNamed
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# Integration: rank-only Tamagawa normalization audit
25 Nov 2026. Human source-matched, Lean PREPARED, NOT compiled. RH OPEN.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Mathlib
0df444a360eaa60ab8c11dca51a86af692955474; Lean 4.33.1.
Mission cd0a176134d46b5b624896e56843a24915c14477 read first,
SWARM/HANDOFF/AGENTS, state/log/protocol, continuity and living proof
464e82f81f646d4af85e1f5f70d379026df46261 inspected (long files in part).
Peer checkpoints 1a1774df, ab51a90e, 9e2b2625, b6601b9c, f6d47bbb,
259672cc, 4e8fb668, 8b54a1ab, 6ee9b256, 88aa566b, 3044c307,
7e4677d9, 0cf4b3fb, editor 3e1000ef. Review integration 2df8b6cc
and geometry 0e1b92ab, CM indexing fdb0ad7a. No independent RH detour.

## Compact human proof block
For the SAME host F,E,D and W, set H=W.gram, n=W.rank.
HSpace.herm/nondeg and CMData.fixed imply det H lies in F^*.
Fix one F-rational top covector beta on S={Y:Y*=-Y} for each rank.
On Lie U_H choose the rational invariant gauge with identity value

    omega'_H(X_1,...,X_(n^2)) = (det H)^(-n) beta(H X_1,...,H X_(n^2)).

It is nonzero because X -> HX identifies Lie U_H with S.
Rescaling by this rational factor leaves the Tamagawa measure unchanged
by the product formula. For any local frame H=A* J A, let c_A(X)=A X A^-1.
Then HX=A* (J c_A(X)) A. Over the splitting algebra the first component
of (Y,-Y^t) transforms by Y -> A_2^t Y A_1; its determinant is
det(A_2)^n det(A_1)^n. Thus the determinant on S is Norm(det A)^n.
Since det H=Norm(det A) det J, the rational factor cancels before norms:

    |omega'_H|_v = c_A^* |omega'_J|_v.

This is place-by-place equality, not an unregularized infinite product.
At finite v take J=I. Native IsCMUnram rules out ramification since
conjugation would fix the residue field. HSpace.baseLattice_isUnimodular
gives self-duality after flat completion of its finite dual constraints.
At inert v a perfect residue Hermitian form has a vector of nonzero
self-pairing: otherwise h(u+a v,u+a v)=0 for every a forces all pairings
zero by nondegeneracy of the finite-field trace. Lift to unit norm;
the norm on units is onto by the surjective residue norm and successive
corrections N(1+pi^k z)=1+pi^k Tr(z) mod pi^(k+1), using completeness.
Rescale to norm one, split off its self-dual complement, induct.
Works at residue characteristic two without dividing by two. At split
places the idempotent components are dual free lattices; choose dual
bases. Ramified negative control: integral unit norms in Q_2(i) are
1 mod 4, so -1 is not a unit norm. Retain cmUnram.

At real v take J=diag(I_P,-I_Q). X -> JX identifies the native lieU
with the compact Lie space. Its complexification changes row signs,
preserving ambient complex volume in IsOmegaLeb. The positive Haar
scale is unique since its square is fixed by the product pushforward.
CDHaar.trick fixes the same finite nonzero exponential density,
and CDHaar.prob fixes compact normalization. Hence the ratio of the
local gauge to native cd(P,Q) is signature independent. Use the actual
CM-place bijection fdb0ad7a/1a1774df, not a double-counted embedding set.
RUN33's finite-generator argument identifies latHat (algebraic
AddSubgroup.closure, not topological closure) with prod_v L_v;
HFinIn is the rational subgroup image under inclR and HA is the
unitary subgroup over the adelic tensor algebra with moduleTopology.
Under the native-to-classical topological dictionary, IsVolMeas
rectangles are K_f times the real factors; equality on one positive
finite rectangle implies equality of Haar measures by uniqueness.

Crucial domain check absent from previous note: for n>=1 over the
splitting field all algebraic characters of U_H are determinant powers.
Quadratic descent sends determinant to its inverse, so the F-rational
character group is zero and U_H(A)^1=U_H(A). The whole character
module is the rank-one sign module for every H. The convergence factors
L_v(1,eta), global L(1,eta)^(-1), and discriminant factor (dimension n^2)
are therefore identical at fixed F,E,n. Apply the SAME regularization
to the placewise identity, not two conditionally converging products.
There is one positive finite normalization ratio C(F,E,n) from
Tamagawa to native Haar, by the standard unitary Tamagawa construction
(the good-place factors remaining after the j=1 factor converge
absolutely, since they are 1+O(q_v^-2)).

Harris-Li-Skinner, Documenta Math Extra Volume Coates (2006), p.400,
(0.2.1)-(0.2.3), gives the normalization and Tamagawa number 2 for
these unitary groups (their E,K denote our F,E):
https://www.kurims.kyoto-u.ac.jp/EMIS/journals/DMJDMV/vol-coates/harris_li_skinner.pdf
The text on p.400 was retrieved and read; screenshot attempt HTTP 403.
Kottwitz, Ann. Math. 127 (1988), 629-646, DOI 10.2307/2007007,
https://annals.math.princeton.edu/1988/127-3/p05 is the general result.
No claimed RH root imported.

Hence every normalized fundamental domain on this same host satisfies

    mu(Fdomain)=2/C(F,E,n).

Rank zero has trivial group and mass one by IsVolMeas. Quotient
integration equals Haar mass of a measurable fundamental domain.
This establishes the rank-only normalization in ordinary mathematics
conditional on the exact native-to-classical topology/Haar dictionary.
The native dictionary and theorem adapter still need kernel validation.
The adapter below recovers the actual VolSigIndep and vol_eq_of_indep.
With editor 3e1000ef, VolTie, standard class identity and mass ratios,
this would give delta=0 for the signed count anchor. No independent
premises retired, no closure of VWinAt(1,401) or joint geometry,
entropy and local-gain suppliers.

Original local graph: VolSigIndep -> vol_eq_of_indep,
vol_eq_mass_of_indep, volRatioTrue_of_indep -> packet/count/covolume.
Candidate overlay: VolSigIndep <- rank scalar <- local gauge identity
+ common regularization + standard Tamagawa theorem + actual native
topology/Haar/fundamental-domain transport. Context key (pin, toolchain,
D,F,E,W,frame,n,signature,measure). Preserve original graph and all
typed/value/constructor/axiom edges; backtrack if transport fails.
Independent review of 2df8b6cc: AGREE on determinant and local frames;
supplied missing rational-character check, precise regularization and
placewise rational rescaling. No root-reachable obligation retired.

35 actual exact blob/anchor checks executed via connector JS across:
src/Formalism/LocalRingCardinality/DataCD.lean 449d5479b4d8ec9baeaebd3459f95232094ae222
src/Formalism/LocalRingCardinality/DataSpaces.lean f1d2da346f8996c2527724b50fd6409dc8ab937b
src/Formalism/HermitianLattices/StatementMass.lean 33a3ea93298eff7969409462ddfc1ed22f173939
src/Formalism/HermitianLattices/StatementLat.lean 4f84ca3c8738dca6ffab6b32fdf4ee309fed05c4
src/Formalism/SharpRestriction/GlobalSchurBounds/StandardLattice.lean cb758a6c5f78e610b8f946d4b733d07902b15f5d
src/Formalism/SharpRestriction/GlobalSchurBounds/GeneralLinearActions/GenusMassVolumes.lean 525618b770cb535fd890f10277af11ffbe76af40
src/Formalism/LocalToGlobal/GlobalTheory/GL5/PNamed.lean fcfd96e6e8385ec5e1de13f41d5706803d565c5d
No local lean/lake/gh on PATH. Actual baseline CI status JSON both pass,
returncode 0 (45577239749 and 45576756833), NOT this certificate.
General orchestrator 45645883167 PASS 15:50:40 UTC at 4e8fb66.
New peer compute rh-landau-diagonal-root-20261125 status error,
returncode 1, RuntimeError: unhandled import import sympy as S.
Do not count that candidate as checked. First write attempt timed out,
then exact path fetch returned 404; retry with compact checkpoint.
Native commands prepared, not executed; no new axiom/scan evidence.
No numerical surrogate or URT advantage claimed.

RESUME HERE: batch replay rank-scalar adapter, CM indexing RUN34 and
editor packet replacement; authenticate native GL/moduleTopology and
IsFundamentalDomain quotient conventions. Keep standard Tamagawa
theorem in human provenance. Coordinate failed diagonal-root runner
with Landau/kernel. HANDOFF TO geometry, editor, literature, kernel,
formal audit. RH OPEN.
-/

noncomputable section
namespace RHIntegrationRankNormalization
open Formalism.BasicNotions Formalism.MainNotions.StandardLattice
open Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes
open Formalism.L2.GlobalTheoryTheory.GenusMassVolumes
open MeasureTheory
attribute [local instance] Formalism.BasicNotions.Host.cmStar

def RankScalar (D : D7) (C : ℕ → ENNReal) : Prop :=
  ∀ (W : HSpace D.host.E) (P Q : ℕ), W.SigOK →
    (∀ τ, W.sig τ = (P,Q)) →
    ∀ (μ : Measure (HA (AF D.host.F) D.sp.cm.sig W.gram))
      (𝓕 : Set (HA (AF D.host.F) D.sp.cm.sig W.gram)),
      IsVolMeas D W P Q μ →
      IsFundamentalDomain (HFinIn (AF D.host.F) D.sp.cm.sig W.gram) 𝓕 μ →
      μ 𝓕 = C W.rank

theorem rank_scalar_to_volSigIndep (D : D7) (C : ℕ → ENNReal)
    (hC : RankScalar D C) : VolSigIndep D := by
  intro W W₀ P Q P₀ Q₀ hW hW₀ hs hs₀ hr μ 𝓕 μ₀ 𝓕₀ hμ h𝓕 hμ₀ h𝓕₀
  rw [hC W P Q hW hs μ 𝓕 hμ h𝓕, hC W₀ P₀ Q₀ hW₀ hs₀ μ₀ 𝓕₀ hμ₀ h𝓕₀, hr]

theorem actual_rank_volume_consumer (D : D7) (C : ℕ → ENNReal)
    (hC : RankScalar D C) (hT : VolTie D)
    (W W₀ : HSpace D.host.E) (P Q P₀ Q₀ : ℕ)
    (hW : W.SigOK) (hW₀ : W₀.SigOK)
    (hs : ∀ τ, W.sig τ = (P,Q)) (hs₀ : ∀ τ, W₀.sig τ = (P₀,Q₀))
    (hr : W.rank = W₀.rank) : D.vol W = D.vol W₀ := by
  have hI : VolSigIndep D := by
    first
    | (rh_reduce 2 using [rank_scalar_to_volSigIndep]; done)
    | (rh_auto_frontier 2; done)
    | (rh_auto 2; done)
    | exact rank_scalar_to_volSigIndep D C hC
  exact vol_eq_of_indep D hT hI W W₀ P Q P₀ Q₀ hW hW₀ hs hs₀ hr

rh_scan rank_scalar_to_volSigIndep limit 2000
rh_scan actual_rank_volume_consumer limit 2000
rh_prune rank_scalar_to_volSigIndep as RHIntegrationRankScalarPruned
rh_prune actual_rank_volume_consumer as RHIntegrationRankVolPruned
#print axioms rank_scalar_to_volSigIndep
#print axioms actual_rank_volume_consumer
end RHIntegrationRankNormalization
