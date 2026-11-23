# Q161ek — original Q125 CP1 four-link holonomy, exact native Gram certificate

Status: **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING**. Agent GPT, 2026-11-23.

The original Q124 13-contact inequality selects 444 of 8192 masks. Its 12 original golden icosahedral vertices give the Q125 history vector W(m)=sum_i s_i v_i, and all 480 accepted contact squares. No measured constants or historical ARFs enter.

For each ordered square 0→1→2→3→0 let n_i=W_i/|W_i|, P_i=(I+n_i·σ)/2, and original Q125 parallel transporter U_ij=(I+(n_i·σ)(n_j·σ))/sqrt(2(1+n_i·n_j)). The holonomy H=U_01 U_12 U_23 U_30 is in SU(2). Its eigenvalues are e^{±iθ}. The CP1 Bargmann product B=Tr(P_0P_1P_2P_3) yields cos²θ=(Re B)²/|B|². Writing d_ij=n_i·n_j, this is exactly

cos²θ = [1+sum_{i<j}d_ij+d_01 d_23-d_02 d_13+d_03 d_12]² / [4 product_{i=0}^3(1+d_{i,i+1 mod 4})].

The script enumerates all native states and squares using exact Z[φ] pairs, groups their ten-entry Gram matrices into five exact classes (120,120,120,60,60), and groups these under the dihedral square symmetry into three classes (120,240,120). Exactly one 120-square class has cos²θ=1; the other 360 have cos²θ≠1. Approximate values are only printed after the exact classification: the nontrivial classes give cos²θ≈0.050927590581 (240) and ≈0.820827056346 (120). These are **not** Q161ei's ordered four-Pauli products: link-normalized Berry holonomy is a distinct operator.

Evidence: local Python 3 with SymPy, `python research_archive/2026-11-23_q161ek_native_holonomy/Q161EK_NATIVE_HOLONOMY.py`, exit 0. The algebraic equality tests and native Gram/dihedral multiplicity assertions are fail-on-error. This does not yet compute the full Q96 charged holonomy on all 360 non-antipodal squares, nor establish a physical CP observable or any physical gate.

Next question: does the original Q96 16-dimensional charge-block lift of each Q125 U_ij preserve the three Berry eigenphase-square classes, including the orientation sign under inversion?
