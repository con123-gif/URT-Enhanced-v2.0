# MO474511: an affirmative answer for unbounded curves

Status: complete proposed mathematical proof, independent challenge and formal
verification pending. No lease, official submission, acceptance or priority claim.

Source: Ayman Moussa, MathOverflow474511, July5,2024,
https://mathoverflow.net/questions/474511 , CC BY-SA4.0. The bounded residual
argument below uses the bounded-curve observation credited in the source to
Olivier Benoist. Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.

Let V=M_N(R), with any Euclidean inner product. Suppose A:[0,infinity)->V is
continuous and its commutator tends to zero jointly as both arguments tend to
infinity. We prove that one fixed abelian linear subspace H of V satisfies

    dist(A(t),H) -> 0.

The continuous orthogonal projection B(t)=proj_H A(t) then answers the exact
question affirmatively. In particular, the construction gives commutation for
all nonnegative times, including the initial bounded interval.

Choose T such that ||[A(t),A(s)]||<=1 for every t,s>=T, and let S=A([T,infinity)).
Define the linear subspace of the algebraic dual

    E={ell in V*: sup_{x in S}|ell(x)| is finite},
    U={u in V: ell(u)=0 for every ell in E}.

Every linear map L:V->W whose image L(S) is bounded annihilates U: each
coordinate functional of L belongs to E. This uses only finite-dimensional
linear algebra; no closure of S or choice of rates is needed.

For every fixed s>=T, L_s(x)=[x,A(s)] is bounded on S, so [U,A(s)]=0.
Thus S is contained in the linear centralizer C(U). Moreover U is contained in
span(S): every functional vanishing on span(S) belongs to E, and annihilator
duality gives that inclusion. Since span(S) is contained in C(U), we have
U contained in C(U), so U itself is abelian.

Put u(t)=proj_U A(t) and b(t)=A(t)-u(t). For t>=T, both A(t) and u(t) lie
in C(U), hence b(t) does too. Also b(t) is bounded on the tail. To see this,
choose a basis ell_1,...,ell_r of E. The map

    F:U-perp -> R^r, x |-> (ell_1(x),...,ell_r(x))

is injective by definition of U and is an isomorphism by finite-dimensional
annihilator duality. Each coordinate ell_i(b(t))=ell_i(A(t)) is bounded, so
b(t) is bounded. Equivalently, if b(t_j) were unbounded, a normalized convergent
subsequence would give a nonzero unit vector in U-perp annihilated by every
ell in E, contradicting U intersect U-perp={0}.

Because U is abelian and centralizes every b(t) on the tail,

    [b(t),b(s)]=[A(t),A(s)] -> 0.

Let K be the set of limiting points b(t_j) for sequences t_j->infinity.
The boundedness of b gives compact tail closures. Any two points k,l in K
are limits along sequences t_j,s_j->infinity, so continuity of the commutator
and joint asymptotic commutation imply [k,l]=0. Each k belongs to the closed
linear subspace C(U). Consequently W=span(K) is abelian and centralizes U.
Therefore H=U+W is abelian.

Finally dist(b(t),W)->0. Otherwise choose times t_j->infinity with distance
at least some epsilon>0; boundedness supplies a convergent subsequence whose
limit is in K subset W, a contradiction. Since u(t) belongs to U subset H,

    dist(A(t),H)=dist(b(t),H)<=dist(b(t),W)->0.

Orthogonal projection onto H is continuous and linear. Its range is abelian,
so B(t)=proj_H A(t) is continuous, all B(t) commute pairwise, and A(t)-B(t)->0.
All quantifiers of the original question are preserved. The argument applies
to every finite-dimensional real algebra with a continuous bilinear bracket.

Current source audit: StackExchangeAPI refreshed November27,2026 returns zero
answers and zero comments with no pagination. Explicit all-state GitHub PR
search for474511 returned zero. Exact-title and unbounded/asymptotic commuting
searches found no exact prior closure within the sources searched. The two
related posts linked by the author are being read before any claim. This audit
is bounded and does not establish exhaustive novelty or priority.

## Shorter center-of-the-tail-span proof

The collaborating combinatorics lane independently challenged the proof and
found a simpler equivalent route, avoiding dual annihilators entirely.

Choose T as above and V=span(S). Choose a finite basis s_1,...,s_d of V
consisting of points of S. Define the linear commutator-test map

    F:V -> (M_N(R))^d, F(v)=([v,s_1],...,[v,s_d]).

Its kernel Z consists precisely of the vectors in V that commute with every
vector of V: it is the center of V for this bracket. A linear complement L
of Z in V exists. The restriction of F to L is injective, so finite-dimensional
norm equivalence gives ||l||<=C||F(l)|| for l in L. Decompose A(t)=z(t)+b(t)
for t>=T using these fixed continuous linear projections. Since every s_i
belongs to S, F(A(t)) is uniformly bounded by the tail commutator bound. Since
F(z(t))=0, b(t) is uniformly bounded. All z(t) lie in Z, so they commute with
all of V, and the commutators of b equal those of A exactly. As in the bounded
argument, the tail cluster points K of b commute pairwise. Then H=Z+span(K)
is abelian, and A(t) approaches H. Any fixed linear projection onto H provides
the continuous commuting approximant, on the whole original domain.

This yields the useful finite-dimensional lemma: if S spans a vector space V
inside a finite-dimensional algebra and all pairwise commutators of S are
uniformly bounded, the image of S in V/Z(V) is bounded. No completeness issue
or rate of convergence is involved.

For formalization one may replace A by A(max(t,T)). This curve is continuous,
has its entire range in V, satisfies the global commutator bound, and agrees
with A eventually. Thus no extension of a tail-defined projection is needed.

The source's two linked posts have now been read in full, including every
answer and comment. MO51337 asks an algorithm for a finite family already
known to be near a commuting family. MO68367 asks for estimates uniform in
matrix dimension for bounded Hermitian tuples. Neither contains the above
unbounded fixed-dimension curve argument. The current resolved2235-result
TrureTuring catalogue has no474511ID or exacttitle match.
