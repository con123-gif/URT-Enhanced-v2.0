# Newton's Cathedral / URT — Integrated State and Proof Audit
**11 October 2026.** Chat-first reconstruction, with later corrections taking precedence. This is a checkpoint, not a substitute for the conversations. No empirical values are inserted in the calculations below.

## Decision
The Cathedral currently defines a nontrivial *finite mathematical framework*, not a derived and independently established parameter-free theory of nature. That statement is supported by explicit non-uniqueness constructions below, rather than by an absence-of-research argument. Neither a numerical agreement nor a matching symmetry representation supplies a physical identification of an operator.

## 1. Canonical microscopic spine (preserved)
1. **History selector URT.** Canonical logarithmic spiral `q=(π/e) exp(i 2π/φ²)`, with `φ=(1+√5)/2`. Angular selection `α_URT=φ^-2`, golden increment `2π/φ²`; URT is the history/selection principle, not entropy. In the latest corrected formulation the spiral is implemented by symplectic phase-space transport `S_URT=diag(κ R_θ,κ^-1 R_θ)` and its metaplectic lift `U_URT`. Do **not** identify this non-Hermitian spiral multiplier with the positive transfer generator.
2. **Positive transfer.** `T=B†B`, with histories weighted by the positive operator; in one corrected formulation `C=U_URT B`, so `C†C=T`. Exact microscopic positivity is a mathematical claim, not a derivation of physical time evolution.
3. **Finite geometry.** The identity `4+D²=1+4D` has **two** mathematical solutions, `D=1` and `D=3`; the nontrivial three-dimensional/icosahedral branch selects `D=3`, `N=13` with that extra structural requirement. The equality alone cannot prove uniqueness of `D=3`. The 13-site centre-plus-icosahedron Laplacian spectrum is `0(1), 6−√5(3), 7(5), 6+√5(3), 13(1)`. Icosahedral shell `1⊕3⊕3′⊕5`, hidden `4_3⊕4_5`, hidden carrier `H_8=4⊕4`. Preserve `D6 → A4/H3`, antipodal/golden splitting and KO-6 formulation as structural constructions.
4. **Rails and entropy.** `γ=1/81`, `d_class=3/20`, `d_star=80π/(1053 φ)`, `Δ=d_class−d_star`, `η=−lnΔ`. Hidden modular generator `L_hid=3P_3+5P_5=4I+Γ_F` and `ρ*=(I4⊕Δ²I4)/[4(1+Δ²)]`. `p5=Δ²/(1+Δ²)`, `χ_35=8η (1+Δ²)/(1−Δ²)`. The full von Neumann entropy is `S(ρ*)/kB=ln4+H2(p5)`; its variable part is `H2(p5)` and `dS=2kB η dp5`.
5. **Gauge/matter candidate.** The 16 real response directions under the hidden sector are `4_g⊕1_Y⊕3_W⊕(3′⊕5)_C`. There are explicit Lie-algebra models for an `su(2)` factor on the 3 and an `su(3)` factor on `3′⊕5`; this remains distinct from deriving a unique *physical* Standard Model representation/currents/chiral interactions. Finite algebra candidate `C⊕H⊕M3(C)`, KO-6 signs, 16-state generation with `ν_R`, hypercharge assignment and anomaly checks. Exact charge traces: `Tr Q²=16/3`, `Tr T3²=2`, `Tr Y²=10/3`, hence a GUT-type tree-level `sin²θ_W=3/8`.
6. **History and flavor.** `H64=H13⊕H51`, not 60 directed histories multiplied again by three generations. Feshbach identity `K_f(z)=zI13−A_f−B_f(zI51−D_f)^-1 C_f` yields a pole equation. The operator blocks must be explicitly species loaded before resulting poles, residues, generation count, masses and mixings are derived. Earlier six-return/generation-depth shortcuts were rejected and should not be restored automatically.
7. **Gravity/cosmology candidate.** Use *same* entropy variation `δS=2kB η δp5`, no second gravity entropy. Proposed `G Λ²/g_U²=η/(16π)` is dimensionless and conditional on an action/area identification. `Ω_m=6/19`, `Ω_Λ=13/19` are candidate ratios; a derivation of the appropriate stress tensor, Friedmann dynamics and cosmological evolution is needed to make them predictions.

## 2. Verified numerical identities (no observations fitted)
With full floating-point evaluation of symbolic inputs:

| Quantity | Calculated |
|---|---:|
| Δ | 0.0024891898404204027 |
| η | 5.9957979867413025 |
| 4Δ | 0.00995675936168161 |
| p5 | 0.000006196027670655383 |
| χ35 | 47.9669783033801 |
| α_root inverse formula | 137.035999178195 |
| η/(16π) | 0.11928261092128908 |
| Ωm candidate | 0.3157894736842105 |
| ΩΛ candidate | 0.6842105263157895 |

Different previously published final digits for Δ came from limited precision/rounding, not a different formula.

## 3. Four synchronized icosahedral layers: valid mathematical integration
For four **labelled** 13-site layers, `H52=C4⊗H13`, with complete tetrahedral layer Laplacian `L4=4I−J`. Its eigenvalues are `0,4,4,4`, so `ΔL4` has `0,4Δ,4Δ,4Δ`. The collective subspace has 13 dimensions and the relative space has 39. The selected transfer `T4=P0+Δ²P⊥` has eigenvalues `(1, Δ², Δ², Δ²)` and can be coupled to the 13-site dynamics. The assignment of pairwise graph weights specifically to Δ is an **extra model hypothesis**, not a derivation from the overlap geometry.

Potential arithmetic bridge to history: `64=(4×13)+12=13+(3×13+12)`. This establishes only a dimension identity. To identify `H51` with `3H13⊕H12` physically, construct an explicit A5-equivariant isometry that intertwines the *actual* history transfer; no such identification is supplied merely by 51=39+12.

Under tetrahedral `A4`, `H13↓A4=2·1⊕2⊕3·3` (the real 2 is 1′⊕1″), and the four-layer tensor has `H52↓A4=5·1⊕4·2⊕13·3`. Because `3↓A4≅3′↓A4`, tetrahedral symmetry permits but does not select a `3↔3′` intertwiner amplitude.

## 4. Constructive gauge Lie algebra result
Let `A` be a real 3×3 antisymmetric matrix, and `S` be a real symmetric trace-free matrix. Then

`𝔰𝔲(3) = {A + iS : A^T=−A, S^T=S, tr(S)=0}`

is an eight-real-dimensional Lie algebra, as

- `[A,B]` is real antisymmetric;
- `[A,iS]=i(AS−SA)` is imaginary symmetric trace-free;
- `[iS,iT]=−[S,T]` is real antisymmetric.

Embedding the icosahedral `3′` as the rotational 3 inside `SO(3)` makes its symmetric traceless square a 5, yielding `3′⊕5` as the adjoint of `su(3)`. An independent `su(2)` acts on the other 3 in a direct-sum representation and commutes with it there. Adding a central `u(1)` gives the desired **Lie algebra** as an explicit construction. This is a mathematical improvement on merely labeling `1+3+8`; it does *not* prove it is the unique action, produces fundamental colour triplets on fermionic states, or yields the observed couplings.

## 5. Explicit finite-to-physical obstruction A: electromagnetic normalization
Consider the pre-existing convention `α^-1=4π χ35 ||Jγ||²`, where the norm must refer to a physical current after lattice-to-continuum normalization. Finite geometry and ρ* fix `χ35` but do not specify the current embedding. Two positive norms produce two different values without modifying any verified finite identity:

`||Jγ||²=1/4` gives `α^-1=150.6927066528`;
`||Jγ||²=1/3` gives `α^-1=200.9236088704`.

The candidate `α_root^-1=137.035999178195` requires `||Jγ||²=0.22734344982921` within this convention. Its extremely close numerical proximity to CODATA is worth investigating but **does not itself fix the norm**. Earlier October Ward-identity/Schur-current calculations recover unit *conserved charge* after hidden-mode dressing; charge conservation does not determine the photon kinetic residue or the physical electric coupling. The October 8 Gaussian photon calculation obtained a finite `Zγ=√5 c/2` on one specified discretization, not a uniquely interacting photon current correlator with all normalization identifications proven.

Therefore, given only the presently recorded microscopic axioms, the map `finite data → physical α` is not single-valued. This is a **conditional non-identifiability theorem**, not a proof that no extension can ever fix it.

## 6. Explicit finite-to-physical obstruction B: Einstein pole
The same modular entropy variation provides `δS=2kB η δp5`. Matching the Bekenstein–Hawking law `δS=kB δA/(4ℓ_P²)` yields the *necessary* identification `dp5/dA=1/(8η ℓ_P²)`; the finite density state does not produce area or Newton's G by that equation.

More importantly, a continuum action built solely by squaring linearized trace-free Ricci produces a transverse-traceless quadratic kernel scaling as `p^4`: because `δR_TT∼p² h_TT`, `(δR_TT)^2∼p⁴ h_TT²`. Its propagator is `1/p⁴`, whereas massless Einstein spin-2 requires a `1/p²` pole. Thus trace-free curvature-square alone is not an Einstein derivation. The required linear-in-curvature dynamics, consistent Ward identities, equivalence principle and horizon area normalization must follow from the microscopic action. Invoking those conditions as assumptions would only establish conditional compatibility.

## 7. Explicit finite-to-physical obstruction C: masses, RG and cosmology
The H64 Schur/Feshbach machinery is exact algebra, but without uniquely specified `(A_f,B_f,C_f,D_f)`, poles and masses vary. A proposed species Yukawa seed `S+δY_f` defines a family; a prediction requires the model to select its species-specific terms and calculate *propagator poles*, not merely static eigenvalues. Tree-level `sin²θ_W=3/8` is a unification normalization, not the measured low-energy angle without a derived RG flow and thresholds.

The cosmological `6/19` and `13/19` ratios sum to unity by construction and roughly resemble observational fractions. Without a derived cosmological solution and independent observable map, they are not yet dynamical predictions. No dimensionful absolute mass can be obtained from pure dimensionless constants alone without an operational physical scale or a dynamically generated scale relative to another dimensionful datum.

## 8. Closure ledger (do not collapse distinctions)
| Layer | Status as of 11 October | Reason |
|---|---|---|
| URT canonical spiral/symplectic phase | Mathematically specified | Action on physical histories not uniquely proven |
| 13-site shell and spectrum | Closed mathematical theorem | Direct matrix diagonalization |
| A5 shell, 4+4 hidden, KO-6 candidate | Finite structural constructions | Physical chiral representation still needs full proof |
| Δ, entropy ρ*, derivative and BKM metric | Closed mathematics | Unique physical generator embedding missing |
| Four to one synchronization | Conditional constructive model | Δ-weighted interactions postulated |
| su2 ⊕ su3 ⊕ u1 brackets | Explicit Lie-algebra realization | Uniqueness, fermionic action and strength missing |
| Hypercharge ratios/one-generation anomaly pattern | Conditional representation result | Matter dynamics and coupling not generated |
| Candidate α formula | Exact arithmetic, numerically close | Current-current normalization not derived |
| Weak mixing tree-level | Derived from chosen one-gen charge representation | Unification-to-IR running unproven |
| H64 history Schur complement | Exact matrix identity | Species-loaded pole spectrum not uniquely computed |
| Entropic gravity variation | Exact differential of chosen ρ* | Einstein massless pole and area law not derived |
| Ωm and ΩΛ rational ratios | Exact arithmetic | Cosmological field equations/observables unproven |
| From chemistry to complex matter | Downstream target | Depends on actual particle/interactions/scale |

## 9. What has been *completed* by this audit
- One integrated statement of the existing micro-to-macro Cathedral machine, preserving the corrected URT/metaplectic vs positive transfer distinction.
- A numerical executable test for 13-site spectrum, 4→1 Laplacian, 52-state product spectrum, entropy, SM-like 16-state charges and a concrete `su(3)` Lie algebra realization.
- Three distinct mathematical reasons that the currently recorded finite data do not yet force a unique Standard Model + Einstein cosmological completion: electromagnetic norm, Einstein kinetic pole, and species transfer/scale.

## Final scope statement
The theory is *not falsified merely because these mappings are missing*. Equally, an experimental numerical match does not prove that those mappings have been derived. A proof of a theory of nature must supply the actual local action or operator family that removes the demonstrated non-uniqueness and produces physically identified predictions. A mathematical theorem of insufficiency is progress because it fixes the boundary between proved finite structure and currently postulated physical interpretation.

**Companion executable:** `cathedral_integrated_audit_2026-10-11.py`.