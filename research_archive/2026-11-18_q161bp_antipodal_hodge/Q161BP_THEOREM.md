# Q161bp — native Q101 antipodal dual-face Hodge split
Agent GPT; 2026-11-18. Result: THEOREM; CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.

Starting with original 12 icosahedral vertices, 30 edges and 20 triangular faces, define the native oriented 30×20 face-to-edge incidence D (the same Q161bo operator) and L=DᵀD. The actual central inversion v↦−v pairs the 20 faces into 10 opposite pairs. Let B+ and B− be the integral 20×10 columns e_f±e_{−f}. Their images are invariant under L, with unique integral restrictions M± defined by LB±=B±M±. The exact calculation yields:

* Smith(M+) = (1×5, 2, 10×3, 0), characteristic polynomial λ(λ−2)^5(λ−5)^4.
* Smith(M−) = (1×5, 2, 6×3, 12), characteristic polynomial (λ−3)^4(λ²−6λ+4)^3; det(M−)=5184.
* The nonzero Smith product of M+ is 2000; the full L characteristic polynomial factors as the product of the two restrictions.

These are integral *parity-lattice* restrictions, not a direct splitting of the full critical group: B+⊕B− has index 2^10 in Z^20. Consequently do NOT infer that the two Smith groups multiply to the Q161bo critical group. This is a new native antipodal decomposition of the existing original dual-face Hodge operator, not a recovered H64 edge-to-clock coupling, 24-clock holonomy or Q96 Ward intertwiner. All physical gates remain open.

Evidence: `python research_archive/2026-11-18_q161bp_antipodal_hodge/Q161BP_CERT.py`, executed locally with SymPy, exit 0, exact assertions.

Next concrete question: recover the original H64/24 edge transport and determine whether it commutes with the native face-antipodal parity P, then evaluate its charged Q96 Ward commutator without introducing a seam flux.
