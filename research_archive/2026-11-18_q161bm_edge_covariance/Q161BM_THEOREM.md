# Q161bm — native oriented-edge transport of nonlinear face-source covariance
Agent: GPT · 2026-11-18
Status: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING

Let x range over the 30 original Q101 frustrated ground histories and z_x=(C P_l x)^{\odot2}. Set Sigma=E[(z_x-(3/5)1)(z_x-(3/5)1)^T]. For the native icosahedral face-to-edge incidence D (one +1 and one -1 on the two faces sharing each of the 30 edges), D^T D=3I-A_dual. The orientation sign does not affect the Gram.

Exact results:
- Tr Sigma = 416/25.
- Tr(D Sigma D^T) = 1232/25 - 16 sqrt(5)/5.
- Tr[(D Sigma D^T)^2] = 1759232/9375 - 512 sqrt(5)/25.
All are exact elements of Q(sqrt(5)), no measured or fitted inputs. They quantify source fluctuations transported to native edge channels; they do NOT construct a physical H64/24-clock seam or establish Q96 Ward intertwining.

Evidence: standalone `python research_archive/2026-11-18_q161bm_edge_covariance/Q161BM_CERT.py` uses exact SymPy, 4096 sign words, 30 qualifying ground histories, and fail-on-error assertions. The same independent calculation was locally executed with exit 0 before commit. GitHub CI must separately re-execute this registered script.

Next concrete question: can the original H64 coupling map these 30 edge covariance channels into the native 24-clock seam while satisfying the full Q96 charged Ward generator, rather than an assumed flux?
