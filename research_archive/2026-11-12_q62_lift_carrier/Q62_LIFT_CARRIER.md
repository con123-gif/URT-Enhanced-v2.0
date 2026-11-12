# Q62: the C3-selected history lifts preserve neither H13⊕H51 nor im U_h

Date: 2026-11-12 (Claude, scheduled `[derive]` session). Gate A.
Status: **OBSTRUCTION + THEOREM (finite census). CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.**
Certificate: `Q62_LIFT_CARRIER_CERTIFICATE.py` (check `research.q62_lift_carrier`). Exact Fractions, Q(√5) pairs and
integers. Executed in Claude's cloud sandbox: exit 0, about 36 s. CI verdict: see the log entry.

## Question (Queue Q62) and how it was read

Q61 found 6 exceptional Q24 orbits (48 of the 768 proper-A5 dictionary classes). On each, a C3 ⊂ A5 fixes a unique
lift σ_β of the history transfer Q: β = 0 (the cyclic digit rotation) on three orbits and β ≡ 1 on three. Q62 asks
two things. First, does P_σβ preserve the native split H64 = H13⊕H51, or im U_h? Second, does an original native
operator distinguish the β = 0 orbits from the β ≡ 1 orbits? The terms were read as follows.

- **Frame.** Every carrier is built on the 64 axis words y. A history h reaches y through the signed dictionary,
  y = index_D(h), which is Q61's convention. The carriers in history coordinates are the pullbacks
  P_D = Π_D P Π_Dᵀ.
- **im U_h.** P8 = M Ph Mᵀ/2, rebuilt exactly as in Q49 E1.
- **H13.** The Walsh characters of degree 0 and 6, the six of degree 1, and V5 = span{y ↦ Q(u(y), u(y)) : Q
  traceless}. Here u(y) is the sum of the six chosen axis vertices, the vector of the archived quartic face source.
  This is the structure of `cathedral_walsh_exact_certificate_2026_10_31.py` (rows 0, 63, e_i and the five
  quadrupole combinations of the e_i+e_j). That file fixes one axis frame, and here every dictionary is scanned. H51 is
  the orthogonal complement, so preserving the split means preserving P13.
- **Distinguish.** Four kinds of evidence count. (a) Invariants of the selected lift built from the original
  operators: the Q3 A5-twirled primitive Q2 (S_D), U_h, H13, and the 24-clock Haar overlap C24 of Q49 E2.
  (b) Whether such an invariant separates the two families, or merely separates individual orbits.
  (c) Whether the native source *prefers* the selected lift.
  (d) No physical selection inference.

## Prior-work ledger

| Existing result | Source | Scope / status | Executed? |
|---|---|---|---|
| 6 exceptional orbits, C3 fixes β=0 (3) / β≡1 (3); no lift commutes with A5 | Q61 | THEOREM | CI `research.q61_inverse_limit_lifts` |
| U_h = M Ph/√2 partial isometry, P8 rational of trace 8 | Q49 E1 | THEOREM | CI |
| y* confined to im U_h | Q49 | THEOREM | CI |
| H64 = H13⊕H51, H13 = 2·1+3+3'+5 (Walsh rows) | 2026-10-31 Walsh certificate | exact | sympy, archive sweep |
| S_D = Q3 twirl of Q2; Tr S², S³, mixed traces | Q3, Q27–Q40 | THEOREM | CI |
| exceptional ⇔ some g ∈ A5 acts as digit rotation i ↦ i+2 | Q46 | THEOREM | CI |

New here: C1–C6.

## Results

**C1 (carrier symmetry groups).** Stab_B6(P8) = signed A5 × ⟨I⟩, of order 120 (B6 = all 46,080 signed digit
permutations). The *full* permutation automorphism group of P13 in S₆₄ is the same group of 120. Its axis
permutations have cycle types 1⁶ (×2), 1²2² (×30), 3² (×40) and 1·5 (×48). **No element permutes the six axes
as a 6-cycle.**

**C2 (H13⊕H51: OBSTRUCTION, every dictionary).** A lift that is a signed bit permutation has to move digit i to i+1.
Exactly two lifts are signed bit permutations, σ₀ and σ₁, and both are digit 6-cycles. A permutation preserving
P13 must lie in Aut_S64(P13), the group of C1, which contains no 6-cycle. **So no support-respecting lift σ_β, of all
2³², preserves H13_D, and hence none preserves H51_D, for any of the 46,080 dictionaries.** This holds in particular
for both C3-selected lifts.

**C3 (im U_h: OBSTRUCTION, every dictionary).** P8 vanishes on 24 words. These are the 12 words whose six vertices
contain no face, and the 12 words that contain a vertex star of 5 faces, which Ph kills. P8 is supported on the 40
words that contain exactly 1 or 4 faces. On that support Aut(P8) has order 480, and it contains the restriction of
C1's group. P_σ P8_D P_σᵀ = P8_D requires σ to map the support to itself and to act on it as one of the 480.
Each bit β_x moves only the words x and x+32, so the condition is checked bit by bit, exactly. **For all 768 classes,
and so for all dictionaries, no lift preserves im U_h.** The weaker requirement, preserving the 40-word *support*
as a set, is met by 2¹² lifts on 48 classes and by none on the other 720. Those 48 classes form 6 Q24 orbits. Only
one of the six is exceptional, a β ≡ 1 orbit, and on its 8 classes the C3-selected σ₁ does preserve the support. Even
there it moves P8 (‖P P8 Pᵀ − P8‖² = 8). A positive control builds one support-preserving lift explicitly.

**C4 (invariants of the selected lift on the six orbits).**

| orbit | β | Q3 overlap Tr(S_D X_σᵀ): selected / complement | keeps U_h support | Tr(P8 P) | ‖P P8 Pᵀ−P8‖² | Tr(P13 P) |
|---|---|---|---|---|---|---|
| 0 | 0 | 348 / 196 | no | 3/5 | 1096/75 | 2 |
| 1 | 1 | 348 / 172 | **yes** | 1 | 8 | 1/4 |
| 2 | 0 | 348 / 244 | no | 3/5 | 1096/75 | 2 |
| 3 | 1 | 564 / 236 | no | −3 (4), −3/5 (4) | 56/5 | 5/4 |
| 4 | 0 | 348 / 204 | no | −1/5 | 328/25 | 9/4 |
| 5 | 1 | 564 / 284 | no | −3 (4), −3/5 (4) | 56/5 | 5/4 |

- **The original Q3 source prefers the C3-selected lift on all 48 classes.** Since Q2 = P_σ₀ + P_σ₁ (C4 check), the
  two C3 candidates are exactly the two halves of the primitive transfer. On every exceptional orbit the A5-twirled
  source overlaps the selected half strictly more.
- **Family split.** Tr(P13 P_sel) ∈ {2, 9/4} for β = 0 and ∈ {1/4, 5/4} for β ≡ 1. The gap comes from the
  dictionary-free low Walsh part. That part gives 2 for σ₀ and 0 for σ₁, because the parity singlet χ₆₃ is
  σ₀-even and σ₁-odd and neither lift fixes a digit. So H13 tells the two *lifts* apart through its degree-6 singlet.
  It does not tell an orbit's family without the lift. Tr(P8 P) is not even orbit-constant on the β ≡ 1 orbits: S
  changes the dictionary's sign frame.

**C5 (24-clock).** C24 is dictionary-independent, so it can only see the two lifts.
1536 Tr(C24 P_σ C24ᵀ) = 91477/24 − 1704√5 ≈ 1.2818 for σ₀, and 5/8 for σ₁ (identity: ≈ 20.886). The conditional
Haar clock weights the cyclic lift σ₀ more. So it agrees with the C3 selection on the β = 0 orbits and
disagrees on the β ≡ 1 orbits.

**C6 (Q3-overlap maximisation over all 2³² lifts).** Tr(S_D X_βᵀ) splits into independent bitwise terms, so its
maximum over *all* lifts is exact.
- On the exceptional classes, 32 of 48 have the C3-selected lift as the unique maximiser: β = 0 on 16 and β ≡ 1 on 16.
- On 8 β = 0 classes, 4 bits are tied.
- On 8 β ≡ 1 classes, a different lift is the unique maximiser (0xffee77ff or 0xbbffffdd, 4 classes each).
- On the 720 non-exceptional classes, the maximiser is unique on 40. The other 680 have 2–12 tied bits.

## Answer to Q62

1. **No.** Neither C3-selected lift preserves the native split H13⊕H51 or im U_h, on any dictionary. No other lift
   does either (C2, C3). The selected reversible history therefore has no action on the hidden carrier y* lives on
   (Q49). It cannot be promoted to a carrier-compatible time step without new data.
2. **No family-level native distinction without the lift.**
   - Every dictionary-free operator here (Q2, C24, the low Walsh part of H13) sees only σ₀ versus σ₁. The two lifts
     are distinguishable. They are not conjugate in S₆₄ or B6 (cycle types 1²·2·3²·6⁹ versus 4·12⁵), and the χ₆₃
     parity and the clock overlap separate them. But Q weighs them equally (Q61 N4).
   - The C24 clock prefers σ₀, which matches the selection on only three of the six orbits.
   - The dictionary-dependent invariants (U_h, V5, S_D) separate individual orbits rather than the two families.
   - The orbits are 0 = 2 and 3 = 5 in the carrier invariants, and are separated by the Q3 overlaps.
3. **What is new and positive.** The original Q3 source agrees with the C3 selection: it prefers the selected half of
   Q on every exceptional class (C4). Maximised over all lifts, it selects that same lift uniquely on 32 of the 48
   classes (C6). It also selects a unique lift on 40 non-exceptional classes, with no C3 at all. That is a second,
   source-driven route to a reversible history. Its scope is still a function of the unselected dictionary.

## Scope and what remains open

- Only permutation lifts are classified. General U(32) dilations were not treated (Q61 N3 already excludes them as
  power dilations).
- C2 and C3 are exact over the whole finite domain. The Q3 preference (C4, C6) is an exact census, not yet derived
  from the commuting C3.
- C24 is the conditional Haar instrument of 2026-11-09 (Q49), not a derived native clock map.

## RESUME HERE

Next question (Q63 [derive]): derive C6's Q3-overlap preference. On exceptional classes, does the commuting C3 force
the bitwise weights w_x(β_sel) ≥ w_x(β̄_sel)? On the 40 non-exceptional classes with a unique Q3-maximising lift,
which Q24 orbits are they, is that lift ⟨I,R,S⟩-invariant, and does it commute with any element of ρ_D(A5)?
Original Q3/Q28 operators only.
