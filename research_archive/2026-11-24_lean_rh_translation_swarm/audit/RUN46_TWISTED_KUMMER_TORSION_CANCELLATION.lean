import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.SelmerOrderCounts
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN46, 26 Nov 2026. AUDIT lane 10. HUMAN SOURCE-MATCHED / PREPARED,
NOT COMPILED. RH OPEN. One result: exact torsion cancellation at the
all-level twisted Selmer interface of peer e87829c2116059bc8c7a9cf0f76df2434ab1c4af.

Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 /
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4 including
mandatory engine, SWARM 4b77b161d6876915c15cea5a4d4a519beaf5de74,
HANDOFF, AGENTS, state, protocol and continuity consulted. Latest peers
59085d33,3bdeddd5,e87829c2,425c27c5,4695f11c, and prior audit
ba04fa11 inspected. No URT advantage assumed; ordinary exact algebra.

Source paths relative to src/Development/AutomorphicArithmetic/
AutomorphicVarieties/ModularityArgument/ClassCounting:
HasVal.lean ee8800532f5867e0bee6b50ba85e6e977328dbab (Lay).
SelmerOrderCounts/TwoLe.lean 16d7d15d6a1f7a7b3d6690d326c772a056811c98
(IsDat, mt, Dat.del, SelInv);
SelmerOrderCounts.lean d0b527a9966ce2c6e6a9bfaa7be6620abf548752
(sCount); SelmerOrderCounts/PCount.lean c6a473b2ce1fc45ba140660a4f6808ae468aa388;
SelmerOrderCounts/SelInvLe.lean 9c5062ff121f83f2062f66e5a3ed349179c1c748;
LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10;
NumThree.lean 900c8e3fca10cdf9256061213dcc9453bf98f3d2.
Peer all-level identity blob 6cd99a3430c6f6bb44eaf7334d94ce1e00e0d21a;
prior norm descent blob 42eb86820852cf2d3f54d36ba4f437bace6493cb.

Use additive notation for F^*. Fix q=l^s>0, a=(1+l^c)^E,
g=gamma^(-1) on F^* (IMPORTANT inverse direction, actual IsDat).
Let V be the subgroup of F^*/(F^*)^q with every valuation zero mod q;
T the image of mu(F) in V; D=g-a on V. V finite by the usual exact
sequence of virtual units: units mod q-powers -> V -> Cl(F)[q].
Indeed divisor alpha=q*d defines the class of d, kernel consists
of units times q-powers, and every q-torsion divisor class has such
a representative. Units finitely generated, class group finite.
T stable under D and finite. The peer's TwSel D q is canonically
ker(D on V/T): d(alpha)=0 mod q is unchanged by torsion and q-powers,
and the twist condition is D alpha in T. Preserve the peer's separate
human proof W[q] = TwSel (not yet kernel checked).

EXACT CANCELLATION, no norm estimate:
  U=D^(-1)(T) in V, K=ker(D:V->V), J=D(V) intersect T.
  |U|=|K| |J| (first isomorphism), S_q=U/T, so
  |S_q| |T| = |K| |J| <= |K| |T|.
Hence |W[q]|=|S_q| <= |K|, conditional on the peer's exact identification.
No cost for the torsion labels at all in this *cardinality bound*.
This does NOT say every class in S_q has a lift in K. Exact snake
sequence: 0 -> ker(D|T) -> K -> S_q -> T/D(T). The index of the
liftable subgroup of S_q is |J/D(T)|, not automatically one.
Control V=Z/4, T={0,2}, D=2: S_q has two classes, K has two
elements but maps to zero in S_q. Do not claim representative descent.

Actual consumer sCount -> pCount at s=b+v_l(E). Peer pCount_cut uses
|W[l^s]|; substituting the new inequality gives
  l^v_l(|W|) <= l^v_l(|range f|) |ker(g-a on V)|.
The remaining same-host uniform estimate is on this ordinary twisted
Kummer eigenspace K, with ALL valuations mod q, and cannot be replaced
by an untwisted base-field Selmer group without additional proof.
No claim this is quantitatively sharper than the original rank bound
until K is bounded. Original selected graph remains:
lemmaK -> lemmaK_of_steps -> sNum -> sCount -> pCount/selInj/selInvLe.
Candidate edge: pCount_twSel -> twSel_card -> torsion cancellation ->
twisted full Kummer kernel. Preserve all original type/value/constructor
edges and fallback, SFew, SSha, SLayer, STors, ShaK, VWin and prime-window
obligations. Cache source/toolchain/L/F/l/c/nu/E/b/a/g/q and caller.

AUDIT GUARD on attempted extension of RUN45 descent:
native SFew b=2E+(2E+1)(c+2E+1)>c. LTE gives v_l(a-1)=c+v_l(E),
so actual s=b+v_l(E)>v_l(a-1). Thus q does NOT divide a-1; an ordinary
invariant descent at that level is not justified. On cofinal layers
nu>=s and nu>c, the l-primary torsion is exactly mu_(l^nu):
any higher primitive root would induce an exponent u' congruent
to u=1+l^c mod l^nu, and its automorphism order modulo l^(nu+1)
would be l^(nu+1-c), contradicting Lay.ord. Here LTE uses c_two.
Prime-to-l torsion is a qth power. On T=mu(F)/mu(F)^q=Z/q,
g acts by u^(-1), so the exact residual torsion label quotient is
  |T/D(T)|=gcd(q,1-u^(E+1))=l^min(s,c+v_l(E+1)).
The E+1 is NOT E-1. Direct check: adding k*u*z to alpha changes
the torsion label by (1-a*u)*k because g(u*z)=z. For the actual
b, s>c+v_l(E+1) (v_l(E+1)<=E); the quotient is strictly smaller than q
but need not vanish. Cancellation in the cardinal inequality above
is stronger than separately bounding this label count.

Executed V8 finite-group controls (not number field experiments):
19762 cyclic, 672 diagonal swap configurations, 81736 assertions,
5244 strict cardinal improvements and 1770 failures of lift
surjectivity. Reproduction:
function gcd(a,b){return b?gcd(b,a%b):Math.abs(a)}
let checks=0,cyclic=0,diagonal=0,strict=0,nonsurj=0;
function ck(x){checks++;if(!x)throw Error("check "+checks)}
for(let n=1;n<=100;n++)for(let t=1;t<=n;t++)if(n%t===0)
for(let d=-20;d<=20;d++){
 let step=n/t,K=0,U=0,I=new Set(),lift=new Set();
 for(let x=0;x<n;x++){let y=((d*x%n)+n)%n;if(y===0){K++;lift.add(x%step)}
 if(y%step===0){U++;I.add(y)}}
 let S=U/t;ck(U===K*I.size);ck(S===gcd(d,step));ck(S<=K);
 ck(S*t===K*I.size);strict+=S<K;nonsurj+=lift.size<S;cyclic++}
for(let n=1;n<=32;n++)for(let a=0;a<=20;a++){
 let K=0,U=0,I=new Set(),lift=new Set();
 for(let x=0;x<n;x++)for(let y=0;y<n;y++){
 let r=((y-a*x)%n+n)%n,s=((x-a*y)%n+n)%n;
 if(r===0&&s===0){K++;lift.add((x-y+n)%n)}
 if(r===s){U++;I.add(r)}}
 let S=U/n;ck(U===K*I.size);ck(S===gcd(a+1,n));ck(S<=K);
 ck(S*n===K*I.size);strict+=S<K;nonsurj+=lift.size<S;diagonal++}
console.log({checks,cyclic,diagonal,strict,nonsurj});

Separate exact modular controls: 1500 configurations, 83288
assertions, 77080 label normalization cases, 310 wrong-orientation
mismatches, 264 higher-root exclusions. Reproduction:
function gcd(a,b){return b===0n?(a<0n?-a:a):gcd(b,a%b)}
function val(a,l){let j=0;while(a%l===0n){a/=l;j++}return j}
function pow(a,n,m){let y=1n;while(n){if(n&1n)y=y*a%m;a=a*a%m;n>>=1n}return y}
function mod(a,m){return (a%m+m)%m}
let cases=0,checks=0,normalized=0,wrong=0,caller=0,genuine=0,guard=0;
function ck(x){checks++;if(!x)throw Error("assertion "+checks)}
for(const l of [2n,3n,5n,7n])for(let c=l===2n?2:1;c<=4;c++)
for(let s=1;s<=5;s++)for(let E=1;E<=20;E++){
 const u=1n+l**BigInt(c),q=l**BigInt(s),a=pow(u,BigInt(E),q);
 const d=mod(1n-a*u,q),g=gcd(d,q);
 ck(g===l**BigInt(Math.min(s,c+val(BigInt(E+1),l))));
 if(g!==gcd(mod(u-a,q),q))wrong++;
 if(g<q)genuine++;
 if(q<=343n){let image=new Set();
 for(let k=0n;k<q;k++)image.add(mod(d*k,q).toString());
 ck(BigInt(image.size)===q/g);
 for(let r=0n;r<q;r++){ck(image.has(mod(r%g-r,q).toString()));normalized++}}
 const b=2*E+(2*E+1)*(c+2*E+1);
 ck(b>c);ck(b+val(BigInt(E),l)>c+val(BigInt(E+1),l));caller++;cases++}
for(const l of [2n,3n,5n,7n])for(let c=l===2n?2:1;c<=4;c++)
for(let nu=c+1;nu<=c+4;nu++){
 const m=l**BigInt(nu+1),n=l**BigInt(nu-c),u=1n+l**BigInt(c);
 for(let j=0n;j<l;j++){const up=u+j*l**BigInt(nu);
 ck(pow(up,n,m)!==1n);ck(pow(up,n*l,m)===1n);guard++}}
console.log({cases,checks,normalized,wrong,caller,genuine,guard});

Local command -v lean/lake/elan returned no executable; git ls-remote
failed DNS resolution. Actual historical status JSON read:
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717,
runs 45577239749 and 45576756833, returncode 0, baseline ONLY.
New Lean certificate below is uncompiled/unqueued, no new axiom
evidence or actual caller replacement. Do not report native PASS.
RESUME HERE: kernel-check torsion_cancel below and identify the
actual full twisted Kummer kernel with a same-host class/local
cohomology group; prove the needed uniform bound on its length,
not an untwisted invariant bound. Combine only with checked peer
twSel_card and pCount_cut. Retain original fallback.
HANDOFF TO character boxes, structure, arithmetic, kernel, integration.
Verdict AGREE with peer all-level twist, DISAGREE with extending
prime-level ordinary descent without guard; PARTIAL, RH OPEN.
-/

namespace RHAudit46

/-- Exact cancellation of the finite torsion subgroup in a cardinal bound. -/
theorem torsion_cancel {A : Type} [AddCommGroup A] [Finite A]
    (T : Submodule ℤ A) (D : A →ₗ[ℤ] A)
    (hT : T ≤ T.comap D) :
    Nat.card ((T.comap D) ⧸ T.submoduleOf (T.comap D)) ≤
      Nat.card (LinearMap.ker D) := by
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
  have hR : Nat.card (LinearMap.range f) ≤ Nat.card T :=
    Nat.card_le_card_of_injective Subtype.val Subtype.val_injective
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
  rw [← hU, hQ, mul_comm (Nat.card T)] at h
  exact le_of_mul_le_mul_right h (Nat.card_pos (α := T))

example {A : Type} [AddCommGroup A] [Finite A]
    (T : Submodule ℤ A) (D : A →ₗ[ℤ] A)
    (hT : T ≤ T.comap D) :
    Nat.card ((T.comap D) ⧸ T.submoduleOf (T.comap D)) ≤
      Nat.card (LinearMap.ker D) := by
  first
  | (rh_reduce 3 using [torsion_cancel]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact torsion_cancel T D hT

end RHAudit46
rh_scan UpperTheory.V.ZK.Ct.pCount limit 2000
rh_scan UpperTheory.V.ZK.sCount limit 2000
rh_scan RHAudit46.torsion_cancel limit 2000
rh_prune RHAudit46.torsion_cancel as RHAudit46.TorsionCancelPruned
#print axioms UpperTheory.V.ZK.Ct.pCount
#print axioms UpperTheory.V.ZK.sCount
#print axioms RHAudit46.torsion_cancel
