/-
Green lane RUN2 — verbatim restatement of the upstream definitions needed by
`GlobalTheory.GLq.card_generic_irr_le` and `GlobalTheory.GLq.IpCuspProd.ip_hcL_cusp`.
Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005:
  src/Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/LabelDatum.lean (blob 8b45fadb)
  src/Formalism/SharpRestriction/LevelLetterCocycles/ArithmeticCylinders.lean (IsUniUp, eDat, eU, phiJ, eJ)
`entN, IsIrr, tl, br, InPar, res, IsCusp, Gn, Mt, Pc` are already restated in GreenCompanion.Exhaustion.
These are textual copies; definitional identity with the upstream constants is NOT machine-checked.
-/
import GreenCompanion.Exhaustion

noncomputable section
open Polynomial
open scoped Classical

namespace GreenCompanion

def IsClass {G : Type} [Group G] (χ : G → ℂ) : Prop := ∀ x y : G, χ (y * x * y⁻¹) = χ x

def IsChar {G : Type} [Group G] (χ : G → ℂ) : Prop := ∃ V : FDRep ℂ G, ∀ x, V.character x = χ x

def ip {G : Type} [Group G] [Fintype G] (α β : G → ℂ) : ℂ :=
  (Fintype.card G : ℂ)⁻¹ * ∑ x, α x * β x⁻¹

def tr {G : Type} [Group G] [Fintype G] (a : MonoidAlgebra ℂ G) (χ : G → ℂ) : ℂ := ∑ x, a.coeff x * χ x

def zOf {G : Type} [Group G] [Fintype G] (χ : G → ℂ) : MonoidAlgebra ℂ G :=
  ∑ x, MonoidAlgebra.single x (χ 1 / (Fintype.card G : ℂ) * χ x⁻¹)

def IsUniUp {A : Type} [Zero A] [One A] {N : ℕ} (M : Matrix (Fin N) (Fin N) A) : Prop :=
  ∀ a b : Fin N, (b < a → M a b = 0) ∧ (a = b → M a b = 1)

def eDat (g N : ℕ) [NeZero g] (P : Matrix (Fin N) (Fin N) (ZMod g) → Prop)
    (φ : Matrix (Fin N) (Fin N) (ZMod g) → ZMod g) (ψ₀ : AddChar (ZMod g) ℂ) :
    MonoidAlgebra ℂ (GL (Fin N) (ZMod g)) := by
  classical
  exact ((Finset.univ.filter fun u : GL (Fin N) (ZMod g) => P (u : Matrix (Fin N) (Fin N) (ZMod g))).card : ℂ)⁻¹ •
    ∑ u ∈ Finset.univ.filter (fun u : GL (Fin N) (ZMod g) => P (u : Matrix (Fin N) (Fin N) (ZMod g))),
      MonoidAlgebra.single u (ψ₀ (φ (u : Matrix (Fin N) (Fin N) (ZMod g))))⁻¹

def eU (g N : ℕ) [NeZero g] (ψ₀ : AddChar (ZMod g) ℂ) : MonoidAlgebra ℂ (GL (Fin N) (ZMod g)) :=
  eDat g N IsUniUp (fun M => ∑ i ∈ Finset.range (N - 1), entN M i (i + 1)) ψ₀

def phiJ {g : ℕ} (kk s : ℕ) {N : ℕ} (M : Matrix (Fin N) (Fin N) (ZMod g)) : ZMod g :=
  (∑ i ∈ Finset.range (s - 1), entN M i (i + 1)) +
    (if 1 ≤ s then entN M (s - 1) (s + kk) + entN M (s + kk) (s + kk + 1) else 0) +
    (∑ i ∈ Finset.range (s - 1), entN M (s + kk + 1 + i) (s + kk + 2 + i)) +
    ∑ a ∈ Finset.range (kk - 1), entN M (s + a) (s + a + 1)

def eJ (g N : ℕ) [NeZero g] (kk s : ℕ) (ψ₀ : AddChar (ZMod g) ℂ) : MonoidAlgebra ℂ (GL (Fin N) (ZMod g)) :=
  eDat g N (fun M => IsUniUp M ∧ ∀ a, s ≤ a → a < s + kk → entN M a (s + kk) = 0) (phiJ kk s) ψ₀

def eJ' (g N : ℕ) [NeZero g] (k : ℕ) (ψ₀ : AddChar (ZMod g) ℂ) : MonoidAlgebra ℂ (GL (Fin N) (ZMod g)) :=
  eDat g N (fun M => IsUniUp M ∧ ∀ a, a < k → entN M a k = 0)
    (fun M => ∑ i ∈ Finset.range (N - 1), entN M i (i + 1)) ψ₀

variable {g : ℕ} [Fact g.Prime]

def toG {n : ℕ} (M : Mt g n) : Gn g n := if h : IsUnit M then h.unit else 1

def hcT (a b : ℕ) (Φ : Gn g a → Gn g b → ℂ) (n : ℕ) : Gn g n → ℂ := fun x =>
  ((Finset.univ.filter fun p : Gn g n => InPar a (p : Mt g n)).card : ℂ)⁻¹ *
    ∑ y : Gn g n, if InPar a ((y⁻¹ * x * y : Gn g n) : Mt g n) then
      Φ (toG (tl a ((y⁻¹ * x * y : Gn g n) : Mt g n))) (toG (br a b ((y⁻¹ * x * y : Gn g n) : Mt g n))) else 0

def hc (a b : ℕ) (α : Gn g a → ℂ) (β : Gn g b → ℂ) (n : ℕ) : Gn g n → ℂ := hcT a b (fun x y => α x * β y) n

def degL (L : List (Pc g)) : ℕ := (L.map fun p => p.1).sum

def hcL (L : List (Pc g)) : (n : ℕ) → Gn g n → ℂ :=
  List.rec (motive := fun _ => (n : ℕ) → Gn g n → ℂ) (fun _ _ => 1)
    (fun p L ih n => hc p.1 (degL L) p.2 (ih (degL L)) n) L

theorem hcL_nil (n : ℕ) : hcL ([] : List (Pc g)) n = fun _ => 1 := rfl

theorem hcL_cons (p : Pc g) (L : List (Pc g)) (n : ℕ) :
    hcL (p :: L) n = hc p.1 (degL L) p.2 (hcL L (degL L)) n := rfl

def wh (ψ₀ : AddChar (ZMod g) ℂ) {n : ℕ} (χ : Gn g n → ℂ) : ℂ := tr (eU g n ψ₀) χ

def gg (ψ₀ : AddChar (ZMod g) ℂ) (n : ℕ) : Gn g n → ℂ := fun x =>
  ((Finset.univ.filter fun u : Gn g n => IsUniUp (u : Mt g n)).card : ℂ)⁻¹ *
    ∑ y : Gn g n, if IsUniUp ((y⁻¹ * x * y : Gn g n) : Mt g n) then
      ψ₀ (∑ i ∈ Finset.range (n - 1), entN ((y⁻¹ * x * y : Gn g n) : Mt g n) i (i + 1)) else 0

end GreenCompanion
