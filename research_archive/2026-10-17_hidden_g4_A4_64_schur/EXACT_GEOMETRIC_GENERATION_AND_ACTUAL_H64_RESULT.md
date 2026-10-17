# Cathedral: exact chiral G4 zero-triplet, A4 generation projection and native H64 Schur (17 October 2026)

**Executed against unmodified cathedral_strict_64_closure.py. No observed charged-lepton masses, fitted phase, or external coupling in the operators below.** Distinguish the *coarse cellular 64* from the independently recovered signed-history H64, which is not automatically the same representation.

## 1. True hidden critical seesaw
L2=d2.T d2, H3=P_(lambda3), H5=P_(lambda5). Canonical signed face chirality W satisfies W.T=-W and W²=-15(P3+P5). The Hermitian operator D_ch=L2+iW has hidden spectrum {0x4, 8x4}, and the **exact rank-four zero projector**
```
P0=(5P3+3P5-iW)/8.
```
Its trace is 4 and (L2+iW)P0=0. These are algebraic identities of a *new chiral face operator*, **not** zeros of the original species-loaded coarse cellular Dirac. Native numerical residuals ~2e-14; exact projector arithmetic is verified with rational SymPy.

## 2. Genuine A4 1+3 decomposition
Construct the 12 actual tetrahedral rotations of the icosahedron by even Cartesian sign flips plus the cyclic permutation x→y→z. Their 20-face group mean A4bar gives exact projectors `P_singlet=P0 A4bar` rank1 and `P_triplet=P0(I-A4bar)` rank3. The choice of tetrahedron fixes an orientation frame, not a mass parameter.

## 3. New parameter-free C3 splitting, and exact connected cumulant
For an actual face stable under the 3-cycle, define its intrinsic positive effect
```
Eface=(1/9) sum_(v in chosen 3 vertices) diag(c_inc[:,v]).
B=P_triplet Eface P_triplet.
```
SymPy rational exact trace identities (independent of eigensolver):
```
Tr B=1/4, Tr B²=11/432, Tr B³=5/1728.
spec(B|3)={(3-sqrt3)/36, 1/12, (3+sqrt3)/36}.
Q(B)=11/27.
```
In cyclic angular labels, the compressed B has a=1/12,b=0,c=±1/36.

**Constructive new quadrupole + dipole calculation**: the connected second face moment
```
V=P_triplet Eface (I-P_triplet) Eface P_triplet
  =P_triplet Eface² P_triplet-B²
```
is positive and produces BOTH C3-even and orientation-odd terms, with **exact fixed magnitudes**:
```
Tr V=5/216; Tr V²=29/139968; Tr V³=181/90699264.
spec(V|3)={(4-sqrt3)/648,(4+sqrt3)/648,7/648}.
a=5/648, b=1/648, c=±1/648; Q(V)=29/75.
```
These numbers are exact rationals and radicals from native incidence with no empirical input; source sign is selected by orientation. This closes the *geometric coexistence of even quadrupole and odd dipole* within the defined connected moment. It is NOT the Koide mass spectrum or a uniquely selected physical mass action.

## 4. Actual coarse 64-to-face embedding and result
In original code `D64=coarse_dirac(ds)`, the 20 face coordinates occupy zero-based indices [43:63] in (1,12,30,20,1). Its eight hidden face eigenvectors and normalized edge images span a **species-independent invariant 16D subspace**, with operator
```
[[0, diag(sqrt3*I4,sqrt5*I4)],
 [diag(sqrt3*I4,sqrt5*I4), 0]].
```
The original `dressed_64(q,U1,U2,Y_f)` deforms only 12 visible edge directions. For all four species u,d,nu,e, the source action on the hidden 16D subspace is numerically zero (<3.8e-15), invariant-sector residual <5e-15.

Integrating those edge modes in the *actual original coarse D64* gives the exact 8D face Schur kernel `zI8 - diag(3I4,5I4)/z`. Full-resolvent compression onto the chiral A4 zero triplet yields
```
G_trip(z) = [z(z²-17/4)/((z²-3)(z²-5))] I3,
K_trip(z) = [(z²-3)(z²-5)/(z(z²-17/4))] I3.
```
At z=4, K_trip=143/47 I3 for **all four species**, verified against direct 64x64 matrix inversion with residual ~3e-16. Thus the original coarse source by itself supplies **no generation splitting** in this particular chiral projector; treating this Schur matrix as root masses would give Q=1/3.

The connected operator V above is a separate, **explicitly defined geometric conditioning**; it has not been derived as the lepton term in the original species-loaded transfer. The physical signed-history H64=4 End(V4) needs a selected 20-face intertwiner and charged-current coupling. No global no-go is inferred.

## Reproducibility
Current-conversation artifact `URT_exact_hidden_G4_chiral_triplet_H64_audit_2026-10-17.zip` contains the unmodified canonical module, runnable NumPy 64x64 spectral/source audit, SymPy exact rational certificate, results, and full derivation. No observed masses are used.
