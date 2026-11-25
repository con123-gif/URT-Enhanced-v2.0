import Formalism.GL3MeanSquares.GenusMeanAsymptotics.JacobiCharacterSums.PNTDHB
import Formalism.GL3MeanSquares.GenusMeanAsymptotics.JacobiCharacterSums.PNTFinal
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# RUN32: derive DHPos from the already-needed DHDom, not a second analytic proof.
25 Nov 2026 — lane 6, SOURCE-MATCHED human proof; Lean replay PREPARED ONLY.
Mission latest blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc, including
mandatory engine and later human-proof priority; live proof 464e82f81f646d4af85e1f5f70d379026df46261.
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, continuity and
state/log/protocol excerpts, CI summary 45631414002; RUN31 5d85634d.
Peer handoffs reviewed Galois 46c378ee, prime b158e108, Landau 141537e1,
theta 3c6f175e, structure c8e071b1; no duplicate in these. Upstream HEAD
d91ae2678eea19a0c3045ffca37f1da757c2e719; no HEAD sources mixed.

## Compact proof for integration
Use pin 40e56bab026552e089d7afcfeff08d2defb9c005. The actual lossy DH theorem is a composition
of Turan, DHIneqF and DHPrime; the four-derivative positivity input to
DHIneqF is redundant when DHDom is already available.

For arbitrary M with NeZero, quadratic (not necessarily nonprincipal
here) chi1, any chi, gamma real, sigma>1, k>=0, put
D(psi,s)=(-1)^k (d/ds)^k[-L'(psi,s)/L(psi,s)].
A=D(1,sigma)+D(chi1,sigma),
B=D(chi,sigma+i gamma)+D(chi chi1,sigma+i gamma).
DHDom states |B|<=Re A (the unsigned shifted derivative norm agrees
because |(-1)^k|=1). Hence
  Re(A+B) >= Re A - |B| >= 0.                 [*]
This is exactly DHPos, with all the original parameters, no extra
nonprincipal, conductor, zero or height conditions. It uses the SAME
DHDom already consumed by deuring_heilbronn_inequality; no separate
four-series proof is required. Conversely scalar positivity alone
does not imply domination (A=1,B=2); do not replace DHDom by DHPos.

In ordinary mathematics DHDom itself follows from absolute convergence
at sigma>1: at a unit n the two series use the common nonnegative
weight w_n=Lambda(n)(log n)^k n^(-sigma)(1+chi1(n)).
The unshifted pair is sum w_n; the shifted pair is sum
w_n chi(n) exp(-i gamma log n), whose norm is at most sum w_n.
At nonunits all characters are zero (including the principal one),
so set w_n=0 there, rather than treating the principal character as
constant 1 on nonunits. This is precisely the native dhDom_term_le
and HasSum.norm_le_of_bounded argument; cancellation before norms.
Use absolute convergence for every fixed k by sigma>1 (polynomial
log weights preserve convergence to the right of one).
This is a concise reconstruction of the two analytic inputs at once.

Consequently DHIneqF can be supplied from only DHLocal and DHDom,
by invoking the native deuring_heilbronn_inequality with [*]. The
original DHIneqFOf and DeuringHeilbronnMB types are unchanged.
The exact actual lossy DH theorem can be reassembled with that bridge.
The native final theorem uses B=3 and still needs Turan power-sum,
DHLocal (Cauchy), DHPrime (hyperbola, L(1) exceptional bound,
Mertens), excBound(1/2), region_gap, and core2. Preserve every
zero, exceptional pair, positivity, height and multiplicity condition,
and the uniform quantifiers. No claim to close the RH inequality.

## Source and dependency ledger
J=src/Formalism/GL3MeanSquares/GenusMeanAsymptotics/JacobiCharacterSums/.
PNTDHSt.lean 141872758ce4b4347718a5517f115d7034b88716
DHFinish2Of.lean c22676665e421256b004db6847e94fc45e8693e9
PNTDHIneqF.lean a2c6d171166646f351ca98b8873dee8b1ad6d21f
PNTDHB.lean 96eaf0e7239e3768fa6627f3ead6c1e2805d0abf
PNTDHDom.lean 2ede92572b318ddcfa7109a83ab06e0bf8db5cc4
PNTDHPos.lean 5523ab159649199799c7c274350be4a924eec5e7
PNTFinal.lean 616aec99297d346eb1570dc53468c5e9bf79886c
PNTDHBSt.lean 7466805c5bbd5a7d1aa2693973b04051939151fe
DeuringHeilbronnFinishTuran.lean 11352304975f13f21f84b86ee32063f2a9e2e32e
PNTDHPrime.lean 36282a6bea7ecc5c5881df11931e19a229d944db
PNTDHFinish.lean a863d39c1105b1752a3832c30e4a61555f918495.
Upstream source-visible path from RUN26-31:
MeanSquareBounds/twistK.lean 07e569eaf54b3b91fedad4117991838a23b93603
 -> pnt_progressions_relative_weak_holds -> deuringHeilbronnMB_proof'
 -> deuring_heilbronn_lossy -> deuring_heilbronn_inequality.
This is a local continuation of the character-pair producer, not new
elaborated Main-root evidence. Retain prior graph and pending nodes.

Original local value-call overlay:
lossy -> finish_turan, turan_power_sum_bound, inequality,
  positivity, local, cauchy, dominant, prime_sum, hypergeometric.
inequality -> hPos and hDom at the same M,chi1,chi,rho.im,1+eta,k.
Reduced:
lossy_reassembled -> finish_turan, turan_power_sum_bound,
  inequality_from_dom, local, cauchy, dominant, prime_sum, hypergeometric;
inequality_from_dom -> original inequality, pos_of_dom, hDom, hLoc.
pos_of_dom -> hDom, elementary norm and real-part inequalities.
No direct call to deuring_heilbronn_positivity in replacement.
The DHDom module imports PNTDHPos; imports are not proof-value edges.
Other consumers of positivity, original types, constructors, axioms,
and unexpanded dependencies are untouched. Do not infer global
deletion or a Lean proof-term drop before replay. Cache key
(pin,M,chi1,chi,gamma,sigma,k,hsq,hsigma) includes actual context;
cannot share domination across a different parameter tuple without
instantiating its universal premise again. Backtrack to original
if caller replay fails. No URT performance claim.

Executed in connector isolate: 27 pinned blob/string assertions,
one exact integer scalar converse counterexample. No sampled zeros
or synthetic physics; mathematical implication [*] is the proof.
Local command -v lean/lake found neither. Retrieved published prior
CI statuses: 45577239749 pass 98.87s, blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc;
45576756833 pass 77.94s, blob 7da354941e402b6f8b364ed03d8c5c82d27b7717.
Prior root and engine axiom evidence propext, Classical.choice,
Quot.sound; 324 pending scan names. No new CI or kernel PASS.
Commands below prepared for native replay; root adapter remains
conditional. Native replay must audit both original and new axiom lists.

RESUME HERE: inspect TuranPowerSumBounds.core2 from the actual
DeuringHeilbronnFinishTuran theorem; determine which of the j-dependent
three prime-sum errors are needed at the selected Turan index only,
preserving the existential index, exceptional gap and B=3.
Kernel lane: replay pos_of_dom, inequality_from_dom and lossy_reassembled,
compare value/type/structural edges and axioms to originals; retain
any previously unexpanded nodes. Integrate the single proof block [*].
HANDOFF TO integration/editor, formal audit, kernel, character boxes.
RH OPEN; decisive native G bound not proved by this local reduction.
-/

noncomputable section

namespace Formalism.HermitianLattices.Ext.PrimesInProgressions
namespace RHCharacterBoxes32

theorem pos_of_dom (h : DHDom) : DHPos := by
  intro M _ χ₁ χ γ σ k hsq hσ
  let A : ℂ := iteratedDeriv k (negLD (1 : DirichletCharacter ℂ M)) (σ : ℂ) +
    iteratedDeriv k (negLD χ₁) (σ : ℂ)
  let B : ℂ := iteratedDeriv k (negLD χ) ((σ : ℂ) + γ * I) +
    iteratedDeriv k (negLD (χ * χ₁)) ((σ : ℂ) + γ * I)
  have hAB : ‖B‖ ≤ ((-1 : ℂ)^k * A).re := h M χ₁ χ γ σ k hsq hσ
  have hz : ‖(-1 : ℂ)^k‖ = 1 := by simp
  have hB : - ((-1 : ℂ)^k * B).re ≤ ‖B‖ := by
    calc
      - ((-1 : ℂ)^k * B).re = (-((-1 : ℂ)^k * B)).re := by rw [Complex.neg_re]
      _ ≤ ‖-((-1 : ℂ)^k * B)‖ := Complex.re_le_norm _
      _ = ‖B‖ := by rw [norm_neg, norm_mul, hz, one_mul]
  have hs : 0 ≤ ((-1 : ℂ)^k * A).re + ((-1 : ℂ)^k * B).re := by
    linarith
  simpa only [A, B, mul_add, Complex.add_re, add_assoc] using hs

theorem inequality_from_dom (hl : DHLocal) (hd : DHDom) : DHIneqF := by
  exact deuring_heilbronn_inequality (pos_of_dom hd) hl hd

theorem original_inequality_bridge : DHIneqFOf := by
  intro _ hl hd
  exact inequality_from_dom hl hd

theorem replay (hl : DHLocal) (hd : DHDom) : DHIneqF := by
  first | (rh_reduce 3 using [inequality_from_dom]; done)
        | (rh_auto_frontier 2; done)
        | (rh_auto 3; done)
        | exact inequality_from_dom hl hd

theorem lossy_reassembled : DeuringHeilbronnMB :=
  deuring_heilbronn_finish_turan turan_power_sum_bound
    (inequality_from_dom (deuring_heilbronn_local deuring_heilbronn_cauchy)
      deuring_heilbronn_dominant)
    (deuring_heilbronn_prime_sum deuring_heilbronn_hypergeometric)

end RHCharacterBoxes32
end Formalism.HermitianLattices.Ext.PrimesInProgressions

rh_scan Formalism.HermitianLattices.Ext.PrimesInProgressions.deuring_heilbronn_lossy limit 2000
rh_scan Formalism.HermitianLattices.Ext.PrimesInProgressions.RHCharacterBoxes32.lossy_reassembled limit 2000
rh_prune Formalism.HermitianLattices.Ext.PrimesInProgressions.deuring_heilbronn_inequality as RHDH32OriginalPruned
rh_prune Formalism.HermitianLattices.Ext.PrimesInProgressions.RHCharacterBoxes32.original_inequality_bridge as RHDH32BridgePruned
#print axioms Formalism.HermitianLattices.Ext.PrimesInProgressions.deuring_heilbronn_lossy
#print axioms Formalism.HermitianLattices.Ext.PrimesInProgressions.deuring_heilbronn_inequality
#print axioms Formalism.HermitianLattices.Ext.PrimesInProgressions.RHCharacterBoxes32.pos_of_dom
#print axioms Formalism.HermitianLattices.Ext.PrimesInProgressions.RHCharacterBoxes32.lossy_reassembled
