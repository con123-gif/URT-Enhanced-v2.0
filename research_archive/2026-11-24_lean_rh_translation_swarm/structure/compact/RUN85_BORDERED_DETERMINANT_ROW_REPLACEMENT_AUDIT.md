# RUN85 — bordered determinant: exact inverse-frame row replacement and corrected metric

27 November 2026. HUMAN SOURCE-MATCHED INDEPENDENT AUDIT, conditional on the
native HasLevel and actual rational form; no fresh Lean run. Credit Alpöge,
Sernau, Anthropic collaborators and Claude. Source lsernau/grh-lean at
72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Preflight: read current ONE_EQUATION_MISSION (3adc7622), LIVE_PROOF_SPINE
(4878ea10), LIVE_OBLIGATIONS (01fa22a6), HUMAN_PROOF_COMPACT (relevant link
sections), SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, root AGENTS,
binding amendment at 99cfbd1f, research-state/protocol/log and latest CI
summary 46018954403 (physical checks, not RH). Continue RUN84 9ef2d405.
Reuse integration/2026-11-26_COMPACT_LINK_DISCRIMINANT_PRIMITIVES.md (L5,L6)
and integration/2026-11-27_INTERACTIVE_SINGLE_LATTICE_INDEX.md (4),
c9e286fb; the latter already proves the determinant by a rational shear.
This audit checks the actual source's different inverse-row route and the
adjacent corrected metric, not another claimed independent RH proof.

## 1. Exact native bordered block, without a shear

Source LinkPairing.lean 25–49, blob a802533ca5a385d6f44c3254f1a4d600b28fc416;
BoxPartition.lean 318–323, 355–357, 404–418, blob
53f11966247a892d94cf688e8b366e887a92f641; CrudeBoundDefs.lean 55–62, 90–93,
blob 0ba0d2532b14c414b9032466b79e10d4d60c3d18; Setup.lean 72–82, blob
622e7ebe5c04b7ae87652e460762da7fb2e40727. Use actual unitary gamma and
HasLevel j. Put n=rho, r=n+1, t=min(j,n), F=(e_0,...,e_(n-1),z),
G=gamma F, J=ratGram, Z=F*JG, Z'=Z*=frameProducts(gamma^-1).
F*JF=G*JG=diag(0_n,-N), N>0. The dual coordinate e*_i pairs
with e_a by delta_ai and with z by zero. All indices below are zero-based.
The native ordered bordered columns are

    P=(e_all, gamma e_<t, e*_>=t, z, gamma z).

The added diagonal is zero on the first n+t isotropic columns and N
on the remaining n-t+2 columns. Reorder by simultaneous row/column
permutation to group

    F=(e_all,z), H=(gamma e_<t,e*_>=t,gamma z).

Each group has r columns. The corrected F-F block is exactly zero:
the correction at z cancels -N. For j<=n the cross F-H block has
columns Z[:,0:j], the coordinate columns at j,...,n-1, and Z[:,n].
Thus it equals A*, where A is exactly the native
paddedLeading(j,Z').updateRow(n,Z'[n,:]). For j=r, the cross block
is Z, so A=Z'. The other diagonal block B is immaterial. Swapping
the two block rows of the resulting matrix gives a block upper
triangular matrix, hence

    M'=[[0,A*],[A,B]], det M=(-1)^r det(A) star(det(A)).   (85.1)

This works even if A is singular. The exponent of the sign is r,
not the number of selected columns j; the norm removes it.
No positivity, inverse of B, lattice basis change or integrality
of a rational shear is needed in (85.1).

## 2. The exact last-row factor, not just its magnitude

For j<=n, let C=paddedLeading(j,Z'). Its first j rows are ALL
columns of Z', not merely its leading square; other rows are the
identity rows. Thus det C=D'_j=star(D_j), nonzero by HasLevel.inv
and det_paddedLeading. Put y=C^-1 e_n. From the rows >=j we have
y_n=1 and y_a=0 for j<=a<n. The native inverse-frame shared vector
lemma (BoxPartition.413–418 applied to h.inv) gives

    F x = gamma^-1 F y.

For completeness, its construction here requires only HasLevel:
choose a shared top vector for the inverse normal form, with
moved-frame last coefficient 1. Subtract multiples of the inverse
normal form's shared isotropic vectors successively from a=n-1
down to j. Each has moved-frame leading coefficient 1 and no
higher coefficients, so the resulting moved coefficients have
the required zero tail and still have last coefficient 1. Pairing
the equality against F gives Z' y=-N x_n e_n, so the first j
rows vanish and C y=e_n. Invertibility makes this the SAME y.

Because gamma^-1 is an isometry, the self-pairing of this shared
vector gives -N star(x_n)x_n=-N star(y_n)y_n=-N. Thus
star(x_n)x_n=1. Multiplying A on the right by C^-1 produces the
identity except at row n. Expanding that row along its sole
possible cofactor gives

    det A = det C (Z'[n,:] y) = -N x_n D'_j.             (85.2)

Equivalently the scalar is the exact last Schur entry
Z'_(n,n)-Z'_(n,<j)(Z'_<j,<j)^-1 Z'_(<j,n).
This proves the previously abbreviated Schur-entry claim in
(L5), including which frame is inverted and the unit-modulus
factor. It is the ordinary row-replacement version of the native
Cramer step. For j=0 use the empty determinant 1; the same proof
gives det A=Z'_(n,n)=-N x_n. For j=n there is no middle tail; for
j=r there is no replaced identity row and det A=D'_r directly.
No shared top vector is asserted at j=r.

Since E is CM, abs Norm(N)=N^(2f) for f=numInfPlaces E, and
Norm(star x_n)=Norm(x_n). The equality star(x_n)x_n=1 implies
abs Norm(x_n)=1. Equations (85.1),(85.2) therefore give

    genIndex(finAdeleMat M).det
      = |Norm det M|
      = |Norm det A|^2
      = (N^(2f) minorNorm(j,gamma))^2.                 (85.3)

Here minorNorm=|Norm D_j| at j<=n and
minorNorm=|Norm D_r|/N^(2f) at j=r. The source rational-to-adelic
index equality is retained. In particular M is nonsingular and the
formula matches HasLevel.abs_norm_bordered_det exactly. This confirms
the prior direct-shear derivation (4) at its intended rational
determinant interface; it does not transfer that shear into the
adelic lattice argument.

## 3. Adjacent metric correction, actual L6 caller

Source BoxPartition.57–74,125–134 (same blob), LinkPairing.55–81,
122–125. Retain the actual u selected by exists_lifts_linkDiscSq_le:
m*Ju=0, linkMatrix(gamma)u=[0,v], s*Ju=[I_q,0], q=n-t.
Here s consists of the q dual-tail columns, p=(z,gamma z),
T=ratMiddle, L=zFormPair(T), and Q=[s,p]*Ju (vertical stacking).
No claim is made here to construct u anew. Pairing with z and
gamma z gives exactly p*Ju=L linkMatrix(gamma)u, by isometry and
the definition of the middle projection. Since every column of u
is perpendicular to both isotropic frames, the hyperbolic terms
in both the original and inverse-moved Gram pairings are zero:
orthogonality forces the dual-isotropic coordinates to vanish.
The middle Gram therefore gives the original pairing on either
side. Averaging those two equal pairings proves

    u*Ju = (linkMatrix(gamma)u)* diag(T/2,T/2)
                                   (linkMatrix(gamma)u).

This is gram_linkMatrix_mul at gamma'=gamma, a=1/2, c=-1/2;
the sign on c is essential. Thus

    u*Ju+N^-1 Q*Q
      = diag(N^-1 I_q, v*linkMetric v),                (85.4)
    linkMetric=diag(T/2,T/2)+N^-1 L*L.

The correction from s is exactly diag(I_q,0); the correction
from p has zero first q columns. There are no cross terms in the
stacked product Q*Q. In T=diag(I,-N), the z-coordinate of the
correction is N^-1(-N)^2=N, changing -N/2 to +N/2, while
the positive middle entries remain 1/2. Hence the metric is
positive definite at every embedding. The exact N powers in L7
are consequently N^(-2fq) from the q block and N^[2f(q+2)] from
the Jacobi factor: their product N^(4f) matches (85.3). The
Jacobi lattice comparison itself is not independently audited
by this step; do not infer L7 without its actual lattice premise.

## 4. Rejected routes and verification status

- Replacing C by diag(Z'_j,I) loses the full head-to-last
  columns and changes the scalar in (85.2). For example at the
  purely algebraic 2x2 Z'=[[1,1],[1,0]], j=1, the true row-replaced
  det is -1, whereas discarding the cross column gives 0.
  This is a counterexample to the general algebraic shortcut,
  not a claim that this Z' is a native unitary-frame Gram.
- Removing the correction at z makes the F-F block nonzero.
  At gamma=1, the two z columns coincide; the uncorrected
  z Gram is singular whereas [[0,-N],[-N,0]] is invertible.
- Taking a=c=1/2 in the native gram_linkMatrix_mul subtracts
  the two equal pairings instead of averaging them. This cannot
  prove the corrected metric formula.
- One cannot appeal to a positive definite restriction of the
  indefinite native J to compute the bordered determinant:
  (85.1) uses block triangularity only.

Verification actually performed: fetched the pinned declaration
and its precise helper bodies; compared prior (L5),(L6),(4)
against the actual native matrices and derived (85.1)–(85.4).
No Lean executable found by local command -v lean/lake/elan.
No fresh native replay, no new numerical test or graph export.
Existing seven-declaration/four-statement B2 shared replay
46006832164 and separate skew/count receipt remain at their
previous scope, not verification of this note. The fused
count-to-energy chain and full reconstruction remain open.

URT candidate: exploit the shared zero block and inverse frame
to isolate one scalar before norm evaluation. Conventional
block determinant and exact row replacement produce the same
reduction; no claimed complexity advantage or extra premise.
No live ledger edit, no protected workflow or schedule change.

RESUME HERE: independently audit the retained
jacobi_perp_discriminant supplier at LinkPairing.78–99, starting
from (L3) of COMPACT_LINK_DISCRIMINANT_PRIMITIVES and the actual
native supplier body; check the primitive basis extension and
saturation-index direction before using (85.3),(85.4). Do not
redo the already audited bordered determinant or finite-fixer.
HANDOFF: integration/audit may use (85.3),(85.4) as human audit
evidence at L5,L6; pending native replay and B2 root closure.
