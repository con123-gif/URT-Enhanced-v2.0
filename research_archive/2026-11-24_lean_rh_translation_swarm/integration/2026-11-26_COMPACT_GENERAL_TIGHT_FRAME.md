# Exact-length integral tight frames, with the same p-adic unit vector

26 November 2026. Human derivation from the pinned compact source;
independent audit and native replay pending. Credit Levent Alpöge,
Luke Sernau, Anthropic collaborators and Claude. Source
`lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`,
`grh-compact/src/New/Curve/TightFrameExists.lean`, blob
`4f2e76afa45ba54fe9040704b505b2da1865f2b4`, especially
`exists_cyclotomic_different_factor` and `exists_isTightFrame`.
Definitions are in `Lib/Weil/Construction/ConjugateJetDefs.lean`;
parameter identities in `New/Data/Different.lean`; the CM period
normalization is `PeriodDefs.lean` and `norm_iota_periodFactor`.

This supplies the constructive frame hypothesis retained in character
RUN61 / b025feef. It does not prove the theta-space or CM period
theorems used by that worker, nor the entire A pillar.

## 1. Exact statement and retained parameter data

Fix the source parameters, level index s, rational prime p and embedding
iota from C into C_p. Put N=N1(s), let zeta generate E/K with order N,
and write

\[
 \epsilon=(1+\sqrt{-d})/2,\qquad n=(d+1)/4.
\]

Thus epsilon and its conjugate are algebraic integers, their sum is
one and their product is n. The parameter conditions give d>64 and
every prime divisor of N divides n. The embeddings Phi_tau of E used
below all fix K; distinct ones have distinct values on zeta. Write
D=Phi_N'(zeta), the source's integral different generator.

The actual finite image of v is alpha^{-1}v. At a finite place w,
the source idele alpha is 1/D when epsilon belongs to w, and 1
otherwise. Consequently the required lattice condition is

\[
 Dv\in\mathcal O_{E,w}\quad(\epsilon\in w),\qquad
 v\in\mathcal O_{E,w}\quad(\epsilon\notin w).                 \tag{1}
\]

For the fixed embedding iota, the previously proved period identity is

\[
 |\iota(s_1)|_p=|\phi_\tau(\alpha_w)|_p^{-1},
 \quad \phi_\tau=\iota\circ\overline{\Phi_\tau}.              \tag{2}
\]

In particular |iota(s1)|_p=1 if p does not divide N. We retain (2)
and the description of alpha; they are not consequences of finite
frame linear algebra.

We construct, for every R>=0 and m>=(dN)^6(R+1), a finite indexed
family v_i in E and integer multiplicities c_i>=R satisfying (1),

\[
 \sum_i c_i\Phi_\sigma(v_i)\overline{\Phi_\tau(v_i)}
       =m\,\delta_{\sigma\tau},                                \tag{3}
\]

with one index i such that |iota(s1 conjugate(Phi_tau(v_i)))|_p=1
for EVERY tau. The same family has both properties. Multiplicities
may be zero when R=0, exactly as in the native definition.

## 2. Integral cyclotomic divisor witness

For each prime l dividing N write N=l^(a+1) M with l not dividing M,
r=N/l and A=zeta^r. We claim there is an algebraic integer V with

\[
 V\mid M,\qquad D(A-1)M=NV.                                   \tag{4}
\]

Here M is the l-free part of N, so M<=N, lM<=N, and every other
prime factor of N divides M. This choice gives all of the source's
divisibility guards at once.

To prove (4), put w=zeta^(l^a), v=w^l and
Q(X)=(X^M-1)/Phi_M(X), a monic integral polynomial. The identities

\[
 \Phi_N(X)=\Phi_{lM}(X^{l^a}),\qquad
 \Phi_{lM}(X)\Phi_M(X)=\Phi_M(X^l)
\]

give, after differentiating and evaluating,

\[
 D(w^M-1)
  =l^{a+1}\zeta^{l^{a+1}-1}\Phi_M'(v)Q(w).
\]

All cancellations here occur in E, where Phi_M(w) is nonzero,
since w has order lM. Define
V=zeta^(l^(a+1)-1) Phi_M'(v) Q(w). It is integral and gives the
equality in (4), because w^M=A.

It remains to check the important assertion V|M. The roots of Q
are the roots of unity whose orders are proper divisors of M.
Raising to the l-th power permutes each such root set. Thus Q(X)
divides Q(X^l) in Z[X]: divisibility first holds over Q, and division
by the monic integral polynomial Q has integral quotient. Hence
Q(w)|Q(v). Differentiating X^M-1=Phi_M(X)Q(X) at v gives
Phi_M'(v)Q(v)=M v^(M-1). Since zeta and v are integral units,
Phi_M'(v)Q(w), and therefore V, divide M in the ring of integers.
For M=1 this proof uses Q=1 and remains valid.

## 3. A quadratic permutation supplies a common t

Because every prime factor of N divides n, N divides n^N. In Z/N,
n is nilpotent. The function y -> ny^2+y is injective: equal outputs
give (y-z)[1+n(y+z)]=0, and the second factor is a unit, by its finite
geometric-series inverse. It is therefore surjective on this finite
ring. Choose 0<=z<N and integer e>=1 with

\[
 nz^2+z+1=Ne.                                                 \tag{5}
\]

For N>1 we may use e<=nN. Put t=1-epsilon+nz. Its conjugate is
epsilon+nz, and

\[
 t+\bar t=1+2nz,\qquad t\bar t=nNe.                           \tag{6}
\]

The second relation also yields the off-epsilon integrality needed
later. Write n^N=Nf and

\[
 \epsilon^N-(-nz)^N=(\epsilon+nz)W,
 \quad W\in\mathcal O_E.
\]

Multiplication by t and (6) give the exact identity

\[
 \epsilon^N t=N\bigl(neW+f(-z)^N t\bigr).                    \tag{7}
\]

Thus N divides epsilon^N t integrally. No inversion of epsilon is
used until we pass to a place where epsilon is a unit.

## 4. Construct the frame blocks and prove their lattice membership

For each l|N, use M_l,r_l,A_l,V_l from (4), and set b_l=M_l t/N.
For 0<=j<r_l and 0<=k,i<l define

\[
 u_{l,j,k,i}=\zeta^j
   \bigl({\bf1}_{k=0}A_l^i+b_l(A_l^i-A_l^k)\bigr).            \tag{8}
\]

The difference A_l^i-A_l^k is divisible by A_l-1 in O_E. If
epsilon belongs to w, equation (4) therefore makes
D b_l(A_l^i-A_l^k) integral at w, and the first term of D u is
integral as well. If epsilon does not belong to w, (7) makes
epsilon^N b_l integral, so epsilon^N u is integral; epsilon is
a local unit and hence u is integral. This proves exactly (1)
for every vector in (8), at ALL finite places including those
above 2. It is stronger than a check only away from N.

The baseline family zeta^j, 0<=j<N, also satisfies (1).

## 5. Exact block orthogonality

Fix embeddings sigma,tau, and put A_sigma=Phi_sigma(A_l) and
A_tau=Phi_tau(A_l). Both are primitive l-th roots. They have zero
geometric sum. Since b_l lies in K, it has the same value at these
embeddings. Expanding the k,i sum of the parentheses in (8) gives

\[
 \sum_{k,i}
 [({\bf1}_{k=0}+b_l)A_\sigma^i-b_lA_\sigma^k]
 \overline{[({\bf1}_{k=0}+b_l)A_\tau^i-b_lA_\tau^k]}
 =l\,{f1}_{A_\sigma=A_\tau}
      (1+b_l+\bar b_l+2l|b_l|^2).                            \tag{9}
\]

For example the first square contributes
(1+b_l+bar b_l+l|b_l|^2) sum_i A_sigma^i bar A_tau^i;
the final square contributes l|b_l|^2 times that same sum, and
both cross terms vanish because sum_i A_sigma^i=0. This proves
(9) without assuming sigma=tau in advance.

If A_sigma=A_tau, the ratio Phi_sigma(zeta)/Phi_tau(zeta) has
r_l-th power one. Summing its j-th powers for 0<=j<r_l gives
r_l when sigma=tau and zero otherwise: equality of the zeta
images would force equality of the embeddings. Combining this
with (6) and (9), the l-block has frame constant

\[
 C_l=N+M_l\bigl[1+2n(z+lM_l e)\bigr].                        \tag{10}
\]

Let C=sum_(l|N) C_l. The union of these blocks has frame constant
C. The baseline zeta-powers have frame constant N by their ordinary
geometric sum.

For any prime q|N, every term of C modulo q vanishes except the
one indexed by l=q: N vanishes, M_l contains q when l!=q, and
n contains q. Consequently

\[
 C\equiv M_q\not\equiv0\pmod q,\qquad \gcd(C,N)=1.           \tag{11}
\]

## 6. Meet the prescribed length, keeping all multiplicities

For N>1, n+1<=d, z<N, e<=nN and lM_l<=N imply

\[
 C_l\le3d^2N^3,\qquad C\le3d^2N^4,\qquad C+N\le4d^2N^4.
\]

The number of different prime factors is at most N, which is
sufficient for these deliberately coarse original-budget bounds.
It follows that

\[
 R(C+N)+(N-1)(C-1)
 \le4d^2N^5(R+1)\le(dN)^6(R+1)\le m.                       \tag{12}
\]

Set m'=m-R(C+N). By (11), choose 0<=A<N such that AC=m'
modulo N. Then
m'-AC>=-(N-1)>-N by (12). It is a multiple of N, so it is
nonnegative. Thus m'=AC+BN with A,B>=0. Give every block vector
multiplicity A+R, and every baseline vector multiplicity B+R.
Its length is precisely

\[
 (A+R)C+(B+R)N=m,
\]

and all multiplicities are >=R, proving (3). This explicit coin
argument supplies the native nonnegative witnesses rather than
an asymptotic assertion about attainable lengths.

For N=1, use the single vector 1 with multiplicity m. The same
conclusion follows directly, including the unit condition by (2).

## 7. One vector is a unit at every required embedding

If |iota(s1)|_p=1, the baseline vector 1 already has the required
property. Otherwise (2) forces p|N. More importantly, for EACH
phi_tau it forces epsilon to belong to the induced place: the
other branch of alpha in (2) would have absolute value one.

Choose l=p and the SINGLE vector

\[
 u=u_{p,0,1,0}=\frac{tM_p}{N}(1-A_p).
\]

Equation (4) says Du=-t V_p. At every induced place under
consideration, epsilon and n lie in the maximal ideal, so
t=1-epsilon+nz is a unit. Also V_p|M_p and p does not divide M_p,
so V_p is a unit. The same identity (2) now gives

\[
 |\iota(s_1\overline{\Phi_\tau(u)})|_p
     =|\phi_\tau(Du)|_p=|\phi_\tau(-tV_p)|_p=1
 \quad\hbox{for every }\tau.                                \tag{13}
\]

The index (p,0,1,0) exists even at p=2. It does not depend on
tau. Neither the family nor its multiplicities are reselected
to prove this property. This is the precise last quantifier in
`exists_isTightFrame`.

## 8. Substitute into the actual vacuum and local-jet consumers

For fixed p, character RUN61 takes M=p(dN)^6+1 and frame length
m=M^2, R=0. Then p does not divide M and m>=(dN)^6, so the
construction above supplies its frame. Repeating vectors according
to their multiplicities gives the version with all multiplicities
one. Every occurrence retains the same frame and its exact length.

With delta_frame=M, its finite vacuum expansion has cardinal
M^(4fr), a p-adic unit. In the exact expansion of the SAME
integral vacuum, the coefficients are

\[
 (\mathrm{multiplier}/M^{4fr})\,
     \mathrm{intVacuum}(\mathrm{finVec}(y_j)).
\]

The previously proved integral-vacuum estimate makes each coefficient
integral. Clearing the remaining rational torsion denominators by
q prime to p leaves both M^2 and qM^2 prime to p. The frame
product formula therefore gives exactly the source thetaProducts
at the specified jet radius. The bounded functional argument then
passes from those products to the valuation-ring span defining
standardData, with no factor counting expansion terms in the
ultrametric estimate. Apply it to the actual projected Schur jet
functional in `Data.IsGoodDatum.mem_raises`.

This removes general tight-frame existence from that consumer's
retained inputs. It does not remove the separately required
Appell–Humbert/theta-space dimension and duality, CM period identity
(2), theta-product jet integrality, local Hecke identities, or their
independent audits. The p-unit denominator is M, rather than N;
using the original N-frame alone would fail at primes dividing N.

Validation: source and definition reads, mathematical expansion of
(4)–(13), and `git diff --check`. No new Lean, scalar certificate,
whole-proof verification, or RH completion is asserted. The latest
primitive native receipt remains the six successful named checks
and the A-module timeout reported separately.
