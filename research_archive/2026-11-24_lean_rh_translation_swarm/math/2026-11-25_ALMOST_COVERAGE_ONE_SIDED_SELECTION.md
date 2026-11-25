# Almost-coverage suffices: one-sided selection with density cancellation
25 November 2026. New conditional reduction of selected-witness interface; no native Lean replay, no RH closure. Continues 2f135e5b, cc5937fc, f5bab469, 6fec2cae, d5e73014 and actual selected-core candidate 3eba527a. Do not conflate the original thick-only score with the combined thin/thick reference score. Source pin P=40e56bab026552e089d7afcfeff08d2defb9c005.

## 1. The sign of the actual score removes a range estimate
Use the combined score M(u)=B+sum_{s in T2}D'_{s+u} from peer 6fec2cae (translation-independent constants absorbed in B). This applies to the principal H=A0, h=|H|, d=|T2|/h>0, A_t=a(t)>0, Q=|TT|mb>0, y_L=a/B_L with B_L=w''+eta. Put v_t=A_t/y_L. For all sufficiently large x, v_t<=b (since A_t<=a+b, B_L<=b'/(xn)*(1+1/x) and a=xb, X'>1). Then
 D'_v=sum_t sum_n Lambda(n) Kc(n,e1(v-t)) [(A_t/n-b)_+-(A_t/n-v_t)_+-(eta+1)1_{n<=A_t/b}] <=0.
All nonzero Kc and Lambda are nonnegative, and eta+1>=0. This is a genuine sign, not a conjecture about cancellation. The finite sum includes ramified powers. Set F(u)=M(u)-B<=0; translation mean
 mean_H F = d sum_v D'_v = -d L, L=-sum_v D'_v>=0.

Let G be any NONEMPTY subset of translations for which a genuine carrying geometric witness is available with the required pointwise gapA<=Err, exact shared data/tables and native weight windows. G is permitted to depend on all common data. Let g=|G| and delta=1-g/h<1. No independence between G and F. Since F<=0,
 sum_{u in G} F(u) >= sum_{u in H} F(u).
Therefore some u* in G has
 F(u*) >= -h*d*L/g = -d L/(1-delta),
 M(u*) >= mean_H M - d L delta/(1-delta).
This holds without bounding the individual omitted scores, without selecting the true maximizer and even when G was chosen adversarially. The density factor d survives on the favorable side and cancels when transferring to the normalized final inequality. The original exact all-translation witness follows as delta=0. A single arbitrary geometric witness (g=1) generally does not suffice.

## 2. Unconditional bound on L from actual positive kernel
Let X_t=A_t/b and Y_t=A_t/v_t=y_L, 1<=X_t<=Y_t. Use sum_v Kc(n,e1(v-t))<=2 (subset of full finite group; sum over all g is exactly 2). For n<=X_t the ramp difference (A_t/n-v_t)_+-(A_t/n-b)_+ equals b-v_t<=b. For X_t<n<=Y_t it is <= A_t/n; beyond Y_t it vanishes. Consequently
 L <= 2 sum_t [(b+eta+1) psi(X_t)+A_t sum_{X_t<n<=y_L} Lambda(n)/n].
Elementary Chebyshev psi(z)<=C z for z>=1, with C=4 log 2, gives by Stieltjes partial summation
 sum_{X<n<=Y} Lambda(n)/n
 = psi(Y)/Y-psi(X)/X+integral_X^Y psi(z)/z^2 dz
 <= C(1+log(Y/X)).
Thus
 L <= 2 C sum_t A_t [2+(eta+1)/b+log(y_L/X_t)].
No assumption on prime distribution beyond Chebyshev, no zero-free assumption, no uniform all-character bounds. Actual reference y_L=a/(w''+eta)<=xn X' where X'=exp(x^(eps/3)); X_t>=x by aT_win. Hence log(y_L/X_t)<=log n+x^(eps/3). Native SizeN gives log n=O(log x), native CostWindows gives (eta+1)/b<=1 eventually. Therefore L=O(S x^(eps/3)) uniformly, S=sum_t A_t<=|TT| b(x+1). All constants uniform for fixed eps in native size range.

## 3. Explicit tolerated geometric coverage deficit
The combined score lower envelope in f5bab469, with original pointwise geometric gap and reference mismatch, yields the same bound there with an extra m*d*L*delta/(1-delta) in the numerator. Normalize by Q*d/2, obtaining additional loss
 E_coverage <= (2 L/(|TT| b)) * delta/(1-delta)
             = O(x^(1+eps/3) delta/(1-delta)).
The factor 1/d cancels EXACTLY; no loss from the Behrend thick-set density. Therefore the sufficient geometric witness producer may replace CoverAll by:
   for every sufficiently large native x in the specified window, after fixing the SAME i0, av, bv, host and arithmetic inputs, a nonempty set G of genuine carrying translations with required geometric bounds and |G| >= (1-x^(-1/2))*|H|.
Then E_coverage=O(x^(1/2+eps/3)), absorbed at the original RH-scale exponent (with standard eventual slack). More generally delta=O(x^(-1/2+2eps/3)) gives O(x^(1/2+eps)) with constants. This is a strict weakening of the local requirement to find a prescribed exact translation or all translations; it may enable a generic-good/few-bad geometry construction without covering exceptional translations. No actual almost-coverage theorem has been established. Do not infer it from local weight share bounds or word-good fractions: those may be on different index spaces. The original CoverAll supplies delta=0, so no new assumptions in the original implication. This is not a proof that arbitrary geometry or a single random translation suffices, not a proof of RH, and not a global deletion of CoverAll elsewhere.

## 4. Evidence and action
Pinned source ChCore.lean 878f5077bc382426c7da988e5a375b85deeaa7de; StronglyIrreducible.lean 94a385f59f3781ae6b1ab4beddc73850708a2bc6; QuadraticLogDerivCongr.lean 7828c8b1060818fe158e23f87f1ad9e2efcf79eb (common table selection and CoverAll); ElevenLe.lean 75f2ab1404c69a5d1330671d96d8f6cd35e74e52 (SizeN); DataParams₂.lean 50914500995df91e2646d91a6c5c99a7e603a51b (actual references). Read new peers 3eba527a, 6fec2cae, 02f1f880, d5e73014, f5bab469. Current actual selected-core source retains universal SizesA and is not compiled; do not claim its global coverage removal. Previous verified engines still stand.

Executed exact V8 exhaustive regression: all arrays F:{1,...,h}-> {0,-1,-2}, h=2..7, all nonempty good subsets. 332640 cases, 665280 exact integer inequalities, 331902 strict improvements of subset sum bound. No synthetic geometry as evidence; generic scalar regression of the sign lemma only. Analytic Chebyshev argument given above, no native Lean run.
RESUME HERE: trace actual CoverAll producer in DesignExistsDes and native chosen-design family; determine if geometry can be proved on most translations with failure rate <=x^-1/2, using the correct translation index (not word share). Kernel lane formalize one-sided finite subset lemma and apply after signed combined score selection. Integration retain actual common-witness quantifiers and both reference tests. HANDOFF TO geometry, kernel, integration, audit, acceleration. RH OPEN.
