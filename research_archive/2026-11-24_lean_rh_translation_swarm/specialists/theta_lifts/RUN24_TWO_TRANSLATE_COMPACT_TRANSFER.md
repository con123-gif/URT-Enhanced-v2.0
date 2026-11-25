# RUN24 — Two compact translates and derivative transfer (Step E)
2026-11-25. RESULT: DONE local SOURCE-MATCHED reconstruction of HSt.kSplit, HSt.ks_rhoP, HSt.fderiv_fV_R, LVs.rit_eq/law/transpose and the consumer stepE/stepE'. InfInv assembly and left Haar derivative supplier inspected; LawDeriv/PtId/CDiff and actual right-Haar instance proof remain explicit frontier. Full RH OPEN.
Source P=40e56bab026552e089d7afcfeff08d2defb9c005, leanprover-community/riemann-hypothesis; observed main H=a18a350c3e5aad997766cff2670b292313e46574, unchanged from RUN23. No repin.
Preflight: AGENTS, swarm protocol, queue, expansion, research-state/log/protocol/continuity excerpts and CI #423 (06:14:38 UTC, run 45556824120, general Cathedral checks only); theta RUN23, peer notes in all other 14 named lanes (latest selected by filename, not exhaustive history). Editor 0556 explicitly hands off Step E. Landau RUN24 requests actual root role paths, not assumed plugAll edge; kernel, acceleration and geometry request targeted cached role extraction. No competing Step E work observed. Blueprint referenced through queue, not reopened. No physics queue changes.

Paths below relative to src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/; C=CayleyCosetSums, A=AnalyticDeterminants, B=AbsoluteConvergence. All numbered references are P unless H marked. Names are source-level, not elaborated dependency edges.

## 1. Exactly two translates suffice
C/FdProps:44–47 defines KSplit: for all natural n,m, a,b in Fin n, any group Kg and monoid homomorphism iota:Kg -> M2(n) with image exactly InK (both directions), there exist L, complex c_l and k_l in Kg such that for every k,
    fV(m,0,iota(k)) [u1(iota(k))^(-1) u2(iota(k))]_(b,a)
       = sum_l c_l rhoP(iota,m,0,I,k k_l).
No topology, Haar, rank inequality m<n, or injectivity of iota needed in KSplit itself. If n=0 the indices do not exist. Actual proof kSplit (C/KsTraceSingle:97–end) takes L=2 and c_0=c_1=1/2.

Let P_ab be the permutation matrix of the transposition a,b, D_b diagonal with +1 at b and -1 elsewhere. Then N_0=P_ab and N_1=P_ab D_b are unitary and
    E_ab=(N_0+N_1)/2.
Indeed (I+D_b)/2 is the coordinate projection onto column b, and P_ab sends e_b to e_a. This includes a=b; no requirement that N_0,N_1 or the lifts be distinct. For any complex X, tr(X E_ab)=X_ba (not X_ab), so the same entry is half the sum of traces tr(X N_0),tr(X N_1). Native ks_perm_unitary:56, ks_diag_unitary:62, ks_single_eq:70 and ks_trace_single:19 prove precisely these identities.

B/SecondUnitaryBlockOfPair proves kM_mul, kM_conjTranspose, first_unitary_block_of_pair, second_unitary_block_of_pair, kM_of_unitary and KR_shape. The two unitary blocks of kM(A,B) are A,B. Its block form commutes with JJ, and unitarity of A,B gives kM(A,B)^*kM(A,B)=I and preservation of JJ. Consequently kM(I,N_l) is in InK. The exact image assumption on iota supplies k_l with iota(k_l)=kM(I,N_l) (choice, not an asserted algorithm for computing lifts).

C/KsTraceSingle:23–54 (ks_rhoP) proves for k,k1 in Kg, iota(k) in InK, N unitary and iota(k1)=kM(I,N):
    rhoP(iota,m,0,I,k k1) = fV(m,0,iota(k)) tr(u1(iota(k))^(-1) u2(iota(k)) N).
Write U=u1(iota(k)), V=u2(iota(k)); U,V unitary by compactness membership. Right multiplication changes U to U and V to V N. In rhoP the spectral value fz(m,0,0) is det(U)^(-m); its complex conjugate equals fV(m,0) by A/ScalarSectionCompactBlockInvariant:166–178 (f0*fV=1 and det U has modulus one). The other conjugated factor is tr((VN)^(-1)U)^* = tr(U^(-1) VN). This uses adjoints and inverse reversal, not commuting U,V,N. The trace identity and the two lifts give kSplit. A general matrix entry is thus expressed with exactly two unitary translates, not an unspecified large finite expansion. This is native Lean's own construction, not a new theorem or URT acceleration.

## 2. Right derivatives and why the transpose is not naive Haar invariance
A/IteratedFderivRightTranslation:50–86 defines R_W F(x)=DF(x)[xW], rit(F,N,W)=R_W0 ... R_W(N-1) F (N=0 gives F). For open U and complex C-infinity F on U, rit is smooth. If all W_a W_b=0 (including equal indices), then
    rit(F,N,W)(x)=D^N F(x)[xW_0,...,xW_(N-1)], x in U.
The native iterated_fderiv_right_translation:28–48 differentiates the N-linear map evaluation; all derivatives of its arguments are x W_0 W_i=0, so only the new outer derivative survives. Induction uses neighborhood equality on open U, not differentiating a merely pointwise equality. Without pairwise annihilation the identification fails; scalar F(x)=x, W0=W1=1 gives R_1 R_1 F=x but D^2 F=0. Smoothness and parabolic covariance (rit_law:88–117) do not require pairwise annihilation. If F(Px)=chi(P) F(x) on U preserved by P, differentiating this equality in direction xW gives the same law for R_W F by associativity. Hence every iterated R_W preserves the character.

A/IteratedFderivRightTranslation:152–200 (rit_transpose) requires hI:InfInv, F1,F2 complex smooth on Dom, their separate parabolic laws with characters chi1,chi2, and product chi1(P)chi2(P)=|det(P_22)|^(-2n). Kg is a compact topological group with measurable/Borel structure, mu Haar, iota continuous monoid homomorphism with image exactly InK. For N natural and W:Fin N -> M2(n), W_a W_b=0 for all a,b, it concludes
    int rit(F1,N,W)(iota(k)) F2(iota(k)) dmu
       = (-1)^N int F1(iota(k)) rit(F2,N,reverse W)(iota(k)) dmu.
Use InfInv to transfer one R_W0 at a time with a minus sign. Both remaining derivative functions retain the parabolic laws by rit_law; all integrands continuous on compact Kg, hence integrable. Induction, rit_snoc and snoc_rev reverse the order; N=0 holds identically. No complex conjugation is introduced by this bilinear transpose. It is not valid to justify arbitrary W by pretending exp(tW) stays compact.

Actual InfInv (A/SingToDiffAlt:91–98) says for any Z, the integral of the sum of first derivatives of two functions times the other function vanishes, provided the product transforms by the modulus above on G under InP, the functions are smooth on an open domain containing G, and the same compact Haar/iota hypotheses hold. A/InfInv:24–76 assembles II.infInv_of II.leftDeriv II.lawDeriv II.ptId II.cDiff. With Theta=F1 F2, LawDeriv supplies for all upper-block-triangular Y:
    DTheta(x)[Y x]=n(tr Y_11-tr Y_22) Theta(x).
PtId expresses DTheta(x)[xZ] as finite sums of left compact derivatives dK of cA*Theta and cB*Theta, where cA=(xZx*)_22 entry, cB=-(xZx*)_21 entry. eA=diag(E_ab,E_ab), eB=[0,E_ab;-E_ab,0] commute with JJ. CDiff gives real smooth coefficients. LeftDeriv integrates each term to zero; product rule gives InfInv. This is a native proof assembly, not a placeholder inference. Exact PtId/LawDeriv bodies are not translated here.

A/IILeft: core and leftDeriv (171–end) prove LeftDeriv: for real C1 F on open U containing K, compact Haar/iota hypotheses, and e commuting with JJ, the integral of dK(F,x,e) is zero and integrable. Define reK=(e-e*)/2 and imK=-i(e+e*)/2, both skew Hermitian and commuting with JJ, e=reK+i imK. For each skew E, exp(sE) is unitary and commutes with JJ, so it lies in InK for real s. Lift each exp(sE) to Kg (no continuous lift assumed); Haar left invariance makes int F(exp(sE)iota(k)) constant in s. Differentiate at zero: joint continuity on compact Kg times a small closed interval uniformly bounds the derivative; finite measure gives domination. The actual core invokes hasDerivAt_integral_of_dominated_loc_of_deriv_le, then derivative uniqueness. Real derivatives in the two skew directions sum as dK; F need not be complex differentiable for LeftDeriv. This is distinct from the right-invariance instance used below.

## 3. Step E consumer: the inverse in the right change of variable matters
C/VacuumNonvanishingOfFacts:66–115. Within Crux0 assume natural m<n, j=n-m, compact Kg, Haar mu, continuous iota onto InK; Step D from RUN23 holds for every weight rhoP(Y), derivative order, tuple and g in G. Given N>=0, tuple v of length N+1 with v0=WD(0,E_ab) and v_r v_s=0 for ALL r,s, set H=hF(j,m,0), V=fV(m,0), F1=rit(H,N,tail v). The stepE conclusion is
    int D^(N+1) H(iota(k))[iota(k)v_r] V(iota(k)) dmu=0.
By rit_eq, the first integrand is R_v0 F1 times V. F1 transforms with c1(m,0); V transforms with c2(m,0); their product is |det P_22|^(-2n) (A/ScalarSectionCompactBlockInvariant:124–158). rit_transpose with order 1 and actual infInv moves R_v0 onto V with a minus sign.

C/CanonicalPsiNeZeroOfPathBasis:145–end proves fderiv_fV_R on Dom, all natural m, a,b. For x in Dom, x+t x WD(0,E_ab)=x mX(I,0,tE_ab,I). u1 becomes u1+t u2 E_ab, ub1 is unchanged. Since q=0, V along the line is det(u1+t u2 E_ab)^(m-n) det(ub1)^(-n). Differentiation of determinant and integer power with det(u1)!=0 gives
    R_v0 V(x)=(m-n) V(x) [u1(x)^(-1)u2(x)]_ba.
This is valid even m=n, no division by m-n. The nonzero determinant guard from Dom is used for negative powers; native inverse_first_block_mul_unipotent_domain and hasDerivAt_det_add remain imported detailed proofs.

Use kSplit to write R_v0 V(iota(k))=(m-n) sum_l c_l rhoP(I,k k_l). For every l,
    int F1(iota(k)) rhoP(I,k k_l) dmu(k)
       = int F1(iota(k k_l^(-1))) rhoP(I,k) dmu(k)=0.
The exact equality uses right invariance of mu and substitution k -> k k_l, not left invariance alone or substitution without inverse. The source invokes GlobalTheory.isMulRightInvariant_of_compactSpace mu then integral_mul_right_eq_self. Human justification: on compact group a right translate of a left Haar measure is another left Haar measure, so by Haar uniqueness it is a scalar multiple; both have equal nonzero finite total mass, hence scalar one. The exact source body of GlobalTheory.isMulRightInvariant_of_compactSpace was not located this run (code search zero hits); retain imported obligation rather than label verified. The second integral is Step D with Y=I, g=iota(k_l^(-1)), W=tail v; rit_eq and map_mul identify the integrands. No need to assert F1 itself is identically zero. All finite-sum terms integrable by continuous F1, rhoP and compactness. Their integrals vanish, proving Step E. Step E' (:116–130) for a distinguished arbitrary index i0 swaps 0 and i0 using symmetry of higher Frechet derivatives TC.iterSymm, and preserves every pairwise product constraint. K=0 excluded by existence of i0. Step F (:following) uses this for all determinant permutation terms; full Step F and topComp still to reconstruct.

## 4. Provenance / upstream
Connector blob receipts for exact P; source paths above with .lean suffix. Reproduce by git rev-parse P:FULL_PATH.
```
C/Crux 1971ec2b5015abe0a1137f83eb23e5bdae2d0817
C/FdProps 1bbff855867c08b480b03ff6e62cfcaac88f0479
C/KsTraceSingle 2bbddaee4b3d2f518a63288e260b9a6877f06552
C/VacuumNonvanishingOfFacts 59b9d0e0060f8ea3e9387803aef00f5bae6d5eef
C/CanonicalPsiNeZeroOfPathBasis cd472c8e068984110db30178b2dcffc7cf63b20c
C/ContinuousMatrixLowerRightBlock 3b4e8c6f013d0e6da16b1bf2438d47dfcb893d76
C/StepD d0afbe992416d266e0053e69dc5911e4092bebd7
A/IteratedFderivRightTranslation d0edb1b110eeec447e526aa46c373e66318ad723
A/ScalarSectionCompactBlockInvariant b5c95f21c339895f02322e171ee375ca2373f560
A/SingToDiffAlt ce0e07c6678297a655e2b9e03de36c3a62e69010
A/InfInv 47e82279a7a99676ae8b0b766146e6b48547ab88
A/InfInvA 0e857dca020596485911cf20b1521100d4a47b92
A/IILeft 5af31bba596a51b7b3427094041f159299e33b61
B/SecondUnitaryBlockOfPair 42ec0f7a44543cdeae0e14869155e41d2ae58eea
```
H comparison: C/KsTraceSingle and C/VacuumNonvanishingOfFacts old paths 404; C/Crux (7ee5755446d0b5dc5e24987162d591acdc8415f0) contains ks_rhoP:300, ks_single_eq:347, kSplit:374, stepE:987, stepE':1037, crux:1211. C/CanonicalPsiNeZeroOfPathBasis d1ae8f0910d2956610a185c6da68e243a311eea5 fderiv_fV_R:247. A/IteratedFderivRightTranslation 325335aca1bde8360a1636d869086ea99bdfba2e rit_transpose:201. A/InfInv 379590f168ee1d06d0c0adbcb6a572f5fe7b4c9c infInv:647. Presence and relocation observed, not semantic equivalence. The exact local P assembly is crux := eRed (vacuum_nonvanishing_of_facts fdProps djFd kSplit sphU fzHol). Root membership of this branch still needs authenticated role-labelled receipt; do not count it toward reachable Main completion until then. Haar uniqueness, Jacobi determinant differential, multilinear calculus are standard mathematical ingredients; no specific external published attribution established for this local construction. No transitive axiom/sorry audit.

## 5. Executed reproducible check
CPython stdlib, local sandbox, exit 0. These finite algebra checks test the exact two-translate identity and the right change of variables on a noncommutative group, not analytic Haar theory or Lean replay.
```python
from itertools import permutations
from fractions import Fraction as Q
def mm(A,B):
    n=len(A)
    return [[sum(A[i][k]*B[k][j] for k in range(n)) for j in range(n)] for i in range(n)]
def tr(A): return sum(A[i][i] for i in range(len(A)))
def tp(A): return list(map(list,zip(*A)))
def eye(n): return [[int(i==j) for j in range(n)] for i in range(n)]
count=traces=0
for n in range(1,9):
    I=eye(n)
    for a in range(n):
        for b in range(n):
            s=list(range(n));s[a],s[b]=s[b],s[a]
            P=[[int(s[i]==j) for j in range(n)] for i in range(n)]
            D=[[int(i==j)*(1 if j==b else -1) for j in range(n)] for i in range(n)]
            R=mm(P,D); E=[[int(i==a and j==b) for j in range(n)] for i in range(n)]
            assert mm(P,tp(P))==I and mm(R,tp(R))==I
            assert [[P[i][j]+R[i][j] for j in range(n)] for i in range(n)]==[[2*v for v in row] for row in E]
            count+=1
            for seed in range(4):
                X=[[(3*i-5*j+seed*(i+1)*(j+2))%17-8 for j in range(n)] for i in range(n)]
                assert tr(mm(X,E))==X[b][a]
                assert Q(tr(mm(X,P))+tr(mm(X,R)),2)==X[b][a]
                traces+=1
G=list(permutations(range(3)))
def mul(a,b): return tuple(a[b[i]] for i in range(3))
def inv(a): return tuple(a.index(i) for i in range(3))
F={g:(i+1)**2-3 for i,g in enumerate(G)}
rho={g:(i+2)**3-7 for i,g in enumerate(G)}
wrong_side=wrong_inverse=0
for h in G:
    lhs=sum(F[k]*rho[mul(k,h)] for k in G)
    rhs=sum(F[mul(k,inv(h))]*rho[k] for k in G)
    assert lhs==rhs
    wrong_side+=lhs!=sum(F[mul(inv(h),k)]*rho[k] for k in G)
    wrong_inverse+=lhs!=sum(F[mul(k,h)]*rho[k] for k in G)
assert wrong_side and wrong_inverse
print('matrix-unit decompositions:',count,'trace checks:',traces)
print('S3 change-of-variable checks:',len(G),'wrong-side failures:',wrong_side,'missing-inverse failures:',wrong_inverse)
```
Actual stdout:
```
matrix-unit decompositions: 204 trace checks: 816
S3 change-of-variable checks: 6 wrong-side failures: 5 missing-inverse failures: 2
```
No added hypotheses in reconstructed implication. No new CI run observed, no kernel validation, no URT benefit claimed.

## RESUME HERE
Reconstruct exact PtId and LawDeriv suppliers of InfInv using A/DetOneAddSmulSingleSame and A/FderivXZxSkew (read native statements and trace exact proof terms; especially divergence trace and parabolic-character derivative). Locate right-Haar instance supplier if feasible, then Step F and topComp Step B. Retain FdProps, FzHol, Cayley/UAct, djZ's fz_mX and complex Capelli identity, Gaussian base/GI.integP, CR.crLem_of and KSing.lamSing_of. Ask dependency/kernel/acceleration for cached authenticated Main role path to crux/holLeadB and local theta branch, coordinated with Landau RUN24 rather than duplicate full scan. HANDOFF TO theta, dependencies, kernel, acceleration, integration, editor, audit. Full RH OPEN.
