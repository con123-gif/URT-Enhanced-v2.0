# Theta lifts run 4 — the base scalar follows from orthogonality and a nonzero coefficient

2026-11-24. RESULT: SOURCE-MATCHED human reconstruction of the actual proof of GlobalTheory.ThK.Dbl.polZero_of, conditional on its nine original hypotheses, with a finite exact algebra check. This supplies the p=q=0 base-case proportionality argument for the signature induction in RUN2. It does not close the upstream suppliers of those hypotheses or establish kernel validity.

## Continuity and source revision
Read swarm protocol, queue (including blueprint caveats), expansion, AGENTS and continuity, actual runner log/protocol, previous theta runs 2/3, integration spine, recent acceleration/kernel, Galois, character-box, prime, Landau, literature and geometry lane handoffs. Physical orchestrator PASS 45369968953 at 10:17 UTC is unrelated to RH. Original upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005. Current upstream main fb990c7fb2d7e01039a22116b38c31457e56a796 (10:21:15 UTC, PR 1006 merge); pinned LatticeBasics/PolZero.lean path now returns 404, while Reductions/TopPolarZero/PolZero.lean at current head (blob 6bc5abdaf8999a267bc96aa7541b435d49ed4e09) now contains a theorem polZero_of. CTSmallCone at current head blob c060a18889275f7134946b2a34c8e1512aeb78f4. Do not infer equivalence of moved proofs. Work solely on pinned original. Dependency/acceleration lane still lacks a complete authenticated export in its latest handoff. Examined further 17 candidate source files in the theta subtree; exact original lInt2 declaration body remains not located. RUN3's conditional hFE dependency remains OPEN, not an axiom finding. Following RUN3's fallback, reconstruct polZero_of independently of lInt2.

## Source ledger
T = src/Development/WeilBound/ThetaLifts/; A = src/Development/AbelianVarietyTheory/.
- P: T/LatticeBasics/PolZero.lean, 1c4df9613cd7ab9604ec9aca188ccaa1685df842, lines 14–109 (I_left, swap_bdd, int_th, polZero_of).
- Q: T/LatticeBasics/PairsStable.lean, 15cdb3b0663f439d9ce45052db1299255f4196c9, 19–31 (pet, th, pairs, comb), 96–101 (ThConst), 114–129 (HermLine, CoefLine).
- C: T/LatticeBasics/FdEqZero.lean, 5a71acf351e947b2bef53cba29a0166d2bfce192, 17–46, 58–68, 80–122 (CptAll, boundedness, rapid, nonzero volume, norm-zero).
- S: A/Definitions/Divisors/CTSmallCone.lean, 59578c7a38cc131fdab95da5541523c42a5b159e, 106–108 (PolConst), 203–208 (MatchEx), 229–232 (NonZeroAn), 313–315 (PolZero).
- W: T/Reductions/TopPolarZero/PolZero.lean, 53e3dd1eecd90129f30180a66820109d0c8b54be, 35–45 (polynomial_vanishing_of_compactness).
- H: T/LatticeBasics/HermCpt.lean, 24ccc3389ccf5d1d062d587f14ec4d3f4775b508, 205–207 (hermLine_of').
- L: T/LatticeBasics/CoefLine.lean, aef065b49dd25f8c44f8a84762661e4c2e1682b5, 13–15 (coefLine_of).
- K: T/LatticeBasics/ThConst.lean, f28b691ef966c0a961bcafa3df32b74a89fdeebf, 134–136 (thConst_of; a related theorem, not a claim that this is the exact body of W's thConst_of').

## 1. Exact statement and all nine premises
Fix the original number fields F,E, Algebra F E, involution sigma, base B, ranks a,a', geometry G, characters X, representations om,om', real/finite matching maps R,Rf, and h:IsMatched B G X om om' R Rf. Keep all IsMatched/triple hypotheses and the typeclasses. Assume G.p=G.q=0. Then PolZero means there is one complex c != 0 such that for EVERY pair of test functions (Phi,Phi') with Phi' in G.M'.So B.psi B.tau_1 and PolMatch B G X R Rf Phi Phi', and EVERY adelic group element g, we have
  G.M.I om Phi(g) = c G.M'.I om' Phi'(g).
The actual theorem P polZero_of takes nine explicit propositions: CptAll, HermLine, CoefLine, ThConst, NonZeroAn, MatchEx, ThetaBasic, PositivityTheory.ThKF.ICont, PolSch. None is removed or replaced by a claim that a published theorem is true.

Let Y denote the matching-pair set in Q. For y=(Phi,Phi') in Y put A_y=G.M.I om Phi, B_y=G.M'.I om' Phi', C_y(s,t)=s A_y+t B_y. Write P_W(f,g)=integral_D f(h) conjugate(g(h)) dmu(h), linear in FIRST argument. The same notation P_V' refers to the original G.M'.mu and G.M'.dom. A norm here is the corresponding L2 squared norm, not a vector norm imposed by URT.

- CptAll supplies compact-cover/fundamental-domain/finite-measure data on W and V' from the definite signatures. Not compactness of the entire adelic group.
- MatchEx gives (m1) a permitted matching Phi' for every polynomial Phi, (m2) a matching Phi for every polynomial Phi', and (m3) polynomial membership and full Match for every y in Y. The second direction alone does not certify membership in So: the NonZeroAn witness supplies that separately.
- ThetaBasic, ICont and PolSch provide continuity and rational left-invariance via Schwartz membership for the lifts; products are integrable by compact-cover boundedness and finite restricted measure (P 52–71). Cpt.rapid then supplies exactly the rapid condition required by ThConst.
- NonZeroAn supplies a polynomial Phi0 with A_Phi0 nonzero as a function, and a polynomial Phi' in So with B_Phi' nonzero as a function, using p=0 and q=0 respectively. These are two distinct existential witnesses.
- HermLine: for each s,t,s',t' there is lambda in C, independent of y,y', such that P_W(C_y(s,t),C_y'(s',t'))=lambda P_W(B_y,B_y') for all y,y' in Y. No positivity of lambda is assumed by the source.
- CoefLine: if the diagonal-in-(s,t) HermLine identity holds for ALL y,y', then the squared norms of the backward theta lifts on V' satisfy the SAME lambda identity, for each y in Y and every polynomial test Psi. This is the essential transfer of the coefficient, not a consequence of HermLine alone.
- ThConst: for every s,t, if all C_y(s,t) are rapid, the backward theta lifts on both spaces are constant in their group argument for every Schwartz test function. P uses the primed half.

## 2. Exact analytic mechanism: a residual is forced to vanish
P 72–82: apply HermLine with (s,t)=(1,0), (s',t')=(0,1), obtaining c such that P_W(A_y,B_y')=c P_W(B_y,B_y') for all matching pairs. Define R_y=A_y-c B_y. Integrability justifies subtracting integrals. Thus P_W(R_y,B_y)=0 for every y. Apply HermLine again, now (1,-c),(1,-c), obtaining a possibly different uniform lambda with
  P_W(R_y,R_y')=lambda P_W(B_y,B_y')  (all y,y').
It is NOT enough to conclude R_y=0 merely from its orthogonality to B_y. The next step supplies the missing information.

P 83–96: pick the primed nonzero polynomial witness Phi' from NonZeroAn, with its So condition; use MatchEx m2 to obtain Phi, hence y0=(Phi,Phi') in Y. Let V=G.M'.mu.real G.M'.dom. By C Cpt.vol_ne, V is finite and strictly positive: nonzero Haar measure of a fundamental domain and finite total measure of that domain. Let n=P_W(B_y0,B_y0). This is a nonnegative real embedded in C, and n != 0 by Cpt.eq_zero and the witness. Do not replace this by pointwise nonzero at a guessed g.

Let T(f)=th om' mu D f Phi' (a function on V'). By ThConst it is constant for f=C_y0(s,t), including both R_y0 and B_y0. Fubini plus conjugation of the integral gives, with the original measure on V',
  integral_{D'} T(f)(g) dmu'(g) = P_W(f,B_y0).
This is P int_th, proved using finite-measure restrictions of Haar measures, continuity of phi(h) conjugate(theta(g,h)), and rational invariance on both variables to bound that product globally (P 27–42, C bdd₂). Dividing by V is valid. Hence
  T(R_y0) = constant 0,
  T(B_y0) = constant n/V.
This is P's key equality; it holds uniformly for every s,t in C, not just the two selected combinations.

P 97–101: CoefLine applies to the SAME lambda from the residual Gram identity and the polynomial witness Phi'. Therefore
  0 = P_V'(T(R_y0),T(R_y0))
    = lambda P_V'(T(B_y0),T(B_y0))
    = lambda V |n/V|^2 = lambda n^2/V.
Since n>0 and V>0, lambda=0, even though lambda was initially complex. This is the decisive nonzero scalar factor. No approximation or division by an unproved theta value.

P 102–109: for arbitrary y in Y, P_W(R_y,R_y)=0 by the uniform Gram identity and lambda=0. By Cpt.eq_zero, continuity and rational invariance this implies R_y=0 as a function, not only a.e. (integral of |R|^2 is zero, invariant null set extends from fundamental domain to group, then continuity plus full-support Haar measure). Thus A_y=c B_y pointwise for every matching pair. Finally choose the UNPRIMED nonzero witness Phi0 from NonZeroAn, with its permitted match via m1. If c=0, A_Phi0 is identically zero by the established equality, contradicting its witness. Hence c != 0, proving PolZero.

## 3. Source-level dependency and trust boundary
CloseSph calls W polynomial_vanishing_of_compactness. W first constructs anisotropic Siegel-Weil and compactness data, then calls P with hermLine_of', coefLine_of, thConst_of' and the remaining six inputs. H explicitly delegates to hermLine_of hC cptOpen polRank hS hJ hF hN hW hB hI hM. L explicitly requires SWFull, BoxSec, DblW, HgtEx, HgtInt, Stab2Cpt, CptAll, PairsStable, MatchEx, ThetaBasic, ICont and PolSch. W's thConst_of' input uses locDist, goodNe, PositivityTheory.SA.constOfGood p5, Factor, MatchEx, ThetaBasic, KDecay, GrpTop, EpsOf, FinVolU, Unimod. W's p0=SiegelWeilStd, p2=EisBL, p5=GlobalTheory.Published.HeckeLEntireAndNonzeroAtOne remain explicit obligations. Do not infer that Published names identify independently verified theorems. This run reconstructs the actual source proof of P, not merely a theorem-shaped declaration or hypothetical alternate proof; the analytic suppliers of HermLine, CoefLine and ThConst remain to be reconstructed. In particular the proof of RUN3 lInt2 is not resolved by this argument.

Negative controls: in C^2 with B=(1,0), A=(0,1), residual R=A is orthogonal to B and nonzero. For one pair the two HermLine identities alone hold with c=0, lambda=1. It violates CoefLine with a constant nonzero backward lift of B. Dropping ThConst is not harmless either: on a two-point unit-measure-per-point domain, a backward lift (1,-1) has zero integral but nonzero norm; Fubini does not imply zero function without constancy. If the primed witness is zero, the factor n^2/V cannot detect lambda; if the unprimed witness is zero, proportionality may hold with c=0. These are finite diagnostic models for individual implications, not counterexamples to the full geometric theorem.

## 4. Executed checks and reproducibility
Refetched eight pinned blobs and checked all 39 literal anchors below using V8 (8/8 SHA matches and 39/39 anchor matches). Executed 25,920 exact Gaussian-integer test cases (two-dimensional B nonzero, c,t in {-1,0,1}+i{-1,0,1}, V=1..4). Residual R=t*(-conj(B2),conj(B1)). Computed cross-inner-product and orthogonality; Gram scalar lambda=||R||^2/n. Clearing positive V, the CoefLine condition becomes 0=||R||^2*n. Exactly 2,880 cases compatible, all proportional; 23,040 nonzero residuals rejected; 320 compatible cases have zero c and must be excluded by the separate left witness. Finite model checks support the algebra only. No Lean kernel execution, no proof of upstream analytic inputs, no URT acceleration claim.

Replay from pinned upstream checkout (Python 3; source hash replay included, not executed locally):
~~~python
from pathlib import Path
import hashlib
T="src/Development/WeilBound/ThetaLifts/"
A="src/Development/AbelianVarietyTheory/"
ledger=[
(T+"LatticeBasics/PolZero.lean","1c4df9613cd7ab9604ec9aca188ccaa1685df842",["theorem polZero_of","theorem swap_bdd","theorem int_th","have orth :","obtain ⟨lam, hl⟩","have key :","have n0 :","have l0 : lam = 0","have main : PolConst","refine ⟨c, fun c0 => q2"]),
(T+"LatticeBasics/PairsStable.lean","15cdb3b0663f439d9ce45052db1299255f4196c9",["def pet ","def th ","def pairs ","def comb ","def ThConst","def HermLine","def CoefLine","∀ s t s' t', ∃ lam"]),
(T+"LatticeBasics/FdEqZero.lean","5a71acf351e947b2bef53cba29a0166d2bfce192",["def CptAll","theorem Cpt.bdd ","theorem Cpt.bdd₂","theorem Cpt.rapid","theorem Cpt.vol_ne","theorem Cpt.eq_zero","theorem fd_eq_zero","integral_eq_zero_iff_of_nonneg"]),
(A+"Definitions/Divisors/CTSmallCone.lean","59578c7a38cc131fdab95da5541523c42a5b159e",["def PolConst","def MatchEx","def NonZeroAn","def PolZero","G.p = 0 → G.q = 0 → ∃ c"]),
(T+"Reductions/TopPolarZero/PolZero.lean","53e3dd1eecd90129f30180a66820109d0c8b54be",["theorem _root_.PositivityTheory.ThKR.polynomial_vanishing_of_compactness","polZero_of hc (hermLine_of'","(coefLine_of","(thConst_of'"]),
(T+"LatticeBasics/HermCpt.lean","24ccc3389ccf5d1d062d587f14ec4d3f4775b508",["theorem hermLine_of'","hermLine_of hC cptOpen polRank"]),
(T+"LatticeBasics/CoefLine.lean","aef065b49dd25f8c44f8a84762661e4c2e1682b5",["theorem coefLine_of"]),
(T+"LatticeBasics/ThConst.lean","f28b691ef966c0a961bcafa3df32b74a89fdeebf",["theorem thConst_of"])
]
count=0
for path,sha,anchors in ledger:
    b=Path(path).read_bytes()
    assert hashlib.sha1(b"blob "+str(len(b)).encode()+b"\0"+b).hexdigest()==sha,path
    s=b.decode()
    for a in anchors:
        assert a in s,(path,a)
        count+=1
assert count==39
from itertools import product
def add(u,v): return u[0]+v[0],u[1]+v[1]
def neg(u): return -u[0],-u[1]
def conj(u): return u[0],-u[1]
def mul(u,v): return u[0]*v[0]-u[1]*v[1],u[0]*v[1]+u[1]*v[0]
def ip(u,v): return add(mul(u[0],conj(v[0])),mul(u[1],conj(v[1])))
def norm(u): return ip(u,u)[0]
Z=(0,0)
C=list(product(range(-1,2),repeat=2))
total=good=blocked=zero_scalar=0
for b1,b2 in product(C,repeat=2):
    B=(b1,b2)
    n=norm(B)
    if not n: continue
    for c,t in product(C,repeat=2):
        R=(mul(t,neg(conj(b2))),mul(t,conj(b1)))
        A=tuple(add(mul(c,b),r) for b,r in zip(B,R))
        assert ip(A,B)==mul(c,(n,0))
        assert ip(R,B)==Z
        r=norm(R)
        for V in range(1,5):
            compatible=(r*n==0)
            assert compatible==(t==Z)
            if compatible:
                assert A==tuple(mul(c,b) for b in B)
                good+=1
                if c==Z: zero_scalar+=1
                else: assert norm(A)>0
            else: blocked+=1
            total+=1
assert (total,good,blocked,zero_scalar)==(25920,2880,23040,320)
print("anchors",count,"cases",total,"compatible",good,"rejected",blocked,"zero scalar",zero_scalar)
~~~

RESUME HERE: expand L coefLine_of, beginning at its exact proof in LatticeBasics/CoefLine.lean and the ContinuousFlat imports. Identify exactly why the SAME Gram coefficient lambda transfers through the doubling integral to the primed backward theta norm, including the SWFull assumptions, all Fubini/measure/scalar normalizations, and where nonzero factors allow cancellation. This is the next indispensable mathematical input exposed by P. In parallel request actual lInt2 source from dependency lane when authenticated export arrives. Do not repeat RUN3 Gamma guard or RUN4 orthogonality.
HANDOFF TO: proof editor, integration, formal audit, theta, literature. Replace base proportionality assembly by this actual source-matched argument; leave nine hypotheses' producer proofs open as appropriate. No physics queue or gate changed.
