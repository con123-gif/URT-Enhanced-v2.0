import New.Selmer.FitTwistsExist

/-!
RUN86 — explicit human scale closure for the RUN85 packed-payment candidate.
27 November 2026. C1 and RH remain OPEN. Credit Alpöge, Sernau, Anthropic
collaborators and Claude. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 3adc76221a978016e3505cdf3e36ad688354d7d7; spine 87c621d0d18103ec2eb9be14bf774b8bff2a747d;
ledger 2c9e5148a947ff4b28482afd18c4d7c810af97d5. Latest peer list inspected
through 1d3bbea0 (signed common-witness junction). Existing RUN83–85 read.
Actual shared C1 run 46055305146 was queried: pick success, run job
in_progress, Run job step in_progress, final artifact upload pending.
Both requested state-branch receipts still 404. No duplicate job.

New result: discharge the specific hpay scale premise of
RHGaloisRun85.run85_budget_of_payment by an explicit elementary human
derivation from the original admissible data and the SAME odd-Sha
integer, rather than invoking the original fit-budget conclusion or
another black-box HasLogBound comparison. The kernel proof below
isolates the decisive cancellation in the local half-budget; it is
prepared, not executed. No local Lean/lake (command -v), free scratch
30 GB below shared runner's 35 GB guard.

Sources (relative to grh-compact/src):
 New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834
   Data.scale, a, b₁, t, k, h₂, cycloConductor, budget.
 New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e
   c_ge, k_pos, k_le_r, logarithmic bounds for f, gProd, h₂, a, b₁.
 New/Data/Different.lean 44f64349db3642e89b752cc92979999edac5c185
   Parameters.N₁, card_infinitePlace_E, cycloConductor_mem_different.
 New/Data/ChosenPlaceLevels.lean d6b4c62956e3ca1259fd69dd8c882a6fe021e7c3
   log chosenGroupOrder bound.
 Lib/General/NumberTheory/ClassNumberBound.lean e0078b852468ddabc3c288509bd9a45a79dc4aee
   classNumber_le.
 Lib/Cyclotomic/OddSha/OddShaBound.lean 71e1148ba135da7530abe211af57ba8a0d63f195
   exists_length_shaOdd_le, same positive X with uniform local lengths.
 New/Selmer/FitTwistsExist.lean da769eba595af2f883eed9b82dbd322a521aea14
   original pair of finite-prime budgets and their actual consumer.
 New/Selmer/FitTwists.lean c62935a73ccbef6c7fc42f45c83f111e811a5825
   B₀ and IsFitFamily.
 Native rowBudget, loss, lambdaLoss, crudeUnit definitions remain exactly
 as in RUN85; no independent witness or field choices are introduced.

1. Exact scales. Write U=logX, V=logB, W=log V, x=exp U, b=exp V,
c=P.c, H=h₂, q=b₁, G=gProd, M=chosenGroupOrder, J=the SAME X chosen
in rowBudget (rename to distinguish from x), N=cycloConductor, a=D.a.
By c_ge and Data.scale, c>=64, W>=10^12 c, U>=100 W,
V>=10^12 U. In particular U,V>=100, c<=U/100,
W/5+c<=U, and 2 log c<=U.
The native bounds and definitions then give:
   1<=f<=exp(12U) (f>=exp(11U));
   0<m<=2 exp(U/2), 0<k<=r<=3 exp(5U);
   a>=xb, q<=exp(2)b<8b, H<=exp(41U), log G<=22V;
   0<=log M<=exp(32U), t=5r<=exp(6U).
Every logarithm of a positive integer used here is nonnegative.
These follow directly from the named HasLogUpper/Lower instances
or m_mem, r_mem (no use of their final fit budget).
In particular
   B₀/2 = f a V³/(2mk) >= exp(V-4.5U)*V³/12.
This last quantity is enormous but is kept symbolic.

2. Global odd-Sha payment, with the exact chosen integer.
Put Tdeg=towerDeg D.s. Native card_infinitePlace_E gives
f=Tdeg*phi(P.N₀), whereas N=Tdeg*P.N₀*P.d.
Since phi(P.N₀)>=1 and c bounds both P.N₀ and P.d,
   N<=f c²<=exp(13U).
No replacement of P.c by the unrelated exponent of 3 in towerDeg.
The CM degree n=2f<=exp(13U), n+1<=exp(14U).
By cycloConductor_mem_different, (N) is contained in the absolute
different; its norm is N^n, while the different norm is |disc E|.
Thus |disc E|<=N^n (equivalently rootDisc<=N).
Using the precise native classNumber_le (not a square-root
discriminant estimate) gives
   log h_E <= (n+1)n(log 2 + log N) <= exp(28U),
since log 2+13U<=exp U for U>=100.
The SAME positive J satisfies J<=2^(4(N+t+3)^27) h_E.
As N+t+3<=exp(14U),
   log J <= 4 exp(378U) log 2 + exp(28U) <= exp(380U).
Consequently H^27<=exp(1107U), and
   H^27(log M+log J+3/4) <= exp(1488U) <= B₀/2.
For the last step V>=10^12 U implies V-4.5U>=1488U and V³>=12.
This uses only the existing odd-Sha size bound, not its desired
local lengths or any RH conclusion.

3. Local factorial payment, cancel BEFORE comparing scales.
The actual F=lossInteger D is (2q)! times the H³-th power of
the product on Ioc(max(q-30H³,0),q+30H³).
All factors positive; its interval has at most 60H³ terms even
with truncated subtraction. Thus
   log F <= 2q log(2q) + 60H^6 log(q+30H³).
H^6<=exp(246U)<=b and 30H³<=b because V>=10^12 U.
Therefore q+30H³<=9b, log(q+30H³)<=2V and log(2q)<=2V.
It follows that log F<=32bV+120bV=152bV and
   S=q log G+log F<=328bV.
Rather than expand the very large B₀, cancel the common f/k:
   (4*10^6*f*(m/k)*S)/B₀
       = 4*10^6*m²*S/(a V³)
       <= 5,248,000,000 / V²
       <= 1/2.
Here m² b<=4a by a>=xb and m<=2sqrt(x). The final sufficient
condition is V²>=10,496,000,000, already implied by Data.scale.
This is the new scale certificate at the actual budget junction.
No division by zero: a,m,k,V positive, f>=1. Retaining 1/2 for
each payment avoids spending the same slack twice.

4. Supply the exact retained RUN85 premise. By positivity of Z,
log⁺ Z=log Z and the product/power log identities give
   log Z/k = H^27(log M+log J) + 4*10^6*f*(m/k)*S.
For each finite prime set T, sigma_T=sum_T 2^(-l) log l <=3/4
by RUN83's elementary comparison (log l<=l/2 for l>=2,
sum_{n>=2}n/2^n=3/2). Thus the sum of the two proven half-bounds
is precisely the hpay input, and the packed valuation transfers it
to sum_T rowBudget_l*log l<=B₀. The independent second budget
9(log M+sigma_T)<=9(exp(32U)+3/4)<=exp(999U)=x^999.
All of these inequalities hold uniformly in T for the same D and J.
No evaluation of Z, enormous factorials or class numbers needed.

5. Scope. This is a human derivation of the missing scalar premise
in the proposed packed route, not a new proof of the native local
Galois, crystalline, row, or odd-Sha length suppliers. Those original
hypotheses, root obligations and exact witness order remain.
Original path: separate prime-factor sums -> HasLogBound ->
both fit budgets -> IsFitFamily.
Candidate: integer valuation -> log expansion -> two explicit half
bounds (same native size premises) -> both fit budgets -> same
IsFitFamily caller. Source-visible graph only; no original/reduced
kernel graph or axiom ledger overwritten.
The following helpers are executable Lean candidates for the local
cancellation and final budget assembly. Full native elaboration of
the source-size bounds and the RUN85 bridge remains pending.
No native rh_scan/prune/reduce/auto/frontier call or local execution;
no old-pin PASS transferred. URT unnecessary for this exact algebra.

RESUME HERE: inspect final shared C1 run 46055305146 logs; if RUN84
passes, replay RUN85 and this exact scale junction in the SAME pinned
cache, elaborating the native size adapters and the original complete
fit-family statement. If a failure is reported, repair the first
failure before adding candidates. Do not start a duplicate build.
HANDOFF TO: integration/editor, Galois, kernel/audit.
-/

namespace RHGaloisRun86

/-- The local half-budget, with only the sufficient scalar premises
extracted from the actual Data.scale and the native factorial bound. -/
lemma local_half (f m k a b V S : ℝ)
    (hf : 0 ≤ f) (hm : 0 < m) (hk : 0 < k)
    (ha : 0 < a) (hV : 0 < V)
    (hS : S ≤ 328*b*V) (hm2 : m^2*b ≤ 4*a)
    (hV2 : 10496000000 ≤ V^2) :
    4*10^6*f*(m/k)*S ≤ (f*a*V^3/(m*k))/2 := by
  rw [div_div]
  apply (le_div_iff₀ (by positivity : 0 < m*k*2)).2
  calc
    _ = (8*10^6*f*m^2)*S := by field_simp [ne_of_gt hk] <;> ring
    _ ≤ (8*10^6*f*m^2)*(328*b*V) :=
      mul_le_mul_of_nonneg_left hS (by positivity)
    _ = (2624000000*f*V)*(m^2*b) := by ring
    _ ≤ (2624000000*f*V)*(4*a) :=
      mul_le_mul_of_nonneg_left hm2 (by positivity)
    _ = (f*a*V)*10496000000 := by ring
    _ ≤ (f*a*V)*V^2 := mul_le_mul_of_nonneg_left hV2 (by positivity)
    _ = _ := by ring

/-- No independent choice of any budget or reuse of the same slack. -/
lemma assemble (P A B budget : ℝ) (he : P = A+B)
    (hA : A ≤ budget/2) (hB : B ≤ budget/2) :
    P ≤ budget := by linarith

#print axioms local_half
#print axioms assemble

end RHGaloisRun86
