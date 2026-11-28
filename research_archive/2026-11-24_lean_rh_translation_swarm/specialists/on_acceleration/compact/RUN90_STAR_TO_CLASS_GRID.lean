import Run91PrincipalBridge
import New.Data.DataExist
import New.Endgame.ShortAndEnough
import Lean

/-!
RUN90 -- connect the combined sharp A/B/C star to the actual fixed-class
analytic endpoint, without leaving an extra GoodGrid hypothesis.
27 November 2026. PREPARED, not native replayed.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0;
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Old pin separate.
Mission/spine/ledger 3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read protocol, handoff, expansion and AGENTS; peer RUN82, RUN88, RUN90,
RUN91, signed residue audit. Prior RUN89 combined star blob
2b63642d821721c24f40e7acafc273ac9047600e.

Actual interface gap: prime RUN91 requires GoodGrid AND TailGrid.
RUN89 supplies the exact original star, conditional on its native supplier
replay. Native D1 exists_data gives admissible witnesses at EVERY large
real x. At x=k^4, keep the same D and choose the star witness from that D.
For fixed P and eta, choose X beyond the D1 eventual threshold and a natural
K>max(X,1). For k>=K, k^4>=k>=X. D1 gives D.x=k^4, log D.x1=(k^4)^(eta/6),
log(log D.b)=eta log(k^4), and towerDeg(s)/log D.b<=#thick. The definitions
D.x1=exp(D.logX1), D.b=exp(D.logB) convert these to precisely the RUN90
fields. The original and renamed remainder must be definitionally equal,
checked explicitly below, not merely inferred from their names.
Apply star to this SAME D, not a second selected record. This produces
GoodGrid with no additional mathematical premise beyond D1 and star.
Only TailGrid (ordinary fixed-modulus PNT, independently human-audited)
remains as a distinct analytic supplier. At the class bridge take eta=eps/2
as in RUN91. No uniformity across P or d is used. For a fully universal
star, the native RUN82 selected-window route also remains available and
may be shorter; this bridge is useful if the eventual star is restricted
to quartic endpoints. Do not treat this as a new proof of D1, star or PNT.

Source evidence: DataExist 634c6a1f88791a3bb770326785b70411e8289b41;
ShortAndEnough b99eea0689be372d84362c58272b705e104b6a3a;
prime RUN90 ab798deac49f97177fdcf38a9f35f00252b3cedc;
prime RUN91 353453b46301087343a0098d45e37e8572d2ca90.
Connector preflight executed: eight distinct exact interface anchors,
16/16 removed/duplicated-anchor negative controls rejected. Initial overly
broad anchor matched twice, then narrowed to the GoodGrid definition.
These are static source checks, not elaborated dependencies or timing.
Local lean/lake unavailable; native engines not executed.

Fresh native evidence, not inferred from job labels:
prime endpoint shared job 46081903735 status ERROR (cbae0e78caa2f178dfc040f45dcaddcf134f3ad7),
receipt 6d03bd681b2dcaa4bc9da6e5fcaf34e56f0b0df6. Adapter build exit 0
1648.28s, adapter compile exit 1 after 8.68s. The exact renamed
Data.run90Remainder_eq reports only the standard three axioms; pointwise
and endpoint contain sorryAx and are rejected. Adapter log
49027e598b1b33446f5ad243209527fb12a1f6e6: line157 Membership Nat (Set Real),
line163 unexpected token underscore. Analytic log
eb10cfb827f56083c65953b550270ad52101271f: hinge and log_correction standard
axioms, chord add_le_add_left orientation mismatch, unknown
Real.tendsto_rpow_atTop, ambiguous LFunction and principal-class cast
diagnostics. Remaining analytic candidates report sorryAx; bridge not run.
No verified whole module. Let prime lane repair its own actual diagnostics;
do not duplicate its build. A1/A2 status still ERROR 07a2b14930c38095e6771ae9ed1a10a3cf1bf678.

All root obligations remain open. Keep original/reduced graphs and pending
axiom evidence. New candidate source edges:
D1 + original star + definitional remainder bridge -> GoodGrid ->
class inputs (with TailGrid) -> RUN91 conditional root. No claimed RH
theorem import. The final connection to RUN89 is a separate one-line
consumer, given below as a comment until the supplier is accepted.

RESUME HERE: once repaired Run91PrincipalBridge and the shared original
ShortAndEnough/DataExist workspace are accepted, execute this file with
normal kernel checking and RUN90_CLASS_STAR_GUARDS_OK, checking both rfl
bridges and the four-root dependency audit; then instantiate hstar with
the accepted RUN89 theorem in a separate probe. Retain TailGrid until
independently supplied. No duplicate cold build or protected edits.
HANDOFF TO prime, kernel, integration, editor and audit.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module

namespace RHAcceleration90

theorem original_mainAsk_eq {P} (D : Data P) :
    D.run90MainAsk = D.mainAsk := rfl

theorem original_remainder_eq {P} (D : Data P) :
    D.run90Remainder = D.remainder := rfl

theorem good_grid_from_star (P : Parameters) (eta : ℝ)
    (he : 0 < eta / 6 ∧ eta < 1 / 100)
    (hstar : ∀ D : Data P, D.m * D.remainder ≤ D.logB ^ 2 * D.budget) :
    RHPrimeWindow90.GoodGrid P eta := by
  obtain ⟨X,hX⟩ := Filter.eventually_atTop.1 (exists_data P he.1 he.2)
  obtain ⟨K,hK⟩ := exists_nat_gt (max X 1)
  refine ⟨K, ?_⟩
  intro k hk
  have hk' : (K : ℝ) ≤ (k : ℝ) := by exact_mod_cast hk
  have h1 : (1 : ℝ) ≤ (k : ℝ) :=
    (le_max_right X 1).trans (hK.le.trans hk')
  have hpow : (k : ℝ) ≤ (k : ℝ)^4 := le_self_pow₀ h1 (by decide)
  have hXk : X ≤ (k : ℝ)^4 :=
    (le_max_left X 1).trans (hK.le.trans (hk'.trans hpow))
  obtain ⟨D,hx,hl,_,hb,ht⟩ := hX _ hXk
  simp only [Data.x₁, Real.log_exp] at hl
  simp only [Data.b, Real.log_exp] at hb ht
  refine ⟨D,hx,hl,hb,ht,?_⟩
  rw [original_remainder_eq D]
  exact hstar D

def ClassStar : Prop :=
  ∀ (P : Parameters), P.N₀ = 18480 →
    (P.d : ZMod 18480) = (9239 : ZMod 18480) →
    ∀ D : Data P, D.m * D.remainder ≤ D.logB ^ 2 * D.budget

def ClassTail : Prop :=
  ∀ (P : Parameters), P.N₀ = 18480 →
    (P.d : ZMod 18480) = (9239 : ZMod 18480) →
    ∀ eta : ℝ, 0 < eta / 6 ∧ eta < 1 / 100 →
      RHPrimeWindow90.TailGrid P eta

theorem class_inputs_from_star (hs : ClassStar) (ht : ClassTail) :
    RHPrimeWindow91.ClassGridInputs := by
  intro P hP hc eps he
  have he' : 0 < (eps/2)/6 ∧ eps/2 < 1/100 := by
    constructor <;> linarith [he.1,he.2]
  exact ⟨good_grid_from_star P (eps/2) he' (hs P hP hc),
    ht P hP hc (eps/2) he'⟩

theorem zeta_line_from_star_and_tail (hs : ClassStar) (ht : ClassTail) :
    RiemannZetaZerosOnLine :=
  RHPrimeWindow91.zeta_line_from_class_inputs (class_inputs_from_star hs ht)

/- Separate actual integration probe after accepted supplier replay:
import JointABCSharpRun89
import Run90StarToClassGrid
example (ht : RHAcceleration90.ClassTail) : RiemannZetaZerosOnLine :=
  RHAcceleration90.zeta_line_from_star_and_tail
    (fun P _ _ D => @run89_joint_sharp_star P D) ht
-/

end RHAcceleration90

#print axioms RHAcceleration90.original_mainAsk_eq
#print axioms RHAcceleration90.original_remainder_eq
#print axioms RHAcceleration90.good_grid_from_star
#print axioms RHAcceleration90.class_inputs_from_star
#print axioms RHAcceleration90.zeta_line_from_star_and_tail

run_cmd do
  let allowed : Array Lean.Name := #[``propext, ``Classical.choice, ``Quot.sound]
  for n in #[``RHAcceleration90.original_mainAsk_eq, ``RHAcceleration90.original_remainder_eq,
      ``RHAcceleration90.good_grid_from_star, ``RHAcceleration90.class_inputs_from_star,
      ``RHAcceleration90.zeta_line_from_star_and_tail] do
    let ax ← Lean.collectAxioms n
    unless ax.all (fun a => allowed.contains a) do
      Lean.throwError m!"RUN90 nonstandard axiom {n}: {ax}"
  for (n, required) in #[
      (``RHAcceleration90.good_grid_from_star,
        #[``exists_data, ``RHAcceleration90.original_remainder_eq]),
      (``RHAcceleration90.class_inputs_from_star,
        #[``RHAcceleration90.good_grid_from_star]),
      (``RHAcceleration90.zeta_line_from_star_and_tail,
        #[``RHAcceleration90.class_inputs_from_star,
          ``RHPrimeWindow91.zeta_line_from_class_inputs])] do
    let info ← Lean.getConstInfo n
    let some v := info.value? (allowOpaque := true) |
      Lean.throwError "RUN90 missing proof value"
    let ds := v.getUsedConstants
    unless required.all (fun x => ds.contains x) do
      Lean.throwError m!"RUN90 missing actual direct supplier {n}"
    Lean.logInfo m!"RUN90_CLASS_STAR|{n}|{ds.map Lean.Name.toString}"
  Lean.logInfo "RUN90_CLASS_STAR_GUARDS_OK"
