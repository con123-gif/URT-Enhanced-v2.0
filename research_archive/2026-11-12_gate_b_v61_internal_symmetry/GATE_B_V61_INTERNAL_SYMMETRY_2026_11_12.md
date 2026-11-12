# Gate B — A5 cannot act on the v61 matter; what the §5 map can still be (2026-11-12)

Status: THEOREM + OBSTRUCTION — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.
Certificate: `gate_b_v61_internal_symmetry.py` (check `research.q53_v61_internal_symmetry`). Parts A and B are
exact (Gaussian rationals / rationals); the model of Part A is compared with the archived
`v61.wilson_operator_from_links` in floating point at flat links and at one deterministic non-flat configuration
(difference 0). Executed in Claude's cloud sandbox 2026-11-12, exit 0, 3.6 s.

Task: user-directed (Con, 2026-11-12): attack the missing object of `docs/RESEARCH_STATE.md` §5 directly. This also
answers the open "Next step" of the Q4 entry (2026-11-11 02:04): *does any A5 action on the v61 spinor index commute
with the Wilson operator?*

## Prior work used (ledger)
| Result | Source | Status |
|---|---|---|
| v61 site graph has no automorphism of order 5 | `2026-11-11_q4_native_matter_map/` | CI-executed; re-derived here independently |
| Hidden 4₃ odd, 4₅ even under inversion; W swaps them and is parity-odd; R-symmetry S(z,y;Δ)=S(z,Ry;−Δ) | `2026-11-11_hidden_parity/` | CI-executed; parity re-derived here exactly |
| "Four independent A5-equivariant quadratic sources", "two source-sector intertwiners" | `RESEARCH_STATE.md` §3–4 | recorded; dimension counts re-derived here exactly |
| "Linear A5 map from a hidden quartet to a single H13 fermion" falsified | `2026-11-10_urt_arf_forward/new_gate/URT_A5_H64_H13_CHARGED_VERTEX_STATUS_2026_11_10.md` | recorded (H13 side, not v61) |

Potentially new: Theorem A (the v61 side), Theorem C and the dichotomy. Part B is a re-derivation with an exact
certificate, not a new result.

## Setting
h(θ) = (1⊗γ₅)(D_W(e^{iθ}) − M) is the archived 192×192 Hermitian kernel on 48 sites × 4 spinor components, θ ∈ ℝ⁵²⁸.
Block (x,y), x ≠ y, is Σ e^{±iθ_l} T_l over the links joining x and y: one term for each of the 768 ordered
temporal pairs, two linearly independent terms for each of the 144 ordered spatial pairs (N_S = 2 doubles them).

**Definition.** A *local covariant symmetry* is a unitary ρ on ℂ¹⁹² that (i) maps every site fibre onto a site
fibre and (ii) maps the family into itself: for every θ there is θ′ with ρ h(θ) ρ† = h(θ′). Every gauge
transformation and every lattice symmetry with its spinor factor is of this kind.

## Theorem A (v61 has no room for A5)
Let Γ be A5 or its double cover 2I, and ρ: Γ → U(192) a homomorphism into local covariant symmetries. Then ρ is
trivial: ρ(g) = 1 for all g.

*Proof.* (1) By (ii), ρ(g) preserves the block support, so g ↦ site permutation is a homomorphism into
Aut(site graph), whose order divides 12·48⁶ (six Q₃ blocks in a 6-cycle with complete joins; certificate A1). The image of Γ is
isomorphic to Γ modulo a normal subgroup, i.e. to 2I, A5 or 1; the first two have order divisible by 5, and
12·48⁶ is not, so the image is trivial: ρ(g) = ⊕ₓ ρₓ(g).
(2) For x ≠ y, B ↦ ρₓ B ρ_y† is linear, preserves the span of the ≤ 2 independent terms T_l of block (x,y) and maps
the torus {Σ a_l T_l : |a_l| = 1} into itself. A linear map of ℂ² that maps T² into T² is monomial with unimodular
entries. Hence ρₓ T_l ρ_y† = e^{iα} T_{l′} with l′ a link of the same pair, and conjugation by ρₓ(g) permutes the
return operators {T_l T_l†} within each neighbour pair. That gives a homomorphism of Γ into a product of S₂'s, an
abelian 2-group; Γ is perfect, so it is trivial: ρₓ(g) commutes with every T_l T_l† at x.
(3) Certificate A3 (exact): at every site the 8 return operators generate an algebra of dimension 16 over ℚ(i),
i.e. M₄(ℂ); their commutant is one-dimensional. So ρₓ(g) = λₓ(g)·1, and λₓ: Γ → U(1) is trivial because Γ is
perfect. ∎

Scope: the archived v61 kernel with R_EXACT ≠ 0, as a U(1) gauge-covariant family. For the flat operator h(0)
alone, degenerate eigenspaces carry arbitrary non-local unitary actions; none survives condition (ii).

**Corollary A.** In any join of the 64-history source to the v61 matter that respects U(1) gauge covariance and
A5, the group acts trivially on the matter side. A *linear* A5-equivariant map from the hidden 4₃ ⊕ 4₅ into the
192 matter states (or any operator space built from them) is therefore zero, because the hidden 8 contains no
A5-invariant vector (certificate B1). **The object of §5, read as a linear equivariant map, does not exist.** The
source can enter only through A5-invariant functions of the source amplitude.

## Theorem B (the A5-invariant quadratic sources; exact re-derivation)
On the 20 faces: P₃, P₅ are rational; both quartets are the irreducible 4 of A5; End_A5(4₃ ⊕ 4₅) has dimension
exactly 4, spanned by P₃, P₅ and the cross intertwiner K₀ = (integer multiple of) P₅ A P₃ and its transpose, with
Hom_A5(4₃, 4₅) one-dimensional, K₀ᵀK₀ = 60·P₃, K₀K₀ᵀ = 60·P₅. Central inversion is C = −P₃ + P₅ on the hidden
sector, so hidden parity is R = P₃ − P₅ = −C there. X = K₀ + K₀ᵀ and Y = K₀ − K₀ᵀ are A5-invariant and change
sign under all 60 improper elements of I_h. R-even invariants: span{P₃, P₅}. R-odd: span{X, iY}; real
(time-reversal-even) and R-odd: X alone, unique up to scale; with the partial-isometry normalisation K = K₀/√60 it
is unique up to the sign K → −K, which is conjugation by R itself.

## Theorem C (selection rule)
Let the hidden amplitude y ∈ 4₃ ⊕ 4₅ carry a U(1) charge (it is charge two under the clock gauge). Every
U(1)-neutral polynomial in (y, ȳ) has even total degree. A monomial with a factors in 4₃ and b in 4₅ has R-parity
(−1)^b and inversion parity (−1)^a, and a + b even gives a ≡ b (mod 2). Hence **every U(1)-neutral R-odd source is
odd under central inversion**, at every polynomial order. (Charged odd-degree invariants, e.g. the one in
Sym²4₃ ⊗ 4₅, are R-odd and inversion-even but cannot multiply a neutral matter bilinear.)

## Consequence for the Δ-linear term (dichotomy)
By the R-symmetry of the native action, the Δ-odd part of any observable comes, at first order in the join, from
the R-odd part of the join. By Theorems A–C that part is s(y)·O with s an inversion-odd neutral invariant (leading
order: X) and O a gauge-invariant matter operator on which A5 acts trivially. Certificate C (exact relation,
checked on the archived operator at non-flat links): (1⊗γ₀) h(θ) (1⊗γ₀) = −h(Pθ), where P exchanges the two links
of each doubled spatial pair. For a site-uniform insertion h → h + sΓ the sea energy therefore obeys
E(θ; s, Γ) = E(Pθ; s, −γ₀Γγ₀).

1. **Join respects inversion** (source inversion tied to matter parity): O must be parity-odd, Γ ∈ {1, γ₀,
   iγ₅γ_k, iγ_jγ_k}, and E(θ; s) = E(Pθ; −s). Every parity-symmetric functional of the photon response is even in
   s: **no Δ-linear correction to any photon observable, at first order in the join.**
2. **Join breaks inversion**: X may multiply a parity-even insertion, Γ ∈ {γ₅ (the mass term of h), iγ₅γ₀, γ_k,
   iγ₀γ_k}. A Δ-linear term is then allowed, and it is an explicit parity violation: a pseudoscalar of I_h
   multiplying a scalar of the matter. Its coefficient is g·⟨X⟩·∂ₛ(observable); symmetry does not fix g.

So the linear coefficient 17572/1215 of the recorded Δ polynomial cannot arise from any A5 × inversion symmetric,
gauge-covariant join of the hidden source to the v61 matter through neutral bilinears. It needs a parity-violating
coupling with one undetermined real constant, or matter other than v61, or a charged (pairing) channel.

## What this does and does not settle
- Settled: the §5 object cannot be a linear A5-equivariant map into v61; A5 never acts on v61 internal indices
  (answers the Q4 next step in the negative); the form of every admissible join is "A5-invariant source function ×
  A5-neutral gauge-invariant matter operator"; the R-odd neutral source is unique at quadratic order up to scale.
- Not settled: the coupling constant g and the choice of matter operator in case 2; the charged pairing channel;
  whether the native 2026-11-07 action is itself inversion-symmetric (not needed for case 1's conclusion). No gate
  is closed. No physical identification is made, and δ⋆, δ_cl, Δ are untouched.

## RESUME HERE
Last completed: certificate passes locally (3.6 s). Next single question (Q54): compute exactly the first-order
response ∂ₛ of the native transverse photon kernel Π to the two rotation-invariant parity-even insertions γ₅ and
iγ₅γ₀ at flat links, to decide whether case 2 gives a non-zero Δ-linear channel at all.

---

## Addendum (2026-11-12, later, user-directed: "do not restrict to the repo") — WORK IN PROGRESS / argument, not a CI certificate

### Theorem D (all orders, independent of v61): Δ → −Δ is a parity transformation
Hypotheses, none specific to v61: (a) the hidden carrier is 4₃ ⊕ 4₅ with inversion C = −P₃ + P₅ (Theorem B);
(b) Δ enters the source action as in the native one, S(v, y; Δ) = S(v, Ry; −Δ) with R = P₃ − P₅
(`2026-11-11_hidden_parity/`, statement 5); (c) matter of any kind (v61 or not) is joined by a U(1)-neutral term
J(y, ψ), hence of even degree in (y, ȳ); (d) J and the matter action are inversion-invariant, J(Cy, Pψ) = J(y, ψ).
Then, since R = −C on the hidden carrier and J is even in y, J(Ry, Pψ) = J(Cy, Pψ) = J(y, ψ), so

  S_total(v, y, ψ; Δ) = S_total(v, Ry, Pψ; −Δ)   exactly.

Changing variables y → Ry, ψ → Pψ in the full integral: **every parity-even observable is an even function of Δ,
non-perturbatively and to all orders in the join.** α is parity-even. So a term c₁Δ in α⁻¹ exists if and only if
inversion symmetry is broken, explicitly (a new pseudoscalar coupling, one new constant) or spontaneously.

### Spontaneous case: the order parameter is fixed, the coupling is not
K is an A5-equivariant partial isometry 4₃ → 4₅, and each quartet has exactly one A4 singlet (4|A4 = 1 ⊕ 3), so
K s₃ = ± s₅ for the unit A4 singlets. In an A4 vacuum with hidden amplitude (P₃ + ΔP₅)(s₃ + s₅)/√2 the unique
pseudoscalar X = K + Kᵀ has ⟨X⟩ = ± 2Δ/(1 + Δ²) = ± 0.00497835, the sign being the choice between the two
inversion-partner vacua (T vs T′). This number is parameter-free. The coefficient that converts ⟨X⟩ into a shift of
α⁻¹ is a Yukawa-type constant; no symmetry of the construction fixes it, exactly as no symmetry fixes Yukawa
couplings in the Standard Model. The only parameter-free joins are gauge (minimal) couplings; those are R-even and
give c₁ = 0 by Theorem D.

### What the 0.036 is in standard QED (final comparison only; CODATA is not an input)
One-loop electron vacuum polarisation, spacelike, on-shell: α⁻¹(0) − α⁻¹(Q) = (2/π)∫₀¹ x(1−x) ln(1 + x(1−x)Q²/mₑ²) dx.
This equals 137.035999177 − 137 at Q²/mₑ² = 2.04248 (Q = 1.42915 mₑ = 0.7303 MeV); muon loop +1.0×10⁻⁶, two-loop
~6×10⁻⁵ relative. None of 2, φ², e, 9/4, π−1, 13/6, 20/9 reproduces it (misses 6×10⁻⁴ to 10⁻²). Reading: if the
geometric integer 137 is α⁻¹ at an intrinsic scale, the residual is ordinary running and the framework must predict
that scale in units of mₑ; t = 2.04248 is not a recognised native number. Executed in Claude's sandbox (scipy
quadrature); not registered as a check.

RESUME HERE (supersedes the earlier one): decide which reading the programme adopts — (i) c₁ = 0, α⁻¹ = 137 + O(Δ²)
at a scale to be derived; (ii) spontaneous inversion breaking with one coupling to be derived from a new principle.
