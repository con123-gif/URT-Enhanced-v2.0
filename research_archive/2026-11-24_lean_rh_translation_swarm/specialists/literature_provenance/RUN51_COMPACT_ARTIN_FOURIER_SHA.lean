import Lib.Cyclotomic.OddSha.OddShaBound
import New.Selmer.FitTwistsExist

/-!
RUN51, literature provenance, 26 Nov 2026. HUMAN SOURCE-MATCHED
RECONSTRUCTION; native audit PREPARED, not executed. Compact pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude. Mission blob
23f64d503b7d64bb13b9667156b499021038d742; expanded workload, no URT.
Read current manuscript and integration d18891b2138fc3bab822cb3246aca56ba0af193a,
which already proves nonunit removal, annihilation and descending detection
at the retained interfaces. This run independently reviews that chain and
fills its Artin, mod-l reciprocity, Fourier and weight-zero interfaces.
Recent peer head d93adfe1a30e583e8a37530d6fa1e00ed27b7b2a.
No change to main manuscript, old graphs, axiom evidence, or runner.

SOURCE LEDGER (actual source bodies retrieved):
Lib/Cyclotomic/Kolyvagin/ComponentBound.lean 61d0f229eda03e81c8d89372f05f7444ca45b09b:
 artin_law_component -> reciprocity_mod_ell, nsmul_component_eq_zero;
 reciprocity_mod_ell -> exists_detecting_points_component.
Lib/Cyclotomic/Kolyvagin/Components.lean fbd540929083786c70247cfeace76a5ae9454547:
 exact inverse-character component, vanishing at c and on specified local sets.
Lib/ClassField/Global/ArtinReciprocity.lean 72cbcb94dd0762e91178fe6c0d04acb0e642414b:
 char_artinMap_principalIdele_eq_one, actual proof not bare premise.
Lib/ClassField/Places/SelmerDefs.lean ce10f7c03f6155db4ccd49bc228eb03bc23e2347:
 shaLocalSet, shaOdd.
Lib/Cyclotomic/OddSha/OddShaBound.lean 71e1148ba135da7530abe211af57ba8a0d63f195:
 exists_length_shaOdd_le, internal hZ/hPhi, weight-zero case.
Lib/Cyclotomic/Stickelberger/GaussSums.lean b242e0965fdabcf6a8dcc3da33511507bf8bd4bf:
 exists_jacobi_family and distribution law, retained supplier.
New/Selmer/FitTwistsExist.lean da769eba595af2f883eed9b82dbd322a521aea14:
 consumes same uniform budget; New/Endgame/LongForms.lean
 9eff36cf003ac398fbd24361e80e95a03d0b0e05 consumes same fit family.
Static body edges only; no claim of full kernel graph or native pruning.

1. ARTIN LAW, actual finite-level interface.
Let G=G_Q, H=G_{Q(mu_{Nm})}, U=cyc_l^e psi, x a component
cocycle for U^{-1} with m x=0. The restriction to H is a continuous
additive homomorphism, since U(h) acts trivially on m-torsion (finite
cyclotomic character reduction in source). Let a=1 mod N prime to l,
d=2(a^e-1), and take any additive character lambda of the finite
coefficient group into Q/Z. Apply global reciprocity to lambda(d x)|H.
At l, pick delta in inertia with U(delta)=a^e. For g in the
decomposition group intersect H, [delta^{-1},g] is in the same
decomposition group, fixes N, and has cyclotomic character 1 because
the cyclotomic character is abelian. Thus x([delta^{-1},g])=0 by the
component local condition. The cocycle identity, using U(g)=1 ON
m-torsion, gives x([delta^{-1},g])=(a^e-1)x(g).
So lambda(d x) kills the decomposition group over l.
At any other finite place it kills inertia over K=Q(mu_{Nm}).
At infinity a complex conjugation in H has order 2; its image under
x|H is killed by 2, which is why d contains 2. No inversion of 2.
For y in K^* as in artin_law_component, the source hypothesis at
each place away from l,q is either x kills the decomposition group
or y/r^m is a unit with r fixed by inertia over K. In the second
case r is in the maximal unramified local extension, so its valuation
in the base uniformizer normalization is integral, and ord(y) is
a multiple of m. The local unramified Artin value therefore contributes
zero as m x=0. These cover all non-q places, including l and infinity.
At q=1 mod Nm, q splits completely in K. The places above q are
indexed by u in (Z/Nm)^*, and k_u=ord_B(s_u y) is integral.
The conjugate Frobenius is s_u^{-1} phi s_u. The cocycle relation on H
gives x(s_u^{-1} phi s_u)=U(s_u)x(phi)=u^e psi(u)x(phi),
where the latter equality is on m-torsion. Global principal-idele
reciprocity now gives lambda(d sum_u k_u u^e psi(u) x(phi))=0.
All additive characters separate the finite group, so
  (sum_u k_u u^e psi(u)) * 2(a^e-1) * x(phi)=0.
Exactly the native conclusion, with integer valuation coefficients,
all finite-level, split-prime and local guards retained. No
independent choice of y or phi after applying the law.

2. MOD-l RECIPROCITY, actual caller of 1.
Let m=l, q=1 mod Nl, and kappa be the U_+=cyc_l^(e+1) psi
cocycle in finite O-module M, killed by l, vanishing on inertia over
Q(mu_N) off l and T. Keep source condition: x kills decomposition
groups at places over T other than q, and d x(phi) != 0. Also
phi(Nl) is a unit in O, as required by the source. Let tau be any
inertia element at B over q and v=kappa(tau). Assume v != 0.
The cyclic O-module Ov is an F_l vector space. Choose a basis b_i and
extend its coordinate homomorphisms to the l-torsion of M; embed F_l
in mu_l by a choice zeta. For each coordinate lambda_i, restriction
of kappa to H=G_{Q(mu_{Nl})} is a homomorphism (U_+ acts trivially
there). Kummer/Hilbert 90 yields r_i in Qbar^* with
  g(r_i)/r_i = zeta^{lambda_i(kappa(g))} for g in H,
and y_i=r_i^l belongs to K^*. Away from l,q, the alternative in 1
holds: at places not over T inertia fixes r_i; at the remaining
places x kills the decomposition group. Apply 1 to each y_i and
write k_i(u)=ord_B(s_u y_i), A_i=sum_u k_i(u)u^e psi(u).
Thus A_i d x(phi)=0; each A_i is in the maximal ideal of O,
since d x(phi) is nonzero and a unit cannot annihilate it.
Choose pi with pi^l=q and tau(pi)/pi=zeta^j. Since q != l,
mu_l injects into the residue field. The element
s_u r_i / pi^{k_i(u)} is a local unit, so its inertia quotient
reduces to 1. This gives exactly
  j k_i(u) = u lambda_i(kappa(s_u^{-1} tau s_u)) in F_l.
Here the factor u is the cyclotomic action on zeta. Since tau is in H,
kappa(s_u^{-1} tau s_u)=U_+(s_u)^{-1}v; this lies in Ov,
so the extended coordinates agree with the basis coordinates.
Reassemble the vector, using U_+(s_u)=u^{e+1}psi(u) on l-torsion:
  u^e psi(u) sum_i j k_i(u)b_i = v.
Summing over u gives
  phi(Nl) v = sum_i j A_i b_i in maximalIdeal(O) * Ov.
Since phi(Nl) is a unit and Ov is cyclic, this says v=r v for
some r in the maximal ideal; 1-r is a unit, so v=0, contradiction.
This is the native reciprocity_mod_ell at the same x, phi, tau and
kappa. It supplies J(T)->J(T union {q}) in the integration descent
only when w kills the old decomposition groups and detects q.
No arbitrary-prime extension, no division by j, no assumption that
O is the prime field.

3. EXACT FOURIER BRIDGE, actual internal hZ/hPhi in OddShaBound.
Let E CM in Q(mu_N), H_E=G_E normal in G, c=complex conjugation.
Let x in shaOdd for e>0: a cocycle on H_E for cyc^{-e}, unramified
off l, zero on decomposition intersect ker cyc above l, and
x(cgc^{-1})=-x(g). For g in G write B(g)=cgc^{-1}g^{-1} in H_E.
Choose representatives s_t of G/G_{Q(mu_N)} indexed by
t in (Z/N)^*, with s_1=1, as in source S(t)/S(1).
For each character psi put U=cyc^e psi and
  T(u,g)=U(u) x(u B(g) u^{-1}),
  z_psi(g)=sum_t T(s_t,g).
If u'=h u with h in G_{Q(mu_N)}, then h in H_E and
cyc(B(g))=1; the cocycle rule yields
x(h u B(g)u^{-1}h^{-1})=cyc(h)^{-e}x(u B(g)u^{-1}).
Since psi(h)=1, T(u',g)=T(u,g).
The commutator identity B(gh)=B(g) g B(h)g^{-1} and cyc(B(g))=1
give T(u,gh)=T(u,g)+U(g)^{-1}T(ug,h).
Reindex representatives to obtain z_psi(gh)=z_psi(g)+U(g)^{-1}z_psi(h).
Local constancy follows from the finite sum, continuous conjugation
and locally constant x and finite-level coefficients. B(c)=1
implies z_psi(c)=0. For g in G_{Q(mu_N)} in the specified inertia
off l, or decomposition at l with cyc(g)=1, both conjugates of g
and of cgc^{-1} belong to the corresponding vanishing local sets
on H_E; thus every x(u B(g)u^{-1})=0. This proves z_psi is in
the native component, not just a formal Fourier vector.
Since O contains roots of unity of the exponent of (Z/N)^* and
is a characteristic-zero domain, sum_psi psi(t)=phi(N) if t=1
and 0 otherwise. The identity holds in O before reducing mod l^n;
there is no division by group order. For g in H_E,
  sum_psi z_psi(g)=phi(N) x(B(g))=-2 phi(N)x(g).
From z_psi(c)=0, z_psi(cgc^{-1})=U(c)^{-1}z_psi(g).
If every odd component z_psi vanishes, the even ones have unchanged
value under c-conjugation. Subtract the two Fourier sums to obtain
  4 phi(N) x(g)=0.
This is the actual hPhi and retains l=2 and l dividing phi(N).
Combining with component annihilation 4X^2 (peer derivation, RUN50
Stickelberger supplier) applied to 4X^2 x gives
  16 phi(N) X^2 x=0.
For l large, 4phi(N) is a unit, so the same identity transports
component detecting points to detecting points of x. For each
psi and each native detecting point g, evaluate x at ALL s_t B(g)s_t^{-1}.
No independent witnesses for component and original family.
At most phi(N)^2 (v_l(X)+1) evaluations; retain the actual bound
y^20 in exists_length_shaOdd_le, not a new improved constant.

4. WEIGHT ZERO AND LENGTH ASSEMBLY.
For e=0 the shaOdd definition has no oddness condition; the twist
is trivial and the local conditions say unramified at every finite
place. E is CM, so no real infinite obstruction. Continuous
homomorphisms factor through the ideal class group by unramified
class field theory. Write its finite abelian group as a product
of cyclic groups of orders d_i with product h_E. A homomorphism
into O/l^n is exactly a tuple in annihilators of d_i. In a DVR
each such annihilator has O-length min(v_O(d_i),v_O(l^n)).
Thus length <= sum v_O(d_i)=v_O(h_E) without any inversion of 2.
For e>0, if A=16phi(N)X_e^2 kills the module and r evaluations
detect it, inject it into the direct sum of r copies of the
A-annihilator in O/l^n. Length <= r v_O(A). The peer large-prime
descent gives r<=y^20; for small primes retain the actual native
ray-class detecting-point theorem with its uniform y^20, not an
assumption about bounded l-adic field degree. Then the same integer
  H=h_E product_{0<e<t} (16phi(N)X_e^2)^(y^20),
y=N+t+3, bounds the length by v_O(H) for every l,e<t,n,O
with the actual root-of-unity hypothesis. RUN50 proves the original
size bound H<=2^(4y^27) h_E. This is the uniform budget at the
actual exists_isFitFamily consumer, conditional only on the remaining
explicit suppliers, not a claim of independent closure of Theorem C.

PROVENANCE/STATUS:
Global reciprocity and local units/Frobenius: Sharifi, Algebraic
Number Theory Ch10, sections 10.4-10.5,
https://www.math.ucla.edu/~sharifi/notes/algnum-ch10.html
(text accessed this run). Hilbert 90 and Kummer standard statements;
no new literature axiom. Rubin, Euler Systems (2000), publisher
https://press.princeton.edu/books/paperback/9780691050768/euler-systems
confirms monograph, NOT exact component statement. Greither (1992)
https://aif.centre-mersenne.org/item/AIF_1992__42_3_449_0/
confirms bibliographic source, NOT an independently checked
all-prime finite-level bound. Native REFERENCES.md
bc5207de20acf124d1f70c078a5157be639089b1 lists Rubin III.4 and Greither
as compared by its authors; no substitution of their bibliography
for the actual source derivations. Standard global Artin and Kummer
are invoked at the stated hypotheses. The Gauss-sum derivative
construction exists_kolyvagin_cocycles and small-prime ray-class
generator theorem remain explicit dependencies. Peer descending
proof reviewed: correct use of two simultaneous Chebotarev detections,
provided the retained reciprocity and derivative interfaces hold.
No assertion that each source axiom closure has been independently
replayed. No tests of surrogate finite groups or numerical RH evidence.
Local command -v lean/lake returned no executables; checked actual
latest GitHub Actions status, compact kernel worker 15c60307e reports
resource block, recent orchestrator runs 45789891123 cancelled and
45794078905 pending at retrieval. These are not native compact PASS.
Old engine CI is from incompatible pin; no claim of executing it here.
The following commands are prepared for the existing shared compact
runner. They audit actual declarations, not a machine proof of this
human exposition. All old and new original dependency edges retained.
Reduced exposition groups four explicit arguments; no global deletion.

RESUME HERE: reconstruct exists_kolyvagin_cocycles from the Jacobi
family using the actual Lambda derivative and principal-unit rigidity
identities (in particular the Frobenius-to-inertia identity), then
exists_detecting_points_cocycles from the ray-class index and
Minkowski class-number count. Both are now precisely isolated from
the Artin/Fourier/e=0 interfaces. Inspect current peers first.
HANDOFF TO: integration/editor, math C, independent audit and kernel.
Use sections 1-4 in the current manuscript at section 6f; retain all
original source premises and native replay gates.
-/

#check artin_law_component
#check reciprocity_mod_ell
#check exists_kolyvagin_cocycles
#check sum_floorDiff_dvd
#check nsmul_component_eq_zero
#check exists_detecting_points_component
#check exists_detecting_points_cocycles
#check exists_length_shaOdd_le
#check exists_isFitFamily
#print axioms artin_law_component
#print axioms reciprocity_mod_ell
#print axioms exists_kolyvagin_cocycles
#print axioms exists_detecting_points_component
#print axioms exists_detecting_points_cocycles
#print axioms exists_length_shaOdd_le
#print axioms exists_isFitFamily
