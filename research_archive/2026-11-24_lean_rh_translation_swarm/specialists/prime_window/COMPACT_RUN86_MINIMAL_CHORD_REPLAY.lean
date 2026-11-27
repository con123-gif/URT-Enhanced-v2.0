import New.Endgame.PrimeError
import Lean

/-!
# RUN86 — minimal actual RUN85 interpolation replay frontier
27 November 2026. SOURCE-MATCHED / PREPARED, NOT native verified.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Latest mission/spine/ledger blobs: 3adc76221a978016e3505cdf3e36ad688354d7d7,
24b10d71aff1d6d8075e7629a1710c1b0cc7a969, c40f1debc6872fb9e1f080a90c39d94e0b1caffe.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
PrimeError.lean blob 63eb3d79d95ad815878e623b96f237240058c8e2.
RUN85 blob 205db835d09d9fc0e4d9bb55fd49ee5bf37295dc.

Actual consumer RHPrimeWindow85.eventual_from_good_grid calls
RHPrimeWindow84.primeError_chord exactly once. Its local mathematical
suppliers hinge and log_correction are both retained verbatim, with
all positivity and reciprocal-interpolation hypotheses. The redundant
reciprocal_curvature and eventual_from_cover declarations are not
referenced by the RUN85 proof body. They remain in the original file,
as does all prior evidence; reciprocal_curvature still explains the
human geometric bound. Do not claim global deletion. Old 117-line
helper block -> 80-line actual consumer replay slice; only source-level
reachability, not kernel extraction. Statements and proof bodies of
all three retained declarations are copied byte-for-byte from RUN85.
No new hypotheses. No Main, ShortAndEnough or DataExist import needed
for this candidate local replay, pending actual import elaboration.

Original candidate graph: RUN85.eventual_from_good_grid -> chord ->
{primeError_eq_sum, lambdaClass_nonneg_and_abs_le, hinge, log_correction};
original helper block separately contained reciprocal_curvature and
eventual_from_cover. Reduced candidate graph retains those five
source edges and all other original transitive dependencies. No full
original/new kernel graph or native scan/prune/auto result yet.
Cache key: pin, Mathlib, RUN85 blob, exact retained declarations and
actual environment. Backtrack to full RUN85 block if native scope fails.

Actual connector static check: extracted original 117-line helper
block and rejected 6/6 damaged-source controls (wrong opening,
wrong closing, changed theorem name, sorry, duplicated closing,
inserted Main import). Independently sliced the three retained
declarations and counted all five qualified references in the RUN85
caller text excluding #print axioms: 0,0,0,1,0 respectively for
hinge, log_correction, reciprocal_curvature, primeError_chord,
eventual_from_cover. Local lean/lake absent. No new native PASS.
Latest peer head included C2 original determinant class-sum acceptance
905f2991, A1 shared replay repair 5cb346a2, B3 caller 02798532.
Shared A1/A2 state blob 07a2b14930c38095e6771ae9ed1a10a3cf1bf678
still records returncode 1 (run 46023465491); not this slice's result.
No duplicate cold build, no protected workflow or live ledger edits.

RESUME HERE: in the existing authorized pinned compact source workspace,
run lake env lean on THIS file, capturing exit and full log.
If PrimeError.olean is absent, build only New.Endgame.PrimeError there.
Require the three axiom reports, four positive direct dependency
guards, two old-helper absence guards, and the guard success marker.
The explicit negative control proves the t<=1 premise cannot be dropped.
Then use successful local evidence for full RUN85 caller replay and
strict original/new graph audit. GridCover, TailGrid and GoodGrid
remain explicit premises; the last contains the unproved star.
HANDOFF TO kernel, integration, editor, audit. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open ArithmeticFunction DirichletCharacter Complex Finset Filter
  MeasureTheory Nat Real vonMangoldt

namespace RHPrimeWindow84

theorem hinge (u v t : ℝ) (ht : 0 ≤ t) (ht1 : t ≤ 1) :
    max ((1-t)*u+t*v) 0 ≤ (1-t)*max u 0+t*max v 0 := by
  apply max_le
  · exact add_le_add
      (mul_le_mul_of_nonneg_left (le_max_left _ _) (sub_nonneg.mpr ht1))
      (mul_le_mul_of_nonneg_left (le_max_left _ _) ht)
  · positivity

theorem log_correction (a b x t : ℝ) (ha : 0 < a) (hb : 0 < b)
    (hx : 0 < x) (ht : 0 ≤ t) (ht1 : t ≤ 1) :
    (1-t)*Real.log a+t*Real.log b-Real.log x ≤ ((1-t)*a+t*b)/x-1 := by
  calc
    _ = (1-t)*Real.log (a/x)+t*Real.log (b/x) := by
      rw [Real.log_div ha.ne' hx.ne', Real.log_div hb.ne' hx.ne']
      ring
    _ ≤ (1-t)*(a/x-1)+t*(b/x-1) := add_le_add
      (mul_le_mul_of_nonneg_left (Real.log_le_sub_one_of_pos (div_pos ha hx))
        (sub_nonneg.mpr ht1))
      (mul_le_mul_of_nonneg_left (Real.log_le_sub_one_of_pos (div_pos hb hx)) ht)
    _ = _ := by ring

/-- Exact compact prime-error chord on a COMMON finite cutoff. -/
theorem primeError_chord (d M : ℕ) [Fact d.Prime] [NeZero M]
    (A : ℕ) (a b x t : ℝ) (ha : 0 < a) (hb : 0 < b) (hx0 : 0 < x)
    (hA : a ≤ A) (hB : b ≤ A) (hX : x ≤ A)
    (ht : 0 ≤ t) (ht1 : t ≤ 1) (hx : 1/x = (1-t)/a+t/b) :
    primeError d M x ≤ (1-t)*primeError d M a+t*primeError d M b+
      ((1-t)*a+t*b-x)/x/(Nat.totient M : ℝ) := by
  let S (z : ℝ) := ∑ n ∈ Finset.Icc 1 A,
    lambdaClass d M n * ((A : ℝ)/n-(A : ℝ)/z)⁺ / (A : ℝ)
  let K := (logDerivMean d M 1).re
  have hRa : primeError d M a = S a-Real.log a/(Nat.totient M : ℝ)-K := by
    simpa only [S,K] using (primeError_eq_sum (d := d) (M := M) A ha hA)
  have hRb : primeError d M b = S b-Real.log b/(Nat.totient M : ℝ)-K := by
    simpa only [S,K] using (primeError_eq_sum (d := d) (M := M) A hb hB)
  have hRx : primeError d M x = S x-Real.log x/(Nat.totient M : ℝ)-K := by
    simpa only [S,K] using (primeError_eq_sum (d := d) (M := M) A hx0 hX)
  have hS : S x ≤ (1-t)*S a+t*S b := by
    dsimp [S]
    rw [Finset.mul_sum, Finset.mul_sum, ← Finset.sum_add_distrib]
    apply Finset.sum_le_sum
    intro n hn
    have hn0 := (lambdaClass_nonneg_and_abs_le d M n).1
    have hid : (A : ℝ)/n-(A : ℝ)/x =
        (1-t)*((A : ℝ)/n-(A : ℝ)/a)+t*((A : ℝ)/n-(A : ℝ)/b) := by
      calc
        _ = (A : ℝ)/n-(A : ℝ)*(1/x) := by ring
        _ = _ := by rw [hx]; ring
    have hh : ((A : ℝ)/n-(A : ℝ)/x)⁺ ≤
        (1-t)*((A : ℝ)/n-(A : ℝ)/a)⁺+t*((A : ℝ)/n-(A : ℝ)/b)⁺ := by
      change max _ 0 ≤ (1-t)*max _ 0+t*max _ 0
      rw [hid]
      exact hinge _ _ t ht ht1
    calc
      _ ≤ lambdaClass d M n *
          ((1-t)*((A : ℝ)/n-(A : ℝ)/a)⁺+
            t*((A : ℝ)/n-(A : ℝ)/b)⁺)/(A : ℝ) :=
        div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_left hh hn0)
          (Nat.cast_nonneg A)
      _ = _ := by ring
  have hL := log_correction a b x t ha hb hx0 ht ht1
  have hL' : (1-t)*Real.log a+t*Real.log b-Real.log x ≤
      ((1-t)*a+t*b-x)/x := by
    calc
      _ ≤ ((1-t)*a+t*b)/x-1 := hL
      _ = _ := by field_simp [hx0.ne']
  have hLd := div_le_div_of_nonneg_right hL'
    (Nat.cast_nonneg (α := ℝ) (Nat.totient M))
  calc
    _ = S x-Real.log x/(Nat.totient M : ℝ)-K := hRx
    _ ≤ ((1-t)*S a+t*S b)-Real.log x/(Nat.totient M : ℝ)-K :=
      sub_le_sub_right (sub_le_sub_right hS _) _
    _ = (1-t)*primeError d M a+t*primeError d M b+
        ((1-t)*Real.log a+t*Real.log b-Real.log x)/(Nat.totient M : ℝ) := by
      rw [hRa,hRb]; ring
    _ ≤ _ := add_le_add_left hLd _

end RHPrimeWindow84

/-- Negative control: the convex hinge inequality is false if t<=1
is omitted, even when t>=0. -/
example : ¬ (max ((1-(2:ℝ))*(-1)+2*0) 0 ≤
    (1-(2:ℝ))*max (-1) 0+2*max 0 0) := by norm_num

run_cmd do
  let allowed : Array Lean.Name := #[``propext, ``Classical.choice, ``Quot.sound]
  for n in #[``RHPrimeWindow84.hinge, ``RHPrimeWindow84.log_correction,
      ``RHPrimeWindow84.primeError_chord] do
    let axioms ← Lean.collectAxioms n
    unless axioms.all (fun a => allowed.contains a) do
      Lean.throwError m!"RUN86 unexpected axiom for {n}: {axioms}"
    Lean.logInfo m!"RUN86_AXIOMS|{n}|{axioms}"
  let info ← Lean.getConstInfo ``RHPrimeWindow84.primeError_chord
  let some value := info.value? (allowOpaque := true) |
    Lean.throwError "RUN86 chord proof missing"
  let deps := value.getUsedConstants
  let required : Array Lean.Name := #[``primeError_eq_sum,
    ``lambdaClass_nonneg_and_abs_le, ``RHPrimeWindow84.hinge,
    ``RHPrimeWindow84.log_correction]
  for n in required do
    unless deps.contains n do
      Lean.throwError m!"RUN86 expected supplier absent: {n}"
  for n in [Lean.Name.str (``RHPrimeWindow84) "reciprocal_curvature",
      Lean.Name.str (``RHPrimeWindow84) "eventual_from_cover"] do
    if deps.contains n then
      Lean.throwError m!"RUN86 unnecessary helper retained: {n}"
  Lean.logInfo m!"RUN86_CHORD_DIRECT|{deps.map Lean.Name.toString}"
  Lean.logInfo "RUN86_LOCAL_GUARDS_OK"

#print axioms RHPrimeWindow84.hinge
#print axioms RHPrimeWindow84.log_correction
#print axioms RHPrimeWindow84.primeError_chord
