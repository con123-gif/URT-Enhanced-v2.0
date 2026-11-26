import Lib.PadicHodge.WachKisin.PeriodMatrixFrame

/-!
RUN62, 26 November 2026. SOURCE-MATCHED HUMAN DERIVATION, native probes
prepared, NOT compiled. Lane 9 literature provenance. Credit Levent Alpoge,
Luke Sernau, Anthropic collaborators and Claude for the compact source.

Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion first).
Current target lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src/Lib/PadicHodge/WachKisin/PeriodMatrixBasis.lean
blob cd91a46eb5624b88af20a96d0450bdf059994b93, exists_basis body.
PeriodMatrixFrame.lean blob 348d083320f3e9f59100db1a2f96f5a3f8e92923.
PeriodRings/BdR.lean blob 326d41233ac7638a50194f3ade22350c9b038ad5,
exists_Ainf_eq_of_contraction.
ChartScalars.lean blob 8dc59315a323816ecb0eedf46b5aae0a8c714fc5.
Readable companion at SAME pin, grh/src/Lib/PadicHodge/Kisin/PeriodMatrixBasis.lean
blob 8eef53f937994711def892c7546ef9b3b033cea3, used to disambiguate
the compact tactic body, NOT imported as an independent premise.
Prior RUN61 blob 31814a19abf27cc20e998b81d9bed981227ff6bf;
current HUMAN_PROOF_COMPACT blob 9870fca9396c2306122e15b676aeef4b71233d74.
Peer head search observed b96a0bbd, c4a32d99, 44a5d463, ce737b23,
ac8374d8, dec19e20, 7ab69780, 5a6ce275 (other lanes); no duplicate
period-basis completion in these commit descriptions.

## 1. Literature boundary (actual theorem vs exact native caller)

Bhatt--Morrow--Scholze, Integral p-adic Hodge theory, Publ. Math. IHES
128 (2018), 219--397, DOI 10.1007/s10240-019-00102-z.
Author PDF:
https://www.imo.universite-paris-saclay.fr/~matthew.morrow/Bhatt%2C%20Morrow%2C%20Scholze%2C%20Integral%20p-adic%20Hodge%20theory.pdf
Theorem 4.4 and Remark 4.5 (printed p.33, image inspected), Proposition
4.34 (printed p.44, image inspected), and Theorem 4.28 (text inspected).
4.4 constructs finite free BK modules for lattices in crystalline G_K
representations with a Frobenius and G_{K_infty} comparison over W(Cflat).
4.34 identifies their B_crys^+ extension with that of D_crys(V).
4.28 is the finite free BKF classification by a Z_p lattice and a de Rham
lattice over algebraically closed C. None of these statements as written
gives the quantified row-divisibility for arbitrary period matrices over
the particular chart bicommutant T, or the specific Z' and integral
Galois matrices in exists_frame. Also BMS uses its shifted theta
convention for the chart embedding (p.33). Do not conflate E, xi and
phi(xi), or assert the functor is exact (BMS explicitly warns otherwise).
Cais--Liu DOI 10.4171/DM/532 provides broader Kisin settings; its abstract
was checked, not all hypotheses of a substitute theorem. No direct
literature replacement established. Instead the following derives the
actual compact basis clause. Preserve standard ring prerequisites.

## 2. Uniform contraction: exact scalar proof

Write R=A_inf, A=A_max embedded in B=B^+=A[1/p], S the chart ring,
T=S_B its bicommutant. Suppress injective embeddings. Phi fixes p;
phi(tau)=xi*tau. Keep native p-regularity, I=(p,xi)-adic completeness
of R, p-adic separation of A, intersection R intersect p^m A=I^m,
and xi-power divisibility reflection R -> B (theta kernel, iterate
using injectivity). These are foundational statements, not new axioms.

Suppose V is a subset of A in B and for every a in V there exists
b in V with xi^h a = u phi(b), fixed u in R. From the Amax polynomial
decomposition (RUN61 section 3) with nu=tau, since tau | xi-p, each
p^(h+1)a=c_0+tau^(h+1)d_0, c_0 in R, d_0 in A.
Claim for every k and every a in V:
 p^(h+1)a=c_k+tau^(h+1)p^k d_k, c_k in R, d_k in A.
For a choose b as above and apply the induction to b. Then
 xi^h p^(h+1)a = u phi(c_k(b))
                 + u xi^(h+1) tau^(h+1) p^k phi(d_k(b)).
The improvement of the p-exponent uses phi(xi) being associated to p
in A, but the displayed factor is xi, not phi(xi): xi need not be
divisible by p in A? Here xi=p X in A by definition, so after division
by xi^h the error is p^(k+1) tau^(h+1) u X phi(d_k(b)).
The remaining term u phi(c_k(b)) is xi^h-divisible in B and therefore
in R, by reflection. This proves the claim, with no inverse of xi
assumed in A. Differences c_k-c_l for l>=k lie in p^k A intersect R,
hence I^k; completeness yields c in R. Its image is the p-adic limit
p^(h+1)a in A, by separation. This is precisely the contraction lemma
used by compact exists_basis; no boundedness of a Frobenius inverse on
B is assumed.

## 3. The actual period-matrix family and a uniform denominator

Take every native hypothesis on U: UW=(E tau)^h I, phi(U)=v U F,
F' F=I with F over T, and hat_stable for all S-linear f:R->R.
U injective since det(U)det(W)=(E tau)^(hd) !=0, hence WU=(E tau)^h I.
The Galois hypothesis is kept for the downstream frame, not used in
the basis argument. For fixed matrix M and e | mu, choose a common
denominator for its entries in A. If M y=e^h w and y in A^d,
the native amaxImage.p_pow_mul_mem_of_dvd_mu then puts p^k w in A^d.
The compact body uses this first with M=W,e=E tau up to unit,
then M=U,e=E, giving fixed n,k. For Uy=E^h x (x in R^d) and
U fhat(y)=E^h w, WUy=(E tau)^h y first puts p^n y in A^d,
fhat preserves A, and the second estimate puts p^(n+k)w in A^d.
Both exponents are independent of f,x,y and the coordinate.

To descend, let x'=phi_R^(-1)(v E^h x), f'=phi_R^(-1) f phi_R.
Only phi on R is inverted. Since phi(S) subset S, f' is S-linear.
For any Ua=r x' (r in R), applying phi and cancelling vU gives
 F phi(a)=phi(r)y.
Take a=W x', r=(E tau)^h. Multiplication by F' shows each entry of
phi(W x') divisible by phi(tau)^h. The native tau-power reflection
(dvd_of_thetaBPlus_frobEnd_eq_zero together with tau_dvd_of_theta_frobEnd
and pow_dvd_of_map) gives W x'=tau^h y' with y' in B^d.
Now Uy'=E^h x', by cancelling tau^h. Stability gives
U fhat'(y')=E^h w'. The extensions obey phi fhat'=fhat phi:
the difference preserves A and vanishes on R, by RUN61 uniqueness.
Apply fhat to F phi(y')=phi(E)^h y, using T-linearity and phi(E) in T.
Then applying phi to the equation for w', and cancelling phi(E)^h,
gives the EXACT descent phi(w')=v E^h w.

Let V consist of all p^(n+k)w_i over all these tuples, coordinates
and S-linear f. The first denominator argument gives V subset A.
Write xi=eta E. The descent gives xi^h a=(eta^h/v) phi(a') with
a' in V and the same fixed scalar in R. Section 2 applied to V gives
the actual uniform integrality:
                 p^N w in R^d, N=h+1+n+k.
Keep the native tau reflection and Amax denominator bound as named
period-ring inputs (not replaced by BMS); no extra crystalline axiom.

## 4. Free integral lattice, without assuming finite generation

Define P={x in R^d : exists y in T^d, Uy=E^h x}. The witness y is
unique, by injectivity. This is an S-module. If p x in P then x in
P since p is invertible in T. Thus if z x=p b for x,b in P, the
prime p in R and p not dividing z imply x=p x0 in R^d, and saturation
puts x0 in P. Hence z is regular on P/pP, and p is regular on P.
The (p,z)-adic separation of R^d gives that of P (no completeness
of P is assumed).

For a finite S-linearly independent family x_j in P with witnesses
y_j, R-linear relations among x_j are exactly those among y_j
(cancel U and E^h). If sum a_j x_j=0 with a_j in R, apply each
extended coordinate lambda_i to sum a_j y_j=0. T-linearity gives
sum lambda_i(a_j)y_j=0, hence the corresponding S-relation among
x_j. Independence forces every lambda_i(a_j)=0, so a_j=0.
Thus every S-independent family is R-independent and has size <=d.

Here is the elementary free-finite criterion at this actual caller
(compare compact AmaxStructure.free_finite_of_rank_le). Write
J=(p,z) in S=Lambda[[z]]. For any module M where p is regular and
z regular on M/pM, (J^s M:p)=J^(s-1)M for s>=1: expand p x in
sum p^j z^(s-j) M, reduce mod p, cancel z^s in M/pM, and divide by p.
For a homogeneous relation sum_{j=0}^s p^j z^(s-j)m_j in J^(s+1)M,
reduce mod p and cancel z^s to obtain m_0 in JM; remove that term
and apply the colon identity and induction. Thus the natural degree-s
map from (M/JM)^(s+1) to J^sM/J^(s+1)M is an isomorphism.
Apply this to P and S. Every finite family independent in P/JP lifts
to an S-independent family in P: a nonzero finite relation has a
least J-order among its coefficients, and its degree of that order
would contradict the graded isomorphism. Hence dim(P/JP)<=d.
Choose a finite basis of P/JP and lifts. Repeatedly approximate any
x in P modulo J^sP by S-combinations of those lifts, correcting at
each order with coefficients in J^s. Completeness of S gives limits
of coefficients, and separation of P makes the residual zero.
The lifts are independent by the preceding argument. P is finite
free of rank <=d; no Nakayama invocation requiring an already finite
module. Pad the basis by zero columns up to d, form matrices Q in R
and Z in T from the basis vectors and their unique witnesses:
UZ=E^h Q, and every native T-solvable x is in Q S^d.

## 5. Exact row divisibility and nonzero determinant

For arbitrary solution Uy=E^h x with x in R^d, y in B^d (not T^d),
each coordinate transform satisfies U lambda_i_hat(y)=E^h w_i;
section 3 puts x_i=p^N w_i in R^d uniformly. Its witness
p^N lambda_i_hat(y) is over T, so x_i=Q s_i, s_i in S^d.
Given m, RUN61 approximation supplies a common finite G such that
y-sum_G b_i lambda_i_hat(y) is in p^(m+k) A^d. With
t=p^N x-Q sum_G b_i s_i in R^d, the original equation gives
 U[p^N p^(-m-k)(y-sum_G b_i lambda_i_hat(y))]
       = E^h p^(-m-k)t.
The bracket is integral over A. The fixed denominator bound k
from section 3 for U gives p^(-m)t in A^d. Consequently t in I^mR^d,
I=(p,xi), by the exact intersection. If l Q=delta g then
 l(p^N x)-delta g(sum_G b_i s_i) in I^m.
For delta not divisible by p, its principal ideal is closed for
this approximation (native ThetaKernel.dvd_of_approx). For clarity,
a direct proof in this ring uses R/p a valuation domain, xi mod p
a nonzero nonunit, and p-adic completeness. Choose L with
v(delta mod p)<=L v(xi mod p). For a in the closure, reduction
mod p shows a mod p in (delta mod p) (principal ideals closed
in the rank-one valuation topology). Lift a=delta c+p b.
For every large m write a=delta c_m+r_m, r_m in I^m.
Then delta(c_m-c) mod p is in (xi^m mod p), so c_m-c mod p
lies in (xi^(m-L) mod p). Lift c_m-c=p d_m+xi^(m-L)e_m.
Thus p(b-delta d_m) is in I^(m-L); the colon identity from
section 4 with z replaced by xi gives b-delta d_m in I^(m-L-1).
So b is in the same closure. Iterate and use p-adic completeness
to obtain a=delta times the convergent p-adic series of lifts.
This proves closedness at the exact native nonunit delta (including
units trivially); it does not assume R is Noetherian.

Therefore delta divides p^N l x in R. Since p prime and p not
dividing delta, cancel p^N exactly: if p a=delta b then p divides
b, so a=delta(b/p). We get the native conclusion:
                  l Q=delta g, p not|delta => delta | l x.
For det Q, a left null vector l gives lQ=0. For any x in R^d,
U(Wx)=E^h tau^h x; take delta=z^m, g=0 in the row result.
Since p not|z, all z^m divide tau^h l x in B. RUN61 z-adic
separation implies tau^h l x=0; tau!=0, so l x=0 for all x,
hence l=0. Thus det Q!=0, the padded rank is exactly d.
These are all the stated clauses of compact exists_basis, from
the explicitly retained period-ring facts, chart and U hypotheses.

## 6. Frame caller and status

This supplies the missing compact exists_basis prerequisite of
exists_frame, not merely an ordinary Kisin module. At the frame
caller, the next essential step is det Q not divisible by p,
which is strictly stronger than det Q!=0. Keep the native
fixed-kernel/coordinate determinant argument for that step.
Once p not|det Q, use l=each row of adj(Q), delta=det Q,
and g=the corresponding unit row to obtain adj(Q)x divisible
entrywise by det Q for each arbitrary B-solvable x. Exact
cancellation gives x=Q a, a in R^d, for the integral lifting hQ.
The mission's existing inverse construction then applies; it is
not valid before the prime-to-p determinant step.

Human source dependency graph: C -> exists_frame -> exists_basis
 -> denominator bound + Frobenius descent + contraction
 -> P regular and rank bound + finite-free criterion
 -> coordinate approximation + principal ideal closure -> row
 divisibility -> det Q!=0.
Surviving primitive inputs include theta/tau reflection, Amax
denominator and intersection facts, chart adic basis and RUN61
coordinate extension, period-matrix U existence/hat stability;
det Q mod p and the remaining frame and downstream C obligations
are not deleted. Cache by pinned compact source, chart, U, h,
v, and fixed exponent N; no cross-pin equivalences or global
native graph edits. No URT or RH premise.

Actual CI reread on state branch: run 45803534769,
compute/rh-compact-primitives-replay-20261126/status.json
blob a56e2d3afb99ed8275e81fd63c8494306e57c43f reports error;
outputs/targeted_results.json blob 088cd2ec0e935ee1a282f10096949bcf671cc804
six named original checks (TiltingLemma, Filling.Moments) report
propext, Classical.choice, Quot.sound; module_1_build exit 124.
No coverage of this period basis. full_RH_replay=false.
Local command -v lean/lake returned no paths. No native rh_scan,
rh_prune, rh_reduce, rh_auto or rh_auto_frontier execution on these
declarations; no claimed PASS. Native probes below are prepared
for compact runner, not a Lean formalization of the human text.
Original and reduced native graphs/axiom evidence unchanged.

RESUME HERE: PeriodMatrixFrame.exists_frame, det Q mod p step
(lines 66--109 in current compact body): prove exact bounded
coordinate determinant, Artin fixed kernel, Frobenius transport
and coefficient contradiction, then discharge hQ in the existing
inverse construction. Also independently check period-ring inputs
at the actual caller; do not redo the basis algebra.
HANDOFF TO integration/editor, formal audit and compact native runner.
-/

#check exists_Ainf_eq_of_contraction
#check free_finite_of_rank_le
#check dvd_of_approx
#check Lift.Chart.IsPeriodMatrix.exists_basis
#check Lift.Chart.IsPeriodMatrix.exists_frame
#print axioms exists_Ainf_eq_of_contraction
#print axioms Lift.Chart.IsPeriodMatrix.exists_basis
#print axioms Lift.Chart.IsPeriodMatrix.exists_frame
