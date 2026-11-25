# Recursive thin reduction: geometric mean eliminates centering; Jensen reduces variable weights to conditional means
25 Nov 2026. New local human argument, conditional on actual principal host specialization; no Lean replay or RH closure. Continues cb92aa3a, ee726c86, 32968b08 and 05530e1b. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005. Latest relevant commits read; not exhaustive archive audit.

## Exact improvement
Fix native A0=H, h=|H|, F=2h, A=a(t)>0 and j. Write C_i={(1,i,k):k in H}, i=0,1; d=|T2|/h. For fixed g in C_i let I_g={u in H:g is thin for u}, c_i=|I_g|/h. By thick_filter and translation bijection c_0=1-d,c_1=1. Ignore any i with c_i=0. Let v_ug=w(u,j,partner(t,g))>0. Define conditional arithmetic means and one common geometric mean per coset:
    mu_g=(1/|I_g|) sum_{u in I_g} v_ug,
    b_i=exp((1/(h^2 c_i)) sum_{g in C_i} sum_{u in I_g} log v_ug)>0.
Both are on the ACTUAL weights; not fitted or free parameters. Native thin upper bound v_ug<=2b' implies b_i<=2b', hence A/b_i>=X'/3 under the original size hypotheses.

From inner_eq and ortho_coset define
    P_g(v)=Re[(1/F) sum_chi chi(-g) v GPsi(chi,A/v)]
          = R_g(v)+(A/F)log v+C_g,
    R_g(v)=sum_n Lambda(n) Kc(n,g) (A/n-v)_+,
where C_g is independent of v and every nonzero von Mangoldt coefficient Kc is real nonnegative. R_g is convex and nonincreasing in v, as a locally finite nonnegative sum of positive parts of affine functions. Thus Jensen on the finite set I_g gives
    (1/h) sum_{u in I_g} R_g(v_ug) >= c_i R_g(mu_g).
Moreover, for any positive b and mu,
    R_g(mu)-R_g(b) >= -(mu-b)_+ sum_{n<=A/b} Lambda(n) Kc(n,g).
For mu<=b this is monotonicity; for mu>b it follows from 1-Lipschitz positive part, with all n>A/b having zero contribution. These two inequalities use no estimates of individual characters.

The logarithmic centering cancels EXACTLY when summed over g in C_i, since
    (1/h) sum_g sum_{u in I_g} log(v_ug/b_i)=0.
Consequently the whole variable-cutoff coset contribution satisfies
    (1/h) sum_{g in C_i} sum_{u in I_g} P_g(v_ug)
      >= c_i sum_{g in C_i} P_g(b_i)
         - sum_g c_i(mu_g-b_i)_+ sum_{n<=A/b_i} Lambda(n) Kc(n,g).
Set M_i=max_{g in C_i} c_i(mu_g-b_i)_+. Using sum_{g in G} Kc(n,g)=2 exactly, get the simpler lower bound
    >= c_i sum_{g in C_i} P_g(b_i) - 2 M_i psi(A/b_i).
This retains all ramified prime powers. The exact weighted error sum above may be substantially better than its maximum envelope.

## Only four reference characters; no explicit log-spread term
At common b_i, summing over C_i annihilates all characters nontrivial on H by orthogonality:
    c_i sum_{g in C_i} P_g(b_i)
      = (c_i b_i/2) Re sum_{chi trivial on H} chi(-(1,i,0)) GPsi(chi,A/b_i).
If the four reference values have |GPsi(chi,A/b_i)| <= (A/b_i) theta_i, the lower bound is -2 c_i A theta_i. Therefore the averaged thin loss is at most
    E_thin <= sum_{i:c_i>0} [2 c_i A theta_i + 2 M_i psi(A/b_i)].
Use Chebyshev psi(y)<=4 log(2)y for y>=1 to obtain
    E_thin/A <= 2 sum_i c_i theta_i + 8 log(2) sum_i M_i/b_i.
This replaces the previous explicit mean log-spread by positive excesses of conditional arithmetic means over their geometric reference. It needs no uniform estimate over all variable thin scales; only the four reference characters at up to two scales. The estimate is a DIFFERENT sufficient budget, not uniformly smaller than cb92aa3a. Keep the previous common-maximum reference and native fallback, and take the best proved estimate.

If every thin weight in C_i is constant v_i, M_i=0 exactly, even when v_0/v_1 is arbitrarily large. More generally, if v_ug lies in [v_i,(1+epsilon_i)v_i] uniformly within a coset then b_i>=v_i, mu_g<=(1+epsilon_i)v_i and M_i/b_i<=c_i epsilon_i. No cross-coset weight ratio enters. Conversely, large in-coset variations can make M_i/b_i large; positivity and the native upper bound alone do not guarantee a small error. The new term is not automatically negligible.

## Combine with previous reduction
The cb92aa3a thick estimate is unchanged:
    mean_u Th.re <= mean_u De.re + 2d(eta+1)psi(A/b) + E_thin.
After summing t,j and division by Qd/2 (Q=|TT|mb>0,d>0), insert the new bound or the previous bound, whichever is proved smaller. The principal signed ramp and geometric ASK-MAIN budget remain independent obligations. No global deletion of other consumers of ThinScales.

## Native geometry lead (not yet a verified identification)
Pinned src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/ThinScalesIffHostBound.lean blob 1de433cc5ce2fa941ca72691bc75a3bccb667634 defines CanonInst: for j outside SizeData2.lifts, X.off j (false,t) equals sc.b'/sc.x if t belongs to host.TT and sc.w'' D.R.n otherwise. WinOK gives a separate narrow window for b(t) around sc.b'. This suggests stratified reference weights could be useful. HOWEVER CanonInst.off is not yet identified with the actual ChCore thin w(u,j,rho), and the two off-weight classes are not proved identical to C_0,C_1. Do not substitute the displayed scales or assert M_i=0. Need actual map from CanonInst through the weight producer and its size lemmas. Fetched levelData.lean 33dbb88db950028ce70d5adbc3ea925e994702ce and hostOfFieldOf.lean 261b566b0ea0d155ef1a434889d720c3b439735f, which did not supply this map. Further source tracing required.

Other exact source pins: ChCore.lean 878f5077bc382426c7da988e5a375b85deeaa7de (thick_filter usage, core, sum_A), SplitInertia.lean b5662cda1f3523fc53b547ee582a46bd3cd826d4 (SizesA), StronglyIrreducible.lean 94a385f59f3781ae6b1ab4beddc73850708a2bc6 (inner_eq, ortho_coset, Kc), ChBalance.lean 37648715bcf507e086374e8cc476ee746fd274f4 (ch_balance).
Actual V8 checks: 5760 exact integer Jensen/positive-part inequalities on nonuniform integer weights (m=1..5,n=1..9,b=1..8,k=1..8; A=20, v_j=1+(j*k+b) mod 11). 1229 strict Jensen cases. Four geometric-mean floating-point checks, max log residual 4.440892098500626e-16. These are generic scalar regressions, not real host computations; analytic proof given above. No native Lean execution, no claims of RH proof or improvement at actual weights.
RESUME HERE: prove a quantitative bound for actual mu_g/b_i or a verified finer partition with uniform translation coverage from CanonInst and actual weight mapping; then compare budgets to native CostWindows. HANDOFF TO geometry, character boxes, math, audit, integration. RH OPEN.
