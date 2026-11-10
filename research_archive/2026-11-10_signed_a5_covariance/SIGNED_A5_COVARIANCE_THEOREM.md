# Q11 — Signed A5 covariance and the fixed-chronology obstruction

**2026-11-10; GPT. Result: THEOREM and scoped OBSTRUCTION. Status: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.** This certificate does not close any physical gate and uses no measured inputs or historical ARF values.

## Exact statement

Use the original six-bit de Bruijn transfer ( (Qf)(h)=[f(2h\bmod64)+f((2h+1)\bmod64)]/2 ), the archived quartic icosahedral face source (the exact output of the five-solid 50→8→12 bridge), the rank-four hidden (P_5) projector and the five A4-normalizer singlet projectors. The signed antipodal axes are indexed by the six vertex pairs ((a_i,b_i)), where (p_{b_i}=-p_{a_i}).

Every proper icosahedral rotation (g\in A_5) induces a signed permutation (T_g) of the 64 histories: if (g(a_i)=a_j), bit (i) moves to bit (j) unchanged; if (g(a_i)=b_j), it moves complemented. The rotation also permutes the 20 faces and conjugates each A4 vacuum to another of the five.

**Joint covariance theorem.** For every one of the 60 proper rotations, all 64 histories, all 20 faces, and all five transported A4 singlets, the exact source and vacuum-line covariance holds. In particular the unit-normalized five-vacuum (K_2) multiset is invariant under the *simultaneous* signed-axis and vacuum transport:
[
{5/6,25/24,67/48,33/16,33/16}.
]
The executable certificate checks 76,800 exact face-source equalities and 300 exact transported-vacuum (K_2) identities, including rational rescaling of arbitrary rank-one projector columns.

**Fixed-chronology obstruction.** Of the 60 induced signed history permutations (T_g), only the identity commutes with the **fixed** native de Bruijn transfer (Q). For a concrete nontrivial rotation with vertex permutation
((0,5,6,3,2,11,8,1,10,7,4,9)), the signed axis targets are ((0,3,1,4,5,2)), sign flips are ((0,0,1,1,1,1)), and at history (h=0), the transported successor set is ({54,55}) whereas the successor set after transport is ({44,45}). Thus (T_gQ\ne QT_g).

## Proof and meaning

The face source is built from dot products of the native signed six-axis vector with the exact icosahedral vertices; these dot products and the face incidence are invariant under proper rotations when both histories and faces are transported. A4-normalizer singlet lines are equivariant under conjugation. Any two nonzero rational columns of the same rank-one line differ by a nonzero rational scalar (c); their squared norms differ by (c^2), so the normalized quadratic rate is unchanged after joint transport. The script checks each identity exactly in (mathbb Q(sqrt5)).

For the second assertion, the script compares the two successor sets for all 64 histories and all 60 signed rotations. Because both transition probabilities are 1/2, equality of these sets is equivalent to commutation with (Q); only the identity survives. The displayed integer witness independently certifies failure for one nonidentity rotation, and the exhaustive finite check certifies the full count.

**Do not confuse these results.** Passive joint relabeling of the source and vacuum preserves (K_2). It does **not** make the original *fixed-coordinate chronology* actively A5 invariant. One could transport the chronology by (Q\mapsto T_gQT_g^{-1}), but that does not select a unique physical chronology from primitive URT.

## Evidence and scope

Standalone, fail-on-error script: `signed_a5_covariance.py`. Local execution on 2026-11-10 21:18 UTC: Python 3.13.5, SymPy 1.14.0, NetworkX 3.6.1, exit 0, 3.73 s, SHA-256 `1a08ef941f2e661c1df2ffa22441a33ab24525d0988ef1d44943af9e5ece4011`. CI status for this commit must be checked separately.

The exact icosahedral output of the archived five-solid pullback is reconstructed; the full 190-cochain bridge, 24-clock and charged H13⊕H51/Wilson source are **not** executed by this certificate. The proof does not select the six-bit axis dictionary, an A5-compatible physical chronology, a photon residue or any of the four ARFs.

**Next computation:** classify the 768 free signed-axis dictionaries modulo proper A5 (there are (2^6\cdot6!/60=768) free orbits), compute exact five-vacuum (K_2) spectra on canonical representatives, and report collisions without assuming active (Q)-covariance.
