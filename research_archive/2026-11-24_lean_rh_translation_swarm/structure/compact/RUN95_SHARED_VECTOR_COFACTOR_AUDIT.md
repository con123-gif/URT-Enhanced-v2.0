# RUN95 — shared-vector cofactor and strict integral vanishing

28 November 2026. B2 source-matched human audit / alternative shorter
determinant estimate; no fresh Lean execution. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. Source lsernau/grh-lean@
72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src;
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Preflight: latest mission blob 3adc76221a978016e3505cdf3e36ad688354d7d7,
spine 1c4608f2190154fd4bc4b38fc77db10ec5e60e64, ledger
579ecc1cafdb28eae7d1c97565700c571dfa7484, manuscript
619ae01be98c32e053eef1c8bcd44ccddd0664e7 (B2 relevant sections),
allocation amendment 99cfbd1f, AGENTS, SWARM, handoff, expansion,
state/log/protocol/continuity openings. Latest CI summary 46090839632
is unrelated physical orchestrator evidence, not RH replay.
Resume RUN94 6d55b61f; reuse RUN79 adddfacc shared-tail geometry and
accepted B2 fused native receipt 46f4fe66. Read latest peer B3 replay
d81e538d and active B2 caller record b20bfed0; no duplicate
count-to-energy module. Search for shared-vector commits yielded an
unrelated old-pin kernel RUN24, not a compact norm audit.

## Native anchors

- New/Filling/BlockBound.lean 6c68e80e3b1ea2b7983696716305493a37f2b1fd,
  HasLevel.norm_shared_vector_lt 90–125, actual count caller 175–196.
- New/Filling/BoxPartition.lean 53f11966247a892d94cf688e8b366e887a92f641,
  paddedLeading 316–323, inverse and shared vector 407–418.
- New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727,
  prime and size guards 31–58, basisScale 128–137 and 169–170,
  rescaling 180–217, boxSize 246–247, kappa bounds 305–306.
- New/Filling/CrudeBoundDefs.lean 0ba0d2532b14c414b9032466b79e10d4d60c3d18,
  level 90–93, boxedPoints and IsNear 104–111.
- New/Filling/BesselSystem.lean 847e2869ed2c189c30f6efef85e7c1c1f2451058,
  besselSize, InCut, frameBox 27–35.
- New/RealPlace/FrameNorm.lean 06a65cfd754f2688b899d08320f627fdea415db0,
  frame coordinates and bounded unipotent witness 15–42.
- New/Filling/NearTerms.lean bd8a969f8d1bda48ca0468c28a8a62bc78e280ce,
  IsNear.norm_frameProducts_le 295–300 (retain this supplier).
- Lib/Adelic/Witt/FrameAction.lean cd3f13d59a5f2351c2fa22267765c723bd3b6001,
  frameMatrix_unitriangular 151–160; New/Filling/EichlerFlag.lean
  3da2606a049a092719b779802cb8ead3af7141ce, frameImage identities 152–156.

## 1. Same shared vector, same near witness

Write B=S.b, n=ϱ+1, Q=S.levelPrime 0, L=Q^(n^4), and
M=B^(5n²). Fix the actual S.IsAdmissible, IsNear γ, HasLevel j γ,
u∈besselU0, frame column index b with j≤b, and Y=paddedLeading j Z,
Z=S.frameProducts γ. Then det Y≠0. Set x=Y^(-1)e_b.
The native shared-vector supplier gives w with Fw=γFx,
where F=frameImage 1. No assumption that x itself is short or integral.
As u fixes F pointwise, frameImage(uγ)x=Fw. On row inl a,
the desired field scalar is precisely (det Y) w_a, a<ϱ.
All embeddings below are the same chosen v.

Use the SAME near pair y,z=ratToInf(γ)^(-1)y. Both are boxed,
with all frame-vector norms ≤ B^(2n²), and y has besselSize
≤B^(6n+2). FrameNorm.38 supplies U∈besselU with
A=U y_v and ||A||op≤B^(6n+2). This does not require the
infimum defining besselSize to be attained; the added 1 is
the slack in the native existence proof.

Let s_c=basisScale v (besselFrame c)=κ_v^(ϱ-c)/sqrt(N).
All s_c≠0. For z' either y or z define the SAME matrix as
BlockBound.100–101:

    G(z')_(r,c) = (s_r/s_c) (A frameVector(z'_v,c))_(f_r).

Here f_r denotes the normalized coordinate vector at besselFrame r.
The ratio satisfies |s_r/s_c|≤B^(23ϱ) for BOTH signs of r-c,
using 1≤|κ_v|≤B^23. Thus

    |G(z')_(r,c)| ≤ B^(2n²+6n+2+23ϱ) ≤ B^(5n²)=M.

Indeed 2n²+29n−21≤5n² since native ϱ≥10^5. The sqrt(N)
factors cancel, not merely get bounded. G(y) is the diagonal
conjugate of the unitriangular frame matrix of U, because
A y_v^(-1)=U. Hence det G(y)=1. Write Gp=G(y), Gq=G(z).
Applying the common row transformation to Fw=γFx gives
Gp Φ(w)=Gq Φ(x); this follows since ratToInf γ=D^(-1)Φ(γ)D
for D the full basisScale diagonal and z_v^(-1)=y_v^(-1)ratToInf γ.
Only frame row and column coordinates are needed. This is the
native E identity at 112–115, with no conjugation of coefficients.

## 2. Cofactor reduction instead of an operator-norm detour

Over C form the actual block matrix and vector

    C = [ Gp  -Gq ; 0  Φ(Y) ],    h = (Φ(w),Φ(x)).
    C h = (0,e_b),                det C=Φ(det Y).

Replace column (first block,a) of C by (0,e_b), obtaining C_a.
By multilinearity in the replaced column, all terms but a vanish
as duplicated columns. Therefore

    det C_a = Φ(det Y) Φ(w_a).                      (95.1)

This is the exact native det_updateCol_sum identity, with the
positive sign in (95.1). Expanding C_a down its new column now
leaves exactly ONE (2n−1)-square cofactor, with sign of modulus
one. Each entry of that cofactor has absolute value ≤M:
Gp/Gq as above; Φ(Y) has entries from Φ(Z), 0 or 1, bounded
by NearTerms.295 and M≥1. Zero lower-left block is harmless.

By the Leibniz determinant formula, using n≤B and 2≤B,

    |det C_a| ≤ (2n−1)! M^(2n−1)
              ≤ B^(4n+10n³).

Indeed (2n−1)!≤(2n)^(2n)≤B^(4n), and
5n²(2n−1)≤10n³. Hence

    2 |Φ(det Y · w_a)| ≤ B^(1+4n+10n³)
                         < B^(10n^4) ≤ Q^(n^4).   (95.2)

The strict middle inequality uses B>1, n≥2:
10n^4−10n³−4n−1≥10n³−4n−1>0.
Actual n≥100001. This reproduces exactly the native strict
factor-two target at BlockBound.94–95. We retain the original
statement, not a tighter bound as a new caller requirement.
Compared with 119–125, cofactor expansion removes the separate
whole-block operator-norm estimate; no measured speedup claimed.
If j=n there is no b≥j among frame indices, so no omitted case.

## 3. Actual consumer: strict vanishing, not approximate equality

Use the SAME normalized representatives p,q and SAME Y at
BlockBound.175–196. The colour collision supplies

    ξ = L · I · X,   I=S.g · det(Y Yᴴ),
    ξ=(frameImage(u_q q)−frameImage(u_p p)).topRows,

with X integral over O=(Ô E)∩E, Y integral over O, and I≠0.
Here I is a scalar, not the identity matrix; nonzero follows
from det Y≠0 and g≠0. For a tail column b≥j and e-row a,
put t=(I X adj(Y))_(a,b)∈O. The adjugate identity and (95.2)
for each of p,q give, at EVERY infinite place,

    L |Φ(t)| = |Φ((ξ adj(Y))_(a,b))|
             ≤ |Φ((frameImage(u_q q) adj(Y))_(a,b))|
              +|Φ((frameImage(u_p p) adj(Y))_(a,b))|
             < L/2 + L/2 = L.

L>0, so |Φ(t)|<1. An algebraic integer in a number field with
all archimedean absolute values strictly below 1 must vanish:
if nonzero, its absolute field norm is a positive integer,
whereas the CM product of squared absolute values is <1.
This is the actual eq_zero_of_norm_Φ use, not an approximation.
Cancel I≠0 to conclude (X adj(Y))_(a,b)=0. This is precisely
the z family at line 189 and the hypothesis retained by the
subsequent skew construction. Do not redo the already checked
rectangular skew/count and energy module. The native colour
collision supplies ξ, X and I; this note does not establish
the existence of those integral lifts independently.

## 4. Failed simplifications / boundaries

- Bounding Y^(-1) entrywise directly from |Y_ij|≤M is invalid:
  diag(ε,1) has inverse entry ε^(-1). The determinant in (95.1)
  cannot be dropped; no lower bound on each |Φ(det Y)| was assumed.
- Replacing the column by (e_b,0) swaps the two blocks and destroys
  the cancellation; the correct vector is (0,e_b) from C h.
- An entry of Gq cannot be declared ≤M from the norm of A alone;
  the second boxed point and the scale ratio are both required.
- Using κ^(r-c) without absolute values or assuming r≤c is not
  justified. The actual ratio is κ^(c-r), and both signs occur.
- A non-strict threshold 2|coordinate|≤L would only give
  |Φ(t)|≤1. The nonzero integer 1 is a counterexample to vanishing;
  strictness is essential.
- A single embedding below 1 is insufficient. For example
  2−sqrt(3) is an algebraic integer of norm 1 with conjugate
  2+sqrt(3)>1 (also embeds in the CM field Q(sqrt(3),i)).
  The product formula requires all native infinite places.

Actual verification: exact pinned statements and relevant bodies
retrieved; determinant, entry bounds, integer exponents and
integral vanishing checked by hand, no fresh Lean execution.
URT-inspired grouping isolates the single surviving cofactor;
ordinary multilinear algebra validates it. No complexity or
time advantage asserted. The native proof already uses the same
column replacement; only its estimate and caller explanation are
simplified. The existing eleven-declaration kernel and eight-root
graph receipts are separate. B2 human assembly, remaining
primitive audits and full RH reconstruction remain OPEN.

RESUME HERE: audit VolumeKernel.HasLevel.exists_frameImage_toRows₂_eq_add
at BlockBound.164–170, with full-column embedding q=id and the
same class coordinate witness; retain the separately used
ThinClasses restricted-column caller. Establish exactly the
integral middle-row alignment used BEFORE (95.2), without
repeating the already checked skew/count algebra.
HANDOFF TO integration/audit: (95.1)–(95.2) and §3 give the exact
strict norm-to-vanishing step for the preferred B2 human proof.
