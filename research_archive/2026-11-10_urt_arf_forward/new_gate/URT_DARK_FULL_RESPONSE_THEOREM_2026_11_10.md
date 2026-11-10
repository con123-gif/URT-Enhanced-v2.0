# Full exact three-channel URT chronological response and Wilson covariance

**Original add-only mathematical analysis, 10 November 2026.** This uses the archived all-five-Platonic neutral source's exact 64-entry checksum, the native unaveraged six-bit chronology, and the charge-two 24-clock gauge transformation. It does not claim to reconstruct the 190-cochain action in this standalone test or derive a charged-matter pole.

Let d be the dark contrast and g3=n3-E[n3], g5=n5-7. The original source-level relation is n3=(5+2√5)((66/25)n5-(3/40)n5²). Define C_ij(k)=E[v_i Q^k v_j] for v=(d,g3,g5), with Qf(h)=(f(2h)+f(2h+1))/2 mod 64. All six lag matrices C(k) are exactly symmetric, C(6)=0, and the entire causal response polynomial G(z)=Σ(k=0..5) z^k C(k) is finite.

The three new particularly simple response polynomials are:

G_dd(z)=(24-2z+z³-z⁴)/64;
G_d5(z)=-(3√5/40) z(z+1)(z²-2z+2);
G_d3(z)=-(9(2+√5)/25) z(z+1)(z²-2z+2).

Hence the exact one-sided dark response is (G_dd(1),G_d3(1),G_d5(1))=(11/32, -(36+18√5)/25, -3√5/20). The full stationary Green–Kubo response K=C(0)+2Σ(k=1..5)C(k) is NOT G(1): K=2G(1)-C(0), and its dark row is (5/16,-(72+36√5)/25,-3√5/10). The nontrivial symmetry C_ij(k)=C_ji(k) is checked on the selected three-dimensional observable space, not asserted for Q on all 64 histories.

The complete exact one-sided 3×3 response is

[[11/32, -(36+18√5)/25, -3√5/20],
 [-(36+18√5)/25, (2647728+1176768√5)/625, (11988/25+23976√5/125)],
 [-3√5/20, (11988/25+23976√5/125), 489/5]].

The equal-time C(0) is

[[3/8,0,0],
 [0,(548208+243648√5)/125, 2484/5+4968√5/25],
 [0,2484/5+4968√5/25,507/5]].

**24-clock Wilson covariance (conditional kinematic lift):** For charge q=2, define the forward transporter W(t,t+k)=exp(-iq Σ_{j=t}^{t+k-1} θ_j). Under θ_j→θ_j+λ_{j+1}-λ_j, W→exp(iq(λ_t-λ_{t+k}))W. Therefore W h(t+k) transforms at t with charge +2. The script verifies this exactly for two links. This supplies a gauge-covariant way to *write* a delayed charged source; it does not determine its dynamical coefficient, charged matter intertwiner, Schur seagulls, or physical current. In particular the neutral G_d5 polynomial cannot be equated to a Wilson-dressed charged vertex.

**Independently executed:** SymPy exact 64-history enumeration, source-level algebraic n3(n5) identity, 7 chronological lags for every 3×3 entry, exact response polynomial, Green–Kubo distinction, and symbolic two-link Wilson covariance. All passed. No historical ARF coefficients inserted, no fitting, no external Yang–Mills.

**OPEN:** Construct the actual Wilson-dressed *charged* connected vertex from the archived microscopic matter operator, including first and second gauge contacts, and demonstrate a unique physical source-to-observable pole/residue. All four historical physical ARFs remain unproved.
