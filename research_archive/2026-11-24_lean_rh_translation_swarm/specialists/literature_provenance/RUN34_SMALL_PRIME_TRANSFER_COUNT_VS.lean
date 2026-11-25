import Development.AutomorphicArithmetic.AutomorphicVarieties.HeightAndVanishing.CountVs
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN34 — full CountVs bounded-degree weight-one supplier, INCLUDING prime 3.
25 Nov 2026; literature lane 9. Human proof, source-matched adapter PREPARED
NOT COMPILED. New native obligations retired: 0. RH OPEN.

MISSION cd0a176134d46b5b624896e56843a24915c14477; source pin
40e56bab026552e089d7afcfeff08d2defb9c005. Latest upstream listing
91b273530883b723ef4422436e0dc3557749325a (changed since RUN33);
do not mix source revisions. Latest peer checkpoints inspected:
22dbf375 finite cohomology support, 2d051914 actual division bridge,
90346486 trace multiplicity, a1fb4b0e orbitwise trace ideals. RUN33
f8e82b3ab8906a237996078265cf62c1f38293d8 only controls 7 via Emery
2014 and a changed field; this instead retains the ORIGINAL vsField
witness and covers all odd primes of the shallow weight-one branch
for every fixed base character, not only the principal case.

Compact proof block for integration:
For any fixed positive degree d, let F be a number field of degree d,
R=O_F, D_F=|disc F|, G=GL_5(R), and U a free complement of the finite
roots of unity in R^*. Let Gamma=ker(SL_5(R)->SL_5(R/3R)).
The subgroup H=Gamma x U of G (second factor scalar matrices) is
normal: Gamma is normal in G and scalar matrices central. Its factors
intersect trivially because u^5=1 in torsion-free U implies u=1.
Gamma is torsion-free by Minkowski's principal-level-3 lemma applied
to the integral regular representation into GL_(5d)(Z).
Its index J=[G:H] is at most
    w_F * 5^(d-1) * 3^(25d),
since det(H)=U^5, SL_5(R) meets H in Gamma and the reduction image has
at most |R/3R|^25 elements. Dirichlet units gives rank U<=d-1;
phi(w_F)<=d, so w_F bounded in fixed d (e.g. <=2d^2).
This also works when 3 divides w_F or J; DO NOT invert J.

The contractible symmetric space X for the archimedean SL_5 has no
Euclidean factor. Gamma is an arithmetic lattice, nonuniform since
SL_5 is F-isotropic, with free action (finite stabilizers plus
torsion-free). Prasad's volume formula, split hyperspecial case,
gives covolume of SL_5(R) bounded by c_d D_F^12: exponent
(5^2-1)/2=12, and prod_{j=2}^5 zeta_F(j)<=prod zeta(j)^d.
Gamma has bounded index, and finitely many signatures per d.
Gelander Theorem 1.5(1) supplies a finite simplicial K(Gamma,1)
with O_d(D_F^12) vertices and bounded vertex valence; thus all
simplex counts in degrees <=3 are O_d(D_F^12). Cross with the
rank-U torus to get a finite K(H,1). By the Kunneth formula and
the integral simplicial boundary matrices (columns have at most
q+2 entries +/-1 for boundary in degree q+1), Hadamard/Gabber
bounds log |tors H_2(H,Z)| by O_d(D_F^12), and b_i(H,F_p)
by O_d(D_F^12), i=0,1,2, uniformly for every prime p.
The determinant bound follows by taking independent columns of
the boundary matrix: their lattice index in its saturation
bounds the torsion of the boundary cokernel, hence bounds
torsion in homology. The torus homology is free, so Kunneth
does not introduce new torsion except copies of existing torsion.

For Q=G/H finite of order J, the mod-p Lyndon-Hochschild-Serre
homology spectral sequence has E2_{a,b}=H_a(Q,H_b(H,F_p)).
The bar chains have dimension <= J^a b_b(H,F_p). Hence
    b_2(G,F_p) <= sum_{a+b=2} J^a b_b(H,F_p) = O_d(D_F^12).
Integral LHS likewise gives finite generation of H_2(G,Z).
By universal coefficients, d_p=dim_Fp(T_G/pT_G) <= b_2(G,F_p),
where T_G=tors H_2(G,Z). Transfer tr:H_2(G,Z)->H_2(H,Z)
satisfies inclusion_* tr=J id. On T_G{p}, the kernel is killed by
p^v_p(J), hence has order <= p^(v_p(J)*d_p) by the structure
theorem for finite abelian groups. Image lies in T_H{p}.
Thus EXACT small-prime-inclusive inequality
    |T_G{p}| <= |T_H{p}| p^(v_p(J) b_2(G,F_p)).
This is the key replacement of prime-excluding transfer. In
particular no finite-index division assumption at 3. Summing
log over p gives log |T_G| <= log|T_H| + B log J,
B=max_{p|J} b_2(G,F_p) (take 0 for J=1). Thus O_d(D_F^12).

By Arlettaz Hurewicz injectivity on odd torsion at degree 2 and
Maazen/van der Kallen homological stability at matrix size 5,
K2(R){p} injects into T_G{p} for EVERY odd p, including 3.
Therefore
    log |K2(O_F)_odd| <= C_d D_F^12.
Unlike Emery 2014 or 2024 bounds localized away from small primes,
the proof above retains them through bounded-index transfer kernel
and mod-p LHS, and splits off the free units before taking norms.
This is our derivation using published inputs, not a quotation of
a published small-prime-inclusive bound. No conjectural inputs.

At actual CountVs: source fixes base chi and chooses M=sup Bchi,
n0=2 ordC(chi)*(16 ordC(chi)*(M chi.N)^2*M^(2 phi(4 ordC(chi))))*M,
BEFORE all hosts, l, coefficients, and e. CaseV forces e=1;
vsOrd and vsField give original L degree <= n0 and embedding into
Q(zeta_(l*N)), N=h.N>=2. Hence D_L <= (l*N)^degree by conductor-
discriminant (native Win.disc); no new field, generator or fixed
prime choice. Constants C_d for d<=n0 can be maximized once.
Tate degree-2 theorem and localization at primes above l give
K2(O_L){l} = H^2_et(O_L[1/l], Z_l(2)) (finite residue multiplicative
groups at l have prime-to-l order). Native D.hS selects those
places, D.hchi gives the cyclotomic action, and VLen D 1 is length
of H2(zlTw D 2). Subject to the explicit etale-to-native continuous
Galois comparison, VLen D 1=m finite and
    m log l = log|K2(O_L){l}| <= C_(<=n0)*(l*N)^(12 n0).
Use log l >= log 3 > 1, l*N>=6, choose integer A>=12*n0
absorbing the finite constant independently of hosts and l.
This proves the numerical BoundedWeightOne interface in ordinary
mathematics given the comparison. Retain original ShaLeV, Chr.upV,
H0 local budget and lossLe. The adapter below is an exact overlay
of the pinned countVs, replacing only universal LemmaK with this
bounded-degree supplier. It gives the COMPLETE CountVs conclusion
conditionally, not only a 3-sector; no general degree-uniform or
higher-weight LemmaK assertion. Other LemmaK consumers remain OPEN.

External assumption ledger:
* Gelander, Duke Math J 124 (2004), Theorem 1.5(1), p.3 of
  https://arxiv.org/pdf/math/0111165 (the theorem page inspected):
  only the noncompact arithmetic case used, not conjectural compact
  case. Uniform constants depend on fixed symmetric space.
* Emery, Manuscripta Math 175 (2024), sec 2.3, Prop 2.2,
  https://doi.org/10.1007/s00229-024-01598-4 :
  quotes Arlettaz (1991) and Maazen stability via van der Kallen
  Theorem 4.11, with N>=2n+1, prime p>(n+1)/2. At n=2 all odd
  primes qualify. Sec 3.3 eq (3.4) and Prasad (1989) Thm 3.7
  support the split SL covolume formula; bound zeta_F(j) by
  zeta(j)^d, not a degree-independent zeta bound.
  Emery Remark 4.3 about general signature is not invoked as
  theorem: our finite-index direct product eliminates that
  particular infinite-unit spectral-sequence obstruction.
* Weibel, Algebraic K-Theory of Rings of Integers in Local and
  Global Fields, Thm 4 p.145, Theorem 6 and localization Thm 7,
  https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/weibel-ints.pdf
  (Tate page inspected; RUN33 old URL now 404). Native arithmetic
  etale K(pi,1) and comparison of continuous cohomology definitions
  remain to be checked; no claim they have been formally proved.
* Standard Minkowski torsion-free lemma, Dirichlet units, universal
  coefficient, finite-index transfer, LHS, Kunneth and finite abelian
  group structure used as named established results; no conjecture.
* Native hPT,hLF,hLT remain explicit hypotheses, not discharged by
  names. Source hK was a premise, klen and countVs are theorem bodies.
  BoundedWeightOne is a Prop, not an axiom; replacement theorem
  explicitly assumes it. No native proof of that Prop is claimed.
* Old source edge countVs->Win.klen->LemmaK is replaced only in new
  adapter by BoundedWeightOne; other edges to vsOrd, vsField,
  ShaLeV, upV, H0, lossLe, nrm, final scalar inequality retained.
  Consumer pointHV_of_counts->sumIn still needs a checked substitution.
  Preserve original graph, all other consumers and all unresolved
  axioms. Cache key (pin, fixed base chi,n0, host,N,l,L,D,weight=1).
  Do not reuse this fixed-degree constant in growing-degree branches.

Pinned source blob ledger under src/Development/AutomorphicArithmetic/
AutomorphicVarieties/:
HeightAndVanishing/CountVs.lean 3b29717c74e14806d898cbbf9f96417396a2d37d
HeightAndVanishing/VsField.lean b6ce23de6b5c75a4e25b22df26dbb5cbecde343f
HeightAndVanishing/PowTotientConductor.lean d900b5167f2744c9a3b629ae89cc22660fde537b
HeightAndVanishing/HostComp.lean 2d9c083608be97d265cfd899214f7a4adf392ba2
HeightAndVanishing/Counts.lean 0d9f87aacf2d53abe43d894c1d822f071599ee57
LayeredIsomorphisms/Klen.lean 8d11cf66702190df2c12069a790cd8c29e43a37f
GeneratorCountTuples/LemmaK.lean 8726ea4259cd1f0fcb350eca97a3be2478261c87
AdditiveValuationNorms/ShaLeV.lean 6af293f1ba30d7aab77ac39a9fa5a3524b1cc434
src/Formalism/GaloisCohomology/Statement.lean 0799e9bcd8aa191ffaa90ab005453a53381bacea

Actual execution: fetched pinned source and verified blob, exact
unique replacement anchors (8 transformations, including removal of
one obsolete kBound block), checked absence of old CK/kBound/Win.klen
in adapter. Shell command -v lean/lake/elan returned no paths.
Re-retrieved actual historical CI status 45577239749 (0,98.87s)
and 45576756833 (0,77.94s), blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
7da354941e402b6f8b364ed03d8c5c82d27b7717. These validate the baseline,
not this overlay. No synthetic tests, no new PASS, no timing or URT
advantage. Native commands below prepared for shared existing build
batch; no local compiler, dispatch or new CI output obtained.

RESUME HERE: audit the finite-index transfer and LHS derivation
independently; authenticate native H2 versus etale H2 and use
Kum.lenOfCard for length; compile adapter in the existing native
batch, scan/prune actual CountVs and check pointHV caller bridge.
If bridge fails retain original LemmaK branch; do not treat native
closure as established. Then examine higher-weight fixed-degree
sectors only where genuine Hurewicz injection holds.
HANDOFF TO: integration, Galois, formal audit, kernel extractor.
-/

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual Formalism.HC ReciprocityTheory.Gal Formalism.GaloisCohomology UpperTheory.V UpperTheory.V.Base UpperTheory.Top UpperTheory.V.HV

namespace RHBoundedWeightOne34

private theorem nrm_le (l : ℕ) [Fact l.Prime] (O : Type) [CommRing O] [Algebra ℤ_[l] O] (hT : eO l O ≠ ⊤)
    (a : ℕ∞) (m : ℕ) (h : a ≤ (m : ℕ∞) * eO l O) : a ≠ ⊤ ∧ Chr.nrm l O a ≤ m := by
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

private theorem final_le (A n0 : ℕ) (x v y l N : ℝ) (hl : 1 ≤ l) (hN : 2 ≤ N) (hx : x = l * N)
    (hy0 : 0 ≤ y) (hy : y ≤ l) (hv : v ≤ 2 * x ^ A + n0 * (2 * N)) :
    v * y ≤ x ^ (A + n0 + 3) := by
  have h2n : ∀ m : ℕ, m + 1 ≤ 2 ^ m := by
    intro m
    induction m with
    | zero => simp
    | succ m ih => rw [pow_succ]; omega
  have hx2 : 2 ≤ x := by rw [hx]; nlinarith
  have hx0 : 0 ≤ x := by linarith
  have hlx : l ≤ x := by rw [hx]; nlinarith
  have hX : x ≤ x ^ (A + 1) := le_self_pow₀ (by linarith) (by omega)
  have hX0 : 0 ≤ x ^ (A + 1) := pow_nonneg hx0 _
  have hn00 : (0 : ℝ) ≤ n0 := Nat.cast_nonneg _
  have hp2 : (1 : ℝ) ≤ 2 ^ n0 := one_le_pow₀ (by norm_num)
  have hn0 : (n0 : ℝ) + 1 ≤ 2 ^ n0 := by exact_mod_cast h2n n0
  have hpow : (2 : ℝ) ^ (n0 + 2) ≤ x ^ (n0 + 2) := pow_le_pow_left₀ (by norm_num) hx2 _
  have hA0 : 0 ≤ x ^ A := pow_nonneg hx0 A
  have hpos : 0 ≤ 2 * x ^ A + n0 * (2 * N) := by nlinarith
  have e1 : x ^ A * l ≤ x ^ (A + 1) := by
    rw [pow_succ]; exact mul_le_mul_of_nonneg_left hlx hA0
  calc v * y ≤ (2 * x ^ A + n0 * (2 * N)) * y := mul_le_mul_of_nonneg_right hv hy0
    _ ≤ (2 * x ^ A + n0 * (2 * N)) * l := mul_le_mul_of_nonneg_left hy hpos
    _ = 2 * (x ^ A * l) + 2 * n0 * x := by rw [hx]; ring
    _ ≤ 2 * x ^ (A + 1) + 2 * n0 * x ^ (A + 1) := by nlinarith
    _ ≤ x ^ (A + 1) * 2 ^ (n0 + 2) := by
      rw [pow_add (2 : ℝ) n0 2]
      nlinarith [mul_le_mul_of_nonneg_left hn0 hX0, mul_le_mul_of_nonneg_left hp2 hX0]
    _ ≤ x ^ (A + 1) * x ^ (n0 + 2) := mul_le_mul_of_nonneg_left hpow hX0
    _ = x ^ (A + n0 + 3) := by rw [← pow_add]; congr 1; omega

-- Quantifiers are exactly those used by CountVs; no global LemmaK.
def BoundedWeightOne : Prop :=
  ∀ n0 : ℕ, ∃ A : ℕ, ∀ (l : ℕ) [Fact l.Prime] (L Ω : Type)
    [Field L] [NumberField L] [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω]
    (D : LData L Ω l) (N : ℕ), l ≠ 2 → 2 ≤ N →
    Module.finrank ℚ L ≤ n0 →
    Nonempty (L →ₐ[ℚ] CyclotomicField (l * N) ℚ) →
    VLen D ((1 : ℕ) : ℤ) ≠ ⊤ ∧
    ((VLen D ((1 : ℕ) : ℤ)).toNat : ℝ) ≤ 2 * ((l : ℝ) * N) ^ A

theorem countVs_of_bounded_weight_one :
    GlobalTheory.Published.PoitouTateDuality → LocalFinitenessK → LocalTateDualityK → BoundedWeightOne → CountVs := by
  intro hPT hLF hLT hK χ
  obtain ⟨M, hM⟩ : ∃ M : ℕ, M = (Bchi χ).sup id := ⟨_, rfl⟩
  obtain ⟨n0, hn0⟩ : ∃ n0 : ℕ, n0 = 2 * ordC χ * (16 * ordC χ * (M * χ.N) ^ 2 * M ^ (2 * (4 * ordC χ).totient)) * M :=
    ⟨_, rfl⟩
  obtain ⟨A, hA⟩ := hK n0
  refine ⟨A + n0 + 3, ?_⟩
  intro h hχ t hbig Ω _ _ _ l _ c e hl2 he0 het ψ hψX hP
  obtain ⟨⟨hlB, he1⟩, hR⟩ := hP
  subst he1
  subst hχ
  haveI := c.dvr
  haveI := c.fin
  have hlp : l.Prime := Fact.out
  have hl2' : 2 ≤ l := hlp.two_le
  obtain ⟨hIs, -⟩ := (Host.mem_X h).1 hψX
  have hNpos : 0 < h.N := Host.N_pos h
  have hN2 : 2 ≤ h.N := le_trans (by norm_num) (Nat.le_of_dvd hNpos (hostIndex h).2.2.1)
  have hlM : l ≤ M := by rw [hM]; exact Finset.le_sup (f := id) hlB
  have hord := vsOrd h c.O ψ hIs l hlp hl2 hR
  have hordM : orderOf ψ * l ≤ n0 := by
    rw [hn0]
    refine Nat.mul_le_mul (le_trans hord ?_) hlM
    show 2 * ordC h.chi * (16 * ordC h.chi * (l * h.chi.N) ^ 2 * l ^ (2 * (4 * ordC h.chi).totient)) ≤ _
    gcongr
  obtain ⟨L, _, _, _, _, _, hMu, hdeg, hcyc, hgal⟩ := vsField Ω l hl2 c.O h.N ψ
  obtain ⟨D⟩ := ldata_nonempty (F := L) (Ω := Ω) l
  have hdegn : Module.finrank ℚ L ≤ n0 := le_trans hdeg hordM
  have hT : Subgroup.closure ((Finset.univ : Finset (L ≃ₐ[ℚ] L)) : Set (L ≃ₐ[ℚ] L)) = ⊤ := by simp
  have hcard : (Finset.univ : Finset (L ≃ₐ[ℚ] L)).card ≤ n0 := by
    rw [Finset.card_univ, ← Nat.card_eq_fintype_card, IsGalois.card_aut_eq_finrank]
    exact hdegn
  have hclsker : (Chr.cls ℚ Ω h.N).ker ≤ (Chr.dirG ℚ Ω ψ).ker := by
    intro σ hσ
    rw [MonoidHom.mem_ker] at hσ ⊢
    simp [Chr.dirG, hσ]
  have hsha : shaLen D ((1 : ℕ) : ℤ) ≤ VLen D ((1 : ℕ) : ℤ) := by
    first
    | (rh_reduce 2 using [PropA.shaLeV]; done)
    | (rh_auto 2; done)
    | (rh_auto_frontier 2; done)
    | exact PropA.shaLeV hPT hLF hLT L Ω l (Or.inl hl2) D _
  have hkl := hA l L Ω D h.N hl2 hN2 hdegn hcyc
  obtain ⟨m1, hm1⟩ : ∃ m1 : ℕ, VLen D ((1 : ℕ) : ℤ) = m1 := ⟨_, (ENat.coe_toNat hkl.1).symm⟩
  have hup := Chr.upV ℚ Ω L l c.O D 1 (Chr.dirG ℚ Ω ψ) hgal Finset.univ hT
  have hh0 := (Chr.H0_local_card_bounded_of_cls_ker_le_ker Ω l c.O h.N 1 (Chr.dirG ℚ Ω ψ) one_ne_zero hclsker).2
  have heO : eO l c.O ≠ ⊤ := ne_top_of_le_ne_top (ENat.coe_ne_top _) (dvrFacts l c.O).2.2.2.2.2.2.1
  have hV : Vlen Ω c 1 ψ ≤ ((m1 + (Finset.univ : Finset (L ≃ₐ[ℚ] L)).card *
      LDataCardLeFinrank.nuBound l h.N 1 : ℕ) : ℕ∞) * eO l c.O := by
    calc Vlen Ω c 1 ψ ≤ Chr.V l 1 (Chr.dirG ℚ Ω ψ) := Chr.V'_le_V (k := ℚ) (Ω := Ω) l h.N 1 (Chr.dirG ℚ Ω ψ)
      _ ≤ _ := hup
      _ ≤ VLen D ((1 : ℕ) : ℤ) * eO l c.O + ((Finset.univ : Finset (L ≃ₐ[ℚ] L)).card : ℕ∞) *
            ((LDataCardLeFinrank.nuBound l h.N 1 : ℕ∞) * eO l c.O) := by gcongr
      _ = _ := by rw [hm1]; push_cast; ring
  obtain ⟨hne, hnrm⟩ := nrm_le l c.O heO _ _ hV
  refine ⟨hne, ?_⟩
  have hnu : LDataCardLeFinrank.nuBound l h.N 1 ≤ 2 * h.N * 1 := (lossLe l h.N 0 1 hlp hl2 hN2 (Nat.zero_le _) le_rfl).2
  have hv : Vn Ω c 1 ψ ≤ 2 * ((l : ℝ) * h.N) ^ A + n0 * (2 * (h.N : ℝ)) := by
    have hc1 : ((Finset.univ : Finset (L ≃ₐ[ℚ] L)).card : ℝ) ≤ n0 := by exact_mod_cast hcard
    have hc2 : (LDataCardLeFinrank.nuBound l h.N 1 : ℝ) ≤ 2 * h.N := by
      have : (LDataCardLeFinrank.nuBound l h.N 1 : ℝ) ≤ ((2 * h.N * 1 : ℕ) : ℝ) := by exact_mod_cast hnu
      push_cast at this
      linarith
    have hc3 : (m1 : ℝ) ≤ 2 * ((l : ℝ) * h.N) ^ A := by
      have := hkl.2
      rw [hm1, ENat.toNat_coe] at this
      exact this
    calc Vn Ω c 1 ψ ≤ ((m1 + (Finset.univ : Finset (L ≃ₐ[ℚ] L)).card *
          LDataCardLeFinrank.nuBound l h.N 1 : ℕ) : ℝ) := hnrm
      _ = (m1 : ℝ) + ((Finset.univ : Finset (L ≃ₐ[ℚ] L)).card : ℝ) *
          (LDataCardLeFinrank.nuBound l h.N 1 : ℝ) := by push_cast; ring
      _ ≤ 2 * ((l : ℝ) * h.N) ^ A + n0 * (2 * (h.N : ℝ)) := by
          gcongr
  have hl1 : (1 : ℝ) ≤ l := by exact_mod_cast hlp.one_lt.le
  have hy0 : 0 ≤ Real.log (l : ℝ) := Real.log_nonneg hl1
  have hyl : Real.log (l : ℝ) ≤ l := (Real.log_le_sub_one_of_pos (by linarith)).trans (by linarith)
  have hfin := final_le A n0 ((l : ℝ) * h.N) (Vn Ω c 1 ψ) (Real.log l) l h.N
    hl1 (by exact_mod_cast hN2) rfl hy0 hyl hv
  simpa using hfin

end RHBoundedWeightOne34

rh_scan UpperTheory.V.HV.countVs limit 2000
rh_scan RHBoundedWeightOne34.countVs_of_bounded_weight_one limit 2000
rh_prune RHBoundedWeightOne34.countVs_of_bounded_weight_one as run34_countVs_pruned
#print axioms UpperTheory.V.HV.countVs
#print axioms RHBoundedWeightOne34.countVs_of_bounded_weight_one
