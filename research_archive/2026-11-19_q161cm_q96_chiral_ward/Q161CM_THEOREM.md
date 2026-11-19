# Q161cm — exact native Q96 chiral charge-selection kernel
Status: THEOREM — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.
Source: original Q96 charge words as recovered in `research_archive/2026-11-17_q161_q96_three_generation_hopf_source/Q161_Q96_SOURCE_THREE_GENERATION_WARD_CERT.py`: eight singlets (u,u,u,d,d,d,e,nu) of charges (2/3,2/3,2/3,-1/3,-1/3,-1/3,-1,0), and the native Q125 Hopf LH-to-RH charge intertwiner. Three generation copies are present in the original Q161 charged-source construction. No empirical inputs.

For the 24-dimensional left and right charge representations, the four charge multiplicities are (9,9,3,3). On the space of complex 24x24 chiral mass matrices, the exact Ward map is W(Y)=Q_L Y-Y Q_R. Matrix units E_ij are eigenvectors with eigenvalues q_i-q_j. Thus dim_C ker W=9²+9²+3²+3²=180, rank_C W=24²-180=396. For Hermitian odd 48x48 operators M=[[0,Y],[Y†,0]], the charge-preserving real vector space has dimension 2*180=360. The original Q96 conjugate block M96=diag(M,conj(M)) preserves the same 360-real-dimensional family (conjugate block is not independent).

This is an exact Q96 selection-rule result, not a derivation of a mass matrix, not a source-dependent 50-to-96 insertion, and not a 190/H64/24 Ward completion. The native 50x8 source E cannot be multiplied by a 96x96 charge operator without a separately specified intertwining map B:C^8->C^96. No such B is invented here.

Execute: `python research_archive/2026-11-19_q161cm_q96_chiral_ward/Q161CM_CERT.py`.
Next: extract the original Q125/Q96 source-to-charge B and test (I-P)B†Q96BE exactly with the original 50x8 E; do not identify B by matching historical ARFs.
