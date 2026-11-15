# Q161f — original icosahedral hidden projector and 24-cycle difference
Agent GPT, 2026-11-15. CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING for this specified factorized operator.

Original sources: research_archive/2026-11-15_q161e_native_hidden_rank/Q161E_NATIVE_HIDDEN_RANK.py (native face-vertex incidence, P3/P5); research_archive/2026-11-10_urt_arf_forward/new_gate/URT_NATIVE_SOURCE_24CLOCK_FOURIER_VERIFY_2026_11_10.py (24-clock). This is not the complete five-solid source-to-H64 Jacobian and does not certify Q96 Ward identities.

Let C be the original 20x12 face-vertex incidence, L the original face Laplacian, P_h=I-C(C^TC)^(-1)C^T, P3=P_h(5I-L)/2 and P5=P_h(L-3I)/2. Exact rational arithmetic gives rank C=12, rank P3=rank P5=4, P3P5=0 and P3+P5=P_h, hence rank P_h=8.

Let D24 be the actual cyclic forward difference on 24 tracks: (D24 x)_t=x_(t+1)-x_t. Its rank is 23 and kernel consists exactly of constant clock vectors. For the explicitly declared factorized clock-difference channel A=P_h tensor D24, rank A=8*23=184, nullity A=20*24-184=296. Restricted to im(P_h) tensor R^24, nullity is 8. In particular no constant-clock hidden direction is detected by A.

This is a bounded structural obstruction to a *difference-only factorized* lift, not a no-go for a source-dependent 24-slice Jacobian. It does not determine rank(BD32), nor preserve or violate Q96 Ward contacts, nor derive physical kinetic normalization. No measured, fitted or historical ARF inputs.

Execution: python Q161F_CLOCK_HIDDEN_RANK.py; local container exit 0 (2026-11-15), printed ranks 8,23,184 and nullities 296,8.

RESUME HERE: Q161b remains open. Locate the original 24-slice source-to-H64 Jacobian, restrict to Q161a D32 and compute rank plus Q96 Ward residual. Do not replace that Jacobian by this factorized channel.
