# 27 November — relax the sharp filling moment at its actual arithmetic consumer

Continuation of a990894ee and the alternative restricted-volume work. NEW source-matched HUMAN reduction under explicit native inputs; no fresh Lean replay and no RH closure. Preserve current main route and all schedules. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Credit Alpöge, Sernau, Anthropic collaborators and Claude. Do not reopen the already proved scalar algebra on every run. This relaxes a difficult B3/B4 analytic TARGET, not a proof of the still-missing weaker moment.

## 1. Recheck and sharpen positivity at New/Main.star_inequality

Actual AdmissibleData.lean, Weights.lean, PrimeError.lean, Magnitudes.lean, IndexTypes.lean, Main.lean and Mathlib/NumberTheory/ArithmeticFunction/VonMangoldt.lean at the pinned revisions read. The latter has the exact existing theorem ArithmeticFunction.vonMangoldt_sum: sum_{i|n} Lambda(i)=log n. Let b,x,x1,a,f,m,k have their native meanings; t0=log b, B=f*a*t0^3, L=t0*B, H=m*k*dirCost. For y=nominalWeight(sigma), y<=a, all other nominal weights >=a/x1. Thus the term (y/n - nominalWeight(-n*sigma))_+ is zero for n>x1; the cutoff A=floor(x1)>=1 is valid even if x1 is noninteger. For any positive integer A,
  sum_{n<=A} floor(A/n) Lambda(n)=sum_{j<=A} sum_{n|j} Lambda(n)=sum_{j<=A} log j<=A log A,
and floor(A/n)>=A/(2n) for 1<=n<=A. Hence sum_{n<=A} Lambda(n)/n<=2 log A. From the exact lambdaClass formula and the quadratic character range, 0<=lambdaClass<=2 Lambda. Consequently
  primeSum(y,sigma)<=4 y log x1.
Weights.nominalWeight_le_w_sub at j=0 and h2>=0 give w_0>=y. IndexTypes upper bound for Omega is 1; native lower bound for gProd is b^20. Therefore jetSize(w_0)>=20 y log b, and
  H >= m*k*(20 log b-4 log x1)*sum_sigma nominalWeight(sigma)>0.
This sharpens the previous log a estimate without any assumption on the prime distribution or on thick being nonempty. Use the actual native scale 10^6 log x1<=log b, nonempty infinite places and positive a,m,k. Mathlib's divisor-sum identity is a named existing theorem, not an unproved analytic input.

The direct positive-height replacement for the scalar step is
  d(H-3L)<=n(H-mR+L)+2delta
  => n*mR<=(n+3d)L+2delta-(d-n)H
  <=(n+3d)L+2delta.
This removes the crude absolute-height and remainder dependency from the final caller with n>=d/2, and does not require strengthening the arithmetic endgame. See accompanying prepared scalar Lean certificate below. No native compilation of the new theorem.

## 2. Do not discard the slack before setting the rank target

Read LongForms.lean, OneDeterminant.lean, CrudeRows.lean, CostOfSquares.lean and RowVolume.lean. In the original heightLe_volume_rows proof, BEFORE its last mono step that uses the near-full-rank guard hn, complete the actual n independent rows y to a full basis x using k0=d-n extra crude rows, with the SAME auxiliary scalar gamma from crude_rows. Every extra row has all-conjugate squared norm bounded by exp(x1^2*b^2+x^99), by crude_rows and normSqAt_goodProjTranslate_le. Gram determinant bound for the complete basis is exp(V+k0*(x1^2*b^2+x^99)), using native norm_map_det_gram_le/covolumeSq_elim_le. The gamma ratio has height bound 4*m^2*t*x^999 by CostsSquares(2*m^2), where t=Data.t (not log b). The block-diagonal p-adic index witness is exactly the native one. Apply one_determinant directly before weakening:
  HeightLe(V+2delta+k0*K, z(theta)/z(1)),
  K=x1^2*b^2+x^99+4*m^2*t*x^999.
This follows by the SAME original proof with the final mono omitted. No change to fits, twists, row basis, or integral witnesses. Combine with the original reciprocal heightLe_volume_ratio_sq at the SAME theta:
  d(H-2L) <= V+2delta+(d-n)*K.                 (C_exact)
This is the real rank-versus-height budget. The native statement replaces its last term by dL using n>=(1-4/b^2)d, but that threshold is much stronger than required. In particular any eta>0 satisfying 4 eta K<=L works if n>=(1-4eta)d.

## 3. Explicit relaxed native target

Take eta=b^(-5/4) instead of b^-2. Native scales give x1<=b^(1/10^6), b>=x^(10^12), m<=2 sqrt(x), t<=15 x^5, x>=1, log b>=100 (from Parameters.c and scale), a>=xb, f>=1. Thus
  x^99+4m^2*t*x^999<=241 x^1005<=b^2*x1^2,
  K<=2b^2*x1^2,
  4eta K<=8 b^(3/4+2/10^6)<=b<=L.
The second inequality is true already at log b>=100 since log 8<100*(1/4-2/10^6). All statements preserve the original Data record. Therefore (C_exact) implies the SAME C inequality V+2delta>=d(H-3L) with the weaker rank n>=(1-4eta)d. The actual C suppliers and crude-row construction remain; only the excessive precision demanded of B has changed.

Use the exact original normalization P and central good projection Rgood at Fits.exists_translate_finrank_comap_le. Let v=columnDim and d=rank Rgood>0. Retain only the two first-moment bounds from COMPACT_CENTERED_FILLING:
  sum_i||(P*P-I)e_i||<=b^-4 v,
  tr((I-Rgood)PP*)<=4 b^-4 v.
They still require the actual Bessel identity, complement energy and small bad-projection estimates. The F=0 argument of c0a5aa98 shows d>0 from these two inputs alone. Replace the sharp THIRD moment tr(T^2)<= (1+9b^-4)v^2/d, T=mean_s rho(s)PP*rho(s)*, by the weaker target
  tr(T^2)<=(1+eta) v^2/d.                     (M_relaxed)
This would follow from a global sum_le_of_positive_type at A=empty with constant 1+eta rather than 1+9b^-4, using the SAME normalization and hD; no claim that this weaker bound has been derived independently.

For F<=rows, phi=dim F/d, U_s={u:Rgood rho(s)P u in F}, the same orthogonal-projection trace calculation gives dim U_s<=5b^-4 v+tr(P_F rho(s)PP*rho(s)*). Average over s and use HS Cauchy-Schwarz:
  min_s dim U_s/v <=5b^-4+sqrt(phi(1+eta))
                   <=(1+phi)/2+5b^-4+eta/2.
Ramification adds at most f/(N-1)<=b^-8 (native f<=b,N-1>=b^9), by the editor rank-only caller c1dc4f8b. For b>=1000, 5b^-4+b^-8<=eta/2. Hence we get IsSpread at eta=b^-5/4. Apply the original exists_few_translates (general eta already in its statement):
  n>= (1-4eta)d, |t_set|v<=5d log(1+b^(5/4)).
Use the SAME A short spanning set and index witness as LongForms.exists_family_covolumeSq_le, without a changed normalization. Then delta<=5d log(1+b^(5/4))B and V=n(H-mR+L).

Use C_exact and section 1 H>0, n>=d/2:
  mR<=7L+20 log(1+b^(5/4)) B
      <=(32 log b+20)B
      <=(log b)^2 B.
Here log(1+b^(5/4))<= (5/4)log b+log 2 and log b>=100. This is the identical final star inequality and unchanged analytic implication. Relative allowance of main-moment excess is b^(11/4)/9 compared with native 9b^-4; not a runtime speedup or proof completion percentage. Note original moment implies relaxed moment on these scales.

## 4. What to do and what NOT to do

This is an alternate, rigorous conditional end-to-end weakening using the real determinant completion budget, not merely proposing a new constant in an isolated inequality. Focus B3 on the weaker global moment at A=empty; keep all positivity, support, Haar, normalization and two first-moment suppliers. Inspect the induction in Moments.sum_le_of_positive_type: if it still uses the sharp local fixingSet estimate, weakening its conclusion alone is not a proof of weaker hypotheses. Try a direct global-only sieve or energy estimate exploiting the new excess allowance, rather than proving the stronger whole family unnecessarily. Other consumers of local fixingSet and block estimates must be checked. Keep native fallback. The sector route still lacks actual multiplicity/coverage; park it if no source-backed estimate emerges. No assumption of Poincare image Hecke invariance. No changes to active CI/jobs or source. Source-matched human proof, independent audit and native replay outstanding.

RESUME HERE: audit the exact pre-mono C budget at LongForms, the positive-height proof above and the relaxed B4 transfer; then determine whether the weaker global moment eliminates a real producer obligation. Do not count the weaker requested moment as solved. 
