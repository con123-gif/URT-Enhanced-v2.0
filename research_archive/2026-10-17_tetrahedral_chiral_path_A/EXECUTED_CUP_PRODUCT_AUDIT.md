# Tetrahedral Koide Path A: native 125-simplex cup-product execution (17 Oct 2026)

**VERIFIED GEOMETRY; CLAIMED KOIDE CLOSURE NOT VERIFIED.** This result is local to the specified operator and does not exclude all-Platonic or URT/H64 flavour dynamics.

## Original script errors
Original `cathedral_strict_64_closure.py` gives `b3:(50,20)`, `hlift:(50,8)`, `U3:(20,6)`. The proposed `np.sum(hlift**2,axis=1)` has 50 face weights, not 20 tetrahedron weights. Its `U3[faces_in_tet[:3]]` reads full-cone face indices against a 20-row array, first out-of-bounds at tetrahedron 3 (row 20). `cos` is not imported. `||b3.T@hlift||_F=1.31790e-15`.

The claimed `proj.T@proj` flux is real symmetric; the imaginary trace against `Ln=i(C-C.T)/sqrt(3)` vanishes. The proposed `cb_ratio=sqrt(6)*P5` is inserted independently of that trace, while the script normally uses eigenvalue spread instead; this is not a derivation of a chiral c term.

## Actual simplicial 1-cup-2
Computed Alexander–Whitney `(alpha cup beta)([0,i,j,k])=alpha([0,i])*beta([i,j,k])` using radial extension of the canonical `U0` triplet and the original lifted hidden `hlift`, with outward face orientation.

The three cyclic first-vertex choices give pairing (6x8) norms 1.089087283514, 1.524795068198, 1.514742369000 and ranks 4,6,5. Their sum has norm 4.89217e-15: it vanishes by the existing face-incidence kernel `incidence.T @ Hhidden=0`. Single choices are nonzero but ordering-dependent. Their 3x3 Gram matrices are real symmetric and have zero imaginary cyclic-generator projection.

## Actual 1-cup-d1 Chern-Simons-like pairing
Extend `U0` to radial edges and `U1` or `U2` to the 30 shell edges, compute `dalpha=b2.T@alpha`, then sum over the 20 outward-oriented tetrahedra.

`U1` coexact exterior differential vanishes. `U2` exact-edge branch gives nonzero unsymmetrized 3x3 skew norms 0.4702282018, 1.2036775811, 1.1498488372 across the three cyclic vertex choices. **Their cyclic sum is exactly**
```
Sigma_C = U0.T @ incidence.T @ d2.T @ U2
        = diag(sqrt(5+sqrt(5)) I3, sqrt(5-sqrt(5)) I3)
```
with Frobenius residual 9.72e-16. Thus the canonical cyclicly aggregated operator has **zero within-triplet splitting and zero antisymmetric c**. Choosing a single ordering requires an independently selected history/boundary source, not supplied by the submitted code.

## Phase test
Actual P5=6.196027670655245e-6. The separately asserted `cb=sqrt(6)*P5` gives delta=atan(sqrt(3)*cb)=2.628751908798368e-5 radians and, in the script's own Koide formula, m_mu/m_e=1.000439786, not ~206.768283. No bare 2/9 subtraction is implemented.

**Physical conclusion:** The proposed Path A solution is not valid. The full geometry does contain nonzero *ordered* simplicial chiral contacts; this calculation has not derived from URT/H64 selection which ordering couples to the physical lepton masses, nor any parameter-free Koide phase. Spatial pseudoscalar orientation alone is not the physical time-reversal operation.
