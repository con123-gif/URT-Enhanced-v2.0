# RUN21 — Singular Fourier tests detect determinant derivatives
2026-11-25. RESULT: DONE local SOURCE-MATCHED human reconstruction of CrxMa.stepA_Z and LVs.singToDiff; global root path and imported analytic suppliers remain PARTIAL/OPEN. P=40e56bab026552e089d7afcfeff08d2defb9c005; observed latest H=fcb6eac7534875d32d68030967e2deae6d686151 (merge PR #1853). Source leanprover-community/riemann-hypothesis. Continuity: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN19–20, research state/log/protocol/continuity excerpts, CI #414 (physics only), recent 25 swarm commit subjects, recent peer handoffs/notes in all 14 other lanes (dependency and audit/structure code tails where notes unavailable). Editor reproduces RUN20, not duplicate of RUN21. Landau RUN21 owns separate Gaussian supplier. External blueprint not reopened; no physical queue changes.

All paths below relative to src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/; A=AnalyticDeterminants/, C=CayleyCosetSums/. Local source references, not an elaborated DAG.

## 1. Exact statement and application
C/ContinuousMatrixLowerRightBlock:103–130, PositivityTheory.Rg.Sw.HSt.CrxMa.stepA_Z. Given natural n,m (no m<n required in this lemma), FdProps, FzHol, compact topological group Kg with measurable/Borel structure, Haar measure μ, continuous group homomorphism ι:Kg→M2(n) with image exactly InK (iff), assume for EVERY complex n×n P, singular test ψ, a,b,x∈InG,
    ∂z tOp(μ,ι,ρ_P,ψ,a,b,fz(m,0,z),x)|₀=0.
For every complex Y and a,b∈InG the conclusion is
    detD [H↦∫_Kg Fd(m,ι(k)(a nU(H)b))ρ_Y(k)dμ]=0.
Here Fd(m,g)=∂z fz(m,0,z,g)|₀. FdProps (C/FdProps:26–32) asserts complex smoothness on DomZ and interchange of this spectral derivative with tOp for continuous weights and continuous compactly supported tests, admissible group elements and the same compact-group hypotheses. FzHol (C/CruxSt:32–34) asserts DomZ open, contains GSet, and joint analyticity on C×DomZ for every n,m,e. DomZ imposes Dom and slit-plane condition on det u1 det ub1. Keep both packaged premises; this is not a proof of their suppliers.

Set Ω={g:∀k,ι(k)g∈DomZ}. Compactness and continuity give Ω open (isOpen_setK, C/ContinuousMatrixLowerRightBlock:32–38); group closure gives GSet⊂Ω. Weight ρ_Y is continuous by nonzero det u2 on InG, inverse=adjugate/determinant, continuity of the Cayley blocks, vacuum at zero, trace and conjugation (:46–57). The compact parameter integral Φ_Y(g)=∫Fd(m,ι(k)g)ρ_Y(k)dμ is complex C∞ on Ω using holInt and continuousOn_iteratedFDeriv_translate (:59–67). The preimage under H↦a nU(H)b is open and contains 0 since nU(0)=I. Thus G(H)=Φ_Y(a nU(H)b) is complex C∞ on a ball of some radius r>0.

For each singular test ψ choose P=Y and x=I in hneg; FdProps converts it to tOp with Fd instead of fz derivative. Fubini gives ∫G(herm t)ψ(t)dt=0. In detail the joint integrand Fd(m,ι(k)a nU(herm t)b)ψ(t)ρ_Y(k) is continuous because every group argument is in GSet⊂DomZ, and supported on Kg×tsupport ψ, compact. Hence product integrable, and integral_integral_swap applies (fubini_gen :69–101). Multiplication order retained. No interchange without this support argument and no normalized Haar assumption. Apply singToDiff to G. C/VacuumNonvanishingOfFacts:44–45 calls exactly CrxMa.stepA_Z; :47–54 uses it through topComp in Step B. This is conditional on the actual input hneg, obtained by negating Crux0 in the consumer, not a claim that all vacuum derivatives vanish unconditionally.

## 2. Full local supplier: determinant as a Fourier multiplier
A/SingToDiffAlt:37–40 defines detD G=Σσ sign(σ) D^nG(0)[E_{i,σ(i)} for i=1..n], the complex iterated Fréchet derivative evaluated on matrix units, not det(G) or a derivative of det(G). :79–81 defines SingToDiff: for every n (including 0), G:M_n(C)→C, r>0, complex C∞ on B(0,r), if ∫G(herm x)ψ(x)dx=0 for EVERY IsSingTest ψ, then detD G=0. No global smoothness of G required.

On V=R^(n×n) write h(x)=herm x with entries (x_ij+x_ji)/2+i(x_ij−x_ji)/2. Define v1_rc=(E_rc+E_cr)/2 and v2_rc=(E_cr−E_rc)/2 as real matrices. A/SingToDiffA:41–70 gives
    h(v1_rc)+i h(v2_rc)=E_rc,
    ∂^c_rc = D_v1_rc + i D_v2_rc.
This is why real Hermitian coordinates suffice for COMPLEX differentiable G. A/SingToDiffC:19–58 proves chain rule and its iterated version dList_ofFn (using local eventual equality before differentiating, not a global identity). With F=G∘h on U=h^{-1}(B(0,r)), define L F=Σσ signσ dList(lσ)F, where lσ lists (i,σ(i)) in the native Fintype.equivFin order. Then LF is continuous on U and LF(0)=detD G. The diagonal r=c and empty list cases are included.

For φ globally real C∞ with compact support inside U, form the test
    ψ=Σσ signσ dList(reverse(lσ))φ.
A/SingToDiffB:27–55 proves support containment under every derivative, so ψ is continuous and compactly supported in tsupport φ. A/SingToDiffB:56–117 proves bilinear (not sesquilinear) integration by parts, with integrability from compact support inside the open smooth region:
    ∫ F dList(l)φ = (−1)^len(l) ∫ dList(reverse(l))F φ.
Reversal retained even though smooth constant-coefficient derivatives commute; no conjugation of i in this bilinear formula.

For any Hermitian β with det β=0, set eβ(x)=exp(2πi tr(β h(x))). The complex directional symbol is ∂^c_rc eβ=(2πi)β_cr eβ. Iteration multiplies these factors; the signed permutation sum equals (2πi)^n det β by determinant expansion (A/SingToDiff:19–69). Applying integration by parts to eβ and the reversed lists yields
    ∫ ψ eβ = (−2πi)^n det β ∫ φ eβ =0.
This is exactly fourier_test (:71–108), which actually proves the identity's zero conclusion even without Hermiticity; only the Hermitian singular subset is required by IsSingTest (IsSingTest:33–35). No Fourier inversion, distribution support converse, or convergence at infinity is presumed. Thus ψ is an admissible singular test, constructed rather than assumed.

## 3. Recover the pointwise derivative by positive localized averaging
A/SingToDiff:113–229 chooses any small normalized real smooth bump φ supported in U around zero. The hypothesis applied to ψ and integration by parts give
    0=∫ Fψ=(−1)^n∫ (LF)φ.
The sign is nonzero, hence ∫(LF)φ=0. If LF(0)≠0, continuity provides a small ball where |LF(x)−LF(0)|<|LF(0)|/2. Choose outer radius ε=min(ε0/2,ε1/2)>0, inner radius ε/2, where ε0 bounds the ball inside U and ε1 bounds the continuity neighborhood. The source uses ContDiffBump.normed volume, φ≥0 and ∫φ=1. Then
    LF(0)=∫(LF(0)−LF(x))φ(x)dx,
    |LF(0)|≤(|LF(0)|/2)∫φ=|LF(0)|/2,
a contradiction. Hence LF(0)=detD G=0. The native proof needs only small normalized bumps and the source's continuity and support estimates, not convergence of an unbounded family of derivatives. This supplies the actual local theorem, not merely a Fourier heuristic. Conventional ingredients: complex chain rule, Leibniz determinant, compact-support integration by parts, normalized bump localization. No independent attribution to a particular published theorem established. Mathlib integration by parts and bump theorems and holInt/FdProps/FzHol suppliers remain open for deeper reconstruction; absence of an explicit sorry here is not a transitive axiom audit.

## 4. Upstream and reproducibility
H moves C/ContinuousMatrixLowerRightBlock into C/Crux:733 (consumer :966), and A/SingToDiffB,C into A/SingToDiff:169,226,375. A/SingToDiffA:95 retains herm_v. Old B,C and ContinuousMatrixLowerRightBlock paths absent at H. These are relocation observations, not proof equivalence or repinning. Executed connector source checks: 12/12 GitHub directory blob identifiers and 75/75 literal line anchors matched. Executed exact JS integer regressions: all 19,683 3×3 matrices with entries −1,0,1, including 7,875 singular matrices, matched determinant via cofactor expansion versus transposed permutation-symbol expansion; 8,772 individual matrix-entry checks of h(v1)+i h(v2)=E_rc across n=1..8 matched (dyadic arithmetic exact). These are checks of algebraic ingredients only, not analytic proof tests, Lean replay, or URT benchmark. Below local-clone Python certificate reproduces representative anchors and all exact algebra counts (Python version not executed in this session).
```python
import subprocess,itertools
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="fcb6eac7534875d32d68030967e2deae6d686151"
b="src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/"
A="AnalyticDeterminants/"; C="CayleyCosetSums/"
rows=[
(P,C+"ContinuousMatrixLowerRightBlock","3b4e8c6f013d0e6da16b1bf2438d47dfcb893d76",123,"singToDiff n"),
(P,C+"FdProps","1bbff855867c08b480b03ff6e62cfcaac88f0479",26,"def FdProps"),
(P,C+"CruxSt","73b4302b0eb23bd4e524572c8b09adfcc6903279",34,"AnalyticOnNhd"),
(P,C+"VacuumNonvanishingOfFacts","59b9d0e0060f8ea3e9387803aef00f5bae6d5eef",45,"CrxMa.stepA_Z"),
(P,A+"SingToDiffAlt","ce0e07c6678297a655e2b9e03de36c3a62e69010",37,"def detD"),
(P,A+"SingToDiffA","733ab8a6307dc19595dda8c27cabcafb24a01358",47,"theorem herm_v"),
(P,A+"SingToDiffB","d0f98d5bd57606939aab1b95b4f96cb5ee8f14b6",100,"theorem ibp_dList"),
(P,A+"SingToDiffC","5d74fec212169a3505f744d8966f402869e20f5a",29,"theorem dList_ofFn"),
(P,A+"SingToDiff","8cfa433d73eb646e37ea8569dcfbf6c8d1ff596c",113,"theorem singToDiff"),
(H,C+"Crux","7ee5755446d0b5dc5e24987162d591acdc8415f0",733,"theorem stepA_Z"),
(H,A+"SingToDiff","26a76725a4df8555827a6e47341323c8e6e16ecf",375,"theorem singToDiff"),
(H,A+"SingToDiffA","b92e87cee3425a4ca6c9b6957c28d92455a4161e",95,"theorem herm_v"),
]
for rev,f,sha,line,needle in rows:
    raw=subprocess.check_output(["git","show",rev+":"+b+f+".lean"])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()==sha
    assert needle in raw.decode().splitlines()[line-1]
count=singular=0
for x,y,z,p,q,r,s,t,u in itertools.product((-1,0,1),repeat=9):
    d=x*(q*u-r*t)-y*(p*u-r*s)+z*(p*t-q*s)
    symbol=x*q*u+p*t*z+s*y*r-s*q*z-p*y*u-x*t*r
    assert d==symbol
    count+=1; singular+=int(d==0)
herm=0
for n in range(1,9):
    for r,c,i,j in itertools.product(range(n),repeat=4):
        # store 2*v1 and 2*v2, so the final identity is scaled by four
        def v1(i,j): return int((i,j)==(r,c))+int((i,j)==(c,r))
        def v2(i,j): return int((i,j)==(c,r))-int((i,j)==(r,c))
        assert v1(i,j)+v1(j,i)-v2(i,j)+v2(j,i)==4*int((i,j)==(r,c))
        assert v1(i,j)-v1(j,i)+v2(i,j)+v2(j,i)==0
        herm+=1
assert (count,singular,herm)==(19683,7875,8772)
print(len(rows),"blobs, representative anchors;",count,singular,herm)
```

## RESUME HERE
Expand the actual pos_int supplier in Crux0 Step G (strict positivity of compact integral of squared complementary minors), then dpDual; retain topComp, stepC/D, FdProps, FzHol, Gaussian base/GI.integP and CR.crLem_of/KSing.lamSing_of as outstanding. Request authenticated incoming and outgoing role paths for PositivityTheory.Rg.Sw.HSt.CrxMa.stepA_Z and PositivityTheory.Rg.Sw.LVs.singToDiff, relative to holLeadB (manifest 8996470), without repeating raw export. HANDOFF TO theta, dependency, kernel, integration, editor, audit. Full RH reconstruction OPEN. No independent Lean kernel validation or URT acceleration claim.
