# RUN87 — two-row link quotient: exact rank, norm and enhancement guards

27 November 2026. HUMAN SOURCE-MATCHED INDEPENDENT AUDIT / PARTIAL at root.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Preflight: latest mission 3adc7622, binding amendment 99cfbd1f, spine
24b10d71, ledger c40f1deb, relevant HUMAN_PROOF_COMPACT sections, SWARM_PROTOCOL
4b77b161, AGENTS 8db0201d, handoff/expansion, research state/log/protocol and
continuity; CI summary b22fcfa9 run 46038412636 (not a new RH replay).
Resume RUN86 6b96a767. Reuse integration/2026-11-26_COMPACT_LINK_DISCRIMINANT_PRIMITIVES.md
blob 496f885c, L11–L12, and integration/2026-11-27_INTERACTIVE_LINK_PAIR_CALLER_AUDIT.md
blob bc88529e. Reuse RUN84 finite fixer, RUN85 bordered normalization,
RUN86 Jacobi audit. Do not repeat their proofs. The new independent audit
makes the exact rank (not merely an upper bound), all three row cases, and
the finite-fixer trigger explicit, using one two-column Gram matrix.

## Source and retained hypotheses

New/Filling/LinkPairing.lean a802533ca5a385d6f44c3254f1a4d600b28fc416,
130–138, 167–179, 188–232, actual HasLevel.exists_mem_link_termDisc_eq
and minorNorm_sq_le_linkDiscSq_mul.
New/Filling/CrudeBoundDefs.lean 0ba0d2532b14c414b9032466b79e10d4d60c3d18,
43–45, 59–62, 70–72, 90–102.
New/Filling/BoxPartition.lean 53f11966247a892d94cf688e8b366e887a92f641,
45–74, 158–163, 359–367.
New/Filling/NearTerms.lean bd8a969f8d1bda48ca0468c28a8a62bc78e280ce,
201–228; StableCells.lean 236a41919b3697e1e30c4be840140f6452642599,
28–44, 69–79; EichlerFlag.lean 3da2606a049a092719b779802cb8ead3af7141ce,
43 (frameDisc).

Keep E CM, StablyUnram, the SAME filling S, c,c', s, gamma over s,
HasLevel j gamma, Agrees s and FixesNormAtLeast(s,x) (x natural).
Write h=rho, f=numInfPlaces(E), N=S.N prime, L=link(gamma),
T=diag(I_k,-N), J=diag(T,-T), Z=zFormPair(T), Q=linkMetric.
Then Z(p,z1;q,z2)=(-N z1,-N z2) and Q=diag(I_k,N,I_k,N)/2.
Let Y be the native r-column rational matrix y, with col(Y) <= L and
ZY having a left inverse. Keep v in GL_r(A_f), actual w satisfying
HasIntegralLifts c gamma w, and Z w=(ZY)v after finite adelization.
Retain hp: i=0 implies dim(L intersect ker Z)+r=dim L.
D=minorNorm(j,gamma)>0; M=max(termDiscNorm(gamma),N^f D).
The target is r<=1+(j-h)_+ and (x'D)^2<=linkDiscSq(Y,v) M^2, where
x'=x only if j>h and i=0, and otherwise 1.

## 1. Both epsilon constructions and the exact Gram matrix

Write A=frameProducts(gamma), d_l=leadingMinor(A,l), and
g=termDisc(gamma)=det(A) overline(det(A))-N^2 d_h overline(d_h).
For top level j=h+1 the leading determinant is nonzero. Choose the
actual frame coefficient vector b=N A^-1 e_top. Then A b=N e_top:
the moved frame vector gamma F b has no original dual-isotropic
component and has original z coefficient -1 (NearTerms.215–218).
Its inverse image F b has zero X0 component. Its link image is
epsilon_1=(a,-1;0,u), with u=b_top=N d_h/det(A) by Cramer's rule.
Consequently
    g=d_j overline(d_j)(1-overline(u)u).                (87.1)
This does not require the h-leading block to be invertible.

For lower level j<=h, the SAME normal-form hypothesis at the top
index gives a shared frame vector F b0=gamma F b1 with b0_top=-1:
take the shared pair (c,1) and scale by -c^-1, which exists because
c overline(c)=1. Pair it with itself in each frame: u=b1_top has
overline(u)u=1. The link vector is (0,-1;0,u) (here a=0).
HasLevel gives g=0 and d_j !=0, so (87.1) holds also in this case.
This rederives the source's inverse-normal-form choice at 177–179.
The inverse-level lemma yields epsilon_2=(0,u';a',-1) in L after
swapping the two middle projections. This swap follows directly by
replacing an ambient lift t by gamma^-1 t.

Put C=[epsilon_1,epsilon_2]. For any w=(p,s;q,t) in L the identities
epsilon_1* J w=0 and epsilon_2* J w=0 give
    a* p+N s+N overline(u)t=0,
    -N overline(u')s-a'*q-N t=0.
Substitute into C*Qw, with Q as above, to get exactly
    C*Q w=(-N s,-N t)=Zw.                             (87.2)
Cross isotropy epsilon_1*J epsilon_2=0 gives u'=overline(u),
since N !=0 in E. Therefore
    G=C*Q C=ZC=N [[1,-overline(u)],[-u,1]].            (87.3)
Both diagonal entries are N, not N/2. This is precisely
LinkPairing.206–211; no archimedean approximation or basis change.

## 2. The rank is exact, and the enhancement has exactly two rows

The restriction of Q to L is nondegenerate over E: in a rational
basis its Gram matrix maps to a positive definite matrix under any
CM embedding. Positivity also implies ker(C*QC)=ker C, since a
vector in the former kernel has zero Q-norm after an embedding.
Thus rank G=rank C. By (87.2) on L, the rank of Z|L is at most
rank C; its image contains the image of ZC=G, giving the reverse
inequality. In particular
    rank(Z|L)=rank G =
      1 if j<=h, and 2 if j=h+1.                      (87.4)
Indeed N is nonzero and the determinant of G is N^2(1-u* u).
By (87.1) and HasLevel it is zero exactly at lower level.

Since ZY has a left inverse, its r columns are independent and
r<=rank(Z|L)=1+(j-h)_+. If j=h+1 AND i=0, hp and rank-nullity
force r=rank(Z|L)=2. This proves directly the guard used in the
source's final split at 228–230. No extra equality of link spaces
is assumed in this lemma, and the lower-level case cannot receive
the x improvement. The caller uses i=0 to supply hp separately.

## 3. One selected determinant: integrality before norms

Choose an injection lambda:{1,...,r}->two row labels whose minor
of ZY is nonsingular. For r=0 use the empty map and determinant 1.
Let C_lambda select the same columns from C; then
    C_lambda*QY=(ZY)_lambda
by (87.2). Use the SAME actual integral ambient lift n supplied by
HasIntegralLifts.exists_isIntMatrix c' (LinkPairing.130–138).
In the class-c finite chart, put k=termPosition(c,c',gamma).
The full paired-frame matrix P=framePair(k)* latGram n is integral.
Its isotropic rows vanish and its two z rows are precisely
    Z w=(ZY)v.
This uses the native framePair_last_eq_zFormPair_mul identity, the
integral termPosition k and unimodular integral latGram; it is NOT
the assertion that Yv is integral in rational middle coordinates.
The determinant delta of selected z rows is integral and is an
adelic unit (nonzero rational cross determinant times det v).
Therefore genIndex(delta)>=1. In the enhancement case r=2 the
injection is a bijection, and the actual BoxPartition.158–163
finite-fixer theorem with P, n, same s and same chosen prime family
gives genIndex(delta)>=x; changing the row order only changes sign.
RUN84 is the existing human audit of that theorem. x can be zero;
all quantities are nonnegative. The ordinary lower bound needs no
finite-fixer premise beyond the actual theorem context.

Apply native BoxPartition.liouville_gram with a=C_lambda, b=Y,
left adelic factor I_r and right factor v, threshold x'. It yields
    (x')^2 <= |Norm det(G_lambda)| linkDiscSq(Y,v),    (87.5)
where G_lambda is the principal submatrix of G on those labels.
This is also a direct consequence of positive Gram Cauchy–Schwarz
at every infinite embedding and the finite product formula; retain
the native multiplicative generalized-index conventions.

## 4. All row cases, with exact CM norm normalization

For r=0: |Norm det(G_lambda)|=1. Since N>=1, M>=N^f D>=D,
so D^2 |Norm det(G_lambda)|<=M^2.
For r=1: G_lambda=(N) regardless of the selected row, so
|Norm det(G_lambda)|=N^(2f). Therefore
D^2 |Norm det(G_lambda)|=(N^f D)^2<=M^2.
For r=2: necessarily j=h+1. A permutation of both rows and columns
does not change det G. In a CM field [E:Q]=2f, and
    |Norm g|=termDiscNorm(gamma)^2,
    |Norm d_j|=N^(2f) D,
    |Norm(d_j overline(d_j))|=N^(4f) D^2.
Using (87.1), (87.3), and multiplicativity gives
    |Norm det G|
       = N^(4f)|Norm(1-overline(u)u)|
       = termDiscNorm(gamma)^2 / D^2.                (87.6)
The factors N^(4f) cancel exactly, not after taking a local square
root. No formula involving the top-level normalization is needed
at lower levels. Thus in all three cases
    D^2 |Norm det(G_lambda)|<=M^2.
Multiply (87.5) by D^2>0 to obtain the exact native inequality.
This is the same corrected lift and same M as L12 and the pair
caller; nothing from the finite-fixer dividend has been replaced
by an archimedean estimate.

## 5. Failed shortcuts and verification boundary

- Merely knowing det G=0 does not establish rank C<=1 without
  positivity. An indefinite Gram on Q^2, diag(1,-1), and column
  (1,1) has zero Gram but nonzero column. The actual Q is positive.
- The enhancement cannot be inferred from integrality alone:
  an integral 2x2 identity has determinant index 1, not x>1.
  The agreement/fixer primitive is indispensable for that gain.
- Treating termDiscNorm as |Norm g| instead of its square root
  would square the last branch twice. Formula (87.6) follows from
  the actual CM place convention, not a real-field norm.
- Dropping the correction in w and asserting Yv integral is not
  licensed by HasIntegralLifts. The source only needs its two
  z-row values; (87.5) uses exactly that equality.

Actual verification: pinned native source statements and bodies
fetched, both epsilon constructions and caller guards inspected;
exact symbolic algebra and rank-nullity proof above, no simulated
data or new Lean execution. Shared B2 eleven-declaration/five-
statement replay and eight-root dependency audit are separately
documented in integration/2026-11-27_B2_C2_GRAPH_AUDIT.md; they do
not constitute a new kernel replay of this human primitive.
No full RH reconstruction, global dependency removal, or URT
acceleration claim. URT candidate reduction selected the shared
two-row Gram; conventional mathematics proves the result.
Only this new note is added; no changes to live ledger or workflows.

RESUME HERE: independently audit the actual integral adapted-basis
supplier in LinkPairing.HasIntegralLifts.exists_orthogonal_split
(145–162), especially exists_isPrimitiveMatrix_mul_fromBlocks and
the determinant-one correction, retaining the same w and f.
HANDOFF: integration/audit can use (87.4)–(87.6) for L11–L12;
the native replacement replay and complete B2 human assembly remain open.
