import RUN35_NATIVE_H2_KTHEORY_COMPARISON
import RUN38_PRINCIPAL_SHALLOW_LOSS_FREE
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN36 literature lane 9, 25 Nov 2026. SOURCE-MATCHED human reduction and
PREPARED actual consumer overlay; NOT COMPILED; zero new kernel closures.
RH OPEN. Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4.
Upstream frozen 40e56bab026552e089d7afcfeff08d2defb9c005; latest observed
98d36aafeeb30c1f40fdda96c3574faa34dfa413 not substituted.
Read SWARM, HANDOFF, EXPANSION, AGENTS, continuity and peer 31cc317d,
e9256be1, 18c47fab, 9f9a5e0e. This combines, not duplicates, RUN35
(literature) with RUN38 (prime-window) on the identical vsField witness.

DECISIVE LOCAL INEQUALITY, principal host (chi.N=1), CaseV shallow:
  Vn(Omega,c,1,psi) log(l) <= log |H^2(G_S(L), Z_l(2))|
                         = log |K_2(O_L){l}|
                         <= (l*N)^A .
Here A depends only on the fixed base character via n0, NOT on host N,
l, c, Omega, t, psi. No loss n0+3 or +2 in the exponent. The original
degree bound n0 and cyclotomic embedding are retained. RUN38 proved
prime-to-index descent conditionally in its prepared Lean adapter:
[L:Q] divides |im psi|*(l-1) and |im psi| divides the dyadic host index.
Thus restriction is injective on the SAME local Selmer family by
selUnit (corestriction composite is multiplication by a unit).
Then Vlen <= shaLen*eO <= VLen*eO (retain all PT/local inputs).
Apply native nrm_le and exact length/card identity, multiply once by
nonnegative log l. No bounding log l by l, no auxiliary local generator
loss, no universal LemmaK. A is the exponent supplied by BoundedCardOne,
not the previous differently defined kBound exponent. This is a sharper
interface, not a numerical comparison of unrelated exponents.

Independent re-derivation of RUN34's quantitative supplier:
H=Gamma x U <= GL_5(O_L), Gamma kernel of reduction of SL_5 modulo 3,
U torsion-free scalar unit complement. Determinant quotient has index
[O_L^*:U^5]=w_L*5^rank(U); determinant kernel index <=3^(25d).
H normal and torsion-free by Minkowski. Projection to archimedean
symmetric space for Gamma is faithful (central kernel is finite and
Gamma torsion-free); nonuniform irreducible arithmetic lattice for
Res_{L/Q} SL_5, not a compact manifold. Gelander Theorem 1.5(1),
https://arxiv.org/pdf/math/0111165 p.3 (actual page inspected),
yields a finite simplicial model with bounded valence and O_d(D^12)
vertices using Prasad's volume formula (Emery eq.3.4). For varying
degree do NOT use the fixed-signature constant. Bound zeta_L(j) by
zeta(j)^d, and take maximum over the finitely many signatures and
degrees <=n0. Tensor with a torus of rank <=d-1; homology in degrees
<=2 has uniformly bounded mod-p ranks and log integral torsion.
Hadamard applies to independent boundary columns in saturation.
For quotient Q=G/H of bounded size J, mod-p LHS:
 b_2(G,F_p)<=sum_{a+b=2} J^a b_b(H,F_p).
Integral LHS gives finite generation. UCT injects H_2(G,Z) tensor F_p
into H_2(G,F_p), so number of generators of p-primary torsion <= b_2.
Transfer t then inclusion equals J; ker t on T_G{p} is a subgroup
of T_G{p}[p^v_p(J)]. Each cyclic factor contributes at most p^v_p(J).
Hence |T_G{p}|<=|T_H{p}| p^(v_p(J)b_2(G,F_p)).
Summing log EXACTLY gives log|T_G|<=log|T_H|+B log J with
B=max_{p|J} b_2(G,F_p) (zero if J=1). No inverted index, even at 3.
Emery 2024 section 2.3 and Proposition 2.2
https://doi.org/10.1007/s00229-024-01598-4 (actual theorem read):
Arlettaz kernel has no p-torsion for p>(n+1)/2 and stable homology at
matrix size >=2n+1; n=2,N=5 includes all odd p. Therefore
log|K2(O_L)_odd|<=C_d D^12. This is derived, not a theorem quoted
verbatim from Emery; his own small-prime exclusion is not used here.
Since L embeds in Q(zeta_(l*N)), conductor-discriminant yields
D<= (l*N)^d. Uniform C_d for d<=n0 absorbed into one integer A.
This audit finds no missing quantitative hypothesis in that argument.
Formalization still absent. RUN35 comparison uses Schmidt Proposition
2.3 proof, https://www.mathi.uni-heidelberg.de/~schmidt/papers/kpi1.pdf
p.6 (actual page inspected), and Tate; the cochain inverse-limit
finiteness argument remains in RUN35. No additional conjectures.

Original local graph countVs -> vsField, upV, shaLeV, klen, LemmaK,
H0 local budget, lossLe, nrm_le, final_le. Peer reduced graph
countVsPrime38 -> vsFieldPrime38, upVPrime38, shaLeV, klen, LemmaK,
nrm_le; this candidate replaces klen/LemmaK and final power loss by
BoundedCardOne -> len_card_exact and one scalar multiplication.
Native BoundedCardOne, PT, LF, LT remain explicit unproved premises
of this adapter; BoundedCardOne is a Prop not an added axiom.
Original/reduced graphs and all pending consumers retained. No claim
of closure at pointHV or VWinAt(1,401), no general CountV, CountI/II,
2-primary, minus or geometry closure. Cache key (source+toolchain,
same h,N,chi,l,c,psi,L,D,e=1, coefficient topology and local family).
URT not used; no performance claim.

Source pins:
RUN34 blob 08a38c0626ebabdd53a9858387966a97d5c7abbd; RUN35 blob 0a93c337ffc6a3476d6a5c2326b473744b891268;
peer RUN38 blob 2c050b2bf1bbbb815b5490633952399bbbe541de.
Upstream src/Development/AutomorphicArithmetic/AutomorphicVarieties/
HeightAndVanishing/CountVs.lean 3b29717c74e14806d898cbbf9f96417396a2d37d
HeightAndVanishing/Counts.lean 0d9f87aacf2d53abe43d894c1d822f071599ee57
HeightAndVanishing/VsField.lean b6ce23de6b5c75a4e25b22df26dbb5cbecde343f
Other transport dependencies as in peer RUN38 and RUN35.
Actual execution: six unique source transformations of peer theorem,
seven obsolete-symbol exclusion checks and eight required-symbol checks,
three supplier anchors; all passed in connector JS. No arithmetic
simulation used. Local command -v lean/lake/elan empty. Historical CI
status blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 retrieved: 45577239749
and 45576756833 successful only on their baseline scope. No new CI
output or compiler for this overlay; no native PASS claimed.
RESUME HERE: compile RUN34, RUN35, peer RUN38 as modules in existing
pinned native runner, then this file. Keep the original CountVs
fallback. Obtain independent audit of actual caller specialization
and replace only in the principal-host pointHV consumer once verified;
prove the remaining BoundedCardOne interface formally or document
its explicit literature foundation. Keep all other arithmetic and
same-host joint-loss obligations open.
HANDOFF TO integration, prime-window, Galois, kernel, formal audit.
-/

noncomputable section
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual Formalism.HC
open ReciprocityTheory.Gal Formalism.GaloisCohomology UpperTheory.V
open UpperTheory.V.Base UpperTheory.Top UpperTheory.V.HV UpperTheory.V.Chr

namespace RHLiterature36

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

theorem countVsPrimeCard36 :
    GlobalTheory.Published.PoitouTateDuality → LocalFinitenessK → LocalTateDualityK → RHNativeH2Comparison35.BoundedCardOne → PrincipalCountVs38 := by
  intro hPT hLF hLT hK χ hprincipal
  obtain ⟨M, hM⟩ : ∃ M : ℕ, M = (Bchi χ).sup id := ⟨_, rfl⟩
  obtain ⟨n0, hn0⟩ : ∃ n0 : ℕ, n0 = 2 * ordC χ * (16 * ordC χ * (M * χ.N) ^ 2 * M ^ (2 * (4 * ordC χ).totient)) * M :=
    ⟨_, rfl⟩
  obtain ⟨A, hA⟩ := hK n0
  refine ⟨A, ?_⟩
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
  have hq : h.q = 1 := hprincipal
  have hi := hostIndex h
  have ho : h.o = 1 := by have := hi.2.2.2.1; have := hi.2.2.2.2.1; omega
  have hHidx : ¬ l ∣ h.H.index := by
    intro hdiv
    have hh := hdiv.trans hi.1
    rw [ho, mul_one] at hh
    exact hl2 ((Nat.prime_dvd_prime_iff_eq hlp Nat.prime_two).mp (hlp.dvd_of_dvd_pow hh))
  have hkidx : ψ.toUnitHom.ker.index ∣ h.H.index := by
    have hsub : h.H ≤ ψ.toUnitHom.ker := hIs
    have hx := Subgroup.relIndex_inf_mul_relIndex h.H ψ.toUnitHom.ker ⊤
    rw [inf_top_eq, Subgroup.relIndex_top_right, Subgroup.relIndex_top_right, inf_eq_left.mpr hsub] at hx
    rw [← hx]
    exact dvd_mul_left _ _
  have hpidx : ¬ l ∣ ψ.toUnitHom.ker.index := fun hd => hHidx (hd.trans hkidx)
  obtain ⟨L, _, _, _, _, _, hMu, hdeg, hcyc, hgal, hLprime⟩ := vsFieldPrime38 Ω l hl2 c.O h.N ψ hpidx
  obtain ⟨D⟩ := ldata_nonempty (F := L) (Ω := Ω) l
  have hdegn : Module.finrank ℚ L ≤ n0 := le_trans hdeg hordM
  have hsha : shaLen D ((1 : ℕ) : ℤ) ≤ VLen D ((1 : ℕ) : ℤ) := PropA.shaLeV hPT hLF hLT L Ω l (Or.inl hl2) D _
  obtain ⟨hfin, hlog⟩ := hA l L Ω D h.N hl2 hN2 hdegn hcyc
  obtain ⟨hvfin, hcard⟩ := RHNativeH2Comparison35.len_card_exact l L Ω D 1 hfin
  obtain ⟨m1, hm1⟩ : ∃ m1 : ℕ, VLen D ((1 : ℕ) : ℤ) = m1 := ⟨_, (ENat.coe_toNat hvfin).symm⟩
  have hup := Chr.upVPrime38 ℚ Ω L l c.O D 1 (Chr.dirG ℚ Ω ψ) hgal hLprime
  have heO : eO l c.O ≠ ⊤ := ne_top_of_le_ne_top (ENat.coe_ne_top _) (dvrFacts l c.O).2.2.2.2.2.2.1
  have hV : Vlen Ω c 1 ψ ≤ (m1 : ℕ∞) * eO l c.O := by
    calc Vlen Ω c 1 ψ ≤ Chr.V l 1 (Chr.dirG ℚ Ω ψ) := Chr.V'_le_V (k := ℚ) (Ω := Ω) l h.N 1 (Chr.dirG ℚ Ω ψ)
      _ ≤ shaLen D ((1 : ℕ) : ℤ) * eO l c.O := hup
      _ ≤ VLen D ((1 : ℕ) : ℤ) * eO l c.O := by gcongr
      _ = _ := by rw [hm1]
  obtain ⟨hne, hnrm⟩ := nrm_le l c.O heO _ _ hV
  refine ⟨hne, ?_⟩
  have hlog' : Real.log (Nat.card (ReciprocityTheory.Gal.H2
      (zlTw D (((1 : ℕ) : ℤ) + 1))) : ℝ) ≤ ((l : ℝ) * h.N) ^ A := hlog
  rw [hcard, hm1, ENat.toNat_coe] at hlog'
  have hl1 : (1 : ℝ) ≤ l := by exact_mod_cast hlp.one_lt.le
  have hy0 : 0 ≤ Real.log (l : ℝ) := Real.log_nonneg hl1
  change Vn Ω c 1 ψ * Real.log (l : ℝ) ≤ ((l : ℝ) * h.N) ^ A
  exact (mul_le_mul_of_nonneg_right hnrm hy0).trans hlog'


theorem replay
    (hp : GlobalTheory.Published.PoitouTateDuality) (hf : LocalFinitenessK)
    (ht : LocalTateDualityK) (hc : RHNativeH2Comparison35.BoundedCardOne) :
    PrincipalCountVs38 := by
  first
  | (rh_reduce 2 using [countVsPrimeCard36]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact countVsPrimeCard36 hp hf ht hc

end RHLiterature36
rh_scan UpperTheory.V.HV.countVs limit 2000
rh_scan UpperTheory.V.HV.countVsPrime38 limit 2000
rh_scan RHLiterature36.countVsPrimeCard36 limit 2000
rh_prune RHLiterature36.replay as RH36CountVsCardPruned
#print axioms UpperTheory.V.HV.countVs
#print axioms RHLiterature36.countVsPrimeCard36
#print axioms RHLiterature36.replay
end
