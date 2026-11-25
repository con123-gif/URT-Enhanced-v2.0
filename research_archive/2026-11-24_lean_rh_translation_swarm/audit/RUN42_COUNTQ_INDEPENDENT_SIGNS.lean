import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.VWinNumN
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN42 / 25 November 2026 / formal audit. SOURCE-MATCHED human argument,
PREPARED finite-cardinality Lean bridge, NOT COMPILED. RH OPEN.

One actual rank-four CountQ improvement: 7 fixed quadratic fields suffice
instead of 18, while avoiding BOTH the Frobenius prime p and coefficient
prime l. Unlike RUN41, this uses independence of the signs, not simply
their pairwise distinctness. It also replaces the signNe supplier locally
by the stronger squareclass argument (not a global deletion).

Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 /
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. Current mission
f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory engine;
SWARM 4b77b161, HANDOFF bbc46df7, AGENTS 8db0201d, state 1ff2601b,
log 98f2328f, protocol ca67d897, continuity 61459cfd opening read.
Latest peers 778190b4 (tame), 13df4d53 (weight one), ce4b2b8f (CountQ
twist correction), 7f95819c (rank), own a35ccf3d reviewed. Default-branch
code search did not recover native files; exact imports/known blob hashes
used instead. Source-relative paths under src/Development/AutomorphicArithmetic/:
 AutomorphicVarieties/GaloisLibrary/CrystallineBaseChange/
  QuadFam.lean cb75bc09b3065d1f24e341f271a97c38a739114e
  CqStmt.lean 13f9ae82d949d70758bdf3fc7c579eac88d41bbd
  TwCard.lean b68d8fe98a575e5f111442842e699ecb8bfab638
 AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/
  FrobeniusTraceCountBoundOfCmEigensystemCount.lean
   1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40
  VWinNumN.lean 3f28b91605976686fc854f34e16683ef2d700768
  LevelAdmissibleRestrictionHolds.lean f22dc88980db7cea30d6ab4e4380d927a36b94e0
  AutQN.lean d626de1e423ebf58d4b7357f69905fd98829ff51
 CyclotomicBounds/ClassNumberBounds/HeckeCharacterChoice/
  ExistsSqEqNegOfDiscr.lean 1f43abc39478ce8b39d0c1e8f89ded43e2101379
 ExistsQuadraticSignCharacter.lean blob 2f88a58801b17ae7fc3a5c392b624d5a16b960de
 (fetched by exact blob, path not independently resolved).

Human proof:
Native quadFam_one constructs K_i of discriminant -q_i, where q_i
are distinct primes congruent to 3 modulo 4. quadFam hides q_i in its
output; retain them by a strengthened copy of the producer, not by
assuming the existing QuadFam statement exposes them. The native
exists_sq_eq_neg_of_discr gives t_i^2=-q_i in K_i. Under the same
embeddings K_i -> Omega as countQ_alt, let theta_i be the image of t_i.
Since -q_i is nonsquare in Q, theta_i generates the embedded field.
The native sign theorem states delta_i(s)=1 iff s fixes K_i, and
delta_i(s) is +1 or -1. Therefore s(theta_i)=theta_i if delta_i(s)=1
and -theta_i otherwise. For a subset S, if product_{i in S} delta_i
is the trivial character, theta_S=product_{i in S} theta_i is fixed
by every s in Gal(Omega/Q), hence theta_S is rational by the fixed
field theorem used in the native sign construction. If S is nonempty,
theta_S^2=product_{i in S}(-q_i) has q_i-adic valuation 1 for i in S,
contradicting that it is a rational square. Thus the subset products
of signs are distinct, including the empty product. This supplies
injectivity for every subfamily, including after both prime exclusions.
No inference of independence from distinctness alone.

The set of self twists is closed under multiplication: if A conjugates
r to delta r and B conjugates r to eta r, then BA conjugates r to
(delta eta)r because the scalars commute. Identity is a self twist.
If m independent signs were all self twists, all 2^m distinct products
would be self twists. Applying actual twCard to this finite set yields

                       2^m <= n^2.

At rank 4 this permits at most four self-twist signs in any independent
subfamily. Take 7 fixed native fields. Remove at most one at p before
constructing D', leaving six. For each l and r, remove at most one
more at l, leaving five, before choosing an irreducible restriction.
All five cannot be self twists because 2^5=32>16. Then resTwo.1
gives IsIrr on the selected field; hA is used on ORIGINAL r, not on
a twist. Original hA, classifier construction, two-fibre Bool and
level/polarization premises survive. Constants c,A still chosen before
m,wt,H,M,p,l,r; D' constructed before l. Rank-four root source is
VWinNumN.number_sp4_of_admissible_to_admissible_n, whose exact
countQ_alt call is at n=4. This is not an arbitrary rank example.

Candidate overlay: copy the native quadFam producer retaining
q, primality, injectivity, discr=-q; use n=4 and size 7 for the fields,
Fin 6 after exists_avoid p, replacing the three occurrences of
n^2+1 at the finite-family construction/constant/rootSum sites.
After l is known choose a Fin 5 injection into Fin 6 by native
exists_avoid, and apply rankFourSelection42 to the composed sign map.
The product-injectivity bridge must be formalized from the above
squareclass argument; the code below explicitly takes it as input.
Use resTwo/hA and retain the original consumer tail exactly.
The new classifier is an alternative construction with different
constants, NOT equality to the old D'. The universal CountQAlt for
all n must be preserved; specialize only the actual rank-four consumer.
General n >=2 can instead choose floor(log2(n^2))+3 fields, but this
extension is not required here.

Important negative control at the actual rank-four caller: m is
![(e:Z)+1,e,1,0], so m(0)=m(1)+1, and m(2)=m(3)+1.
The tempting gap-only SafePA shortcut (valid for rank-two weights
(e,-e), e>=1) does NOT apply to this actual consumer. Thus no
safeUP/potQ deletion asserted here. ce4b2b8f's direct-restriction
correction is valid; coefficient-prime avoidance does not automatically
remove the remaining level/polarization/safety suppliers.

Executed connector JavaScript: 17 exact source/pin anchors; 128
distinct signed squarefree products, 127 nonempty odd-valuation
controls for primes [3,7,11,19,23,31,43]; 6336 finite exclusion/self-
twist-mask configurations (all two exclusions including absent,
all masks of size <=4); 15 six-field negative controls. Distinct
nontrivial F2 characters [1,2,3] give only four subset products,
not eight, confirming independence necessity. These are finite
algebra/cardinality regression controls, NOT native Galois or
number-field computations. Reproduce:
 for each mask in 0..127 compute product of -q_i for included i;
 assert distinct; for nonempty mask choose included i, verify
 product divisible by q_i and not q_i^2.
 for p,l in -1..6 and mask in 0..127 with popcount<=4:
   assert exists i in 0..6 with i!=p,l and mask bit i=0.
 for 0<=p<l<6 set mask=63 xor (1<<p) xor (1<<l):
   no survivor outside p,l and the four set bits.
 No claim that the negative masks arise in a given native host.

Local lean/lake/elan unavailable. Baseline published status blobs
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 read; both returncode 0
(runs 45577239749, 45576756833); conditional half-strip and tools
only, baseline axioms propext/Classical.choice/Quot.sound. No new
kernel verification or axiom evidence; new certificate uncompiled.
No URT speed claim. No import of the claimed RH root.

Original graph: number_sp4 -> countQ_alt -> quadFam,p-avoid,signNe,
twCard,resTwo,hA,rootSum,countP_alt,bit_of_fibre and actual tail.
Candidate: rank4 countQ overlay -> strengthened quadFam, p/l-avoid,
independent subset products, selftwist group closure, twCard,
same resTwo/hA/rootSum/countP/bit_of_fibre and tail. Retain original
graph, other consumers, pending type/value/constructor/axiom evidence,
all uniform arithmetic/geometric/prime-window obligations.
Context key pin/toolchain,n=4,p,l,m,wt,M,Omega,r,ι,fixed family and
embeddings,sign map and squareclass witnesses. Backtrack to RUN41
or original if any native check fails; no global deletion.

RESUME HERE: replay the finite bridge below; formalize product
injectivity from the native fixed-field and square-root suppliers,
then substitute at actual rank-four CountQ. Focus on the real remaining
level/polarization/safe supplier and uniform VWinAt bound rather than
further constant-only optimization. Preserve original rank-four
adjacent-weight safety branch. HANDOFF TO math, kernel, Galois, integration.
VERDICT AGREE (direct restriction), DISAGREE (gap-only safety at rank 4),
PARTIAL (human local selection improvement; no new root closure).
-/

noncomputable section
open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Br
open scoped Matrix
namespace RHAudit42

private theorem selftwist_one42 {Γ k : Type} [Group Γ] [Field k] {n : ℕ}
    (r : Γ →* GL (Fin n) k) : RepIso r (tw r 1) := by
  refine ⟨1, fun s => ?_⟩
  apply Units.ext
  simp [tw_val]

private theorem selftwist_mul42 {Γ k : Type} [Group Γ] [Field k] {n : ℕ}
    (r : Γ →* GL (Fin n) k) (a b : Γ →* kˣ)
    (ha : RepIso r (tw r a)) (hb : RepIso r (tw r b)) :
    RepIso r (tw r (a*b)) := by
  obtain ⟨g, hg⟩ := ha
  obtain ⟨h, hh⟩ := hb
  refine ⟨h*g, fun s => ?_⟩
  have ea := congrArg (fun x : GL (Fin n) k => (x : Matrix (Fin n) (Fin n) k)) (hg s)
  have eb := congrArg (fun x : GL (Fin n) k => (x : Matrix (Fin n) (Fin n) k)) (hh s)
  simp only [tw_val, Units.val_mul] at ea eb
  apply Units.ext
  calc
    ((tw r (a*b) s : GL (Fin n) k) : Matrix (Fin n) (Fin n) k) =
        ((a s : kˣ) : k) • (((b s : kˣ) : k) • (r s : Matrix (Fin n) (Fin n) k)) := by
      simp only [tw_val, MonoidHom.mul_apply, Units.val_mul, mul_smul]
    _ = ((a s : kˣ) : k) • ((h : Matrix (Fin n) (Fin n) k) *
          (r s : Matrix (Fin n) (Fin n) k) * (h⁻¹ : GL (Fin n) k)) := by rw [eb]
    _ = (h : Matrix (Fin n) (Fin n) k) *
          (((a s : kˣ) : k) • (r s : Matrix (Fin n) (Fin n) k)) *
          (h⁻¹ : GL (Fin n) k) := by rw [mul_smul_comm, smul_mul_assoc]
    _ = (h : Matrix (Fin n) (Fin n) k) *
          ((g : Matrix (Fin n) (Fin n) k) * (r s : Matrix (Fin n) (Fin n) k) *
          (g⁻¹ : GL (Fin n) k)) * (h⁻¹ : GL (Fin n) k) := by rw [ea]
    _ = ((h*g * r s * (h*g)⁻¹ : GL (Fin n) k) : Matrix (Fin n) (Fin n) k) := by
      rw [mul_inv_rev]
      simp only [Units.val_mul, mul_assoc]

theorem product_bound42 {Γ k : Type} [Group Γ] [Field k] {n m : ℕ}
    (r : Γ →* GL (Fin n) k) (hr : IsIrr r)
    (d : Fin m → (Γ →* kˣ))
    (hinj : Function.Injective (fun S : Finset (Fin m) => ∏ i ∈ S, d i))
    (hall : ∀ i, RepIso r (tw r (d i))) : 2^m ≤ n^2 := by
  classical
  let f : Finset (Fin m) → (Γ →* kˣ) := fun S => ∏ i ∈ S, d i
  have hprod (S : Finset (Fin m)) : RepIso r (tw r (f S)) := by
    induction S using Finset.induction_on with
    | empty => simpa [f] using selftwist_one42 r
    | @insert i S hi ih =>
      simpa only [f, Finset.prod_insert hi] using selftwist_mul42 r (d i) (f S) (hall i) ih
  have h := twCard Γ k n r hr ((Finset.univ : Finset (Fin m)).powerset.image f) (by
    intro a ha
    obtain ⟨S, _, rfl⟩ := Finset.mem_image.1 ha
    exact hprod S)
  have hf : Function.Injective f := hinj
  rw [Finset.card_image_of_injective _ hf, Finset.card_powerset, Finset.card_univ, Fintype.card_fin] at h
  exact h

theorem rankFourSelection42 {Γ k : Type} [Group Γ] [Field k]
    (r : Γ →* GL (Fin 4) k) (hr : IsIrr r)
    (d : Fin 5 → (Γ →* kˣ))
    (hinj : Function.Injective (fun S : Finset (Fin 5) => ∏ i ∈ S, d i)) :
    ∃ i, ¬ RepIso r (tw r (d i)) := by
  classical
  by_contra! hall
  have h := product_bound42 r hr d hinj hall
  norm_num at h

theorem rankFourReplay42 {Γ k : Type} [Group Γ] [Field k]
    (r : Γ →* GL (Fin 4) k) (hr : IsIrr r)
    (d : Fin 5 → (Γ →* kˣ))
    (hinj : Function.Injective (fun S : Finset (Fin 5) => ∏ i ∈ S, d i)) :
    ∃ i, ¬ RepIso r (tw r (d i)) := by
  first
  | (rh_reduce 2 using [rankFourSelection42 r hr d hinj]; done)
  | (rh_auto 2; done)
  | (rh_auto_frontier 2; done)
  | exact rankFourSelection42 r hr d hinj
end RHAudit42

rh_scan UpperTheory.GalN.V.Win.N.number_sp4_of_admissible_to_admissible_n limit 2000
rh_scan UpperTheory.GalN.V.Win.N.countQ_alt limit 2000
rh_scan RHAudit42.rankFourSelection42 limit 2000
rh_prune RHAudit42.rankFourSelection42 as RHAudit42RankFourPruned
#print axioms RHAudit42.product_bound42
#print axioms RHAudit42.rankFourSelection42
#print axioms RHAudit42.rankFourReplay42
