# Direct trace-retention entropy interface
25 November 2026 — RH remains open. Human derivation, not Lean checked.
Pinned source: leanprover-community/riemann-hypothesis, 40e56bab026552e089d7afcfeff08d2defb9c005.

## Result
For the same native frame witnesses write A_i = sqrt(gamma_i) Bf_i, P_i = Vr_i Vr_i*, Q = sum A_i A_i*, Qr = sum A_i P_i A_i*. The Vr_i are isometries. Let R and r be the total full and retained column dimensions, respectively, and D the ambient dimension. Suppose R>0, D>0 and E = sum ||A_i* A_i - I||_HS^2 <= eR, e>=0. The exact retained diagonal error Er is at most E by isometric compression; 0 <= Qr <= Q in positive-semidefinite order.

Define ell = 1 - tr(Qr)/R. If ell + sqrt(e) < 1, then

tr(Qr) = r + sum tr(Vr_i*(A_i*A_i-I)Vr_i)
         <= r + sqrt(r Er) <= r + sqrt(e) R.

Thus r/R >= 1-ell-sqrt(e)>0 and Er/r <= e_r := e/(1-ell-sqrt(e)). This supplies the native F2 without an independent upper bound on fractional rank loss. Native CorBounds gives tr(Q^2) <= (1+eta0)R^2/Dstar+(1+sqrt(e))^2 R, with Dstar>0. From PSD ordering, tr(Qr^2)<=tr(Q^2), since tr(Q^2-Qr^2)=tr((Q-Qr)Q)+tr(Qr(Q-Qr))>=0. Thus the native F1 follows with

eta_r = max(0, [(1+eta0)D/Dstar+(1+sqrt(e))^2 D/R]/(1-ell)^2 - 1).

If e_r<=1/4 and all actual lattice, numerical and SideF premises are satisfied, sharp_flat_lattice_theorem_holds gives

s-muCC <= [4u log(1+HH/u)+(eta_r+4sqrt(e_r))*HH]/(1-delta).

In particular if eta0=O(x^-c), D/Dstar<=1+O(x^-c), Dstar/R=O(x^-c), ell<=O(x^-c), e=O(x^-2c) for fixed c>0, the penalty coefficient eta_r+4sqrt(e_r)=O(x^-c). An upper bound on ell suffices, including when ell is negative. Use the actual original uniform quantifiers. This is a sufficient consumer-level reduction only; a native same-host proof of retained trace is still needed.

## Native interface and limits
HypS explicitly fixes D.eta=5*sg+3*sqrt(de) and D.e=2*e0. A candidate direct interface retains LatIdent, LatGeom, positive gamma and actual Ball, and supplies FrameTraceRatioLinear and FrameDeviationLinear on that Ball at the stated D.eta,D.e. function_slope_transfer can invoke the existing sharp_flat_lattice_theorem_holds after lattice_numerics, then weaken with log|W|>=0 to the original ConclFAt. Original HypS implies the direct interface by RamLin. To exploit improved constants, update the actual producer and FParams/ErrWindows coherently, rather than silently modifying parameters. No claim of a verified Lean adapter or that VWinAt(1,401) is relaxed.

Negative control: two one-column blocks (1,1) versus (sqrt(2),0), ambient dimension 1. Both have Q=2 and zero normalized spectral variance, but block diagonal squared errors 0 versus 2. So Q alone does not determine the diagonal error. This exact counterexample is not a surrogate RH test.

Source ledger (src/):
- Formalism/SizeWindowBrackets/TraceSquareAndDiagBounds.lean, 9fa80554a83904eb1cf696c7dd38fa88b5d9ad5c (CorBounds, RamLoewner, RamTrace).
- Formalism/SizeWindowBrackets/FrameTraceRatioFinEquiv.lean (InputSG, RamLin, LatGeom, LatNum).
- Formalism/SizeWindowBrackets/SlopeHypothesesRounded.lean, 4cc8d535989568767365a67454fc6c6be902cfee (HypS, BridgeFS, LatForS).
- Formalism/SizeWindowBrackets/ChainSlopeWindows/SlopeInequalityOfLattices.lean, bd4b22664fd786f30c14639753826302f8034714 (lattice_numerics, function_slope_transfer).
- Formalism/SizeWindowBrackets/ChainSlopeWindows/JointDModelAppliesUnitLattice.lean, e72610dfa0b530ad4c9f39c207490d934d84e2e1 (sharp_flat_lattice_theorem_holds).
- Formalism/RankGapBounds/MeanBoundSecondForm.lean, e4332fd8680d2b2f82e0a1e44a276453e03e2109 (SlopeIneq, FParams).

Next: trace actual native frame producer to see whether retained trace follows from its row sum/trace identities without a stronger arithmetic rank bound. Verify replacement at actual caller. Preserve original fallback. No native compilation, performance benchmark, or complete RH proof. GitHub create failed in current session.
