# RUN55 — exact glued-lattice normalization and comparison-form transport

26 November 2026. HUMAN SOURCE-MATCHED / PARTIAL. Compact pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207/grh-compact,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.

Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb, manuscript
906ceff9f072a53c1966a5b7631676b413bf1bb1; SWARM_PROTOCOL 4b77b161e
(full SHA 4b77b161d6876915c15cea5a4d4a519beaf5de74), AGENTS,
research state, continuity, protocol, handoff and latest CI summary checked.
Previous own RUN54 8db7b5c82475ed238b16bea8aed5c7e5a26c5621.
Peer a6e9cc7f (B thick class), 15ea3969 (C rows), a3276066 (convolution),
575d0d31 (A transfer), 1a365375 (partial native receipt), 837dd3d8
(crystalline). Peer RUN51 rank-one Fourier extraction and multiplicative
factorisation already covers the normalized rank-one character sum:
do not duplicate it. Move to the actual comparison supplier as permitted
by the prior RESUME HERE and primitive-closure mission. Search for
exists_isGlued in working repo returned no results (not exhaustive).
No changes to shared manuscript, workflows, registry or physical gates.

## Exact source anchors (grh-compact/src)

* New/Rows/StackedDeterminants.lean daff82b60b82df78d82e94c9e1a4f5d0fb0673d4:
  DividedSplitting, AuxPair.genIdele, genResidue, genResidue_smul_eq_iff.
* New/Rows/GluedFormTheta.lean c5f883f964a7a968320874ac8edad52a14678c3e:
  DividedLattice.reduceAt_conj_eq_one, exists_reducedInverse_eq,
  rowFixingLevel_le_levelOf, reduceAt_liftMod_congruenceGroup,
  DividedSplitting.exists_congruenceGroup_inv_eq_one_sub,
  exists_isGlued, theta_pointForm, theta_productForm,
  theta_stdClassSum_productForm.
* New/Rows/ComparisonForms.lean 14ef893c54f5db837ea7e4f143b2b1a444b89b5a:
  splittingV, classAut_rowFixingLevel_eq_bot, glueLattice,
  inner_adjoint_comparisonForm, exists_comparison_forms.
* New/Rows/Separation.lean cbd60ebb20b771dc6107f3d54df0397ee7707e4d:
  cosetKernelSum_eq_fNatural, eq_zero_of_integral_fNatural_tableTheta.
* New/Rows/MemberOrthogonality.lean aca8828d477a4510ab80964e1572f34ef220a2c1:
  DividedSplitting.stdClassSum_inner_productForm_eq_zero (prior period work).
  Downstream comparison family feeds the existing lift volume C chain.
  These are source-observed dependencies, not a new elaborated DAG.

## 1. Construct the SAME integral divided lattice

Write M for the product of chosen places, disjoint from its conjugate,
t for the native generator idele (1 off M), and R=O_E/M^2 for the
finite residue ring. In R, t^2=0 and Ann(t)=tR by local uniformizer
valuation and CRT. The statement applies also to product rings, not
just fields. Use the native splitting N plus m, embeddings E=iota_fixed
and Z=z as their inclusion matrices. Thus the actual O.incl is (0,Z)^T,
Z^T Z=I_r. Let s be a prescribed a-by-N matrix and S=[s;tI_N].
Lift s integrally to the finite adeles. The native Hermite theorem on
[s;tI_N] yields square D and C0 with C0 D=t I_N and mutual row-span
containment between D and S. Keep this Hermite existence theorem as
the supplier; we do not infer it from finite regression tests. In
particular DX=DY iff SX=SY, also after reduction.

Put P=ZZ^T, H=tP+I-P, J=P+t(I-P). Construct the two native matrices

 G = [[D,-DEZ^T],[0,H]],  C = [[C0,EZ^T],[0,J]].

Because HJ=JH=tI_m, Z^T H=tZ^T and C0D=tI_N,
multiplication BEFORE reduction gives exactly CG=tI_(N+m); the
off-diagonal terms -tEZ^T+tEZ^T cancel. Reindex by the same epsilon.
This is precisely exists_reducedInverse_eq's hypothesis, not an
assumption that G itself is invertible over R. At a chosen place
take gamma=C (invertible over the local FIELD, since t !=0);
at its conjugate take the inverse conjugate adjoint, elsewhere I.
The local choices form the finite adelic unitary element gamma
(the source uses cutGL and star(c)^(-1)c with disjoint supports).
At chosen places t gamma^-1=G integrally, and at their conjugates
gamma^-1 is integral because C is. Elsewhere gamma=I. Thus L is a
DividedLattice and its reduced inverse is G. Since chosen places
and generator do not depend on the twist, the same construction
at twist 1 transports to every twist, as in glueLattice; do not
choose an unrelated L for each theta.

## 2. Collapse the actual gluing indicator to ONE forced witness

Write x=(A,B)^T in the same split rows. The condition Gx=t(0,Z)^T
is exactly

 D(A-EZ^T B)=0,       H B=tZ.                                  (1)

The second equation forces (I-P)B=0 and t(T-I_r)=0 with T=Z^T B,
hence T=I+Q, Q in M_r(tR). Since Q^2=0, T is invertible and the
unique possible normalization is

                  Y=T^-1=I-Q=2I-T.                             (2)

It lies in the native congruenceGroup Gamma={Y: tY=tI}.
Now B Y=Z, and multiplying the first equation in (1) by Y gives
D(AY-E)=0, equivalent by the Hermite row-span condition to
S AY=S E. Conversely if these block conditions hold for some
Y in Gamma, B=Z Y^-1, tY^-1=tI, hence HB=tZ; multiplying back
gives D(A-EZ^TB)=0. The normalization is unique since
Z^T B Y=I. Thus for ANY scalar c,

  1_(Gx=t inc)c = sum_(Y in Gamma) 1_(BY=Z, S AY=S E)c.          (3)

This is the exact IsGlued.indicator_eq_sum, including the rejected
inputs: if (1) fails there is no summand. It is NOT a Fourier
approximation, nor a replacement of Gamma by all GL_r(R).
Equation (2) removes an actual existential search in this algebraic
subargument, not the later sum over genuinely different theta translates.

For the second IsGlued field, reduce D modulo M. Its row span is
that of s because tI becomes 0. Each residue FIELD component has
rank <= a. Choose a basis of its kernel occupying the N-a columns
off dividedEmb and extend to a basis (extra kernel columns permitted).
Lift the resulting invertible matrices to each local square quotient:
a determinant nonzero mod its maximal ideal is a unit. CRT combines
the lifts to one K in GL_N(R). Then tDK has zero columns off
dividedEmb; the lower-left block of G is zero, hence exactly
t(G[:,N] K) has zero columns there, as required. Do not infer
a single rank over the product ring or a common pivot in all factors.
This supplies both native fields of exists_isGlued.

## 3. Exact level transport and the theta product at its actual caller

If j is integral unitary and j-I divisible by M^2 at chosen
places, then j-I is also divisible by the conjugate square at the
conjugate places: j^-1-I=-j^-1(j-I), and apply the unitary star
identity. Expand

 gamma^-1 j gamma-I=gamma^-1(j-I)gamma.

At each chosen place gamma is integral and gamma^-1 has at most
one uniformizer in its denominator. At each conjugate place the
roles reverse, with the same square divisibility. Hence the difference
is integral everywhere, and divisible by the local uniformizer at
the chosen places. This gives reduceAt_conj_eq_one, not an invalid
assumption that gamma is integral everywhere. The row-fixing level
itself fixes the lower tI block of S; t(k-I)=0 in R implies k=I
mod M. Likewise liftMod Y is principal at every chosen place
for Y in Gamma. The classAut triviality at the actual rank bound
comes from ComparisonForms.classAut_rowFixingLevel_eq_bot, retained.

In theta_pointForm the finite support of the SAME gamma at chosen
places yields the scalar beta_L=spaceChar(detOn gamma)/sqrt(|detOn
gamma|)^r, and the transformed finite datum is the Gx=t inc
indicator times the Q-place determinant character. This uses the
native pairWeil_integrated_fin and pairWeil_name_on identities;
retain these and the exact O.auxPair weight and level hypotheses.
Insert (3) BEFORE taking any absolute values. On the chosen-place
block the datum is now the product of the row-fixing indicator
and the small inclusion indicator. Each Y is lifted at the chosen
places only, so it is identity at the twist places; the Q determinant
character is unchanged. The native modDatum_factor and modKernelI_block
and the low-column Cartan product identity (V.low) split the polynomial
and theta kernel exactly, with b*b'=O.b. Writing K_N, K_m for the
two native kernels with precisely those respective data gives

 theta(productForm_L(h,h',y,eta))(g)
 = conjugate(beta_L * sum_(Y in Gamma)
       K_N(g lift(Y),h,conj y) K_m(g lift(Y),h',conj eta)).

This is theta_productForm in source notation; the polynomial on N
is the positive letter polynomial and on m the negative one.
No omission of conjugation or of the scalar beta_L. Its class-sum
version follows by finite linearity: for the vector y(h) and input
star(c*y(h)), the N class sum is the native cosetKernelSum,
leaving conjugate(beta_L c) outside. The genuine Y sum remains.
The analytic theta/Weil kernel identities here are used as explicit
native suppliers, not proved from the finite matrix calculation.

## 4. Same witness at the comparison adjoint, exact cardinal factor

At ComparisonForms.inner_adjoint_comparisonForm, fix a good F and
a table zeta. With each original i and small class c, its comparison
form uses L_i from twist 1, the same nonzero lineScale beta1,
and gProd^loss. Expand the preceding theta class sum and take
the inner product by the native adjoint/inner_auxLift identity.
Since F has the chosen principal level, right translation by each
lift(Y) fixes F; invariant quotient measure and the integrability
of the products (native mul_fNatural_mem_rapidOfLevel_and_hol and
mul_modKernel_mem_rapidOfLevel) justify changing variable
g to g lift(Y) separately in each finite summand. This removes
Y from the integral but retains its exact multiplicity |Gamma|.
It does NOT justify removing the Y sum at pointwise g. Substitute
fNatural_i=kappa_theta*cosetKernelSum_i from Separation, and sum
over the small classes using the original tableTheta. The result is

 conj(kappa_theta)<F,u_theta* gl_theta zeta>
 = |Gamma| gProd^loss conj(beta1)
      sum_i conj(beta_(L_i)) integral conj(F fNatural_i) tableTheta_i(zeta).

The right-hand side has NO twist dependence: all L_i, beta1, Gamma,
loss and the tableTheta are those at twist 1. The native
eq_zero_of_integral_fNatural_tableTheta plus nonzero row dimension
forces kappa_theta !=0 (if zero every fNatural_i would vanish and
all good forms would be zero). Nondegeneracy of the inner product
then gives u_theta* gl_theta=conj(kappa_1/kappa_theta) A,
A=u_1* gl_1, and the exact squared scalar ratio is the native
Hecke value product ratio because |kappa_theta|^2=C/HeckeProd_theta.
To see A is surjective, take F orthogonal to its range, choose
tables supported at one i with arbitrary small-class components,
cancel the nonzero scalar and beta_(L_i) in the displayed identity,
and apply separation. This recovers the actual common A, not
one surjection per twist. Retain the other comparison hypotheses:
comparisonForm_mem_integralForms, normSqAt_comparisonForm_le,
tableTheta_adjoint_eq_zero and their source local Cartan/period
suppliers. No claim that the full comparison theorem or C is closed.

## 5. URT controlled search comparison and reproducible exact regression

A fixed priority on Gamma cannot improve the mean search rank on
all accepted x for fixed s: the free right action x -> xU for
U in Gamma preserves Gx=t inc (because tU=tI), and the forced
normalizer changes to U^-1 Y. Every orbit has exactly one of each
normalizer. Thus for any fixed ordering the mean successful
position is (|Gamma|+1)/2; this includes the pi/e golden-angle
ordering. The original scale/phase was used only to order candidate
indices by projected spiral coordinate, no validity assumption.
Equation (2) bypasses search altogether with entrywise subtraction
once T is extracted. Not an O(N) proof-search or runtime claim.
The standard exact normalization is retained. No benchmark of Lean.

The finite regressions below check the actual algebraic reduction
on R=Z/p^2, r=1,2, N=m=2, a=1. For r=1 all s, and for r=2
four specified s. D constructed by a local unit pivot (or pI).
They do not substitute for adelic Hermite, theta, rank or height
theorems. The rank sums count only successful candidates, not
wall time or all matrix verification operations.

Executed twice in JavaScript tool sandbox (identical logic);
output: {"indicators":797681,"witnesses":1611,"rowspans":101,"columnClears":101,"factorChecks":101,"plainRank":7342,"harmonicRank":7342,"directSelections":1611,"neg":3}.

```javascript
function regression(){
 const mod=(x,q)=>((x%q)+q)%q, check=(a,m)=>{if(!a)throw Error(m)};
 const mats=(n,q)=>Array.from({length:q**n},(_,k)=>Array.from({length:n},(_,i)=>Math.floor(k/q**i)%q));
 const mul=(A,B,n,m,r,q)=>Array.from({length:n*r},(_,z)=>{let i=Math.floor(z/r),j=z%r,v=0;for(let k=0;k<m;k++)v+=A[i*m+k]*B[k*r+j];return mod(v,q)});
 const eq=(A,B)=>A.every((x,i)=>x===B[i]), eye=r=>Array.from({length:r*r},(_,z)=>+(Math.floor(z/r)===z%r));
 const sub=(A,B,q)=>A.map((x,i)=>mod(x-B[i],q)), add=(A,B,q)=>A.map((x,i)=>mod(x+B[i],q));
 let indicators=0, witnesses=0, rowspans=0, columnClears=0, factorChecks=0, plainRank=0, harmonicRank=0, directSelections=0, neg=0;
 for(const [p,r] of [[2,1],[3,1],[2,2]]){
  const q=p*p,N=2,M=2,I=eye(r), zero=Array(N*r).fill(0), Z=Array.from({length:M*r},(_,i)=>+(Math.floor(i/r)===i%r)), E=Z.slice();
  const congr=mats(r*r,p).map(A=>add(I,A.map(x=>p*x),q));
  const phi=(1+Math.sqrt(5))/2, scale=Math.PI/Math.E;
  const harmonic=congr.map((_,i)=>i).sort((i,j)=>scale**j*Math.cos(2*Math.PI*j/phi**2)-scale**i*Math.cos(2*Math.PI*i/phi**2));
  const ranks=new Map(harmonic.map((i,j)=>[i,j+1]));
  const AA=mats(N*r,q), BB=mats(M*r,q);
  const binfo=BB.map(B=>{
   const T=B.slice(0,r*r), Y=sub(I,sub(T,I,q),q);
   const hits=congr.map((K,i)=>eq(mul(B,K,M,r,r,q),Z)?i:-1).filter(i=>i>=0);
   check(hits.length<=1,"nonunique B normalization");
   const bottom=B.every((x,i)=>Math.floor(i/r)<r?mod(p*x,q)===p*Z[i]:x===0);
   check(bottom===(hits.length===1),"bottom equivalence");
   if(bottom)check(eq(Y,congr[hits[0]]),"direct inverse");
   return {T,bottom,hits,Y};
  });
  const ss=r===1?mats(2,q):[[0,0],[1,0],[2,1],[2,2]];
  for(const s of ss){
   const pivot=s.findIndex(x=>x%p!==0);
   const D=pivot<0?[p,0,0,p]:[s[0],s[1],pivot===0?0:p,pivot===0?p:0];
   const rows=mats(2,q);
   const ds=new Set(rows.map(u=>mul(u,D,1,2,2,q).join(",")));
   const sr=new Set();for(let x=0;x<q;x++)for(let y=0;y<p;y++)for(let z=0;z<p;z++)sr.add([mod(x*s[0]+p*y,q),mod(x*s[1]+p*z,q)].join(","));
   check(ds.size===sr.size&&[...ds].every(x=>sr.has(x)),"row span");
   rowspans++;
   const C=[...rows.find(u=>eq(mul(u,D,1,2,2,q),[p,0])),...rows.find(u=>eq(mul(u,D,1,2,2,q),[0,p]))];
   check(eq(mul(C,D,2,2,2,q),[p,0,0,p]),"C D=pI");factorChecks++;
   const K=mats(4,p).find(k=>mod(k[0]*k[3]-k[1]*k[2],p)!==0&&mul(D,k,2,2,2,p).filter((_,i)=>i%2===1).every(x=>x===0));
   check(!!K,"column clearing");columnClears++;
   for(const {T,bottom,hits,Y} of binfo)for(const A of AA){
    const left=bottom&&eq(mul(D,sub(A,mul(E,T,N,r,r,q),q),2,2,r,q),zero);
    const right=hits.filter(i=>{const W=sub(mul(A,congr[i],N,r,r,q),E,q);return eq(mul(s,W,1,N,r,q),Array(r).fill(0))&&W.every(x=>mod(p*x,q)===0)});
    check(+left===right.length,"indicator identity");indicators++;
    if(left){check(eq(Y,congr[right[0]]),"same witness");witnesses++;directSelections++;plainRank+=right[0]+1;harmonicRank+=ranks.get(right[0]);}
   }
  }
 }
 check(mod(3*3,8)===1&&mod(2*3,8)!==2,"wrong modulus control");neg++;
 check(mod(2*1,4)===2&&2!==0,"off-Z control");neg++;
 check(!eq([0,1,1,0].map(x=>x%2),eye(2)),"unrestricted GL control");neg++;
 check(plainRank===harmonicRank,"uniform search-rank identity");
 return {indicators,witnesses,rowspans,columnClears,factorChecks,plainRank,harmonicRank,directSelections,neg};
}
console.log(regression());
```

Negative controls: q=p^3 while retaining the larger mod-p group
makes tY=tI fail; omitting off-Z rows incorrectly accepts a B
with nonzero off-Z coordinate; a column swap is invertible but
not in Gamma. These guards are essential for the native identity.

## Verification boundary and next work

Local lean/lake lookup returned no executable. Peer 1a365375
records the partial RUN29 CI 45803534769 (six B/C native theorem
checks, A timeout); none of these check our new caller replacement.
Do not conflate this with a new native closure. Proposed native
audit input for the existing bounded compact environment (unrun):

```lean
import New.Rows.ComparisonForms
#check DividedLattice.exists_reducedInverse_eq
#check DividedLattice.reduceAt_conj_eq_one
#check DividedSplitting.exists_isGlued
#check DividedSplitting.theta_productForm
#check DividedSplitting.theta_stdClassSum_productForm
#print axioms DividedSplitting.exists_isGlued
#print axioms DividedSplitting.theta_stdClassSum_productForm
#print axioms exists_comparison_forms
```

The source-matched proof explains the actual algebraic gluing
supplier with its unchanged interface; no kernel graph pruning
or new axioms inferred. Original and reduced graphs/axiom evidence
retained. The external formal certification is distinct from our
incomplete human reconstruction.

RESUME HERE: integrate §§1–4 at the comparison-family consumer
after independent audit; next reconstruct the actual
comparisonForm_mem_integralForms local Cartan-gauge loss from
New/Rows/CartanIntegrality (keep the same glued K and row labels),
then the separate norm bound. Do not restart rank-one Fourier
selection or polish the endgame. Depth_indicator_jet remains
a separate quantitative CM theta supplier. HANDOFF TO integration,
editor, audit, theta and shared kernel extractor.
