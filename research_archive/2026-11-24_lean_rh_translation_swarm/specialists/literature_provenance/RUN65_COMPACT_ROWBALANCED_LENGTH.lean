import New.Selmer.RowBalanced
import New.Selmer.TwistForRows

/-!
# RUN65 — normalized RowBalanced length, actual Theorem C consumer
Status: human source-matched reconstruction; external theorem bridge checked;
independent human review and native compilation pending. 26 November 2026.

Mission latest blob 9f4a2272265e847b3a46422b02d4b37e976bee10.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Old source pin 40e56bab026552e089d7afcfeff08d2defb9c005 remains separate.
Integration HUMAN_PROOF_COMPACT.md blob 0ef71fd3afc82ac3e5c0fc0e23d5533a9e495dc9;
peer tips checked through e57db995682ca9f4abf26a5f9736ade691752fb8.
Use latest completion-first compact mission rather than redesigning prime endpoint.

## Exact source inventory
All blobs below refer to compact source at above pin.
- New/Selmer/RowBalanced.lean ab1371acacfb1c5f262146456a380a9111ce6444:
  IsRow.eventually_isBalanced (119–175), actual target; use existing
  inClass_of_isLatticeIn transfer from peer 257d027faec31820e151ec9644846623b7b3d974.
- New/Selmer/Corepresentable.lean 3e401695d96b8ea826d60dadf0174d366f85d37c:
  exact IsBalanced fields, especially uniform local_length_le.
- New/Selmer/AptTupleDefs.lean ba41ff0e729d5182ac236911898dfd0865165f8c:
  IsRow hypotheses, crudeUnit.
- New/Selmer/AptTuples.lean 49699d4679d83a7bc7714afc53b7e2757ae4adf3:
  ellVal_le_crudeUnit, card_le_of_subset_placesAboveG, exists_chosen_notMem_placesDividing.
- New/Selmer/DeterminantBound.lean 686d1d98ab6ce7bb70ff4f087d2a10cbae8b85df:
  IsRowType, obeying_crysRels, sum_complexEmbOf_le, completion embedding count.
- New/Selmer/CrystallineRank.lean 601a4af17cf5f164a2a3b947442192661c680650:
  finrank_crysCocycles_eq_add_neg_jumps (not an axiom).
- Lib/PadicHodge/BlochKato/BlochKato.lean 473db3c6fdc1933e64363113b083af69340b648b:
  crysCocycles.finrank_eq, fg, native proved fundamental-sequence argument.
- Lib/PadicHodge/Limit/HodgeTateProjectors.lean 85c85f24bb9967c3756ca427557244bb92638686:
  crysCocycles.continuous_comp (54ff).
- Lib/General/Algebra/FittingDuality.lean 50c522f409cc0214163df1d26b77aede4aa8100a:
  length_obeying_relationsOn_le, length_ker_le_addVal_det.
- Lib/ClassField/GaloisCohomology/TameCocycles.lean 0c8ac30cf6a6b0307f199f1a1594245729ff49bf:
  localCocycles, tame_affineAction, length_localCocycles_le.
- New/Selmer/TwistForRows.lean 802242498ad4530e7f52cc4f14e0a03be2c59f4d:
  exists_mFoldTwist_selmerLengthLe, actual consumer.
- New/Selmer/TwistTheorem.lean bdf0bed65edefd067b584695b1fac0b6acbbd754:
  exists_anticyclotomic_twist, retain proof obligation separately.
- New/Selmer/RibetElement.lean 188eeb68d437bfa58bcc30042d4eee66c2111e18:
  sum_blockLoss_le, separate defect estimate NOT removed.

## 1. Rank bridge: exact external theorem and native compatibility
External published theorem: J. Pottharst, Analytic families of finite-slope Selmer
groups, Algebra & Number Theory 7 (2013), 1571–1612, section 3A, (3-2),
p.1602, DOI 10.2140/ant.2013.7.1571.
https://msp.org/ant/2013/7-7/ant-v7-n7-p02-s.pdf
Text and page image checked. For a de Rham representation V of a finite
extension K/Q_l, the finite local condition satisfies
dim_Ql H^1_f(K,V) = dim_Ql H^0(K,V) + dim_Ql(D_dR(V)/Fil^0).
Use only the actual local-completion caller (open embedding), not an
unjustified extension to abstract topological groups with open image.
Potential crystallinity implies de Rham. The native Bmax/Bcris normalization
is the one recorded in RUN64: Frobenius takes Bmax into Fontaine Bcris,
commutes with G and fixes Q_l, so a Bmax coboundary becomes a Bcris
coboundary; converse by inclusion. Retain period compatibility and
native continuity (continuous_comp for each finite reduction).
Hence Z_f(V), the inverse image of H_f^1 in Z^1, has dimension
(dim V - dim H^0) + (dim H^0 + dim tangent) = dim V + dim tangent.
This cancels invariants before taking any estimates. Rational continuous
cocycles on the compact local Galois group have bounded image, hence can
be scaled into the lattice L. Integral crystalline cocycles span Z_f(V).
A finite set of coordinate evaluations jointly injects the finite-dimensional
space into a finite direct sum of V: successively intersect kernels until
the intersection is zero. Integral cocycles then inject into a finite
free lattice, hence are finite free over the DVR O with the stated rank.
For coefficient rank, restrict scalars from Frac(O) of degree d to Q_l.
Native jump compatibility is retained. If e=[K:Q_l], the tangent dimension
is e times the sum of negative jumps over the d coefficient embeddings.
The same jump-count function on G_l factors through both finite
quotients (coefficient embeddings and local field embeddings).
Each quotient has equal Haar measure on its fibers. Thus
(1/d) sum_gamma F(gamma) = (1/e) sum_sigma F(sigma).
No linear disjointness assumption. Division by d gives the exact native
formula rk_O Z_f(L) = n + sum_sigma negative(J_sigma), over the local
embedding image. This is a published rank identity with the retained
native period, continuity, jump and coefficient identification bridges;
not a new Lean axiom and not a claim of an independent proof of those
bridges or deletion of the general native theorem.

## 2. Length inequalities (uniform in the modulus)
Fix B=O/a with a | l^M. In particular a is nonzero. All valuations
ord below are DVR lengths, normalized later, and n>=1.
For Z finite free of rank r in functions Gamma -> O^n, let U be the
submodule of Hom_O(Z,O) generated by coordinate evaluations lambda_gj.
It is finite free of rank at most r. Any function c obeying all native
matrix-valued relations on Z gives a well-defined linear map U -> B:
send lambda_gj to c_j(g). Indeed any scalar relation on the evaluations
is a matrix-valued relation with just one fixed row, which c obeys.
This map is injective as a function of c. Therefore the length of
obeying relations is <= rk(U) len(B) <= r len(B).
There is no assertion that every such c lifts to an integral Z.
For an n by n matrix A over O, Smith normal form gives
len ker(A on B^n) = sum_i min(ord a, ord d_i) <= ord det A,
allowing infinity for a zero determinant. These are actual FittingDuality
consumers, not independent speculative estimates.

For a place v off l, use the IsRow inertia witness gamma_v,N_v.
The hypotheses of tame_affineAction hold: N_v is a unit at v, powers
of inertia act trivially, and the finite-type clause gives trivial action
near identity. l^M kills B and is a unit at v.
Evaluate local cocycles at the chosen local tame generator: image length
<= n len B. On its kernel every inertia value vanishes by tame_affineAction.
For Frobenius phi and any inertia gamma_v,
c(gamma_v phi)=u(gamma_v)c(phi)=c(phi), since
gamma_v phi=phi(phi^-1 gamma_v phi).
Thus evaluation at phi maps this kernel into ker(u(gamma_v)-I).
It is injective by continuous generation of the decomposition group
by inertia and Frobenius. Therefore
len localCocycles_v <= n len B + ord det(u(gamma_v)-I).
This works for the actual witness gamma_v, not just a tame generator.
It does not require that torsion cocycles lift to crystalline ones.

## 3. Exact scalar and mirror cancellation
Use one lattice u at every sufficiently large coefficient ring as in
eventually_isBalanced. Its span is all matrices. Let chi denote the
cyclotomic character in O; chi(cg)=chi(g) for complex conjugation c.
The trace self-duality identity descends through the injective
coefficient embedding and lattice conjugacy:
tr u(c h) = chi(h)^(-(t-1)) tr u(h^-1).
If u(g)=alpha I, alpha is a unit by invertibility, and for every k:
tr u((cg)^-1 k)
 = chi(g)^(t-1) chi(k)^(-(t-1)) alpha tr u((ck)^-1)
 = chi(g)^(t-1) alpha tr u(k).
Here t-1 is natural subtraction as in the native statement.
The trace pairing with all matrix units, using span, yields
u((cg)^-1)=alpha' I, alpha'=chi(g)^(t-1) alpha.
For the scalar inertia gamma0, chi(gamma0)=1 because its place is off l,
so the two scalar actions agree. The native residue bounds with a=0 and
j=1,2 give s-1 and s+1 units (factor s^2-1); all j<=4n+2 show the
residue multiplicative order exceeds 4n+2 and hence so does residue
field cardinality. Scalar descent uses n>=1 and the diagonal entry.
Continuity modulo l^M, unramifiedness and coboundary relations follow
from the row hypotheses; a coboundary over B lifts its defining vector
to O^n and hence obeys all crystalline relations on restriction.

For the other scalar witness g from span_and_scalar, chi(g)=g_i^n.
The mirror difference is exactly
alpha - chi(cg) alpha' = alpha(1 - g_i^(n*((t-1)+1))).
Since n>=1, n<=D.r, t<=D.t and D.t>=1, the exponent is in
[1,D.r*D.t], including t=0 via natural subtraction.
ellVal_le_crudeUnit now bounds its normalized valuation by c0,
where c0=crudeUnit=v_l(chosenGroupOrder)+2^(-l)>0.
Do not introduce a norm estimate before the cancellation.

## 4. Assemble the actual IsBalanced budget
Let T be places above l, U=placesAboveG minus T, S=T union U,
f=D.f=numInfPlaces E. At each place use the chosen placeOver witness
for the infimum in IsBalanced.local_length_le.
For v in T, the restriction obeys the relations of Z_f by
obeying_crysRels. Sections 1–2 give
sum_{v in T} len localCocycles_v <= (|T|+f)n len B.
Indeed the local embedding images are disjoint and the negative jump
counts over each conjugate pair sum to at most n; E is CM with f pairs.
For v in U use the tame estimate in section 2.
Take the single budget, independent of a,
 beta = sum_{v in U} ord det(u(gamma_v)-I)
        + n ord(alpha-chi(cg)alpha').
Then the defining local_length_le inequality holds for every a|l^M.
All other IsBalanced fields were supplied in section 3.
Normalize lengths with ellVal(l)=1; the determinant valuations agree
with R by conjugacy, and no ramification-index factor remains.
The row bounds both chosen-generator signs by n*c0. Also |U|<=4f.
Consequently the exact budget at the chosen place w is
 normLength(beta + sum_b ord det(u(idOrConjInv b sigma_w)-I))
 <= (|U|+3)n*c0 <= (4f+3)n*c0 <= 10 f n c0.
This is the required IsRow.eventually_isBalanced bound, with the native
constant unchanged. In TwistForRows the finitely many rows choose a
common coefficient ring using eventuality, and this is precisely h_rho,
h_beta passed to exists_anticyclotomic_twist with eta=c0. Its promised
B_i+eta then equals (10fn+1)c0. The independent value-family bound 9c0
is not changed. The twist theorem itself and the distinct quantitative
local defect/safety estimate in sum_blockLoss_le remain obligations.

## Provenance and execution ledger
Original actual caller graph:
TwistForRows -> RowBalanced -> {inClass, crystalline rank, obeying
relations, tame local length, determinant kernel, trace span, scalar
witnesses, place-count, normalized valuations}.
Reduced human graph: same caller and hypotheses, rank via exact BK
identity + retained bridges, two length inequalities via evaluation
and Smith, scalar mirror via trace cancellation, one uniform beta.
This is a local reconstruction, not a claim to remove native edges
globally. No original/reduced graph or axiom ledger overwritten.
Context cache key: compact pin, D, row, O,u, v and its placeOver, M,a,
embedding, actual consumer. No old-pin theorem substituted.

Actual CI result retrieved from cathedral-research-state:
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804, run 45803534769:
six named probes in TiltingLemma/Filling.Moments with only standard
axioms; module 1 timeout 124 (2700.11s); all_requested_checks_ok=false,
full_RH_replay=false. This does NOT verify this file.
Local lean/lake/elan absent. Native rh_scan/prune/reduce/auto/frontier
not executed in compact environment. Old CI 45577239749/45576756833
pertain to the old pin only. Prepared below: scalar certificate and
actual source theorem/axiom probes. No fabricated execution or PASS.
No import of the claimed RH conclusion as a shortcut.

RESUME HERE: independently audit this normalized RowBalanced bridge,
especially coefficient-embedding rank normalization. Next literature
task: quantitative near-invariant local safety at block_defect_le_at_place
and the distinct sum_blockLoss_le consumer, preserving all local
cup-product and crystalline defect hypotheses. Do not repeat the
already reconstructed Liu trace-limit bridge or scalar row budget.
-/

private theorem run65_row_count (f n q : Nat) (hf : 1 <= f)
    (hq : q <= 4 * f) : (q + 3) * n <= 10 * f * n :=
  Nat.mul_le_mul_right n (by omega)

#print axioms run65_row_count
#check IsRow.eventually_isBalanced
#print axioms IsRow.eventually_isBalanced
#check finrank_crysCocycles_eq_add_neg_jumps
#print axioms finrank_crysCocycles_eq_add_neg_jumps
#check length_obeying_relationsOn_le
#check length_localCocycles_le
#check length_ker_le_addVal_det
#check exists_mFoldTwist_selmerLengthLe
#print axioms exists_mFoldTwist_selmerLengthLe
