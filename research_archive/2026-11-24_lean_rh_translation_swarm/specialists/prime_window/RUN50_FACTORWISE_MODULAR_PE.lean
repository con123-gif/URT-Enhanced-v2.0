import Development.EtaleCohomology.CyclotomicDiscriminants.SFewOfCut
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.SelmerOrderCounts.TorsionExponentBound
import Mathlib.Algebra.BigOperators.Intervals
import Mathlib.Data.Nat.Factorial.BigOperators
import Mathlib.Data.Nat.Factorization.Basic
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN50 — lane 3, 26 Nov 2026. PREPARED native modular-product supplier
for RUN49's outstanding PeExact49 premise. Human proof of this identity
already in RUN49 and independent audit RUN48; this is a new explicit
factorwise modular witness construction and executable Lean candidate,
not a new RH criterion. NOT COMPILED; no root obligation retired.

Mission latest blob f8b4b837301f8cf43d673be4979f04c4e4b415a4,
SWARM 4b77b161, HANDOFF bbc46df7, EXPANSION c8152d07, AGENTS
8db0201d read, continuity/state/log/protocol openings consulted.
Latest peer commits through 7f45ab3c: audit d217e9e2 (elementary unit),
integration 2becd062 (scaled primary Few) and fccd0f04 (row), math
6a2cb73b (prime-terminal), character 17b56ded (late layers), other
peer recent commit bodies inspected. Avoid duplicate exponent derivation.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474; no upstream update adopted.

Exact source:
src/Development/EtaleCohomology/CyclotomicDiscriminants/SFewOfCut.lean
blob 1c294cd3b56d004fc313c2e2febb40cf637e0b52, pe_dvd l.67,
sFewOf l.153 and sole modular-divisor call l.187.
src/Development/AutomorphicArithmetic/AutomorphicVarieties/
ModularityArgument/ClassCounting/HasVal.lean blob
ee8800532f5867e0bee6b50ba85e6e977328dbab, pe l.141.
SelmerOrderCounts/TorsionExponentBound.lean (under ClassCounting)
16c5cfee6c9283098335e471a582f3313e97c17f, Ct.lte l.55.
Mathlib factorization_prod_apply, Prime.pow_dvd_iff_le_factorization,
sum_range_reflect, sum_range_add, prod_pow_eq_pow_sum and
prod_range_add_one_eq_factorial inspected at the pinned revision.

NEW IMPLEMENTATION ROUTE: do not construct the enormous integer
product or its global unit. For every j!=E, put d=|E-j|, w=c+v_l(d).
Native Ct.lte says u^d-1=l^w z with l not dividing z. The native
signed difference f_j=u^E-u^j is +/-u^min(E,j) times this number.
As u=1+l^c is a unit mod l^nu, there is an explicit modular witness
a_j with f_j*a_j=l^w in ZMod(l^nu). Multiply these identities BEFORE
applying any cardinality bound. The distance sum is exactly
2Ec+2v_l(E!), by reflection of the left range and translation of
the right range. Thus product a_j is a witness for
 pe(u,2E+1,E) | l^(2Ec+2v_l(E!)) in ZMod(l^nu).
This uses the global Lay guards (including c>=2 at l=2), needs no
M<l^c for this one step, and works at nu=0 as well. No full integer
pairing/unit factorization premise remains in the candidate statement.
The actual SClass size and SUpper complex-place guards are unchanged.
No assertion about the independent scaled primary/late-layer estimates.

Native original selected graph: lemmaK_of_steps -> sNum -> sFewOf
-> pe_dvd -> not_dvd_sub -> not_dvd_pow_sub_one. Candidate:
shaExact49 -> sFewExact49 -> peExact50 -> modular_nat_factor50 +
Ct.lte + erased_distance_sum50 + unit_inverse50. Original fallback
and all existing graph evidence retained. Other STheta, SPhi, SClass,
SUpper, SDetect, SCount, SSha, SLayer, STors, SFinal and all upstream
type/value/constructor/axiom edges unchanged/open as before.
Cache key: source/toolchain, l,c,nu,E, actual erased pe and caller.
No claimed global pruning, no URT advantage.

Executed local CPython exact arithmetic: 620 parameter sets (primes
2..19, c=1..4 except c>=2 at 2, E=1..20), 4193 modulus cases
including nu=0, 88186 individual modular witnesses, 269371
assertions, exit 0. This tests the explicit witness product, not a
prime-window experiment or Lean kernel replay. Reproduce:
from math import prod,factorial
def val(n,l):
    assert n
    v=0
    while n%l==0: n//=l;v+=1
    return v
cases=checks=moduli=factors=0
for l in (2,3,5,7,11,13,17,19):
 for c in range(2 if l==2 else 1,5):
  u=1+l**c
  for E in range(1,21):
   V=2*E*c+2*val(factorial(E),l)
   fs=[u**E-u**j for j in range(2*E+1) if j!=E]
   ws=[c+val(abs(E-j),l) for j in range(2*E+1) if j!=E]
   assert sum(ws)==V;checks+=1
   for nu in sorted({0,1,c,V-1,V,V+1,V+3}):
    q=l**nu; witnesses=[]
    for f,w in zip(fs,ws):
     z,r=divmod(f,l**w);assert r==0 and z%l!=0;checks+=2
     a=pow(z,-1,q);assert (f*a-l**w)%q==0;checks+=1;factors+=1
     witnesses.append(a)
    assert (prod(fs)*prod(witnesses)-l**V)%q==0;checks+=1;moduli+=1
   cases+=1
print(dict(cases=cases,moduli=moduli,factor_witnesses=factors,assertions=checks))
# {'cases': 620, 'moduli': 4193, 'factor_witnesses': 88186, 'assertions': 269371}

Local lean/lake/elan absent. Fetched actual CI jobs 45577239749 and
45576756833; all pick/run/record success, historical baseline ONLY.
No new CI output or axiom result for the code below. Negative control
from audit d217e9e2: at l=2,c=1,d=2, v_2(3^2-1)=3 not 2; guard
cannot be deleted without replacement. This certificate intentionally
uses the already available native guard, not the audit's narrower
elementary-binomial alternative.

RESUME HERE: stage this file and RUN49 with the authenticated engine
overlays in the existing pinned runner; compile and audit the actual
consumer, replacing hPe by peExact50 (its statement unfolds PeExact49
and peBudget49). If needed repair elaboration errors, preserve failed
logs, and check actual sFewExact49/shaExact49 callers. Do not spend
another run on the scalar exponent; after replay focus on actual
uniform primary homology/late-layer bounds or direct prime cancellation.
HANDOFF TO kernel, formal audit, character, integration.
-/

noncomputable section
open NumberField NumberField.InfinitePlace IsDedekindDomain UpperTheory.V UpperTheory.V.KL UpperTheory.V.ZK
open LateralTheory.Q.SFewOfCut

namespace RHPrime50

theorem unit_inverse50 (l ν : ℕ) (hl : l.Prime) (f : ℤ)
    (hf : ¬ (l : ℤ) ∣ f) :
    ∃ a : ZMod (l^ν), (f : ZMod (l^ν))*a = 1 := by
  have hc : IsCoprime f ((l : ℤ)^ν) :=
    (((Nat.prime_iff_prime_int.1 hl).irreducible.coprime_iff_not_dvd.2 hf).symm).pow_right
  obtain ⟨a,b,hab⟩ := hc
  have hz : (l : ZMod (l^ν))^ν = 0 := by
    exact_mod_cast ZMod.natCast_self (l^ν)
  refine ⟨(a : ZMod (l^ν)), ?_⟩
  have h := congrArg (Int.cast : ℤ → ZMod (l^ν)) hab
  push_cast at h
  rw [hz] at h
  linear_combination h

theorem modular_nat_factor50 (l ν n w : ℕ) (hl : l.Prime)
    (hn : n ≠ 0) (hw : n.factorization l = w) :
    (n : ZMod (l^ν)) ∣ (l : ZMod (l^ν))^w := by
  have hd : l^w ∣ n := (hl.pow_dvd_iff_le_factorization hn).2 (by omega)
  obtain ⟨z,hz⟩ := hd
  have hzu : ¬ l ∣ z := by
    rintro ⟨t,ht⟩
    have hbad : l^(w+1) ∣ n := ⟨t, by rw [hz,ht,pow_succ]; ring⟩
    have hle := (hl.pow_dvd_iff_le_factorization hn).1 hbad
    omega
  have hzi : ¬ (l : ℤ) ∣ (z : ℤ) := by exact_mod_cast hzu
  obtain ⟨a,ha⟩ := unit_inverse50 l ν hl (z : ℤ) hzi
  refine ⟨a, ?_⟩
  rw [hz]
  push_cast at ha ⊢
  rw [mul_assoc,ha,mul_one]

def dist50 (E j : ℕ) : ℕ := if j<E then E-j else j-E

def weight50 (l c E j : ℕ) : ℕ :=
  if j=E then 0 else c + (dist50 E j).factorization l

theorem erased_distance_sum50 (l c E : ℕ) :
    (∑ j ∈ (Finset.range (2*E+1)).erase E, weight50 l c E j) =
      2*E*c + 2*(Nat.factorial E).factorization l := by
  classical
  let f := weight50 l c E
  let g : ℕ → ℕ := fun j => c + (j+1).factorization l
  have hzero : f E = 0 := by simp [f,weight50]
  have hsum := Finset.sum_erase_add (Finset.range (2*E+1)) f
    (a := E) (Finset.mem_range.2 (by omega))
  rw [hzero,add_zero] at hsum
  change (∑ j ∈ (Finset.range (2*E+1)).erase E, f j) = _
  rw [hsum,show 2*E+1=E+1+E by omega,Finset.sum_range_add f (E+1) E,
    Finset.sum_range_succ f E,hzero,add_zero]
  have hleft : (∑ j ∈ Finset.range E, f j) = ∑ j ∈ Finset.range E, g j := by
    calc
      _ = ∑ j ∈ Finset.range E, g (E-1-j) := by
        apply Finset.sum_congr rfl
        intro j hj
        have hj' := Finset.mem_range.1 hj
        simp [f,g,weight50,dist50,hj',ne_of_lt hj',
          show E-j=(E-1-j)+1 by omega]
      _ = _ := Finset.sum_range_reflect g E
  have hright : (∑ j ∈ Finset.range E, f (E+1+j)) =
      ∑ j ∈ Finset.range E, g j := by
    apply Finset.sum_congr rfl
    intro j hj
    simp [f,g,weight50,dist50,show E+1+j ≠ E by omega,
      show ¬ E+1+j<E by omega,show E+1+j-E=j+1 by omega]
  rw [hleft,hright]
  have hfact := Nat.factorization_prod_apply (p:=l) (S:=Finset.range E)
    (g:=fun j => j+1) (by intro j hj; omega)
  rw [Finset.prod_range_add_one_eq_factorial] at hfact
  simp only [g,Finset.sum_add_distrib,Finset.sum_const,Finset.card_range,nsmul_eq_mul,← hfact]
  ring

theorem factor_dvd50 (l c ν E j : ℕ) (hl : l.Prime) (hc : 1≤c)
    (h2 : l=2 → 2≤c) (hj : j≠E) :
    ((1+(l : ZMod (l^ν))^c)^E-(1+(l : ZMod (l^ν))^c)^j) ∣
      (l : ZMod (l^ν))^(weight50 l c E j) := by
  let u : ZMod (l^ν) := 1+(l : ZMod (l^ν))^c
  have hnot : ¬ (l : ℤ) ∣ (1+(l : ℤ)^c) := by
    intro h
    have hp : (l : ℤ) ∣ (l : ℤ)^c := dvd_pow_self _ (by omega)
    have h1 : (l : ℤ) ∣ (1 : ℤ) := (dvd_add_left hp).1 h
    have hN : l ∣ 1 := by exact_mod_cast h1
    exact hl.one_lt.ne' (Nat.dvd_one.1 hN)
  obtain ⟨a,ha⟩ := unit_inverse50 l ν hl (1+(l : ℤ)^c) hnot
  push_cast at ha
  change u*a=1 at ha
  have hdist : ∀ d : ℕ, 0<d →
      (u^d-1) ∣ (l : ZMod (l^ν))^(c+d.factorization l) := by
    intro d hd
    obtain ⟨hpos,hval,_⟩ := UpperTheory.V.ZK.Ct.lte l c c d hl hc h2 le_rfl hd
    have hn : (1+l^c)^d-1 ≠ 0 := by omega
    have h := modular_nat_factor50 l ν _ _ hl hn hval
    have he : (((1+l^c)^d-1 : ℕ) : ZMod (l^ν)) = u^d-1 := by
      rw [Nat.cast_sub (by omega : 1 ≤ (1+l^c)^d)]
      simp [u]
    rw [he] at h
    exact h
  change (u^E-u^j) ∣ (l : ZMod (l^ν))^(weight50 l c E j)
  rcases lt_or_gt_of_ne hj with h | h
  · obtain ⟨b,hb⟩ := hdist (E-j) (by omega)
    simp only [weight50,if_neg hj,dist50,if_pos h]
    refine ⟨a^j*b, ?_⟩
    have hp : u^E=u^j*u^(E-j) := by rw [← pow_add,show j+(E-j)=E by omega]
    calc
      _ = (u^(E-j)-1)*b := hb
      _ = (u^j*(u^(E-j)-1))*(a^j*b) := by
        calc
          _ = (u*a)^j*((u^(E-j)-1)*b) := by rw [ha,one_pow,one_mul]
          _ = _ := by rw [mul_pow]; ring
      _ = _ := by rw [hp]; ring
  · obtain ⟨b,hb⟩ := hdist (j-E) (by omega)
    simp only [weight50,if_neg hj,dist50,if_neg (not_lt_of_ge h.le)]
    refine ⟨-(a^E*b), ?_⟩
    have hp : u^j=u^E*u^(j-E) := by rw [← pow_add,show E+(j-E)=j by omega]
    calc
      _ = (u^(j-E)-1)*b := hb
      _ = (u^E-u^j)*(-(a^E*b)) := by
        calc
          _ = (u*a)^E*((u^(j-E)-1)*b) := by rw [ha,one_pow,one_mul]
          _ = _ := by rw [mul_pow,hp]; ring

theorem pe_dvd_exact50 (l c ν E : ℕ) (hl : l.Prime)
    (hc : 1≤c) (h2 : l=2 → 2≤c) :
    (pe (1+l^c) (2*E+1) E : ZMod (l^ν)) ∣
      (l : ZMod (l^ν))^(2*E*c+2*(Nat.factorial E).factorization l) := by
  classical
  have h : (pe (1+l^c) (2*E+1) E : ZMod (l^ν)) ∣
      ∏ j ∈ (Finset.range (2*E+1)).erase E,
        (l : ZMod (l^ν))^(weight50 l c E j) := by
    unfold pe
    rw [Int.cast_prod]
    refine Finset.prod_dvd_prod_of_dvd _ _ fun j hj => ?_
    push_cast
    exact factor_dvd50 l c ν E j hl hc h2 (Finset.mem_erase.1 hj).1
  rw [Finset.prod_pow_eq_pow_sum,erased_distance_sum50] at h
  exact h

-- This statement is definitionally RUN49's PeExact49 after unfolding
-- peBudget49; paste or import the certificate at the actual hPe call.
theorem peExact50 : ∀ (l c ν e : ℕ) [Fact l.Prime], 1≤c →
    (l=2 → 2≤c) →
    (pe (1+l^c) (2*e+3) (e+1) : ZMod (l^ν)) ∣
      (l : ZMod (l^ν))^((2*e+2)*c+2*(Nat.factorial (e+1)).factorization l) := by
  intro l c ν e hl hc h2
  simpa only [show 2*(e+1)+1=2*e+3 by omega,
    show 2*(e+1)=2*e+2 by omega] using pe_dvd_exact50 l c ν (e+1) hl.out hc h2

example (l c ν E : ℕ) (hl : l.Prime) (hc : 1≤c) (h2 : l=2 → 2≤c) :
    (pe (1+l^c) (2*E+1) E : ZMod (l^ν)) ∣
      (l : ZMod (l^ν))^(2*E*c+2*(Nat.factorial E).factorization l) := by
  first
  | (rh_reduce 2 using [pe_dvd_exact50]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact pe_dvd_exact50 l c ν E hl hc h2

end RHPrime50
rh_scan LateralTheory.Q.SFewOfCut.sFewOf limit 2000
rh_scan RHPrime50.peExact50 limit 2000
rh_prune RHPrime50.peExact50 as RHPrimePeExactPruned50
#print axioms RHPrime50.peExact50
#print axioms RHPrime50.pe_dvd_exact50
end
