import New.Filling.Moments
import Mathlib.Tactic

/-!
# RUN70: coherent-link finite-block assembly, nested limits and exact mass cancellation
27 Nov 2026. Human source-matched reconstruction; not new kernel verification.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10; completion-first amendment,
mandatory engine section, AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION and
current manuscript reviewed. Peer integration 9fbb841b, editor d14639a0 and
positivity 2952c52c reviewed; do not duplicate their formal-degree calculation.
RUN69 a2e4e787 supplies the remaining scalar and off-Bessel caller assembly.

## 1. Actual coherent support and injective blocks
Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444 lines 124–183;
GlobalToLocal.lean 6b717f446ef9a78dc4ae91400a2394bba8d91610 lines 178–213.
Fix the SAME admissible S and proper selected Sigma, with m=|Sigma|,
f=numInfPlaces E, k=shape.k, n=rho+1, y=b^(-6km), nu=unipCovolume.
Take any finite F of supported nonzero link amplitudes indexed by
(c,s,c',Lambda); retain the original nonzero discriminant and fixingSet guards.
All leading minors of each rational term in the relevant termsOver are nonzero:
for the required lower minors choose the unit-minor witness from the fixing
condition (the native disjunction for the two levels); transport the frame
Gram of termPosition under reduction. The rational leading minor, if zero,
would give zero after reduction by the determinant ring-hom identity, in
contradiction to that witness. Retain exact reduction/Gram transport and the
source disjunction, not a claim that every rational term has unit minors.

The native big-cell decomposition now gives for each supported j a top
t_j in E*, a middle sigma_j in GT_rho and a lift n_j with reduction s_j.
At every infinite place |Phi_v(t_j)|^2>N^2. The link is precisely
link(weyl(1)*sigma_j). For fixed t, the map
    j -> (c_j,c'_j,reduction(n_j),sigma_j)
on F_t={j in F:t_j=t} is injective: equality of this tuple gives equal
c,c',s and, by the preceding exact link formula, equal Lambda.
Do NOT require different t-blocks to have distinct reductions, and do not
sum squared amplitudes over the individual rational terms.

Write delta_j(p,u,v)=u weyl(p,t_j) sigma_j v^-1, p in (E*)^rho,
u,v in rational Bessel unipotent. The native big_cell_unique makes this
parametrization injective; link_big_cell_eq_iff makes its image cover the
supported terms of that link, with the indicator of termsOver retained.
By summable_amplitude the indicator-weighted family A_j(p,u,v) is absolutely
summable. Regroup using absolute convergence, putting
    L_j(p)=sum_(u,v) A_j(p,u,v),   a_j=sum_p L_j(p).
For fixed p, the local coset amplitude A_j,T(p) differs from this sum only
by the integral-off-T indicator on the rational left position. For each
fixed (u,v) it is eventually one as the finite set of places T grows;
the absolute summable majorant |A_j(p,u,v)| is independent of T.
Dominated convergence gives A_j,T(p)->L_j(p). This is the mathematical
mechanism of exists_hasSum_cosetAmplitude. Big-cell decomposition, exact
character/cutoff definitions and absolute-unfolding estimate remain upstream
suppliers; this derivation does not prove those separately.

## 2. Finite local packet comparison and the common normalization
FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7 lines 16–294,
TopFloor.lean 9762970967aef90b3a4e025b7f2891d892c70111 lines 425–586,
GlobalToLocal lines 302–377. Fix a finite U of rational units containing
all t_j and all coordinates of the requested finite p-tuples, and choose
arbitrarily large star-stable T where the needed coordinates and positions
are integral off T. Existence is eventual, not uniform over all rational
terms. Take the actual intermediate subgroup Z from exists_finite_sieveSystem
for Sigma; it contains the local lifts n_j by the fixingSet guard.

Use the native common archimedean Gram R on the p-tuples in U^rho,
weighted by the same rho_p. It depends on t and the frame scales, not on
j in the block. It is positive semidefinite as a Gram matrix. The product
correlation is the product of local correlations (Fubini, finite product
coordinate sums, native integrability); the band_limits.2 equality
identifies its weighted Gram entries with the product of the band kernels.
Keep the exact t and middle-group hypotheses of that identity, including
ratToInf_mem_unitriangularOn. The matching headDensity identity is
    rho_p headDensity(omega_p,1) = r sqrt(G_t),
    G_t = (prod_v (|Phi_v(t)|^2-N^2))^(k-1)>0,
    r = openCellConst^(f/2) frameScaleProd / (card BesselCoord * H)>0,
where H=prod_(v,i) frameScaleSq(v,i); see exact predecessor-k calculation below.
The latter is the r in Moments: expand padTuple and frameScaleSq at the
last entry N^-1, and apply md_evalPlaces_rpow_half to each integral-off
coordinate. No independent local choice of r, and no division by G_t=0.
The actual coordinate density and band identity remain required.

For each fixed block, group by g_j=(c_j, tail vector of sigma_j z).
Inside a g-fibre label packets by (j,b) with b a Z-coset; choose A(j,b)
such that n_j^-1 b A(j,b)^-1 is in K(g), as in FiniteSystem.
The separation argument is not merely distinct j. If two labelled
packets have the same correlation coset and same coset pair, the equal
tail vectors and common t give equal full orbit points. The relative
sigma_i^-1 sigma_j is then in the last unitriangular/floor intersection
(inv_mul_mem_of_orbitPoint_eq). The equality of the class coordinate and
principal-level congruence, transported by mem_principalLevel_iff, gives
equal c' and membership of the relative in classUnip. The intersection
of this lower Bessel unipotent with that floor subgroup is trivial, by
eq_one_of_mem_floorGroup_inf. Thus sigma_i=sigma_j. The two coset choices
give reduction(n_i)=reduction(n_j) by reduction_eq_iff. Section 1 now gives
i=j, and the equal coset pair gives b=b'. This supplies the exact packet
injection, retaining the named orbit/class/intersection lemmas. These
group identities are not consequences of positivity alone.

For a finite family of such packets at an orbit point, the nonnegative
energy integrand is the Gram quadratic form v* R v. The native local
constancy eventually_correlation_eq (uniform in middle group, from compact
gauge support) extends these packets to a neighborhood; disjoint
(coset,label) pairs permit summing their contributions with Haar mass
mu_H(K(g)). This is the lower energy bound of eventually_sum_packets_le_energy.
In applying it, use the SAME packet normalization of
correlation_smul_eq_cosetAmplitude: the local correlation times the infinite
correlation equals headDensity times mu(K(g)) times cosetAmplitude.
The proof expands both cutoff factors, transports both principal-level
conditions, and cancels phases via val; each cutoff sums to 1 after rational
unipotent approximation. Retain absolute exchange justified by the native
amplitudeAbs_lt_top_and_cut_le and big-cell uniqueness.
Consequently after the Gram identity and rho_p headDensity=r sqrt(G_t),
each packet contributes G_t mu(K(g))^2 r^2 |sum_p A_j,T(p)|^2.
Summation over the |Z.Cosets| labels and multiplying mu_H(K(g)) gives
the common factor in FiniteSystem, not |Z.Cosets|^2.

For the rational tail points, build a locally constant compactly supported
minorant by taking the maximum of their finite nonnegative weights on
small integral-lattice neighborhoods and their H-orbits. The H-invariant
lattice (intGL) gives invariance and local constancy; the orbit neighborhood
lower bounds give minorization. Finite union of compact lattice
neighborhoods gives compact support. This is exists_step_function, where
a common unit scales the integral lattice into all required neighborhoods.
The actual siegel_sum_le_lintegral_quadric uses that test function in
classSum_norm_eq and the one-vector formula, Fourier dominated convergence
as the top parameter approaches t, and mass_near_quadric_off_places_le.
Do not replace the latter with a bare volume argument or an arbitrary
Siegel–Weil citation. Keep these exact quantitative suppliers open unless
independently derived; their slack is the original 1+b^-6.

Thus combining the two positive comparisons via
lintegral_energy_le_topKernel and the one-vector inequality gives the
actual sum_blocks_le_topKernel, conditional on the retained local and
one-vector suppliers:
    r^2 sum_(j in F_t)|sum_(p in U^rho) A_j,T(p)|^2
       <= (1+b^-6) packetConst
          Re sum_(p,q) R_t(p,q) topKernel_L(omega_p,omega_q)
                            /(vol L massRatio(Z)).
Here the native normalization uses
massRatio(Z) <= D mu_H(K(g)) mu(K(g))^2 |Z.Cosets|,
packetConst=D (#Classes) siegelConst.
The factors G_t and mu(K(g))^2 cancel, rather than being discarded by norms.
All divisors are positive finite by the native mass lemmas, and L is
compact open containing 0. The block inequality holds for all sufficiently
small such L. For the finitely many t blocks choose ONE L in the
intersection of their small-set neighborhoods, using a compact open ball.
The same Z and L define the native SieveSystem, so summing blocks over t
before taking real parts gives exactly the input of S.sieve. No independent
choice of L for each block is permitted in this application.

## 3. Exact mass and frame cancellation at the actual caller
Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727,
GlobalSieve.lean 0ad01a3eec4c5dcd2a51bb1d9773f7834970e372 lines 172–end.
Put u=b^-1, Dg=besselDegree>0, V=vol(Ohat)>0, C0=openCellConst>0,
P=frameScaleProd>0, B=card BesselCoord>0.
The exact sieve gives the upper bound in section 2, summed over t, as
    (1+u^6) packetConst Q / Dg
      * [ (1+u^10)^f (1+u^6)y + b^(-6kf-10) ],
where Q=prod_(i<n) V / prod_v(frameScaleSq(v,i)^2).
The admissibility bound packetConst_mul_mass_le is
    packetConst <= (1+u^9) mainEnergy Dg C0^f / V^n * (nu P/B)^2.
In the native band/head convention the r in Moments multiplies P by
prod_(v,i) frameScaleSq(v,i)^(-1):
its exponent is k+2*rev with k the predecessor of shape.k
(the source 'cases hk : shape.k with k'; thus original k-1+2rev).
Consequently, defining H=prod_(v,i) frameScaleSq(v,i), the ACTUAL
r=C0^(f/2) P/(B H); r^2=C0^f P^2/(B^2 H^2), and Q=V^n/H^2.
Therefore the normalization is exactly
    packetConst Q/(r^2 Dg) <= (1+u^9) mainEnergy nu^2.
No scale-loss or additional factor of the number of places.

Because m<=f, b^(-6kf-10)<= y*u^10. By f<=b and b>=1000,
(1+u^10)^f <= exp(f*u^10) <= exp(u^9) <= 1+2u^9.
The last inequality follows from convexity on [0,1] and e<3.
With v=u^6 in [0,1], all u^9,u^10<=v, hence the remaining scalar
factor after dividing by y is <=
    (1+v)^2(1+v)(1+2v) + (1+v)^2 v
    = 1+6v+11v^2+8v^3+2v^4
    <=1+27v <=1+u^4,
since 27u^2<=1. Uses original final factor (1+b^-4), not a new
asymptotic claim. Thus for fixed finite U and arbitrarily large good T,
    sum_(j in F)|sum_(p in U^rho) A_j,T(p)|^2
       <= (1+b^-4)y mainEnergy nu^2.

## 4. Two nested limits, no uniform convergence assumption
First fix U. All p and j in the preceding inequality are finite.
The pointwise dominated convergence in section 1 gives convergence
of their finite sums and squared norms as T grows. Because the good T
are cofinal (frequently atTop), the same closed upper bound holds at
the limit with L_j(p) in place of A_j,T(p).
Second increase finite U directed by inclusion. For any finite subset
of (E*)^rho all its coordinates lie in some U; also include all t_j.
Therefore the boxes U^rho are cofinal among finite tuple sets, including
rho=0 (the singleton empty tuple). Absolute summability of L_j now gives
sum_(p in U^rho) L_j(p) -> a_j. The same closed bound survives. This
argument is exactly the order of the two le_of_tendsto_of_frequently
in Moments, not an exchange of two infinite limits. Finally supremum
over finite subsets F of supported link amplitudes equals the nonnegative
tsum defining linkEnergy; zero terms contribute zero. For proper Sigma,
    linkEnergy <= (1+b^-4)y mainEnergy nu^2.
For Sigma=univ the link set was empty in RUN69, hence energy zero.
Substitute this bound at RUN69 section 4 to recover energy_fixingSet_le
conditional on the retained suppliers, with no additional coherent
factor. This supplies the actual caller assembly, not the entire
one-vector, top-Gram or global Poisson proof. The noncoherent pair estimate
energy_le_of_level_pairs remains a distinct dependency.

## Evidence, graph and audit
Original source-visible: B -> Moments.energy_fixingSet_le ->
{CrudeEnergy.energy_le_of_linkEnergy_le, exists_hasSum_cosetAmplitude,
sum_blocks_le_topKernel, exists_finite_sieveSystem, sieve}.
sum_blocks -> {correlation_smul_eq_cosetAmplitude, eventually_sum_packets_le_energy,
siegel_sum_le_lintegral_quadric, lintegral_energy_le_topKernel}.
Reduced human graph: finite injective t-blocks, nonnegative packet sum,
common L, exact r/packet cancellation, fixed-U dominated convergence
then cofinal boxes then nonnegative tsum. All source dependencies, pending
primitive local/analytic suppliers and prior axiom evidence retained.
Context key compact pin + same S,Sigma,D,T,U,F, Z and L, same r and Gram.
No URT, no RH premise, no claim of global edge deletion.
Executed local SymPy expansion of scalar polynomial (coefficients 6,11,8,2,
sum 27), exact assertions succeeded; PATH lean/lake/elan absent.
Historical native engine status blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717 retrieved, report pass on
old pin. Compact targeted_results.json 088cd2ec0e935ee1a282f10096949bcf671cc804:
named Moments.energy_fixingSet_le and two other named checks with only
propext, Classical.choice, Quot.sound, unrelated module exit 124;
all_requested_checks_ok=false, full_RH_replay=false. No new native replay,
no new rh_scan/prune/reduce/auto/frontier, no new PASS. Prepared scalar
certificate and source probes below; audit independently before incorporation.
RESUME HERE: integrate this coherent caller with RUN69 and RUN68. Verify
the exact predecessor-k normalization r=C0^(f/2)P/(BH) at Moments 136–166.
Then concentrate on actual one-vector classSum_norm_eq and quantitative
mass-near-quadric supplier, local top Gram and absolute-exchange details,
noncoherent pair estimate and distinct C Rallis test-space normalization.
Do not repeat the caller's scalar mass/limit assembly. HANDOFF TO integration,
editor, positivity, dependencies, audit and kernel. Full human RH unfinished.
-/

namespace CompactLandauRun70

theorem coherent_slack (u : ℝ) (hu : 0 ≤ u) (hu1 : u ≤ 1)
    (hsmall : 27*u^2 ≤ 1) :
    (1+u^6)^2*(1+u^6)*(1+2*u^6)+(1+u^6)^2*u^6 ≤ 1+u^4 := by
  let v := u^6
  have hv : 0 ≤ v := by dsimp [v]; positivity
  have hv1 : v ≤ 1 := by dsimp [v]; exact pow_le_one₀ hu hu1
  have hv2 : v^2 ≤ v := by nlinarith [mul_nonneg hv (sub_nonneg.mpr hv1)]
  have hv3 : v^3 ≤ v := by
    calc
      v^3 = v^2*v := by ring
      _ ≤ v*v := mul_le_mul_of_nonneg_right hv2 hv
      _ ≤ v := by nlinarith
  have hv4 : v^4 ≤ v := by
    calc
      v^4 = v^3*v := by ring
      _ ≤ v*v := mul_le_mul_of_nonneg_right hv3 hv
      _ ≤ v := by nlinarith
  have hp : 27*v ≤ u^4 := by
    dsimp [v]
    calc
      27*u^6 = (27*u^2)*u^4 := by ring
      _ ≤ 1*u^4 := mul_le_mul_of_nonneg_right hsmall (by positivity)
      _ = u^4 := one_mul _
  change (1+v)^2*(1+v)*(1+2*v)+(1+v)^2*v ≤ 1+u^4
  nlinarith only [hv2,hv3,hv4,hp]

theorem packet_normalization (c p B H V d nu P Q r M : ℝ)
    (hB : B ≠ 0) (hH : H ≠ 0) (hV : V ≠ 0) (hd : d ≠ 0)
    (hc : c ≠ 0) (hp : p ≠ 0)
    (hP : P = M*d*c/V*(nu*p/B)^2)
    (hQ : Q = V/H^2) (hr : r = c*p^2/(B^2*H^2)) :
    P*Q/(r*d) = M*nu^2 := by
  rw [hP,hQ,hr]
  field_simp
  <;> ring

#print axioms coherent_slack
#print axioms packet_normalization
end CompactLandauRun70

#check Filling.IsFillingLevel.correlation_smul_eq_cosetAmplitude
#check Filling.IsFillingLevel.sum_blocks_le_topKernel
#check Filling.IsFillingLevel.exists_finite_sieveSystem
#check Filling.energy_fixingSet_le
#print axioms Filling.energy_fixingSet_le
