import New.Selmer.FitTwistsExist

/-!
RUN83 — one arithmetic payment at the actual C1 fit-family caller, 27 Nov 2026.
HUMAN SOURCE-MATCHED DERIVATION AND CALLER AUDIT; native replacement not run.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Current mission blob 3adc76221a978016e3505cdf3e36ad688354d7d7;
live spine 24b10d71aff1d6d8075e7629a1710c1b0cc7a969;
ledger c40f1debc6872fb9e1f080a90c39d94e0b1caffe.
Read RUN60, RUN63, RUN66–67, RUN82, compact manuscript 619ae01b
(especially existing fit-family assembly and Kolyvagin audit), protocols,
AGENTS, continuity and current peer commit list (head 1cb4842f).
Do not repeat odd-Sha Fourier transfer, descending induction, row modulus
or local block-loss arithmetic. The new step is an exact combined
integer valuation identity at the native finite-prime-budget caller,
and the common-witness quantifier audit. C1 remains open.

Source bodies (paths relative to grh-compact/src):
* New/Selmer/FitTwistsExist.lean da769eba595af2f883eed9b82dbd322a521aea14
  exists_isFitFamily, both finite-prime budget sums and both denominator calls.
* New/Selmer/RibetElement.lean 188eeb68d437bfa58bcc30042d4eee66c2111e18
  rowBudget, ribet_columns.
* New/Selmer/DeterminantBound.lean 686d1d98ab6ce7bb70ff4f087d2a10cbae8b85df
  lambdaLoss, loss (actual factorial and interval product).
* New/Selmer/AptTupleDefs.lean ba41ff0e729d5182ac236911898dfd0865165f8c
  crudeUnit.
* New/Selmer/DenominatorBound.lean 5889d96fe1a6ad7926e0df09a7d183232f91c534
  denominatorLe_rowBudget.
* New/Selmer/TwistForRows.lean 802242498ad4530e7f52cc4f14e0a03be2c59f4d
  exists_mFoldTwist_selmerLengthLe.
* New/Selmer/FitTwists.lean c62935a73ccbef6c7fc42f45c83f111e811a5825
  Data.B₀ and Data.IsFitFamily.
* Lib/Cyclotomic/OddSha/OddShaBound.lean 71e1148ba135da7530abe211af57ba8a0d63f195
  exists_length_shaOdd_le.
* New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834
  f, b₁, gProd; New/Data/ChosenPlaceLevels.lean d6b4c62956e3ca1259fd69dd8c882a6fe021e7c3
  chosenGroupOrder, NeZero instance, HasLogUpper bound.
  New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e
  k_pos, k_add_t_add_one_le_h₂ and scale bounds.
  New/Heights/Heights.lean, HeightLe.of_le.

1. Exact arithmetic packaging before bounding (the same D throughout).
Put H=D.h₂, b=D.b₁, f=D.f, m=D.m, k=D.k>0, G=D.gProd,
M=D.chosenGroupOrder, and X=the SAME nonzero natural number
(exists_length_shaOdd_le _ D.t _ D.algebraMap_mem_cycloField).choose
used by rowBudget. All of M,G,X are nonzero by the native instances
and theorem; do not choose X anew at each prime.
Define the actual integer
   F=(2b)! * (prod_{b-30H³ < i <= b+30H³} i)^(H³),
with lower bound truncated in Naturals as in lambdaLoss. It is
positive, even if the interval is empty; zero is never in Ioc.
Then for each prime l, v=v_l is additive on these positive integers.
The actual definitions give
   crudeUnit_l = v(M)+2^(-l),
   loss_l = 10^6 (m/k)(b v(G)+v(F)),
   rowBudget_l = H^27(crudeUnit_l+v(X))+4f loss_l.
Here m/k is the real-valued ratio in the NNReal loss, NOT natural
division. The native gamma_l is rowBudget_l log l.

Package all arithmetic in one positive integer
   Z=(M X)^(k H^27) * (G^b F)^(4*10^6*f*m).
This is symbolic; never materialize this enormous integer.
Exact cancellation of the positive k now gives the identity
   gamma_l = (v_l(Z)/k + H^27 * 2^(-l)) log l.
No estimates, new field extensions, independent choices or lost
prime support. In particular k need not be prime to l.
For every finite prime set T, sum before bounding:
   sum_T gamma_l
     = (log prod_{l in T} l^v_l(Z))/k
         + H^27 sum_T 2^(-l) log l
     <= log Z/k + H^27 sigma,
   sigma = sum_{l prime} 2^(-l) log l.
All quantities nonnegative. Taking finite sets of increasing primes
including the finite support of Z proves equality for the full
sum. Thus the exact global budget for this very gamma is equivalent to
   log Z/k + H^27 sigma <= D.B₀.
This is an arithmetic guard, not a proof of RH or a substitute for
the local denominator theorem. The native finite-set bound already
uses a looser geometric majorant. The equality identifies exactly
what that proof pays and can be used without constructing Z.

For a completely elementary sufficient version, log l <= l/2
for l>=2 (log(l/2)<=l/2-1 and log 2<=1). Since
sum_{n>=2} n/2^n=3/2, sigma<=3/4. Expanding log Z gives
   sum_T gamma_l <=
     H^27(log M + log X + 3/4)
     + 4*10^6*f*(m/k)(b log G + log F).
The native proof uses the safe 2 instead of 3/4; retain its
original scale budget, do not change D or spend the slack twice.
The exact same arithmetic gives the inverse-ratio budget
   sum_T 9 crudeUnit_l log l <= 9(log M+3/4).
For F, use |Ioc|<=60H³, hence
   log F <= 2b log(2b) + 60H^6 log(b+30H³)
when b,H>=1 (the actual scale). This uses integer products,
not a Stirling approximation. The odd-Sha theorem supplies
   log X <= 4(N+t+3)^27 log 2 + log classNumber(E).
The native classNumber_le, discriminant identity, and HasLogBound
instances still supply the final inequalities <=D.B₀ and <=D.x^999.
This checkpoint isolates those exact magnitude inputs rather than
asserting an independently replayed proof of them. Both native budget
inequalities remain required in the replacement audit. The single
integer formula is equivalent to summing the original rowBudget,
not a claim of improved local arithmetic or deleted assumptions.

2. Actual witness ordering at exists_isFitFamily.
At a fixed kappa=(l,iota), choose the rows BEFORE the twist:
R,F for every pair of an index j and an element of the finite good
eigenpart; R',F' for every rank-one (p,j) with IsRankOne p j.
Take their finite DISJOINT SUM, not a separate list per j, and set
M0=floor(D.r*rowBudget_l)+1. The source applies
exists_mFoldTwist_selmerLengthLe once to this sum and this M0.
Its single tau_kappa and H_kappa give the auxiliary condition,
all row witnesses and all inverse-ratio local estimates for
EVERY power n in the native LiftIndex. The source obtains coprime
level from the power-one auxiliary condition. It uses the same tau
and H in both denominatorLe_rowBudget invocations: in the good lift
span, zero generators need no row and nonzero generators use the
left summand F; in the rank-one line, the trivial lift spans and
the right summand F' supplies the row. Preserve the actual label,
tuple projection and lift membership inputs from these suppliers.
The local denominator bound is exactly gamma_l, because the native
denominatorLe_rowBudget concludes rowBudget_l * log l (rank is already
inside DenominatorLe; never multiply gamma by D.r a second time).
It follows that one gamma works simultaneously for all j and all
embeddings over l, a stronger quantifier order than the structure
field denominator_le j : exists gamma. The proof still selects
tau separately for each kappa, not a single global tau for all primes.
No exchange of these quantifiers is permitted.

For the height field, e_l=9 crudeUnit_l log l and H_kappa gives
norm(iota (ratio tau^j)^(-1))<=exp(e_l).
Apply HeightLe.of_le with witness 1 and archimedean budget 0;
there is no extra product-formula witness at this step.
All finite prime sets obey the second budget above under native
scale guards. This proves the same height-family statement from
the very same tau, not from a separately optimized family.
HeightLe on the inverse in Lean does NOT imply that the original
ratio is nonzero (inverse of zero is zero); preserve the separate
ratio nonvanishing inputs wherever reciprocal cancellation is used.
No dependency on the final RH theorem.

3. Reduction frontier and verification.
Source-visible original and reduced local edges:
OddShaBound + chosenGroupOrder + lambdaLoss -> rowBudget -> strict M0
-> simultaneous TwistForRows -> two denominatorLe_rowBudget calls
-> IsFitFamily.denominator_le.
Same H -> norm bound -> HeightLe.of_le -> IsFitFamily.height_le.
The alternative arithmetic path is one valuation of Z and the
geometric tail, with the same source scale checks. It does not
delete any elaborated dependency or prove local C1 suppliers.
Context key: exact compact pin, D, all finite row labels, same X,
fixed l,iota,M0,tau,H, k>0; no reuse across D or embeddings.
Old-pin engine receipts not transferred. Checked local command -v
lean/lake/elan: unavailable. No native rh_scan/prune/reduce/auto
/frontier or Lean CI replay performed in this run; no native PASS.
Existing C2/B2 graph receipts not C1 evidence. The helper below is
a prepared algebraic identity only; actual original-statement and
caller replacement remain for shared native runner. Preserve all
source graphs, axioms and failed routes. No protected files changed.

RESUME HERE: shared compact native runner replay RUN75–83 in the
actual FitTwistsExist caller, starting with a separate module for
the exact gamma identity and both finite-prime budget fields; compare
the complete original IsFitFamily statement, verify the same local
row witnesses and all transitive guards, report #print axioms and
actual compiler result. Keep the deep local period and odd-Sha
suppliers and their separate replay frontier.
HANDOFF TO: integration/editor, Galois, kernel/audit.
-/

namespace RHGaloisRun83

/-- Prepared exact cancellation after integer factorization; not a proof
of the native valuation or scale inputs. -/
theorem packed_payment (k a b u v w tail L : ℝ)
    (hk : k ≠ 0) (hw : w = k*a*u+b*v) :
    (a*(u+tail)+(b/k)*v)*L = (w/k+a*tail)*L := by
  rw [hw]
  field_simp [hk]
  <;> ring

#check rowBudget
#check lambdaLoss
#check loss
#check crudeUnit
#check exists_length_shaOdd_le
#check exists_mFoldTwist_selmerLengthLe
#check denominatorLe_rowBudget
#check HeightLe.of_le
#check exists_isFitFamily
#print axioms packed_payment
#print axioms exists_isFitFamily

end RHGaloisRun83
