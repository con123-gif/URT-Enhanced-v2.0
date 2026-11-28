# RUN94 — one-row class-packing scale guard

28 November 2026. B2 independent source-matched human REVIEW; no fresh
Lean execution. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Preflight: mission 3adc76221a978016e3505cdf3e36ad688354d7d7,
spine 40aaf0afcc897a74d688bd6e9bae708428ffdabd,
ledger 579ecc1cafdb28eae7d1c97565700c571dfa7484; allocation 99cfbd1f;
HUMAN_PROOF_COMPACT 619ae01be98c32e053eef1c8bcd44ccddd0664e7
(relevant sections), SWARM_PROTOCOL, AGENTS, handoff and continuity
records; previous RUN93 449b1b34. Read latest peer titles and actual
integration/editor deltas 1d6a303d and be3872a8: both connect B2
to the root, do not replace this scale guard. Reviewed weighted
pair-count archive 2a968360c3538f6ccefdf29829535b56d3d2ca87 and
positivity RUN77 41848c4dad29215ce8b938eea9b5872c323dc596:
retain their actual packing inputs. Do not duplicate counting,
reprove Minkowski or change the native target exponent.

## Native anchors
- New/Filling/BlockBound.lean blob 6c68e80e3b1ea2b7983696716305493a37f2b1fd,
  sum_latticeDisc_inv_le 21–24; quotient and hB 25–35,
  weighted count 36–44, EXACT scale guard 45–52, discriminant
  transport 53–64, averaging 65 onward.
- New/Filling/NearTerms.lean blob bd8a969f8d1bda48ca0468c28a8a62bc78e280ce,
  tsum_sublatticeDisc_inv_le 65–68, tailScale_pow_four 285–286,
  of_size_bounds 288–293.
- New/Filling/Setup.lean blob 622e7ebe5c04b7ae87652e460762da7fb2e40727,
  piBar_mul_star and N_prime 28–29; ϱ_le_k, size_le, thousand_le_b,
  le_N in 46–56; tailScale 292; IsAdmissible.N_le 307,
  le_relIndex 314–315.
- Lib/General/Algebra/LatticeComplement.lean blob
  2af8405ff10f2d3fd924d048627b67397f0c5960, genIndex_natCast 26–29.

## 1. Exact guard at the SAME caller

Fix the native Filling E shape, CMType, StablyUnram and IsAdmissible.
Write b=S.b (not the local Lean variable named b at BlockBound.25),
n=shape.ϱ+1=shape.n, k=shape.k, f=numInfPlaces E, s∈N,
N=S.N, τ=S.tailScale, C=200*(f*k)*rootDiscr E, and

    A = Kf / ((S.latStabilizer.comap S.inclHFin).subgroupOf Kf),
    a = Nat.card A.

Here the quotient is a coset type, not assumed a quotient group.
By the exact relative-index hypothesis, a≥(N^k/b)^f>0.
This also excludes the infinite-index convention Nat.card=0,
justifying the finite coset sum. Preserve the same A for all u;
no representative-dependent cardinal is substituted.

RUN90 supplies the subspace sum C^[f(k+1)s]. RUN93 supplies the
one-row congruence bound (genIndex piBar)^[s+1] with x=1.
Since piBar is a finite idele and piBar*star(piBar)=N,
multiplicativity, conjugation invariance and genIndex_natCast yield
(genIndex piBar)^2=(N^f)^2. Both bases are positive; hence
genIndex piBar=N^f, not N^(2f).

Consequently the exact real guard at 45–52 is

    C^[f(k+1)s] * N^[f(s+1)]
        ≤ a * τ^[s+1] / N^[kf].                    (94.1)

All factors are nonnegative and N,b positive, so the corresponding
ENNReal.ofReal product conversion is valid. The native hB target is
a times the local b of line 25, namely τ^[s+1]/N^[kf].
In particular, the relative index is a LOWER bound: it gives
a/N^[kf] ≥ b^(-f), and does not give a≤N^[kf]/b^f.

## 2. Factor the common positive powers before comparing

By the preceding lower bound it suffices to prove

    b^f * C^[f(k+1)s] * N^[f(s+1)] ≤ τ^[s+1].       (94.2)

This is the precise cancellation of N^[kf] from the actual target,
not a replacement of the native subspace sum or its index.

Use b≥1000, N≥5, C>0, τ>0 and raise both sides of (94.2) to the
1000th power. The map x→x^1000 is increasing on nonnegative reals.
Substitute the original bounds C^1000≤b, N≤b^(60n).
The LHS is at most b^L, where

    L = f * [1000 + (k+1)s + 60000n(s+1)].
    (τ^[s+1])^1000 = b^R,  R = 250fk(s+1).

The second equality is exact: τ^1000=(τ^4)^250 and τ^4=b^(kf).
No fractional-power estimates or logarithms are needed.

For the natural-exponent comparison, the actual ϱ_le_k says
k≥1000(2ϱ+2)=2000n. Thus k≥2000 (n≥1),
1000≤k, k+1≤2k, and 60000n≤30k. Directly,

    1000 + (k+1)s ≤ 2k(s+1),
    60000n(s+1) ≤ 30k(s+1),
    L ≤ 32fk(s+1) ≤ 250fk(s+1)=R.

This factorwise comparison explains the native final lia without
truncated subtraction, a stronger scale assumption, or a case
split on s. Since b≥1, b^L≤b^R; monotonicity in the reverse direction
for the nonnegative bases proves (94.2), and then (94.1).
Use only the native target (94.1), not a reoptimized constant.
This argument holds also for s=0 and s>k (the actual subspace
sum is empty for s>k, but the guard needs no such split).

## 3. Actual consumer and limits

For each fixed u the nonnegative double sum after RUN89's
discriminant transport is bounded by the left side of (94.1):
sum over T of d(T)^(-k-1) times the inner weighted class bound.
The original hB follows by (94.1); apply RUN91's finite refinement
average to the SAME class weights and SAME coset set, to obtain
sum_c sum_T latticeDisc(c,T)^(-k-1)
≤ #Classes * N^(-kf) * τ^(s+1).

The integral coordinate geometry, subspace sum, weighted count and
finite averaging remain the named prior suppliers. The above is a
human audit of the last scalar interface, not a fresh proof of all
those suppliers or a native replay of the combined declaration.
The integration and editor maintain the live spine; no changes there.

## 4. Rejected routes / exact checks

- Do not read genIndex(piBar)=N^(2f): its square, not itself, is
  genIndex(N)=N^(2f); N>1 makes the two quantities different.
- Do not multiply by the reciprocal relative-index bound in the
  opposite direction. From a≥N^(kf)/b^f one obtains 1/a≤b^f/N^(kf).
  Using the upper rather than lower cardinality would not suffice
  to prove (94.1).
- Do not drop b^f in (94.2), since b>1. It is the exact loss from
  the index lower bound. The native exponent contains 1000f
  after raising to power 1000.
- Do not use C≤b as a substitute for C^1000≤b: it would produce
  1000f(k+1)s rather than f(k+1)s, which the native comparison
  cannot absorb by the same 250fk(s+1) estimate.
- Do not assume τ^1000=b^(1000kf); the exact exponent is 250kf.
- Do not use injectivity of x→x^1000 on all real numbers:
  +1 and -1 have identical 1000th powers. Native positivity
  is the required guard, not an extra assumption.

Actual verification: fetched exact pinned declarations and latest
mission/ledger/peer references; checked all algebra, integer exponent
bounds and nonnegative monotonicity by hand. No fresh Lean run,
no measured speedup or artificial scalar benchmark. The unrelated
orchestrator receipt 46083965085 is not evidence of RH replay.
URT-inspired grouping of the common powers yields a short audit;
the proof uses ordinary real inequalities only. Existing B2 joint
native receipt is separate. Full B2 human assembly, replacement
replay and independent full RH reconstruction remain OPEN.

RESUME HERE: audit BlockBound.HasLevel.norm_shared_vector_lt
at its actual caller in the skew-colouring injection, especially
the shared-vector norm bound for b≥j and its strict factor 2;
reuse the existing geometric injection and do not repeat (94.1).
HANDOFF TO integration/audit: exact real guard (94.1), its
sufficient inequality (94.2), and the common exponent comparison
complete this independent scalar audit. Preserve native statements
and all existing schedules and verification boundaries.
