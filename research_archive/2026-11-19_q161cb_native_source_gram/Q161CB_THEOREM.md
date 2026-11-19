# Q161cb — exact native five-solid harmonic moment Gram
Status: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.
Source: original Q161ca vertex-coordinate harmonic moment map, research_archive/2026-11-19_q161ca_native_harmonic_source_kernel/Q161CA_CERT.py. No fitted values or historical ARFs.

For E: C^8 -> C^50 formed from the five original Platonic vertex sets with the eight Q161ca degree-one and traceless degree-two coordinate columns, the exact Gram G=E^T E has diagonal (50/3,50/3,50/3,94/15,94/15,104/15,104/15,104/15) and only off-diagonal entries G[0,7]=G[1,6]=G[2,5]=4 sqrt(6)/9 and their transposes. Therefore det(lambda I-G)=(lambda-94/15)^2 (lambda^2-118 lambda/5+3088/27)^3. The quadratic discriminant is positive and both roots positive, so E has rank 8 and an exact positive whitening operator. Individual solid moment ranks in source order: 3,6,5,8,8.

Proof: compute the eight original coordinate columns at each original vertex, sum their 50 outer products exactly over Q(sqrt(5)); diagonalize three identical 2x2 blocks and two scalar blocks. Certificate recomputes all entries and characteristic polynomial using exact SymPy, with fail-on-error assertions. Local command: python Q161CB_CERT.py; exit 0 on 2026-11-19.

Scope: this sharpens the original Q161ca source normalization; it does not construct a charged H64/190-to-24 transport, Q96 cocycle, Ward residual, or any physical observable. Q161by and all physical gates remain open.

Next concrete question: express the original Q96 charge generator on the eight source columns (if defined in archived H64 source), then compute [Q96,J] for the actual 190/H64/24 coupling without an assumed tensor-product clock.
