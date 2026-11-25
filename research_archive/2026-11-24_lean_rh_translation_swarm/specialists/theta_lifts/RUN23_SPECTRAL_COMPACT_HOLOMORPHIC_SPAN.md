# RUN23 — Spectral differentiation, compact averaging, and complex tangent spanning (Steps C–D)
2026-11-25. RESULT: DONE local SOURCE-MATCHED human reconstruction of Cx3.stepC, Cx3.stepD, djFd, sphU, holZero; deeper analytic and determinant suppliers and root role linkage remain OPEN. Upstream leanprover-community/riemann-hypothesis P=40e56bab026552e089d7afcfeff08d2defb9c005; observed main H=a18a350c3e5aad997766cff2670b292313e46574 (PR #2164, batch 14). No repin.
Preflight: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol/continuity excerpts, CI #420 (05:18:22 UTC, run 45549913981, general checks only), prior theta RUN22 da1c24bf, latest branch 93f6005c and 30 recent RH commits, 13 peer patches/handoffs including kernel 9c36efc5, dependencies bd222c67, acceleration 7df9865e, Landau db8c71c8. No competing Step C/D task observed. Blueprint not reopened, some peer notes inspected via commit patches only. No physics queue changes. Kernel RUN23 addresses different TLiftK guard scope; neither that nor this local work authenticates a Main-root edge to these theorems. All edges below are named source-level references.

Paths relative to src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/. C=CayleyCosetSums/, A=AnalyticDeterminants/. Unless H explicitly specified, use P.

## 1. Step C exact statement and assembly
C/StepD:46–80, PositivityTheory.Rg.Sw.HSt.Cx3.stepC. Fix n,m,j natural, 1<=j<=n, and define
    a(z)=prod_{i=0}^{j-1}(i-z) prod_{i=0}^{n-j-1}(i-m-z).
Assume a'(0)!=0, hFd:FdProps, hDj:DjFd, hSph:SphU, hFz:FzHol. Kg is a compact topological space with measurable and Borel structures, mu a finite measure finite on compact sets; iota:Kg->M2(n) continuous with every iota(k) in G; rho:Kg->C continuous. No group structure, Haar property or normalization on Kg is required for this theorem. Let A_j={indices<j}, B_j=complement, and D_Q,D_R denote the nested determinant derivatives on matrices supported in these blocks. Order: outer T in A (upper Cayley block Q), inner S in B (lower block R), not the reversed order of Step G. Assume for EVERY g in G:
    D_T D_S int_K Fd(m,iota(k) g mX(I,emb_A(T),emb_B(S),I)) rho(k) dmu = 0.
Then for every g in G, int_K hF(j,m,0,iota(k)g) rho(k) dmu=0.
Proof: FzHol gives an open DomZ containing G; every iota(k)g belongs to it. FdProps field 1 gives complex smoothness (its field 2 is unused here but retained). The identity mul_mX with LQ/LR gives an affine perturbation in T,S. Both LQ and LR commute with left multiplication in the exact sense LA(Mx)T=M LA(x)T, etc. SphU therefore moves the nested differential into the integral; DjFd evaluates the result at iota(k)g as a'(0) hF(j,m,0,iota(k)g). Extract the constant a'(0), divide only by its assumed nonzero value. C/VacuumNonvanishingOfFacts:47–64 supplies the Step B premise by topComp (not reconstructed here) and chooses j=n-m, m<n; obtains a'(0)!=0 from deriv_prod_range_sub_mul_prod_ne_zero, then calls stepC and stepD with rho=rhoP(iota,m,0,Y) for all Y.

Useful exact compression of the coefficient for arbitrary natural m and 1<=j<=n: a(0)=0. If m<n-j the second product has an additional root at zero (index m), so a'(0)=0. Otherwise
    a'(0)=(-1)^(n-j+1) (j-1)! prod_{i=0}^{n-j-1}(m-i) !=0.
This is a direct product-rule derivation, and empty products are 1. In the consumer j=n-m this is (-1)^(m+1)(n-m-1)!m!, agreeing with RUN19. The nonzero hypothesis of stepC cannot be removed for arbitrary j (e.g. n=2,m=0,j=1 yields z^2). This is elementary algebra, not a new RH result.

## 2. Native djFd supplier: why the spectral derivative survives
C/FdProps:16,34–39; C/FzSliceContDiffOn:17–129. Fd(m,x)=partial_z fz(m,0,z,x)|z=0; DjFd quantifies all n,m,j natural, 1<=j<=n and x in DomZ, with NO m<n requirement. Let U(z,x)=fz(m,0,z,x), complex smooth on C x DomZ via the actual fzHol theorem, and let mathcal D be the nested determinant derivative with Q on A and R on B. Expand mathcal D as finite signed sums of mixed spatial derivatives (detD_detD_comp, lines 46–62). The actual iFD_deriv_comm (C/DerivEqFderivPair:78–107) states for complete complex normed V, open D, jointly complex smooth U on C x D, w0 in D, every k and every tuple v in V:
    D_w^k(partial_z U(0,w))(w0)[v] = partial_z (D_w^k U(z,w0)[v])|0.
Proof uses the product-space embedding directions (1,0), (0,v_i), restriction to open sets, and induction moving the fixed direction through the derivatives via symmetry of second Frechet derivatives (private theorem :45–76); all finite orders available. Thus mathcal D Fd = partial_z mathcal D fz|0; finite sums pass through the derivative by differentiability proved at :66–98. Actual djZ (C/AbsArgLtPi:143–191) gives
    mathcal D fz = a(z) fz(m,0,z,x) minor_A(W(x)) minor_B(W(x)^(-1)).
Here W=wM(x); the latter minor is of the INVERSE MATRIX, not inverse of a scalar minor. DomZ (C/CruxSt:16) requires x in Dom and det(u1 x)det(ub1 x) in the principal slit plane. In djZ the local branch guard is essential: positive delta=(pi-|arg(det(u1)det(ub1))|)/2, restrict T,S to neighborhoods where each determinant is nonzero and each argument absolute value <delta; eventual equality suffices for detD_congr. It then uses fz_mX and detD_det_one_add_mul_rpow_eq. Their full suppliers are not discharged in this run. With j>=1, a(0)=0; the second term of the product rule disappears; fz(0) gives f0. Therefore mathcal D Fd=a'(0) hF. No division by a'(0) in DjFd itself. The proof uses actual fzHol, iFD_deriv_comm, djZ; no added regularity or global complex-power multiplicativity.

## 3. Native sphU supplier: compact differentiation under the integral
C/FdProps:49–60 gives exact SphU quantifiers: any n, open U in M2(n), F complex smooth on U, compact topological Kg with measurable/Borel structure, finite measure finite on compacts, continuous iota and scalar weight c, finite decidable index types for LA and LB, complex continuous linear maps in the T/S arguments, left covariance for ALL M,x,T,S, and g with iota(k)g in U for all k. The desired equality is the two determinant derivatives of the averaged F equal to the average of the derivatives with LA,LB evaluated at iota(k)g.
C/SphU:189–224 proves this. Its actual helper :140–181 uses continuous L_k=left multiplication by iota(k). Domain Omega={y: for all k, L_k y in U} is open by compactness of Kg and joint continuity; importantly it is not assumed that arbitrary infinite intersections of open sets are open. For each order N the translated derivative is c(k) D^N F(L_k y) composed with L_k in each slot (:121–138). This gives joint continuity in k,y. The helper :34–119, despite its opaque name matrix_mul_comm_of_mul_eq_smul_one_of_ne_zero, proves differentiation of an integral to every order: choose closed ball contained in Omega, compact in the finite-dimensional complex matrix space; joint continuity of D^{N+1} gives a uniform norm bound on Kg x ball, integrable since mu finite. The theorem hasFDerivAt_integral_of_dominated_of_fderiv_le supplies each induction step (:63–90). Currying isometric linear equivalences commute with integration, base case N=0 and induction (:91–119). Integrability of derivative maps follows from compactness and continuity with finite-dimensional codomain. Expand nested determinant operators as signed finite sums; evaluate continuous multilinear maps inside the integral and pass each finite sum and constant through (:197–224). This proves SphU, rather than merely assuming it. The Mathlib dominated differentiation theorem, detD_detD_comp and affine derivative lemmas remain imported obligations, not independently replayed.

## 4. Step D and actual holZero supplier: complex tangent span, not real-open identity theorem
C/StepD:16–44, Cx3.stepD: for j natural (no rank condition), p,q integers, compact topological Kg with measurable/Borel structure, finite measure finite on compacts, continuous iota with image in G and continuous rho, assume H(g)=int hF(j,p,q,iota(k)g)rho(k)dmu=0 for every g in G. For every N natural, every W:Fin N->M2(n), and every g in G,
    int_K D^N hF(j,p,q,iota(k)g)[iota(k)g W_i] rho(k)dmu=0.
Define Omega={x: every iota(k)x in Dom}. It is open by isOpen_domK; G subset Omega, since G closed under multiplication and contained in Dom. holInt and complex smoothness of hF imply H smooth and identify its derivatives with averaged derivatives; holZero gives D^N H(g)=0. Evaluate on g W_i and apply left-multiplication chain rule, with rho constant in x. N=0 retained.

Actual holZero in A/FderivEqZeroOfVanish:32–133, uses complete complex normed target V and H complex smooth on open Omega containing G, H|G=0. It does NOT treat the real group as an open complex domain. Write U_b=[0,b;0,0], L_c=[0,0;c,0] with b,c Hermitian. Real lines g(I+tU_b),g(I+tL_c) stay in G. Thus dH_g(gU_b)=dH_g(gL_c)=0. The curve exp(it)g stays in G, giving dH_g(ig)=0, hence dH_g(g)=0 by complex linearity. Differentiating the two first-derivative identities along the other real line gives
    d²H_g(gU_b,gL_c)+dH_g(gU_b L_c)=0,
    d²H_g(gL_c,gU_b)+dH_g(gL_c U_b)=0.
Symmetry of the second derivative cancels it, leaving dH_g(g[L_c,U_b])=0; bracket=[-bc,0;0,cb]. This is the source :61–90 argument, not an assumed Lie algebra theorem.

Actual span_top (A/Imports:17 onward) proves these directions span all M_(2n)(C). First B=(B+B*)/2 + i(B-B*)/(2i) decomposes arbitrary B into two Hermitian pieces. Complex linearity in upper/lower blocks and bilinearity of the bracket extend annihilation to arbitrary B,C. In matrix units E_ab, take B=E_ab,C=E_bb for a!=b to get (-E_ab,0) in the diagonal blocks; reverse order to get (0,E_ab). B=E_ak,C=E_ka yields (-E_aa,E_kk). These differences span the trace-zero diagonal subspace (2n-1 independent differences suffice for n>0); adding identity, trace 2n!=0, spans the remaining direction. All four blocks now span M2(n). For n=0 there is only the zero matrix, so no division by n is needed. Since g invertible, left multiplication is surjective and dH_g=0. Induct with H replaced by dH (complete continuous-linear-map target, smooth on Omega) and curry the derivative, yielding D^N H(g)=0 for every N, including N=0. No global connectedness claim. Actual holInt in the same file :135–190 invokes HolA.hasFDerivAt_int to differentiate successive averaged derivatives; currying and bounded linear evaluation commute with Bochner integration. This is a second native compact-differentiation supplier, not a new axiom and not identical to sphU's private helper. Its imported HolA details remain open.

## 5. Provenance and execution
Pinned connector blob receipts (all fetched and inspected, not a kernel replay; reproduce by git rev-parse P:FULL_PATH):
```
C/StepD d0afbe992416d266e0053e69dc5911e4092bebd7
C/VacuumNonvanishingOfFacts 59b9d0e0060f8ea3e9387803aef00f5bae6d5eef
C/Crux 1971ec2b5015abe0a1137f83eb23e5bdae2d0817
C/FdProps 1bbff855867c08b480b03ff6e62cfcaac88f0479
C/FzSliceContDiffOn 552d7ad02dc2c1c7871f48d881c40822ae2c49d0
C/SphU ac8846f2047da4fd46635a2ebfbf3951473ac5ea
C/CruxSt 73b4302b0eb23bd4e524572c8b09adfcc6903279
C/DerivEqFderivPair afe4779fafbcf06894e2b3dd38d33a702bcaa9ac
C/AbsArgLtPi 9918621d5c88cbc9aac7b194b416d074128701c3
A/FderivEqZeroOfVanish 77f653d6f3f4dc06b019d978eb88f4f5630bb09d
A/Imports ad29a4bd5705613a88dadaf4f02244b8546647c8
A/TwoSided eb9419ee5c118769aad7b050ca180f9ca69dd47a
```
Latest H source check: C/StepD and C/SphU old paths 404; C/Crux blob 7ee5755446d0b5dc5e24987162d591acdc8415f0 contains sphU:597, stepD:850, stepC:880, consumer:940 and crux:1211; C/FzSliceContDiffOn blob 25fb44f1f45cbdfb8119c33bc4613b54b3bfe066 contains djFd:728; A/FderivEqZeroOfVanish blob 57ea7b794912b45901fb735759d2d61b52fcb697 contains fderiv_eq_zero_of_vanish:344, holZero:443, holInt:500. Compared declaration presence/relocation only, no assertion of semantic equivalence. Standard ingredients here are complex differentiation, Haar/Bochner integration machinery, and matrix commutators. No specific external publication attribution established. FdInv in FdProps:41–42 is a trivial True predicate, not used as a proof of an invariance fact by stepC/D. No transitive placeholder/axiom audit.

Executed local CPython below, exit 0, twice (second run cleaned an unused initialization). Tests are bounded exact integer polynomial recurrence and modular rank certificate for the integer subfamily of matrix-unit generators obtained AFTER Hermitian decomposition. Modular full rank gives rational/complex full rank because the corresponding integer minor is nonzero modulo 1009; trace gives matching upper bound for the traceless family. Not a regression of arbitrary complex analytic functions or a Lean replay.
```python
from math import prod, factorial
P=1009
def rank(rows,d):
    piv={}
    for row in rows:
        v=list(row)
        for i in range(d):
            a=v[i]%P
            if not a: continue
            if i in piv:
                w=piv[i]
                for j in range(i,d): v[j]=(v[j]-a*w[j])%P
            else:
                a=pow(a,-1,P)
                piv[i]=[(a*t)%P for t in v]
                break
    return len(piv)
def unit(n,a,b):
    d=2*n
    v=[0]*(d*d); v[a*d+b]=1
    return v
def br(n,a,b,c,d):
    N=2*n
    v=[0]*(N*N)
    if b==c: v[a*N+d]-=1
    if d==a: v[(n+c)*N+n+b]+=1
    return v
span=[]; generators=0
for n in range(1,9):
    N=2*n; d=N*N
    rows=[unit(n,a,n+b) for a in range(n) for b in range(n)]
    rows += [unit(n,n+a,b) for a in range(n) for b in range(n)]
    rows += [br(n,a,b,b,b) for a in range(n) for b in range(n) if a!=b]
    rows += [br(n,b,b,a,b) for a in range(n) for b in range(n) if a!=b]
    rows += [br(n,a,0,0,a) for a in range(n)]
    rows += [br(n,0,b,b,0) for b in range(1,n)]
    I=[int(a==b) for a in range(N) for b in range(N)]
    assert len(rows)==d-1 and all(sum(v[i*N+i] for i in range(N))==0 for v in rows)
    assert rank(rows,d)==d-1 and rank(rows+[I],d)==d
    generators+=len(rows)+1;span.append((n,d-1,d))
count=zero=nonzero=0
for n in range(1,65):
    for m in range(n+3):
        for j in range(1,n+1):
            a,b=1,0
            for t in list(range(j))+[i-m for i in range(n-j)]:
                a,b=a*t,b*t-a
            assert a==0
            if m>=n-j:
                expected=(-1)**(n-j+1)*factorial(j-1)*prod(m-i for i in range(n-j))
                assert b==expected!=0; nonzero+=1
            else:
                assert b==0; zero+=1
            count+=1
print('span ranks (n, trace-zero, full):',span)
print('matrix generators:',generators)
print('spectral product cases:',count,'nonzero:',nonzero,'zero:',zero)
```
Actual stdout:
```
span ranks (n, trace-zero, full): [(1, 3, 4), (2, 15, 16), (3, 35, 36), (4, 63, 64), (5, 99, 100), (6, 143, 144), (7, 195, 196), (8, 255, 256)]
matrix generators: 816
spectral product cases: 95680 nonzero: 52000 zero: 43680
```
No new assumptions added; explicit zero branch guards retained. CI for this new artifact not run; no Lean kernel validation, proof completion or URT speedup claimed. Full RH OPEN.

## RESUME HERE
Reconstruct actual Step E and its KSplit supplier (C/Crux import KsTraceSingle, C/VacuumNonvanishingOfFacts:66–130): exact finite compact right-translate decomposition of fV times the inverse Cayley matrix entry, then rit_transpose and its invariant measure supplier. Retain topComp Step B, Step F, FdProps, FzHol, Cayley/UAct, djZ's fz_mX and complex Capelli identity, Gaussian base/GI.integP, CR.crLem_of and KSing.lamSing_of. Ask dependency/kernel/acceleration for authenticated cached role-labelled Main path to crux, holLeadB 8996470, and stepC/D, not a duplicate raw archive scan. Coordinate with Landau RUN23 on its higher-level root path; do not double-count unrelated local results. HANDOFF TO theta, dependencies, kernel, acceleration, integration, editor, audit. Full RH OPEN.
