# URT–ZPE: flux-aligned horizon and orientation-independent lattice commutator

2026-11-21. Parent 52da374. Standalone entropy path. THEOREM (commutator identity for declared native lattice) / CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Numerics are finite diagnostics. No tuning of flux, lapse normalization or entropy.

The native three-plane flux Ux=exp(if z), Uy=exp(if x), Uz=exp(if y) has associated continuum magnetic-direction candidate (1,1,1), since the curl of the analogous linear vector potential is f(1,1,1). This motivates testing a horizon normal parallel to the flux instead of a coordinate axis. It does not establish that arithmetic flux is physical electromagnetism, or that a physical spherical horizon may choose just one normal.

For even cube size n, define d_i=b·(r_i-(n-1)(1,1,1)/2), with |b|=1, and A={d_i>0}. Compare b=(1,0,0) and b=(1,1,1)/sqrt(3). Both have no sites exactly on the cut, and each crossing edge has midpoint lapse zero. Keep the original L, Q=(L^-1/2)_A, P=(L^1/2)_A, D=diag(d_i>0), and M native internal magnetic edge squares weighted by the arithmetic mean of endpoint distance. Compute entropy S in nats and excitation X above the weighted subsystem ground as in bbfb2d5 and 871d8bc. The ratio eta=2pi X/S is not an observed dark-energy ratio absent the physical horizon identification.

## Exact theorem

On the infinite native cubic graph, let D_b be multiplication by b·r (plus an arbitrary constant). For L and C_b=[L,[L,D_b]], the mixed-neighbor entry connecting i to j=i+s e_a+t e_c (a<c, s,t in {-1,+1}) is the sum over the two two-step paths, weighted by d_i+d_j-2d_k. Their coefficients are t b_c-s b_a and its opposite. The products of link phases differ by exp(±if). Thus
|C_b(i,j)|²=|1-exp(if)|²(s b_a-t b_c)².
Summing over the twelve mixed-neighbor displacements yields
sum_mixed |C_b(i,j)|² = 8 |b|² |1-exp(if)|² = 32 sin²(f/2) for unit b.
This identity has no preferred normal and is strictly positive for both flux sectors. In particular even a boost along the continuum flux direction does not eliminate the lattice double commutator. The identity holds for these mixed entries at any finite-cube vertex with all mixed neighbors present, regardless of additional outer-edge terms. It does NOT claim the entire finite row consists only of mixed entries.

Using W=sqrt(L), R_full=(1/2)W^-1[W,[W,D_b]] and C_b={W,{W,[W,[W,D_b]]}}, the previous norm argument gives
||R_full|| >= sqrt(8)|1-exp(if)|/(96 sqrt(12)).
For the two sectors the lower bounds are 0.0158541934866 and 0.0061641220576. These are operator-norm bounds in lattice units, not fractional energy deficits.

The infinite half-space midpoint prescription has M_A=P_A {D_b,L}/2 P_A plus a diagonal correction supported at the boundary. For a general normal, the dropped off-block term V_AB ({D_b,L}/2)_BA also has input support at the boundary. Therefore for finitely supported test vectors moved arbitrarily deep into A by magnetic translation, those corrections vanish exactly; output truncation approaches the full infinite residual in norm. Magnetic translations preserve R_full because translating D_b adds a constant that cancels in the double commutator. Hence ||R_A|| >= ||R_full|| for this infinite prescription; no normal removes the stationarity mismatch. This uses the original uniform gap, which bounds the kernels of the commutators as in 52da374. It does not rule out scalar equality by coincidence, a distinct metric coupling, or a different covariant continuum limit.

## Executed calculations

Local /mnt/data/urt_orientation/orientation.py --full, OPENBLAS_NUM_THREADS=2, NumPy/SciPy, exit 0, all 20 cases. First attempt at n=4 checked the full finite row instead of mixed entries, failed because outer-edge degree effects are present; corrected the assertion to test the exact mixed entries as stated above, no tolerance tuning.

n | axis + | axis - | flux + | flux -
4 | 1.605336034133 | 1.449327933356 | 1.150178097705 | .980866110022
6 | 1.376894682516 | 1.277506334466 | 1.080586315947 | .927404316764
8 | 1.288868010526 | 1.188403847959 | 1.052870046105 | .908316688780
10 | 1.245427483119 | 1.143488997254 | 1.034184337719 | .894824485554
12 | 1.220365987171 | 1.117680758913 | 1.019560715788 | .883688360385

At n12 flux-aligned, + S=8.499654245808, X=1.379222980565, Drel/S=.561815446235, logZ/S=.542254730447. Negative S=10.799087854691, X=1.518820116456, Drel/S=.355684191757, logZ/S=.471995831372. The near-unit positive ratio results from cancellation of two individually substantial thermodynamic terms, not proof of thermality. The same-sector change in eta with orientation is large (and the negative sector passes below one). No sector or orientation is selected by fitting eta. At n12 rms Frobenius residual per sqrt(number of sites) is .112458496537/.106426865452 for axis and .113428555204/.102919732876 for flux-aligned.

Mixed-entry squared norm is 27.797902049253 (+), 4.202097950747 (-) at all tested sizes and both normals. The analytic result is for every normal. Axis ratios independently reproduce bbfb2d5. Default CI certificate tests sizes 4,6,8; --full runs 4,6,8,10,12. GitHub CI pending; 52da374 already corrected earlier env-launch errors, so do not change those checks.

RESUME HERE: derive a covariant, continuum gravitational energy generator/reference and geometry from the native vacuum rather than choose the near-matching flux-aligned normal. Test genuine spherical/angular response and the scale of lattice corrections; the fixed-flux midpoint lapse cannot itself equal the exact modular generator for every local variation. The 1.01956 finite ratio cannot be substituted for a prediction of observed dark energy.
