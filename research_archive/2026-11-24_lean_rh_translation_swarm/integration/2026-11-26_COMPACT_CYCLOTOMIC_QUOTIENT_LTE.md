# The exact cyclotomic quotient identity used in the radius recursion

26 November 2026. SOURCE-MATCHED HUMAN DERIVATION / independent audit
pending. Completes the explicit quotient-ring lifting-the-exponent
input (R3) retained by the crystalline radius appendix. Compact pin
`lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`, Lean 4.35.0,
Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.

The argument uses binomial expansion over the ACTUAL quotient, not
the familiar valuation formula over a field. In particular all
zero-divisors and p=2 are allowed below.

## 1. A local-ring lemma with the exact hypotheses

Let A=A_inf=W(O_C^flat), let f:A→R be a surjective ring map, let
v∈A be a nonunit dividing x−1, and suppose

    p f(x−1) f(v) | f(x−1)^p.                          (1)

For n≥1, the native lemma asserts

    f(x^n−1) | p^(v_p(n)) f(x−1).                      (2)

In fact these two elements are associated in R. We prove that
stronger assertion without cancellation of nonunits. A is local:
a Witt vector is a unit precisely when its zeroth coefficient is
a unit in the valuation ring O_C^flat. Every integer prime to p
is therefore a unit, and every 1+va is a unit for a∈A. Surjectivity
of f implies that 1+f(v)b is a unit for EVERY b∈R, by lifting b.

Write a=f(x−1). Binomial expansion gives

    f(x^p−1)
       =pa+Σ_(2≤j<p) binom(p,j)a^j+a^p
       =pa(1+f(v)b)                                  (3)

for some b∈R. Indeed, binom(p,j)/p is an integer for 1≤j<p,
each a^(j−1) is divisible by f(v), and (1) puts the last term
in pa f(v)R. For p=2 the middle sum is empty and the same reasoning
applies. Thus f(x^p−1) is pa times a UNIT, even if a or p is a
zero-divisor in R.

The same hypothesis propagates to x^p. If a'=pa u with u a unit
as in (3), then p a' f(v) divides (a')^p because a=f(v)b0:
one possible quotient is p^(p−2)a^(p−2)u^(p−1)b0. Also v divides
x^p−1 already in A. Induction therefore gives

    f(x^(p^k)−1) associated to p^k f(x−1)              (4)

for every k≥0. No division by a, p or f(v) was used in this induction.

Finally write n=p^k m with p∤m. In A, for X=x^(p^k),

    X^m−1=(X−1)(1+X+...+X^(m−1)),
    1+X+...+X^(m−1) ≡ m mod v.

The second factor is a unit of A, since m is a unit and v is in
its maximal ideal. Its image is a unit of R. Combine with (4)
to obtain (2), with precisely v_p(n) and no extra p=2 cost.

## 2. Apply the lemma in the actual quotient

Return to the chart. Write x=[ε], μ=x−1=ξτ, and choose u,s∈A
with ξ=pu+zs, using ξ∈(p,z). Let

    R=A/(zμ),   f the quotient map,   v=τ.

The element τ is a nonunit, τ|μ in A, and in R

    f(μ)^2=f(ξμτ)=p f(μ)f(τ)f(u).

Since p≥2, f(μ)^2 divides f(μ)^p. This verifies (1) literally
in R, including when zμ, μ or p have zero-divisors after reduction.
Hence for each n≥1 there is α0∈A with

    p^(v_p(n)) μ−α0([ε]^n−1)∈(zμ).

Writing that ideal membership as an equality gives some β0∈A with

    μ(p^(v_p(n))−zβ0)=α0([ε]^n−1).                    (5)

Let μ=wEτ, w∈A^×, as supplied by the SAME chart's associated
Eτ and μ. Multiply (5) by w^(-1), and put
α=w^(-1)α0 and β=−β0. We obtain exactly

    τ E(p^(v_p(n))+βz)=α([ε]^n−1).                    (6)

This is exists_tau_mul_E_eq_mul_epsTilt_pow_sub in the native
PeriodMatrixBasis. In particular it neither inverts [ε]^n−1 in
A_inf nor incorrectly replaces it by nμ. The βz remainder is
essential in the actual integral radius recurrence.

## 3. Actual consumers and hypotheses retained

In the radius proof take n=j+1. Equation (6) combines with the
S_B difference τz|(t−1)W_j and the integral matrix difference
τz|(G−I) to produce

    p^(1+v_p(j+1))W_j=s_j+zW_(j+1).

The extra 1 comes from E=p+z r_E, not from a separate local
valuation estimate. Accumulating these costs gives j+v_p(j!),
which the Frobenius substitution z^(p^l)=p²X_l absorbs uniformly
under the original 3e≤p^l guard. This supplies the retained (R3)
of COMPACT_CRYSTALLINE_RADIUS.md without changing its witnesses
or final p^(4δ) budget. The independent τz-divisibility reflection,
coordinate-extension, chart construction and period-matrix inputs
remain their own dependencies.

Sources relative to compact src:

- Lib/PadicHodge/WachKisin/PeriodMatrixBasis.lean,
  blob cd91a46eb5624b88af20a96d0450bdf059994b93,
  lifting_the_exponent:21–31 and
  exists_tau_mul_E_eq_mul_epsTilt_pow_sub:39–47;
- Lib/PadicHodge/Comparison/CrystallineLimit.lean,
  e3cf139874cd85a9e5642c277e8b51b9343add9a,
  the actual radius coefficient recursion:101–126.

Source bodies inspected at the pinned commit. No new Lean replay,
finite diagnostics or claim to an independent audit. This is an
explicit integral algebra proof of the named hypothesis, rather
than another simulation or restatement of the radius conclusion.

RESUME HERE: audit the unit lifting and propagation of (1) in the
quotient, then continue the exact initial period-matrix and normalized
division suppliers. Preserve the already derived frame/radius/Ribet
consumer chain and standard native verification boundaries.
