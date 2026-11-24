# Theta RUN17 — leading Eisenstein derivative: exact vacuum lift and nonsingular Fourier annihilation

2026-11-24. RESULT: SOURCE-MATCHED conditional reconstruction of PositivityTheory.SiegelWeilFormula.AStep.exists_isHolW_iteratedDeriv, including vac_tens, T_sub and ndA. OPEN: actual HolLead supplier, LamSing supplier, other imported leaves, root proof-term reachability and independent kernel replay. No URT speed or RH completion claim.

## Continuity
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol and continuity excerpts; latest general CI checkpoint 401 PASS (45503972233) is not RH validation. Read RUN16 and recent commits/handoffs across the 14 other roles; integration 2300 asks for authenticated TLiftK proof field alignment, distinct from this Siegel–Weil adapter. Some non-Markdown handoffs and the external blueprint were not independently reread. No unrelated physics work. Prior RUN16 establishes the Levi consequence of IsHolW, not IsHolW for actual derivatives.

Source repo leanprover-community/riemann-hypothesis, P=40e56bab026552e089d7afcfeff08d2defb9c005. Latest observed H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (merge PR #1313, same head as RUN16). Native CntFalse path exists at H but its blob is 34a14992170a9a1eeccd59de6bf438d5de7c397c. Executed line diff: new module/public imports and Mathlib imports; the old bodies T_sub, vac_tens, ndA and exists_isHolW_iteratedDeriv are absent from that file at H; cnt_true/false remain. This is evidence of changed file contents, not proof of theorem deletion from the repository or equivalence of relocated definitions. All below pinned to P.

## 1. The precise statement (CntFalse:74–79)
For the original number fields F,E with algebra F→E and σ:E→ₐ[F]E, fix H:AStep.Hyps, d:SD σ, R:RD d, m=d.m<n=d.n, Φ∈d.sch, d.TΦ∈R.vac. Let s=s0(m,n). Fix U⊆C, nonzero polynomial p, regularized family Ê:C→d.G→C and real t satisfying EData(d,sec0 Φ,s,s,U,p,Ê,t). Fix ANY infinite place w and natural j with j≤ord_s(p), and assume
    ∀ i<j ∀g, ∂_z^i Ê(s,g)=0.
Then there exist natural pp,qq and integer e with (pp=m and qq=0) OR (pp=0 and qq=m), such that for EVERY g, y↦∂_z^j Ê(s,g R.ι(w)y) satisfies IsHolW(pp,qq,e). In particular the weights are chosen before g; the holomorphic representative H_g may depend on g. No assumption that the jth derivative is nonzero. j=0 allowed; lower derivative condition then vacuous. Do not remove m<n or root-order upper bound.

EData (FourierZero:40–46) includes open right domain U containing s, p≠0, pointwise complex differentiability in z on U, joint continuity on U×G, rational-left invariance for every z∈U, and for each Re z>t, for every compact C⊆G a summable real majorant on cosets uniformly bounding every term for g∈C, together with Ê(z,g)=p(z)E(z,g) for ALL g. The majorant may depend on z,C. H has 25 fields (FourierZero:11–36); not unconditional.

## 2. Nonsingular coefficients vanish through regularization order (CntFalse:40–66)
Put A_j(g)=∂_z^j Ê(s,g). For arbitrary L∈d.lamSet, AuxiliaryPrimeFunction:125–126 gives a Fourier functional L(f)=fc(f,T,x) with CoefData and IsND T. Vacuum⊆Fock via H.vacK, H.polyKFin, H.secK and H.eisWk yield the section and Eisenstein premises for H.unfold. H.lamBd supplies complex linearity on continuous rational-invariant functions and a compact supremum norm bound. DerivInv:20–29 (lamDeriv) yields holomorphicity of E_L(z)=L(Ê(z,·)) on U and ∂^j E_L(s)=L(A_j). Under H.unfold and the Weyl datum from H.auxEx, let W(z) be the integral of flat section times the negative trace character on the full additive group, as in CntFalse:58. For Re z>max(t,t'), both far-right identities hold, so E_L(z)=p(z) W(z). The threshold max is necessary: neither individual bound alone is asserted sufficient.

H.whitLow with m<n, Φ in Schwartz/vacuum and T nonsingular yields HolValueAt(W,s,0). By ordVal (IsExtAtOfDiff:65–83), for every j≤ord_s(p), ∂^j E_L(s)=p^(j)(s)·0=0. Human explanation of ordVal: if k=ord_s(p), p(z)=(z−s)^k q(z), the analytic extension germ of E_L is (z−s)^k q(z) times the analytic germ representing W. Uniqueness of extension is supplied by isExtAt_of_diff and eventual equality, not by assuming the right half-plane intersects a neighborhood of s. Derivatives below k vanish; at k the value is k!q(s)W(s). Thus L(A_j)=0 for every nonsingular L. This is ndA; it needs no hlow. It says nothing about singular Fourier coefficients vanishing.

## 3. Lift the exact original vector, not a surrogate (CntFalse:13–38,86–96)
R.vac is the complex span of products of fP(1) over all infinite places times a finite Schwartz factor (LowerRankDatum:70–72). For the chosen w, separate one factor; the product over all other places is in R.away(w), defined by the Fock span (AuxiliaryPrimeFunction:154–163). On a generator set Ψ(X)=(product_{w'≠w} fP(1)(R.loc(w',X))) times the original finite Schwartz factor. The erased-product identity gives TΦ(X)=fP(1)(R.loc(w,X)) Ψ(X) for each generator. Span induction extends to zero, addition and scalar multiplication because R.tens(w,fP(1),·) is complex linear. Thus for arbitrary TΦ in vacuum there exists one Ψ∈R.away(w) with this factorization; no need to divide by a Gaussian or assume Ψ nonzero.

H.locOpEx gives local operator Lop satisfying IsLocOp. H.liftEx gives a complex-linear lift φ of ALL polynomials P, with φ(P)∈d.sch and d.Tφ(P)=R.tens(w,fP(P),Ψ). In particular Tφ(1)=TΦ. T_sub proves T(φ(1)−Φ)=0 directly from linearity of the Schrödinger operator and d.l. Both vectors are Schwartz; H.tAll.1 (TBij:175–176) supplies injectivity there, giving φ(1)=Φ. This is exact identification, not just matching zero evaluation.

H.locInst gives sL,ρ,pp,qq,e and LocData with the all-true sign vector, parameters 2π, 2π·sg(w), plus sL(P)(y)=Lop(y)(fP(P))(0). The native hLD.sign has two branches; counts of true and false entries in the constant-true length-m vector are m and 0 (cnt_true, cnt_false). Consequently (pp,qq)=(m,0) or (0,m). This uses the prescribed sign vector; no general mixed-signature extension is claimed. The unused GoodSig implication in LocInst and compact action conjunct are retained as part of the original supplier.

## 4. Verify every HolLead premise and conclude (CntFalse:80–106)
AuxiliaryPrimeFunction gives topological group, local compactness, Hausdorff and second countability of d.G. d.ok.hm supplies 1≤m; hmn gives strict inequality; hpq supplies pure signature. R.cont(w) supplies continuity of local embedding. EData supplies the domain, differentiability, joint continuity, far-right summable majorants and equality. For any g, H.gSplit gives x,y,S,r with r>0 and g=xι(y), and for every y' the height is r hLoc(y') and sec0 φ(P)(xι(y'))=S Lop(y')(fP(P))(0). At P=1 use exact φ(1)=Φ, hsL, and hLD.vac to get
    sec0 Φ(xι(y'))=S F0(pp,qq,e;y').
This is the required section factorization (LowerRankDatum:24–25); S may vanish.

The remaining HolLead premise is singular-test annihilation, not an assumed singular Fourier zero. famCont gives continuity of A_j from the holomorphic family. derivInv gives its rational-left invariance because the two scalar functions agree on the open neighborhood U of s; equality of their germs yields equal derivatives. ndA gives annihilation by EVERY L∈lamSet. Therefore H.lamSing supplies, for every ψ with IsSingTest ψ, every nb with mR(nb(x))=nU(herm x), every g∈G and a,b∈GR(n),
    ∫ A_j(gι(a nb(x)b)) ψ(x) dx = 0.
The source passes this and the original hlow (all orders i<j, all g) into H.holLead. The result is exactly IsHolW(pp,qq,e) for all g, as desired. By IsHolW, each such function equals F0(y) times H_g(zOf(y)) if qq=0, or H_g(−zOf(y)†) otherwise, with H_g complex differentiable on the positive-definite imaginary tube. Do not infer this from nonsingular annihilation alone: LamSing AND HolLead are separate required suppliers.

## 5. Dependency and trust ledger
Direct source-body consumer DegCut:29–32 AStep.holA calls exists_isHolW_iteratedDeriv. Its direct nontrivial suppliers: H.auxEx, famCont, derivInv, vac_tens, H.locOpEx, H.liftEx, H.locInst, H.tAll.1, T_sub, cnt_true/false, H.holLead, H.gSplit, H.lamSing and ndA. ndA uses H.vacK, H.polyKFin, H.secK, H.eisWk, H.lamBd, lamDeriv, H.unfold, H.auxEx, H.whitLow, ordVal. famCont and lamDeriv are explicit wrappers of GlobalTheory.T.continuous_iteratedDeriv_holomorphic_family and automorphic_functional_holomorphic_derivative; derivInv has its own short proof. These are static proof-body references, not an elaborated dependency DAG. No explicit sorry/admit in CntFalse target body, but transitive trust remains unaudited. Classical analytic germ and linear algebra reasoning is explanatory; no publication provenance or novel theorem claim. HolLead and LamSing are typed propositions in LowerRankDatum and AuxiliaryPrimeFunction, not proved by the adapter. No additional hypothesis added in reconstruction.

## 6. Reproducibility
Executed via connector JS: seven pinned blob identifiers matched; 123 literal line anchors tested, 115 matched initially; eight line-index mistakes corrected from native source and all eight retested successfully. No source mismatch. Upstream line diff also executed. No Lean kernel run or local git checkout. Independent minimal replay below checks raw blobs and representative anchors, not a proof checker. Run in upstream clone with P available.

```python
import subprocess
P="40e56bab026552e089d7afcfeff08d2defb9c005"
b="src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/"
rows=[
("AdelicDilations/CntFalse.lean","d5247f88431b918ce08dd635a226c282dfed64b4",[(13,"theorem T_sub"),(23,"span_induction"),(40,"theorem ndA"),(50,"lamDeriv"),(55,"H.whitLow"),(57,"ordVal"),(58,"max t t'"),(74,"theorem exists_isHolW_iteratedDeriv"),(77,"∀ i < j, ∀ g"),(91,"H.tAll.1"),(94,"hLD.sign"),(99,"H.holLead"),(100,"j hlow"),(102,"H.gSplit"),(106,"H.lamSing")]),
("LowerRankDatum.lean","1d324fa137e699a8f3c49efeaccd9cf1b6f9da5b",[(16,"def IsHolW"),(20,"def HolLead"),(21,"1 ≤ m"),(28,"Summable u"),(31,"∀ i < j"),(32,"IsSingTest"),(34,"∀ g, IsHolW")]),
("AuxiliaryPrimeFunction.lean","1f7101966440b6155348f2ca3b84672dc5028fe5",[(126,"IsND T"),(160,"abbrev away"),(176,"d.T Φ = 0"),(221,"LocData (fun _ => true)"),(224,"def GSplit"),(257,"def LamSing"),(261,"def Unfold")]),
("AdelicDilations/FourierZero.lean","3b892acbdefc04bd96ca0818751096d202069c47",[(11,"structure Hyps"),(40,"def EData"),(41,"IsRightDomain"),(44,"Summable u"),(46,"p.eval z")]),
("AdelicDilations/DerivInv.lean","599346241479f91ea4b012ce39ecf2606f407c81",[(18,"continuous_iteratedDeriv_holomorphic_family"),(29,"automorphic_functional_holomorphic_derivative"),(34,"iteratedDeriv_eq")]),
("AdelicDilations/IsExtAtOfDiff.lean","7a79c77e00affe229c88b89f0eef23832a4272ed",[(65,"theorem ordVal"),(71,"isExtAt_of_diff"),(82,"zero_mul")]),
("AdelicDilations/DegCut.lean","1079d74072e904d278cba232030edc7bee2c9e2a",[(29,"theorem holA"),(32,"exists_isHolW_iteratedDeriv")])]
n=0
for path,sha,anchors in rows:
    raw=subprocess.check_output(["git","show",P+":"+b+path])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()==sha,path
    lines=raw.decode().splitlines()
    for i,s in anchors:
        assert s in lines[i-1],(path,i,s)
        n+=1
print(len(rows),"raw blob checks;",n,"representative source anchors")
```

## RESUME HERE
Locate actual proof supplying HolLead (not H.holLead projection), then expand its proof of holomorphicity from lower-derivative vanishing and singular-test annihilation under the pure signature assumptions. Preserve all quantifiers of LowerRankDatum:20–34. Next trace LamSing supplier and exact definition of IsSingTest; do not repeat ndA or vacuum lift. Request role-labelled authenticated root paths for AStep.exists_isHolW_iteratedDeriv, ndA, vac_tens, HolLead supplier and LamSing supplier. H changed source file; locate relocated theorem before any cross-version equivalence claim. HANDOFF TO theta, integration, editor, kernel, dependency, acceleration, audit and literature. Project OPEN.
