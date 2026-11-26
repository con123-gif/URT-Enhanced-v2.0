import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.SelmerOrderCounts
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN45, 26 November 2026, lane 6. HUMAN SOURCE-MATCHED exact all-level
twisted Selmer identity and weaker actual pCount interface; native
certificate PREPARED, NOT COMPILED. RH OPEN.

Prior RUN44 e897aeb5 retains negative unit valuation. Peer RUN47
prime_window (b4fb2856d8fade02c841e1ef4aaadbd819585fa6) gives joint
class/local rank at l; audit RUN45 (42eb86820852cf2d3f54d36ba4f437bace6493cb)
gives cyclotomic norm descent at l. Neither is repeated or assumed.
Integration 0303 shared rank-sliced VWin (a839ff86da5c5c223c3b1e2ac64bade3366aebcc)
read. Comparison from RUN44 returned 13 intervening commits.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory
engine, AGENTS, SWARM, HANDOFF, EXPANSION, continuity/state/log/protocol
heads consulted. Pin 40e56bab026552e089d7afcfeff08d2defb9c005;
Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Upstream main observed dd2dcbe020d101dc603063ba5a7197b2c69600f1,
not adopted or asserted equivalent.

Exact identity in native Ct.Dat (TwoLe):
T=tors(Y), delta=g-a, delta_I=g_I-a, U=d^-1(delta_I I),
W=U/(delta Y+T). For every positive integer q put
  S_q={ y mod (qY+T) : delta y in qY+T, d y in qI }.
Then W[q] is canonically isomorphic to S_q. At q=l and l|(a-1),
S_l is D.SelInv l. At higher q MUST retain delta, not g-1.

Proof: d kills T as I torsion-free; g preserves T. Pass to M=Y/T.
Both delta on M and delta_I on I are injective: g x=a x and
g^n=1 imply (a^n-1)x=0, a>=2,n>0. For y in S_q, delta y=q u
in M, d y=q i in I. Applying d and cancelling q gives
d u=delta_I i, so u in U/T. Send y to u mod delta M, in W[q].
Replacing y by y+qz changes u by delta z, so well-defined.
If image zero, u=delta z, injectivity yields y=qz in M.
Conversely for w in W[q] represented by u in U/T, q u=delta y.
Applying d and injecting delta_I gives d y=q i. This is inverse.
Lean candidate below uses two injections for finite cardinal equality,
not a compiled LinearEquiv.

Actual sCount takes f from Ct.kerF, s=b+v_l(E), u prime-to-l,
and |range f|<=B via Few; then invokes pCount with gens L.
Set K=ker f. Since u*l^s kills K, its l-primary subgroup is K[l^s].
The short exact sequence yields the exact product
  l^v_l(|W|)=l^v_l(|range f|)*|K[l^s]|
            <=l^v_l(|range f|)*|S_(l^s)|.
Prepared pCount_cut copies native pCount without final card_tors/rank
inflation and retains the prime part of the range. It proves the
inequality, not the exact kernel product. pCount_twSel substitutes
the exact S_q identity. No new rank estimate required at this interface.
Native |S_l|^s may overcount higher layers.

Combining RUN44's exact unit algebra (independent, still uncompiled),
h=|EqHom|, R=nrComplexPlaces L, v=v_l(E):
  h*(l^nu)^R*l^(R*v) <= l^(c+v)*l^v_l(|range f|)*|S_(l^(b+v))|.
Since l^v_l(|range f|)<=B, a bound |S_q|<=M uniform over the actual
F,nu,zeta,gamma on SAME lifted L,l,E,c,b permits SSha to use
  l^s_sha*l^(R*v)<=T1*T2*M*l^(c+v)
with SFew's B=(l^nu)^R*T1*T2, integer floor as RUN44.
Do not allow M to depend on F,nu; do not infer it from the peer
prime-level descent without controlling a mod q.
No new uniform ShaK or VWin estimate.

Original selected graph: lemmaK -> lemmaK_of_steps -> sNum -> sCount
-> pCount -> card_tors, W[l] rank; sCount -> selInj -> SelInv;
selInvLe, selLCard, Few and all other suppliers retained.
Candidate: pCount_twSel -> pCount_cut, twSel_card -> twSel_forward,
twSel_reverse, del_tors_reflect, original Dat. All original graph
artifacts, unresolved type/value/constructor/axiom edges and fallback
preserved. No global retirement, no actual sCount caller substitution.
Cache key source/toolchain,D,g,gI,d,a,n,L,F,l,c,nu,E,b,f,u,q,caller.
No URT; exact algebra sufficient.

Source blobs relative to ClassCounting:
SelmerOrderCounts/SelInj.lean c4cc6515ee8980a2dadfa1455968a29da6d6d0db
SelmerOrderCounts/PCount.lean c6a473b2ce1fc45ba140660a4f6808ae468aa388
SelmerOrderCounts/TwoLe.lean 16d7d15d6a1f7a7b3d6690d326c772a056811c98
SelmerOrderCounts.lean d0b527a9966ce2c6e6a9bfaa7be6620abf548752
LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10
NumThree.lean 900c8e3fca10cdf9256061213dcc9453bf98f3d2.
Executed 35 source pin, exact needle, reversible edits and
no inserted proof-hole checks. Initial occurrence-count assertion
failed (expected 3 instead of 4 native SelInv references), corrected.
Actual previous CI job lists 45577239749 and 45576756833 retrieved:
pick/run/record all success, BASELINE ONLY. No lean/lake locally.
New code not compiled or queued; no new native scan/axiom evidence.

Executed exact V8 lattice controls: 2178 rank-one, 648 rank-two swap
cases, 12716 assertions, 283 strict improvements over prime-rank power,
815 mismatches under incorrect g-1 substitution. Not number-field
experiments. Reproduce in JS:
const gcd=(a,b)=>b?gcd(b,a%b):Math.abs(a);
const mod=(a,n)=>((a%n)+n)%n;
let cyclic=0,swap=0,strict=0,wrong=0,assertions=0;
function ck(x){assertions++;if(!x)throw Error("control "+assertions)}
for(const l of [2,3,5])for(let s=1;s<=3;s++){const q=l**s;
for(const eps of [-1,1])for(let a=2;a<=12;a++)for(let d=0;d<=10;d++){
const h=a-eps,N=gcd(h,d),step=h/N,W=[];
for(let r=0;r<N;r++)if(q*r%N===0)W.push(r);
const T=[];let un=0;
for(let x=0;x<q;x++){
if((eps-1)*x%q===0&&d*x%q===0)un++;
if((eps-a)*x%q===0&&d*x%q===0){
let u=(eps-a)*x/q;ck(u%step===0);T.push(mod(u/step,N))}}
ck(T.length===new Set(T).size);
ck(T.slice().sort((a,b)=>a-b).join()===W.join());
ck(W.length<=gcd(l,N)**s);strict+=W.length<gcd(l,N)**s;
wrong+=un!==W.length;cyclic++}
if(s===3&&l===5)continue;
for(let a=2;a<=10;a++)for(let d=0;d<=8;d++){
let N=a*a-1,h=a-1,W=[];
for(let r=0;r<N;r++)if(d*r%h===0&&q*r%N===0)W.push(r);
let T=[],un=0;
for(let x=0;x<q;x++)for(let y=0;y<q;y++){
if((y-x)%q===0&&(x-y)%q===0&&d*(x+y)%q===0)un++;
if((y-a*x)%q===0&&(x-a*y)%q===0&&d*(x+y)%q===0){
let u=(y-a*x)/q,v=(x-a*y)/q;ck(d*(u+v)%h===0);
T.push(mod(u+a*v,N))}}
ck(T.length===new Set(T).size);
ck(T.slice().sort((a,b)=>a-b).join()===W.join());
let w1=0;for(let r=0;r<N;r++)if(d*r%h===0&&l*r%N===0)w1++;
ck(W.length<=w1**s);strict+=W.length<w1**s;
wrong+=un!==W.length;swap++}}
console.log({cyclic,swap,strict,wrong,assertions});
End reproduction. Explicit negative control Y=Z,I=0,g=1,a=3,q=4:
W=Z/2, |W[4]|=2, untwisted SelInv(4) size 4.
This obstructs extending prime-level norm descent by forgetting a mod q.

RESUME HERE: replay twSel_card and pCount_twSel with the pinned native
runner; trace twisted Kummer eigenspace at q=l^(b+v) using actual Lay
action and local valuations, seek same-host uniform bound without
repeated rank cost. Compare to prime-level descent only where
q|(a-1) proved. Preserve SFew, SSha, SLayer, STors, CountI/II/V/Vs,
VWin and signed-prime obligations.
HANDOFF TO arithmetic, audit, kernel, integration. RH OPEN.
-/

open NumberField IsDedekindDomain UpperTheory.V UpperTheory.V.ZK UpperTheory.V.ZK.Ct

namespace RHCharacter45

def TwSel {Y I : Type} [AddCommGroup Y] [AddCommGroup I] (D : Dat Y I) (q : ℕ) :
    Set (Y ⧸ Ct.mt Y q) :=
  {x | ∃ y : Y, Submodule.Quotient.mk y = x ∧ D.del y ∈ Ct.mt Y q ∧
    ∃ i : I, D.d y = (q : ℤ) • i}

private theorem selInj_delI_inj {Y I : Type} [AddCommGroup Y] [AddCommGroup I] (D : Dat Y I)
    (v : I) (hv : D.delI v = 0) : v = 0 := by
  have h1 : D.gI v = (D.a : ℤ) • v := by
    have h := hv
    simp only [Dat.delI, LinearMap.sub_apply, sub_eq_zero] at h
    rw [h]
    simp
  have hp : ∀ k : ℕ, (D.gI ^ k) v = ((D.a : ℤ) ^ k) • v := by
    intro k
    induction k with
    | zero => simp
    | succ k ih =>
      rw [pow_succ, Module.End.mul_apply, h1, map_zsmul, ih, smul_smul, pow_succ, mul_comm]
  have hn := hp D.n
  rw [D.gI_pow] at hn
  change v = _ at hn
  apply D.tf ((D.a : ℤ) ^ D.n - 1) v
  · have h2 : (1 : ℤ) < (D.a : ℤ) ^ D.n := one_lt_pow₀ (by have := D.two_le; omega) D.n_pos.ne'
    omega
  · rw [sub_smul, one_smul, ← hn, sub_self]

private theorem selInj_tors_iff {Y : Type} [AddCommGroup Y] (t : Y) :
    t ∈ Submodule.torsion ℤ Y ↔ ∃ m : ℤ, m ≠ 0 ∧ m • t = 0 := by
  rw [Submodule.mem_torsion_iff]
  constructor
  · rintro ⟨⟨m, hm⟩, h⟩
    exact ⟨m, nonZeroDivisors.ne_zero hm, h⟩
  · rintro ⟨m, hm, h⟩
    exact ⟨⟨m, mem_nonZeroDivisors_of_ne_zero hm⟩, h⟩

private theorem selInj_mem_mt {Y : Type} [AddCommGroup Y] (l : ℕ) (x : Y) :
    x ∈ mt Y l ↔ ∃ z : Y, ∃ t ∈ Submodule.torsion ℤ Y, (l : ℤ) • z + t = x := by
  simp only [Ct.mt, Submodule.mem_sup, LinearMap.mem_range]
  constructor
  · rintro ⟨y, ⟨z, rfl⟩, t, ht, h⟩
    exact ⟨z, t, ht, by simpa using h⟩
  · rintro ⟨z, t, ht, h⟩
    exact ⟨_, ⟨z, rfl⟩, t, ht, by simpa using h⟩

theorem twSel_forward :
    ∀ (Y I : Type) [AddCommGroup Y] [AddCommGroup I] (D : Dat Y I), ∀ l : ℕ, 0 < l → Finite ((TwSel D l)) → Nat.card {w : D.W // (l : ℤ) • w = 0} ≤ Nat.card ((TwSel D l)) := by
  intro Y I _ _ D l hl0 hfin
  have hdel_apply : ∀ y, D.del y = D.g y - (D.a : ℤ) • y := by
    intro y
    simp [Dat.del]
  have hdelI_apply : ∀ v, D.delI v = D.gI v - (D.a : ℤ) • v := by
    intro v
    simp [Dat.delI]
  have htor : ∀ {y : Y} (m : ℤ), m ≠ 0 → m • y ∈ Submodule.torsion ℤ Y → y ∈ Submodule.torsion ℤ Y := by
    intro y m hm h
    obtain ⟨m', hm', h'⟩ := (selInj_tors_iff _).1 h
    exact (selInj_tors_iff y).2 ⟨m' * m, mul_ne_zero hm' hm, by rw [mul_smul, h']⟩
  have hdt : ∀ t ∈ Submodule.torsion ℤ Y, D.d t = 0 := by
    intro t ht
    obtain ⟨m, hm, h⟩ := (selInj_tors_iff t).1 ht
    exact D.tf m _ hm (by rw [← map_zsmul, h, map_zero])
  have hdd : ∀ y, D.d (D.del y) = D.delI (D.d y) := by
    intro y
    rw [hdel_apply, hdelI_apply, map_sub, map_zsmul, D.comm]
  have hdelt : ∀ t ∈ Submodule.torsion ℤ Y, D.del t ∈ Submodule.torsion ℤ Y := by
    intro t ht
    obtain ⟨m, hm, h⟩ := (selInj_tors_iff t).1 ht
    exact (selInj_tors_iff _).2 ⟨m, hm, by rw [← map_zsmul, h, map_zero]⟩
  have key : ∀ w : {w : D.W // (l : ℤ) • w = 0}, ∃ u : D.U, Submodule.Quotient.mk u = w.1 ∧
      ∃ y : Y, ∃ t ∈ Submodule.torsion ℤ Y, (l : ℤ) • (u : Y) = D.del y + t := by
    rintro ⟨w, hw⟩
    obtain ⟨u, rfl⟩ := Submodule.Quotient.mk_surjective _ w
    refine ⟨u, rfl, ?_⟩
    rw [← Submodule.Quotient.mk_smul, Submodule.Quotient.mk_eq_zero] at hw
    have hw' : (l : ℤ) • (u : Y) ∈ LinearMap.range D.del ⊔ Submodule.torsion ℤ Y := hw
    obtain ⟨a', ⟨y, rfl⟩, t, ht, h⟩ := Submodule.mem_sup.1 hw'
    exact ⟨y, t, ht, h.symm⟩
  choose u hu y t ht hyt using key
  have hsel : ∀ w, (Submodule.Quotient.mk (y w) : Y ⧸ Ct.mt Y l) ∈ (TwSel D l) := by
    intro w
    refine ⟨y w, rfl, ?_, ?_⟩
    · rw [selInj_mem_mt]
      refine ⟨(u w : Y), -t w, neg_mem (ht w), ?_⟩
      rw [hyt w]
      abel
    · obtain ⟨i, hi⟩ := (u w).2
      refine ⟨i, ?_⟩
      have e := congrArg D.d (hyt w)
      rw [map_zsmul, map_add, hdt _ (ht w), add_zero, hdd, ← hi] at e
      rw [← sub_eq_zero]
      apply selInj_delI_inj D
      rw [map_sub, map_zsmul, ← e, sub_self]
  let f : {w : D.W // (l : ℤ) • w = 0} → (TwSel D l) := fun w => ⟨_, hsel w⟩
  apply Nat.card_le_card_of_injective f
  intro w w' hww
  have hq : (Submodule.Quotient.mk (y w) : Y ⧸ Ct.mt Y l) = Submodule.Quotient.mk (y w') :=
    congrArg Subtype.val hww
  rw [Submodule.Quotient.eq, selInj_mem_mt] at hq
  obtain ⟨z, t0, ht0, hz⟩ := hq
  apply Subtype.ext
  rw [← hu w, ← hu w', Submodule.Quotient.eq]
  show ((u w : Y) - (u w' : Y)) ∈ LinearMap.range D.del ⊔ Submodule.torsion ℤ Y
  have e2 : D.del (y w) - D.del (y w') = (l : ℤ) • D.del z + D.del t0 := by
    rw [← map_sub, ← hz, map_add, map_zsmul]
  have hs : (u w : Y) - u w' - D.del z ∈ Submodule.torsion ℤ Y := by
    refine htor (l : ℤ) (by exact_mod_cast hl0.ne') ?_
    have e : (l : ℤ) • ((u w : Y) - u w' - D.del z) = D.del t0 + (t w - t w') := by
      rw [smul_sub, smul_sub, hyt w, hyt w',
        show D.del (y w) = (l : ℤ) • D.del z + D.del t0 + D.del (y w') by rw [← e2]; abel]
      abel
    rw [e]
    exact add_mem (hdelt t0 ht0) (sub_mem (ht w) (ht w'))
  rw [show (u w : Y) - u w' = D.del z + ((u w : Y) - u w' - D.del z) by abel]
  exact Submodule.add_mem_sup (LinearMap.mem_range_self _ _) hs

private theorem del_tors_reflect {Y I : Type} [AddCommGroup Y] [AddCommGroup I]
    (D : Dat Y I) (y : Y) (hy : D.del y ∈ Submodule.torsion ℤ Y) :
    y ∈ Submodule.torsion ℤ Y := by
  obtain ⟨m, hm, hmy⟩ := (selInj_tors_iff _).1 hy
  have h0 : D.del (m • y) = 0 := by rw [map_zsmul, hmy]
  have h1 : D.g (m • y) = (D.a : ℤ) • (m • y) := by
    simpa [Dat.del, sub_eq_zero] using h0
  have hp : ∀ k : ℕ, (D.g ^ k) (m • y) = ((D.a : ℤ) ^ k) • (m • y) := by
    intro k
    induction k with
    | zero => simp
    | succ k ih =>
      rw [pow_succ, Module.End.mul_apply, h1, map_zsmul, ih, smul_smul, pow_succ, mul_comm]
  have hn := hp D.n
  rw [D.g_pow] at hn
  change m • y = _ at hn
  have ha : (D.a : ℤ) ^ D.n - 1 ≠ 0 := by
    have h2 : (1 : ℤ) < (D.a : ℤ) ^ D.n :=
      one_lt_pow₀ (by have := D.two_le; omega) D.n_pos.ne'
    omega
  refine (selInj_tors_iff y).2 ⟨((D.a : ℤ) ^ D.n - 1) * m, mul_ne_zero ha hm, ?_⟩
  rw [mul_smul, sub_smul, one_smul, ← hn, sub_self]

theorem twSel_reverse {Y I : Type} [AddCommGroup Y] [AddCommGroup I]
    (D : Dat Y I) (q : ℕ) (hq : 0 < q) [Finite D.W] :
    Finite (TwSel D q) ∧ Nat.card (TwSel D q) ≤ Nat.card {w : D.W // (q : ℤ) • w = 0} := by
  classical
  have hdt : ∀ t ∈ Submodule.torsion ℤ Y, D.d t = 0 := by
    intro t ht
    obtain ⟨m, hm, h⟩ := (selInj_tors_iff t).1 ht
    exact D.tf m _ hm (by rw [← map_zsmul, h, map_zero])
  have hdd : ∀ y, D.d (D.del y) = D.delI (D.d y) := by
    intro y
    simp [Dat.del, Dat.delI, D.comm]
  have key : ∀ x : TwSel D q, ∃ y : Y, ∃ u : D.U, ∃ t ∈ Submodule.torsion ℤ Y,
      Submodule.Quotient.mk y = x.1 ∧ (q : ℤ) • (u : Y) = D.del y + t := by
    rintro ⟨x, hx⟩
    obtain ⟨y, hy, hd, i, hi⟩ := hx
    obtain ⟨z, t, ht, ht'⟩ := (selInj_mem_mt q _).1 hd
    have hz : D.d z = D.delI i := by
      have h := congrArg D.d ht'
      rw [map_add, map_zsmul, hdt _ ht, add_zero, hdd, hi, map_zsmul] at h
      apply sub_eq_zero.mp
      apply D.tf (q : ℤ) _ (by exact_mod_cast hq.ne')
      rw [smul_sub, h, sub_self]
    refine ⟨y, ⟨z, ⟨i, hz.symm⟩⟩, -t, neg_mem ht, hy, ?_⟩
    change (q : ℤ) • z = D.del y + -t
    rw [← ht']
    abel
  choose y u t ht hy hrel using key
  have hw : ∀ x, (q : ℤ) • (Submodule.Quotient.mk (u x) : D.W) = 0 := by
    intro x
    rw [← Submodule.Quotient.mk_smul, Submodule.Quotient.mk_eq_zero]
    change (q : ℤ) • (u x : Y) ∈ LinearMap.range D.del ⊔ Submodule.torsion ℤ Y
    rw [hrel x]
    exact Submodule.add_mem_sup (LinearMap.mem_range_self _ _) (ht x)
  let f : TwSel D q → {w : D.W // (q : ℤ) • w = 0} := fun x => ⟨_, hw x⟩
  have hf : Function.Injective f := by
    intro x x' heq
    have he := congrArg Subtype.val heq
    change (Submodule.Quotient.mk (u x) : D.W) = Submodule.Quotient.mk (u x') at he
    rw [Submodule.Quotient.eq] at he
    change (u x : Y) - (u x' : Y) ∈ LinearMap.range D.del ⊔ Submodule.torsion ℤ Y at he
    obtain ⟨v, ⟨z, rfl⟩, t0, ht0, hsum⟩ := Submodule.mem_sup.1 he
    have e0 := congrArg (fun a : Y => (q : ℤ) • a) hsum.symm
    rw [smul_sub, hrel x, hrel x', smul_add] at e0
    have h1 : D.del (y x - y x' - (q : ℤ) • z) ∈ Submodule.torsion ℤ Y := by
      have h2 : D.del (y x - y x' - (q : ℤ) • z) =
          (q : ℤ) • t0 - t x + t x' := by
        rw [map_sub, map_sub, map_zsmul]
        calc
          _ = ((D.del (y x) + t x) - (D.del (y x')+t x')) -
              (q : ℤ) • D.del z - t x + t x' := by abel
          _ = _ := by rw [e0]; abel
      rw [h2]
      exact add_mem (sub_mem (Submodule.smul_mem _ _ ht0) (ht x)) (ht x')
    have h3 := del_tors_reflect D _ h1
    apply Subtype.ext
    rw [← hy x, ← hy x', Submodule.Quotient.eq]
    exact (selInj_mem_mt q _).2 ⟨z, _, h3, by abel⟩
  exact ⟨Finite.of_injective f hf, Nat.card_le_card_of_injective f hf⟩

theorem twSel_card {Y I : Type} [AddCommGroup Y] [AddCommGroup I]
    (D : Dat Y I) (q : ℕ) (hq : 0 < q) [Finite D.W] :
    Finite (TwSel D q) ∧ Nat.card (TwSel D q) = Nat.card {w : D.W // (q : ℤ) • w = 0} := by
  obtain ⟨hf, hr⟩ := twSel_reverse D q hq
  exact ⟨hf, le_antisymm hr (twSel_forward Y I D q hq hf)⟩

theorem pCount_cut :
    ∀ (W Z : Type) [AddCommGroup W] [AddCommGroup Z] [Finite W] (f : W →ₗ[ℤ] Z) (l s : ℕ) (u : ℤ), l.Prime → ¬(l : ℤ) ∣ u → (∀ w, f w = 0 → (u * (l : ℤ) ^ s) • w = 0) → l ^ (Nat.card W).factorization l ≤ l ^ (Nat.card (LinearMap.range f)).factorization l * Nat.card {w : W // (l : ℤ) ^ s • w = 0} := by
  intro W Z _ _ _ f l s u hl hlu hker
  haveI := Fact.mk hl
  let K := LinearMap.ker f
  let gm : K →ₗ[ℤ] K := ((l : ℤ) ^ s) • LinearMap.id
  haveI : Finite (LinearMap.range f) := Finite.of_surjective _ f.surjective_rangeRestrict
  have hWc : Nat.card W = Nat.card (LinearMap.range f) * Nat.card K := by
    have h : Nat.card W = Nat.card (W ⧸ LinearMap.ker f) * Nat.card (LinearMap.ker f) :=
      AddSubgroup.card_eq_card_quotient_mul_card_addSubgroup (LinearMap.ker f).toAddSubgroup
    rwa [Nat.card_congr f.quotKerEquivRange.toEquiv] at h
  have hKc : Nat.card K = Nat.card (LinearMap.range gm) * Nat.card (LinearMap.ker gm) := by
    have h : Nat.card K = Nat.card (K ⧸ LinearMap.ker gm) * Nat.card (LinearMap.ker gm) :=
      AddSubgroup.card_eq_card_quotient_mul_card_addSubgroup (LinearMap.ker gm).toAddSubgroup
    rwa [Nat.card_congr gm.quotKerEquivRange.toEquiv] at h
  have hR0 : Nat.card (LinearMap.range f) ≠ 0 := Nat.card_pos.ne'
  have hK0 : Nat.card K ≠ 0 := Nat.card_pos.ne'
  have hRg0 : Nat.card (LinearMap.range gm) ≠ 0 := Nat.card_pos.ne'
  have hKg0 : Nat.card (LinearMap.ker gm) ≠ 0 := Nat.card_pos.ne'
  have hcop : ¬ l ∣ Nat.card (LinearMap.range gm) := by
    intro hd
    obtain ⟨x, hx⟩ := exists_prime_addOrderOf_dvd_card' l hd
    have hux : u • x = 0 := by
      rcases x with ⟨y, k, rfl⟩
      apply Subtype.ext
      apply Subtype.ext
      change u • ((l : ℤ) ^ s • ((k : K) : W)) = 0
      rw [smul_smul]
      exact hker _ k.2
    have hdv := addOrderOf_dvd_iff_zsmul_eq_zero.2 hux
    rw [hx] at hdv
    exact hlu hdv
  have hvK : (Nat.card K).factorization l = (Nat.card (LinearMap.ker gm)).factorization l := by
    rw [hKc, Nat.factorization_mul hRg0 hKg0, Finsupp.add_apply,
      Nat.factorization_eq_zero_of_not_dvd hcop, zero_add]
  have hA : Nat.card (LinearMap.ker gm) ≤ Nat.card {w : W // (l : ℤ) ^ s • w = 0} :=
    Nat.card_le_card_of_injective
      (fun a => ⟨((a : K) : W), congrArg Subtype.val (LinearMap.mem_ker.1 a.2)⟩)
      (fun a b hab => by
        have h := congrArg Subtype.val hab
        apply Subtype.ext
        apply Subtype.ext
        exact h)
  have hKl : l ^ (Nat.card (LinearMap.ker gm)).factorization l ≤ Nat.card (LinearMap.ker gm) :=
    Nat.ordProj_le l hKg0
  rw [hWc, Nat.factorization_mul hR0 hK0, Finsupp.add_apply, pow_add, hvK]
  exact Nat.mul_le_mul_left _ (hKl.trans hA)

theorem pCount_twSel {Y I Z : Type} [AddCommGroup Y] [AddCommGroup I] [AddCommGroup Z]
    (D : Dat Y I) [Finite D.W] (f : D.W →ₗ[ℤ] Z) (l s : ℕ) (u : ℤ)
    (hl : l.Prime) (hu : ¬ (l : ℤ) ∣ u)
    (hk : ∀ w, f w = 0 → (u * (l : ℤ) ^ s) • w = 0) :
    l ^ (Nat.card D.W).factorization l ≤
      l ^ (Nat.card (LinearMap.range f)).factorization l * Nat.card (TwSel D (l ^ s)) := by
  have hc := pCount_cut D.W Z f l s u hl hu hk
  rw [(twSel_card D (l ^ s) (pow_pos hl.pos _)).2]
  simpa only [Nat.cast_pow] using hc

example {Y I Z : Type} [AddCommGroup Y] [AddCommGroup I] [AddCommGroup Z]
    (D : Dat Y I) [Finite D.W] (f : D.W →ₗ[ℤ] Z) (l s : ℕ) (u : ℤ)
    (hl : l.Prime) (hu : ¬ (l : ℤ) ∣ u)
    (hk : ∀ w, f w = 0 → (u * (l : ℤ) ^ s) • w = 0) :
    l ^ (Nat.card D.W).factorization l ≤
      l ^ (Nat.card (LinearMap.range f)).factorization l * Nat.card (TwSel D (l ^ s)) := by
  first
  | (rh_reduce 3 using [pCount_twSel]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact pCount_twSel D f l s u hl hu hk

end RHCharacter45
rh_scan UpperTheory.V.ZK.Ct.selInj limit 2000
rh_scan UpperTheory.V.ZK.Ct.pCount limit 2000
rh_scan UpperTheory.V.ZK.sCount limit 2000
rh_scan RHCharacter45.twSel_card limit 2000
rh_scan RHCharacter45.pCount_twSel limit 2000
rh_prune RHCharacter45.pCount_twSel as RHCharacter45.PCountTwSelPruned
#print axioms UpperTheory.V.ZK.Ct.selInj
#print axioms UpperTheory.V.ZK.Ct.pCount
#print axioms RHCharacter45.twSel_card
#print axioms RHCharacter45.pCount_cut
#print axioms RHCharacter45.pCount_twSel
