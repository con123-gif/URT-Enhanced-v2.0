import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.SelmerOrderCounts
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN48, 26 November 2026. Prime-window lane 3. HUMAN SOURCE-MATCHED
cyclic descent of the actual all-level twisted Kummer budget, with
exact Herbrand cancellation. Native pCount and sCount consumer
replacements PREPARED / NOT COMPILED. RH OPEN.

Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 incl mandatory engine;
AGENTS, SWARM, HANDOFF, EXPANSION, state/log/protocol/continuity heads
consulted. Latest peers e87829c2 (all-level TwSel), e3f9d949 (torsion
cancellation), 65d0f958 (flag), 59085d33 (dyadic drawdown) read; recent
commit index through 5d4f6c50. RUN47 b4fb2856d8fade02c841e1ef4aaadbd819585fa6
retained. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005;
upstream observed 2db90859500407542617a5b86281b4f1e1ee69cb, not adopted.
Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

Actual setting: HasVal.lean Lay(l,c,nu,zeta,gamma), g=gamma^-1,
u=1+l^c, a=u^E, n=l^(nu-c), E>=1. S_L denotes primes over l.
Let h=dim_F_l H^1(G_{L,S_L}, F_l)=log_l |SelL(l,L)|. This uses
L contains mu_l (gamma fixes zeta^(l^(nu-1))). All fields at sCount
are totally complex, so no omitted real-place condition. By RUN47,
h=r+g_S+1+a_C-d_C, where g_S counts primes over l, and a_C-d_C
is the l-rank of the localized class group. No claim of uniform
class-rank improvement beyond this exact identity.

For s>=0 set j=min(s,nu), t0=c+v_l(E+1), t=min(j,t0).
NEW ALL-LAYER BOUND:
             |W[l^s]| <= l^(s*h - j + t).
In particular for every nu>=s the exponent is s*h-s+min(s,t0).
No additional l^2 label factor or extension degree appears.
The same fixed L,l,E,b is used across every auxiliary F,nu,zeta,gamma.

Proof:
1. The order of u modulo l^nu is n by LTE, including the l=2,c>=2
guard. Thus gamma acts faithfully on zeta, and F=L(zeta) by Galois
correspondence. F/L is unramified outside l (cyclotomic extension).
For 1<=j<=nu put q=l^j. Let V be the full virtual unit group
{alpha in F*/F*^q : ord_P alpha=0 mod q for all P}. It is contained
in H^1(G_{F,S_F},mu_q) by Kummer theory: at residue characteristic
not l, a q-divisible valuation permits removal of a uniformizer power,
and a qth root of the remaining unit is obtained in an unramified
extension by Hensel's lemma over the strict henselization.

2. Native Dat: after quotienting Y by its torsion T, delta=g-a and
delta_I=g_I-a are injective because g^n=g_I^n=1, a>=2, and the
quotient and I are torsion-free. For W=U/delta(Y/T), the class
of w with q*w=0 corresponds to y mod q(Y/T) with delta y=q*u_w
and d y divisible by q; inverse maps y to delta y/q. Applying d and
injectivity of delta_I checks both divisibility and membership in U.
Thus W[q] is the kernel of g-a on V/T_q, where T_q is the image
of roots of unity. As in the peer audit, for D=g-a on V,
|ker(D on V/T_q)|=|ker D|*|D(V) intersect T_q|/|T_q|<=|ker D|.
All groups are finite by the unit/class exact sequence.
This restates the peer identification only as an explicitly used lemma.

3. Twist coefficients by the character g -> a^-1 mod q.
This is well defined since a^n=1 mod q. The resulting G_{L,S_L}
module M_j is Z/l^j(E+1), i.e. cyclotomic character to power E+1,
NOT E-1: g acts on mu_q by u^-1 and the extra factor is u^-E.
It is trivial on G_{F,S_F}. Equivariance of the Kummer map gives
ker(g-a on V) injects into H^1(G_{F,S_F}, M_j)^Gal(F/L).
All local conditions have been weakened only by allowing l-primes.

4. Exact inflation-restriction sequence for G=Gal(F/L):
0 -> H^1(G,M_j) -> H^1(G_{L,S_L},M_j)
 -> H^1(G_{F,S_F},M_j)^G -> H^2(G,M_j) -> H^2(G_{L,S_L},M_j).
For cyclic G, put A=g-1, N=sum g^i. Then AN=NA=0 and
|H^1(G,M_j)|=|ker N|/|im A|=|ker N|*|ker A|/|M_j|
=|ker A|/|im N|=|H^2(G,M_j)|.
Consequently the extension penalty cancels EXACTLY:
  |H^1(G_{F,S_F},M_j)^G| <= |H^1(G_{L,S_L},M_j)|.
No surjectivity of restriction asserted; cancellation is of cardinality,
not of individual classes. This works even for G=1.
Standard references: Gille-Szamuely, Central Simple Algebras and Galois
Cohomology (2006), pp. 67-68 (inflation-restriction); cyclic cohomology
via the periodic resolution (kernel/image formulas proved above).

5. Quantitative base-field bound: for k=1..j the exact sequence
0 -> M_(k-1) -> M_k -> F_l -> 0 has H^0(M_k) of order
l^min(k,t0), by the generator action u^-(E+1) and LTE.
The image of the connecting H^0(F_l)->H^1(M_(k-1)) has size
l^(1+min(k-1,t0)-min(k,t0)).
Thus the long exact sequence gives
  |H^1(L,S,M_k)| <= |H^1(L,S,M_(k-1))| * l^h
                     / l^(1+min(k-1,t0)-min(k,t0)).
All quantities finite by induction from the ordinary Kummer H^1,
and all denominators are exact finite group indices.
Multiply the bounds: |H^1(L,S,M_j)|<=l^(j*h-j+t).
For j=0 the bound is 1. This is a filtration estimate, not an
assumption of semisimplicity or a prime-to-l averaging argument.

6. For s>j, each additional multiplication-by-l step on W[l^k]
has kernel at most |W[l]|<=l^h by steps 1-5 with j=1 (nu>=1).
Hence |W[l^s]|<=|W[l^j]|*l^((s-j)*h).
This proves the ALL-layer inequality, including small nu, without
weakening the native SSha all-layer quantifier. Since h>=1 by
mu_l in L and the S-unit rank, the exponent is nonnegative.
At the native SFew b=2E+(2E+1)(c+2E+1) and s=b+v_l(E),
s>t0, so strict additional saving on the cofinal nu>=s layers.
For a uniform bound over ALL nu, use M=l^(s*h); a cofinal-only
improved exponent must not replace SSha until its cofinal bridge
is verified. No assumption that a=1 mod l^s.

Actual consumer: native sCount uses Ct.pCount after Ct.kerF,
with s=b+v_l(E). The two copied and shortened native theorems below
accept any bound M on W[l^s] directly rather than infer it from
rank power. Substituting the human result above gives
  |EqHom|*(l^nu)^R <= B*l^(s*h)*l^(c+v_l(E))
uniformly, and on nu>=s improve exponent by s-min(s,t0).
The native exact negative unit valuation from peer e897aeb5 is
not imported or claimed here; it is independently composable.
The result reduces class-field growth to base-field cohomology
and removes the original separate SelInvLe label and repeated
rank proof at this caller, conditional on native bridge replay.
The uniform quantitative STors/SFew, ShaK and VWin/prime shell
still need their retained suppliers. No RH closure.

Original selected graph: lemmaK -> sNum -> sCount -> pCount ->
card_tors, selInj, selInvLe, selLCard; kerF, fewLe, cardEQ, cardW,
eqHomLe and all other suppliers retained. Candidate:
sCountBudget48 -> pCountBudget48 -> explicit W[l^s] bound ->
peer all-level identity, torsion cancellation, cyclic inflation-
restriction, exact H^1/H^2 quotient, base Kummer filtration.
Preserve original/reduced graphs as separate candidates, all
unexpanded obligations, constructor/type/value roles, old axioms
and original fallback. No native global pruning. Cache key:
source/toolchain,L,F,l,c,nu,E,b,g,a,q,S and exact actual caller.
No URT comparison or speed claim.

Pinned native blobs relative to ClassCounting:
HasVal.lean ee8800532f5867e0bee6b50ba85e6e977328dbab;
SelmerOrderCounts/TwoLe.lean 16d7d15d6a1f7a7b3d6690d326c772a056811c98;
SelmerOrderCounts/PCount.lean c6a473b2ce1fc45ba140660a4f6808ae468aa388;
SelmerOrderCounts.lean d0b527a9966ce2c6e6a9bfaa7be6620abf548752;
SelmerOrderCounts/SelInvLe.lean 9c5062ff121f83f2062f66e5a3ed349179c1c748;
LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10;
NumThree.lean 900c8e3fca10cdf9256061213dcc9453bf98f3d2.

Executed exact finite cyclic checks (V8, not number-field experiments):
1656 cyclic action cases, 4968 split-product cohomology cases,
19872 assertions, 2835 strict filtration savings vs coarse bound,
268 wrong E-1 orientation mismatches. Reproduction:
const gcd=(a,b)=>b?gcd(b,a%b):Math.abs(a);
let cyc=0,prod=0,checks=0,strict=0,orient=0;
function ck(x){checks++;if(!x)throw Error("check "+checks)}
function pow(a,n,m){let z=1;while(n){if(n%2)z=z*a%m;a=a*a%m;n=Math.floor(n/2)}return z}
function val(a,l){let v=0;while(a%l===0){v++;a/=l}return v}
for(const l of [2,3,5,7])for(let c=l===2?2:1;c<=3;c++)
for(let nu=c;nu<=5;nu++)for(let E=1;E<=12;E++)
for(let j=1;j<=Math.min(nu,4);j++){
 const q=l**j,n=l**(nu-c),u=(1+l**c)%q,inv=pow(u,n-1,q),d=pow(inv,E+1,q);
 ck(pow(u,n,q)===1);ck(pow(d,n,q)===1);
 const t=Math.min(j,c+val(E+1,l));ck(gcd(d-1,q)===l**t);
 let N=0,z=1;for(let i=0;i<n;i++){N=(N+z)%q;z=z*d%q}
 ck(N*(d-1)%q===0);let kN=gcd(N,q),kD=gcd(d-1,q);
 ck(kN*kD%q===0);const h1=kN/(q/kD),h2=kD/(q/kN);ck(h1===h2);cyc++;
 if(gcd(pow(inv,E-1,q)-1,q)!==kD)orient++;
 for(let m=1;m<=3;m++){
  const kY=gcd(kD,l**m),hBase=h1*kY,hPrime=(n===1?1:l)*l;
  const bound=hPrime**j/l**(j-t);ck(hBase<=bound);ck(kY<=hBase);
  if(hBase<bound)strict++;prod++;
 }}
console.log({cyc,prod,checks,strict,orient});
End reproduction.

Executed 26 source pin/unique needle/reversible edit and no proof-hole
checks. Actual baseline Actions jobs 45577239749 and 45576756833
all pick/run/record success, BASELINE ONLY. Native no new execution;
no new axiom or graph evidence. Scalar Herbrand cancellation and
actual caller bridge below are PREPARED not compiled; human descent
still needs native formalization.

RESUME HERE: audit the cohomology coefficient orientation and exact
inflation-restriction/local Kummer identification; native replay
pCountBudget48 and sCountBudget48, then formalize the human supplier
using cyclic cohomology/finite Galois H^1. Retain actual all-layer
quantifier and original fallback. Prioritize STors and SFew if this
rank budget is authenticated, rather than further equivalent shells.
HANDOFF TO Galois, arithmetic, literature, audit, kernel, integration.
-/

open NumberField IsDedekindDomain UpperTheory.V UpperTheory.V.ZK UpperTheory.V.ZK.Ct

theorem UpperTheory.V.ZK.Ct.pCountBudget48 :
    ∀ (W Z : Type) [AddCommGroup W] [AddCommGroup Z] [Finite W] (f : W →ₗ[ℤ] Z) (l s M : ℕ) (u : ℤ), l.Prime → ¬(l : ℤ) ∣ u → (∀ w, f w = 0 → (u * (l : ℤ) ^ s) • w = 0) → Nat.card (Submodule.torsionBy ℤ W ((l : ℤ) ^ s)) ≤ M → l ^ (Nat.card W).factorization l ≤ Nat.card (LinearMap.range f) * M := by
  intro W Z _ _ _ f l s M u hl hlu hker hW
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
  have hA : Nat.card (LinearMap.ker gm) ≤ M := by
    calc Nat.card (LinearMap.ker gm) ≤ Nat.card (Submodule.torsionBy ℤ W ((l : ℤ) ^ s)) :=
          Nat.card_le_card_of_injective
            (fun a => ⟨((a : K) : W), by
              rw [Submodule.mem_torsionBy_iff]
              exact congrArg Subtype.val (LinearMap.mem_ker.1 a.2)⟩)
            (fun a b hab => by
              have h := congrArg Subtype.val hab
              apply Subtype.ext
              apply Subtype.ext
              exact h)
      _ ≤ M := hW
  have hR : l ^ (Nat.card (LinearMap.range f)).factorization l ≤ Nat.card (LinearMap.range f) :=
    Nat.ordProj_le l hR0
  have hKl : l ^ (Nat.card (LinearMap.ker gm)).factorization l ≤ Nat.card (LinearMap.ker gm) :=
    Nat.ordProj_le l hKg0
  rw [hWc, Nat.factorization_mul hR0 hK0, Finsupp.add_apply, pow_add, hvK]
  exact Nat.mul_le_mul hR (hKl.trans hA)

theorem UpperTheory.V.ZK.sCountBudget48
    (L F : Type) [Field L] [NumberField L] [Field F] [NumberField F] [Algebra L F]
    (hTC : IsTotallyComplex L) (l c ν E b B M : ℕ) [Fact l.Prime]
    (ζ : (𝓞 F)ˣ) (γ : F ≃ₐ[L] F) (hL : Lay l c ν ζ γ) (hE : 1 ≤ E)
    (hF : Few γ ((1 + l ^ c) ^ E) (l ^ b) (l ^ ν) B)
    (hBudget : ∀ D : Ct.Dat (Additive Fˣ) (HeightOneSpectrum (𝓞 F) →₀ ℤ),
      Ct.IsDat γ ((1 + l ^ c) ^ E) D →
      Nat.card (Submodule.torsionBy ℤ D.W ((l : ℤ) ^ (b + E.factorization l))) ≤ M) :
    Finite (EqHom γ ((1 + l ^ c) ^ E) (l ^ ν)) ∧
      Nat.card (EqHom γ ((1 + l ^ c) ^ E) (l ^ ν)) * (l ^ ν) ^ nrComplexPlaces L ≤
      B * M * l ^ (c + E.factorization l) := by
  have hl : l.Prime := Fact.out
  obtain ⟨ha2, hfa, hfN⟩ := Ct.lte l c ν E hl hL.c_pos hL.c_two hL.c_le hE
  generalize (1 + l ^ c) ^ E = a at *
  obtain ⟨D, hD⟩ := Ct.datEx L F γ a ha2
  have hDa := hD.a_eq
  have hDn := hD.n_eq
  have hI := Ct.clFin L F γ a D hD
  obtain ⟨hEQf, hEQc⟩ := Ct.cardEQ L F γ a D hTC hL.gal hL.gen hD
  obtain ⟨hClf, hWf, hWc⟩ := Ct.cardW _ _ D hI hEQf
  obtain ⟨hEHf, hEHc⟩ := Ct.eqHomLe L F γ a l ν D hl hD hClf
  refine ⟨hEHf, ?_⟩
  have hlpow : l ^ (ν - c) ≠ 0 := (pow_pos hl.pos _).ne'
  have hbig : 2 ≤ a ^ l ^ (ν - c) := le_trans ha2 (Nat.le_self_pow hlpow a)
  have hN0 : a ^ l ^ (ν - c) - 1 ≠ 0 := by omega
  obtain ⟨m, hm⟩ : ∃ m, m = ordCompl[l] (a ^ l ^ (ν - c) - 1) := ⟨_, rfl⟩
  have hNm : a ^ l ^ (ν - c) - 1 = l ^ (ν + E.factorization l) * m := by
    have h0 := Nat.ordProj_mul_ordCompl_eq_self (a ^ l ^ (ν - c) - 1) l
    rw [← hm, hfN] at h0
    exact h0.symm
  have hmd : ¬ l ∣ m := by
    rw [hm]
    exact Nat.not_dvd_ordCompl hl hN0
  have hker : ((D.a : ℤ)) ^ D.n - 1 = ((l ^ ν : ℕ) : ℤ) * ((l ^ E.factorization l * m : ℕ) : ℤ) := by
    rw [hDa, hDn, hL.ord]
    have h1 : 1 ≤ a ^ l ^ (ν - c) := by omega
    have key : ((a ^ l ^ (ν - c) - 1 : ℕ) : ℤ) = (a : ℤ) ^ l ^ (ν - c) - 1 := by
      rw [Nat.cast_sub h1]
      push_cast
      ring
    rw [← key, hNm]
    push_cast
    ring
  obtain ⟨f, hfnm, hfk⟩ := Ct.kerF _ _ D (l ^ ν) (l ^ b) _ hker
  haveI := hWf
  haveI := hEQf
  haveI := hClf
  have hrange := Ct.fewLe L F γ a (l ^ b) (l ^ ν) B D hD hF f hfnm hWf
  have hg := hBudget D hD
  have hp := Ct.pCountBudget48 D.W _ f l (b + E.factorization l) M (m : ℤ) hl
    (by exact_mod_cast hmd)
    (by
      intro w hw
      have h0 := hfk w hw
      convert h0 using 2
      push_cast
      ring) hg
  have hEQ0 : Nat.card D.EQ ≠ 0 := Nat.card_pos.ne'
  have hCl0 : Nat.card D.ClQ ≠ 0 := Nat.card_pos.ne'
  have hfW : (Nat.card D.W).factorization l =
      (Nat.card D.EQ).factorization l + (Nat.card D.ClQ).factorization l := by
    rw [hWc, Nat.factorization_mul hEQ0 hCl0, Finsupp.add_apply]
  have hfEQ : (Nat.card D.EQ).factorization l + (c + E.factorization l) =
      InfinitePlace.nrComplexPlaces L * (ν + E.factorization l) := by
    have h0 := congrArg (fun n => n.factorization l) hEQc
    have ha1 : a - 1 ≠ 0 := by omega
    rw [Nat.factorization_mul hEQ0 ha1, Finsupp.add_apply, hfa, hL.ord, Nat.factorization_pow,
      Finsupp.smul_apply, smul_eq_mul, hfN] at h0
    exact h0
  calc Nat.card ↑(EqHom γ a (l ^ ν)) * (l ^ ν) ^ InfinitePlace.nrComplexPlaces L
      ≤ l ^ (Nat.card D.ClQ).factorization l *
          l ^ ((Nat.card D.EQ).factorization l + (c + E.factorization l)) := by
        refine Nat.mul_le_mul hEHc ?_
        rw [← pow_mul]
        refine Nat.pow_le_pow_right hl.pos ?_
        rw [hfEQ, mul_comm]
        exact Nat.mul_le_mul_left _ (Nat.le_add_right _ _)
    _ = l ^ ((Nat.card D.EQ).factorization l + (Nat.card D.ClQ).factorization l) *
          l ^ (c + E.factorization l) := by
        rw [← pow_add, ← pow_add]
        congr 1
        ring
    _ ≤ (Nat.card ↥f.range * M) * l ^ (c + E.factorization l) := by
        refine Nat.mul_le_mul_right _ ?_
        rw [← hfW]
        exact hp
    _ ≤ (B * M) * l ^ (c + E.factorization l) :=
        Nat.mul_le_mul_right _ (Nat.mul_le_mul_right _ hrange)


namespace RHPrimeWindow48
theorem herbrand_cancel (K Base H1 H2 : ℕ) (hpos : 0 < H1)
    (heq : H1 = H2) (hseq : K * H1 ≤ Base * H2) : K ≤ Base := by
  rw [← heq] at hseq
  exact le_of_mul_le_mul_right hseq hpos

example (K Base H1 H2 : ℕ) (hpos : 0 < H1)
    (heq : H1 = H2) (hseq : K * H1 ≤ Base * H2) : K ≤ Base := by
  first
  | (rh_reduce 2 using [herbrand_cancel]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact herbrand_cancel K Base H1 H2 hpos heq hseq
end RHPrimeWindow48

rh_scan UpperTheory.V.ZK.Ct.pCountBudget48 limit 2000
rh_scan UpperTheory.V.ZK.sCountBudget48 limit 2000
rh_prune UpperTheory.V.ZK.Ct.pCountBudget48 as RHPrime48PCountPruned
rh_prune UpperTheory.V.ZK.sCountBudget48 as RHPrime48SCountPruned
rh_scan RHPrimeWindow48.herbrand_cancel limit 2000
rh_prune RHPrimeWindow48.herbrand_cancel as RHPrime48HerbrandPruned
#print axioms UpperTheory.V.ZK.Ct.pCountBudget48
#print axioms UpperTheory.V.ZK.sCountBudget48
#print axioms RHPrimeWindow48.herbrand_cancel
