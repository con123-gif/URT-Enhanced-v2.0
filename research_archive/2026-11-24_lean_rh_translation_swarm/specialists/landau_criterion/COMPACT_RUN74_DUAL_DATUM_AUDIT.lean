import Lib.SiegelWeil.RallisInner.SharpData
import Mathlib.Tactic

/-!
# RUN74 — Independent finite dual-datum audit and exact premise weakening
27 Nov 2026. Credit Levent Alpöge, Luke Sernau, Anthropic collaborators
and Claude; native proof body below adapted from Apache-2.0 source.
Original pin 40e56bab026552e089d7afcfeff08d2defb9c005 retained.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a00585.
Mission current blob a69122b6ad568910a45d2bc13961ab9da4855143;
AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, RUN73 read.
Peer integration/2026-11-27_COMPACT_DUAL_DATUM_PROJECTOR_AUDIT.md
blob 862200f0eb186e3f7af0b9b18eda71113a37a0dc, F3–F10 independently
audited here at the actual native consumer. Latest peer mission explicitly
requests this audit. No claim of independent audit of the whole Siegel–Weil
convergence theorem or of RH.

## 1. Finite projection: avoid an extra model identification
Source SharpData.lean blob ea9f665a9a89411f1353d098ff2e0a4e59a719f5, lines 245–278.
Projections.lean blob 7a187f8be18a00b889082b56818393f20a7f88e4,
PairDefs.lean blob 8a5eaed1249fcc1c482e3af4f15373682fa34af1,
FiniteVacuum.lean blob b775c3efc7afae92b21402691f615e0dfbf73ee1,
PairSumNegation.lean blob d2f45383d2e972574a7e749da0f2b4bb9283c6da.
The exact native coefficient dataInner_omega_of_vacElem is
 <vac,omega(k)vac> = conjugate(weilMultiplier(k))^(-1).
For finite supported k, finMultiplier_inv and the same normalized vacuum
give Delta(k^-1)^(-1). No independent choice of phase is permitted.
The extension to P_A-fixed vectors is exactly ext_integrated:
test real polynomial tensors with H(y)vac, y zero on A ∪ bar A.
The supported k fixes y, so omega(k) commutes with H(y).
The complementary projector commutes with omega(k) and H(y) preserves
the original vacuum there. The full-vacuum line identity
 dataInner_vacElem_smul_vacElem = projReal ∘ projOn(univ)
then gives the coefficient on the test tensors (native projOn_union,
omega_projOn, omega_integrated). The determining-family theorem
ext_integrated extends it to f. This avoids postulating a new finite-factor
Hilbert density or a new normalization; F3 and F4 are supported by the
precise native coefficient and extension laws, not just by |Delta|.
Keep all those model laws as accepted supplier obligations.

## 2. Audit F5–F10: one selected row, one exact character
Write C=A ∪ bar A, x*x=0, eta selected identity rows restricted to C.
At C, eta*x=x*eta=I, so k=I+zxx* has inverse I-zxx* and k*k=I
since bar z=-z. Off C k=I. Set delta=Delta(kappa^-1), fixed before g;
f'=H(eta)omega(kappa)(delta f).
If g integral at A, Z=pairWeil(g,1)f is P_A-fixed by projOn_pairWeil.
H(eta) fixes Z, self-adjoint projection moves to the first inner slot:
 <f',Z>=<P_A omega(kappa)(delta f),Z>=<f,Z>.
Scalar cancellation occurs at the vector level, avoiding a false
conjugation of delta in an intermediate scalar equation.

If g is nonintegral, use the native inverse-argument convention
(inv_surjective.forall); p:Y->Yg. Select w∈C and row i with maximal
entry g_il in that row, |g_il|_w>1. The local level at A is invariant under
inversion, and unitarity makes its integrality equivalent at bar A.
Choose sigma supported at w of valuation norm inverse to
max(|z|_w,|g_il|_w); this is attainable by selecting the corresponding
nonzero local field element. Then for every integral d,
 y=E_(u(l),i)d sigma, v=k y g
satisfies k^-1 v=yg and p^-1 v=ky both integral and supported on C.
For ky use x integral and z sigma integral; for yg use ROW maximality.
The actual finHeisOp_comm gives the character psi0(star(eta) dot v)
(up to conjugate if taking the other inner-slot convention). If the
coefficient were nonzero, both fixing identities force this character
to equal 1. Compute on C before applying any norm:
 trace(eta* v)=trace((eta*y+z eta*x x*y)g)
              =(1+z)d sigma g_il.
Here eta*y=x*y=E_(l,i)d sigma because selected row u(l) of x is e_l.
Integral d sigma g_il contributes character one, leaving
 psi0(d sigma z g_il)=1 for ALL integral d.
By native forall_psi0_mul_eq_one_iff (same conductor) this says
sigma z g_il integral. But its norm at w is
 |sigma z g_il|=min(|z|,|g_il|)>1. Contradiction.
No positive-definite global isotropic frame is used; only finite x.
This checks F5–F10 including the order of quantifiers. For A empty
the cutoff is identically one; for n=0 the source group is trivial.
The determinant character is a common nonzero unit. No inference
from a finite test to the adelic result.

## 3. New native premise weakening
The actual exists_dual_datum proof uses strict rank 2n<m ONLY as h.le
in the call to exists_integral_isotropic_frame. Replace this by an
explicit integral isotropic frame with selected identity rows. The rest
of the native proof is unchanged. As a corollary 2n≤m is sufficient for
this cutoff lemma, including equality. This is a source-level actual
proof-body candidate, not a kernel-checked weakening. The larger
inner_product_formula still REQUIRES 2n<m; no claim of weakening it,
or global root/dependency retirement. This separates the local finite
geometry from the analytic stable-range guard.

Original human edge:
 exists_dual_datum -> {strict rank, frame constructor, P_A f=f,
 finite A, denominator clearing, projector, Heisenberg covariance,
 self-duality, unitary conjugation}.
Reduced candidate: frame supplied -> same finite cutoff, rank not used
inside. Rank corollary: weak rank -> frame -> cutoff.
Original native graph and axiom evidence remain untouched.
Context key: compact pin, S,T,A,f,b, SAME x,u,character and normalized
projector, caller's strict rank retained for inner_product_formula.
No global dependency deletion or URT comparison claimed.

Actual execution: local command -v lean and lake found neither.
Python/SymPy exact split-algebra involution check: n=1,2,3 at m=2n,
isotropy and unitary identities plus 1+4+9 selected-row contractions
checked symbolically (u=(1,-1), conjugation swaps components).
121 positive integer valuation pairs checked:
a+b-max(a,b)=min(a,b)>0. These are algebra controls only; no native
proof verification or full model test. Historical CI job lists for
45577239749 and 45576756833 each returned pick/run/record success.
No new CI run or axiom print result claimed.

## RESUME HERE / HANDOFF TO integration and audit
Use the audited projector/commutator derivation at the existing finite
dual-datum caller. Run the candidate below in the pinned compact
environment, inspect #print axioms and compare original/reduced terms
with native engines; preserve both graphs. Strict rank remains at
Rallis, with clean support, common absolute majorants and rapid forms.
The sharp cutoff limit uses ONE original integrable coefficient,
not a uniform norm bound for the varying f'_A. Next actual open
supplier: noncoherent absolute amplitude/exchange, with its own
integrability majorant and exact quantifier order. A/C obligations
and the weighted prime-window inequality remain open.
-/

noncomputable section
section
open ComplexConjugate ContinuousLinearMap Filter Fintype Gf Kronecker Lagrangian stdLattice MatMul
  Matrix MeasureTheory Space Valued WeilData Splitting Std Weil NumberField CompactlySupported
variable {E n m : Type} [Field E] [CMType E] [WeilData E] [Fintype n] [Fintype m] {s t}
  {S : Space E n s} {T : Space E m t} (b : AutChar E)
attribute [local simp] add_mem localLevel mem_stdLattice coordMatrix add_mul doubleDatum ite_mem
  mem_Kf_iff mem_LocInt mul_add mul_assoc pos_iff_ne_zero finMultiplier_inv rep_apply_apply

lemma exists_dual_datum_of_frame_run74
  (hframe : ∃ x : Matrix m n (𝔸f E),
    (∀ i j, x i j ∈ Ô E) ∧ xᴴ * x = 0 ∧ ∃ u : n ↪ m, ∀ i, x (u i) = Pi.single i 1) {f A} (hf : projOn (S.hom T) A f = f) (hA :
  A.Finite) : ∃ f', ∀ g,
  weilMatrixCoeff b f f' g = if g.2 ∈ localLevel n A then weilMatrixCoeff b f f g else 0 := by
  obtain ⟨⟨x, _, _, u, _⟩, N, _, hN⟩ := hframe,
    @exists_forall_mul_mem_Ô E _ _ _ hA.cj (singleAdele ·.1 (uniformizer _).1⁻¹ * (j⁻¹ : E))
  let z := idem A.conjClosure * (j / N : E)
  let κ := G.onHom (s := s) (s' := t) (1, 1, U.of (by simp) (1 + z • x * xᴴ) (by
    simp [z, ← xᴴ.mul_assoc, neg_div, *]))
  have V p q y (h : (p⁻¹ * q : G ..).2.1.1 *ᵥ y ∈ _) := by
    simpa [*] using congr(ω _ p $(finHeisOp_projOn _ (S := A) h f))
  use finHeisOp _ (idem A.conjClosure • ∑ k, Pi.single (u k,
    k) 1) (ω _ κ (finMultiplier κ.2⁻¹ • f)), inv_surjective.forall.2 fun g ↦ ?_; split_ifs with c
  · unfold κ; erw [G.onHom_fin]
    rw [weilMatrixCoeff, ← projOn_pairWeil hf _, ← finHeisOp_projOn, dataInner_finHeisOp,
      ← dataInner_projOn, projOn_ω] <;>
      simp +contextual [atPlace, *, z, finMultiplier_ne_zero, Units.ext_iff, ← ext_iff, apply_ite]
  simp [weilMatrixCoeff, pairWeil, finMultiplier_ne_zero]; contrapose c
  have K w (_ : w ∈ A.conjClosure) i k : v (g.2.1 i k w) ≤ 1 := (@Finite.exists_max _ _ _ ⟨k⟩ _
    (v <| g.2.1 i · w)).elim fun l hp ↦ (hp k).trans (_root_.not_lt.1 fun o ↦
    have Z : 1 < v (z w) := by simpa [z, ← map_natCast (algebraMap E (𝔸f E)), -map_natCast, field,
      ← WithZero.lt_mul_exp_iff_le, *] using mem_Ô.1 (hN ⟨w, ‹_›⟩) w
    have ⟨μ, _⟩ := w.valuedAdicCompletion_surjective E (v (z w) ⊔ v (g.2.1 i l w))
    let σ := singleAdele w μ⁻¹
    have I y : y * σ ∈ Ô E ↔ v (y w) ≤ v μ := by
      rw [mem_Ô, ← and_forall_ne w]; aesop (add simp field)
    mt (forall_psi₀_mul_eq_one_iff (idem A.conjClosure * idem A.conjClosure * z * g.2.1 i l * σ)).1
      (by simp [↓I, *, o.pos, Z.pos]) fun d hd ↦ star_inj.1 (mul_right_cancel₀ c (by
    nth_rw 2 [← dataInner_finHeisOp _
      (idem A.conjClosure • (κ * G.onHom (g⁻¹, 1)).2 *ᵥ Pi.single (u l, i) (d * σ))]
    rw [V, finHeisOp_comm, V] <;> simp (maxDischargeDepth := 4) [κ, ← map_inv, ← map_mul,
      G.onHom_snd, psi₀_eq_one_of_mem, sum_dotProduct, apply_ite star, mul_apply,
      (psi₀ E).map_add_eq_mul, mul_left_comm _ d, mul_mem,
      mul_left_comm z, mul_comm σ, (mem_Ô.1 hd w).trans Z.le, *])))
  exact fun w h ↦ mem_intGL.2 ⟨by rw [atPlace_star (star_star w)]; simp [atPlace, *], by tauto⟩

lemma exists_dual_datum_weak_rank_run74 (h : 2 * card n ≤ card m) {f A}
    (hf : projOn (S.hom T) A f = f) (hA : A.Finite) : ∃ f', ∀ g,
    weilMatrixCoeff b f f' g = if g.2 ∈ localLevel n A then weilMatrixCoeff b f f g else 0 := by
  exact exists_dual_datum_of_frame_run74 b (exists_integral_isotropic_frame (E := E) h) hf hA

#print axioms exists_dual_datum_of_frame_run74
#print axioms exists_dual_datum_weak_rank_run74
end
