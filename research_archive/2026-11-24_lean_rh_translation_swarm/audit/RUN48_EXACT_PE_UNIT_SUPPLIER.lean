import Development.EtaleCohomology.CyclotomicDiscriminants.SFewOfCut
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN48, 26 Nov 2026, lane 10. AGREE / PARTIAL.
Human mathematical proof of the peer's exact modular supplier, with a
shorter elementary proof in the actual guarded SFew consumer.
PREPARED Lean fragments, NOT COMPILED; RH OPEN.

Latest mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including
mandatory engine; SWARM 4b77b161, HANDOFF bbc46df7, AGENTS 8db0201d,
state/log/protocol/continuity openings read. Latest 25 commit index
through 6a2cb73b, actual peer RUN49 03d8a69f and RUN47 17b56ded
certificate bodies, own RUN47 d3079b63 and prime-terminal note read.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

Source:
src/Development/EtaleCohomology/CyclotomicDiscriminants/SFewOfCut.lean
1c294cd3b56d004fc313c2e2febb40cf637e0b52 (one_add_pow_eq, pe_dvd,
sFewOf). ClassCounting/HasVal.lean ee8800532f5867e0bee6b50ba85e6e977328dbab
(pe); ClassCounting/LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10
(SClass/SFew/SNum); ClassCounting/SUpperOf.lean 8cccf88aa58f6e2bd69f080e46f4f10b4248d559.
Mathlib/Data/Nat/Factorization/Basic.lean at above mathlib pin inspected
for factorization_prod_apply and pow_dvd_iff_le_factorization.

NEW AUDIT: the actual sFewOf consumer already retains M=2E+1<l^c,
E=e+1, c>=1. No LTE or additional 2-adic hypothesis is needed to
establish its exact modular interpolation divisor. Let u=1+l^c.
For 1<=d<=E, write d=l^v m, v=v_l(d), l∤m. The native
one_add_pow_eq gives u^d-1=l^c(d+l^c t).
Because d<l^c, v<c. Cancel before valuations:
  u^d-1=l^(c+v) [m+l^(c-v)t].
The bracket is prime to l, directly by reduction mod l. This proves
the exact factor valuation without LTE, for odd or even prime l.

Pair the ACTUAL erased native product:
  pe(u,2E+1,E)=(-1)^E u^(E(E-1)/2+E^2)
                   [product_{d=1}^E (u^d-1)]^2.
Proof: j=E-d gives u^(E-d)(u^d-1); j=E+d gives
-u^E(u^d-1). Each distance occurs once per side. Hence
  pe=l^V U,   V=2Ec+2v_l(E!),   l∤U.
Here U is a signed integer unit at l. The exponent of u is
E(E-1)/2+E^2, NOT 2E^2. In ZMod(l^nu) the image of U is a
unit by Bezout (gcd(U,l^nu)=1), including nu=0, where the ring
is trivial. Consequently pe divides l^V for EVERY nu.
For nu>V, no smaller pure l-power is divisible by pe in that
ring. This is not a claim about saturation by actual residue pairs.

This supplies the exact mathematical modular premise required by
peer RUN49 in the ACTUAL guarded sFewOf call. Its global PeExact49
statement is also valid with its stated c>=1, l=2=>c>=2 guard:
replace the binomial argument by native Ct.lte and use the same
pairing/unit proof. To avoid LTE entirely, narrow PeExact49 to
the already-present 2e+3<l^c guard, and change the sole call
from hPe l c nu e hlay.c_pos hlay.c_two to
hPe l c nu e hlay.c_pos hc. Keep hlay.c_two in Lay itself.
No SClass or SUpper guard is removed. The exact product exponent
is the peer's result; the new contribution is the guarded,
elementary supplier and explicit unit proof, not a new exponent.

Countercontrol: dropping BOTH the size guard and the 2-adic
restriction is invalid: l=2,c=1,d=2 gives v_2(3^2-1)=3,
not c+v_2(d)=2. Do not generalize guarded lemma to that regime.
No change to the scaled SUpper/fixed-r joint late-layer premises
in 17b56ded. Its algebra is conditional on same-layer witnesses;
do not add RUN47 norm saving at arbitrarily late layers twice.
No claim of STors, SFew full supplier or root closure.

Original selected graph: lemmaK_of_steps -> sNum -> sFewOf ->
pe_dvd -> not_dvd_sub -> not_dvd_pow_sub_one. Other edges
SClass, STheta, SPhi, SUpper, SDetect, SCount, SSha, SLayer,
STors and all unresolved native axiom/type/value edges retained.
Candidate: sFewExact49 guarded -> modular unit cancellation ->
native one_add_pow_eq + paired indexing + factorial factorization.
Retain global PeExact49 route as fallback; cache source/toolchain,
l,c,E,nu,pe,actual hLay and consumer. No global retirement.

Executed exact V8 integer tests (not number field experiments):
336 guarded parameter sets, 3790 individual factors, 1344
modular cases, 337 negative controls, 18858 assertions.
Reproduce:
let tests=0,cases=0,factors=0,modular=0,neg=0;
function ck(x){tests++;if(!x)throw Error("assert "+tests)}
function val(x,l){x=x<0n?-x:x;if(!x)throw Error("zero");let n=0;while(x%l===0n){x/=l;n++}return n}
function gcd(a,b){a=a<0n?-a:a;while(b){let t=a%b;a=b;b=t}return a}
for(const l of [2n,3n,5n,7n,11n,13n])for(let c=1;c<=4;c++)for(let E=1;E<=24 && BigInt(2*E+1)<l**BigInt(c);E++){
 const u=1n+l**BigInt(c);let pe=1n,prod=1n,fact=1n;
 for(let d=1;d<=E;d++){const D=BigInt(d),v=val(D,l),r=u**D-1n,t=(r/l**BigInt(c)-D)/l**BigInt(c),m=D/l**BigInt(v),unit=m+l**BigInt(c-v)*t;
 ck(v<c);ck(r===l**BigInt(c+v)*unit);ck(unit%l!==0n);ck(val(r,l)===c+v);prod*=r;fact*=D;factors++}
 for(let j=0;j<=2*E;j++)if(j!==E)pe*=u**BigInt(E)-u**BigInt(j);
 const a=BigInt(E*(E-1)/2+E*E);ck(pe===(-1n)**BigInt(E)*u**a*prod**2n);
 const V=2*E*c+2*val(fact,l);ck(val(pe,l)===V);
 for(const nu of [c,Math.max(c,V-1),Math.max(c,V),Math.max(c,V+1)]){const q=l**BigInt(nu);ck(gcd(pe,q)===l**BigInt(Math.min(V,nu)));ck(l**BigInt(V)%gcd(pe,q)===0n);if(nu>V){ck(l**BigInt(V-1)%gcd(pe,q)!==0n);neg++}modular++}
 cases++
}
ck(val(3n**2n-1n,2n)===3);ck(1+val(2n,2n)===2);neg++;
console.log({tests,cases,factors,modular,neg});

Lean/Lake/elan not present (command -v empty). Actual historical
Actions job results 45577239749 and 45576756833 retrieved: pick,
run, record completed success; BASELINE ONLY. No new CI or axiom
output. Below prepares elementary unit and product-to-modular
bridges; the exact native product decomposition and factorial
pairing remain to be elaborated, not silently assumed proved by Lean.
No URT benchmark or advantage claim.

RESUME HERE: replay elementary_unit and mod_dvd_unit_factor,
formalize paired product decomposition and factorial unit witness,
then replace the PeExact49 argument at actual sFewExact49 consumer.
Do not spend another run refining constants; after this bridge,
move to scaled primary SUpper and fixed-r local identification.
HANDOFF TO prime, character, kernel, integration.
-/

open UpperTheory.V.ZK
open LateralTheory.Q.SFewOfCut

namespace RHAudit48

theorem elementary_unit (l c d v : ℕ) (m : ℤ)
    (hd : (d : ℤ) = (l : ℤ)^v * m) (hv : v < c)
    (hm : ¬ (l : ℤ) ∣ m) :
    ∃ U : ℤ, (1 + (l : ℤ)^c)^d - 1 = (l : ℤ)^(c+v)*U ∧
      ¬ (l : ℤ) ∣ U := by
  obtain ⟨t, ht⟩ := one_add_pow_eq ((l : ℤ)^c) d
  have hp : (l : ℤ)^c = (l : ℤ)^v * (l : ℤ)^(c-v) := by
    rw [← pow_add, show v+(c-v)=c by omega]
  refine ⟨m+(l : ℤ)^(c-v)*t, ?_, ?_⟩
  · rw [ht, add_sub_cancel_left, hd, pow_add]
    nth_rw 2 [hp]
    ring
  · intro h
    have hpow : (l : ℤ) ∣ (l : ℤ)^(c-v) := by
      simpa using (pow_dvd_pow (l : ℤ) (show 1 ≤ c-v by omega))
    exact hm ((dvd_add_left (hpow.mul_right t)).1 h)

theorem mod_dvd_unit_factor (l ν V : ℕ) (hl : l.Prime) (f U : ℤ)
    (hf : f = (l : ℤ)^V * U) (hU : ¬ (l : ℤ) ∣ U) :
    (f : ZMod (l^ν)) ∣ (l : ZMod (l^ν))^V := by
  have hc : IsCoprime U ((l : ℤ)^ν) :=
    (((Nat.prime_iff_prime_int.1 hl).irreducible.coprime_iff_not_dvd.2 hU).symm).pow_right
  obtain ⟨a,b,hab⟩ := hc
  have hz : (l : ZMod (l^ν))^ν = 0 := by
    exact_mod_cast ZMod.natCast_self (l^ν)
  have hu : (U : ZMod (l^ν)) * a = 1 := by
    have h := congrArg (Int.cast : ℤ → ZMod (l^ν)) hab
    push_cast at h
    rw [hz] at h
    linear_combination h
  refine ⟨(a : ZMod (l^ν)), ?_⟩
  rw [hf]
  push_cast
  rw [mul_assoc, hu, mul_one]

theorem pe_from_unit (l c ν e : ℕ) (hl : l.Prime)
    (U : ℤ)
    (h : pe (1+l^c) (2*e+3) (e+1) =
      (l : ℤ)^((2*e+2)*c+2*(Nat.factorial (e+1)).factorization l)*U)
    (hU : ¬ (l : ℤ) ∣ U) :
    (pe (1+l^c) (2*e+3) (e+1) : ZMod (l^ν)) ∣
      (l : ZMod (l^ν))^((2*e+2)*c+2*(Nat.factorial (e+1)).factorization l) :=
  mod_dvd_unit_factor l ν _ hl _ U h hU

example (l ν V : ℕ) (hl : l.Prime) (f U : ℤ)
    (hf : f = (l : ℤ)^V * U) (hU : ¬ (l : ℤ) ∣ U) :
    (f : ZMod (l^ν)) ∣ (l : ZMod (l^ν))^V := by
  first
  | (rh_reduce 2 using [mod_dvd_unit_factor]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact mod_dvd_unit_factor l ν V hl f U hf hU

end RHAudit48

rh_scan LateralTheory.Q.SFewOfCut.sFewOf limit 2000
rh_scan RHAudit48.pe_from_unit limit 2000
rh_prune RHAudit48.elementary_unit as RHAudit48.ElementaryUnitPruned
rh_prune RHAudit48.pe_from_unit as RHAudit48.PeFromUnitPruned
#print axioms LateralTheory.Q.SFewOfCut.sFewOf
#print axioms RHAudit48.elementary_unit
#print axioms RHAudit48.mod_dvd_unit_factor
#print axioms RHAudit48.pe_from_unit
