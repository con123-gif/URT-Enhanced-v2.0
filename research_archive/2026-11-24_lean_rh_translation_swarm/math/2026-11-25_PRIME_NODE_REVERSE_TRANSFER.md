# Lane 2 — prime-node reverse transfer and exact remaining obstruction

25 November 2026. **RESULT: THEOREM / precisely narrowed proof gap.**  This is
an unconditional elementary prime-arithmetic inequality.  It does **not** prove
the weighted-prime lower bound, RH, or any asymptotic cancellation estimate.
No URT input is used.

## 1. Continuity and provenance

Current mission: `ONE_EQUATION_MISSION.md` at commit
`e0dc8f7faa1e35a5e3210b817b5b34f8d8cf20f1`.  Pinned Lean source revision:
`40e56bab026552e089d7afcfeff08d2defb9c005`.  Relevant pinned source files are:

- `src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauZeroFreeCriterion.lean`,
  blob `54fd0de979e0dad6ac7709ad8ecbec8a29e21872` (`WindowHypU` and
  `PoleData`);
- `src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/landauWindow.lean`,
  blob `7915058f10b33a52652290cd887cbccdc00e676a` (`landau_window`).

Fresh upstream `HEAD` checked by `git ls-remote` during this run:
`75e2012dcc6f3093e223ef8d327b88395ff7d27c`; it is recorded separately and is
not mixed into the pinned argument.

The starting peer result is the prime-jump forward energy estimate at commit
`c7531de`: it showed that a weighted positive-deficit budget at prime nodes
controls the Landau positive-part integral.  The theorem below proves the
reverse transfer.  The square-mesh peer result is `7a9ec19`; its constant 6 can
also be replaced by the sharper constant derived below, but this report makes
no change to that peer file.

## 2. Definitions

Put

\[
 c=1-\log 2,\qquad
 W(x)=\sum_{x/2<p\le x}\left(2-\frac{x}{p}\right)\log p,
 \qquad D(x)=cx-W(x),\qquad d(x)=\max(D(x),0).
\]

For `0 < theta < 1` and `2 <= a < b`, define

\[
 I_\theta(a,b)=\int_a^b d(x)x^{-\theta-1}\,dx,
 \qquad
 S_\theta(a,b)=\sum_{a<p\le b}d(p)\log(p)p^{-\theta-1},
\]

and boundary energy

\[
 F_\theta(x)=d(x)^2x^{-\theta-1}.
\]

The convention is that `D` is right-continuous at primes: the new prime is
included at `x=p`.

## 3. The theorem

For every `0 < theta < 1` and every `2 <= a < b`,

\[
 \boxed{\quad
 S_\theta(a,b)
 \;\le\; (1+3\log 2)I_\theta(a,b)+\frac12F_\theta(a).
 \quad} \tag{R}
\]

This is a reverse transfer from the continuous positive deficit to the
prime-node budget.  It is uniform in the location and length of the interval.

### Proof

Away from points `p` and `2p`, the active prime band is fixed and

\[
 D'(x)=c+\sum_{x/2<p\le x}\frac{\log p}{p}. \tag{1}
\]

Let `n=floor(x)`.  If `n=2m`, every prime in `(x/2,x]` lies in `(m,2m]`
and divides `binom(2m,m)`, so its total logarithmic mass is at most
`2m log 2 <= x log 2`.  If `n=2m+1`, all primes in the band except possibly
`m+1` lie in `(m+1,2m+2]` and divide `binom(2m+2,m+1)`.  Hence, in both
parities,

\[
 \sum_{x/2<p\le x}\log p\le 2x\log2. \tag{2}
\]

For the odd case, the displayed bound follows from
`(x+1)log 2 + log((x+1)/2) <= 2x log 2`, equivalently
`(x+1)/2 <= 2^(x-1)`, valid for `x>=2`.  Since `p>x/2`, (1) now gives the
uniform elementary envelope used here

\[
 0<D'(x)\le c+4\log2=1+3\log2=:M. \tag{3}
\]

At `2p` the departing summand has weight zero, so `D` is continuous.  At a
prime `p`, `W` jumps upward by `log p`, and consequently

\[
 D(p^-)=D(p)+\log p.
\]

For `F(x)=d(x)^2x^{-theta-1}`, its continuous derivative exists almost
everywhere and, using (3), satisfies

\[
F'(x)=2d(x)D'(x)x^{-\theta-1}
       -(\theta+1)d(x)^2x^{-\theta-2}
 \le 2M d(x)x^{-\theta-1}. \tag{4}
\]

The energy lost at a prime is

\[
 \Delta_p=\bigl(D(p)+\log p\bigr)_+^2p^{-\theta-1}
             -D(p)_+^2p^{-\theta-1}.
\]

If `D(p)>0`, expansion gives
`Delta_p >= 2 d(p) log(p) p^(-theta-1)`; if `D(p)<=0`, the right side is zero
and the same inequality is immediate.  Summing the bounded-variation identity
over `(a,b]` gives

\[
 \sum_{a<p\le b}\Delta_p
   =F(a)-F(b)+\int_a^b F'(x)\,dx.
\]

Use `F(b)>=0`, (4), and the prime-jump lower bound to obtain

\[
 2S_\theta(a,b)\le F(a)+2M I_\theta(a,b),
\]

which is exactly (R).

## 4. Consequence for the one-equation mission

The peer forward energy inequality `c7531de` controls a positive-deficit
integral by `S_theta` plus a summable squared-log term and an endpoint term.
Equation (R) supplies the converse control.  After the peer's explicit
half-window dilation and endpoint selection, and retaining all boundary terms,
the sparse prime-node budget and the Landau positive-deficit integral are
therefore quantitatively comparable on a fixed multiplicative scale.  The
prime budget is a useful discretisation, but it does not create the missing
cancellation.

The exact unresolved input is now narrower:

> prove an RH-scale upper bound for either `I_theta` or the equivalent
> correlated prime-node budget `S_theta` on arbitrarily distant multiplicative
> windows.  Bounding prime gaps, sampling more finely, or changing between
> these two representations does not supply that cancellation.

The sharper slope bound also gives, unconditionally,

\[
 D(x)-D(t)\le(1+3\log2)(x-t)\qquad (x\ge t\ge2),
\]

because prime events only jump downward and `2p` events are continuous.  Thus
the square-mesh peer's constant 6 is not intrinsic.  This improves its
deterministic mesh error but does not prove its bad-square count.

## 5. Failed simplifications and negative control

1. **Over-sharpen the binomial bound.**  The tempting assertion that every
   band prime divides `binom(n,floor(n/2))` is false for odd `n`: at `n=5`,
   the band contains `p=3`, but `3` does not divide `binom(5,2)=10`.  The
   separate odd argument above repairs this without using a prime theorem.
2. **Delete the boundary energy.**  This is false on arbitrary intervals.  If
   `p` is a prime with `d(p)>0`, take `a` tending to `p` from the left and
   `b=p`.  Then `I_theta(a,p)` tends to zero while the budget retains the
   positive term `d(p) log(p) p^(-theta-1)`.  The certificate locates and tests
   an actual such prime.
3. **Infer cancellation from the slope bound.**  Equation (3) controls growth
   between jumps only.  It gives no upper bound on the accumulated correlated
   imbalance of jump sizes and locations.  Using it alone would merely move
   the RH-scale burden into a count of exceptional nodes.
4. **Use finite prime data as the asymptotic step.**  The regression below
   checks implementation and endpoint conventions only.  It cannot prove the
   required arbitrarily distant windows.

## 6. Executed certificate

`verify_prime_node_reverse_transfer.py` uses only the Python standard library.
It sieves actual primes, independently checks the direct definition of `D`,
integrates every positive affine piece between all `p` and `2p` events, checks
(R) on a deterministic grid, checks the sharper slope envelope, checks every
prime jump, and demonstrates failure when the boundary term is removed.

Executed locally:

```text
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_prime_node_reverse_transfer.py
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_prime_node_reverse_transfer.py
```

Output (exit code 0):

```text
prime-node reverse transfer: OK; primes=17984, direct_checks=7, direct_residual=1.273e-09, slope_checks=27576, max_slope=1.057389043270, jump_checks=53952, min_jump_slack=0.000e+00, transfer_checks=15, affine_pieces=106401, min_transfer_slack=2.107e-02, boundary_negative_prime=37, omitted_boundary_slack=-8.985e-03
```

Floating-point powers and logarithms are used; the analytic proof above, not
the finite test, proves (R).  No Lean kernel replay was run.

## RESUME HERE

Attempt one genuinely new cancellation estimate for the correlated quantity

`sum d(p) log(p) p^(-theta-1)`

without replacing it by absolute values or by the already equivalent integral.
The first concrete test should decompose `d(p)` using the exact centered
Chebyshev discrepancy and determine whether a known mean-square theorem has
the correct **one-sided, entire multiplicative-window quantifiers**.  If it
does not, record the exact quantifier failure rather than introduce another
mesh or energy reformulation.

**HANDOFF TO:** prime-window, Landau, audit, integration, and mathematics lanes.
RH remains OPEN.
