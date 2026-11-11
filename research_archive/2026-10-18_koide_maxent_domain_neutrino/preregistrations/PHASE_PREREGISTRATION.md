# Pre-registration: Koide phase mechanisms (18 Oct 2026, before computing any of them)

Target (Q = 2/3 exact, the derived sqrt2): delta* from CODATA 2022 m_mu/m_e. Pass = within 3 sigma of delta*.
Mechanisms with Q free (P5) pass if their predicted m_tau is within 3 sigma of PDG 2026.
Koide family: sqrt(m_k) = mu (1 + sqrt2 cos(delta + 2 pi k/3)); physical arc (all sqrt-masses > 0): 0 < delta < pi/12.

- P1  max Shannon entropy of the sqrt-mass weights p_k = sqrt(m_k)/sum sqrt(m) on the physical arc.
- P2  max Shannon entropy of the mass weights m_k/sum m on the physical arc.
- P3  spin-1/2 Bargmann phase of a Cathedral spherical polygon, Phi = Omega/2, delta = Phi/3, for
      Omega = icosahedron face 4pi/20, dodecahedron face 4pi/12, cube face (octant) 4pi/8, tetrahedron face 4pi/4.
- P4  hierarchical max entropy in the Cathedral triangle basis: level 1 coherent/exhaust 50/50 (gives sqrt2),
      level 2 equal power in the two exhaust modes, |C_1|^2 = |C_2|^2, C_k = sum_n x_n psi_k(n),
      psi_k = QR rows of exp(2 pi i delta_star k n / L) phi_k, k,n = 0..2, delta_star = (80/81) pi/(13 phi),
      two readings of the formula's denominator: (a) L = 3, (b) L = 13. Report every root on the physical arc.
- P5  self-consistency 3 delta = Q: (i) with Q = 2/3 exact; (ii) Q free, fixed by m_mu/m_e, predicting m_tau.
- P6  the repo's screening formula delta = (2/9)(1 - (2/(5 pi)) Delta^2/(1+Delta^2)),
      Delta = 3/20 - 80 pi/(1053 phi). Check value; then count how many coefficients c = (p/q) pi^a phi^b
      (1 <= p,q <= 12, a,b in -2..2) also put (2/9)(1 - c Delta^2/(1+Delta^2)) within 3 sigma (look-elsewhere).

No mechanism is added, removed or adjusted after this file is hashed.
