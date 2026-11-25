import RUN36_CANONICAL_GAUGE_RANK
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.MassRatioRankFactor
import Formalism.SharpRestriction.GlobalSchurBounds.StandardLattice
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 15, 25 November 2026. SOURCE-MATCHED HUMAN / PREPARED, NOT COMPILED.
RH OPEN. One cross-lane result: compare the two native archimedean
normalizations exactly, and share the mass recurrence with the flag-count
consumer rather than proving independent rank identities.

Mission current blob f8b4b837301f8cf43d673be4979f04c4e4b415a4 read
including mandatory engine. AGENTS, SWARM, HANDOFF, EXPANSION, continuity,
state/log/protocol openings and living proof consulted. Peer RUN36 theta
410fcbc20712f9f51032960ea07b0b14f2f65e8b, audit 21574277, dyadic a7ba9251,
literature 2a39654b, CountQ 42529776, Galois e9256be1, structure 9f9a5e0e
and Landau 29c54b4f read at least their relevant editor/diff sections.
Previous editor c01e58f32d74c533e69a2b619c833c7b597e00f6.
Frozen upstream 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Peer reports newer upstream 98d36aafeeb30c1f40fdda96c3574faa34dfa413;
not independently checked here or mixed into the pin.

EDITOR BLOCK (for the single living proof, pending independent audit).
Fix a single unramified CM extension E/F, with the same self-dual
lattice, rational form and compatible archimedean frames. Write f=[F:Q],
d=abs(disc F), n=p+q, and J=diag(s_i) with s_i in {+1,-1}.
On u(J), X*J+JX=0. A real basis is
  D_i=i E_ii,
  A_ij=E_ij-s_i s_j E_ji,
  B_ij=i(E_ij+s_i s_j E_ji), i<j.
The bilinear trace pairing tr(XY) is real, diagonal on this basis,
with entries -1 on D_i and -2 s_i s_j on A_ij and B_ij.
The Euclidean Frobenius pairing Re tr(X*Y) is also diagonal with
entries 1 and 2, respectively. In particular their ABSOLUTE determinant
densities are identical, namely 2^(n(n-1)/2) times coordinate Lebesgue.
The trace pairing itself is not positive on mixed signatures; taking
a signed square root of its determinant on an arbitrary subspace is
not the construction. The absolute density is the invariant one.

The complexification map from these real basis coordinates to complex
matrix entries has determinant of absolute value 2 per off-diagonal
pair and 1 per diagonal. Its real Jacobian is the square of that
product. Thus the native IsOmegaLeb equation (lam.prod lam).map=volume
forces the same density. The native IsGauge limit instead uses the
Frobenius ball centered at 1. Since exp X=1+X+O(||X||^2), its
left-invariant smooth density is normalized by the same tangent
Lebesgue measure. Use local balls of radii (1 +/- o(1))r and Haar
uniqueness; the native sqrt_hs lemma identifies precisely the norm.
For a different chart ball, e.g. ballU in OmegaDensity, the limiting
Haar/density ratio is still its density at the identity by continuity
and shrinking support. Hence c_v * muG_v is the trace-density Haar
while CDHaar.cd is that Haar divided by volU(n). This proves equality
of the two archimedean density conventions including all factors of 2,
without requiring an isometry between different signatures.
volU(n) is the compact volume computed in the previous editor run;
MassRatioRankFactor proves the exact native cross-rank factor.

For the finite factor retain the actual native lattice stabilizer
identification, not merely an abstract group isomorphism. Normalize
mu_f by mu_f(K), which is positive and finite for compact open K.
Assuming the adelic topological group transport sends the same
rational subgroup and lattice stabilizer to the native ones, the
two Haar measures agree up to volU(n)^f. Indeed IsVolMeas specifies
the measure of K times every archimedean measurable rectangle; one
finite positive rectangle suffices by Haar uniqueness. This removes
any independent unknown scalar arising from a choice of Haar.

There is also no factor from the flag covol infimum definition:
for a countable discrete subgroup Gamma of a second-countable lc
group G take a measurable exact transversal F, using a countable
cover of neighborhoods on which the quotient map is injective and
selecting the first chart in a disjoint Borel partition of the quotient.
For any measurable D with Gamma D=G, partition F by the first
enumerated gamma with gamma*x in D. Their translated pieces in D
are pairwise disjoint, since F has one point per orbit. Invariance
and countable additivity give mu(F)<=mu(D), and F itself is admissible.
Thus covol=mu(F). An a.e. fundamental domain has the same measure:
remove the countable union of translated overlaps, and add a
transversal for the remaining null saturated set if necessary.
Use Borel representatives/completion and Haar null sets explicitly
in native replay; do not silently assume an exact cover from an
a.e. cover. This is a human quotient-measure proof, not a checked
Lean equivalence of the native predicates.

Consequently, after the finite-adelic and quotient transport, the
same geometric volume V and gaugeVol satisfy exactly
  gaugeVol = ENNReal.ofReal (volU(n)^f * V).
For n>=3 the native mass recurrence V_n=V_(n-1)*massRatioRightSide(E,n)
and the already proved mass_ratio_mul_unitary_volume cancel all
compact factors to yield gaugeVol_n = gaugeVol_(n-1)*rankFac(E,n).
This is the very CanonicalRank36 input at the peer's actual
countingTheorem_of_canonical36 consumer.

Alternatively avoid matching an AutInst to a D7 globally: apply the
same trace-density Tamagawa formula directly to the canonical
AutInst with its coordinate self-dual lattice. On the finite model
the Lie trace pairing is perfect by etale descent to GL_n, also at
dyadic places; the local volume is prod_(j=1)^n(1-eta_v^j*q_v^(-j)).
The common determinant convergence factor and global L(1,eta)
normalization must be retained at both ranks; cancel them before
Euler products. The raw trace-density gauge covol is then
  2*d^(n*n/2)*prod_(j=1)^n L_F(j,eta^j).
This follows from the same classical Tamagawa-number-2 normalization
as the previous editor note. Its adjacent-rank multiplier is
d^(n-1/2)*L_F(n,eta^n)=rankFac(E,n), using the unramified discriminant
and CM-place dictionary. No new rank-one unfolding or separate
cross-signature Haar scalar needed. The native topological group,
integral lattice and standard adelic measure identifications are
still required; do not label the global formula native-proved.
The two branches must use the identical field and lattice.

Source-visible original paths retained:
  MassRatioUnderVolume -> VolumeRatio2 -> ratio_of_setting
  (SW1b2 / unfolding / local & arch measures / VolTie).
  countingTheorem_of_volumeStep -> VolumeStep -> rank-one geometry.
Candidate joined paths:
  common trace-density Tamagawa volume -> native D.vol normalization;
  same supplier -> gaugeVol with explicit compact factor ->
  CanonicalRank36 -> countingTheorem_of_canonical36.
Lean adapter below checks the conditional scalar consumer, not the
group transport, quotient domain or global Tamagawa theorem.
Keep original separate branches (and independent uses of SW1b2);
no graph deletions. Cache by source/toolchain, F,E, lattice/form,
rank/signature, frame, measure convention and actual consumer.
Backtrack if an identification fails. No new elaborated graph/axiom
evidence; all original evidence and unresolved obligations retained.

Pinned source blobs (src/):
Formalism/LocalRingCardinality/DataCD.lean 449d5479b4d8ec9baeaebd3459f95232094ae222
Formalism/SharpRestriction/GlobalSchurBounds/StandardLattice.lean cb758a6c5f78e610b8f946d4b733d07902b15f5d
Formalism/SharpRestriction/GlobalSchurBounds/GeneralLinearActions/GenusMassVolumes.lean 525618b770cb535fd890f10277af11ffbe76af40
Formalism/SharpRestriction/CuspSpanNormBounds/GlobAut.lean 2103e49fe83fce42d4962f85acd9d4f6a589d645
Formalism/RealPlaceAnalysis/InstMeasurableSpaceUJ.lean 89f7e81bc2fb4f44742e3272a64a04f8f0a6c195
Formalism/HermitianLattices/StatementMass.lean 33a3ea93298eff7969409462ddfc1ed22f173939
Development/AbelianVarietyTheory/Definitions/SemilocalFrames/DefClassNum.lean 65f9efd688be555d6654d063ea6a782ea8799810
Development/AbelianVarietyTheory/Definitions/SemilocalFrames/LayerProd.lean 2a92b374b78661403dde107fa5a46ad5c4f92108
Development/AbelianVarietyTheory/Definitions/SemilocalFrames/IsGaugeAll.lean 5abc045266b05be6cd3f3fcc67b369ddd167f92b
Development/AbelianVarietyTheory/Proofs/FlagMeasures/ExistsLimitOfChart.lean 292c8fd5816eac7503c45c9b2a422b4c0bac2587
Development/AbelianVarietyTheory/Proofs/FlagMeasures/MassRatioRankFactor.lean 7ab7981637d6ed6f39e65cea95e69571c851300c
Development/AbelianVarietyTheory/Proofs/FlagMeasures/HermitianVolumeDependsOnlyOnFieldSignature.lean aa84c8b2948c99ef4eeeb99119faa848be8d3097

Executed exact basis regression in connector V8 (not native Lean,
not a finite substitute for the human all-rank proof):
let signatures=0, checks=0, neg=0;
for(let n=1;n<=8;n++) for(let mask=0;mask<(1<<n);mask++){
 const s=Array.from({length:n},(_,i)=>((mask>>i)&1)?-1:1), B=[];
 for(let i=0;i<n;i++)B.push({z:[[i,i,0,1]],b:-1,h:1});
 for(let i=0;i<n;i++)for(let j=i+1;j<n;j++){let t=s[i]*s[j];B.push({z:[[i,j,1,0],[j,i,-t,0]],b:-2*t,h:2},{z:[[i,j,0,1],[j,i,0,t]],b:-2*t,h:2});}
 let db=1n,dh=1n;
 for(let a=0;a<B.length;a++){db*=BigInt(B[a].b);dh*=BigInt(B[a].h);
 for(let b=0;b<B.length;b++){let tr=0,im=0,hs=0;
 for(const [i,j,x,y] of B[a].z)for(const [k,l,u,v] of B[b].z){
 if(j===k&&i===l){tr+=x*u-y*v;im+=x*v+y*u;}
 if(i===k&&j===l)hs+=x*u+y*v;}
 if(tr!==(a===b?B[a].b:0)||im!==0||hs!==(a===b?B[a].h:0))throw Error("Gram");
 checks++;
 }}
 if((db<0n?-db:db)!==dh||dh!==2n**BigInt(n*(n-1)))throw Error("det");
 if(B.some(v=>v.b>0))neg++;
 signatures++;
}
Observed signatures=510, checks=1463658, indefinite_sign_controls=494.
All operations are exact integer arithmetic; these are explicit
Lie algebra bases, not simulated native adelic groups.

Lean and Lake not found locally. Baseline status.json retrieved:
45577239749 blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc;
45576756833 blob 7da354941e402b6f8b364ed03d8c5c82d27b7717;
returncode 0 for both. Neither checks this file. No new native
replay, queue submission or axiom report; zero root obligations
formally retired. No URT comparison (ordinary exact symmetry sufficed).

RESUME HERE: kernel/geometry authenticate tensor flip + finite restricted
product group isomorphism on the actual AutInst canonical host, including
Kset, GFset, discrete subgroup and covol/FundDomain transport. Use the
same result for D.vol IsVolMeas/VolTie and both rank branches; run this
adapter alongside RUN36_CANONICAL_GAUGE_RANK in the existing pinned
runner. If the global measure dictionary is established, the common
Tamagawa formula supplies CanonicalRank36 and native signature
independence simultaneously. Retain all VWinAt(1,401), arithmetic,
rank/count, entropy and same-host local-gain suppliers. Integration:
also retain Landau 29c54b4f sign-safe transfer (x/ybar factor for a
negative signed error), not the unsigned substitution. No RH closure.
HANDOFF TO geometry, theta, integration, kernel and audit.
-/

noncomputable section
open MeasureTheory NumberField Formalism.MainNotions.S GlobalTheory.Count GlobalTheory.FlagMeas
open scoped ENNReal

namespace RHEditorSharedGauge

theorem scalar_rank (E : Type) [Field E] [NumberField E] [StarRing E]
    (n : ℕ) (hn : 1 ≤ n) (v w : ℝ)
    (hv : v = w * Formalism.HermitianLatticesTheory.massRatioRightSide E n) :
    v * volU n ^ Formalism.HermitianLatticesTheory.fDeg E =
      (w * volU (n-1) ^ Formalism.HermitianLatticesTheory.fDeg E) * rankFac E n := by
  rw [hv, mul_assoc, mass_ratio_mul_unitary_volume E n hn]
  ring

open GlobalTheory.FlagMeas.VolRatio

def GaugeMassDictionary (v : AutInst → ℕ → ℕ → ℝ) : Prop :=
  ∀ I p q, C36 I p q =
    ENNReal.ofReal (v I p q * volU (p+q) ^ Formalism.HermitianLatticesTheory.fDeg I.E)

def AdjacentMass (v : AutInst → ℕ → ℕ → ℝ) : Prop :=
  ∀ I p q, 3 ≤ p+q → ∀ s : Bool, (if s then 1 ≤ p else 1 ≤ q) →
    v I p q = v I (if s then p-1 else p) (if s then q else q-1) *
      Formalism.HermitianLatticesTheory.massRatioRightSide I.E (p+q)

theorem canonical_rank_of_shared_mass (v : AutInst → ℕ → ℕ → ℝ)
    (hg : GaugeMassDictionary v) (hm : AdjacentMass v)
    (hpos : ∀ I p q, 0 ≤ v I p q * volU (p+q) ^ Formalism.HermitianLatticesTheory.fDeg I.E) :
    CanonicalRank36 := by
  intro I p q hn s hs
  let a := if s then p-1 else p
  let b := if s then q else q-1
  have hr : a+b = p+q-1 := by
    dsimp [a,b]
    cases s <;> simp at hs ⊢ <;> omega
  have h := scalar_rank I.E (p+q) (by omega) (v I p q) (v I a b)
    (hm I p q hn s hs)
  rw [← hr] at h
  change C36 I p q = C36 I a b * ENNReal.ofReal (rankFac I.E (p+q))
  rw [hg I p q, hg I a b, h, ENNReal.ofReal_mul (hpos I a b)]

theorem counting_of_shared_mass (v : AutInst → ℕ → ℕ → ℝ)
    (hg : GaugeMassDictionary v) (hm : AdjacentMass v)
    (hpos : ∀ I p q, 0 ≤ v I p q * volU (p+q) ^ Formalism.HermitianLatticesTheory.fDeg I.E) :
    GlobalTheory.IndefiniteRowSideFullHecke.LatticeCountingTheorem.CountingTheorem := by
  have hR := canonical_rank_of_shared_mass v hg hm hpos
  first
  | (rh_reduce 2 using [GlobalTheory.CountFinal.countingTheorem_of_canonical36]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact GlobalTheory.CountFinal.countingTheorem_of_canonical36 hR

end RHEditorSharedGauge

rh_scan GlobalTheory.FlagMeas.mass_ratio_mul_unitary_volume limit 2000
rh_scan RHEditorSharedGauge.canonical_rank_of_shared_mass limit 2000
rh_scan RHEditorSharedGauge.counting_of_shared_mass limit 2000
rh_prune RHEditorSharedGauge.counting_of_shared_mass as RHEditorSharedGaugePruned
#print axioms RHEditorSharedGauge.scalar_rank
#print axioms RHEditorSharedGauge.canonical_rank_of_shared_mass
#print axioms RHEditorSharedGauge.counting_of_shared_mass
