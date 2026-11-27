# Lead continuation — exact shared Rallis supplier

27 November 2026. WORK IN PROGRESS / NOT VERIFIED.
Starting inspected branch head: 73af0642b40074acffa54898bcdb259116a3f2d0.
Mission: finish the human RH reconstruction; RH only. Compact source
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean4.35.0, Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679. Original proof credit
Alpöge, Sernau, Anthropic collaborators and Claude.

## Prior work read and precise scope

- Previous lead a31e6385: global theta functional, exact normalized
  Poisson/pairing from vacuum model and Wiener sampling. Human-derived,
  independent audit/replay separate. Earlier finite group law, theta
  dimension and general frame notes preserved; do not rederive.
- 26-Nov Rallis cutoff note and dependency RUN59: doubling, clean
  graph removal, dual finite cutoff, sharp scalar and auxiliary/triangle
  callers. Explicit strong convergence and local model inputs retained.
- 6c46fb6e: shared absolute unfolding with TWO distinct majorants;
  identifies Liu2.1 convergent SW as a candidate scalar substitution
  but explicitly leaves dense core/action/zero-term normalization.
  Liu2.3 assumes cuspidal/decomposable data and is not the universal
  rapid-function inner-product theorem. Do not repeat that assembly.
- Current overnight editor/integration through RUN75: actual common
  twist, first-order coefficient, derivative and safety chains joined
  at their callers, with remaining prerequisites/audits explicit.
- 73af0642: independent source audit of Cramer, triangular Fitting,
  squarefree coefficient. Read full body. Exact coefficient from
  retained arithmetic inputs; not entire RowBalanced/C closure.
- 1f40f707: represented-class transport via Landherr with same finite
  frame. Read full body. Actual standard-partner comparison hypotheses
  still retained, no integral local-global assertion.

## Verification actually inspected

Fresh state-branch fetch: primitive targeted_results remains
088cd2ec0e935ee1a282f10096949bcf671cc804, six native checks
TiltingLemma/Moments with propext, Classical.choice, Quot.sound;
JetExponentBound build timeout124 at2700.11s; overall false,
full_RH_replay=false. No later primitive receipt path found.
Local lean/lake/elan absent. Source checkout pin confirmed pristine.
State orchestrator summary is still older unrelated baseline evidence,
not verification of overnight mathematics. No guard bypass or build.

## Exact work now

Inspect the actual native mixed Schrödinger zero term, named classical
Schwartz core and splitWeil action at siegel_weil / SharpData.
Authenticate the exact classical theorem and every normalization.
If it supplies only a scalar identity, do not promote it to operator
norm summability on the native completion. Prefer a complete actual
consumer bridge or derive its missing premise, not another interface.

RESUME HERE: read Liu2011 Theorem2.1 from the author/publisher PDF,
then Lib/Weil/MixedModel/{ZeroTerm,EquivariantCoefficients} and
Lib/SiegelWeil/Formula/SiegelSets at the common split model. Choose
the exact weakest core used by CharacterLiftNorm/TriangleArrows.
All previous A/B/C work, schedules and protected workflows unchanged.

## Derivation checkpoint: vacuum peak and the two bounds

Candidate replacement of the stable-range SW supplier at the Rallis
caller, not a new RH theorem. Full details to be written in
`2026-11-27_COMPACT_SIEGEL_WEIL_NATIVE_BRIDGE.md`. Do not count this
checkpoint as independently audited or replayed.

Let S be split of rank 2r, T rational Hermitian of rank M>2r,
P complete, and D=P.homSource T (zero residual). Use the SAME
rank-zero theta functional to define

    q_P(f)(X) = theta_0(P.sourceTerm T (T.x^-1 X) f).

Source: sourceTerm_eq_mixedTerm, hasSum_theta_sourceTerm,
MixedModelIntegrable, sourceTerm_varrho, sourceTerm_levi,
sourceTerm_radical. Then q_P(f)(0)=E_L(f) and theta(f)=sum_X q_P(f)(X)
with X rational. Prior Wiener proof gives L1 boundedness of q_P;
bounded evaluation gives L-infinity boundedness, hence L2 boundedness.
The prior invariant-form argument makes its L2 pairing exactly a
positive constant times the native pairing. Reproduction by Heisenberg
translates of e gives a dense native core. No scalar normalization of
q_P can be chosen separately at zero and in its rational sum.

NEW candidate norm bound: show |q_P(e)(X)|<=|q_P(e)(0)| for every P.
The Fourier transform of |q_P(e)|^2 is the vacuum coefficient on
pure frequency vectors k_D b. Its real part is a centred positive
Gaussian; its finite part is the indicator of a compact open lattice,
WITH TRIVIAL CHARACTER, not an arbitrary translated characteristic.
Then Fourier inversion proves the peak at 0. Reproduction yields

    ||E_L|| <= sup_y |E_L rho(y)e| = |E_L(e)|.

Important correction checked directly against vacuumFn: the finite
vacuum uses the POSITIVE sum of coordinate norms, while isotropy uses
the SIGNED form. They are not literally the same quadratic expression.
On k_D b=alpha z integral, signed isotropy gives

    sum_i bar(z_i)z_i = 2 sum_{s_i=-1} bar(z_i)z_i.

Thus its finite phase is psi_0(c_0 sum_negative bar(z_i)z_i)=1 because
c_0 is integral and psi_0 is trivial on O-hat. This proves the claim
also at places over 2; dropping the factor 2 would be invalid.

To use classical Schwartz theory, transport the native vacuum
projector P_e=integral e(y)rho(y)dy into the mixed model. Its integral
kernel is a partial Fourier transform of the native Schwartz vacuum,
so is Schwartz. It is also rank one, proportional to
q_P(e)(X) conjugate(q_P(e)(Z)). The peak calculation makes q_P(e)(0)
nonzero, so evaluation at Z=0 proves q_P(e) is Schwartz. This avoids
assuming the mixed model sends a native vacuum to a scalar Gaussian
with an unexplained finite phase.

Classical stable-range absolute Eisenstein convergence for THIS one
Schwartz vector would therefore give sum_L |E_L(e)| finite and hence
the genuine native operator-norm sum. Scalar convergence for arbitrary
unrelated vectors does not by itself imply an operator-norm bound.

Second bound, independent of the first: prior Wiener estimate applied
to rational source matrices gives, for one fixed compact B,

    |theta(Omega_h f)| <= C ||f|| # {X rational: h^-1 X in B}.

Choose a nonnegative classical Schwartz Phi >= 1_B. The target Weil
action is exact pullback h^-1, so Theta_Phi(h) is nonnegative, dominates
that count, and is integrable by classical stable-range theta
convergence. Hence N(h)=C Theta_Phi(h) is the required single
integrable majorant, uniformly for every native f. Only x=0 is needed
by this consumer; the stronger all-dyadic-torus helper is unnecessary.

Exact-model bridge under audit:
- Let F=E^+ and psi_F=psi_E restricted to A_F. Then
  psi_E(z)=psi_F(Tr_E/F(z)/2), matching Liu's 1/2 trace pairing.
- In the native (k,l) basis, put C=diag(1,-j). It carries the
  skew form -j^-1 [[0,1],[1,0]] to [[0,1],[-1,0]] and carries
  native radical [[1,-j^-1 b],[0,1]] to classical n(b).
- Native Levi formula is upsilon(det a)^M |det a|_E^(M/2) q(Xa).
  The classical splitting character must be upsilon^M. Verify
  upsilon restricted to A_F is epsilon_E/F, including finite dyadic
  places using the stably-unramified field hypothesis.
- Parabolic and target actions agree exactly. Any residual scalar
  discrepancy is a group character. Local Bruhat generators make a
  character trivial on the Siegel parabolic trivial on the whole
  split unitary group; this fixes the Weyl phase without guessing it.
- Native real ordinary Lebesgue/finite mass 2^f/sqrt(D_E) and the
  classical self-dual trace measures agree GLOBALLY. Rational Gram
  factors cancel by the product formula. Native H quotient volume V
  multiplies the probability-normalized classical theta integral.
- Cosets P(F)gamma correspond to L=gamma^-1 L_0. Preserve this inverse.

External source actually inspected: Liu, Arithmetic theta lifting and
L-derivatives for unitary groups I, ANT5(2011), Theorem2.1(1), pp858-859,
publisher PDF https://msp.org/ant/2011/5-7/ant-v5-n7-p.pdf. Range M>2r,
s0=(M-r)/2, coefficient 1 (not boundary-case coefficient 2), all-Schwartz
theta convergence. Check the stated K-finiteness of standard sections
and extend by the Schwartz topology if necessary; do not silently
identify the native Banach model with a classical Schwartz space.

RESUME HERE (supersedes earlier resume): write and audit the mixed
model/unitarity, finite peak, exact action, measures and classical
convergence extension above. Then integrate the resulting TWO
majorants into the actual SharpData doubleDatum proof and main
manuscript. Retain all A/C leaves, independent audit and replay.
