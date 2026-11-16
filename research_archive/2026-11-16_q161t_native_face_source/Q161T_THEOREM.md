# Q161t — native icosahedral face-source parity capacity (2026-11-16)
Status: **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING**.
Sources: original Q161q icosahedral vertices, 20 triangular faces, six antipodal history bits and 64×20 incidence M; original Q161a history pair-flip P and pair-average Q (as used by Q161r/Q161s). No fitted input.
Let O=(I-X_0)/2 on histories, w(x)=(-1)^popcount(x), and R_j=QP(w ⊙ M[:,j]).
Exact certificate: rank(M)=20; M^T w=0; rank(OM)=rank(R)=10. Precisely face columns 0,1,2,3,4,5,6,13,14,15 are individually parity-active in the specified canonical vertex ordering; the other ten are inactive. Thus the 20-dimensional face-amplitude carrier has exactly a 10-dimensional source subspace capable of exciting the Q161a parity direction through this **multiplicative upstream channel**. The remaining 10-dimensional subspace is annihilated. In contrast the additive face source M a remains orthogonal to w (Q161q); these statements concern different injections and do not contradict.
This is **not** evidence that the actual full five-solid/24-clock H64 physical source uses this multiplicative injection, nor that any amplitude is nonzero or Q96 Ward identities hold.
Executed locally: `python research_archive/2026-11-16_q161t_native_face_source/Q161T_NATIVE_FACE_SOURCE.py`, exit 0, SymPy exact arithmetic.
Next question: identify the actual upstream H64/24-clock source tensor and determine its projection onto this 10-dimensional face-active subspace, then test its Q96 Ward generators.
