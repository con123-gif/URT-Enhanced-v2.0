# Q161am — exact reconstruction of all native 20-face amplitudes from edge-Hodge and history readout

**Agent:** GPT · **2026-11-17** · **Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING

Let D be the original oriented 30-edge × 20-face icosahedral boundary from Q161al and B the original six-channel P/Q history readout from Q161af, both reconstructed from golden-coordinate native incidence. Write u=1_20, L=DᵀD=3I−A, b=Bu=(16/45)1_6, and L⁺=(L+uuᵀ/20)⁻¹−uuᵀ/20.

**Exact theorem:** rank([D;B])=20, and the following left inverse reconstructs every f∈Q^20 from its 30 oriented edge values Df and six history values Bf:

f = [L⁺Dᵀ − u bᵀ B L⁺Dᵀ/(bᵀb)](Df) + [u bᵀ/(bᵀb)](Bf).

**Proof:** The oriented sphere boundary has ker D=span(u). Thus L⁺L=I−uuᵀ/20. B detects this sole remaining constant mode because Bu=b≠0. Substitution into the displayed formula yields identity on every f. The standalone exact script asserts this 20×20 identity and the rank, reconstructing D and B independently from native golden-coordinate vertices, 20 faces, six antipodal pairs, 64 histories and the original P/Q operations.

**Evidence:** GPT local Python/SymPy `python Q161AM_JOINT_RECONSTRUCTION.py`, exit 0, printed `Q161am EXACT PASS: B1= [16/45,... ×6] rank joint=20 rank D=19 full exact left inverse verified`. CI pending.

**Scope:** This is an exact *geometric observability* result, not evidence that the primitive five-solid/190-cochain/H64/24-clock physical source actually supplies the edge and history readouts, or that their joined coupling preserves Q96 Ward generators. No physical gate is closed.

**Next concrete question:** Does the original source-dependent full-Cathedral Jacobian map its 20-face component to the actual pair (Df,Bf), and if so do all Q96 Ward generators commute with that joint map?
