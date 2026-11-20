# Q161cs — Q125/Q96 charge-weighted Hopf curvature
**Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING; Q161cl and Q161by OPEN.

The original Q125 Hopf doublet on the affine chart is p=(1,z), n=(-conjugate(z),1). With d=1+z conjugate(z), native orthogonal eigenline projectors are P=pp†/d and N=nn†/d. The original Q96 electric charge on the four left doublets is Q_L=directsum(q_+ P+q_- N), where (q_+,q_-)=(2/3,-1/3) for each of three colours and (0,-1) for the lepton.

Exact symbolic differentiation yields Tr(P[∂zP,∂conjugate(z)P])=-d^-2 and Tr(N[∂zP,∂conjugate(z)P])=+d^-2. Consequently Tr(Q_L directsum([∂zP,∂conjugate(z)P]))=-4/d² because every native doublet has charge difference q_+-q_-=1. The radial CP1 integral ∫_0^∞ 2r/(1+r²)² dr=1 gives weighted first-Chern magnitude 4; sign depends on chart/orientation convention. This is the curvature of the existing local Hopf bundle, NOT a derived dynamical gauge field, physical topological charge, or the missing 50-to-96 source embedding.

**Evidence:** standalone SymPy certificate Q161CS_CERT.py, locally executed 2026-11-20, exit 0. No measured values, fitting or historical ARFs.

**Next question:** Can the native Q101 50×8 source E be carried through the Q125 history-dependent Hopf vertex into a canonical 50→96 B_x, so that (I-P_E)B_x†Q96B_xE is defined and computable?
