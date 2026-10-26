# Cathedral 137 / 360 planar-dual spectral bridge — 26 October 2026

**Exact additive result; not a physical derivation of alpha. No measured alpha or fitted parameter.**

The original dodecahedron has 20 vertices, 30 edges and 12 pentagonal faces. Let `L_D=3I-A_D` be its vertex Laplacian, `F` its oriented 30×12 edge/face incidence and `K=FF^T`. The planar dual Gram `F^TF` is the icosahedral vertex Laplacian (up to vertex ordering).

**Exact characteristic polynomials**
```
det(xI-L_D)=x(x-2)^5(x-3)^4(x-5)^4(x²-6x+4)^3
det(xI-K)=x^19(x-6)^5(x²-10x+20)^3
```

Consequently the **same planar-dual geometry** fixes both

```
15 Tr(L_D^+) = 137
Tr(K²) = 360 = 15 × 24
Tr(K) = 60
rank(K) = 11; nullity(K)=19.
```

The 360 result follows twice independently: (i) `5·6²+3[(5-√5)²+(5+√5)²]=360`; (ii) 30 link diagonals equal 2 and 120 unordered edge pairs share a pentagonal face, hence `Tr K²=30·4+2·120=360`. Equivalently `Tr(F^TF)²=Tr(L_icosahedron²)=12·5²+2·30=360`. The A5 class counts 15 order-two and 24 order-five elements also multiply to 360, but no typed equality identifying those individual elements with curvature contributions is asserted.

**Planar-dual determinant link:** Both graphs have exactly **5,184,000** spanning trees (matrix-tree theorem). The nonzero eigenvalue products are `det' L_D=103,680,000`, `det' L_I=62,208,000`; their ratio is 20/12 as required. The derivative of the regulated dual determinant obeys `15 d/dt log det_{1^⊥}(L_D+tI)|_{t=0}=137`.

**Source-first quantitative extension:** The already frozen Oct24 native unit-hopping, bubble-plus-contact Peierls Hessian on the 11 Maxwell cycles is `Pi=h5 P5+h6 P6`. Exact projector contractions give `Tr(KP5)=Tr(KP6)=30` and hence the unique Hilbert–Schmidt scalar projection

```
c_HS = Tr(KPi)/Tr(K²) = (h5+h6)/12
||Pi-c_HS K||_F² = (5/2)(h5-h6)² + h6².
```

At the rail clock beta = −ln Delta = 5.9957979867413068, `h5=5.900702960956784`, `h6=10.025408677635894`, `c_HS=1.3271759698827231` and the relative Frobenius residual is **42.9023%**. Applying the charge-trace factor `4π×16/3` *naively* yields `88.94818724276206`, NOT the observed inverse alpha. This is NOT a prediction of the physical coupling: this finite 3D source Hessian has not been identified with the correctly normalized all-occurrence 4D H64 photon 1PI kernel. It fixes exactly what a physical coframe/history map must accomplish, without disqualifying other Cathedral sectors.

Validated independently with exact SymPy/NetworkX 30×30 construction and high-precision rail clock; executable artifact `cathedral_137_360_dual_spectral_2026_10_26.py` in the conversation.

**Status:** exact finite mathematics / continuum physical Maxwell ID still open. No other Cathedral closures reopened or erased.
