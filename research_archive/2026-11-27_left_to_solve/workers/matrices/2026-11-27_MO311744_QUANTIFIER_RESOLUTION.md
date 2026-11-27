# MO311744 quantifier resolution and Lean repair — 27 November 2026, matrix lane

Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). Original question: Ludwig, 30 September 2018, edited 2 October 2018, CC BY-SA, https://mathoverflow.net/questions/311744/on-a-matrix-inequality-based-on-the-schur-horn-theorem . This checkpoint is not a priority claim or an official acceptance.

## Reconciliation

Read latest CAMPAIGN_LEDGER.md (16:24 reconciliation), AGENTS.md, previous matrix lane checkpoint (source, witness, earlier audits), official upstream tools/oma.sh and lib/join.ts. Direct join.txt and /p/mo-311744/agent.txt and /api/problems/mo-311744 were inaccessible via web; sandbox curl DNS failed and no local Lean executable. Recovered exact previously successful API workflow from 81246d8f16112b64b3976e422ed95d99c54bb4dc (.github/workflows/reversal-note.yml; run 46008655704). It mutates A401895's lease/note, so did not rerun or repurpose it blindly. No claim, note, lease, or PR taken. Existing authorized verifier workflow .github/workflows/campaign-verify.yml was recovered verbatim before using it; it checks changed probes only and its success flag does not signify successful Lean elaboration.

Fresh actual upstream metadata: all full-proof PRs 7724, 7815, 7817 and statement PRs 7223, 7625, 7865, 7930, 7931, 7933, 8568, 8569, 8442 are open and merged=false. Full-proof PRs have no verdict comments yet. The ledger reports 12 complete pinned candidates (including MO198816, A124869, A124870) subject to novelty/source audit; 3 submitted kernel accepted. 0/20 confirmed public credited full proofs. Actual merge permission errors persist on MO290383 and MO466218:
- https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7223#issuecomment-7222601666
- https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7625#issuecomment-7222787927
No duplicated interactive claims. All-state explicit is:pr search for 311744 in the official repo returned no results; not proof of eligibility or novelty.

## Actual Lean failure and repaired candidate

Pinned probe run 46029264211 job 140608577477 had green workflow but Lean errors. W depends on noncomputable real division; vector notation left residual vecCons terms at literal index 2 in 27 diagonalization goals and the two qform goals. Printed axiom list included sorryAx. NOT VERIFIED.

Repaired candidate uses a noncomputable section, explicit Fin 3 entry functions with if-branches, and the exact same real universal fixed-basis claim, matrices and quadratic witnesses. No weakened target. Committed separate probe so failed artifact remains intact:
https://github.com/con123-gif/open-math-agents/blob/dfe68a792d0d8ff2ebf735a8e1ec2765176cb828/campaign/ProbeMatrixLane311744Repair.lean
Actual workflow 46036906147 in progress at read; no success claimed. Expected pins FC 9097e2f90e66d2f6244209cb1c07f7120d17ec53, Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. Inspect actual probe output and artifact exit status.

## Mathematical result: BOTH quantifier readings distinguished

Original source full rendered page again inspected (no answers/comments at retrieval). It says that an admissible orthogonal T exists, then asks about scaling given that T. The earlier exact witness A=[[20,0,8],[0,28,8],[-3,-15,0]] with spectrum 8,16,24 and T=I refutes universal fixed-basis scaling. It does not refute the existential choice of T and r. We now prove that the existential-choice version is ALWAYS TRUE, even under the weaker positive-stability premise (real A, eigenvalues with positive real parts). The basis is chosen simultaneously with the scaling; r is the number of positive entries produced, not a prescribed arbitrary r. This is known-result mathematics via the literature below, and must NOT be presented as a genuinely new open-problem solution.

The decisive equivalent certificate is D >= I, Q=AD+DA^T >= 0, (D-I)Q=0. Choose an orthogonal common eigenbasis of D and Q. Put the positive Q-eigenvalues first. On their support D is the identity. For B=T^T A T and diagonal D'=T^T D T, Q'=B D'+D' B^T. Thus B_ii=Q'_ii/(2D'_ii)>0 on the first r coordinates and B_ii=0 elsewhere. For distinct leading coordinates B_ij+B_ji=0. Hence the leading symmetric block is positive diagonal, the trailing symmetric diagonal vanishes, and the trace sum is exactly tr(A). All original existential requirements are met with delta=1. D' is actually strictly positive throughout.

### Prior literature establishes this existence

Gowda and Song, On semidefinite linear complementarity problems, Mathematical Programming 88 (2000), 575–587, DOI https://doi.org/10.1007/PL00011387 . Their Q-property for the Lyapunov transformation L_A(X)=AX+XA^T holds for positive stable A. Apply it to constant matrix L_A(I): obtain X>=0, Q=L_A(X)+L_A(I)>=0, XQ=0. Set D=I+X. Immediate certificate above. The 2002 sequel, https://doi.org/10.1137/S0895479800377927 , independently confirms the Q-property for compositions (including a single positive stable Lyapunov transformation). Abstract and accessible theorem excerpt checked. TrureTuring research landing and targeted searches checked; no matching result identified, not exhaustive. This pre-2018 general complementarity theorem settles the freely chosen basis reading regardless of exact-title search hits.

### Independent self-contained derivation of the needed existence using standard Brouwer

Let n>=1 and K={Q real symmetric PSD, tr Q=1}. K is compact convex in the Euclidean space of symmetric matrices with trace inner product. Define T(Q)=integral_0^infty exp(-tA) Q exp(-tA^T) dt. Exponential decay follows from positive stability (Jordan form); for the exact source diagonalizable real spectrum, this is immediate from A=V diag(lambda) V^-1. T is a continuous linear map; T(Q) is symmetric PSD by integration of nonnegative quadratic forms. Differentiating and integrating the decaying integrand gives A T(Q)+T(Q) A^T=Q.

The metric projection P_K exists uniquely and is continuous (indeed nonexpansive by the two variational inequalities for nearest points). The continuous self-map Q -> P_K(Q-T(Q)) has a fixed point by Brouwer. Write D=T(Q) at this point. Projection optimality along the segment to every R in K gives tr(D(R-Q))>=0. In detail, the squared distance from Q-D to Q+t(R-Q) has derivative at t=0 equal to 2 tr(D(R-Q)), nonnegative. Thus Q minimizes R -> tr(DR) on K, whose minimum is delta=lambda_min(D). Since D>=0, delta>=0; tr((D-delta I)Q)=0. For PSD matrices trace product zero implies product zero: tr(Q^(1/2)(D-delta I)Q^(1/2))=0; PSD and trace zero imply that matrix vanishes, then (D-delta I)^(1/2) Q^(1/2)=0 by its squared Frobenius norm. Therefore DQ=QD=delta Q.

Strict positivity: using cyclic trace and the Lyapunov equation,
tr(Q^2)=tr(Q(AD+DA^T))=delta tr(Q(A+A^T)).
If delta=0 the left-hand side is zero, impossible because Q PSD and tr Q=1. Hence delta>0 and D/delta>=I. Rescale Q by the same positive delta to obtain the certificate in the previous section. This proof does not require a strict spectral gap for D, rank assumptions on Q, positivity of A+A^T or a symmetric Lyapunov operator. In n=1 or A+A^T PSD cases an even simpler choice D=I is available. For n=0 original strict positive leading block is not meaningful, and only n>=1 is asserted. No Lean formalization of Brouwer or the general argument yet; do not count this as a second problem or as a novel result.

### Independent exact challenge: original witness DOES admit a different T

Let p(k)=64k²-163k+64, k=(163-sqrt(10185))/128 in (0,1) by p(0)=64 and p(1)=-35. Set x=(3-8k)/(20(1+k)), y=(15-8k)/(28(1+k)), v=(x,y,1). Direct expansion gives (A^T+kA)v=0 and v^T A v=0. Put D=I+(k-1)vv^T/(v^Tv). Its eigenvalues on v-perp are 1, and on v are k>0. Q=AD+DA^T satisfies Qv=0. For w perpendicular v, w^TQw=2w^T A_s w. As |x|<=1/4, |y|<=15/28, x²+y²<=137/392<1 and w3=-xw1-yw2, so |w3|<=sqrt(w1²+w2²). Then
w^T A_s w =20w1²+28w2²+(5w1-7w2)w3 >= (20-sqrt(74))(w1²+w2²)>0 for nonzero w. Orthogonally diagonalize this positive compression on v-perp to obtain an admissible T with r=2, delta=1 and trailing diagonal scaling k. (This explicit D uses a trailing weight <1, which is allowed; it need not be the D>=I obtained in the general proof.) Thus using the earlier counterexample against the freely chosen basis would be wrong.

Executed symbolic certificate (Python/SymPy):
```python
import sympy as s
k=s.symbols('k'); p=64*k*k-163*k+64
A=s.Matrix([[20,0,8],[0,28,8],[-3,-15,0]])
x=(3-8*k)/(20*(1+k)); y=(15-8*k)/(28*(1+k)); v=s.Matrix([x,y,1])
def mod(f):
    a,b=s.fraction(s.factor(f))
    return s.rem(a,p,k)
assert all(mod(f)==0 for f in (A.T+k*A)*v)
assert mod((v.T*A*v)[0])==0
D=s.eye(3)+(k-1)*(v*v.T)/(v.dot(v)); Q=A*D+D*A.T
assert all(mod(f)==0 for f in Q*v)
print(p.subs(k,0),p.subs(k,1),s.factor((A.T+k*A).det()))
print(s.Rational(1,4)**2+s.Rational(15,28)**2)
```
Actual output 64, -35, 48*(k + 1)*(64*k**2 - 163*k + 64); 137/392. All remainder assertions passed. Denominators nonzero on k in (0,1) since 1+k>0 and v^Tv>=1.

## RESUME HERE

Single next action: read actual repaired probe run 46036906147 logs and exit artifact; if successful, inspect official exact live brief before any statement registration. The fixed-given-T version is false, freely chosen-T version true by prior published general theorem. Do not assert novelty or claim if brief does not disambiguate. If eligibility is blocked or existential, move to a distinct matrix target; do not duplicate current MO198816/MO290383/MO466218 team work. No RH changes, no schedule changes.
