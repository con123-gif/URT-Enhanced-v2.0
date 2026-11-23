# Q163 five-solid face-torus chain projection — 2026-11-23

Status: **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING** for the explicitly defined cellular projection only. Not a physical torus or native spectral/charge intertwiner.

Original geometry source: `research_archive/2026-11-20_q161cu_five_hopf_fluid/Q161CU_FIVE_PLATONIC_HOPF_NS_CERT.py`, its five original coordinate lists and `geometry()` convex-hull oriented face constructor. Distinct from the earlier golden 24-clock obstruction and original 190/64/24 circulation feedback.

For each oriented original face f=(v_0,...,v_{n-1}), n=3,4,5, construct a **declared topological tubular comparison** C_n x C_3 with vertices (k,t), longitude edges L(k,t), meridians M(k,t), squares Q(k,t). Define boundaries
dL(k,t)=(k+1,t)-(k,t), dM(k,t)=(k,t+1)-(k,t),
dQ(k,t)=L(k,t)+M(k+1,t)-L(k,t+1)-M(k,t).
The cellular map into the original solid surface is p0(k,t)=v_k, p1 L(k,t)=[v_k,v_(k+1)], p1 M(k,t)=0, p2 Q(k,t)=0. Integer matrix checks give p0 d1=d1 p1, p1 d2=d2 p2=0, d1 d2=0. The torus has ranks rank d1=3n-1 and rank d2=3n-1; hence H1 dimension 2. Its longitude maps to the original oriented face boundary d2[f], exact in the sphere; its meridian maps to zero. Therefore the induced H1 map is zero, so this projection cannot inject toroidal winding into the native solid's H1.

All 50 original faces checked: tetra (4 faces, n=3), cube (6,n=4), octa (8,n=3), dodeca (12,n=5), icosa (20,n=3). Original totals V/E/F=(50,90,50), with d1 d2=0, ranks V-1 and F-1 for each solid. Locally executed Python/SciPy fail-on-error certificate, exit 0; its full source was generated in the execution workspace but is **not included in this GitHub commit**, so GitHub CI cannot reproduce this new result yet. No new registry entry was made. Prior main-branch orchestrator checkpoint #342 passed at 2026-11-23 20:00 UTC on 72e7467; this is not a CI verdict for the present result.

Interpretation: This is a concrete **non-injective projection**, not a universal no-go for native thickening or relative homology. A new meridional degree of freedom requires additional native operator data, and no H64 or Q96 identification is implied. The 64-vertex C4^3 is a T3 comparison, not the native H64.

RESUME HERE: commit the executed certificate's full source and register it; next derive a typed native 190-edge-to-thickening map preserving the native magnetic connection and calculate its twisted spectrum. Physical gates remain OPEN.
