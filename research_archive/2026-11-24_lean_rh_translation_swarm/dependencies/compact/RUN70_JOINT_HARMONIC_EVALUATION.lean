import Lib.DiscreteSeries.Theta.LocalThetaCorrespondence
import Mathlib.Tactic

/-!
# RUN70 — joint harmonic uniqueness via one matched-point evaluation
27 Nov 2026. SOURCE-MATCHED human derivation; independent finite
integer regression executed; Lean certificates prepared, uncompiled.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 9f4a2272265e847b3a46422b02d4b37e976bee10, manuscript
963e42122931b8e534c39765bb2a7422b2c557d7. Read AGENTS, swarm,
handoff, continuity, previous RUN69 47581d42081f06bf41cf0ebac87e9bed30f32264
and peer integration 9fbb841b, editor d14639a0, positivity 2952c52c.
This supplies the exact polarisation, sign and uniqueness premises
retained by RUN69, not the distinct B Bessel branch.

## 1. Sign and weight accounting: exact matched-pair cancellation

Sources (paths under grh-compact/src):
Lib/DiscreteSeries/Theta/JointHarmonicUnique.lean
f255a9013e232ab082c4033e07943cdf3d2b967d:
polarisation_eq_of_isCompactPrimitive, IsMatch.sum_cols_le_sum_rows,
IsMatch.lowestKType_sub_vacuumWeight_eq_neg,
IsMatch.sign_mul_lowestKType_sub_nonneg, IsMatch.unique.
Lib/DiscreteSeries/Theta/OscillatorDefs.lean
9da98cd30d3aac174f3c2fc1c9f3c479827dbcad: IsMatchedPair, IsMatch,
swap, varSign, relWeight. RepresentationDefs supplies HasGap.

Write n=|R|, m=|C|, d=n-m; x_r=l_r-2gamma+m,
y_c=l'_c-2gamma'+n. The matching is partial bijection, with
x_j=-y_k and h_j=sign(x_j)=sigma eps_j eps'_k on matched
pairs; unmatched rows satisfy |x_j|<d and unmatched columns
|y_k|<-d. All x_j+d are odd and x is injective. The native
gap is only imposed between opposite row signs, not between
all entries; in particular unmatched central rows have one
common sign, since their differences are <2d, much smaller
than the native gap. Similarly for unmatched columns.

The native lowest-weight formula, after parity removes the
floor, is
  A_r := 2 relWeight(r)
    = x_r + sum_j eps_r eps_j sign(x_j-x_r)
          - sum_k sigma eps_r eps'_k .
For the swap, sigma becomes -sigma. Thus
  B_c := 2 relWeight'(c)
    = y_c + sum_k eps'_c eps'_k sign(y_k-y_c)
          + sum_j sigma eps_j eps'_c .
Both A_r and B_c are even integers by their definitions.

For a matched r,c, set h=sign x_r and a=eps_r eps_j for each
matched j,k. The contribution to A_r+B_c from that j,k is
    a[(1-h h_j) sign(x_j-x_r)-h_j+h] = 0.
If h=h_j it vanishes immediately; otherwise the sign of
x_j-x_r is h_j and h_j+h=0. For an unmatched row j,
sign(x_j-x_r)=-h and its two contributions cancel.
For an unmatched column k, sign(y_k-y_c)=h and again the
two contributions cancel. Finally x_r+y_c=0. This proves
A_r+B_c=0 without two applications of the inequality
sum_cols_le_sum_rows. It is a local alternative at the
actual matched-weight consumer; no global deletion claimed.

## 2. Exact sign inequality, with the native parity

Fix r and s in {+1,-1}. Put z_j=s x_j, t=z_r.
Assume t>-d, the EXACT premise of sign_mul_lowestKType_sub_nonneg.
Let S={j:-d<=z_j<=t} and k=|S|. Since z_j+d are odd and
distinct, 2k<=t+d+1. Define
    F_j = eps_r eps_j sign(z_j-t) + 2 1_S(j) - 1,
    G_c = s sigma eps_r eps'_c - 1.
On a matched j,c, s sigma eps_r eps'_c
=eps_r eps_j sign(z_j), so F_j-G_c>=0:
outside S the two signs agree (matched |z_j|>|d|);
inside S their difference is bounded below by -2.
Unmatched columns have G_c<=0. Unmatched rows have F_j>=0:
inside S this is immediate; outside S they satisfy z_j>t,
with both z_j and t in (-d,d), hence eps_j=eps_r by the
opposite-sign gap. Consequently F_j=0 outside S in that case.

Summing these inequalities over the partial bijection and its
two unmatched complements yields
    s A_r >= t+d-2k >= -1.
As s A_r is EVEN, it is nonnegative. This is the actual
sign_mul_lowestKType_sub_nonneg, not an inequality requiring
t>=0. This proof only uses the gap to force common signs
among central rows (and, under swap, central columns).
We keep the full native gap elsewhere, especially analytic
rigidity, rather than claiming a global gap weakening.

## 3. Fischer polarisation from one positive Gram identity

For equal row signs eps_a=eps_b, define
D_ab^s=sum_{c:varSign(b,c)=s} X_ac partial_bc. In the Fischer
inner product on polynomials, multiplication by X_i is
adjoint to partial_i. For each pair p=(c+,c-) of columns
having opposite variable signs in row a, put
u_a(p)=-partial_{a,c+} partial_{a,c-} P.
The same sign partitions apply to all rows b of sign eps_a.
The exact identity, by moving the multiplications to the
opposite factor and commuting the distinct derivatives, is
    <D_ba^{-s}P,D_ab^s P>
       = sum_p <u_a(p),u_b(p)> = N_ab.
No extra derivative delta appears: opposite-sign variables
have different column indices. The swapped column Laplacian
condition gives sum_{b:eps_b=eps_a} u_b(p)=0, with common
nonzero sign factor, so sum_b N_ab=0.
For b distinct from a, the applicable compact raising
operator annihilates P: E_ab=D_ab^+ - D_ba^- when
l_a>l_b, or the reversed equation when l_b>l_a. Choose
s=+1 or -1 accordingly. Thus N_ab is a squared norm in
each case; N_aa is a sum of squared norms directly.
All N_ab vanish. In particular D_ab^s P=0 whenever
s*l_b<s*l_a, exactly the first polarisation conclusion.

For the second conclusion let E_aaP=Lambda_a P and
k0=s relWeight(a)>=0. The diagonal identity is
D_aa^s P = D_aa^{-s} P + k0 P. Taking the above cross
inner product with D_aa^{-s}P gives
    0=||D_aa^{-s}P||^2 + k0 <D_aa^{-s}P,P>.
The number operator D_aa^{-s} is positive, since
<D_aa^{-s}P,P>=sum_{c:varSign(a,c)=-s} ||partial_ac P||^2.
Consequently D_aa^{-s}P=0, every indicated derivative is
zero, and D_aa^sP=k0P. This proves both clauses at the
actual polarisation consumer using the native Fischer form.

## 4. One evaluation detects every nonzero pre-joint harmonic

Define X0_rc=1 on matched cells and 0 elsewhere, using the
actual IsMatchedPair including its sign inequality. Claim:
    F nonzero pre-joint harmonic => F(X0) != 0.
Assume the contrary. Translate H(X)=F(X+X0), an invertible
polynomial translation commuting with all derivatives.
Take a least-total-degree nonzero coefficient H_alpha,
degree D>0, choose cell (r,c) with alpha_rc>0 and put
beta=alpha-e_rc.

Coefficient-isolation lemma: if sum_i X_{a_i} partial_{b_i}F
is zero or a scalar times F, and exactly one a_i has X0=1,
then the corresponding b_i cannot equal (r,c). After
translation, take coefficient beta. All terms containing
X_{a_i} have degree-D-1 coefficients from H and vanish;
the right side also vanishes at beta. The unique surviving
constant-times-derivative term would be alpha_rc H_alpha,
nonzero over C. This also applies directly to a derivative
that vanishes, without any multiplication or isolation.

Put s=varSign(r,c). If r is matched to c0, apply the
COLUMN polarisation (row action of swap, variable sign -s)
to D'_{c0,c}^{-s}; when s*l'_c>s*l'_{c0} it vanishes,
and its unique nonzero translated coordinate is X0_{r,c0}.
Therefore s(y_c+x_r)<=0. If c is matched to r0, use
ROW polarisation D_{r0,r}^s analogously, obtaining
s(x_r+y_c)>=0. The restrictions to equal compact signs
are essential: the first inference only applies when
eps'_c=eps'_{c0}, the second when eps_r=eps_{r0}.
The following exhaustive cases retain these restrictions.

If -s*x_r>-d, section 2 with -s and section 3 eliminate
partial_rc directly. Otherwise s*x_r>=d. Since unmatched
rows have |x_r|<d, r must be matched (also if d<=0).
In fact x_r is matched and s*x_r> |d|: the alternative
s*x_r<-|d| would violate s*x_r>=d. Its partner c0
then has eps'_{c0}=eps'_c, because both corresponding
variable signs equal s. Thus the first polarisation
inference above applies, giving s*y_c<=-s*x_r<-|d|.
It follows that c is matched, say to r0, and the sign
condition at r0,c forces eps_{r0}=eps_r. Now the second
inference applies and forces x_r+y_c=0. By injectivity
r=r0 and c=c0. Finally section 2 with s yields
D_rr^s F=(s relWeight(r))F; its unique translated
coordinate of value one is precisely (r,c). The coefficient
isolation lemma again contradicts H_alpha!=0.
All cases give contradiction. This proves the claim without
assuming that the translated polynomial has a grading
compatible with the group action.

The equations defining pre-joint harmonicity apart from
nonzero are homogeneous linear equations, with fixed l,l'.
For nonzero solutions P,Q, form
    W=Q(X0) P-P(X0) Q.
It is a solution to those same linear equations and W(X0)=0.
The claim forces W=0. Since Q(X0)!=0, P is a scalar
multiple of Q. Thus the entire pre-joint harmonic space
is at most one-dimensional. This is precisely IsMatch.unique
and its use at the degree-minimal witness in HoweArgument.
No assumption of the existence of a nonzero solution is
needed for the at-most-one-dimensional assertion.

## 5. Actual consumer and surviving frontier

HoweArgument.lean 4a68183128d5be3f39e8a5ed7556bac698b3f4b6
IsJointHarmonic.howe_argument uses the three statements just
derived in RUN69's degree-minimal perpendicular argument.
LocalThetaCorrespondence.lean 2a5c865a64dcbd1a9c75218fcc4d93ee4b4c6bf8
OscillatorPair.exists_bump_integratedRep_eq uses this argument
for the preimage of the exact compact smearing range; hence
the joint-harmonic uniqueness/sign/polarisation branch of
that consumer now has a full source-matched human derivation.
Do not replace the original source graph: this is a proof
of the retained leaves, not a claim of global dependency
deletion. The actual oscillator pair, Fischer decomposition,
root-cone annihilation, exact analytic rigidity and existence
of the specified joint harmonic are still prerequisites.
Global Fubini/period arguments and Theorem C's other arithmetic
branches remain explicit. No import of RH or URT premise.

Executed local regression in Python (integer arithmetic):
for n,m=1..3, enumerate q=min(n,m) distinct matched x
from [-9,9] of parity d-1 and abs(x)>abs(d); append
central progression on larger side; set y_matched=-x_matched.
Enumerate row signs eps and unmatched column signs, set
eps'_j=eps_j sign(x_j) (sigma=1, other sigma is a sign
relabeling). For assignments with common central sign,
assert A_j+B_j=0 at each pair, A,B even, and both sign
inequalities for s=+/-1 wherever s*x>-d (swap d->-d).
1736 assignments checked, no failure. Negative control
without central sign coherence: n=1,m=3,x=(-9),y=(9,-1,1),
eps=(-1),eps'=(1,-1,1), A=(-8), B=(8,-2,2), violates
column sign inequality at y=-1,s=1. This is only a finite
regression of the explicit weight arithmetic, not a proof
of the operator claims or full native audit.
Native lean/lake commands unavailable locally. Actual CI
run 45799225653 jobs reported success, historical baseline;
state compute/rh-compact-primitives-replay-20261126/outputs/
targeted_results.json blob 088cd2ec0e935ee1a282f10096949bcf671cc804
still reports six named checks (TiltingLemma, Filling.Moments)
with standard three axioms, module_1_build timeout 2700.11s,
all_requested_checks_ok=false; full_RH_replay=false.
Native rh_scan/prune/reduce/auto/frontier not executed on
this pin. Below are uncompiled scalar certificates and actual
native caller probes for the shared runner, not new PASS.
Original/reduced graph and old axiom evidence retained.

RESUME HERE: retrieve actual joint harmonic construction
consumer and KernelFixes.integratedRep_fix_of_isKHighest;
derive its analytic rigidity (or check exact external theorem)
and root-cone annihilation against the same projected vector.
Independently audit section 4 equal-sign conditions and
section 3 Fischer adjoint signs; batch the native probes with
RUN69 when compact runner resources permit. HANDOFF TO
integration/editor, independent audit, native kernel runner.
Complete human RH proof remains unfinished.
-/

namespace RHDependencyRun70

theorem odd_count_payment (a t d k : ℤ)
    (ha : Even a) (hcount : 2*k ≤ t+d+1)
    (hpay : t+d-2*k ≤ a) : 0 ≤ a := by
  obtain ⟨j, hj⟩ := ha
  omega

theorem matched_pair_cancel (a h k v : ℤ)
    (hh : h = 1 ∨ h = -1) (hk : k = 1 ∨ k = -1)
    (hv : h ≠ k → v = k) :
    a*((1-h*k)*v-k+h) = 0 := by
  rcases hh with hh|hh <;> rcases hk with hk|hk <;>
    subst h <;> subst k <;> simp_all <;> ring

end RHDependencyRun70

#check polarisation_eq_of_isCompactPrimitive
#check IsMatch.lowestKType_sub_vacuumWeight_eq_neg
#check IsMatch.sign_mul_lowestKType_sub_nonneg
#check IsMatch.unique
#check IsJointHarmonic.howe_argument
#check OscillatorPair.exists_bump_integratedRep_eq
#print axioms RHDependencyRun70.odd_count_payment
#print axioms RHDependencyRun70.matched_pair_cancel
