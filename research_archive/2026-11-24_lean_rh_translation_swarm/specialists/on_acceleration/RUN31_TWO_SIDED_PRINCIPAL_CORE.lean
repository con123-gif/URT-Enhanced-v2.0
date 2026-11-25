import Development.AutomorphicArithmetic.PrimitiveCosets.CoreGm
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN31 — eliminate one-sided height transport at the principal CoreAtH caller.
25 Nov 2026; lane 14; SOURCE-MATCHED HUMAN REDUCTION; Lean scalar bridge
PREPARED, not compiled. RH OPEN. No new prime asymptotic or geometry proof.

Preflight: current ONE_EQUATION_MISSION blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc
including mandatory engine, AGENTS, SWARM, HANDOFF, EXPANSION, live manuscript
and RUN30. Read peer results 188850b1 (direct signature chain), e627db49
(editor signed mass slack), a543f365 (far-range average), bb29422d
(prime finite anchor), and latest commit summaries. Existing integration
dd7cd00b proves the one-sided height guard from ChainTied. That is valid
and remains a sharper alternative. This replacement avoids that transport
entirely at the principal consumer, not another proposal to prove RH.

Proof block for section 2:
Fix principal level o=1, the actual same host and ell. The native
card_PsiA and index_A0_eq_o give A0=H, exactly four signed modes.
Prim_read and primitive_value_pow/orthogonality_ramified identify
F(y)=G(y)+J(y)=sum_n a_n*(y/n-1)_+ - y log y + L*y,
where 0<=a_n=c_n*Lambda(n)<=4 Lambda(n) and L is fixed on the host.
Let H(y)=F(y)/y+log y. Then H(y)=L+sum_n a_n*(1/n-1/y)_+.
Unlike RUN30, use only the ORIGINAL SizesA premise |y_t-x|<=1.
For x>=3 and x-1<=y<=x, max(.,0) is monotone and 1-Lipschitz, so
  0 <= H(x)-H(y) <= (1/y-1/x)*sum_{n<=x} a_n.
Since Lambda(n)<=log n and n<=x, sum_{n<=x} a_n<=4*x*log x,
without invoking any prime distribution theorem. Because log(y/x)<=0,
  y*(F(x)/x-F(y)/y) <= (x-y)/x * sum_{n<=x} a_n <=4 log x.
For x<=y<=x+1, H(y)>=H(x) and log(y/x)<=y/x-1, hence
  F(y)>=(y/x)*F(x)-y*(y-x)/x >=(y/x)*F(x)-2.
Combine both cases with K=4 log x+2>=0:
  F(y)>=(y/x)*F(x)-K.
If r=|TT|>0, S=sum_t y_t >=r*(x-1)>0 and native core's Fourier
average yields sum_t F(y_t)<=r E, E=2 Err/(Qd)+4/(xd)>=0, then
  F(x) <= (x*r/S)*(E+K) <= x/(x-1)*(E+K) <= 3/2*(E+K).
Thus native sigA_le gives directly
  G(x) <= 3/2*(2 Err/(Qd)+4/(xd)+4 log x+2)
          +3*x^(1/2+eps).
The factor 3/2 and logarithmic error are absorbed by the same positive
epsilon slack at a larger eventual threshold. The sharper RUN30 bound
E+1 remains available when the one-sided sign is transported.
No hY derivative estimate, log-derivative bounds, or one-sided height
guard needed at this principal consumer. The signed correction and
all geometric suppliers, ThinScales, CostWindows, same-host
compatibility and actual window quantifiers are retained. Do not drop
bdL or other shared premises globally. No new proof of any supplier.

Original source-visible graph: core_gm -> ch_core -> one_char,
derivative_integral_all, core, proposition_size_bound; core_gm -> charsA,
gmA_eq, sigA_le, ch_top. RUN30 overlay additionally transports the
ChainTied sign via linkGLOBAL_of. Candidate overlay: principal core_gm
-> core average, normalized positive-hinge bound, scalar size budget,
sigA_le, original ch_top/geometric inputs. Retain original graphs
RUN25 and all structural/type/value/axiom edges; local overlay only,
not elaborated extraction. Cache by pin, host, ell, x, actual TT,
all heights, o=1, geometry budget and caller; backtrack to original
or RUN30 for incompatible context or failed replay.

Exact pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Read actual bodies:
src/Development/AutomorphicArithmetic/PrimitiveCosets/CoreGm.lean
  3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d, core_gm.
same directory CoreAtH.lean 0ba3621036f19146e7e67fa9c0e8a1c38661a097
  (SizesA is the existing guard); CardPsiA.lean 4fe4ded735dd1ba55db3a01fc181ad794a2c4a0a;
GmAEq.lean 2f1a763f43d65eea1f6e61018c8b70c02d2dfa03;
SigALe.lean e9c80e2017ec149ac559bc20c164b9264b9ec0c2;
charsA.lean 7d6a3faa3f6dcc1923a65473d848d8da0601e7a2.
src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/
  ChCore.lean 878f5077bc382426c7da988e5a375b85deeaa7de
  (core, ch_core, original two-sided guard, hY).
src/Development/AutomorphicArithmetic/DedekindLFunctions/CharFamily.lean
  81c8dfd66d910d083d5bc88c664c7917fdbdfe96, Gchi and ramp.
src/Formalism/SizeWindowBrackets/ChainSlopeWindows/StronglyIrreducible.lean
  94a385f59f3781ae6b1ab4beddc73850708a2bc6, primitive_value_pow,
  orthogonality_ramified.
src/Formalism/SharpRestriction/GlobalSchurBounds/QuadraticLogDerivCongr.lean
  7828c8b1060818fe158e23f87f1ad9e2efcf79eb, original sign producer.
Upstream latest observed 8e5cefeeaffe7e4c12153385b7bb33fb7223c41a
11:57:33Z; not mixed with initial pin.

Executed exact CPython certificate run31_twosided.py (not native geometry):
actual 4203 primes, 4285 prime powers, q=3,d=23; 5772139 exact
coefficient/normalized-hinge comparisons, two negative controls.
Both algorithms on identical coefficients and controlled rational
heights. In any interval of length <=2, at most two integer thresholds
are strictly internal. Aggregate hinge numerator is S-T*n below lo,
0 above hi, and explicit hinge sum for those two thresholds only
(with common denominator restored). Thus O(P+T) arithmetic operations,
O(P) output, O(1) extra threshold state; excludes prime generation,
sorting, big integer complexity. No URT scheduling in deterministic
factorization; earlier ablations gave no established advantage.
Native process peak RSS 96656 KiB (whole process, not method-specific).
Cold here means first in-process call, not filesystem cold.
T=64: 4282 rows; direct cold/warm 18.929027/17.0989395 ms;
reduced 0.430277/0.42573 ms.
T=256: direct 62.610877/66.2684775; reduced 0.434633/0.4913335 ms.
T=1024: direct 265.215034/265.859261; reduced 0.711547/0.7792245 ms.
All 7 repetitions per method; full output retained in result JSON.
Exact executable Git blob expected 866d6c700d851cd14615f437da9c80f834042040.
No finite-to-infinite inference; no whole-RH speed claim.

No lean/lake on local PATH. Re-read actual CI status files
45577239749 return 0, 98.87s, blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc;
45576756833 return 0, 77.94s, blob 7da354941e402b6f8b364ed03d8c5c82d27b7717.
Only prior tools/conditional strip root validated, with original
propext, Classical.choice, Quot.sound; scan pending 324.
No new native PASS or axiom audit claimed. Prepared scalar replay
and actual-theorem scan below; full ramp/caller formalization pending.

RESUME HERE: integration/audit compare this generic two-sided
principal bridge with the existing sharper ChainTied sign version;
kernel replay both at the real core_gm caller; keep the shorter
proved path. Then stop optimizing shifts and focus on actual open
same-host geometric/arithmetic suppliers. HANDOFF TO integration,
editor, audit and kernel. PARTIAL.
-/

namespace RHTwoSided31

theorem hinge_lip (u v z : ℝ) (h : v ≤ z) :
    0 ≤ max (u-v) 0 - max (u-z) 0 ∧
    max (u-v) 0 - max (u-z) 0 ≤ z-v := by
  constructor
  · have hh := max_le_max (show u-z ≤ u-v by linarith) (le_refl (0:ℝ))
    linarith
  · by_cases hv : 0 ≤ u-v
    · rw [max_eq_left hv]
      have hh := le_max_left (u-z) (0:ℝ)
      linarith
    · rw [max_eq_right (by linarith : u-v ≤ 0)]
      have hh := le_max_right (u-z) (0:ℝ)
      linarith

theorem two_sided_budget (x T S F E K : ℝ) (hx : 3 ≤ x)
    (hT : 0 < T) (hS : (x-1)*T ≤ S) (hE : 0 ≤ E) (hK : 0 ≤ K)
    (h : S*F ≤ x*T*(E+K)) : F ≤ (3/2)*(E+K) := by
  have hs : 0 < S := lt_of_lt_of_le (mul_pos (by linarith) hT) hS
  have hn : 0 ≤ (3/2:ℝ)*(E+K) := by positivity
  have hb := mul_le_mul_of_nonneg_right hS hn
  have hxx : x ≤ (3/2)*(x-1) := by linarith
  have hc : x*T*(E+K) ≤ ((x-1)*T)*((3/2)*(E+K)) := by
    calc
      x*T*(E+K) = x*(T*(E+K)) := by ring
      _ ≤ ((3/2)*(x-1))*(T*(E+K)) :=
        mul_le_mul_of_nonneg_right hxx (by positivity)
      _ = ((x-1)*T)*((3/2)*(E+K)) := by ring
  by_contra hneg
  have hf : (3/2)*(E+K) < F := lt_of_not_ge hneg
  have ha := mul_lt_mul_of_pos_left hf hs
  nlinarith

theorem replay (x T S F E K : ℝ) (hx : 3 ≤ x)
    (hT : 0 < T) (hS : (x-1)*T ≤ S) (hE : 0 ≤ E) (hK : 0 ≤ K)
    (h : S*F ≤ x*T*(E+K)) : F ≤ (3/2)*(E+K) := by
  first
  | (rh_reduce 3 using [two_sided_budget]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact two_sided_budget x T S F E K hx hT hS hE hK h

end RHTwoSided31

rh_scan Deduction.ch_core limit 2000
rh_prune Deduction.CharacterBalanceMoves.core as RH31OriginalCoreCandidate
rh_prune RHTwoSided31.two_sided_budget as RH31BudgetPruned
#print axioms Deduction.ch_core
#print axioms RHTwoSided31.hinge_lip
#print axioms RHTwoSided31.two_sided_budget
#print axioms RHTwoSided31.replay
