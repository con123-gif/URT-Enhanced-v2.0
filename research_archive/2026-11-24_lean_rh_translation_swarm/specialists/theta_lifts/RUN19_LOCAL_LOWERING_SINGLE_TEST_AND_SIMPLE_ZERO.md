# Theta RUN19 — local lowering operator represented by one singular test

2026-11-25. RESULT: SOURCE-MATCHED / conditional human reconstruction of the actual LocTau assembler, including its single-test witness and nonzero regularized scalar; source bodies of lt1, lt2, lt3, eRed and the main Crux0 contradiction inspected. Deeper suppliers remain OPEN. Not a Lean replay or authenticated root proof path.

Continuity: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol/continuity excerpts, CI #408 (01:25:36 UTC, physics checks only), RUN18 and recent commit patches/handoffs for all other lanes (editor patch lacked handoff). No duplicate identified. Acceleration RUN19 now reports manifest ID 8996470 for PositivityTheory.Rg.Sw.HSt.holLeadB; membership is not an authenticated root path. Dependency worker is processing 151 targets; no duplicate raw extraction. Blueprint not reopened this run. No physical gate, queue, or workflow modifications.

Pin P=40e56bab026552e089d7afcfeff08d2defb9c005. Upstream H=4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061 (2026-11-25 01:15:19 UTC, merge PR #1739). H LocTau now contains the three lt bodies and assembler call; H Crux contains relocated vacuum_nonvanishing_of_facts (old standalone file 404). H DetSecondCayleyBlockNe contains asmLT. These are positive relocation checks, not cross-revision proof equivalence.

All short filenames below refer to src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/CayleyCosetSums/ at P, unless marked H.

## 1. Native chain and complete statement
LocTau:9 is literally locTau := asmLT lt1 lt2 lt3 crux. MultiplicityOneTestOperatorsAlt:45 defines AsmLT as LoweringDerivativeVacuum → MultiplicityOneTestOperators → SingularTestsKillVacuum → Crux → LocTau. DetSecondCayleyBlockNe:154–209 proves that implication, 215 exports it. HolLeadB uses locTau as reconstructed in RUN18.

For every natural n,m with m<n, every integer e, compact topological group Kg with measurable/Borel structure, Haar measure μ and continuous group homomorphism ι:Kg→M₂(n) whose image equals InK (both directions of membership), and every complex n×n Q, LocTau asks for natural N, continuous weights ρ_l:Kg→C, singular tests ψ_l on real n×n coordinate space, a_l,b_l∈InG and entire D,M_l with D(0)≠0, such that for every complex z and x∈InG
    D(z) rC(lowQ Q)(fz(m,e,z))(x)
       = Σ_{l<N} M_l(z) tOp(μ,ι,ρ_l,ψ_l,a_l,b_l,fz(m,e,z),x).
No normalized Haar probability is required here; no nonzero Q or m>0 required. tOp is the outer Haar integral of ρ_l(k) times the inner integral of fz(x ι(k) a_l nU(herm t) b_l) ψ_l(t). The original IsSingTest predicate is retained, not replaced by compact support alone. Its continuity and compact support projections are used at assembler L159. This is a statement on the whole complex plane, not only on a punctured neighborhood.

Write E_Q(z,x)=fz(m,e,z,x) tr(Om(x) Q), Om=ub2 (ub1)^{-1}. The compact weight ρ_Y(k)=conjugate[fz(m,e,0,ιk) tr(u2(ιk)^{-1} Y u1(ιk))]. The four inputs are precisely:
- LT1: for all n,m,e,z,Q,x∈InG, rC(lowQ Q)fz=z E_Q.
- LT2: for every n,m,e, same Kg,μ,ι,image hypotheses, continuous compactly supported ψ, a,b∈InG, there exists entire c with tOp(ρ_Y,ψ,a,b,fz)(x)=E_{c(z)Y†}(z,x) for all Y,z,x∈InG.
- LT3: under m<n and same group hypotheses, every continuous ρ, singular ψ, a,b,x∈InG gives tOp(ρ,ψ,a,b,fz at z=0)(x)=0.
- Crux: under m<n and same group hypotheses there exist P, singular ψ, a,b,x₀∈InG with derivative at zero of tOp(ρ_P,ψ,a,b,fz)(x₀) nonzero.
All four are native proof inputs with actual suppliers identified below; the proof does not assume nonzero c(0).

## 2. One test suffices: actual asmLT witness
Choose the Crux witnesses P,ψ,a,b,x₀, then LT2 supplies c for this fixed ψ,a,b, valid for every Y. LT3 at Y=I and x=I gives c(0) E_I(0,I)=0. Since fz(z,I)=1 and Om(I)=-I (L141–148), E_I(0,I)=-n. The strict inequality m<n implies n>0; hence c(0)=0.

At the Crux witness x₀, set β=det u1(x₀) det ub1(x₀), K₀=det(x₀)^e det(u1(x₀))^{-m} tr(Om(x₀)P†). LT2 gives T_P(z)=c(z) K₀ β^{-z}. If c'(0)=0 then the derivative of T_P at zero vanishes by product differentiation. The source also retains a β=0 branch: c(0)=0 and 0^(-z)=0 for z≠0 make the product identically zero using Lean complex-power convention. This contradicts Crux in either case. Alternatively LT1's independent slit-plane lemma proves β≠0 on InG, but the original branch is retained in the record.

Define the entire divided difference
    D(z) = (c(z)-c(0))/z for z≠0, D(0)=c'(0).
Holomorphicity at zero is the removable divided-difference lemma Complex.differentiableOn_dslope. Thus D(0)≠0 and z D(z)=c(z) for every z. This D is a scalar divided difference, not a matrix determinant; its nonzero value is proved through Crux. The actual finite witness has N=1, ρ_0=ρ_{Q†}, ψ_0=ψ, a_0=a, b_0=b, M_0(z)=1. LT2 and E-linearity yield
    tOp(ρ_{Q†},ψ,a,b,fz)(x)=E_{c(z)Q}(z,x)=c(z) E_Q(z,x)
       =D(z) rC(lowQ Q)fz(x).
This remains valid for z=0 and Q=0. No division by c(z), E_Q, K₀ or any possibly vanishing Fourier coefficient. The only quotient by z is extended analytically. Weight continuity uses detSecondCayleyBlockNe and continuous_rhoP (L83–135): if nonreal t and a row vector annihilates t C+D (lower blocks of x), group relations CD†=DC† and CB†−DA†=−I imply (t−conj t)||vC||²=0, hence vC=vD=0, then v=0. Both u1 and u2 are invertible. Compact weights are continuous from inverse, determinant, integer powers and trace.

## 3. Actual lt1, lt2, lt3 suppliers
LoweringDerivativeVacuum:68–114, 121: rC is the complex derivative on the indicated group direction (rC_eq). On x+s x Nq(Q), det x and first Cayley block u1 are unchanged, while ub1 becomes ub1−s Q ub2. Factor the latter using its invertible value at zero. The derivative at zero of det(I+s A) is tr A. Therefore the logarithmic derivative of det(u1)det(ub1) along this curve is −tr(Om Q). Raising to power −z gives +z tr(Om Q); multiplied by fz gives LT1. The complex power derivative is valid because det u1 det ub1=|det u1|²>0 (L20–42), so the base lies in the slit plane. This is not a formal differentiation across a branch cut.

LamTrace:24–37 shows that conjugation invariance of the conjugate-linear matrix functional abelian₂ forces it to be proportional to conjugate trace (inv_trace applied to its complex-linear conjugate); coefficient is abelian₂(z,I)/n. Lam_diff:39–106 proves entire dependence by continuity on the compact group times a closed spectral ball, Cauchy derivative bounds on a smaller ball, and dominated differentiation of the Haar integral. LT2:110–136 chooses c(z)=−abelian₂(z,I)/n. Iwasawa x=pk plus the compact block laws convert the conjugate trace to tr(u2(k)† u1(k) Y†); the sign is from Om on the compact group. LT2 in isolation has no m<n hypothesis; the theorem's division is Lean field division (zero-dimensional case not needed by assembler). Imported Lam_inv, inv_trace, tOp_formula, fz_up, Om_up, Iwasawa and differentiation suppliers remain traceable obligations, not proved solely by this summary.

SingularTestsKillVacuum:11–23 uses closure of InG under products and L3.vanish_all(hmn,e,...,ψ,hψ) for the inner integral at each compact k; the outer integral is identically zero. L3.vanish_all, reached through EventuallyUnit, is a separate next supplier; no claim that singular test alone annihilates arbitrary sections.

## 4. Crux nonvanishing: actual contradiction route and exact integer coefficient
Crux:11 = eRed (vacuum_nonvanishing_of_facts fdProps djFd kSplit sphU fzHol). FdProps:18–39,44–60 gives Crux0 at e=0 and the actual named five input types (smooth Fd and spectral integral derivative interchange; double determinant derivative DjFd; compact matrix-entry KSplit; two-direction compact averaging differentiation SphU; joint analyticity FzHol in open DomZ containing GSet). FdInv at L41–42 is a True-valued definition; it is NOT a premise of this proof and not evidence for a new theorem. No transitive placeholder-free claim.

VacuumNonvanishingOfFacts:19–275 assumes negation of Crux0, lets j=n−m≥1, and defines Φ_Y(x)=∫_K Fd(m,ι(k)x)ρ_Y(k)dμ, Fd=∂_z fz|₀. StepA (L44) converts absence of singular tests into determinant-differential vanishing via CrxMa.stepA_Z. StepB (L47) uses topComp and Fd_kpart to obtain vanishing of the two complementary-block determinant derivatives of Φ. DjFd expresses those derivatives using
    p(z)=Π_{i=0}^{j−1}(i−z) Π_{i=0}^{m−1}(i−m−z).
The first product contains precisely one zero factor at zero; all others are nonzero. In closed form
    p'(0)=(-1)^{m+1}(j−1)! m! ≠0.
This is exactly the source's deriv_prod_range_sub_mul_prod_ne_zero (L27–55), with factorial shorthand, including m=0 and j=1 empty products. Strict m<n is indispensable to this simple-zero argument (at m=n the first product is empty and p(0)≠0). This polynomial is NOT itself the scalar D from section 2; it enables the Crux proof that D(0)≠0.

StepC (L59) cancels p'(0) using Cx3.stepC to conclude the weighted hF integral vanishes for every Y and group g. StepD (L62) extends vanishing to all iterated derivatives through Cx3.stepD. StepE (L66–133) transfers one selected direction WD(0,E_ab) by rit_transpose to fV, whose derivative gives (m−n) fV times the corresponding entry of u1^{-1}u2. KSplit expresses the entry weight as a finite sum of right-translated ρ_I; right Haar invariance reduces each summand to StepD at translated group g. Symmetry of iterated derivatives allows the selected direction to occur at any position. StepF (L150) expands the two determinant derivatives as permutation sums of these vanishing integrals, using the pairwise zero-products of complementary directions and integrability from compactness. The selected direction exists since j≥1. transpose_detD then transfers both determinant derivatives to fV (with nonzero sign). The dual Cayley formula dpDual yields a nonzero product coefficient times the integral of |minor_A(wM)|² |minor_B(wM)|². All coefficient factors m−n+i for i<j and −n+i for i<n−j=m are nonzero. StepG (L240) thus forces this nonnegative integral to be zero, contrary to pos_int (L273), giving Crux0. The local topComp/stepA, stepC, stepD, integration-by-parts transpose, dpDual and pos_int proofs still need expansion; this is a source-matched proof skeleton of their actual consumer, not a proof of all those suppliers.

DetUnitOfInK:54–69 then extends e=0 to arbitrary integer e: det nU=1, compact det has modulus one, so the twisted weight cancels the compact determinant factor. T_e(z)=[det(x)^e det(a)^e det(b)^e] T_0(z); the constant is nonzero since all three group matrices are invertible. Its multiplication preserves nonzero derivative. No new signature, genericity, or m>0 restrictions.

## 5. Evidence and reproducibility
Executed in connector JS: 15/15 blob identifiers matched (12 P, 3 H), 70/70 literal source anchors located; 2080/2080 exact BigInt cases 1≤n≤64, 0≤m<n verified p(0)=0 and p'(0)=(-1)^(m+1)(n−m−1)!m! nonzero by independent coefficient propagation. This tests the exact native determinant polynomial, not the whole analytic proof. The following standalone Python reproduces the integer test and blob/representative-line checks against an upstream clone (not run in Python here); no network is needed once revisions exist.
```python
import subprocess, math
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061"
base="src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/CayleyCosetSums/"
rows=[
(P,"LocTau","bd198ef5120fc6f5b2381c5b18b9cf62c7bed54f",9,"asmLT lt1 lt2 lt3 crux"),
(P,"LocTauAlt","c68017f4832d14fb672e9e27fdd3a9eab3e7436a",39,"D 0 ≠ 0"),
(P,"MultiplicityOneTestOperatorsAlt","20397fb5abbb0c9c8cb7bae6bd5a7a5a8c4c72f7",45,"def AsmLT"),
(P,"DetSecondCayleyBlockNe","37ae5c4a02ff337f0f68e7a3ce172d5b374174bc",195,"dslope c 0"),
(P,"LoweringDerivativeVacuum","a4daefcdd496f743e5d3266434176b56b80f7f85",68,"theorem lt1"),
(P,"LamTrace","f671dd29a2dbef15376ee0a8cdd87f9f3dd80d7b",110,"theorem lt2"),
(P,"SingularTestsKillVacuum","b06d4dc436e74ee31390b189c3c965312fb51593",21,"L3.vanish_all hmn"),
(P,"Crux","1971ec2b5015abe0a1137f83eb23e5bdae2d0817",11,"eRed (vacuum_nonvanishing_of_facts"),
(P,"FdProps","1bbff855867c08b480b03ff6e62cfcaac88f0479",18,"def Crux0"),
(P,"VacuumNonvanishingOfFacts","59b9d0e0060f8ea3e9387803aef00f5bae6d5eef",273,"have hpos := pos_int"),
(P,"DerivProdRangeSubMulProdNeZero","3fab00059591d277cf201d5bf93e2cd2c325339b",27,"theorem deriv_prod_range_sub_mul_prod_ne_zero"),
(P,"DetUnitOfInK","bd939660b790ee69923375029f57562338b8642e",54,"theorem eRed"),
(H,"DetSecondCayleyBlockNe","1e8b57fa553466975850a43111de7273c6d33102",114,"theorem asmLT"),
(H,"LocTau","918a2e1a9b30cf9c2f00b7a2d3deb09e7f11e860",1172,"asmLT lt1 lt2 lt3 crux"),
(H,"Crux","7ee5755446d0b5dc5e24987162d591acdc8415f0",940,"theorem vacuum_nonvanishing_of_facts")]
for rev,name,sha,line,needle in rows:
    raw=subprocess.check_output(["git","show",rev+":"+base+name+".lean"])
    actual=subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()
    assert actual==sha,(name,actual,sha)
    assert needle in raw.decode().splitlines()[line-1],(name,line)
count=0
for n in range(1,65):
    for m in range(n):
        c,d=1,0
        for a in list(range(n-m))+list(range(-m,0)):
            c,d=c*a,d*a-c
        assert c==0 and d==(-1)**(m+1)*math.factorial(n-m-1)*math.factorial(m)!=0
        count+=1
print(len(rows),"blobs and representative anchors;",count,"exact polynomial cases")
```
Conventional ingredients: determinant differentiation, compact Haar invariance, multiplicity-one trace argument, analytic removable divided difference, positivity. No new published result attribution established for the local Crux nonvanishing. No additional assumptions imposed on the native assembly. No kernel validation, full RH proof translation or URT acceleration claim. Root linkage remains subject to role-labelled witness extraction.

## RESUME HERE
Expand L3.vanish_all through EventuallyUnit and its exact rank/Fourier support proof (LT3 supplies c(0)=0); then CrxMa.stepA_Z and pos_int in the Crux0 chain, retaining all five named inputs. Request authenticated role-labelled paths to PositivityTheory.Rg.Sw.HSt.locTau, asmLT, lt1, lt2, lt3, crux, vacuum_nonvanishing_of_facts and holLeadB (manifest ID 8996470). H relocation confirmed for Crux, LocTau, asmLT; do not repin the baseline. CR.crLem_of and KSing.lamSing_of remain in queue. HANDOFF TO theta, dependencies, kernel, integration, audit, editor, literature. Project OPEN.
