import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.SelmerOrderCounts.TwoLe
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN47, 26 November 2026, prime-window lane 3. HUMAN SOURCE-MATCHED exact
class/local rank identity; native weaker bound PREPARED, NOT COMPILED.
RH OPEN. No direct import of the claimed RH theorem.

After RUN46's artificial-pole obstruction, backtrack to the actual native
LemmaK -> sNum -> sCount -> Ct.selLCard supplier, rather than another
equivalent prime criterion. Current peer audit ba04fa11 normalizes torsion
in SelInv; e897aeb5 retains the unit valuation. This run independently
addresses the remaining SelL rank (not a second proof of either peer).
Latest peers 086052c6,27896ee5,5744b095,9a71ca2c,c5fe320e,94cfd3a4,
ba04fa11,8be39223,4daf9080,e897aeb5,2b75bc4a indexed; relevant diffs read.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory
engine, AGENTS, SWARM, HANDOFF, EXPANSION, continuity/state/log/protocol
consulted. Pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream latest
observed 2746005d8130ee6d0c82d771ec11d69521a65093 not adopted.
Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

## Exact joint class-local rank cancellation

For the actual native SelL(l,L) (TwoLe.lean), put S={primes of L above l},
g=|S|, C=Cl(O_L), H=<[p]:p in S>, C_S=C/H, r=rank O_L^*,
delta=1 if mu_l is contained in L, 0 otherwise. Let
d=dim_F_l image(H -> C/lC), a=dim_F_l C/lC.
For every number field and prime l, exactly
    |SelL(l,L)| = l^(r+g+delta) |C_S[l]|
                 = l^(r+g+delta-d) |C[l]|.
This removes the simultaneous counting of an independent local valuation
and the same class direction. d<=min(g,a), so all exponents nonnegative.
No assumption on the class number, no RH. Do not replace d by rank H:
a nonzero subgroup may lie inside lC.

Proof directly in the native three-index filtration (SelLCard.lean):
P=(L^*)^l, U=O_L^* P, H0={y:(y) is an l-th ideal power},
Hval={y:ord_p y divisible by l away from S}. SelL=Hval/P.
1. U/P has exact order l^(r+delta) by Dirichlet units and the finite
cyclic torsion group. Any l-th root in L of an ordinary unit is a unit,
by valuations, hence no kernel beyond l-th powers of units.
2. H0/U -> C[l], y -> [I] where I^l=(y), is bijective:
fractional ideal group is free abelian, so I unique; kernel precisely
U (I principal iff y is unit times l-th power); any l-torsion ideal
class has I^l principal, giving a preimage. This is the native psi map.
3. Native phi : Hval/H0 -> F_l^S is injective by all-prime valuations.
Its image is EXACTLY ker(j:F_l^S -> C/lC, e -> sum_p e_p[p]).
Necessity: (y)=prod p^e_p * J^l gives j(e)=0. Conversely if j(e)=0,
choose integer reps e_p and fractional ideal J with
l[J]= -sum e_p[p]. Then prod p^e_p J^l is principal, say (y);
y has all required away-S valuations and gives e. Thus the native
local index is l^(g-d), not merely <= l^g.
4. Multiply the three exact indices (native hcard). Also
C_S/l C_S = C/(H+lC), and finite abelian l-torsion and l-quotient
have equal size by kernel/image cardinality; hence |C_S[l]|=l^(a-d).
All steps use the same L,l, not separately selected witnesses.

Equivalent direct elementary proof: localize O_L at S. Map SelL onto
Cl(O_{L,S})[l] by taking the unique l-th root ideal in the localized
Dedekind domain; the kernel is O_{L,S}^*/(O_{L,S}^*)^l. Surjectivity
follows by taking an l-torsion ideal class representative; the
S-unit rank is r+g since valuations onto the finite-index relation
lattice of the primes over S. This proof requires only classical
ideal arithmetic and Dirichlet's unit theorem.

## Actual quantitative consumer

Original sCount has Ct.selInvLe factor l^2 and Ct.selInj, followed by
Ct.pCount with gens L=2*[L:Q]+Nat.log 2(classNumber L)+2.
Without relying on any peer, the exact identity supplies
  |W[l]| <= l^(r+g+delta+2-d) |C[l]|
         = l^(r+g+delta+2+a-d).
Thus choose exponent G47=r+g+delta+2+a-d at the existing pCount call.
This is fixed for the same L,l independently of F,nu,zeta,gamma:
the native SSha uniform layer quantifier is preserved. With the
unchanged native Few and other assumptions, the local sCount exponent
becomes (b+v_l(E))*G47+c+v_l(E). This is not yet a compiled caller
substitution. It requires actual computation/bounding of C_S[l] for
the lifted L in SLayer. In particular L can vary with coefficient l:
do NOT aggregate class lengths over different L as though one fixed h.
If the separate peer ba04fa11 is later audited/replayed, another three
units (l^2 to l^-1) of this exponent can be removed when L contains
mu_l, but that peer is not assumed here. If the separate exact
unit-valuation peer is verified, it composes on the same L,E,l.
No new uniform ShaK, STors, SFew, CountI/II/V/Vs or VWin closure.

## Native replacement prepared below

The original native proof is copied with only these changes: keep the
unit rank+1 (rather than degree), inject psi.range into actual
l-torsion of the class group (rather than log2 class number), keep
the actual cardinal of primes above l (rather than degree), multiply
the three bounds. This is the weaker, unconditional native candidate
   |SelL| <= l^(r+1) |C[l]| l^g.
It deliberately does not claim formalization of delta or d; the exact
phi-image / class-surjectivity equalities above remain human-only.
A separate scalar certificate records exact cancellation once the
three image/index identities are supplied. No new axiom evidence.
Original selected source graph: sCount -> selLCard -> units_card,
exp_card, primes_card, ord/root lemmas, index_le, class map psi and
valuation map phi. Candidate: same graph except exp_card replaced
by injection and no degree bound at the two index consumers.
Private exp_card unused in this copied candidate, original retained.
All original/reduced graph artifacts, constructor/type/value/axiom
edges, unexpanded nodes and fallback preserved. No global pruning.
Context key: pin/toolchain, L,l, actual S, C,H, valuation map,
class map, coefficient action, same caller. No URT comparison.

Source blobs relative to
src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ClassCounting/:
SelmerOrderCounts/SelLCard.lean 7c6df1894c807c8e54cb3dc9a75acf7c1d52ee9f;
SelmerOrderCounts/TwoLe.lean 16d7d15d6a1f7a7b3d6690d326c772a056811c98;
SelmerOrderCounts.lean d0b527a9966ce2c6e6a9bfaa7be6620abf548752;
LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10;
NumThree.lean 900c8e3fca10cdf9256061213dcc9453bf98f3d2.
Executed 21 unique/round-trip source transformation checks, one
source pin assertion and no inserted proof-hole check.

## Executed arithmetic controls (local CPython, exit 0)

2586 finite abelian group cases, 1352 with strict d>0 cancellation.
Three exact integer identities in each case (7758 assertions).
Two genuine imaginary quadratic examples: reduced forms at D=-20:
(1,0,5),(2,2,3), class group C2. Prime 2 ramified and nonprincipal
(no element norm 2, x^2+5y^2), thus g=1,delta=1,a=d=1.
Exact SelL order 4 instead of uncancelled 8.
D=-23: (1,1,6),(2,-1,3),(2,1,3), class group C3.
Prime 3 splits (t^2-t+6 mod 3), nonprincipal since a^2+ab+6b^2
cannot equal 3 (b!=0 gives >=23/4), hence g=2,delta=0,a=d=1.
Exact SelL order 9 instead of uncancelled 27.
The examples check true ideal-class data, not principal tower hosts.
Reproduction (pure Python):
from itertools import product
from math import gcd,isqrt
cases=strict=0
for mod in [(2,), (3,), (4,), (6,), (2,2),(2,4),(3,3),(4,6)]:
 G=list(product(*(range(m) for m in mod))); z=tuple(0 for m in mod)
 def add(a,b):return tuple((x+y)%m for x,y,m in zip(a,b,mod))
 def mul(k,a):return tuple(k*x%m for x,m in zip(a,mod))
 for l in (2,3,5):
  lG={mul(l,a) for a in G}; tors=sum(mul(l,a)==z for a in G)
  for g in (1,2):
   for S in product(G,repeat=g):
    H={z}
    for a in S:H={add(h,mul(k,a)) for h in H for k in range(len(G))}
    Hplus={add(h,b) for h in H for b in lG}; ds=len(Hplus)//len(lG)
    ct=sum(mul(l,a) in H for a in G)//len(H)
    assert ct*ds==tors
    nk=0
    for ks in product(range(l),repeat=g):
     y=z
     for k,a in zip(ks,S):y=add(y,mul(k,a))
     nk+=y in lG
    assert nk*ds==l**g; assert nk*tors==l**g*ct
    cases+=1;strict+=ds>1
print(cases,strict)
def reduced_forms(D):
 out=[]
 for a in range(1,isqrt((-D)//3)+1):
  for b in range(-a,a+1):
   if (b*b-D)%(4*a):continue
   c=(b*b-D)//(4*a)
   if a>c or gcd(gcd(a,abs(b)),c)!=1:continue
   if (abs(b)==a or a==c) and b<0:continue
   out.append((a,b,c))
 return out
for D,l,h in [(-20,2,2),(-23,3,3)]:
 forms=reduced_forms(D);assert len(forms)==h
 if D==-20:
  assert all(a*a+5*b*b!=l for a,b in product(range(-3,4),repeat=2))
  g,delta=1,1
 else:
  assert all(a*a+a*b+6*b*b!=l for a,b in product(range(-3,4),repeat=2))
  assert [x for x in range(l) if (x*x-x+6)%l==0]==[0,1]
  g,delta=2,0
 print(D,forms,l**(g+delta),l**(g+delta+1))
End reproduction.

Native lean/lake/elan absent locally. GitHub Actions 45577239749 and
45576756833 actual job lists retrieved: pick, named run, record all
success, BASELINE ONLY. No new CI replay, no new kernel closure.
RESUME HERE: independently audit exact phi image and psi surjection,
formalize them at the actual private-map construction (or localized
ideal group), replay selLCard47 and replace pCount exponent only
after verifying original/candidate role and axiom ledgers. Then seek
uniform C_S[l] and homological torsion estimates on actual lifted hosts,
not another numerical constant. Retain all earlier unresolved leaves.
HANDOFF TO character-boxes, Galois, formal audit, kernel, integration.
-/

open NumberField IsDedekindDomain UpperTheory.V UpperTheory.V.ZK UpperTheory.V.ZK.Ct

open scoped nonZeroDivisors

private theorem ord_eq_count {L : Type} [Field L] [NumberField L] (p : HeightOneSpectrum (𝓞 L)) (y : Lˣ) :
    ordP p y = FractionalIdeal.count L p (FractionalIdeal.spanSingleton (𝓞 L)⁰ (y : L)) := by
  obtain ⟨a, b, hab⟩ := IsLocalization.exists_mk'_eq (𝓞 L)⁰ (y : L)
  have ha : a ≠ 0 := by
    rintro rfl
    exact y.ne_zero (by rw [← hab, IsLocalization.mk'_zero])
  have hb : (b : 𝓞 L) ≠ 0 := nonZeroDivisors.coe_ne_zero b
  have hI : FractionalIdeal.spanSingleton (𝓞 L)⁰ (y : L) ≠ 0 :=
    FractionalIdeal.spanSingleton_ne_zero_iff.mpr y.ne_zero
  have h : FractionalIdeal.spanSingleton (𝓞 L)⁰ (y : L) =
      FractionalIdeal.spanSingleton (𝓞 L)⁰ ((algebraMap (𝓞 L) L) b)⁻¹ * ((Ideal.span {a} : Ideal (𝓞 L)) : FractionalIdeal (𝓞 L)⁰ L) := by
    rw [FractionalIdeal.coeIdeal_span_singleton, FractionalIdeal.spanSingleton_mul_spanSingleton, ← hab,
      IsFractionRing.mk'_eq_div, div_eq_inv_mul]
  rw [FractionalIdeal.count_well_defined L p hI h, ordP, ← hab, HeightOneSpectrum.valuation_of_mk',
    p.intValuation_if_neg ha, p.intValuation_if_neg hb, ← WithZero.exp_sub, WithZero.log_exp]
  ring

private theorem ord_mul {L : Type} [Field L] [NumberField L] (p : HeightOneSpectrum (𝓞 L)) (x y : Lˣ) :
    ordP p (x * y) = ordP p x + ordP p y := by
  rw [ord_eq_count, ord_eq_count, ord_eq_count, Units.val_mul, ← FractionalIdeal.spanSingleton_mul_spanSingleton,
    FractionalIdeal.count_mul L p (FractionalIdeal.spanSingleton_ne_zero_iff.mpr x.ne_zero)
      (FractionalIdeal.spanSingleton_ne_zero_iff.mpr y.ne_zero)]

private theorem ord_one {L : Type} [Field L] [NumberField L] (p : HeightOneSpectrum (𝓞 L)) :
    ordP p (1 : Lˣ) = 0 := by
  have := ord_mul p (1 : Lˣ) 1
  rw [mul_one] at this
  omega

private theorem ord_inv {L : Type} [Field L] [NumberField L] (p : HeightOneSpectrum (𝓞 L)) (x : Lˣ) :
    ordP p x⁻¹ = -ordP p x := by
  have := ord_mul p x x⁻¹
  rw [mul_inv_cancel, ord_one] at this
  omega

private theorem fi_ext {L : Type} [Field L] [NumberField L] {I J : FractionalIdeal (𝓞 L)⁰ L} (hI : I ≠ 0) (hJ : J ≠ 0)
    (h : ∀ p, FractionalIdeal.count L p I = FractionalIdeal.count L p J) : I = J := by
  rw [← FractionalIdeal.finprod_heightOneSpectrum_factorization' L hI,
    ← FractionalIdeal.finprod_heightOneSpectrum_factorization' L hJ]
  exact finprod_congr fun p => by rw [h p]

private theorem root_unique {L : Type} [Field L] [NumberField L] {l : ℕ} (hl : l ≠ 0)
    {I J : (FractionalIdeal (𝓞 L)⁰ L)ˣ} (h : I ^ l = J ^ l) : I = J := by
  refine Units.ext (fi_ext I.ne_zero J.ne_zero fun p => ?_)
  have h1 := congrArg (fun X : (FractionalIdeal (𝓞 L)⁰ L)ˣ => FractionalIdeal.count L p (X : FractionalIdeal (𝓞 L)⁰ L)) h
  simp only [Units.val_pow_eq_pow_val, FractionalIdeal.count_pow] at h1
  exact mul_left_cancel₀ (Int.natCast_ne_zero.mpr hl) h1

private theorem root_exists {L : Type} [Field L] [NumberField L] {l : ℕ} (y : Lˣ)
    (h : ∀ p : HeightOneSpectrum (𝓞 L), (l : ℤ) ∣ ordP p y) :
    ∃ I : (FractionalIdeal (𝓞 L)⁰ L)ˣ, I ^ l = toPrincipalIdeal (𝓞 L) L y := by
  have hf : ∀ᶠ p : HeightOneSpectrum (𝓞 L) in Filter.cofinite, ordP p y / l = 0 := by
    filter_upwards [FractionalIdeal.finite_factors (FractionalIdeal.spanSingleton (𝓞 L)⁰ (y : L))] with p hp
    rw [ord_eq_count, hp, Int.zero_ediv]
  have h0 : (∏ᶠ p : HeightOneSpectrum (𝓞 L), (p.asIdeal : FractionalIdeal (𝓞 L)⁰ L) ^ (ordP p y / l)) ≠ 0 := by
    refine finprod_induction (fun X => X ≠ 0) one_ne_zero (fun _ _ => mul_ne_zero) fun p => ?_
    exact zpow_ne_zero _ (FractionalIdeal.coeIdeal_ne_zero.mpr p.ne_bot)
  refine ⟨Units.mk0 _ h0, Units.ext (fi_ext (Units.ne_zero _) (Units.ne_zero _) fun p => ?_)⟩
  rw [Units.val_pow_eq_pow_val, FractionalIdeal.count_pow, Units.val_mk0, FractionalIdeal.count_finprod L p _ hf,
    coe_toPrincipalIdeal, ← ord_eq_count, Int.mul_ediv_cancel' (h p)]

private theorem primes_card (L : Type) [Field L] [NumberField L] {l : ℕ} (hl : l.Prime) :
    Finite {p : HeightOneSpectrum (𝓞 L) // (l : 𝓞 L) ∈ p.asIdeal} ∧
      Nat.card {p : HeightOneSpectrum (𝓞 L) // (l : 𝓞 L) ∈ p.asIdeal} ≤ Module.finrank ℚ L := by
  have hp : Prime (l : ℤ) := Nat.prime_iff_prime_int.mp hl
  have hne : Ideal.span {(l : ℤ)} ≠ ⊥ := by
    rw [ne_eq, Ideal.span_singleton_eq_bot]; exact hp.ne_zero
  haveI hm : (Ideal.span {(l : ℤ)}).IsMaximal :=
    ((Ideal.span_singleton_prime hp.ne_zero).mpr hp).isMaximal hne
  let f : {p : HeightOneSpectrum (𝓞 L) // (l : 𝓞 L) ∈ p.asIdeal} →
      IsDedekindDomain.primesOverFinset (Ideal.span {(l : ℤ)}) (𝓞 L) := fun p =>
    ⟨p.1.asIdeal, (IsDedekindDomain.mem_primesOverFinset_iff hne (𝓞 L)).mpr ⟨p.1.isPrime, ⟨by
      haveI := p.1.isPrime
      refine hm.eq_of_le (Ideal.IsPrime.ne_top inferInstance) ?_
      rw [Ideal.span_singleton_le_iff_mem, Ideal.under_def, Ideal.mem_comap, map_natCast]
      exact p.2⟩⟩⟩
  have hf : Function.Injective f := fun p q h =>
    Subtype.ext (HeightOneSpectrum.ext (congrArg Subtype.val h))
  refine ⟨Finite.of_injective f hf, (Nat.card_le_card_of_injective f hf).trans ?_⟩
  rw [Nat.card_eq_fintype_card, Fintype.card_coe]
  exact Ideal.card_primesOverFinset_le_finrank (𝓞 L) ℚ L hne

private theorem zpow_eq_val {Q : Type} [Group Q] {l : ℕ} [NeZero l] (x : Q) (hx : x ^ l = 1) (m : ℤ) :
    x ^ m = x ^ (m : ZMod l).val := by
  rw [← zpow_natCast, ZMod.val_intCast, ← zpow_eq_zpow_emod' m hx]

private theorem units_card47 (L : Type) [Field L] [NumberField L] {l : ℕ} (hl : l.Prime) {Q : Type} [CommGroup Q]
    (hQ : ∀ x : Q, x ^ l = 1) (f : (𝓞 L)ˣ →* Q) :
    Finite f.range ∧ Nat.card f.range ≤ l ^ (Units.rank L + 1) := by
  haveI : NeZero l := ⟨hl.ne_zero⟩
  obtain ⟨ζ, hζ⟩ := IsCyclic.exists_generator (α := Units.torsion L)
  let g : ZMod l × (Fin (Units.rank L) → ZMod l) → f.range := fun e =>
    ⟨f ((ζ : (𝓞 L)ˣ) ^ e.1.val * ∏ i, Units.fundSystem L i ^ (e.2 i).val), _, rfl⟩
  have hg : Function.Surjective g := by
    rintro ⟨_, u, rfl⟩
    obtain ⟨⟨t, e⟩, rfl, -⟩ := Units.exist_unique_eq_mul_prod L u
    obtain ⟨k, rfl⟩ := Subgroup.mem_zpowers_iff.mp (hζ t)
    refine ⟨((k : ZMod l), fun i => (e i : ZMod l)), Subtype.ext ?_⟩
    simp only [g, map_mul, map_prod, map_pow, map_zpow, SubgroupClass.coe_zpow]
    rw [← zpow_eq_val _ (hQ _)]
    congr 1
    exact Finset.prod_congr rfl fun i _ => (zpow_eq_val _ (hQ _) _).symm
  refine ⟨Finite.of_surjective g hg, (Nat.card_le_card_of_surjective g hg).trans ?_⟩
  rw [Nat.card_prod, Nat.card_fun, Nat.card_zmod, Nat.card_fin, ← pow_succ'] <;> exact le_rfl

private theorem index_le {G T : Type} [Group G] [Group T] [Finite T] (f : G →* T) (K : Subgroup G)
    (h : f.ker ≤ K) : K.index ≠ 0 ∧ K.index ≤ Nat.card f.range := by
  have hd := Subgroup.index_dvd_of_le h
  rw [Subgroup.index_ker] at hd
  have hp : 0 < Nat.card f.range := Nat.card_pos
  exact ⟨ne_zero_of_dvd_ne_zero hp.ne' hd, Nat.le_of_dvd hp hd⟩

theorem UpperTheory.V.ZK.Ct.selLCard47 :
    ∀ (L : Type) [Field L] [NumberField L] (l : ℕ), l.Prime → Finite (SelL l L) ∧ Nat.card (SelL l L) ≤
      l ^ (Units.rank L + 1) *
        Nat.card {x : ClassGroup (𝓞 L) // x ^ l = 1} *
        l ^ (Nat.card {p : HeightOneSpectrum (𝓞 L) // (l : 𝓞 L) ∈ p.asIdeal}) := by
  intro L _ _ l hl
  haveI : NeZero l := ⟨hl.ne_zero⟩
  let P : Subgroup Lˣ := (powMonoidHom l : Lˣ →* Lˣ).range
  let q : Lˣ →* Lˣ ⧸ P := QuotientGroup.mk' P
  let ι : (𝓞 L)ˣ →* Lˣ := Units.map (algebraMap (𝓞 L) L : 𝓞 L →* L)
  let π := toPrincipalIdeal (𝓞 L) L
  let U : Subgroup Lˣ := (q.comp ι).range.comap q
  let H0 : Subgroup Lˣ :=
    (powMonoidHom l : (FractionalIdeal (𝓞 L)⁰ L)ˣ →* (FractionalIdeal (𝓞 L)⁰ L)ˣ).range.comap π
  let H : Subgroup Lˣ :=
    { carrier := {y | ∀ p : HeightOneSpectrum (𝓞 L), (l : 𝓞 L) ∉ p.asIdeal → (l : ℤ) ∣ ordP p y}
      one_mem' := fun p _ => by rw [ord_one]; exact dvd_zero _
      mul_mem' := fun ha hb p hp => by rw [ord_mul]; exact dvd_add (ha p hp) (hb p hp)
      inv_mem' := fun ha p hp => by rw [ord_inv]; exact (ha p hp).neg_right }
  have hqk : q.ker = P := QuotientGroup.ker_mk' P
  have hql : ∀ z : Lˣ, q (z ^ l) = 1 := fun z => (QuotientGroup.eq_one_iff _).mpr ⟨z, rfl⟩
  have hπι : ∀ u, π (ι u) = 1 := fun u => by
    apply Units.ext
    rw [coe_toPrincipalIdeal, Units.val_one, ← FractionalIdeal.spanSingleton_one,
      FractionalIdeal.spanSingleton_eq_spanSingleton]
    refine ⟨u⁻¹, ?_⟩
    rw [Units.smul_def, Algebra.smul_def]
    change algebraMap (𝓞 L) L _ * algebraMap (𝓞 L) L _ = 1
    rw [← map_mul, Units.inv_mul, map_one]
  have hPU : q.ker ≤ U := fun y hy => by
    change q y ∈ (q.comp ι).range
    rw [MonoidHom.mem_ker.mp hy]; exact one_mem _
  have hU0 : U ≤ H0 := by
    rintro y ⟨u, hu⟩
    obtain ⟨z, hz⟩ := QuotientGroup.eq.mp hu
    refine ⟨π z, ?_⟩
    rw [powMonoidHom_apply] at hz ⊢
    rw [← map_pow, hz, map_mul, map_inv, hπι, inv_one, one_mul]
  have h0H : H0 ≤ H := by
    rintro y ⟨I, hI⟩ p -
    rw [ord_eq_count, ← coe_toPrincipalIdeal, ← hI, powMonoidHom_apply, Units.val_pow_eq_pow_val,
      FractionalIdeal.count_pow]
    exact Dvd.intro _ rfl

  have hQ : ∀ x : Lˣ ⧸ P, x ^ l = 1 := fun x => by
    obtain ⟨z, rfl⟩ := QuotientGroup.mk'_surjective P x
    rw [← map_pow]; exact hql z
  obtain ⟨hf1, hc1⟩ := units_card47 L hl hQ (q.comp ι)
  have e1 : q.ker.relIndex U = Nat.card (q.comp ι).range := by
    rw [Subgroup.relIndex_ker, Subgroup.map_comap_eq_self_of_surjective (QuotientGroup.mk'_surjective P)]
  have n1 : q.ker.relIndex U ≠ 0 := by rw [e1]; exact Nat.card_pos.ne'

  have hr : ∀ y : H0, ∃ I : (FractionalIdeal (𝓞 L)⁰ L)ˣ, I ^ l = π y := fun y => y.2
  choose r hr using hr
  let ψ : H0 →* ClassGroup (𝓞 L) := MonoidHom.mk' (fun y => ClassGroup.mk L (r y)) fun x y => by
    rw [← map_mul]
    congr 1
    apply root_unique hl.ne_zero
    rw [mul_pow, hr, hr, hr, Subgroup.coe_mul, map_mul]
  have hψ : ψ.ker ≤ U.subgroupOf H0 := by
    intro y hy
    obtain ⟨z, hz⟩ := (FractionalIdeal.isPrincipal_iff _).mp (ClassGroup.mk_eq_one_iff.mp hy)
    have hz0 : z ≠ 0 := by
      rintro rfl
      exact (r y).ne_zero (by rw [hz, FractionalIdeal.spanSingleton_zero])
    have h1 := congrArg Units.val (hr y)
    rw [Units.val_pow_eq_pow_val, hz, FractionalIdeal.spanSingleton_pow, coe_toPrincipalIdeal,
      FractionalIdeal.spanSingleton_eq_spanSingleton] at h1
    obtain ⟨u, hu⟩ := h1
    have h2 : (y : Lˣ) = ι u * Units.mk0 z hz0 ^ l := by
      apply Units.ext
      rw [← hu, Units.smul_def, Algebra.smul_def, Units.val_mul, Units.val_pow_eq_pow_val]
      rfl
    refine ⟨u, ?_⟩
    change q (ι u) = q y
    rw [h2, map_mul, hql, mul_one]
  obtain ⟨n2, c2⟩ := index_le ψ _ hψ
  have hψtors : ∀ x : ψ.range, x.1 ^ l = 1 := by
    rintro ⟨_, ⟨y, rfl⟩⟩
    change ClassGroup.mk L (r y) ^ l = 1
    rw [← map_pow, hr, ClassGroup.mk_eq_one_iff, FractionalIdeal.isPrincipal_iff]
    exact ⟨_, coe_toPrincipalIdeal _⟩
  let fψ : ψ.range → {x : ClassGroup (𝓞 L) // x ^ l = 1} :=
    fun x => ⟨x.1, hψtors x⟩
  have c2' : Nat.card ψ.range ≤ Nat.card {x : ClassGroup (𝓞 L) // x ^ l = 1} :=
    Nat.card_le_card_of_injective fψ (fun x y h => Subtype.ext (congrArg Subtype.val h))

  obtain ⟨hf3, hc3⟩ := primes_card L hl
  let φ : H →* Multiplicative ({p : HeightOneSpectrum (𝓞 L) // (l : 𝓞 L) ∈ p.asIdeal} → ZMod l) :=
    MonoidHom.mk' (fun y => Multiplicative.ofAdd fun p => (ordP p.1 (y : Lˣ) : ZMod l)) fun x y => by
      rw [← ofAdd_add]
      congr 1
      funext p
      rw [Subgroup.coe_mul, ord_mul, Int.cast_add, Pi.add_apply]
  have hφ : φ.ker ≤ H0.subgroupOf H := by
    intro y hy
    refine root_exists (y : Lˣ) fun p => ?_
    by_cases hp : (l : 𝓞 L) ∈ p.asIdeal
    · exact (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mp
        (congrFun (congrArg Multiplicative.toAdd (MonoidHom.mem_ker.mp hy)) ⟨p, hp⟩)
    · exact y.2 p hp
  obtain ⟨n3, c3⟩ := index_le φ _ hφ
  have c3' : Nat.card φ.range ≤
      l ^ (Nat.card {p : HeightOneSpectrum (𝓞 L) // (l : 𝓞 L) ∈ p.asIdeal}) := by
    refine (Nat.card_le_card_of_injective _ φ.range.subtype_injective).trans ?_
    rw [Nat.card_congr Multiplicative.toAdd, Nat.card_fun, Nat.card_zmod] <;> exact le_rfl

  have hS : SelL l L = (H.map q : Set (Lˣ ⧸ P)) := by
    ext x
    exact ⟨fun ⟨y, h1, h2⟩ => ⟨y, h2, h1⟩, fun ⟨y, h1, h2⟩ => ⟨y, h2, h1⟩⟩
  have hcard : Nat.card (SelL l L) = q.ker.relIndex U * U.relIndex H0 * H0.relIndex H := by
    rw [Subgroup.relIndex_mul_relIndex _ _ _ hPU hU0,
      Subgroup.relIndex_mul_relIndex _ _ _ (hPU.trans hU0) h0H, Subgroup.relIndex_ker, hS]
    rfl
  refine ⟨Nat.finite_of_card_ne_zero ?_, ?_⟩
  · rw [hcard]
    exact mul_ne_zero (mul_ne_zero n1 n2) n3
  · rw [hcard]
    exact Nat.mul_le_mul (Nat.mul_le_mul (e1.trans_le hc1) (c2.trans c2')) (c3.trans c3')

namespace RHPrimeWindow47
/-- Exact scalar cancellation after the two finite quotient identities.
This does not prove those mathematical suppliers. -/
theorem joint_index_product (U A V Q D P : ℕ)
    (hA : A = Q * D) (hV : V * D = P) :
    U * A * V = U * Q * P := by
  rw [hA, ← hV]
  ring

example (U A V Q D P : ℕ) (hA : A = Q * D) (hV : V * D = P) :
    U * A * V = U * Q * P := by
  first
  | (rh_reduce 2 using [joint_index_product]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact joint_index_product U A V Q D P hA hV
end RHPrimeWindow47

rh_scan UpperTheory.V.ZK.Ct.selLCard47 limit 2000
rh_scan RHPrimeWindow47.joint_index_product limit 2000
rh_prune RHPrimeWindow47.joint_index_product as RHPrimeWindow47JointPruned
rh_prune UpperTheory.V.ZK.Ct.selLCard47 as RHPrimeWindow47SelLPruned
#print axioms UpperTheory.V.ZK.Ct.selLCard47
#print axioms RHPrimeWindow47.joint_index_product
