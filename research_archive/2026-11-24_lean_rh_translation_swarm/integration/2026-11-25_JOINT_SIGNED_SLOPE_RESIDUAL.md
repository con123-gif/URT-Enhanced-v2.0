# Joint signed residual: arithmetic, height and entropy at Ga_bound5
25 Nov 2026. RH OPEN. Human source-matched derivation, not Lean compiled. Pin 40e56bab026552e089d7afcfeff08d2defb9c005, mission 60892061, manuscript 464e82f81f646d4af85e1f5f70d379026df46261. Follows recovery 4b0b040c. No independent RH detour.

## One exact residual on the native word fibre
Fix the SAME translation u0 and finite nonempty W; mean is weighted by native positive d_i. Use the source D.sumA=A>=0, t_i=log T_i, E_i=Ee_i, h_i=h(u0,i), E0=m A lg, lambda=Lam5, P=cCount*(La+m^2 La/k), ED=EDiv, C0=cSl1*m*B0, Lo_i=Lo5. Native key_identity5: SDiv-A lambda+E0=Main+A P. Let
    Y_i=h_i+A t_i; M=max_i Y_i;
    Z_i=(E_i-E0)-A(t_i-lambda)+Y_i-M.
The apparent count/height dependence cancels *exactly*:
    Z_i=E_i+h_i-E0+A lambda-M.
Define the lower and upper residuals on this same fibre,
    L_i=muM_i-Z_i-Lo_i, U_i=muMaxM_i-Z_i+C0,
    l=mean L_i, b=max_i U_i, J=b-l.
Write K=-l. These are signed quantities, not sums of individual absolute bounds.

The two native QuotientSlopeBoundsWith inequalities are precisely
    muN_i-h_i >= G+L_i,
    muMaxN_i-h_i <= G+U_i,
where G=Ga+Fo-E0+A lambda-M. HidaSetting gives muN_i<=muMaxN_i; hence L_i<=U_i and J>=0. Averaging and maximizing yield
    s>=G+l, uF<=J.
Native DIV at a maximizing Y_i gives
    muCC<=SDiv+Fo+ED-M.
Subtract using key_identity5:
    Ga-Main <= s-muCC+AP+ED+K.
The sharper intermediate identity is K=mean(E_i-E0-A(t_i-lambda)-muM_i+Lo_i) - (max Y_i-mean Y_i). The final term is always nonpositive; height spread need not be charged as a loss to this first bound.

Define phi_H(z)=z log(1+H/z) for z>0, phi_H(0)=0; it is increasing on z>=0 since log(1+w)>=w/(1+w). The native SlopeIneq and its SideF (from HHBound,FParams,HidaSetting) give the single budget
    ASK-Main <= AP+ED+(ASK-Ga)+K+log|W|
        + [4 phi_HH(J)+(eta+4sqrt(e))*HH]/(1-del).
The sharp lattice theorem in JointDModelAppliesUnitLattice may omit log|W| if its exact native assumptions/parameter identities are verified. Do not omit it under the weaker abstract SlopeIneq.

This is an exact joint consumer replacement: no separate EComp5, HComp, Count5, or Slopes used in this derivation, ONLY DIV, QuotientSlopeBoundsWith, the key identity, valid positive weights/slope ordering, and the entropy bound with its guards. To reproduce original error, retain ASK-Ga<=LoP, and obtain K<=m*cE*B0+Pminus+mean Lo and J<=Pplus+Pminus+C0+Vvar+mean Lo from the old premises. For K use the nonpositive maxY-meanY term and lambda<=t_i; for J use upper/lower slope bounds and max(Z)-min(Z)<=2m*cE*B0+cH*(r*a*La+m*B0)+A*cCount*log k. Count upper bound supplies mean Lo<=MLo5 as before. Thus the old input implies the new signed-budget route; the replacement is sufficient without requiring the individual bounds, but strict logical weakening on actual hosts has not been established. Alternative producer may prove the single displayed budget directly or K<=Kbar, J<=Jbar with the same host, same scale, uniformity and actual consumer threshold. Keep the old separate premises at all other consumers. A joint bound is not proved merely by writing the residual.

## What is actually unified
Arithmetic exponent correction and the geometric log-count/height share one residual Z. Both mean slope gain K and entropy spread J consume the same lower-slope average l. Using the exact weighted mean instead of independently bounding every term permits cancellation before norms. Spectral variance and diagonal defect from the previously committed frame notes can enter eta and e at this SAME entropy consumer; they are not consequences of Z. The direct signed expression plus spectral term is a useful common target, not a universal invariant or proof of upstream VWinAt(1,401). No proof that Z has small oscillation or mean on the actual family beyond the original hypotheses. In particular no inference of cohomology from entropy.

## Source anchors and handoff
Exact pinned source inspected: Formalism/SizeWindowBrackets/ChainSlopeWindows/LevelOfCongruence.lean e08edc360cdf8d5d95d82ef1b805a8ea1a6151ef (Lam5, K0v5, s_lower5, Vvar_bound5, u_function_le_mean, key_identity5, Ga_bound5, weighted_mean_lower_bound_le); Formalism/SizeWindowBrackets/QuotientSlopeBoundsWith.lean f9f34a9147750e215a6b2f206eb6f9889aa726b6; Formalism/RankGapBounds/MeanBoundSecondForm.lean e4332fd8680d2b2f82e0a1e44a276453e03e2109; JointDModelAppliesUnitLattice.lean e72610dfa0b530ad4c9f39c207490d934d84e2e1. No Lean compilation or empirical speed benchmark. RESUME: replace Ga_bound5 local proof with joint residual lemma and original-premise bridge; trace actual E/h/T producers for a smaller signed joint bound before weakening any caller. HANDOFF geometry, arithmetic, editor, kernel/audit. Preserve fallback.
