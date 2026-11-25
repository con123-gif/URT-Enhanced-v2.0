# Average translations before bounding thin and thick character losses
25 Nov 2026. User requested a concrete shortcut. New local human derivation, not Lean replay, not RH proof. Continues ee726c86 (positive thick kernel), 32968b08 (thin Parseval at common cutoff), 86122968 (principal signed ramp), 05530e1b (signed prime-only auxiliary window). Pin 40e56bab026552e089d7afcfeff08d2defb9c005. Exact source ChCore.lean blob 878f5077bc382426c7da988e5a375b85deeaa7de, SplitInertia.lean b5662cda1f3523fc53b547ee582a46bd3cd826d4, StronglyIrreducible.lean 94a385f59f3781ae6b1ab4beddc73850708a2bc6, ChBalance.lean 37648715bcf507e086374e8cc476ee746fd274f4. Read latest peer commits; not exhaustive archive audit.

## Principal-host average: eliminate every nontrivial H character from thin supplier
Fix native A0=H (the principal-host specialization), h=|H|>0, d=|T2|/h, F=2h, G=C2 x C2 x H. The native e1(s)=((1,0),s). For fixed t,j and A=a(t)>0, thick_filter identifies the thick set J_u={((1,0),s+u-t):s in T2}. Its complement I_u inside C={(1,i,g):i=0,1,g in H} consists of the other coset plus unselected members of the first. For every g=(1,0,k), the fraction of u in H with g in J_u is exactly d; for g=(1,1,k), it is zero. This is an exact translation bijection even with arbitrary T2. We do not assume the weights w(u,j,partner(t,g)) are translation invariant.

Write v_{u,g}=w(u,j,partner(t,g)) and y_{u,g}=A/v_{u,g}. As in 32968b08, put U_g(y)=Re[(1/F) sum_chi chi(-g) GPsi(chi,y)/y]. By native inner_eq and ortho_coset, U_g(y)+log(y)/F is nondecreasing in y: all raw ramp coefficients Kc(p^k,g)>=0, and the ell terms are independent of y. Let y0=A/(2b')>0; for thin g native v<=2b' gives y>=y0. Thus
  U_g(y_{u,g}) >= U_g(y0) - log(2b'/v_{u,g})/F.
One may replace 2b' by the actual maximum thin v over all u,g for fixed t,j if it is smaller. If no thin set exists no reference is needed (in this native geometry the second coset is always thin). Set
  L_tj=(1/(h F)) sum_{u in H} sum_{g in I_u} log(2b'/v_{u,g}) >=0.

Now average BEFORE applying norms. At the common reference the exact Fourier coefficient is
  (1/F) mean_u sum_{g in I_u} chi(-g)
    = 0 if chi restricted to H is nontrivial,
    = a*((1-d)+b)/2 otherwise,
where a,b in {-1,1} are the character values on (1,0,0),(0,1,0). This follows from summing over H and the constant membership fractions just established. The four surviving coefficients are +(1-d/2), -(1-d/2), +d/2, -d/2 (depending on ordering); sum of absolute values exactly 2. Hence if only those FOUR characters satisfy |GPsi(chi,y0)|/y0 <= theta0, then
  mean_u sum_{g in I_u} U_g(y_{u,g}) >= -2 theta0 - L_tj.
No uniform bound on all characters at all varying thin cutoffs is needed for this replacement averaged step. One can instead use the exact signed reference combination, or compare the existing fallback 2|I_u| theta to 2 theta0+L_tj when both are available. In particular this is not an invalid application of Parseval to varying y. It is a one-sided comparison at a SINGLE reference followed by exact translation orthogonality.

## Thick loss gains the thick density
For thick g, use ee726c86's positive-part inequality P_g(v)-P_g(b)>= -(eta+1) sum_{n<=A/b} Lambda(n) Kc(n,g), where P_g(v)=A U_g(A/v). Averaging over u before bounding yields
  mean_u sum_{g in J_u}[P_g(v_{u,g})-P_g(b)]
    >= -d(eta+1) sum_{n<=A/b} Lambda(n) sum_{g=(1,0,k)} Kc(n,g)
    >= -2d(eta+1) psi(A/b).
This retains all actual weights and ramified primes. The earlier thick bound 2(eta+1)psi(A/b) loses d; native bound also multiplies by F.

## Combined averaged core
Write F_signed(y)=Re sum_{chi trivial on H} chi(e1(0)) GPsi(chi,y). Native sum_Th gives mean_u Th.re=(bd/2)F_signed(A/b). By ch_balance and the two inequalities,
  (bd/2) F_signed(A/b)
    <= mean_u De.re + 2d(eta+1)psi(A/b) + A(2 theta0+L_tj).
Sum over t,j. For d>0, Q=|TT| m b>0, mean gap B=mean_u gapA(u), derivative shift R from 86122968, obtain
  F_signed(x) <= R + 2 B/(Q d)
    + [4(eta+1)/(Q)] sum_{t,j} psi(a(t)/b)
    + [2/(Q d)] sum_{t,j} a(t)(2 theta0_tj + L_tj).
The thick density cancels exactly after division by d. At a(t)/b<=x+1, Chebyshev gives the thick contribution <=16(log 2)(eta+1)(x+1)/b, independent of group size AND thick density. The thin loss can use just four reference character estimates and actual mean log-spread. Native all-character thin bound remains a fallback. Need prove the new log-spread budget from the actual weights, and control B on the same host; neither is asserted. The principal host specialization must be authenticated at the actual caller; not a general A0 theorem. No global deletion of other consumers of ThinScales or CostWindows. The reference is generally far above x, so the previously established signed window bound at x does not automatically apply.

This is a genuine local alternative to the existing all-character thin estimate, not a new proof of the final prime inequality. For equal thin weights across translations and places, L_tj=0 with reference actual common weight, and the character count dependence disappears completely from the averaged loss. For unequal weights L_tj could exceed the old bound, so retain fallback. If thin weights are poorly controlled, the new bound need not yield a better numerical estimate.

## Actual finite exact regression
V8 integer enumeration over cyclic H=Z/h for h=1..64 and initial segments of every size k=0..h. Count every u's translated thick and thin membership at each group element; verify the exact four Fourier sign numerators and total absolute sum before normalization (denominator 2h^2). Output {"cyclicOrders":64,"translationCountChecks":183040,"thickCountChecks":91520,"projectedSignChecks":8576}. Generic finite group regression only; not native arithmetic host data, no claim of verifying actual w or analytic estimates. Analytic proof works for arbitrary finite abelian H. No native Lean run.
RESUME HERE: inspect actual weight producers to obtain the mean log-spread; verify the averaged core with principal host and signed geometry. HANDOFF TO character boxes, geometry, math, audit, integration, kernel. RH OPEN.
