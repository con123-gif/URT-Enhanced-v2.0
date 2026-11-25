# Actual cancellation mechanism: frame trace forces high-slope rank coverage
25 November 2026. Human proof of a stronger finite-dimensional frame-corank inequality under the native input assumptions. Not a proof of RH; no Lean replay. Pin 40e56bab026552e089d7afcfeff08d2defb9c005. Current mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc; shared manuscript 7beedb2752d934a81d4c92b5a19c1c48362e0dc9; latest peer 6821df81 and direct mass supplier 95545ee1. Distinct from row-dimension aggregation 9532e2af.

## Locate the actual mathematical leverage
Main -> TopShape.shape_closed_link_n_of_green (3f791ca1) -> LinkS (LinkAltAltBis e4a4c213...) and other geometric producers -> SizeData2 -> each_unit_bound_statement (LevelOfCongruence e08edc36...) -> arithmetic gap bound -> principal Fourier average -> G(x).
The native geometric entropy bound SlopeIneq is supplied via lattice and frame hypotheses, not by arithmetic cancellation alone. SlopeHypothesesRounded.lean 4cc8d535989568767365a67454fc6c6be902cfee defines HypS/BridgeFS/LatForS; FrameTraceRatioFinEquiv.lean c4e727f636c40a5b922efc2458465a587c884d8d defines the actual trace and deviation inputs and lattice map tie. StatementFrameF.lean 3f17f6e4ae975f00dbeafdc3fb9e8b66f8c60c1d defines FrameLA1 and TheoremF; StatementFR.lean bbf952cfa32adb68933c8ab356ae87b6d7323976 defines frK, frQ, CorankShare and LayerCake. These declarations are propositions, not by themselves proofs. This note proves the finite-dimensional corank step directly.

## Exact rank inequality
On the native H of dimension D>0, set A_i=sqrt(c_i) B_i, Q=sum_i A_i A_i*, R=sum_i dim V_i>0. Use native c_i>0 and e in [0,1/4], eta>=0:
  sum_i ||A_i* A_i-I||_HS^2 <= e R,
  tr(Q^2) <= (1+eta) tr(Q)^2/D.
For the chosen subspaces N_i at any slope threshold let P_i project onto N_i, F_i=I-P_i, and r=sum_i rank F_i, so epsilon=r/R in [0,1]. Set Q_N=sum_i A_i P_i A_i* and U=span_i A_i N_i. Q_N>=0, Q-Q_N>=0, and Q_N is supported on U. Put t=codim(U)/D.

Write E_i=A_i* A_i-I. By HS Cauchy–Schwarz on the direct sum,
  tr Q >= R - sqrt(R * sum_i ||E_i||_HS^2) >= R(1-sqrt(e)) > 0.
And the exact removed trace is
  tr Q-tr Q_N = r + sum_i tr(F_i E_i)
              <= R (epsilon + sqrt(e epsilon)).
Indeed ||F_i||_HS^2=rank F_i and sum_i tr(F_i E_i) is real; apply the same direct sum HS inequality. No approximation of individual eigenvalues.
Let a=min(1,(epsilon+sqrt(e epsilon))/(1-sqrt(e))). Positivity of Q_N and the two trace inequalities give tr Q_N >= (1-a) tr Q.
Let P_U project onto U. Because Q_N is supported on U and Q-Q_N>=0,
  (1-a) tr Q <= tr Q_N <= tr(P_U Q)
                <= sqrt(rank(P_U) * tr(Q^2))
                <= sqrt((1-t)(1+eta))*tr Q.
Cancel the strictly positive trace and square the nonnegative sides:
  t <= 1 - (1-a)^2/(1+eta).                 [EXACT CORANK BUDGET]
In particular t <= (eta + 2a)/(1+eta).
With e<=1/4 and epsilon<=1 this gives t<=eta+4epsilon+4sqrt(e epsilon), implying the native FrameLA1 bound eta+4epsilon+4sqrt(e). If the native epsilon input is larger than 1 use the actual r/R<=1, or the trivial t<=1. If D=0 the original codimension claim is trivial. If epsilon=0, the sharper bound is eta/(1+eta), with no e penalty; if also eta=0, U=H exactly, even with nonzero diagonal defect e. If e=eta=0, the simpler bound from Q scalar is t<=epsilon (use tr(P_U Q)=rank(P_U)*tr Q/D), sharper than the squared-Cauchy bound. In fact the native equality case eta=0 makes Q scalar by the equality case of trace Cauchy–Schwarz.

## Consequence for the entropy step, with its existing HN hypotheses retained
At threshold tau>=0 the source CorankShare bounds deleted domain fraction by epsilon(tau)<=u/(u+tau) for u>0. The same source uses the slope-preserving lattice morphisms and the rank tie to transfer the frame codimension bound to the high-slope target; this transfer is NOT replaced by the above matrix argument. Once that native transfer is established, the sharper integrable error (before the same 1/(1-delta) conversion and possible log|I| term) is at most
  [eta*HH + (2/(1-sqrt(e)))*(u log(1+HH/u)
       + 2 sqrt(e*u)*(sqrt(u+HH)-sqrt(u)))]/(1+eta).
This follows by integrating eta+2a divided by 1+eta and dropping the cap on a for an upper bound. For u=0 use the limiting result (the single threshold tau=0 does not affect the integral). Retain the native minimum-slope bound and HN functoriality. The original coarse entropy bound is not needed as a separate assumption if its actual frame and lattice suppliers and the threshold transfer are established. The new expression is not a proof that those actual matrices satisfy the frame assumptions.

## Why this is the relevant mechanism, not a prime bound by assertion
The collective frame Q is approximately scalar, so omitting a small share of the source slope spaces cannot hide a large deficient subspace in the target. This is the mechanism that transfers source slope information into target arithmetic height and hence controls ASK-Main. Exact tightness would follow by averaging a single positive operator over a full irreducible finite group orbit (Schur's lemma), but the actual native words and maps have NOT been shown to be such an orbit. Do not assert that symmetry alone gives the native trace estimate or that URT creates it. In the existing proof the substantive automorphic task is to establish the actual frame trace/deviation estimates uniformly on the same hosts and the actual HN rank transport; the arithmetic VWin supplier remains independent. No claim of an unconditional square-root prime bound.

Verification: actual pinned definitions and proposition statements fetched; ordinary finite-dimensional linear algebra proof given above with all zero/rank boundary cases. No numerical simulation, no local Lean compilation, no new axiom audit. Original graph preserved; no global pruning claim. New result may not be novel in frame theory.
RESUME HERE: trace the actual producer of HypS/InputSG in the selected native theta record, check whether the concrete full frame operator commutes with a transitive irreducible group action, and prove the needed trace/diagonal estimates on those actual operators. Replay the exact corank inequality and integrate into the existing HN supplier after audit; no new independent RH detour.
HANDOFF TO theta, positivity geometry, math, formal audit, editor.
