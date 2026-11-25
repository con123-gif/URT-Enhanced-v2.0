import CompanionTheory.AutomorphicTheory.SiegelUnitTheory.VolumeSignatureIndependent
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN35 — actual signature-volume supplier and one-host replacement.
25 Nov 2026. SOURCE-MATCHED / PREPARED, NOT compiled. RH OPEN.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed HEAD
91b273530883b723ef4422436e0dc3557749325a. Mission cd0a176134d46b5b624896e56843a24915c14477
read first, AGENTS, SWARM, HANDOFF, EXPANSION, continuity and shared proof
464e82f81f646d4af85e1f5f70d379026df46261 inspected (long files in part).
RUN34 1a1774df; prior integration 95545ee1, editor 3e1000ef,
recent integration 22dbf375, 620547cb, audit dc06e2cf and peer commit
heads inspected. No duplicate new mass formula or prime-window detour.

## Actual pinned supplier (not a postulate)
CompanionTheory.HU.volume_signature_independent has body
volSigIndep_of siegel_mass_rank_one. In ClassNumberMass the latter is
volSigIndep_of_hU (hU_of h). The actual quotient bridge reties the SAME
D before calling its tied volume lemma. Retie modifies vol, dsig,
s.cdScale and gx, not the host, spaces, eTau, cd or actual lattice.
Do not replace retie D by arbitrary D, nor identify D.vol with trueVol
without VolTie D. The original proof calls volumeMass_of_unfolding
then vol_eq_massI_all_sig at both W and W0. Their ranks coincide by
sig_sum at phi0. Therefore the entire global quantifier in
volSigIndep_of_hU is consumed ONLY at retie D for a fixed D:
    MassRatioUnderVolume(retie D) => VolSigIndep(D).
The replacement below copies and specializes the two source bodies.
The universal supplier remains necessary at any family of such D unless
a uniform same-family proof is supplied. Other consumers of
mass_ratio_under_volume and rank-one Siegel-Weil are retained.
In particular the original supplier also handles negative rank one
and rank zero; no accidental positive-rank premise added here.

## Short classical alternative to absolute Tamagawa computation
The ordinary adelic argument from RUN33/34 and 95545ee1 can avoid
computing tau(U(W))=2 entirely. For fixed E/F and rank n>0, the two
unitary groups are inner forms: over the quadratic splitting field E
they both become GL_n. For a Hermitian matrix J the descent action is
g -> J^(-1) transpose(g^(-1)) J, with the Galois action on coefficients
understood. Changing J to J0 changes this action by the inner
automorphism Ad(J0^(-1) J); both have determinant norm-one torus.
Kottwitz, Tamagawa numbers, Ann. Math. 127 (1988), 629–646,
https://annals.math.princeton.edu/1988/127-3/p05
(DOI 10.2307/2007007), proves invariance for connected reductive groups
over number fields under inner twisting. Bibliographic original page
and zbMATH review statement inspected:
https://portal.mardi4nfdi.de/wiki/Item:Q1123997 .
Full article not read. This is the precise equality needed, not the
stronger absolute Tamagawa-number formula. The ordinary local
trace-density comparison in 95545ee1/RUN33 gives a single multiplier
a(F,E,n)>0 from Tamagawa Haar to native normalized Haar (depending
also on the common compact cd convention), independent of J.
Thus
    vol_native(W)/vol_native(W0) = tau(U(W))/tau(U(W0)) = 1.
Finite factors use perfect unimodular O_E lattices and everywhere
finite-unramified E/F; real factors use exactly one CM embedding per
place and the same cd(P,Q) density as its compact dual. The determinant
torus convergence factor and discriminant are common, so cancel before
taking norms or products. Rank zero is the trivial group. No rational
isometry between different signatures is assumed. Native IsVolMeas/HA
transport still needs independent validation; this is a concise human
route conditional on that transport, not a verified Lean replacement.

## Graph, exact pins and verification
Original source-visible:
volume_signature_independent -> siegel_mass_rank_one -> sw1b2;
volume_signature_independent -> volSigIndep_of -> volSigIndep_of_hU
 -> volMeas_fundDomain_eq_of_tiedIndep -> retie_volTieG_and_cdScaleTie;
volSigIndep_of_hU -> volumeMass_of_unfolding -> vol_eq_massI_all_sig;
hU_of -> volumeRatio -> volumeRatio_of_unfolding and density suppliers.
Candidate: MassRatioUnderVolume(retie D) + original retie and
all-signatures bridges -> VolSigIndep(D) -> actual downstream
vol_eq_of_indep / volRatioTrue_of_indep / packet consumers.
Alternative human branch: same-host native transport + Kottwitz inner
invariance + common multiplier -> VolSigIndep. Preserve all original
edges and unresolved kernel/constructor/axiom edges. Cache by
(pin, toolchain, D, retie D, host, W, W0, rank, signatures, measures).
No globally retired node. Root reachability of this specific Companion
producer is not yet authenticated by an elaborated root scan.
Backtrack to original upstream rank-one supplier if native replacement fails.

30 exact pinned blob/anchor assertions executed:
src/CompanionTheory/AutomorphicTheory/SiegelUnitTheory/
 VolumeSignatureIndependent.lean afe9722dfbc1755ed666f65e6ad326d2f9e6d448
 ClassNumberMass.lean 876b21bddae05ca7f0d60c86d28f01e592c2f9da
 UnitsAinf.lean b00bb531116ba378b9c6521d891bc7737be7e717 (body read)
src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/
 AdelicQuotientVolumeEqOfSignatureRankIndep.lean 5df13f58118a8edd91ceed1143cf20581f71a1ec
 VolumeRatio.lean 2c0102e38f7e31a7132366fdfe495a6b09402738
 UnitaryVolumeEqRankMassAllSignatures.lean f89432ccb0f9833b7df3cf9544db89a4e3298ca8
src/Development/AbelianVarietyTheory/Definitions/AutomorphicMembership/
 Retie.lean 58dad0a4462e2fd50a48d516db7ab10d6e94fe56
src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/
 RetieVolTieGAndCdScaleTie.lean feaec7a8669f85e8ec03f9bf768e3af0fb520c87
Head comparison: five of seven checked files changed even ignoring
whitespace; ClassNumberMass and AdelicQuotientVolumeEqOfSignatureRankIndep
returned 404 at head. Keep pin; no inference of mathematical change.
Baseline CI status JSON retrieved: 45577239749 and 45576756833 returncode 0,
not validation of this file. Local lean/lake absent on PATH. No native
compilation, no new axiom output, no URT performance claim.
Native scan, prune, reduction/backtracking below prepared for exact pin,
Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

RESUME HERE: batch-check RUN33–35 and the original Companion producer;
use the native transport suppliers in VolumeRatioOfUnfolding (arch,
exists_realAdele_coordinates_cmType, IsSelfDualLatticeIff, etc.) rather
than rebuilding all transports. Check root caller and Kottwitz citation
independently; retain signed interval [-2L,m] and all separate exact-mass
consumers until verified. HANDOFF TO integration/editor/kernel/audit.
-/ 

noncomputable section
namespace RHPositivity35
open Formalism.BasicNotions Formalism.MainNotions
open Formalism.MainNotions.StandardLattice
open Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes
open Formalism.L2.GlobalTheoryTheory.GenusMassVolumes
open MeasureTheory
attribute [local instance] Formalism.BasicNotions.Host.cmStar

theorem sigIndep_of_one_retied_host (D : D7)
    (hU : RT.MassRatioUnderVolume (GlobalTheory.Mem.retie D)) :
    VolSigIndep D := by
  intro W W₀ P Q P₀ Q₀ hW hW₀ hs hs₀ hr μ 𝓕 μ₀ 𝓕₀ hμ h𝓕 hμ₀ h𝓕₀
  have hT : VolTie (GlobalTheory.Mem.retie D) :=
    Formalism.L2.Theta.VolTieG.volTie
      (GlobalTheory.Mem.retie_volTieG_and_cdScaleTie D).1
  have e1 : μ 𝓕 = ENNReal.ofReal ((GlobalTheory.Mem.retie D).vol W) :=
    ((hT W P Q hW hs).2 μ hμ).2 𝓕 h𝓕
  have e2 : μ₀ 𝓕₀ = ENNReal.ofReal ((GlobalTheory.Mem.retie D).vol W₀) :=
    ((hT W₀ P₀ Q₀ hW₀ hs₀).2 μ₀ hμ₀).2 𝓕₀ h𝓕₀
  have h2 := volumeMass_of_unfolding (GlobalTheory.Mem.retie D) (hU hT)
  have er1 := Formalism.BasicNotions.sig_sum W hW D.host.φ₀
  have er2 := Formalism.BasicNotions.sig_sum W₀ hW₀ D.host.φ₀
  rw [hs] at er1
  rw [hs₀] at er2
  rw [e1, e2,
    GlobalTheory.Glob.vol_eq_massI_all_sig _ hT h2 W P Q hW hs,
    GlobalTheory.Glob.vol_eq_massI_all_sig _ hT h2 W₀ P₀ Q₀ hW₀ hs₀]
  congr 1
  simp only at er1 er2
  omega

theorem original_bridge (h : ∀ D : D7, RT.MassRatioUnderVolume D)
    (D : D7) : VolSigIndep D := by
  first
  | (rh_reduce 3 using [sigIndep_of_one_retied_host]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact sigIndep_of_one_retied_host D (h (GlobalTheory.Mem.retie D))

rh_scan CompanionTheory.HU.volume_signature_independent limit 2000
rh_scan sigIndep_of_one_retied_host limit 2000
rh_prune sigIndep_of_one_retied_host as RH35OneHostPruned
#print axioms CompanionTheory.HU.volume_signature_independent
#print axioms CompanionTheory.HU.siegel_mass_rank_one
#print axioms sigIndep_of_one_retied_host
#print axioms original_bridge
end RHPositivity35
