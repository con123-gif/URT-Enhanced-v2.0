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

## Completed mathematical checkpoint and actual validation

Common bridge committed as a99f1fa85c8ca3ff309d839944c56c23b271e79d.
The complete argument is in
`2026-11-27_COMPACT_SIEGEL_WEIL_NATIVE_BRIDGE.md`, from mixed-model
Hilbert realization through the two native majorants and completed
functional identity. Read and consumed new mission 3b218469 and
0dcbf571 after refreshing to 19a5089a; the rational phase method
avoids a needless all-adelic upsilon/Weil-index comparison. The
explicit polarization and character calculation now supplies its
previous residual sign/dual/half-factor guard. The native vacuum
projector proves the Schwartz core and the finite isotropic phase
calculation gives the peak bound for ALL rational L. The positive
classical theta majorant replaces the geometric count-integral
branch at this identity-only caller. This is human-derived under
the explicitly retained vacuum, Wiener and Weil laws plus precise
classical stable-range theorem; independent audit pending.

Next obligation actually addressed, not just restated:
`2026-11-27_COMPACT_CLEAN_GRAPH_AUDIT.md` gives the one-place
uniform compact average, verifies w belongs to A for nonzero clean
Psi, proves K' injective and checks graph label/inverse at the same
g,w and frame. Native KernelDecay and SharpData bodies reread.
Earlier exact dual cutoff construction also reread against source,
including the isotropic finite frame, required multiplier and
valuation minimum contradiction. Retain its norm-negative-one
and finite vacuum-covariance background, and the doubleDatum phase.

Actual bounded local command completed normally:
`timeout 60s python integration/check_siegel_weil_polarization.py
--source-root /workspace/scratch/fd93126e52da/grh-lean-src
--out integration/2026-11-27_siegel_weil_polarization_results.json`.
Six source blobs authenticated; ten symbolic identities and five
negative controls detected. This is not Lean, independent
mathematical audit or a convergence/RH certificate. Source and
protected workflows unchanged. Main manuscript Rallis caller and
live ledger updated with these actual connected proofs.

RESUME HERE: independent audit of common supplier/clean graph,
then exact doubleDatum/negSource pairing phase and finite dual
multiplier at CharacterLiftNorm and TriangleArrows. Preserve
the original rows and retained A/C primitive hypotheses. Latest
native receipt is still partial, not a full human/RH verification.

Subsequent read: independent Landau RUN73 commit 1ae8974a
explicitly audits a99f1fa8 character/covariance/rational phase and
clean graph. Read its entire 225-line artifact; agrees on those
components, retains convergence/full model audit. Preserve this
as partial independent agreement, not a full review. Fresh state
e746daab and existing verify_compact_primitive_receipt.py executed:
16 committed outputs authenticated, six named native checks and
A timeout, overall false, no new Lean execution. The latest
main and appendices now record both scopes exactly.

Next dependency derived after the convergence/graph integration
commit a4bb5084e0d5e350915b795ae642b8045dfb9526:
`2026-11-27_COMPACT_DOUBLING_PHASE_AND_GRAPH_PAIRING.md`.
One normalized theta pairing gives the product/negation unit
phases, a proof-only doubled datum with exact theta product,
and the exact graph coefficient with delta^-1 by additive
quotient averaging. Every external lift, f,f',form,row unchanged.
It avoids requiring the separate canonical tensor phase a=1
for the final Rallis conclusion. Retains precise all-adelic
sign-change Weil law, block covariance and finite cutoff.
Source PairDefs/SpaceOperations/PairSumNegation reread. Important
notation audit: underlying Model coefficient c_f controls L1
norm/reproduction; Space FunLike is theta(rho(Y)f), different.
The common bridge now explicitly distinguishes them.

RESUME HERE: inspect PairSumNegation.weilMultiplier_neg and its
finite Gauss/complementary-real-minor inputs, then the exact
dual-datum multiplier at CharacterLiftNorm/TriangleArrows.
Do not rederive already supplied normalized theta pairing,
vacuum peak, positive majorant or graph scalar. Independent
review of those new proofs is still outstanding.

Additional latest contribution read in full: structure RUN77,
a4953d93, RUN77_SIEGEL_WEIL_POLARIZATION_TRACE.md. It uses the
CANONICAL base trace character psi_F^0 and polarized coordinate
C2=-2jB, while our bridge uses psi_F=psi_E|A_F=psi_F^0(2*) and
C1=-jB. These are different coordinate/character conventions:
C2=2C1. Both preserve the rational translation lattice and its
zero, but their displayed Fourier/Weyl generators must not be
spliced without that conversion. The independently checked
1ae8974a audit explicitly confirms our convention. No new
convergence or full-bridge audit is inferred from RUN77.

Further actual supplier elimination after a1866e42a74ef526cbccaa99f95c889aa76ae639:
the doubling note §4 now proves (D9), full target action covariance,
by one graph trace rather than the still stronger sign-change
Weil formula. Tensor unitarity defines C_h; original Heisenberg
covariance makes splitWeil_double(1,h)=lambda C_h. The mixed-model
law at zero fixes E_Gamma_1, independently of SW/Rallis. On D(e,e),
the already proved graph pairing gives 1=lambda<U_he,U_he>=lambda.
Thus lambda=1 for EVERY adelic h. Both compared vectors are native
data, so Hilbert equality descends to the native datum space.
This uses no Banach tensor inverse, canonical tensor theta phase,
pairWeil_negSource or block Weil law. It retains original Weil
unitarity/covariance and exact target zero-term law, all already
required by the common bridge. The local dependency order is:
normalized theta pairing -> product units/graph trace -> target
phase -> doubled theta product -> absolute Rallis unfolding.
Common SW/majorants and clean graph are independent prerequisite
branches. No cycle through the desired Rallis identity. The exact
finite dual datum is the next outstanding supplier audit. This
new abstract proof has no independent review or Lean replay yet.

RESUME HERE: independently audit D6–D9 and common vacuum peak/
majorant proof, then the finite cutoff and its multiplier. Do
not reopen sign-change/block phase at this consumer unless an
actual flaw in the graph trace argument is identified. Other
source consumers retain those stronger native suppliers.
