# Q60 — Exact original all-five/H64 source to Hopf four-charge frame bridge

12 November 2026. **THEOREM on the fixed finite-source geometry; CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.** Independently reconstructed local source and 2I Hopf shell executed exit 0; original archived named-source CI is required separately. This continues the **new Hopf charged-carrier route** Q55, not a replacement by the older source-free 190×24 Euclidean action. No H64↔v61 mapping or physical proper-time law claimed.

## Data and frame identification

Start with original 7 Nov all-five Platonic 190-cochain action's 50-vertex source map `Eglobal`, 20-face icosahedral hidden projectors `P3^old,P5^old`, and the genuine original 64-history partial isometry `U_h (64×20)`, with `U_h†U_h=P_h^old=P3^old+P5^old`. Keep all five solids in construction of `Eglobal`; no smaller invented history representation.

On the other side use 12 Nov 2I Hopf shell and newly checked Q55 charged section maps `T_n=B_n†F P_h^Hopf`, charge n=±2,±4, with `∑ T_n†T_n=P_h^Hopf` and `L_n T_n=15 T_n`.

These sources use different labelings and spatial orientations of the **same geometric icosahedron**. Instead of equating their 20 face indices without proof, enumerate the 24 proper signed-permutation matrices `R∈SO(3)` and match their 12 vertex directions and 20 face-normal directions. Exactly **12** choices pass the strict native point-set and face-projector tests. One deterministic lexicographic choice is

`R=[[-1,0,0],[0,0,-1],[0,-1,0]]`;

`J: old-face index -> Hopf-face index = [13,7,11,17,5,12,6,9,15,3,10,16,4,8,14,2,19,18,1,0]`.

Here `J` denotes the resulting 20×20 permutation matrix. It obeys **both** `J P3^old J†=P3^Hopf` and `J P5^old J†=P5^Hopf` (residuals `5.15e-15`, `1.09e-14` independently). This resolves the actual data-level face-frame discrepancy. The 12 acceptable discrete rotations are a frame choice; no measured constant was fitted and no claim is made that URT chooses one physical direction.

## Theorem — 64-history to 48-state charged fixed-frame isometry

For n=±2,±4 define **using the original named operators**

`M_n := T_n J U_h†`, of size `12×64`.

Let `P8:=U_h P_h^old U_h†` be the native eight-dimensional hidden projector on H64, and stack the four `M_n` to `M:C^64→C^48`. Using `J†J=I`, `U_h†U_h=P_h^old`, `J P_h^old J†=P_h^Hopf` and Q55 completeness,

`M†M = P8`.

Likewise the actual four charge-sector 600-cell Wilson kinetic is `L_ch=diag(L_2,L_-2,L_4,L_-4)`, and Q55 proves

`M†L_ch M = 15 P8`.

Therefore **M is a bona fide norm-preserving linear embedding on the original native H64 hidden eight**, not merely an 8-dimensional toy identifier. This is a fixed-frame Hilbert-space result; it does not yet assert local U(1) covariance of the sourced join, because the four output sectors have distinct fibre charges.

## Direct original all-five nonlinear source test

Use the deterministic existing collective vertex field `v50=Eglobal(e0+e3)`, and the original source `h_s=P_s^old[(C Plinear v50)⊙²]`. With frozen `Δ`, original history source vector is `b=U_h(h3+Δ h5)`. The following **model-internal** identities are independently checked:

`||b||²=||M b||² = 2.16678972959474`,

`<M b,L_ch M b>=15 ||b||² = 32.5018459439211`.

Computed residuals: `||M†M-P8||_F=8.73e-15`, `||M†L_ch M-15P8||_F=2.18e-13`. This tests the native 50→8→20→64 history route and the actual 2I charged carrier without a fitted coupling, with no need to revive the rejected Haar phase-bin bridge.

## What is and is not solved

**Solved:** explicit valid proper face-frame map; the original H64 hidden source has an exact four-charge Hopf-isometric output; the output's quadratic Wilson kinetic is fixed to 15 times its input norm, with exact derivation and numerical check. This is genuine progress toward the missing charged source carrier.

**Not solved:** The original 24-clock H64 source transforms with charge two, while the four 2I fibre sheets transform as charges ±2,±4. One **complex-linear, locally covariant** map under a single unrestricted U(1) cannot simultaneously intertwine all four inequivalent weights without additional tensor powers, conjugate factors, or a separate charge-transport prescription. The fixed-frame map M is not such an intertwiner. Full sourced gauge action, first/second **joined** Ward contacts, physical photon projector, pole/residue and H64↔v61 comparison remain open. Do not conflate the kinematic Q55 Ward test with full interacting Ward completion.

## Reproduction and continuation

Local independent complete icosian and original Nov7 five-solid reconstructions: `OPENBLAS_NUM_THREADS=1 python Q60_HOPF_H64_ALL_FIVE_FRAME_INTERFACE_VERIFY.py --old-reconstruction /mnt/data/q56_native_reconstruction.py --hopf-reconstruction /mnt/data/hopf_q55_fourcharges.py` exited 0. The repo check imports the named original Nov7 file and Q55 native Hopf certificate. It must pass native GitHub CI separately.

**RESUME HERE:** Derive an actual charge-matched source-transport functor from URT that maps 24-track charge-two history to the ±2/±4 Hopf-fibre sections. At minimum distinguish a real-linear ± pair from the four-sector frame isometry, and derive all Wilson seagull contacts after joining. Do not repeat Q56 or collapse the four sectors into v61.
## Addendum — exact charge-matching obstruction for the already constructed fixed-frame lift
The source b on the native H64/24 model transforms as global charge +2, b→exp(2iα)b. An output in Hopf charge n transforms as exp(inα)M_n b. Therefore a **complex-linear nonzero** M_n can intertwine both actions for all α only if n=2. The explicit native M_n for n=-2,4,-4 have rank four, so no single complex-linear globally equivariant four-charge source embedding exists. This does not exclude anti-linear conjugation for n=-2, nonlinear charge-four sources, or a more general coupled construction. The stand-alone code evaluates the resulting nonzero defects at the frozen golden phase, in addition to the exact algebraic proof. It is not a no-go for the project.
