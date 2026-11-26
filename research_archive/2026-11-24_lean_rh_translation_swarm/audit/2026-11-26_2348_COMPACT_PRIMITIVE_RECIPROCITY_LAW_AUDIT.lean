import New.Selmer.TrianglePrimes
import New.Selmer.ReciprocityLaw

/-!
# Independent audit: primitive reciprocity-law existence, actual triangle consumer
26 Nov 2026 — HUMAN SOURCE-MATCHED; PARTIAL overall; Lean probes PREPARED ONLY.
Credit Alpöge, Sernau, Anthropic collaborators and Claude. Compact source
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 9f4a2272265e847b3a46422b02d4b37e976bee10; protocol 4b77b161,
AGENTS 8db0201d, queue bbc46df7; current HUMAN_PROOF_COMPACT
0ef71fd3afc82ac3e5c0fc0e23d5533a9e495dc9 (lines 1552–1600).
Resume prior audit b25d38d701e6a0a5364f7015e0817696cc368059, not a new scalar endgame.
Source anchors relative to grh-compact/src:
- New/Selmer/ReciprocityLaw.lean 7b82ced3dd3ff2be7eedbfa63f92f2f743093223,
  exists_isLaw, lines 51–195; eq_zero_of_mem_evenClasses and IsLaw.
- Lib/ClassField/GaloisCohomology/DiscreteUnits.lean
  8f36777d8514e71b861507c96eee9d56f6d8fa61, exists_primitive_relation 20–40.
- Lib/ClassField/GreenbergWiles/SelmerRelations.lean
  a4ec7652040bfb6e7149d286104b4d13c82bf211, card_mul_pow_le 19–48,
  exists_split_primes_relations 50–141.
- Lib/ClassField/GreenbergWiles/ProjectiveCount.lean
  3e305e3ad3797609b9c4b4783ce7901ce828c3e9, 12–21.
- New/Selmer/Corepresentable.lean 3e401695d96b8ea826d60dadf0174d366f85d37c,
  evenClasses 136–138, four_dvd_cycChar_sub_one 169.
- New/Selmer/TrianglePrimes.lean b827965b6067ce391e85efd83fcc919fcd75848c,
  60–96 (actual law consumer).

## 1. Real-field descent and the SAME Selmer datum
Let E be the native stably unramified CM field, K=E^+, Γ=Gal(Ω/K),
G=Gal(Ω/E), identified with its index-two image res(G). Choose c0=cmConj,
so Γ=G ⋊ <c0>. Define p(g c0^i)=g, a continuous retraction of sets.
Then p(uv)=p(u) p(v) or p(u) p(v)^c according to the coset of u;
p is NOT a group homomorphism. κ=cyc_l ◦ p IS a homomorphism
because conjugating inside Γ preserves the cyclotomic character.
In particular κ(c0)=1, whereas the ordinary cyclotomic character
of c0 is −1. Keep these distinct, especially at l=2.

The native stable-unramified hypothesis excludes inertia acting
nontrivially on E/K (via its unit y−bar y); the projection p therefore
takes inertia at a real-field place into inertia over its inverse-image
places of E. K is totally real; a complex conjugation projects to an
element with κ=1. Set R=Z/l^r, r>0, M=R(κ^(-e)),
V=G ∩ ker(cyc mod l^r), viewed as an open normal subgroup of Γ.
V fixes M and μ_(l^r), and contains no complex conjugation.
S is exactly the places of K above l together with the images of the
given split places x_i of E. Their images are distinct and off l.
For off-l places in S use the actual inverse geometric Frobenius of x_i;
it has the required Frobenius orientation and belongs to V. At l the
local condition is vanishing on the decomposition subgroup intersected
with ker κ; off l in S it is vanishing on the entire decomposition
group. Both contain local coboundaries: the action on the tested
subgroups is trivial. Do not replace this by unrestricted local classes.
Apply exists_split_primes_relations to obtain the ORIGINAL auxiliary
split family s indexed by ι, tame evaluations γ_i, quotient π, finite
exclusion set T, root-detector d and reciprocity extension H. Write
n=|ι|, Y=Selmer Z¹(M) allowing ramification at s, Z=Y[l].
The same s,γ,π,T are used for the law, not the later enlarged s'.

## 2. Exact torsion count; why four infinite places suffice
W=M[l] has order l and is cyclic, including l=2. Define
ψ=(action on W, ordinary cyc mod l), O=ker ψ. Since
|Aut(W) × (Z/l)^×|=(l−1)^2, [Γ:O] is coprime to l; V⊂O.
Use the original two extra split primes of ReciprocityLaw lines 123–132:
one has Frobenius in γ V where γ∈O projects to a topological generator
of κ(O); the other in c0 V if c0∈O, and in V otherwise. Chebotarev
provides them disjoint from each other, s and the level. These are
auxiliary counting primes, not additions to the final law's coordinate
set. In the l=2 case the second prime is essential for the argument:
κ forgets complex conjugation, so a generator of κ(O) alone does not
detect its kernel.

Root detector bridge (ProjectiveCount hypotheses): if an l-th root y
of an O-fixed level unit is fixed by all Frobenii in s', then
l^r y (additive notation) is a V-fixed level unit, and original d
makes its stabilizer F contain V. The additional Frobenius conditions
give γ∈F and, when c0∈O, c0∈F. For any g∈O with κ(g)=1,
p(g)∈V (under res), and g differs from p(g) by 1 or c0; hence
ker(κ|O)⊂F. The stabilizer is open (algebraic element), so F∩O contains
all of O by the procyclic generator property of κ(O).
Thus y is O-fixed. This is exactly the z=1,n=0 root condition of
SplitPlaces.card_trivialised_of_isHigmanProjective, with W finite,
l-killed, O-fixed and z−0 acting injectively. Higman's condition follows
from coprime index; no division by l and no assumption that Γ/V is
prime-to-l. Keep the original s'.principal_sup_idelesUnitOff and
inertia/level data.

On each l-adic decomposition group D, κ(D) is procyclic:
for odd l the l-adic units are procyclic, for l=2 use the native
four_dvd_cycChar_sub_one to land in 1+4 Z_2, NOT all Z_2^×.
A continuous W-valued cocycle vanishing on ker κ descends to κ(D),
because the action also factors through κ. Evaluation at one
topological generator is injective (zero value implies zero on all
powers and then by continuity); so the local group has at most l
elements. Off l it is zero, order 1. This proves the exact local
product bound, without multiplying a spurious factor l at every
off-l place.

Write a=#S_l, b=#S_off_l, f=#infinite places K=#infinite places E.
We have b≥|I|≥k, f≥4. Z injects into the W-valued Selmer group allowing
s' (restrict values to W, then enlarge the permitted ramification).
The projective count gives at most l^(|ι ⊔ Bool|+1)=l^(n+3)
trivialised cocycles. The native card_mul_pow_le therefore gives
       |Z| l^(a+b+f) ≤ l^(n+3) l^a.
Cancel l^a BEFORE estimating exponents; b+f≥k+4 implies
       |Z| l^(k+1) ≤ l^n.
This is precisely B at ReciprocitycityLaw 110, not a statement about
the order or length of all Y. The actual two extra primes and projective
+1 are charged exactly. The inequality also gives a nonempty primitive
coordinate family because |Z|≥1.

## 3. Shorter proof of the primitive relation at this caller
For any finite abelian Y and evaluation p:Y→R^n define
   L:R^n→Hom(Y,R) × R^k,
   u↦(x↦p(x)·u, (u_(t(j)))_j),
where t(j)=π(res(y_j^-1)), for the prescribed arbitrary y_j.
Let d=log_l |Y[l]|. The l-torsion of Hom(Y,R) has dimension d:
it is Hom(Y/lY,F_l) since r≥1, and |Y/lY|=|Y[l]|.
Hence the l-torsion dimension of im L is at most d+k (inject it
into the target l-torsion). For any finite abelian l-group A,
dim(A/lA)=dim(A[l]), by multiplication-by-l counting.
If ker L⊂lR^n then (im L)/l(im L)≅R^n/(lR^n+ker L)
has dimension n. But B implies d+k+1≤n, contradiction.
Thus choose u∈ker L outside lR^n; some u_j is a unit in R.
This proves exists_primitive_relation by elementary finite-group
counting; repeated prescribed indices only reduce the rank and do not
invalidate it. No lifting from mod l to mod l^r is asserted.
The map H is supplied the full function x↦u_i*x, not just a relation
on reductions mod l. The chosen same u gives every prescribed zero.

## 4. Actual extension, parity and even-class reciprocity
Let β(a)=u_(π(a)), a∈V, obtained from the source's H via its
multiplicative functionals. It is additive on V and satisfies
β(gag^-1)=χ_full(g) κ(g)^e β(a), where χ_full is ordinary cyc mod l^r.
β(s.φ_j)=u_j. Define z(g)=u_(π(res(g^-1))) on ALL G.
It is locally constant; additivity and conjugation rule are only
claimed on ker cyc mod l^r. On that kernel, z=-β∘res by additivity,
hence the character exponent is e+1. At complex conjugation the
factor is χ_full(c0)κ(c0)^e=−1, proving oddness without dividing by 2.
The prescribed zeros hold even when a y_j is outside the kernel.
For the unit coordinate, s.φ_j∈V, so its inverse has a preimage g∈G
in the cyclotomic kernel with z(g)=u_j. These are exactly all fields
of IsLaw except reciprocity.

For a permitted even class c with values in the native O/l^r O,
scalarize by an additive f into R. Finite abelian groups killed by
l^r are separated by such maps (finite cyclic decomposition);
the source uses Q/Z duality and map_cycChar_smul. Thus it suffices
to prove the required vanishing for each scalar cocycle l=f∘c.
Evenness gives l(p(gh))=l(p(g))+κ(g)^(-e)l(p(h)), so X=l∘p is a
Γ-cocycle for the same M. The source submits X+X, not X, to H:
- inertia outside l and the real images of the new places is killed
  using p and the full conjugation-closed support of c;
- at v above l and g∈D_v∩ker κ, 2X(g)=X(g²)=l(p(g²))=0,
  since g² is in G in the native local kernel (shaLocalSet).
  This also works when g∉G; do not silently assume X(g)=0;
- at old off-l v∈S, the new-place exclusion T⊃S and the prescribed
  zero c(x_i.frob)=0 give zero on inertia and the chosen inverse
  Frobenius, thus on D_v by continuity;
- at any complex conjugation g, κ(g)=1 and g²=1 imply 2X(g)=0.
Consequently X+X satisfies every local condition of Y for the new
split family. H yields the exact sum
       Σ_i β(res(w_i.frob^-1)) (2 X(δ_i))=0,
δ_i the K-tame generators. With z(w_i.frob)=β(res(w_i.frob^-1)),
the hypothesis z(w_i.frob)=0 for i≠j leaves
       2 z(w_j.frob) X(δ_j)=0.
The actual tame restriction identity (exists_apply_eq_nsmul) gives
X(res τ_j)=m_j X(δ_j) for a suitable integer m_j; no inversion of m_j
is required. For any natural N with 2 z(w_j.frob) dividing its image
in R, multiply the preceding equality by m_j and the divisibility
witness to obtain N l(τ_j)=0. Separation then gives N c(τ_j)=0.
This is the exact reciprocity field, including l=2.
The factor of two must remain; oddness and evenness over l=2 are
not equivalent to a direct split into eigenspaces.

## 5. Consumer, limitations and retained obligations
TrianglePrimes 60–66 uses the integral lattice H of earlier evaluations
and its SAME basis y_j, with k≤|I|, to apply this law. It obtains a
primitive w in the cyclotomic kernel while killing all basis values,
then subtracts the integral combination of these vectors and applies
the existing conjugation-character separation. Thus the audited
exists_isLaw chain feeds the triangle construction without new
hypotheses or a change to the native 2 z divisibility field.
No additional assumption on the uniform odd-Sha component bound is
discharged. Keep split-prime relations (including exact class-field
reciprocity and root detection), the projective counting theorem,
Chebotarev, stable-unramified inertia and local Tate/selmer foundations;
these are the named prerequisites of this reconstruction. In particular
this does not replace native Kolyvagin/Stickelberger annihilation,
crystalline safety, normalized RowBalanced or Ribet comparisons.
Source-visible caller chain: exists_primitive_relation +
card_mul_pow_le + ProjectiveCount -> exists_isLaw -> exists_isPrimeTriangle
-> hasTriangleCost_tateTwist -> Ribet. No new elaborated edge deletion;
original/reduced graphs and axiom ledgers unchanged. Context cache key:
compact pin / E / l / r / e / S / s / V / O / π / actual y_i and u.
Native source pin distinct from old 40e56b; no URT or RH theorem import.

Actual tests executed with Python 3 in local container:
1. [u for u in range(2) if all(x*u%2==0 for x in range(2))]==[0]:
   Y=F2, p=id, k=0, n=1 shows loss of +1 slack fails.
2. 1*2**(1+3)==2**(1+3) and 1*2**(1+1)>2**1:
   the numerical counting inequality alone with f=3,b=k=n=1,a=0
   fails to imply B. Not a number-field counterexample.
3. 2*1*2%4==0 and 1*2%4!=0: cannot remove 2 from reciprocity.
Output: "3 exact interface negative controls reproduced".
No finite diagnostic is used to prove an infinite assertion.

Native CI: actual job and state files for run 45803534769 checked.
status blob a56e2d3afb99ed8275e81fd63c8494306e57c43f and
outputs/targeted_results.json blob 088cd2ec0e935ee1a282f10096949bcf671cc804
under cathedral-research-state:compute/rh-compact-primitives-replay-20261126.
Six named native checks in TiltingLemma and Filling.Moments had only
propext, Classical.choice, Quot.sound; module_1_build timed out 124
(2700.11s), all_requested_checks_ok=false, full_RH_replay=false.
Workflow job success is not mathematical task success. No CI receipt
for this certificate; no local lean/lake/elan. Old-pin native
rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier not run on compact.
Probes below prepared, not compiled, not substitutes for the argument.

RESUME HERE: audit Lib/Cyclotomic/Kolyvagin/Components.lean and actual
OddShaBound component annihilator plus uniform detector; distinguish
annihilation from length and retain full level torsion when l divides N.
HANDOFF TO integration, human editor, Galois, native replay.
Verdict AGREE / PARTIAL: primitive-law count, primitive relation and
transfer reconstructed conditional on the retained exact suppliers.
Human RH proof incomplete; zero fresh kernel-verified closures.
-/

-- Executable scalar certificate for the actual exponent budget.
theorem audit_primitive_law_count_exponent (a b f n k : Nat)
    (hb : k ≤ b) (hf : 4 ≤ f) :
    n + 3 + a + (k + 1) ≤ n + (a + b + f) := by omega

-- The multiplication used by the reciprocity caller never divides by 2.
theorem audit_primitive_law_tame_transfer {R : Type*} [CommRing R]
    (z x v m q N : R) (h : 2 * z * x = 0)
    (hv : v = m * x) (hN : N = (2 * z) * q) : N * v = 0 := by
  rw [hN, hv]
  calc
    2 * z * q * (m * x) = q * m * (2 * z * x) := by ring
    _ = 0 := by rw [h, mul_zero]

#check exists_primitive_relation
#check selmerZ1.card_mul_pow_le
#check selmerZ1.exists_split_primes_relations
#check SplitPlaces.card_trivialised_of_isHigmanProjective
#check exists_isLaw
#print axioms exists_isLaw
#print axioms audit_primitive_law_count_exponent
#print axioms audit_primitive_law_tame_transfer
