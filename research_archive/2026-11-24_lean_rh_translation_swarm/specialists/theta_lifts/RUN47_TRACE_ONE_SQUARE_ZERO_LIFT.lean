import Development.AbelianVarietyTheory.Proofs.FlagMeasures.CountTypedOfVolumeStep
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.FiniteAdelicUnitaryCongruenceTopology
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# RUN47 — trace-one correction for actual unitary congruence lifts

Status: exact human algebra and executed finite-ring regressions;
native Lean certificate PREPARED, NOT COMPILED. RH OPEN.
26 November 2026, lane 8. Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4
read first (mandatory pipeline, lane 8). AGENTS, SWARM_PROTOCOL,
HANDOFF_QUEUE, EXPANSION_15_LANES, RESEARCH_STATE, CONTINUITY_PROTOCOL
and runner log/protocol openings consulted. Upstream pinned
40e56bab026552e089d7afcfeff08d2defb9c005, Mathlib
0df444a360eaa60ab8c11dca51a86af692955474, Lean 4.33.1.
Latest upstream observed 90b857677a044ffb6742467c33841874a93b254d,
not substituted or audited for equivalence.

Peer ledger: theta RUN39 (integral trace Gram), RUN46
846e90ecc2851847edb02e362d9bbd22d1d047c6 (canonical section).
Editor d5bb73cf already proves smooth lifting entry by entry;
8d7348e738b021d3a527e6a2532742acb90d2226 (RUN47) extends determinant
fibres to arbitrary self-dual lattice. Editor 893007c3 (arch density),
geometry 14448eecf49de51a786b516c6b90de502e8f56c7 (regular arch fibres)
and integration 58dbb472eb4957d41d1bc0948de5313661243b48 (rank 3
witness) inspected. No repeat of finite order count or quotient mass.

NEW: replace entry-by-entry congruence correction by a single
basis-independent matrix expression in the pinned native cT/UJ
convention. Let S be a commutative ring with involution sigma, J
invertible Hermitian, D Hermitian. Assume a trace-one scalar t:
t+sigma(t)=1. Let B=J^{-1}. The exact section of the linearized
unitary defect is
    X=-t B D,   cT(X) J + J X = -D.
Indeed JX=-tD and cT(B)J=1 (take cT of JB=1), so cT(X)J=-sigma(t)D.
This works in characteristic two and when the residue prime divides
the rank. No division by two or by rank. No coordinate choices beyond
the actual local frame. The affine solution space is X+ker(L_J),
where L_J(Y)=cT(Y)J+JY. Equivalently the projection onto its kernel
is P(Y)=Y-t B L_J(Y); L_J(P(Y))=0 and P restricts to identity on
the kernel. This is a split surjection, not a positive-metric claim.

If e is fixed by sigma and e^2=0, and a lift g has defect
    cT(g) J g = J+eD,
then g(1+eX) is invertible, because (1+eX)^(-1)=1-eX, and
    cT(1+eX)(J+eD)(1+eX)=J
exactly, by the displayed linear cancellation; all quadratic terms
are zero. The Lean statement below uses native Formalism.UG.UJ,
not a new substitute definition of the group.

Application: for an unramified quadratic DVR S/R, or split R x R,
choose trace-one t. In the inert case lift a residue element with
nonzero trace, then divide by its trace, an R-unit; at split places
choose (1,0). For consecutive quotients R/pi^(k+1), k>=1, e=pi^k
is fixed and square-zero. The error of an invertible lift is
eD with D Hermitian modulo pi. A Hermitian representative can be
chosen without dividing by 2: replace any D by
tD+sigma(t)cT(D); it is Hermitian and agrees modulo pi. Then
eD is unchanged in the quotient. Every invertible residue lift
can thus be corrected by the ONE expression above. All lifts of
the corrected representative are its translates by 1+eY for
Y in ker L_J on residue matrices. For residue field size q, the
Hermitian target has q^(n^2) elements (n fixed diagonal coordinates,
n(n-1)/2 free quadratic offdiagonal coordinates), while the source
has q^(2n^2), so every fibre has q^(n^2) elements by the split
surjection. At split places this count uses swap involution.
Consequently the smooth lift step underlying finite K mass holds
with no entrywise lifting choices and no division by n or 2.
For arbitrary native self-dual lattice the actual local basis must
be integral and its Gram matrix a unit; these premises remain.

Original source-visible route retained:
  CountBridge.count_typed_of_volumeStep -> VolumeStep -> rankFac
  -> finite stabilizer density and quotient normalization
  -> Kset, Kg in AutInst -> native UJ.
Candidate replacement of the local density lifting step:
  actual local dictionary + integral Gram invertibility + trace-one
  -> linear_section47 -> square_zero47 -> native_lift47
  -> exact congruence fibre count -> RUN39/46 + editor RUN47
  -> paired Tamagawa calibration -> previous count supplier.
This removes the separate coordinatewise *argument*, not a
kernel-verified upstream dependency. Actual native local ring
dictionary, determinant image transport for arbitrary lattice,
Euler-product and gauge/covolume identification remain open.
No claimed proof of TopG/Green or weighted prime lower bound.
Cache key includes source revision, F/E, local place, lattice,
J, sigma, trace section, e, rank, and original consumer;
do not merge different hosts or discard the original graph,
unresolved hypotheses, structural/type/value/constructor edges,
or prior axiom reports. If replay fails backtrack to d5bb73cf's
entrywise lift and retain all prior certificates.

Pinned source blobs directly inspected:
  src/Formalism/SatakeDualWeyl/Statement.lean
    e5f0d2a668f9bb75c740202d478d28f505fff540 (cT, cT_mul, cT_one, UJ)
  src/Formalism/SharpRestriction/CuspSpanNormBounds/GlobAut.lean
    2103e49fe83fce42d4962f85acd9d4f6a589d645 (Kset, Kg, L_dual, muA)
  src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/
    FiniteAdelicUnitaryCongruenceTopology.lean
      3b4a5f88d4e95e9acdb5006b5aa23f88c3ec45ba
    GaugeVolumeEqOfSemilinearIsometryGenus.lean
      d8e911ba588e91954a6b50bf044fd455e8715376
    CountTypedOfVolumeStep.lean 51eec4beb9bed7964345b1fc40a14541dd643cd1
    MassRatioRankFactor.lean 7ab7981637d6ed6f39e65cea95e69571c851300c
  src/Development/AbelianVarietyTheory/Definitions/SemilocalFrames/
    IsGaugeAll.lean 5abc045266b05be6cd3f3fcc67b369ddd167f92b
  src/Formalism/HermitianLattices/StatementMass.lean
    33a3ea93298eff7969409462ddfc1ed22f173939

Executed exact JS finite ring regression (not Lean nor a proof by
sampling): all invertible Hermitian 2x2 J and all Hermitian D over
F4, F9, F2 x F2, F3 x F3. For each case check the linear identity
and independently multiply matrices over S[e]/e^2 to verify the
full correction. Exhaustively count the tangent kernel for one
invertible J per ring. Results (p,split,J count,D cases,kernel):
 (2,false,10,160,16), (2,true,6,96,16),
 (3,false,60,4860,81), (3,true,48,3888,81).
9004 cases (two identities per case); four kernel cardinalities;
four negative controls (wrong trace t=0, D=I). All succeeded.
Exact reproduction JS:
let ncase=0,nkernel=0,neg=0;const details=[];
for(const p of [2,3])for(const split of [false,true]){
const q=p*p, vals=Array.from({length:q},(_,i)=>i),m=x=>((x%p)+p)%p,enc=(a,b)=>m(a)+p*m(b),a=x=>x%p,b=x=>Math.floor(x/p);
const add=(x,y)=>enc(a(x)+a(y),b(x)+b(y)),minus=x=>enc(-a(x),-b(x));
const mul=split?(x,y)=>enc(a(x)*a(y),b(x)*b(y)):(x,y)=>enc(a(x)*a(y)-b(x)*b(y),a(x)*b(y)+b(x)*a(y)-(p===2?b(x)*b(y):0));
const star=split?x=>enc(b(x),a(x)):x=>enc(a(x)-(p===2?b(x):0),-b(x));
const one=split?enc(1,1):1,I=[one,0,0,one],O=[0,0,0,0];
const eq=(x,y)=>x.every((v,i)=>v===y[i]),ma=(x,y)=>x.map((v,i)=>add(v,y[i])),ms=(c,x)=>x.map(v=>mul(c,v)),mt=x=>[star(x[0]),star(x[2]),star(x[1]),star(x[3])],mm=(x,y)=>[0,1,2,3].map(i=>add(mul(x[2*(i>>1)],y[i%2]),mul(x[2*(i>>1)+1],y[2+i%2]))),det=x=>add(mul(x[0],x[3]),minus(mul(x[1],x[2]))),inv=x=>vals.find(y=>mul(x,y)===one);
const t=vals.find(x=>add(x,star(x))===one);if(t===undefined)throw Error("trace");
const fixed=vals.filter(x=>star(x)===x),hs=[];for(const x of fixed)for(const y of fixed)for(const z of vals)hs.push([x,z,star(z),y]);
const da=(x,y)=>[add(x[0],y[0]),add(x[1],y[1])],dm=(x,y)=>[mul(x[0],y[0]),add(mul(x[0],y[1]),mul(x[1],y[0]))],ds=x=>x.map(star);
const dt=x=>[ds(x[0]),ds(x[2]),ds(x[1]),ds(x[3])],dmm=(x,y)=>[0,1,2,3].map(i=>da(dm(x[2*(i>>1)],y[i%2]),dm(x[2*(i>>1)+1],y[2+i%2]))),pack=(x,y)=>x.map((v,i)=>[v,y[i]]);
let count=0,ks=0,js=0;
for(const J of hs){const di=inv(det(J));if(di===undefined)continue;js++;const B=ms(di,[J[3],minus(J[1]),minus(J[2]),J[0]]);if(!eq(mm(J,B),I))throw Error("inverse");
for(const D of hs){const X=mm(B,ms(minus(t),D));if(!eq(ma(mm(mt(X),J),mm(J,X)),ms(minus(one),D)))throw Error("linear");
const C=pack(I,X),H=pack(J,D);if(JSON.stringify(dmm(dmm(dt(C),H),C))!==JSON.stringify(pack(J,O)))throw Error("dual");count++;}
if(js===1){for(const x of vals)for(const y of vals)for(const z of vals)for(const w of vals){const X=[x,y,z,w];if(eq(ma(mm(mt(X),J),mm(J,X)),O))ks++;}if(ks!==p**4)throw Error("kernel");}}
if(!js||!count||eq(ma(mm(mt(O),I),mm(I,O)),ms(minus(one),I)))throw Error("negative");neg++;ncase+=count;nkernel+=ks;details.push({p,split,js,count,ks,t});}
console.log({details,ncase,nkernel,negativeControls:neg});

Local lean/lake/elan unavailable (command -v empty). Actual CI status
records reread: 45577239749 (blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc)
and 45576756833 (blob 7da354941e402b6f8b364ed03d8c5c82d27b7717)
both returncode 0; BASELINE ONLY. The conditional root has propext,
Classical.choice, Quot.sound; scan still has 324 pending nodes.
No new native execution, no fresh axiom results, no CI queue claim.

RESUME HERE: stage this independent local certificate in the pinned
runner; execute native rh_scan/prune/auto and verify actual logs,
then instantiate at the local integral quotient of the same
AutInst.Lf (RUN37/46 and editor RUN47). Identify Kg with its local
congruence reductions and transport the exact fibre mass into
the paired calibrated Haar quotient. Do not claim native closure
until that substitution checks; retain all unresolved obligations.
HANDOFF TO geometry/editor/kernel/integration and independent audit.
-/

open Matrix Formalism.UG
noncomputable section
namespace RHTheta47

variable {A n : Type} [CommRing A] [Fintype n] [DecidableEq n]

theorem ct_add47 (σ : A →+* A) (M N : Matrix n n A) :
    cT σ (M + N) = cT σ M + cT σ N := by
  ext i j
  simp [cT]

theorem ct_smul47 (σ : A →+* A) (t : A) (M : Matrix n n A) :
    cT σ (t • M) = σ t • cT σ M := by
  ext i j
  simp [cT, smul_eq_mul]

def correction47 (B D : Matrix n n A) (t : A) : Matrix n n A :=
  B * ((-t) • D)

theorem linear_section47 (σ : A →+* A) (J B D : Matrix n n A)
    (hJ : cT σ J = J) (hD : cT σ D = D) (hJB : J * B = 1)
    (t : A) (ht : t + σ t = 1) :
    cT σ (correction47 B D t) * J + J * correction47 B D t = -D := by
  have hBct : cT σ B * J = 1 := by
    have h := congrArg (cT σ) hJB
    rwa [cT_mul, hJ, cT_one] at h
  have h1 : J * correction47 B D t = (-t) • D := by
    unfold correction47
    rw [← Matrix.mul_assoc, hJB, Matrix.one_mul]
  have h2 : cT σ (correction47 B D t) * J = (-σ t) • D := by
    unfold correction47
    rw [cT_mul, Matrix.mul_assoc, hBct, Matrix.mul_one, ct_smul47, hD, map_neg]
  rw [h1, h2, ← add_smul]
  have ht' : -σ t + -t = -(1 : A) := by
    rw [← neg_add, add_comm (σ t) t, ht]
  rw [ht']
  simp

theorem square_zero47 (σ : A →+* A) (J D X : Matrix n n A)
    (e : A) (he : e * e = 0) (heσ : σ e = e)
    (hx : cT σ X * J + J * X = -D) :
    cT σ (1 + e • X) * (J + e • D) * (1 + e • X) = J := by
  rw [ct_add47, cT_one, ct_smul47, heσ]
  have hl : (1 + e • cT σ X) * (J + e • D) =
      J + e • (D + cT σ X * J) := by
    simp only [Matrix.add_mul, Matrix.mul_add, Matrix.one_mul,
      Matrix.smul_mul, Matrix.mul_smul, smul_smul, he, zero_smul,
      add_zero, smul_add]
    abel
  rw [hl]
  calc
    _ = J + e • (D + cT σ X * J + J * X) := by
      simp only [Matrix.add_mul, Matrix.mul_add, Matrix.one_mul,
        Matrix.mul_one, Matrix.smul_mul, Matrix.mul_smul, smul_smul,
        he, zero_smul, add_zero, smul_add]
      abel
    _ = J := by rw [add_assoc, hx, add_neg_cancel, smul_zero, add_zero]

def onePlus47 (e : A) (X : Matrix n n A) (he : e * e = 0) : GL n A :=
  ⟨1 + e • X, 1 - e • X,
    by
      simp [mul_sub, Matrix.add_mul, Matrix.smul_mul, Matrix.mul_smul,
        smul_smul, he],
    by
      simp [sub_mul, Matrix.mul_add, Matrix.smul_mul, Matrix.mul_smul,
        smul_smul, he]⟩

theorem native_lift47 (σ : A →+* A) (J B D : Matrix n n A)
    (hJ : cT σ J = J) (hD : cT σ D = D) (hJB : J * B = 1)
    (t : A) (ht : t + σ t = 1)
    (e : A) (he : e * e = 0) (heσ : σ e = e)
    (g : GL n A)
    (hg : cT σ (g : Matrix n n A) * J * (g : Matrix n n A) = J + e • D) :
    ∃ u : UJ σ J,
      ((u : GL n A) : Matrix n n A) =
        (g : Matrix n n A) * (1 + e • correction47 B D t) := by
  let X := correction47 B D t
  let v := onePlus47 e X he
  have hx : cT σ X * J + J * X = -D := by
    first
    | (rh_reduce 2 using [linear_section47]; done)
    | (rh_auto_frontier 2; done)
    | (rh_auto 2; done)
    | exact linear_section47 σ J B D hJ hD hJB t ht
  have hu : g * v ∈ UJ σ J := by
    change cT σ ((g : Matrix n n A) * (1 + e • X)) * J *
      ((g : Matrix n n A) * (1 + e • X)) = J
    rw [cT_mul]
    calc
      _ = cT σ (1 + e • X) *
          (cT σ (g : Matrix n n A) * J * (g : Matrix n n A)) *
          (1 + e • X) := by simp only [Matrix.mul_assoc]
      _ = J := by rw [hg]; exact square_zero47 σ J D X e he heσ hx
  exact ⟨⟨g * v, hu⟩, rfl⟩

end RHTheta47

rh_scan GlobalTheory.CountBridge.count_typed_of_volumeStep limit 2000
rh_scan RHTheta47.native_lift47 limit 2000
rh_prune RHTheta47.linear_section47 as RHTheta47LinearPruned
rh_prune RHTheta47.native_lift47 as RHTheta47NativePruned
#print axioms RHTheta47.linear_section47
#print axioms RHTheta47.square_zero47
#print axioms RHTheta47.native_lift47
end
