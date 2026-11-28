import New.Filling.Moments

/-!
# RUN99 — reduce the actual nonempty-mask shell requirement
28 November 2026. Human/source-matched conditional supplier weakening;
executable arithmetic guard PREPARED, NOT native checked.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS/SWARM/HANDOFF/EXPANSION read. RUN98 f7f1eb8f stays pending.
Actual compute run 46120566249: pick completed, B3 layout repair job
140903998313 in progress; status.json, outputs/run93_caller_receipt.json,
outputs/run94/run94_receipt.json on state branch all 404. Not a PASS.
No duplicate native job or schedule change.

## New interface at the actual nonempty-mask supplier
Reuse integration 1a08fa08babdecf6689f5b002d36b7bc26e9361a (depth
discounted moment), 51e3e7cf3c80f75212b2bce440fc1f08bdb5ce1e
(dimensionless floor ratio), and coherent link normalization note
2ee81d7c79db9ce6a7ed8bd24df35efb860bbc73 (blob).
Do not optimize the final sharp coefficient or duplicate their arguments.

Write n=rho+1, k=shape.k, C=10^10 n^4, b>=1000, f=numInfPlaces,
j=|Sg|<=f, E=mainEnergy, beta=b^(-23k/4), y=b^(-6kj).
The actual FixedLines one-prime proof asks TopFloor.floorZeroForm_le_main_term
at t_old=k-C. Setup.pow_chain gives 3C+12<=k; the native shape guards
give k>=36. For the nonempty masks of the depth-discounted consumer
we need only the SAME bottom estimate at t=floor(23k/36)+1.
Indeed 3t<=2k and t+C<=k, and 36(t+1)>=23k+36.
The exact native shell call inside TopFloor is
lintegral_shells_le Z (t+1+n+10^9*n^4) at floor zero. Restrict ONLY that
bottom-floor use for this alternate branch. The frequency and other
floor consumers may still require their own higher moments.

Retain the actual subgroup Z, p onto K, kernel/comap guards, nonzero
frame vector (ordinary or contragredient), congruence C0, finite
positive group measures and the exact phase lower bound on C0.
Let M be Haar measure of subgroups, Kappa the native floorZeroForm,
v=volume(nonunits). Previous normalized identity gives, directly
from the stated bottom estimate at this single t,
  J=[Kappa(Z)/M(Z)]/[Kappa(K)/M(K)]
    <= [K:Z]^-1 + v^(t+1).
This uses M(K)>=2^-n and Kappa(K)>=M(K)^2 M(C0).
The native index is q^r-1, r=k+2rho+1>=k, q>=b^10;
v<=b^-9. Thus
  J <= 2 b^(-10k)+b^(-9(t+1))
    <= 3 b^(-23k/4-1) <= beta.
Here 40k>=23k+4 and 36(t+1)>=23k+36; b>=3.
For the residual block Z=K the ratio is exactly 1. Multiply the
existing partition/phase/Fubini identities, cancelling the one
common Haar scalar before bounding: J_global<=beta^j.
This is weaker than the old b^(-6kj) comparison but needs only the
explicit smaller t for the selected blocks. The t=0 sharp all-place
normalization for K in FiniteSystem remains unchanged, as does the
separate trace estimate. For empty Sg keep the original route.

## Actual FiniteSystem/Moments interface and unchanged global moment
In exists_finite_sieveSystem the comparison from
exists_intermediateGroup_lines is consumed in the bottom-norm field
at the rewriting step "← hk.ge, floorZeroForm_le_main_term".
The remaining five SieveSystem fields and the same intermediate
group, compact open L, massRatio, topKernel, gauge and frequency
conditions are unchanged. Replacing the comparison coefficient by
beta^j in that calculation gives e_fin=(1+b^-6) beta^j instead of
(1+b^-6)y. This is a source-matched proposed caller adaptation,
not a kernel-checked replacement; exact ENNReal/real conversions
must be retained. GlobalSieve.sieve already quantifies over arbitrary
bottom e, so its frequency error is not weakened or recomputed.

The existing coherent-link assembly after exact scale cancellation
gives for arbitrary nonnegative e_fin:
  linkEnergy/nu^2 <= E(1+b^-6)(1+b^-9)
      [(1+b^-10)^f e_fin + b^(-6kf-10)].
The tail is <= beta^j b^-10, since j<=f and 23/4<6.
Substitute the new e_fin. The identical elementary scalar estimate
in the coherent link note (f<=b/1000, b>=1000) now yields
  w <= (1+b^-4) E beta^j.
All CrudeEnergy guards survive: choose C_energy=E*y as before,
not an independently optimized witness. tau^20*besselEnergy<=E*y
by tau^44*besselEnergy<=E and tau^24=b^(6kf).
For j=f the link set is empty, X=q^j, and
tau^12 E/X^k <= E b^(-7kf)<=E*y; otherwise no link omitted.
Consequently the native crude-energy bound implies
  energy_fixingSet <= E beta^j [(1+delta)^3+delta^3] <= 2 E beta^j,
delta=b^-4 (use y<=beta^j, delta<=1/10).
This is precisely the nonempty-mask premise of 1a08fa08; its
empty-mask estimate is untouched. Hence that candidate recursion
would yield the SAME global moment (1+9b^-4)E without requesting
the near-full-depth shell estimate for nonempty bottom-floor calls.
No change to positive type, support, rank, or the governing inequality.

## Verification and limitations
Actual connector preflight: 25/25 pinned blob/source anchor checks
across Setup, FixedLines, TopFloor, FiniteSystem, Moments, GlobalSieve.
3564 exact BigInt arithmetic regression cases k=36,...,3599 checked
3t<=2k, 36(t+1)>=23k+36, 40k>=23k+4; the universal proof is above
and the guard below is an executable Lean candidate, not a test result.
No lean/lake/elan in local PATH. No new native rh_scan/prune/reduce/
auto/frontier execution or graph PASS. Existing general bottom lemma
already implies the restricted premise: this does NOT yet remove
its dependency or prove the primitive local shell estimate independently.
It does specify a smaller exact target for the nonempty branch and
separates the unchanged frequency and empty-mask requirements.
Source blobs: Setup 622e7ebe5c04b7ae87652e460762da7fb2e40727;
FixedLines a9305a4f1db1dc1cc9861ce3abe53a8a6331fdc9;
TopFloor 9762970967aef90b3a4e025b7f2891d892c70111;
FiniteSystem 1c169e04852f767f1d1a0140448d902c16dd04e7;
Moments ec2cb964ede0d5eeae41a077dc6dbfface9c0444;
GlobalSieve 0ad01a3eec4c5dcd2a51bb1d9773f7834970e372;
CrudeEnergy da67bf862a4c5e72ab6a81a7dfb462545cd8833f.
Preserve every original/reduced graph, open premise and axiom record.

RESUME HERE: at the actual TopFloor.floorZeroForm_le_main_term
nonempty-mask call, reconstruct the restricted off-congruence shell
estimate at t=23*k/36+1, with the original pivot cap and integrability,
then use its exact comparison coefficient in FiniteSystem; do not
claim elimination until the real caller graph is checked. Pending
RUN95/96/97/98 replay remains queued separately. HANDOFF integration,
positivity, kernel and audit. B3/B4 and RH remain OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false

namespace LandauRun99

/-- Exact natural-number guard for the restricted shell invocation. -/
theorem discountedShellGuard (k C : ℕ) (hk : 36 ≤ k)
    (hC : 3 * C + 12 ≤ k) :
    let t := 23 * k / 36 + 1
    t + C ≤ k ∧ 3 * t ≤ 2 * k ∧
    23 * k + 36 ≤ 36 * (t + 1) ∧ 23 * k + 4 ≤ 40 * k := by
  dsimp
  omega

#print axioms discountedShellGuard

end LandauRun99
