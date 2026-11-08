# Newton's Cathedral — modular source matching and a precise uniqueness obstruction

**Date:** 2026-11-08 · **Status:** exact finite theorem, checked against the original 2026-11-07 joint source-loaded 190×64×24 construction. **No third-party Yang–Mills material is used.** This is not a derivation of the Standard Model or Einstein field equations.

## Research question

Can the frozen π–φ–e URT constants, all five Platonic cellular complexes, the native 64 signed histories, the hidden 3/5 Gibbs state, and the 24-position charged clock *force the same unique nonlinear source-loaded transfer* without additional premises?

There is an exact positive answer for one important interface and an exact negative answer for the **unqualified** uniqueness claim. The distinction is mathematical, not merely evidentiary.

## Existing full Cathedral inputs (retained without reduction)

- All five independently oriented Platonic surface complexes, 190 geometric cochains and 50 vertex degrees; original cross-solid bridge and degree-1/2 common harmonic map `Plinear: C^50 → C^12` of rank 8, whose image is the `3 ⊕ 5` icosahedral carrier.
- Original six-bit signed-history operator `Hbits` on 64 states with spectrum `0(2), 10(12), 16(30), 18(20)`.
- Native hidden partial isometry `U: H_hidden → H_64` and two orthogonal rank-four projectors `P3`, `P5`, with `Hbits U P3 =18 U P3`, `Hbits U P5=16 U P5` and `U*U=P3+P5`.
- Primitive `r=π/e`, `θ=2π/φ²`, `Δ=3/20−80π/(1053φ)>0`, `η=−lnΔ` and the full `Z/24Z` charge-1/charge-2 clock transport.
- The *already selected* bilinear source `x=Plinear(v50)`, `h_s=P_s [(Cx)⊙(Cx)]` for `s=3,5`, with `C` the 20×12 face–vertex incidence. The choice of `Plinear` and the pointwise source is not being silently re-derived here.

## Theorem 1 — positive Gibbs amplitude forces the Δ ratio

On `H_hidden=4_3 ⊕ 4_5` set

```
L_hidden = 3 P3 + 5 P5
T_hidden = exp[-η (L_hidden−3I)] = P3 + Δ² P5
ρ* = T_hidden / Tr T_hidden
   = (P3+Δ²P5)/[4(1+Δ²)].
```

**Claim:** the unique *positive semidefinite* operator `B_hidden` satisfying `B_hidden²=T_hidden` is

```
B_hidden = P3 + Δ P5.
```

**Proof:** `P3 P5=0` and `P_s²=P_s` imply `(P3+Δ P5)²=P3+Δ²P5`. Its spectrum on the carrier is `{1(4), Δ(4)}`, hence it is positive. The finite spectral theorem states that every positive semidefinite operator has one and only one positive semidefinite square root. QED.

**Physical selection condition:** if the unweighted nonlinear hidden source `h=h3+h5` is transported by the same *positive amplitude* whose square is the frozen Gibbs transfer, the source injection is **forced** to be `B_hidden h=h3+Δh5`. This is a conditional theorem selecting the previously assigned Δ amplitude. It does *not* show that the primitive URT map uniquely chooses the positive amplitude source-transport rule: for a general factorisation `T=B†B`, `UB` has the same `T` for every unitary `U`, and additional microscopic path rules are needed to identify the physical factor and source map.

## Theorem 2 — full original 24-clock Gaussian history can be eliminated exactly

Retain the original charge-2 covariant cycle Laplacian `L24^(2)(θ)≥0`, and define `A18=18 I24+r² L24^(2)`, `A16=16 I24+r² L24^(2)`. The historical joint source action on the two hidden quartets, extracted from the original 190-geometric/64-history/24-clock action, is

```
V(h,y) = (1/2) <y, (Hbits+r² L24^(2)) y>
         +(1/4)(||h3||² + Δ²||h5||²)
         − Re<y,U(h3+Δh5)>.
```

The source has no component in the kernel of `Hbits`. Thus its full 64×24 minimiser has no *assumed* reduced 13-state closure:

```
y_opt = U(A18^(-1) h3 + Δ A16^(-1) h5).
```

Substitution yields the exact Schur complement

```
V_eff = (1/4)(||h3||²+Δ²||h5||²)
       −(1/2)<h3,A18^(-1)h3>
       −(Δ²/2)<h5,A16^(-1)h5>
     ≥ (2/9)||h3||²+(7/32)Δ²||h5||² ≥0.
```

**Proof:** `U†U=P3+P5` with orthogonal channels and `Hbits U P3=18 UP3`, `Hbits U P5=16 UP5` block-diagonalise the quadratic history restriction. The unique minimiser of each positive block is its inverse applied to the linear source. Since `L24^(2)≥0`, `A18^(-1)≤I/18` and `A16^(-1)≤I/16`. Hence `1/4−1/(2·18)=2/9` and `1/4−1/(2·16)=7/32`. Equality in the block lower bound requires a zero clock-energy source (normally forbidden by the nontrivial golden holonomy); the inequalities are unconditional for the stated finite operators. QED.

For geometric fields of clock charge 1, the quadratic source has charge 2. The mixed term is gauge invariant only when the history field also has charge 2 (up to the chosen unit charge convention). This explains the previously constructed charge doubling without selecting observed particle charges.

## Theorem 3 — symmetry allows multiple quadratic sources even on the selected portal

The eight-dimensional image of the original `50→8→12` source portal carries the **A5** representation `W=3⊕5`. The two distinct energy-eigenvalue hidden quartets each carry the irreducible `4`. On the five conjugacy classes of `A5`, with class sizes `(1,15,20,12,12)`, the character of `W` is

```
χ_W = (8, 0, −1, φ, 1−φ).
```

Using the exact character formula

```
χ_Sym²W(g) = [χ_W(g)²+χ_W(g²)]/2
```

and the fact that squaring swaps the two order-5 conjugacy classes, one obtains

```
χ_Sym²W=(36,4,0,1,1).
```

The character of the irrep `4` is `(4,0,1,−1,−1)`; therefore

```
dim Hom_A5(Sym² W, 4)
  = [36·4 + 15·4·0 + 20·0·1 −12−12]/60 = 2.
```

There are two target quartets with different hidden energies, hence

```
**dim Hom_A5(Sym²(3⊕5), 4_3⊕4_5) = 4.**
```

The *full 12-vertex* shell `1⊕3⊕3′⊕5` has symmetric-square character `(78,6,0,3,3)`, so the corresponding multiplicity is **8**. These are representation-theoretic dimensions of permissible quadratic equivariant maps, not claims that every map is physically realised or that A5 acts on the separate tetrahedron/cube as it does on the icosahedron. The original whole-five source portal reduces to `3⊕5`, so the four-channel count is the relevant one here.

**Consequences:** rotational/A5 symmetry does not uniquely pick the nonlinear history source. The pointwise face-incidence map *is a defined choice among admissible maps*. The uniqueness of the **positive modular amplitude in Theorem 1** does not remove the **source-map ambiguity** established here. QED.

## Theorem 4 — explicit two-model counterexample with no empirical fitting

Retain the original 190 cochains, `Plinear`, the native 64 history kinetic, all 24 covariant clock links, all source maps, all URT constants and all gauge transformations. Replace just the source ratio `Δ` by a nonnegative dimensionless number `g` **consistently** in both linear source coupling and its positive quartic contact:

```
V_g(h,y)=1/2 <y,(Hbits+r²L24^(2))y>
        +1/4(||h3||²+g²||h5||²)−Re<y,U(h3+g h5)>.
```

Exactly the same Schur proof gives

```
V_g,eff = c3(h3)+g² c5(h5),
  c3=1/4||h3||²−1/2<h3,A18^(-1)h3> ≥2/9||h3||²,
  c5=1/4||h5||²−1/2<h5,A16^(-1)h5> ≥7/32||h5||².
```

Both **`g=Δ` and `g=Δ²`** are functions solely of the frozen original URT constants: neither introduces a fit to observed data or a freely adjusted parameter. Both preserve gauge invariance, full history/clock dimensions, and strict positivity under the original golden holonomy. They differ whenever `h5≠0`, with exact difference

```
V_(g=Δ),eff − V_(g=Δ²),eff = (Δ²−Δ⁴) c5(h5) >0.
```

In the saved *actual* original 7 November all-five sampled source, our independent audit found

```
V_Δ,eff       = 0.00145352509852776
V_Δ²,eff      = 0.00145352403530022
Difference    = 0.00000000106322754398445.
```

The original model's zero-field eight-state Gibbs reference remains `p5=Δ²/(1+Δ²)` for either candidate. The source-dependent KMS variational term may be added with `E5=(g²/4)||h5||²` and is nonnegative, so it does not remove this ambiguity at the level of the stated invariance/positivity/no-fit premises.

The `g=Δ²` model **does not** obey the *additional positive modular source-amplitude matching condition* in Theorem 1. Therefore the two-model construction does **not** disprove uniqueness if that extra condition can be deduced from primitive URT; it proves precisely that the other already-stated finite conditions **do not imply it**. QED.

## What has now been proved — and the exact remaining premise

**Proved:** (1) the unique positive Gibbs amplitude yields the original `Δ` hidden-source weighting; (2) the native source-loaded 64-history/24-clock Schur complement and positivity follow exactly, with no premature 13-state reduction; (3) `A5` symmetry permits **four** independent quadratic maps on the existing `3⊕5` portal; and (4) the remaining finite constraints admit two different positive nonlinear models with the same frozen constants, so they cannot alone imply a unique macroscopic physics.

**Not proved:** primitive URT uniquely selects the `50→8→12` source portal, its particular `A5`-equivariant quadratic channel, the physical unit of gauge charge, the physical spatial-time refinement and nontrivial 3+1-dimensional quantum continuum, or the Standard Model and Einstein action. The archived rank-eight intertwiner between the two distinct 64-state histories does not become a global intertwiner by the present source matching. The mathematical obstruction here identifies the missing *source-selection rule* rather than requiring the programme to restart.

**Reproduce, from original archived source:**

```bash
python test_cathedral_constructed_joint_2026_11_07.py
python cathedral_modular_joint_interface_verify.py
```

The second test reconstructs the original 190D geometry, 50→8→12 portal, full 64Hbits, and charge-2 24-clock; checks the projector square-root identity, exact `A5` character multiplicities, full history elimination, source positivity, gauge covariance, and two no-fit choices. Both tests passed on 8 November 2026.

**Provenance:** original Newton's Cathedral model, archived as `cathedral_constructed_joint_dynamics_2026_11_07.py` with its companion report/results/verification logs. No James Montgomery Lockwood/Yang–Mills manuscript or third-party code is used here. This theorem should not be confused with the independent Lockwood-attributed constrained-block or energy-dual response work, which is separately cited in the 8 November curvature-response directory.
