# B primitive finite orbital transport and packet estimate
26 November 2026. Continuation of e3228b191cb370ee0e5bfb89716eb56ba8a881db (coherent-link energy). Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207. This is a human reconstruction of the actual finite-place correlation unfolding, the local orbit section and packet lower bound, and their mass normalization, using explicitly named remaining native suppliers. No native replay or complete RH proof.

## 1. Exact adelic-to-local phase unfolding

Use the notation of GlobalToLocal.correlation_smul_eq_cosetAmplitude. Let K0 be the global principal level, K the lattice stabilizer, C=F.congGroup at T, P_ab(g)=termPosition(a,b,g), and P(g)=P_cc'(g). Products telescope:
 P(u gamma v^-1)=P_cc(u) P(gamma) P_c'c'(v)^-1.
The map toPlaces is a homomorphism; the native membership criterion x∈K0 iff x is integral off T and x_T∈C holds because g^-1 is integral off T. The reduction K→Gq has kernel K0. Fix gamma=w_p sigma, sigma∈GT_rho, P(gamma) integral off T, k∈K, s=red(k), and local representatives a,b∈Z with k_T^-1 a b^-1∈C.

For the real Bessel vector W and the native nonnegative class cutoff beta_c, define
 B_c(x,u;y)=1_{P_cc(u)x∈K0} beta_c(u_infty y),
where u ranges over the rational Bessel unipotent U and x is integral off T. If phase(x_T)≠0, the native phase support and rational unipotent approximation (exists_rat_approx_unipotentChar_eq) give one v∈U with P_cc(v)x∈K0. All solutions u to P_cc(u)x∈K0 are exactly U_c(g) v, because taking the quotient with the v solution gives membership of P_cc(u v^-1) in K0, and conversely. Hence
 sum_u B_c(x,u;y)=sum_{w∈U_c(g)} beta_c(w_infty v_infty y)=1.
This uses the actual class cutoff partition of unity; no finite index or extra class count. For any admissible u, native phase equivariance and principal-level character identity give
 phase(x_T)=chi(u_fin)^-1.
Here chi is the native unipotentChar. This follows because phase((P_cc(u)x)_T)=1 and left unipotent multiplication multiplies the phase by chi(u_fin) (transport to T using integral off T). Nonzero phase is forced by any admissible u.

For z∈G_T choose its actual adelic extension x integral off T (identity off T). Put xi=P(gamma)^-1 x k, also integral off T. For u,v∈U write A=P_cc(u), B=P_c'c'(v), delta=u gamma v^-1. The two conditions
 (Ax)_T∈C, A integral off T, P(delta)∈K and red(P(delta))=s
are equivalent to
 Ax∈K0 and B xi∈K0.
Indeed Ax∈K0 is the first two conditions by the local membership criterion; B xi = P(delta)^-1 (Ax) k, so the second follows from normality of K0 in K and P(delta)^-1 k∈K0. Conversely P(delta)=(Ax)k(B xi)^-1, which lies in K with reduction s. This is the exact Boolean equivalence C in the native proof. In particular the two cutoff factors now have independent admissibility conditions.

Write the real tensor kernel H_gamma(y)=W(y)⊗overline(W(gamma_infty^-1 y)). The native character law gives EXACTLY
 H_delta(u_infty y)=chi(u_fin)^-1 chi(v_fin) H_gamma(y).
By the preceding phase identities the scalar is phase(x_T) overline(phase(xi_T)). Consequently after multiplying by the two cutoff weights and summing over (u,v) the result is
 phase(x_T) overline(phase(xi_T)) H_gamma(y).
When the phase product vanishes all admissible terms vanish (an admissible pair forces both phases nonzero). Otherwise both cutoff sums equal one. This proves the pointwise collapse with NO triangle inequality on the complex amplitude.

Integrate over z and y. For a fixed (u,v), the local indicator (Ax)_T∈C restricts z to the translate A_T^-1 C, of group measure M(C), and the remaining Q indicator is independent of z. The real change of variable y→u_infty y preserves Haar measure. The result for each term is M(C) times its actual amplitude with Q, so summing gives M(C) cosetAmplitude_T(c,s,c',gamma). Fubini/Tonelli followed by absolute-integrability Fubini is justified by the native amplitudeAbs sum: the map (u,v)↦u gamma v^-1 is injective by big_cell_unique for sigma∈GT_rho, and the sum of the absolute integrals is bounded by M(C) times the finite global amplitudeAbs sum (native amplitudeAbs_lt_top_and_cut_le). This is not a conditional rearrangement.

On the collapsed side the real integral is besselCorrelation(volume,W,gamma_infty). In the finite integral the a,b coordinates of Z.besselVector are phase(z a^-1), phase(P(gamma)_T^-1 z b^-1). Right translate z→z a and use k_T^-1 a b^-1∈C, plus right-C invariance of phase, to get phase(x_T) and phase(xi_T). The native equality w_q termPosition(c,c',sigma)_T=P(gamma)_T identifies this with the finite besselCorrelation defining Level.correlation. Multiplying both sides by headDensity κ gives the exact native equation
 correlation(Z,q,P(sigma)_T^-1)_(a,b) · besselCorrelation_inf(gamma)
   = κ M(C) cosetAmplitude_T(c,s,c',gamma).
This closes the pointwise and integration algebra of GlobalToLocal.correlation_smul_eq_cosetAmplitude from its native phase support/rational approximation, cutoff, summability and big-cell suppliers. No new class cutoff assumed and no normalization loss.

## 2. Explicit local unitary section (no approximate matrix inverse)

Use FinitePlaceDensity.exists_eichler_orbitPoint_eq. For Hermitian h (antilinear first slot), distinguished z, and native vector u with h(u,x)=x_l and u_l=0, we have h(u,z)=1 and h(u,u)=0. Let e be near z, β=h(u,e)=e_l a unit, v=e-z, and σ=h(v,e)-τ(h(e,e)-h(z,z)), where τ+barτ=1. Then σ+barσ=h(v,v). Put w=v+σu and
 g(x)=x+u h(v,x)-β^-1 w h(u,x).
This is the exact source formula when β is a unit. To verify unitarity write a_x=h(v,x), b_x=h(u,x). Expanding h(gx,gy)-h(x,y), the coefficient of bar(a_x)b_y is 1-1/β-(β-1)/β=0 using h(u,w)=β-1. Its conjugate coefficient is likewise zero. The bar(b_x)b_y coefficient is
 [h(w,w)-σ barβ-barσ β]/(β barβ)
   =[h(v,v)-σ-barσ]/(β barβ)=0.
The remaining term is zero by h(u,u)=0. Thus g is unitary over each field factor, hence over the semilocal product. For h(e,e)=h(z,z), σ=h(v,e), so g(e)=e+σu-w=z. At e=z, g=I; continuity of inversion on units gives a continuous local section. For the actual last-floor coordinates, both u and v lie in the last floor subspace, and the functionals h(u,·),h(v,·) vanish on its orthogonal fixed coordinates; hence g fixes the earlier e_a,e*_a and belongs to GT_rho. This is the near-z, unit-coordinate case needed in TopFloor; the general non-unit branch of the source is not used here.

If l_o∈GT_rho sends e0 to z, then for x near e0 in the same last-floor norm quadric choose m=l_o^-1 g(l_o x) l_o. This m∈GT_rho tends to I and m x=e0. In particular every old representative l_i with l_i e0=z has a new representative l_i m for x, using the SAME m for all i.

## 3. Local correlation constancy and finite packet lower bound

For fixed finitely many prefix sequences p, the native gauge compactness and hasMatSize_of_ne_zero give a single compact set of integration variables y on which the correlation integrand can be nonzero, uniformly for all sufficiently nearby prefixes and right translations m and all last-floor l. On this compact set the conjugate y^-1 w_p m w_p'^{-1} y lies in the open congruence subgroup C when (p',m) is sufficiently near (p,I), by continuity and a finite subcover. The phase is right-C invariant, so the corresponding integrands agree (outside this compact set both vanish). The finite headDensity is locally constant: ratios p'_a/p_a are integral units, so their moduli are 1. Hence the actual eventually_correlation_eq: J(p',l m)=J(p,l) for all l∈GT_rho on one common neighborhood. This uses the exact gauge support supplier, not global compact support of arbitrary Bessel vectors.

Let H be besselH, H0=H∩C. The finite phase vector is left-H0 invariant by its defining phase law (simple-root sum zero on H). H commutes with the Weyl elements w_p for these prefixes. Thus J(p,h0 l)=J(p,l) for h0∈H0, by left-H0 invariance of the second Bessel factor, and J(p,l k)=J(p,l) for k∈H0 by the change of variable y→k y, commutation and left-H0 invariance of the first factor.

For the actual Level.energy infimum, fix l_i∈GT_rho sending e0 to z and coordinate labels n_i, with the native distinctness condition l_i l_j^-1∈C and n_i=n_j implies i=j. Take x near e0, k∈H0, y=k^-1 x. If y has no last-floor representative its energy is infinity. Otherwise choose ANY l∈GT_rho with l y=z. Then x is in the last-floor norm quadric and the local section m above exists. The elements
 h_i=l_i m k l^-1
belong to H because they fix z and lie in GT_rho (native stabilizer identification unitriGroup_inf_floorGroup_last / inv_mul_mem_of_orbitPoint_eq). For h∈H0 h_i,
 J(omega_p,h l) = J(omega_p,l_i m k)=J(omega_p,l_i)
using left-H0 invariance, right-H0 invariance and the common local constancy. If n_i=n_j and H0 h_i intersects H0 h_j, then h_i h_j^-1=l_i l_j^-1∈C; distinctness forces i=j. Thus the subsets H0 h_i times {n_i} of the integration domain H times the finite coordinate set are pairwise disjoint. Their measure is measureH(C) by right invariance and support on H. Integrating the nonnegative functions (Re v*R v)^+ on these disjoint subsets gives
 I(l)>=measureH(C) sum_i (Re v_i^* R v_i)^+.
Taking the infimum over ALL l gives exactly the native eventual packet lower bound. No choice of a representative minimizing energy is assumed. This provides the geometric proof of TopFloor.eventually_sum_packets_le_energy from the native last-floor stabilizer and gauge compactness/support; it works for general R with positive parts and specializes to PSD R in the actual caller.

## 4. Actual packet mass factor (same Z, no new loss)

Write U=unipOrder, Hbar=image of H at level, Sbar=image of the Bessel subgroup. Native card_reducedImage_besselS gives |Sbar|=|Hbar| U, and g_pow_mul_unipotentMass gives unipotentMass=1/U. The right-invariant measureH on H is normalized by measureH(K)=1 (StandardLevel.box_eq). The finite reduction cosets of H∩K partition it into |Hbar| translates of H∩C, so measureH(C)=1/|Hbar| (native card_reducedImage_mul). Let D0=|Sbar| U, so measureH(C) D0=U². The group Z intermediate between C and K is the disjoint union of its C-cosets, hence M(Z)=#(Z/C) M(C). The native massRatio=M(Z)M(C)/unipotentMass² is therefore
 massRatio = #(Z/C) M(C)^2 U²
           = measureH(C) #(Z/C) M(C)^2 D0.
The source uses the sufficient inequality in this direction; the equality is valid under the stated finite coset and Haar normalizations. Also packetConst=D0·#Classes·siegelConst. No choice of independent probability normalization.

For a fibre of the finite packet sum with common (class, orbit-point rational coordinate), take the product of its indices with Z/C. The native representatives a,b exist because red(n_i) lies in Z and Z is a group; choose a so n_i,T^-1 a b^-1∈C. The native termPosition_floorGroup_spec, big-cell stabilizer and eq_and_mem_classUnip_of_besselS give the injectivity required in §3: if two such labels have equal coset coordinate and their l's differ by C, off-T integrality lifts this to the global principal level, equality of the class and orbit point gives a class-unipotent difference, and the intersection with the last floor is trivial (eq_one_of_mem_floorGroup_inf). This is exactly the final argument of FiniteSystem.sum_blocks_le_topKernel; the group intersection and orbit-coordinate lemmas are retained.

By §1 and the real Gram contraction, each such packet's quadratic expression is
 ||sum_p rho_p correlation_fin(p) besselCorrelation_inf(p)||²
   = M(C)² G_t ||r0 sum_p cosetAmplitude_T(p)||²,
using rho_p headDensity=r0 sqrt(G_t). This is independent of the coset coordinate b; summing over b multiplies by #(Z/C). The packet inequality of §3 and the mass identity imply energy near a rational orbit point is at least
 G_t massRatio / D0 * sum_{i in fibre} ||r0 sum_p cosetAmplitude_T(i,p)||².
This is the exact weight c used in the native Siegel quadric estimate. Grouping by rational orbit point avoids double counting. Applying siegel_sum_le_lintegral_quadric to these weights and §1 of e3228b19 (integral energy<=Q), then cancelling G_t>0 and vol(L)>0, yields
 sum_i ||r0 sum_p cosetAmplitude_T(i,p)||²
 <= (1+b^-6) packetConst Q / [vol(L) massRatio].
Thus the actual sum_blocks_le_topKernel follows from the finite orbital transport, mass calculation and named Siegel quadric estimate; it is not an assumed generic coherence bound. Feeding this into e3228b19 recovers energy_fixingSet_le with the original constant.

## 5. Exact remaining premises

This batch closes the phase-unfolding, local-section, disjoint-packet, and packet-normalization arguments at the human source-matched level. It does NOT independently prove (a) the rational unipotent approximation and amplitude absolute convergence suppliers, (b) the gauge hasMatSize compact support bounds, (c) the actual quantitative Siegel quadric estimate derived using the one-vector Siegel-Weil formula and off-place mass bounds, (d) local real Bessel band limits, or (e) the full CrudeEnergy pair-weight bound. These are the remaining primitive inputs in B. The one-vector classSum_norm_eq is a genuine Siegel-Weil/Fourier coefficient theorem, not a consequence of positivity; its proof must either be reconstructed or use a precisely matched standard theorem with all normalization and range conditions. Do not call full B or RH complete.

New source anchors at compact pin: New/Filling/GlobalToLocal.lean 6b717f446ef9a78dc4ae91400a2394bba8d91610; AmplitudeSums.lean 832e25af346bbbbdabdbec205b0e7f833170e0a1; TopFloor.lean 9762970967aef90b3a4e025b7f2891d892c70111; FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7; StandardLevel.lean ec149f4a38c54931f75c7e106ce94d1d6e65c5a4; Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727; BesselSystem.lean 847e2869ed2c189c30f6efef85e7c1f2451058; Lib/Adelic/Adeles/FinitePlaceDensity.lean d53185b90cb994c0af5ed56e7cf23aba91230271; Lib/SiegelWeil/OneVector/OneVector.lean d9f90a7b5170a98542f261fa08b05aee695a6bff; New/RealPlace/BandLimits.lean 20ff4e65c2599fc8b752dbb93673ed65053e2216. Peer 2c2d51df/50a0e493 advances C mirror reciprocity; 2e61d8c6 advances Kolyvagin; retain their audit status rather than infer completion from titles. RUN29 primitive replay has no status record yet at this check. RESUME: actual finite Fourier mass estimate and real-place band limits; editor merge this into B, not another endgame reformulation.