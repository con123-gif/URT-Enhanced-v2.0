import Development.AutomorphicArithmetic.AutomorphicVarieties.GeneratorCountTuples.LemmaKOfPublished
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN37 literature provenance, 25 Nov 2026. Human classical supplier and PREPARED
Lean adapter; NOT COMPILED. RH OPEN. Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4,
SWARM, HANDOFF, EXPANSION, AGENTS, continuity and living proof 10e3d636 consulted.
Peer RUN39 79428d5bc2f65eed0f1df19cbf40a481a772f424 weakens KBridge to a power-image
cardinality; this supplies a classical construction of the witness itself.
Also read latest c55df0a0, f2bb1e4b, 2235982d, 8eef4b8a, 678de808 peer results.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; latest observed 2caf4fd16ee59eb56ad8b6a605461837969900c4 not substituted.

For all native hypotheses of KBridge (totally complex L, HasMuQ l L, e>=1),
put X=H^2(G_S(L), Z_l(e+1)), T=tors H_{2e}(GL_{4e+4}(O_L),Z).
Classical argument: X finite and |l^(e+3) X| <= |T_l|. In particular,
log |X| <= (e+3) log |X/l X| + log |T_l|.
This supplies the peer power-image interface with the stronger exponent,
and the original KBridge, not just a restatement of either.

1. Use RUN35 source-matched identification of GS, cyclotomic action,
continuous cochains and inverse limits. S contains all l-primes. HasMuQ
implies finite coefficient cyclotomic action factors through a pro-l
quotient (at 2, units modulo powers of 2 form a 2-group). Schmidt,
Rings of integers of type K(pi,1), Prop 2.3 and proof p6,
https://www.mathi.uni-heidelberg.de/~schmidt/papers/kpi1.pdf ,
identifies both pro-l and full GS cohomology with etale cohomology in
this wild case. No real-place correction because L totally complex.
H^1 finite at every finite coefficient level by finite splitting field,
S-unit and class-group finiteness; ML kills lim^1. Thus native H2 is
continuous etale H2. This comparison is mathematical, not yet formalized.

2. Weibel, Algebraic K-theory of rings of integers in local and global
fields, Thm 70 p168 (odd l), https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/weibel-ints.pdf ;
Kahn, The Quillen-Lichtenbaum conjecture at the prime 2, Thm 1 p2,
https://webusers.imj-prg.fr/~bruno.kahn/preprints/QL2.pdf (r1=0),
supply K_{2e}(O_L[1/l]) tensor Z_l isomorphic to X. Localization at
l changes no l-primary part: the adjacent finite-field K-groups
have order prime to l (Quillen; positive even groups vanish).
Quillen finite generation and Borel rank zero in positive even degree
give K=K_{2e}(O_L){l} finite. Hence comparison supplies an isomorphism
p:K -> X of finite Z_l modules. No field extension in the bound.

3. Quillen plus construction identifies the positive-degree K-groups
with pi_* of the connected infinite loop space BGL(O_L)^+ and its
integral homology with stable GL homology. Mathew, Torsion exponents
in stable homotopy and the Hurewicz homomorphism, AGT 16 (2016),
Thm 6.3 (arXiv:1501.07561v2 p10), https://arxiv.org/pdf/1501.07561 ,
bounds the prime exponent of the unstable Hurewicz kernel on an
(m-1)-connected infinite loop space in degree n. Set m=1, n=2e.
At l=2 the exponent is <= ceil((2e-1)/2)+3=e+3.
At odd l it is <= ceil((2e+2)/(2l-2))+1 <= e+3.
Thus l^(e+3) kills the kernel restricted to K. Do NOT substitute the
stable Hurewicz map of the spectrum for the unstable space map.

4. Integral GL homology stability (van der Kallen, Homology stability
for linear groups, Invent Math 60 (1980), DOI 10.1007/BF01390018)
for Dedekind rings of Bass stable rank <=2 gives the conservative
range N>=2i+4, so N=4e+4 in degree i=2e suffices. Bibliographic
record and independent native statement checked:
https://andrewodesky.com/rh/lean/PositivityTheory.v8.KStability.kStability/
The original 1980 theorem page has NOT been independently inspected
in this run; exact stability range is an external audit item.
Invert the stabilization isomorphism and use Hurewicz to define
h:K -> Z_l tensor H_{2e}(GL_{4e+4}(O_L),Z).
Tensor is flat over Z and faithful on finite l-primary groups, so no
additional kernel on the l-primary image; h is Z_l-linear. Its image
lies in T_l after the canonical finite primary identification.
Multiplication by l^(e+3) on p(K) factors through im h. Therefore
|l^(e+3)X| <= |im h| <= |T_l|. Exact quotient cardinality and filtration
give the displayed log inequality. No conjectural input or RH assumption.
The native cOne(2e)=e(2e+5) is >= e+3, hence the same witness meets KBridge.
PT/local and native torsMain remain separate inputs to lemmaK.

Sources (all upstream at pin, relative to GeneratorCountTuples):
Bridge.lean c995485ab93aa56e1eabbdd1900429075fb4c65b; Reduction.lean 1cfb92c81ec5c4ed77aac5a7cce457add1e55721;
LemmaKOfPublished.lean 82044f2422c5b48970bd94223e33087a7896fc40;
CardRed.lean 687dc64db008616c2c378cf471f7d233db5ff9ec;
TensCard.lean 674a872e24da91062c9d648b683a7a7502d37367;
TorsBoundPow.lean 3552e823716da4241d053c2cdfe0a116039e7886.
RUN35 native cochain source ledger 0a93c337ffc6a3476d6a5c2326b473744b891268 retained.
Original graph lemmaK -> lemmaK_of -> reduction -> KBridge, cardRed,
tensCard, generators; also torsMain and numFin. Candidate replaces
KBridge supplier by LinearBridge37 -> bridge_of_linear37, with external
comparison, finiteness, Mathew and stability prerequisites explicit.
No original edges deleted, no global proof closure. Context key
source/toolchain, L,l,e,D,GS,S,coefficient topology, GL rank, degree.
Actual execution: exact source extraction and 2 string replacements;
20000 odd-prime exponent checks and 2000 native exponent comparisons
in JS (integer range regression only; general inequalities above).
Mathew, Kahn, Weibel and Schmidt theorem/proof pages inspected.
Baseline CI status blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 actually retrieved; returncode 0
for runs 45577239749/45576756833 only. No new native output. No URT claim.
RESUME HERE: independently confirm van der Kallen integral stability range,
formalize GS/etale and QL comparisons and Hurewicz kernel in actual host;
compile this adapter in pinned native batch, compare actual KBridge producer
and axiom ledger. Propagate only verified substitutions to RUN39 and
lemmaK; retain all remaining arithmetic, dyadic, minus, geometry and RH
window obligations. HANDOFF TO integration, prime, Galois, kernel, audit.
-/

noncomputable section
open NumberField IsDedekindDomain ReciprocityTheory.Gal Formalism.ConjugateSelfDual Formalism.GaloisCohomology
open scoped TensorProduct
namespace UpperTheory.V.K

def LinearBridge37 : Prop :=
  ∀ (l : ℕ) [Fact l.Prime] (L Ω : Type) [Field L] [NumberField L] [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω]
    (D : LData L Ω l), IsTotallyComplex L → HasMuQ l L → ∀ e : ℕ, 1 ≤ e →
      ∃ (K : Type) (_ : AddCommGroup K) (_ : Module ℤ_[l] K) (_ : Finite K)
        (p : K →ₗ[ℤ_[l]] H2 (zlTw D ((e : ℤ) + 1)))
        (h : K →ₗ[ℤ_[l]] ℤ_[l] ⊗[ℤ] HGL L (4 * e + 4) (2 * e)),
        Function.Surjective p ∧ ∀ x, h x = 0 → (l : ℤ_[l]) ^ (e + 3) • x = 0


theorem bridge_of_linear37 (hK : LinearBridge37) : KBridge := by
  intro l _ L Ω _ _ _ _ _ D hL hμ e he
  obtain ⟨K, _, _, _, p, h, hp, hh⟩ := hK l L Ω D hL hμ e he
  refine ⟨K, _, _, _, p, h, hp, ?_⟩
  intro x hx
  have hc : e + 3 ≤ cOne (2 * e) := by
    have H := two_mul_cOne (2 * e)
    nlinarith [Nat.mul_le_mul_left e he]
  obtain ⟨d, hd⟩ := Nat.exists_eq_add_of_le hc
  rw [hd, Nat.add_comm (e + 3) d, pow_add, mul_smul, hh x hx, smul_zero]

theorem lemmaK_linear37 (hP : GlobalTheory.Published.PoitouTateDuality)
    (hF : LocalFinitenessK) (hT : LocalTateDualityK) (hK : LinearBridge37) :
    ∃ CK : ℝ, 0 < CK ∧ LemmaK CK := by
  exact lemmaK hP hF hT (bridge_of_linear37 hK)

theorem replay37 (hP : GlobalTheory.Published.PoitouTateDuality)
    (hF : LocalFinitenessK) (hT : LocalTateDualityK) (hK : LinearBridge37) :
    ∃ CK : ℝ, 0 < CK ∧ LemmaK CK := by
  first
  | (rh_reduce 2 using [lemmaK_linear37]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact lemmaK_linear37 hP hF hT hK
end UpperTheory.V.K
rh_scan UpperTheory.V.K.lemmaK limit 2000
rh_scan UpperTheory.V.K.lemmaK_linear37 limit 2000
rh_prune UpperTheory.V.K.replay37 as RH37LinearBridgePruned
#print axioms UpperTheory.V.K.lemmaK
#print axioms UpperTheory.V.K.bridge_of_linear37
#print axioms UpperTheory.V.K.lemmaK_linear37
end
