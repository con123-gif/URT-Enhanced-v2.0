# Q61: the inverse-limit completion selects no reversible history lift

Date: 2026-11-12 (Claude, scheduled `[derive]` session). Gate A.
Status: **THEOREM + OBSTRUCTION. CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.**
Certificate: `Q61_INVERSE_LIMIT_LIFTS_CERTIFICATE.py` (check `research.q61_inverse_limit_lifts`). Exact integers and Fractions throughout.

## Question (Queue Q61) and how it was read

Q59 H3 left 2³² support-respecting permutation lifts `σ_β(h) = 2h + (h₅ ⊕ β(h mod 32))` of the history
transfer `Q(h → 2h, 2h+1 mod 64)`, plus a U(32)-torsor of one-step unitary dilations. Q61 asks two things.
First, does the inverse-limit (bi-infinite) completion select one of them without extra data? Second,
if it does not, how many lifts are invariant under A5 × ⟨I,R,S⟩? The terms were read as follows.

- **Inverse limit.** The natural extension of the doubling map F(x) = 2x + φ⁻² mod 1. F is affine-conjugate to x ↦ 2x
  (Q58), so the φ⁻² shift drops out. Concretely: Ω = {0,1}^Z with the Bernoulli(½) measure μ (the unique
  measure of maximal entropy), the invertible shift T, and the window π with bit i of h_n equal to ε_{n−i}.
- **Selecting a lift.** A lift, or a finite unitary dilation, that the completion determines.
- **Symmetries.** The Q24 history symmetries are I (h ↦ h ⊕ 63), R (bit reversal, RQR = Qᵀ) and S (the
  alternating masks 101010/010101). They act on a lift by σ ↦ IσI, σ ↦ Rσ⁻¹R and σ ↦ M₁σM₀. A5 enters
  through a signed dictionary D: an element a ∈ A5 acting on the six icosahedral axes (Q12/Q24 convention)
  pulls back to the signed bit permutation ρ_D(a) = index_D⁻¹ ∘ a ∘ index_D. "A5-invariant" means that σ
  commutes with every ρ_D(a). The other possible reading is that A5 acts only on axis labels. Under it A5
  acts trivially on lifts, and the count reduces to the ⟨I,R,S⟩ count.

## Prior-work ledger

| Existing result | Source | Scope / status | Executed? |
|---|---|---|---|
| 2³² lifts, U(32)-torsor, Q partial isometry, no logarithm | Q59, `2026-11-12_q59_time_generator/` | THEOREM | CI (`research.q59_time_generator`) |
| Q⁶U_h = 0: Q is not modular time on the hidden carrier | `2026-11-12_native_emergent_time/` | THEOREM | GPT local |
| I, R, S symmetries; 96 free A5 × ⟨I,R,S⟩ orbits of size 480 on 46,080 dictionaries | Q24 | THEOREM | CI |
| Exceptional orders ⇔ some g ∈ A5 acts as the digit rotation i ↦ i+2 | Q46 | THEOREM | CI |
| F_α = 2x + α affine-conjugate to doubling, KS entropy ln 2 | Q58 | THEOREM | CI |

New here: N1–N4 and S0–S2 below.

## Part N: the natural extension

**N1 (Koopman compression).** Let U f = f∘T on L²(Ω, μ) and embed H = L²(64 histories, uniform) as functions
of the time-0 window. Then P_H U^n P_H = Qⁿ for n ≥ 0 and (Qᵀ)^{|n|} for n < 0. Q is doubly stochastic, so Qᵀ
is its adjoint. This holds exactly for n = −8…8 by enumerating cylinders, and for all n by the Markov property.
So U restricted to K = closed span{UⁿH : n ∈ Z} is a **minimal unitary power dilation** of Q. By Sz.-Nagy's
uniqueness theorem it is canonical up to unitary equivalence fixing H. On the mean-zero part, Q is nilpotent
(**N2**: Q⁶ = J/64, so Q⁶|V₀ = 0, while rank Q|V₀ = 31). Q|V₀ is therefore of class C₀₀, and by the
Sz.-Nagy–Foiaș theorem (cited, not executed here) its minimal dilation is a bilateral shift. Its multiplicity
is the defect rank, and rank(I − QᵀQ) = rank(I − QQᵀ) = 32 (exact). The inverse limit therefore supplies one
canonical conservative extension of Q. It is infinite-dimensional, and its "32" is the multiplicity of a
shift, not a choice of U(32) element.

**N3 (no finite-dimensional power dilation).** Suppose W is a unitary on a finite-dimensional K ⊇ H with
P_H W^n P_H = Qⁿ for all n ≥ 0. Take x, y ∈ V₀. Then f(n) = ⟨Wⁿx, y⟩ = Σ_k c_k λ_kⁿ, with λ_k the distinct
unimodular eigenvalues of W. Since f(n) = ⟨Qⁿx, y⟩ = 0 for every n ≥ 6, the Vandermonde system at
n = 6, …, 5 + r forces every c_k = 0. Then f ≡ 0, and in particular ⟨Qx, y⟩ = 0. The witness x = ±bit 1,
y = ±bit 0 gives Qx = y and ⟨Qx, y⟩ = 1 (exact). **So no finite-dimensional unitary, and in particular
no permutation lift P_σβ and no element of the U(32)-torsor, reproduces the powers of Q.** Each of those
reproduces only the one-step relation Q = ½(P_σ + P_σ̄).

**N4 (the extension is blind to every lift).** For any map σ on the 64 windows,
μ(h_{n+1} = σ(h_n)) = (1/64) Σ_h Q(h, σ(h)) ≤ ½. Equality holds exactly when σ respects the support, and so
it holds for all 2³² lifts (exact value ½ on the probes). The bit ε_{n+1} is independent of the whole past,
so no rule of any memory length, a 6-bit lift included, is preferred.

## Part S: symmetric lifts

**S0.** The induced maps I, R and S send lifts to lifts and commute on them. R's inversion absorbs the parity
swap RM₀R = M₁. So they generate Z₂³, of order exactly 8 on a generic probe. This differs from the
dihedral relations RSR = IS that Q24 found on *dictionaries*. Only fixed points are used below.

**S1 (⟨I,R,S⟩ alone).** |Fix I| = 2¹⁶, |Fix S| = 2¹⁶, |Fix⟨I,S⟩| = 2⁸ and **|Fix⟨I,R,S⟩| = 64**. In β these
64 lifts form a 6-dimensional F₂-linear subspace. They show 62 distinct cycle types: two types occur twice,
(1²·2·4·8²·20²) and (1²·2·4·8⁴·12²). The subspace contains β = 0 (the cyclic rotation, 1²·2·3²·6⁹) and β ≡ 1
(4·12⁵). The history symmetries leave 64 mutually inequivalent reversible histories.

**S2 (A5 through the dictionary; all 46,080 dictionaries, 768 A5-classes).**
- For **every** D, **no lift commutes with ρ_D(A5)**. So the A5 × ⟨I,R,S⟩-invariant count is **0**.
- In 720 of the 768 classes, no nontrivial element of A5 commutes with any lift.
- In the other 48 classes, exactly one C₃ = {1, g, g²} does. There g is the digit rotation i ↦ i ± 2,
  with the sign mask 0, 111100 or 001111 in that frame. This is Q46's rotation, restricted to the sign
  frames in which it is compatible with a lift. The **C₃ alone fixes a unique lift**, and that lift is
  automatically ⟨I,R,S⟩-invariant. It is β = 0 in 24 classes and β ≡ 1 in 24.
- The 48 classes are closed under ⟨I,R,S⟩ and form **6 of Q24's 96 orbits**. Three orbits select the cyclic
  rotation β = 0, and three select the anti-cyclic lift β ≡ 1. Each orbit selects one β consistently.

## Conclusion

The answer to Q61 is **no**. The inverse-limit completion fixes a canonical conservative extension of Q: the
minimal unitary dilation, a bilateral shift of multiplicity 32 on the mean-zero part. That extension is
infinite-dimensional. It is blind to every finite lift (N4), and no finite lift or U(32) dilation can stand
in for it (N3). Under the symmetries, no lift is A5 × ⟨I,R,S⟩-invariant when A5 acts through the dictionary.
If A5 acts on labels only, 64 lifts remain. The single route to a unique finite lift is *conditional*. If the
dictionary lies in one of the 6 exceptional Q24 orbits (48/768 A5-classes), its C₃ forces β = 0 or β ≡ 1,
according to the orbit. The lift then becomes a function of the dictionary, which Gate A has not selected.
Q24 shows that no history-sum statistic can choose inside an orbit. This result says which 6 of the 96
orbits would also fix a reversible history.

## Scope and what remains open

- Only the 2³² support-respecting *permutation* lifts and A5's signed pulled-back action were classified.
  Lifts that are not permutations (general O(32)/U(32) torsor elements) were treated only through N3.
- The bilateral-shift identification uses the Sz.-Nagy–Foiaș C₀₀ theorem by citation. The certificate
  checks its inputs (nilpotency on V₀ and the defect ranks), not the theorem itself.
- Executed in Claude's cloud sandbox: exit 0, 8–9 s. The A5 rotations come from Q24's sympy-free
  reconstruction. When sympy is present (CI), the certificate asserts they are identical to the original
  Q11 module.

## RESUME HERE

Next question (Q62 [derive]): on the 6 exceptional orbits, does the C₃-selected lift (β = 0 or β ≡ 1) act
compatibly with the native hidden carrier? Concretely, does P_σβ commute with the H13⊕H51 split, or map
im U_h into itself? Or does any native operator distinguish the β = 0 orbits from the β ≡ 1 orbits? This
would turn the conditional selection into either a derived one or a further non-uniqueness.
