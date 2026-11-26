# B primitive: same-colour middle alignment and integral skew correction
26 Nov 2026. HUMAN SOURCE-MATCHED / PARTIAL at explicitly retained inputs. Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Credit Alpöge, Sernau, Anthropic collaborators and Claude. Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb. Continue integration/2026-11-26_COMPACT_WEIGHTED_PAIR_COUNT.md (6bdfdba6), whose fibre-one supplier was explicitly outstanding.

## 1. Middle alignment
Read New/RealPlace/VolumeKernel.lean fc115f79a99192fc8ea0e72c2caa0bf2546b5cf0, HasLevel.middle_shared_vector_le, col_eq_zero_of_norm_lt_one, HasLevel.exists_frameImage_toRows₂_eq_add. Fix the same S,c,j, labelled near representatives p,p' with common Z=frameProducts. Put n=rho+1, Y=paddedLeading(j,Z), P=xRows Z, d=det Y!=0, g=S.g. In the more general middle alignment theorem choose rows xi=P_q with q containing all indices <j other than top. Set t=g^-1 Y^-1 and x=the difference of the X0-parts of the two frames; their eStar and z rows agree by common Z. The native congruence places each adjoint middle-adele difference column in g colLattice(xi*)+preimageLattice(t*). The native preimage-lattice identification and open-integrality conditions, followed by density of rational matrices in finite adeles, give ONE rational mu with classCoordX0 mu and classCoordX0 L integral, where L=(x-g mu xi)t.

For b>=j the combination frame(gamma)Y^-1 e_b is a shared vector; its X0-part is zero. For b=top<j, Y=Z and ZY^-1 e_b=e_b; NearTerms.norm_sq_middle_part_eq gives 5||X0||_v²<=1 using N>=5. In both cases xi Y^-1 e_b=0. Thus the squared norm of column L_b at every embedding is <=(2/g²)(1/5+1/5)<=4/5<1. The integral positive-definite Gram norm of the column is an algebraic integer (use the integral class-coordinate lattice and native Gram transport); all conjugates have modulus <1, so its rational norm, an integer, is zero. Definiteness gives L_b=0. Therefore L is supported on indices b<j other than top, all in q. On these rows Y equals Z, so LY=L_q xi. Since gLY=x-g mu xi, we have x=g(mu+L_q)xi with the required integral coefficient l=mu+L_q. In BlockBound the row selection q is the full xRows; xi=P. Keep the native adelic preimage-lattice and form identities and integrality hypotheses.

## 2. Actual unipotent, not arbitrary row operations
Source New/Filling/BoxPartition.lean 53f11966247a892d94cf688e8b366e887a92f641, exists_mem_classUnip. Write J for the rational Hermitian form, x0 for inclusion of the e-coordinates, U for embedding of -l into X0. With x0*Jx0=x0*JU=0, B=U*JU, skew s, and tau+bar(tau)=g, put A=x0 U*J-(U+x0(tau B-s))x0*J. In the J-adjoint sharp, A+A^sharp=-g x0 B x0*J and A^sharp A=x0 B x0*J. Therefore (I+gA)*J(I+gA)=J by exact cancellation; A³=0 gives the inverse polynomial. The source chooses tau from StablyUnram, verifies class-coordinate integrality and principal-level equality, and U,x0 orthogonal to the original frame imply classUnip0. Its X0 change on the moving frame is -gUP, the needed middle difference. Choose u(p) for each p in the same middle colour aligning its lower rows to one reference.

## 3. Shared-vector estimate and exact vanishing
Source New/Filling/BlockBound.lean 6c68e80e3b1ea2b7983696716305493a37f2b1fd, HasLevel.norm_shared_vector_lt, tsum_invPowWeight_le_of_codim_le. M=q0^(n^4), q0=levelPrime 0. For b>=j the shared vector relation is frame(1)w=frame(gamma)Y^-1 e_b. In boxed coordinates the source uses G_p,G_q with entries bounded by B0=b^(5n²), G_p unitriangular, satisfying G_p Phi(w)=G_q Phi(Y^-1 e_b). The block matrix [G_p,-G_q;0,Phi(Y)] has determinant Phi(d) and solves for (Phi(w),Phi(Y^-1 e_b)) with RHS (0,e_b). Cramer's identity gives the scaled shared e-coordinate as a replacement-column determinant BEFORE norms. Hence 2|Phi(d*(frame(u gamma)Y^-1)_{ab})| <=2(2nB0)^(2n)<M: n<=b, b>=1000,n>=2,q0>=b^10 give 1+4n+10n³<10n⁴. Retain the source real-box/operator/basis-scale bounds giving G entries; do not apply this to arbitrary columns.

For two middle-aligned frames in the same second colour, their upper difference is xi_upper=M g det(YY*) X for integral X. Equality of Gram forms and common lower frame give xi_upper*P=-P*xi_upper. Divide by the nonzero real scalar M g det(YY*) to obtain X*P=-P*X. Let alpha=adj(Y) restricted to the first rho columns, T=X alpha. Then T*P=-(P alpha)*X. For b>=j the integral element g det(YY*) (X adj(Y))_{ab}=(xi_upper adj(Y))_{ab}/M has all embeddings of modulus <1 by the two shared-vector bounds. The integral norm argument gives zero, hence (X adj(Y))_{ab}=0 for b>=j. Integrality of g det(YY*) is the native iY/iy guard.

## 4. One explicit correction, both level cases
Set sigma=M[bar(d)T-dT*-(P alpha)*T]. Multiplying T*P=-(P alpha)*X on the right by alpha gives T*(P alpha)=-(P alpha)*T, hence sigma*=-sigma. All entries integral. If j<=rho, X adj(Y) has zero columns b>=j and Y=P on the remaining rows, so TP=X adj(Y)Y=dX. If j>rho, j=n, Y=Z, and the first rho rows/columns of Y adj(Y)=dI give P alpha=dI. In BOTH cases:
  sigma P/M = bar(d) TP + (P alpha)*(dX-TP)
            = d bar(d) X.
Thus g sigma P=xi_upper exactly; no estimate on the skew correction itself. The native classUnip0 formula with U=0,s=sigma changes only the upper rows by g sigma P, making the aligned frame images identical.

The final injection is VolumeKernel.IsLabelledTerm.eq_of_frameImage_eq, not equality of arbitrary unitary matrices from their partial frames. Fixed label t plus frame equality determine both quotient and subgroup components of the termsOver label. The native termsOver.eq_and_mem_classUnip0 gives the same class and the right class-unipotent relation. The chosen double-coset representatives coincide. Retain the source representative lemma and its adelic guards. This fills the previously unexplained middle alignment, integral vanishing and skew correction in the fibre-one supplier at tsum_invPowWeight_le_of_codim_le. It does NOT derive the independent saturation divisibility or lattice discriminant estimate.

## 5. Consumer and remaining ledger
Insert §§1–4 at HUMAN_PROOF_COMPACT.md §8 B immediately after the existing weighted colour proof, leaving all other A/B/C work intact. With x=1 per second-colour fibre, the inverse-index colouring bound gives the same b^(2000 n^6(s+1)f), retaining the native colour cardinalities. The already integrated pair-weight summation gives <=2 tailScale² once the distinct pair divisibility and discriminant inputs are supplied. Actual source role chain: Data.enough_forms <- ramifiedColumns_fill_rows <- spread supplier <- coherent/crude energy <- sum_pairWeight_le <- tsum_invPowWeight_le_of_codim_le <- {middle alignment, shared-vector determinant, skew correction, label injection, weighted colouring}. Keep other incoming edges: both divisibility branches, sum_latticeDisc_inv_le, classSize/pairInvariant, shell/Fourier/Schur primitives. Context key compact pin,fixed S,c,j,t,Z,Y,P,g,two representatives; original/reduced graphs and axiom evidence unchanged. Peer handoffs inspected from latest manuscript plus 837e9bc7,4d94ebdc,2c2d51df,2e61d8c6,a0bc9cea,f6f72232,f33fddae,2021e57b,4bf30788,5441bebc,7eb55417,6d7ea657,fc278308,6bdfdba6. URT peer SHA fetch initially mistyped; result already incorporated in latest manuscript; no URT premise. Initial commit attempt conflicted with acceleration commit c885dc85; fetched that commit and retrying disjoint lane file.

## 6. Verification
Local command -v lean/lake returned no paths. Old 4.33 native rh_scan/prune/reduce/auto tools cannot substitute for 4.35 compact verification. Independently fetched 45799225653: pick/run/record success; targeted_results.json blob 23de197bd48f404ca2074c69676de289c4f7934e, scope native named module and peer scalar checks, full_RH_replay=false; 912.12s. New primitive replay status path not found; no new PASS, axiom conclusion or native root closure.

Exact local SymPy Gaussian-integer diagnostics executed: 45 partial-level and 15 full-level cases; all satisfy source Gram premise, case guard, skewness and recovery. One negative control with the Gram premise but without either case guard fails recovery. These are algebra diagnostics only. Reproduce:
```python
import sympy as s, random
r=random.Random(20261126); counts=[0,0]
for n in range(2,5):
    rho=n-1
    for j in range(n+1):
        for _ in range(5):
            while True:
                Z=s.Matrix(n,n,lambda a,b:r.randrange(-2,3)+s.I*r.randrange(-1,2))
                Y=s.Matrix(n,n,lambda a,b:Z[a,b] if a<j else int(a==b))
                d=s.expand(Y.det())
                if d!=0: break
            P=Z[:rho,:]; A=Y.adjugate()[:,:rho]; m=min(j,rho)
            C=s.Matrix(rho,rho,lambda a,b:r.randrange(-2,3)+s.I*r.randrange(-1,2) if a<m and b<m else 0)
            X=(C-C.H)*P; T=X*A
            clean=lambda Q:Q.applyfunc(s.expand)
            assert clean(T.H*P+(P*A).H*X)==s.zeros(rho,n)
            if j<=rho:
                assert clean((X*Y.adjugate())[:,j:])==s.zeros(rho,n-j)
                assert clean(T*P-d*X)==s.zeros(rho,n)
            else: assert clean(P*A-d*s.eye(rho))==s.zeros(rho)
            sig=clean(3*(s.conjugate(d)*T-d*T.H-(P*A).H*T))
            assert clean(sig+sig.H)==s.zeros(rho)
            assert clean(2*sig*P-6*d*s.conjugate(d)*X)==s.zeros(rho,n)
            counts[int(j>rho)]+=1
assert counts==[45,15]
P=s.Matrix([[0,1]]); A=s.Matrix([[1],[0]]); X=s.Matrix([[0,s.I]]); T=X*A
assert T.H*P==-(P*A).H*X and (T-T.H-(P*A).H*T)*P!=X
```
Prepared executable candidate (extract Lean block, native syntax/elaboration not verified):
```lean
import New.Filling.BlockBound
open Matrix
namespace CompactFibreOne
variable {R a b : Type*} [CommRing R] [StarRing R]
    [Fintype a] [Fintype b] [DecidableEq a]
theorem recovery (P X : Matrix a b R) (A : Matrix b a R)
    (d : R) (h : (X*A)ᴴ*P = -(P*A)ᴴ*X)
    (hc : P*A = d • 1 ∨ (X*A)*P = d • X) :
    (star d • (X*A) - d • (X*A)ᴴ - (P*A)ᴴ*(X*A))*P =
      (d*star d) • X := by
  rcases hc with hc | hc
  · simp [sub_mul, smul_mul, h, hc, mul_smul, ← Matrix.mul_assoc]
    module
  · simp [sub_mul, smul_mul, h, ← Matrix.mul_assoc, hc, mul_smul]
    module
end CompactFibreOne
#check Filling.HasLevel.middle_shared_vector_le
#check Filling.HasLevel.exists_frameImage_toRows₂_eq_add
#check Filling.exists_mem_classUnip
#check Filling.HasLevel.norm_shared_vector_lt
#check Filling.IsLabelledTerm.eq_of_frameImage_eq
#check Filling.tsum_invPowWeight_le_of_codim_le
#print axioms CompactFibreOne.recovery
#print axioms Filling.tsum_invPowWeight_le_of_codim_le
#print axioms Filling.sum_pairWeight_le
```
No Main import or workflow changes. Historic pin 40e56bab026552e089d7afcfeff08d2defb9c005 and original graphs retained.

RESUME HERE: derive actual saturation divisibility in BlockBound.sum_pairWeight_le case A, frameValueIndex(p',g,W)|sat(p') for W=commonLink intersect ker(frameMiddle(p)_X0*), using the source P,w common-link construction and principal-level congruence. Independently expand the lattice discriminant class-integral supplier. Audit the above alignment and skew correction at the same caller; merge into §8 B with real-band peers. HANDOFF TO editor, positivity, formal audit, kernel, dependency lanes. Human proof remains incomplete.
