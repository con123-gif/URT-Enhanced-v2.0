# Q161cy — exact native five-solid odd/even response

**Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Q161cl, Q161by and every physical gate remain open.

**Provenance:** `research_archive/2026-11-20_q161cw_five_solid_kinetic/Q161CW_NATIVE_EXACT_CERT.py` constructs the original five Platonic vertex sets (50 vertices, 90 edges, 50 faces), their 8 harmonic columns, and the exact Gram and unit-edge kinetic operators. Here we restrict those *already constructed* operators to any of the three symmetry-related odd/even pairs (x,yz), (y,xz), (z,xy), rather than inventing a new matrix.

The exact paired matrices are
```
G = [[50/3, 4 sqrt(6)/9], [4 sqrt(6)/9, 104/15]]
K = [[(176-32 sqrt(5))/3, 16 sqrt(6)/9], [16 sqrt(6)/9, 128/5]]
```
The exact stiffness determinant is `200192/135 - 4096 sqrt(5)/15 > 0`. Therefore, for a constant unit force on the x source, the stationary yz amplitude is exactly
```
(K^-1)_(yz,x) = -(16 sqrt(6)/9)/(200192/135 - 4096 sqrt(5)/15) != 0.
```
For the native declared gradient dynamics `G da/dt=-K a`, starting with `a(0)=e_x`, the total integrated yz response is
```
integral_0^infty a_yz(t) dt = (K^-1 G)_(yz,x)
= [4 sqrt(6)/9] * [((176-32 sqrt(5))/3)-4*(50/3)] / det(K)
!= 0.
```
The remaining two even modes do not couple to these pairs. This is a **finite source susceptibility**, not a charged Q96 response, physical Yukawa, or an independently derived law of time.

**Evidence:** standalone `python research_archive/2026-11-20_q161cy_native_response/Q161CY_CERT.py`, executed locally with SymPy, exit 0, 2026-11-20. CI awaits GitHub run.

**Next question:** Does the original Q101 face-square map applied to this explicitly mixed source yield a Q125 Hopf-transported 96-component chiral source with a charge-Ward residual fixed without choosing a new coupling?
