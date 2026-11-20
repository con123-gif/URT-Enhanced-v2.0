# Q161db — native Q101 face-square Jacobian rank
Status: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. No physical gate closed.
Source: original Q101 golden icosahedral 12 vertices, 30 edges, 20 triangular faces, native vertex projectors P3 and P5, frustrated E=-6, |M|=4 ground words. No fitted/observed inputs.
Let L=C(P3+P5), F(s)=(Ls)⊙(Ls). Then DF_s=2 diag(Ls)L, hence rank DF_s ≤ rank(P3+P5)=8. The certificate enumerates all 4096 Ising words, selects exactly 60 native ground words, and for each selects eight rows by numerical pivoting **only as a search heuristic**, then evaluates the resulting 8×8 determinant symbolically in Q(sqrt(5)). All 60 determinants are exactly nonzero. Thus rank DF_s=8 for every original frustrated ground word; ker DF_s=ker(P3+P5) (dimension four). This is a genuine nondegeneracy of the nonlinear face-square source, not a charged Ward calculation.
Execution: python research_archive/2026-11-20_q161db_face_jacobian/Q161DB_CERT.py ; local exit 0, 6.62 s on 2026-11-20.
Next: build the source-dependent native H64/24/Q125-to-Q96 B_x and compute its electric-charge Ward leakage exactly. Q161cz and Q161cl remain open.
