# 27 November — exact sector coverage criterion, obstruction, and positive main height

Continuation of 277ee043 / c0a5aa98. Source-matched human mathematics, conditional on the named native suppliers; no fresh Lean replay, no global RH closure. Primary pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207. Credit Alpöge, Sernau, Anthropic collaborators and Claude. Preserve the original proof and worker schedules.

## 1. Full-sector coverage cannot be inferred from even the sharp existing moments

Read LabelIdempotents.lean, LabelCharacters.lean, LabelDegree.lean, Moments.lean, FillingTheorem.lean, RowDimension.lean, GoodFormTransfer.lean, and previous centered filling/label repayment notes. A good label c defines a single irreducible complex finite-group type A_c (tensor product of the individual label characters), of dimension a_c. The actual good row sector W_c is isotypic, so W_c=A_c tensor M_c, multiplicity m_c=dim M_c. This is standard finite-group semisimplicity; retain the actual Green label character identification. A central label projector does not imply m_c=1. HasRigidLabels says at most one primitive label per Hecke system at a chosen place, NOT at most one Hecke system per label. RowDimension supplies only an upper bound on total row dimension, not multiplicity one. PoincareMap does not provide Hecke equivariance of its image.

Let P be the actual normalized column map, Rgood central good projection, v=dim Column, d=dim rows, eta=b^-4, E=ramifyingOp, r=dim ker E, epsilon=r/v<=f/(N-1). Use the orthogonal projection Q onto im E instead of E itself only in the trace argument (images of P Q and P E are the same; no assertion about the shortness of Q). Let
  T=mean_g rho(g)PP* rho(g)*,
  T_R=mean_g rho(g)Rgood P Q P* Rgood rho(g)*.
The prior CENTERED_FILLING note gives sum_i||(P*P-I)e_i||<=eta v, tr((I-Rgood)PP*)<=4eta v, tr T²<=(1+9eta)v²/d. For any orthogonal projection Q, the trace error is <=eta v by expanding in the original column basis. Thus tr T_R>=v-r-eta v-4eta v=(1-5eta-epsilon)v. And 0<=T_R<=T, hence tr T_R²<=tr T² (tr((T-T_R)(T+T_R))>=0 by positivity). Let U be the G-span of im(Rgood P E); exactly U=im T_R, since ker of positive sum is intersection of individual kernels. By Cauchy-Schwarz on the positive eigenvalues,
  dim U >= d (1-5eta-epsilon)^2/(1+9eta).
Consequently missing dimension Delta=d-dim U <= d(19eta+2epsilon)/(1+9eta) <= d(19eta+2epsilon).
This controls the ALL-translate invariant hull and not the cost of a finite set of translates. It is conditional on the sharp main moment, so does not bypass it.

Since U is G-invariant, U_c=A_c tensor M'_c. If every nonzero W_c is incompletely covered, Delta>=sum_{c: m_c>0} a_c. Therefore the checkable sufficient condition
  sum_{c: m_c>0} a_c > d(19eta+2epsilon)
forces at least one entirely covered nonzero sector. Equivalently the a_c-weighted mean multiplicity must be less than 1/(19eta+2epsilon). The existing source does NOT supply this bound. Do not interpret the giant group order as a bound on weighted multiplicity.

Exact abstract negative control on the SAME kind of finite-group decomposition: choose any collection of nonzero irreducible types A_c, take every multiplicity M with M-1>=1/(9eta), and take W=direct sum A_c tensor C^M, U=direct sum A_c tensor C^(M-1). Let the normalized column P be isometric onto U, Rgood=I, E=I, v=dim U, d=dim W. Then P*P=I, bad trace=0, T=P_U, tr T²=v<= (1+9eta)v²/d, but every sector misses one irreducible copy and no translate changes U. This refutes an implication from those abstract moment hypotheses alone even with arbitrary chosen irreducible degrees. It is NOT a counterexample to native automorphic data, and does not claim to satisfy the other native geometry/level conditions.

## 2. Exact finite-sector completion by repeated translated copies

Take an actual set t of short-form translates already selected (or t={1}), F_c=span of their projected images in W_c. Put n_c=dim W_c, a=a_c>0, r_c=codim F_c. If r_c=0 coverage is complete; suppose 0<r_c<a. Let K=F_c^perp, and let P_K be its orthogonal projection. For an arbitrary irreducible unitary representation on A of dimension a and multiplicity space M, Schur's lemma gives the exact twirl
  mean_g rho(g) P_K rho(g)* = (I_A/a) tensor Tr_A(P_K).
The partial trace is positive, of trace r_c; its operator norm <=r_c. Thus the mean projection <=(r_c/a) I. For a current deficiency subspace K_i (orthogonal complement of the combined translates), dim(K_i intersect rho(g)K)<=tr(P_{K_i} rho(g)P_K rho(g)*). This follows from positivity and the orthogonal decomposition of K_i into the intersection and its complement. Averaging selects g with new integer deficiency <= floor(dim K_i*r_c/a). Iteration gives deficiency <=r_c(r_c/a)^j after j added copies of F_c. If r_c(r_c/a)^j<1 it is ZERO. In particular r_c²<a needs ONE additional translated copy. The actual new translate set is t'= union_i g_i t (including identity), because the sector projector is central and B_{g s,c}=rho(g)B_{s,c}; scalar q and scaledInclusion remain the same. It costs |t'|<= (j+1)|t| (not |G| times |t|). Previous projected A therefore bounds index by (j+1)|t| v budget, with the same short-family arch exponent.

This is a finite group completion proof for an exact sufficient criterion, independent of global moments once F_c exists. It does not assert that actual r_c<a or that the price is acceptable. A generic group-invariant missing multiplicity defeats every translate, as section 1 shows. Exact budget target from preceding label repayment:
  2(j+1)|t| v/n_c <= (log b)^2-3 log b-2m log(M0)/budget,
where M0=chosenGroupOrder. This is sufficient for star IF the sector C audit succeeds. Native ChosenPlaceLevels gives log M0<=x^32; m<=2 sqrt(x); a>=b*x (roundUp), f>=1, log b>=1, and scale log b>=10^12 log x. Thus 2m log M0<=4x^(32.5)<=budget on the actual scales (retain precise roundUp and positivity guards). So the extra comparison projection cost does not block the route: it suffices that 2(j+1)|t|v/n_c <= (log b)^2-3 log b-1. The remaining bottleneck is a native sector coverage/rank-defect certificate and its cost, not the scalar normalization.

## 3. Separate unconditional scalar simplification at the original endgame (given native scale inputs)

The main height H=mk dirCost is positive; the crude estimate on |H|+m|remainder| is unnecessary in the FINAL scalar cancellation. This is stronger than RUN50's one-sided H estimate. Check actual AdmissibleData.jetSize/dirCost/primeSum, PrimeError.lambdaClass, Magnitudes, IndexTypes (bigOmega upper bound), and g bounds. Use a=Data.a positive integer, B=budget, y=nominalWeight(sigma)>0, w=w_0(sigma)>=y from roundUp and h2>=0. For all n in [1,a], 0<=lambdaClass(d,1,n)<=2 Lambda(n) since chiK is in {-1,0,1}; the nonnegative truncated weight is <=y/n. Factorization identity sum_{n<=a} Lambda(n) floor(a/n)=log(a!) follows by summing log j = sum_{n|j} Lambda(n), with floor(a/n)>=a/(2n). Hence
  sum_{n<=a} Lambda(n)/n <= (2/a)log(a!) <=2 log a,
  primeSum(y,sigma)<=4 y log a.
Native gProd>=b^20, Omega<=1 (IndexTypes.HasLogBound upper exponent 0), a<=b² (Magnitudes and logX+1<=logB), b>1. Then
  jetSize(w)=log(w!)+w log(gProd/Omega)>=20 w log b,
  jetSize(w)-primeSum(y,sigma)>=12 y log b>0.
Sum over the nonempty infinite places to get H>0. This is entirely elementary; no RH or prime error assumption. It uses actual source nominal weight/period/g/size guards, not a claim about the sign of an arbitrary direction cost.

With the EXISTING C (including near-full rank and crude-row completion), write d(H-3L)<=n(H-mR+L)+2delta. Rearrange directly:
  n*mR <= (n+3d)L + 2delta -(d-n)H <= (n+3d)L+2delta.
Using n>=d/2, delta<=5d log(1+b²) B, yields
  mR <=7L+20 log(1+b²) B <= (log b)^2 B
by native scale slack (log b enormous; e.g. t=log b>=100: log(1+b²)<=2t+1, so 47t+20<=t²). Thus the final scalar caller can remove BOTH crude absolute-height and remainder estimate and missing-rank penalty. It STILL needs existing C's near-full threshold to pay for the crude-row completion inside C. Do not infer that near-full rank has been removed globally. This is an actual human-derived local shortcut under source scale guards; no new kernel test.

RESUME HERE: (i) audit/replay mainHeight_pos and star_scalar_posHeight at actual New/Main star caller, without reopening prime error; (ii) investigate actual label multiplicities and projected Bessel map defect, use criterion in section 2 only if numerical/theoretical proof supports it; (iii) continue independent label-restricted C audit. If multiplicity or projection threshold cannot be proved, park alternate sector route and prioritize existing live B2/A/C; do not waste runs optimizing unattached constants. No schedule change, no global graph deletion, no full RH replay.
