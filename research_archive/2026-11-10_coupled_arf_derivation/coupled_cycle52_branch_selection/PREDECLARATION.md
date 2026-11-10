# Coupled cycle 52 predeclaration — does any derived principle
# select the y_even branch?

Date: 2026-11-10 (Europe/London)

Cycles 22 and 37 found that y_even is free and that occupying the
subcritical branch requires an extra postulate y_even < y_c(η).
Cycle 33 found that any O(1) Yukawa, at the only derived
temperature η, is supercritical. This cycle asks whether any
derived principle — free-energy minimisation over the full
coupled machine at T = η including the gauge sector, stability,
or the pole structure of R(z) = (I − z T_coupled)^{-1} —
selects the subcritical or the supercritical branch, *without*
wanting a Maxwell photon and without using α or R_α.

No historical ARF is inserted. The `newtons-cathedral` tip
remains read-only at `6bad7b3`. Predeclaration is hashed before
any free-energy or resolvent number is computed.

## The functional (frozen)

Arena: the 12-vertex icosahedral 1-skeleton and its 30-edge
gauge field, as in cycles 25–32 (this is the arena in which the
gauge vacuum A = 0 / A = π was derived). Hidden even stiffness
c_even = Δ² c5. Nambu measure of cycle 18:

    V_hist = c_even ||h5||²,
    Δ = y_even M(h5),

with M the pairing matrix of the even nuclear-norm maximiser
already used in cycles 18–19 (nuclear norm N = 4.640379972803843).
y_odd = 0 (the odd channel does not condense at O(1) Yukawa;
cycle 19). Temperature T = η. No tree Maxwell term and no tree
|DΔ|² are introduced.

The full free energy is

    Ω(y, r, A) = V_hist(r) + Ω_f(K[A], Δ(y, r), T=η),

with Ω_f the cycle-18/25 fermion free energy, referred to the
unpaired spectrum of K[A=0]. At each y the derived gauge-plus-
pairing vacuum is: r = 0, A = 0 if y < y_c(η) (ico:
y_c = 0.005940144040707988); r = r_*(y), A = π if y > y_c(η),
with the large-vev balance r_* = y N / (4 c_even) used as the
scan centre and then refined. Both A = 0 and A = π are evaluated
at each y, so the gauge sector is included and is not assumed.

Frozen y-sample, not adjusted after seeing Ω:

    Y = {0, ½ y_c, 0.99 y_c, 1.01 y_c, 0.01, 0.1, 1.0, 2.0}.

## Candidate principles, and what would count

P1. *Free-energy minimisation over y.* Cycle 22 treats y_even as
    a Yukawa, not as a dynamical field or a history amplitude.
    Minimising Ω with respect to y is therefore an *extra
    postulate*, not a derived variation, unless a unique archival
    statement already promotes y to a variational modulus (none
    is expected). The function
        ω(y) := Ω at the derived (r, A) vacuum of that y
    will still be computed on Y. This candidate *selects a
    unique finite y*, conditionally on that extra postulate, only
    if ω has a unique minimiser in the interior of a compact
    derived domain, with ω'' > 0, not at the endpoint of Y, and
    not by a runaway. If ω is monotone in y on the supercritical
    side, or constant on the subcritical side, P1 does not select
    a unique y and does not, by itself, select a branch independently
    of a choice of y. A preference for large y (ω → −∞ as y → ∞)
    is a runaway, not a derived selection of the supercritical
    point.

P2. *Stability of the derived vacuum.* The origin r = 0 is
    unstable iff y > y_c(η) (already proved). This names the
    dichotomy. It selects a branch only if a derived principle
    already places y on one side of y_c. P2 alone does not.

P3. *Resolvent poles of R(z) = (I − z T_coupled)^{-1}.* Three
    objects, all previously named, no new transfer invented to
    fit a branch:

    (i) Uncoupled T0 = exp(−η H0) of cycles 05/13/16. Its poles
        z1 ≈ 1.015458, z2 ≈ 1.063249 are independent of y and
        cannot select a branch.
    (ii) The cycle-13 bubble-chain T (eigenvalues
        ± y_e √(π_e/H5)), whose pairing kernel is the Dirac
        channel that cycle 18 falsified as the measure of the
        coupled pairing theory. It is not a derived selector;
        cycle 13 already found that it does not fix r. It is
        not recomputed as a new principle.
    (iii) Linearisation of the derived Nambu functional
        V_hist + Ω_f at r = 0. A negative mode exists iff
        y > y_c(η), which is P2 again.

    A matching of an even resolvent pole to z1 or z2, or a
    demand that a photon pole be massless, is *not* a derived
    condition and will not be used. Spectral radius of the
    iteration at a derived vacuum being less than 1 is a
    consistency check on that vacuum, not a comparison of
    the two branches.

No comparison of either branch’s kernel to R_α, to 1/137.036,
or to a Maxwell κ is performed, and no branch is preferred
because it is more Maxwell-like.

## Hypotheses

H1. On the subcritical sample points ω(y) is constant (equal to
    the A = 0, r = 0 value, up to numerical noise) and the
    origin is stable. On the supercritical sample points the
    derived vacuum is A = π, r ≈ y N/(4 c_even), and ω(y) falls
    as a negative multiple of y² (large-vev balance), with no
    interior minimum on Y.
H2. P1, even if granted as an extra postulate, therefore does
    not select a finite y (runaway to large y, if anything).
    P2 and P3(i)–(iii) do not select a branch independently of
    a choice of y.
H3. The subcritical / supercritical dichotomy stands as in
    cycles 32–37. No derived principle tested here occupies one
    branch without a postulate on y_even. No ARF comparison is
    performed.

Classification: PROVED / CONDITIONAL / FALSIFIED / OPEN by the
computation and the reading. No ARF target is used to select a
branch.
