# RUN22 — Compact positivity and dual-minor differentiation (Step G)
2026-11-25. RESULT: DONE local SOURCE-MATCHED reconstruction of LVs.pos_int and LVs.dpDual, with explicit final contradiction of the conditional vacuum_nonvanishing_of_facts proof. Full RH root linkage and imported obligations OPEN. Source leanprover-community/riemann-hypothesis, P=40e56bab026552e089d7afcfeff08d2defb9c005; observed H=27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59 (merge PR #2057, batch 13). Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/protocol/log/continuity excerpts, CI #417 (04:19:58 UTC, physical checks only), RUN21, 30 recent commit IDs, 16 recent peer commit patches/handoff excerpts. No competing Step G task observed. Blueprint not reopened; some peer notes only inspected through patches. Kernel RUN22 TLiftK parent application job status and output both returned 404 at the time of reading; absence is not nonreachability. No physical queue edits.

Paths below relative to src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/. A=AnalyticDeterminants/, C=CayleyCosetSums/. All citations to P unless explicitly H. These are exact source-level calls, not an elaborated DAG.

## 1. Actual positivity supplier, with every hypothesis
A/ScalarSectionCompactBlockInvariant.lean:227–249, PositivityTheory.Rg.Sw.LVs.pos_int:
For n,j natural (no j≤n or strict inequality needed here), Kg a group with topology, IsTopologicalGroup, CompactSpace, measurable space and BorelSpace, Haar measure μ (IsHaarMeasure), continuous monoid homomorphism ι:Kg→*M2(n), and hK: ∀g, InK(g) iff ∃k,ι(k)=g, define
    W(k)=u2(ι(k))^{-1}u1(ι(k)),
    A={i∈Fin n : i<j}, B=Fin n\\A,
    f(k)=|det W(k)[A,A]|² |det W(k)[B,B]|².
Then ∫_Kg f dμ>0. Empty determinant is 1, including n=0, j=0 and j≥n. No normalized Haar measure assumption.

The underlying group nonsingularity is proved in A/SecondCayleyBlockMulConjTransposeEq:17–106. With lower blocks C,D of g, g†Jg=J and J²=−I imply g invertible and gJg†=J, hence CD†=DC†. For u1=iC+D, u2=−iC+D the mixed terms cancel and u2 u2†=CC†+DD†. This is the lower principal submatrix of positive definite gg†, so positive definite and has nonzero determinant. Thus det u2≠0. hK gives InG(ι(k)) for every k; the inverse is continuous via adjugate/determinant (A/ScalarSectionCompactBlockInvariant:60–80). Principal submatrix restriction and determinant are continuous (:82–83). Norm, square and product give continuous f≥0. Its topological support is closed in compact Kg, hence compact. The monoid homomorphism sends 1 to I; wM_one (:222–225) gives W(1)=I; restricting I to any subset gives identity (including empty subset), so f(1)=1. The exact last call is Continuous.integral_pos_of_hasCompactSupport_nonneg_nonzero (with x:=1). In ordinary mathematics continuity gives an open neighborhood of 1 with f>1/2; nonempty open sets have strictly positive Haar measure, so ∫f>0. Finiteness follows from compactness, continuity and Haar local finiteness. No assumption that every minor is nonzero, and no division by either minor. Mathlib's imported integral positivity theorem remains an external dependency, not independently kernel checked here.

## 2. Exact dual derivative supplier, conditional on Cayley and UAct
A/SingToDiffAlt:58–63 defines DpDual, supplied by A/DpDual:377–457 as dpDual (hC:Cayley) (hU:UAct). Quantifiers: all n,j∈N with j≤n; all p,q∈Z; all x∈M2(n) with InG x. The differential detD is the signed permutation sum of order-cardinality complex Fréchet derivatives at zero (A/SingToDiffAlt:37–40). Write W=wM(x), α=p−n, β=q−n, and Q=emb_B(S), R=emb_A(T). The conclusion is
    detD_T detD_S fV(p,q,x mX(I,Q,R,I))
    = (∏_{i=0}^{j−1}(α+i))(∏_{i=0}^{n−j−1}(β+i))
      fV(p,q,x) minor_A(W^{-1}) minor_B(W).
Notice reversed order of Q,R relative to DjSec; swapping these changes the minors. Empty products retained.

Proof: complementary supports imply QR=RQ=0 (:119–140). This allows the inverse of the block unipotent [I Q; R I] to be [I −Q; −R I]; conjugate by Cm to get the mX inverse. The native inverse-first-block identity (:334–356) is ub1(x mX)=u1(x)†+Q u2(x)†, obtained by multiplying the block rows [I,iI] and the explicit inverse of x from InG. At Q=R=0 it gives ub1(x)=u1(x)†. Since u1 u1†=u2 u2† and both blocks nonsingular (actual det_u_ne :204–246), W u1†=u2†. UAct gives
    u1(x mX)=u1(x)(I+W^{-1}R),
    u2(x mX)=u2(x)(I+WQ),
    ub1(x mX)=(I+QW)ub1(x).
Consequently the native fV formula (A/SingToDiffAlt:25) and Sylvester determinant identity give
    fV(p,q,x mX)=fV(p,q,x) det(I+W^{-1}R)^α det(I+WQ)^β.
IMPORTANT: the source key (:394–417) assumes det(I+WQ)≠0 for combining integer powers q and −n; do not remove that guard or assert global factorization across zeros. For each fixed T, det(I+WQ) is continuous in S and equals 1 at zero, so the equality holds eventually near S=0. detD_congr (:19–21) makes this sufficient for the inner derivative. No outer nonzero determinant condition is required for arbitrary T in this inner step, and for the final T derivative the relevant determinant equals 1 at zero. All integer powers are smooth near the evaluation point (:46–53).

For any subset s with coordinate injection E_s and projection E_s^t, emb_s(U)=E_s U E_s^t. Two applications of det(I+AB)=det(I+BA) give det(I+M emb_s(U))=det(I+M[s,s]U), including empty s (:97–117). Apply hC (Cayley, A/SingToDiffAlt:42–45) first to W[B,B] with exponent β and then W^{-1}[A,A] with exponent α. Smoothness permits constant factors to pass through detD (:23–32). The cardinalities of A,B are j,n−j (:364–375), giving the displayed formula. Actual source uses hC and hU; do not count their suppliers as independently reconstructed in this run.

## 3. Assemble Step G and remove a superfluous factorial product in the reading view
C/VacuumNonvanishingOfFacts:19 assumes FdProps, DjFd, KSplit, SphU, FzHol and concludes Crux0 via contradiction. Its strict m<n gives j=n−m≥1. Step E3 (:222–227) yields a zero integral of hF times the nested detD of fV. Step G (:240–272) invokes dpDual cayley uAct at p=m,q=0, plus wM_mem_unitary, minorOn_inv_of_unitary, scalar_section_mul_conjugate_section (A/ScalarSectionCompactBlockInvariant:159–183). On InK, both Cayley blocks are unitary, so W is unitary; W^{-1}=W† implies minor_s(W^{-1})=conj(minor_s(W)), not reciprocal of minor_s(W). The compact scalar identity f0(m,0,k) fV(m,0,k)=1 cancels the section weights, using ub1=u1† and unit modulus determinants. Thus integrand equals C_nm f(k), where
    C_nm=∏_{i=0}^{n−m−1}(m−n+i) ∏_{i=0}^{m−1}(−n+i)
        =(−1)^{n−m}(n−m)! · (−1)^m n!/(n−m)!
        =(−1)^n n! ≠0.
This elementary simplification of the actual source coefficient is exact, not a new RH theorem. It preserves m=0. Step G divides only by this nonzero coefficient. It gives ∫f=0 after converting the real integral to complex (:273–275), contradicting pos_int. This completes the last local implication E3→G→contradiction; Steps B–F and the five explicit suppliers are not all reconstructed. Note the contrast with RUN19's *different* coefficient p'(0)=(−1)^{m+1}(n−m−1)!m!; they must not be conflated.

The consumer C/Crux:11 invokes eRed (vacuum_nonvanishing_of_facts fdProps djFd kSplit sphU fzHol). A/TwoSided:16 also calls dpDual cayley uAct in lv_of. These are source call sites; no claim that either is an authenticated Main-root value edge. Standard mathematical ingredients here are Haar positivity, determinant compression and Cayley differentiation; specific published provenance not established, no new axiom or placeholder supplied, no transitive sorry audit.

## 4. Provenance and actual checks
Connector read verified 12/12 GitHub blob IDs and 59/59 literal line anchors, zero mismatches. H retains pos_int at A/ScalarSectionCompactBlockInvariant:277 and dpDual at A/DpDual:433, with C/Crux:940,1173,1194,1211 holding the consolidated consumer; old C/VacuumNonvanishingOfFacts path 404. H A/TwoSided:60 retains the call. Relocation only, no semantic equivalence or repinning claimed. Blob manifest:
```
P A/ScalarSectionCompactBlockInvariant b5c95f21c339895f02322e171ee375ca2373f560
P A/SingToDiffAlt ce0e07c6678297a655e2b9e03de36c3a62e69010
P A/SecondCayleyBlockMulConjTransposeEq 7936215a94b090419b82ae697c992322743e743f
P A/DpDual 300d80f3189620659a55babf6a0d2e34752b6e30
P C/VacuumNonvanishingOfFacts 59b9d0e0060f8ea3e9387803aef00f5bae6d5eef
P C/Crux 1971ec2b5015abe0a1137f83eb23e5bdae2d0817
P A/TwoSided eb9419ee5c118769aad7b050ca180f9ca69dd47a
H A/ScalarSectionCompactBlockInvariant 456dbb3bf00d052686cba4cedc95db8b7aff3216
H A/DpDual ab75e764af720e1d46c08ca3a32fbcc3a8d45fae
H C/Crux 7ee5755446d0b5dc5e24987162d591acdc8415f0
H A/SecondCayleyBlockMulConjTransposeEq 362e00dc7c351ff1ae8a693dc2b960d9f0d431f0
H A/TwoSided 809dc4a4f2a7c1e6b386e3c0cde0dc459f0df14e
```
Reproduce source blobs in upstream clone with git rev-parse REV:FULL_PATH. Independently executed below Python exact algebra check in local container (exit 0). These are bounded regressions of determinant compression, the Step G coefficient and real rational subset of unitary minor identity, not the analytic proof or Lean replay.
```python
from itertools import product, permutations
from fractions import Fraction as F
from math import prod, factorial
def det(M):
    n=len(M)
    return sum((-1)**sum(p[i]>p[j] for i in range(n) for j in range(i+1,n))*prod(M[i][p[i]] for i in range(n)) for p in permutations(range(n)))
def minor(M,s): return [[M[i][j] for j in s] for i in s]
def trans(M): return list(map(list,zip(*M)))
compression=0
for vals in product((-1,0,1),repeat=4):
    M=[vals[:2],vals[2:]]
    for j in range(3):
        for s in (range(j),range(j,2)):
            s=list(s)
            for flat in product((-1,0,1),repeat=len(s)**2):
                T=[flat[i*len(s):(i+1)*len(s)] for i in range(len(s))]
                full=[[int(a==b)+sum(M[a][k]*T[i][s.index(b)] for i,k in enumerate(s)) if b in s else int(a==b) for b in range(2)] for a in range(2)]
                reduced=[[int(a==b)+sum(M[s[a]][s[k]]*T[k][b] for k in range(len(s))) for b in range(len(s))] for a in range(len(s))]
                assert det(full)==det(reduced)
                compression+=1
weights=0
for n in range(1,65):
    for m in range(n):
        j=n-m
        c=prod(m-n+i for i in range(j))*prod(-n+i for i in range(m))
        assert c==(-1)**n*factorial(n)!=0
        weights+=1
W=[[F(3,5),F(4,5),0],[-F(4,5),F(3,5),0],[0,0,1]]
unitary=0
for p in permutations(range(3)):
    for signs in product((-1,1),repeat=3):
        U=[[signs[a]*W[p[a]][b] for b in range(3)] for a in range(3)]
        V=trans(U)
        assert all(sum(U[a][k]*V[k][b] for k in range(3))==int(a==b) for a in range(3) for b in range(3))
        for j in range(4):
            a=range(j); b=range(j,3)
            lhs=det(minor(U,a))*det(minor(V,b))*det(minor(V,a))*det(minor(U,b))
            rhs=det(minor(U,a))**2*det(minor(U,b))**2
            assert lhs==rhs and rhs>=0
            unitary+=1
print(f'compression={compression}; coefficient={weights}; rational orthogonal minor products={unitary}')
```
Actual stdout: compression=13770; coefficient=2080; rational orthogonal minor products=192. No failed cases. No additional assumptions imposed on the source theorems. No Lean kernel run, CI validation of this artifact, full proof completion or URT speedup claimed.

## RESUME HERE
Expand C/StepD:46–80 stepC, especially actual djFd supplier (spectral derivative through nested determinant differential) and sphU supplier; then stepD:16–44 holomorphic vanishing on GSet via holZero. Keep topComp, Step E–F, FdProps, KSplit, FzHol, Cayley, UAct, Gaussian base/GI.integP and CR.crLem_of/KSing.lamSing_of outstanding. Request cached authenticated outgoing/incoming role path for pos_int and dpDual relative to vacuum_nonvanishing_of_facts, holLeadB manifest 8996470, and inspect kernel RUN22 TLiftK parent output when available. Do not duplicate raw scans. HANDOFF TO theta, dependencies, kernel, acceleration, integration, editor, audit. Full RH OPEN.
