# The Galois depth operator at the crystalline defect caller

26 November 2026. Human derivation, independent audit pending. This expands
the scalar and integral one-step operator retained in the existing lift-ideal,
cut and few-low-jump arguments. Their finite composition and cut counts are
already supplied; they are not claimed again as new results. No Lean replay
or redundant finite diagnostic was run.

Source throughout: `lsernau/grh-lean` at
`72fead102f663d5c7a407964a13dc0cf9d977207`, `grh-compact/src/`.
Actual callers are `New/Lift/ExponentLattices.lean`, `exists_depth_step`
and `exists_depth_step_zero`; `New/Lift/HodgeExpansion.lean`,
`exists_reaches_depth_succ`; and `New/Lift/LongGap.lean`,
`exists_reaches_deep` and `pointsOver_nonempty_of_costs`.

Keep the same Kummer chart, lattice, coefficient letter and retraction as in
[the frame](2026-11-26_COMPACT_PERIOD_BASIS_AND_INVERSE.md) and
[the field-of-values transport](2026-11-26_COMPACT_CHART_FIXED_COEFFICIENTS.md).
Write \(\Lambda=W(\mathbb F_{p^f})\), \(S=\Lambda[[z]]\),
\(E_a=\varphi^aE\), \(\delta=z\tau\), and
\(\theta_a=\theta\varphi^{-a}\). The chart subgroup \(\Gamma'\) fixes
\(\Lambda\) and \(\theta z\), and contains an element sending
\(z\) to \([\varepsilon]^l z\) for every natural \(l\).
The normalized valuation on \(C_p\) has \(v(p)=1\).

Put \(d=0\) if the chart ramification degree \(e=1\), and
\(d=v_p(e)+1\) otherwise. The required cost is
\[
c(a,n)=v_p(n)+d+3a,\qquad v_p(0)=0.                    \tag{1}
\]

## 1. The derivative bound has no hidden rank

Weierstrass division of \(z^e\) by \(E\) gives a monic polynomial
\(P\in\Lambda[X]\) of degree \(e\) and \(G\in S\) with
\(P(z)=GE\). Put \(\pi=\theta z\); the chart identity gives
\(v(\pi)=1/e\), and \(P(\pi)=0\). All nonzero coefficients of \(P\)
have integral valuation, since \(\theta\Lambda\) is unramified.
The nonzero terms \(jP_j\pi^{j-1}\) of \(P'(\pi)\),
\(1\le j\le e\), have pairwise different valuation classes modulo
\(\mathbb Z\). Their least valuation therefore cannot cancel. In
particular
\[
v(P'(\pi))\le v_p(e)+(e-1)/e\le d.                    \tag{2}
\]
For \(e=1\) the derivative equals 1 and the last bound is 0. This
proves the actual `exists_derivative_dvd_p_pow` conclusion
\(\theta(P'(z))\mid p^d\), including its nonvanishing, from the chart
and Weierstrass hypotheses. No bound on the lattice rank enters.

## 2. A nonzero depth: construct the scalar correction

Fix \(a\ge0\), choose \(g\in\Gamma'\) with
\(gz=[\varepsilon]^{p^a}z\), and write
\(gE=\omega_0E\), where \(\omega_0\in A_{\inf}^{\times}\).
The chart Galois divisibility gives \(\delta\mid\omega_0-1\).
It follows directly by divided differences of the series for \(E\):
\(gz-z=z\mu V=E\delta uV\), where \(\mu=uE\tau\) with \(u\) a unit,
and \(V=\sum_{j=0}^{p^a-1}[\varepsilon]^j\).
The same series divisibility applies to \(G\), so \(E\mid gG-G\).
All series operations are in the completed chart, with the exact
principal-ideal closure supplied in the frame appendix.

Taylor expansion of \(P(gz)-P(z)\), followed by division by \(E\)
and application of \(\theta\), gives the exact identity
\[
\theta(G)\,\theta(\omega_0-1)
 =p^a\theta(\delta)\theta(u)P'(\pi).                   \tag{3}
\]
Indeed the quadratic Taylor remainder contains \(E^2\),
\(\theta(V)=p^a\), and the extra term \(gG-G\) vanishes under
\(\theta\). The right side is nonzero, so both factors on the left
are nonzero. Since \(\theta(G)\) is integral, (2)--(3) imply
\[
v(\theta(\omega_0-1))\le v(\theta\delta)+a+d.           \tag{4}
\]
No assertion that \(\theta(G)\) is a unit is needed.

Also \(v(\theta(\omega_0-1))\ge v(\theta\delta)
=1/e+1/(p-1)>1/(p-1)\). Hence, for every nonzero integer \(n\),
\[
v(\theta(\omega_0^n-1))
 =v(\theta(\omega_0-1))+v_p(n).                         \tag{5}
\]
To check the endpoint, for \(h\) of valuation greater than
\(1/(p-1)\), in \((1+h)^p-1\) the term \(ph\) has strictly smaller
valuation than every other term. Thus passage to a \(p\)-th power
adds exactly 1. A prime-to-\(p\) power adds 0, and inversion changes
no valuation. This proves (5), also for negative \(n\) and \(p=2\).

Set \(\omega=\varphi^a\omega_0\). Then \(gE_a=\omega E_a\).
Since \(\delta\mid\varphi^a\delta\), there is \(X\in A_{\inf}\)
with
\[
\delta X=\omega^n-1.                                  \tag{6}
\]
The valuation of \(\theta_aX\) is bounded using (4)--(5):
\[
v(\theta_aX)\le v_p(n)+a+d+
 v(\theta\delta)-v(\theta_a\delta).                     \tag{7}
\]
Here \(v(\theta_a z)=1/(ep^a)\) and
\(v(\theta_a\tau)=1/(p^a(p-1))\). At \(a=0\) the last difference
is zero; for \(a\ge1\) it is less than 2. Consequently (7) is at
most \(c(a,n)\), since \(a+2\le3a\) for \(a\ge1\).
Choose \(\upsilon\in A_{\inf}\) lifting the integral scalar
\(p^{c(a,n)}/\theta_aX\) under the surjective \(\theta_a\).
Its kernel is \((E_a)\), so
\[
E_a\mid\upsilon X-p^{c(a,n)}.                          \tag{8}
\]
Finally \(E_a\mid gs-s\) for every \(s\in S\): at \(\theta_a\),
the chosen rotation has multiplier
\(\theta_a([\varepsilon]^{p^a})=1\) on the variable, and fixes
the coefficients. Equations (6)--(8), this congruence and
\(gE_a=\omega E_a\) are all the fields of `exists_depth_step`.

## 3. Zero depth: a finite average instead of division by zero

Let \(M=p^{d+3a}\). For \(0\le l<M\) choose
\(t_l\in\Gamma'\) with \(t_lz=[\varepsilon]^l z\).
We claim
\[
E_a\mid(g-1)\sum_{l=0}^{M-1}t_ls
\quad(g\in\Gamma',\ s\in S).                          \tag{9}
\]
Reduce \(s\) modulo \(E_a\) by Weierstrass division, keeping its
polynomial of degree less than \(ep^a\). At \(\theta_a\), each
monomial of degree \(r\) acquires the factor
\(\sum_{l<M}\zeta_{p^a}^{lr}\). Since \(p^a\mid M\), this is
zero unless \(p^a\mid r\), and is \(M\) otherwise. In the latter
case its variable factor is a power of \(\theta z\), which
\(\Gamma'\) fixes; its coefficient is fixed too. This proves
(9) by \(\ker\theta_a=(E_a)\). It includes \(a=0\), where the
root of unity is 1. This is `exists_depth_step_zero` with exactly
the number of summands in (1).

## 4. Lift the scalar operator to the actual Kisin point

First justify the field of values at **every** level. Use the frame basis
\(n_j\), so \(A_{\inf}\mathcal N=\sum_jA_{\inf}n_j\),
\(\tau^h(A_{\inf}\otimes T)\subset A_{\inf}\mathcal N\), and
\(E^h\varphi\mathcal N\subset\mathcal N\). The last inclusion
implies that \(\varphi^a n_j\) has invariant-form values in
\(\mathcal K_0\): multiply it by the nonzero scalar
\(\prod_{b<a}(\varphi^bE)^h\in S\) to put it in \(\mathcal N\).
For \(x\in\mathcal N\), choose nonzero \(r\in A_{\inf}\) with
\(r\varphi^{-a}x\in A_{\inf}\otimes T\), and write
\(\tau^h r\varphi^{-a}x=\sum_jt_jn_j\). After applying
\(\varphi^a\), this is a relation among \(x,\varphi^a n_j\),
all of whose invariant-form values lie in \(\mathcal K_0\).
The frame's exact relation transport therefore permits applying
any \(S\)-linear coordinate \(f\) to all its scalar coefficients.
Choose one with \(f(\varphi^a(\tau^h r))\ne0\), using joint
separation of the coordinates. Apply \(\varphi^{-a}\) and an
invariant form \(\mu\) to the resulting relation:
\[
\mu(\varphi^{-a}x)=
 \sum_j\frac{\varphi^{-a}f(\varphi^at_j)}
 {\varphi^{-a}f(\varphi^a(\tau^h r))}\,\mu(n_j)
 \ \in\mathcal K_a.                                    \tag{13}
\]
The quotient is taken in \(B_{\mathrm{dR}}\); its denominator
is nonzero, and both numerator and denominator are images of
\(\varphi^{-a}S\). This is the actual `valueAt_mem_valueField`
bridge, not the claim that Frobenius preserves \(\mathcal N\)
without its height factors. The same exact relation transport
makes the rule \(r_0(bn)=\lambda_0(b)n\) well defined on
\(A_{\inf}\mathcal N\), giving the coordinate retraction below.

The frame's Galois clause and saturation at all \(E_b\) give, for
\(x\in\mathcal N=\texttt{kisinLoc}\),
\((g-1)x/\delta\in A_{\inf}\mathcal N\). Indeed first use the
frame divisibility for integral points; on a point with an \(E_b\)
denominator the identity \(gE_b-E_b\in\delta E_bA_{\inf}\) permits
the same division, and induction handles the localization. Since
\(\theta_b\delta\ne0\) for every \(b\), division by \(\delta\)
preserves every old Hodge-filtration bound on the difference.
Apply the **same** coordinate retraction
\(r:A_{\inf}\mathcal N\to\mathcal N\) supplied by the frame.
The fixed-coefficient appendix proves that \(r\) preserves all
the relevant linear-form depths and all zero relations.

For \(n\ne0\), define
\[
B_{a,n}x=p^{c(a,n)}x-
 r\left(\upsilon\frac{gx-x}{\delta}\right).              \tag{10}
\]
For \(n=0\), define \(B_{a,0}x=\sum_{l<M}t_lx\); equivalently
this is \(p^{c(a,0)}x+r\sum_l(t_lx-x)\). These additive maps
are chosen before the constant, letter or depth profile.
On a point projecting to a constant, their correction terms
project to zero. They preserve every old exponent/depth condition,
since each correction divided by \(\delta\) has that condition
and \(r\) preserves it. Thus for every old profile \(o\),
\[
B_{a,n}x-p^{c(a,n)}x\in\ker\pi\cap M_o
\quad\text{when }x\text{ is deep for }o.                \tag{11}
\]
This is the native `Reaches` contract, not just a valuation estimate.

To prove the new depth, let \(y=\mu(\varphi^{-a}x)\). If its
Galois differences lie in \(\mathrm{Fil}^n\), scalar invariant
lifting gives \(q\in K'\) with \(y-q\in\mathrm{Fil}^n\).
Put \(E_0=\varphi^{-a}E_a\) and
\(w=(y-q)/E_0^n\). This is in the actual field of values and
in \(\mathrm{Fil}^0\). The exact first-order field-of-values
lemma in the fixed-coefficient appendix, applied to the chosen
\(g\), gives \(gw-w\in\mathrm{Fil}^1\).
With bars denoting \(\varphi^{-a}\),
\[
gy-y=(\bar\omega^n-1)(y-q)+
 \bar\omega^nE_0^n(gw-w).
\]
Equations (6)--(8) therefore imply
\[
p^{c(a,n)}y-
 \bar\upsilon\frac{gy-y}{\bar\delta}
 -p^{c(a,n)}q\in\mathrm{Fil}^{n+1}.                     \tag{12}
\]
Here \(\bar\delta\) is a de Rham unit; every division is
legitimate. Retraction preserves (12), including its fixed
constant, by the already proved exact linear-form transport.
Taking a Galois difference removes that constant and establishes
the raised depth \(n+1\).

For \(n=0\), use (9) and the same first-order field-of-values
lemma on \(y-q\) with the finite operators \(t_l\). It gives
\((g-1)\sum_lt_ly\in\mathrm{Fil}^1\) for every \(g\).
Thus the zero step raises depth to 1 and satisfies (11) at the
same cost, without a nonzero-depth formula at \(n=0\).

## 5. Exact consumers and remaining work

The finite composition in the existing
[cokernel appendix, §5](2026-11-26_COMPACT_UNRAMIFIED_KISIN_COKERNEL.md)
now has its actual one-step suppliers (9)--(12). It produces
`exists_reaches_deep` and `pointsOver_nonempty_of_costs` with total
cost \(\sum_{(a,n)\in I}c(a,n)\), while retaining both the old
point exponents and the improved difference depths. Its correction
is always in the kernel, so it keeps the same prescribed constant
after the displayed power of \(p\). The maximal-integer-step
induction and `improvedExponent` argument are unchanged.

At the sparse-thick/two-size caller, this is exactly the operator
used on the audited two-window cost set, not a separate operator
for each form. In the unramified few-low-jump case, the required
steps have \(a=0\), \(d=0\), and either \(p\nmid n\) or
\(n=0\); thus their costs are zero. The latter conclusion now
has a proof of its zero step. The already supplied cut profiles,
ramified lift-ideal recursion, coefficient extraction and cup
walk are retained, rather than repeated.

Independent audit must check the derivative/Taylor identity
(3), the \(3a\) valuation allowance, the finite averaging field,
and preservation of the same retraction at (10)--(12). This note
does not certify the entire cup safety theorem, few-low colength,
global Selmer descent, or A/B comparison suppliers. No native
graph edge, axiom evidence, protected workflow or schedule changed.

RESUME HERE: audit this one-step operator jointly with the frame
and field-of-values transport. Then complete the safety/Ext cup
bridge and combine the existing three exponent branches at
`crystalline_defect_le`, retaining their exact third-side and
common-lattice hypotheses. Do not rederive the cut count or Ribet
scalar collection.
