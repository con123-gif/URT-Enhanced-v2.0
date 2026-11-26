# Coherent link energy: exact Gram contraction, normalization, and the actual B caller

26 November 2026. Direct proof work on the primitive B frontier specified by the latest mission. Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207. This reconstructs the coherent-link assembly in Moments.energy_fixingSet_le, and the top-kernel positivity/energy consumer. It uses the actual native orbital unfolding and Siegel formula, whose remaining primitive analytic proofs are explicitly retained. No native replay or full human RH proof. Do not repeat the already completed determinant/endgame or global sieve exponent arithmetic.

## 1. The top-kernel energy inequality is a single Gram identity

In TopFloor, write J_p(l)=correlation Z (omega_p) l, a vector indexed by the finite set Z.Cosets x Z.Cosets. All omega_p have the same last entry t, so the set in the topKernel integral is one common set U_t={l : frameGram(l^-1)_{top,top}-t in L}. Let R be the actual positive semidefinite archimedean correlation matrix. At each l, putting v_x(p)=J_p(l)_x, expand the inner products:
 sum_{p,q} R_pq <J_p(l),J_q(l)> = sum_x v_x^* R v_x >=0.
Here inner products are conjugate-linear in their first slot, exactly the source orientation; no conjugation of R or reversal of the finite kernel is needed. Every term on the right is real. The actual floorForm_top_eq_integral at frequency zero supplies integrability of each finite term (including restriction to U_t). Hence
 Q=sum_{p,q} R_pq topKernel(L,Z,omega_p,omega_q)
   =integral_{U_t} sum_x v_x^*R v_x d stackMeasure
is real and nonnegative.

For the quadric comparison use the actual stackMeasure_top disintegration, with orbit map l→l^-1 z and the measureH supported on H. At a point e of the quadric, every admissible representative l with l^-1 z=e contributes the nonnegative integral
 I(l)=integral_H sum_x (J_(omega_p)(hl)_x)_p^* R (J_(omega_p)(hl)_x)_p d measureH(h).
By definition energy(Z,R,omega,e)=inf_l I(l); hence it is <=I(l) for every such representative. Left multiplication by H does not change l^-1 z, so membership in U_t is constant along the H fibre. Integrating the infimum and applying the native measure-preserving orbit-map inequality and stackMeasure disintegration gives exactly
 integral_quadric 1_{h(z,e)-t in L} energy(e) <= Q.
This is the actual lintegral_energy_le_topKernel. No unproved equality of the infimum to an arbitrarily chosen representative is required. The disintegration, measurability, and integrability of the native orbital correlation are retained. Taking R of rank one gives positivity of the finite top kernel, for every finite family with matching last coordinate; this is the exact SieveSystem premise in FiniteSystem. General PSD R is handled by the same calculation.

## 2. From a finite list of coherent link blocks to the actual common sieve

Fix S, let k=shape.k>=1, n=rho+1, f=numInfPlaces, nu=unipCovolume, V=volÔ E, d_c=#BesselCoord, c_G=openCellConst. Use the native finite set Sg of selected places above levelPrime 0 and q=|Sg|<=f. Define y=b^(-6kq), d=mainEnergy, d1=besselEnergy, tau=b^(kf/4), deg=besselDegree, l_va=frameScaleSq(v,a), F=frameScaleProd=prod_(v,a<n) l_va^(k+2(rho-a)). All scales are positive. The native R_link in energy_le_of_linkEnergy_le is the entire link set if Sg is proper and empty otherwise; do not confuse it with the matrix R above.

For any finite list I of nonzero coherent link blocks, write A_i for its complex/vector amplitude. The nonzero-minor condition of exists_hasSum_cosetAmplitude follows from the actual fixingSet definition: each relevant reduction has a unit leading minor at some chosen place, so the corresponding rational leading minor cannot be zero (the reduction of the rational integral term is the same determinant). The native big-cell decomposition then provides t_i nonzero with |Phi_v(t_i)|²>N² for every v, a normal-form sigma_i in GT_rho, and a lift n_i of the actual reduction. The block is an absolutely summable sum A_i=sum_{p in (E^×)^rho} L_i(p); for each p, L_i(p) is the limit over finite place sets T of cosetAmplitude_T of w_(padTuple(p,t_i)) sigma_i. This is the exact GlobalToLocal.exists_hasSum_cosetAmplitude interface; no regrouping condition other than its summability and big-cell uniqueness.

For a finite prefix truncation enlarge the finite set A⊂E^× to contain every coordinate occurring in the finite prefix sets, and every t_i. The directed family of A^rho is cofinal among finite prefix sets: any finite family of tuples is contained in one such Cartesian power. For fixed A and I enlarge T to make every required termPosition integral off T and every relevant unit and inverse integral off T, including g^-1 and N^-1. The actual exists_places_integralOff supplies such T cofinally, so one does not choose different finite fields for different terms. The native exists_isFillingLevel and exists_finite_sieveSystem give one F_T and one intermediate group Z for the whole chosen fixingSet, with Z containing all n_i at the selected places. Its normalized finite system uses the same massRatio and topKernel for all blocks.

Partition I by the common top parameter t_i. Within each fibre, sum_blocks_le_topKernel is applied to the actual distinct tuples (c_i,c'_i,reduction(n_i),sigma_i); the injectivity follows from the native link identity link(w_1 sigma_i) and the original distinct block indices. Its remaining geometric premises are exactly the orbit-point injectivity, native coset transport, local mass comparison and the Siegel quadric estimate in FiniteSystem. The real Gram matrix in this bound is independent of i inside the fibre: at each infinite place HasBandLimits identifies it with the bandLimit kernel at the sequence x_v(p,t)=unitOrOne(l_va Phi_v(padTuple(p,t)_a)). The product Gram matrix is the tensor product across v, using the product formula for inner products of the real Bessel tensor and Fubini. In particular there is no factor equal to the number of blocks in a fibre.

The native real normalization factor is
 rho_p=prod_v [sqrt(c_G)/card(I_v) * (sqrt(|Phi_v(t)|²/N²-1))^(k-1)
                 * prod_{a<rho}|l_va Phi_v(p_a)|^(k+1+2(rho-a-1))].
Since l_v,rho=1/N, and d_c=prod_v card(I_v), and the native finite headDensity at omega,1 is prod_{a<rho} md(p_a)^{(k+1+2(rho-a-1))/2}, the off-T unit product formula md(p_a)^{1/2}=prod_v |Phi_v(p_a)|^-1 cancels every p_a. This gives exactly
 rho_p headDensity(omega,1)=r0 sqrt(G_t),
 G_t=(prod_v (|Phi_v(t)|²-N²))^(k-1),
 r0=c_G^(f/2)/d_c * prod_(v,a<n) l_va^(k-1+2(rho-a)).
In particular r0 uses k-1 (the source destructs positive k as a successor). It is essential not to replace it with F directly.

For every sufficiently small compact open additive L, apply sum_blocks_le_topKernel to each fibre with this r0 and R. The eventual quantifier is over finitely many fibres, so choose ONE L satisfying all of them. Sum over t in the finite image of I (contained in A) and apply the actual global sieve, using its established two frequency substitutions (20af1d26). The result is
 r0² sum_{i∈I} ||sum_{p∈A^rho} cosetAmplitude_T(i,p)||²
 <= (1+b^-6) packetConst * C_n
       * [ e_fin prod_v ((1+b^-10)/deg_v) + deg^-1 b^(-6kf-10) ],
where e_fin=(1+b^-6)y and C_n=V^n/prod_(v,a<n) l_va².
This uses the native finite-system bottom bound and the real band-limit bound, not an assertion that an arbitrary PSD kernel has these sizes. Now the right side is INDEPENDENT of A,T,L and the number of fibres. Let T tend cofinally to all places for fixed A and use continuity of finite sums and squared norm; then let A increase cofinally, using the native summability to obtain the same estimate for A_i. Finally take the supremum over finite lists I to obtain the full linkEnergy sum of nonnegative terms. No exchange of infinite conditional sums; each limit is separately justified by native summability or finite convergence. If the link set is empty the linkEnergy is zero and no such list is needed.

## 3. Exact cancellation of every scale in the actual moment caller

The crucial normalization identity is
 r0² = c_G^f (F/d_c)^2 / prod_(v,a<n) l_va².
From actual Setup.IsAdmissible.packetConst_mul_mass_le,
 packetConst <= (1+b^-9) d deg c_G^f / V^n * (nu F/d_c)^2.
Multiply by C_n and divide by r0² BEFORE estimating:
 packetConst * C_n/r0² <= (1+b^-9) d deg nu².
Using deg=prod_v deg_v gives the coherent-link bound
 linkEnergy <= d nu² (1+b^-6)(1+b^-9)
         * [(1+b^-10)^f (1+b^-6)y + b^(-6kf-10)].
Since q<=f, b^(-6kf-10)<=y b^-10. Put z=1/b, z<=1/1000. Native f<=b/1000 implies
 (1+b^-10)^f <= exp(f b^-10) <= exp(b^-9/1000) <= 1+b^-9
by exp(u)<=1+2u for 0<=u<=1/2. Hence bracket including prefactors is at most
 y [(1+z^6)^2(1+z^9)^2+(1+z^6)(1+z^9)z^10]
 <= y (1+z^4).
For an explicit bound, each 1+z^9<=1+z^6 and (1+z^6)^4<=1+8z^6 for z<=1/1000 by the binomial expansion; the remaining term <=4z^10, and 8z^6+4z^10<=z^4. Thus the exact w in Moments is
 w=(1+b^-4)y d,
with linkEnergy<=w nu². No hidden factors of degree, class count, Haar volume or rank remain. This is the actual consumer of the global sieve, not a generic qualitative moment estimate.

## 4. Finish energy_fixingSet_le with the original tail and missing-link guards

Take C=y d in CrudeEnergy.energy_le_of_linkEnergy_le. By native tau^44 d1<=d and tau^24=b^(6kf),
 tau^20 d1<=b^(-6kf)d<=y d=C.
Also d1<=C since tau>=1. Native FixesNormAtLeast follows from the selected fixed nonzero vectors, with X=levelPrime(0)^q. If q=f, the chosen place set Sg is all places and the native selected link set is empty. Then using levelPrime(0)>=b^10,
 tau^12 d/X^k <= b^(3kf-10kf)d <= b^(-6kf)d=C.
If q<f the selected link set is all links and the omitted-link guard is vacuous. These are exactly the two cases in the actual Moments caller. All stable set, nonzero X and positivity premises are preserved. Therefore
 energy(full amplitude over fixingSet) <= (1+b^-4)^2 w+b^-12 C
  = y d [(1+delta)^3+delta^3], delta=b^-4.
Since (1-delta)(1+9delta)=1+8delta-9delta² and (1+delta)^3+delta³=1+3delta+3delta²+2delta³, the difference is delta(5-12delta-2delta²)>=0 for delta<=1/1000^4. This gives exactly
 energy_fixingSet <= (1-b^-4)(1+9b^-4) d b^(-6kq).
Thus the coherent-link-to-full moment consumer is now a complete human argument from the named native local suppliers. Its proof does not require a further unexplained asymptotic normalization or a different Bessel witness.

## 5. Primitive local step-function construction (used by Siegel)

The native FiniteSystem.exists_step_function is elementary. For finitely many points p_z and lower bounds c_z, the hypothesis is that on all H-orbits of a neighborhood of p_z, f>=c_z, with H⊂GL_n(R). Choose one compact open scalar lattice U=a R^n contained in every such neighborhood (units a in the semilocal field can be chosen near zero; all finite intersections allowed). It is H-invariant since H is integral invertible. Define Phi(x)=max({c_z: x in H(p_z+U)} ∪ {0}). This is H-invariant, unchanged under U-translations, compactly supported (all H-orbits contained in the compact image of GL_n(R) times finitely many compact boxes), and bounded above by f pointwise. Since each p_z belongs to its own box, Phi(p_z)>=c_z. This proves the actual step function lemma, including the zero and empty cases. It does not prove the quantitative adelic Siegel mass formula: FiniteSystem.siegel_sum_le_lintegral_quadric uses classSum_norm_eq, small-set quadric mass and dominated convergence of the actual Fourier integrals. Those native suppliers remain. Likewise sum_blocks_le_topKernel uses the orbit-near-packet lower bound, exact correlation_smul_eq_cosetAmplitude and injectivity; its proof cannot be replaced by Gram positivity alone.

## 6. State and next action

This removes the explicit coherent-link/global-sieve substitution gap in Moments.energy_fixingSet_le, subject to the actual finite system, local band limits, packet/Siegel and crude-energy lower-level estimates. It reconstructs the exact top-kernel PSD/energy comparison and the auxiliary step function. It does not establish the actual primitive local Bessel bounds or the full finite orbital packet/Siegel formula. Do not present B as completely proved. Preserve the native geometry suppliers rather than silently replace them with a random-kernel model. Next derive the remaining primitive finite orbit packet transport / local band-limit proof and the CrudeEnergy pair-weight estimate, then integrate the earlier finite Fourier/rank bound without re-deriving its algebra.

Source ledger, compact pin: New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444; FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7; GlobalToLocal.lean 6b717f446ef9a78dc4ae91400a2394bba8d91610; TopFloor.lean 9762970967aef90b3a4e025b7f2891d892c70111; Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727; CrudeEnergy.lean da67bf862a4c5e72ab6a81a7dfb462545cd8833f; New/RealPlace/LocalTheorem.lean 671350f97491467f09b80eafa0df13685dd8ddc6; BesselSystem.lean (normCorrelation, HasBandLimits), GlobalSieve.lean 0ad01a3eec4c5dcd2a51bb1d9773f7834970e372. Native replay RUN29 queued separately; no new PASS for this human derivation. No end-to-end proof or deadline claim.