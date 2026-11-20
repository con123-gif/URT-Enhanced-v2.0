# Q161de — original Q96/24-clock antipodal Green kernel

**Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Q161da and all physical gates remain OPEN.

The Q96 charge registry is the original Q161dc charge list: q8=(2/3 repeated 3, -1/3 repeated 3, -1, 0), repeated twice and three times, then conjugate signs. Thus squared charges have multiplicities 36 at 4/9, 36 at 1/9, 12 at 1 and 12 at 0. The 24-clock is the original 24-cycle graph Laplacian L24, as in Q161dc/Q161dd. This is a declared charge-clock tensor K=diag(q²)⊗L24, not a constructed H64/Q125-to-Q96 embedding.

For the 24-cycle zero-mean Green kernel, G(d)= (24²−1)/(12·24)−d(24−d)/(2·24), 0≤d≤12. Direct substitution gives (L24 G)(d)=δ(d,0)−1/24 and sum_d G(d)=0, so G is exactly the Moore–Penrose kernel. In particular G(0)=575/288, G(12)=−289/288. Original Q96 nonneutral charge inverse-square multiplicity sum is 36·9/4+36·9+12=417. Consequently the charge-traced antipodal Green entry is 417 G(12)=**−40171/96**. The charge-traced antipodal resistance is 417·2(G(0)−G(12))=**2502**. These are exact rational invariants, with no measured or fitted inputs. The neutral 12 channels are in the zero block and excluded by Moore–Penrose inversion.

**Execution:** `python research_archive/2026-11-20_q161de_q96_antipodal_green/Q161DE_CERT.py` executed in the local container, exit 0, on 2026-11-20. The certificate uses the original Q161dc Q96 charge registry and 24-cycle, exact Fraction arithmetic, and checks the full 24-entry Green equation and sector-resolved resistance. This is a necessary clock/charge response only; it is not a physical gauge propagator, charge Ward closure, or a derived B_x.

**Next question:** Which explicit original H64/24/Q125 source-to-Q96 map B_x transports the Q101 face-square derivative, and what is the exact (I−P_E)B_x†Q96 B_x E residual?
