import New.Selmer.TiltingLemma
import Lib.ClassField.GreenbergWiles.GreenbergWilesBound
import Lib.ClassField.GreenbergWiles.ExtendCharacter

/-!
# RUN53 — actual Greenberg–Wiles central-element cardinal supplier
26 Nov 2026. HUMAN SOURCE-MATCHED reconstruction, pending independent audit.
Native certificate PREPARED, not elaborated. Credit Alpöge, Sernau, Claude
and collaborators. Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb (primitive closure
and compact migration; mandatory engine section read). AGENTS 8db0201d,
protocol 4b77b161, queue bbc46df7, manuscript da92e9c9, unified witness
7ad9c7c6. Previous RUN52 f6f72232. Peer kernel c0a35b56 already expands
Kummer reciprocity; audit 4d94ebdc repairs the common tame multiplier;
editor 837e9bc7 and math 389bee29 cover mirror polarization. Do NOT repeat
these. This run addresses the upstream HasFewCocycles condition retained
by those peers and the actual C caller.

Pinned source graph (source roles, not a new kernel extraction):
- Lib/ClassField/GreenbergWiles/EquivariantUnits.lean ad78d13af1fecc0fedc8ac48944e44b62300b66c,
  dirichlet_fixedSUnits
- Lib/ClassField/GreenbergWiles/ExtendCharacter.lean 598c351eed649151dc52a7a0da55d08b006671f6,
  card_hom_lattice_eq_card_equivariant
- Lib/ClassField/GreenbergWiles/ProjectiveCount.lean 3e305e3ad3797609b9c4b4783ce7901ce828c3e9,
  SplitPlaces.card_trivialised_of_isHigmanProjective
- Lib/Adelic/Cartan/ProjectiveModules.lean 284b9007cf1c69d6bfd81a4896aa55ca42684ea6,
  devissage_induction, exists_permModule_isHigmanProjective,
  IsMultiplicative.eq_one_of_isHigmanProjective
- Lib/ClassField/GaloisCohomology/DiscreteUnits.lean 8f36777d8514e71b861507c96eee9d56f6d8fa61,
  trivialisedCocycles.card_le_of_isShortExact
- Lib/ClassField/GreenbergWiles/GreenbergWilesBound.lean ddd24b83ab5ad751a37cf473fec89994838c2746,
  SplitPlaces.hasFewCocycles_of_central
- Lib/ClassField/GreenbergWiles/SelmerRelations.lean a4ec7652040bfb6e7149d286104b4d13c82bf211,
  card_mul_pow_le, exists_split_primes_relations
- Lib/ClassField/GreenbergWiles/SelmerBasic.lean 5d8e27cabe1e4c5c486f7acdfc939499d0b0564e,
  SplitPlaces.liftToSubgroup, FrobeniiDetectRoots
- Lib/ClassField/GreenbergWiles/SplitPrimeReciprocity.lean fbfa4f703035c833491594169f2089c01fda3d03,
  power_residue_reciprocity
- New/Selmer/TiltingLemma.lean 62784266136a2936dd6f8d662b79fa051d28c470,
  IsPencil.length_le_of_unseen_class -> exists_isPencil -> common twist -> C.
All original and reduced kernel graph files preserved. No RH import.

## 1. Equivariant lattice counting

Let G be the absolute Galois group of K, U open normal, Q=G/U,
F=Omega^U, X=places of Omega above level N and infinity, Z=X/U.
V finite killed by the prime ell, U acts trivially. Higman's
hypothesis is an additive tau:V->V with sum_{g in Q} g tau g^-1=id.
Let E be the N-units of F, D=E direct sum Z_integer (trivial extra
summand); D0=D/torsion. Equivariant Dirichlet (real logarithms and
finite valuations, with the extra coordinate) identifies D0 tensor R
with R[Z]. This uses the actual full-rank regulator and rank bound,
not an isomorphism of integral lattices.

For each free integral Q-lattice L, on Hom_Z(L,V) define
  P_L(f)=sum_g rho(g) tau f rho_L(g^-1).
P_L is invariant-valued by reindexing, and is the identity on
equivariant maps by the trace condition. Thus it is idempotent and
rank P_L equals multiplicity of 1 in its characteristic polynomial.
Choose integral bases of L, a basis of V over F_ell, and lift the
matrices rho(g) tau to integral matrices N_g. The matrix sum
  sum_g rho_L(g^-1)^T tensor N_g
reduces to P_L mod ell. For L=D0 and L=Z[Z] these integral matrices
have equal characteristic polynomials: their real actions are
conjugate by the equivariant real regulator isomorphism on the dual
lattice factor, with the SAME N_g on the other factor. Coefficients
are integers, so equality persists modulo ell. Consequently
  |Hom_Q(D0,V)|=|Map_Q(Z,V)|.
This is the actual ExtendCharacter proof mechanism, no semisimplicity
in characteristic ell or integral regulator inverse assumed.

## 2. Projective count: one exact cardinal cancellation

Put T(V)=native trivialised cocycles (B,c) where
  B(gx)=rho(g)B(x)+c(g)
and c unramified off level N and allowed auxiliary primes. Write
d=|iota|, A=V^iota, V0=V^Q, H=Hom_Q(D,V), H0=Hom_Q(D0,V).
Assume all SplitPlaces guards, V killed by ell, U-fixed, rho(z)-n
injective, and the source root condition:
for ell*r in E, all auxiliary phi fixing r imply z*r-n*r fixed by U
(additive notation on units). Write b_i(y) for the power residue
symbols of RUN29 kernel.

Define j:A x V0 -> H by
 j(a,v)(y,k)=sum_{i,g} b_i(g*y) rho(g^-1)a_i + k v.
It is equivariant by reindexing. It is onto: given h in H, first
v=h(0,1). Set beta(y)=(b_i(g*y))_{i,g}. If beta(y)=0 choose ell*r=y;
all phi fix r. By root condition (z-n)r is a U-fixed N-unit (it is
an N-unit by valuations and ell*r in E). Thus (z-n)y is ell times
an element of E. Hence (rho(z)-n)h(y,0)=0; injectivity gives h(y,0)=0.
Therefore h(y,0) factors through beta(E) in F_ell^(iota x Q).
Extend linearly to the whole vector space as v'(coordinates).
Choose
  a_i=sum_g rho(g) tau(v'(e_(i,g))).
Substituting into j and reindexing the pair of group variables gives
  j(a,0)(y,0)=sum_h rho(h)tau(rho(h^-1)h(y,0))=h(y,0).
For clarity: set g'=g^-1 in the outer expression and h=g^-1 k
in the inner sum, so the remaining coefficient is v'(beta(h^-1*y))
and equivariance of h gives rho(h^-1)h(y,0). This is the source hj.

Let r:T(V)->ker j be r(B,c)=((c(gamma_i)),0).
Power-residue reciprocity makes this well-defined. In ker r, c|U=0
by tame detection, so B descends to Z. Let d0:V->coboundaries.
Using the same averaging tau on the Q-orbit of a fixed base point
x0 of X (not a Q-fixed point), put
  v_B=sum_g rho(g) tau(rho(g^-1) B(g*x0)).
Then B(g*x0)=rho(g) B(x0)+c(g). Reindexing gives
  v_B=rho(k)v_B+c(k);
hence c is a coboundary. The sign is immaterial to d0.range, but
with d0(v)(k)=rho(k)v-v it is d0(-v_B).
Define p:ker r->im d0 by p(B,c)=c. It is onto using constant B
and its associated coboundary. Its kernel is exactly Map_Q(Z,V)
(c=0). In particular it has cardinal |H0| by section 1.
All groups finite by the source finiteness and these finite fibers.

Now use the exact kernel/image identities before any bound:
 |T(V)|=|H0| * (|V|/|V0|) * |im r|,
 |ker j|=|V|^d * |V0| / |H|.
Since im r subset ker j and H0 subset H,
  |T(V)| <= |V|^(d+1) * |H0|/|H| <= |V|^(d+1).   (P)
No separate upper estimates on the unit rank or on the invariants.
For the equality clause in the source, assume K totally complex
and z acts as n on mu_ell. Every map in H kills torsion: on an
ell-primary torsion element reduction to order ell via a root of
unity of larger order and the cyclotomic action gives
(z-n)y in ell*D, so (rho(z)-n)h(y)=0; prime-to-ell torsion
automatically maps to zero. More explicitly for torsion order ell^a
the cyclotomic scalar z on that cyclic group is congruent to n mod
ell, since z acts as n on mu_ell. Thus H0=H.
To see im r=ker j, j(a,v)=0 forces v=0 at (0,1).
For a basis e_k of V use coefficients of tau(rho(g^-1)a_i) in
that basis. They satisfy the scalar annihilator equations by j=0.
The converse of power-residue reciprocity (peer c0a35b56) constructs
a trivialised cocycle for each basis vector e_k and these coefficients.
Sum the cocycles; the Higman trace identity recovers a_i on gamma_i.
This proves equality under the two extra guards. No new arithmetic
hypothesis beyond ProjectiveCount's actual statement.

## 3. Exact sequence, central element, and uniform prime-power extension

For a short exact sequence of finite coefficient modules
0->A->B->C->0 the induced T map is exact at T(B):
if projected B(x) and c(g) vanish, the pair takes values in A
and all trivialisation/cocycle/ramification conditions descend.
Thus |T(B)|=|T(A)| |im(T(B)->T(C))|. If both end groups have
bound |module|^k, so does B. If the middle has equality, BOTH
the left bound and surjectivity onto T(C) follow, and equality
on C follows as well. This is card_le_of_isShortExact. For
ell^r-torsion with normal P acting through an ell-group, the
submodule B[ell]^P is nonzero when B is nonzero: orbit counting
on B[ell] gives a number of fixed points divisible by ell.
It is G-stable for normal P, and quotient strictly smaller.
Injection of rho(z)-1 passes to submodule AND quotient since
it is an automorphism of a finite module. Induct on length.
This is the actual devissage_induction, with P=U for G itself.

For GreenbergWilesBound, K totally complex, original split places
for ell^r with r>0, V finite killed by ell^r, U-fixed, z central
mod U, rho(z)-1 injective, cyc_ell(z)=1, and root detection.
Reduce auxiliary level from ell^r to ell by divisibility.
Let P/U be a Sylow ell-subgroup of Q, B its normalizer preimage.
Then P normal in B, z in B, index [G:B] prime to ell and B/P
prime to ell. Lift the SAME auxiliary places to fixed field of B
using SplitPlaces.liftToSubgroup, indexed by iota x G/B with
one representative equal to 1. For either U or P in B the
root condition for z-1 holds: if ell*r0 is fixed S-unit and all
lifted Frobenii fix r0, original root detection at ell^r shows
U fixes r0. For g in the larger subgroup, g*r0-r0 is in mu_ell.
Because [z,g] lies in U and z fixes mu_ell, g fixes (z-1)r0.
Also P fixes mu_ell since P/U is an ell-group and the automorphism
group of mu_ell has order ell-1. These are the source d and hn
guards. No unbounded choice of independent auxiliary primes.

On B, bound all ell-killed U-fixed modules by
k_B=d*[G:B]+1 using devissage with P: the P-fixed factors
satisfy Higman by dividing the trace by the prime-to-ell index
[B:P], so section 2 applies to the lifted family with P.
For equality of the B-bound at each ell-killed V, amplify:
let S be the subgroup of B/U generated by the prime-to-ell
part of central z; take V'=functions on (B/U)/S with diagonal
action. z-1 remains injective: a z-fixed function is fixed by
z^(ell^j), whose permutation action is trivial and whose
coefficient action minus 1 is (rho(z)-1)^(ell^j), hence invertible.
V' has Higman trace via a delta function divided by |S|.
The constant functions form V, quotient still in the same
category. Apply section 2 equality for V', then the short exact
argument forces equality for V on B. This is source T.

Consequently for every short exact sequence of ell-killed modules
in the G-category, the T map is onto on restriction to B.
It is onto on G as well: lift the restricted target pair to B,
corestrict it and correct the constant trivialisation error.
For a target pair (b,c) the corestriction of its restriction has
trivialisation
  sum_{g in G/B} rho(g)b(g^-1*x)=[G:B] b(x)-sum_g c(g).
The last term is constant in x. Lift that constant through the
coefficient surjection and add its associated constant
trivialisation/coboundary, then divide by [G:B] in F_ell.
This recovers the target pair exactly (c determined by b and
equivariance). Ramification is preserved by the native conjugacy
guards of SplitPlaces.mem_and_conj_mem. Thus the rational ratio
  R(V)=|T_G(V)|/|V|^(d+1)
is positive and multiplicative on short exact sequences. For
Higman modules on G it equals 1 by section 2. Finiteness follows
from the native unramified cocycle finiteness and finitely many
G-orbits of X (a trivialisation is fixed by the values on orbit
representatives once its cocycle is fixed).

## 4. Native Cartan devissage via the two affine hyperplanes

This is the elementary mechanism of
IsMultiplicative.eq_one_of_isHigmanProjective (no assumption
that a nonprojective module itself has a Higman trace).
For Q=G/U and S the prime-to-ell part of z as above, put Delta=Q/S.
Every finite Delta-set Y gives admissible V^Y. If a:Y->F_ell
has sum_{g in Delta} a(g^-1 y)=1 for all y, the pointwise
operator a(y)/|S| on V^Y satisfies Higman. Indeed summing over
Q gives |S| copies of each Delta term; coefficient conjugations
cancel on scalar maps. The injectivity of z-1 is as in section 3.

For e=0,1 let X_e={f:Delta->F_ell | sum f=e}, with translation
action by Delta on the argument. X_1 has trace-one function
f->f(1); X_0 has a fixed point 0. Choose f_e with sum e and
identify X_e with X_0 by translation. The two actions on X_0
differ by translations in the elementary abelian ell-group X_0.
Equivalently they are sections of the finite extension of G's
action by the additive X_0, with its normal translation kernel.
For Y=X_e x Delta/K' (any subgroup K' of Delta), regard V^Y
as the restriction of one module on that extension. Filter it
by translation-fixed submodules using section 3's ell-group
devissage (z=1,m=0 for this filtration); on each subquotient the
two sections act identically, because they differ by the
translation kernel. Both restricted modules are admissible,
and all their subquotients remain so. Multiplicativity of R
therefore proves R(V^(X_0 x Delta/K'))=R(V^(X_1 x Delta/K'))=1.
The second equality is Higman from trace-one function above.

Define f(Y)=R(V^Y). It is multiplicative under disjoint union.
For each K', decompose X_0 x Delta/K' into Delta-orbits. Every
stabilizer is conjugate to a subgroup of K'; at least the orbit
through (0,K') has stabilizer K'. Induct on |K'|, so terms with
proper stabilizer equal 1. Remaining factors are copies of
f(Delta/K'), and their product is 1 with a positive integer
exponent. Since f is positive rational, f(Delta/K')=1.
At K'=Delta this proves R(V)=1. Finally for ell^r-torsion
use the exact-sequence upper bound and devissage from section 3.
Conclusion is precisely the actual source supplier
  |T_G(V)| <= |V|^(d+1).
Retain the finite root-detection family and actual central scalar
hypotheses; no uniform class-group bound has been assumed.

## 5. Caller and remaining audit

TiltingLemma uses V=(O/a)^n, U=ker(rho mod ell^M) intersect
ker(cyc mod ell^(M+1)); a divides ell^M. Its balanced row provides
a central-mod-U scalar action s with s-1 a unit, fixes the
ell-adic cyclotomic character, and its selected local inertia
element commutator condition. The exact FrobeniiDetectRoots
output d of exists_split_primes_relations is the input above.
With k=d+1, card_mul_pow_le gives the peer's audited relation
annihilator inequality; mirror isotropy gives its upper bound;
the original balanced local budgets and surjective coboundary
evaluation cancel the extra n-coordinate terms. The source
length_le_of_unseen_class then supplies RUN52's pencil induction.
No requirement to control class groups uniformly beyond this
same finite root-detection construction. This is the previously
retained HasFewCocycles supplier, not an additional endgame.

Verification: actual named pinned source bodies retrieved,
including all sources above (EquivariantUnits hash corroborated
by peer c0a35b56). Local command -v lean/lake returned no path.
Actual CI 45799225653 completed success; state targeted_results
23de197bd48f404ca2074c69676de289c4f7934e reports full_RH_replay=false
and concerns prior named checks, not this certificate. Primitive
job status path returned 404 at this read. Old engines verified
on old pin only. No new native PASS, graph deletion, axiom
closure, or proof-completion claim. Source-level reduction and
ordinary mathematical proof presented for independent audit.
The prepared code below does not replace native proofs; it checks
the exact scalar cancellation and probes actual theorem axioms.
No URT premise, no competing CI, no protected workflow edits.

RESUME HERE: audit sections 2–4 especially corestriction signs,
the root-detection transfer and affine-section filtration; merge
with peer reciprocity at the actual IsPencil consumer, then
derive the remaining balanced-row local crystalline budgets or
sharp fitting/common point suppliers not yet covered by peers.
HANDOFF TO C mathematics, integration/editor, audit, kernel.
-/

namespace CompactGaloisRun53

/-- Scalar certificate of (P), with no division by an unknown cardinal.
The kernel/image cardinal identities are hypotheses of this scalar lemma. -/
theorem projective_card_cancel (t h0 h v v0 i j w : ℝ)
    (hh : 0 < h) (hv0 : 0 < v0)
    (ht : t * v0 = h0 * v * i)
    (hj : j * h = v0 * w)
    (hi : i ≤ j) (hsub : h0 ≤ h)
    (hh0 : 0 ≤ h0) (hv : 0 ≤ v) (hw : 0 ≤ w) : t ≤ v * w := by
  have a : h0 * v * i ≤ h0 * v * j :=
    mul_le_mul_of_nonneg_left hi (mul_nonneg hh0 hv)
  have b : h0 * v * (j * h) ≤ h * v * (j * h) := by
    rw [hj]
    exact mul_le_mul_of_nonneg_right
      (mul_le_mul_of_nonneg_right hsub hv) (mul_nonneg hv0.le hw)
  have c : t * v0 * h ≤ (v * w) * v0 * h := calc
    t * v0 * h = h0 * v * i * h := by rw [ht]
    _ ≤ h0 * v * j * h := mul_le_mul_of_nonneg_right a hh.le
    _ = h0 * v * (j * h) := by ring
    _ ≤ h * v * (j * h) := b
    _ = (v * w) * v0 * h := by rw [hj]; ring
  exact (mul_le_mul_right hv0).1 ((mul_le_mul_right hh).1 c)

#print axioms projective_card_cancel
end CompactGaloisRun53

#print axioms card_hom_lattice_eq_card_equivariant
#print axioms SplitPlaces.card_trivialised_of_isHigmanProjective
#print axioms DiscreteModule.devissage_induction
#print axioms DiscreteModule.IsMultiplicative.eq_one_of_isHigmanProjective
#print axioms SplitPlaces.hasFewCocycles_of_central
#print axioms selmerZ1.exists_split_primes_relations
#print axioms IsPencil.length_le_of_unseen_class
