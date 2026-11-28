import DepCountEscape82
import Lean

/-!
# Dependency RUN85 — constant-free weighted prime window, exact chain transport
28 November 2026. SOURCE-MATCHED HUMAN DERIVATION / PREPARED, NOT compiled.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Current mission/spine/ledger 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, SWARM, HANDOFF, continuity and state/protocol read. Relevant peer
commits: 1ee12799532d9ac29360af641b1a2057be5398d8 (fixed-P VK tail and
deterministic second-scale endpoint), 69d79aa21682b61e21ba3b423874075a11dcbe3f
(canonical selected count), 8ca68829003007c5efeb604caa6ed37ddac12814
(actual main-height sign). Do not reopen their suppliers. RUN84 pair mean
preserved. Prior old-pin window transport a670dc1c is distinct; do not
import old-pin results into compact native proof.

Native PrimeError.lean blob 63eb3d79d95ad815878e623b96f237240058c8e2;
OneSidedCriterion 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3;
PolarLandau 6b80c9062a74ecadcd9c51f9459cb3c71ac2ded9;
ZeroFreeTwist 1d873bd3fef2c4ba301ce38e0469cc1817e6aa11.
Exact RUN82 blob edfb195d5ef76d7a46b7cadcfa64f9f9cb7c66e9 and RUN88
commit a2b7ab4b1307b0a1cd5041ac9ff0092c829473ca, native endpoint-grid caller.

## Exact weighted prime lower bound, no log-derivative constant

Fix d,M satisfying the same arithmetic guards, and write
lambda(n)=Lambda(n)(1-chi_K(n)) on n=1 mod M, zero otherwise.
For 1<=x<y define A(t)=sum_{n<=t} lambda(n).
Subtract the two exact native primeError_eq_sum formulas with the SAME
finite cutoff >=y. The constant Re logDerivMean(d,M,1) cancels exactly.
Termwise positive-part subtraction gives the nonnegative kernel

  W(x,y) = (1/x-1/y) sum_{n<=x} lambda(n)
         + sum_{x<n<=y} lambda(n)(1/n-1/y)
         = integral_x^y A(t)/t^2 dt.

Thus
  R_d(x)-R_d(y) = log(y/x)/phi(M) - W(x,y).              (1)

No unknown constant is needed to EVALUATE the arithmetic lower bound.
The PNT normalization is still required downstream: fixed-P tail from
the peer audit gives R_d(t)->0, unconditional for each fixed d,M.
No uniformity in d is needed. For sufficiency one may use W_primes
restricted to primes p (lambda(p)=log p*(1-chi_K(p)) in the same class):
W_primes<=W by nonnegativity. For fixed d,M and y>=x>=2, the omitted
prime-power mass is O(x^(-1/2) log^2 x), independently of y. Indeed
A_powers(t)<=2 sqrt(t) (log t)^2/log 2 by bounding the number of bases
by sqrt(t) for each exponent 2<=j<=log_2 t; integrate A_powers(t)/t^2
from x to infinity. For any fixed exponent a>-1/2 this is o(x^a).
This elementary tail bound is not a new prime distribution theorem.

## Actual chain transport to RUN82 (not an asserted arithmetic estimate)

Fix epsilon in (0,0.01), a=4epsilon-1/2<0, x=k^4, r(k)=x^a.
Keep d fixed BEFORE varying k. For every sufficiently large integer k,
it is enough to find ONE integer l>k with r(l)<=r(k)/2 and
  W(k^4,l^4) >= log(l^4/k^4)/phi(M) - r(k)/2.            (2)
The endpoint l can depend on k,d,epsilon. No common endpoint required.
Proof: (1) gives f(k)-f(l)<=r(k)/2, f(k)=R_d(k^4).
Put g(k)=f(k)-r(k). Then
  g(k)-g(l) <= -r(k)/2+r(l) <=0.
If g(k)>0, iteratively choose such l. Indices tend to infinity; along
them g is nondecreasing and positive, but g(j)<=f(j)->0, contradiction.
This proves f(k)<=r(k), exactly RUN88.EndpointGrid d M (epsilon/2),
without any extra exponent or constant loss. For prime-only W use the
same argument by W_primes<=W. RUN82's original count and twist density
selector, chord, signed Landau and reflection are unchanged. The explicit
limit f->0 is retained as a premise of the prepared Lean adapter; its
human proof is supplied by the audited fixed-modulus PNT tail, not assumed
RH or native replay.

This gives a fully constant-free arithmetic lower-bound formulation
at each grid point. It is NOT a claim that (2) holds, or that the
all-tolerance problem is strictly weaker. Indeed the old CountEscapeGrid
at tolerance epsilon/2 yields f(k)<=x^(2epsilon-1/2)=o(r(k)), on its
same prime set. For large k make f(k)<=r(k)/8, and choose l arbitrarily
large so |f(l)|<=r(k)/8, r(l)<=r(k)/2. Then the gap is <=r(k)/4.
The omitted prime powers are <=r(k)/4 for large k, so even the prime-only
(2) follows. CountEscape at epsilon/2 implies CountEscape at epsilon:
the latter Big-O comparison exponent is smaller (1-2epsilon/9 vs
1-epsilon/9). Thus on fixed-modulus PNT normalization the all-tolerance
criteria are equivalent. This removes normalization constants from
the numerical arithmetic target, not the unsolved arithmetic problem.

A condition only on arbitrarily distant isolated starting points is
not enough for this proof: the next l might fall outside the good-start
set. Likewise no upper bound on l is imposed here; a fixed upper bound
would require a separate proof. Negative control without f->0:
f(k)=1, r(k)=2^(-k), l=k+1 satisfies the gap and contraction but violates
the claimed endpoint for every positive k. Without contraction:
f(k)=1/k, r(k)=1/k^2, l=k+1, the gap is <=r(k), but f(k)>r(k);
adjusting to half-budget with f(k)=1/(2k) gives the same obstruction.
Do not confuse isolated-window tests with a proved asymptotic inequality.

## Actual verification and continuation
Executed local Python fractions.Fraction: 31,588 exact common-cutoff
hinge-vs-piecewise coefficient tests (x=1..24, y=x+1..48, A=y+7,
n=1..A), and 1,320 exact geometric-chain sharpness checks (initial
r=1..8, q=1/2,1/3,3/4, C=0..4, steps=1..11; f_i=C*r*q^i/(1-q)).
No failures. These are scalar regression controls, NOT native prime
estimates. Local command -v lean/lake empty. RUN99 shared status path
compute/rh-compact-prime-count-budget-20261128/status.json returned 404.
Registry blob 6aed3abf333c2ed3c0f5517874c37a5cf8a8e0b4 confirms queued
RUN99; no accepted receipt observed. Orchestrator run 46126674200
is a physical/regression receipt, not native endpoint proof.
No native rh_scan/prune/reduce/auto/frontier, kernel or graph PASS.
Original/reduced graphs, old endpoints and all A/B/C obligations retained.
No duplicate cold build or schedule/workflow changes.

RESUME HERE: in the authenticated RUN99 endpoint workspace, after actual
DepCountEscape82 receipt, compile this file as DepWindowChain85. Repair
first actual diagnostic, require all named standard-axiom and exact
supplier guards; then connect the independently audited fixed-P PNT
tail to the explicit limit premise. Do not claim the window lower bound
or RH. The next mathematical need is the actual lower bound (2) for
enough primes, not another normalization reformulation.
HANDOFF TO prime / integration / kernel / audit. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open ArithmeticFunction DirichletCharacter Complex Finset Filter
  MeasureTheory Nat Real vonMangoldt ZMod Set Topology

namespace RHDepWindowChain85

noncomputable def windowMass (d M A : ℕ) [Fact d.Prime] (x y : ℝ) : ℝ :=
  ∑ n ∈ Finset.Icc 1 A, lambdaClass d M n *
    (((A : ℝ)/n-(A : ℝ)/y)⁺ - ((A : ℝ)/n-(A : ℝ)/x)⁺) / (A : ℝ)

theorem primeError_window_gap (d M A : ℕ) [Fact d.Prime] [NeZero M]
    {x y : ℝ} (hx : 0 < x) (hy : 0 < y)
    (hX : x ≤ A) (hY : y ≤ A) :
    primeError d M x - primeError d M y =
      (Real.log y - Real.log x)/(Nat.totient M : ℝ) -
        windowMass d M A x y := by
  have hmass : windowMass d M A x y =
      (∑ n ∈ Finset.Icc 1 A, lambdaClass d M n *
        ((A : ℝ)/n-(A : ℝ)/y)⁺ / (A : ℝ)) -
      (∑ n ∈ Finset.Icc 1 A, lambdaClass d M n *
        ((A : ℝ)/n-(A : ℝ)/x)⁺ / (A : ℝ)) := by
    unfold windowMass
    rw [← Finset.sum_sub_distrib]
    apply Finset.sum_congr rfl
    intro n hn
    ring
  rw [primeError_eq_sum (d := d) (M := M) A hx hX,
    primeError_eq_sum (d := d) (M := M) A hy hY, hmass]
  ring

/-- Finite reachability contradicts the limiting bound. No infinite
choice sequence or convergence of a new infinite series is needed. -/
theorem eventual_of_contracting_step {f r : ℕ → ℝ}
    (hf : Tendsto f atTop (𝓝 0))
    (hpos : ∀ᶠ k in atTop, 0 ≤ r k)
    (hstep : ∀ᶠ k in atTop, ∃ l : ℕ, k < l ∧
      r l ≤ r k/2 ∧ f k - f l ≤ r k/2) :
    ∀ᶠ k in atTop, f k ≤ r k := by
  obtain ⟨K,hK⟩ := eventually_atTop.1 (hpos.and hstep)
  refine eventually_atTop.2 ⟨K,?_⟩
  intro k hk
  by_contra hn
  let g : ℕ → ℝ := fun j => f j - r j
  have hp : 0 < g k := by
    dsimp [g]
    linarith [lt_of_not_ge hn]
  obtain ⟨L,hL⟩ := eventually_atTop.1 (hf (Iio_mem_nhds hp))
  have reach : ∀ n : ℕ, ∃ j : ℕ, k+n ≤ j ∧ g k ≤ g j := by
    intro n
    induction n with
    | zero => exact ⟨k,by simp,le_rfl⟩
    | succ n ih =>
      obtain ⟨j,hj,hgj⟩ := ih
      obtain ⟨l,hjl,hr,hf'⟩ := (hK j (by omega)).2
      have hgl : g j ≤ g l := by
        dsimp [g]
        linarith
      exact ⟨l,by omega,hgj.trans hgl⟩
  obtain ⟨j,hj,hgj⟩ := reach L
  have hgj' : g j ≤ f j := sub_le_self _ (hK j (by omega)).1
  exact (not_lt_of_ge (hgj.trans hgj')) (hL j (by omega))

noncomputable def scaleBudget (η : ℝ) (k : ℕ) : ℝ :=
  ((k : ℝ)^4)^(8*η+2⁻¹-1)

def WindowGapGrid (d M : ℕ) [Fact d.Prime] (η : ℝ) : Prop :=
  ∀ᶠ k : ℕ in atTop, ∃ l : ℕ, k < l ∧
    scaleBudget η l ≤ scaleBudget η k/2 ∧
    (Real.log ((l : ℝ)^4) - Real.log ((k : ℝ)^4))/(Nat.totient M : ℝ) -
      windowMass d M (l^4) ((k : ℝ)^4) ((l : ℝ)^4) ≤ scaleBudget η k/2

theorem endpoint_of_window_gap (d M : ℕ) [Fact d.Prime] [NeZero M]
    (η : ℝ)
    (hf : Tendsto (fun k : ℕ => primeError d M ((k : ℝ)^4)) atTop (𝓝 0))
    (hw : WindowGapGrid d M η) :
    RHPrimeWindow88.EndpointGrid d M η := by
  have hpos : ∀ᶠ k : ℕ in atTop, 0 ≤ scaleBudget η k :=
    Filter.Eventually.of_forall fun k => Real.rpow_nonneg (by positivity) _
  have hstep : ∀ᶠ k : ℕ in atTop, ∃ l : ℕ, k < l ∧
      scaleBudget η l ≤ scaleBudget η k/2 ∧
      primeError d M ((k : ℝ)^4) - primeError d M ((l : ℝ)^4) ≤
        scaleBudget η k/2 := by
    filter_upwards [hw,eventually_ge_atTop (1 : ℕ)] with k h hk
    obtain ⟨l,hkl,hr,hgap⟩ := h
    have hk' : (0 : ℝ) < k := by exact_mod_cast (show 0 < k by omega)
    have hl' : (0 : ℝ) < l := by exact_mod_cast (show 0 < l by omega)
    have hkl' : (k : ℝ) ≤ (l : ℝ) := by exact_mod_cast hkl.le
    have hA : ((l^4 : ℕ) : ℝ) = (l : ℝ)^4 := by norm_cast
    have hxA : (k : ℝ)^4 ≤ ((l^4 : ℕ) : ℝ) := by
      rw [hA]
      exact pow_le_pow_left₀ hk'.le hkl' 4
    refine ⟨l,hkl,hr,?_⟩
    rw [primeError_window_gap d M (l^4) (by positivity) (by positivity)
      hxA hA.ge]
    exact hgap
  exact eventually_atTop.1 (eventual_of_contracting_step hf hpos hstep)

def WindowCount : Prop :=
  ∀ ε : ℝ, 0 < ε / 6 ∧ ε < 1 / 100 → ∃ S : Set ℕ,
    RHDepCountEscape82.CountEscape S (4*ε/9) ∧
    ∀ d : Primes, d.1 ∈ S →
      (d.1 % 8 = 7 ∧ (18480 : ℕ).Coprime d) ∧
      Tendsto (fun k : ℕ => primeError d 18480 ((k : ℝ)^4)) atTop (𝓝 0) ∧
      WindowGapGrid d 18480 (ε/2)

theorem zeta_line_from_window_count (h : WindowCount) :
    RiemannZetaZerosOnLine := by
  apply RHDepCountEscape82.zeta_line_from_count_escape_grid
  intro ε he
  obtain ⟨S,hcount,hS⟩ := h ε he
  refine ⟨S,hcount,?_⟩
  intro d hd
  obtain ⟨hguard,hlim,hgap⟩ := hS d hd
  exact ⟨hguard,endpoint_of_window_gap d 18480 (ε/2) hlim hgap⟩

end RHDepWindowChain85

#print axioms RHDepWindowChain85.primeError_window_gap
#print axioms RHDepWindowChain85.eventual_of_contracting_step
#print axioms RHDepWindowChain85.endpoint_of_window_gap
#print axioms RHDepWindowChain85.zeta_line_from_window_count

open Lean in
run_cmd do
  for (n,req) in #[
    (``RHDepWindowChain85.primeError_window_gap, #[``primeError_eq_sum]),
    (``RHDepWindowChain85.eventual_of_contracting_step, #[]),
    (``RHDepWindowChain85.endpoint_of_window_gap,
      #[``RHDepWindowChain85.primeError_window_gap,
        ``RHDepWindowChain85.eventual_of_contracting_step]),
    (``RHDepWindowChain85.zeta_line_from_window_count,
      #[``RHDepWindowChain85.endpoint_of_window_gap,
        ``RHDepCountEscape82.zeta_line_from_count_escape_grid])] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "RUN85 unexpected axiom {n}: {axs}"
    let i ← getConstInfo n
    let some v := i.value? (allowOpaque := true) | throwError "RUN85 missing value {n}"
    unless req.all (fun a => v.getUsedConstants.contains a) do
      throwError "RUN85 missing supplier {n}"
  logInfo "RUN85_CONSTANT_FREE_WINDOW_CHAIN_GUARDS_OK"
