import Lib.Cyclotomic.OddSha.OddShaBound
import New.Selmer.FitTwistsExist

/-!
RUN52, 26 Nov 2026. Human derivation of the two remaining arithmetic
interfaces from RUN51. Native audit PREPARED, not executed. Source:
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact;
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission blob 0abe4d55e789dd229081d1161cb7736895fe9885, unified witness
blob 7ad9c7c64f53c621ad20422226ad9d0b756ee28e; peer aggregate twist
86f773b9b3e66c028b6908705b5f84c9b258bb3b and all-layer pencil
811526f27f2c148e64b594c68579c58861d85bc6 read, not rederived.
This closes a human exposition gap upstream of the common fit-family
budget, not the remaining determinant primitive suppliers.

SOURCE LEDGER (actual declaration bodies retrieved):
Lib/Cyclotomic/Kolyvagin/ComponentBound.lean
61d0f229eda03e81c8d89372f05f7444ca45b09b, lines 29-195:
exists_kolyvagin_cocycles, local rigidity and Frobenius identities.
Lib/Cyclotomic/Stickelberger/GaussSums.lean
b242e0965fdabcf6a8dcc3da33511507bf8bd4bf, lines 96-end:
exists_jacobi_family (proved native body, not a literature axiom).
Lib/Cyclotomic/OddSha/OddShaBound.lean
71e1148ba135da7530abe211af57ba8a0d63f195, lines 19-69:
exists_detecting_points_cocycles; actual caller exists_length_shaOdd_le.
New/Selmer/FitTwistsExist.lean
da769eba595af2f883eed9b82dbd322a521aea14: same uniform budget.
New/Endgame/LongForms.lean 9eff36cf503ac398fbd24361e80e95a03d0b0e05:
same fit-family, no new independent determinant witness.
Static body dependencies only, retain old and new graph/axiom evidence.

1. DERIVATIVE CONSTRUCTION AND SHIFT INVARIANCE (source lines 64-130).

Use additive notation for multiplicative algebraic numbers. Let m=l^n
(n=0 is trivial), M0=N m, S a subset of the native finite prime set P,
M=M0 prod(S). Every q in P is 1 mod c M0 and the prime p is 1 mod
M0 prod(P); choose the same place B over p. All q are distinct from p
and prime to M0. Use the actual Jacobi family J on torsion indices
x in Q/Z of denominator dividing M. Its properties from the native
exists_jacobi_family are:
(i) sum over b mod q of J(x+b/q)-J(qx) is torsion for q|M',
    c prime to q, M' an admissible multiple of the denominator;
(ii) sigma J(x)=J(a_sigma x), a_sigma cyclotomic action;
(iii) J(x) is a unit at every place not over p;
(iv) ord_B J(x)=floorDiff c x, denoted f(x);
(v) archimedean absolute values one;
(vi) J(x+b/q)-J(x) is principal-unit at every place over q
    when q|p-1.
The source proves this family using Gauss sums; do NOT assume the
Jacobi family as a bare consequence of a named paper. Its actual
construction is retained as an immediate supplier to expand next.

Choose y_x with m y_x=J(x) for every index, and an identification
mu: Z/m -> mu_m in additive notation. For a fixed native gamma put
mu(F_g(x))=gamma y_x-g gamma g^-1 y_x.
The right side is m-torsion by equivariance and abelian cyclotomic
action; changing the choice of y_x adds a root of unity on which the
two automorphisms agree. Thus F is well-defined. For any admissible
q, the element sum_b y_(x+b/q)-y_(qx) is torsion, since its m-fold
multiple is torsion. Applying gamma-g gamma g^-1 kills all torsion
(automorphisms commute on ALL roots of unity), so
  sum_b F_g(x+b/q)=F_g(qx).                         (D)
Choose surjective discrete logarithms L_q:(Z/q)^* -> Z/m, possible
as m|q-1, and define the actual derivative functional
  Lambda_S(d)F =
    sum_a a^e psi(a) sum_(u_q units) prod_q(L_q(u_q)-d_q)
      F(a/M0+sum_q u_q/q).
All values are mapped into O/l^n. The a sum is over (Z/M0)^*.
For a cyclotomic unit b, changing all variables by multiplication
by b gives
  w(b) Lambda_S(d)(F(b x))
       = Lambda_S(d+L(b))F, w(b)=b^e psi(b).        (C)
Here d+L(b) is the coordinatewise sum. The finite base character
factor is evaluated on the base component only; b must be a unit
at the base and each q in S. This is the source H identity.

Induct on |S| to show Lambda_S(d)F_g independent of every d_q.
Changing one d_q changes the result by a scalar multiple of
  Lambda_(S-q)(d') [sum_(u units)F_g(x+u/q)]
   = Lambda_(S-q)(d') [F_g(qx)-F_g(x)].
Use (C), q=1 mod M0, and the shift-invariance induction hypothesis
on S-q, since q is a unit at all its other primes. This vanishes.
Changing the finitely many coordinates proves shift invariance
without dividing by any group order, even l=2. This is native hE.

2. COCYCLE AND RAMIFICATION (source lines 130-153).

For g,h, insert g gamma g^-1 y_x between the two terms defining
F_gh. The equivariance of J says g^-1 y_x differs from y_(a_g^-1 x)
by an m-th root of unity; gamma-h gamma h^-1 kills this difference.
Consequently
  F_gh(x)=F_g(x)+a_g F_h(a_g^-1 x).
Apply (C) and shift invariance:
  kappa_S(gh)=kappa_S(g)+a_g^(e+1) psi(a_g) kappa_S(h),
where kappa_S(g)=Lambda_S(0)F_g. This has exactly the native
cycPowDirichlet(l,e+1,psi) action on m-torsion. Local constancy
follows because the finite list of algebraic numbers used here,
including their conjugates and roots, has finite Galois orbits.
F_gamma=0, hence kappa_S(gamma)=0.

At any place A over r outside l,p,S, for g in inertia over Q(mu_N),
g fixes all the M-th roots: it fixes N by hypothesis and fixes the
prime-to-r roots of order m prod(S) by inertia rigidity. Thus
g^-1 y_x-y_x belongs to mu_m. Since y_x is a local unit (m y_x=J(x),
J unit away from p), this difference is principal-unit and is zero:
reduction injects mu_m for r!=l. Now
mu(F_g(x))=(1-g)gamma y_x is principal-unit as gamma y_x is a unit
at A as well; injectivity gives F_g(x)=0. This proves the precise
native inertiaOff condition, not a stronger assertion at l or p.

3. BOTTOM AND FROBENIUS-TO-INERTIA (source lines 124-190).

Bottom: S empty. At B over p choose r0 with m r0=p in additive
notation (the p uniformizer), and tame inertia tau with
tau r0-r0=mu(1). The local unit y_x-f(x)r0 and prime-to-p root
rigidity show tau y_x-y_x=f(x)mu(1). The same calculation for
gamma y_x (whose m-fold multiple is J(a_gamma x)) gives
  F_tau(x)=a_gamma f(x)-f(a_gamma x).
Indeed tau fixes M0 roots and the correction between gamma y_x
and y_(a_gamma x) lies in mu_m. Thus if kappa_empty kills inertia,
multiply its value at tau by w(a_gamma) and use (C) with no q:
  (a_gamma w(a_gamma)-1) sum_a w(a)f(a/M0)=0.
This is exactly the native bottom Stickelberger implication,
including its factor cycPowDirichlet(e+1)(gamma)-1.

Transition: take q in P-S and A over q, phi an arithmetic
Frobenius of exponent q. Choose u0 in (Z/q)^* with L_q(u0)=1,
and inertia tau with cyclotomic action u0^-1 on mu_q (possible
by local cyclotomic ramification) and trivial action on mu_M.
Use the same tau for all x with Mx=0 and M=M0 prod(S).
Write L(u) for integer lifts of the discrete logs, y_u=y_(x+u/q),
and Y=y_x. In the additive multiplicative group define
  t_u=tau y_(u0 u)-y_u in mu_m,
  t_phi=phi Y-y_(qx) in mu_m,
  T=sum_(u units) L(u)t_u - t_phi,
  D=sum_(u units) L(u)(y_(u0 u)-y_u) - (q Y-y_(qx)).
By inertia and Frobenius acting on residue units, T-D is
principal-unit at A. To transport this congruence under gamma,
one must prove it at EVERY place over q, not just A.
Reindex u by u0u. L(u0^-1 u)-L(u)=-1 mod m; sums of the
coefficients vanish exactly (permutation). By property (vi),
m(y_u-Y)=J(x+u/q)-J(x) is principal-unit at every such place.
Therefore D is congruent at ALL those places to the torsion
element
  D0=y_(qx)-sum_(b mod q) y_(x+b/q).
It is torsion by (i). Since T itself is torsion, T-D0 is a
root of unity principal-unit at A and hence has q-power order
(the prime-to-q root reduction map is injective). It is
principal-unit at every place over q. Consequently T-D is
principal-unit at every place over q. In particular gamma(T-D)
is principal-unit at A. No false commutation of gamma with a
fixed valuation is used.

Now reduce the defining mu(F) at A. For tau inertia,
  mu(F_tau(x+u/q)) = gamma(y_u-y_(u0u)+t_u) mod principal units,
using tau^-1 t_u=t_u. For arithmetic Frobenius phi,
  mu(F_phi(qx)) = gamma(y_(qx)-qY+t_phi) mod principal units,
since phi acts by the q-th power on residues, and q phi^-1
acts identically on mu_m. Subtract the two after multiplying
the first by L(u) and summing: the difference is gamma(T-D).
Both sides lie in mu_m, so the congruence is equality by
prime-to-q rigidity:
  sum_(u units) L(u) F_tau(x+u/q)=F_phi(qx).          (FI)
Apply Lambda_S(0), then (C) and shift invariance; q=1 mod M0
implies w(q)=1. The resulting equality is precisely
  kappa_(S union {q})(tau)=kappa_S(phi).
This proves the local transition for the actual same family
of derivative cocycles, with all native q, S, A, phi quantifiers.
It is the substantive Kolyvagin supplier needed by the RUN51
reciprocity/descent, conditional on the actual Jacobi family
and standard local cyclotomic and residue facts, not RH.

4. UNIFORM SMALL-PRIME DETECTION (actual OddShaBound lines 19-64).

Independent shorter human proof of the SAME statement, with
its original y^20 bound. Let M=N l^2, K=Q(mu_M), d=[K:Q]<=M.
K is totally complex since M>=4. Fix one set of representatives
of G_E/G_K (at most d). By global class field theory the maximal
abelian pro-l quotient A_K of G_K unramified off l fits into
  prod_(v|l) U_v^1 -> A_K -> Cl(K)[l^infty] -> 0.
This follows by inverse limit of ray class groups with modulus
supported over l and taking pro-l parts; the local residue-unit
orders are prime to l. No Leopoldt conjecture. The local principal
units have Z_l rank [K_v:Q_l] and cyclic finite l-power torsion:
the local logarithm on a sufficiently deep subgroup gives the
rank, and finite subgroups of a field's multiplicative group
are cyclic. Hence the image of the product is generated by at
most d+#(v|l)<=2d elements, including at l=2. The class-group
l-primary part needs at most log_2 h_K elements. Lift generators
of both to G_K, retaining a fixed list independent of coefficient
ring, twist exponent and depth.

For clarity the required numerical bound does not need analytic
class-number estimates. Cyclotomic discriminant |disc K|<=M^d;
Minkowski gives an integral representative per class of norm
<=sqrt(|disc K|) (the Minkowski prefactor <=1, since d is even,
at least d/2 factors of d!/d^d <=1/2). Thus with B=M^(d/2),
  h_K <= # {ideals of norm <=B} <= B^2 zeta_K(2)
      <= M^d zeta(2)^d <= (2M)^d.
The Euler-factor comparison follows from at most d primes above
each rational prime with residue degrees >=1; zeta(2)<2 by the
integral test. Thus log_2 h_K<=d(1+M). The representatives plus
lifts give a finite set s of size <= d+2d+d(1+M)<=M^2+4M.
When N<=y, l<=y^2, y is an integer >=2 and M<=y^5; hence
  |s| <= y^10+4y^5 <= y^20.
No need for a sharper bound; retain source y^20 in the caller.

For every n,e,O and cocycle z in the actual Tate-twisted Selmer
module unramified off l, assume z kills s. Induct on k with
l^k z=0, starting at k=0. Apply induction to l z (it obeys
the same linear cocycle/local conditions and kills s). Hence
l z=0. The twist action of G_K on l-torsion is trivial since
K contains mu_l; therefore z|G_K is a continuous additive
homomorphism with l-torsion image, unramified off l. It factors
through A_K and kills its chosen generators, thus is zero.
For arbitrary g in G_E write g=h r with h in G_K and chosen
coset representative r. The cocycle identity gives z(g)=0.
Take k=n. This is the exact uniform detector, not merely a
bound on H^1 classes or on a fixed coefficient field. It supplies
the small-prime branch in exists_length_shaOdd_le; using the
RUN50/51 construction and retained large-prime descent, keep
the original common budget h_E prod_(0<e<t)(16 phi(N) X_e^2)^(y^20)
and size 2^(4y^27) h_E. No change to the fit family or its
actual common determinant consumer.

PROVENANCE: Milne, Class Field Theory, ray class groups Thm 1.5
and global existence/reciprocity, course page
https://www.jmilne.org/math/CourseNotes/cft.html
and accessible edition text https://www.math.ucsd.edu/~csorense/teaching/math204B_W19/Milne_CFT.pdf .
Minkowski bound standard; local log and cyclic torsion argument
given above. Rubin, Kolyvagin's System of Gauss Sums (1991)
https://doi.org/10.1007/978-1-4612-0457-2_14 (publisher abstract
accessed; not a proof of the exact twisted cocycle statement).
Banaszak-Gajda, Euler systems for higher K-theory (1996)
https://doi.org/10.1006/JNTH.1996.0075 (bibliography checked,
not a blanket proof of native quantifiers). Source REFERENCES.md
bc5207de20acf124d1f70c078a5157be639089b1 retained.
No new conjectures; Jacobi-family derivation still a retained
human proof obligation; local CFT and cyclotomic inertia are
explicit standard inputs. The common arithmetic supplier now has
a human route through bottom, derivative, reciprocity, Fourier,
and small-prime detection. The full A/B/C human proof is incomplete.
Native execution: local command -v lean/lake found neither.
Actual repository Actions query: compute 45803534769 and
orchestrator 45803534775 in progress at retrieval, earlier
45803276562 cancelled. No new native PASS, no old engine reuse
across incompatible pins. Prepared commands below audit source
declarations, not this human derivation. No test counts invented.
No global pruning assertion or deletion of dependency edges.

RESUME HERE: expand actual GaussSums.exists_jacobi_family into the
Gauss-sum Galois-equivariance, Stickelberger local valuation and
torsion distribution proof (lines 50-155), especially the exact
floorDiff normalization at every split place; then integrate with
RUN50/51/52 and the common fit-family caller. Check latest peer
results first; all primitive suppliers still required.
HANDOFF TO: integration/editor, math C, independent audit and shared
native runner. Use the FI identity and uniform detector in the
one-witness manuscript, with explicit Jacobi and local guards.
-/

#check exists_jacobi_family
#check exists_kolyvagin_cocycles
#check exists_detecting_points_cocycles
#check exists_length_shaOdd_le
#check exists_isFitFamily
#print axioms exists_jacobi_family
#print axioms exists_kolyvagin_cocycles
#print axioms exists_detecting_points_cocycles
#print axioms exists_length_shaOdd_le
#print axioms exists_isFitFamily
