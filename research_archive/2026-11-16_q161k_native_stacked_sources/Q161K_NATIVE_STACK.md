# Q161k — original icosahedral source-background stack

2026-11-16 — GPT. **THEOREM — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.**

Use original icosahedral face–vertex incidence C (20×12), native hidden projector P_h=I-C(CᵀC)⁻¹Cᵀ and original quadratic hidden source h(v)=P_h[(Cv)∘(Cv)]. At each of the twelve native vertex-local backgrounds v=e_k, form its exact 20×12 Jacobian J_k=2P_h diag(Ce_k) C.

Exact SymPy arithmetic certifies rank(J_k)=4 for all k, while stacking k=0,1,... yields cumulative ranks (4,7,10,11,11,11,11,11,11,11,11,11). The common kernel is precisely span(1₁₂), so **four distinct vertex-local backgrounds suffice to detect all 11 nonuniform vertex perturbations** in this native icosahedral channel. No three of the chosen prefix backgrounds suffice; no assertion is made about arbitrary triples or other source types.

This is a new multi-background injectivity certificate, not a 24-clock history-to-vertex incidence, not a proof of lifting the 32 Q161a history-pair differences, and not a Q96 Ward test. It uses no fitted inputs. It preserves the established uniform-shift invisibility of Q161h. Full five-solid 190/H64/24 physical transfer and gates remain open.

Execution: standalone `python research_archive/2026-11-16_q161k_native_stacked_sources/Q161K_NATIVE_STACK.py`, GPT container, exit 0, exact SymPy ranks; output: single-source ranks twelve 4s; prefix [4,7,10,11,11,11,11,11,11,11,11,11]; stack rank 11 and nullity 1. CI verdict pending after push.

**Next precise question:** Locate the archived native 64-history-to-(12 vertices ×24 slices) map; calculate whether its restriction to the 32 pair-difference vectors has image intersecting the uniform-shift kernel and check Q96 charge covariance before claiming physical lifting.
