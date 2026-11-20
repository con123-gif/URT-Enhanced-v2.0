# Q162a — Recovered native chaos → URT selection → five Platonic solids

20 November 2026. Classification: exact finite spherical-closure/duality theorem PLUS independent numerical reconstruction using the original archived URT recursion. CLOSED internally for specified finite operations; PHYSICAL IDENTIFICATION OPEN.

## Continuity recovery, not a new claimed chaos algorithm

The repository ALREADY holds research_archive/run_chaos_to_structure.py and research_archive/RESULTS(2).txt. The original simulation starts with Gaussian random points normalised to unit sphere S2, then applies the same bounded recurrence for N=2,3,4,6,12. The original control parameters are ALPHA=1.155, THETA_H=2.4, BETA=.235, GAMMA=1/81, and DELTA_STAR=(1-GAMMA)pi/(13phi).

For each point x_i the driving functional is S(X)=sum_{i<j} log||x_i-x_j||; u_i=||grad_i S||/(1+||grad_i S||). The original URT feedback is p_i(k+1)=BETA*[ALPHA*(p_i(k)-THETA_H*phi(p_i(k)))+u_i], with its original saturation law and monotone entropy admissibility. Motion is along the spherical exponential in the tangent gradient direction. No target Platonic shape enters this selection calculation.

The historical archive reports 100/100 shape outcomes in 20 random trials each for N=2,3,4,6,12. This new check independently reran nine random initial configurations: three seeds each for N=4,6,12. All nine reached regular tetrahedron (4,6,4), octahedron (6,12,8) or icosahedron (12,30,20), respectively. Their edge coefficients of variation were approximately 2.6e-9, 3.4e-9 and 3.4e-9.

## Native geometric duality supplies the missing two solids

From each selected primal point set, find genuine supporting planes of the convex hull. A face is the union of coplanar hull triangles; dual vertices are its outward unit face normals. This polar duality is a mathematical operation on the selected result, not a target input or fitted new force.

The three primal/dual pairs have exactly (V,E,F):
- tetra (4,6,4) ↔ tetra (4,6,4)
- octa (6,12,8) ↔ cube (8,12,6)
- icosa (12,30,20) ↔ dodeca (20,30,12).

Thus their union is the **five Platonic solids**, and its original 2-dimensional cochains have (V,E,F)=(50,90,50), dimension 190.

Necessity of duality in this construction: directly running the original entropy selector with eight points found ordering score 10.428017781460, greater than the score 10.383656675021 of the exactly regular cube created as the octahedral dual. Direct twenty-point selection gave 54.011129974583, greater than the regular dodecahedron's 53.617273743058. Therefore the original one-object log-distance objective does not independently select all five solids. The two-stage selection + duality mechanism is essential.

## Independent group closure (existing mathematical theorem)

For non-axial spherical triangle rotation groups (2,3,p), the spherical area deficit is 1/2+1/3+1/p−1 > 0, requiring p=3,4,5. Their rotation group orders 2/deficit are 12,24,60, corresponding to A4,S4,A5; the corresponding (V,E,F) from stabilizer orbits are (4,6,4), (6,12,8), (12,30,20). Face/vertex duality gives the remaining regular solids. This is a standard spherical group classification, now explicitly joined to the recovered original URT numerical selector, not claimed as new mathematics.

Robustness check: replacing the historical decimal ALPHA=1.155 by exact pi/e and THETA_H=2.4 by exact 2pi/phi^2 preserved all three primals and their three duals for random seed zero. BETA=.235 was retained as historical and has NOT been derived from first principles.

## Precise open upstream questions

The bare primitive q=(pi/e)*exp(i 2pi/phi^2) has modulus >1 and no nonzero finite periodic orbit. After radial normalisation its golden irrational rotation also cannot have a finite periodic orbit. The nonlinear collective selector, interaction and bounded response are indispensable for producing finite regular shapes.

The complete chaos-to-Platonic emergence theorem is NOT established. The original simulation takes S2 (compact spherical boundary), N=4,6,12 (the number of states), and one historical URT feedback coefficient BETA as premises; the log-distance ordering functional is another choice. Group classification gives possible stable regular symmetries but does not derive a dynamical law that births the N values. Nor does this finite experiment prove almost-sure convergence for all chaotic histories or any particle/gravity constants. Computation of the dual is not yet an established physical dynamical process.

## Executed evidence and next step

The original repository simulation is read without modification. Its definitions were independently reconstructed and run locally with the additional geometric-dual tests; the nine original-parameter seeds, direct-N counterchecks, and exact pi/e,2pi/phi^2 robustness variants passed. Exact rational group-order enumeration also passed.

Reproduction: Q162A_ORIGINAL_CHAOS_TO_FIVE_CERT.py, in the same folder, includes the original archived native source definitions as its unchanged prefix. The independent local reproduction and JSON report are available in the current working sandbox. The new GitHub CI run has not yet been confirmed.

RESUME HERE: Derive N-birth/selection and spherical-boundary emergence from the original H64/24/190 URT dynamics, rather than supplying N and S2. Identify why the coupled dynamics must activate the face duals and test the native Q96/Hopf charged current against this operation. The original Q161cz charged-source task stays open; this result does not replace it.
