import RUN36_CANONICAL_GAUGE_RANK
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.MassRatioRankFactor
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 15 | 25 Nov 2026 | HUMAN MATHEMATICS / SOURCE-MATCHED, LEAN PREPARED NOT RUN.
RH OPEN. Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 read incl.
mandatory engine; AGENTS, SWARM, HANDOFF, EXPANSION, continuity and
living proof 10e3d636b345adbcae9ddb91820a3a93f59c93bc consulted.
Latest peers surveyed: theta 4445c6bd (canonical finite coordinates),
geometry 3232ac0e (one positive calibration), integration 678de808
(signed translation sum), audit c2aa33f2, literature c9d417b7,
Galois f2bb1e4b, CountQ 8aed7b77. Prior editor c0c7d3f7.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474; peers observed
upstream 98d36aaf, not used here.

NEW: eliminate the rank-one conditional Euler product and the absolute
Tamagawa number of the norm-one torus from the adjacent-rank consumer.
The torus need not be evaluated at all. Work on the SAME canonical
diagonal AutInst as theta RUN37 and its fixed measure witness C36.

Let E/F be the native everywhere-finitely-unramified CM extension,
d=abs(discr F), f=[F:Q], n=p+q >= 2, G_n=U(J) for J=diag(+/-1).
Let T=U(1) and H_n=SU(J). Determinant has an algebraic section
t -> diag(t,1,...,1), since J is diagonal; G_n=H_n semidirect T.
This is not the generally nonsplit central-isogeny decomposition
SU x U(1) modulo mu_n. The section preserves the canonical integral
lattice at every finite place; H_n(F) and T(F) similarly split G_n(F).
The T action on H_n preserves Haar: over E it is conjugation on
sl_n with determinant one (matrix-unit eigenvalue ratios cancel;
diagonal trace-zero subspace fixed). Hence in s*t coordinates the
left Haar measure is the product of compatible H_n and T measures.
For exact measurable transversals D_H,D_T for the rational subgroups,
D_H x D_T is a transversal for the semidirect rational quotient:
first bring t into D_T by a rational torus element, then s into D_H
by a rational H element. Uniqueness follows in the reverse order.
Thus product covol holds by Fubini, not by assuming that T acts
trivially. Retain previous countable discrete Borel-transversal and
native covol/quotient-transport checks.

Choose on G_n the trace density from editor RUN37 and normalize finite
compact stabilizers to one. On T use the rank-one trace density at
infinity and compact measure one at finite places. Choose the
compatible H_n measure by disintegrating under the determinant.
On the raw local measures before compact normalization, choose a
rational top form omega_T and contract omega_G along the rational
section to obtain omega_H. At each place use the same local density
multipliers as in omega_G / omega_T. The product formula makes their
global product one. In particular do NOT use the restriction of the
trace metric to sl_n as the quotient density without a correction:
the determinant differential on the scalar direction is multiplication
by n; contraction handles that factor, even at primes dividing n.
The determinant section makes K_G=K_H semidirect K_T, so their raw
volumes obey mu_H(K_H)=mu_G(K_G)/mu_T(K_T).

Exact finite-factor proof (all residue characteristics, including 2).
Write Q for the residue cardinality of F_v. At split v,
G_n reduces to GL_n(F_Q). Counting independent columns gives
|GL_n(F_Q)|=Q^(n*n)*prod_{j=1}^n(1-Q^(-j)).
At inert v, reduce to the unitary group over F_{Q^2}. The norm map has
one preimage at zero and Q+1 at each nonzero value of F_Q. Let B_m be
the count of vectors of norm 1 in m coordinates. Norm surjectivity
makes counts for all nonzero norms identical. Adding one coordinate
gives B_(m+1)=(Q+1)*Q^(2*m)-Q*B_m, with B_1=Q+1. Thus
B_m=Q^(m-1)*(Q^m-(-1)^m). An orthogonal unit vector splits off a
nondegenerate complement, and every nondegenerate finite-field
Hermitian form is diagonalizable and equivalent to identity by
norm surjectivity. For diagonalization in characteristic two, if
every h(x,x)=0, h(x+ay,x+ay)=Tr(a*h(x,y))=0 for all a; trace
surjectivity would force h=0. Therefore orthonormal basis counting
gives |U_n(F_Q)|=prod_{m=1}^n B_m =
Q^(n*n)*prod_{j=1}^n(1-(-1)^j Q^(-j)).
For a self-dual lattice, the integral Lie trace pairing is perfect:
after finite etale splitting E_v/F_v it is the GL_n trace pairing
with determinant +/-1; descent preserves perfection. The unitary
group scheme is smooth by the same etale splitting. Equivalently the
lifting linear map X -> X^* J+J X onto Hermitian matrices is onto:
after setting Y=JX the off-diagonal entries may be solved one at a
time and diagonal entries by surjectivity of the finite-field trace.
Each solution fibre has Q^(n*n) elements, including dyadic v.
Counting lifts (or using smooth coordinates) gives raw trace-density
mass |G_n(F_Q)|/Q^(n*n). The above density choice on T is the same
rank-one calculation. Consequently:
  mu_H(K_H) = prod_{j=2}^n (1-eta_v^j Q^(-j)).
The troublesome j=1 factor cancels LOCALLY before forming any product.
All surviving Euler products are absolutely convergent (j>=2);
no conditional product, L(1) normalization or RH assumption.
The native eulerFac uses E-primes: inert absNorm P=Q^2 so the sqrt
is Q, while split P and conjugate P each give a half exponent,
combining to the single inverse factor. Pair BEFORE multiplying.
The identification of prime orbits and discriminants is classical
unramified CM arithmetic, still to be checked in native definitions.

H_n is simply connected semisimple, of dimension n*n-1. The ordinary
Tamagawa theorem gives tau(H_n)=1 for all signatures. See Kottwitz,
Tamagawa numbers, Ann. Math. 127 (1988), 629-646,
https://annals.math.princeton.edu/1988/127-3/p05 ;
for the classical unitary case Mars (1969),
https://annals.math.princeton.edu/1969/89-3/p04 .
Standard additive adelic normalization uses d^(-dim/2) with ordinary
real Lebesgue and integral finite volume 1, see section 2.3 of
https://londmathsoc.onlinelibrary.wiley.com/doi/10.1112/jlms.12830 .
Hence the compatible raw H quotient volume is d^((n*n-1)/2).
Normalizing its finite K factors to one multiplies by
prod_{j=2}^n L_F(j,eta^j). Keeping the rank-one torus volume C_T
as a single unchanged number yields
  C36(I,p,q) = C_T(I) * d^((n*n-1)/2) * prod_{j=2}^n L_F(j,eta^j).
This is a conventional human quotient formula, conditional on exact
native measure dictionary (canonical lattice, congruence topology,
gauge archimedean density and discrete quotient). No numerical
evaluation or finiteness proof for C_T is needed in the ENNReal
adjacent-rank equation; no division by C_T. The two exponents differ
by n-1/2, and d=(2*vInv(E))^f by unramified discriminant tower.
Thus the ratio multiplier is exactly native rankFac E n. The same
formula is independent of signature. This is a simpler classical
supplier than computing the full U_n Tamagawa number with a
rank-one regularized product. Does not by itself close arbitrary
noncanonical D.vol transports or native measure existence.

EDITORIAL INSERT (for living proof section 5, do not duplicate):
For a canonical self-dual diagonal Hermitian lattice, split the
determinant U_n=SU_n semidirect U_1. Integral stabilizers split as
well. Finite trace-density masses after division by the U_1 mass
are prod_{j=2}^n(1-eta_v^j q_v^(-j)); the products converge
absolutely. By the simply connected Tamagawa theorem the compatible
covolume is C_1 d_F^((n*n-1)/2) prod_{j=2}^n L_F(j,eta^j).
The common C_1 cancels algebraically in the recurrence, giving the
native rankFac; no rank-one L-value estimate is needed. The exact
native gauge/adelic quotient identification remains to be verified.

Original source-visible graph retained:
CountingTheorem -> VolumeStep -> rank-one volume unfolding,
and separate native D.vol / MassRatioUnderVolume / SW1b2 path.
Candidate:
canonical36 -> coordinate and topology dictionary RUN37 theta +
trace-density gauge identification RUN37 editor +
determinant split, local factors, simply connected Tamagawa theorem,
quotient transport -> torus_formula -> CanonicalRank36 ->
countingTheorem_of_canonical36.
Cache by source/toolchain, actual I.cm, J, F,E, rank, signature,
determinant section, trace density, chosen witness and consumer.
Do not share by rank alone. Backtrack to original VolumeStep if
any dictionary fails. No global graph edges deleted. No new
elaborated dependency or axiom report; original evidence retained.

Pinned source blobs:
Formalism/HermitianLattices/StatementMass.lean 33a3ea93298eff7969409462ddfc1ed22f173939
Development/AbelianVarietyTheory/Definitions/SemilocalFrames/IsGaugeAll.lean 5abc045266b05be6cd3f3fcc67b369ddd167f92b
Development/AbelianVarietyTheory/Definitions/SemilocalFrames/DefClassNum.lean 65f9efd688be555d6654d063ea6a782ea8799810
Development/AbelianVarietyTheory/Proofs/FlagMeasures/MassRatioRankFactor.lean 7ab7981637d6ed6f39e65cea95e69571c851300c
Development/AbelianVarietyTheory/Proofs/FlagMeasures/HermitianVolumeDependsOnlyOnFieldSignature.lean aa84c8b2948c99ef4eeeb99119faa848be8d3097
Formalism/SharpRestriction/GlobalSchurBounds/StandardLattice.lean cb758a6c5f78e610b8f946d4b733d07902b15f5d
Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/AdelicQuotientVolumeEqOfSignatureRankIndep.lean 5df13f58118a8edd91ceed1143cf20581f71a1ec
All retrieved at pin. Prior theta canonical36 certificate 410fcbc2.

Executed exact finite-field checks in V8: q=2,3,4,5,7,8, ranks 1..12,
72 rank cases, 353 fibres of the actual 2x2 Hermitian lifting map
(q=2,3,4), 1035 individual assertions. No failures. Reproduce:
const fields=[{q:2,p:2,m:2,poly:[1,1,1]},{q:3,p:3,m:2,poly:[1,0,1]},{q:4,p:2,m:4,poly:[1,1,0,0,1]},{q:5,p:5,m:2,poly:[3,0,1]},{q:7,p:7,m:2,poly:[4,0,1]},{q:8,p:2,m:6,poly:[1,1,0,0,0,0,1]}];
let checks=0,rankCases=0,liftCases=0;
for(const {q,p,m,poly} of fields){
 const Q=q*q,vals=Array.from({length:Q},(_,i)=>i),mod=x=>((x%p)+p)%p;
 const digits=x=>Array.from({length:m},(_,i)=>Math.floor(x/p**i)%p);
 const enc=a=>a.reduce((s,x,i)=>s+mod(x)*p**i,0);
 const add=(a,b)=>enc(digits(a).map((x,i)=>x+digits(b)[i]));
 const mul=(a,b)=>{let x=digits(a),y=digits(b),z=Array(2*m-1).fill(0);for(let i=0;i<m;i++)for(let j=0;j<m;j++)z[i+j]=mod(z[i+j]+x[i]*y[j]);for(let k=2*m-2;k>=m;k--){let t=z[k];for(let j=0;j<m;j++)z[k-m+j]=mod(z[k-m+j]-t*poly[j]);}return enc(z.slice(0,m));};
 const pow=(a,k)=>{let b=1;while(k){if(k%2)b=mul(a,b);a=mul(a,a);k=Math.floor(k/2);}return b;};
 const star=a=>pow(a,q),fixed=vals.filter(a=>star(a)===a);if(fixed.length!==q)throw Error("fixed");
 for(const a of vals){if(a&&pow(a,Q-1)!==1)throw Error("field");checks++;}
 const freq=Array(Q).fill(0n);for(const a of vals)freq[mul(a,star(a))]++;
 for(const a of vals){if(freq[a]!==BigInt(a===0?1:fixed.includes(a)?q+1:0))throw Error("norm");checks++;}
 let dist=Array(Q).fill(0n);dist[0]=1n;
 for(let n=1;n<=12;n++){let next=Array(Q).fill(0n);for(const a of fixed)for(const b of fixed)next[add(a,b)]+=dist[a]*freq[b];dist=next;
 const B=BigInt(q)**BigInt(n-1)*(BigInt(q)**BigInt(n)-(-1n)**BigInt(n));for(const a of fixed){if(dist[a]!==(a?B:BigInt(q)**BigInt(2*n)-BigInt(q-1)*B))throw Error("count");checks++;}rankCases++;}
 if(q<=4){let hist=new Map();for(const a of vals)for(const b of vals)for(const c of vals)for(const d of vals){let u=add(a,star(a)),v=add(d,star(d)),w=add(b,star(c)),key=(u*Q+v)*Q+w;hist.set(key,(hist.get(key)||0)+1);}
 if(hist.size!==q**4)throw Error("surjectivity");for(const count of hist.values()){if(count!==q**4)throw Error("kernel");checks++;}liftCases+=hist.size;}
}
console.log({checks,rankCases,liftCases});
These are actual finite fields, not substitute adeles. General proof
is the recurrence and smooth-lift argument, not finite extrapolation.
Local Lean/Lake not installed. Baseline CI status.json actually read:
45577239749 blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc;
45576756833 blob 7da354941e402b6f8b364ed03d8c5c82d27b7717;
both returncode 0. Neither tests this file. Existing registry consulted;
no dedicated canonical-rank batch entry located among relevant jobs,
no new queue submitted in this run. Native replay commands below
prepared for the existing pinned runner with RUN35/36 imported;
compile those first, then lake env lean this file, preserving logs,
scan/prune/axioms and original bridge. Zero new root obligations
formally retired; no URT comparison necessary for exact cancellation.

RESUME HERE: kernel/geometry/theta, replay RUN35-37 and this adapter
in one warmed pinned environment; authenticate the determinant section
and finite local mass quotient on actual canonical36, plus the
single positive global calibration rectangle and exact covol transport.
This is a precise path requiring no U_1 global mass evaluation.
Integration: use editorial insert in living proof §5 as conditional
only, retain other D.vol transports and all same-host VWinAt(1,401),
arithmetic, entropy and joint-loss suppliers. Keep original fallback.
HANDOFF TO kernel extractor, theta, geometry, literature, integration,
audit. RH remains open.
-/

noncomputable section
open NumberField MeasureTheory Formalism.MainNotions.S GlobalTheory.Count GlobalTheory.FlagMeas
open Formalism.HermitianLatticesTheory
open scoped ENNReal
namespace RHEditorTorus

theorem norm_count_step (q : ℝ) (n : ℕ) :
    (q+1)*q^n - (q^n-(-1:ℝ)^n) = q^(n+1)-(-1:ℝ)^(n+1) := by
  simp only [pow_succ]
  ring

theorem rank_exponent (f n : ℝ) :
    f*(n^2-1)/2 = f*((n-1)^2-1)/2 + f*(n-1/2) := by ring

def torusFactor (E : Type) [Field E] [NumberField E] [StarRing E] (n : ℕ) : ℝ :=
  (2*vInv E)^((fDeg E : ℝ)*((n:ℝ)^2-1)/2) *
    ∏ j ∈ Finset.range (n-1), lValEta E (j+2)

theorem torusFactor_step (E : Type) [Field E] [NumberField E] [StarRing E]
    (n : ℕ) (hn : 2 ≤ n) :
    torusFactor E n = torusFactor E (n-1) * rankFac E n := by
  have hb : 0 < 2*vInv E := by
    have := vInv_pos_of_numberField E
    positivity
  have he : (fDeg E : ℝ)*((n:ℝ)^2-1)/2 =
      (fDeg E : ℝ)*(((n-1:ℕ):ℝ)^2-1)/2 + (fDeg E : ℝ)*((n:ℝ)-1/2) := by
    rw [Nat.cast_sub (by omega : 1 ≤ n)]
    push_cast
    exact rank_exponent _ _
  have hlen : n-1 = (n-2)+1 := by omega
  have hidx : n-2+2 = n := by omega
  have hlen' : n-1-1 = n-2 := by omega
  have hp : (∏ j ∈ Finset.range (n-1), lValEta E (j+2)) =
      (∏ j ∈ Finset.range (n-1-1), lValEta E (j+2)) * lValEta E n := by
    rw [hlen', hlen, Finset.prod_range_succ, hidx]
  unfold torusFactor rankFac
  rw [he, Real.rpow_add hb, hp]
  ring

open GlobalTheory.FlagMeas.VolRatio

def TorusFormula (C1 : AutInst → ENNReal) : Prop :=
  ∀ I p q, 1 ≤ p+q → C36 I p q =
    C1 I * ENNReal.ofReal (torusFactor I.E (p+q))

theorem canonical_rank_of_torus (C1 : AutInst → ENNReal)
    (hC : TorusFormula C1)
    (hL : ∀ I : AutInst, ∀ m : ℕ, 2 ≤ m → 0 ≤ lValEta I.E m) :
    CanonicalRank36 := by
  intro I p q hn s hs
  let a := if s then p-1 else p
  let b := if s then q else q-1
  have hr : a+b = p+q-1 := by
    dsimp [a,b]
    cases s <;> simp at hs ⊢ <;> omega
  have ha : 1 ≤ a+b := by omega
  have hp : 0 ≤ torusFactor I.E (a+b) := by
    unfold torusFactor
    have hv := vInv_pos_of_numberField I.E
    apply mul_nonneg (Real.rpow_nonneg (by positivity) _)
    apply Finset.prod_nonneg
    intro j hj
    exact hL I (j+2) (by omega)
  have hh := torusFactor_step I.E (p+q) (by omega)
  rw [← hr] at hh
  change C36 I p q = C36 I a b * ENNReal.ofReal (rankFac I.E (p+q))
  rw [hC I p q (by omega), hC I a b ha, hh, ENNReal.ofReal_mul hp, mul_assoc]

theorem counting_of_torus (C1 : AutInst → ENNReal) (hC : TorusFormula C1)
    (hL : ∀ I : AutInst, ∀ m : ℕ, 2 ≤ m → 0 ≤ lValEta I.E m) :
    GlobalTheory.IndefiniteRowSideFullHecke.LatticeCountingTheorem.CountingTheorem := by
  have h := canonical_rank_of_torus C1 hC hL
  first
  | (rh_reduce 2 using [GlobalTheory.CountFinal.countingTheorem_of_canonical36]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact GlobalTheory.CountFinal.countingTheorem_of_canonical36 h

end RHEditorTorus
rh_scan GlobalTheory.FlagMeas.mass_ratio_mul_unitary_volume limit 2000
rh_scan RHEditorTorus.canonical_rank_of_torus limit 2000
rh_scan RHEditorTorus.counting_of_torus limit 2000
rh_prune RHEditorTorus.counting_of_torus as RHEditorTorusPruned
#print axioms RHEditorTorus.norm_count_step
#print axioms RHEditorTorus.torusFactor_step
#print axioms RHEditorTorus.canonical_rank_of_torus
#print axioms RHEditorTorus.counting_of_torus
