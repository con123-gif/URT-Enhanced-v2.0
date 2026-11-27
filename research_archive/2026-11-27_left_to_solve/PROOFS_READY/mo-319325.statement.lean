import Mathlib

/-!
# Convergence at a singular limit in the Lyapunov equation

Source: Ludwig, MathOverflow question 319325, December 23, 2018.
https://mathoverflow.net/questions/319325
Original question text: CC BY-SA 4.0.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.

Stability includes all complex eigenvalues of the real matrix. Positive
definiteness has the standard symmetric meaning. The inverse square root
is the inverse of the unique positive semidefinite principal square root.
The finite-dimensional matrix topology is the usual norm topology. The
source permits zero as well as nonzero singular limiting matrices.
-/

namespace OMA.S_mo_319325

open Filter Topology
open scoped MatrixOrder

def hurwitz {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ) : Prop :=
  ∀ z ∈ spectrum ℂ (A.map Complex.ofReal), z.re < 0

noncomputable def normalized {n : ℕ}
    (P X : Matrix (Fin n) (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ :=
  (CFC.sqrt P)⁻¹ * X * (CFC.sqrt P)⁻¹

theorem main : ∀ n : ℕ, 0 < n → ∀ A : Matrix (Fin n) (Fin n) ℝ,
    hurwitz A → ∀ X P : ℕ → Matrix (Fin n) (Fin n) ℝ,
    (∀ k, (X k).PosDef) → (∀ k, (P k).PosDef) →
    (∀ k, A * P k + P k * A.transpose = -(X k)) →
    ∀ Xbar Pbar : Matrix (Fin n) (Fin n) ℝ,
    Xbar.PosSemidef → Pbar.PosSemidef → Pbar.det = 0 →
    Tendsto X atTop (𝓝 Xbar) → Tendsto P atTop (𝓝 Pbar) →
      ∃ L : Matrix (Fin n) (Fin n) ℝ,
        Tendsto (fun k => normalized (P k) (X k)) atTop (𝓝 L) := by
  sorry

end OMA.S_mo_319325
