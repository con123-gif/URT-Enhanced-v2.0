# Simultaneous scaled primary SFew supplier — 26 Nov 2026
Status: human proof of a local implication from existing native suppliers; native Lean replay pending. RH OPEN. Pin 40e56bab026552e089d7afcfeff08d2defb9c005.

This integrates structure RUN40 (24d47ed6), RUN41 (7f95819c) and prime/audit exact interpolation (03d8a69f,d217e9e2) for the character RUN47 JointLate47 Few premise (17b56ded). The scaled free-rank factor and quotient Bockstein argument were already identified by those workers; the specific addition here is the simultaneous a-torsion bound for BOTH stable homology factors and the complete human supplier of the scaled Few premise with exact b. No novelty claim across all literature.

## Finite image bound
Let a be a positive integer, Y,B abelian groups, T finite abelian, beta:Y->T, g:Y->B, a*g=0. Suppose g(ker beta) is contained in f(J), where J is a subgroup of an abelian H with finite torsion T', rank J<=R, and f:J->B is a homomorphism killed by a (on J, not necessarily on H or B).

For any finite subset F of f(J), choose finitely many preimages and let J0 be the subgroup they generate. By the structure theorem J0=Z^s⊕U, s<=R, U finite and U embeds into T'. Since a*f(J0)=0, f factors through J0/aJ0. Thus
 |F| <= a^s |U/aU| = a^s |U[a]| <= a^R |T'[a]|.
This applies to every finite subset, so f(J), and hence g(ker beta), are finite with the same bound. No assumption of finite generation of J or H needed. Using the quotient of actual image I=beta(Y), define I/aI. If beta(y) in aI, choose z in Y with beta(y)=a beta(z). Then y-a z lies in ker beta and g(y-a z)=g(y). So g(Y)/g(ker beta) is a homomorphic image of I/aI and
 |g(Y)| <= a^R |T'[a]| |I/aI| <= a^R |T'[a]| |T[a]|.
The last inequality uses |I/aI|=|I[a]| and inclusion in T[a], not an asserted canonical isomorphism. No ambient T/aT substitution. This proof adds no group-theoretic premise to the existing native count.

## Actual SUpper consumer
Use exact source names in SUpperOf.lean. Put q=l^nu, a=l^max(nu-k,0), R=nrComplexPlaces L. All native guards retained. Stabilize the finite set of cycle witnesses at n>=2(k+1)+4 exactly as native proof. Set Y=ker bd mod q, g(y)=l^k Phi_n(y), beta the actual Bock map. Thus a*g=0. Descend gives phi, ZVal gives ONE u such that phi_lev(u*zSeq(x))=l^k phi_n(x) for every x. Let H=grpH(GL_lev(O_L),k+1) and J=span of zSeq(x). BOdd gives rank J<=R. Set f=phi_lev∘(u·) restricted to J. On every generator a*f=0 by ZVal, hence on J. If y in ker beta, the exact native Bock and Descend supply z,x with g(y)=l^k phi_n(x)=f(zSeq(x)). Thus the finite image lemma applies. For rigor it is enough to bound g(ker beta) by f(J) in this fixed n; no need to assert g(Y) covers every stable cycle at all n.

The proof of torsStab actually constructs an additive equivalence of the stable homology groups (not just the reported equality of their cardinalities); it preserves the a-torsion subgroups. Put N=2(k+1)+4, T_j=tors grpH(GL_N(O_L),j). Therefore, with the original SUpper hypotheses,
 |S| <= a^R |T_{k+1}[a]| |T_k[a]|.
If nu<=k then a=1 and the bound is exactly 1, consistent with g=0. If nu>k, both torsion factors count only bounded l-primary torsion. The original full tc factors remain a valid upper bound. This proves the human scaled primary SUpper from the original SChain, BOdd and the named native TorsStab/Descend/ZVal/Bock suppliers; their transitive proof provenance is retained, not independently established here.

## Actual SFew injection with exact modular divisor
In SFewOfCut.sFewOf the index is k=2e+2=2E, E=e+1. The injection f:S -> (I -> ZMod l^nu) uses precisely l^k times the primitive family. The actual SClass coefficient pe is the product over 0<=j<=2E, j!=E, of u^E-u^j, u=1+l^c. Pair j=E±d:
 pe=(-1)^E u^(E(E-1)/2+E^2) product_{d=1}^E (u^d-1)^2.
The retained guard 2E+1<l^c implies v_l(d)<c. Binomial expansion gives u^d-1=l^c(d+l^c t); writing d=l^v m with l∤m shows v_l(u^d-1)=c+v exactly. Hence pe=l^V times an l-unit, V=2Ec+2v_l(E!). In ZMod(l^nu) that unit is invertible, so pe divides l^V for ALL nu. In the actual sFewOf proof replace the exponent of the two norms after the scaled equality by b=k+V=2E(1+c)+2v_l(E!). The existing hD detection step and hinj use the SAME new b; no change to other witnesses or local conditions. The scaled primitive family count then gives, for every actual Lay satisfying the original guards,
 Few(gamma,u^E,l^b,l^nu, l^(max(nu-2E,0)*R) * |T_{2E+1}[l^max(nu-2E,0)]| * |T_{2E}[l^max(nu-2E,0)]|).
Here N=4E+6. In particular on every late canonical layer the fixed P=|T_{2E+1}[l^infty]|*|T_{2E}[l^infty]| bounds the two factors. This supplies the Few component of JointLate47 at the human-mathematical level using actual native hypotheses, without a new separate scaled-count assumption. P is finite by native TorsStab; no stronger uniform discriminant/weight bound on P is claimed. No change to same-layer quantifiers.

Combine with the existing RUN48 twisted W bound only after authenticating its local Kummer/Herbrand proof and native caller. On compatible late layers it would give the RUN47 signed Sha budget with this P and exact b. A stronger bound on P or h, or a different argument for the remaining actual native suppliers, is required for RH-scale closure. Do not call the above a solved Riemann inequality. The first two main ingredients were previously prepared separately; this is an explicit integration proof plus tighter primary counting, not a major breakthrough.

Source paths under src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ClassCounting:
SUpperOf.lean (8cccf88aa58f6e2bd69f080e46f4f10b4248d559), LemmaKOfSteps.lean (6202fdeed68f7ca2c64e2f14ddfd416331bf1c10), TorsionRankCounts/RankCount.lean, RankCountAlt.lean, PhiZSeq.lean, BockAbs.lean, FibCount.lean, TorsStab.lean (75aec7ac2e31d217179077cc1febeb2f7c612d42), inspected pinned bodies. SFewOfCut.lean (1c294cd3b56d004fc313c2e2febb40cf637e0b52) under src/Development/EtaleCohomology/CyclotomicDiscriminants. No native compilation, root obligations retired zero, no timing/URT claim. Original fallback retained.
RESUME HERE: implement combined primary rank and actual image quotient via RUN40/41 at SUpper, plug exact unit divisor into sFewOf, verify the actual Few premise bridge to JointLate47 and native cofinal W supply. Then audit uniform STors and class-group bounds, not more scalar variations.
