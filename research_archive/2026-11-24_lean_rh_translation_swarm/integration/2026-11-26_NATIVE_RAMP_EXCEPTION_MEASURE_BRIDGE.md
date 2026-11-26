# Native principal ramp: exceptional-scale measure to uniform bound (26 Nov 2026)

Status: HUMAN PROOF of a conditional transfer, not a new RH closure. No Lean compilation or new numerical evidence claimed. This extends RUN30 native sparse-window chord bridge (b7b335f66768590bf1cab6c56c7a0d224ffaaeda) to arbitrary exceptional sets, rather than assuming every prescribed mesh node is good. It addresses the explicit averaging-to-uniform obstruction in c4320d6f8bdc9d90ef211d8727b8087a676fba48, using the canonical native G, not a new outer-shell criterion.

## Exact transfer

Let X>=1, 0<alpha<1, C>=0 and I=[X/2,3X]. Define the actual native principal ramp
\[
G(z)=\sum_{n\le z}\Lambda(n)(z/n-1)-z\log z+(1+\gamma)z.
\]
Write F(z)=G(z)-Cz^\alpha. Suppose E is a measurable set in I with length B<X/2, and F<=0 on I\E. An outer-measurable cover of the actual failed witness set also suffices.

On I, F(z)+z^2/X is convex: the finite ramp sum is convex since Lambda>=0; the second derivative of -z log z+z^2/X is -1/z+2/X>=0; and -Cz^alpha is convex. The finite sum over n<=3X with each factor replaced by max(z/n-1,0) is exactly the native ramp, including breakpoints.

For x in [X,2X], if F(x)>0 then x belongs to a connected component (a,b) of the relatively open set F>0. The component cannot meet either boundary of I: doing so would force B>=X/2, because {F>0} subset E. Thus a,b lie in I and F(a)=F(b)=0 by continuity. Also b-a<=B. The convex chord inequality gives
\[
 F(x)\le {(x-a)(b-x)\over X}\le{(b-a)^2\over4X}\le {B^2\over4X}.
\]
For F(x)<=0 the same conclusion is immediate. No distribution hypothesis, regularity of E, or prime estimates are used in this transfer. In particular arbitrary clustering of failed scales is allowed. The proof is a direct extension of the RUN30 chord argument, not a claim of unprecedented convexity mathematics.

Therefore, if B<=K X^{(1+alpha)/2}, with uniform K, then for large X
\[
G(x)\le (C+K^2/4)x^\alpha,\qquad X\le x\le 2X.
\]
At the RH scale alpha=1/2+epsilon, it suffices to control total exceptional length by O(X^{3/4+epsilon/2}), i.e. relative exceptional measure O(X^{-1/4+epsilon/2}). A mere o(X) length bound is not sufficient.

## Direct averaged input

Let M_q=\int_I (F(z)_+)^q dz for q>0. For t>0 the exceptional length for F>t is at most M_q/t^q. The same chord proof applies to F-t (constant shift), so whenever M_q/t^q<X/2,
\[
 \sup_{[X,2X]} F \le t+\frac{M_q^2}{4X t^{2q}}.
\]
For q=1 and M_1>0, choose t=(M_1^2/(2X))^{1/3}, obtaining sup F <= 3t/2 provided the length guard holds. For M_1=0, continuity gives F<=0. Thus a local averaged excess estimate M_q=O(X^{q alpha+(1+alpha)/2}) with uniform constants suffices to recover O(X^alpha) pointwise control, by choosing t=X^alpha and taking X large. This is an estimate on excess over the baseline, not a bound on the signed mean alone.

## Actual consumer and remaining supplier

Pinned upstream leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005:
- DedekindLFunctions/CharFamily.lean 81c8dfd66d910d083d5bc88c664c7917fdbdfe96: G.
- PrimitiveCosets/CoreGm.lean 3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d: core_gm.
- PrimitiveCosets/WindowInequalityOfArtinInputs.lean c349e34925ac26b8bc76bd36e9b91562f86d6b8d: same-family scale producer.
- DedekindLFunctions/LandauTheorems/WindowHypOfRpow.lean dde1c159371538875c28374574ca7e452b0450d9: analytic window adapter.
Source anchors inherited from the retrieved RUN30 certificate; this run retrieved that certificate and current ONE_EQUATION_MISSION, not a fresh upstream Lean build.

Old interface: successful native G bound at every required scale (or fixed sparse mesh by RUN30).
Candidate interface: same selected family and uniform constants supplying G<=Cz^alpha outside an exceptional set of the above length on each padded dyadic block covering a selected arbitrarily distant power window. No independently selected hosts at different nodes where the native construction requires the same family. Padding must be included in the supplier or the usable window shortened with explicit retained power exponent. Constants can be absorbed by choosing a smaller positive exponent margin initially. The conditional root is not invoked to prove any premise.

RESUME HERE: check the actual native tied-family and CoreGm scale failure sets for a quantitative measure bound of this strength, or the stated averaged excess bound. Use same-host arithmetic/geometric estimates; no claim that existing averaged prime-terminal L2 automatically supplies it. Avoid further equivalent reformulations unless they close a supplier. Preserve old path as fallback. Formalize using RUN30 convex chord lemma and a connected-component/outer-measure bridge; native replay, caller integration and asymptotic supplier still OPEN. No unconditional root obligation retired.
