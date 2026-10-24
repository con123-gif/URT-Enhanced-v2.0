# Exact finite-field origin of the Cathedral 13-cell, and a conditional alpha candidate (2026-10-24)

**New exact finite mathematical theorem** from original calculations, independently verified by integer polynomial algebra. **Physical alpha not yet derived**: the neutral-capacity-to-photon-action matching remains a physical postulate.

## Finite-field construction

1. Let G=SL(2,F5), order 120 (binary icosahedral group). G acts transitively on F5²\{0}, the set of 24 nonzero spinor vectors; the stabilizer of (1,0) has order 5.
2. Divide by central sign v~−v to get 12 classes V=(F5²\{0})/{±1}. These are a 12-element A5=PSL(2,F5) orbit.
3. Define [v]~[w] iff det(v,w)²=1 mod 5. This is representative-independent and SL2 invariant. Each vertex has five neighbours, and its neighbour subgraph is a five-cycle. The graph has 12 vertices, 30 edges and 20 triangles. An independent graph-isomorphism computation confirms it is **exactly the icosahedral graph**.
4. Its exact characteristic polynomial is det(tI−A)=(t−5)(t+1)^5(t²−5)^3.
5. Attach one universal central vertex. The new Laplacian is L13=[[12,-1ᵀ],[-1,6I12−A]], whose exact characteristic polynomial is
   det(tI−L13)=t(t−13)(t−7)^5(t²−12t+31)^3.
   Therefore spec(L13)={0 (1),6−sqrt(5) (3),7 (5),6+sqrt(5) (3),13 (1)}, exactly the Cathedral frozen 13-cell. Neither phi nor spectral eigenvalues are inserted into the edge definition.

**Important 24-state distinction:** 24 nonzero vectors under SL2(F5) form one transitive orbit, fixing symmetric weight 1/24. The different set of 24 five-cycles in S5 splits as 12+12 under A5. Do not conflate the two carrier spaces. This resolves the apparent obstruction from Cathedral's chiral splitting without claiming the *physical* source has been identified.

## Geometric alpha calculation, NO observed alpha input

Bin Li, Symmetry 18(9):1418 (2026), https://doi.org/10.3390/sym18091418, gives native unit sphere volumes U(1)=2pi, SU(2)=2pi² and their antipodal quotients pi,pi², hence three nonempty exposure capacities sum to
  Omega=4pi³+pi²+pi=137.03630377587843255920239465...
Its separately declared interface recursion has 24-state first fraction 1/24 and later coefficients (k+6)/(k+4) at odd reciprocal powers. The resulting exact absolutely convergent series
  A=Omega−1/(24Omega)−sum_{k>=1} [(k+6)/(k+4)] Omega^{−(2k+1)}
   =137.035999176141994522453419751...
differs from CODATA2022 alpha^-1=137.035999177(21) by -0.041 sigma. This formula has no fitted electromagnetic input. **But its final equality to alpha(0)^-1 is expressly a low-energy effective action matching POSTULATE, not proved by the topology or our finite-field graph.** Its higher interface recurrence is an additional structural axiom.

Separately Harold Kirk, Zenodo 19422586 (2026), derives an unrelated correction to same Omega:
  Omega−exp(−8)/(1+pi^−2)=137.035999175701041...
Its SU3 flag chi_y(M)=(1−y)^2(1−y+y²), evaluated at y=1+pi, recovers pi³+pi²+pi; the extra 3 positive SU3 roots supply 3pi³. This too is only a mathematical candidate until photon stiffness is generated.

## Exact physical boundary
The normalized Haar source integral int_0^{2pi}[1−cos(theta+A)]dtheta is independent of A; volume alone does NOT create Maxwell stiffness. Gauge symmetry permits arbitrary (c/4)int F² without changing the finite graph or charge quantization. Hence **physical alpha remains open** until the selected gauge-covariant Cathedral history explicitly fixes the electron-unit infrared transverse photon-current q² coefficient. This cannot be achieved by inserting the candidate A as a prefactor.

Locally executed and exact-tested companion script:
  cathedral_f5_icosahedral_alpha_candidate.py.
