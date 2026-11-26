import New.Selmer.TiltingLemma

/-!
# Independent C audit: Kummer quotient, transfer sign and actual Selmer caller
2026-11-26. HUMAN SOURCE-MATCHED / AGREE with corrected integration,
DISAGREE with the sign in kernel RUN29 prose, PARTIAL for global reconstruction.
Credit Alpöge, Sernau, Anthropic collaborators and Claude per upstream.

Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion-first,
primitive closure and allocation amendments); manuscript latest observed
bd4fd350d614e72f9e39fcc71596857737940c5c; SWARM_PROTOCOL 4b77b161;
AGENTS 8db0201d; HANDOFF_QUEUE bbc46df7. Read research state, protocol,
research log, continuity protocol and state summary. Reviewed
integration/2026-11-26_COMPACT_KUMMER_QUOTIENT_RECIPROCITY.md
009a6fc0c2bf5eb113c14e41ecbf33bec1d8154e,
specialists/kernel_extractor/RUN29_COMPACT_KUMMER_RECIPROCITY.lean
bb335805f5c23a707a8d7803758f53e77435c88d, and previous audit da786c8f.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Actual fetched source bodies:
Lib/ClassField/Global/Avatars.lean dd2be51ae27b881c0f436d4aa3cb1f777c96f0aa
  QZChar.eq_zero_of_unramified_off 72-78,
  sum_ord_smul_frob_eq_zero 83-100, exists_kummer_chars 116-154;
Lib/ClassField/GaloisCohomology/DiscreteUnits.lean
  8f36777d8514e71b861507c96eee9d56f6d8fa61,
  trivialisedCocycles 159-160, exists_mem_of_orbit_reps 187-194,
  corestrict_mem 199-207;
Lib/ClassField/GreenbergWiles/SelmerBasic.lean
  5d8e27cabe1e4c5c486f7acdfc939499d0b0564e,
  SplitPlaces, decompGroup_le, liftToSubgroup, mem_and_conj_mem;
Lib/ClassField/GreenbergWiles/EquivariantUnits.lean
  ad78d13af1fecc0fedc8ac48944e44b62300b66c, PlaceAboveS.bijective_orbits;
Lib/ClassField/GreenbergWiles/SplitPrimeReciprocity.lean
  fbfa4f703035c833491594169f2089c01fda3d03, power_residue_reciprocity;
Lib/ClassField/GreenbergWiles/SelmerRelations.lean
  a4ec7652040bfb6e7149d286104b4d13c82bf211,
  exists_split_primes_relations, local helper fam and final new-prime relation;
New/Selmer/TiltingLemma.lean 62784266136a2936dd6f8d662b79fa051d28c470,
  length_le_of_unseen_class 94-199.

## 1. Independent audit of the exact Kummer quotient

Let F be the fixed number field of U, containing mu_m, m>0; S the finite
primes dividing the level N, m|N. The SplitPlaces principal_sup_idelesUnitOff
condition at F says that S generates Cl(F). Assume F totally complex for
the converse. Write E=O_{F,S}^*, J finite ideles, H=F^* K_S where K_S has
local mth powers at S and units away from S. Put D=prod_{v in S}
F_v^*/F_v^{*m}. The valuation map outside S and class group condition show
D surjects on J/H, and its kernel is exactly the image of E: if a supported
idele is principal times an element of K_S, its principal factor has
valuation zero away from S and hence is an S-unit. The reverse is immediate.

If y in E maps to 0 in D, the Kummer character k_y is zero on decomposition
at S by the local root criterion and zero on inertia away from S by
unramified roots of units (m is prime to residue characteristic there).
The Artin map and class group condition kill this character globally:
J=F^* J_unitOffS; k_y kills the principal factors by global reciprocity
(no real factors), and all local factors of J_unitOffS. Thus y has a root
in F; its root has valuation zero away from S, so is in E.
Consequently E/E^m injects into D, and

  |J/H| = |D| / |E/E^m|.

For local norm-normalized absolute value, the standard multiplicative
group index is |F_v^*/F_v^{*m}| = m * |mu_m(F_v)| * |m|_v^(-1).
The factors are valuation and the local unit power index; mu_m(F_v)
has size m. For the native upper bound only <= is needed. Product over
S gives |D| <= m^(2|S|+[F:Q]), since all primes dividing m lie in S.
Dirichlet S-units gives |E/E^m|=m^(|S|+r2), with [F:Q]=2r2.
So |J/H| <= |E/E^m|. Conversely the Kummer map E/E^m -> (J/H)^dual
is injective by the same reciprocity/Artin separation and root-in-E
argument (not by assuming the desired class-field existence result).
The finite character dual has size |J/H|; equality follows, all characters
are realized, and they separate points. This proves the required converse
annihilator direction without circular use of Avatars.exists_comp_artinMap.
For m=1 all groups here are trivial. The alternative established global
CFT existence argument in integration has the same hypotheses and output,
but this independent audit uses the native counting route and standard
local index/Dirichlet/reciprocity inputs; no additional existence theorem
is required by the replacement. All these standard inputs remain explicit.

## 2. Conjugation, local power and reciprocity

Fix coset representatives d in G/U; each auxiliary prime splits in F
because its Frobenius and all inertia lie in U and U is closed. Distinct
lifted primes are indexed by (i,d) by liftToSubgroup. For the same root
of unity zeta define k_y, and b_i(y)=k_y(phi_i). If chi(d) is the
cyclotomic action modulo m, directly conjugating the root gives
 k_y(d^-1 phi_i d)=chi(d)^(-1)b_i(d y).
The normalized tame generator gives, at lifted w=(i,d),
 k_x(d^-1 gamma_i d)=chi(d)^(-1)ord_w(x).
Here ord=minus native valuation.log, and the original uniformizer is
still a uniformizer in F at w because the local degree is 1. This is
the precise reason no ramification factor occurs.

For a trivialised cocycle z, restriction h to U is additive because
rho(U)=1; the stabilizer law kills all decomposition at S and infinity.
If all z(gamma_i)=0, tame cyclic detection kills remaining inertia,
and the preceding global separation gives h=0, not z=0 on G.
For an arbitrary additive lambda:V->Z/m, lambda h=k_x by Kummer.
At S and real places x is locally an mth power, off S and auxiliary
primes its valuation is divisible by m. Global reciprocity for k_y on x
therefore reduces exactly to
 0=sum_(i,d) ord_w(x) k_y(d^-1 phi_i d)
  =sum_(i,d) b_i(d y) lambda(rho(d)^(-1)z(gamma_i)).
The inverse cyclotomic factor cancels the factor from solving for ord.
Real places are not silently dropped: local power of x is sufficient,
even if F has real places. Dual separation for exponent-m V proves the
native vector equation. No O-linearity of lambda is needed.

For any compatible f(i,d), and a single a in V, take an idele supported
on the lifted auxiliary primes with uniformizer exponents lifting
chi(d)f(i,d). The quotient result gives ONE x whose local values are
mth powers at S, exact prescribed valuations off S, zero outside the
auxiliary set. Then h(u)=k_x(u)a kills all required stabilizers/inertia
and h(d^-1 gamma_i d)=f(i,d)a. Total complexity is required for this
unqualified converse, not for the forward equation.

## 3. Actual sign correction in peer kernel RUN29

Native definition (DiscreteUnits 159-160) is
  rho(g)B(x)=B(gx)+z(g).
Consequently for U acting trivially, B_U(u x0)=-h(u), NOT +h(u).
Indeed h kills the stabilizer so this is well-defined, and
 B_U(u x)=B_U(x)-h(u).
Kernel RUN29 prose section 3 uses the positive sign and its opposite
trivialization equation; it does not instantiate the native pair.
Integration section 3 and current manuscript already use the negative
sign: preserve them and correct any future reuse of RUN29 prose.
There is no native source error.

For each g,d write g r_d=r_{gd}u(g,d) with u(g,d) in U. Set
 z(g)=sum_d rho(r_{gd}) h(u(g,d)),
 B(x)=sum_d rho(r_d) B_U(r_d^-1 x).
Then u(gk,d)=u(g,kd)u(k,d) and rho(U)=1 imply the cocycle equation
after a permutation of d. Also
 B(gx)=sum_d rho(r_{gd}) B_U(u(g,d) r_d^-1 x)
      =rho(g)B(x)-z(g).
This proves EXACTLY the native sign, not an extension of h itself.
Continuity of z follows from finite coset reindexing and continuous h;
B need not be continuous in the native definition. I is conjugacy
stable and contained in U, so z kills I. For gamma_i in U,
 z(gamma_i)=sum_d rho(r_d) f(i,d)a, simultaneously for all i.
This audits the original corestrict_mem formula, whose output index
is gd, not d, in the general g case.

Exact negative control, executed in local Python (not number-field proof):
G=C3 semidirect C2, multiplication (a,b)(c,d)=(a+(-1)^b c mod3,b+d mod2);
U=C3, V=Z/3 with rho(a,b)=(-1)^b, X=G regular, h(a,0)=a.
Use r_d=(0,d), B_U(a,b)=-a. The preceding formulas give z(a,b)=2a,
B(a,b)=-2a. Wrong positive B gives B(a,b)=2a. At g=(1,0),x=(0,0),
rho(g)B(x)=0 but B(gx)+z(g)=2+2=1 mod3. This counterexample is
nontrivial action and nonzero transfer, so the sign cannot be ignored.
Executed exact enumeration:
```python
from itertools import product
G=list(product(range(3),range(2)))
U=[(a,0) for a in range(3)]
D=[0,1]
def mul(g,k):
 a,b=g;c,d=k;return ((a+(-1)**b*c)%3,(b+d)%2)
def inv(g):
 a,b=g;return ((-(-1)**b*a)%3,b)
def rho(g):return (-1)**g[1]
def r(d):return (0,d)
def h(g):assert g in U;return g[0]
def u(g,d):return mul(inv(r((g[1]+d)%2)),mul(g,r(d)))
def z(g):return sum(rho(r((g[1]+d)%2))*h(u(g,d)) for d in D)%3
def T(x,sign=-1):return sum(rho(r(d))*sign*mul(inv(r(d)),x)[0] for d in D)%3
coc=triv=neg=0
for g,k in product(G,repeat=2):
 assert z(mul(g,k))==(z(g)+rho(g)*z(k))%3;coc+=1
for g,x in product(G,repeat=2):
 assert (rho(g)*T(x)-T(mul(g,x))-z(g))%3==0;triv+=1
 if (rho(g)*T(x,1)-T(mul(g,x),1)-z(g))%3:neg+=1
assert neg>0
print(coc,triv,neg)
```
Actual: 36 cocycle pairs, 36 native trivialization pairs, 24 wrong-sign
counterexamples; no failure in the corrected identities.

## 4. Supply the actual three-term Selmer correction (not just a vector identity)

Keep O the open normal refinement and pi:G->G/O of SelmerRelations;
D=G/U is distinct. Equality pi(phi_i)=pi(phi_j g phi_k g^-1) gives
equality of their actions on every mth root r of a fixed S-unit y,
by native hN. All phi lie in U and fix mu_m. Since phi_j and
g phi_k g^-1 each fix y and zeta, the exponent of their product is
the sum of exponents, and applying g to the root of g^-1 y gives
 b_i(y)-b_j(y)-chi(g)b_k(g^-1 y)=0.
The coefficient chi(phi_j g)=chi(g) because phi_j fixes mu_m.
Hence the actual f is the SUM of three supported arrays, even when
coordinates coincide:
 f=e_(i,1)-e_(j,1)-chi(g)e_(k,[g^-1]).
It satisfies the quotient annihilator hypothesis for every y with
the SAME b. Corestriction now gives one cocycle with
 z(gamma_l)=1_(l=i)a-1_(l=j)a-1_(l=k)chi(g)rho(g^-1)a.
Representatives of [g^-1] differ by U, which acts trivially. No
new relation quotient, no requirement that i,j,k are distinct.

To show z belongs to the actual selmerZ1 with ramification allowed at
the auxiliary set, rather than just a trivialised cocycle: off the
level and the auxiliary primes it kills I by construction; at the
level it is a coboundary z(s)=rho(s)B(x)-B(x) on each decomposition
stabilizer, so the native d0-range subset L_v gives the local condition
at original S, and the unramified-action condition kills inertia at
the additional level primes. At infinity rho(c)=1 by the native
complex-conjugation hypothesis, and the stabilizer law kills z(c).
Thus fam is proved from the three Kummer outputs under its actual
guards. Apply the fixed relation n_l to these simultaneous values:
 n_i(a)-n_j(a)-n_k(chi(g)rho(g^-1)a)=0.
This is the exact covariance supplier. At the enlarged prime family
use one correction per new evaluation with i=new j, j=old representative
of pi(phi_new), k=identity representative and g=1; the identity-index
functional vanishes by the same three-term relation. More explicitly
the native three-term correction is z_new=a, z_old=-a, with the
identity-prime correction possibly nonzero: retain it until evaluated
by n(identity)=0. Subtract the sum of corrections from the relaxed
cocycle. It kills all new tame values, hence new inertia by
apply_inertia_eq_zero (U-trivial action), so is in the old Selmer
group. Applying the old annihilation gives the new-prime equation.
The old evaluation of the original relaxed cocycle is zero because
new and old auxiliary primes are disjoint and avoid original S.
All primes, pi and finite exceptional set were fixed before n; no
new quotient depending on the tested family. The paired-isotropy
consumer then uses the previously audited one common tame multiplier,
not separate multipliers. No uniform balanced-row bound or determinant
conclusion follows from this argument alone.

## 5. Verification and surviving frontier
Local lean/lake/elan unavailable (command -v, no paths). Native engines
rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier not run here; no new
kernel PASS. Prepared module below is a scalar sign/finite sum check and
native probe, not a formal proof of the human Kummer replacement.
Actually retrieved state receipts:
RUN28 targeted_results.json blob 23de197bd48f404ca2074c69676de289c4f7934e,
all requested checks true, not full RH.
RUN29 compact primitive status a56e2d3afb99ed8275e81fd63c8494306e57c43f,
run 45803534769, overall error, 5147.99s, module 1 build timeout 124
(2700.11s); targeted_results.json 088cd2ec0e935ee1a282f10096949bcf671cc804
confirms six named checks succeeded. Importantly, the actual compact
consumer IsPencil.length_le_of_unseen_class, tilting, and
IsPencil.length_le_of_drop_ties have returncode 0 and reported only
propext, Classical.choice, Quot.sound. The B module likewise has three
named checks. This is native evidence for the original consumer, not
for this replacement or a complete replay. No new axiom claim.
Existing graphs untouched: native Avatars -> SplitPrimeReciprocity ->
SelmerRelations -> TiltingLemma -> pencil/twist -> C. Human replacement
uses exact quotient + tame local roots + Hilbert 90 + global reciprocity
+ finite duality and the orbit/corestriction proof, with the original
SplitPlaces generation and class group conditions. Keep all structural,
type/value and unresolved graph evidence. No URT. No root obligation
retired at kernel level. Remaining C arithmetic primitives: actual
balanced row/triangle, uniform odd-Sha and safety/Ext suppliers.
A, B, data and analytic ledger unchanged.

RESUME HERE: audit the actual Greenberg–Wiles projective count and
central-element devissage at the same TiltingLemma consumer, in particular
the characteristic-polynomial reduction, Sylow index and integral
trace-one hypothesis; then audit the remaining balanced row/triangle
supplier. Integration/editor: retain the corrected negative transfer
sign already in the manuscript and the explicit three-term Selmer
local-condition bridge above. Kernel: use shared bounded replay only
if compatible, and record actual output before claiming verification.
HANDOFF TO integration, editor, Galois, kernel extractor.
-/

namespace CompactAuditKummerCorestriction

/-- The transfer sign survives a sum of native trivialization identities. -/
theorem sum_native_trivialization {ι A : Type*} [Fintype ι] [AddCommGroup A]
    (L B c : ι → A) (h : ∀ i, L i = B i + c i) :
    (∑ i, L i) = (∑ i, B i) + ∑ i, c i := by
  rw [← Finset.sum_add_distrib]
  exact Finset.sum_congr rfl (fun i _ => h i)

/-- Wrong-sign transfer in the explicit semidirect-product example. -/
example : (0 : ZMod 3) ≠ 2 + 2 := by decide

#check DiscreteModule.trivialisedCocycles.corestrict_mem
#check DiscreteModule.trivialisedCocycles.exists_mem_of_orbit_reps
#check exists_kummer_chars
#check SplitPlaces.power_residue_reciprocity
#check selmerZ1.exists_split_primes_relations
#check IsPencil.length_le_of_unseen_class
#print axioms sum_native_trivialization
#print axioms IsPencil.length_le_of_unseen_class
end CompactAuditKummerCorestriction
