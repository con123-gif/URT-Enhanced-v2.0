import RUN38_NATIVE_INERTIA_EXPONENT
import RHAudit37CaseI
import Development.AutomorphicArithmetic.AutomorphicVarieties.TheoremsMuLinked.GaloisRepresentationTypes.IntIffNorm
import Development.AutomorphicArithmetic.AutomorphicVarieties.HeightAndVanishing.GdOfHost
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN39 lane 5, 25 Nov 2026. SOURCE-MATCHED human derivation / PREPARED,
NOT COMPILED. Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 (latest
mandatory engine), SWARM 4b77b161, HANDOFF bbc46df7, EXPANSION c8152d07,
AGENTS 8db0201d, continuity/state/log/protocol openings and CI read.
Peers c7e8eb61, 30a2c2d9, 4fd3152d, 46e9230b, 2785c414, 989910ad
and 32ae80bb reviewed; prior lane b2536f01, audit 21574277.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; latest upstream observed
756a70250dcba9162b99d4ea35c186558434c17e (21:25:34 UTC), not substituted.
Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

RESULT: discharge the two remaining HUMAN transport premises of
RUN37 (bounded coefficients and equality of characteristic-zero
traces) directly from the native source. No choice of an integral
conjugator or new residue-field extension. The exact native
int_iff_norm (private, IntIffNorm) applied to the finite c.O
subalgebra gives ||j z||<=1 for every z in c.O. RepIso supplies
rho'=P rho P^-1; cyclicity gives tr rho'=tr rho. Hence, with
x=u+1+u^-1 and y=v+1+v^-1 in c.O, RUN35 yields
    ||j(x-y)|| <= max(||tr rho-j x||,||tr rho'-j y||) < 1.
RUN37 residue_of_small then gives red x=red y. Remove the common
1 BEFORE applying RUN34 factorization. RUN38 excludes inversion
using the existing native CaseI guard; RUN37 descends equality.
The audit's native_caseI_ramified_not_exception removes the
remaining host guard; gdOfHost supplies GD for every psi in the
actual h.X, not separately chosen host characters.

This is a direct proof of the hsep interface at the RUN36
singleton_block_budget consumer, conditional only on its existing
residual congruence predicate for the two selected representations
and the original host hypotheses. Together the two reference primes
give the proposed 2 log B aggregate, conditional on all prior
supplier proofs and the uncompiled consumer. Do not identify the
host-dependent p=1 mod 210N with the native fixed r_i<q1,d.
Retain Linnik, two-prime patch and actual principal caller bridge.
The original native CountI route remains intact.

Original graph (selected source edges): CountI -> CorGK ->
PropGK -> NumberU3U_s + OneCharU_s, orbitwise sum. Candidate:
OneCharU_res35 -> Res36; RepIso -> cyclic trace;
Coef.fin -> native int_iff_norm -> bounded coefficients;
both -> RUN37 residue_reference_trace_eq -> RUN38 trace separation;
gdOfHost + audit CaseI -> hsep on h.X -> RUN36 singleton consumer.
All original type/value/constructor edges, axiom evidence and
unexpanded leaves retained. Cache pin/toolchain/h,t,N,e,l,c,
Omega,K,psi,psi',rho,rho',same reference witness and role.
Backtrack to original orbit route if replay fails. No URT used.

Source ledger (relative src/Development/AutomorphicArithmetic/AutomorphicVarieties/):
TheoremsMuLinked/GaloisRepresentationTypes/IntIffNorm.lean 659dbc2aea0bd4d1f23c354902f799d052505f96
GaloisLibrary/CrystallineBaseChange/TwCard.lean b68d8fe98a575e5f111442842e699ecb8bfab638
ModularityArgument/ThresholdArguments/DenseThresholdCases/FOneCharU.lean 3560d196d696e5ebceded72e747a060392837b91
ModularityArgument/ThresholdArguments/DenseThresholdCases/FPropGKU.lean 4887bdf435a54a8ab856102e15d60da39d041970
UnitaryThreeGroups/CountI.lean 9e3faf892430e58c8d5f8d92e4196d838346c674
HeightAndVanishing/GdOfHost.lean 8ab8e7e79a09e2d7f00292d525733fac8badfae2
ModularityArgument/ThresholdArguments/DenseThresholdCases/NumberU3US.lean b31b9a1b9f3e84a792e915f864c681034c9eb258
Audit blob 9563a7d39fb63a52afe85cc48d4c5b17656d7b96.
Executed 21 fail-on-error connector JS source checks
(7 pinned hashes and literal anchors plus audit theorem).
No local Lean/lake (command -v both empty). Fetched Actions
45577239749 and 45576756833: completed/success, status blobs
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717; baseline engines ONLY.
Latest orchestrator 45704237064 pending, prior 45703603380 cancelled.
No new CI for this file; no new axiom evidence or kernel closure.
Replay in the existing warmed pinned source environment:
stage RUN34-38 as their original module names; stage audit file
2026-11-25_RUN37_COUNTI_EXCEPTION_EMPTY.lean as RHAudit37CaseI.lean
after RUN36. Compile engines and predecessors before this file;
preserve each actual compiler log and failure. Existing arithmetic
frontier compute pass is an index, not a compile of these overlays.
No protected workflow or registry changed.

RESUME HERE: native replay RUN34-39, first independently checking
coef_norm and repIso_trace; if earlier overlays fail, extract these
two lemmas into a file importing only pinned native modules.
Then use native_host_hsep at singleton_block_budget with S=h.X;
verify original-statement bridges, axiom/type/value/constructor
ledger and the actual principal CountI caller. All nine residual
supplier inputs, NumberU3U_s and other same-host VWin leaves remain.
HANDOFF TO integration, kernel, formal audit. RH OPEN.
-/

open private int_iff_norm from Development.AutomorphicArithmetic.AutomorphicVarieties.TheoremsMuLinked.GaloisRepresentationTypes.IntIffNorm
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual
open ReciprocityTheory.Gal Formalism.GaloisCohomology IsLocalRing
open UpperTheory.V UpperTheory.V.Base UpperTheory.V.HV UpperTheory.V.U3
open UpperTheory.V.Z.J Matrix

namespace RHGalois39
noncomputable section

theorem coef_norm (l : ℕ) [Fact l.Prime] (c : Coef l) (z : c.O) :
    ‖algebraMap c.O (PadicAlgCl l) z‖ ≤ 1 := by
  haveI := c.fin
  exact (int_iff_norm _).mp
    ((Algebra.IsIntegral.isIntegral (R := ℤ_[l]) z).map c.O.val)

theorem repIso_trace {G k : Type*} [Group G] [Field k] {n : ℕ}
    {r r' : G →* GL (Fin n) k} (h : Af.RepIso r r') (s : G) :
    (r s : Matrix (Fin n) (Fin n) k).trace =
      (r' s : Matrix (Fin n) (Fin n) k).trace := by
  obtain ⟨P,hP⟩ := h
  have hh := congrArg (fun A : GL (Fin n) k =>
    (A : Matrix (Fin n) (Fin n) k).trace) (hP s)
  simp only [Units.val_mul] at hh
  have hc : (((P : Matrix (Fin n) (Fin n) k) *
      (r s : Matrix (Fin n) (Fin n) k)) *
      ((P⁻¹ : GL (Fin n) k) : Matrix (Fin n) (Fin n) k)).trace =
      (r s : Matrix (Fin n) (Fin n) k).trace := by
    rw [Matrix.trace_mul_comm, ← mul_assoc, ← Units.val_mul,
      Units.inv_mul, Units.val_one, one_mul]
  exact (hh.trans hc).symm

theorem residual_sep
    (Ω : Type) [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω]
    (K : Type) [Field K] [NumberField K] [Algebra K Ω] [IsAlgClosure K Ω]
    (l : ℕ) [Fact l.Prime] (c : Coef l) (N : ℕ) [NeZero N] (e : ℕ)
    (ψ ψ' : DirichletCharacter c.O N)
    (hG : GD Ω K l e ψ) (hG' : GD Ω K l e ψ')
    (hguard : ¬ l ∣ N ∨ ¬ l - 1 ∣ 4 * e)
    (ρ ρ' : G K Ω →* GL (Fin 3) (Qbar l))
    (hr : RHGalois36.Res36 Ω K l c N e ψ ρ)
    (hr' : RHGalois36.Res36 Ω K l c N e ψ' ρ')
    (hi : Af.RepIso ρ ρ') : ψ = ψ' := by
  haveI := c.dvr
  haveI := c.fin
  let P := (Chr.Psi l e (Chr.dirG ℚ Ω ψ)).comp (galEmb ℚ K Ω)
  let Q := (Chr.Psi l e (Chr.dirG ℚ Ω ψ')).comp (galEmb ℚ K Ω)
  let R := (Units.map (residue c.O).toMonoidHom)
  let a := R.comp P
  let b := R.comp Q
  apply RHGalois38.character_of_residual_traces Ω K l c N e ψ ψ'
    hG hG' hguard a b (fun _ => rfl) (fun _ => rfl)
  intro g
  let x : c.O := (P g : c.O) + 1 + ((P g)⁻¹ : c.Oˣ)
  let y : c.O := (Q g : c.O) + 1 + ((Q g)⁻¹ : c.Oˣ)
  let j := algebraMap c.O (PadicAlgCl l)
  let T : Qbar l := (ρ g : Matrix (Fin 3) (Fin 3) (Qbar l)).trace
  have htr : T = (ρ' g : Matrix (Fin 3) (Fin 3) (Qbar l)).trace :=
    repIso_trace hi g
  have hx : ‖T - j x‖ < 1 := by
    dsimp only [x,T]
    rw [map_add, map_add, map_one]
    have hh := hr g
    dsimp only at hh
    simpa only [P, MonoidHom.comp_apply, map_inv] using hh
  have hy : ‖T - j y‖ < 1 := by
    rw [htr]
    dsimp only [y]
    rw [map_add, map_add, map_one]
    have hh := hr' g
    dsimp only at hh
    simpa only [Q, MonoidHom.comp_apply, map_inv] using hh
  have hred := RHGalois37.residue_reference_trace_eq j
    (coef_norm l c) x y T hx hy
  have he : (a g : ResidueField c.O) + 1 + (a g : ResidueField c.O)⁻¹ =
      (b g : ResidueField c.O) + 1 + (b g : ResidueField c.O)⁻¹ := by
    simpa [x,y,a,b,R,map_inv] using hred
  linear_combination he

theorem native_host_hsep
    (h : Host) (t : ℕ) (hBig : h.Big t)
    (Ω : Type) [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω]
    [Algebra (Kstar (pK h.chi)) Ω] [IsAlgClosure (Kstar (pK h.chi)) Ω]
    (l : ℕ) [Fact l.Prime] (c : Coef l) (e : ℕ)
    (hl2 : l ≠ 2) (he : 0 < e) (het : e < t) (hI : h.CaseI l e)
    (ψ ψ' : DirichletCharacter c.O h.N)
    (hψ : ψ ∈ h.X c e) (hψ' : ψ' ∈ h.X c e)
    (ρ ρ' : G (Kstar (pK h.chi)) Ω →* GL (Fin 3) (Qbar l))
    (hr : RHGalois36.Res36 Ω (Kstar (pK h.chi)) l c h.N e ψ ρ)
    (hr' : RHGalois36.Res36 Ω (Kstar (pK h.chi)) l c h.N e ψ' ρ')
    (hi : Af.RepIso ρ ρ') : ψ = ψ' := by
  obtain ⟨hchar,hpar⟩ := (Host.mem_X h).1 hψ
  obtain ⟨hchar',hpar'⟩ := (Host.mem_X h).1 hψ'
  have hG := gdOfHost h t hBig Ω l e hl2 he het hI _ ψ hchar hpar
  have hG' := gdOfHost h t hBig Ω l e hl2 he het hI _ ψ' hchar' hpar'
  have hguard : ¬ l ∣ h.N ∨ ¬ l - 1 ∣ 4 * e := by
    by_cases hn : l ∣ h.N
    · exact Or.inr (RHAudit37.native_caseI_ramified_not_exception
        h t l e hBig Fact.out hl2 hI hn)
    · exact Or.inl hn
  first | (rh_reduce 2 using [residual_sep]; done)
        | exact residual_sep Ω (Kstar (pK h.chi)) l c h.N e ψ ψ'
            hG hG' hguard ρ ρ' hr hr' hi

end
end RHGalois39

rh_scan UpperTheory.V.U3.countI limit 2000
rh_scan RHGalois39.native_host_hsep limit 2000
rh_prune RHGalois39.native_host_hsep as RH39HostSepPruned
#print axioms RHGalois39.coef_norm
#print axioms RHGalois39.repIso_trace
#print axioms RHGalois39.residual_sep
#print axioms RHGalois39.native_host_hsep

-- Search/backtrack in the actual coefficient context.
open UpperTheory.V.HV in
example (l : ℕ) [Fact l.Prime] (c : Coef l) (z : c.O) :
    ‖algebraMap c.O (PadicAlgCl l) z‖ ≤ 1 := by
  first | (rh_auto 2; done)
        | (rh_auto_frontier 2; done)
        | exact RHGalois39.coef_norm l c z
