# Newton–Platonic unbounded scale: independent exact mathematical theorem
**14 October 2026. Not dependent on URT, the Cathedral, or physical assumptions.**

## The deterministic geometric law
For a regular pentagon in a face of the dodecahedron, draw its five pentagram diagonals. Define S(P) to be the regular pentagon formed by intersections of successive diagonals. Apply the **same** Euclidean operation at every subsequent stage: P_(n+1)=S(P_n).

Put p_j=(cos(2πj/5),sin(2πj/5)), φ=(1+√5)/2, and s=φ^-2=(3-√5)/2. The intersection of lines (p_j,p_(j+2)) and (p_(j+1),p_(j+3)) is EXACTLY

    x_j = s p_j + φ^-1 p_(j+2)
        = φ^-1 p_(j+1) + s p_(j+3)
        = s (cos(2πj/5+3π/5),sin(2πj/5+3π/5)).

This identity is checked with exact symbolic radicals, and proves the new pentagon has circumradius s times its parent, rotated by 3π/5. By induction,

**R_n = R_0 [(3-√5)/2]^n**, for all n≥0, without inserting an arbitrary contraction constant or assuming physical dynamics. Since 0<s<1, lim R_n=0. For every ε>0 some finite n satisfies R_n<ε.

**Comparison below Planck as pure Euclidean mathematics:** with R0=1 metre and the numerical reference ℓP≈1.616255×10^-35 metres, R83≈2.03259905113×10^-35 m > ℓP but R84≈7.76383752032×10^-36 m < ℓP. Planck length is not an input to the recurrence or a lower bound for this mathematical sequence. The construction does **not** establish operationally resolvable spacetime at those lengths.

## Independent dodecahedral/icosahedral spectral closure
The ordinary dodecahedral Laplacian L_D=3I-A_D has characteristic polynomial

    det(xI-L_D)=x(x-2)^5(x-3)^4(x-5)^4(x²-6x+4)^3.

Its two conjugate triplets have λ_-=3-√5 and λ_+=3+√5. Their ratio of characteristic lengths a/√λ for any common a>0 is

    sqrt(λ_-/λ_+)=s=φ^-2.

The dual icosahedral Laplacian L_I=5I-A_I has polynomial
    x(x-6)^5(x²-10x+20)^3,
and conjugate triplets 5±√5, with characteristic length ratio φ^-1. Thus

    **Newton factor s = (icosahedral spectral ratio)².**

The previously verified 20-site five-cube label permutation D has exact finite identities

    D^4=I,
    D L_D D^T=L_D - ½ L_D(L_D-2I)(L_D-3I)(L_D-5I).

It exchanges the two rank-three eigenprojectors. Its finite order does NOT itself yield infinite shrinkage: infinite nesting arises from the unique pentagram intersection rule. This separates the true first-principles geometric mechanism from the finite spectral duality.

## Fully specified five-branch spectral tower (separate mathematical model)
The five cube labels also generate a regular 4-simplex. Using the **now geometrically derived** factor s, define the five vertex-centred similarities F_j(x)=s x+(1-s)v_j. This is an explicit *additional* branching construction; the finite permutation D alone does not force these affine maps. Their disjoint images yield a compact IFS attractor with Hausdorff dimension

    d_H=ln5/(-ln s)=1.6722759381845547.

Assign each level n its 5^n independent positive dodecahedral graph modes, each rescaled by s^(-2n) from the fixed seed. The exact spectral zeta series is then

    ζ(z)=ζ_D(z)/(1-5s^(2z)),  Re(z)>d_H/2=0.8361379690922773,

    ζ_D(z)=5·2^(-z)+4·3^(-z)+4·5^(-z)
            +3(3-√5)^(-z)+3(3+√5)^(-z).

The geometric denominator has a candidate complex pole lattice with imaginary spacing π/ln(1/s)=3.264251302636497, subject to cancellation by numerator zeros. This is a well-defined **unbounded mathematical graph spectrum**, not a selected physical propagator.

## What is mathematically proved, and what is not
**Proved:** deterministic nested pentagon contraction fixed by Platonic geometry; infinite strictly decreasing Euclidean lengths and their crossing below *any* positive reference threshold; independent agreement with dodecahedral spectral length ratio; dual icosahedral spectral square; specified IFS and zeta formula.

**Not proved by pure geometry:** physical measurement/localization below Planck; any universal ultraviolet law of Nature; a unique SI absolute length; a physical continuum Lorentzian metric or matter interaction.

**Originality:** The individual golden pentagram nesting, Platonic graph spectra, and fractal-zeta methodology are known mathematics. The five-inscribed-cube permutation plus dual-spectral connection and its proposed joint formulation may merit investigation for originality, but priority is not proved by an exact identity or a new name. This is a defensible *standalone mathematical theorem*, irrespective of physical adoption.

Terminology: "Newton–Platonic Scale" disambiguates the shorter project name "Newton Scale" from Newton's unrelated historical temperature scale.

## Verification
A complete locally executed independent file and JSON certificate are provided in the same conversation:
- newton_platonic_unbounded_refinement_proof.py
- Newton_Platonic_Unbounded_Refinement_Certificate_2026-10-14.json
- Newton_Platonic_Unbounded_Refinement_Theorem_2026-10-14.md

Prior independent integer/SymPy certificate retained at newton-scale/independent_exact_proof.py.

Sources on existing components: https://www.mathsisfun.org/geometry/pentagram ; https://doi.org/10.1016/S0370-1573(97)00076-8 ; https://link.springer.com/book/10.1007/978-1-4614-2176-4 .
