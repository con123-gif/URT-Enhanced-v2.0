import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.SelmerOrderCounts
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN47, 26 Nov 2026, AUDIT lane 10. HUMAN SOURCE-MATCHED / PREPARED,
NOT COMPILED. RH OPEN. One result: retain the native cyclic norm in
the exact torsion cancellation, recovering an additional uniform
saving at the actual all-layer sCount cap.

Read latest mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4
(including mandatory pipeline), SWARM, HANDOFF, AGENTS, RESEARCH_STATE,
runner protocol and continuity heads; latest peers 05da337a, ff996d30,
5305a18b, f4dbaa92, 5f0e858f and 65d0f958 inspected by commit index;
the character and prime peer certificate bodies read. Prior audit
e3f9d949 read. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

Audit of peer 5f0e858f: coefficient orientation E+1 and cyclic
Herbrand cardinality cancellation are valid given the retained local
Kummer identification, finite groups, cyclotomic unramified-outside-l
extension and actual Lay. They do not imply restriction is surjective.
The filtration bound uses the true H^0 sizes; accept conditionally,
not as a kernel fact. Peer ff996d30's scalar maximum is correct for
its stated weaker budget. Do not assume either bridge compiled.

NEW: fix q=l^j, 0<j<=nu, n=l^(nu-c), u=1+l^c, a=u^E, g=gamma^-1.
V=full virtual units in F*/(F*)^q; T=image of roots of unity;
D=g-a. Prior audit proved |W[q]|=|ker(D on V/T)| =
|ker D|*|D(V) intersect T|/|T|, conditional on W[q] identification.
Retain the intersection instead of bounding it by T.
Native Dat.nm is N=sum_{i=0}^{n-1} a^i g^(n-i).
Native private kerF_nm_del proves N D=(1-a^n)g exactly.
Since a^n=1 mod q by LTE and j<=nu, ND=0 on V.
Thus J=D(V) intersect T is contained in ker(N restricted to T).

T is cyclic of order q: native Lay excludes higher l-power roots
by the exact order of gamma (RUN46 audit); l'-torsion is q-divisible,
and if a root of unity is a qth power in F*, its root is itself
torsion. The generator on T has g acting as u^-1, so N on T is
multiplication by sum_{i=0}^{n-1} (a*u)^i=sum u^((E+1)i).
LTE (including c>=2 for l=2) gives exact valuation nu-c:
v_l((u^(E+1))^n-1)-v_l(u^(E+1)-1)=nu-c.
The n=1 case is the sum 1. Consequently
 |W[l^j]| * l^j <= |ker D| * l^min(j,nu-c).
This is stronger than RUN46's torsion cancellation; no assumption
of surjectivity of lifting, no double counting of H^0 since the
new factor is an independent upper bound on J/|T|. Combine with
peer base cohomology bound |ker D|<=l^(j*h-(j-t)_+),
t=c+v_l(E+1), h=log_l |SelL|>=1. Extend from j to k>=j with
the same peer |W[l]|<=l^h at each multiplication-by-l step:
 |W[l^k]| <= l^(k*h-(j-t)_+-(j-(nu-c))_+), j=min(k,nu).
For j=0, k=0 in the capped native context (nu>=c>=1); use trivial group.

Actual sCount: s=b+v, v=v_l(E), k=min(s,nu+v) via peer native
annihilator. Native SFew has b=2E+(2E+1)(c+2E+1), so c<=t<=b.
For c<=nu<=b: k=nu+v, j=nu, extra loss c; expression is
nondecreasing in nu because h>=1, so max on this interval at b.
For b<=nu<=s: k=s,j=nu, extra loss c; expression nonincreasing,
max at b. For nu>=s: k=j=s, max when nu>=s+c.
Exact scalar maximum (no claim of actual number field attaining):
  s*h-(b-t)-min(c,v).
Hence new uniform saving min(c,v_l(E)) in addition to ff996d30,
strict if l divides E. No extra uniform saving if v=0; do not
claim c universally. Retain exact unit correction from peer:
 |EqHom| * l^(R*v) <= T1*T2*l^(s*h-(b-t)-min(c,v)+c+v).
This is conditional on all peer native identification and cap
bridges, NOT a proved uniform STors/SFew or RH prime estimate.

Pinned source relative to ClassCounting:
HasVal.lean ee8800532f5867e0bee6b50ba85e6e977328dbab
SelmerOrderCounts/TwoLe.lean 16d7d15d6a1f7a7b3d6690d326c772a056811c98
SelmerOrderCounts/KerFDelNm.lean 4567e543a6a8a20967eaf96d3c964489feb10ecd
SelmerOrderCounts.lean d0b527a9966ce2c6e6a9bfaa7be6620abf548752
LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10
Original graph lemmaK -> lemmaK_of_steps -> sNum -> sCount ->
kerF/pCount/selInj/selInvLe/selLCard; keep all original edges,
axioms and unexpanded roles. Proposed graph sCountUniform46 ->
sCountCapped46 -> pCountBudget48 -> all-level bound -> peer Kummer
descent/filtration + torsion_norm_cancel + native_nm_del + LTE +
uniform_norm_budget. Only changed budget supplier; actual caller
can accept M directly. No globally removed dependency. Cache exact
source/toolchain/L/F/l/c/nu/E/b/h/g/a/q/zeta/gamma/caller.

Executed V8 exact checks: 2960 modular norm cases, 5658 finite
triangular group actions, 1311075 scalar layer cases, 57150 exact
scalar maxima, 50800 parameter sets with strict additional saving,
2713772 assertions. First broad test included t<c and failed a
nonnegativity assertion; this is OUTSIDE actual native t>=c,
not silently dropped from the theorem domain.
Reproduce (no number field experiments):
function gcd(a,b){return b?gcd(b,a%b):Math.abs(a)}
function pow(a,n,m){let z=1;while(n){if(n%2)z=z*a%m;a=a*a%m;n=Math.floor(n/2)}return z}
function val(a,l){let v=0;while(a%l===0){v++;a/=l}return v}
let checks=0,norm=0,scalar=0,maxima=0,strict=0,grp=0;
function ck(x){checks++;if(!x)throw Error("check "+checks)}
for(const l of [2,3,5,7])for(let c=l===2?2:1;c<=4;c++)for(let nu=c;nu<=5;nu++)for(let j=1;j<=nu;j++)for(let E=1;E<=16;E++){
 const q=l**j,n=l**(nu-c),u=(1+l**c)%q,a=pow(u,E,q),inv=pow(u,n-1,q);
 let N=0,z=1;for(let i=0;i<n;i++){N=(N+z)%q;z=z*a%q*u%q}
 ck(pow(a,n,q)===1);ck(pow(inv,n,q)===1);
 ck(gcd(N,q)===l**Math.min(j,nu-c));ck(N*(inv-a)%q===0);norm++;
 if(q<=49&&E<=6){for(let f=0;f<q;f++){
 let nf=0,z=1;for(let i=0;i<n;i++){nf=(nf+z*f)%q;z=z*inv%q}
 if(nf!==0)continue;
 let K=0,U=0,J=new Set();
 for(let x=0;x<q;x++)for(let y=0;y<q;y++){
  const r=((inv-a)*x+f*y)%q,s=(1-a)*y%q;
  if(r===0&&s===0)K++;
  if(s===0){U++;J.add((r+q)%q)}
 }
 ck(U===K*J.size);ck(U%q===0);ck(J.size<=gcd(N,q));ck(U<=K*gcd(N,q));grp++;
 }}
}
for(let c=1;c<=5;c++)for(let b=c;b<=24;b++)for(let v=0;v<=8;v++)for(let t=c;t<=b;t++)for(let h=1;h<=5;h++){
 const s=b+v,U=s*h-(b-t)-Math.min(c,v);let mx=-1;
 for(let nu=c;nu<=s+c+1;nu++){let k=Math.min(s,nu+v),j=Math.min(k,nu),L=k*h-Math.max(0,j-t)-Math.max(0,j-(nu-c));
 ck(L<=U);ck(L>=0);mx=Math.max(mx,L);scalar++;
 }ck(mx===U);maxima++;if(v>0)strict++;
}
console.log({checks,norm,grp,scalar,maxima,strict});
26 source pin/needle/extraction checks executed before writing.
Native Lean/Lake/elan unavailable; git ls-remote DNS failed.
Read historical actual status JSON blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
7da354941e402b6f8b364ed03d8c5c82d27b7717 (CI runs 45577239749,
45576756833, returncode 0); baseline only. New Lean certificate
uncompiled, unqueued; no new axiom evidence, caller replacement
or root closure. No URT claim.
RESUME HERE: native-check the copied norm identity, generic finite
group inequality and scalar maximum upper bound, then apply the
norm factor to the peer Kummer supplier and existing sCountCapped46.
Do not delay other actual STors/SFew proof work for further constant
refinement. HANDOFF TO character, prime, kernel, integration.
Verdict AGREE / PARTIAL, conditional human audit; RH OPEN.
-/

open NumberField IsDedekindDomain UpperTheory.V UpperTheory.V.ZK UpperTheory.V.ZK.Ct

theorem RHAudit47.native_tele {Y I : Type} [AddCommGroup Y] [AddCommGroup I] (D : Dat Y I) :
    ∑ j ∈ Finset.range D.n, (((D.a : ℤ) ^ j) • D.g ^ (D.n - j + 1) - ((D.a : ℤ) ^ (j + 1)) • D.g ^ (D.n - j))
      = (1 - (D.a : ℤ) ^ D.n) • D.g := by
  have key : ∀ j ∈ Finset.range D.n,
      ((D.a : ℤ) ^ j • D.g ^ (D.n - j + 1) - (D.a : ℤ) ^ (j + 1) • D.g ^ (D.n - j))
        = (fun k => (D.a : ℤ) ^ k • D.g ^ (D.n - k + 1)) j
          - (fun k => (D.a : ℤ) ^ k • D.g ^ (D.n - k + 1)) (j + 1) := by
    intro j hj
    have hj' : j < D.n := Finset.mem_range.mp hj
    have e : D.n - (j + 1) + 1 = D.n - j := by omega
    simp only [e]
  rw [Finset.sum_congr rfl key, Finset.sum_range_sub']
  simp only [pow_zero, one_smul, Nat.sub_zero, Nat.sub_self, zero_add, pow_one]
  rw [pow_succ, D.g_pow, one_mul, sub_smul, one_smul]

theorem RHAudit47.native_nm_del {Y I : Type} [AddCommGroup Y] [AddCommGroup I] (D : Dat Y I) :
    D.nm * D.del = (1 - (D.a : ℤ) ^ D.n) • D.g := by
  rw [← native_tele D]
  simp only [Dat.nm, Dat.del, Finset.sum_mul]
  refine Finset.sum_congr rfl (fun j _ => ?_)
  rw [smul_mul_assoc, mul_sub, mul_smul_comm, mul_one, smul_sub, smul_smul, ← pow_succ, ← pow_succ]


namespace RHAudit47

theorem torsion_norm_cancel {A : Type} [AddCommGroup A] [Finite A]
    (T : Submodule ℤ A) (D : A →ₗ[ℤ] A)
    (hT : T ≤ T.comap D) (N : T →ₗ[ℤ] T)
    (hN : ∀ x : T.comap D, N ⟨D x.1, x.2⟩ = 0) :
    Nat.card ((T.comap D) ⧸ T.submoduleOf (T.comap D)) * Nat.card T ≤
      Nat.card (LinearMap.ker D) * Nat.card (LinearMap.ker N) := by
  classical
  let U := T.comap D
  let f : U →ₗ[ℤ] T :=
    { toFun := fun x => ⟨D x.1, x.2⟩
      map_add' := by intro x y; apply Subtype.ext; exact map_add D x.1 y.1
      map_smul' := by intro r x; apply Subtype.ext; exact map_smul D r x.1 }
  let e : T.submoduleOf U ≃ T :=
    { toFun := fun x => ⟨x.1.1, x.2⟩
      invFun := fun x => ⟨⟨x.1, hT x.2⟩, x.2⟩
      left_inv := by intro x; apply Subtype.ext; apply Subtype.ext; rfl
      right_inv := by intro x; apply Subtype.ext; rfl }
  have hU : Nat.card U = Nat.card (LinearMap.range f) * Nat.card (LinearMap.ker f) := by
    have h := AddSubgroup.card_eq_card_quotient_mul_card_addSubgroup (LinearMap.ker f).toAddSubgroup
    rwa [Nat.card_congr f.quotKerEquivRange.toEquiv] at h
  have hR : Nat.card (LinearMap.range f) ≤ Nat.card (LinearMap.ker N) := by
    let j : LinearMap.range f → LinearMap.ker N := fun x =>
      ⟨x.1, by
        obtain ⟨y, hy⟩ := x.2
        rw [← hy]
        exact hN y⟩
    apply Nat.card_le_card_of_injective j
    intro x y h
    apply Subtype.ext
    exact congrArg Subtype.val h
  have hK : Nat.card (LinearMap.ker f) ≤ Nat.card (LinearMap.ker D) := by
    let j : LinearMap.ker f → LinearMap.ker D := fun x =>
      ⟨x.1.1, congrArg Subtype.val (LinearMap.mem_ker.1 x.2)⟩
    apply Nat.card_le_card_of_injective j
    intro x y h
    apply Subtype.ext
    apply Subtype.ext
    exact congrArg Subtype.val h
  have hQ : Nat.card U = Nat.card (U ⧸ T.submoduleOf U) * Nat.card T := by
    have h := AddSubgroup.card_eq_card_quotient_mul_card_addSubgroup
      (T.submoduleOf U).toAddSubgroup
    rwa [Nat.card_congr e] at h
  have h := Nat.mul_le_mul hR hK
  rw [← hU, hQ] at h
  simpa [Nat.mul_comm] using h


theorem uniform_norm_budget (b v t h c ν : ℕ)
    (hc : c ≤ ν) (ht : c ≤ t) (hb : t ≤ b) (hh : 1 ≤ h) :
    let k := min (b+v) (ν+v)
    let j := min k ν
    k*h - (j-t) - (j-(ν-c)) ≤ (b+v)*h - (b-t) - min c v := by
  dsimp only
  let k := min (b+v) (ν+v)
  let j := min k ν
  change k*h - (j-t) - (j-(ν-c)) ≤ (b+v)*h - (b-t) - min c v
  have hk : k ≤ b+v := min_le_left _ _
  have hjk : j ≤ k := min_le_left _ _
  have hjν : j ≤ ν := min_le_right _ _
  have hmul : b+v-k ≤ (b+v-k)*h := Nat.le_mul_of_pos_right _ (by omega)
  have hsplit : (b+v)*h = k*h + (b+v-k)*h := by
    rw [← Nat.add_mul, show k + (b+v-k) = b+v by omega]
  have hjmul : j ≤ k*h := hjk.trans (Nat.le_mul_of_pos_right _ (by omega))
  have hnonneg : (j-t)+(j-(ν-c)) ≤ j := by omega
  have hcv : min c v ≤ c := min_le_left _ _
  have hv : min c v ≤ v := min_le_right _ _
  have hbudget : (b-t)+min c v ≤ (b+v-k)*h+(j-t)+(j-(ν-c)) := by
    by_cases hn : ν ≤ b
    · have e1 : k = ν+v := min_eq_right (by omega)
      have e2 : j = ν := min_eq_right (by omega)
      omega
    · have e1 : k = b+v := min_eq_left (by omega)
      by_cases hn' : ν ≤ b+v
      · have e2 : j = ν := min_eq_right (by omega)
        omega
      · have e2 : j = b+v := min_eq_left (by omega)
        omega
  omega


example (b v t h c ν : ℕ) (hc : c ≤ ν) (ht : c ≤ t)
    (hb : t ≤ b) (hh : 1 ≤ h) :
    let k := min (b+v) (ν+v)
    let j := min k ν
    k*h - (j-t) - (j-(ν-c)) ≤ (b+v)*h - (b-t) - min c v := by
  first
  | (rh_reduce 3 using [uniform_norm_budget]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact uniform_norm_budget b v t h c ν hc ht hb hh

end RHAudit47

rh_scan UpperTheory.V.ZK.Ct.kerF limit 2000
rh_scan UpperTheory.V.ZK.sCount limit 2000
rh_scan RHAudit47.native_nm_del limit 2000
rh_prune RHAudit47.torsion_norm_cancel as RHAudit47.TorsionNormPruned
rh_prune RHAudit47.uniform_norm_budget as RHAudit47.UniformNormPruned
#print axioms UpperTheory.V.ZK.Ct.kerF
#print axioms UpperTheory.V.ZK.sCount
#print axioms RHAudit47.native_nm_del
#print axioms RHAudit47.torsion_norm_cancel
#print axioms RHAudit47.uniform_norm_budget
