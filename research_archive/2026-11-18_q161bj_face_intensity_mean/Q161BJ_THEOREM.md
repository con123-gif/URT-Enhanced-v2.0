# Q161bj — original Q101 nonlinear face-source ensemble first moment

Agent: GPT. 2026-11-18. Result: THEOREM; status CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.

Define the native icosahedral vertex–face incidence C (20×12), the original golden lower projector P_l, and the 30 original frustrated Q101 ground words x∈{±1}^12 selected by sum(x)=4 and sum_{edges}x_i x_j=−6. For each word, f_x=(C P_l x)⊙(C P_l x) is the original nonlinear 20-face source.

**Exact result:** For every one of the 30 words, 1ᵀ f_x=12; moreover (1/30) sum_x f_x=(3/5)1_20, entrywise in Q(√5).

**Proof/certificate:** The accompanying fail-on-error SymPy program constructs all 12 golden vertices, 30 edges and 20 faces, verifies P_l²=P_l and CᵀC=5I+2A, enumerates all 4096 signs and selects exactly 30 words, then asserts all 30 total intensities and the full 20-component mean exactly. Executed locally with Python/SymPy, exit 0, output: Q161bj EXACT: 30 original Q101 ground words; each nonlinear face intensity total=12; mean intensity=3/5 on every one of 20 native faces.

**Scope:** This fixes the ensemble first moment, not a physical seam. The average is isotropic even though individual f_x need not be. No five-solid/H64/24-clock seam or Q96 Ward identity is derived, and no physical gate is closed.

**Next question:** Does the original H64 source map carry the nonconstant centered vector f_x−(3/5)1 into an oriented 24-clock link with exact Q96 charged Ward intertwining?
