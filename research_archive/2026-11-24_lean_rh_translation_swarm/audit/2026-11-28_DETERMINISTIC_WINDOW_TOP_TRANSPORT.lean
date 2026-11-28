import EditorSelectedRecord
import Lean

/-!
# Audit — deterministic top of the SAME native polar window
28 November 2026. SOURCE-MATCHED human proof, conditional transport;
native certificate PREPARED, not compiled. AGREE with the corrected
selected-record count bridge, PARTIAL for RH. Credit Alpöge, Sernau,
Anthropic collaborators and Claude.

Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484;
AGENTS, SWARM, HANDOFF, expansion, state excerpt read.
Latest relevant peers: 69d79aa21682b61e21ba3b423874075a11dcbe3f (canonical
weak selected-record count), 265ffc21 (reciprocal cost), 108e8dac (fixed
fiber), 9ccb174e (count monotonicity), RUN83 465cacb7 (older fixed-P
PNT tail at ORIGINAL larger scale), 2b574cee (exact normalization).
This contribution is distinct from RUN83: the deterministic endpoint
stays INSIDE the current native window and gives equivalence of the
current selected-record premise, with NO additional log-power slack.

Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Exact source blobs read: AdmissibleData 04208a5044bb7cf6464ef142a14d939148bed834,
DataExist 634c6a1f88791a3bb770326785b70411e8289b41,
Magnitudes 306fe7e22378322422d11b1f8415fcdac75ffd6e,
PrimeError 63eb3d79d95ad815878e623b96f237240058c8e2,
ShortAndEnough b99eea0689be372d84362c58272b705e104b6a3a.
EditorSelectedRecord blob 03d0e2968201611d277835e99ac5f32361ca5f30,
RUN82 selector edfb195d5ef76d7a46b7cadcfa64f9f9cb7c66e9.
The native remainder_eq and lightweight run90Remainder_eq have the
same signed prime-error expression; use the already checked RUN90
identity in the lightweight transport, not an assumed original-definition
kernel bridge. Acceleration's rfl bridge remains PREPARED.

## 1. Stronger unconditional fixed-modulus tail on the native window

Read Thorner–Zaman, Refinements to the prime number theorem for arithmetic
progressions, arXiv:2108.10878v2 (21 Sep 2021), Corollary 1.4 and Remark 1.5,
p.3, and the subsequent small-modulus formula, including page screenshot:
https://arxiv.org/pdf/2108.10878#page=3 .
For fixed Q>=2 the weighted prime progression error is
O_Q(y exp(-c_Q (log y)^(3/5)/(log log y)^(1/5))).
The possible exceptional zero contributes O_Q(y^beta) with FIXED beta<1,
absorbed into that error. The O(sqrt(y) log^2 y) prime-power correction
is also absorbed. Fix P,d,M before x grows, Q=Md (also M=1).
Use the same finite CRT sum and exact constant normalization from
2b574cee §6a: the Mangoldt weight has mean 1/phi(M), and
R_M(y)=-integral_y^infty E_M(v)/v^2 dv. This is the native primeError,
not an arbitrary shifted normalization.

For sufficiently large v, (log v)^(3/5)/(log log v)^(1/5)
>= (log v)^(11/20). Thus with alpha=11/20 and suitable fixed c>0,
|E_M(v)|/v <= C exp(-c (log v)^alpha).
After w=log v, split the integrand into two equal exponential factors:
integral_u^infty exp(-c w^alpha) dw
<= exp(-c u^alpha/2) integral_0^infty exp(-c w^alpha/2) dw.
The last integral is finite. Consequently both |R_M(exp u)| and
|R_1(exp u)| are O_P(exp(-c' u^alpha)). Put t=10^6 log x and u*=t^2.
Then u*^alpha=t^(11/10), so these tails are o_P(x^(-A)) for every
fixed A>0. This uses the genuine stronger fixed-modulus PNT, NOT the
classical square-root-log error alone: at u=t^2 that weaker estimate
gives only x^(-c*10^6) with an uncontrolled c. No uniformity in d or
numerical effective threshold is required.

## 2. Same-record transport without an additional log exponent

Fix P, eps, K, C BEFORE x grows as in SelectedBudgetOn. Write
B=D.logB=x^eps, H=#D.thick, T=towerDeg D.s, F=f*a*B^K,
c0=m*a*H, A=R_M(x), e=exp(-t)=x^(-10^6), and
Q_D(u)=R_M(exp u)-(T/H) R_1(exp u).
The selected witness has H>0, T/H<=B, Q_D(u)<=e and
S(u)=m*run90Remainder(D(u))=c0(A-Q_D(u))<=C*F.
Since H<=f, m<=2 sqrt(x), B>=1, obtain c0<=2 fa sqrt(x)
and F>=fa. The invariant fields m,a,H,f,s,x,B are IDENTICAL in D(u)
and D(u*) by the native record and a=roundUp(x*b).
The new scale proof is valid for all sufficiently large x, uniformly
over such D: the first two scale clauses unchanged; t<=t^2, and
10^6 t^2<=x^eps and 6 log(t^2)<=eps log x eventually. All other
Data fields are unchanged (the record has no other logX1-dependent
field proof). This does NOT transport the old row family or local
height/index/norm witnesses, which may depend on logX1.

From section 1, uniformly in T/H in [0,B] (B<=x), |Q_D(u*)|<=e
eventually: e.g. bound each tail by x^(-1000002) and use 1+B<=2x.
Hence the weak polar guard is automatic at the deterministic endpoint.
Exact cancellation gives
    S(u*) = S(u) + c0 (Q_D(u)-Q_D(u*))
          <= C F + 2 c0 e
          <= C F + 4 fa sqrt(x) x^(-1000000)
          <= (C+1) F .
The last inequality holds eventually since K>=0, B>=1.
The reverse direction is immediate: any deterministic u*=t^2 witness
with the budget is already a weak selected witness, after the same
unconditional tail guard and the eventual t>=1.

Therefore for each fixed P, eps in (0,1/100), K>=0, and the same scale
set (in particular QuarticScales), existential C>=0 SelectedBudgetOn
is EQUIVALENT to existential C>=0 budget at the single fixed endpoint
logX1=(10^6 log x)^2, with the same x,B,thickness conditions, no
polar guard, no auxiliary base record and no extra K. Forward choose
C+1; reverse keep C. Constants and thresholds stay before x. As a
result the canonical SelectedGood prime set and its CountEscape
predicate are unchanged at every tolerance: no loss of primes or
slack, even at the exact count exponent. This is NOT an equivalence
between the same numerical C, nor between universal row witnesses.
It is not a proof of the still missing deterministic budget or RH.

## 3. Verification, controls, and replay boundary

Actual execution: local Python exact rational loop over
xroot=[1,2,5,10], H=[1,2,4], f=[1,3,5], B=[1,2,4], K=[0,1,2],
C=[0,1,3], A=range(-3,4), Q=range(-3,2), Qstar=[-1,0,1].
Discard H>f, set e=1/(4*xroot), q=Q*e, qs=Qstar*e;
for m=xroot,2*xroot, s=m*H*(A-q), sn=m*H*(A-qs).
Whenever s<=C*f*B^K assert sn<=(C+1)*f*B^K and
sn-s=m*H*(q-qs). 90,765 exact valid transfers passed, two negative
controls passed: C=0,A=0,c0=1,q=1/4,qs=-1/4 violates preservation
of the SAME numerical C; A=2,c0=1,q=2,qs=0 violates the C+1 bound
when the old polar guard is omitted (take F=1,e=1/4).
These tests are scalar controls, not evaluation of native primes.

RUN99 receipt path compute/rh-compact-prime-count-budget-20261128/
outputs/run99_count_budget_receipt.json still returned 404 on state
branch, no verdict inferred. Local command -v lean and lake empty.
No new native rh_scan/prune/reduce/auto/frontier, kernel or full graph
execution. Preserve all earlier original/reduced graphs and axioms.
Below is the exact scalar proof for use at the actual selected
endpoint, not a replacement for formalizing the fixed-P VK tail or
the record update. The source-level candidate retains the exact
signed remainder, scale guards, PNT tail, count and analytic root;
the existential polar window is not needed in the new presentation.
No transitive dependency deletion is claimed.

RESUME HERE: after existing RUN99 and EditorSelectedRecord receipts,
integrate the scalar transport below into ONE same-record update
theorem with the fixed-P VK tail as an explicit premise, including
both original/canonical selected-budget interfaces and standard
axioms; do not start a new cold build. The analytic tail supplier
must be separately verified if choosing this native route. Focus
arithmetic workers on the actual deterministic budget; do not
optimize the window point. HANDOFF TO prime/editor/integration/kernel.
RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false

namespace RHAuditDeterministicWindow

theorem transport_signed_budget (A Q Qstar c0 e F C : ℝ)
    (hc : 0 ≤ c0) (hq : Q ≤ e) (hqs : -e ≤ Qstar)
    (hsmall : c0 * (2 * e) ≤ F)
    (hbudget : c0 * (A - Q) ≤ C * F) :
    c0 * (A - Qstar) ≤ (C + 1) * F := by
  have hd : Q - Qstar ≤ 2 * e := by linarith
  have hd' := mul_le_mul_of_nonneg_left hd hc
  calc
    c0 * (A - Qstar) = c0 * (A - Q) + c0 * (Q - Qstar) := by ring
    _ ≤ C * F + F := add_le_add hbudget (hd'.trans hsmall)
    _ = (C + 1) * F := by ring

end RHAuditDeterministicWindow

#print axioms RHAuditDeterministicWindow.transport_signed_budget

open Lean in
run_cmd do
  let n := ``RHAuditDeterministicWindow.transport_signed_budget
  let axs ← collectAxioms n
  unless axs.all (fun a => #[``propext, ``Classical.choice, ``Quot.sound].contains a) do
    throwError "AUDIT_DETERMINISTIC_WINDOW unexpected axiom {axs}"
  logInfo "AUDIT_DETERMINISTIC_WINDOW_SCALAR_OK"
