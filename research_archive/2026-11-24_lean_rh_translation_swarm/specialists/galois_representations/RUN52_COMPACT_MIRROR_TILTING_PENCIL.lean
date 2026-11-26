import New.Selmer.TwistForRows

/-!
# RUN52: exact mirror polarization, tilting and bounded tied-prime induction
2026-11-26. SOURCE-MATCHED HUMAN DERIVATIONS / NATIVE REPLAY PENDING.
Primary source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src/New/Selmer. Credit Levent Alpöge, Luke Sernau, Anthropic
collaborators and Claude per upstream. Latest mission blob
0abe4d55e789dd229081d1161cb7736895fe9885; unified witness blob
7ad9c7c64f53c621ad20422226ad9d0b756ee28e; manuscript blob
69030b2d01e9f0e786a004a21b6f0043ef84bc64. Continue RUN51 (row and local
duality). This advances the common fit-twist supplier of C in (U)/(W)/(S),
not another volume-height assembly or an independent RH proof.

Pinned sources (all fetched; 25 exact named anchors checked):
AptTupleDefs.lean ba41ff0e729d5182ac236911898dfd0865165f8c
Corepresentable.lean 3e401695d96b8ea826d60dadf0174d366f85d37c
RowBalanced.lean ab1371acacfb1c5f262146456a380a9111ce6444
LinePointPowers.lean 654567bac00341a29102ee3b83266bda10ab22a9
TiltingLemma.lean 62784266136a2936dd6f8d662b79fa051d28c470
TwistTheorem.lean bdf0bed65edefd067b584695b1fac0b6acbbd754
TwistForRows.lean 802242498ad4530e7f52cc4f14e0a03be2c59f4d

## 1. Mirror scalar and large residue order (RowBalanced)
Write c for conjugation, R for the integral lattice representation, and
d(g)=cycInv(g)^(t-1). The native IsConjSelfDual trace relation is
tr R(c(g)) = d(g) tr R(g^-1).
Suppose R(g)=a I. For every k, apply the trace relation to c(k)g^-1:
 tr(R(k)R(c(g)^-1))
   = d(c(k))d(g^-1) tr(R(g)R(c(k)^-1))
   = a d(g^-1) tr R(k).
The second equality is the same trace relation at c(k). Since the
matrices R(k) span the full matrix algebra over O, test against every
matrix unit; the trace pairing is perfect over O (no division by rank).
Therefore R(c(g)^-1)=a d(g^-1) I. Also a is a unit because R(g) is
invertible and rank is positive. For the chosen inertia gamma off ell,
the cyclotomic character is trivial, so both scalar actions equal s.
IsRow.exists_scalar_inertia gives, with a=0 in its power parameter,
norm(s^j-1)=1 for 1<=j<=4n+2. Consequently s-1 and s+1 are units
(the latter from j=2) and the residual order is >4n+2. This proves
the exact scalar_inertia and lt_card_residue clauses of IsBalanced;
it does not assume the residue field is arbitrarily large independently
of the representation. The other balanced clauses retain RUN51's local
length and determinant argument, native row type and magnitude bounds.

## 2. Mirror isotropic cardinality by two-term polarization
Actual supplier: card_le_torsion_of_isotropic (LinePointPowers).
Keep ALL its native hypotheses. Let A=O/I, E=A^n, U act trivially on E,
H normal, c-stable, contained in U, and containing [g,gamma] for every
g. Let y be the cocycle vanishing at gamma and having a unit coordinate
at g0. On U, y is additive; the dual cocycles x_w are additive there,
and obey x_w(k b k^-1)(m)=x_w(b)(chi(k) R(k)^-1 m) for b in U.
For each w and t in O let B(b,h;t)=x_w(b)(t y(h)); it is biadditive
on U. Use the same w throughout. The assumed equality of the two
quadratics at zH yields the exact polarization, with no division by 2:
  B(b,h;t)+B(h,b;t)=B(cb,ch;t)+B(ch,cb;t),  b,h in H.
Indeed subtract the equalities at zb, zh, and add that at z from the
one at zbh. All z terms cancel because z and cz are in U.
Set p=B(b,h), q=B(h,b), p'=B(cb,ch), q'=B(ch,cb), viewed as additive
functions of t. Apply the polarization also to gamma b gamma^-1,h.
Here y transforms by s, the dual functional by s^-1; on the c-side
the factors are reversed because R(c gamma)=s^-1 I and chi(c gamma)=1.
Thus, writing scaling for precomposition on t,
  p+q=p'+q',  s^-1 p+s q=s p'+s^-1 q'.
Eliminate q-q' or equivalently use the first identity to get
 (s-s^-1)(p-q')=0. Since s and s±1 are units, s-s^-1 is a unit.
Hence p=q' and q=p'. This is exactly the mixed mirror identity
without a separate expansion of each quadratic in the native proof.

Choose tau=[g0,gamma] in H. By the cocycle identity and y(gamma)=0,
y(tau)=(1-s)y(g0) (commutator orientation may replace it by its
negative unit multiple); it has a unit coordinate. For b in H and k
in G put h=k tau k^-1 in the mixed identity. We obtain
 x_w(b)(t R(k)y(tau))
   = x_w(c tau)(chi(c k)t R(c k)^-1 y(cb)).
As R(k) span all matrices, vectors R(k)y(tau) span E over O:
matrix units applied to the unit coordinate generate the standard basis.
This proves that x_w(c tau) determines x_w on H. It determines x_w
on U as well: for u in U the commutator [u,gamma] is in H and the
additive equivariance formula expresses its value as
 x_w(u)((1-s^-1)m), with unit coefficient (or its negative for the
inverse convention). Restriction to U distinguishes w by native hi.

Compare the displayed mixed identity at k and kg, with native scalars
R(g)=alpha I and R(cg)^-1=alpha' I. Taking b=c tau and varying k,t
shows x_w(c tau) annihilates (alpha-chi(cg)alpha') E, since
R(c k)^-1 y(tau) span E and chi(c k) can be absorbed in t
(the character takes unit values as a group homomorphism).
Thus the distinct w inject into the additive dual of
E/(alpha-chi(cg)alpha')E. For finite E its cardinality is that of
the kernel of multiplication by this scalar (finite additive dual
has the same cardinality, and kernel/cokernel cardinalities coincide).
This proves the native cardinality estimate
 |W| <= |E[alpha-chi(cg)alpha']|.
The exact bilinear cancellation above is the main simplification.
All original group, span, integrality, unit, and restriction premises
are preserved; it does not assert that the isotropy premise is automatic.

## 3. Actual unseen-class consumer and its remaining arithmetic premise
TiltingLemma.IsPencil.length_le_of_unseen_class uses the preceding
cardinality bound with U=ker(reduceModPow ell M R) intersect ker(cycChar
mod ell^(M+1)), and H the commutator with the normal closure of the
two mirror elements, intersected with U and its c-conjugate.
The dual family is obtained from selmerZ1.exists_split_primes_relations.
The no-new-prime hypothesis says that for EVERY admissible new prime
and its data l with EVERY slope allowed, each old cocycle's paired
Frobenius values lie in the paired inertia image of the relaxed
module. The native proof uses Chebotarev/anticyclotomic prime selection
in a neighbourhood of the helper tame generator times an element
of H, converts the two tame generators by exists_isTameGeneratorFor,
and uses global reciprocity (the R relation in the proof) to obtain
the isotropy equality used in section 2. This conversion is not
proved by polarization; retain the actual split-prime relation and
reciprocity suppliers. The primitive cocycle is the same y throughout.

Then convert the cardinality estimate to length, remove the coboundary
factor using surjective evaluation at gamma (s-1 a unit), and sum local
lengths. At an old auxiliary split prime and its conjugate the local
inertia evaluation injects the ramified quotient into E by
exists_conj_side_detects, so each extra local contribution is <=length E.
Those terms cancel the extra |S union conj J| terms in the global
length estimate. The scalar kernel length is <=n v(alpha-chi(cg)alpha')
by Smith normal form. The native balanced local_length_le then
gives length X(J)<=beta. This describes the consumer and the exact
cancellation; the split-prime global relation/cardinality theorem and
the reciprocity-to-isotropy construction still need a complete human
proof. Do not label the unseen-class theorem itself independently closed.

## 4. Full linear tilting lemma (TiltingLemma.tilting)
Let O be a DVR, A=O/I Artinian, E=A^m, Phi0,Phi1:B->E linear,
Y a submodule. Write Z=sum_s(Y intersect ker(s Phi0-Phi1)).
Then Phi1(Z) is contained in C=Phi0(Z). Let F be the inverse image
of C in O^m under reduction. F is free of rank <=m over the DVR;
q:F->C is surjective. Lift q along Phi0:Z->C by projectivity to
sigma:F->Z, and lift Phi1 sigma along q to an endomorphism T:F->F.
For all s off the at most m roots of det(s I-T) modulo the maximal
ideal, sI-T is a lattice automorphism. Denote
 Z_s=Y intersect ker(s Phi0-Phi1), C_s=Phi0(Z_s), K=Z intersect ker Phi0.
For every f in q^-1(C_s), select z in Z_s with Phi0 z=q f.
Then z-sigma f belongs to K and
 q((sI-T)f)=Phi1(z-sigma f) belongs to Phi1(K).
Thus (sI-T)q^-1(C_s) is contained in q^-1(Phi1(K)).
Reduce both lattices modulo IF, which is preserved by the
automorphism; both contain IF because I kills C. Additivity of finite
length and subtraction of the common length ker(q)/IF show
 length C_s <= length Phi1(K).
Also Z_s intersect ker Phi0 is contained in K intersect ker Phi1.
Hence
 length Z_s <= length(K intersect ker Phi1)+length Phi1(K)
             = length K
             <= length(Y intersect ker Phi0 intersect Phi1^-1(Phi0Y)).
This is the original tilting bound, including the <=m exceptional
residues; no additional finite-length assumption on B needed if
the RHS is infinite (trivial), otherwise the kernel part is finite.
No independent choice of slopes across the two moduli below.

## 5. Tied-prime induction (TwistTheorem.exists_isPencil)
Let X_J(a,i) be the exact tied Selmer module modulo a, with c(gamma_i)=0.
For each nonzero a|ell^M and finite row family, the goal is one J0
independent of N, such that for EVERY N a single pencil J with |J|<=J0
has length X_J(a,i)<=beta_i for every i. Preserve the helper prime,
auxiliary character Frobenius relations, neighbourhood W and all
mod-ell^M Frobenius guards. Base unit a: modules vanish; choose one
helper with zero slopes via native exists_isAnticyclotomicAt.
Induct a -> pi a (pi irreducible). By induction choose J with all
lower-modulus bounds. At the upper modulus, finite length follows from
the corepresenting-coordinates theorem. Evaluating the 2n_i tame
coordinates for each auxiliary prime and its conjugate has kernel
contained in the original unrelaxed Selmer module, by the native
exists_conj_side_detects and unramified conditions. Thus for initial
|J|<=J1,
 length X_J(pi a,i)<= length unrelaxed_i(pi a)
                   + 2 n_i J1 length(O/(pi a)).
All quantities on the right are independent of N. Choose integer
C>=J1+sum_i of these bounds (or any larger finite bound).
Among admissible pencils with this same helper, all lower bounds
and |J|+sum_i length X_J(pi a,i)<=C, minimize the upper length sum.

If a row has no unit-valued cocycle coordinate at the upper modulus,
all values lie in pi(O/(pi a)). Multiplication by pi gives the injective
coefficient map O/a -> O/(pi a); pointwise divide through this map.
All linear cocycle, continuity, unramified and tie relations descend,
so upper length <=lower length<=beta_i. Otherwise, if that row is long,
the contrapositive of length_le_of_unseen_class gives an admissible
new prime P whose paired Frobenius image is NOT contained in the
paired inertia image of the module relaxed at P. This means a
proper submodule of the old upper module in the RHS of tilting:
take Y=relaxed module, Phi0=paired inertia, Phi1=paired Frobenius;
Y intersect ker Phi0 embeds in the old module by tame detection.
Use section 4 at both moduli (pi a and a). Each excludes at most
2n_i residues; also exclude 0. Native residue cardinality >4n_i+2
allows a single common unit s. Set the new slope to s^-1 for the
offending row and zero for every other row. Ties impose exactly
Phi0=s^-1 Phi1 for the offending row; for the others inertia zero.
Both moduli's lengths do not increase for any row, by tilting and
the same tame detection. The offending upper length decreases by
at least one, since its old finite module has the proper submodule
specified above. Adding one prime therefore cannot increase
 |J|+sum_i length X_J(pi a,i),
and strictly decreases the minimized sum, contradiction. All upper
lengths must be <=beta_i. Take J0=C. This proves the bounded
induction given the actual unseen-class and prime-selection suppliers,
with no appeal to independent optimal pencils for each row.

## 6. Same-twist consumer / exact affine drop-tie mechanism
At a new auxiliary prime the twisted affine actions of Frobenius
and tame inertia commute on mod ell^M cocycles (native tame relation,
ell^N congruence and k+2M<=N). If their linear actions are F and G,
commutation gives (F-1)c(gamma)=(G-1)c(phi). At nonhelper prime,
the point character has Frobenius value u and tame value
1+t(u-1). For nonzero slope t the old Frobenius action is trivial
mod ell^M, as is old inertia, so G-1=t(F-1); for zero slope G=1.
Therefore the dropped tie evaluation d=c(gamma)-t c(phi) lies in
ker(F-1). At the helper the dropped-tie premise requires u=1;
the same cancellation applies with its native slope convention.
Taking both conjugate sides and using the native congruent matrices
w_p, the length cost is bounded by sum v det(u R(w_p)-1) via the
Smith bound. Aggregate using relLength_iInf_le. This is the algebra
of IsPencil.length_le_of_drop_ties, conditional on its original
tame-affine and character guards, not an independent proof of them.

The actual exists_anticyclotomic_twist uses the bounded J0 before
choosing high N, fitting polynomials sharp at the initial point and
upper-bounding lengths at all coefficient rings/points, then common
root-of-unity points for ALL rows, value families and d=1..m.
The small delta is chosen with (8J0+2)delta<eta; drop-tie costs and
Hecke-family costs sum on this same pencil. Result for all sufficiently
large O' is normLength <=B_i+eta and value cost <=8c+eta. The
root-of-unity avoidance, fitting polynomial and value-family
arguments must still be derived; bounded tied primes alone do NOT
supply a common fit twist. TwistForRows uses eta=crudeUnit and
B_i=10 f n_i crudeUnit, giving (10 f n_i+1)crudeUnit and 9crudeUnit,
the actual C input of RUN51 and the unified witness.

## Evidence / unresolved obligations
Executed 25 named source-anchor assertions across seven pinned files;
exact V8 modular check of the two polarization equations: 34,240
triples (p,q,p') with q'=p+q-p' modulo 5,7,8,9,11,13, for every
unit s with s±1 units. Checked the implication p=q',q=p' wherever
the second equation holds. This is arithmetic regression only; no
Galois/Lean execution. Old CI runs 45577239749 and 45576756833
jobs retrieved all success; compact run 45781154005 status.json
blob ea44d71556e0d21703e72fcd61bbaf2bee0ec563 explicitly error
RESOURCE_BLOCKED before compilation despite outer jobs success.
No new native PASS, kernel closures, axiom claims or graph edge
deletions. Native original and compact graphs remain untouched.
No URT premise. The Lean algebra lemma below is a prepared regression
and the actual supplier axiom probes are ready for shared replay;
the full human derivation is not claimed to have been elaborated.

RESUME HERE: prove the exact split-prime relation and reciprocity
supplier invoked by length_le_of_unseen_class, including conversion
from admissible prime selection to isotropy on the entire coset;
then the sharp fitting polynomial and common roots-of-unity
avoidance in exists_anticyclotomic_twist. Retain RUN51's local
exponent suppliers. HANDOFF TO C mathematics, character boxes,
integration/editor (sections 1,2,4,5 are source-matched derivations),
audit (check scalar polarization and lattice quotient length),
kernel (shared compact replay only, inspect actual caller roles).
-/

namespace CompactGaloisRun52

/-- Scalar shadow of the exact two-equation cancellation; the human
proof uses the O-module of additive functions of the test scalar. -/
theorem cross_cancel {O : Type*} [CommRing O]
    (a b p q p' q' : O) (hu : IsUnit (a-b))
    (h1 : p+q=p'+q') (h2 : a*p+b*q=b*p'+a*q') :
    p=q' ∧ q=p' := by
  have hz : (a-b)*(p-q')=0 := by linear_combination h2 - b*h1
  obtain ⟨u, he⟩ := hu
  have hv : (↑u : O)*(p-q')=0 := by rw [he]; exact hz
  have hw : p-q'=0 := by
    calc
      p-q' = (↑(u⁻¹) : O)*((↑u : O)*(p-q')) := by simp [← mul_assoc]
      _ = 0 := by rw [hv, mul_zero]
  have hp : p=q' := sub_eq_zero.mp hw
  exact ⟨hp, by linear_combination h1 - hp⟩

#print axioms cross_cancel
end CompactGaloisRun52

#print axioms IsRow.eventually_isBalanced
#print axioms card_le_torsion_of_isotropic
#print axioms tilting
#print axioms IsPencil.length_le_of_unseen_class
#print axioms IsPencil.length_le_of_drop_ties
#print axioms exists_isPencil
#print axioms exists_sharp_fitting_poly
#print axioms exists_anticyclotomic_twist
#print axioms exists_mFoldTwist_selmerLengthLe
