# RUN96 — Exact support of the middle-row correction (B2)
28 November 2026. PARTIAL / independent human source audit, not native replay.
Continue RUN95 (38e559b169c96d7e676f25482f1875a0cd11ada1).
Read current mission blob 3adc76221a978016e3505cdf3e36ad688354d7d7,
live spine 1c4608f2190154fd4bc4b38fc77db10ec5e60e64, ledger
579ecc1cafdb28eae7d1c97565700c571dfa7484, compact manuscript
619ae01be98c32e053eef1c8bcd44ccddd0664e7 (relevant sections),
SWARM_PROTOCOL, HANDOFF_QUEUE, expansion, AGENTS, continuity/physical
protocols and current CI summary. Binding allocation amendment
99cfbd1f04c3a4c6d02c21a8fde207f2121aef20 read from actual diff.
Latest peer commit metadata inspected; B2 joint replay and graph
accepted in ledger; do not duplicate those certificates. Physical
orchestrator summary run 46095687155 is not RH verification.

## Exact source / scope
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
- New/RealPlace/VolumeKernel.lean fc115f79a99192fc8ea0e72c2caa0bf2546b5cf0,
  middle_shared_vector_le 55–61, col_eq_zero_of_norm_lt_one 63–68,
  exists_frameImage_toRows₂_eq_add 83–122.
- New/Filling/BoxPartition.lean 53f11966247a892d94cf688e8b366e887a92f641,
  classCoord blocks and Gram 76–104, exists_mem_classUnip 225–248,
  paddedLeading and frameMiddle 316–327, inverse/shared vector 407–418.
- New/Filling/NearTerms.lean bd8a969f8d1bda48ca0468c28a8a62bc78e280ce,
  definite zero and shared norm 209–223, chart identities 259–266.
- Lib/General/Algebra/LatticeComplement.lean 2af8405ff10f2d3fd924d048627b67397f0c5960,
  primitive preimage basis 66–71.
- New/Filling/BlockBound.lean 6c68e80e3b1ea2b7983696716305493a37f2b1fd,
  actual identity embedding / congruence consumer 156–170.
- New/Filling/ThinClasses.lean 6ae40a38e407331b9954067c833c34a62277b2e5,
  actual restricted embedding 67–77.
Retain StablyUnram E, CMType E, actual common S and class c, both HasLevel
j hypotheses, SAME Gram Z and the stated adelic congruence with the
same q : ι ↪ Fin ϱ, every omitted a satisfying j≤a, and the original
integrality / positivity suppliers. No claim of removing a native
proof-term edge.

## 1. Exact projection in the finite adelic approximation
Write R=Ô E, A=finite adeles, C=S.classCoordX₀ c, g=S.g (positive
integer), Y=paddedLeading j Z (invertible), P=xRows Z, ξ=P[q,:],
t=g⁻¹Y⁻¹, and x=X₀-components of γ'f−γf. The chart identity and
equal Gram imply that the e* and z differences are zero, since the
frame pairing rows are the e* rows and −N times the z row with N≠0.
The finite chart middle difference is therefore C x (field entries
embedded into A throughout this paragraph). C has a left inverse
by Cᴴ (latMiddle) C=1; it can be rectangular.

Taking adjoints of the given column congruence, using star stability
of R and g fixed by star, supplies a matrix B with entries in R and
the two exact relations
    (C x − g B ξ)t integral over R,   B integral.       (96.1)
Indeed each column of the adjoint difference is g ξᴴ times an integral
coefficient column plus a vector in the preimage lattice of tᴴ;
stack the coefficients and take adjoints. This is VolumeKernel.100–102.
No choice of a rational coefficient matrix is asserted yet.

By the native primitive preimage basis lemma, choose a∈GL_κ(A)
with C a integral and primitive, and Q integral with Q C a=1.
Set M₀=a Q B and Π=C a Q. Then Π is integral, Π C=C, and Π²=Π.
Consequently
    C M₀ = Π B integral,
    C(x−g M₀ ξ)t = Π(C x−g B ξ)t integral.             (96.2)
This is the witness in VolumeKernel.103–110, written as one
projection, rather than expanding every class-coordinate factor.
Do not infer C itself or a is integral. The open set of matrices M
satisfying both displayed integrality conditions is a preimage of
R-matrix × R-matrix under a continuous affine map. It contains M₀.
Density of E in the finite adeles, entrywise in finitely many matrix
coordinates, supplies ONE rational μ in this same open set:
    C μ integral,     C L integral,   L=(x−g μ ξ)t.     (96.3)
This step uses the retained native density and open-ring facts;
approximate equality is not used in the final rational identity.

## 2. Split the tail from the single exceptional top column
Let b denote a frame column (0,…,ϱ), top=ϱ. The native shared-frame
supplier says for b≥j that γ f Y⁻¹e_b and γ'f Y⁻¹e_b lie in the
original frame span. Both have X₀-part zero; pairing the first
with every isotropic e_a also gives P Y⁻¹e_b=0. Therefore
    b≥j ⇒ L[:,b]=0                                    (96.4)
EXACTLY, already over E, without any norm estimate or integral
vanishing. This separates the tail from the exceptional top column
in the native uniform v argument at VolumeKernel.112–117.

The only remaining column not among the selected leading e-rows
can be b=top with b<j (i.e. full level j=ϱ+1). Since then Y=Z,
P Y⁻¹e_top=0. The native norm identity with D=1 and N≥5 gives,
for each infinite embedding v, the squared Euclidean X₀-norm of
each of γ f Y⁻¹e_top and γ'f Y⁻¹e_top at most 1/5.
By the triangle inequality and (a+b)²≤2(a²+b²),
    ||Φ_v(L[:,top])||²
        = g⁻² ||Φ_v(x Y⁻¹e_top)||²
        ≤ 4/(5g²) ≤ 4/5 < 1.                          (96.5)
Use the SAME class lattice C L integral from (96.3). The native
col_eq_zero_of_norm_lt_one applies: the definite rational norm
sum of squares is an algebraic integer because of the unimodular
class form and the integral column, and has absolute value <1
at every infinite place; hence zero by the field norm. Definiteness
then forces the column itself zero. This works without treating
the individual rational entries of L as algebraic integers.
At j≤ϱ the top was already handled by (96.4).

Thus the support of L is contained in the leading isotropic rows
J={a<ϱ : a<j}, and J⊆range(q) by the exact premise H.
For selected q(a)≥j the coefficient is zero by (96.4), even though
q need not equal the leading-row embedding. From Y's row definition,
    L Y = L[:,castSucc(q)] ξ.                          (96.6)
This equality is a finite sum over the actual support, not a rank
claim or an assumption that q is onto. Since t=g⁻¹Y⁻¹,
    x = g(μ ξ+ L Y) = g l ξ,
    l=μ+L[:,castSucc(q)],  C l integral.               (96.7)
Combined with equal e* and z rows this is the exact original
toRows₂ conclusion. It covers empty ι, j=0, restricted q, q=id,
and the full level; no inversion of the rectangular ξ.
The native proof uses a uniform norm argument; the split (96.4)
shows that only the full-level top needs its quantitative bound.
No runtime claim; the density and primitive basis inputs remain.

## 3. Two different actual callers
BlockBound.164–170: choose γ=p.2, γ'=p₁.2 within the same
colour/Gram fibre, q=id on Fin ϱ (so H vacuous). The actual
weighted congruence supplier implies the required preimage
congruence; retain that supplier and same class chart. Put P=xRows Z.
Equation (96.7) gives x=g l P. Extend l by zero outside X₀ and
choose the negative of this extension as u in exists_mem_classUnip,
p=id and s=0. Its integrality follows from C l integral and the
classCoord block identity; the e* rows of u vanish and s is skew.
The native formula is
    r=1+g[X(uᴴJ)−(u+X(τ uᴴJu−s))(XᴴJ)],
where X consists of the isotropic e-columns and J=S.ratGram.
u orthogonal to every original frame column, so r∈classUnip₀ c.
The X₀-block of r γ f changes by −g u_X₀ P=+g l P;
the other non-e blocks are unchanged, and the first bracket term
and τ correction lie in the e-block. This gives the precise eu
alignment at lines 167–170 before the distinct skew-colour step.
The proof does not say rγf=γ'f in all rows; the e-rows remain.
RUN95 handles the later tail vanishing and the native joint module
handles the remaining skew/count; do not repeat those.

ThinClasses.71–74: q is instead the embedding of IndexBelow j
into Fin ϱ, H holds by definition, congruence is the left summand
alone (stronger than needed). The SAME (96.7) yields integral l
with just these leading columns. Its actual archimedean shift is
l mapped by Φ_v and multiplied by b/π, not by g or the class chart.
Retain the separate Schur kernel and subsequent packing/integral
bounds. Full identity-embedding alignment cannot replace this
restricted-column consumer without the support argument.

## 4. Rejected routes / verification boundary
- Treat C as square/invertible or integral: not justified. Use Π from
  the primitive preimage basis; arbitrary left inverse need not
  send integral B to an integral C M₀. E.g. C=(1,0)^T and
  left inverse (1,1/2) over Q₂, B=(0,1)^T.
- Treat finite adelic coefficients as rational: density yields an
  open-condition witness, not equality to M₀. Keep both integrality
  conditions in the SAME open set.
- Claim all of Y equals Z: false outside full level. Use exact
  support (96.4) and only the selected leading rows in (96.6).
- Drop exceptional top because q=id on isotropic indices: it is
  not an isotropic index and at full level b<j. Need (96.5).
- Claim entries of L integral from C L integral: not implied.
  For instance C=2, L=1/2 gives C L=1; use the native class
  quadratic form, not entrywise product formula.
- Replace strict bound <1 by ≤1: the nonzero algebraic integer 1
  is a counterexample to the resulting vanishing principle.
Actual verification: retrieved pinned source statements and bodies,
checked projection, support identity, top bound and both caller
orientations by hand; no fresh Lean replay, no automated tests or
new rh_scan/prune/auto execution. The existing B2 native eleven
declaration/eight-root receipts are separate. URT-inspired support
grouping selected the only nontrivial column; ordinary linear
algebra and the retained native arithmetic suppliers validate
the argument. No assumed URT premise or speedup. B2 and full human
RH reconstruction remain OPEN. Context key: compact pin, same
S,j,c,γ,γ',Z,Y,q,C,g and simultaneous finite-adelic witness.

RESUME HERE: audit New/RealPlace/VolumeKernel.exists_kernel_frameVolume_le
at lines 164–235, specifically the unitriangular determinant
cancellation at 195–216, against the actual ThinClasses.75–77
restricted-column caller; check existing peer derivations before
selecting a replacement. Preserve native Hua integral and
positive-semidefinite inputs.
HANDOFF TO integration/audit: use (96.2), (96.4)–(96.7) for
the preferred human middle-row supplier; no new root closure.
