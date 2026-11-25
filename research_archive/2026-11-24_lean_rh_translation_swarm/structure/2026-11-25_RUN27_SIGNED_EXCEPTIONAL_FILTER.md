# RUN27 — real exceptional-zero sign filter in the native two-scale thin budget
25 Nov 2026. Lane 13, SOURCE-MATCHED human local reduction; classical explicit-formula input distinguished from kernel verification. RH OPEN. One result: the possible exceptional zero is harmless for even parity in the actual top autocorrelation, and for nontrivial H modes its contribution has no inverse zero-gap singularity. Continues RUN26, cc5937fc, f5bab469, d5e73014. No URT advantage established in earlier matched benchmarks, so direct arithmetic used.

## 1. Keep actual source data
Pin P=40e56bab026552e089d7afcfeff08d2defb9c005. In the principal specialization of ChCore keep all shared host, arithmetic, scale, cutoff and same-host witness premises from the two-scale join. G=C2 x C2 x H, H cyclic of order h, F0=2h, T=TT nonempty, r=|T|, d0=|T2|/h in (0,1], S=sum_{t in T} A_t, a=xb. Retain the actual aT_win tie: a<=A_t<=a(1+1/(k*x^13)), x>=3, k>=1; RankVal.n_le' gives h<=2*x^(9/4). The two native upper reference weights from cc5937fc are B_L=w''+eta and B_T=b'(1+1/x+x^-2/4)+eta, where w''=b'/(xh), eta<=w''/x, b'=a/exp(x^(eps/3)). Thus y_L=a/B_L>=y_T=a/B_T>=exp(x^(eps/3))/2, log(y_L/y_T)<=log(2xh), log y_T<=x^(eps/3). This requires the native bT upper bound, and the actual transport of aT_win and RankVal, not just arbitrary SizesA.

For chi(alpha,beta,xi)(i,j,t)=(-1)^(alpha*i+beta*j)xi(t), let z_chi(y)=GPsi(D,ell,chi,y)/y. The exact signed thin contraction C=L_ref+T_ref of cc5937fc is
    C=Re sum_chi [ B_chi z_chi(y_L) + T_chi (z_chi(y_T)-z_chi(y_L)) ],
    B_chi = 0 if xi nontrivial, else S*(-1)^alpha*(1+(-1)^beta-d0)/2,
    T_chi = (-1)^(alpha+beta)/(2h) * (sum_t A_t xi(t))*conj(sum_t xi(t)).
No change to the actual geometric score or its selection. This reorganization cancels the ell term EXACTLY from the second summand for every character; for nontrivial xi this is the entire term. The finite prime-power identity inner_eq implies
    z_chi(y_T)-z_chi(y_L)
       = -integral_{y_T}^{y_L} (psi_chi(v)-1_{chi=0} v)/v^2 dv,
where psi_chi is the primitive von Mangoldt sum; endpoints at integers do not matter, and ramified prime powers retain their primitive values. No logarithmic-derivative estimate for this difference. The identity follows termwise from integrating 1_{v>=n}/v^2 and subtracting trivial-character log centering.

## 2. Exact sign lemma (unconditional finite algebra)
For real chi, xi(t) is +/-1. Put u=sum_t xi(t) (integer), e=sum_t (A_t-a)xi(t). Then
    |e| <= a*r/(k*x^13) <= 2a*x^(-43/4) < a,
    u*sum_t A_t xi(t) = a*u^2+u*e >= 0.
If u=0 the product is exactly zero; otherwise |u|>=1 and it is strictly positive. Consequently (-1)^(alpha+beta)*T_chi>=0. The same parity sign holds for B_chi, including B=0 for nontrivial xi. This exploits the much narrower actual native height window of d5e73014 rather than merely |A_t/b-x|<=1. For arbitrary positive weights the assertion is false: xi=(1,1,-1), A=(1,1,5).

## 3. One-sided exception filter
Use the classical primitive-character explicit formula with a possible simple real exceptional zero b0 in (1/2,1) retained, not silently omitted. Write
    psi_chi(v)-1_{chi=0}v = -1_{chi exceptional} v^b0/b0 + E_chi(v).
For a uniform bound |E_chi(v)| <= C0*v*exp(-c*(log v)^(3/8)) at all v>=y_T, the usual Abel tail identity gives
    z_chi(y)=1_{chi exceptional} Z_b0(y)+R_chi(y),
    Z_b0(y)=y^(b0-1)/(b0*(1-b0)), |R_chi(y)|<=theta_*=C1 exp(-c1*(log y_T)^(3/8))
uniformly y>=y_T, with smaller c1>0. Keep the primitive-character/ell identification Char_at (ell=L'/L(1) for nontrivial character) and ordinary zeta Laurent centering for the principal character. To see the tail identity: finite ramp = integral_1^y psi_chi(v)/v^2 dv; the full integral of psi_chi minus the principal main term equals -ell for nonprincipal and -1-gamma for the principal (Euler product and Abel limit). The error bound and b0<1 ensure convergence; no RH assumption. The primitive real exceptional term therefore has a POSITIVE sign in z. For each possible exceptional chi define J_b0=Z_b0(y_T)-Z_b0(y_L)>=0. The contribution is B_chi Z_b0(y_L)+T_chi J_b0, not the sum of absolute norms. For even alpha+beta it is nonnegative; it may be dropped from a LOWER bound, no matter how close b0 is to 1. For odd parity its sign is nonpositive, and it must remain.

In particular the entire thin estimate is
    C >= -(6+4/x) S theta_* - E_bad,
    E_bad = sum_{exceptional real chi, alpha+beta odd}
                 [ |B_chi| Z_b0(y_L) + |T_chi| J_b0 ].
Here sum|B|=2S and sum|T|<=2r*Amax<=2(1+1/x)S, so error <=(6+4/x)S theta_* using the ORIGINAL two coefficients B-T and T, not three independently normed terms. The exceptional set can be selected using the common conductor bound, with the classical zero-free region/Landau-Page; at most one primitive exceptional character among characters inducing on the same modulus. Even without that uniqueness, the displayed finite sum bound holds. In cyclic H there are at most two real xi, hence only four odd-parity characters can be harmful (two if h=1), with the nontrivial H cases vanishing when u=0. No global deletion of BoxH or other consumers.

For nontrivial H-character B=0 and
    J_b0 = (1/b0) integral_{log y_T}^{log y_L} exp(-(1-b0)t) dt
         <= 2 log(y_L/y_T)*exp(-(1-b0)log y_T).
This REMOVES the inverse zero-gap singularity for those modes. It does not by itself supply the needed decay for odd parity. A sufficient much weaker zero exclusion for the bad characters alone is
    (1-b0)*log y_T >= 2 log x.
Indeed Z_b0(y_L)<=2 x^-2 log y_T/(2 log x)=O(x^(-2+eps/3)/log x), and J_b0<=2 log(2xh)*x^-2. The sum weighted by |B|,|T| is O(S*x^(-2+eps/3)) eventually. Native real boxes excluding b0>1-1/400 imply this eventual condition, but it does NOT require exclusion at a fixed distance from 1. It does not impose any exclusion for even parity at this consumer. A near-1 odd-parity exception with nonzero T is a negative control; no sign-free dismissal is valid.

## 4. Classical analytic input / scope
The common primitive conductor bound must be transported from the actual host; retain that premise explicitly. HostVal.log_cond_le gives log(QS*q*d)<=2*x^(eps/5)*log(x)^2 and RankVal.n_le' as above. With primitive conductor dividing QS*q*d, for v>=y_T and fixed eps, log conductor = O((log v)^(3/5)*(log log v)^2). Classical zero-free region and truncated character explicit formula, with the reflected near-zero term treated stably, yield an E of the strength in section 3: take truncation height exp(sqrt(log v)); nonexceptional real parts <=1-c/(log conductor+sqrt(log v)); log factors absorbed since 2/5>3/8. In the stable explicit formula use (v^rho-1)/rho for low zeros (integral along the segment from 0 to log v bounds near-zero terms by sqrt(v)*log v for Re rho<=1/2), not an unbounded 1/|rho| estimate for the reflected exceptional zero. Zero counts and truncation give polynomial log factors. Thus the usual classical uniform error, with exceptional term visible, has more than the required exponent. This is an analytic reduction using classical explicit-formula input, not a reproof of all its hypotheses inside the pinned Lean corpus; independent literature/kernel audit requested. References: Davenport, Multiplicative Number Theory, 3rd ed., §§14, 17–20, https://doi.org/10.1007/978-1-4757-5927-3; Tao 254A Notes 7 proposition 6 and explicit-formula discussion, https://terrytao.wordpress.com/2015/02/22/254a-notes-7-linniks-theorem-on-primes-in-arithmetic-progressions/ . Do not infer the individual character bound by multiplying the absolute error in an AP prime-count theorem by phi(Q). If the conductor/primitive tie or uniform E estimate is not yet supplied, use section 3 as a conditional reduction or backtrack to existing ThinScales. In particular the analytic input here is not independently Lean-verified.

Insert this C lower bound into d5e73014 equation (B):
    F(x) <= w + 2x/(d0*S) *
       (Err/m + 3S/x + (6+4/x)S theta_* + E_bad + (eta+1)*d0*Msum).
As d0>=x^-eps and eps fixed, the above bad-gap threshold makes the new cost O(x^(-1+4eps/3)) and theta_* cost o(1). This reduces the actual thin supplier locally to a classical nonexceptional explicit formula plus the signed exceptional residual. It is not the ordinary-prime square-root cancellation or the geometry supplier. Remaining: common host and table existence, selected geometry Err, uniform Galois/cohomology inputs, signed base-character auxiliary estimate at x, actual caller and full root audit, original prime window target. No claim of closing a global dependency.

## 5. Provenance and reduction ledger
Latest mission blob 8dc6705e1bc6540b600f6c22309294466ec88fd0 incl mandatory unified pipeline, SWARM, AGENTS, HANDOFF, state/log/runner/continuity excerpts and peer commits through 0414c622 (incl cc5937fc, f5bab469, d5e73014, 02f1f880, 3eba527a, 6fec2cae, 05530e1b, 53e08a78, 32968b08) read. Upstream head observed ef451fc356cbc66861df031531aaafd2843797ac (09:07:15 UTC); no source mixing or assertion of unchanged contents.
Fresh pinned source:
- src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean 878f5077bc382426c7da988e5a375b85deeaa7de (th_le, core, ch_core).
- src/Formalism/SizeWindowBrackets/ChainSlopeWindows/StronglyIrreducible.lean 94a385f59f3781ae6b1ab4beddc73850708a2bc6 (inner_eq, Kc, orthogonality_ramified).
- src/Formalism/SharpRestriction/GlobalSchurBounds/QuadraticLogDerivCongr.lean 7828c8b1060818fe158e23f87f1ad9e2efcf79eb (Char_at, Nodes_at, Win_at, linkGLOBAL_of obtains ell and all uniform conditions).
- src/Formalism/LocalRingCardinality/DataParams₂.lean 50914500995df91e2646d91a6c5c99a7e603a51b (aT_win, A=26, a,b',w'',delta1).
- src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/PairRowIffQdRows.lean 688162690ac7cbfe620037fcee8e451e7116f45b (RankVal.n_le', HostVal.log_cond_le).
- same directory ThinScalesIffHostBound.lean 1de433cc5ce2fa941ca72691bc75a3bccb667634 (ThinOK, BoxH, BoxW.real_ne_zero, HostGood, Pt.From.chThin and boxE).
- src/Development/AutomorphicArithmetic/DedekindLFunctions/SplitInertia.lean b5662cda1f3523fc53b547ee582a46bd3cd826d4.
Source-visible actual branch (as traced by peer 02f1f880): Main -> rhOfAll -> allChi -> everyCharacter -> actual third-place TopG/Green -> level_gm_le_on_family_scales -> core_gm -> ch_core -> CharacterBalanceMoves.core -> th_le. Original typed/value/constructor edges and axiom ledger remain untouched. Candidate overlay: native principal tied weight tables plus primitive character tie -> signed two-scale envelope -> exact parity sign filter -> classical error + bad exceptional sum -> selected-witness equation. No assertion that original elaborated graph has already been changed. Cache context includes P, principal host, h, T,T2,A table, actual k,x,eps, y_T,y_L, conductor and exception identity; invalidate on any change. Preserve all other ThinOK/BoxH consumers and pending nodes.

Native environment unavailable: command -v lean and lake empty; git ls-remote failed DNS. Fetched tool sources RHRecursiveReductionFixed.lean 976c28572f11ffb00e1ae730555e938eeb564cb7, RHRecursiveReductionAutoV3.lean a113dc56ea987abac3bf29eb480782140b82ab4a, RHProofTermPrune.lean f6d3e7f6047a7895ecf183be3fb54c203f4fc46a. Actual published compute status tails retrieved: 45577239749 returncode 0, 98.87s, reduced_strip_root/rh_of_right axioms propext, Classical.choice, Quot.sound; 45576756833 returncode 0, 77.94s, rh_of_right 2000 visited, 1642 values, 358 noValue, 324 pending, 3 axioms. These are earlier engine/root checks ONLY. Neither new certificate nor caller has a native PASS. No new CI job registered; handoff to native lane for batch actual caller.

Prepared scalar Lean certificate (not executed; extract and load alongside existing engines in pinned environment; do not import Main):

    import Mathlib
    namespace RHExceptionalFilter
    theorem real_top_sign (a u e : ℝ) (ha : 0 ≤ a)
        (he : |e| ≤ a * |u|) : 0 ≤ u * (a*u+e) := by
      have hh := mul_le_mul_of_nonneg_left he (abs_nonneg u)
      have hprod : -(a * (u*u)) ≤ u*e := by
        have h := neg_abs_le (u*e)
        rw [abs_mul] at h
        have hh' : |u| * (a * |u|) = a*(u*u) := by
          rw [mul_left_comm, ← sq, sq_abs, pow_two]
        rw [hh'] at hh
        linarith
      nlinarith only [hprod]
    theorem favorable_exception (B T ZL ZT : ℝ)
        (hB : 0 ≤ B) (hT : 0 ≤ T) (hL : 0 ≤ ZL)
        (hTL : ZL ≤ ZT) : 0 ≤ B*ZL+T*(ZT-ZL) :=
      add_nonneg (mul_nonneg hB hL) (mul_nonneg hT (sub_nonneg.mpr hTL))
    #print axioms real_top_sign
    #print axioms favorable_exception
    end RHExceptionalFilter

Use rh_scan Deduction.CharacterBalanceMoves.core limit 2000, rh_prune Deduction.CharacterBalanceMoves.th_le as RHThLeExceptionCandidate, rh_scan on the new declarations; apply rh_reduce with favorable_exception after instantiating the actual real Fourier mode, then rh_auto/rh_auto_frontier for leftover finite sign inequalities. Preserve original statement bridges, and report exact errors if any. New scalar bridge prepared only; full replacement and native engine invocation pending.

## 6. Actual local regression (CPython, exact Fraction)
First attempt failed at the direct convolution equality because Python negative integer powers of -1 yield floats, not exact rational coefficients; corrected exponent modulo 2, also made the integral denominator a Fraction. Corrected run exit 0: 18572 mask-character checks, 9286 even, 9286 odd, 2144 zero top coefficients; 222 genuine prime powers, 7104 exact coefficientwise ramp checks, 160 exact exceptional-model checks, 2 negative controls. These are finite algebra controls on real character products (including ramified zeros), not actual asymptotic host geometry or a numerical test of zero-free boxes. Reproduce:

    from fractions import Fraction as Q
    from math import isqrt
    from itertools import product
    checks=0; zero=0; even=0; odd=0
    for h in (1,2,4,8,16):
        for mask in range(1,1<<h):
            t=[i for i in range(h) if mask>>i&1]
            A={i:Q(1)+Q((i%3),2*3**13) for i in t}
            S=sum(A.values()); r=len(t)
            for parity in range(1+(h%2==0)):
                v=sum((-1)**(parity*i) for i in t)
                va=sum(A[i]*(-1)**(parity*i) for i in t)
                for alpha,beta in product(range(2),repeat=2):
                    T=Q((-1)**(alpha+beta),2*h)*v*va
                    assert T==sum(A[i]*(-1)**((alpha+beta+parity*(j-i))%2) for i in t for j in t)/(2*h)
                    assert (-1)**(alpha+beta)*T>=0
                    B=0 if parity else S*Q((-1)**alpha,2)*(1+(-1)**beta-Q(1,2))
                    if (alpha+beta)%2==0:
                        assert B>=0 and T>=0
                        even+=1
                    else:
                        assert B<=0 and T<=0
                        odd+=1
                    zero+=T==0
                    checks+=1
            if h==16 and mask==2048:break
    def leg(n,p):
        return 0 if n%p==0 else (1 if pow(n%p,(p-1)//2,p)==1 else -1)
    def chi8(n):
        return 0 if n%2==0 else (1 if n%8 in (1,7) else -1)
    N=1200
    pp=[]
    for p in range(2,N+1):
        if any(p%d==0 for d in range(2,isqrt(p)+1)):continue
        n=p
        while n<=N:
            pp.append((p,n));n*=p
    ramps=0
    for p,n in pp:
        for a,b,c in product(range(2),repeat=3):
            chi=leg(n,3)**a*leg(n,23)**b*chi8(n)**c
            for lo,hi in [(Q(3),Q(7,2)),(Q(17),Q(100)),(Q(100),Q(1200)),(Q(1200),Q(1200))]:
                integ=0 if hi<=n else 1/Q(max(lo,n))-1/hi
                assert chi*(max(1/Q(n)-1/hi,0)-max(1/Q(n)-1/lo,0))==chi*integ
                ramps+=1
    exc=0
    for k in range(2,12):
        beta=1-Q(1,k); rho=1-beta
        for u,v in [(2,3),(3,3),(4,9),(10,100)]:
            ZT=Q(1,u)/(beta*rho); ZL=Q(1,v)/(beta*rho)
            J=ZT-ZL
            assert J>=0
            for B,T in [(Q(0),Q(2)),(Q(3),Q(2)),(Q(-3),Q(-2)),(Q(0),Q(-2))]:
                expr=B*ZL+T*J
                assert expr==(B-T)*ZL+T*ZT
                if B>=0 and T>=0:assert expr>=0
                if B<=0 and T<=0:assert expr<=0
                exc+=1
    assert -2*(Q(1,2)/(Q(1,2)**2)-Q(1,3)/(Q(1,2)**2))<0
    assert (1+1-1)*(1+1-5)<0
    print(dict(mask_character_checks=checks,even=even,odd=odd,zero=zero,prime_powers=len(pp),ramp_checks=ramps,exceptional_checks=exc,negative_controls=2))

RESUME HERE: transport the primitive conductor identification at the actual Char_at supplier and independently replay the exceptional-aware classical error bound (with reflected-zero control). Then try proving odd-parity box avoidance only for nonzero top autocorrelation, retaining other BoxH consumers; do not repeat all-character thin norm estimates or treat the sign filter as RH closure. HANDOFF TO literature, character boxes, kernel, audit, integration. Original graphs and records preserved.
