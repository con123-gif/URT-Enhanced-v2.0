# Exact native dark-support obstruction — 2026-11-10

Original add-only theorem; no fitted ARFs or third-party Yang–Mills input.

## Statement
In the archived 64-history exact five-Platonic source, let n5(h)=||P5 E(h)||² and n3(h)=2||P3 O(h)||², and let d(h)=-(-1)^popcount(h) on the n5(h)=0 orbit and zero elsewhere. The archived exact source levels and n3(n5) identity imply n5(h)=0 => n3(h)=0. Because P3 and P5 are orthogonal projectors with positive semidefinite quadratic norms, d(h)P3 O(h)=d(h)P5 E(h)=0 pointwise for all 64 histories. Therefore every *local multiplicative* dressing (1+c d(h))h_a(h) is exactly h_a(h), for any c and a=3,5. This is a no-go for a direct dark-source Yukawa constructed by pointwise multiplication, not a no-go for delayed or nonlocal vertices.

The primitive Q[h,2h mod64]=Q[h,(2h+1) mod64]=1/2 has Qd != 0. Thus nonzero mixed temporal cumulants do not contradict pointwise vanishing. In particular, the exact prior K_ddd=3/128 remains a neutral history cumulant, not a charge-two matter vertex.

## Scope and limitations
This statement is about the archived history-indexed source and its projected hidden vectors. It does not imply a vanishing product between independently selected histories, arbitrary coherent superpositions, or generic time-separated correlations. It does not alter the 190-cochain action, 24-clock, H13⊕H51 carrier, or any Wilson/Schur/fermion Ward contacts. The native source-to-charged-matter map is still missing. None of the four physical ARFs is derived.

## Verification
Run beside URT_A5_NEUTRAL_SOURCE_EXACT_CUMULANTS_2026_11_10.py:
python URT_DARK_LOCAL_VERTEX_NO_GO_2026_11_10.py

Independent check: exact source label checksum 2002122002210110120100122010120110210102210010210110122002212002 has 24 zero-norm histories; bit-parity dark observable on that support is nonzero and Qd is nonzero. The archived exact source module provides the full n3/n5 assertion.

## Next unsolved step
Construct a temporally nonlocal, A5- and U(1)-equivariant charged pair vertex with an explicitly typed history-to-H13⊕H51 map; calculate first and second gauge variations including Wilson seagull, source acceleration, Schur relaxation, and fermionic contact terms. Test whether a unique normalization and a physical pole residue follow without fitting.
