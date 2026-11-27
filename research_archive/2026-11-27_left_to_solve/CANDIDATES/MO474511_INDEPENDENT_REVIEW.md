# MO474511: independent challenge of a full positive hand proof

Prepared2026-11-27 for Cornelius Lytollis (@con123-gif), assisted by
ChatGPT (GPT-6 Codex; exact variant not exposed). The scout proposed the
bounded-functional splitting proof; the combinatorics worker independently
checked it and supplied an equivalent finite-dimensional center/complement
proof and exact Mathlib pointers. No official lease, Lean execution,
submission, acceptance or priority is claimed by this note. Prior-work
and linked-source audits remain with the scout.

Source:
https://mathoverflow.net/questions/474511/approximation-of-a-continuous-curve-on-commuting-matrices

## Exact source and quantifiers

A continuous curve A:R_+ -> M_N(R) satisfies the JOINT limit
[A(t),A(s)] -> 0 as t,s -> +infinity. Is there a continuous B such that
all B(t) commute pairwise for all nonnegative t,s and A(t)-B(t) -> 0?
The source already gives the bounded-A case via projection onto the span
of its cluster points, acknowledging Olivier Benoist. The new issue is
unbounded A. The proof below handles that entire issue. It uses the joint
limit essentially and would not automatically handle a weaker iterated
or pointwise limit.

## General finite-dimensional bounded splitting lemma

Let S be any subset of a finite-dimensional normed matrix algebra such that
all pairwise commutators [a,b], a,b in S, are bounded by a common finite
constant. Put V=span(S), and let Z be the center of V in the linear sense:

    Z = {z in V : [z,v]=0 for every v in V}.

No multiplicative closure of V is assumed or needed. Choose a basis
v_1,...,v_r of V from S. Define the linear map

    F:V -> M_N(R)^r, F(v)=([v,v_i])_i.

Its kernel is exactly Z. The set F(S) is bounded by the assumed
commutator bound. Choose a linear complement L of Z in V. The restriction
F|L is injective and finite-dimensional, hence has a continuous inverse
on its range, equivalently a uniform lower norm bound. Let p_L be the
projection onto L along Z. Since F(p_L(a))=F(a), the set p_L(S) is bounded.
Thus every a in S decomposes as a=z+b, z in Z, with b in a single bounded
set. Z is abelian and centralizes every element of V. All projections
here are continuous because their domains are finite-dimensional.

This lemma uses only finite-dimensional linear algebra. It proves the
same assertion as the scout's bounded-functional construction: if E is
the space of linear functionals bounded on S and U=ann(E), then U is an
abelian subspace centralizing S, and A modulo U is bounded. The center
construction avoids formalizing the full dual/Riesz argument.

## Apply the splitting to the curve

Choose T with ||[A(t),A(s)]||<=1 for all t,s>=T, possible by the joint
limit. Apply the lemma to S={A(t):t>=T}. Extend the projection onto Z
along L in V to a continuous linear map p_Z on the whole ambient space,
using a linear complement of V. Define globally

    z(t)=p_Z(A(t)), b(t)=A(t)-z(t).

Thus A(t)=z(t)+b(t) at every time, and both curves are continuous.
For t>=T, z(t) is in Z, b(t) is in L, and b(t) is bounded. No condition
on early A(t) lying in V is assumed. Since Z centralizes V,

    [b(t),b(s)] = [A(t),A(s)]

for all sufficiently large t,s. In particular these residual commutators
still tend jointly to zero.

Let K be the cluster set of b(t) at infinity. Boundedness in a
finite-dimensional space makes its tail closure compact. Every pair of
points k,l in K is the limit of b(t_n),b(s_n) with both parameter
sequences tending to infinity. Continuity of the commutator and the
joint limit give [k,l]=0. Let W=span(K). Bilinearity makes W abelian.
Also W lies in V, so it centralizes Z.

The distance from b(t) to W tends to zero: otherwise a bounded sequence
b(t_n), t_n->infinity, would stay a fixed positive distance from W but
have a convergent subsequence with limit in K subset W, a contradiction.
Equivalently, any fixed continuous linear projection onto W has a
residual tending to zero, because it fixes every cluster point.

Now Z+W is a fixed abelian linear subspace. Choose any continuous linear
projection P from the full ambient matrix space onto Z+W and define

    B(t)=P(A(t)).

This curve is continuous at all times and all of its values commute,
since its image is contained in the fixed abelian space Z+W. On the
tail, A=z+b and Pz=z, while (I-P)b tends to zero since every cluster
point of b lies in W. Therefore A(t)-B(t)->0, proving the full source
claim, including unbounded curves. No entrywise or operator-norm choice
matters in finite dimension.

## Independent challenge checks

- A common T bounds ALL pairs in one tail, not just pairs with comparable
  parameters. This follows from precisely the source's joint limit.
- Choosing a basis from S is legitimate because S spans V; only finitely
  many fixed tail times are needed.
- The center Z can contain unbounded components without making the
  complement projection unbounded: the injective lower norm bound is
  the exact missing argument.
- No claim that an arbitrary unbounded set has a bounded projection onto
  an arbitrary complement is made. F's kernel controls the complement.
- Centering preserves commutators exactly; no product of an unbounded
  discarded term with a small error is estimated.
- Compactness is applied only to the bounded residual on a tail.
- The final B is a projection from the full ambient space, so continuity
  for early times is retained even though V only spans a late tail.
- The source's known bounded case is acknowledged and generalized, not
  reclassified as a newly solved independent second problem.

## Pinned Mathlib pointers, not yet executed Lean

- Analysis/Normed/Module/FiniteDimension.lean249:
  LinearMap.injective_iff_antilipschitz, for a finite-dimensional domain,
  gives Injective f iff exists K>0 with AntilipschitzWith K f.
- Topology/MetricSpace/Antilipschitz.lean214:
  AntilipschitzWith.isBounded_preimage.
- Submodule.exists_isCompl.
- LinearAlgebra/Projection.lean126 onward:
  Submodule.projectionOnto and Submodule.projection, with
  projection_add_projection_eq_self at244.
- Algebra/Algebra/Subalgebra/Basic.lean942:
  Subalgebra.centralizer; its underlying submodule intersected with V
  gives the center Z used above.

These are source-read API references, not a claim that the full proof
has been translated or kernel checked. Eligibility remains pending a
fresh complete source, linked-source, literature and prior-submission
audit. No official count changes.
