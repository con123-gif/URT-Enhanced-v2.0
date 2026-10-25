# Newton's Cathedral: an explicit Golay-induced H64 kinetic selector

Date: 2026-10-25. Exact finite mathematical result; not a derivation of the canonical physical URT microscopic transfer.

## Established starting point

The icosahedron has six antipodal axes. A signed-axis history is a 6-bit word `b ∈ F_2^6`; orientation choices specify one vertex per antipodal pair. The equivariant affine Golay map `E(b)=(x(b),D x(b))`, where `D=J-A (mod 2)` and `A` is the 12-vertex icosahedral graph adjacency, has exactly 64 distinct images. Each is a length-24 Golay dodecad. The difference of two signed histories is in the antipodally equal six-dimensional *linear* Golay subcode.

## Exact distance theorem

Let `k=wt(b+c)` count axes on which histories differ. Write `u=x(b)+x(c)`. Then `u` contains a pair of equal bits for each differing axis and `wt(u)=2k`. On this six-dimensional subspace `D u = u + (k mod 2) 1` over `F2`. Hence

    d(E(b),E(c)) = 4k         if k is even,
                    12         if k is odd.

As `k` runs from 0 to 6, the distance enumerator from any history is

    1 + 15 z^8 + 32 z^12 + 15 z^16 + z^24.

Thus the 64 embedded histories have minimum distance 8. History parity (`wt(b) mod 2`) splits the 64 into two 32-state invariant sectors. Every cross-parity pair has distance 12. The 15 distance-8 neighbors of a history are exactly its 15 two-axis flips. The 15 two-axis subsets are naturally the 15 involution-fixed-axis pairs of A5.

## Local kinetic consequence

Assume a bare perturbation is a sum of operators, each flipping at most one *of the 24 code-coordinate bits* per application. Any nonzero matrix element between distinct embedded histories requires at least eight flips. Consequently effective off-diagonal history transitions vanish through perturbative order seven. Across the two history-parity sectors they vanish through order eleven. Repeated excursions into higher-energy states can create effective hopping starting at order eight (within a parity sector) and order twelve (between sectors), provided the microscopic processes and energy denominators actually allow those paths. These are lower bounds on the order, not a computed transition amplitude. Diagonal Z-type perturbations, local phase noise, and nonlocal interactions are not excluded.

## Canonical minimal-distance graph Hamiltonian

Let X_i flip logical axis bit i. The distance-eight adjacency on the 64 histories is

    A8 = sum_{1<=i<j<=6} X_i X_j
       = ((sum_i X_i)^2-6I)/2.

Define its combinatorial Laplacian

    H8 = 15I-A8.

On a Walsh character of degree k, A8 has exact eigenvalue

    lambda_k = ((6-2k)^2-6)/2,

with multiplicity C(6,k). Collecting repeated eigenvalues gives

    spec(A8) = {15^(2), 5^(12), (-1)^(30), (-3)^(20)},
    spec(H8) = {0^(2), 10^(12), 16^(30), 18^(20)}.

The eigenvalue-zero ground space is spanned by uniform parity-even and parity-odd history superpositions. The graph spectral gap is exactly 10 in the graph unit-weight convention. The two parity sectors are not distinguished by a chosen sign in the pure H8 construction.

## Preservation of actual Cathedral H13

Reconstruct the geometric 6x6 icosahedral conference matrix C from the six axes: C_ii=0, C_ij=+1 for adjacent chosen endpoints and -1 otherwise. Exactly C^2=5I. Its positive-eigenvalue triplet has rank 3. The original Cathedral's H13 carrier is spanned by:

- Walsh degree 0: one constant singlet;
- Walsh degree 6: one history-parity singlet;
- Walsh degree 1: six signed-axis functions, splitting as 3+3';
- A 5-dimensional subspace of Walsh degree 2: traceless quadratics in the golden 3-triplet, giving one fiveplet.

This is `2*1 + 3 + 3' + 5 = 13`, with orthogonal complement dimension 51. Since A8 is diagonal in Walsh degree, its action on H13 is

    spec(A8|H13) = {15^(2),5^(6),(-1)^(5)}.

Hence `[A8,P13]=[H8,P13]=0` *exactly*, and A5 preserves P13. A numerical independent reconstruction gives Frobenius commutator residual 7.90e-15 and verifies all 60 A5 actions. This statement uses the same six-axis quadratic construction as the recovered October 8 Cathedral source, not a newly assumed 13-dimensional subspace.

## Precise physical boundary

This is a parameter-free *geometric kinetic model*, not a first-principles proof that the original species-loaded microscopic transfer `T_* = P_G W_Delta^(1/2) exp(-eta_Delta K_*) W_Delta^(1/2) P_G` equals `exp(-beta H8)` or induces solely single-bit local perturbations on Golay coordinates. The latter equivalence requires the explicit current/source-to-history coupling and its matrix elements. Nothing in this theorem predicts masses, gauge couplings, or why nature selects odd rather than even histories. The exact advances are distance protection, the two-sector kinetic spectrum, and preservation of the recovered H13/H51 operator decomposition.

## Reproduction

Run `cathedral_h64_minimal_distance_transfer_theorem.py` beside `cathedral_H64_affine_Golay_proof_2026-10-25.py` (Python and NumPy). It checks the *actual 24-bit* Golay codewords for all 4096 ordered history pairs, derives the spectrum by exact Walsh characters, and reconstructs the golden triplet/fiveplet H13 projector from the original six-axis recipe. Results file: `cathedral_h64_minimal_distance_transfer_theorem.json`.