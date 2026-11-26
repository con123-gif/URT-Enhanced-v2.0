# Compact C: integral strictness and the safe-pair bridge

26 November 2026. **HUMAN SOURCE-MATCHED / PARTIAL; native replay pending.** This is one connected root-reachable contribution: it reconstructs the form-extension, integral strictness, Frobenius-depth transport and third-side pairing used by `SidePairing.isSafe_of_exponents` and `isSafe_smul_sub`. The cut walk and cup-coboundary algebra are already integrated elsewhere and are not repeated. This does not prove RH.

Source: `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`; Lean 4.35.0; Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`. Initial Cathedral base for this derivation: `d67c7a79965b417e5b79ad6a14b39beca6b120b5`; publication is rebased without changing the pinned source content.

## Source ledger

| Role | Pinned path | Git blob |
|---|---|---|
| Strictness and safe pair | `New/Lift/LongGap.lean:103–150, 207–269` | `a94786663aac435dfc1ec846046c87f00ddad141` |
| Exponent/Kisin functoriality | `New/Lift/ExponentLattices.lean:88–170, 218–258` | `0549f09387b53f33790c7af7fc923fa71ca347dd` |
| Tensor exponent pairing | `New/Lift/HodgeExpansion.lean` | `7f8955989647bee0ddf549506d1488cf09536046` |
| Forms and localized Kisin module | `Lib/PadicHodge/WachGamma/KisinModuleDefs.lean` | `344ef024f5ddaee84ab62c0753b8beafbfd602cb` |
| Functional extension/frame | `Lib/PadicHodge/WachKisin/FrameTheorem.lean` | `57d6daa6060f9f00eb27be6525460ba942a73f08` |
| Crystalline cocycles | `Lib/PadicHodge/Crystalline/Defs.lean` | `10e3aee76b3ee7c372209e2d477814754bb09749` |
| Local-field approximation | `Lib/PadicHodge/TateSen/DeRhamFiltration.lean` | `dc4c23217762fe5c0da0a7c70a3d3f7bf297c84b` |
| Four-test consumer | `New/Lift/CupProductBound.lean` | `a5dfa3dc1372433af295f751c4bd4917ed3e323c` |

## 1. Extend an invariant form without losing its integral target

Let the extension attached to a crystalline cocycle be

\[
0\longrightarrow Y\longrightarrow \widetilde Y=Y\oplus C
\longrightarrow C\longrightarrow0,
\qquad g(y,c)=(gy+\alpha(c)(g),c).                         \tag{1}
\]

Fix an equivariant form `mu` on `Y` and a `BdRPlus`-submodule `W` such that `mu(1⊗t)` lies in `W` for every integral `t`. The source constructs an equivariant extension `mu_tilde` on `Y_tilde`, still mapping the integral `A_inf` lattice into `W`, as follows.

Extend `mu` to the `B_cris`-linear map `Lambda` on `B_cris⊗Y`. For each basis vector `c_j` of `C`, crystallinity of `alpha(c_j)` supplies `v_j` with

\[
g v_j-v_j=1\otimes\alpha(c_j)(g).                          \tag{2}
\]

Equivariance of `Lambda` and the hypothesis on `mu` give

\[
g\Lambda(v_j)-\Lambda(v_j)=\mu(1\otimes\alpha(c_j)(g))\in W. \tag{3}
\]

The actual `BdR.exists_sub_mem_of_smul_sub_mem` lemma therefore supplies `a_j` in the local field fixed by the chart subgroup with `Lambda(v_j)-a_j∈W`. Only these basis values are selected; no unjustified claim that `c↦a_c` is linear is needed. Define the linear map on `C` by

\[
\lambda(c_j)=\Lambda(v_j)-a_j,
\]

and extend it to an `A_inf`-linear functional `nu` on the trivial lattice by `exists_functional_extend`. Then

\[
\widetilde\mu=\mu\circ\operatorname{wittFst}
              +\nu\circ\operatorname{projTriv}.            \tag{4}
\]

For a basis vector, (2)–(3) and `g a_j=a_j` give

\[
\mu(1\otimes\alpha(c_j)(g))+\lambda(c_j)=g\lambda(c_j),
\]

so (4) is equivariant; linearity extends this to every `c`. Both summands of (4) send integral generators into `W`, and `projTriv∘inclKer=0`, `wittFst∘inclKer=id`. Thus `mu_tilde` has the required integral bound and restricts exactly to `mu`. This is `exists_extend_form`, not extension of an arbitrary non-equivariant functional.

## 2. Projection-kernel strictness at the same exponent profile

Let `w` lie in `kerWithExponents(i,o)` for `Y_tilde`: it has profile `o`, belongs to the localized integral module, and projects to zero in `C`. Exactness after Witt base change gives `y` with

\[
\operatorname{inclKer}(y)=w.                               \tag{5}
\]

Three separate checks preserve integrality rather than merely giving a rational preimage.

1. `wittFst` and functoriality of `kisinLocAinf` transfer the localized `A_inf` condition from `w` to `y`; letter projection commutes with `inclKer`, so `y` remains in the same letter part.
2. For every form `mu` of type `u` at `i.stepBack(a)`, apply §1 with `W=hodgeFil(-u)` to `mu∘letterProj`. The extension is a form of the same type on `Y_tilde`. Evaluating the exponent condition of `w` and using (5) gives
   \[
   \operatorname{valueAt}_a(\mu,y)\in\operatorname{hodgeFil}(o(a,u)). \tag{6}
   \]
   Hence `y` has exactly profile `o`, with no weakened exponent.
3. If `w` itself lies in `kisinLoc`, the chosen coordinate retraction fixes it. Naturality
   \[
   \operatorname{inclKer}(\operatorname{coordRetract}y)
   =\operatorname{coordRetract}(\operatorname{inclKer}y)
   \]
   together with `wittFst∘inclKer=id` puts `y` in `kisinLoc`.

This proves `exists_inclKer_eq_of_projTriv_eq_zero`. The frame/coordinate-retraction theorem and the local-field approximation in §1 remain explicit foundational inputs; ordinary vector-space splitting would not prove (6).

## 3. The two normalized differences and Frobenius transport

If `x` is a point over `p^e c`, its quotient coordinate is Galois fixed. The source's divided-difference theorem, not cancellation by a presumed unit, gives

\[
(z\tau)^{-1}(gx-x)\in\operatorname{kerWithExponents}(i,o). \tag{7}
\]

If `x,w` are two points over the same `p^e c`, subtraction gives

\[
w-x\in\operatorname{kerWithExponents}(i,o_x\wedge o_w).   \tag{8}
\]

For a point at `i.stepBack(l)`, multiplication by `phi^l` produces a point at `i` with profiles

\[
o\mapsto\operatorname{frobExponent}(l,0,o),\qquad
o'\mapsto\operatorname{frobExponent}(l,1,o').              \tag{9}
\]

The `1` in the difference profile is essential: transport is applied to the normalized expression (7), and `phi^l(z tau)` supplies one extra Frobenius-divisor factor before level `l`. Projection commutes with Frobenius and carries the predecessor's `constantAt` vector to the current letter, so the projected scalar remains exactly `p^e c`.

## 4. Convert exponent positivity into a genuine safe pair

Transport the third-side point from `i.stepBack(l)` to `i`. Write

\[
Z(a,q)=\operatorname{frobExponent}(l,0,o_2)(a,q).
\]

Its profile is antitone in `q`. Apply §2 to kernel vectors `w,y` on the two sides, obtaining integral antecedents with profiles `o,o'`. For allowed jumps `u,u'`, the retained hypothesis is

\[
Z(a,-u-u'-1)+o(a,u)+o'(a,u')>0.                            \tag{10}
\]

If `v≥u+u'`, then `-v-1≤-u-u'-1`; antitonicity and integrality turn (10) into

\[
1-Z(a,-v-1)\le o(a,u)+o'(a,u').                            \tag{11}
\]

Thus the tensor pairing of the two antecedents has profile

\[
c''(a,v)=1-Z(a,-v-1).                                      \tag{12}
\]

For a third-side jump `q` pairing with `v`, one has `q+v≤-1`, hence `q≤-v-1` and

\[
Z(a,q)+c''(a,v)\ge1.                                      \tag{13}
\]

Equations (11) and (13) are the two actual calls to `wittPairing_mem_withExponents`. The Tate-lattice theorem at exponent one now puts the nested pairing in the integral lattice. The chart identity identifies `z` with the Teichmüller lift of the uniformizer, hence in the Witt maximal ideal; its image lies in `smallPart`. Finally `wittPairing_constantAt_and_thirdPairing` says that the same transported third point, whose projection is `p^kappa`, evaluates to `p^kappa` times the original pairing. This proves both

\[
\operatorname{IsSafe}_\kappa((z\tau)w,y),\qquad
\operatorname{IsSafe}_\kappa(w,(z\tau)y).                 \tag{14}
\]

No division by `tau`, replacement of strict positivity by nonnegativity, or separately chosen third-side witness occurs.

For `isSafe_smul_sub`, use (7) for the first vector. The second vector `g y` remains in the same kernel profile because it is `y+(g y-y)` and both summands satisfy it. Apply the first clause of (14); multiplying back by `z tau` gives exactly

\[
\operatorname{IsSafe}_\kappa(gx-x,,g y).                 \tag{15}
\]

Equations (5)–(15) supply the integral bridge used by every nonzero local term in the already reconstructed four-test cut walk. Together with `isSafe_sum` for the letter decomposition, the consumer is `ScaledCupBounds.of_isSafe → crystalline_defect_le → sum_blockLoss_le → ribet_columns`.

## Checks, failures and boundary

- Verified all eight source blobs and literal declaration anchors.
- Exhaustively checked (10)→(11) in 72,098 admissible integer cases and (12)→(13) in 325 ordered-profile cases over `[-12,12]`; no failures.
- Negative control 1: over rationals, `Z=Z'=1/2`, `o=o'=0` satisfies strict positivity but not `1-Z'≤o+o'`; integer discreteness is essential.
- Negative control 2: with `Z=1`, `Z'=0`, `o=o'=0`, strict positivity holds but (11) fails; antitonicity cannot be dropped.
- `lean`, `lake`, and `elan` are unavailable locally. The accompanying import/check probe is **PREPARED, NOT A LEAN PASS**. No prior CI receipt validates these new files.
- This reconstructs the native proof cluster but does not replace or reprove the foundational frame theorem, Witt tensor exactness, local-field approximation, tensor-exponent theorem, Tate integral-lattice theorem, or `smallPart` construction. No native dependency is marked retired.
- No RH theorem, URT premise, or fake scalar-to-lattice identification is imported.

**RESUME HERE:** Audit and integrate §§1–4 immediately after the manuscript's cut-walk paragraph. Then descend the still-retained integral frame/depth theorem used by `pointsOver_nonempty_of_long_gap`, or the balanced-row/reciprocity suppliers entering `RibetElement.lean:143–223`; do not revisit the cut recurrence, cup cancellation, or first-order coefficient algebra.

**HANDOFF TO:** editor/integration for concise insertion; formal audit/kernel runner for the prepared probe; mathematics/Galois for the remaining frame and balanced-row primitives.
