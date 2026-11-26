# RUN54 — definite theta convergence and adapted-vacuum nonvanishing

26 November 2026. HUMAN SOURCE-MATCHED / PARTIAL; no new native kernel
closure. Attribution: Levent Alpöge, Luke Sernau, Anthropic collaborators
and Claude. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb (primitive closure
and binding allocation); manuscript 7d3b97a1aa8cc9850612aa2769df8cbeabb8890d;
SWARM_PROTOCOL, AGENTS, handoff and continuity records checked. Previous
own 7929e2d6390f0d2d87061a5965b6a502c5c3e43f, RUN53, §1 retains two native
suppliers: absolute convergence and nonzero adapted vacuum factor.
Latest peer heads inspected: 36a56d6c (A Schur jet), 11745699 (B geometry),
266421eb (C tails/sparse carrier, different argument), f4015a87
(native primitive checks), bb09b6c2 (frontier), 0807db85 (editor).
Do not repeat their unrelated B and C bounds or modify shared manuscript.

## Exact source anchors

Paths relative to grh-compact/src:
* Lib/Weil/Construction/OrthogonalSum.lean f2f76ad7b60fe708d566078b6509d9a788873666,
  IsVacuum.wiener_bound, lines 37–60.
* Lib/Weil/MixedModel/ZeroTerm.lean e26a6037c53efb630f1dd8cf959aef3e0855fc5d,
  omega_projReal_of_isMixedLaw 364ff, omega_projOn_of_isMixedLaw 477ff,
  exists_omega_vacElem_of_isMixedLaw 491ff, mixedTerm and mixed law 568ff,
  exists_tsum_mixedTerm_le 583ff, hasSum_theta_mixedTerm 601ff,
  mixedTerm_omega_vacElem 615ff.
* Lib/Weil/DualPair/PairSplitting.lean 7060d2715dc64318e5f657357bce32c32bf11772,
  sourceTerm_eq_mixedTerm 274, hasSum_theta_sourceTerm 280.
* Lib/Weil/DualPair/FourierCoefficient.lean f2756c5504bd6cdc8b38c8cf17c4310ec5d38ff8,
  thetaTerm_ratEmbed_mul, exists_tsum_thetaTerm_le, centreCoeff_eq_integral_stabilizer.
* Lib/Adelic/CuspForms/Petersson.lean 3eb01e1ec46df79fcb55d6d7d95944ea44078ec9,
  exists_norm_le_of_isCompact 55, exists_rat_norm_le_height 61.
* Lib/Adelic/Transference/MassBasic.lean ab9b5714cab038182220a2e1631a96f2de1ddf78,
  exists_isCompact_of_definite 156.
* Lib/Shimura/ComplexTheta/PeriodVanishing.lean 0cdc82478a980a49506166275445304b76fdb530,
  period_eq_zero 26ff, actual integrability and vacuum supplier use at end.
* Lib/Weil/Construction/PairDefs.lean, dataInner_eq_quotMean (source search
  matched body at compact pin; blob not fetched in this run).
* New/Rows/MemberOrthogonality.lean and New/Rows/HeckeValueHeight.lean
  actual downstream source anchors in RUN53; retain same witnesses.

## 1. Wiener sampling bound: exact difference-set transport

Use the native hypotheses of IsVacuum.wiener_bound: bounded linear T,
Heisenberg model and reproduction, continuous additive kappa: W1→W,
u(0)≠0, integrable envelope g on W1, and a map t satisfying
||T rho(z+kappa x)u|| = ||g(t(z)+x)|| for every z,x.
All measures here are the native Haar measures, and the model norm
of v is its integrable coefficient norm. Pick a compact neighbourhood
K of zero with J = integral_K |u(-kappa x)| dx > 0. Such a K exists
by continuity, nonzero u(0) and positive Haar measure on a
neighbourhood. Fix r with rJ≥1; no division by any individual u value.

For an additive homomorphism phi:I→W1, let B=K-K. For fixed y, the
index set A_y={i:y∈phi(i)+K} is empty or choose j in A_y. Then
i↦i-j injects A_y into phi^{-1}(B), since
phi(i-j)=(y-phi(j))-(y-phi(i))∈K-K. No injectivity of phi needed.
Thus sum_i 1_(phi(i)+K)(y) ≤ N := #phi^{-1}(B).
If N is infinite the bound is vacuous (zero v handled separately).
If finite, the count is uniform in y, and on every finite index
subfamily. This is the exact counting argument in the native proof.

The reproducing formula in the native model gives, after multiplying
by the absolute value of its translated vacuum scalar,
|u(-kappa x)| ||T rho(kappa phi(i)) v||
≤ integral_W |v(z)| ||T rho(z+kappa(x+phi(i)))u|| dz.
All cocycle factors have unit modulus; this is precisely the norm
of the integrated identity used at the end of wiener_bound.
Integrate x over K and sum over i. Translation of x to y=x+phi(i)
and the preceding difference-set overlap, then Tonelli, yield

    J sum_i ||T rho(kappa phi(i)) v||
    ≤ N integral_W |v(z)| integral_W1 ||g(t(z)+y)|| dy dz
    = N ||v|| ||g||_1.

Consequently take M=r||g||_1+1, preserving the native inequality.
No supremum over an infinite family is substituted for its sum.
No restriction to finitely many frequencies or injective phi.
The reproduction identity, Haar normalization and integrability of
the model/envelope remain explicit native prerequisites.

## 2. Mixed vacuum and absolute rational-lattice sampling

In the native adapted splitting, write a vector in frame coordinates
(a,w,b). Orthogonality of the real frame preserves the Gaussian norm;
the real Gaussian integration and vacuum projection in
omega_projReal_of_isMixedLaw give factor exp(-a*a).
At the finite places, the integral-frame hypothesis makes the
lattice condition coordinatewise. The translation by the b-coordinate
fixes the full finite vacuum, so the mixed law forces each character
of that integral b lattice to evaluate to 1 wherever the mixed term
is nonzero. The annihilator is exactly the self-dual standard lattice
(with the native inverse-different scaling), hence the a-coordinate
must be integral. For integral a, translate by -a and project to the
smaller finite vacuum, using the same frame. This is the S=all-places
case of omega_projOn_of_isMixedLaw; it requires the integral frame,
not just a complex orthonormal frame. Combining the real factor with
the finite indicator gives, for some scalar c initially possibly 0,

    mixedTerm_x(omega(g)vac) = c |vacuumFn(t* x)|² vac_small.

For convergence use this possibly-zero version, NOT the later
nonzero result (avoids circularity). Choose the adapted coordinates
at t=1 via exists_isAdapted_and_frame_eq. In the Wiener lemma take
T=zeroTerm, kappa(x)=lAdelic*x, u=omega(g)vac with u(0)≠0 by the
native conj_delta_mul_weilRep_vacElem identity, and envelope
c |vacuumFn|² vac_small. The mixed law shows that the envelope
argument is lCoord*z+x, with a unit-modulus phase and smaller
Heisenberg action preserving norm. Its integrability is precisely
integrable_norm_sq of the standard vacuum, retained with the
native normalization. This proves exists_tsum_mixedTerm_le.
For phi the rational embedding E^p→A_E^p, compact sets have finite
rational preimage by discreteness/covolume-one lattice. The bound
reduces to sum_x ||mixedTerm_x(f)|| ≤ M_D ||f||, M_D independent
of f. The theta functional is bounded. Its Fourier coefficients
along k are the theta values of mixed terms (native zeroTerm_apply,
theta-rho and character laws); their absolute sum is finite.
Fourier inversion at zero now proves hasSum_theta_mixedTerm.

If c=0, all mixed terms of F=omega(g)vac vanish, including at all
adelic x. The mixed law implies that the mixed terms of every
Heisenberg translate rho(y)F also vanish. By the preceding theta
sum, theta(rho(y)F)=0 for every y. But the native dataInner_eq_quotMean
identifies the squared inner norm with the mean of |theta(rho(y)F)|².
It would vanish, whereas Weil action preserves the nonzero vacuum's
inner norm. Contradiction. This proves c≠0 at exactly the adapted
vacuum caller without a new phase choice. No use of c≠0 in sampling.

## 3. Actual definite period caller: uniform absolute bound without
the general height-growth induction

This is the local reduction candidate, stronger than a mere
explanation of the original power-height bound. It applies only to
the definite second space V in period_eq_zero, not the general
FourierCoefficient theorem or indefinite kernel-decay consumers.

Fix the source g, characters a,b and test datum f (which may depend
on u, the universally quantified character test). Let
T_x(h)=D.thetaTerm V a b f g x h. Rational equivariance gives
T_(gamma x)(gamma h)=T_x(h). Multiplication by gamma is a bijection
of ALL rational matrices, not just a finite cutoff, so exactly

    sum_x |T_x(h)| = sum_x |T_x(gamma h)|.

Cocompactness of the definite group supplies a compact C with
gamma h∈C for some rational gamma, for each h. This is already
used in period_eq_zero to obtain rapid/bounded Y. At fixed g,
Banach–Steinhaus (native exists_norm_le_of_isCompact) gives
sup_(k∈C)||omega(g,k)|| ≤ C_omega <∞. No operator-norm
continuity assumption is made; strong continuity and compactness
suffice.

The sourceTerm_eq_mixedTerm identity cancels x_V^{-1} exactly,
leaving mixedTerm at vec(x), for rational x. Its reindexing is a
bijection via matToVec (or the source curry equivalence).
The rational-lattice sampling bound in §2 for the induced homSource
splitting and the bounded smaller theta functional therefore give

    sum_x |T_x(h)| ≤ ||theta_small|| M_D C_omega ||f||.

For continuous left-rational-invariant Y on the definite quotient,
boundedness ||Y||∞ follows from the SAME compact C. The native
quotient has finite measure. Therefore

    integral_[V] sum_x |T_x(h) Y(h)| dh
      ≤ vol([V]) ||Y||∞ ||theta_small|| M_D C_omega ||f|| <∞.

This is exactly the HasIntegrableTerms premise, for each u and the
particular translated vacuum f used in the actual period_eq_zero
proof. All other premises of centreCoeff_eq_integral_stabilizer
(invertible Gram, exact rational stabilizer, invariance and
continuity) are untouched. Hence the zero Fourier coefficient can
be unfolded and the nonzero c' canceled in RUN53 §1.

Local proof dependency change: replace the invocation of
exists_tsum_thetaTerm_le (general power-height estimate, using
exists_rat_norm_le_height and its iterative Mahler reduction) at this
definite consumer by compactness + existing uniform boundedness +
mixed-term sampling + exact rational reindexing. The compactness
theorem itself still uses Mahler; we do NOT remove Mahler globally
or claim that other consumers no longer need the height theorem.
This is a human mathematical caller replacement, not a kernel graph
deletion. Original graphs/axiom ledgers and all other obligations
remain intact.

## 4. Controlled check and failed reduction

URT-style harmonic truncation is not safe for the Wiener overlap
bound: a shifted compact set can meet an entire coset of the image
even if the unshifted K contains no image points. The exact difference
set transport is both simpler and fully quantified, and needs no
ranking or fitted constants. No measured URT speedup; no performance
benchmark on native Lean. The following finite cyclic checks are
regressions of the overlap sublemma only, not substitutes for the
adelic proof or a test of RH. In particular they distinguish
noninjective phi and the false replacement B=K. Executed in JS
in the current run. To rerun, use Node (replace console.log by the
local output function if needed).

```javascript
let checks=0, noninjective=0, wrongK=0;
const mod=(x,n)=>((x%n)+n)%n;
for(let n=1;n<=8;n++) for(let m=1;m<=8;m++)
for(let a=0;a<n;a++) {
  if((m*a)%n!==0)continue;
  const phi=i=>mod(a*i,n), I=Array.from({length:m},(_,i)=>i);
  const noninj=new Set(I.map(phi)).size<m;
  for(let mask=1;mask<(1<<n);mask++){
    const K=Array.from({length:n},(_,i)=>i).filter(i=>(mask>>i)&1);
    const B=new Set(K.flatMap(k=>K.map(l=>mod(k-l,n))));
    const cap=I.filter(i=>B.has(phi(i))).length;
    const wrong=I.filter(i=>K.includes(phi(i))).length;
    for(let y=0;y<n;y++){
      const A=I.filter(i=>K.includes(mod(y-phi(i),n)));
      if(A.length){
        const j=A[0], image=A.map(i=>mod(i-j,m));
        if(new Set(image).size!==A.length || !image.every(i=>B.has(phi(i))))
          throw Error("injection");
      }
      if(A.length>cap)throw Error("overlap bound");
      checks++; if(noninj)noninjective++; if(A.length>wrong)wrongK++;
    }
  }
}
if(!wrongK)throw Error("negative control missing");
console.log({checks,noninjective,wrongK});
```

Executed result: 63202 overlap assertions, 37300 noninjective cases,
10184 negative controls where K alone is insufficient. The explicit
example phi:Z/3→Z/6, phi(i)=2i, K={1,3,5}, y=1 has overlap 3 but
phi^{-1}(K) empty. The general injection is the proof; these are
not asymptotic or harmonic-search evidence.

No lean/lake executable found in the local environment. New native
certificate not compiled; do not report PASS or infer a new kernel
axiom result from this note. No CI workflow or prior file modified.
External formal certification and our human reconstruction are distinct.

RESUME HERE: integration may incorporate §§1–3 directly into the
rank-one period supplier after independent audit, using the native
general Gaussian identity and reproducing law with their exact
normalizations. Next reconstruct the local normalized theta
character evaluations in New/Rows/HeckeValueHeight, or if that
has been integrated by peers, the remaining tower-descent
boundedness/period compatibility at its actual caller. Kernel lane:
if useful, prepare/replay the definite HasIntegrableTerms adapter
in the existing bounded shared environment, with unchanged axiom
and original/reduced graph evidence. No full-build request.
HANDOFF TO integration, human editor, audit, shared kernel extractor.
