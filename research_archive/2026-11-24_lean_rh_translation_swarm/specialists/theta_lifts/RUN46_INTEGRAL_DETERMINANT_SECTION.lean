import RUN45_RIGHT_HAAR_SPLIT_CALIBRATION
import RUN37_CANONICAL_FINITE_ADELE_DICTIONARY

/-!
Lane 8 RUN46 | 26 Nov 2026 | HUMAN SOURCE-MATCHED / Lean PREPARED,
NOT COMPILED. RH OPEN.

Mission current f8b4b837301f8cf43d673be4979f04c4e4b415a4,
original e0dc8f7f blob 4a45e612 and mandatory 4b677bc2 blob
8dc6705e1bc6540b600f6c22309294466ec88fd0 checked. AGENTS, SWARM,
HANDOFF, EXPANSION, continuity/state openings and recent 20 commits
read. Prior theta d7f428d4; actual peer editor 893007c3
(orthogonal same-row arch density), geometry bbb56405
(regular finite fibres), integration 65d0f958 (coarse exponent)
inspected. No independent replacement of their hosts or hypotheses.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Latest upstream 2db90859500407542617a5b86281b4f1e1ee69cb observed,
not migrated or semantically compared.

NEW: the exact finite integral calibration rectangle in RUN45 is
the native full Kset, not a smaller arbitrary compact open set
whose index must be computed. The determinant section respects
the entire integral stabilizer AND its native integer congruences.

Fix the canonical I=ofSignature cm p q, n=p+q>=1,
A=E tensor_F Af(F), S=IntAf F E. By RUN37 Lf=S^n. Write
J_A=diag(eps_i), eps_i=+/-1, and sigma=sigR cm.sig (Af F).
For any index i and norm-one u in A^* (sigma(u)u=1) put
s_i(u)=diag(1,...,u,...,1). Its inverse replaces u by u^-1.
The defining native UJ equation holds entrywise:
  cT(s_i(u)) J_A s_i(u) = J_A.
Its determinant is u, and s_i(u v)=s_i(u)s_i(v).
Conversely take determinants of cT(g)J_A g=J_A:
  sigma(det g) det(J_A) det g = det(J_A).
Since det(J_A)=+/-1 is a UNIT (nonzero alone is insufficient
over the adelic ring), cancel to get sigma(det g)det g=1.
This proves the determinant image is precisely the norm-one
units; no nth root, scalar division by n, or rank condition
except n>=1 is used.

Let T_0={u in A^*: sigma(u)u=1, u and u^-1 in S}.
The definition of stabGL and Lf=S^n gives the exact equivalence
  g in Kset iff all entries of BOTH g and g^-1 belong to S.
Forward: test standard coordinate vectors and apply the inverse
stabilizer. Reverse: each row action is a finite sum of products
in S; apply the inverse for the converse. Thus det(g) and its
inverse are in S by the determinant polynomial over S.
Also s_i(T_0) is contained in Kset, by its explicit entries.
Writing H=ker det and K_H=H intersect Kset, the split map
e(h,u)=h*s_i(u) therefore satisfies the identity
  e^-1(Kset)=K_H x T_0.
Proof: for g in Kset, u=det g in T_0 and h=g*s_i(u)^-1 in K_H;
reverse by closure of Kset. This is an exact product RECTANGLE,
not a direct product GROUP assertion.

Likewise for positive integer N define T_N={u in T_0:
u-1 in N S}. Native Kg(N) means g in Kset and g-I entrywise
in N S, by testing columns and summing over S. Reduction over
S/(N) commutes with determinant; so det(Kg(N)) is in T_N.
Conversely the same explicit section takes T_N into Kg(N).
Consequently e^-1(Kg(N))=(H intersect Kg(N)) x T_N.
All matrices and inverses are integral before reducing mod N;
no reduction of arbitrary nonintegral A-points is justified.
This proves continuity at 1 and hence everywhere of the finite
determinant and its section for the canonical congruence
topologies. Via RUN37 the T_N form a cofinal basis in the
usual restricted-product norm-one torus: prescribe finitely
many local congruences using a multiple of their underlying
rational primes and keep full integral stabilizer elsewhere.
This avoids a separate continuity comparison for the section.
It does not by itself kernel-check RUN37's ring equivalence.

At infinity the same explicit section is continuous on U(1)
and the canonical P_v=1. At rational points it respects
embeddings and det, so the split rational subgroup in RUN44
uses exactly the same GFset witness gamma. There is no need
to choose independent adelic and rational sections.

NEW native scalar calibration: for any product factors m_Hf,
m_Tf the left split-coordinate finite pushforward has mass
  m_Hf(K_H)*m_Tf(T_0)
on Kset, exactly, by the above preimage identity. Right Haar
invariance comes from RUN45. Normalize these compact stabilizers
using their actual local smooth trace densities and assign
the common global L(1,chi) and discriminant convention exactly
as RUN43. Their product at every finite place is the unitary
stabilizer density, provided the two forms wedge to the same
unitary form. The determinant splitting at the identity is
X -> (X - E_ii tr X, tr X) and preserves the integral tangent
modules: no division by n, including at residue characteristic
dividing n. Thus, for compatible lattice top forms, the
product local density on this actual finite rectangle is
the RUN39/43 one. In particular there is no unknown finite
index from the section. The remaining measure premise is
compatibility of those chosen top forms with the native
trace-density normalization, including real factors and
global regularization. Do not claim it verified merely
because the groups split. Keep tau(SU)=1 as an explicit
external classical theorem (RUN44). The new exact rectangle
reduces native calibration, not the global quotient itself.

Original selected graph: CountTyped -> VolumeStep -> rank ratio.
RUN43 pair -> RUN44 native_covol_of_split44 -> RUN45
native_map_right45 with arbitrary rectangle.
New candidate: canonical36 + coordinate_lattice + explicit
diag section + integral det -> Kset/Kg split and finite continuity
-> finite rectangle mass -> actual RUN45 calibration. Keep the
old graphs, all unresolved type/value/constructor edges and
baseline axiom evidence; no root obligation retired. Context key:
pin/toolchain/F,E,CM,rank,signs,I,J,S,section index,normalization,
local forms, GFset and actual caller. Backtrack to RUN45 arbitrary
rectangle if native coordinate comparison fails.

41 fail-on-error source SHA/declaration-anchor checks executed
in connector V8 over these pinned files:
 native GlobAut 2103e49fe83fce42d4962f85acd9d4f6a589d645
 native SatakeDualWeyl/Statement e5f0d2a668f9bb75c740202d478d28f505fff540
 native ExistsFrameOfHasSignature 13982fe910bfc0dec0938e4ed6cdb20e01ad3821
 native FiniteAdelicUnitaryCongruenceTopology 3b4a5f88d4e95e9acdb5006b5aa23f88c3ec45ba
 native CountTypedOfVolumeStep 51eec4beb9bed7964345b1fc40a14541dd643cd1
 Mathlib GeneralLinearGroup/Defs 966882903956a887c6c8ba84b7ef722c63e34b5b
 Mathlib Data/Matrix/Mul 35e734e219e8e417d3d3569323aacfe9b2cd160f
 Mathlib Data/Matrix/Diagonal 3def69b28013563a4db5fe1aeb72c41edf798549
 Mathlib Determinant/Basic 9f47c32c8ab7db3de8e5a201746f3b26357590f5.
The candidate below is exact algebra over arbitrary commutative rings;
no synthetic numerical evidence. Local lean/lake absent. Actual baseline
CI status JSONs for 45577239749 and 45576756833 both pass/0,
baseline only (axioms propext, Classical.choice, Quot.sound;
324 pending scan names). New certificate not compiled or queued;
no fresh axiom result. No URT experiment warranted.

RESUME HERE: stage RUN36-46 in the existing pinned runner with
their transitive overlays; prioritize diagonal section/coordinate
lattice, then the finite rectangle mass and same-row arch density
of editor 893007c3. Match the tangent wedge to the actual native
gauge and invoke the paired covol consumer; do not construct
another abstract calibration wrapper. No new root obligation
retired. Same-host CountI/II/V/Vs, SW, TopG/Green/J/VWin and
decisive weighted prime-window inequality remain open.
HANDOFF TO kernel, geometry, audit, literature, editor, integration.
-/

noncomputable section
open Matrix Finset NumberField Formalism.UG Formalism.MainNotions.S
open scoped TensorProduct

namespace RHTheta46
section Algebra
variable {A n : Type} [CommRing A] [Fintype n] [DecidableEq n]

/-- Explicit version of Mathlib's det_surjective, using the same
single-coordinate lift, not a scalar nth root. -/
def diagGL46 (i : n) (u : Aˣ) : GL n A :=
  ⟨diagonal fun j => if j = i then (u : A) else 1,
   diagonal fun j => if j = i then (↑(u⁻¹) : A) else 1,
   by rw [diagonal_mul_diagonal, diagonal_eq_one]
      funext j; by_cases h : j = i <;> simp [h],
   by rw [diagonal_mul_diagonal, diagonal_eq_one]
      funext j; by_cases h : j = i <;> simp [h]⟩

theorem det_diagGL46 (i : n) (u : Aˣ) :
    Matrix.GeneralLinearGroup.det (diagGL46 i u) = u := by
  apply Units.ext
  change (diagonal (fun j => if j = i then (u : A) else 1)).det = (u : A)
  rw [det_diagonal, Finset.prod_eq_single i]
  · simp
  · intro j _ hj; simp [hj]
  · simp

theorem diagGL_mul46 (i : n) (u v : Aˣ) :
    diagGL46 i (u*v) = diagGL46 i u * diagGL46 i v := by
  apply Units.ext
  change diagonal (fun j => if j = i then (↑(u*v) : A) else 1) =
    diagonal (fun j => if j = i then (u : A) else 1) *
    diagonal (fun j => if j = i then (v : A) else 1)
  rw [diagonal_mul_diagonal]
  congr 1
  funext j
  by_cases h : j = i <;> simp [h]

theorem diag_unitary46 (sigma : A →+* A) (d : n → A)
    (i : n) (u : Aˣ) (hu : sigma (u : A) * (u : A) = 1) :
    diagGL46 i u ∈ UJ sigma (diagonal d) := by
  change cT sigma (diagonal (fun j => if j = i then (u : A) else 1)) *
    diagonal d * diagonal (fun j => if j = i then (u : A) else 1) = diagonal d
  rw [cT, diagonal_map (map_zero sigma), diagonal_transpose,
    diagonal_mul_diagonal, diagonal_mul_diagonal]
  congr 1
  funext j
  by_cases h : j = i
  · subst j
    simp only [if_true, Function.comp_apply, Pi.mul_apply]
    rw [mul_comm (sigma (u : A)) (d i), mul_assoc, hu, mul_one]
  · simp [h]

theorem det_norm46 (sigma : A →+* A) (J : Matrix n n A)
    (hJ : IsUnit J.det) (g : UJ sigma J) :
    sigma ((g.1 : Matrix n n A).det) * (g.1 : Matrix n n A).det = 1 := by
  have h := congrArg Matrix.det g.2
  change (cT sigma (g.1 : Matrix n n A) * J *
    (g.1 : Matrix n n A)).det = J.det at h
  rw [det_mul, det_mul, cT, det_transpose, ← sigma.map_det] at h
  obtain ⟨d, hd⟩ := hJ
  rw [← hd] at h
  have h' := congrArg (fun x : A => x * (↑(d⁻¹) : A)) h
  calc
    _ = (sigma ((g.1 : Matrix n n A).det) * (d : A) *
        (g.1 : Matrix n n A).det) * (↑(d⁻¹) : A) := by
      rw [show (sigma ((g.1 : Matrix n n A).det) * (d : A) *
        (g.1 : Matrix n n A).det) * (↑(d⁻¹) : A) =
        (sigma ((g.1 : Matrix n n A).det) * (g.1 : Matrix n n A).det) *
        ((d : A) * (↑(d⁻¹) : A)) by ac_rfl]
      simp
    _ = 1 := by simpa using h'

variable (S : Subring A)

theorem det_integral46 (M : Matrix n n A)
    (hM : ∀ i j, M i j ∈ S) : M.det ∈ S := by
  let M' : Matrix n n S := fun i j => ⟨M i j,hM i j⟩
  have he : M'.map S.subtype = M := by ext i j; rfl
  rw [← he, ← S.subtype.map_det]
  exact (M'.det).2

theorem entries_of_stab46 (L : Submodule S (n → A))
    (hL : ∀ x : n → A, x ∈ L ↔ ∀ i, x i ∈ S)
    (g : GL n A) (hg : g ∈ stabGL L) :
    ∀ i j, (g : Matrix n n A) i j ∈ S := by
  intro i j
  have hb : Pi.single j (1 : A) ∈ L := by
    apply (hL _).2
    intro k
    by_cases h : k = j <;> simp [Pi.single_apply,h]
  have hc := (hL _).1 ((hg _).1 hb) i
  simpa [Matrix.mulVec_single] using hc

theorem integral_action46 (L : Submodule S (n → A))
    (hL : ∀ x : n → A, x ∈ L ↔ ∀ i, x i ∈ S)
    (M : Matrix n n A) (hM : ∀ i j, M i j ∈ S)
    (x : n → A) (hx : x ∈ L) : M *ᵥ x ∈ L := by
  apply (hL _).2
  intro i
  change (∑ j, M i j * x j) ∈ S
  exact sum_mem fun j _ => mul_mem (hM i j) ((hL _).1 hx j)

theorem stab_entries_iff46 (L : Submodule S (n → A))
    (hL : ∀ x : n → A, x ∈ L ↔ ∀ i, x i ∈ S)
    (g : GL n A) :
    g ∈ stabGL L ↔
      (∀ i j, (g : Matrix n n A) i j ∈ S) ∧
      (∀ i j, ((g⁻¹ : GL n A) : Matrix n n A) i j ∈ S) := by
  constructor
  · intro hg
    exact ⟨entries_of_stab46 S L hL g hg,
      entries_of_stab46 S L hL g⁻¹ (inv_mem hg)⟩
  · rintro ⟨hg,hi⟩ x
    constructor
    · exact integral_action46 S L hL _ hg x
    · intro hx
      have he := integral_action46 S L hL _ hi _ hx
      rwa [Matrix.mulVec_mulVec, ← Units.val_mul, inv_mul_cancel,
        Units.val_one, Matrix.one_mulVec] at he

end Algebra

section Native
variable (I : AutInst)

def finiteSection46 (i : Fin I.n)
    (d : Fin I.n → I.E ⊗[I.F] Af I.F)
    (hd : I.J.map (inclE (F := I.F) (Af I.F)) = diagonal d)
    (u : (I.E ⊗[I.F] Af I.F)ˣ)
    (hu : sigR I.cm.sig (Af I.F) (u : I.E ⊗[I.F] Af I.F) * ↑u = 1) :
    I.Gf := by
  refine ⟨diagGL46 i u, ?_⟩
  change diagGL46 i u ∈ UJ (sigR I.cm.sig (Af I.F))
    (I.J.map (inclE (F := I.F) (Af I.F)))
  rw [hd]
  exact diag_unitary46 _ _ i u hu

theorem finiteSection_det46 (i : Fin I.n)
    (d : Fin I.n → I.E ⊗[I.F] Af I.F)
    (hd : I.J.map (inclE (F := I.F) (Af I.F)) = diagonal d)
    (u : (I.E ⊗[I.F] Af I.F)ˣ)
    (hu : sigR I.cm.sig (Af I.F) (u : I.E ⊗[I.F] Af I.F) * ↑u = 1) :
    Matrix.GeneralLinearGroup.det
      (finiteSection46 I i d hd u hu : GL (Fin I.n) (I.E ⊗[I.F] Af I.F)) = u :=
  det_diagGL46 i u

theorem canonicalK_entries46 (H : AutInst) (p q : ℕ)
    (g : (GlobalTheory.FlagMeas.VolRatio.canonical36 H p q).Gf) :
    g ∈ (GlobalTheory.FlagMeas.VolRatio.canonical36 H p q).Kset ↔
      (∀ i j, ((g : GL (Fin (p+q)) (H.E ⊗[H.F] Af H.F)) :
        Matrix (Fin (p+q)) (Fin (p+q)) (H.E ⊗[H.F] Af H.F)) i j ∈ IntAf H.F H.E) ∧
      (∀ i j, (((g⁻¹) : GL (Fin (p+q)) (H.E ⊗[H.F] Af H.F)) :
        Matrix (Fin (p+q)) (Fin (p+q)) (H.E ⊗[H.F] Af H.F)) i j ∈ IntAf H.F H.E) := by
  change (g : GL (Fin (p+q)) (H.E ⊗[H.F] Af H.F)) ∈
    stabGL (GlobalTheory.FlagMeas.VolRatio.canonical36 H p q).Lf ↔ _
  first
  | (rh_reduce 2 using [stab_entries_iff46, RHTheta37.canonical_coordinate]; done)
  | (rh_auto_frontier 2; done)
  | exact stab_entries_iff46 _ _ (RHTheta37.canonical_coordinate H p q) _

end Native
end RHTheta46

rh_scan GlobalTheory.AutInhab.ofSigns limit 2000
rh_scan GlobalTheory.CountFinal.countingTheorem_of_finite43 limit 2000
rh_prune RHTheta46.diag_unitary46 as RHThetaDiagUnitary46Pruned
rh_prune RHTheta46.canonicalK_entries46 as RHThetaKEntries46Pruned
rh_scan RHTheta46.canonicalK_entries46 limit 2000
#print axioms RHTheta46.det_diagGL46
#print axioms RHTheta46.diag_unitary46
#print axioms RHTheta46.det_norm46
#print axioms RHTheta46.stab_entries_iff46
#print axioms RHTheta46.finiteSection_det46
#print axioms RHTheta46.canonicalK_entries46
end
