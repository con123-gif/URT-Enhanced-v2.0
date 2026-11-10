# Coupled cycle 62 predeclaration — a dimensionless ratio of
# derived 0-form and 1-form gaps as an ARF-type observable

Date: 2026-11-10 (Europe/London)

This cycle tests a single still-untested derived quantity that
needs no coframe, no choice of y_even, and no C_IR. The
quantity, its comparison targets, the look-elsewhere catalogue
and the match rule are frozen here, before any ratio is
computed or any ARF decimal is inspected against it.

The `newtons-cathedral` tip remains read-only at `6bad7b3`.
No Hodge weighting is selected (cycle 47: the metric cone is
not unique). The unique unweighted Hodge operators and the
unique Gauss projector P_T of cycle 43 are used. Historical
ARFs are comparison targets only.

## The observable (declared before computing)

On the unique derived icosahedral 2-complex (12 vertices, 30
edges, 20 faces; cycle 43):

    ρ_10 := λ_min(Δ1_T) / λ_min(Δ0^+),

the ratio of the lowest positive coexact 1-form eigenvalue of
the unweighted Hodge Laplacian to the lowest positive 0-form
eigenvalue (the Fiedler value of the 12-vertex graph). Both
gaps are already named (λ_min(Δ1_T) = 3−√5, cycle 43;
λ_min(Δ0^+) = 5−√5, cycle 32), but their ratio has not been
used as an ARF-type observable. It is uniquely determined,
dimensionless, independent of y_even, of any 4D coframe, and
of C_IR, and it uses only the unique unweighted complex (no
cycle-47 weighting is chosen).

The numerical ratio will be computed from the operators, and
the closed form (3−√5)/(5−√5) will be simplified independently.
Agreement of the two at relative 10^{-12} is an integrity check,
not a comparison to an ARF.

## Named comparison targets (declared before computing)

T1. The four historical ARFs, as numbers:
        Δ_δ = −δ★³/63 − γ/40,
        R_α = 3/(64φ) + 1/(79φ²),
        C_mass = −(5/16)δ★³ + (7/8)πφ,
        R_mass = (3/35)δ★² − (4/51)π³.
    Also the combinations |Δ_δ|, |R_α|, |C_mass|, |R_mass|,
    and the 1/α writings 137 + δ★²/π² + R_α and
    137 + d_eff²/π² + R_α (documentary only; d_eff = δ★+Δ_δ).
T2. Frozen and previously derived scalars: γ, Δ, δ★, η, 3/20,
    1/12, 1/81, φ^{±1..±6}, (3−√5)/2 = 1/φ², 3−√5 = 2/φ²,
    1/12, London mass 1/12.

A match to a T1 target at relative 10^{-4} is reported. It is
a *derivation* of that ARF only if the identification “ρ_10 is
this ARF (or this unique named factor of it)” is a unique
structural role, not a catalogue coincidence. Otherwise it is
a look-elsewhere hit. An exact closed form for ρ_10 in terms
of φ and √5 is a simplification of the observable, not by
itself a historical ARF.

## Look-elsewhere catalogue (declared before computing)

Base B: the T2 scalars; the derived gaps
{5−√5, 5+√5, 6, 3−√5, 7, 6−√5, 6+√5, 13, 10, 4, 2};
the stiffnesses {c3, c5, c_even}; Cathedral integers
{1,2,3,4,5,6,7,8,9,12,13,16,18,20,24,30,31,32,35,40,51,60,
63,64,79,80,81}; π and e.

Operations: for x, y in B ∪ {φ}, the values x, 1/x (x≠0),
x/y, y/x, x+y, |x−y|, x y, and x², provided the result is
real and finite. Catalogue size and the number of distinct
values will be reported. A 10^{-4} hit on this catalogue that
is not a unique T1 structural identification is not a
derivation. Tautologies such as “ρ_10 = (3−√5)/(5−√5)” are
the definition, not a catalogue derivation.

## Hypotheses

H1. The operator ratio agrees with (3−√5)/(5−√5), which
    simplifies to a unique closed form in φ, √5.
H2. That closed form is not a unique structural identification
    with any of the four historical ARFs at relative 10^{-4}.
    Any catalogue hit is recorded as look-elsewhere.
H3. Therefore ρ_10 is a derived dimensionless observable, but
    it does not advance a physical ARF.

Classification: PROVED / CONDITIONAL / FALSIFIED / OPEN.
No coframe is invented, κ_iso is not promoted, y_even is not
varied, and C_IR is not used.
