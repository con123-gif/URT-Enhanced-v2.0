# Exact A5 chronology-Dirichlet gap and four quartet spectral blocks

**10 November 2026. Original no-fit, add-only mathematical continuation.** This is a conditional *history-sector quadratic-action completion*, not a derivation of the four physical ARFs. It preserves the archived complete five-Platonic 190-cochain nonlinear source, native 64 signed histories, the charge-two 24-clock, hidden 4_3⊕4_5, the abstract H13⊕H51 carrier, and the previously established nonlinear source, Wilson, Schur and fermionic Ward contacts. It neither alters nor reinterprets the exact A5-symmetric third cumulant of the original unaveraged Q. The original theorem and executable were inspected before this calculation.

## 1. Candidate chronology penalty and exact unaveraged spectrum

Use the original six-bit transition Q[h,2h]=Q[h,2h+1]=1/2 and pair-flip Hamiltonian H=15I−Σ_(i<j) X_i X_j. Define the positive chronology-Dirichlet penalty A=(I−Q)^T(I−Q) and the **conditional** quadratic operator K=H+A. The coefficient 1 is a unit-normalization **choice**, not a proven consequence of the pi/phi/e recursion; H+cA, c>0, is an unresolved family. Thus the construction is no-fit but not a unique physical action.

For six-bit Walsh character w_S(h)=(-1)^(Σ_(i∈S)h_i), Q sends w_S→w_(S−1) when the least-significant bit is absent and sends it to zero otherwise. Every nonempty subset belongs to a unique chain of length L=6−(max S−min S), with its translation-class representative anchored at bit zero. On each chain, A is a tridiagonal L×L matrix with diagonal (1,2,...,2) and nearest-neighbour entries −1. Its eigenvalues are exactly

lambda_j(L)=2−2cos((2j−1)pi/(2L+1)), j=1,...,L.

The history energy on a Walsh-weight-k chain is E_k=2k(6−k). Hence spec(K) is the union of E_k+lambda_j(L) with combinatorial multiplicities binom(5−L,k−2) for k≥2, plus the unique k=1 length-six chain and the k=6 length-one parity chain; the constant k=0 vector has eigenvalue zero. Direct 64×64 numerical diagonalization and exact symbolic chain characteristic polynomials independently agree. The **unique** zero is the constant history; the other old zero-energy vector (six-bit parity) has eigenvalue exactly 1, and all other sectors have energy at least 10. Therefore gap(K)=1, exactly. Tr K=1054; the product of all 63 positive eigenvalues is an exact 76-digit integer from the chain polynomials.

This unaveraged A depends on the chosen ordering of six axes and is not A5-equivariant. It cannot be silently called the physical A5-invariant kinetic term.

## 2. A5-equivariant Reynolds penalty and complete exact spectrum

Reconstruct all 60 proper rotations as even permutations on five letters, acting on the 12 cosets A5/C5 and hence on 64 signed histories. For each history permutation matrix R_g, define

Abar=(1/60) Σ_g R_g A R_g^T,   Kbar=H+Abar.

The integer matrix 240 Abar is obtained by summing the 60 conjugates of 4A. It commutes exactly with all 60 A5 permutations and with H. It is positive semidefinite, annihilates the constant, and acts as identity on the full six-bit parity vector. The remaining H spectrum is at least 10, so **gap(Kbar)=1 exactly**, without requiring floating-point spectral estimates. The full 64×64 eigenvalue decomposition is:

| Walsh weight | Eigenvalues of Kbar (multiplicity) |
|---|---|
| 0 | 0 (1) |
| 1 | (71±2sqrt(5))/6 (3 each) |
| 2 | 269/15 (5), 266/15 (4), 87/5 (6) |
| 3 | 197/10 (6), 391/20 (4), 389/20 (4), 193/10 (6) |
| 4 | 262/15 (5), 521/30 (4), 86/5 (6) |
| 5 | (335±2sqrt(5))/30 (3 each) |
| 6 | 1 (1) |

This table was obtained by **exact integer Walsh conjugation and exact SymPy characteristic polynomials** for all seven blocks, not inferred from rounded eigenvalues. Their dimensions sum to 64; Tr Kbar=1054 and the largest eigenvalue is 197/10.

### Four exact A5 quartet spectral branches (not four ARFs)

The exact central idempotent P4=(4/60)Σ_g chi4(g)R_g (character by element order chi4=(4,0,1,−1) for orders 1,2,3,5) is verified integer-exact by (15P4)^2=15(15P4). In the Walsh weight blocks k=2,3,4 it has ranks 4,8,4. Tracing P4 Kbar and P4 Kbar² gives the **four** quartet eigenvalues:

k=2: 266/15; k=3: 389/20, 391/20; k=4: 521/30, each with A5 degeneracy four.

The native source 4_5 lives in the original H-energy-16 space (k=2,4), and 4_3 in energy-18 (k=3). Thus an A5-invariant chronology penalty can split their *available representation copies* into four exact eigenbranches, while the original source-bright quartet may be a superposition across copies. No overlap with the native source vectors was computed here, so none of these eigenvalues is a derived physical pole or a uniquely selected source resonance.

## 3. Averaging a quadratic penalty is not squaring an averaged chronology

Let Qbar=(1/60)Σ_g R_g Q R_g^T. The exact identity

Abar=(I−Qbar)^T(I−Qbar)+V,
V=(1/60)Σ_g (Q_g−Qbar)^T(Q_g−Qbar) >= 0,

shows why averaging Q first discards a strictly positive ordering-fluctuation term. The independent integer check gives

Tr V = ||Q||_F²−||Qbar||_F² = 32−23/10 = 297/10.

This is the **variance** of the unaveraged primitive chronology under A5 frame changes. It is not a new fitted parameter or a physical gauge stiffness. Unlike replacing Q by Qbar, this construction leaves the original Q and its exact six-step cumulant calculation intact; only the proposed additional quadratic penalty is symmetrized.

## 4. Exact 24-clock conditional determinant and Ward scope

For a charge-two temporal link, T_theta[t,t+1]=exp(−2i theta_t), L2=2I−T−T†, r=pi/e, and total holonomy Theta=Σ theta_t, the **conditional** full 64×24 Gaussian determinant associated with Kbar factorizes over the above exact eigenvalues a. For each a>0,

det(a I24+r²L2)=2r^48[T24(1+a/(2r²))−cos(2Theta)],

and for the single a=0 mode,

det(r²L2)=4r^48 sin²Theta.

Consequently, at nonsingular Theta, the unique zero-history contribution to the log-determinant curvature is −2 csc²Theta, **not** the −4 csc²Theta obtained in the earlier conditional action that integrated *both* original H64 zero-energy histories. At Theta=−2/37, 65-digit evaluation gives:

- 63 massive modes: +1.38645535008864821929525488924479048e−8;
- one massless mode: −685.167056426189056383214644877919...;
- total: −685.167056412324502882328162684966....

This does **not** resolve the physical zero-mode measure: it establishes the effect of the stated *additional* Dirichlet action. The zero-mode singularity and negative holonomy curvature persist.

For the temporal kinetic factor, the executable independently verifies finite local U(1) conjugation and Tr(R J)=0, Tr(R W)−Tr(R J R J)=0, including the Wilson second derivative/seagull and relaxation, for both the massless and massive examples. These are **temporal Gaussian** Ward tests; the original nonlinear source acceleration, Schur contacts, spatial fermion seagulls and physical current residues are not replaced or claimed to have been recomputed here.

## 5. Precise boundary of the result

**Proved:** exact six-bit Walsh chain diagonalization; a positive chronology-Dirichlet candidate with unique zero and gap 1; the complete exact A5 Reynolds spectrum; four A5 quartet eigenbranches; the positive ordering-variance identity with trace 297/10; the conditional 24-clock determinant and temporal Ward identities.

**Not proved:** the action selects coefficient 1, the Reynolds penalty is physically required, the native 190-cochain source has nonzero overlaps with each quartet branch, the abstract H13⊕H51 decomposition is the physical charged-matter basis, the correct zero-mode path-integral measure, or any physical ARF. The four quartet eigenbranches are **not** the four historical ARFs.

**Next mathematical step:** project the archived *actual* all-five-Platonic source isometry Uh into the four exact Kbar quartet eigenspaces, compute the resulting source spectral weights and 24-clock Schur response with original source/Wilson contacts, then insert the original charge-graded H13⊕H51 fermionic current and compute gauge-invariant physical pole residues. A first-principles uniqueness theorem for the added quadratic action is still necessary.

**Reproduction:** run OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python URT_A5_CHRONOLOGY_DIRICHLET_GAP_2026_11_10.py with NumPy, SymPy and mpmath. This program independently reconstructs all 60 rotations and performs exact integer projector and characteristic-polynomial checks. No ARF coefficient or experimental target is an input; no third-party Yang–Mills material is used.
