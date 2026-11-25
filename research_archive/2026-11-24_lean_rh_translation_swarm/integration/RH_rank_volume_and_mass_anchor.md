# Direct rank-volume ratio and absolute mass anchor
25 November 2026 — Human mathematical derivation; native verification pending. RH remains open.

Upstream pin: 40e56bab026552e089d7afcfeff08d2defb9c005. Research checkpoints: determinant cancellation 2df8b6cc; independent rank-only normalization audit 841814dc.

Let E/F be the native CM quadratic extension, unramified at finite places by IsCMUnram. Put f=[F:Q], d=|disc F|, and let eta denote its quadratic character. Thus |disc E|=d². Define

R_n = 2 d^(n²/2) ∏_(j=1)^n [((j−1)!/(2π)^j)^f L_F(j,eta^j)].

The j=1 term is the Hecke L-value, not an unregularized Euler product.

## Gauge computation
Choose nonzero t in E with conjugate(t)=−t and a=t² in F*. On the skew-Hermitian Lie algebra use the F-basis t E_ii and, for i<j, E_ij−E_ji and t(E_ij+E_ji). Let p=n(n−1)/2. At a finite place choose an integral étale basis 1,theta, with t_v=theta−conjugate(theta) a unit. The rational basis relative to the integral skew coordinates (diagonal t_v, pairs 1,theta) has absolute determinant |t/t_v|_v^n |2t/t_v|_v^p, since t=(t/t_v)(2theta−Tr(theta)). Its reciprocal is |a|_v^(-(n+p)/2)|2|_v^(-p). This accounts for dyadic places.

The integral unitary model is smooth, becoming GL_n after étale splitting. The integral gauge mass of its stabilizer is #G(k)/q^(n²)=∏_(j=1)^n(1−eta_v^j/q^j). The rational gauge mass of the reference finite compact open is the product of this expression and the reciprocal determinant above.

At a real place the Frobenius metric −Tr(XY) makes the rational basis orthogonal of volume |t|^(n+p)2^p. The last-column map U(n)→S^(2n−1) has quotient metric 2||z||²+s² on a vector (z,is); hence its volume is 2^(n−1) times the round sphere volume 2π^n/(n−1)!. The fibre U(n−1) retains its metric. Thus the compact group-volume ratio is (2π)^n/(n−1)!, starting with U(1) of circumference 2π. The real rational gauge mass is |a|_v^(-(n+p)/2)|2|_v^(-p) ∏_(j=1)^n((2π)^j/(j−1)!).

The number-field product formula cancels the rational a and 2 factors globally. The determinant-character convergence factors L_v(1,eta), global L(1,eta)^(-1), and discriminant factor d^(-n²/2) give the standard Tamagawa normalization. The Tamagawa number is 2 for every positive-rank unitary group. Therefore the native normalized compact-positive quotient volume V_n equals R_n, conditional on the exact native-to-classical measure dictionary. The independently audited rank-only normalization (841814dc) extends this to every native W of rank n.

Consequently V_n/V_(n−1)=d^(n−1/2)[(n−1)!/(2π)^n]^f L_F(n,eta^n), n≥2. This equals the native massRatioRightSide: fDeg E=f, vInv E=d^(1/f)/2, an inert prime has norm q², and paired split primes have norm q. The native ratio caller uses n≥3.

## Absolute anchor
For the standard positive form the finite adelic double cosets U(F)\U(A_f)/K_f correspond to isometry classes of lattices in the fixed rational Hermitian space's genus. The native definition uses rational isometries at each localized prime, so the local-to-rational dictionary must be checked: approximate local isometries by rational ones using the Cayley chart in the F-vector space of skew-adjoint matrices. The chart is dense locally (multiply by a norm-one scalar arbitrarily near 1 to avoid eigenvalue −1); the lattice transporter is open. The native loc at P equals the rational intersection of the localizations at P and conjugate(P) by prime avoidance. Completion and intersection then give the same lattice relation. Conversely native local equality implies completed equality. Local lattices glue globally because all but finitely many are unchanged.

The definite double-coset set is finite by standard class-number finiteness for reductive groups. Each lattice automorphism group is finite by discreteness of rational points and compactness at infinity and at the finite stabilizer. Quotient integration gives the mass of each orbit as 1/|aut L_i| because the real group and K_f both have normalized measure one. Summing gives V_n=massI D n=R_n, matching the native IsClassReps and mass definitions without enumerating the classes.

For the sharp-count branch, with r=k+m−1, the same-host normalization defect is

delta = log(volY0 / (massI D k ∏_(k<M≤r) ratioH(M)))/(fk) = 0,

conditional on the above identifications and VolTie. This meets the sufficient interval −2L≤delta≤m. At PNamed.volRatioTrue_of_indep, preserve UnitSplit and the rank decrement and replace the two vol_eq_mass_of_indep calls and standardLattice_aux2b by the direct rank ratio. This bypasses ClassItemsAt at that ratio consumer, not its other consumers. The absolute anchor supplies a separate sharp-count route.

## Source and verification
Pinned source: StatementMass.lean 33a3ea93298eff7969409462ddfc1ed22f173939; ThetaLiftIndependence/Statement.lean 0cbe89264b4f4920f2c0d4beab1af5bc3a915547 (autL, IsClassReps); StandardLattice.lean cb758a6c5f78e610b8f946d4b733d07902b15f5d; PNamed.lean fcfd96e6e8385ec5e1de13f41d5706803d565c5d (lines 62–92). External cross-check: Terakado–Yu, arXiv:2210.04054, equations (2.6)–(2.8), https://arxiv.org/abs/2210.04054; Gan–Yu mass formula and Tamagawa number 2. Standard definite double-coset mass identity: Morales, Integral bilinear forms, J. Algebra (1986), section 2, formula (1). Relevant search excerpts checked; no claim to independently prove these standard results.

Status: ordinary mathematical candidate; native topology/Haar and localization dictionaries, independent audit and caller kernel replay remain pending. No root-reachable obligation formally retired; no complete RH proof. GitHub writes failed; this local checkpoint preserves the derivation. Next: integrate and verify at actual ratio and absolute-count consumers, retaining the original fallback.
