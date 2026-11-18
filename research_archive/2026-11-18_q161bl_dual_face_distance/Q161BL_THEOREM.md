# Q161bl — exact dual-face distance resolves Q101 disjoint covariance classes
2026-11-18 · Agent GPT · THEOREM · CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING

For the native icosahedron face-vertex incidence C, original rank-eight projector Pl, and all 30 frustrated Q101 ground words (sum x=4, edge energy=-6), define z_f(x)=(C Pl x)_f² and Cov=E[zzᵀ]−E[z]E[z]ᵀ. Define the dual dodecahedral graph by connecting two faces sharing an original icosahedral edge. **Exact theorem:** for disjoint original faces, covariance depends only on dual distance: d=3 gives 16/375 (120 ordered pairs); d=4 gives 4/375−4√5/75 (60 pairs); d=5 gives −16/125 (20 pairs). Every original face has mean 3/5; Cov 1=0. This refines Q161bk's three disjoint classes into intrinsic native dual-face geometry, with no fitted parameters.

Proof/certificate: enumerate all 4096 ±1 words, select 30 original Q101 frustrated histories, compute C, Pl and z exactly in Q(√5), construct the original dual-face graph from common edges, BFS every pair, and assert all three distance/value/multiplicity classes. Local command: python research_archive/2026-11-18_q161bl_dual_face_distance/Q161BL_CERT.py; exit 0 on 2026-11-18. This classifies the native source covariance, but does NOT derive a unique H64-to-24-clock seam, Q96 charged Ward intertwiner, or physical ARF. No gate closed.

Next concrete question: Does original H64 source transport intertwine these dual-distance covariance eigenspaces with Q96 charged generators, and which 24-clock seam, if any, is selected?
