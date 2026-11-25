import Development.AutomorphicArithmetic.AutomorphicVarieties.HeightAndVanishing.CountVs
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN33 — principal shallow weight-one CountVs at 7: remove the cyclotomic
extension before taking a K2 norm. Human source-matched literature
reduction; native adapter PREPARED, NOT COMPILED.

Mission: latest ONE_EQUATION_MISSION.md blob cd0a176134d46b5b624896e56843a24915c14477
(update 60892061194daf74d250cd8fa95cb79d04432793); lane 9. Read prior
RUN32, RUN28, protocols, handoff, AGENTS, continuity, manuscript
464e82f81f646d4af85e1f5f70d379026df46261, latest peer commits including
259672cc, 2df8b6cc, 4e8fb668, 8b54a1ab, 6ee9b256, 3044c307, 7e4677d9,
88aa566b, 0cf4b3fb, 3e1000ef, fdb0ad7a, 0e1b92ab, a910af41.
Builds on fixed-degree principal reduction 77abd181; not a duplicate:
changes the supplier of the bound, not just its exponent.

Actual source branch (not a freshly invented RH criterion):
vwin_of_hypotheses_H_E_alt -> HV.Core.of_four_alt -> vwin_of_counts ->
jointWin_of_counts -> thmHV_of_counts -> pointHV_of_counts ->
sumIn ... (countVs hP hF hT CK hK) ...
Original local supplier: vsField -> HasMuQ -> Win.klen (LemmaK) ->
shaLeV + Chr.upV + H0 bound + normalized length.
Replacement for principal, l=7, shallow, e=1 ONLY:
character field -> Tate degree-2 comparison + Emery -> same consumer
with a singleton generating set. Other consumers of LemmaK, including
ThmBab, CountI and other weight/prime sectors, are NOT removed.

Fix any native principal host h, N=h.N, psi in h.X c 1 and
the native shallow condition 2^c2(psi) < h.R1 7 psi.
The odd parity is psi(-1)=-1 (Host.mem_X); order divides
2^(h.ex+1)*h.o by hostComp, with h.o=h.q=1 for principal.
Choose F=Q(zeta_N)^(ker psi), embedded in the given algebraic
closure. Its Galois group is the image of the character, a finite
cyclic subgroup of the multiplicative group of a characteristic-zero
field, of order d=ord psi. Thus d is an even power of two and
F is totally imaginary (complex conjugation is not in the kernel;
abelian implies no real embedding). The field is unramified outside
N, its conductor divides N, and |disc F| <= N^d by the
conductor-discriminant formula (also the native Win.disc bound).
vsOrd gives d <= D*=32*7^6 = 3764768 independent of host/coef;
no need to assume the sharper dyadic cutoff of the manuscript.
Since 6=[Q(zeta_7):Q] cannot divide d, 7 does not divide w_F,
the number of roots of unity in F. Also 7 does not divide 6.
This is the crucial change: the ORIGINAL vsField requires HasMuQ,
so its w_L is divisible by 7 and Emery's bound cannot control
the very component in question. Do not apply the bound to that field.

Emery Theorem 1.3 (arXiv:1303.6132v2 p.2):
log |K2(O_F) tensor Z[1/(6w_F)]|
 <= C(d) |disc F|^2 (log |disc F|)^(d-1)
for totally imaginary degree d>=2 even. The complete 7-primary
subgroup survives this localization. Since d ranges over finitely
many possibilities, C* can absorb the maximum of C(d)d^(d-1);
with N>=2, log N<=N, this is <= C* N^(3D*).
No uniform-in-degree estimate is claimed or needed.
Localization at primes above 7 gives K2(O_F){7} =
K2(O_F[1/7]){7}: K2 of finite fields is zero and the residue
unit groups have orders 7^f-1 prime to 7.
Tate's theorem (Weibel survey Theorem 4, p.145) identifies this
full primary group with H^2_et(O_F[1/7], Z_7(2)).
The degree-2 comparison to continuous G_{F,S} cohomology for S
the primes above 7 uses the standard arithmetic etale K(pi,1)
comparison (requires a native-to-classical bridge in Lean).
LData.hS, hchi and zlTw in Statement.lean match precisely this
S and twist +2, with no real places. Hence, in ordinary arithmetic
with that comparison, m=VLen D 1 is finite and
    m log 7 = log |K2(O_F){7}| <= C* N^(3D*).
The equality is composition length over Z_7, not residual rank.

The existing Chr.upV accepts ANY abelian field with galOf <= ker
(dirG psi); it does not ask for HasMuQ. The chosen field has
this inclusion by construction. Use a singleton T consisting of a
generator of the cyclic Galois group. PropA.shaLeV retains its
three explicit duality/finiteness premises, with PTCase because 7
is odd; the native H0 bound and DVR normalization are unchanged.
The adapter below proves the source-level conditional reduction:
    Vn(psi) log 7 <= m log 7 + nuBound(7,N,1) log 7.
Using the native lossLe bound nuBound <= 2N (same N>=2)
gives <= C* N^(3D*) + 2N log 7 <= (7N)^A for a fixed
integer A, chosen before all hosts and characters. This meets the
actual CountVs pointwise bound in this sector and controls full
primary length, not only dimension. If 7 divides N, no coprimality
shortcut is necessary. At l=3 Emery still removes 3 regardless
of field; retain original supplier there. At e>1 this is not
a K2 calculation; at unbounded degree the uniform exponent fails.

Assumption/provenance ledger:
- hP: GlobalTheory.Published.PoitouTateDuality, hF:
  LocalFinitenessK, hT: LocalTateDualityK are explicit hypotheses
  in the native conditional consumer, not discharged by names.
  HVFinalU.pt_s is a wrapper of normalized hN.coh.pt; lfK,ltK
  are structure projections, not automatic proofs of existence.
- LemmaK and CountVs are propositions. klen, vsField, upV,
  shaLeV, countVs, pointHV_of_counts have theorem bodies;
  no kernel assertion of their transitive axiom sets here.
- External suppliers are established literature theorems:
  Vincent Emery, Torsion homology of arithmetic lattices and K2
  of imaginary fields, Theorem 1.3 p.2,
  https://arxiv.org/pdf/1303.6132 ;
  C. Weibel, Algebraic K-Theory of Rings of Integers in Local
  and Global Fields, Theorems 4 and 7, pp.145-146,
  https://sites.math.rutgers.edu/~weibel/papers-dir/KZsurvey-published.pdf .
  Both exact theorem pages inspected. Theorem 4 is Tate's
  degree-2 result, no need to assume general Quillen-Lichtenbaum.
  The finite-field localization and conductor-discriminant
  arguments are classical; native formal construction of F,
  singleton generation and etale/Galois/K2 comparison remain
  explicit unverified bridge obligations. Not importing RH.
- Do not conflate standard external theorems with native kernel
  proof. The adapter does not assert the external comparison or
  the field witness as an axiom; they are premises to be supplied.
- Cache key: pin, host, N, psi incl kernel and coefficient ring,
  prime, e, chosen field and LData; never reuse a bound from
  vsField containing mu_7. Backtrack to original CountVs if
  comparison or field construction cannot be authenticated.

Source pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Under src/Development/AutomorphicArithmetic/AutomorphicVarieties/:
HeightAndVanishing/CountVs.lean 3b29717c74e14806d898cbbf9f96417396a2d37d
HeightAndVanishing/VsField.lean b6ce23de6b5c75a4e25b22df26dbb5cbecde343f
HeightAndVanishing/PowTotientConductor.lean d900b5167f2744c9a3b629ae89cc22660fde537b
HeightAndVanishing/HostComp.lean 2d9c083608be97d265cfd899214f7a4adf392ba2
HeightAndVanishing/DirichletPrimeToLPartMulLPowerPart.lean 1feb420e376868ca41d85fb09bc4f8c7ee66778e
HeightAndVanishing/Counts.lean 0d9f87aacf2d53abe43d894c1d822f071599ee57
HeightAndVanishing/JointWinOfCounts.lean 2f86e49421d870aa158af11ad1388da80b5d70d1
HeightAndVanishing/LossLe.lean 429f8d193140c4091103bdaeb09bfdd974b81edb
CharacterLevelBounds/LiftGens.lean 41897884461cf6ab6317ee62923390c28078465f
CharacterLevelBounds/H0LocalCardBoundedOfClsKerLeKer.lean c603fa4d3e5ba03d4ab5c0987fa962ae086e3f51
AdditiveValuationNorms/ShaLeV.lean 6af293f1ba30d7aab77ac39a9fa5a3524b1cc434
GeneratorCountTuples/LemmaK.lean 8726ea4259cd1f0fcb350eca97a3be2478261c87
LayeredIsomorphisms/Klen.lean 8d11cf66702190df2c12069a790cd8c29e43a37f
ModularityArgument/ThresholdArguments/DenseThresholdCases/HVCore.lean f4b900eb48df14f16eea03d08b7d9ef077f3d4a1
ModularityArgument/ThresholdArguments/DenseThresholdCases/HVFinalU.lean 03a1a89bfd216d404766ac95c0a6c6e11e307b0c
ModularityArgument/ThresholdArguments/DenseThresholdCases/WindowBoundOfLiteratureLevel.lean 01c499108485b16d33791a9e46fbb1e2af865522
src/Formalism/GaloisCohomology/Statement.lean 0799e9bcd8aa191ffaa90ab005453a53381bacea
src/ReciprocityTheory/Hypotheses/GalCoh.lean a4e5044d290790dfc54db004228d49cd9fdb77e5
Upstream latest listed d91ae2678eea19a0c3045ffca37f1da757c2e719,
unchanged from previous recorded observation; all source work pinned.

Actual execution: local shell found no lean, lake or elan.
Python checked native vsOrd numerical upper bound and all 21
possible dyadic degrees (2 through 2^21): none divisible by
6 or 7. Reproduce:
    D=32*7**6
    ds=[2**j for j in range(1,D.bit_length()) if 2**j<=D]
    assert D==3764768 and len(ds)==21 and ds[-1]*2>D
    assert all(d%6 and d%7 for d in ds)
This is arithmetic only, not a test of Selmer groups or RH.
Retrieved historical CI status files, branch cathedral-research-state:
45577239749 returncode 0, 98.87s (conditional half-strip root);
45576756833 returncode 0, 77.94s (engine prune).
Their status blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717; not new adapter
evidence. No PASS claimed for this run's Lean candidate. Native
scan/prune/reduction commands below queued for actual replay;
original and reduced graphs recorded above, no invented axiom output.

RESUME HERE: construct the native F=Q(zeta_N)^ker(psi) witness,
prove its cyclic generator, verify the Tate comparison with LData
on the pinned kernel, and replay the adapter and CountVs consumer.
Look for an independent small-prime-3 estimate (Emery cannot
supply it); do not spend time further optimizing the 7-sector
unless integration requires it. Keep all original unresolved leaves.
RH, prime-window lower bound and native verification remain open.
-/

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual Formalism.HC
  ReciprocityTheory.Gal Formalism.GaloisCohomology UpperTheory.V
  UpperTheory.V.Base UpperTheory.Top UpperTheory.V.HV

namespace RHCharField33

-- Identical normalization lemma from pinned CountVs.
private theorem nrm_le (l : ℕ) [Fact l.Prime] (O : Type) [CommRing O]
    [Algebra ℤ_[l] O] (hT : eO l O ≠ ⊤)
    (a : ℕ∞) (m : ℕ) (h : a ≤ (m : ℕ∞) * eO l O) :
    a ≠ ⊤ ∧ Chr.nrm l O a ≤ m := by
  obtain ⟨k, hk⟩ := ENat.ne_top_iff_exists.1 hT
  rw [← hk] at h
  have hmk : (m : ℕ∞) * (k : ℕ∞) = ((m * k : ℕ) : ℕ∞) := by push_cast; rfl
  rw [hmk] at h
  have ha : a ≠ ⊤ := ne_top_of_le_ne_top (ENat.coe_ne_top _) h
  refine ⟨ha, ?_⟩
  lift a to ℕ using ha
  have h' : a ≤ m * k := by exact_mod_cast h
  unfold Chr.nrm
  rw [← hk]
  simp only [ENat.toNat_coe]
  rcases Nat.eq_zero_or_pos k with hk0 | hk0
  · simp [hk0]
  · rw [div_le_iff₀ (by exact_mod_cast hk0)]
    exact_mod_cast h'

-- Actual CountVs inner consumer with its supplier weakened to the
-- chosen field's finite weighted length, not universal LemmaK.
theorem vle_of_field_length
    (hPT : GlobalTheory.Published.PoitouTateDuality)
    (hLF : LocalFinitenessK) (hLT : LocalTateDualityK)
    (Ω : Type) [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω]
    (L : Type) [Field L] [NumberField L] [Algebra L Ω]
    [IsScalarTower ℚ L Ω] [IsAlgClosure L Ω] [IsAbelianGalois ℚ L]
    (l : ℕ) [Fact l.Prime] (hl2 : l ≠ 2) (c : Coef l)
    (N : ℕ) [NeZero N] (ψ : DirichletCharacter c.O N)
    (D : LData L Ω l) (hgal : galOf ℚ L Ω ≤ (Chr.dirG ℚ Ω ψ).ker)
    (T : Finset (L ≃ₐ[ℚ] L)) (hT : Subgroup.closure (T : Set (L ≃ₐ[ℚ] L)) = ⊤)
    (m : ℕ) (hm : VLen D ((1 : ℕ) : ℤ) = m) (B : ℝ)
    (hB : (m : ℝ) * Real.log l ≤ B) :
    VLe Ω c 1 ψ (B + (T.card : ℝ) *
      (LDataCardLeFinrank.nuBound l N 1 : ℝ) * Real.log l) := by
  classical
  haveI := c.dvr
  haveI := c.fin
  have hclsker : (Chr.cls ℚ Ω N).ker ≤ (Chr.dirG ℚ Ω ψ).ker := by
    intro σ hσ
    rw [MonoidHom.mem_ker] at hσ ⊢
    simp [Chr.dirG, hσ]
  have hsha : shaLen D ((1 : ℕ) : ℤ) ≤ VLen D ((1 : ℕ) : ℤ) := by
    first
    | (rh_reduce 2 using [PropA.shaLeV]; done)
    | (rh_auto 2; done)
    | exact PropA.shaLeV hPT hLF hLT L Ω l (Or.inl hl2) D _
  have hup := Chr.upV ℚ Ω L l c.O D 1 (Chr.dirG ℚ Ω ψ) hgal T hT
  have hh0 := (Chr.H0_local_card_bounded_of_cls_ker_le_ker Ω l c.O N 1
    (Chr.dirG ℚ Ω ψ) one_ne_zero hclsker).2
  have heO : eO l c.O ≠ ⊤ :=
    ne_top_of_le_ne_top (ENat.coe_ne_top _) (dvrFacts l c.O).2.2.2.2.2.2.1
  have hV : Vlen Ω c 1 ψ ≤
      ((m + T.card * LDataCardLeFinrank.nuBound l N 1 : ℕ) : ℕ∞) * eO l c.O := by
    calc
      Vlen Ω c 1 ψ ≤ Chr.V l 1 (Chr.dirG ℚ Ω ψ) :=
        Chr.V'_le_V (k := ℚ) (Ω := Ω) l N 1 (Chr.dirG ℚ Ω ψ)
      _ ≤ _ := hup
      _ ≤ VLen D ((1 : ℕ) : ℤ) * eO l c.O + (T.card : ℕ∞) *
          ((LDataCardLeFinrank.nuBound l N 1 : ℕ∞) * eO l c.O) := by gcongr
      _ = _ := by rw [hm]; push_cast; ring
  obtain ⟨hne, hnrm⟩ := nrm_le l c.O heO _ _ hV
  refine ⟨hne, ?_⟩
  have hl1 : (1 : ℝ) ≤ l := by exact_mod_cast (Fact.out : l.Prime).one_lt.le
  have hy : 0 ≤ Real.log (l : ℝ) := Real.log_nonneg hl1
  have hv : Vn Ω c 1 ψ ≤ ((m + T.card * LDataCardLeFinrank.nuBound l N 1 : ℕ) : ℝ) := hnrm
  calc
    Vn Ω c 1 ψ * Real.log l ≤
        ((m + T.card * LDataCardLeFinrank.nuBound l N 1 : ℕ) : ℝ) * Real.log l :=
      mul_le_mul_of_nonneg_right hv hy
    _ = (m : ℝ) * Real.log l + (T.card : ℝ) *
          (LDataCardLeFinrank.nuBound l N 1 : ℝ) * Real.log l := by push_cast; ring
    _ ≤ _ := add_le_add_right hB _

end RHCharField33

rh_scan UpperTheory.V.HV.countVs limit 2000
rh_scan UpperTheory.V.Chr.upV limit 2000
rh_scan RHCharField33.vle_of_field_length limit 2000
rh_prune RHCharField33.vle_of_field_length as run33_field_length_pruned
#print axioms UpperTheory.V.HV.countVs
#print axioms UpperTheory.V.Chr.upV
#print axioms UpperTheory.V.PropA.shaLeV
#print axioms RHCharField33.vle_of_field_length
