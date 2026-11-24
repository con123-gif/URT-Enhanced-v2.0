# Theta lifts run 2 — the nonzero scalar induction and doubling-integral base

2026-11-24. RESULT: SOURCE-MATCHED conditional human proof of the signature induction, its closure into OneConst/ThetaIntegralsAgree/LocalMatching, and the analytic nonzero-bottom contradiction. No independent Lean kernel validation, no completion claim, no URT speed claim. The induction is not a proof of RH in isolation.

## Continuity
Read all three swarm protocols, AGENTS, actual runner research log/protocol, continuity, research state, CI summary (physical PASS 45352595797, 08:21 UTC, not an RH certificate), theta run 1 and peer Galois, character-box, literature, positivity, prime-window, Landau, kernel, acceleration, math and integration handoffs. This is the next frontier named by theta run 1; the seven-input downstream adapter is not repeated. Source pin leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005. Current main observed 0e40c084e27c44a3584e271cb14e7dd3bce9aa63; comparison against d27f71347abceb76cd37dc8a5fccbe556ec2be90 returned 9 commits ahead, only five listed changed files (CI scripts/tests and verification/CI-RUNNERS.md), no Lean files in that comparison. Keep current and pinned graphs separate.

## Source ledger
T = src/Development/WeilBound/ThetaLifts/; D = src/Development/AbelianVarietyTheory/Definitions/Divisors/. All at original pin.
- A T/SphericalLattices/SphericalClosure/CloseSph.lean 9a15ec479fb007975f15b6df7fe5fe46615e4f8f
- B T/AgreeOfLeaves.lean 7ded8dbfba9d886440ccb88f4333e9af2f6b8b0d
- C T/ConeHypotheses/CtSmallCone.lean 4adaba7515f7ee3b4c8321b34e2bb3dc3cc1550d
- D1 T/ConeHypotheses/KeyAOf.lean 87f479727a6a00be916ec96a5b0d888b7d214d2c
- E T/ConeHypotheses/PolDense.lean 7e2a0f5baf8296040d6bcd44f7accd625360aed3
- F D/MatchingOfParts.lean 0b28322e9e86af29a20031f44aae399dbf00c8a6
- G D/CTSmallCone.lean 59578c7a38cc131fdab95da5541523c42a5b159e
- H T/WeilDomination/ExistsUnitChrWNe.lean 4a76f97d605ebd8650af8ca6580f8e172f0db173
- I T/LatticeBasics/BotAsm.lean de3e30d43431c4ea373b47a59dc6aeaa4371d70a
- J T/LatticeBasics/ExistsIsHeckeLOfCompleted.lean a9870cbfacc6ffa1c17c95759232ef2ffff16239
- K T/Reductions/TopPolarZero/PolZero.lean 53e3dd1eecd90129f30180a66820109d0c8b54be
- M src/Development/AbelianVarietyTheory/BlockTheory/DivisorBase/WeilTensorModels.lean 4d0d94fd3fd9368e5428c05402979d6dd5123b4d
Additional inspected: T/ConeHypotheses/PureEqPureA.lean 32b61df65b96059ad599295ec7e5c558581f0daa; T/LatticeBasics/EulerHalf.lean 01deb51b0b752ba0d4ba5b0bbc7fb1b5393e0828; T/SphericalLattices/SphericalClosure/EndCore.lean c32993fc08a31615b2d84fbaf18abc4fdbfc87d0 (partial inspection); T/WeilDomination/FacNeGauss.lean c46039a3e0e96b54478853a957b4e006eb971abc (partial); T/Reductions/FiniteClosure/TheoremKOfMod.lean 61ff0c7c5ee7e5df0681112d6727ab143c3b6996; src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean a13ba1f8c38d4dbf2ddd809fbf9610a007936c24.

## 1. Exact closure of the paired theta properties
A closeSph takes the 14 inputs identified in run 1, constructs a record L : PositivityTheory.ThKG.Leaves and supplies two further proofs hd : KDecay and hc : KCoinv. Its terminal call is B agree_of_leaves L hd hc. All 26 record fields are retained and source-checked against their actual supplying type annotations, in order:

evZero/EvZero; evCone/EvCone; stabEx/StabEx; towerA/TowerA; towerB/TowerB; facNe/FacNe; matchEx/MatchEx; leviEx/LeviEx; polDense/PolDense; weilConv/WeilConv; soCont/SoCont; splitEx/SplitEx; ctBigZero/CTBigZero; ctSmallZero/CTSmallZero; ctBigCone/CTBigCone; ctSmallCone/CTSmallCone; anAll/AnAll; polRe/PolRe; nonZeroAn/NonZeroAn; polZero/PolZero; locA/LocA'; locB/LocB'; endA/EndA'; endB/EndB'; kReal/KReal; kFin/KFin. No field is assumed dispensable.

B forms (agree_of_parts hd L.kConst hc L.kBeta L.kAlpha, matching_of_parts L.kReal L.kFin). F agree_of_parts explicitly packages Decay and (OneConst,Coinv) under the triple and matched quantifiers, plus separate existential unit triples for StepBeta and StepAlpha. F matching_of_parts independently chooses R from KReal and Rf from KFin, then forms IsMatched from the original triple and both properties. KReal and KFin alone do not give equality of theta integrals; the other five proofs remain indispensable to this composition. This is a textual dependency map, not exported kernel edges.

## 2. Induction invariant and exact hypotheses
For any number fields F,E with Algebra F E, algebra endomorphism sigma, base B, ranks a,a', geometric triple G, characters X and Weil representations om,om', fix matched quotient maps R,Rf. All IsTriple and IsMatched conditions from run 1 remain. E Claim means (i) a nonzero c with PolConst, (ii) a polynomial adelic test vector Phi with nonzero integral function I_A(Phi), and (iii) a polynomial test vector Phi' in the special small-side space So with nonzero I_B(Phi'). G PolConst quantifies over all polynomial-matched pairs with Phi' in So and all h. Below(n) quantifies over *all* the preceding data with p+q<n, not merely one fixed model. The proof's rank variable is p+q, not a+a'.

M Geo.IsGood requires a'<a, a+a' even, strict weight gap, 2(p+q)+1<floor((a-a')/2), 2(p+q)+1<a', and all form/model constraints. Denote k=floor((a-a')/2). In particular k>=2(p+q)+2>=2. The induction always removes two dimensions from one member and decreases p+q by one. TowerA and TowerB supply the smaller *good matched* geometry, not arbitrary decrements that might violate admissibility.

C Leaves.const_of obtains the nonzero polynomial proportionality by cases:
- p=q=0: exact L.polZero, with the actual source base-case producer K polynomial_vanishing_of_compactness. NonzeroAn supplies separate nonzero integral witnesses; proportionality alone could be vacuous.
- q=0,p>0 (Alpha): write a=b+2, construct the adapted same-signature reG and smaller geometry G1 via TowerA, choose matched maps for both. L.keyA gives C != 0 and local relation. The lower Claim supplies c1 != 0. Put k_A=floor((b+2-a')/2), F_A=stepFac with exponent 1-k_A and L_A=charL(X.nu,X.S0,k_A). Then c_A=C F_A L_A c1 is nonzero (FacNe and lower claim). In the polynomial relation, use SplitEx uniqueness to identify the first component fa' of the given splitting with the one constructed by KeyA. EndA' upgrades the Levi first-component equation to PolConst on the adapted model; PolRe transports existence of a nonzero proportionality back to the original model. Do not assume transport preserves a scalar value unless the exact PolRe proof says so.
- q>0 (Beta): write a'=b+2, use TowerB, analogous matched models. Put k_B=floor((a-(b+2))/2), F_B=stepFac at exponent -k_B and L_B=charL(X.nu,X.S0,k_B+1). KeyB gives (C F_B L_B) fb = c1 fb'. All denominator factors nonzero by FacNe. EndB' upgrades fb=c_B fb' to PolConst for c_B=c1/(C F_B L_B). PolRe transports existence. CfgB preserves p and decreases q by one; CfgA decreases p by one and q=q1=0.

H facNe proves two independent parts: stepFac is nonzero because ideal and character values are units, local norm powers and Gauss sums are nonzero (the latter via ramification, additive-character hypothesis and unit witness); and charL(X.nu,X.S0,k) !=0 for natural k>=2 by converges_charFam in Re(s)>1. Crucial noncircularity observation: the geometric inequalities place the induction's L_A,L_B in the ordinary Euler-product domain. This argument does NOT assume half-plane GRH; it also does not establish that the stronger base-case integer nonvanishing is trivial.

D1 keyA_of/keyB_of first choose universal integer units from LocA'/LocB'. For fixed geometric setup with at least one admissible pair, evaluation maps and stabilizer measures give three nonzero constants C0,C1,C2 from constant-term and local-cone producers. Set C=C2*C1/C0 before the universal character/matched vector quantifiers. The algebra identities alg_A/alg_B simply rescale the lower-model relation. In the no-admissible-pair branch choose C=1 and eliminate impossible matched triples; this is not a nonzero witness for an existing model. The nonzero test component comes by lifting a lower-model nonzero polynomial integral through a surjective evaluation map, selecting a nonzero point and lifting it to the Levi subgroup. Preserve the distinction: Beta uses lower large-side nonzero integral and fb; Alpha uses lower small-side nonzero integral and fa'. EndA'/EndB' still depend on the Below premise in E even though E endA'_of/endB'_of construct them from stronger G EndA/EndB.

## 3. Complete Claim and uniqueness (conditional on L)
C claim_of first obtains c by const_of and matching via MatchEx. If q=0, NonZeroAn gives a nonzero special small-side integral; MatchEx lifts its vector to a matched large-side vector. Since c !=0, the large integral is nonzero at the same point. If q>0, nzV gives the large-side witness through KeyB's nonzero fb: if I_A(Phi)=0, the zero splitting (0,0) contradicts the asserted nonzero fb. nz_move transfers existence from adapted to original model; its contradiction uses density of polynomial real data, continuity of the integral for fixed finite data, and submodule-span induction (zero, addition and scalar multiplication). MatchEx then supplies special matched small-side vector, whose integral cannot vanish identically since the large integral is nonzero. This simultaneously proves all three Claim components.

Below(0) is vacuous; Below(n+1) follows using claim_of and monotonicity of Below because any rank r<n+1 satisfies r<=n. Hence Claim at rank r follows by applying Below(r+1), or equivalently claim_of with Below(r). This is well-founded, not a circular assumption of Claim at the current rank.

C isConst_of extends polynomial equality to all Match data. Match explicitly includes finite decompositions into real test functions and fixed finite Schwartz-Bruhat factors, with convergent real approximants, polynomial matching at each stage and preservation of the special So condition. On the large side, use I_sum plus WeilConv continuity to take the limit of the finite sum; on the small side use SoCont. The two sequences are pointwise proportional, so uniqueness of limits in C gives equality for all h. Conversely polConst_of uses the MatchEx implication from polynomial matching with So to Match. These are two actual implications, not a presumption that dense data automatically proves equality.

C kConst: choose the nonzero small-side witness from Claim and use MatchEx to find the corresponding polynomial large-side test. For any other c' satisfying IsConst, evaluate both at a point h with I_B(Phi')(h) !=0. Then c'I_B=cI_B, and cancellation gives c'=c. This gives unique existence and every proportionality constant nonzero, together with the original small-side witness: exactly OneConst. Omitting the witness would permit arbitrary c when both integrals are identically zero.

C kBeta and kAlpha are the final rank-step equalities, not merely const_of restated. For Beta use the same KeyB splitting with a nonzero fb and the actual IsConst; scale the small-side splitting by c, cancel the nonzero component, and set u=(C F_B)^(-1), valid because C F_B !=0. Thus u C F_B=1 and c L_B=u c1. Alpha uses KeyA nonzero fa', AnAll to extend polynomial equality when q=0, and cancels the nonzero component to get c=C F_A L_A c1. Their quantified adapted-plane data, independent unit choices and all-match conditions remain those of StepBeta/StepAlpha from run 1.

## 4. Actual analytic nonzero bottom: I pair_ne_zero and nonZeroBottom_of_doubling_integral
The leaf NonZeroAn is constructed in A from NonZeroBot, TowerA/B, EvZero, CTBigZero/CTSmallZero, SchToPol, PolSch, LeviEx, SplitEx and ToSo. The separate bottom producer I nonZeroBottom_of_doubling_integral takes exactly KReal,LInt2,HgtEx,NormZeta,EulerProd,LocMeas,LocUnr,BadFactor,RealInv,DProd. It applies pair_ne_zero twice at p=q=0 with chi_W=X.nu^-1 and X.nu respectively; X.nu=alpha/beta. The real quotient is nontrivial, characters are Hecke, both Hermitian pairs definite, n>=1, n<d=a+a', d even, specified ramification and unramified conditions at T, and h_R supplies quotient hp. These are part of the statement. Do not infer nonvanishing for arbitrary characters.

I pair_ne_zero additionally requires an entire function Lambda matching the full charL for Re(z)>1 and nonzero at all integers j with -d<=2j (J LInt2). The function is named Lambda in source; it is not automatically the completed L-function, as J specifies agreement with charL itself. Height data, real invariant vector, bad-factor construction and normalized zeta data produce a polynomial Phi, a domain U, holomorphic Z on U, threshold t0, an integral H(z) restricted to g integral outside T, and a nonzero analytic normalizer d_T(z) on Re(z)>0. Under the supposition I(Phi)=0, the NormZeta vanishing clause gives Z(z0)=0 at z0=(d-n)/2>0. BadFactor ensures H(z0)!=0.

For Re(z)>max(t0,n/2), the Euler-product identity proved by I reads
  Z(z) d_T(z) = [product_{i=0}^{n-1} Lambda(z+n/2-i)] H(z).
Every shifted argument has Re>1 there (since i<=n-1). Ramified factors of charL at places over T are 1; I hasProd_off proves their deletion is exact, not an approximation. The product identity uses the local factors from LocUnr, the bad-place integral, and convergent product limits. I eq_zero_of_right analytically continues the *difference* to the open intersection U cap {Re z>0}; the hypothesis that the complement of U is discrete gives countability, and the exponential real-coordinate homeomorphism identifies the right-half-plane domain with a plane minus a countable set. Its preconnectedness and the complex identity theorem justify propagation from the right-hand open half-plane. The precise U membership and differentiability hypotheses are supplied by NormZeta/BadFactor/DProd and LInt2, not asserted for any arbitrary meromorphic function.

At z0 the shifted arguments become d/2-i, integers because d even. Since i<n<d, -d<=2(d/2-i), so every Lambda factor is nonzero by LInt2. H(z0) is nonzero by BadFactor. Their product cannot equal zero; contradiction to Z(z0)=0. Thus the chosen Phi has nonzero theta integral. This is the actual doubling-integral nonvanishing argument in the source, retaining the stronger analytic premise. It does NOT prove LInt2; that is a separate upstream task. In particular ordinary Euler products at k>=2 do not supply LInt2 on negative integers.

## 5. Base-case dependencies and literature boundary
K polynomial_vanishing_of_compactness uses SiegelWeilStd, EisBL, GlobalTheory.Published.HeckeLEntireAndNonzeroAtOne, NonZeroAn, Factor, MatchEx, ThetaBasic, WeilConv, KDecay, ICont, GrpTop,EpsOf,SiegelAll,FinVolU,Unimod. Its body constructs compactness and calls hermLine_of', coefLine_of, thConst_of', polZero_of; these are the remaining real analytic/representation theoretic steps of the p=q=0 proportionality proof. The literature wrapper in EveryCharacterOfLiteratureOfVWin names O but its EisBL and SiegelWeilStd producers do not explicitly use O: they invoke PositivityTheory.RgEis.Hd.eisBL and PositivityTheory.SiegelWeilFormula.Fin.siegelWeilStd. Do not confuse a wrapper with a source axiom or a verified published theorem. Those two producer bodies, the stronger LInt2 theorem lInt2, and the exact X.nu to downstream Dirichlet character construction are not reconstructed here; they remain open for this lane and literature audit. The nonzero-bottom chapter is conditional on the exact 10 input propositions, whose producers remain required.

## 6. Executed static and arithmetic checks
All 26 Leaves fields compared position-by-position to the actual annotated supplying types from A and C using V8. First two checker attempts failed because the extraction regex omitted a formal argument (KReal) then apostrophes in LocA'; corrected checker succeeds. This was a checker parsing error, not a theorem mismatch. Also executed bounded exact integer checks on the Geo inequalities, ranks and shifted arguments: alpha 10,665; beta 47,565; base 2,304; doubling shifts 71,545. All passed. These finite checks support transcription, not the proof for unbounded ranks; that is the inequalities derived above. No Lean execution or independent kernel extraction. No changed premises. All listed source hashes are connector-reported Git blob IDs; local hash replay below is supplied but not executed here.

Reproduce against pinned checkout (Python 3):
```python
from pathlib import Path
import hashlib
T=Path("src/Development/WeilBound/ThetaLifts")
names=["SphericalLattices/SphericalClosure/CloseSph.lean","ConeHypotheses/CtSmallCone.lean","ConeHypotheses/PolDense.lean"]
hashes=["9a15ec479fb007975f15b6df7fe5fe46615e4f8f","4adaba7515f7ee3b4c8321b34e2bb3dc3cc1550d","7e2a0f5baf8296040d6bcd44f7accd625360aed3"]
bs=[(T/n).read_bytes() for n in names]
assert [hashlib.sha1(b"blob "+str(len(b)).encode()+bytes([0])+b).hexdigest() for b in bs]==hashes
s,l,p=[b.decode() for b in bs]
fields=[x.strip().split(" : ")[1] for x in l.split("structure Leaves : Prop where",1)[1].split("namespace Leaves",1)[0].strip().splitlines()]
args=s.split("h_Weil6_ThKG_Leaves : PositivityTheory.ThKG.Leaves := ⟨",1)[1].split("⟩",1)[0].split(", ")
assert len(fields)==len(args)==26
for field,arg in zip(fields,args):
    line=next(x for x in s.splitlines() if "have "+arg+" :" in x or "("+arg+" :" in x)
    ty=line.split(arg+" : ",1)[1].split()[0].rstrip(")")
    assert ty.split(".")[-1]==field
counts=[0,0,0,0]
for a in range(101):
    for ap in range(a):
        if (a+ap)%2: continue
        for p in range(11):
            for q in range(11):
                if not(2*(p+q)+1<(a-ap)//2 and 2*(p+q)+1<ap): continue
                if q==0 and p>0:
                    assert a>=2 and (a-ap)//2>=2 and p-1+q<p+q
                    counts[0]+=1
                elif q>0:
                    assert ap>=2 and (a-ap)//2+1>=2 and p+q-1<p+q
                    counts[1]+=1
                else: counts[2]+=1
from fractions import Fraction
for n in range(1,60):
    for d in range(n+1,121):
        if d%2: continue
        for i in range(n):
            z=d//2-i
            assert -d<=2*z and Fraction(d-n,2)+Fraction(n,2)-i==z
            counts[3]+=1
assert counts==[10665,47565,2304,71545],counts
print("26 field matches",counts)
```

RESUME HERE: locate the actual declaration GlobalTheory.ThK.Dbl.lInt2 (not just J's definition LInt2), by traversing the imports of A and K, especially the HodgeTate/HeckeTateFunctionalEquationCM branch. Translate its proof of integer nonvanishing, retaining all character infinity-type bounds and exceptions, and check precisely how the completed functional equation avoids trivial zeros after removing gamma factors. Then unpack K polZero_of (base scalar) and hand over EisBL/SiegelWeilStd source provenance to literature lane. Do not redo the induction or substitute ordinary Euler-product nonvanishing for LInt2.
HANDOFF TO: proof editor, integration, formal audit, literature and character-box lanes. Signature induction, uniqueness and analytic nonzero-bottom argument ready for independent source review. Project OPEN; no physics gate touched.
