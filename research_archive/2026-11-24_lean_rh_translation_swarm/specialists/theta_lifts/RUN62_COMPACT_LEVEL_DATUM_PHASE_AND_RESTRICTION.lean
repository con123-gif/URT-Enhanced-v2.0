import New.Columns.LocalStatement
import Mathlib.Tactic

/-!
RUN62 theta lane, 26 Nov 2026. Complete the concrete split-level
paired-datum and gauge argument feeding Theorem A's level-prime
branch, with explicit surviving dependencies. Human source-matched,
not newly kernel-verified. Credit Levent Alpöge, Luke Sernau,
Anthropic collaborators and Claude. Compact source pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion
first); manuscript b9772a9a768b396d02fad3b18e03a2de02e5e9a6.
Predecessor 5d295d098738d0cb1d2ca54bca302880b2ed6715 (RUN58).
Latest peers 76a10b40 (uniform local index), 3347d944 (jet basis
and dimension), 3c29c488 (integration), 34b26ecb (C basis).
No repeated numerical diagnostics; no URT.

Actual source bodies, relative to grh-compact/src:
New/Seesaw/NamesAtSplitLevel.lean f404d684189e658efb32374c500cd05900e12ba7
  23-67 split residue ring, 89-136 character and indicator;
  394-396 residue criterion; 464-522 concrete translation sum.
New/Columns/TwistedHeckeType.lean ccae44b8b21d1bface80bc3c8b10370a48c8ea48
  43-74 named datum raises; 82-106 paired chain; 110-135 consumer.
New/Seesaw/LiftCharacters.lean db457ba5fb4c37feeb4c22c6b3f47fa9e5a8eb45
  20-33 restriction, 78ff diagonal image and mirabolic.
New/Columns/ColumnDefs.lean 104b875374798b99448625fe6ce062ea6bfbfe65
  56-62 branching; 76-101 branchExp, borderU and restriction.
New/Curve/IntegralVacuum.lean c34fe7625b03009fbd5954ea00209b425ca603b1
  15-39 finite Fourier admissible combination.
New/Curve/ConjugatesOfJets.lean 8b841d76bb938d8a18fd4341aa832a20b13dd9e0
  28-36 standard data stable under translations; 135-143 raises.
Lib/Weil/MixedModel/AdelicSum.lean 49baa2583b79e2ffc4fff7dc791415866c03071d
  27-32 integral box; 88-91 Schrodinger action.
Lib/Weil/MixedModel/Names.lean 7dc9e83b6974266a3ed74a0ab24b47ec63a3e953
  81-92 names for translated boxes.
Lib/Weil/Construction/FiniteHeisenberg.lean be448ff4db1da9bfa0fe7bd637272be079be2285
  66-70 additive character and semichar.
Lib/Weil/Construction/Projections.lean 7a187f8be18a00b889082b56818393f20a7f88e4
  131-152 projection of translated vacuum.
New/Exchange/CrudeModularData.lean 2be49b2690280e070d21691f8a569fc81e113b2b
  43-62 kernel scale, translateDatum and Bmu.
New/Columns/ChainValuation.lean 19e853dfa8c645bfcdf3b3e21183f9b432620ef7
  299-335 free-class sum and gauge propagation; 337-338 scale integral.
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
  285-307 exact local consumer.

1. Concrete paired-datum support and unique residue match.
Use the notation of translateSum_eq_sum_name, not the earlier
abstract LiftLaw alone. P and S are split choices of ONE place
from each conjugate pair above N. Put j=idem P, e=idem S.
Their conjugate closures agree and e*star(e)=j*star(j)=0.
For each coordinate i of the intermediate space take
x_i=residueOverN(y_i), supported on S, with x_i*star(x_i)=0.
Let t_i=T(i,last), r_i=R(last,i), at the P-components of
the two matrix variables T,R. All other entries must be integral.
The two translated boxes have support
   t_i-x_i integral on P, r_i-star(x_i) integral on P.
At w in P intersect S the conditions are t_i-y_i/N integral
and r_i integral; at w in P minus S they are t_i integral
and r_i-y_i(conjugate w)/N integral, under the conjugation
identification. Thus on the combined support, t'_i=d_w t_i
and r'_i=d'_w r_i are integral, where (d_w,d'_w)=(N,1)
on P intersect S and (1,N) elsewhere. Conversely if these
are integral there is a UNIQUE residue y_i at the corresponding
S-place making the two original boxes nonzero, by reduction
mod N in the local DVR with uniformizer N. Off this support
every summand is zero. This gives the exact native support
of T diagN(n,S) and diagN(m,P minus S) R (the latter
scales the last row), including all non-last entries.
At the unique supported y the residue z_i in the named
last-column datum is red(t'_i) at every w in P; it need not
equal the original y at w in P minus S, where y is instead
red(r'_i). Do not globally identify these two indices.

2. Exact phase, including sign and no multiplicity.
The translated box formula is
  chi( (1/2) sum_i star(h_i) j(2 v_i+h_i) )
       1_integral_on_P(v+h).
The two Heisenberg shifts are h=-x in the last column and
h'=-star(x) in the last row. Their quadratic terms vanish
IDENTICALLY because x_i*star(x_i)=0, so no division by 2
in the residue field is used. Also the semichar correction
in converting finHeisOp to the ordinary Heisenberg action
is exactly chi(0)=1 for these shifts. Their combined phase is
   chi( -sum_i j[star(x_i)t_i + x_i r_i] ).
On the supported summand this differs from chi(-sum_i j t_i r_i)
by an integral adele: at w in P intersect S the difference
in the arguments is r_i(t_i-x_i), while at w in P minus S
it is t_i(r_i-star(x_i)); both products are integral by
section 1. Thus the phases agree, since psi_0 is trivial
on integral adeles. The sign is NEGATIVE. As d_w d'_w=N,
  -sum_i t_i r_i = -(sum_i t'_i r'_i)/N.
Reducing the integral numerator mod N does not change chi;
this is precisely psiN(sum_i red(r'_i) z_i), NOT its inverse.
There is one surviving z on the right, and one surviving
y on the left, hence no N-power or Haar factor.
This proves the equality of the two scalar functions of T,R.
Evaluation separates tensors of functions: for a finite
sum choose an independent basis of the span of its first
factors, then independence forces every second-factor
coefficient to vanish if all evaluations vanish. This
proves the tensor equality, not merely equality at a
preferred residue. Apply the two linear naming operators,
then use name_schrodingerAct_boxIndicator and
projOn P=projOn S (same conjugate closure), giving exactly
translateSum_eq_sum_name. The native finite-part subspace
inclusion is injective and tensoring over C preserves it.
Combined with RUN58 abstract paired law this supplies the
missing concrete conversion in chain₂_pairTranslates_eq_smul_chain.
Retain the source determinant-character scalar bound
N^(2mfb); no re-optimization required.

3. The cut datum has the required gauge multiplier.
At N the induced prime of K has residue field F_N
(N congruence hypothesis). Choose an integer c reducing
to c0=(1+sqrt(-d))/2 at that prime, and set a=c0-c in O_K.
Then a reduces to zero at the induced prime, and bar(a)
reduces there to -sqrt(-d), which is nonzero since N is
odd and prime to d. Consequently |iota(bar(a)*d)|_N=1,
a!=0, and bar(a) reduces to zero at every noninduced
place of E above N (the common conjugate of the induced
prime of K). The N-adic place choices are those of
isSplitLevel_nonInducedPlaces, not arbitrary split halves.
Let P be that noninduced set and M its squarefree modulus.
In isAdmissibleComb_name take q=1, g=N, d_parameter=bar(a)
(the last is the native residue-zero element), indicator
lastColDatum e_last, and u=translateDatum x j. The
coefficient values are 0,1; the archimedean-size condition
has false guard in this application (B=0, predicate false).
The finite Fourier formula used in that theorem is
   I(z)= |A|^-1 sum_{v,b in A} I(v) psi(b dot (z-v)),
where A is the coordinate residue module. Orthogonality
proves it pointwise, including at residue zero. Character
values and any change-of-lift phases are roots of unity,
and the denominator is cleared by absNorm((N))^r,
r=n(j)n(j+1), since |A| divides this number.
The actual translations have a*x integral above N
because their Fourier supports are on conjugate P and
the residue-zero choice d_parameter=bar(a) gives exactly
the translation constraint star(d_parameter)=a in
isAdmissibleComb_name. The theorem supplies these
translations with integral coefficients after clearing
the denominator, not merely a norm estimate.
The initial projection projOn P of translateDatum x j
is zero unless x_j is integral at every prime above N,
by projOn_finHeisOp and projOn_vacElem; otherwise it is
the same translated integral vacuum, up to the unit
semichar normalization if ordinary Heisenberg notation
is used. Hence it is standardData(a) in either case.
Translation stability (finHeisOp_mem_standardData) now
gives absNorm((N))^r * named datum in standardData(a).
The source kernel scale is c_scale=bar(piG), with
|iota(c_scale)|<=1, so mem_raises_of_standardData gives
gauge multiplier <=1 for this multiple, since the
denominator |iota(bar(a)*d)|=1 (no division by zero).
Undoing the scalar costs N^(2fr) because [E:Q]=2f.
The actual n(j),n(j+1) <= n(m) and native log-size
guard give 2 n(m)^2 <= b (the stronger available
size bound is not optimized), whence multiplier
N^(2fr) <= N^(fb). This reconstructs
name_lastColDatum_mem_raises, including why the
unrestricted x does not require an extra integrality
assumption. Retain the jet-integrality supplier
mem_raises_of_standardData and the source size guard,
not a new conjecture about theta coefficients.

4. Level commutation at the actual modified chain.
For source levels a,b, after conjugation by the native
diagPointN, the local P-parts of a and b^-1 are in the
integral mirabolic: A e=e, B e=e mod N. Thus for an
integral rectangular T, (B T A)e=e iff T e=e, and
integrality is equivalent before and after multiplication
because A,B and their inverses are integral. The named
cut commutes with the conjugated level action by the
native pairWeil_name_of_mem and pairWeilFinite_name:
both orders have the SAME determinant-character
multiplier (the conjugated integral units introduce
none), and the residue function is unchanged by the
displayed identity. The data must still be Schwartz-
Bruhat, as supplied by isSchwartzBruhat_liftFn;
away from the split closure the original level action
is retained by pairWeil_name_of_mem. This supplies ht
of IsGoodDatum.gaugeLe_chain at the exact consumer,
rather than treating arbitrary cut operators as equivariant.
The two diagram shifts are removed by Kernel.omega_omega
in the raises premise, so the gauges are measured at
diagPointN(j),diagPointN(j+1) as required. The class sum
formula from ChainValuation gives an aggregate gauge
bound N^(mfb): each class tuple has the product of
m bounds N^(fb), and each coefficient Psi(x) is N-adically
integral by good datum and coprimality of twist. Taking
the ultrametric norm only AFTER the joint-invariance
identity avoids multiplying by the number of classes
or by the number of x. With the same Fourier-preimage
column from RUN57/58, the pair scalar costs N^(2mfb).
Hence the output gauge at diagPointN(m) is <= N^(3mfb).

5. Restriction incurs no further p-adic cost.
Write J for the actual integer branching matrix, b_tau
for branchExp tau, k for borderU(g), d for diagPointN(m).
At each weight embedding tau, d becomes diag(I,u_tau)
with u_tau=N or 1 depending on whether star(inducedPlace
tau) is in piPlaces. Put A=prod_tau u_tau^(-b_tau).
Branching equivariance, applied to (k d)^-1, gives
  J rho_X((k d)^-1) = A rho_Y(g^-1) J.
Use the p-adic coefficient embeddings in this identity.
The integral matrix J has sup-norm <=1. The actual
restriction scalar is lambda=prod_tau Phi_tau(bar(pi))
^(-b_tau). The native valuation identity for pi and
the induced place (LiftCharacters 27-31) gives
   |iota(lambda)| = |A|_N,
because each |iota Phi_tau(bar(pi))|=|u_tau|_N.
Both scalar factors are nonzero, even for negative b_tau.
Thus the norm of the restricted form at g is bounded by
the gauge of the original form at k*d, with no factor
of N and no archimedean branching estimate used.
This is GaugeLe.restrictToY_of_diag, and proves the
level gauge bound for B_mu in section 4. Apply the
same comap index from RUN57/58 to exists_indexDvd_Bmu_divisible
at p=N, with beta rounding as peer RUN61, to deliver the
level-prime branch of the uniform local integrality statement.

Original source path retained:
translateSum_eq_sum_name + abstract LiftLaw + scalar bounds
 -> chain₂_pairTranslates_eq_smul_chain;
isAdmissibleComb_name + projection + standard jet raises
 -> name_lastColDatum_mem_raises;
mirabolic + named Weil action + joint invariance + restriction
 -> gaugeLe_Bmu_at_N;
Fourier preimage index + gauge -> level case of
exists_indexDvd_Bmu_divisible -> short_forms -> star.
Reduced human path is sections 1-5 plus RUN57/58 and
RUN61's index aggregation, with exactly the same witnesses.
All standard named foundations, including the local Weil
naming theory, jet integrality, native scalar bound and
branching matrix construction, remain dependencies (no
claim of globally deleting declarations or proof-term
axioms). The marked and nonlevel primes, archimedean
height, B and C are distinct surviving root branches.
Old long-source and original/reduced graph archives unchanged.
Context key is compact pin,D,N,ordered P,S,stage j,twist,
same Fourier-preimage lattice. Do not reuse across differing
split choices without rechecking support.

Actual verification: local PATH checked, no lean/lake/elan.
Actual CI run 45803534769 jobs and state receipts inspected:
status blob a56e2d3afb99ed8275e81fd63c8494306e57c43f,
targeted_results blob 088cd2ec0e935ee1a282f10096949bcf671cc804.
Six B/C checks had the three standard axioms; A-module build
timed out (2700.11s), all_requested_checks_ok=false. No
fresh native PASS or rh_scan/prune/reduce/auto/frontier on
this compact context, old pin native evidence not substituted.
No new numerical tests; proof is explicit, certificates below
prepared only. Independent audit and actual compact compilation
still required. Do not infer whole A or human RH closure.

RESUME HERE: integrate this complete level-prime argument with
RUN57/58 and RUN61, then inspect the remaining actual marked
class-representative operator intertwining in
Columns.hasType_markOperator (TwistedHeckeType 146ff) with the
acceleration/prime lanes; do not repeat their depth-factorization
or projector work. Audit the explicit scalar normalization
and the native jet supplier at the actual caller.
HANDOFF TO editor, integration, prime window, acceleration,
formal audit and kernel.
-/

namespace ThetaRun62

-- Exact phase numerator difference on each of the two conjugate strata.
theorem phase_diff_first {R : Type*} [CommRing R] (r t x : R) :
    -(x*r) - -(t*r) = r*(t-x) := by ring

theorem phase_diff_second {R : Type*} [CommRing R] (r t x : R) :
    -(x*t) - -(t*r) = t*(r-x) := by ring

theorem scaled_phase_numerator {R : Type*} [CommRing R]
    (d d' n t r : R) (h : d*d'=n) :
    (d*t)*(d'*r) = n*(t*r) := by
  rw [← h]
  ring

end ThetaRun62

#print axioms ThetaRun62.phase_diff_first
#print axioms ThetaRun62.phase_diff_second
#print axioms ThetaRun62.scaled_phase_numerator
#print axioms IsSplitLevel.translateSum_eq_sum_name
#print axioms Data.name_lastColDatum_mem_raises
#print axioms Data.GaugeLe.restrictToY_of_diag
#print axioms Data.gaugeLe_Bmu_at_N
#print axioms Data.exists_indexDvd_Bmu_divisible
