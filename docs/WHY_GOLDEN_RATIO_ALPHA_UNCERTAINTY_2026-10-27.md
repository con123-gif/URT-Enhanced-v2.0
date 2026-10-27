# Why does the golden ratio bring Cathedral's alpha scalar into CODATA uncertainty?
27 October 2026 — no alpha fitting, exact spectral calculation and numerical sensitivity.

## Exact effect 1: phi is compelled by the chosen fivefold geometry
Ideal regular icosahedral/dodecahedral symmetry has its native quadratic field Q(sqrt(5)), with phi=(1+sqrt(5))/2. The dodecahedron graph's nonzero Laplacian spectrum has 3-sqrt5 (x3), 2 (x5), 3 (x4), 5 (x4), 3+sqrt5 (x3).
The two 3±sqrt5 mode scales obey (3+sqrt5)/(3-sqrt5)=phi^4. Their integrated relaxation contributions sum exactly 3/(3-sqrt5)+3/(3+sqrt5)=9/2; the irrational parts cancel.
Consequently Tr L^+=9/2+5/2+4/3+4/5=137/15. Multiplication by the 15 antipodal edge pairs yields 137 exactly. These are exact combinatorial/heat-kernel identities, not a physical proof of the fine-structure constant or derivation of the 15 prefactor from electromagnetism.

## Exact effect 2: phi controls the separation of the frozen rails
delta_cl=3/20, delta_star=80pi/(1053phi), Delta=delta_cl-delta_star=0.002489189840420392984...
The phi-dependent rail crossing is phi0=(80pi/1053)/(3/20)=1600pi/3159 =1.59118336364..., whereas phi=1.61803398875..., leaving Delta/delta_cl=0.016594598936..., i.e. ~1.66% difference between the rails.

The historical scalar formula is **assumed for the sensitivity test, not derived from a physical photon action**:
  f(phi)=137+(17572/1215)Delta(phi) -(9/65)Delta(phi)^2
  =137+0.0360000361118248111-0.000000857916839306
  =137.035999178194985505...
CODATA 2022 inverse alpha is 137.035999177(21), so the value differs by +0.0569040717 standard deviations.

The local sensitivity is df/dphi=1.31844016472, and solving f(phi_eff)=CODATA gives phi_eff=1.61803398784353175585, 9.0636309e-10 below golden phi. Replacing phi by 8/5 gives f(1.6)=137.011954066984...; this demonstrates mathematically that the exact golden ratio determines the candidate output to high precision.

## Critical negative control: phi does NOT force the physical precision by itself
The alternative, earlier Cathedral formula in docs/DERIVATION.md, also using exactly the same phi and upstream rails, is
  f_old=137+delta_star^2/pi^2+3/(64phi)+1/(79phi^2)
       =137.03601004814970...
which differs from 2022 CODATA by ~517.7 sigma. Thus fixing golden geometry does not uniquely select the newer fractional correction. The later coefficients decompose arithmetically into N+9/5-82/243=17572/1215 and (N-D-1)/(5N)=9/65, but the repo's 2026-10-16 analysis explicitly records that these coefficients were not independently obtained from an actual current-current photon residue.

The accurate answer to **why phi puts this historical expression inside uncertainty** is:
  (i) fivefold geometry forces the golden mode ratios;
  (ii) paired conjugate modes can cancel to exactly 137;
  (iii) its fixed value positions the Cathedral rails close together;
  (iv) the archived fractional correction then produces 137.035999178195;
  (v) the extraordinary 8+-decimal physical match depends on a response formula that remains an unproved EM identification.
If first principles is to be claimed for alpha, a single selected H64 gauge-covariant action must produce the 137 integer and the fractional correction without inserting these alpha-specific coefficients. The existing source `research_archive/2026-10-17_full_six_triplet_photon/native_bulk_peierls_check.py` uses `g2=4*pi/137.035999178195` and cannot act as that independent source.

Verified standalone script: `research_archive/cathedral_phi_alpha_causality_2026_10_27.py`, executed locally with PASS in the originating conversation. Experimental source: NIST CODATA 2022, https://physics.nist.gov/cuu/Constants/.
