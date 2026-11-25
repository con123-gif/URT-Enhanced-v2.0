import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.SUpperOf
import Development.EtaleCohomology.CyclotomicDiscriminants.SFewOfCut
import Mathlib.GroupTheory.QuotientGroup.Basic
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN40 lane 13, 25 Nov 2026. Human mathematical reduction / SOURCE-MATCHED /
PREPARED Lean, NOT COMPILED. RH OPEN.

RESULT: at the native SUpperOf scaled cycle consumer, quotient the actual
Bockstein image before counting fibres. This is a further reduction beyond
literature RUN31 ec9819bb (which restricts to q-torsion but not the scaled
image quotient). No URT claim, no change of host or uniform quantifiers.

Let q=l^nu, k the native even index, Y the mod-q cycle group, beta:Y->T
the actual Bockstein, T=tors H_k, f=Phi restricted to cycles and
g=l^k f. Let a=l^(nu-k) with truncated natural subtraction, I=im beta.
Then a*g=0 exactly, including k>=nu. For the finite set S in g(Y),
the native bound c on every finite subset of g(ker beta) suffices for

  |S| <= c |I/aI| = c |I[a]| <= c |T[a]|.

Proof: define beta' as Y -> I -> I/aI. If beta'(y)=0, then
beta(y)=a beta(z) for some z in Y, using the ACTUAL image I.
Set y'=y-a z. Now beta(y')=0 and g(y')=g(y)-a g(z)=g(y).
Therefore g(ker beta')=g(ker beta) exactly. Apply native fibCount
to beta' and the same c. Since I is finite, multiplication by a has
kernel I[a] and image aI, and the quotient has cardinal |I[a]|.
The inclusion I[a] -> T[a] is injective. No canonical isomorphism
between quotient and kernel is asserted.

Here native c=q^r tc(L,N,k+1), r=nrComplexPlaces L,
N=2*(k+1)+4. TorsStab's actual additive equivalence transports
a-torsion to the SAME stable anchor N. Consequently the native
SUpper bound becomes q^r tc(L,N,k+1) * |tors H_k(GL_N(O_L))[a]|.
One may retain RUN31's independent q-primary restriction on the
first factor if its own proof is checked; this run does NOT claim
a smaller exponent in the rankCount factor. At nu<=k, g=0 so
|S|<=1 without either homology count. In SFewOfCut.sFewOf the
actual k is 2e+2; the existing injection uses precisely this scaled
map, so the bound transfers with no change to separation premises.
For the actual sNum uniform-in-nu bound the worst case can still
recover the full primary torsion, so no new uniform ShaK bound or
asymptotic RH-scale claim. This is finite-level structural compression.

NEGATIVE CONTROL: replacing I/aI by T/aT is NOT valid. Take
q=4,k=1,Y=T=B=Z/4, beta(y)=2y, f(y)=y, g(y)=2y.
Then g(ker beta)={0}, g(Y)={0,2}. Projection to T/2T is zero on
I; projection to I/2I has two classes. The full-target quotient
would give the false bound 2<=1. This is why the exact image and
lift witness, rather than an arbitrary ambient quotient, matter.

Source pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Native paths relative to AutomorphicVarieties:
ModularityArgument/ClassCounting/SUpperOf.lean 8cccf88aa58f6e2bd69f080e46f4f10b4248d559
ModularityArgument/ClassCounting/TorsionRankCounts/RankCount.lean 86433021ed2fcc3b36779bb539973123997b1021
.../RankCountAlt.lean 28a67533865647e2e00f1726ebec376f3e34136d
.../BockAbs.lean b52c8a47f9b451519312f6a854281bc807254a56
.../FibCount.lean ec22835beda82515f5689cb161abe44e3d023682
.../TorsStab.lean 75aec7ac2e31d217179077cc1febeb2f7c612d42
ModularityArgument/ClassCounting/LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10
ModularityArgument/ClassCounting/LemmaKOfLitN.lean 2b1e21f70e69ace53b5219e9e0807b6de0d1920e
ModularityArgument/ClassCounting/NumThree.lean 900c8e3fca10cdf9256061213dcc9453bf98f3d2
ModularityArgument/ClassCounting/ExponentLe.lean 2b3e4233ad68b7007573c70feaf4703d85452b47
src/Development/EtaleCohomology/CyclotomicDiscriminants/SFewOfCut.lean 1c294cd3b56d004fc313c2e2febb40cf637e0b52.
Mathlib/GroupTheory/QuotientGroup/Basic.lean bbdc8d6ab39546a6ee6bc5856b875c82f4fabd08 (rangeRestrict and quotient map API inspected, not replayed).

Original selected source graph:
VWin -> LemmaK/ShaK -> sNum -> SFewOfCut.sFewOf ->
sUpperOf -> Bock, FibCount(T), RankCount, TorsStab, Descend,
ZVal, BOdd, SChain.
Candidate local replacement: same graph, except FibCount consumes
I/aI, via exact scaled_kill and same-fibre adjustment. Original
Bock and finite stable torsion still required; no global retirement.
At saturated levels nu<=k, entire scaled count follows from g=0.
No assertion that this local branch resolves CountI/II/V/Vs or TopG.
Preserve all original/reduced role, type/value/constructor graphs,
axiom evidence, unexpanded dependencies and peer candidates.
Cache key pin + toolchain + actual L,l,nu,k,n,cycle boundary, beta,
Phi,B, stable equivalence, finite S. Do not merge different beta
images even if target groups or their total orders agree.
Backtrack to original native FibCount or RUN31 if replay fails.

Preflight: latest mission f8b4b837301f8cf43d673be4979f04c4e4b415a4
(including mandatory pipeline), original mission e0dc8f7f blob
4a45e612ebcf84aa6f0e5be8ee1c7b154b20773d, SWARM 4b77b161,
HANDOFF bbc46df7, AGENTS 8db0201d, state/log/protocol/continuity
openings and summary inspected. Latest 22 peer commit titles
surveyed; a5f9e057 (shared Sha), 2f96ecf8 (qualitative finiteness),
20e156a7 (G0), 72bd1ee1 (adjacent budget) and ec9819bb (primary
torsion) patches read; own 30a2c2d retained. No redundant exponent
improvement or independent existential witness introduced.
Two attempted incorrect source filenames Upper.lean/UpperOf.lean
returned 404; corrected to actual SUpperOf.lean.

Execution: connector JS integer tests: 2462 cyclic map configurations
(1933 strict improvements over T[q] bound, 1494 saturated); 18763
two-dimensional finite module map configurations, all asserted
inequality and annihilation checks held. One explicit invalid
ambient quotient negative control. These are regression controls
for the algebra, NOT actual number field or Lean tests.
Reproduction JS (no dependencies):
const assert=b=>{if(!b)throw Error("failure")};
const gcd=(a,b)=>b?gcd(b,a%b):a;
let n=0,strict=0,saturated=0,multi=0;
for(const l of [2,3,5])for(let nu=0;nu<=3;nu++){
 let q=l**nu;if(q>16)continue;
 for(let k=0;k<=nu+2;k++){
 let a=l**Math.max(nu-k,0);
 for(const m of [1,l,l*l,l*l*l])for(let b=0;b<m;b++){
 if(q*b%m)continue;
 for(let f=0;f<q;f++){
 let I=new Set(),aI=new Set(),G=new Set(),K=new Set();
 for(let y=0;y<q;y++){
 let t=b*y%m,g=(l**k*f*y)%q;
 I.add(t);aI.add(a*t%m);G.add(g);if(t===0)K.add(g);
 assert(a*g%q===0);}
 let idx=I.size/aI.size;
 assert(Number.isInteger(idx));assert(G.size<=K.size*idx);
 assert(idx<=gcd(a,m));assert(gcd(a,m)<=gcd(q,m));
 if(idx<gcd(q,m))strict++;
 if(k>=nu){assert(G.size===1);saturated++;}n++;}}}}
for(const q of [2,3,4]){
 let l=q===3?3:2,nu=q===4?2:1;
 for(let k=0;k<=nu+1;k++){let a=l**Math.max(nu-k,0);
 for(let b00=0;b00<q;b00++)for(let b01=0;b01<q;b01++)
 for(let b10=0;b10<q;b10++)for(let b11=0;b11<q;b11++)
 for(let f0=0;f0<q;f0++)for(let f1=0;f1<q;f1++){
 let I=new Set(),aI=new Set(),G=new Set(),K=new Set();
 for(let x=0;x<q;x++)for(let y=0;y<q;y++){
 let t0=(b00*x+b01*y)%q,t1=(b10*x+b11*y)%q,
 g=l**k*(f0*x+f1*y)%q;
 I.add(t0*q+t1);aI.add((a*t0%q)*q+a*t1%q);G.add(g);
 if(t0===0&&t1===0)K.add(g);}
 let idx=I.size/aI.size;
 assert(Number.isInteger(idx));assert(G.size<=K.size*idx);
 assert(idx<=gcd(a,q)**2);multi++;}}}
assert(new Set([0,2]).size>new Set([0]).size);
console.log({n,strict,saturated,multi});

Local command -v lean/lake/elan found none. Published baseline
status.json b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 read with returncode 0
(45577239749,45576756833); no new CI run or new axiom evidence.
The exact quotient and scaled native consumer below are replay
candidates, not a verified native SUpperOf substitution.

RESUME HERE: compile this module and RUN31 in warmed pinned runner.
At actual SUpperOf key := hF ... replace hF with native_scaled_fiber
using the same beta,g and unchanged c, then prove the quotient-card
identity and transport along TorsStab's additive equivalence. Retain
fallback. Next check whether SUpper's rank factor can be reduced to
a^r via local annihilation on the actual span of u*zSeq, and whether
SSha can use that refinement without dropping the all-level quantifier.
HANDOFF TO kernel, literature, audit, integration.
-/

open UpperTheory.V.KL UpperTheory.V.ZK.Up

namespace RHScaledBock40

def imagePower {Y T : Type} [AddCommGroup Y] [AddCommGroup T]
    (β : Y →+ T) (a : ℕ) : AddSubgroup β.range :=
  (nsmulAddMonoidHom a : β.range →+ β.range).range

theorem fiber_quotient {Y T U B : Type} [AddCommGroup Y] [AddCommGroup T]
    [AddCommGroup U] [AddCommGroup B] [Finite U]
    (β : Y →+ T) (π : T →+ U) (g : Y →+ B) (a c : ℕ)
    (hg : ∀ y : Y, a • g y = 0)
    (hπ : ∀ y : Y, π (β y) = 0 → ∃ z : Y, β y = a • β z)
    (hc : ∀ S : Finset B, (∀ s ∈ S, ∃ y, β y = 0 ∧ s = g y) → S.card ≤ c)
    (S : Finset B) (hS : ∀ s ∈ S, ∃ y, s = g y) :
    S.card ≤ c * Nat.card U := by
  refine fibCount Y U B (π.comp β) g c ?_ S hS
  intro W hW
  apply hc W
  intro s hs
  obtain ⟨y,hy,hsy⟩ := hW s hs
  obtain ⟨z,hz⟩ := hπ y hy
  refine ⟨y - a • z, ?_, ?_⟩
  · rw [map_sub, map_nsmul, hz, sub_self]
  · rw [map_sub, map_nsmul, hg, sub_zero]
    exact hsy

theorem image_fiber {Y T B : Type} [AddCommGroup Y] [AddCommGroup T]
    [AddCommGroup B] [Finite T] (β : Y →+ T) (g : Y →+ B)
    (a c : ℕ) (hg : ∀ y : Y, a • g y = 0)
    (hc : ∀ S : Finset B, (∀ s ∈ S, ∃ y, β y = 0 ∧ s = g y) → S.card ≤ c)
    (S : Finset B) (hS : ∀ s ∈ S, ∃ y, s = g y) :
    S.card ≤ c * Nat.card (β.range ⧸ imagePower β a) := by
  letI : Finite β.range := Finite.of_injective (fun x : β.range => (x : T)) Subtype.val_injective
  let π : β.range →+ (β.range ⧸ imagePower β a) := QuotientAddGroup.mk' _
  letI : Finite (β.range ⧸ imagePower β a) :=
    Finite.of_surjective π (QuotientAddGroup.mk'_surjective _)
  refine fiber_quotient β.rangeRestrict π g a c hg ?_ ?_ S hS
  · intro y hy
    have hy' : β.rangeRestrict y ∈ imagePower β a :=
      (QuotientAddGroup.eq_zero_iff _).mp hy
    obtain ⟨w,hw⟩ := hy'
    obtain ⟨z,hz⟩ := w.property
    refine ⟨z, ?_⟩
    have hwz : β.rangeRestrict z = w := Subtype.ext hz
    rw [hwz]
    exact hw.symm
  · intro W hW
    apply hc W
    intro s hs
    obtain ⟨y,hy,hsy⟩ := hW s hs
    exact ⟨y, congrArg Subtype.val hy, hsy⟩

theorem scaled_kill {B : Type} [AddCommGroup B] (l ν k : ℕ)
    (hB : ∀ b : B, l ^ ν • b = 0) (b : B) :
    l ^ (ν-k) • (l ^ k • b) = 0 := by
  have he : ν-k+k = (ν-k+k-ν)+ν := by omega
  rw [← mul_smul, ← pow_add, he, pow_add, mul_smul, hB, smul_zero]

theorem native_scaled_fiber {B G : Type} [Group G] [AddCommGroup B]
    (l ν k : ℕ) [Module (ZMod (l ^ ν)) B]
    (β : LinearMap.ker (bd (ZMod (l ^ ν)) G k) →+
      AddCommGroup.torsion (grpH G k))
    [Finite (AddCommGroup.torsion (grpH G k))]
    (Φ : Ch (ZMod (l ^ ν)) G (k+1) →ₗ[ZMod (l ^ ν)] B)
    (c : ℕ)
    (hc : ∀ S : Finset B, (∀ s ∈ S, ∃ y, β y = 0 ∧ s = l ^ k • Φ y.1) → S.card ≤ c)
    (S : Finset B) (hS : ∀ s ∈ S, ∃ y : LinearMap.ker (bd (ZMod (l ^ ν)) G k),
      s = l ^ k • Φ y.1) :
    S.card ≤ c * Nat.card (β.range ⧸ imagePower β (l ^ (ν-k))) := by
  let g : LinearMap.ker (bd (ZMod (l ^ ν)) G k) →+ B :=
    (nsmulAddMonoidHom (l ^ k)).comp
      (Φ.toAddMonoidHom.comp (LinearMap.ker (bd (ZMod (l ^ ν)) G k)).subtype.toAddMonoidHom)
  have hqB : ∀ b : B, l ^ ν • b = 0 := fun b => by
    rw [← Nat.cast_smul_eq_nsmul (ZMod (l ^ ν)), ZMod.natCast_self, zero_smul]
  apply image_fiber β g (l ^ (ν-k)) c ?_ hc S hS
  intro y
  exact scaled_kill l ν k hqB (Φ y.1)

theorem originalFiber : FibCount := by
  first
  | (rh_reduce 2 using [fibCount]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact fibCount

end RHScaledBock40

rh_prune RHScaledBock40.fiber_quotient as RHScaledBock40.FiberPruned
rh_scan UpperTheory.V.ZK.sUpperOf limit 2000
rh_scan RHScaledBock40.native_scaled_fiber limit 2000
#print axioms UpperTheory.V.ZK.sUpperOf
#print axioms RHScaledBock40.fiber_quotient
#print axioms RHScaledBock40.image_fiber
#print axioms RHScaledBock40.native_scaled_fiber
