# Q161cx — exact native Q101 frustrated-source tight frame

**Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Q161cl, Q161by, physical gates OPEN.

**Original operator:** Q101 regular icosahedron vertices \\(v_i\\) with squared edge distance 4, native nearest-neighbour energy \\(E(s)=\\sum_{ij\\in\\mathcal E}s_i s_j\\), magnetization \\(M(s)=\\sum_i s_i\\), and original frustrated histories \\(E=-6, |M|=4\\). The 60 native source vectors are \\(a_s=\\sum_i s_i v_i\\), not synthetic replacements. This is the original Q101 frustrated source sector inside the full five-solid Cathedral; no reduction of the upstream construction is asserted.

**Exact theorem.** The 60 vectors comprise 30 histories at each magnetization sign and satisfy
\\[
\\sum_s a_s=0,\\qquad
a_s^T a_s=24-8\\sqrt5,\\qquad
\\sum_s a_s a_s^T=(480-160\\sqrt5)I_3.
\\]
Consequently the unit axes \\(u_s=a_s/\\sqrt{24-8\\sqrt5}\\) form a unit-norm tight frame with \\(\\sum_s u_su_s^T=20I_3\\), so the frame has rank three and condition number one.

**Proof/certificate:** Enumerate all 4096 spin words with the original 30-edge Q101 adjacency and filter by the exact ground-state constraints. Every surviving vector is formed by the native icosahedron vertex sum. Exact SymPy arithmetic verifies each norm, both magnetization multiplicities, the first moment, and all nine second-moment entries. No measured, fitted, or historical ARF inputs. Standalone command `python research_archive/2026-11-20_q161cx_native_ground_frame/Q161CX_CERT.py`; GPT local container 2026-11-20 exit 0.

**Scope:** This supplies an exact source-axis normalization and a nondegenerate 3D input frame for an eventual native Q101/Q125/Q96 intertwiner. It neither selects nor constructs the 50-to-96 charge embedding \\(B_x\\), and does not evaluate \\((I-P_E)B_x^\\dagger Q_{96}B_xE\\). In particular it proves no physical baryogenesis, masses, or charged Ward completion.

**Next executable question:** Pull the Q125 original local Hopf vertex \\(V_x\\) and the Q101 face-to-vertex source \\(Y_x\\) into a *specified* Q96 carrier map \\(B_x\\), then evaluate the 50x8 source pullback charge residual exactly without assuming the desired commutator.
