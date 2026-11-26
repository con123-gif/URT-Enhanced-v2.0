import New.DiscreteSeries.GaussianShape
import New.Filling.FillingData
import Mathlib.Tactic

/-!
# RUN65 — complete the Gaussian minor and normalized compact integral at B
26 Nov 2026. Human source-matched derivation, audit pending; no new Lean replay.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion first).
Manuscript blob 0e365a21fbbb549e300384681c8b615cc9e32510.
Predecessor RUN64 0f78c5b214e85910ef6d41b6fe2143ddf46680f5.
Read latest peers, including theta 131aaf2d, dependency 84ff1202,
integration f775ec50, editor add4eea2 (distinct callers).

## 1. Direct log-series proof of exists_det_compress_eq_exp_logOneAdd
Use exactly the native hypotheses: orthogonal projections P,Q,
||X||_F<=delta<=1/2; A=[P,X], D=Q-P; tr([P,Q]Y)=0,
||A-Y||_F<=delta*c, ||Y||_F,||D||_F<=c. These imply delta,c>=0.
All norms below are Hilbert-Schmidt except explicit operator or nuclear
norms. The ordinary finite-dimensional log power series converges
absolutely for ||X||op<=1/2 and equals the native integrated logOneAdd
by geometric expansion of the resolvent, uniformly on [0,1].
The native determinant/log identity (or Jacobi) applies on ran P.
Relative to P, 1+PX is block upper triangular with diagonal
1+PXP and identity. Set R=1-P, L=log(1+X).
For m>=2 on ran P write
 T_m=P X^m P-(PXP)^m
     = T_(m-1) PXP + P X^(m-1) R X P.
By the commutator Leibniz identity
 ||P X^j R||_F <= ||[P,X^j]||_F <= j delta^(j-1)||A||_F.
Since ||RXP||_F<=||A||_F and the nuclear norm of a product
of two Hilbert-Schmidt matrices is at most the product of their norms,
 ||T_m||_1 <= binom(m,2) delta^(m-2)||A||_F^2.
The m=2 trace term is exactly tr(P X R X P)=-tr(A^2)/2.
Consequently
 log det on ran P (via the convergent trace series)
 = tr(P L)-tr(A^2)/4+E_1,
 |E_1| <= ||A||_F^2 sum_(m>=3) (m-1)delta^(m-2)/2
         <= 6 delta ||A||_F^2.
Last inequality follows from the sum ((1-delta)^(-2)-1)/2
and (2-delta)/(2(1-delta)^2)<=3 for delta<=1/2.
In particular the displayed 6 is safe, also at delta=0.

For the projection change, use Q^2=Q, P^2=P before estimating:
 PDP=-PD^2P, RDR=RD^2R, D_off=[P,[P,Q]].
Thus the diagonal part has nuclear norm <=||D||_F^2, giving
 |tr(D_diag L)|<=2delta*c^2.
For the off-diagonal part, trace cyclicity gives
 tr(D_off L)=-tr([P,Q][P,L]).
Subtract the zero tr([P,Q]Y) first. By absolute convergence
 ||[P,L]-Y||_F <= delta*c +
         sum_(m>=2) delta^(m-1)||A||_F
       <= delta*c+2delta*(3c/2)=4delta*c.
Here ||[P,Q]||_F<=||D||_F, so the total projection change
costs <=6delta*c^2. Finally
 |tr(A^2-Y^2)| <= ||A-Y||_F(||A||_F+||Y||_F)
                 <= (5/2)delta*c^2.
The entire residual has modulus <=(13.5+6+.625)delta*c^2
<=100delta*c^2. Exponentiate, with no global complex logarithm
branch selection. This proves the exact native statement
 det(1+PX)=exp(tr(Q log(1+X))-tr(Y^2)/4+r).
No new dimensional factor or stronger premise. In the degenerate
case c=0, all residuals are identically zero. Retain the native
log identity and ordinary nuclear/Frobenius inequalities.

## 2. The actual three-minor comparison
At exists_principalMinor_eq_exp retain l.HasGap h, g in U(J),
X=g-I, d=||X||_F<1/1000, J=diag(signs).
Use native lowerMask, u=lowerMask(signs,-l) X,
v=lowerMask(signs,l) X and y=(1-u)g(1-v).
Both u,v are strictly triangular within each sign-block in opposite
weight orders. For every lower-weight coordinate projection P,
R=I-P, the upper-weight principal minor is unchanged under these
two factors (block triangular multiplication and diagonal ones).
Full determinant is also unchanged. The matrices used in the
native two applications of flenstedJensen_shift_eq_conj
are accretive, since ||y-I||_F<=4d, ||(1-u)g-I||_F<=3d.
This gives dsCoeff(g)=flenstedJensen(1,y): retain the exact
FlenstedJensen shift theorem from FramedCoefficient, not an
assumption that all triangular factors act trivially.
Indeed first apply the shift by u, conjugating, and then apply
the shift by v* to ((1-u)g)*, conjugating again.

Let A=[P,X], B=[P,u], C=[P,v], a=||A||_F, k in K,
Q=k P k*, b=||[P,k]||_F=||Q-P||_F. B+C is the sign-diagonal
part of A, S=A-B-C its opposite-sign part. With m=X-u-uX,
G=B X+u A, H=G+m C+(A-B-G)v, direct expansion gives
 [P,y-I]=S-H.
The masks are orthogonal entrywise projections, so ||S||<=a,
||B||,||C||,||A-B||<=a. Moreover ||G||<=2da,
||m||<=(2+d)d, ||H||<=(5+3d)da<6da.
Hence for Q in place of P the commutator error is at most
 6da+2||Q-P||_F||y-I||op <=6da+8db<=16d(a+b).
The trace orthogonality tr([Q,P]S)=0 is exact: Q,P commute
with J, S has only opposite-sign entries.
Apply section 1 to (R,R,X,-A), (R,R,y-I,-S) and
(Q,P,y-I,S) with respective (delta,c)=(d,a),
(4d,4a),(4d,4(a+b)); call the errors x,z,t.
All hypotheses just checked, including compression bounds
||y-I||<=4d and 4d<=1/2. Equality of complementary minors and
full determinants gives, by cancellation of nonzero exponentials,
 principalMinor(k*y*k,P)
 = exp(tr(P log g)+(tr A^2-2tr S^2)/4 + t+z-x).
Here k*y*k denotes k adjoint times y times k.
The sign-unitary identity gives
 A*=J g^(-1) A g^(-1) J.
Writing V=g^(-1)-I, N=V A+ A V+V A V,
 ||V||op<=d/(1-d), ||N||_F<3da.
Then tr(A*A)=tr(A^2)-2tr(S^2)+tr(J N J A).
The latter error is at most 3d a^2. Thus the desired
 principalMinor(k*y*k,P)=exp(tr(P log g)+a^2/4+r)
has |r| <=100d a^2+6400d a^2+6400d(a+b)^2+d a^2
          <=200000d(a^2+b^2).
This is the native constant and sign, with no dropped phase
or principal-minor denominator. The full-set minor is exact
(a=b=0). Retain shift theorem and determinant/log identity.

## 3. Sum the integer cuts before estimating: Gaussian weight
At dsCoeff_gaussian_shape keep ALL its premises: n nonempty,
large gap A, |l_i|<=L, ||g-I||<=delta, T>=1,n^2<=T,
n^2 log(n+L+1)<=T, delta*T<=10^-12.
Write mu=paramAddRho(l), Lambda=lowestKType(l),
w=-mu, Lambda=mu-twoRho_compact; set
 q=gapWeightedNormSq(w,g-I)/4>=0, E=tr(diag(Lambda) log g),
 W(k)=|weightMinors(Lambda,k)|^2, H0=int_K W.
For all integer thresholds s between -sum|w_i| and sum|w_i|,
the coordinate projections P_s separate i,j for exactly
|w_i-w_j| thresholds. Thus sum ||[P_s,X]||^2=4q and
sum tr(P_s log g)=tr(diag(w+sum|w_i|) log g).
The full determinant normalizers in weightMinors cancel the
extra multiple of tr log g, exactly (use full-set minor).
The strictly monotone mu order is the l order by HasGap,
so section 2 applies at every cut. Summing residuals yields
 weightMinors(w,k*y*k)=exp(q-E-r(k)),
 |r(k)|<=10^6 delta (q+G(k)/2+n^2),
 G(k)=gapWeightedNormSq(Lambda,k).
Indeed the twoRho_compact entries have abs<=n and differences
<=2n; since k is unitary sum_ij |k_ij|^2=n,
 gapWeightedNormSq(w,k)<=G(k)+2n^2.
The extra trace from w+Lambda=-twoRho_compact is bounded by
 2delta*n^2. Combining with 200000delta(4q+G+2n^2)
 gives the stated 10^6 bound. Signs of r chosen by equality
of exponentials, not a logarithm of a complex-valued integral.

For any orthogonal coordinate projection P and unitary k,
 |det(PkP on ran P)|^2
 =det(I-(RkP)*RkP)<=exp(-||RkP||_F^2)
 =exp(-||[P,k]||_F^2/2).
This follows by diagonalizing the positive contraction
(RkP)*RkP and 1-x<=exp(-x); the two opposite off-diagonal
blocks have equal squared norm by unitarity. Multiply over
thresholds for Lambda; the determinant normalizers have
modulus one. Obtain W(k)<=exp(-G(k)/2).

## 4. The normalized compact integral, including the large residual
Use the actual normalized Haar probability on K, not an
unnormalized compact volume. Native dsCoeff on K equals
weightMinors(Lambda,k). The native TailBounds
measure_ball_le_integral_dsCoeff at radius 1, j inclusion of K,
gives 1<=4 (2000(n+L+1)^6)^(2n^2) H0.
In particular H0>0 and -log H0<=30T, by log(2000)<8,
log4<2 and n^2 log(n+L+1)<=T.
The exact definition of flenstedJensen and section 3 give
  dsCoeff(g)/exp(E) = (1/H0) int_K W(k) exp(-q+r(k)).
Set kappa=exp(-q) in (0,1]. Subtract kappa under the integral
using int W/H0=1. Put U=q+G/2. If |r|<=1/20, then
 |exp(r)-1|<=2|r|<=1/10, giving pointwise numerator error
 <= W*kappa/10. This uses the ordinary exponential series.
If |r|>1/20, then the remainder bound implies
 |r|<=(10^-6/T)(U+n^2), U>=49999T.
For such k,
 W*kappa*|exp(r)-1|/H0
 <= exp(30T-U+|r|)+exp(30T-U)
 <= 2 exp(-1000T) <= exp(-100T).
Indeed 30T-U+|r|<=30T-(1-10^-6)U+10^-6
<=-1000T since T>=1. This avoids any comparison of the
absolute integral with the integral of the real part.
Integrating the common majorant on the probability space gives
 |dsCoeff(g)/exp(E)-kappa| <= kappa/10+exp(-100T).
This is precisely the native GaussianShape conclusion, now
with all uniform remainders handled. In the zero radius case
the small residual branch applies everywhere. No lower
bound on an oscillatory integral is assumed.

## 5. Actual B consumer and open ledger
Substitute section 4 at BOTH factors in RUN64's near cone.
RUN64 retains the exact log-phase cancellation, near-one
correction, coefficient determinant/decay and integral covering.
This supplies its exact GaussianShape hypothesis with the same
T, delta and weight bounds, not a new independent Bessel model.
Consequently the RUN64 Laplace estimate and RUN63 peak/cut
assembly can use this derivation. Deep remaining inputs:
native FlenstedJensen shift and compact coefficient formulas,
large gap decay, compact covering/Lipschitz, Witt dual-frame
and triangular phase construction, and the distinct global
Siegel-Weil/Rallis and filling suppliers. No claim that these
are proved by a scalar Gaussian inequality.

Sources at pin (blob hashes freshly retrieved):
New/DiscreteSeries/GaussianShape.lean 37f359a0100b2ed6b67b4256af5e976bbbb19259
New/DiscreteSeries/MinorExpansion.lean 772d0fa5ac3e3b6bfbd4cf90c181e3e1ad359acb
New/DiscreteSeries/BesselExistence.lean d24e51a59e3048dfa5279c6e39055f4c2cea38ad
Lib/General/LinearAlgebra/FramedCoefficient.lean 301a17ed7f41e384178a00ba28c4545ba6f2c1e3
Lib/DiscreteSeries/FlenstedJensen/RepresentationDefs.lean 94fea15fbc65ed74c2a44e83dda2cd423d39fbea
Lib/DiscreteSeries/FlenstedJensen/FlenstedJensenInvariance.lean 46f4a4931a139742e73fc43f519da651ed680233
Lib/DiscreteSeries/FlenstedJensen/TailBounds.lean 3c13565c8bfecf91497747b0fe7cd7e39e50369c
Lib/DiscreteSeries/FlenstedJensen/PsiBasic.lean d888fafb9db9b1a5e78aa2551a1480f0cf057d20
Lib/DiscreteSeries/FlenstedJensen/KTypeProjection.lean f6c936f970a93a7318e5ea3ebe61f8c7dae77d2a
New/RealPlace/BesselOrthonormal.lean 7d412ab10f96adecb5ede2bfa386efc89916ec9c
Original graph unchanged: FramedCoefficient -> MinorExpansion
-> GaussianShape -> RestrictionLemma -> FillingData -> BesselCut
-> BesselSystem/Moments -> Theorem B. All shared edges retained.
Reduced human route: absolute log series and exact projection
identities -> three minor comparison -> threshold sum ->
compact probability integral -> existing RUN64 cone, same caller.
Cache keys include compact pin, l, signs, P,Q, X,Y, g, K,
delta,T,L and actual same-frame x in FillingData.
Native Lean/lake/elan absent on PATH; old-pin engines not executed.
Actual Actions 45799225653 fetched: completed/success (earlier
targeted job only). No new CI result for this certificate, no
axiom deletion or native PASS claimed. Source/axiom probes below
are prepared, not executed. No finite regression offered as proof.
RESUME HERE: complete Witt extension via the exact dual moment
matrix in IsSteep.exists_isTwoFactor_besselPairHom, then verify
the native block-triangular phase and besselSize_le_of_dual
on that SAME x. For remaining FlenstedJensen premises, use
actual caller and literature bridges, not new conditional restatements.
HANDOFF TO integration/editor, positivity, audit, compact replay.
Human RH reconstruction incomplete.
-/

namespace CompactGeometryRun65

/-- The exact residual budget of the three-minor comparison. -/
theorem three_minor_budget (d a b : ℝ)
    (hd : 0 ≤ d) (ha : 0 ≤ a) (hb : 0 ≤ b) :
    100*d*a^2 + 6400*d*a^2 + 6400*d*(a+b)^2 + d*a^2
      ≤ 200000*d*(a^2+b^2) := by
  nlinarith [mul_nonneg hd (sq_nonneg (a-b)),
    mul_nonneg hd (sq_nonneg a), mul_nonneg hd (sq_nonneg b)]

/-- Scalar large-residual exponent bound, after exact weight
normalization and cancellation. -/
theorem large_residual (T U z : ℝ) (hT : 1 ≤ T)
    (hU : 49999*T ≤ U)
    (hz : z ≤ (1/1000000 : ℝ)*U+1/1000000) :
    30*T-U+z ≤ -1000*T := by
  linarith

#print axioms three_minor_budget
#print axioms large_residual
#check exists_det_compress_eq_exp_logOneAdd
#check exists_principalMinor_eq_exp
#check norm_weightMinors_sq_le_exp
#check dsCoeff_gaussian_shape
#check IsTwoFactor.laplace_method
#check Data.exists_besselSystem
#print axioms dsCoeff_gaussian_shape

end CompactGeometryRun65
