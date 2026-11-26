import RHCharacterUniform46
import RHStructureCofinal42
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN47, 26 Nov 2026, lane 6. HUMAN SOURCE-MATCHED CONDITIONAL REDUCTION /
PREPARED, NOT COMPILED. RH OPEN.

One result: combine the actual scaled SUpper/SFew count with the exact
unit correction, capped W torsion and cofinal canonical Sha consumer.
This removes the all-level filtration requirement introduced in RUN46
at this particular consumer. Only ONE fixed torsion level on arbitrarily
late compatible canonical layers is needed; no claim of proving it.

Latest mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 (mandatory
engine), AGENTS 8db0201d, SWARM 4b77b161, HANDOFF bbc46df7,
EXPANSION c8152d07 and state/log/protocol/continuity openings read.
Latest 15 peer commit summaries through de7fd645 consulted. Full
relevant peer patches read: prime RUN49 03d8a69f, audit RUN47
d3079b63, integration 58dbb472, structure 24d47ed6,7f95819c,
ad6e9dab,0748936f, literature ec9819bb. Prior own ff996d30 retained.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1 /
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. Latest upstream
observed 90b857677a044ffb6742467c33841874a93b254d, not adopted.

Fix SAME L,l,c,E,b,h,P with E>=1, v=v_l(E), r=b+v,
t=c+v_l(E+1), d=2E, R=r2(L). P can be the original two
homology torsion orders, or their l-primary product after the
independent primary/scaled adapters are verified. Use prime RUN49
b=2E(1+c)+2*v_l(E!) when its PeExact49 supplier is established.
Choose arbitrarily late canonical layer nu>=max(r,d,c).
Require on the identical gamma,zeta,Lay and compatible lift g:

  Few(gamma,a,l^b,l^nu, l^((nu-d)*R)*P)
  |W[l^r]| <= M=l^(r*h-(r-t)_+).

The second bound is the r-specific instance of prime RUN48's
twisted Kummer/Herbrand bound; no assumption about other r or
small nu is required. Both inputs remain explicit. We do not
choose independent cofinal sets for them. By RUN46 sCountCapped46
the min(r,nu+v) cap is exactly r on these layers. Consequently
  |EqHom| * l^((nu+v)*R) <= l^((nu-d)*R)*P*M*l^(c+v).
Cancel the exact positive common factor before norms:
  |EqHom| * l^((d+v)*R) <= P*M*l^(c+v).
This yields a fixed integer B=floor(P*M*l^(c+v)/l^((d+v)*R)).
Use RUN42 shaCofinal42 (actual native Good thresholds and ClInj)
on these same cofinal layers:
  l^shaInv * l^((2E+v)*R) <= P*l^(r*h-(r-t)_+ +c+v).
The displayed shaInv is finite by the cofinal consumer. In logs:
  shaInv*log l <= log P +
       [r*h-(r-t)_+ +c+v-(2E+v)*R]*log l.
P is positive if the premises hold (since l^shaInv>=1).
For P=l^(a1+a2) this is an integral signed bound.

Comparison: native SFew b and RUN49 b both satisfy b>=t.
Relative to RUN47 audit's all-layer maximum, at the SAME P,b,h
the new signed exponent saves 2E*R+v-min(c,v), strictly positive.
The extra norm saving min(c,v) must not be counted a second
time: at late nu>=r+c the audit's norm factor becomes trivial.
The inequality is not valid by the same algebra at nu<2E.
No new estimate of P or h is claimed. Native STors is not an
unidentified black box: ExponentLe.sTors uses torsAll (C=24),
which uses KT.tors_le, orbnum and exponent_le, with transitive
audit still open; its existing very coarse estimate is not a
proof of the smaller same-host joint discrepancy. Keep its
original supplier, as well as SLayer transfer, BOdd, SFew
separation, twisted local conditions, SFinal and geometry.
No proof of weighted prime inequality or RH.

Pinned sources relative to ClassCounting:
LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10
LemmaKOfLitN.lean 2b1e21f70e69ace53b5219e9e0807b6de0d1920e
SelmerOrderCounts.lean d0b527a9966ce2c6e6a9bfaa7be6620abf548752
SUpperOf.lean 8cccf88aa58f6e2bd69f080e46f4f10b4248d559
NumThree.lean 900c8e3fca10cdf9256061213dcc9453bf98f3d2
ExponentLe.lean 2b3e4233ad68b7007573c70feaf4703d85452b47
RingEquivalences/OrderOfOneAddPrimePowZmodPrimePow.lean
1461d8636ef74a1ad316dd7a1b81102065d7ac69.
Original selected graph: lemmaK -> lemmaK_of_steps -> sNum ->
SCount/SFew/SSha/SLayer/STors; SUpper -> rankCount,bock,fibCount,
torsStab; SSha -> LayEx,ClInj,Good. Candidate local graph:
shaLate47 -> shaCofinal42 -> jointLate47 -> sCountCapped46 +
cancel_late47 + fixed-r budget and scaled Few. Retain original
fallback and all type/value/constructor edges, axiom and pending
evidence. No global dependency removal or caller integration
claimed. Cache pin/toolchain,L,l,c,E,b,h,P,R,nu,zeta,gamma,g,Lay,
actual scaled family and D, caller. Backtrack to native SCount/
SSha or RUN46 if overlays fail. No URT comparison; exact algebra.

Executed V8 exact integer controls: 179928 late-layer cap/power
cases, 59976 strict signed savings, 529009 total assertions,
1 early-layer negative control. Reproduce:
let checks=0,cases=0,strict=0,negative=0;
function ck(x){checks++;if(!x)throw Error("assert "+checks)}
for(let E=1;E<=12;E++)for(let c=1;c<=5;c++)for(let v=0;v<=5;v++)
for(let t=c;t<=c+5;t++)for(let h=1;h<=7;h++)for(let R=2*E+2;R<=2*E+5;R++){
 const b=2*E*(1+c),s=b+v,k=2*E;
 if(t>b)continue;
 const old=s*h-(b-t)-Math.min(c,v)+c+v-R*v;
 const now=s*h-(s-t)+c+v-R*(k+v);
 ck(old-now===k*R+v-Math.min(c,v));ck(now<old);strict++;
 for(const nu of [Math.max(s,k),Math.max(s,k)+c,Math.max(s,k)+c+10]){
  ck(Math.min(s,nu+v)===s);ck((nu+v)*R===(nu-k)*R+(k+v)*R);cases++;
 }}
for(const l of [2n,3n,5n])for(let k=1;k<=5;k++)for(let v=0;v<=3;v++)
for(let R=1;R<=4;R++)for(let nu=k;nu<=k+4;nu++){
 const A=l**BigInt((nu-k)*R),D=l**BigInt((k+v)*R),T=l**BigInt((nu+v)*R);
 ck(A*D===T);
 for(const C of [0n,1n,3n,11n])for(const B of [0n,1n,D-1n,D,3n*D+1n]){
  ck((C*T<=A*B)===(C*D<=B));ck((C*D<=B)===(C<=B/D));
 }}
const l=2n,k=4,nu=1,v=0,R=1;
ck(l**BigInt(nu+v)!==l**BigInt(Math.max(0,nu-k)+k+v));negative++;
console.log({checks,cases,strict,negative});
These are scalar regression checks, not number-field tests or Lean
proofs. Local lean/lake/elan unavailable (command -v produced no
paths). Historical Actions job lists 45577239749,45576756833
retrieved this run: pick/run/record success, BASELINE ONLY.
No new compiler output, new axiom result or PASS.
Stage existing RUN46_UNIFORM_TWISTED_LAYER_CAP.lean as
RHCharacterUniform46 (and its RHPrimeWindow48 dependency);
structure/2026-11-26_RUN42_COFINAL_CANONICAL_SHA.lean as
RHStructureCofinal42. Preserve original files; record staged hashes.
RESUME HERE: native replay the jointLate47 -> shaLate47 adapter
with these staged imports, then supply actual JointLate47 using
scaled primary SUpper, exact PeExact49 and the fixed-r twisted
Kummer identification on the SAME canonical late layers. Do not
further optimize scalar constants; attack these suppliers or
integrate verified local results into NumThree/signed windows.
HANDOFF TO prime, structure, literature, audit, kernel, integration.
-/

noncomputable section
open NumberField NumberField.InfinitePlace IsDedekindDomain
open Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.GaloisCohomology
open UpperTheory.V UpperTheory.V.Base UpperTheory.V.LDataCardLeFinrank UpperTheory.V.ZK

namespace RHCharacter47

theorem cancel_late47 (l ν d v R C P M c : ℕ) (hl : 0 < l)
    (hd : d ≤ ν)
    (h : C * (l ^ (ν+v)) ^ R ≤
      ((l ^ (ν-d)) ^ R * P) * M * l ^ (c+v)) :
    C * (l ^ (d+v)) ^ R ≤ P * M * l ^ (c+v) := by
  have he : ν+v = (ν-d)+(d+v) := by omega
  have heq : (l ^ (ν+v)) ^ R = (l ^ (ν-d)) ^ R * (l ^ (d+v)) ^ R := by
    rw [he, pow_add, mul_pow]
  rw [heq] at h
  have hP : 0 < (l ^ (ν-d)) ^ R := pow_pos (pow_pos hl _) _
  apply le_of_mul_le_mul_left _ hP
  calc _ = C * ((l ^ (ν-d)) ^ R * (l ^ (d+v)) ^ R) := by ring
    _ ≤ _ := h
    _ = _ := by ring

def JointLate47 (L : Type) [Field L] [NumberField L]
    (l c E b h t P : ℕ) [Fact l.Prime] : Prop :=
  ∀ N : ℕ, ∃ ν : ℕ, N ≤ ν ∧ b + E.factorization l ≤ ν ∧ 2*E ≤ ν ∧
    ∃ (ζ : (𝓞 (Kum.Fn L (AlgebraicClosure L) l ν))ˣ)
      (γ : Kum.Fn L (AlgebraicClosure L) l ν ≃ₐ[L] Kum.Fn L (AlgebraicClosure L) l ν),
      Lay l c ν ζ γ ∧ ∃ g : G L (AlgebraicClosure L),
      IsLift γ.toRingEquiv g.toRingEquiv ∧
      ((Kum.cycR L (AlgebraicClosure L) l ν g : (ZMod (l ^ ν))ˣ) : ZMod (l ^ ν)) =
        1 + (l : ZMod (l ^ ν)) ^ c ∧
      Few γ ((1+l^c)^E) (l^b) (l^ν)
        ((l^(ν-2*E))^nrComplexPlaces L * P) ∧
      (∀ D : Ct.Dat (Additive (Kum.Fn L (AlgebraicClosure L) l ν)ˣ)
          (HeightOneSpectrum (𝓞 (Kum.Fn L (AlgebraicClosure L) l ν)) →₀ ℤ),
        Ct.IsDat γ ((1+l^c)^E) D →
          Nat.card (Submodule.torsionBy ℤ D.W ((l:ℤ)^(b+E.factorization l))) ≤
            l^((b+E.factorization l)*h-(b+E.factorization l-t)))

theorem jointLate47 (L : Type) [Field L] [NumberField L] (hTC : IsTotallyComplex L)
    (l c E b h t P : ℕ) [Fact l.Prime] (hE : 1 ≤ E)
    (hJoint : JointLate47 L l c E b h t P) :
    PositivityTheory.QuaternionShaBounds.CofinalBound42 L (AlgebraicClosure L) l c E
      (P * l^((b+E.factorization l)*h-(b+E.factorization l-t)) *
        l^(c+E.factorization l) / (l^(2*E+E.factorization l))^nrComplexPlaces L) := by
  intro N
  obtain ⟨ν,hν,hνr,hνd,ζ,γ,hLay,g,hLift,hCyc,hFew,hBudget⟩ := hJoint N
  have hl : l.Prime := Fact.out
  let M := l^((b+E.factorization l)*h-(b+E.factorization l-t))
  have hmin : min (b+E.factorization l) (ν+E.factorization l) = b+E.factorization l :=
    min_eq_left (by omega)
  have hCap := UpperTheory.V.ZK.sCountCapped46 L _ hTC l c ν E b
    ((l^(ν-2*E))^nrComplexPlaces L * P) M ζ γ hLay hE hFew (by
      intro D hD
      rw [hmin]
      exact hBudget D hD)
  have hCancel := cancel_late47 l ν (2*E) (E.factorization l) (nrComplexPlaces L)
    (Nat.card (EqHom γ ((1+l^c)^E) (l^ν))) P M c hl.pos hνd hCap.2
  refine ⟨ν,hν,γ,g,hLift,hCyc,hCap.1,?_⟩
  exact (Nat.le_div_iff_mul_le (pow_pos (pow_pos hl.pos _) _)).2 hCancel

theorem shaLate47 (L : Type) [Field L] [NumberField L] (hTC : IsTotallyComplex L)
    (l c E b h t P : ℕ) [Fact l.Prime] (hTop : TopRoot l c L) (hE : 1 ≤ E)
    (hJoint : JointLate47 L l c E b h t P) :
    ∃ s : ℕ, shaInv L l E = s ∧
      l^s * (l^(2*E+E.factorization l))^nrComplexPlaces L ≤
        P * l^((b+E.factorization l)*h-(b+E.factorization l-t)) * l^(c+E.factorization l) := by
  have hl : l.Prime := Fact.out
  have hCof := jointLate47 L hTC l c E b h t P hE hJoint
  obtain ⟨s,hs,hBound⟩ := PositivityTheory.QuaternionShaBounds.shaCofinal42
    PositivityTheory.QuaternionShaBounds.ClInj_holds L l c E _ hTop hE hCof
  exact ⟨s,hs,(Nat.le_div_iff_mul_le (pow_pos (pow_pos hl.pos _) _)).1 hBound⟩

example (l ν d v R C P M c : ℕ) (hl : 0 < l) (hd : d ≤ ν)
    (h : C * (l ^ (ν+v)) ^ R ≤ ((l ^ (ν-d)) ^ R * P) * M * l ^ (c+v)) :
    C * (l ^ (d+v)) ^ R ≤ P * M * l ^ (c+v) := by
  first
  | (rh_reduce 2 using [cancel_late47]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact cancel_late47 l ν d v R C P M c hl hd h

end RHCharacter47

rh_scan UpperTheory.V.ZK.sCount limit 2000
rh_scan PositivityTheory.QuaternionShaBounds.ShaAsm_holds limit 2000
rh_scan RHCharacter47.jointLate47 limit 2000
rh_scan RHCharacter47.shaLate47 limit 2000
rh_prune RHCharacter47.jointLate47 as RHCharacterJointLatePruned47
rh_prune RHCharacter47.shaLate47 as RHCharacterShaLatePruned47
#print axioms RHCharacter47.cancel_late47
#print axioms RHCharacter47.jointLate47
#print axioms RHCharacter47.shaLate47
