# Newton's Cathedral / URT: exact gauge-neutral two-quartet response and four cubic cumulants

**10 November 2026. New original mathematics, no fitted parameters.** This is a theorem about the **specified** original five-Platonic (190-cochain) nonlinear source pulled back to the six signed icosahedral axes, the 64 six-bit histories and their primitive unaveraged dyadic chronology. It uses the archived all-five-solid isometric source dictionary `Eglobal`, `Plinear` and the native hidden `4_3 ⊕ 4_5` projectors. The six-bit temporal cylinder ↔ geometric sign-history dictionary is still a stated hypothesis, not a uniqueness theorem for the primitive pi/phi/e recursion. The native 24-clock and its charge-two Wilson/diagonal Ward symmetry remain part of the model, but are **not** inserted as an arbitrary multiplicative factor into stationary six-bit cumulants. `H13⊕H51` physical charged fermion currents and pole observables are **not** derived in this note.

## 1. Ward selection corrects the interpretation of the earlier A5 cubic source

The original native action has diagonal local-in-time U(1): `z_t -> e^{i lambda_t} z_t`, `y_t -> e^{2i lambda_t} y_t`, and the temporal link transforms accordingly. Both original hidden source components `h_a=P_a[(C Plinear v)^2]`, `a∈{3,5}`, have charge +2. Consequently, an A5-invariant cubic polynomial `T_3(h_5,h_5,h_5)` has charge +6. Its expectation as an **undressed local physical observable** vanishes under the gauge average. It cannot be a standalone local gauge-invariant cubic term. A compensating charge -6 field, an appropriate charged-matter composite or another gauge-covariant dressing is required. This does **not** invalidate the earlier exact real-gauge-slice source cumulant; it invalidates identifying it directly with a physical charged cubic coupling without a source-to-observable theorem.

For the five consistently oriented A4-singlet unit vectors `v_i` in the 4-dimensional hidden icosahedral A5 representation, the exact regular-simplex Gram matrix gives

`(1/5) Σ_i v_i v_i^T = I_4/4`,

`T3=(1/5) Σ_i v_i⊗v_i⊗v_i`, `||T3||² = (1/25)[5+20(-1/4)^3] = 3/16`.

Thus the archived A5-averaged second cumulant `71/48` is **exactly** one quarter of the full hidden-`4_5` Green–Kubo trace `71/12`, without assuming the six-bit chronological shift commutes with A5. The cubic tensor is nonzero and A5 invariant but U(1)-charged; its sign is globally orientation-sensitive. These are different symmetries and must not be conflated.

## 2. Native gauge-neutral observables

Write the original exact icosahedral face source in `Q(sqrt(5))` as

`E_f(h) = (Σ_{i∈f} A_i(h))² + 1/2 (Σ_{i∈f} B_i(h))²`,

`O_f(h) = (Σ_{i∈f} A_i(h))(Σ_{i∈f} B_i(h))`,

where `A_i=5/16[d_i²-||u||²/(3(φ+2))]`, `B_i=d_i/2`, `d_i=p_i·u/(φ+2)` and `u` is the signed sum of the six antipodal icosahedral-axis representatives. The archived all-five-solid pullback proves that the corresponding native hidden source vectors are `h_3(h)=sqrt(2) P_3 O(h)` and `h_5(h)=P_5 E(h)`. Their two **gauge-neutral** squared norms are

`n_3(h)=2 O(h)^T P_3 O(h)`, `n_5(h)=E(h)^T P_5 E(h)`.

They are source observables, **not** physical particle mass or gauge pole residues. They have no freely adjusted coefficients. They are invariant under the native diagonal U(1) because `h_a -> e^{2iλ} h_a`.

### Exact 64-history distribution

The exact Q(sqrt5) computation gives

`n_5 ∈ {0, (56−24sqrt5)/5, (56+24sqrt5)/5}`

with multiplicities **24, 20, 20** respectively. In particular

`E_Haar[n_5]=7`, `E_Haar[n_3]=36+(72/5)sqrt5`.

The face incidence was obtained from the icosahedral convex hull and then **certified exactly**: each of the 20 faces is a strict supporting triangle in `Q(sqrt5)`, the 30 edges occur in exactly two faces, and both hidden projectors are exact rational rank-four orthogonal projectors. The script does not rely on floating-point face identification for the theorem.

## 3. Exact time-integrated two-source covariance

Let `Q[h,2h mod64]=Q[h,(2h+1) mod64]=1/2` and let `g_a=n_a−E[n_a]`. The Haar measure is stationary and `Q^6=J64/64`. Define the Green–Kubo matrix

`K_ab = E[g_a(0)g_b(0)] + Σ_{d=1}^5 (E[g_a(0)g_b(d)]+E[g_b(0)g_a(d)])`.

The original hidden-vector lag certificate `C5=[7,7/40,−61/120,−1/24,−1/6,0]` gives the independent check `C5(0)+2Σ_{d≥1}C5(d)=71/12`, consistent with the A5 frame theorem. The **new neutral norm** lag sequence is

`C_55^neutral(d)=[507/5, −41/25, −49/25, 9/5, −9/5, 0]`.

The complete exact neutral matrix is

```
K_33 = (2554416 + 1135296 sqrt5)/625  = 8148.824048933762...
K_35 = (  57780 +   23112 sqrt5)/125  =  875.680024767801...
K_55 = 471/5                         =   94.2
```

and

`det K = (1259712+559872 sqrt5)/3125 > 0`.

The normalized correlation is `K35/sqrt(K33 K55)=0.9994763483669554...`. Hence the two neutral hidden source channels are **strongly coupled but strictly not the same random response**. The positive determinant is an exact no-collapse certificate; it is not a physical particle mixing angle.

## 4. Four exact symmetric cubic cumulant-rate components

Define the stationary additive source cumulant tensor

`K_abc^(3)=lim_{T→∞} (1/T) Cum(Σ_{t<T} g_a(t), Σ_{t<T} g_b(t), Σ_{t<T} g_c(t))`.

For any mean-zero six-bit cylinder `g`, its third cumulant rate is the finite identity

```
K3(g) = E[g³]
      + 3 Σ_{d=1}^5 ( E[g(0)²g(d)] + E[g(0)g(d)²] )
      + 6 Σ_{a,b=1}^5 E[g(0)g(a)g(a+b)].
```

The 6-bit window independence makes the omitted terms **exactly zero**. The four components of the symmetric rank-three tensor on the **two neutral channels** are

```
K333 = (8470303488 + 3786974208 sqrt5)/15625 = 1084047.0557520913...
K335 = ( 182596032 +   81248832 sqrt5)/3125  =  116567.6619022273...
K355 = (   4092552 +    1671408 sqrt5)/625   =   12527.8942498192...
K555 = (    152754 +       6912 sqrt5)/125   =    1345.6776148838...
```

The defining check is `K3(u g3+v g5)=u³K333+3u²vK335+3uv²K355+v³K555`. Two independent implementations agree: one uses exact `Fraction` arithmetic in `Q(sqrt5)` and the closed finite-correlation formula; the other reconstructs the native 64-state face source in floating point and sums **all** third-order lag pairs over a 10-step horizon. The exact implementation also independently enumerates all lag pairs at horizons 10 and 12 and obtains the identical algebraic expression. No historical ARF coefficient is an input.

These **four** numbers are four mathematical components of a **neutral source cumulant tensor**. Their being four does **not** identify them with the four historical physical ARFs; no source-to-fermion/gauge/rail pole map has been proved.

## 5. Ward contacts, including the nonlinear source seagull

For the native complex geometry field `x`, put `w=Cx`, `h=P(w⊙w)`, `n=h†h`, `P=P3` or `P5`. The first and second variations are

`δh(ξ)=2P[w⊙Cξ]`, `δ²h(ξ,ζ)=2P[(Cξ)⊙(Cζ)]`,

`Dn[ξ]=2Re(h†δh(ξ))`,

`D²n[ξ,ζ]=2Re(δh(ξ)†δh(ζ)+h†δ²h(ξ,ζ))`.

For the **full exponential** gauge orbit `x(t)=e^{it}x`, the first and second Ward identities are

`Dn[i x]=0`,

`D²n[i x,i x]+Dn[−x]=4n−4n=0`.

The second term is the **required second-order field-rotation contact**; omitting it would falsely infer gauge stiffness from a gauge orbit. The independent numerical script checks both identities for both projectors to floating-point zero. These are source Ward contacts. The charged-history Wilson current and its separate link seagull `∂²S/∂A²` remain as proved in the preceding native charged-matter theorem; they are not replaced by the neutral source contacts.

## 6. Hypotheses, falsification and the precise remaining proof

**Established in this conditional native source dictionary:** exact Q(sqrt5) hidden norms and multiplicities, two neutral Green–Kubo channels with positive determinant, four exact symmetric neutral cubic cumulants, A5-frame identities, diagonal-U(1) charge selection, first- and second-order source Ward contacts, and independent numerical verification of original hidden-vector lag certificates.

**Falsified as an undressed physical interpretation:** the previous nonzero A5 **charged** scalar third cumulant is not itself a local gauge-invariant cubic observable. Likewise, the new four **neutral** cubic cumulants are not automatically the four physical ARFs.

**Still open:** the uniqueness of the six-bit geometric-history dictionary from the original pi/phi/e URT recursion; the dynamical choice of the full 190-cochain spatial gauge links and charged fermion `H13⊕H51` representation; and, crucially, an **equivariant, Ward-contact-complete source-to-pole intertwiner** mapping these original source observables into physical electromagnetic current normalization, rail response and fermion mass pole residues. Without this map, a numerical agreement with historical ARF targets would be a relabelling, not a derivation. No measured value, fitted parameter or external Yang–Mills work was used.

## Reproduction

Run from the `new_gate/` directory:

```
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python URT_A5_NEUTRAL_SOURCE_EXACT_CUMULANTS_2026_11_10.py
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python URT_NEUTRAL_HIDDEN_SOURCE_CUMULANT_2026_11_10.py
```

The exact program needs `sympy`, `scipy` and `numpy` only for geometry/verification, and uses `Fraction` for every algebraic source and cumulant operation. The numerical program uses a separate matrix-based source construction and independent lag enumeration. Both retain the original six-axis history ordering and archived five-solid pullback; neither edits the original model.
