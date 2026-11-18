# Q161bg — exact electric Ward seam nonselection (2026-11-18)

Status: **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING** for this narrowly scoped nonselection certificate. The requested Q161bg source-derived seam is **OPEN**.

Native inputs: original Q96 electric-charge species registry (4 LH doublets, 8 RH singlets, three generations and conjugates), and original 24-clock cyclic oriented difference operator. No measured values, fitted constants, historical ARFs, or synthetic stand-in matrices.

For each Q96 charge q, define the native 24-cycle difference D_h with D_h[k,k]=-1 and D_h[k,k+1]=1 (0<=k<23), and seam D_h[23,0]=h, D_h[23,23]=-1. The seam h is **not** selected by Cathedral physics in this test. The electric charge operator acts on each clock fibre as q I_24, so [q I_24,D_h]=0 for every h. Exact triangular elimination gives det D_h=(-1)^24(h-1)=h-1; the certificate uses 1-h, which differs by sign for even dimension? Direct calculation gives det D_h=1-h for the chosen orientation (verified by SymPy). Thus rank D_1=23 and rank D_omega=24 for omega=(-1+i sqrt(3))/2. |det D_omega|^2=3. On all 96 charge fibres, the ranks are 2208 and 2304; nullities 96 and 0. The two seams have distinct cyclic link products (holonomies), invariant under periodic diagonal clock gauge transformations. Therefore **electric Ward commutation alone cannot determine the 24-clock seam**. This is a finite conditional nonuniqueness statement, NOT a physical no-go for URT, H64, Q101, or full SU(2)xU(1) Ward.

Execution: `python -u research_archive/2026-11-18_q161bg_q96_seam_nonselection/Q161BG_CERT.py`; standalone SymPy, fail-on-error, local exit 0 on 2026-11-18. Original sources for registry convention: `research_archive/2026-11-18_q161be_q96_clock_charge/Q161BE_CERT.py`, `research_archive/2026-11-18_q161bf_twisted_q96_clock/Q161BF_CERT.py`.

Concrete next question: What original five-solid/H64/Q101 source operator fixes the seam holonomy, and does its source-dependent Q96/H64/24-clock charged intertwiner satisfy the full Ward identity?
