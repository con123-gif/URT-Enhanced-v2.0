import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.SelmerOrderCounts
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN45 audit, 26 November 2026. HUMAN SOURCE-MATCHED derivation; scalar
Lean certificate PREPARED, NOT COMPILED. RH OPEN.

RESULT: eliminate BOTH finite labels (r, Norm(v)) in actual Ct.selInvLe
by cyclotomic torsion normalization. Stronger candidate:
    |D.SelInv l| * l <= |SelL l L|.
In particular the original l^2 factor can be replaced by 1 (or by l^-1
using the nontrivial torsion kernel). No new uniform ShaK estimate.

Native premises retained: number fields, Lay l c nu zeta gamma, l prime,
IsDat gamma a D, Finite (SelL l L). Write z for zeta in F^*, n=l^(nu-c),
u=1+l^c. gamma generates Gal(F/L), has order n, and gamma(z)=z^u.
The actual private exists_rep_of_mem_selInv_ordP_dvd_actU_eq supplies
for every x in D.SelInv l an alpha representing x modulo l-th powers
AND torsion, all valuations divisible by l, and
    gamma(alpha)=alpha*v^l*rho^r, 0<=r<l,
where rho generates the finite cyclic roots of unity of F.
Taking norms (native norm_pow_eq_inv_norm_pow_of_actU_eq_mul_pow)
gives N(v)^l=N(rho)^(-r).

1. If nu=c then n=1, hence F=L by Galois and generator conditions.
Use alpha itself as a base representative, and all valuations are
already divisible by l. No norm or label needed.

2. If nu>c, N(z)=z^s, s=sum_(j=0)^(n-1) u^j. LTE gives
v_l(u^n-1)=nu and v_l(u-1)=c, so v_l(s)=nu-c. Thus N(z) has exact
order l^c. Also L cannot contain a primitive l^(c+1)-th root: all
such roots in F are powers of z (the roots of X^(l^(c+1))-1 are
exhausted by those powers), and gamma acts on each primitive root
by u, not by 1. Any l-th root in L of N(z) would have exact order
l^(c+1), contradiction. This uses the native c_two guard for LTE.

If r>0, gcd(r,l)=1 and Bezout implies N(rho) is an l-th power in L:
if Ar+Bl=1 and N(rho)^r=N(v)^(-l), then
N(rho)=(N(v)^(-A)*N(rho)^B)^l. Since z is a power of rho,
N(z) would be an l-th power as well, contradiction. Hence r=0
exactly, not an estimate of the number of roots of a polynomial.

3. Now N(v)^l=1. Put eta=z^(l^(c-1)); gamma(z)=z*eta^l.
N(eta)=N(z)^(l^(c-1)) has exact order l. All roots of X^l-1 in L
are its powers. Choose k mod l with N(v)*N(eta)^k=1. Set
    alpha'=alpha*z^k, v'=v*eta^k.
Then gamma(alpha')=alpha'*(v')^l, N(v')=1.
Multiplying alpha by a root of unity leaves every valuation unchanged
and its class modulo Ct.mt unchanged. Apply actual Ct.h90 to
alpha',v', yielding alpha'=iota(x0)*w^l for x0 in L^*, w in F^*.
At every prime p of L away from l choose P above p; native Ct.unram
gives ord_P(iota(x0))=ord_p(x0). From alpha' and w^l, l divides this
valuation. Therefore x0 represents a member of actual SelL l L.
Equivalently reuse native private selInvLe_lemma_5 with second
representative 1 and r=0, after normalization.

4. Let j: L^*/(L^*)^l -> F^*/((F^*)^l mu(F)) be induced by inclusion.
This is a group hom. The native SelL is a subgroup (SelLCard hS);
the previous step proves D.SelInv l SUBSET j(SelL l L). Do NOT
assert equality: images of base elements may fail the above-l
valuation condition, particularly when n=1. Since L contains mu_l
from N(z) (or z in n=1), its finite cyclic full root-of-unity group
has a generator rho_L whose class modulo l-th powers has exact order
l. Indeed an l-th root in L of rho_L would itself be a root of
unity, contrary to rho_L generating the full torsion group. This
class lies in SelL (all valuations zero) and in ker j (torsion killed
in Ct.mt). Thus the kernel of j restricted to SelL has size >=l.
Finite-group first isomorphism theorem gives the claimed inequality.
No assumption that the map onto SelInv is surjective from all SelL.
Even without this last kernel count, image containment removes l^2.

Actual consumer: sCount calls Ct.selInvLe then Ct.selInj and Ct.pCount.
Using native selLCard unchanged, the new torsion-rank factor can use
g0=2*[L:Q]+Nat.log 2(classNumber L), instead of gens L=g0+2;
with the kernel factor, g0-1 (g0>=2) suffices. This is uniform in
F,nu,zeta,gamma on SAME L and l. For SCount keep g0 (simpler nonnegative
exponent); combine independently checked exact unit valuation from
peer e897aeb5 only after replay. Still need Few, the full arithmetic
suppliers, SSha/SLayer/STors, and the actual RH-scale bound.
This is a proposed replacement of the local descent proof itself,
not a numerical adjustment to its existing l^2 bound.

Original selected graph: lemmaK -> sNum -> sCount -> selInvLe ->
exists_rep..., norm_pow..., T (r,Norm(v)) labels, representative
choice, selInvLe_lemma_5, Ct.h90, Ct.unram, Set.ncard_image_le.
Reduced: selInv normalization -> same exists_rep, norm_pow,
Lay+LTE, torsion correction -> Ct.h90, Ct.unram -> subgroup image
containment and kernel cardinality. Retain all original type/value/
constructor and axiom edges, shared consumers and fallback. New
native normalization, image and kernel proofs remain uncompiled;
only the group algebra of the correction is prepared below.
Cache by source/toolchain, L,F,l,c,nu,zeta,gamma,D,a,x and role.
No global retirement or new axioms accepted; no URT used.

Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Paths relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/
ModularityArgument/ClassCounting:
HasVal.lean ee8800532f5867e0bee6b50ba85e6e977328dbab (Lay);
SelmerOrderCounts/SelInvLe.lean 9c5062ff121f83f2062f66e5a3ed349179c1c748;
SelmerOrderCounts/SelLCard.lean 7c6df1894c807c8e54cb3dc9a75acf7c1d52ee9f;
SelmerOrderCounts.lean d0b527a9966ce2c6e6a9bfaa7be6620abf548752;
SelmerOrderCounts/ActU.lean db6d4849301edbe8a6b2630d06f2686b164adff7;
SelmerOrderCounts/PowEqOneOfDvd.lean d794188b6567833853f89c73f02df9114ac767d0;
SelmerOrderCounts/TwoLe.lean 16d7d15d6a1f7a7b3d6690d326c772a056811c98;
LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 incl mandatory
engine, SWARM, HANDOFF, AGENTS and state consulted. Latest peer
8be39223,4daf9080,e897aeb5,2b75bc4a,eadcc941,755b9251,3463c301,
6aaed9d5,7e262184 inspected; prior audit 6e70b2a0 retained.
The exact unit valuation peer is compatible on this human derivation,
not merged; no repeated rank-two constant tuning.

Executed 24 source pin/needle checks; 95 modular layers, 550 unique
norm adjustments, 455 non-power controls, 1 invalid 2-adic guard
negative control; 1315 total assertions (3 per layer plus source
and other checks). Reproducible V8 regression:
for (const l of [2,3,5,7,11]) for(let c=l===2?2:1;c<=4;c++)
for(let d=0;d<=4;d++){
  const L=BigInt(l),q=L**BigInt(c+d),u=1n+L**BigInt(c),n=L**BigInt(d);
  let s=0n,a=1n;for(let j=0n;j<n;j++){s=(s+a)%q;a=a*u%q}
  let t=s, v=0; while(t!==0n&&t%L===0n){v++;t/=L}
  if(v!==d||a!==1n)throw Error("norm valuation/order");
  const z=s*L**BigInt(c-1)%q;
  if(z===0n||z*L%q!==0n)throw Error("norm correction");
  for(let i=0n;i<L;i++){
    let kcount=0;for(let k=0n;k<L;k++)if((i*(q/L)+k*z)%q===0n)kcount++;
    if(kcount!==1)throw Error("unique adjustment");
  }
  for(let r=1n;r<L;r++)if((s/n*r)%L===0n)throw Error("nonpower");
}
if((1n+3n)%4n!==0n)throw Error("invalid 2-adic guard control");
These are exact exponent controls, NOT actual number-field computations.
Initial source assertion failed on mistyped HasVal SHA, corrected
against actual fetched blob and reran. Native lean/lake/elan absent.
Read actual baseline statuses b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717: runs 45577239749,
45576756833 pass for baseline only. New certificate not compiled,
not queued, no new kernel closure or axiom evidence.

RESUME HERE: implement native normalization lemma from Lay+norm
formula, reuse Ct.h90 and Ct.unram at exact SelInv caller, check
the image cardinality with the torsion kernel, then replace the
sCount call only after kernel replay. Preserve original fallback.
HANDOFF TO character boxes, structure, kernel, integration. RH OPEN.
-/

namespace RHAudit45
theorem normalize_norm {G H : Type*} [CommGroup G] [CommGroup H]
    (sigma : G →* G) (N : G →* H) (alpha v z : G) (l d : ℕ)
    (ha : sigma alpha = alpha * v ^ l)
    (hz : sigma z = z * (z ^ d) ^ l)
    (hk : ∃ k : ℕ, N v * (N (z ^ d)) ^ k = 1) :
    ∃ k : ℕ, sigma (alpha * z ^ k) =
      (alpha * z ^ k) * (v * (z ^ d) ^ k) ^ l ∧
      N (v * (z ^ d) ^ k) = 1 := by
  obtain ⟨k, h⟩ := hk
  refine ⟨k, ?_, ?_⟩
  · have hp : ((z ^ d) ^ l) ^ k = ((z ^ d) ^ k) ^ l := by
      rw [← pow_mul, ← pow_mul, Nat.mul_comm l k]
    calc
      sigma (alpha * z ^ k) = (alpha * v ^ l) * (z * (z ^ d) ^ l) ^ k := by
        rw [map_mul, map_pow, ha, hz]
      _ = (alpha * z ^ k) * (v * (z ^ d) ^ k) ^ l := by
        simp only [mul_pow, hp]
        ac_rfl
  · rw [map_mul, map_pow]
    exact h

theorem cardinal_transfer (S T K : ℕ) (hK : 0 < K)
    (hprod : S ≤ T / K) : S * K ≤ T :=
  (Nat.le_div_iff_mul_le hK).1 hprod

example {G H : Type*} [CommGroup G] [CommGroup H]
    (sigma : G →* G) (N : G →* H) (alpha v z : G) (l d : ℕ)
    (ha : sigma alpha = alpha * v ^ l)
    (hz : sigma z = z * (z ^ d) ^ l)
    (hk : ∃ k : ℕ, N v * (N (z ^ d)) ^ k = 1) :
    ∃ k : ℕ, sigma (alpha * z ^ k) =
      (alpha * z ^ k) * (v * (z ^ d) ^ k) ^ l ∧
      N (v * (z ^ d) ^ k) = 1 := by
  first
  | (rh_reduce 3 using [normalize_norm]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact normalize_norm sigma N alpha v z l d ha hz hk

end RHAudit45
rh_scan UpperTheory.V.ZK.Ct.selInvLe limit 2000
rh_scan UpperTheory.V.ZK.sCount limit 2000
rh_scan RHAudit45.normalize_norm limit 2000
rh_prune RHAudit45.normalize_norm as RHAudit45.NormalizePruned
#print axioms UpperTheory.V.ZK.Ct.selInvLe
#print axioms UpperTheory.V.ZK.sCount
#print axioms RHAudit45.normalize_norm
#print axioms RHAudit45.cardinal_transfer
