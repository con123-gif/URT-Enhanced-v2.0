import Development.AutomorphicArithmetic.MeanSquareBounds.PrimeSetTwoBounds
import Development.AutomorphicArithmetic.CharacterBoxes.PairGood
import Development.AutomorphicArithmetic.MeanSquareBounds.Thin
import Development.AutomorphicArithmetic.MeanSquareBounds.realCond
import Development.AutomorphicArithmetic.MeanSquareBounds.SmallZeros
import Development.AutomorphicArithmetic.ConductorsKronecker.realClass

open Finset Formalism.HermitianLattices.ZeroFreeRegionGL2 Formalism.HermitianLattices.Ext.LogarithmicIntegralBounds

/-!
RUN28, lane 13 (STRUCTURE), 25 Nov 2026.
STATUS: SOURCE-MATCHED human reconstruction / PREPARED Lean adapter, NOT kernel-checked.
One contribution: reuse the existing native realClass lemma at the actual thinH
supplier, rather than reprove conductor divisibility and quadratic classification.
Original native interface UpperTheory.Top.ThinH unchanged.

Compact proof block for the shared HUMAN_PROOF_ONE_EQUATION.md:
Let B be fixed before the scale x is varied, with oddPart(QS) <= B.
For a primitive host character of conductor N, realClass gives N | QS*q*d.
If the character is real, either N | 8*oddPart(QS), or q | N or d | N.
In the first case N <= 8*floor(B); the finitely many nonprincipal characters
in these moduli have L(1,chi) != 0, so by continuity and a finite minimum
there is a common positive real zero gap c_s (native QH.small_zeros).
In the other case the native RealBox gives the gap 1/400. Thus every
nonprincipal real primitive host character has no real zero in
(1-min(c_s,1/400),1). Nonreal and principal cases require no such premise
in QH.thin. Since log N <= log(QS*q*d) <= 2*x^(eps/5)*(log x)^2,
native QH.thin yields, uniformly in ALL host characters and y >=
exp(x^(eps/3))/3, the one bound
    |gChi(chi,y)| <= y exp(-x^(eps/8)).
The identity gChi = G0 is the original finite ramp identity, with the
same signs and endpoint. QH.thin uses psi_thin, g_integral and int_thin;
their proof bodies and axiom dependencies are retained, not replaced by
a claimed independent explicit formula.
The actual hostOfFieldOf uses QH.thinH, not thinChoice_host. Its fixed
B=C0 comes from oddPart(QS) | M, M<=C0, as supplied by hof_odd and
the original QS | lcm(2^(e+2),M) premise. This is stronger than
a growing conductor estimate and requires neither an appeal to Siegel's
theorem nor a new exceptional-zero bound. The entire previously proposed
RUN27 exceptional residual is therefore unnecessary at this consumer
when the ORIGINAL real boxes and common host inputs are available.
It does NOT show those boxes exist; keep the native PairGood/RealBox
producer and all other consumers. No assertion about the actual proof
of the final RH window or global obligation counts.

Original source pin 40e56bab026552e089d7afcfeff08d2defb9c005.
src/Development/AutomorphicArithmetic/MeanSquareBounds/GaussSumFunctionEq.lean blob 968a1de1c152dbdfca07fecc96d6ce2826d4938b
src/Development/AutomorphicArithmetic/ConductorsKronecker/realClass.lean blob 6c587ab6f70e0c6596f85650ac579323be4edba5
src/Development/AutomorphicArithmetic/MeanSquareBounds/Thin.lean blob d322f531dc42b40bee2cddc76f83f53a2f592ba6
src/Development/AutomorphicArithmetic/MeanSquareBounds/SmallZeros.lean blob 181f5dee248928e109c200108f64da26ec04d21a
src/Development/AutomorphicArithmetic/ShortNorms/hostOfFieldOf.lean blob 261b566b0ea0d155ef1a434889d720c3b439735f
src/Development/AutomorphicArithmetic/CharacterBoxes/HostOfField.lean blob d98214b25bf84966a5b4e858a35f21ac9193b49f
src/Development/AutomorphicArithmetic/CharacterBoxes/ThinChoice.lean blob 00b6f5fe9348e1d26ef97b7cdcc16ada3a38b489
src/Development/AutomorphicArithmetic/ConductorsKronecker/OddQSLe.lean blob 0ce276c8360deffbf94a62fd3d4ccb51988d7294
Actual root-visible supplier trace: Main -> rhOfAll -> allChi ->
everyCharacter -> third-place TopG/Green -> supplyOfAdm -> hostOfField ->
hostOfFieldOf -> QH.thinH -> ThinOK -> thinScales_iff_hostBound/Pt.From.chThin.
The same-host tie and actual top call are required; this is a source-visible
trace, not an additional authenticated kernel graph. Original typed graphs,
axiom ledger, prior candidate overlays and unresolved obligations untouched.
Candidate local overlay: thinH_reuse_realClass -> realClass (conductor
divisibility + classification), small_zeros, thin, ramp equality, RealBox.
The imported realClass module has broader imports; do not equate import
edges to proof-value dependencies. Verify that there is no cycle in actual
elaborated references before accepting at caller level.
Context key: pinned source, actual H, B=C0 fixed, eps, RealBox, conductor,
same-host field tie; do not cache across changes to these.

Latest mission blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc read, including
unified engine; SWARM, AGENTS, handoff, state/log/protocol/continuity
excerpts and live manuscript reviewed. Peer head observed 1f91435b;
c063b20c, eaa84d5c, 359a3b34, eae577c6 and ff5f42b9 consulted.
Prior URT ranking had no demonstrated advantage; direct reuse here.

Executed this run: 22 fail-on-error source/transformation assertions
in connector JavaScript (eight pinned blob hashes, exact original call,
fixed B tie, exact realClass statement, preservation of native constants,
theorem interface, branch guards, input calls, no explicit new trust
declaration, no root shortcut). Replaced exceptional branch 35
source lines by 11; local source metric ONLY, not proof length or
global dependency count. No numerical proxy used. Native lean/lake absent;
git ls-remote failed DNS; GitHub connector succeeded. Existing baseline
CI actual status and outputs/result.json inspected: 45577239749 and
45576756833 returncode 0; conditional root only propext, Classical.choice,
Quot.sound; bounded scan 2000 visited and 324 pending. Those results do
not verify this new adapter. Initial attempts to read result.json at
compute job root failed 404; recovered under outputs/result.json.
Backtracked from new Siegel/exceptional estimates after locating actual
native thinH and the existing realClass. No new analytic input added.

RESUME HERE: Compile this file in the exact pinned Lean environment;
run rh_scan and rh_prune on QH.thinH and QH.thinH_reuse_realClass,
compare constructor/type/value and axiom ledgers, then substitute
the new term at the actual hostOfFieldOf call. With existing engine
imports available, try rh_reduce using [QH.thinH_reuse_realClass] at
the ThinH goal and rh_auto/rh_auto_frontier on the actual caller.
If the branch introduces extra trust dependencies, backtrack to native
thinH; do not delete the original graph. Only then integrate the short
proof block; next mathematical frontier is native PairGood/RealBox
existence and the separate signed pointwise correction at x.
HANDOFF TO: integration/editor, audit, kernel extractor.
-/

namespace QH

private theorem gauss_sum_function_eq {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) (y : ℝ) :
    Formalism.HC.An.gChi χ y = G0 χ y := by
  have key : ∀ n ∈ Icc 1 ⌊y⌋₊, max (y / (n : ℝ) - 1) 0 = y / n - 1 := by
    intro n hn
    rw [Finset.mem_Icc] at hn
    have hy1 : 1 ≤ y := Nat.floor_pos.1 (by omega)
    have hn1 : (1 : ℝ) ≤ n := by exact_mod_cast hn.1
    have hny : (n : ℝ) ≤ y := (Nat.cast_le.2 hn.2).trans (Nat.floor_le (by linarith))
    have : 1 ≤ y / n := by rw [le_div_iff₀ (by linarith)]; linarith
    exact max_eq_left (by linarith)
  unfold Formalism.HC.An.gChi G0
  by_cases h : χ = 1
  · simp only [h, if_true]
    congr 1
    unfold Formalism.HC.An.G G1
    congr 1
    exact Finset.sum_congr rfl fun n hn => by rw [key n hn]
  · simp only [h, if_false]
    unfold Formalism.HC.An.sumLamChi Gchi
    congr 1
    exact Finset.sum_congr rfl fun n hn => by rw [key n hn]

private theorem isReal_of_sq {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) (h2 : χ ^ 2 = 1) (a : ZMod N) :
    (χ a).im = 0 := by
  by_cases ha : IsUnit a
  · have h := congrArg (fun f : DirichletCharacter ℂ N => f a) h2
    simp only [pow_two, MulChar.one_apply ha] at h
    rw [MulChar.mul_apply] at h
    have hz : χ a = 1 ∨ χ a = -1 := by
      have : (χ a - 1) * (χ a + 1) = 0 := by ring_nf; rw [← pow_two] at h; rw [h]; ring
      rcases mul_eq_zero.1 this with h1 | h1
      · left; linear_combination h1
      · right; linear_combination h1
    rcases hz with hz | hz <;> simp [hz]
  · simp [MulChar.map_nonunit χ ha]

theorem thinH_reuse_realClass :
    UpperTheory.Top.ThinH := by
  refine ⟨1, one_pos, fun B eps he he52 => ?_⟩
  obtain ⟨c₀s, hc₀s, hsmall⟩ := small_zeros (8 * ⌊B⌋₊)
  have hc₀ : 0 < min c₀s (1 / 400) := lt_min hc₀s (by norm_num)
  obtain ⟨x₀, hx₀⟩ := thin eps 2 1 (min c₀s (1 / 400)) he two_pos one_pos hc₀
  refine ⟨x₀, fun x hx φ H hB hlog hRB => ?_⟩
  intro N _ χ hχ y hy
  rw [gauss_sum_function_eq]
  have hprim : χ.IsPrimitive := by
    obtain ⟨θ, hθ⟩ := hχ
    exact hθ.1
  obtain ⟨hNd, hclass⟩ := UpperTheory.GL.realClass H N χ hχ
  have hNpos : 0 < N := Nat.pos_of_ne_zero (NeZero.ne N)
  have hlogN : Real.log N ≤ 2 * x ^ (eps / 5) * Real.log x ^ 2 :=
    (Real.log_le_log (by exact_mod_cast hNpos)
      (by exact_mod_cast Nat.le_of_dvd H.condN_pos hNd)).trans hlog
  refine hx₀ x hx N χ hprim hlogN ?_ y hy
  intro h2 h1 β hβ hβ1
  have hr := isReal_of_sq χ h2
  rcases hclass hr with hN | hqd
  · have hQ0 : H.QS ≠ 0 := H.QS_pos.ne'
    have hN0 : N ∣ 8 * (H.QS / 2 ^ H.QS.factorization 2) := hN
    have hopos : 0 < H.QS / 2 ^ H.QS.factorization 2 := Nat.ordCompl_pos 2 hQ0
    have hofl : H.QS / 2 ^ H.QS.factorization 2 ≤ ⌊B⌋₊ := Nat.le_floor hB
    have hNle : N ≤ 8 * ⌊B⌋₊ := (Nat.le_of_dvd (by omega) hN0).trans (by omega)
    exact hsmall N χ hNle h1 β (by have := min_le_left c₀s (1 / 400); linarith) hβ1
  · exact hRB (Formalism.HC.PChar.mk N χ hprim) hχ hr hqd β
      (by have := min_le_right c₀s (1 / 400); linarith)

end QH

#print axioms QH.thinH_reuse_realClass
#print axioms UpperTheory.GL.realClass
#print axioms QH.thin
