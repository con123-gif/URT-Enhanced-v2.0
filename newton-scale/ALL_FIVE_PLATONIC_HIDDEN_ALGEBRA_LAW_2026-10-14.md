# Newton–Platonic all-five-solid hidden-sector and operator-algebra closure
**Date:** 14 October 2026. Independent geometry; no Cathedral or URT premises.

## The finite geometric law

For each regular Platonic solid \(S\), let \(B_S\) be the unsigned incidence between its vertices and polygonal faces and \(L_S=D-A\) its graph Laplacian. Exact combinatorial calculation yields:

\[
B_TB_T^\top=9I-2L_T,\quad
B_CB_C^\top=\frac12(L_C-4I)(L_C-6I),\quad
B_OB_O^\top=12I-2L_O,
\]
\[
B_DB_D^\top=(L_D-3I)(L_D-5I),\quad
B_IB_I^\top=15I-2L_I .
\]

Each identity is checked as **an exact integer/rational matrix equation** by the repository verifier.

| Solid | V | E | F | rank B | hidden at vertices \(\ker B^\top\) | hidden at faces \(\ker B\) | rank of vertex-hidden symmetric products sent to faces | rank of face-hidden symmetric products sent to vertices |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Tetra | 4 | 6 | 4 | 4 | 0 | 0 | 0 | 0 |
| Cube | 8 | 12 | 6 | 4 | 4 | 2 | 4 | 1 |
| Octa | 6 | 12 | 8 | 4 | 2 | 4 | 1 | 4 |
| Dodeca | 20 | 30 | 12 | 12 | 8 | 0 | **12** | 0 |
| Icosa | 12 | 30 | 20 | 12 | 0 | 8 | 0 | **12** |

A hidden input \(h\) has zero linear incidence response \(B^\top h=0\); the quadratic response \(\mathcal E(h,k)=B^\top(h\odot k)\) need not vanish. This is a concrete algebraic hidden-to-visible mechanism. In the dodecahedron, the two fourfold hidden eigenspaces at Laplacian 3 and 5 have self/mixed quadratic images of rank 6,6,6 respectively. Taken jointly their symmetric products reach all 12 face observables. These are ranks of finite bilinear maps, not observed forces or fields.

## The nested five-cube theorem

Build all 60 proper dodecahedral rotations, rotate one inscribed cube and remove duplicates. Exactly **five cubes** are generated. Each inscribed cube has a canonical fourfold vertex–face hidden projector \(P_j\), derived from its eight-vertex graph Laplacian:
\[
P_j=-\frac1{24}L_{C,j}(L_{C,j}-7I)(L_{C,j}-2I)
\]
on that cube, extended by zero to the dodecahedron's 20 vertices.

The proper rotational icosahedral group permutes the five cube projectors transitively. Thus the equal-weight convex averaging scheme is the unique weight assignment invariant under the five-cube permutation symmetry:
\[
\bar P=\frac15\sum_{j=1}^5P_j
=-\frac1{60}L_D(L_D^2-7L_D+13I)(L_D^2-6L_D+4I).
\]
The identity is verified **exactly** as integer polynomials, by checking \(120\bar P=-2L_D(\dots)(\dots)\).

Spectrum:
\[
\boxed{\operatorname{spec}(\bar P)
= \{0^{\times7},(1/4)^{\times8},(2/5)^{\times5}\}.}
\]
The active range has dimension 13; the eight-dimensional sector is the dodecahedral incidence kernel \(H_3\oplus H_5\), while the five-dimensional sector is the visible Laplacian-\(2\) fiveplet. For every two distinct cubes:
\[
\operatorname{Tr}(P_iP_j)=5/8.
\]
The scale ratio of the spectral attenuation eigenvalues is **also** \( (1/4)/(2/5)=5/8\); that is a nontrivial, internally exact relationship.

## Operator algebra from cube histories and geometry

Restrict to the active \(13\)-space \(H_{\rm act}=\operatorname{ran}\bar P\).

The five noncommuting cube projectors individually preserve the **antipodal involution** \(J\colon v\mapsto-v\); it has eigenspaces \(\dim H_+=9\), \(\dim H_-=4\). Exact commutant calculation proves:
\[
\boxed{\mathcal A(P_1,\dots,P_5)\cong M_9(\mathbb R)\oplus M_4(\mathbb R),\quad \dim=81+16=97.}
\]
In dodecahedral Laplacian language, \(H_+ \cong H_{\lambda=2}^{(5)}\oplus H_{\lambda=5}^{(4)}\), \(H_- \cong H_{\lambda=3}^{(4)}\).

Add the **existing** geometric coordinate \(X=\operatorname{diag}(x_v)\), compressed to the active space (equivalently use \((\sum24P_j)X(\sum24P_j)\); scaling doesn't change generated algebra). Since \(JXJ=-X\), the coordinate mixes antipodal parity. An exact modular rank certificate proves the commutant of the five projectors plus this coordinate is only the scalars:
\[
\boxed{
\mathcal A(P_1,\dots,P_5,X_{\rm compressed})
= M_{13}(\mathbb R),\quad \dim=169.
}
\]
This is algebraic **generation**, not an assertion that all these directions are independent physical particles or forces.

**Exactness certificate:** The projector matrices are rational with denominator 24; their restriction to a 13-dimensional rational basis is computed using full-rank minors. The odd-coordinate entries lie in \(\mathbb Q(\sqrt5)\). Embed into \(\mathbb F_{101}\) using \(\sqrt5\mapsto45\) (\(45^2\equiv5 \bmod101\)). The linear commutator-constraint matrix has rank **167** for the five projectors and **168** when coordinate is added (169 unknowns). Modular rank is a lower bound on characteristic-zero rank. Antipodal \(J\) and identity force the first commutant dimension to be at least 2; identity forces the second to be at least 1. Hence the ranks are exactly 167 and 168 over characteristic zero. The finite-dimensional real *-algebra double-commutant theorem then yields the full block algebras above. Numeric checks of parity and closure also independently reproduce the result.

## A parameter-free finite averaging evolution — *candidate scale-selection law*

Repeated symmetry averaging defines a unique finite **linear contraction** given the choice of one equal-weight cube selection per discrete step:
\[
\psi_{n+1}=\bar P\psi_n,\qquad
\psi_n=4^{-n}P_{H_8}\psi_0+(2/5)^nP_{V_5}\psi_0
\quad (n\ge1).
\]
Here \(P_{H_8}\) and \(P_{V_5}\) are the orthogonal spectral projectors. The other seven modes are extinguished at the first step. Therefore:
\[
\boxed{
\frac{\|\psi_{H_8,n}\|}{\|\psi_{V_5,n}\|}
=(5/8)^n
\frac{\|\psi_{H_8,0}\|}{\|\psi_{V_5,0}\|}.
}
\]
This is an exact law of the specified symmetry-averaged finite geometric machine. Its positive decay generator on the 13-space is
\[
H_{\rm geom}=-\log(\bar P|_{H_{\rm act}})
=(\ln4)P_{H_8}+\ln(5/2)P_{V_5}.
\]
The associated **relative** log-scale exponent is
\[
\beta_{\rm rel}=\frac{\ln(8/5)}{2\ln\varphi}\approx0.48835419743
\]
if each recurrence step is identified with the separate golden geometric refinement \(\ell_{n+1}=\varphi^{-2}\ell_n\). This last identification is a physical hypothesis and not entailed by the incidence polynomial.

## Evidential scope and next physical bridge

- **Proved:** all five incidence identities, precise hidden-sector dimensions, quadratic leakage ranks, unique equal-weight nested five-cube averaging scheme, rank-13 spectrum, parity-block \(\mathrm{End}_9\oplus\mathrm{End}_4\), full \(\mathrm{End}_{13}\) after compressing a native coordinate, exact finite contraction laws.
- **Not claimed:** mathematical historical priority, experimentally demonstrated quantum-gravitational scale, direct CMB primordial oscillation, unique physical time, exact Standard Model realization or a theorem of nature.
- **Crucial distinction:** previous Planck null results tested sinusoidal primordial correlations, not the present finite geometric parity-split contraction or the \(5/8\) *relative hidden-to-fiveplet* attenuation prediction.
- **Physical discriminant:** identify a system whose incidence-controlled vertex/face responses implement the five-cube projector-averaging operation, then test both independently the \(5/8\) relative amplitude attenuation and the parity-breaking coordinate response. The two predictions follow from the same operator construction without separate fitted mode weights. No existing measured dataset has yet been shown to realize those operators; do not assert otherwise.

## Reproducibility

- Code: \`newton-scale/all_platonic_incidence_and_algebra.py\`
- Continuous integration: \`.github/workflows/newton-all-platonic-algebra.yml\`; run successful on 14 October 2026 (includes modular exact-rank certificate).
- This result is **independent** of \`research_archive/\` and the Cathedral/URT entropy and rail constants. The latter may be considered a separate future physical mapping but must not be silently imported as proof.
