# Normalized size-budget proof — exact square-root exponent
Status: SOURCE-MATCHED derivation; independent BigInt regression on constructed boundary cases, not real host existence or kernel verification.
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005.

Sources (paths relative to src/Formalism/SizeWindowBrackets/):
GrowthBoundGivesRiemannHypothesis.lean (a3ece4b4aea97a95ba2977fa9e8d437e72677774): SizeWindows, GrowthSizeBound.
SChain.lean (a4bc8cecac40a1f5fd307661e151639aaf6a6efa): RestSize, SizeWindowsSplit.
ErrorFormsWeakWindowsFalse.lean (1d1d179d111b5aa668893327264648558f30fdb6): errorBracketSizeWindows.
ChainSlopeWindows/LipschitzWeightAndMinimum.lean (4012be2d32b5475bb420d1cd8da4aa1ebb4c6e6b): proposition_size_bound.

## 1. Exact premises
x>=3, eps>0, C>=0, n>0, b>0, 0<=aE<=2xb, nT>=n*x^(-eps/8)/2, x^(-eps)<=nT2/n<=1,
x^(1/2-eps)<=m<=x^(1/2+eps/2),
xm<=k<=n^2*x^(1/2-eps),
26<=x^(3eps/8). Counts n,nT,nT2,m natural. All denominators below positive by these hypotheses.
Err<=x^(C eps)*B, where
B=nT*aE*(1+m^2/k)+m*(2*n*m*b*x^eps+nT2*k*b*x^eps/(n^2*x^(-eps))).
The subgroup argument supplies Q*delta/2*(Gx-4X)<=Err+2Q/x, where Q=nT*m*b, delta=nT2/n, X=x^(1/2+eps).

## 2. Human simplification: normalize before expanding
Divide the four terms of B by Q. In order:
1. aE/(mb)<=2x/m<=2x^(1/2+eps).
2. aE*m/(kb)<=2xm/k<=2.
3. 2nm*x^eps/nT<=4m*x^(9eps/8)<=4x^(1/2+13eps/8).
4. nT2*k*x^(2eps)/(n^2*nT)<=2k*x^(17eps/8)/n^2<=2x^(1/2+9eps/8).
All four are bounded by their constants times Y=x^(1/2+13eps/8)>=1, giving B/Q<=10Y. These reproduce the source's SZ.T1--T4 with a single common normalization.
With P=x^(C eps)>=1, the input inequality yields delta*(Gx-4X)<=20PY+4/x<=22PY (x>=3, PY>=1).
If Gx-4X<=0 the next upper bound is immediate. Otherwise use delta>=x^(-eps)>0 to get Gx-4X<=22PY*x^eps. Hence
Gx <= 4X+22x^(1/2+(C+21/8)eps)
   <=26x^(1/2+(C+21/8)eps)
   <=x^(1/2+(C+3)eps).
This retains the source constants and hypotheses, while exposing the actual mechanism: the inverse row count x/m, the direct row count m, and the scaled k/n^2 are all controlled at square-root order. The 13/8 loss comes from the third term, 1 from thick-set density, and 3/8 from absorption of 26. No novel RH proof or URT advantage asserted.

## 3. Executed independent regression (JS BigInt in tool isolate)
120 exact boundary-combination cases passed. For q in {2,3,8,53,100}, set eps=1/q, x=26^(8q), n=2x, nT=n/52, b=3, aE=2xb. Choose m at either endpoint, nT2 at either endpoint, k at either endpoint, C in {0,2,3}. All powers used have integral exponents in base 26. Evaluate the four terms and total as rational numerators with common denominator k*n^2; compare by integer cross multiplication. Also take Err=x^(C eps)*B and the maximum Gx permitted by the input inequality, verifying final bound exactly. These are constructed size-budget fixtures only, not native geometric data. Reproduction:
```js
let count=0;
for(const q of [2,3,8,53,100]){
 const p=i=>26n**BigInt(i), x=p(8*q), n=2n*x,nT=n/52n,b=3n,a=2n*x*b;
 const lo=p(4*q-8),hi=p(4*q+4),Y=p(4*q+13),X=p(4*q+8);
 for(const m of [lo,hi])for(const nT2 of [n/p(8),n])for(const k of [x*m,n*n*lo])for(const C of [0,2,3]){
  if(k<x*m)continue;
  const Q=nT*m*b,P=p(8*C),den=k*n*n;
  const ts=[nT*a*den,nT*a*m*m*n*n,m*2n*n*m*b*p(8)*den,m*nT2*k*b*p(16)*k];
  const cap=[2n,2n,4n,2n];
  if(ts.some((v,i)=>v>cap[i]*Y*Q*den))throw Error("term");
  const errNum=P*ts.reduce((a,b)=>a+b,0n);
  if(errNum>10n*P*Y*Q*den)throw Error("sum");
  const Gden=Q*nT2*den*x,Gnum=4n*X*Gden+2n*n*(errNum*x+2n*Q*den);
  if(Gnum>p(4*q+8*(C+3))*Gden)throw Error("final");
  count++;
 }
}
if(count!==120)throw Error("count");
```

## 4. Origin of the geometric size conditions — next frontier, not solved here
Formalism/SharpRestriction/GlobalSchurBounds/TieGlobal.lean (00acf811793877fe42d18c0d69f2d5833f75bf94) explicitly includes RestSize and ErrWindows in ChainTied; TiePts identifies m with the native rank R.m. These are not yet independently derived geometric conditions in this reconstruction.
Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/LinkGl.lean (31359d438c3bb3c5050f9cab94dba28c5b64c72a) obtains LinkGLOBAL through famGLmin_of_realPlaceSecondLayer and link8, with constants 2,3,2,0. This is the exact upstream call to investigate next, using imports Formalism/SharpRestriction/GlobalSchurBounds/TuSizeOfRealPlaceSecondLayer.lean and LogXLowerFamilyOfTheorems.lean.
RESUME HERE: locate link8 producer and native ranks/scales construction (FamCore imports DFam); show how m, k and group sizes satisfy the exact window conditions for every sufficiently small eps. Do not substitute the model fixture in PChain for actual geometry. Continue separately toward theta-integral adapter. No whole-export processing or local Lean check this session.
HANDOFF TO: positivity geometry, character boxes, human proof editor.
