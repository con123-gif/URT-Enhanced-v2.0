import New.Columns.LocalStatement
import Mathlib.Tactic

/-!
# RUN62 — marked jet gauge at the actual A caller
2026-11-26. Human source-matched derivation; native replacement not
compiled, independent mathematical audit pending. Credit Levent Alpöge,
Luke Sernau, Anthropic collaborators and Claude.
Source pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10.
Latest peer frontier 10d4fd45804d5eb316adcf81ab550e692136fda6.
Predecessor 6bae6781 split chain; peer 36a56d6c null frames and Schur
jets explicitly leaves charge and determinant conversion open;
11b88ad1 archimedean chain, 6843df9f level-N chain, 10d4fd45
theta basis and vacuum expansion. Do not duplicate these.

Actual pinned source bodies:
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
  106-144 mem_raises; 148-200 marked transfer/chain; 255-309 local index.
New/Columns/JetExponentBound.lean bedef08c7c1707f74e9afce0c8008b88ba37dc8a
  34-104 marked symmetry; 115-153 collision; 155-230 exponent/low bounds.
New/Exchange/CrudeModularData.lean 2be49b2690280e070d21691f8a569fc81e113b2b
  liftKernel, IsMarked, IsFullMark, evenPlaces, markExponent, lowColumns.
New/Curve/LiveSum.lean 3efab3907b063bb2c59d182df981ad62862f8a1b
  loss, IsServed, IsCollision, couplingCount, κ, lastEntry.
New/Curve/JetDivisibility.lean 5f6e6f63dc7bfc35aedc136ae8330510d3493f06
  norm_schurJet_le.
New/Curve/ConjugatesOfJets.lean 8b841d76bb938d8a18fd4341aa832a20b13dd9e0
  norm_jetSeries_le, mem_raises_of_jet_bound.
Lib/GLn/SchurModule/WeightRepBasic.lean 7417d8c31f21090bfa515568339b768290093d02
  weylGauge and conjugate weight embedding convention.
New/Columns/ChainValuation.lean 19e853dfa8c645bfcdf3b3e21183f9b432620ef7
  translateDatum_mem_standardData, gaugeLe_chain, norm_star_piG_le_one.

## 1. Actual diagonal and charge guard (missing bridge in RUN56)

Fix the parameters and witnesses of Data.IsGoodDatum.mem_raises:
good Ψ, p prime to the twist level, marked Λ, x in support Ψ,
stage j, and the specified split-pair elements of basic double
coset index i_l<=r=ceilLogM p. Write n'=n(j+1). From elementary
divisors (RUN61 section 1), choose a subset J_l of the target
basis of size i_l and write g_l=a_l diag(p on J_l,1 otherwise)b_l
with integral invertible a_l,b_l. This uses marked valuation_p;
p is a uniformizer at l, no arbitrary generator choice. Combine
the split-pair elements, including inverse transpose on the
conjugate component. The two compact factors are integral above
p, so use the native mem_raises_of_jet_bound with δ=1 and actual
translateDatum_mem_standardData; p avoids gProd and N. The
middle diagonal is 1 off these pairs.

For τ write w=inducedPlace τ. Call τ even if w in Λ and odd if
star(w) in Λ; these are disjoint. Other τ are outside both.
If Λ nonempty, p is served and inert. For a live odd exponent e
put τ'=placeOfInt(-p^e)*τ. Its induced place is star(w).
Consequently even and odd are exchanged on each marked pair.
For the empty marked set the following charge guard is vacuous,
including p=d and its possible even exponents.

Use the exact native nonnegative charge on a box of height h
with tableau basis label b:
  g(τ,h,b) = 1 if [τ even, h=1, b notin J_w]
                   or [τ odd, b in J_star(w)], else 0.
For an exempt coupling in norm_schurJet_le:
- If τ even, then τ' odd with the same subset J_w. If b is outside
  J_w, the source h=1 is charged; if inside, the target at ANY
  height h is charged.
- Otherwise exemption requires h=1 and τ' even. Then τ is odd
  with the same subset as τ'. If b is inside, the source is
  charged; if outside, the height-one target is charged.
This proves the full universal charge guard, not merely one
choice of tableau or one pair. Use the actual normal form
P.thetaProducts_normal_form for the same p and the same ev.
The source retains norm_star_piG_le_one and the period-factor
unit at the primes in question. The peer Schur estimate and
norm_jetSeries_le now give for every standard datum and jet entry
  |jet|_p <= p^(M - JET),
where M is the sum of g over all output tableau boxes and
JET=Data.jetExponent p j (evenPlaces Λ). No change to the Schur
jet bound or its finite-part frame/normal-form premises.

## 2. Exact diagonal cancellation BEFORE the norm bound

Critical orientation: weightEmbedding iota τ reads the prime
STAR(w), not w. Hence for τ even the p-adic norm of diagonal
entry u_τ(b) is p^(1_{b in J_w}); for τ odd it is
p^(-1_{b in J_star(w)}); elsewhere it is 1. Reading w instead
would reverse the signs and invalidate the estimate.

Let e_τ=lastEntry(j+1,τ)=floor(n(j)/2)-w_{j+1}(τ) in integers.
The determinant factor in mem_raises_of_jet_bound contributes
  D = sum_even |J_w| e_τ - sum_odd |J_star(w)| e_τ.
It is EXACTLY zero by the native
sum_inducedPlace_sub_star_eq_zero with G(c,l)=|J_l|*(floor(n(j)/2)-c).
This uses marked-pair weight symmetry, not individual e_τ=0.

The remaining Schur diagonal exponent plus M is boxwise:
  even, height 1:  1_J(b)+1_{not J}(b)=1;
  even, h!=1:     1_J(b);
  odd, any h:     -1_J(b)+1_J(b)=0;
  outside pairs:  0.
Hence for an arbitrary output tableau the exact combined
exponent is the number of even height-one boxes plus the count
of labels in J in the other even columns. Each tableau column
of height h has distinct labels (tableau_col_injective), so the
second count is at most |J_w| per column, and <=r per column.
By the actual κ at h=1, with 1<n', the first count is
  a * #{τ in tops : inducedPlace τ in Λ}
    = sum_{l in Λ} markExponent(l).
The other column count is the native lowColumns j τ (h<n',
h!=1, including the harmless empty h=0). Thus
  D + SchurDiagonal + M
    <= sum_l markExponent(l) + r*sum_even lowColumns(j,τ).
Subtract JET only now, and apply the jet entry bound in section
1. Every weighted matrix entry is bounded by
  p^(sum_l markExponent(l) + liftLoss(Λ,j)).
Since the p-adic matrix/vector norm is controlled by the largest
entry, not by the number of tableau boxes or matrix entries,
mem_raises_of_jet_bound gives precisely the actual
Data.IsGoodDatum.mem_raises for all source/target gauge arguments.
The compact factors and source/target stabilizers remain those
of the native lemma. This closes the missing scalar charge and
determinant conversion in the human path from RUN56 to RUN61;
it does not re-prove the CM normal form or native frame theorem.

## 3. Full-mark collision elimination, unserved tail, same chain

Use IsCollision exactly as defined: live e>=1 and both endpoints
tops outside ev. If Λ full and nonempty, p inert; every such e
is odd by IsCollision.ne_and_odd_and_dvd. For a top outside ev,
its conjugate induced place must be in Λ by full cover. Odd
transport puts the other endpoint inside ev, contradiction.
If Λ empty and full, cover forces tops empty, so again no
collision. Thus collisionSum p (evenPlaces Λ)=0 term by term;
no estimate of the number of collisions is needed.

For the unserved case take L=loss(p), F=f*a, r=ceilLogM p.
Each live collision at e contributes a/p^e, at most f choices
of τ. If p short, sum over all e>=1 and get
  m*collisionSum <= m*F/(p-1) <= 2mF/p <= L.
Here logB²>=2 and the SHORT multiplier in loss is m.
If p not short and unserved, any collision would imply p!=d,
odd e, o0|e. If e<=r, then o0 odd and <=r, and nonsplit p!=d
is inert; together these imply IsServed, a contradiction.
Consequently all e>=r+1. The geometric sum gives
  m*collisionSum <= m*2F/p^(r+1) <= 2F/p <= L
using m<=p^r and the NONSHORT multiplier 1. This recovers
mul_collisionSum_le_loss with the correct distinct loss factors,
not an unproved uniform prime estimate.

For the actual marked chain put E=evenPlaces Λ, T=#(tops∩E)*a/x1,
G=gain(p), C=collisionSum p E, and U=f*logB²*(a/p).
A nonempty full mark has chiK=-1. Keep the exact two numerical
supplier inequalities from JetExponentBound:
  #Λ δ_p + r sum_E lowColumns(j,τ) <= L/m+T,
  JET_j >= G/m-C+T-U/m.
Subtract the latter from the former BEFORE summing over stages.
This gives #Λ δ_p + liftLoss_j <= (L+U-G)/m+C.
C=0 and U<=L, so the m stages give <=2L-G. The same ordered
marked product Y from RUN61 therefore satisfies
  GaugeLe 1 (p^(2L-G)) (Bμ(Y^m v)).
For the empty full mark, T=0 regardless of chiK, so the same
calculation applies with (1-chiK)/2*T=0. For the unmarked chain
E=empty, its exponent is sum_j (-JET_j)<=m*C+U-G.
If unserved, the geometric result gives m*C<=L and hence <=2L-G.
If served, multiplication by p^jetCeil has valuation jetCeil
>=m*2F/p>=m*C (using the same geometric upper bound before the
short/nonshort split), so the scalar branch has exponent <=L-G.
These are the exact two gauge inputs combined by the native
marked HasType sum of image and p^jetCeil columns in
Data.exists_indexDvd_Bmu_divisible. Keep its index witness and
all twist/coprimality guards. The normal form and numerical
supplier inequalities are genuine retained premises, not
discharged by the last algebra.

## Status and handoff
Original path preserved: standard datum -> theta normal form /
joint frames / Schur jet -> weighted entries -> mem_raises ->
marked transfer -> chain -> full-mark gauge -> A local index.
Reduced human path: same premises -> universal charge guard,
conjugate diagonal and determinant cancellation -> same
mem_raises caller, exact collision sum and chain budget.
No global native dependency removed. In particular retain
le_jetExponent and sum_lowColumns_le, normal form/null-cone
integrality, finite vacuum expansion and marked HasType/level
witnesses. Original/reduced graphs and prior axiom evidence
untouched. No new performance or proof-completion claim.
Local lean and lake absent. The original native engine is on
the old pin, not applied to this compact environment. Reread
actual CI status compute/rh-compact-primitives-replay-20261126/
status.json on cathedral-research-state (blob
a56e2d3afb99ed8275e81fd63c8494306e57c43f): error, 5147.99s,
some requested checks failed/not reached. Workflow
45803534769 job wrapper completion does not mean mathematical
PASS. No new native check performed. Prepared executable
scalar bridges and probes below, not run.

RESUME HERE: prove the remaining le_jetExponent termwise live
coupling bound, specifically the exceptional e=0 term when
p=d and the height-one rebate at e=1; then sum_lowColumns_le
using actual served/order and magnitude guards. Integrate this
run's marked charge proof with RUN56 and RUN61 and peer
archimedean/level results. Audit the conjugate weight embedding
and all finite-part/normal-form premises independently. Do not
repeat the established determinant cancellation or full-mark
collision argument.
HANDOFF TO theta, integration, audit, kernel extractor.
-/

namespace AccelerationRun62

theorem even_one_box (b : Bool) :
    (if b then (1 : ℤ) else 0) + (if b then 0 else 1) = 1 := by
  cases b <;> decide

theorem odd_box (b : Bool) :
    -(if b then (1 : ℤ) else 0) + (if b then 1 else 0) = 0 := by
  cases b <;> decide

theorem charge_guard_even (b : Bool) :
    (if b then (0 : ℕ) else 1) ≠ 0 ∨ (if b then 1 else 0) ≠ 0 := by
  cases b <;> decide

theorem charge_guard_odd (b : Bool) :
    (if b then (1 : ℕ) else 0) ≠ 0 ∨ (if b then 0 else 1) ≠ 0 := by
  cases b <;> decide

theorem stage_budget (A J L G T U M : ℝ)
    (hM : 0 < M) (hA : A ≤ L / M + T)
    (hJ : G / M + T - U / M ≤ J) (hU : U ≤ L) :
    A - J ≤ (2 * L - G) / M := by
  have h : U / M ≤ L / M := div_le_div_of_nonneg_right hU hM.le
  rw [sub_div, mul_div_assoc]
  linarith

theorem aggregate_stage_budget {ι : Type*} (s : Finset ι)
    (A J : ι → ℝ) (L G : ℝ)
    (hs : (s.card : ℝ) ≠ 0)
    (h : ∀ i ∈ s, A i - J i ≤ (2 * L - G) / (s.card : ℝ)) :
    (∑ i ∈ s, (A i - J i)) ≤ 2 * L - G := by
  calc
    _ ≤ ∑ _i ∈ s, (2 * L - G) / (s.card : ℝ) :=
      Finset.sum_le_sum h
    _ = _ := by simp [Finset.sum_const, nsmul_eq_mul, hs]; field_simp

#print axioms even_one_box
#print axioms odd_box
#print axioms charge_guard_even
#print axioms charge_guard_odd
#print axioms stage_budget
#print axioms aggregate_stage_budget
end AccelerationRun62

#check norm_schurJet_le
#check Parameters.mem_raises_of_jet_bound
#check Data.IsGoodDatum.mem_raises
#check Data.IsFullMark.collisionSum_evenPlaces_eq_zero
#check Data.mul_collisionSum_le_loss
#check Data.le_jetExponent
#check Data.IsMarked.sum_lowColumns_le
#check Data.IsGoodDatum.gaugeLe_Bmu_of_isMarked
#print axioms Data.IsGoodDatum.mem_raises
#print axioms Data.IsGoodDatum.gaugeLe_Bmu_of_isMarked
