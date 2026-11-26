# RUN59 — Uniform shifted-vacuum bound at the common comparison kernel
26 November 2026. PARTIAL: source-matched human derivation of the quantitative clause, not a new kernel replay or complete RH proof.

## Preflight and exact scope
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion-first, primitive closure, expanded workload, binding URT exception); manuscript 3b1dff5b3db0cc0067ae4fea967239417e6b4065; SWARM_PROTOCOL 4b77b161d6876915c15cea5a4d4a519beaf5de74; AGENTS 8db0201da965541e0487d6dd1271e010bdaa0972. Read current handoff and continuity/research protocols, research state/log, and state-branch summary (orchestrator run 45863524851, pre-existing PASS only). Recent peers f301858e, 6c88e267, 76a10b40, 34b26ecb, 4dcf2dd6 and 3347d944 address distinct crystalline, A and period/Hecke suppliers. Continue specialist RUN58 commit 6b3590ae3918375d29e71bed3ef0520b8cbe488c. No physics changes.

All source paths below relative to lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207/grh-compact/src (Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679). Credit Alpöge, Sernau, Anthropic collaborators and Claude. Actual supplier: New/Curve/ConjugatesOfJets.lean blob 8b841d76bb938d8a18fd4341aa832a20b13dd9e0, exists_semilinear_isJetConjugate lines 164–170, proof 196–225. Consumer: New/Rows/MemberKernels.lean be36c0175fe559376780b105052249fc0c9f1f4f, norm_jet_le_of_isAdmissibleComb 41–88 and exists_modKernel_integral_bound 143–167, then LineArithmetic 25–41, 54–83 (f6235933aecfcf1a1c82be94b4ad3edbe5057794), ComparisonForms (14ef893c54f5db837ea7e4f143b2b1a444b89b5a). The comparison line's same scale is preserved. This note proves the quantitative estimate conditional on the already constructed semilinear map, not the full CM reciprocity theorem.

## 1. Scalar cost of semilinear transport
Put E=P.E s, N=P.N₁ s≥1, d=P.d≥1, r=card n, f=#infinite places of E≤N by the cyclotomic degree/totient bound. Write C for the nonnegative integer chosen in exists_isJetConjugate_generator (New/Curve/ConjugateGenerator.lean ad3f02ee95b950ae5a4fa98e30fd939e41837ae1, 26–31). Fix the standard V and sigma in Gal(C/K). Let L be the same semilinear map constructed at 171–178 of ConjugatesOfJets; retain the generator/span, jet injectivity, central character and semilinear intertwining hypotheses established there. In particular L rho(finVec x) intertwines translation by b x for a finite adelic unit b, and L omega(g) = ratio(sigma,g) omega(g) L on finitePart. At 179–185 L vac = c0 omega(z) vac for a norm-one scalar finite adele z, with c0 nonzero. For the integral vacuum v=intVacuum V=kappa^r vac, write a=sigma(kappa)^r c0, so L v=a omega(z) vac.

The pointwise finite-value identity in ConjugatesOfJets 181–185, obtained by applying constantCoeff to conjugate jets of rho(finVec x)v, says (L v)(finVec(b x))=sigma(v(finVec x)). The unit property of b makes multiplication bijective on all finite adelic vectors, so |(Lv)(finVec x)|≤M=exp(C N² r) for ALL finite x by IntegralVacuum.lean c34fe7625b03009fbd5954ea00209b425ca603b1, 67–80. Its norm_dataInner_le, 90–95, gives |dataInner(Lv,Lv)|≤M². The normalized vacuum has unit dataInner norm and omega preserves it; hence |a|²≤M² and |a|≤M. This is the square-root step at 196–201, using no estimate of an arbitrary complex automorphism of an analytic integral. The bound remains valid for r=0.

Lib/CM/Reciprocity/SemilinearWeilLaw.lean f0ceeb862976ee92b3dae11a122ce465901f7994, 26–30, gives ratio(sigma,g)^2=upsilon(det g)/sigma(upsilon(det g)). Both character values have modulus one under the respective embeddings (the precise HasWeight norm identity used at line 200); thus |ratio|=1. One must use this identity, not assume every field automorphism preserves absolute values. The Heisenberg product also introduces only unit-modulus phases. It follows that the pointwise bound reduces to M times a bound for the unit vacuum after an arbitrary finite Weil move and an arbitrary Heisenberg translation; the finite scalar z is absorbed in the SAME group element g.

## 2. Exact cancellation of the shift before taking norms
Source ConjugatesOfJets 202–225; underlying Lib/Weil/Construction/ThetaFunctional.lean b21b5f01564922bbd2ed309ef614111698b2384a, IsRatInvariant.hasSum_modelInner 240–244 and IsThetaFunctional normalization 196–199. The data evaluation at y is the theta functional applied to a Heisenberg translate. Use the normalized theta Fourier identity on F=rho(y) omega(g)vac:
    |theta(F)|² = sum_gamma <F,rho(vecAtPoint_V gamma) F>_model
(up to the source inner-product convention; using its complex conjugate does not change the bound). The model theta Fourier identity here is equivalently the data-inner HasSum used by the native proof. Keep its absolute summability supplier (ThetaFunctional 219–223); do not interchange an unproved series with a limit.

Conjugate the Heisenberg operator in each summand by rho(y). Its argument remains vecAtPoint_V gamma; the only change is the unit-modulus bicharacter phase. Next conjugate by omega(g) via covariance and unitarity. The resulting vacuum matrix coefficient has modulus |vacuumFn(vecAtPoint_(V.move g) gamma)|. The y-dependence is now only a phase. Thus the support and the absolute Gaussian weight are INDEPENDENT of y, including translations with arbitrarily large archimedean or finite coordinates. The phase is discarded only after this exact cancellation; bounding shifted Gaussian peaks individually without the shift-conjugation identity would not supply uniformity.

Lib/Weil/Construction/AdelicHeisenberg.lean 6d56fe0aa1762a56778d40f9086f69e721f91b14, 12–16, gives the vacuum coefficient, supported on
    T={gamma in E^n : alpha^{-1} (vecAtPoint_(V.move g) gamma)_fin in O_hat^n}.
Its modulus on T is exp(-pi t_gamma²/sqrt(d)), where t_gamma=||archCoords_(V.move g) gamma||, and zero outside T. Indeed the native Weil datum j=-1/sqrt(-d) has positive imaginary part 1/sqrt(d) at the selected complex embeddings (New/Data/WeilDataOfE.lean 8baa0621fbd228428a1226da1a8e98aa1251740d, 222–end), and the coordinate norm is Euclidean. The finite additive character is circle valued. Consequently
    |theta(F)|² ≤ sum_(gamma in T) exp(-pi t_gamma²/sqrt(d)).
This is the exact majorant at 212–225, not a norm on an invented lattice.

## 3. The same support gives uniform unit separation and absolute summability
Source ConjugatesOfJets 204–210; WeilDataOfE 219–220 gives N alpha ∈ O_hat, and Lib/Adelic/Reduction/FirstMinimum.lean 701ad5475dc3fe1156447ce513009f9a57be6525, 24–34, 64–81 gives the coordinate transport and first minimum. For distinct gamma,delta∈T, the finite coordinates of N(gamma-delta) in the moved frame are integral, since N alpha is integral and both original finite coordinates lie in alpha O_hat^n. Hence N(gamma-delta) belongs to the baseLattice of V.move g and is nonzero. The space is definite (all signs agree); one_le_firstMinimum applies also to the moved frame. Therefore
    ||N archCoords(gamma)-N archCoords(delta)||≥1.
For completeness, its proof is the integral Hermitian norm argument: an integral nonzero lattice vector of archimedean norm <1 would have h(v,v)=0 by the product/norm bound form_eq_zero_of_norm_mul_lt_one, contradicting definiteness. This uses the actual arithmetic lattice and not an ambient cubic grid assumption.

Use real dimension h=2fr and D=h+1. The points N archCoords(gamma) are 1-separated, and have norm Nt_gamma≤N exp(t_gamma). Apply Lib/Adelic/QuotientMeasure/Packing.lean 498aaa596eb8176d0ee865c61f94e8391a478f7a, 115–136, with m=1, R=N, u_gamma=exp(t_gamma)≥1, A=D, c=D. For clarity this instance follows directly from packing and layer integration: open balls of radius 1/2 about the points with u_gamma≤v are disjoint, lie in the ball of radius Nv+1/2, and their volume ratio gives count ≤(1+2Nv)^h≤(1+2N)^h v^h for v≥1. Bounded shells are finite, so the index set is countable. Summing u_gamma^{-D}=D integral_(u_gamma)^∞ v^{-D-1} dv and using Tonelli gives
    sum_gamma exp(-D t_gamma) ≤ D (1+2N)^h integral_1^∞ v^{h-D-1}dv
                                = D(1+2N)^h.
The zero-dimensional case consists of at most one point and obeys the same bound. No dependence on y or g enters the packing constant. This is the actual source application, not a harmonic cutoff.

The square (t-sqrt(d)D)^2≥0, together with pi≥2, implies
    -pi t²/sqrt(d) ≤ sqrt(d)D² - D t       (t≥0).
In fact Young's inequality even gives D t≤t²/sqrt(d)+sqrt(d)D²/4, but the source allowance is already sufficient. Therefore the Gaussian sum is absolutely summable with
    sum_(gamma in T) exp(-pi t_gamma²/sqrt(d)) ≤ exp(sqrt(d)D²) D (1+2N)^h.
Together with section 2 this yields the same uniform estimate for every moved and translated vacuum.

## 4. Close the native exponent without enlarging the allowance
Set B=Nr+1. Taking the square root of the Gaussian sum (not the entire coefficient bound) yields
    |L rho(finVec x) omega(g)v (y)|
       ≤ exp(C N² r + (sqrt(d)D² + log D + h log(1+2N))/2).
For r≥1: h≤2Nr, D≤2B, N²r≤(Nr)^2≤B², sqrt(d)≤d. By log(1+u)≤u and log D≤D-1,
    (sqrt(d)D²)/2 ≤ 2d B²,
    (log D + h log(1+2N))/2 ≤ Nr + 2N²r ≤ 3B².
Thus the displayed exponent is ≤(C+2d+3)B². If r=0, h=0, D=B=1, the exponent is sqrt(d)/2≤2d+3. The actual P.c is C+(2d+6)+N₀+|chowlaSelbergConst|+sum |log |P₀'(ξ)|| (New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834, 12–17), so in all cases
    |L rho(finVec x) omega(g) intVacuum V (y)| ≤ exp(P.c (N r+1)^2).
This closes the quantitative human derivation of the precise clause at ConjugatesOfJets 168–169, conditional on the named semilinear and theta model inputs. It feeds RUN58's radial majorant and its same nonzero kernel scale C_K; no additional independent normalization, uniformity in sigma, or pointwise field-automorphism assumption is introduced.

## Candidate comparison, verification and surviving dependencies
Ordinary cancellation and packing already give the needed uniform all-frequency estimate. A fixed URT ranking/truncation would need an additional tail theorem and cannot replace the positive absolute majorant: translating the argument changes only phases, and no finite ordering supplies an upper bound on the omitted positive Gaussian terms. We did not execute an unnecessary finite diagnostic or claim an URT advantage. Native Lean and Lake absent from local PATH; no new CI execution, no PASS, no new axiom evidence. No change to original/reduced dependency graphs. For native checking in the pinned compact project:
```lean
import New.Rows.MemberKernels
#check Parameters.exists_semilinear_isJetConjugate
#print axioms Parameters.exists_semilinear_isJetConjugate
#check Parameters.norm_dataInner_le
#check tsum_le_of_separated
#check Parameters.norm_jet_le_of_isAdmissibleComb
#print axioms Parameters.norm_jet_le_of_isAdmissibleComb
```
These commands are prepared, not executed here. The previous orchestrator result does not verify this note. Remaining essential dependencies: generator theorem and CM reciprocity (including central-character compatibility and finite Weil intertwining), normalized theta Fourier/model coefficient identity, definite first-minimum argument and Weil data denominator. The latter two and packing were explicitly expanded above; no global dependency deletion. External formal certification distinct from our unfinished human reconstruction.

RESUME HERE: independently audit the exact central-character comparison in ConjugatesOfJets 186–195 and the conjugate-generator finite-frame existence in ConjugateGenerator 38–89; integrate the uniform shifted-vacuum bound into the existing common comparison line rather than redoing the endgame.
HANDOFF TO: integration/editor, theta, formal audit. Other lanes need not wait.
