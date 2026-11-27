# MO487180: the smallest nonempty counterexample has four functions

Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex, 27 November2026.

This complete HUMAN proof strengthens the verified four-function disproof.
It has passed an independent mathematical challenge by the number-theory
lane. It is NOT itself Lean verified and adds zero catalogue problems,
submissions, or accepted solutions. No exhaustive historical-priority
claim is made.

Consider the source class of functions
\(f(x)=\sum_{j=1}^k\lfloor n_jx\rfloor\), with positive integers \(n_j\);
different functions can have different finite numbers of summands.

**Theorem.** Every nonempty family of at most three distinct such functions
has a unique strict minimum at some positive argument. For each integer
m>=4 there is a family of exactly m distinct such functions with no unique
strict minimum at any positive argument.

The nonempty qualification matters: the empty family is a separate trivial
existence failure and is not the mathematical counterexample at issue.

**Proof for three functions.** Fix positive-integer representations of
three distinct functions f1,f2,f3, and denote their slopes and term counts by
\(s_i=\sum_j n_{ij}\) and \(k_i\). We have
\[
f_i(x+N)=f_i(x)+Ns_i\quad(N\in\mathbb Z),
\qquad f_i(x)=s_ix+O(1).
\]
If just one slope is smallest, its function is strictly smallest for all
sufficiently large x. If exactly two slopes are smallest, choose a point
where those two distinct functions differ and translate by a sufficiently
large positive integer. Their difference is unchanged, while the larger
slope makes the third function exceed both. Again there is a unique minimum.

It remains to consider \(s_1=s_2=s_3=s\). For t sufficiently close to1 from
below, every summand satisfies floor(n t)=n-1. Thus \(f_i(t)=s-k_i\).
If exactly one k_i is largest, its function is uniquely smallest there.

Suppose, then, that the maximum term count K occurs at least twice.
Relabel so that k1=k2=K and k3<=K, and suppose for contradiction that
there is no unique minimum at any positive point.

Call t in (0,1) generic when none of the finitely many numbers \(n_{ij}t\)
is an integer. At every such t the elementary reflection identity gives
\[
f_i(t)+f_i(1-t)=s-k_i.
\]
Because f1 and f2 are distinct, some generic t satisfies f1(t)!=f2(t).
Indeed, otherwise right continuity extends their equality across all
finitely many jump points in [0,1), and common-slope integer translation
extends it to every real argument. Swap their labels if needed so that
f1(t)<f2(t).

The absence of a unique minimum at t forces f3(t)=f1(t): a smaller or
larger third value would make f3 or f1 uniquely minimal. Reflection
reverses the order of f1 and f2, so the same reasoning at1-t forces
f3(1-t)=f2(1-t). Consequently
\[
s-k_3=f_3(t)+f_3(1-t)
=(s-K)+f_1(t)-f_2(t)<s-K.
\]
This contradicts k3<=K. Hence a unique minimum exists.

For one function the assertion is vacuous at any positive point. For two
distinct functions with different slopes use the eventual slope ordering;
with equal slopes choose a point where they differ and translate it to
a positive argument. This proves the at-most-three claim.

**Counterexamples for every m>=4.** The four functions in the checked
counterexample always pair their values, so they never have a unique
minimum, and each has slope9. Put H=f1+f2+f3+f4, a positive-integer
floor sum with slope36. For a desired m>=4 adjoin
\(H,2H,\ldots,(m-4)H\).
These added functions are distinct from one another and the original four,
because their slopes are36,72,... rather than9. For x>0 all original
values are nonnegative; therefore jH(x)>=H(x)>=fi(x) for every j>=1
and each original i. The added functions never lie below the original
minimum, which is already attained at least twice. The enlarged family
has exactly m distinct members and still has no unique minimum. QED.

Only the four-function universal disproof is presently Lean certified:
[canonical certificate](PROOFS_READY/mo-487180.proof.lean) and
[executed verification](MO487180_FULL_VERIFICATION.json).
Standard floor reflection, integer translation and asymptotic slope
facts are acknowledged as prior mathematics. The source is BPP's
MO487180 and its explicit MSE5029508 crosspost.
