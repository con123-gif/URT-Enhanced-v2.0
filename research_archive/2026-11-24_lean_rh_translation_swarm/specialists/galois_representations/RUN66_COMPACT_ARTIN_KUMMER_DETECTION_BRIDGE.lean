import Lib.Cyclotomic.Kolyvagin.ComponentBound
import Lib.Cyclotomic.OddSha.OddShaBound

/-!
RUN66 (2026-11-27), Galois lane. HUMAN SOURCE-MATCHED DERIVATION,
independent audit and native replay pending. Not a new RH proof.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Pin lsernau/grh-lean 72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Source grh-compact/src/Lib/Cyclotomic/Kolyvagin/ComponentBound.lean
blob 61d0f229eda03e81c8d89372f05f7444ca45b09b, actual declarations
artin_law_component, reciprocity_mod_ell, not_cycloGalGroup_le_zeroSubgroup,
nsmul_component_eq_zero, exists_detecting_points_component.
OddSha/OddShaBound.lean blob 71e1148ba135da7530abe211af57ba8a0d63f195,
exists_length_shaOdd_le is the actual consumer.
Voronoi/StickelbergerInteger.lean 8745d5ed91856758a39027c95fbc0b97087005be.
ClassField/GaloisCohomology/TameCocycles.lean 0c8ac30cf6a6b0307f199f1a1594245729ff49bf.

Read latest mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10,
AGENTS, protocol, handoff, expansion, RUN65, latest HUMAN_PROOF_COMPACT
section 6f and recent commit listing. Completion-first amendment
takes precedence: §6f already contains Voronoi cancellation, Gauss-sum
derivatives, the annihilator and descending induction. Do not duplicate
those results. This checkpoint supplies the retained exact Artin law
and its mod-ell Kummer consumer; these are not interchangeable with
a generic Selmer reciprocity inequality.

1. Artin law via one finite abelian quotient, avoiding scalar separation.
Use the actual component x with action chi^{-1}, chi=cyc^e psi,
m x=0, and the native local vanishing conditions. Let H=G_K,
K=Q(mu_{Nm}), d=2(a^e-1), a=1 mod N prime to ell. H acts trivially
on the values of x, so x|H and f=d x|H are continuous homomorphisms
into the finite additive coefficient group (killed by m).
The commutator identity, for g in H and any s, is
    x(s g s^{-1})=chi(s)^{-1} x(g).
This follows by expanding the cocycle three times and cancelling the
two x(s) contributions, since g acts trivially. At a place over ell
take delta in inertia with chi(delta)=a^e, supplied by the native
exists_inertia_cycPowDirichlet_eq. For g in H intersect D_A, the
commutator delta^{-1} g delta g^{-1} is in D_A intersect the kernel
of the cyclotomic action modulo N (indeed the full abelian
cyclotomic character kills a commutator). The native component local
condition therefore kills it. Expansion gives
    (a^e-1)x(g)=0.
At a finite place of K away from ell, the component kills inertia
over Q(mu_N), hence f is unramified. At infinity the image of any
order-two element is killed by 2, since it lies in H. Thus f is
zero on all infinite local contributions, also when K is real.

Use the finite abelian extension cut out by ker(f) in H. Global
Artin reciprocity for this extension is sufficient: the product
of the local Artin images of a principal idele is the identity.
Equivalently the sum of their f-images is zero. This avoids
introducing all additive maps to Q/Z and separating them after
summation; the finite abelian quotient exists because H is compact
and the coefficient group finite. This is an application of standard
global and local class field theory, not an assumption of the target
reciprocity lemma.

Let y in K^* be the actual native input. At a place v away from ell,q
where x kills the decomposition group there is no contribution.
Otherwise the native alternative is y/r^m a unit, with r fixed by
the inertia group over K. The normalized valuation on the maximal
unramified algebraic local extension has value group Z, so
ord_v(y)=m ord_v(r) is a multiple of m. Consequently its unramified
local Artin contribution ord_v(y) f(Frob_v) is zero. This does not
require r in K. At ell and infinity use the previous paragraph.
As q=1 mod Nm, q splits completely in K. Its places are indexed by
u in (Z/Nm)^*, with v_u=s_u^{-1}B restricted to K, using the SAME
lifts s_u as in the native statement. Their valuations are integers
k_u=ord_B(s_u y), with the normalization ord_B(q)=1.
Frobenius at v_u can be represented by s_u^{-1} phi s_u.
The conjugation formula gives x(s_u^{-1} phi s_u)=chi(s_u)x(phi).
On m-torsion, chi(s_u) acts as u^e psi(u). Hence the entire principal
idele identity reduces to
    (sum_u k_u u^e psi(u)) d x(phi)=0.
This is precisely artin_law_component. The proof does not require
that phi(Nm) be a unit and does not divide by 2 or a^e-1.
Keep the native inertia cyclotomic surjectivity supplier and
the class-field normalization (arithmetic Frobenius, or invert
ALL local maps simultaneously). Retain the local condition at ell;
without it the principal idele sum has an additional contribution.

2. Kummer coordinate transport in the actual reciprocity_mod_ell.
Use m=ell, q=1 mod N ell, ell x=0, ell kappa=0, kappa a cocycle
for chi'=cyc^{e+1} psi satisfying inertiaOff N ell T. Assume
D=d x(phi) !=0 and phi(N ell) a unit of O, exactly as in source.
Fix tau in inertia at B and write v=kappa(tau), W=O v.
W is a finite F_ell-vector space. Choose its F_ell basis b_i and
extend each coordinate functional to M[ell] (ordinary vector-space
extension). No O-linearity is asserted. Identify F_ell with mu_ell
via a fixed root of unity. On H=G_{Q(mu_{N ell})}, kappa is a
homomorphism because the action is trivial on ell-torsion.
For every extended functional L_i, Hilbert 90 supplies r_i in
the algebraic closure with
   tau' r_i / r_i = mu(L_i(kappa(tau')))  for tau' in H.
Indeed the right-hand side is a continuous multiplicative
1-cocycle, and Hilbert 90 applies on a finite Galois extension
through which it factors. Then y_i=r_i^ell belongs to K^*.
For A away from ell,q, either x kills D_A or no prime of T is
below A by the native H hypothesis. In the latter case kappa
kills inertia over H and r_i is inertia-fixed; y_i/r_i^ell=1.
Thus these y_i meet ALL Artin-law premises. Applying step 1 gives
   B_i D=0,  B_i=sum_u k_i(u) u^e psi(u),
where k_i(u)=ord_B(s_u y_i) is an integer. Since D !=0, B_i is
not a unit, hence B_i belongs to the maximal ideal of O.

3. Exact weighted inertia identity (the key missing bridge).
Choose pi with pi^ell=q and let mu(j)=tau pi/pi. This j is one
common F_ell scalar for all i,u; no primitivity assumption needed.
For fixed i,u, s_u r_i / pi^{k_i(u)} is a unit at B, since its
ell-th power has valuation zero. Its tau-ratio is an ell-th
root of unity and is congruent to 1 modulo the maximal ideal
of the valuation ring. As q != ell the only such root is 1.
Thus tau(s_u r_i)/(s_u r_i)=mu(j k_i(u)).
On the other hand s_u acts on mu_ell by u, and
kappa(s_u^{-1} tau s_u)=chi'(s_u)^{-1} v.
This is in W, so the coordinate extension restricts to b_i^*.
Equating the two expressions in mu_ell and applying its inverse:
   j k_i(u)=u b_i^*(chi'(s_u)^{-1} v).
Therefore summing the coordinate vectors, then multiplying by
u^e psi(u), gives exactly the native identity F u:
   (u^e psi(u)) sum_i (j k_i(u)) b_i = v.
Only F_ell-linearity of coordinates was used; the O-scalar
u^e psi(u) is applied AFTER assembling the vector. Summing over
u and commuting the two finite sums yields the decisive payment
   phi(N ell) v = sum_i B_i (j b_i) in maximalIdeal(O) W.
As W=O v is cyclic, the RHS equals c v for some c in the maximal
ideal. phi(N ell)-c is a unit in the local ring, so v=0.
This is exactly reciprocity_mod_ell, including the case j=0.
No estimate on dim W, no division by the order of a character
group except the source's actual unit hypothesis. In particular
this argument does NOT extend that hypothesis to ell=2 when the
totient is nonunit.

4. Consumer and independence.
The annihilator step in §6f uses step 1 with y=Jacobi family
at 1/(N ell^nu) and the already-derived sum_floorDiff_dvd.
It gives 2(a^e-1)(a^{e+1}-1) X x(phi)=0; the integer product
divides X. If 4X² x !=0, then 2X² x is nonzero on H by the
abelian-quotient commutator identity with complex conjugation:
otherwise x'=2X² x factors through G/H, and x'(c)=0, chi(c)=-1
force 2x'=0. Chebotarev detects x' at a split Frobenius, contradiction.
This uses no invertibility of 2. For the distinct detector argument,
step 3 is exactly the implication J(T)->J(T union {q}) in §6f.
It kills new inertia for every ell-killed kappa, which is what the
descending Kolyvagin induction consumes. The uniform length theorem
then uses the annihilator AND detecting points, not one in place of
the other. The original m=v_ell(X)+1 and all quantifiers retained.
No RH premise, no new URT result, no synthetic numerical evidence.

Original source chain:
Artin principal idele + local conditions -> artin_law_component ->
reciprocity_mod_ell -> exists_detecting_points_component;
artin_law_component -> nsmul_component_eq_zero;
both -> exists_length_shaOdd_le -> fit-family -> Theorem C.
Reduced human exposition: one finite abelian quotient and
one cyclic module identity replace Q/Z separation and coordinate
ideal rearrangements. All native dependencies, original/reduced
graphs, axiom evidence and unresolved leaves preserved. No claim
of an elaborated graph deletion. Cache context is exact compact pin,
N,e,ell,nu,a,H,K,B,phi,tau and fixed lift family, same x and kappa.

Actual verification: command -v lean/lake/elan yielded no executable.
Re-read actual compact CI run 45803534769 job 139852736170 and
state compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json:
six native TiltingLemma/Filling.Moments theorem checks have exactly
propext, Classical.choice, Quot.sound; module_1_build returncode 124,
all_requested_checks_ok=false, full_RH_replay=false. No new native
rh_prune/scan/reduce/auto/frontier execution; old-pin engine CI
does not validate these new compact human replacements.
The following scalar certificate and native audit commands are
prepared, not executed. Standard Hilbert 90 and global Artin
reciprocity are invoked with the finite extension, unramifiedness
and normalization conditions above; independent audit required.

RESUME HERE: integrate steps 1-3 into HUMAN_PROOF_COMPACT §6f at
its retained Artin principal-idele and mod-ell reciprocity inputs.
Audit the exact component local condition on the commutator at ell
and normalized valuation of inertia-fixed roots over K, then turn
to the projective-count supplier retained by RUN65 (equivariant
Dirichlet, Higman averaging and cardinal multiplication). Do not
redo the already reconstructed Voronoi or Kolyvagin descent.
HANDOFF TO integration/editor, literature, formal audit and compact
native replay. Human reconstruction incomplete; no new kernel closure.
-/

namespace RHGaloisRun66

-- Exact scalar payment after divisibility. Prepared only.
theorem annihilator_payment {R : Type*} [CommRing R]
    (A B X u z : R) (h : 2*A*B*X*z = 0) (hX : X = A*B*u) :
    2*X*X*z = 0 := by
  calc
    2*X*X*z = u*(2*A*B*X*z) := by rw [hX]; ring
    _ = 0 := by rw [h, mul_zero]

#print axioms annihilator_payment
#check artin_law_component
#check reciprocity_mod_ell
#check nsmul_component_eq_zero
#check exists_detecting_points_component
#check exists_length_shaOdd_le
#print axioms artin_law_component
#print axioms reciprocity_mod_ell
#print axioms exists_detecting_points_component

end RHGaloisRun66
