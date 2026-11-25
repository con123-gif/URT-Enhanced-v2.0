# Finite-place determinant and signed slope unification
25 Nov 2026. RH OPEN. Human source-matched exact identities; not Lean compiled. Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005. Mission 60892061. Follows joint signed residual 4123659c and trace-retention recovery 4b0b040c.

## Exact producer, before separately bounding lengths and gain
Fix one actual translation and native word fibre, index i. In HypPrim and PlaceSumIdentities, all local fields, supports S_i, weights l_iw, valuations sg'_iw, tau_iw, lengths len_iw, and retained dimensions du_i>0 are the original witnesses. Write G=Ga+Fo (common across words), E_i=Ee_i and
    D_i=2 sum_{w in S_i} l_iw (sgw_iw-sg'_iw),
    T_i^*=2 sum_w l_iw tau_iw,
    P_i=2 sum_w l_iw len_iw / du_i,
    B_i=P_i-T_i^*.
The native weightedSlopeExcess_decomposition gives Sg_i=G-E_i-D_i. HypPrim gives EXACTLY
    muN_i=muMu_i+Sg_i-BeSum_i,
    muMaxN_i<=muMaxMu_i+Sg_i.
Since BeSum_i=B_i, the tau terms cancel algebraically in the first expression:
    muN_i=muMu_i+2 sum_w l_iw (sg'_iw-len_iw/du_i).
Equivalently define signed H_i=h_i+E_i+D_i+B_i-muMu_i and U_i=muMaxMu_i-h_i-E_i-D_i. Then
    muN_i-h_i=G-H_i,
    muMaxN_i-h_i<=G+U_i.
For the native positive weights p_i=d_i/sum d_i, mean H=Hbar and max U=Umax, hence
    s=G-Hbar,
    0<=uF<=Umax+Hbar.
The nonnegativity follows from native slope ordering and the weighted mean. These are exact supplier-level expressions, without using the separate lower length bounds, upper IO budget, truncated length budget, comparison of slopes with muM, or EComp/HComp. Those inputs may remain essential for proving the new aggregate budget or elsewhere. In particular tau remains in Sg for the upper slope, and in Ga itself; do not delete it globally.

Let A=sumA, M=max_i(h_i+A log T_i), ED=EDiv, and use the native DIV, which gives muCC<=SDiv+Fo+ED-M. Substitution and key_identity5 give
    Ga-Main <= s-muCC + Hbar+SDiv-Main+ED-M.
Thus with J=Umax+Hbar>=0 and phi_H(z)=z log(1+H/z) (continuous zero value),
    ASK-Main <= (ASK-Ga)+Hbar+SDiv-Main+ED-M
                 +log|W|+[4 phi_HH(J)+(eta+4sqrt(e))*HH]/(1-del).
The entropy term is exactly the consumer linked to the previously derived weighted frame Qr, on the SAME host. No claim that frame traces imply the finite-place aggregate.

## Rank-weighted determinant/length aggregation
Whenever the actual same-witness rank tie d_i=du_i is supplied, the denominator in P_i cancels under the native weighted average:
    mean P_i=2/(sum_i du_i) sum_i sum_w l_iw len_iw.
No separate per-word normalized-length bound is needed at this step. In the exact native LatticeSlopeComparison, l_w=ell_w eR_w, len_w=du_i(beta_w+tau^int_w)/eR_w, and du_i beta_w is the actual localized module length. Hence
    du_i B_i=2 sum_w ell_w actualLength_iw.
The apparent tau correction cancels once again, this time leaving just the determinant index. By SlopeRelationsIndex/IndexLen, for the fixed same number field K and original finite-index sublattices N_i<=I(tau_i)M_i,
    mean B_i = 2 log(prod_i [I(tau_i)M_i:N_i]) / ([K:Q] sum_i du_i).
Equivalently the product is the cardinality of the finite direct sum of those quotient modules. This is a genuine connection between the arithmetic torsion lengths and the geometric mean slope, with a single global determinant-index budget. It does not bound that index. If the family uses distinct fields, preserve their degrees inside the sum; if the same-witness rank tie is unavailable retain native weights and do not assert the product formula for the mean. LatIdent supplies d_i=card(iota_i); equality with du_i requires the actual common lattice/rank producer. The abstract model in SlopeHypothesesRounded explicitly carries d=du, not evidence that every native host has it.

For the proof consumer, pursue a direct bound on Hbar and Umax+Hbar using the summed signed valuation/height terms and total torsion index rather than individual per-word bounds. Original HypPrim is a sufficient fallback; no proof yet that these joint quantities have the required x-window size from a weaker arithmetic hypothesis. The arithmetic VWinAt(1,401) is unchanged. No new closed root obligation or speedup claimed.

## Exact source ledger
- Formalism/SizeWindowBrackets/ClaimGaFree.lean 55185c8a02a5fc9365d6bafcf1d99576a6b2cd6f (Sg, BeSum, Ga, Fo, Ee, HypLow, HypHigh).
- Formalism/SizeWindowBrackets/ChainSlopeWindows/WeightedSlopeExcessDecomposition.lean c58d45524854a35e4f6bd3fd891b0cf5ce34f06f (weightedSlopeExcess_decomposition, lower_bound_simplified).
- Formalism/SizeWindowBrackets/SlopeHypothesesRounded.lean 4cc8d535989568767365a67454fc6c6be902cfee (HypPrim lines 158–184, PlaceSumIdentities, LatticeSlopeComparison lines 234–253, LatIdent, model rank tie).
- Formalism/SizeWindowBrackets/SlopesHypothesisFinitePlaces.lean a6da0b654b3e89eed423fa3312afe5c9958ddd0a (ell, IndexLen, SlopeRelationsIndex/Length/Local).
- Formalism/SizeWindowBrackets/ChainSlopeWindows/LevelOfCongruence.lean e08edc360cdf8d5d95d82ef1b805a8ea1a6151ef; Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChTop.lean ce06a34a9e0b1b332e10d3b7efb04a06e9ab77f5 (actual pointwise consumer).
No kernel replay; source-matched ordinary algebra only. RESUME: identify native family producer of the same-witness rank and number-field ties, then establish total torsion index bound on the actual selected family or retain the existing per-word supplier. Audit integration into Ga_bound5 and ch_top. HANDOFF arithmetic, geometry, entropy, editor, kernel/audit.
