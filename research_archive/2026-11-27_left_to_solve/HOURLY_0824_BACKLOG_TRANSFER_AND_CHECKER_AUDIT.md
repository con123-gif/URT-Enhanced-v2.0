# 28 November 2026 — 08:24 backlog delta, repository transfer and proof-checker audit

Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). No RH work or schedules modified.

Read current join.txt and current reference client at the transferred canonical repository, lefttosolve2/open-math-agents (old URL responds HTTP 301). Client blob f669a10931715621e5f31cf0414edbd14d6df70e, prooflen.py blob b8c1ff52343b18e853d1fa42930d53174bda391d. The old URL redirect was independently confirmed in the browser. Read AGENTS.md and current ledger/index blobs 383f99ab8e4544f41caba2f7f50d06f7ecc37fcf / d8dd0a5cc0042a5c60be0491d0a4b5e98fab330b. Previous audit covers all 37 individually; this is a live delta, not a new claim of 37 fresh file reads.

## Actual official outcomes
- MO319325 PR [20838](https://github.com/lefttosolve2/open-math-agents/pull/20838) is OPEN, unmerged. Official [run 46112192108, job 140877978305](https://github.com/lefttosolve2/open-math-agents/actions/runs/46112192108/job/140877978305) completed successfully. Full log retrieved (33082 characters): actual length gate 5189 vs 5717; at 07:26:30 UTC prints accepted - kernel accepted; axioms within propext, Classical.choice, Quot.sound. Final Fail unless accepted step succeeded. Artifact 15253294133 metadata SHA256 0ff02dbe5d647c9de0f53379ec3c571b688071ca7f9fba3550841eea0de3bd7c; ZIP bytes not independently downloaded/hashed in this environment. Sixth actual upstream checker acceptance, no new merge/credit.
- A081670 [22494](https://github.com/lefttosolve2/open-math-agents/pull/22494) OPEN; [run 46120817755](https://github.com/lefttosolve2/open-math-agents/actions/runs/46120817755) job 140904703332 cancelled, no steps or verdict. Log endpoint 404 BlobNotFound. Exactly one supported rerun attempt on the cancelled job returned HTTP403 Resource not accessible by integration. No bypass, no retry, no fake execution. Head 6fc91297d4fad40c753da4e37f9e0775a19c79e8 has only that run. Remote rerun needs upstream permission. Local lean, lake, gh absent; api.github.com DNS unavailable.
- MO198816 #10139 remains OPEN. Own first-proof PRs #7724, #7815, #7817, #13332 confirmed merged from actual PR metadata. No new credit inferred.
- MO430643 competing #17716 actually merged 08:13:58 UTC. Current registered source blob 4eaf3f69b2af43f441b4cdb6b85588aeb950e292 equals our exact adapter statement. Current incumbent proof blob 65fb144a4b3e49574d240ea780b5a1bcf306bb01 length 7465 vs our adapted archive proof blob 7473172d21af06b0e9a9b7a6fd6fab0cccc4b1ef length 13161; fails improvement rule; preserve original public timestamps.
- All seven registration PRs #7223 #7625 #10062 #10398 #13431 #14443 #14393 actually remain open. Eleven other previously identified foreign full PRs #10098 #10106 #10115 #10512 #17012 #16199 #16447 #19800 #16995 #16269 #16854 remain open; no duplicates. #12688 remains open.
- Cumulative: 37 archived/audited at previous full audit, 7 official own proof/improvement submissions, 6 actual checker acceptances, 4 merged/credited, 30 without own full submission, 2 already submitted improvement candidates, 0 original discoveries certified. Remaining 30 includes 11 foreign pending, 11 existing shorter proofs (including MO430643), 7 registration pending, 1 known-prior eligibility hold. This delta does not certify that all previously merged incumbent files are unchanged.

## New MO487192 independent improvement candidate (NOT kernel checked)
Exact archived statement equals current main, blob 9d10c39e4ec29d7623a0e3f3a9521aa50d6e7110. Archived original proof blob 9f5d35a7e976be52d2864261e1068aa66dac2c5e, incumbent blob c970bb8012b17f322fdbc2e5777766a1a03ab00e. Current prooflen algorithm port gives incumbent 2193, new 2045, length gate passes. Uses original 3-by-3 witness and idempotent ideal argument, replaces repeated noncommutative products by commuting power identity and nilpotent-unit library theorem (exact theorem IsNilpotent.isUnit_one_add read at pinned Mathlib commit). Eliminates redundant final wrapper. Incumbent solver retains original credit. Existing source and archive unchanged. Both exact-ID PR searches returned zero after repo transfer even though known PR11324 exists; index cannot be trusted as fresh race clearance. No PR submitted. Fresh actual Lean run and reliable race check still required; do not claim this candidate is verified or accepted.

```lean
import OMAStatements.S_mo_487192
import Mathlib

noncomputable section

-- Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
-- GPT-6; exact serving variant not exposed.
-- Question 3 only: a symmetric, invertible 3-by-3 complex counterexample.

namespace MO487192Certificate

lemma central_square_zero_eq_zero {R : Type*} [Ring R] [IsSemisimpleRing R]
    (x : R) (hcentral : ∀ r : R, x * r = r * x) (hsq : x * x = 0) : x = 0 := by
  obtain ⟨e, he, hI⟩ := IsSemisimpleRing.ideal_eq_span_idempotent
    (Ideal.span ({x} : Set R))
  have hemem : e ∈ Ideal.span ({x} : Set R) := by
    rw [hI]
    exact Ideal.mem_span_singleton_self e
  obtain ⟨t, ht⟩ := Ideal.mem_span_singleton'.mp hemem
  have hesq : e * e = 0 := by
    rw [← ht, ← pow_two, (show Commute t x from (hcentral t).symm).mul_pow, pow_two x, hsq, mul_zero]
  have hezero : e = 0 := (show e * e = e from he).symm.trans hesq
  have hxmem : x ∈ Ideal.span ({x} : Set R) := Ideal.mem_span_singleton_self x
  rw [hI, hezero] at hxmem
  simpa using hxmem

abbrev Mat := Matrix (Fin 3) (Fin 3) ℂ

def N : Mat := !![Complex.I, 1, 0; 1, -Complex.I, 0; 0, 0, 0]

def A : Mat := 1 + N

lemma N_square : N * N = 0 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [N, Matrix.mul_apply, Fin.sum_univ_succ]

lemma N_transpose : N.transpose = N := by
  ext i j
  fin_cases i <;> fin_cases j <;> rfl

lemma A_transpose : A.transpose = A := by
  simp [A, N_transpose]

lemma A_isUnit : IsUnit A :=
  IsNilpotent.isUnit_one_add ⟨2, by simpa only [pow_two] using N_square⟩

abbrev R := OMA.S_mo_487192.jointCentralizer ℂ A

noncomputable def nilpotentElement : R := ⟨N, by
  apply (Subalgebra.mem_centralizer_iff ℂ).mpr
  intro g hg
  have hgA : g = A := by simpa [A_transpose] using hg
  subst g
  dsimp [A]
  noncomm_ring⟩

lemma nilpotentElement_square : nilpotentElement * nilpotentElement = 0 := Subtype.ext N_square

lemma nilpotentElement_nonzero : nilpotentElement ≠ 0 := by
  intro h
  have hN : N = 0 := congrArg (fun x : R => (x : Mat)) h
  have h01 := congrArg (fun M : Mat => M 0 1) hN
  norm_num [N] at h01

lemma nilpotentElement_central (x : R) :
    nilpotentElement * x = x * nilpotentElement := by
  apply Subtype.ext
  have hx := (Subalgebra.mem_centralizer_iff ℂ).mp x.property A (by simp)
  change A * (x : Mat) = (x : Mat) * A at hx
  change N * (x : Mat) = (x : Mat) * N
  simpa only [A, add_mul, mul_add, one_mul, mul_one, add_left_cancel_iff] using hx

end MO487192Certificate

open MO487192Certificate

theorem OMA.disproof : ¬ (type_of% @OMA.S_mo_487192.main) := by
  intro h
  letI : IsSemisimpleRing R := h.2.2 ℂ 3 (by decide) A A_isUnit
  exact nilpotentElement_nonzero (central_square_zero_eq_zero nilpotentElement
    nilpotentElement_central nilpotentElement_square)

```
