import RHSharedShaActualVWin40
import Development.AutomorphicArithmetic.AutomorphicVarieties.GeneratorCountTuples.LemmaKOfPublished
import Development.AutomorphicArithmetic.AutomorphicVarieties.GaloisLibrary.KummerTheory.LenOfCard
import Development.AutomorphicArithmetic.AutomorphicVarieties.AdditiveValuationNorms.ShaLeV
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3
import RHProofTermPrune

/-!
RUN39 — literature provenance, 2026-11-25. Human mathematical derivation;
Lean overlay PREPARED, not executed. RH OPEN.

Mission current blob f8b4b837301f8cf43d673be4979f04c4e4b415a4;
SWARM 4b77b161d6876915c15cea5a4d4a519beaf5de74;
HANDOFF bbc46df7d7716a6d8863275b5271801eacfaad0d;
AGENTS 8db0201da965541e0487d6dd1271e010bdaa0972.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Upstream current observed 756a70250dcba9162b99d4ea35c186558434c17e;
no silent source migration. Peers 2785c414 (integration RUN40),
33888226 (CountVs direct Sha), abca5bf7 (BOdd), 30a2c2d9 (tower),
4fd3152d (local indices). Existing RUN35 and RUN38 retained.

NEW reduction: LemmaK C -> ShaK C with EXACT same C, assuming the
native PT, LF, LT. No factor 2 from conversion to unweighted length.
For each same L,l,e, choose Omega=AlgebraicClosure L and its native
ldata_nonempty witness D. LemmaK gives finite H2 and log(card H2)<=kBound.
Kum.lenOfCard gives card H2=l^k and VLen=k. Native PropA.shaLeV is
the PT injection/length bound shaLen<=VLen, and shaLen_eq_shaInv is
the native invariant identity. Thus shaInv=s is finite and
    s log l <= k log l = log(card H2) <= kBound C e n disc.
This yields a single shared supplier exists C, LemmaK C AND ShaK C
from the alternative KBridge route. All original quantifiers retained.
At peer core_sha40, feed BOTH from that same proof packet, retaining
hE, h4, CountI and CountV exactly. No SFinal/SNum call in this explicit
replacement body; their transitive presence elsewhere is not excluded.
No global graph deletion without native role-aware scan. This replaces
a supplier conditionally, not a proof of VWin with no premises.

Independent literature check of missing dyadic comparison in RUN35:
F totally imaginary, l=2 (native HasMuQ requires i), e>=1. Put
R=O_F[1/2], T_r=Z/2^r(e+1). Cyclotomic action factors through a
2-group. A. Schmidt, Rings of integers of type K(pi,1), Proposition 2.3
and proof, pp 5-6: all primes above p in S, and p odd OR F totally
imaginary. Its proof uses the pro-p universal cover acyclicity with
p-primary coefficients; compare full unramified Galois group via
Hochschild-Serre (trivial-coefficient acyclicity on the cover, then
finite filtration for modules whose action is a p-group).
Thus finite-level Galois and etale cohomology agree. Continuous
cochains are inverse limits of finite-coefficient cochains; the
degreewise maps are surjective (lift finite discrete target using
a set section). H^1 is finite by finite cyclotomic extension,
Kummer theory, finite class group, finitely generated S-units and
inflation-restriction. Hence lim^1 H^1=0, permitting H^2 comparison.
The native D.hS and hchi identify S and the cyclotomic action;
RUN35 recorded the native cocycle and coboundary conventions.

Rognes-Weibel, Two-primary algebraic K-theory of rings of integers
in number fields, JAMS 13 (2000), 1-54 [preprint pagination may vary],
Theorem 0.1: for totally imaginary F, K(R) -> K^et(R) is an
isomorphism on positive 2-adic K groups. Etale descent in cd<=2
has only H^2(R,Z_2(e+1)) and H^0(R,Z_2(e)) in total degree 2e.
The second vanishes for e>=1 because cyclotomic image is open
and Z_2 torsion free. No possible differential to or from H^2
in this range. Even positive K groups finite (Borel/Quillen);
completion adds no Tate module of the adjacent finitely generated
K group. Localization at primes above 2 changes no 2-primary part
because finite residue-field positive K groups are zero in even
degree and odd order in odd degree (Quillen). Consequently
    K_{2e}(O_F)_{(2)} ~= H^2(G_{F,S},Z_2(e+1)).
For odd primes RUN35 uses Schmidt and the odd-primary
Quillen-Lichtenbaum comparison (Weibel survey, theorem 70).
The same argument works with native HasMuQ so no prime-to-l
cyclotomic splitting extension is necessary. All this is a human
comparison, not a native Lean declaration.

For the alternative KBridge, take K to be that finite primary K
group, p the comparison, h the stabilized integral Hurewicz map
on BGL^+ followed by tensor with Z_l. Plus construction preserves
integral homology; van der Kallen stability reaches degree 2e
at size 4e+4 (RUN38). Mathew, Torsion exponents in stable homotopy
and the Hurewicz homomorphism, theorem 6.3, supplies the primewise
kernel bound used in RUN37/38. Its e+3 bound is <= cOne(2e)
=e(2e+5) for e>=1. This is the mathematical supplier route;
compatibility of comparison maps and Hurewicz with native
definitions remains a formal obligation, and no new axiom is
admitted as a theorem. Native K.lemmaK includes the torsion
estimate from KT.torsMain; its proof dependencies and assumptions
must be audited separately, not inferred from its name.

Source ledger relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties:
ModularityArgument/ClassCounting/LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10
GeneratorCountTuples/LemmaK.lean 8726ea4259cd1f0fcb350eca97a3be2478261c87
GeneratorCountTuples/LemmaKOfPublished.lean 82044f2422c5b48970bd94223e33087a7896fc40
GaloisLibrary/KummerTheory/LenOfCard.lean cd08d24505cd799a476b11a42049ffc0ddc4a10c
AdditiveValuationNorms/ShaLeV.lean 6af293f1ba30d7aab77ac39a9fa5a3524b1cc434
GaloisLibrary/GaloisCohomologyLength/ShaLenEqShaInv.lean 19302758658356ff85c5540681e53e79579ab975
GaloisLibrary/GaloisCohomologyLength/Formula.lean cff8e2bcf570c27bd9970dbcb80df51eb41d7a26
GeneratorCountTuples/Reduction.lean 1cfb92c81ec5c4ed77aac5a7cce457add1e55721
GeneratorCountTuples/Bridge.lean c995485ab93aa56e1eabbdd1900429075fb4c65b
ModularityArgument/ThresholdArguments/DenseThresholdCases/WindowBoundOfLiteratureLevel.lean 01c499108485b16d33791a9e46fbb1e2af865522
ModularityArgument/ThresholdArguments/DenseThresholdCases/HVCore.lean f4b900eb48df14f16eea03d08b7d9ef077f3d4a1
ModularityArgument/ClassCounting/SFinal.lean a960a48653fa69c34f72f5f8ed434135ff1163a6
Relative to src:
Formalism/GaloisCohomology/GaloisCohomologyProofs/LdataNonempty.lean 940a33a2189f2ef8bb347b172aa140598258642d
Formalism/GaloisCohomology/Statement.lean 0799e9bcd8aa191ffaa90ab005453a53381bacea

Original graph: VWin -> LemmaK_litN_alt -> SFinal(SNum(...,BOdd,...)).
Peer graph: VWin -> SNum -> ShaK -> SFinal -> LemmaK; shared ShaK
also -> direct tower anchor.
Candidate: VWin -> both_of_bridge39 -> K.lemmaK(KBridge,PT,LF,LT,
torsMain) -> LemmaK -> sha_of_lemmaK39(PT,LF,LT,lenOfCard,shaLeV,
shaLen_eq_shaInv) -> ShaK, both -> core_sha40. Remaining hK at
CountVs not removed here; acceleration RUN39 may consume same ShaK.
Keep actual hE,h4,CountI/II/III/V, all core leaves, and original
graphs and axiom evidence. Cache key includes source and toolchain
pins, L,Omega,D,l,e,C, exact PT/LF/LT and KBridge proof, and host
context. No substitution of different fields, no URT comparison.

Execution: 14 fail-on-error exact source hash/anchor checks executed.
Fetched actual CI status outputs 45577239749 and 45576756833:
both returncode 0, historical engines/root conditional adapter only.
No native Lean or Lake available locally; no new compile or scan
output, no new PASS, no claimed new axiom certificate.
The scans and prune below are replay instructions, not results.
Backtracking to native supplier retained.

Replay: stage peer RHDirectShaAnchor38.lean from 2c98bf97, then
integration/2026-11-25_2100_SHARED_SHA_ACTUAL_VWIN.lean from
2785c414 as RHSharedShaActualVWin40.lean on same LEAN_PATH,
compile both then this overlay. Prefer first compiling exact
ShaK bridge standalone if peer overlay fails. Record actual
native errors and repair; compare role-aware original/reduced
graphs and axiom output before removing anything.

RESUME HERE: replay same-C implication and caller, then authenticate
native KBridge comparison and KT.torsMain transitive assumptions.
If alternative supplier fails, revert to SNum route and retain same-C
lemma as an independent bound. Share both constants with CountVs
direct Sha peer; do not duplicate direct-anchor derivation.
HANDOFF TO integration, kernel, audit, Galois, acceleration.
-/

noncomputable section
set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000
open NumberField IsDedekindDomain ReciprocityTheory.Gal
open Formalism.ConjugateSelfDual Formalism.GaloisCohomology
open UpperTheory.V UpperTheory.Top UpperTheory.V.LDataCardLeFinrank

namespace RHLiterature39

theorem sha_of_lemmaK39
    (hP : GlobalTheory.Published.PoitouTateDuality)
    (hF : LocalFinitenessK) (hT : LocalTateDualityK)
    {C : ℝ} (hK : LemmaK C) : UpperTheory.V.ZK.ShaK C := by
  intro l _ L _ _ htc hmu e he
  letI : IsTotallyComplex L := htc
  obtain ⟨D⟩ := ldata_nonempty (F := L) (Ω := AlgebraicClosure L) l
  obtain ⟨hf, hlog⟩ := hK l L (AlgebraicClosure L) D htc hmu e he
  letI : Finite (H2 (zlTw D ((e : ℤ) + 1))) := hf
  obtain ⟨k, hk, hcard⟩ := Kum.lenOfCard l (H2 (zlTw D ((e : ℤ) + 1)))
  have hv : VLen D (e : ℤ) = (k : ℕ∞) := hk
  have hsha := PropA.shaLeV hP hF hT L (AlgebraicClosure L) l
    (LDataCardLeFinrank.ptCase_of_isTotallyComplex L l) D (e : ℤ)
  rw [LDataCardLeFinrank.shaLen_eq_shaInv, hv] at hsha
  have hsfin : shaInv L l (e : ℤ) ≠ ⊤ :=
    ne_top_of_le_ne_top (ENat.coe_ne_top _) hsha
  obtain ⟨s, hs⟩ := ENat.ne_top_iff_exists.1 hsfin
  refine ⟨s, hs.symm, ?_⟩
  rw [← hs] at hsha
  have hsk' : s ≤ k := by exact_mod_cast hsha
  have hsk : (s : ℝ) ≤ k := by exact_mod_cast hsk'
  rw [hcard] at hlog
  push_cast at hlog
  rw [Real.log_pow] at hlog
  have hl : 0 ≤ Real.log (l : ℝ) :=
    Real.log_nonneg (by exact_mod_cast (Fact.out : l.Prime).one_lt.le)
  exact (mul_le_mul_of_nonneg_right hsk hl).trans hlog

theorem both_of_bridge39
    (hP : GlobalTheory.Published.PoitouTateDuality)
    (hF : LocalFinitenessK) (hT : LocalTateDualityK)
    (hB : UpperTheory.V.K.KBridge) :
    ∃ C : ℝ, LemmaK C ∧ UpperTheory.V.ZK.ShaK C := by
  obtain ⟨C, _, hK⟩ := UpperTheory.V.K.lemmaK hP hF hT hB
  exact ⟨C, hK, sha_of_lemmaK39 hP hF hT hK⟩

theorem window_shared39 (hH : _root_.UpperTheory.V.Af.HypothesesH')
    (hB : UpperTheory.V.K.KBridge) : VWin := by
  obtain ⟨C, hKC, hSC⟩ := both_of_bridge39
    (_root_.UpperTheory.V.HV.U.pt_s hH.litN) hH.litN.coh.lfK hH.litN.coh.ltK hB
  have hK : ∃ CK : ℝ, LemmaK CK := ⟨C, hKC⟩
  have hSha : ∃ C : ℝ, UpperTheory.V.ZK.ShaK C := ⟨C, hSC⟩
  have hE := _root_.UpperTheory.V.Z.Win.Dn.ends0_alt hH
  have h4 := _root_.UpperTheory.V.HV.DescentVanishingReductions.countII_and_countIII_of_printsH_of_sp4In hH hK (_root_.UpperTheory.V.HV.DescentVanishingReductions.sp4In0_alt hH)
  exact _root_.UpperTheory.V.HV.Core.core_sha40 hH.litN hSha hK (_root_.UpperTheory.V.Z.J.count_i_of_printed_bound_k_kato_automorphy hH hK (_root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.katoTwoW_of_printsH hH) (_root_.UpperTheory.V.HV.Core0.automorphyUnramified_of_litN_of_gdEnd hH.litN hE.1)) h4.1 h4.2 (_root_.UpperTheory.V.Z.J.count_v_of_printed_bound_k_reduced_unitary_lift hH hK hE.2)

theorem replay_window_shared39 (hH : _root_.UpperTheory.V.Af.HypothesesH')
    (hB : UpperTheory.V.K.KBridge) : VWin := by
  first
  | (rh_reduce 2 using [window_shared39]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact window_shared39 hH hB

end RHLiterature39

rh_scan UpperTheory.V.HV.DescentVanishingReductions.vwin_of_hypotheses_H_E_alt limit 2000
rh_scan RHLiterature39.both_of_bridge39 limit 2000
rh_scan RHLiterature39.window_shared39 limit 2000
rh_prune RHLiterature39.replay_window_shared39 as RHLiterature39.ReplayWindowPruned
#print axioms UpperTheory.V.K.lemmaK
#print axioms UpperTheory.V.PropA.shaLeV
#print axioms RHLiterature39.sha_of_lemmaK39
#print axioms RHLiterature39.both_of_bridge39
#print axioms RHLiterature39.window_shared39
#print axioms RHLiterature39.replay_window_shared39
