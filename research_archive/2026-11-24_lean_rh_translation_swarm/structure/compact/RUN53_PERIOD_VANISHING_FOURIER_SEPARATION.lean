import New.Rows.HeckeValueHeight

/-!
# Compact RUN53 — actual rank-one period vanishing by Fourier separation
26 Nov 2026. Human source-matched derivation, PARTIAL at explicit retained
native analytic/geometric inputs; Lean audit certificate prepared, NOT COMPILED.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Attribution: Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Read latest mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb, manuscript
60b7d344cd2791eee12edc687692568ebebd989e, SWARM_PROTOCOL, HANDOFF_QUEUE,
AGENTS, continuity and research protocol/log/state. Previous own 0ce8bcf6.
Peers 2a8439aa (tower guards and boundedness; do not duplicate), a0bc9cea
(depth exponent), 5b79a6d9 (jet collision), 15bb1dae (B convergence).
The native period theorem below is the outstanding innermost-tail
orthogonality supplier of RUN52, not a new global determinant assembly.

## Source ledger (relative to grh-compact/src)
Lib/Weil/DualPair/FourierCoefficient.lean f2756c5504bd6cdc8b38c8cf17c4310ec5d38ff8,
  centreCoeff_integral_eq_tsum 147–160, centreCoeff_eq_integral_stabilizer 166–174.
Lib/Shimura/ComplexTheta/PeriodVanishing.lean 0cdc82478a980a49506166275445304b76fdb530,
  period_eq_zero 26–end; stabilizer 40, fibre 56, separation 61–68,
  stage disintegration 69–82, additive character 85, coefficient identity 98.
New/Rows/MemberOrthogonality.lean aca8828d477a4510ab80964e1572f34ef220a2c1,
  descentsVanish_hypSum 35–50; stdClassSum_period_eq_zero 62–end.
New/Rows/HeckeValueHeight.lean f61d2e3c521863d4f814e3338e37c4e2c2fd1f84,
  Data.exists_test_form_inner_kernelForm 87–149 (period call 128),
  Data.heightLe_inv_ratio 154–221 (test-form call 204).
New/SiegelWeil/DescentsVanishPlanes.lean 837e8a95ebb14d58a1e379cbba0426fc79b652b3
  tower guard reconstruction in peer 2a8439aa; retain its lower-level suppliers.

## 1. Nondegenerate Fourier coefficient is one stabilizer integral

Write G=U(I_n)(A), Gamma=U(I_n)(E), H=U(I_{n2})(A)
embedded in the second block i; n=n1+n2. Let x0 be the standard
rational inclusion frame of the first n1 columns, so x0*Jx0=I
is nonsingular, and let Gamma_H=Gamma intersect i(H).
In the actual FourierCoefficient lemma for a general frame and
adapted splitting, expand the mixed theta model in rational
matrices x. Integration over the compact additive centre pairs
each term with the target character at j beta. Character
orthogonality retains exactly x*Jx=beta. The sign is the source
-j(x*Jx)+j beta; no inequality or absolute value before this
projection. HasIntegrableTerms is the absolute integral of the
sum of norms, and justifies interchanging the sum, quotient mean
and integral. Do not infer it from pointwise theta convergence.
For beta=x0*Jx0 invertible, Witt extends the isometry from the
span of x0 to that of x, hence all such rational frames are one
Gamma orbit. Equivariance T_(gamma x)(gamma g)=T_x(g) and
left Gamma invariance of Y unfold the orbit sum into ONE integral
over Gamma_H\G of T_x0(g)Y(g). This is the exact source
centreCoeff_eq_integral_stabilizer. Invertible Gram and
integrability are necessary. The coefficient is zero if the
theta lift vanishes. The adapted hyperbolic vacuum/Heisenberg
calculation in period_eq_zero identifies the x0-term, up to a
nonzero constant c', with
    e(t(g))(u) Phi(t(g)) Y(g),
    t(g)=g^-1 block(h1,1),
    eta(a)=a x0,
    Phi(a)=|vacuumFn(scaleIdele * vec(eta(a)))|^2,
    e(a)(u)=stdAddChar(invDifferentIdele *
                  ((1-idemAdele(T.conjClosure))*u dot vec(eta(a)))).
Here T is the level support in period_eq_zero, not its complement.
For every adelic coordinate u, the Heisenberg-translated vacuum
is an allowed test under the stated DescentsVanish hypothesis.
Cancel c' != 0 in the Fourier coefficient BEFORE taking any norm.
Thus the integral of e(t(g))(u) Phi(t(g))Y(g) on Gamma_H\G is
zero, and is absolutely integrable, for EVERY u. This is source
'h u' in PeriodVanishing, not merely a formal integral. The
definite quotient gives bounded/rapid Y and the mixed-term
estimate supplies integrability. Retain the native adapted
vacuum identity and HasIntegrableTerms estimate as explicit inputs.

## 2. From all Fourier characters to a single positive test

Assume the desired period B(1) is nonzero, where
    B(a)=int_[H] Y(i(h) block(h1,1) a^-1) dh.
The quotient has finite measure, Y is continuous and bounded;
dominated convergence gives continuous B. Equality eta(a)=eta(b)
implies b^-1 a=i(v) by the exact stabilizer lemma fy, and right
invariance of quotient measure plus commutation of the two
blocks gives B(a)=B(b). This is source fx; no assumption of
pointwise invariance of Y under the entire H.

The following step explains why merely showing a single theta
period vanishes for a single Gaussian does not suffice.
The map e into the space of continuous characters (with the
native compact-open topology) is continuous. On K=G_infty x K_f
compact (definite unitary), let
    Bad={a in K : Re(B(a)/B(1)) <= 0}.
This set is closed in K, hence e(Bad) is compact/closed. It
does not contain e(1): if e(a)=e(1), evaluating at every u and
using nondegeneracy of the global additive pairing gives
eta(a)=eta(closurePart(T,a)). Indeed the difference of the two
frames is supported outside T conjugate-closure, and all its
coordinate pairings are trivial; invDifferentIdele is invertible.
The truncated element is integral and supported on T, so
HasLevel Y implies B(closurePart(T,a))=B(1) by right invariance.
The fibre equality then gives B(a)=B(1), contradiction to Bad.
Choose bounded continuous real phi>=0 with phi(e(1))>0 and
phi=0 on e(Bad), by complete regularity (native exists_BCNN).

For general a with Phi(a)>0, the finite vacuum support and
integral Witt extension of the orthonormal frame supply d in K_f
with eta((a_infty,d))=eta(a). Thus e and B agree with the compact
representative; no need for a itself to be integral. Consequently
    Re(phi(e(a)) Phi(a) B(a)/B(1)) >= 0       (P)
everywhere, and strictly positive near a=1 since Phi(1)>0
in the adapted vacuum normalization. The positivity assertion
uses the native integral Witt/vacuum support theorem, not
arbitrary local compactness.

Every finite linear combination of evaluation functions
chi -> chi(u) has zero integral against Phi(t(g))Y(g) on
Gamma_H\G by step 1. The span is a unital self-conjugate
algebra (add u, negate u), separating distinct characters
by definition. Use the native Stone-Weierstrass span/density
in bounded-continuous integration, with the finite absolute
weight integral from u=0. Integration extends to phi; in
the source L is the bounded integral evaluation functional.
Therefore
    int_(Gamma_H\G) phi(e(t(g))) Phi(t(g)) Y(g) dg = 0.    (Z)
The source uses its specific Stone-Weierstrass span and
strongIntegral_apply lemmas, not an assertion that arbitrary
pointwise convergence can be integrated.

The weight phi(e(t(g))) Phi(t(g)) is left H-invariant: t(i(h)g)
=t(g)i(h)^-1 and i(h) fixes x0. Disintegrate the integral first
over Gamma_H\H and then H\G, with the actual nonzero quotient
measure normalization (exists_integral_stages_eq_mul).
The inner average of Y(i(h)g) is exactly B(t(g)); the equality
uses t(g)^-1=block(h1,1)^-1 g. After dividing by B(1), (Z)
becomes, up to that nonzero normalization,
    0 = int_(H\G) phi(e(t(g))) Phi(t(g)) B(t(g))/B(1) dg.
Taking real parts contradicts (P): a continuous nonnegative
integrand is strictly positive on an open neighborhood of
the coset of block(h1,1), which has positive quotient measure.
Therefore B(1)=0, precisely period_eq_zero. Keep all level,
automorphy, continuity, definite-space, and all-test descent
hypotheses. No positive sign assumed for Y or for the period
before the normalization and localization.

## 3. Transport to the SAME rank-one class sum
MemberOrthogonality constructs the actual F on the larger unitary
group by a finite sum over coefficient basis j:
 F(h)=sum_j pairTheta(W,I_n,a,1,phi_j)(g,h)
                  *conj(algFormCoeff(1,L_j,Xi)(h*(1,x*A))).
Here phi_j is the box product of the fixed vacuum block with
the modDatum polynomial in the lower block, and L_j=gramForm
of C applied to the basis vector. A is the column gauge from
exists_reduceAt_mul_incl_eq; the translate x*A is supported on
the chosen level, not arbitrary. The kernel and translated
automorphic coefficient are left Gamma invariant; projection
off the level fixes each phi_j. Right invariance under integral
points on the complement of the level uses the same supports,
vacuum covariance and invariance of Xi. For every allowed test
psi on the hyperbolic source, the box product source formula
turns its descent of F into the finite sum of descents of
the conjugate coefficients of Xi, with the translated test
still fixed by the off-level projection. Each vanishes by
descentsVanish_hypSum, under FitsParams, nontrivial twist
characters, every specified reflection sum, theta zero,
the SAME testValue Hecke root, sphericity, and 2r+2N+3<n.
The tower proof is peer 2a8439aa; do not erase its boundedness
supplier. This proves the applicability of step 2 to F.

On the block (h1,y,h) the native theta_boxProd_target
and pairWeil_integrated_right identities, expansion in the
basis and equivariance hC of C give exactly
    F(block(h1,y,h))=K_v(g,h1) * conj(f(h)),
where K_v=pairTheta(W,I_N,a,b^-1,v)(g,h1) is independent of
both y and h. The choice of real vacuum vector makes K_v !=0
(source 'z'); it is not a pointwise nonvanishing assumption on
all theta kernels. The two-stage period over the complementary
block, and the standard quotient-to-class-sum formula for
f, now give
    0=K_v * conj(stdClassSum K f).
The source verifies right K invariance using the specified
residue stabilizer hk, fixed columns e', and covariance hC;
no division by the class number. Cancel K_v!=0 and conjugate
to get the actual stdClassSum_period_eq_zero. At HeckeValueHeight
128 the same inner untwisted tail of rank 2z-20 has this shape;
the apt-label reflection annihilator, Hecke root, theta kernel
and level guard all apply to the same competitor Xi. Thus its
inner class sum vanishes and outer two flat weights preserve
zero: RUN52's test-form annihilator is now expanded through
the Fourier-period argument, with no independent new witnesses.

## Graph, remaining primitives, URT candidate control

Original selected source edges (source-level, not kernel export):
heightLe_inv_ratio -> exists_test_form_inner_kernelForm ->
stdClassSum_period_eq_zero -> {descentsVanish_hypSum,
period_eq_zero, level covariance, block identity, class measure}
period_eq_zero -> {centreCoeff_eq_integral_stabilizer,
adapted vacuum identity, integral Witt, additive separation,
Stone-Weierstrass, quotient disintegration}.
Reduced human graph: coefficient projection + one Witt orbit ->
all u weighted zero integrals -> compact separation ->
positive disintegrated period contradiction -> class sum zero.
No edge globally deleted, no axiom evidence altered. Retain
source graphs and the native tower bounds, mixed model
integrability, adapted vacuum formula, integral Witt, exact
block covariance and Haar/Stone-Weierstrass interfaces.
Context key (pin,E,n1,n2,T,Y,h1,level,frame,b,coefficient basis,
C,Xi,chosen/twist places,role); no cache reuse across these.
The proof is ordinary Fourier/Witt mathematics.

Optional harmonic priority candidate: truncating a fixed
frequency list (including pi/e + golden-angle priority) cannot
in general certify additive separation at a nonarchimedean
coordinate. Every finite family of continuous additive
characters on Q_p has a common open kernel: for the standard
character with conductor Z_p, any finite collection of
frequencies u_j has p^N u_j integral for N sufficiently large.
Thus nonzero p^N is invisible to all selected characters,
but the frequency p^(-N-1) detects it. This is a limitation of
FINITE fixed-frequency pruning, not a claim that the full URT
algorithm fails, or a counterexample to the native frame
orbit theorem. A target-adaptive finite approximation might
still work on a compact set, but must prove the separation
and approximation; ordinary Stone-Weierstrass already supplies
this. Retain all-character cancellation. No URT advantage,
runtime, RAM or O(N) proof-search assertion.

## Executed checks and replay boundary

20 actual source-anchor presence assertions across the four
pinned files above, after correcting one failed lexical match
('lemma Data.exists_test_form_inner_kernelForm' is inside
namespace Data, not its literal declaration). Exact BigInt
local additive-character residue tests: 2,976 invisible
cases, 186 first-finer-character detections, no violations.
These are local arithmetic controls, NOT automorphic data.
Reproduce in JS:
```
let blind=0,detect=0;
for(const p of [2n,3n,5n,7n,11n,13n])
 for(let N=0n;N<=30n;N++){
  const x=p**N;
  for(let k=0n;k<=N;k++){
   if(x%(p**k)!==0n)throw Error("blind");blind++;
  }
  if(x%(p**(N+1n))===0n)throw Error("detect");detect++;
 }
console.log({blind,detect});
```
No local Lean/Lake (command -v both empty). Fetched actual RUN28
targeted_results.json on state branch, blob
23de197bd48f404ca2074c69676de289c4f7934e: prior named module and
scalar checks have returncode 0 and standard axioms; scope
explicitly not full RH replay. Primitive replay status path
compute/rh-compact-primitive-replay-20261126/status.json returned
404; no new PASS asserted. Latest orchestrator state summary
4633b6468f934e2d2776f428191663c00e41414d is physical-run PASS,
not evidence for this derivation. No protected workflow change.
No import of Main or New.Main. External formal certification
is separate from our incomplete human reconstruction.

RESUME HERE: integration insert the period proof into C's
rank-one test-form section after RUN52; independently audit
the quotient measure normalization and off-level projection
guards; then reconstruct the actual mixedTerm_omega_vacElem
and absolute theta-term convergence input used at PeriodVanishing
98, in coordination with the tower peer. Do not repeat the
determinant or analytic endgame. Native named audit below to
be replayed only via shared compact runner.
HANDOFF TO integration, editor, audit, dependency, theta, kernel.
-/

#check Space.Splitting.centreCoeff_integral_eq_tsum
#check Space.Splitting.centreCoeff_eq_integral_stabilizer
#check period_eq_zero
#check descentsVanish_hypSum
#check stdClassSum_period_eq_zero
#check Data.exists_test_form_inner_kernelForm
#check Data.heightLe_inv_ratio
#print axioms period_eq_zero
#print axioms stdClassSum_period_eq_zero
#print axioms Data.exists_test_form_inner_kernelForm

-- Prepared elementary final factor cancellation, not native-checked.
namespace CompactURTRun53
lemma period_factor_cancel (c z : ℂ) (hc : c ≠ 0)
    (h : c * star z = 0) : z = 0 := by
  have hz : star z = 0 := (mul_eq_zero.mp h).resolve_left hc
  simpa using congrArg star hz
#print axioms period_factor_cancel
end CompactURTRun53
