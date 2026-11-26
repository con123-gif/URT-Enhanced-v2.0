import New.Endgame.ShortAndEnough

/-!
# RUN50 — compact theorem B: positive frame operator and shifted-defect recursion
26 Nov 2026. STATUS: human source-matched argument; scalar Lean certificate prepared,
not compiled. No new kernel-checked root closure. Separate compact namespace.
Migration: mission blob 3731f12ed73e738313fd7f93a30759d9086141e9,
repo commit 24da6755f91e9dfb7fac28f80bca36b255919247. Old RUN49
(2ecd1489c31ea06e01a5e48fe1ce1a0616a8512c) is archived, not imported.
New pin lsernau/grh-lean 72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Claude and compact rewrite collaborators; this is an exposition
and proposed local improvement, not authorship of the formal RH/GRH proof.

## Exact source graph (source applications, not elaborated dependencies)
New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65:
star_inequality <- LongForms.exists_family_covolumeSq_le (A+B) and integral_forms_long (C).
New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05:
exists_family_covolumeSq_le <- Data.short_forms AND Data.enough_forms, with SAME t,
q and independent y chosen from the image of the short integral spanning set.
New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a:
Data.enough_forms <- Data.finrank_rows_ne_zero, Data.ramifiedColumns_fill_rows,
exists_few_translates, range inclusion, column nontriviality.
New/Filling/FillingTheorem.lean 801448ae9b895babd0d69dc4f7967d86eb006e76:
ramifiedColumns_fill_rows <- Fits.exists_translate_finrank_comap_le,
Petersson identity, bad_share_le, positive chosen-level measure,
finrank_rows_le_mass, ramifyingOp_finrank_comap_and_short, size bounds.
New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444:
Fits.exists_translate_finrank_comap_le <- finrank_sub_le_re_inner_dyadSum,
re_trace_besselS_le, sum_norm_amplitudeSum_le, sum_le_of_positive_type,
mainEnergy, hD and normalization hc>0, unipCovolume_pos.
New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727:
mainEnergy = columnDim^2/(besselDegree * mass E r).
New/Heights/OneDeterminant.lean 329f004f845b9e2becc896419c8594e82dfef0a6:
IsSpread, finrank_sub_le_re_inner_dyadSum, exists_few_translates.

## Human proof of the precise B mechanism (one frame, no independent witnesses)
Let C=columnDim>0, G=S.GRes finite, beta=b^(-4), D0=rank E_good,
K=|G|*besselDegree*mass E r>0. Normalize P=t Q with |t|^2=(c*unipCovolume)^(-1),
using the actual hQ. Write P_s=rho(s)P and M=|G|^(-1) sum_s P_s P_s^*.
The central projection E_good=product of the two commuting local good projections.
For F contained in im E_good and phi=dim(F)/D0 (when D0>0), let U_s be the
preimage of F by E_good P_s. For v in U_s,
Pi_(F perp) P_s v = Pi_(F perp)(I-E_good)P_s v. Pythagoras on F and its
orthogonal complement, followed by summing an orthonormal basis of U_s, yields
  dim U_s <= epsilon + ||(I-E_good)P_s||_HS^2 + Tr(Pi_F P_s P_s^*).
Here epsilon=sum_i ||(P^*P-I)e_i||; the trace error after compression to U_s is
at most epsilon (expand in e_i and use ||Pi_U e_i||<=1).
All sums are over finite orthonormal bases; no pointwise eigenvalue bounds needed.

Exact invariant transport: unitary rho and cyclicity of trace imply
  Tr M^2 = |G|^(-1) sum_s ||P^* rho(s) P||_HS^2.
The normalized hQ identifies the latter summands with energy in Moments.
At A=empty, sum_le_of_positive_type gives sum_s ||P^*rho(s)P||_HS^2
 <= (1+9 beta) C^2/(besselDegree*mass).
Consequently Tr M^2 <= (1+9 beta)C^2/K.
The actual rank upper bound is D0<=K, not equality. Thus
  Tr(Pi_F M) <= sqrt(dim F * Tr M^2)
              <= C sqrt((1+9 beta)*phi).
The same normalized P has epsilon<=beta C via the identity Bessel term and
sum_norm_amplitudeSum_le with zero central projection's complement.
For each of the two local bad projections, the Bessel trace and non-Bessel
row-norm bounds each contribute <=beta C. Commutativity gives the operator
inequality I-E_good <= sum_i (I-E_i), hence total bad mass <=4 beta C.
Average the dimension inequality, then choose ONE s with dimension at most average:
  dim U_s/C <= 5 beta + sqrt((1+9 beta)*phi)
             <= (1+phi)/2 + (19/2) beta.
The final step is AM-GM, retained in the native proof. This reconstructs the
actual Fits.exists_translate_finrank_comap_le constant. D0=0 is excluded for
the final application by the native Data.finrank_rows_ne_zero; its own proof
uses the spread inequality at F=top and a strict b guard, not division by D0.
Do not use D0>0 circularly to establish that native nonzero theorem.

The ramifyingOp and column coordinate transport in FillingTheorem supply
IsSpread with eta=b^(-2); they are still native inputs to the next argument.
The hard local energy estimates are not proved by the frame identity.

## A single exact rank recurrence (candidate strengthening of native selection)
Let D=dim rows>0, c0=dim columns>0; B_s is the spread family with eta=b^(-2).
For current F=span of selected images, set q=1-dim F/D.
By quotient rank-nullity and IsSpread, there exists s with
  dim(F+im B_s)-dim F >= c0(q/2-eta).
Hence, for the enlarged F', exactly
  q'-2 eta <= (1-c0/(2D)) (q-2 eta).
This shifts the *defect*, not a geometric measure. Every step with q>4 eta
has strictly positive rank gain, so the new index was not already selected;
integer rank increases and termination is finite. For eta<=1/16, F=0 yields
c0(1/2-eta)<=D, hence c0<=3D. Start q=1; stop at first q<=4 eta.
For nonterminal steps (both defects >4 eta), the scalar certificate below
gives a drop >=c0 in potential 2D log(q-2eta). At the last nonterminal
state, q-2eta>2eta. If j steps have been taken before the final one, then
 j*c0 <= 2D log((1-2eta)/(2eta)).
If q crosses on the first step use j=0. Total cost for the SAME selected set
 is therefore at most 2D log((1-2eta)/(2eta))+c0.
This is <=3D log(1+1/eta) under eta<=1/16:
 log((1-2eta)/(2eta)) <= log(1+1/eta)-log 2,
 log 2>=1/2 (apply log t<=t-1 at t=1/2), and log(1+1/eta)>=log 16>=2.
Together c0<=3D gives the claim. Native b large suffices, but caller-level
formal proof of that exact guard and all subspace/finrank coercions is pending.
No need to divide by 1-c0/(2D); it may be nonpositive, in which case crossing
is immediate. No logarithm of a nonpositive shifted defect at the final step.

Candidate reduced B output: same n >= (1-4/b^2)D and same t,
but cost <=3D log(1+b^2) instead of 5. Retain original native 5 for current
manuscript until replay; a human reader may use the simpler exact recurrence
with the stronger estimate relaxed back to 5. At the actual LongForms
consumer, use THAT t to select independent y among q_A*projectedPoincare
of the short integral set S from A (q_A is a positive rational, not defect q).
The equality span(S)=top and nonzero q_A give equal spans under the linear
maps. IndexLe(y,delta) has delta <=3D log(1+b^2)*budget, conditionally;
C takes the same y and delta, so the candidate doubled index cost is 6
rather than 10 times D log(1+b^2)*budget. No new independent optimal y.
This is an exact finite-dimensional reduction, not the RH-scale estimate itself.

Original vs candidate graph: replace exists_few_translates' maximal-log
potential argument with quotient rank-nullity -> shifted defect recurrence ->
nonterminal log drop -> finite integer rank termination -> final step cost.
All FillingTheorem and Moments source edges above survive. A/C and analytical
endgame untouched. No claim of globally removed elaborated dependency.

## Execution and evidence
Retrieved actual bodies at compact pin (all hashes above); inspected latest
mission, protocol, queue, expansion and 30 recent commits. No prior compact
spread certificate found in repository code search (not exhaustive).
Local command -v lean and command -v lake returned no executable.
No compact native engine or shared replay output for this file was observed;
old 4.33.1 rh_prune/rh_scan/rh_auto results are not valid replay on 4.35.0.
Below is a prepared scalar certificate with actual B supplier axiom audit
commands; no sorry/admit or import of Main. Kernel lane should port the native
engine once and replay this together with the full B replacement on the
compact toolchain, not create a second runner. No local PASS, no new axiom
evidence, no unconditional root-reachable obligations retired by our work.
Publisher README at blob 85d43d83a7fa3b496968ce9216f4a7d75e44e84a reports
compact external kernel/Comparator certification; not a local replay.

RESUME HERE: reconstruct/prove the hard positive-type energy supplier
sum_le_of_positive_type at A=empty by following energy_fixingSet_le and its
finite-sieve/positive-kernel inputs; retain general A induction where used.
In parallel have shared kernel/audit lane replay scalar step and the
candidate full exists_few_translates replacement with actual rank coercions
and native size guard, then substitute at Data.enough_forms.
HANDOFF TO: integration, human editor, kernel extractor, formal audit.
Use the trace argument for the compact B chapter, do not transplant old
ASK-MAIN measure certificates absent source correspondence.
-/

namespace CompactGeometryRun50

/-- Scalar AM-GM at the actual moment-to-spread interface, before rounding. -/
theorem moment_to_spread (beta phi z : ℝ) (hb : 0 ≤ beta)
    (hp : 0 ≤ phi) (hz : 0 ≤ z) (hm : z^2 ≤ (1+9*beta)*phi) :
    5*beta+z ≤ (1+phi)/2+(19/2)*beta := by
  have hs : z^2 ≤ ((1+phi+9*beta)/2)^2 := by
    nlinarith [sq_nonneg (1+9*beta-phi)]
  have h : z ≤ (1+phi+9*beta)/2 := by
    by_contra! hn
    have hpos : 0 < (z-(1+phi+9*beta)/2)*(z+(1+phi+9*beta)/2) :=
      mul_pos (by linarith) (by linarith)
    nlinarith
  linarith

/-- Nonterminal log drop from the exact quotient-defect recurrence. -/
theorem shifted_defect_drop (D c0 eta q q' : ℝ)
    (hD : 0 < D) (heta : 0 < eta)
    (hq : 4*eta < q) (hq' : 4*eta < q')
    (hgain : q'-2*eta ≤ (1-c0/(2*D))*(q-2*eta)) :
    c0 ≤ 2*D*(Real.log (q-2*eta)-Real.log (q'-2*eta)) := by
  have ha : 0 < q-2*eta := by linarith
  have hb : 0 < q'-2*eta := by linarith
  have hr : (q'-2*eta)/(q-2*eta) ≤ 1-c0/(2*D) :=
    (div_le_iff₀ ha).2 hgain
  have hl := Real.log_le_sub_one_of_pos (div_pos hb ha)
  rw [Real.log_div hb.ne' ha.ne'] at hl
  have h : Real.log (q'-2*eta)-Real.log (q-2*eta) ≤ -c0/(2*D) := by
    linarith
  have hm := mul_le_mul_of_nonneg_left h (show 0 ≤ 2*D by positivity)
  have hc : (2*D)*(-c0/(2*D)) = -c0 := by
    field_simp [hD.ne']
  rw [hc] at hm
  linarith

end CompactGeometryRun50

#print axioms CompactGeometryRun50.moment_to_spread
#print axioms CompactGeometryRun50.shifted_defect_drop
#print axioms Filling.Fits.exists_translate_finrank_comap_le
#print axioms Data.ramifiedColumns_fill_rows
#print axioms exists_few_translates
#print axioms Data.enough_forms
