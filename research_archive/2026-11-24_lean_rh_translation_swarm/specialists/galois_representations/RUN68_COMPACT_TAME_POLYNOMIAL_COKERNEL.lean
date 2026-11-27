import New.Selmer.OnePlaceDefect

/-!
RUN68 — tame polynomial descent at the actual crystalline defect caller.
27 Nov 2026. HUMAN SOURCE-MATCHED derivation of the tame exponent
supplier, conditional on explicitly retained integral period/frame
and chart foundations. No fresh kernel replay. Credit Alpöge,
Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 (latest,
completion-first and mandatory unified reduction); manuscript
52c0ccfd0dc525f446dd8bc935a7df71912c8709; AGENTS, protocol, handoff,
expansion, continuity and RUN67 read. Recent peers aee9e04a,
58afe07e, 4c982eab6, f5180dc9, d0a3d115, 5ddf30c7 checked.
The manuscript already has the exact uniform Stickelberger integer,
floorDiff subtraction and RUN63 length collection in section 6f:
do not redo those as new results. RUN67 literature gives outer tame
budget but explicitly retains tame_types_exponent. This run supplies
its polynomial/cokernel argument, not another numerical optimization.

Pinned actual source bodies (relative to grh-compact/src):
New/Lift/SparseThickLetters.lean c7ac57b4aca6855d8ed64542e0b247b221325395,
  exists_z_smul_eq_sum_tameGen, aeval_linearFrob_extLattice_eq_zero,
  killsCokernel_of_isKilledBy, exists_tameChart.
New/Lift/CokernelKillers.lean ba8a479cecd29393b86e3f320991c20baf108487,
  liftIdeal 62, mem_liftIdeal_iff 73, liftIdeal_le_of_p_pow_mem 95,
  p_pow_mul_z_pow_mem_liftIdeal_iff 113, exists_lift_of_mem_liftIdeal 120,
  mem_liftIdeal_zero_of_mem_one 149, exists_z_pow_mem_liftIdeal 178.
New/Lift/LongGap.lean a94786663aac435dfc1ec846046c87f00ddad141,
  scaledCupBounds_of_killsCokernel.
New/Lift/CupProductBound.lean a5dfa3dc1372433af295f751c4bd4917ed3e323c,
  extLattice, thirdSide, ScaledCupBounds.
New/Lift/ExponentTheorems.lean 00f2467f84012fb67b4788ace502a70c5d4eedfc,
  IsTameType, tame_types_exponent, mem_cupOrthogonal_of_scaledCupBounds.
Actual consumer source OnePlaceDefect 709e688740863f10dbbb284446ca20c0ba2a280a
and outer budget already derived in literature RUN67.

1. Polynomial on the extension, with no semisimplicity requirement.
Let s=d.tameGen, z the chart variable, xi=d.zetaE, e=d.e,
and let Y be the kernel lattice of a pairing side. The extension
is an exact sequence Y -> Ytilde -> C with trivial quotient C.
Suppose the monic polynomial q in Z_p[X] kills the actual
linearFrob(Y,s,0). The linear Frobenius is compatible with the
inclusion/projection (the exact native baseChange_linearFrob)
and is the identity on C (crystalline, degree 0). Thus
(Beta_tilde-I) maps into the image of Y, and q(Beta_tilde)
annihilates that image. Q=q(X)(X-1) kills Beta_tilde exactly.
This is aeval_linearFrob_extLattice_eq_zero; it is NOT an
assumption that the extension splits equivariantly.

The actual third side is (Y tensor Y')^dual(1), not Y tensor Y'.
Use the input monic annihilators of s^-1 on Y and Y' (the
hypothesis is for every inertia element and the reverse class
K(s^-1) supplies the matching q'). For monic annihilators a,b
of degrees d1,d2, the algebra Z_p[X,Y]/(a(X),b(Y)) is finite
free on X^i Y^j, 0<=i<d1, 0<=j<d2. The characteristic
polynomial of multiplication by XY is monic of degree d1*d2
and annihilates XY by Cayley-Hamilton, hence annihilates the
tensor operator in every coefficient algebra. The dual action
of s is transpose of the action of s^-1, and the Tate twist
has trivial degree-zero inertial Weil action. This proves the
required third-side monic annihilator degree <=N^2 without
diagonalizability or eigenvalue multiplicity assumptions.
If one annihilator has degree zero it is 1 and its module
is zero; the constant 1 then annihilates the zero third side.
Retain the native linearFrob functoriality, tensor/dual
compatibility and trivial degree-zero Tate action.

2. Actual integral z-divisibility before any valuation cost.
Write M=kisinAinf, N0=kisinModule for the extension. For an
invariant form mu and its scalar-extended functional l define
Lambda_g = g^-1 composed with l composed with rho(g), extended
to Bcris as in exists_z_smul_eq_sum_tameGen. On a tensor y,
Lambda_h(g y)=g Lambda_(hg)(y). On crystalline invariant
vectors, the actual degree-zero comparison gives
sum_j Q_j Lambda_(s^j)=0 by Q(Beta_tilde)=0; crystalline
admissibility makes these vectors span the scalar extension,
so this equality holds on the whole space. In particular it
holds when tested against the lattice basis forms. The frame
divisibility criterion (the exact frame_theorem.1.2.2.2)
tests divisibility by z on M using the theta specializations
of the invariant forms. Since s^j fixes Lambda and sends
z to xi^j z, each transformed conjugate form differs in
the chart by a multiple of z, using z_dvd_sub and
pow_smul_gal_sub_mem_span_of_dvd. On summing the forms the
common theta contribution vanishes by the displayed equality.
Consequently for every x in N0,
                Q(s)x in z M.
This is the actual source argument: z_dvd_of_dvd_E_pow_mul,
conjForm_mem_forms, basisValues and kisinAinf_le_fracSpan
are retained integral frame prerequisites. The step is not
deduced merely from theta vanishing or from an abstract
polynomial in the original Galois representation.

3. Descending the lift ideal: only roots modulo p cost p.
Use J_l(i)=liftIdeal(p^(kappa+1),l,i), and call its modulus R.
The exact lift condition is one common correction t and,
for EVERY constant c, a level-l lift of (f-R*t)constantAt_i(c).
Let n bound the positive jumps, n+kappa+2<p, e<=p^m.
The native exists_z_pow_mem_liftIdeal supplies a with
z^a in J_0(i) for all i, and (p-1)a<=e(n+kappa+1).
Hence a<e (n+kappa+1<=p-2). This inequality is strict
even if e=1; then a=0.

Let B(v)=#{k in (v,e): Q(xi^k) mod p = 0}, i.e. integers
v+1<=k<e. Show p^(m B(v)) z^v in J_0(i) by downward
induction from v=a; base by multiplication of z^a.
For the step v=k>0 to k-1, distinguish two cases.

GOOD k: Q(xi^k) mod p !=0. Use the native
exists_lift_of_mem_liftIdeal with f=p^c z^k. Its chart
correction t has t=w+z t1 by exists_z_dvd_sub_const,
where w is its constant term (fixed by s). Choose a lift x
of (p^c z^k-R*t)constantAt_i(c0), for arbitrary c0.
Apply Q(s), use Q(1)=0, s(z)=xi z, and section 2.
After dividing by z in M and taking the SAME letter projector
the resulting lift projects to
  [p^c Q(xi^k) z^(k-1) - R sum_j Q_j xi^j s^j(t1)]
       constantAt_i(c0).
The correction is independent of c0. The native wittMap
commutes with the action, and the letter is fixed by s
because s fixes Lambda; the source uses cancellation by
the unit z in W(Cflat) (not an inverse of z in A_inf).
Thus p^c Q(xi^k) z^(k-1) lies in J_0(i).
Q(xi^k) is a Witt unit and its image in A_inf is a unit.
Cancel this factor, leaving exponent c unchanged.

BAD k: Q(xi^k) mod p =0. Apply exact Frobenius shift
p^c z^k in J_0(i) iff p^c z^(pk) in J_1(sigma i).
The native mem_liftIdeal_zero_of_mem_one reduces pk to
p(k-1) with extra p-adic cost
  v_p((pk)!)-v_p((p(k-1))!) = 1+v_p(k) <= m.
There is precisely one multiple of p in those p integers;
k<e<=p^m gives v_p(k)<m. The output is
p^(c+m) z^(k-1) in J_0(i). No tame division at a bad root.
These two cases establish the induction, since
B(k-1)=B(k)+1 exactly at a bad k.

At v=0 the distinct residues xi^k (1<=k<e) are distinct
because xi has exact order e modulo p. The reduction of Q
is monic, nonzero, degree deg q+1, so B(0)<=deg q+1.
Consequently if m(deg q+1)<=kappa we obtain p^kappa
in liftIdeal(p^(kappa+1),0,i). Write I=liftIdeal(0,0,i).
This means p^kappa = j+p^(kappa+1)t with j in I.
Since p lies in the Jacobson radical of A_inf, 1-pt is
a unit, giving p^kappa in I (the native Nakayama step).
This is exactly KillsCokernel(i,kappa,0) for every letter.
It is independent of e except for its logarithmic upper
bound; no rank, ramification index or number of letters
multiplies the exponent. The native radical/initial
z-power and factorial descent lemmas are separate retained
foundations, not presumed consequences of Q(s).

4. Assemble actual tame exponent and hand to OnePlaceDefect.
Use the source e=lcm_{1<=j<=r}(p^j-1), f=r!, with
r<p by the actual numerical guard (r=0 is the trivial
degree bound case and f=1). Then p does not divide f,
e divides p^f-1 by j|r!, and e<=product(p^j-1)<=p^(r^2).
The native exists_tameChart constructs the chart with
this e. More concretely over the unramified field of
degree f choose roots of unity of order e and a root
varpi^e=p, yielding a tame extension; the actual chart
normal subgroup is the common stabilizer of the chart
and varpi, and its index is prime to p by the native
construction. Retain chart existence and the frame and
inertia representation comparison; ordinary existence
of the tame field alone does NOT supply this chart.
The source uses the finite inertial Weil action killed
by X^e-1 and the tame inertia identification to obtain
crystalline admissibility on the chart subgroup; this
is not an assertion of crystallinity over Q_p.

Set m=r^2, kappa=r^2(N+1)^2. For the two sides monic
annihilator degrees <=N, and third-side degree <=N^2.
Thus all three costs m(degree+1)<=kappa. Jump bounds
on the two sides and the third (-u-v-1) are covered by
n=b+6(W+eta) in the actual opposite-window guard;
the third side high terms cancel signs, leaving at most
b+W+eta+1 or W+1 or 2eta+1 (if eta=W=0 the original
strict guard and direct jump -1 handle the third; the
actual OnePlaceDefect has eta>=1). In the actual caller
eta>=1, hence n+kappa+2<p. The gap condition
NoMultipleNear for radius 6(W+eta) holds since every
integer in the windows about 0,+/-b has absolute value
<p. There are no nonzero multiples of p there. At a
tame chart differentExp=1 by its explicit definition
(and p does not divide e). Use the actual gap/cup walk
scaledCupBounds_of_killsCokernel with a=0 and all three
cokernel costs kappa. Its required exponent is
  3*(kappa+(48*(eta+W)+4)*differentExp)
  <= 3*kappa+150*(eta+W+1).
Thus scaled cup bounds on the SAME universal cocycles
give p^E Z_f inside cupOrthogonal via the native
mem_cupOrthogonal_of_scaledCupBounds. This fills the
supplier used in literature RUN67 section 2, which
already paid the actual local normLength bound in
OnePlaceDefect; do not redo that sufficient budget.
We specialize to the actual eta>=1 and retain the
exact general native statement for other consumers.

Graph delta (source-visible, not elaborated):
OnePlaceDefect -> tame_types_exponent -> chart existence,
linearFrob restriction and monic polynomials on Y,Y',third,
Q extension -> z-divisibility -> root-budget descent ->
all three KillsCokernel -> gap cup -> cupOrthogonal ->
normLength_defect_le. Original/reduced global graphs and
axiom ledger unchanged. No globally deleted dependencies;
retained primitives include frame divisibility/chart
existence, initial z power, Frobenius/factorial ideal
transport and cup walk. Cache key: compact pin, SAME p,
O, Gamma, chart, e, xi, actual pairing Y/Y'/C, q,q',
letter i, kappa and modulus p^(kappa+1). No URT.
No assumed RH, no import of Main or New.Main as a shortcut.

Execution: local command -v lean/lake/elan empty. Actual
compact CI state compute/rh-compact-primitives-replay-20261126/
outputs/targeted_results.json blob 088cd2ec0e935ee1a282f10096949bcf671cc804
read: six existing native TiltingLemma/Filling.Moments checks,
propext/Classical.choice/Quot.sound, A build timeout 124,
all_requested_checks_ok=false, full_RH_replay=false.
Old-pin rh_scan/prune/reduce/auto/frontier cannot certify
this compact replacement. No new native execution; below
are prepared scalar certificates and actual theorem probes.

RESUME HERE: independent audit of the good-root correction
and all three jump bounds at the actual eta>=1 caller;
then complete the sparse-thick/two-size shared
scaledCupBounds_of_cut_windows profile construction and
its long-gap cost at SparseThickLetters. Keep the earlier
integral period frame and initial z-power leaves open
until their exact suppliers are human-derived or matched
to accepted external theorems. Integrate this tame branch
with existing RUN67 outer local payment; do not count
the already derived odd-Sha argument again.
HANDOFF TO integration/editor, formal audit, literature,
and compact native replay. Human RH reconstruction incomplete.
-/

namespace RHGaloisRun68

-- Scalar certificates only; not proofs of their integral suppliers.
theorem root_cost (m roots deg kappa : ℕ)
    (hr : roots ≤ deg + 1) (hk : m * (deg + 1) ≤ kappa) :
    m * roots ≤ kappa :=
  (Nat.mul_le_mul_left m hr).trans hk

theorem cup_payment (kappa eta W : ℕ) :
    3 * (kappa + (48 * (eta + W) + 4)) ≤
      3 * kappa + 150 * (eta + W + 1) := by omega

#print axioms root_cost
#print axioms cup_payment
#check Lift.TameChart.exists_z_smul_eq_sum_tameGen
#check Lift.TameChart.aeval_linearFrob_extLattice_eq_zero
#check Lift.TameChart.killsCokernel_of_isKilledBy
#check Lift.exists_tameChart
#check Lift.KummerChart.PairingSide.mem_liftIdeal_zero_of_mem_one
#check Lift.KummerChart.PairingSide.exists_z_pow_mem_liftIdeal
#check Lift.tame_types_exponent
#print axioms Lift.tame_types_exponent

end RHGaloisRun68
