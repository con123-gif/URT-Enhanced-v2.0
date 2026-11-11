# Q30 — Fifth and all higher twirled chronology traces on the 48 residual eight-orbits

Claude, 2026-11-11. Gate A. Certificate: `q30_twirled_all_order_spectrum.py`
(check `research.q30_twirled_all_order_spectrum`).

**Result type:** OBSTRUCTION (all orders) with a non-spectral witness.
**Status class:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING (native Q3 twirled chronology only).

## Setting
S_D = Σ_{a∈A5} P_a X_D P_aᵀ is the original Q3 geometric-A5 twirl of the primitive 64-history
transfer Q2 (h → 2h, 2h+1 mod 64) in the signed dictionary D; it is a non-negative integer 64×64
matrix with all row and column sums 120. Q28 found 48 of the 96 A5 × ⟨I,R,S⟩ eight-orbits on which
Tr S_D³ is constant; Q29 found Tr S_D⁴ constant on all 48.

## Statements
1. **Tr S⁵ (the Q30 question).** On all 48 residual eight-orbits Tr S_D⁵ is the same on all eight
   dictionaries: 0 S, R or I separations (24 distinct values across the 48 orbits). Exact int64; the
   same holds for every k ≤ 8.
2. **All orders.** On each of the 48 residual eight-orbits the eight matrices S_D have one and the
   same characteristic polynomial. Hence Tr S_D^k is constant on the orbit for **every** k ≥ 1, and
   no trace power, and no function of the spectrum of S_D, will ever split these 48 orbits.
3. **Structure of the D ↔ S(D) cospectrality.** For the 48 pairs (S_D, S_{S(D)}):
   4 are permutation-conjugate (P S_D Pᵀ = S_{S(D)}); 18 more are permutation-conjugate only to the
   transpose (P S_D Pᵀ = S_{S(D)}ᵀ); 26 are cospectral but conjugate by no permutation to either.
   Every permutation-invariant of the weighted digraph is blind on the 22 conjugate pairs.
4. **A non-spectral witness.** The mixed trace Tr(S² Sᵀ) = Σ_ij (S²)_ij S_ij separates 6 of the 26
   non-conjugate pairs. First witness: D = (0,2,4,9,6,11), S(D) = (0,3,4,8,6,10):
   Tr(S_D² S_Dᵀ) = 1773600 versus 1712160 (difference 61440), while their spectra coincide.
   The remaining 20 non-conjugate pairs (first: D = (0,2,4,6,10,8)) are not separated by any word in
   S, Sᵀ of length ≤ 6.

## Proofs
- (1) Direct exact integer computation; 64·120⁸ < 2⁶³ bounds every intermediate.
- (2) 0 ≤ Tr S^k ≤ 64·120^k (non-negative matrix with row sums 120). Tr S^k for k = 1..64 is computed
  modulo 17 primes p < 2²⁸ (int64 safe: a matrix-product entry is < 64p² < 2⁶²). The product of the
  primes has 476 bits > log₂(64·120⁶⁴) ≈ 448, so equal residues for every prime give equal integers.
  Equal power sums p_1..p_64 determine the characteristic polynomial of a 64×64 matrix over Q
  (Newton's identities), hence all later power sums. This is checked for all eight images, not only
  for D and S(D).
- (3) VF2 (networkx) exhaustive weighted-digraph isomorphism search; every conjugacy found is
  re-checked entrywise. Non-conjugacy for the 26 is the exhaustive VF2 verdict; for 6 of them it is
  independently certified by statement 4, since Tr(S²Sᵀ) is invariant under P·Pᵀ and transposition.
- (4) Exact int64 enumeration of all 126 words of length 2..6.

## Scope and what remains open
- This is a statement about the Q3 twirled chronology only. It is not a native source cumulant law
  (Q24 already shows no law of Σg separates the eight), not history selection, and not an ARF.
- Taken with Q28, the eight-fold ambiguity of Q24 reduces under the twirled *spectrum* to a factor 4
  on 48 orbits and stays 8 on the other 48, at every order.
- Open: whether S_D and S_{S(D)} are similar over Q (cospectral need not mean similar) for the 26;
  whether any native, non-spectral observable separates the 20 pairs untouched by words of length ≤ 6;
  and whether Tr(S²Sᵀ) has a meaning in the Cathedral dynamics (e.g. as a time-reversal overlap),
  which would be needed before it counts as a selection principle.
