import New.Curve.TightFrameExists

/-!
# RUN80 — A2 general p-unit square frame, source-reuse certificate
27 November 2026. HUMAN SOURCE-MATCHED, Lean candidate PREPARED not replayed.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0 /
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Historical old pin 40e56bab026552e089d7afcfeff08d2defb9c005 not mixed.
Mission 3adc76221a978016e3505cdf3e36ad688354d7d7; spine
4878ea106b791c42b5f5a45810162de59701c4d9; ledger
01fa22a6b12abad5ccf580d2621f82be3bf70c13. Reviewed protocol, handoff,
expansion, AGENTS and latest A2 peer 5bc36ce5; chosen-level freeness
is the theta lane's separate task. Preserve A1–A3 and all root gaps.

## Actual new step: native-interface candidate for the GENERAL jet caller
RUN77 proved a p-specific one-block construction in human mathematics;
RUN78/79 prepared the marked caller splice/replay. The unrestricted
norm_jet_jetSeries_le_one still consumes the general norm_jetSeries_le
(New/Curve/ConjugatesOfJets.lean blob 8b841d76bb938d8a18fd4341aa832a20b13dd9e0).
No extra p-not-dividing-level assumption is allowed there. Here choose a
slightly less aggressive but more source-reusable route than RUN77's
p-specific t: retain the original common quadratic root z and t, and
use only its SINGLE p-block. This removes the all-block sum, Frobenius
coin problem, arbitrary prescribed length, threshold and unit-vector
selection from the general jet caller. No claim of removing those from
other consumers (JetExponentBound etc.).

Exact source New/Curve/TightFrameExists.lean blob
4f2e76afa45ba54fe9040704b505b2da1865f2b4, exists_isTightFrame.
Let N=N1, n=(d+1)/4. Its native suppliers give r_l, M_l, V_l,
N=l*r_l, l not dividing M_l, and D*(zeta^r_l-1)*M_l=N*V_l,
where D is the relative different generator. Retain the original
z<N with n*z^2+z+1=N*e, obtained by the original finite-ring
injectivity (retain N|n^N). Put t=1-c0+n*z. Its trace and norm are
Tr(t)=1+2*n*z, Norm(t)=n*N*e, using c0+bar(c0)=1 and c0*bar(c0)=n.
For p|N take l=p, T=t*M_l/N and the original block
u_jki=zeta^j (1_(k=0)*a^i+T*(a^i-a^k)), a=zeta^r_l.
All finiteImage values integral by the exact original pointwise local
argument (no multiplicity or coin coefficients occur there). The same
primitive-root sums as RUN77 and the original source give the Gram
matrix Cblock*I, with EXACT integer diagonal
    Cblock = N + M_l*(1+2*n*(z+p*M_l*e)).
Since p divides n and N, and p does not divide M_l, reduce BEFORE norms:
    Cblock = M_l (mod p), hence gcd(p,Cblock)=1.
In particular Cblock != 0. Repeat every block vector Cblock times:
Gram length Cblock^2, still a p-unit. If p does not divide N, use the
native root-of-unity frame with multiplicity N, as RUN77/78.
This uses original z, rather than a new congruence root or stronger
cyclotomic identity, and retains all local valuation suppliers.
No estimates, fitted parameters, or norm relaxations introduced.

Original general static edge:
  norm_jet_jetSeries_le_one -> norm_jetSeries_le -> exists_isTightFrame.
Candidate:
  norm_jet_jetSeries_le_one -> norm_jetSeries_le ->
  {exists_punit_square_frame_run80, norm_jetSeries_le_from_square_frame_run78}.
  exists_punit_square_frame_run80 -> {isTightFrame_zeta_pow,
  exists_cyclotomic_different_factor, original finite-ring root,
  exact local integrality, single-block Gram sum}.
All original/reduced RUN77–79 graphs and unresolved obligations retained.
This file imports the original definitions but does not USE
exists_isTightFrame to prove the new lemma. No global deletion or
kernel-reachable edge change is asserted before replay. Cache key:
pin, source blob, P,s,p,N,n,z,e,l,r,M,V,t, block index and original
jet context; not shared across unrelated fields/places.

## Actual checks and receipts
Exact pinned connector source read and matched blob. Source-linked
generation executed: four source regions extracted, two prefix changes
and one Gram target change; three changed/missing/duplicate-anchor
controls rejected (3/3). Original pointwise local proof copied
unchanged except indentation; no repeated scalar regression. Local
command -v lean/lake/elan returned no binary, so native rh_scan,
rh_prune, rh_reduce, rh_auto and rh_auto_frontier not executed.
Lean elaboration at the block index, modular cast and Gram sum remains
a real replay gate. The new file is not a kernel receipt.

Actual A3 CI 46001860122 status blob 9fc84ca2a5000758002dec0477d9835615507eac,
a3_native_results.json blob 19d74bb71d7f74a9b356bb62e240a359360de414:
IntegralParameter/FormalHeight builds exit 0; three native originals
and two formal-height helpers audited standard axioms; missing-positive
negative rejected. Weber-cycle source failed with unterminated comment
(log a35eec69222988e2b64a5a442cfaac51034ab015). Overall error, not full
A3 verification. Literature owns the separate comment repair.
Actual B2 shared CI 46006832164 status blob 9459c0acbb3e68b78e7f46ebb36a45a25ee7647d:
seven pair/energy declarations and separate count source accepted;
recursive graph error from collector projection mismatch (peer prepared
strict repair). Do not reuse B2 receipts as A2 verification.
No A2 caller replay job present in inspected registry blob
dd267f769acf4564a1813bfcca5f19eb2e30884a. Do not launch duplicate cold
build; shared runner coordination remains required.

## Exact caller integration after native helper replay
Insert this theorem immediately before the existing norm_jetSeries_le
in the RUN78 disposable ConjugatesOfJets overlay (or import a scratch
module with this theorem, built in the same pinned environment).
Replace ONLY its original three-line frame-choice prefix with
  obtain ⟨M,hM,hM0,I,hI,w,k,hw⟩ := P.exists_punit_square_frame_run80 s (p := p)
  letI := hI
  exact norm_jetSeries_le_from_square_frame_run78 hM hM0 hw hf c L H
(the RUN78 version already has the shared final line; replace its
whole body with these lines). Keep the original exact declaration type,
the specialized marked caller, and all other callers and proof sources.
Replay original and reduced declarations with RUN79's type/axiom/edge
checks, but explicitly update the fallback guard for this separately
named second candidate: require new frame edge from the general proof
and no direct exists_isTightFrame edge there, while retaining original
baseline and exact old fallback evidence. Do not conflate this with
RUN79's first-stage marked-only comparison.

RESUME HERE: integration/kernel use the existing shared compact A2
workspace to compile this one helper against TightFrameExists, then
use its exact caller replacement above after the RUN79 first-stage
receipt. Repair first actual elaboration error, retain compiler output,
original/reduced graphs and axioms; no claim of global deletion.
HANDOFF TO acceleration, theta, kernel, integration and independent audit.
RH/star inequality OPEN.
-/

open ComplexConjugate Finset Ideal NeZero Polynomial ZMod

variable (P : Parameters) (s : ℕ) {p : ℕ} [Fact p.Prime] [PadicPlace p]

/-- Sufficient frame for general local jet transfer, with no prescribed length
or distinguished unit vector. Source-reuse candidate; native replay pending. -/
lemma Parameters.exists_punit_square_frame_run80 :
    ∃ M : ℕ, p.Coprime M ∧ M ≠ 0 ∧
      ∃ I : Type, ∃ (_ : Fintype I) (w : I → P.E s) (k : I → ℕ),
        IsTightFrame w k (M * M) := by
  obtain ⟨hϵ, hζ, h0, hG⟩ := P.c₀InE_mul_one_sub s, @isPrimitiveRoot_zetaInt P s, ne (P.N₁ s),
    P.isTightFrame_zeta_pow s 1
  set N := N₁ ..
  set n := (P.d + 1) / 4
  choose r M hN hr hMp V hV hfactor using exists_cyclotomic_different_factor hζ
  have ⟨f, hf⟩ : N ∣ n ^ N := by grind [N.dvd_pow_self_iff, dvd_norm_c₀, lt_d]
  have ⟨z, hz, e, he⟩ : ∃ z < N, N ∣ n * z ^ 2 + z + 1 := (@Finite.surjective_of_injective
    (ZMod N) _ (fun y ↦ n * y ^ 2 + y) (fun a b h ↦ (IsNilpotent.isUnit_add_one (r := n *
    (a + b)) ⟨N, by simp [mul_pow, ← n.cast_pow, hf]⟩).mul_left_cancel (by linear_combination h))
    (-1)).elim (⟨_, val_lt ·, by simp [← natCast_eq_zero_iff, ·]⟩)
  let t := 1 - P.c₀InE s + n * z
  let a := (P.zetaInt s ^ r ·)
  let u : (Σ l, Fin (r l) × Fin l × Fin l) → P.E s | ⟨l, ⟨j, _⟩, ⟨k, _⟩, i, _⟩ => P.zetaInt s ^ j *
    (0 ^ k * a l ^ i + t * M l / N * (a l ^ i - a l ^ k))
  by_cases hpN : p ∣ N
  · have hu : ∀ i, finiteImage u i ∈ Ô (P.E s) := by
      rintro ⟨l, j, k, i⟩
      refine mem_Ô.2 fun v ↦ ?_
      obtain ⟨⟨g, _⟩, w, _⟩ := (sub_one_dvd_pow_sub_one (a l) i).sub (sub_one_dvd_pow_sub_one _ k),
        sub_dvd_pow_sub_pow (P.c₀InE s) (n * -z) N
      have I y : ↑N ∣ y * t * (M l * (a l - 1)) → v.valuation _ (y * u ⟨l, j, k, i⟩) ≤ 1
        | ⟨c,
          _⟩ => by convert v.valuation_le_one (P.zetaInt s ^ j.1 * (y * 0 ^ k.1 * a l ^ i.1 + c * g))
                   simpa [field, -coe_zetaInt] using mod_cast by grobner
      by_cases g : P.c₀InE s ∈ v.1 <;> [convert I (relDifferentGen ..) ⟨t * V l, by grind⟩; convert I
        (P.c₀InE s ^ N) (.mul_right ⟨n * e * w + f * (-z) ^ N * t, by grind [mul_pow, congr((t + $he,
        t + $hf))]⟩ _)] <;> simp [finiteImage, WeilData.α, α, g, v.valuation_eq_one_iff_notMem.2]
    let l : N.primeFactors := ⟨p, N.mem_primeFactors.2 ⟨Fact.out, hpN, h0⟩⟩
    have hlM : ¬ p ∣ M l := fun h ↦ (hMp l p l.2).1 h rfl
    have hpn : p ∣ n := P.dvd_norm_c₀ Fact.out hpN
    let Cblock := N + M l * (1 + 2 * n * (z + p * (M l * e)))
    have hC : ¬ p ∣ Cblock := by
      intro hc
      have hn0 : (n : ZMod p) = 0 := by rwa [natCast_eq_zero_iff]
      have hN0 : (N : ZMod p) = 0 := by rwa [natCast_eq_zero_iff]
      have hc0 : (Cblock : ZMod p) = 0 := by rwa [natCast_eq_zero_iff]
      apply hlM
      rw [← natCast_eq_zero_iff (R := ZMod p)]
      simpa [Cblock, Nat.cast_add, Nat.cast_mul, hn0, hN0] using hc0
    have hC0 : Cblock ≠ 0 := fun h ↦ hC (by simp [h])
    let w : Fin (r l) × Fin l × Fin l → P.E s := fun i ↦ u ⟨l, i⟩
    have hw : IsTightFrame w 1 Cblock := by
      refine ⟨fun i ↦ ?_, fun σ τ ↦ ?_⟩
      · simpa [finiteImage, w] using hu ⟨l, i⟩
      · dsimp [w]
        have := Fact.mk (N.prime_of_mem_primeFactors l.2)
        have C := (hζ.pow h0.bot_lt (hr l ▸ mul_comm ..)).geom_sum_eq_zero Fact.out
        have := congr((Φ τ $hϵ, ($he : ℂ), Φ τ $(P.star_c₀InE s), $(hr l ▸ hG.2 σ τ), Φ σ $C,
          conj (Φ τ $C)))
        simp [sum_range, pow_add, pow_mul, ← hr, mul_assoc, ← mul_sum, reindex_equiv finProdFinEquiv,
          Fintype.sum_prod_type_right] at this
        simp [*, u, a, Fintype.sum_prod_type, @zero_pow_eq ℂ, apply_ite conj, mul_assoc, -nsmul_eq_mul,
          ← smul_sum, mul_left_comm (_ ^ _) (_ / _), mul_add, add_mul, sub_eq_add_neg,
          ← mul_sum, ← sum_mul]
        split <;> simp [t, field, Cblock]; grobner
    refine ⟨Cblock, (Fact.out : p.Prime).coprime_iff_not_dvd.2 hC, hC0,
      _, inferInstance, w, fun _ ↦ Cblock, hw.1, fun σ τ ↦ ?_⟩
    have h := hw.2 σ τ
    simp only [Pi.one_apply, Nat.cast_one, one_mul] at h
    rw [← mul_sum, h]
    split <;> simp_all [Nat.cast_mul]
  · exact ⟨N, (Fact.out : p.Prime).coprime_iff_not_dvd.2 hpN, h0,
      _, inferInstance, _, _, P.isTightFrame_zeta_pow s N⟩

#print axioms Parameters.exists_punit_square_frame_run80
