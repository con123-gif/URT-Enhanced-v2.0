import RHCharacterJointLate47
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN48, 26 Nov 2026, lane 6 — remove the cyclotomic line from the
fixed-level twisted Selmer bound, at the actual cofinal Sha caller.
HUMAN SOURCE-MATCHED argument / native adapter PREPARED NOT COMPILED.
RH OPEN.

Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 incl mandatory engine;
AGENTS 8db0201d, SWARM 4b77b161, HANDOFF bbc46df7, EXPANSION c8152d07,
state/log/protocol/continuity openings read. Latest peer commit index
through d843aa72 checked; relevant integration 2becd062, prime RUN48
5f0e858f, RUN49 03d8a69f, RUN50 d2660dc3, audit d217e9e2, own RUN47
17b56ded retained. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005;
latest upstream observed 11437ebe3e9938e25d3122bd645d56eee1cd4b56 not
adopted. Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

Actual fixed layer: totally complex L, TopRoot l c L, E>=1,
r=b+v_l(E), nu>=max(c,r,2E), F=L(mu_{l^nu}), actual Lay gamma
and Ct.IsDat. Set q=l^r, t=min(r,c+v_l(E+1)), h=dim_F_l
H^1(G_{L,S},F_l), S=primes above l. For r=0 the bound is trivial.
For r>=1, the stronger fixed-level supplier is

                 |D.W[l^r]| <= l^(r*(h-1)).

This removes an entire cyclotomic cohomology direction, not a
new scalar approximation. The older RUN48 prime bound was
l^(r*h-r+t); our improvement is the factor l^t. No estimate on
h or homology torsion P is smuggled in.

1. Audit actual twisted Kummer identification. Pinned TwoLe.lean
defines W=U/(im del+T) with T=torsion Y, U=d^-1(im delI),
Y=Additive F^*, I=free divisor group, del=g-a, delI=gI-a,
g=gamma^-1 and a=(1+l^c)^E. Work in Y/T, which is torsion-free;
both del and delI injective since g^n=gI^n=1 and a>=2.
Indeed the geometric sum identity kills a kernel vector by
a^n-1 !=0. If w in U and q*w=del y then d(w)=delI i implies
delI(d y-q i)=0 hence d y=q i. Conversely if d y=q i and
del y=q w in Y/T, applying d gives q(d w-delI i)=0, so w in U.
Sending y to w mod im del is inverse to sending [w] to y mod q.
Changing y by q z changes w by del z; changing w by del z
changes y by q z. Thus W[q] identifies with the g=a eigenspace
in V/T_q, where V consists of q-divisible valuations in
F^*/F^*q, T_q the image of the roots of unity. This is an actual
group isomorphism, not a claim of a canonical lift into V.
The map d descends since I torsion-free. Under Kummer theory
V injects into H^1(G_{F,S_F},mu_q): away from l a q-divisible
valuation gives an unramified Kummer class, by removing the
uniformizer and applying Hensel to the unit over the strict
henselization. Twist by cyclotomic^E. Then the g=a eigenspace
becomes the invariant subspace for coefficients
M_r=Z/l^r(E+1); orientation is E+1, since gamma^-1 acts on
mu_q by (1+l^c)^-1 and the extra twist acts by a^-1.

2. NEW step: let F_inf=L(mu_{l^infty}), G=G_{L,S}, H=Gal(L_S/F_inf),
G_F=Gal(L_S/F), Gamma=G/H. TopRoot and c>=1 (c>=2 for l=2)
give cyclotomic image exactly 1+l^c Z_l, isomorphic to Z_l.
Proof: closed subgroup of this procyclic pro-l group is
l^k Z_l under a topological-generator identification; not fixing
mu_{l^(c+1)} forces k=0. The canonical finite field has exactly
l^nu as its largest l-power root order; [F_{nu+r}:F_nu]=l^r.
All cyclotomic fields lie in L_S by unramifiedness away from l.
The maximal S_F-unramified extension equals L_S over F, since
F/L is unramified outside S and taking the Galois closure
preserves that property. All fields are totally complex.

The restriction kernel
 H^1(G_F,M_r) -> H^1(H,M_r)
is H^1(G_F/H,M_r)=Hom_cont(Z_l,Z/l^r), since nu>=r makes the
coefficient action trivial on G_F. It has size q. Under the
Kummer identification on G_F, a primitive l^nu-th root of
unity gives the Kummer class of the degree-q extension
F(mu_{l^(nu+r)})/F, so its associated homomorphism surjects
onto mu_q. Thus that one class generates the entire restriction
kernel, and the kernel equals exactly T_q (prime-to-l roots
are q-powers, l-primary roots are cyclic). This proves an
equivariant INJECTION V/T_q -> H^1(H,M_r). No independent
choice of F or infinite tower or character is made.
The action on the image factors through Gal(F/L), because
restriction is equivariant and inner conjugation by G_F
acts trivially on its H^1. Taking invariants yields
 W[q] -> H^1(H,M_r)^Gamma.
No assertion of surjectivity of this last injection; extra
valuation conditions are retained on V.

3. Continuous inflation-restriction for G/H=Gamma gives the
exact sequence
  0 -> H^1(Gamma,M_r) -> H^1(G,M_r)
    -> H^1(H,M_r)^Gamma -> H^2(Gamma,M_r)=0.
For the procyclic Gamma=Z_l, H^1(Gamma,M_r)=M_r/(g-1)M_r,
of size l^t, by LTE and g acting by (1+l^c)^-(E+1).
To see the continuous claims directly, choose large n so the
action factors through C_{l^n}. Every element of M_r is a
valid continuous cocycle value at the generator, since after
enlarging n by r the cyclic norm is zero. Coboundaries are
(g-1)M_r. Also H^2(C_{l^n},M_r)=M_r^g/N_n M_r; inflation
to C_{l^(n+r)} sends a class [x] to [l^r*x]=0: the lift of
the larger cyclic generator has its l^(n+r)-th power equal
to the l^r-th power of the former relation. Equivalently this
is the extension-class description of cyclic H^2. Continuous
cohomology is the directed limit over these quotients, so
H^2(Gamma,M_r)=0. These are standard profinite cohomology
facts, not assumptions on arithmetic L-functions.
Reference: Romyar Sharifi, Group and Galois Cohomology,
Chapter 2, section 2.2 (profinite cohomology and continuous
inflation/restriction), https://math.ucla.edu/~sharifi/notes/groupcoh-ch02.html
(read this run); cyclic H^2 formula and inflation explained above.

4. RUN48 prime's base-field filtration can now be used on G
alone: short exact 0->M_{k-1}->M_k->F_l->0, with
|H^0(G,M_k)|=l^min(k,t0), t0=c+v_l(E+1). The image of the
connecting homomorphism has size l^(1+min(k-1,t0)-min(k,t0)).
The exact sequence gives the inductive upper bound
 |H^1(G,M_r)| <= l^(r*h-r+t).
h is finite by the S-unit/class group exact sequence at level
one; h>=1 because H^1(Gamma,F_l) injects by inflation.
Therefore from step 3 and the actual injection in step 2,
 |W[q]|*l^t <= |H^1(G,M_r)| <= l^(r*h-r+t).
Cancel BEFORE taking norms to obtain the claimed estimate.
This uses no Iwasawa mu=0 conjecture, no stabilization rate,
no bounded class number over F, and no RH.

5. Actual RUN47 caller: integration 2becd062 supplies the
human scaled-primary Few estimate at the SAME Lay, with
d=2E, P=|T_(2E+1)[l^infty]|*|T_(2E)[l^infty]|.
The required original SClass, SUpper and SDetect suppliers
and their native replay remain retained. With the exact
b=2E(1+c)+2v_l(E!) from peer PeExact49, and the actual
native canonical Lay and lift witnesses, the new bound
supplies the W component of JointLate47 with t parameter
set to zero (a bookkeeping choice, not the arithmetic t0).
The combined human consequence is

 l^shaInv * l^((2E+v)*R) <= P*l^(r*(h-1)+c+v),

v=v_l(E), R=nrComplexPlaces L. No need to assume the
separate fixed-r W bound from RUN47 if steps 1-4 are
authenticated. STors, SLayer, SFinal, uniform size of P
and h, CountV consumers, the principal-host signed discrepancy
and RH-scale outer shell remain open as independent proof
obligations in this reconstruction. This is local mathematical
progress, not proof of the target prime inequality.

Source anchors (relative to ClassCounting):
HasVal.lean ee8800532f5867e0bee6b50ba85e6e977328dbab (Lay);
SelmerOrderCounts/TwoLe.lean 16d7d15d6a1f7a7b3d6690d326c772a056811c98
(Dat, W, IsDat); SelmerOrderCounts/SelInvLe.lean
9c5062ff121f83f2062f66e5a3ed349179c1c748 (old labels);
SelmerOrderCounts/PCount.lean c6a473b2ce1fc45ba140660a4f6808ae468aa388;
LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10.
Original selected graph: lemmaK -> sNum -> SCount -> pCount ->
card_tors,selInj,selInvLe,selLCard; SSha->LayEx,ClInj,Good.
Existing candidate RUN47 -> sCountCapped46 -> fixed-r finite
Kummer/Herbrand estimate, scaled Few, cofinal Sha. New candidate
RUN48 -> JointLate47(t=0) -> exact cyclotomic restriction kernel
and procyclic inflation-restriction -> base-field H^1 bound,
same scaled Few. No original edges deleted; preserve all type,
value, constructor roles, axiom ledger, pending and shared
consumers. Cache key pin/toolchain,L,l,c,E,b,r,nu,F,F_inf,
zeta,gamma,g,Lay,D,coefficient action,S,actual caller. Backtrack
to RUN47/46 or native if overlay fails. No URT speed claim.

Executed exact modular regression (V8): 1584 twist cases,
29951 assertions, 6336 strict exponent savings, two negative
controls. First attempt had a false negative-control choice
(k=3, l=3, nu=1); corrected to k=2, which actually shows
failure of the linear binomial formula outside nu>=r.
No number-field computation or kernel run claimed.
Reproduce:
let cases=0, checks=0, strict=0, neg=0;
const ck=x=>{checks++;if(!x)throw Error("check "+checks)};
const gcd=(a,b)=>b?gcd(b,a%b):a;
const pow=(a,n,m)=>{let z=1n;while(n){if(n%2n)z=z*a%m;a=a*a%m;n/=2n}return z};
const val=(a,l)=>{let v=0;while(a%l===0){v++;a/=l}return v};
for(const l of [2,3,5,7])for(let c=l===2?2:1;c<=3;c++)
for(let r=1;r<=3;r++)for(let nu=Math.max(c,r);nu<=Math.max(c,r)+2;nu++){
 const p=BigInt(l),q=p**BigInt(r),Q=p**BigInt(nu+r),pn=p**BigInt(nu);
 let vals=new Set();
 for(let k=0n;k<q;k++){let a=pow(1n+pn,k,Q);ck((a-1n)%pn===0n);
  let x=(a-1n)/pn;ck(x===k);vals.add(x);}
 ck(BigInt(vals.size)===q);
 for(let E=1;E<=16;E++){
  const d=pow(1n+p**BigInt(c),BigInt(E+1),q),
    t=Math.min(r,c+val(E+1,l)),g=gcd((d-1n+q)%q,q);
  ck(g===p**BigInt(t));ck(q%g===0n);
  let n=0n,z=1n;for(let k=0n;k<q;k++){n=(n+z)%q;z=z*d%q}
  ck(z===1n);ck((n*q)%q===0n);
  for(let h=1;h<=4;h++){const base=p**BigInt(r*h-r+t),inf=p**BigInt(t);
    ck(base/inf===p**BigInt(r*(h-1)));ck(base/inf<base);strict++}
  cases++;
 }}
const a=pow(1n+3n,2n,27n);ck((a-1n)/3n!==2n);neg++;
ck(3n**2n/3n<3n**2n);neg++;
console.log({cases,checks,strict,neg});

Local lean/lake/elan unavailable. Actual Actions job lists
45577239749 and 45576756833 fetched: pick/run/record success
for both, BASELINE ONLY. No new PASS, no new kernel graph or
axiom evidence. Stage RUN47_JOINT_LATE_CANONICAL_SHA.lean as
RHCharacterJointLate47 with its previous pinned imports.
Certificate below checks the actual caller bridge once staged;
the infinite Galois-cohomology argument is human, not formalized.
RESUME HERE: audit the exact restriction kernel and E+1 twist,
formalize the cyclotomic quotient injection and continuous
inflation-restriction supplier; use the integrated scaled
primary Few on the same canonical layers. Native replay the
adapter and original RUN47, audit all axioms. Then attack the
remaining quantitative base h and P jointly at the native
principal host; do not merely refine scalar constants.
HANDOFF TO prime, structure, literature, audit, kernel, integration.
-/

noncomputable section
open NumberField IsDedekindDomain
open Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.GaloisCohomology
open UpperTheory.V UpperTheory.V.Base UpperTheory.V.LDataCardLeFinrank UpperTheory.V.ZK

namespace RHCharacter48

theorem cancel_cyclotomic48 (l r h t W : ℕ) (hl : 0 < l)
    (hW : W * l^t ≤ l^(r*h-r+t)) : W ≤ l^(r*h-r) := by
  rw [pow_add] at hW
  exact le_of_mul_le_mul_right hW (pow_pos hl _)

def JointCyclotomic48 (L : Type) [Field L] [NumberField L]
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
          Nat.card (Submodule.torsionBy ℤ D.W ((l:ℤ)^(b+E.factorization l))) * l^t ≤
            l^((b+E.factorization l)*h-(b+E.factorization l)+t))

theorem jointCyclotomic48 (L : Type) [Field L] [NumberField L]
    (l c E b h t P : ℕ) [Fact l.Prime]
    (hJoint : JointCyclotomic48 L l c E b h t P) :
    RHCharacter47.JointLate47 L l c E b h 0 P := by
  intro N
  obtain ⟨ν,hν,hνr,hνd,ζ,γ,hLay,g,hLift,hCyc,hFew,hBudget⟩ := hJoint N
  refine ⟨ν,hν,hνr,hνd,ζ,γ,hLay,g,hLift,hCyc,hFew,?_⟩
  intro D hD
  have hl : l.Prime := Fact.out
  simpa only [Nat.sub_zero] using
    cancel_cyclotomic48 l (b+E.factorization l) h t _ hl.pos (hBudget D hD)

theorem shaCyclotomic48 (L : Type) [Field L] [NumberField L]
    (hTC : IsTotallyComplex L) (l c E b h t P : ℕ) [Fact l.Prime]
    (hTop : TopRoot l c L) (hE : 1 ≤ E)
    (hJoint : JointCyclotomic48 L l c E b h t P) :
    ∃ s : ℕ, shaInv L l E = s ∧
      l^s * (l^(2*E+E.factorization l))^nrComplexPlaces L ≤
        P * l^((b+E.factorization l)*h-(b+E.factorization l)) * l^(c+E.factorization l) := by
  simpa only [Nat.sub_zero] using
    RHCharacter47.shaLate47 L hTC l c E b h 0 P hTop hE
      (jointCyclotomic48 L l c E b h t P hJoint)

example (l r h t W : ℕ) (hl : 0 < l)
    (hW : W*l^t ≤ l^(r*h-r+t)) : W ≤ l^(r*h-r) := by
  first
  | (rh_reduce 2 using [cancel_cyclotomic48]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact cancel_cyclotomic48 l r h t W hl hW

end RHCharacter48

rh_scan RHCharacter48.jointCyclotomic48 limit 2000
rh_scan RHCharacter48.shaCyclotomic48 limit 2000
rh_prune RHCharacter48.jointCyclotomic48 as RHCharacterJointCyclotomicPruned48
rh_prune RHCharacter48.shaCyclotomic48 as RHCharacterShaCyclotomicPruned48
#print axioms RHCharacter48.cancel_cyclotomic48
#print axioms RHCharacter48.jointCyclotomic48
#print axioms RHCharacter48.shaCyclotomic48
