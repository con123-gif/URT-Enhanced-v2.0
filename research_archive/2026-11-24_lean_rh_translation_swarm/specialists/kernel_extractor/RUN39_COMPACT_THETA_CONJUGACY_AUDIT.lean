import New.Curve.ConjugatesOfJets

/-!
# RUN39 — independent source audit, A caller, 2026-11-26

Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, current
completion-first instructions, compact manuscript through RUN65.
Source pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Prior RUN38 ea889f2b. Peer global theta ef1d797273ba6adbc6c9b7eebc91419ffab6c0fd,
RUN60 622fbfec, semilinear comparison 2ce507a2, RUN61 825590bb,
theta RUN65 44a5d463. These are not new results of this lane.
Target is the actual A supplier norm_jet_le_of_isAdmissibleComb via
exists_semilinear_isJetConjugate, not a new equivalent statement of RH.

Source ledger (relative paths and blob SHA):
New/Curve/ConjugateGenerator.lean ad3f02ee95b950ae5a4fa98e30fd939e41837ae1
New/Curve/ConjugatesOfJets.lean 8b841d76bb938d8a18fd4341aa832a20b13dd9e0
New/Curve/IntegralVacuum.lean c34fe7625b03009fbd5954ea00209b425ca603b1
New/Curve/FrameSections.lean 6bc331571971534045115e265473cfa148de9f14
Lib/CM/Reciprocity/SemilinearWeilLaw.lean f0ceeb862976ee92b3dae11a122ce465901f7994
Lib/Weil/Construction/ThetaFunctional.lean b21b5f01564922bbd2ed309ef614111698b2384a
Lib/Weil/Construction/Model.lean 714d037c13a76e24c2ea54b2237a37dbe08996ad
Lib/Weil/Construction/PairDefs.lean 8a5eaed1249fcc1c482e3af4f15373682fa34af1
Lib/Weil/Construction/AdelicHeisenberg.lean 6d56fe0aa1762a56778d40f9086f69e721f91b14
Lib/Weil/Construction/FiniteHeisenberg.lean be448ff4db1da9bfa0fe7bd637272be079be2285
Lib/Weil/Construction/FinitePart.lean 174ee272107a50267fcde8c0ea06aa73f5572fe5
Lib/Weil/Construction/Projections.lean 7a187f8be18a00b889082b56818393f20a7f88e4
Lib/Weil/Construction/FiniteMultiplier.lean 7b35474d42010a69abe9ba5868c0fce4d4490efc

1. Global theta normalization audit. With rho(x)rho(y)=beta(x,y)rho(x+y)
and beta alternating, set chi_gamma(x)=beta(x,gamma)^2. For rational gamma,
rho(x)rho(-gamma)=chi_gamma(x)^(-1)rho(-gamma)rho(x). Thus the Fourier
coefficient (using conjugate chi) of
F(x)=ell(rho(x)v) conjugate(ell'(rho(x)w)) equals
c <w,rho(-gamma)v>, with c the proportionality factor of the invariant
averaged form. Reindex gamma to -gamma only after establishing absolute
summability via summable_modelInner / the Wiener bound. In particular
the theta normalization gives c=1, not an arbitrary undetermined scalar.
The nonzero theta construction integrates the absolutely convergent
matrix coefficient character sum, with constant term <vac,vac>=1.
No use of the theorem being reconstructed as a substitute for this step.
Retain the supplied vacuum/reproduction and dual-family results. This
argument works for the actual normalized theta selected by the source;
do not change its phase independently of the selected CM generator.

2. Generator and central character audit. The finite vacuum expansion
has a common nonzero scale and coefficients either zero or roots of unity.
At every p-adic embedding the nonarchimedean triangle applies to that
expansion without dividing by its integer multiplicity. For archimedean
conjugation the same expansion has at most N^(4 f n) terms. f<=N and
log N<=N absorb the count into exp(4 N^2 n). The conjugate CM generator
uses the same finite frame and common multiplier, not one multiplier
per point. In the rank-one comparison choose a nonzero rational integer
k simultaneously stabilizing the two locally constant translated
generators (for the second use bk). k is a unit of the finite adele
ring, not necessarily of the integral subring. Comparing the jet
identities at x and x+k and cancelling the nonzero common translated
jet gives sigma psi0(z)=psi0(b bar(b) z) for every z, since x=2z/k
is allowed. This does not assume b invertible or continuity of sigma.
The span-map L is well-defined by injectivity of the target jet on the
finite part; the identity is preserved under every finite linear
combination and hence on that span. This retains the CM and jet
injectivity hypotheses of the native caller.

3. Exact Weil multiplier audit. By additive-character self-duality
the character identity forces eta=b bar(b) to be an integral adelic
unit: each local nonunit would contradict the annihilator equivalence
on a test inverse uniformizer supported at that place. Then
b^(-1)=bar(b) eta^(-1). Choose a integral unit with a bar(a)=eta
and a|R=1 on the conjugate-disjoint support, and u=b/a unitary;
at conjugate-fixed places take a=b. The finite orbit formula
omega(g)v=Delta(g)/J sum_[q in Lambda/H_g] H(gq)v has J=|Delta|^2
a positive integer. Multiplication by a permutes this quotient
since it commutes with g and preserves Lambda and H_g. Consequently
L omega(g)=sigma(Delta)/Delta omega(g)L on the finite span,
with the same L and vacuum scalar. Exact ratio identity:
  bar(Delta)/sigma(bar(Delta)) = sigma(Delta)/Delta,
since sigma fixes J=Delta bar(Delta). The proof never assumes
sigma commutes with complex conjugation or preserves complex norms.
The square identity for the ratio, together with the character weight
at the actual caller, yields modulus one. On the split R named
Schwartz datum the phase transforms exactly because a|R=1 and
bar(a)|R=eta|R; the finite Fourier generation of Schwartz data is
retained. No need for a separate new vacuum normalization.

4. Explicit finite-evaluation to global-inner-norm bridge, the
Parameters.norm_dataInner_le caller in ConjugatesOfJets.lean.
This is distinct from a pointwise bound on a Hilbert-space vector.
Let f be any source theta-model vector of a standard V, and assume
|f(finVec x)| <= M for all finite x. Here f(y)=theta(rho(y)f).
Rational invariance gives, exactly,
  f(gamma+y)=beta(gamma,y)^(-1) f(y)
for gamma in the rational image. The phase has modulus one.
For a rational gamma and arbitrary finite coordinate x_f choose
y=(0,x_f-gamma_f), expressed in the actual standard-space adelic
coordinates. Thus |f(gamma_infty,x_f)| <= M, regardless of the size
of gamma_f. The archimedean rational image is dense by the finite
dimensional number-field embedding and density of Q in R (equivalently
the source denseRange_Φ); holding x_f fixed and using continuity of
f gives |f(x_infty,x_f)| <= M at every adelic point. Hence the
probability quotient mean of |f|^2 is <= M^2, exactly the source
dataInner f f. This argument needs no continuity of a Galois
automorphism and no extra integral or lattice-volume factor.

In the actual caller apply it to L(intVacuum V). The jet constant
coefficient transfers each conjugate finite evaluation to the value
at the b-translated point, and b is now a unit. The rank-one product
bound uses the same scale to its nth power. As L(intVacuum V) is a
scalar times a unit vacuum orbit, the scalar amplitude is at most
exp(C N^2 n) by the quotient norm and positivity. This closes the
human inference from the finite evaluation bound to the amplitude
in the peer quantitative estimate without silently equating norms.

5. Audit the remaining pointwise step: for F=rho(y)omega(g)v,
hasSum_dataInner gives |theta(F)|^2 as the absolutely convergent
sum of <F,rho(gamma)F>. Translation commutator contributes only a
unit phase, Weil conjugation moves gamma by g^-1, and the vacuum
coefficient vanishes outside the finite integral support T. On T
its absolute value is exp(-pi r_gamma^2/sqrt(d)) with the actual
archCoords of the moved space. Thus
  |theta(F)|^2 <= sum_(gamma in T) exp(-pi r_gamma^2/sqrt(d)).
For distinct support points the difference multiplied by N is in the
base lattice, so the supplied first-minimum lemma gives scaled
separation >=1, not necessarily unscaled separation. With real
dimension D<=2Nn and H=D+1 the disjoint-ball count is bounded by
(1+2Nr)^D; the layer-cake exponential bound
exp(sqrt(d) H^2/8)(1+2N)^D H follows by completing the square,
using 1+2Nr <= (1+2N)exp(r), and integrating H exp(-(H-D)r).
Rank zero has one point and unit vacuum. The original exponential
budget is retained; no new stronger numerical premise is needed.

Dependency record, original source pins and graphs preserved.
Original local chain: A short_forms -> norm_jet_le_of_isAdmissibleComb
-> exists_semilinear_isJetConjugate -> CM generator / character law /
finite Weil action / norm_dataInner_le / hasSum_dataInner /
first minimum and packing.
Human reduced local chain: common CM jet identity -> exact scalar
character cancellation -> finite orbit permutation -> finite-evaluation
bound transported by rational quasi-periodicity -> normalized amplitude
-> supported Gaussian sum. All original local premises outside the
explicit derivations survive: CM reciprocity and integral theta/jet
construction, vacuum reproduction, adelic Weil representation law,
character normalization, arithmetic first minimum, parameter bounds.
Context: same pin, V, sigma, b, jet scale, R, generator and vacuum.
No global kernel edge retired; no new trust-boundary or axiom claim.
No RH theorem imported as shortcut.

Execution: command -v lean/lake/elan returned no executable.
Native compact CI receipt status a56e2d3afb99ed8275e81fd63c8494306e57c43f,
targeted_results 088cd2ec0e935ee1a282f10096949bcf671cc804 on
cathedral-research-state, run 45803534769: six B/C named declarations
had the standard three axioms; A module build exit 124 at 2700.11 s;
overall false, full_RH_replay=false. The old-pin engines are not
claimed to run against this compact environment. Below are prepared
native probes and an independent algebra certificate, NOT executed.
Use existing shared compact replay rather than launching a competing
full build. No new PASS, no changes to registry, old graphs or CI.

RESUME HERE: inspect the actual local theta-product jet integrality
consumer and remaining CM/real Weil foundation; cross-check latest
peer coverage first. If the existing compact runner has a successful
A module, replay these probes and the caller reduction there with
axiom evidence and dependency-export receipts. Do not repeat the
already audited finite orbit/permutation and amplitude bridges.
-/

namespace RUN39

theorem conjugate_ratio {d dc sd sdc : ℂ}
    (hd : d ≠ 0) (hsdc : sdc ≠ 0)
    (h : sd * sdc = d * dc) :
    dc / sdc = sd / d := by
  apply (div_eq_div_iff hsdc hd).2
  calc
    dc * d = d * dc := mul_comm _ _
    _ = sd * sdc := h.symm

#print axioms conjugate_ratio
end RUN39

#check Parameters.norm_dataInner_le
#print axioms Parameters.norm_dataInner_le
#check Parameters.exists_isJetConjugate_generator
#print axioms Parameters.exists_isJetConjugate_generator
#check Parameters.exists_semilinear_isJetConjugate
#print axioms Parameters.exists_semilinear_isJetConjugate
#check Space.hasSum_dataInner
#print axioms Space.hasSum_dataInner
#check Space.semilinear_intertwines_weil
#print axioms Space.semilinear_intertwines_weil
#check Space.omega_vacElem_sum
#print axioms Space.omega_vacElem_sum
#check multiplierRatio_sq
#print axioms multiplierRatio_sq
#check Space.IsRatInvariant.hasSum_modelInner
#print axioms Space.IsRatInvariant.hasSum_modelInner
