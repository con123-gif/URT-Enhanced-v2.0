import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.SFinal
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN41 lane 3 prime_window, 25 November 2026. SOURCE-MATCHED HUMAN /
PREPARED, NOT COMPILED. RH OPEN.
Mission latest f8b4b837301f8cf43d673be4979f04c4e4b415a4 (mandatory
engine), SWARM, HANDOFF, EXPANSION, AGENTS, state/log/protocol openings,
continuity and CI summary consulted. Latest 25 commits surveyed;
integration 2785c414, acceleration 33888226, literature 1f13cbb4,
dependency 46e9230b inspected. Prior RUN40 bed688c0 (blob 3b8ba2d2).
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream HEAD 07be9a52ebbee066d706195cad0f6863880f9284
observed but not substituted. Lean 4.33.1 / Mathlib
0df444a360eaa60ab8c11dca51a86af692955474.

RESULT: stronger native relative-index divisibility, and a proof
of RUN40's aggregate local-index budget by finite Galois inertia
rather than completion comparison. At each v|l of a number field F
write e_v = ramification index, f_v = residue degree, and i_v =
index of the image of the local decomposition group under cycZ.
Then i_v divides e_v, and
       sum_v f_v*i_v <= sum_v f_v*e_v = [F:Q].
This is stronger than RUN40's unweighted sum. No Galois hypothesis
on F/Q. The native ineOpen proof already obtains the divisibility
for its inertia image by the relative subgroup index; it then
discards that stronger intermediate result. Expose it, transfer
by ineImage_le_decImage, and do NOT individually bound by [F:Q].

Human proof of the ramification identification (not Lean replay):
Embed F in Omega via the native algebra map; take its finite normal
closure M/Q in Omega. For each chosen valuation A_v over v, let w
be its restriction to M, and I_M inertia at w over l. The absolute
inertia I in Gal(Omega/Q) maps onto I_M under restriction (standard
surjectivity of inertia in towers of Galois extensions of valued
fields). The fixing group H=Gal(Omega/F) contains the kernel of the
restriction to M. Consequently
 [I:I intersect H] = [I_M:I_M intersect Gal(M/F)]
                   = e(w/l)/e(w/v) = e(v/l).
Here I_M intersect Gal(M/F) is precisely inertia over F: being in
the kernel of the action on the residue field of M is the same
condition in either decomposition group. Use multiplicativity of
ramification index in this finite tower, including nonnormal F/Q.
The chosen A_v induces the l-adic valuation on Q since l lies in
its maximal ideal. All v in D.S are exactly the primes above l
by D.hS. The fundamental identity sum e_v*f_v=[F:Q] for number
fields now supplies the aggregate bound and f_v>=1. No independent
host or completion is chosen for a different term. This provides
the previously missing human proof of the finite orbit interface
using actual native groups, without assuming RH or quantitative Sha.

Additional consequence, same local supplier and weight w>=1:
if (l-1) does not divide e_v*w, then nu(l,U_v,w)=0, where U_v
is decImage. Indeed reduction U_v -> (Z/l)^* has image of index d
dividing i_v and hence e_v. A cyclic group of order (l-1)/d cannot
be killed by w unless l-1 divides d*w. Thus if the stated condition
fails some u in U_v has u^w-1 a unit. This kills that entire local
correction, not merely its upper bound. At odd l the surviving
correction is <= 1+v_l(e_v)+v_l(w): the unit 1+l raised to i_v
belongs to U_v by the index theorem, and odd-prime LTE gives the
bound. For l=2 retain the original 2+valuation bound. This
corollary is human-only here; do not use it to retire other callers
or claim l is unramified on the actual auxiliary fields.

Pinned native paths relative to AutomorphicVarieties:
GaloisLibrary/GaloisCohomologyLength/IneOpen.lean
  1379a7d94a7506cb119dd039428075c937b7be5d
GaloisLibrary/GaloisCohomologyLength/LevelInertiaLeLevelDec.lean
  497c591dbb6981c12b4e99d280ed1c81d356adaf
ModularityArgument/ClassCounting/SFinal.lean
  a960a48653fa69c34f72f5f8ed434135ff1163a6
Relative to AutomorphicArithmetic/CyclotomicBounds/ClassNumberBounds/
TotallyRealRoots:
GalDefs.lean 390b675121ff2219b7b688653437eb3b1295b970
EmultiplicityPowSubOneOdd.lean 7aca092c240732039889174659be1edd4f078f10

Original selected graph: VWin -> LemmaK -> SFinal -> sf_loc ->
ineOpen (global index bound), cardAbove, sf_nu. Candidate:
SFinal40 -> local budget -> ramificationAccounting41,
decIndexRel41 -> ineIndexRel41 (actual native proof body prefix)
and weightedBound41. The remaining FORMAL interface is precisely
restriction-surjectivity for absolute inertia, finite inertia tower
identification and the ramification-degree identity; these standard
mathematical facts have not yet been connected to native Lean
definitions. ramificationAccounting41 is a conditional input in
this file, not a new accepted axiom. The human argument above
discharges it mathematically. Preserve prior graphs and pending
type/value/constructor/axiom evidence. Latest peers bypass H2 at
tower and CountVs, not the sibling counts, so SFinal remains
relevant at their callers; do not claim removal of ShaK, CountI/II/V,
BOdd, geometry or RH window. Cache by pin/toolchain, F, Omega, l,
D, A_v and exact valuation/field choices. Backtrack to original
sf_loc if native replay fails. No URT speedup claimed.

Execution: 13 fail-on-error connector JS source checks of pinned
blobs, extracted proof prefix and actual SFinal/RUN40 caller anchors.
Local Python integer certificate below executed successfully:
1056 actual cyclotomic fields/subfields and coefficient-prime cases,
12672 exact index/degree assertions, 45 strict i_D<e cases,
14080 residue-weight cases, 9740 forced vanishing cases.
Negative control: Q(zeta_9) at 3 has (n,r,e,f,i_D)=(6,1,6,1,6);
one cannot bound the index by residue degree alone. Finite tests
do not prove the absolute inertia identification or ShaK.
Local lean/lake not on PATH. Retrieved actual historical CI status
blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 (runs 45577239749 and
45576756833, returncode 0); baseline only. New file uncompiled
and not registered in native queue here; engine and axiom requests
below are prepared, not results.

Reproduce Python checks (stdlib, exact):
from math import gcd,lcm
cases=checks=strict=vanish_checks=vanish_count=0
maxram=None
for m in range(3,91):
 for p in (2,3,5,7,11,13):
  N=lcm(m,p*p); P=1; q=N
  while q%p==0:P*=p;q//=p
  G=[x for x in range(N) if gcd(x,N)==1]
  U={x%P for x in G}
  C=set();x=1%q
  while x not in C:C.add(x);x=x*p%q
  I=[x for x in G if x%q==1%q];D=[x for x in G if x%q in C]
  for real in (False,True):
   H={x for x in G if x%m==1 or (real and x%m==m-1)}
   IH=[x for x in I if x in H];DH=[x for x in D if x in H]
   assert len(G)%len(H)==len(I)%len(IH)==len(D)%len(DH)==0;checks+=3
   n=len(G)//len(H);e=len(I)//len(IH);d=len(D)//len(DH)
   assert d%e==n%d==0;checks+=2
   f=d//e;r=n//d
   UI={x%P for x in IH};UD={x%P for x in DH}
   assert len(U)%len(UI)==len(U)%len(UD)==0;checks+=2
   iI=len(U)//len(UI);iD=len(U)//len(UD)
   assert iI==e and e%iD==0 and r*f*e==n and r*f*iD<=n and r*iD<=n;checks+=5
   if iD<e:strict+=1
   if p>2:
    res={u%p for u in UD}
    for w in range(1,17):
     if e*w%(p-1):
      assert any(pow(u,w,p)!=1 for u in res)
      vanish_count+=1
     if all(pow(u,w,p)==1 for u in res):
      assert e*w%(p-1)==0
     vanish_checks+=1
   if m==9 and p==3 and not real:maxram=(n,r,e,f,iD)
   cases+=1
assert maxram==(6,1,6,1,6)
print(cases,checks,strict,vanish_checks,vanish_count,maxram)

RESUME HERE: replay relative-index native proof prefix; formalize
the exact finite inertia tower equality at the original D.A v
and sum e_v*f_v using actual Mathlib ramification APIs. Feed
budget41_of_ramification41 into RUN40.sFinal40 (its LocalIndexBudget40
is definitionally the same proposition), then replay remaining
count callers with peers' shared Sha witness. Independently audit
the inertia restriction proof and local vanishing cutoff. Do not
spend further runs refining already absorbed constants if no actual
caller dependency disappears; prioritize uniform SNum/ShaK and
remaining quantitative suppliers. HANDOFF TO integration, Galois,
kernel, literature, audit.
-/

noncomputable section
open NumberField IsDedekindDomain ReciprocityTheory.Gal Formalism.ConjugateSelfDual Formalism.GaloisCohomology UpperTheory.V UpperTheory.V.LDataCardLeFinrank
open scoped BigOperators
namespace RHPrime41

def relIndex41 (F Ω : Type) [Field F] [NumberField F] [Field Ω]
    [CharZero Ω] [Algebra F Ω] (A : ValuationSubring Ω) : ℕ :=
  (IsScalarTower.toAlgHom ℚ F Ω).fieldRange.fixingSubgroup.relIndex (Ine (F := ℚ) A)

theorem ineIndexRel41
    (F Ω : Type) [Field F] [NumberField F] [Field Ω] [CharZero Ω]
    [Algebra F Ω] [IsAlgClosure F Ω] (l : ℕ) [Fact l.Prime]
    (v : HeightOneSpectrum (𝓞 F)) (A : ValuationSubring Ω)
    (hl : v ∈ Above F l) (hA : IsPlaceOver A v) :
    relIndex41 F Ω A ≠ 0 ∧ (ineImage F l A).index ∣ relIndex41 F Ω A := by
  have : IsAlgClosed Ω := IsAlgClosure.isAlgClosed F
  have : Algebra.IsAlgebraic ℚ Ω := Algebra.IsAlgebraic.trans ℚ F Ω
  have : IsAlgClosure ℚ Ω := ⟨inferInstance, inferInstance⟩
  have : IsGalois ℚ Ω := IsAlgClosure.isGalois ℚ Ω
  have : IsGalois F Ω := IsAlgClosure.isGalois F Ω
  have hl' : ((l : ℕ) : 𝓞 F) ∈ v.asIdeal := hl
  have hv : A.valuation (l : Ω) < 1 := by
    simpa using (hA _).2 hl'
  let K : IntermediateField ℚ Ω := (IsScalarTower.toAlgHom ℚ F Ω).fieldRange
  have hK : Module.finrank ℚ F = K.fixingSubgroup.index := by
    rw [← IntermediateField.finrank_eq_fixingSubgroup_index]
    exact (AlgEquiv.ofInjectiveField (IsScalarTower.toAlgHom ℚ F Ω)).toLinearEquiv.finrank_eq
  have hK0 : K.fixingSubgroup.index ≠ 0 := by
    rw [← hK]; exact Module.finrank_pos.ne'
  let I : Subgroup (G ℚ Ω) := Ine (F := ℚ) A
  let f : I →* ℤ_[l]ˣ := (cycZ ℚ Ω l).comp I.subtype
  have hf : Function.Surjective f := fun u => by
    obtain ⟨σ, hσ, h⟩ := GlobalTheory.CycInertia.cycZ_Ine_surjective Ω l A hv u
    exact ⟨⟨σ, hσ⟩, h⟩
  have hle : (K.fixingSubgroup.subgroupOf I).map f ≤ ineImage F l A := by
    rintro _ ⟨σ, hσ, rfl⟩
    have hmem : σ.1 ∈ K.fixingSubgroup := hσ
    let g : G F Ω := { σ.1.toRingEquiv with
      commutes' := fun x => (IntermediateField.mem_fixingSubgroup_iff _ _).1 hmem _ ⟨x, rfl⟩ }
    exact ⟨g, σ.2, rfl⟩
  have hrel0 : K.fixingSubgroup.relIndex ⊤ ≠ 0 := by rwa [Subgroup.relIndex_top_right]
  have hrel : K.fixingSubgroup.relIndex I ≤ K.fixingSubgroup.index := by
    rw [← Subgroup.relIndex_top_right]
    exact Subgroup.relIndex_le_of_le_right le_top hrel0
  have hrelI : K.fixingSubgroup.relIndex I ≠ 0 := fun h =>
    hrel0 (Subgroup.relIndex_eq_zero_of_le_right le_top h)
  have hdvd : (ineImage F l A).index ∣ K.fixingSubgroup.relIndex I :=
    (Subgroup.index_dvd_of_le hle).trans (Subgroup.index_map_dvd _ hf)
  exact ⟨by simpa [relIndex41, K, I] using hrelI,
    by simpa [relIndex41, K, I] using hdvd⟩

theorem decIndexRel41
    (F Ω : Type) [Field F] [NumberField F] [Field Ω] [CharZero Ω]
    [Algebra F Ω] [IsAlgClosure F Ω] (l : ℕ) [Fact l.Prime]
    (v : HeightOneSpectrum (𝓞 F)) (A : ValuationSubring Ω)
    (hl : v ∈ Above F l) (hA : IsPlaceOver A v) :
    relIndex41 F Ω A ≠ 0 ∧ (decImage F l A).index ∣ relIndex41 F Ω A := by
  obtain ⟨h0, hd⟩ := ineIndexRel41 F Ω l v A hl hA
  exact ⟨h0, (Subgroup.index_dvd_of_le (ineImage_le_decImage F l A)).trans hd⟩

theorem weightedBound41 {ι : Type*} [Fintype ι] (i r f : ι → ℕ)
    (hf : ∀ v, 0 < f v) (hr : ∀ v, r v ≠ 0)
    (hd : ∀ v, i v ∣ r v) :
    (∑ v, f v * i v) ≤ ∑ v, f v * r v := by
  classical
  exact Finset.sum_le_sum fun v _ =>
    Nat.mul_le_mul_left (f v) (Nat.le_of_dvd (Nat.pos_of_ne_zero (hr v)) (hd v))

def RamificationAccounting41 : Prop :=
  ∀ (l : ℕ) [Fact l.Prime] (F Ω : Type) [Field F] [NumberField F]
    [Field Ω] [CharZero Ω] [Algebra F Ω] [IsAlgClosure F Ω] (D : LData F Ω l),
      ∃ f : D.S → ℕ, (∀ v, 0 < f v) ∧
        (∑ v : D.S, f v * relIndex41 F Ω (D.A v)) = Module.finrank ℚ F

-- The conclusion is exactly RUN40.LocalIndexBudget40, without importing
-- that as-yet uncompiled overlay.
theorem budget41_of_ramification41 (hR : RamificationAccounting41) :
    ∀ (l : ℕ) [Fact l.Prime] (F Ω : Type) [Field F] [NumberField F]
      [Field Ω] [Algebra F Ω] [IsAlgClosure F Ω] (D : LData F Ω l),
      (∑ v : D.S, (decImage F l (D.A v)).index) ≤ Module.finrank ℚ F := by
  intro l _ F Ω _ _ _ _ _ D
  classical
  haveI : CharZero Ω := charZero_of_injective_algebraMap (algebraMap F Ω).injective
  obtain ⟨f, hf, hsum⟩ := hR l F Ω D
  let i : D.S → ℕ := fun v => (decImage F l (D.A v)).index
  let r : D.S → ℕ := fun v => relIndex41 F Ω (D.A v)
  have hv : ∀ v, r v ≠ 0 ∧ i v ∣ r v := fun v =>
    decIndexRel41 F Ω l v (D.A v) (above_of_mem D v) (D.hA v)
  change (∑ v, i v) ≤ Module.finrank ℚ F
  calc
    (∑ v, i v) ≤ ∑ v, f v * i v := Finset.sum_le_sum fun v _ => by
      simpa using Nat.mul_le_mul_right (i v) (show 1 ≤ f v from hf v)
    _ ≤ ∑ v, f v * r v := weightedBound41 i r f hf (fun v => (hv v).1) (fun v => (hv v).2)
    _ = Module.finrank ℚ F := hsum

theorem budget41_replay (hR : RamificationAccounting41) :
    ∀ (l : ℕ) [Fact l.Prime] (F Ω : Type) [Field F] [NumberField F]
      [Field Ω] [Algebra F Ω] [IsAlgClosure F Ω] (D : LData F Ω l),
      (∑ v : D.S, (decImage F l (D.A v)).index) ≤ Module.finrank ℚ F := by
  first
  | (rh_reduce 2 using [budget41_of_ramification41]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact budget41_of_ramification41 hR

end RHPrime41
rh_scan UpperTheory.V.LDataCardLeFinrank.ineOpen limit 2000
rh_scan RHPrime41.ineIndexRel41 limit 2000
rh_scan RHPrime41.budget41_of_ramification41 limit 2000
rh_scan UpperTheory.V.ZK.sFinal limit 2000
rh_prune RHPrime41.budget41_replay as RH41BudgetPruned
#print axioms RHPrime41.ineIndexRel41
#print axioms RHPrime41.decIndexRel41
#print axioms RHPrime41.weightedBound41
#print axioms RHPrime41.budget41_of_ramification41
#print axioms UpperTheory.V.ZK.sFinal
end
