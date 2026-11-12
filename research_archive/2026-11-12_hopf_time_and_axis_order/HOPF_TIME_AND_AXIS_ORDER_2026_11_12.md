# Hopf total-space time dilation and a canonical cyclic order of the six axes (2026-11-12)

Status: WORK IN PROGRESS / NOT VERIFIED ON CI. Script `hopf_time_and_axis_order.py` (numpy, networkx; imports
`2026-11-12_hopf_charged_carrier/`); executed in Claude's cloud sandbox, exit 0. Not registered as a check.
User-directed (Con, chat, "proceed" on proposed paths 2 and 5).

## 1. 600-cell Laplacian by Hopf charge (exact identity, verified)
L₆₀₀ = 12 − A, and A = A_fibre + A_base with A_fibre = R(z) + R(z⁻¹). In the charge-n sector
L = 4 sin²(πn/10) + (10 − A_base): E² := L obeys E² = p² + m_n² with m_n² = 4 sin²(πn/10) and p² the monopole
(base) Laplacian. Levels (total = base + fibre): n=2: 5.528, 12, 15; n=4: 12, 14.472, 15; the A5 quartet sits at 15
in both. This is an identity of the total-space operator; it is a statement about which operator is E², not a test.

## 2. The native kernel read as a Euclidean action
The history/clock kernel is h + r²(2 − 2cos ω) with r = π/e. Its poles in the clock direction are
E(h) = arccosh(1 + h/2r²) — the expression the 2026-11-07 source itself uses for the determinant. E(18) = 2.735090,
E(16) = 2.632376, rest beat 0.102714 per tick. Adding any kernel term K shared by both hidden sectors (e.g. a
spatial p²) slows the 3↔5 beat: beat(K)/beat(0) = 0.9507, 0.9061, 0.7944, 0.6592 at K = 1, 2, 5, 10, equal to the
lattice factor sinh E₀/sinh E_K to four digits. So the "no clock slowdown" of `2026-11-12_native_clock_rate/` Theorem 1
is a property of reading the kernel as a Hamiltonian; read as an action it has time dilation.
Negative part: the continuum relativistic factor m/E would be 0.9718, 0.9459, 0.8790, 0.7935. With r = π/e the
clock is coarse (E ≈ 2.7 per tick) and the dilation is not Lorentzian: 2 % off at K = 1, a factor 2 off at K = 100.
Conditional: no shared spatial term K has been constructed on the hidden carrier.

## 3. A canonical cyclic order of the six axes
The normaliser of A5 in S₆ (six axes) has order 120 (PGL(2,5) ≅ S₅). It contains exactly 20 six-cycles, none in A5.
Orderings read off those six-cycles fall in exactly 2 of the 12 A5 classes of axis orderings, and both are among
the 6 "exceptional" classes of Q42–Q46 (the Q45 syntheme criterion, re-implemented here, gives 6 of 12). So the
outer (S₅) structure of the six axes selects 2 of 12 ordering classes without any census, and the selection agrees
with the independently found zero-coset orders. Not derived: why the chronology should follow a normaliser
six-cycle; the sign masks; the choice between the two classes. Observation, unverified as a mechanism: mod 5,
φ ≡ 3 and φ⁻² ≡ 4, so the URT map 2x + φ⁻² reduces to x ↦ 2x + 4 on P¹(F₅), an element of PGL(2,5) outside PSL(2,5).

## RESUME HERE
Next single question: does one six-cycle of N_{S₆}(A5), used as the digit order of Q, make the A5-twirled chronology
of Q3/Q28 unique (one operator instead of 372), and which G-orbit of Q45 do the two classes form?
