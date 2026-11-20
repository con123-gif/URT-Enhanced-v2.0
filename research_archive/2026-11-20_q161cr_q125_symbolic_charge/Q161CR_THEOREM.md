# Q161cr — exact symbolic Q125/Q96 Hopf charge Ward
**Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Q161cl and Q161by remain OPEN.

Original operators: Q125's local Hopf eigenspinors p=(u,v)^T, n=(-conj(v),conj(u))^T, assembled into the original 8×8 chiral V with three colour copies and one lepton copy. The original right charges are (2/3 ×3, -1/3 ×3, -1, 0). The original left charge block is Q_L=diag((2/3)pp†-(1/3)nn† [×3], -nn†). Put d=|u|²+|v|². The exact polynomial identities are Q_L V=d V Q_R and V†V=d I_8. For normalized native Q125 Hopf spinors d=1, Q_L V=V Q_R and the 16×16 chiral Hermitian off-diagonal mass insertion M(V) commutes with diag(Q_L,Q_R). Tensoring with an arbitrary charge-blind 3×3 generation source Y and adding the complex-conjugate Q96 sector preserves the Ward identity. No masses or measured parameters are used.

**Execution:** python research_archive/2026-11-20_q161cr_q125_symbolic_charge/Q161CR_CERT.py; SymPy exact symbolic identity, GPT local container exit 0 (2026-11-20). Source construction copied from Q161_Q96_SOURCE_THREE_GENERATION_WARD_CERT.py; not a synthetic charge stand-in.

**Scope:** Upgrades Q161's previously numerical 444-state local EM Ward checks to a symbolic identity for every normalized Hopf spinor. It does NOT recover a 50→96 source embedding B_x, prove electroweak Higgs dynamics, or close any physical gate.

**Next question:** Does the native Q101 50×8 E admit a Q125-derived 50→96 B_x whose pullback Q_B=B_x†Q96B_x has an exact calculable (I-P)Q_B E, with P=E(E†E)^-1E†?
