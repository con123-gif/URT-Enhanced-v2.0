import New.Rows.HeckeValueHeight

/-!
# RUN52 — rank-one test form, three block contraction
26 November 2026. SOURCE-MATCHED HUMAN DERIVATION / native replay outstanding.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 0abe4d55e789dd229081d1161cb7736895fe9885 (unified determinant
sprint, expanded workload, one URT lane). Manuscript blob
69030b2d01e9f0e786a004a21b6f0043ef84bc64; determinant contract
7ad9c7c64f53c621ad20422226ad9d0b756ee28e. Read AGENTS, SWARM_PROTOCOL,
handoff and continuity preflight. Prior lane c78302e2, character peer
2999f952 (K test form explicitly pending), audit bf254a7b, dependency
4bf30788 (comparison singleton detection, different branch).
No protected files or prior graphs changed.

## 1. Flat block: exact class-sum contraction

Source New/Rows/HeckeValueHeight.lean f61d2e3c521863d4f814e3338e37c4e2c2fd1f84
lines 58–82; New/Exchange/AlgebraicPartDefs.lean
7d791291bd2f9b6e9bd1a21b20254632c3a3606c (trivialLift, intAlgPart,
inner_trivialLift); New/Selmer/RankOneDenominator.lean
18776ac0e6b71a1f66075e9c7276e3aff757f18b (twistedCentralOp identities).

Let a flat pair q have rank r=2z, with all jet degrees zero. Fix the
native twist v, K_g the unscaled LValueData.kernelForm, T0 the class
sum of K_g, T=kappa^r T0 (kappa=P.vacuumScale D.s).
Write C=stdClassSum chosenLevel 1, M=D.chosenGroupOrder, d=q.denomBound,
Q=v.levelNorm. Use the weighted class sums of the actual levels,
not arbitrary unweighted sets. In this flat weight all coordinate
spaces are one-dimensional with Gram form 1.

The native twisted central operator is unitary in the relevant
adjoint sense, carries K_g to K_(gz) by its inverse, and fixes T0.
Consequently c=<T,K_g> is independent of g. Taking the chosen-level
class sum of the identity, using linearity in the second argument,
gives C c=<T,T0>, hence EXACTLY
   C kappa^r c=<T,T>=||T||².                (1)
No division by T or a possibly zero pairing. This is the constant
pairing used in smul_apply_xiSum, not a pointwise equality between
an individual kernel and the trivial lift.

The coefficient of F(h) in xiSum is M times the class-sum weight
times (d/Q^(r-1))*gramForm(1,d*T(h)).
Let L be the native conjugate-linear functional (innerSLFlip);
if L(F(h))=B A K_g(h) in the one-dimensional flat block, applying
L conjugates the coefficient. Since M,d,Q are real rational,
   L(xiSum F)= (M d²/Q^(r-1)) B A <T,K_g>.
By (1)
   C kappa^r L(xiSum F)= B intAlgPart(q,v) A.       (2)
This reproduces the exact native normalization with no extraneous
class count, extra complex conjugate of kappa, or loss from a norm.
A linear L would not justify this contraction.

## 2. Same four-block point form and coefficient detector

Source HeckeValueHeight lines 84–120 and New/Rows/MonomialCoefficientVector.lean
18eefab455e1da09f1ad14995afb31a9da4c1959
exists_int_vector_harmonicPoly_eq; New/Rows/MemberKernels.lean
be36c0175fe559376780b105052249fc0c9f1f4f pointForm, theta_pointForm.

Fix p.IsRankOne j, a twist v prime to ell, and the native flat
pairs q1=q (rank 2p.z-20), q2 (rank 4), q3 (rank 4);
q1 and q3 untwisted, q2 twisted by v. Fix the SAME alpha,x0
from depth_indicator_jet and the SAME character b satisfying
b * (b2*b3) * b1 = X.auxPair.b.
The block order is [12,(4,4),2p.z-20]. The native integral vector
c is the coefficient of the selected monomial in each integral
nabla basis polynomial. Fock pairing of monomials is diagonal with
factor alpha!, and the one-row hook product is prod_tau dg_tau!.
Since sum_i alpha_(tau,i,())=dg_tau, the harmonic polynomial of
star(c) is the embedded monomial multiplied by
   A_alpha = prod_tau dg_tau! / prod_(tau,i) alpha_(tau,i,())!.
This ratio is an integer by the multinomial formula. The same vector
is fixed by all matrices whose selected 12 columns are those of the
identity, since substitution leaves the specified monomial unchanged;
the native coefficient duality transports that fixed vector to the
Weyl representation. Do not replace this with an arbitrary integral
basis vector or assume a coordinatewise invariant for all matrices.

Use pointForm at h=block(1_12, h2,h3,h1), with chosen-place
residue columns [x0,I4_selected,I4_selected,I_tail_selected].
The lower selected rows alone give injectivity, even when x0=0.
The twist-place row selector lies in q2, not q1/q3. By theta_pointForm
the pairing <F(h1,h2,h3),X.kernelForm g> is a kernel with harmonic
polynomial A_alpha times the embedded monomial. The two conjugations
(theta_pointForm and reversing the inner product) cancel.

At the chosen places its residue indicator is a conjunction of
four separate block conditions. At twist places the determinant
character is evaluated only on the selected q2 rows; at chosen
places the other character factors are the specified flat data.
Thus the residue datum is the PRODUCT of the rank-12 indicator and
three flat block data, after lifting them to the common modulus
X.levelModulus 2. Native modDatum_factor (with ideal inclusion),
modKernelI_block, kernelForm_of_jetDeg_eq_zero then give exactly
   <F(h1,h2,h3),K_g^X>
       = A_alpha K_12(g) K_1(g,h1) K_3(g,h3) K_2(g,h2).   (3)
The equality of the product characters is needed for the same Weil
kernel. No claim that arbitrary off-block residue data factor:
the source uses matrix_ext_modulusResidue, hG (twist places not
chosen), and empty TwistIndex for the trivial blocks. The modular
and Weil tensor identities remain named native inputs; no new
factorization theorem for unrelated kernels is assumed.

## 3. One test form; three contractions, one normalization

Take exactly Xi = xiSum(q2,v) [h2 -> xiSum(q3,1)
              [h3 -> xiSum(q1,1)[h1 -> F(h1,h2,h3)]]].
All chosen U(1) levels agree with the X chosen level (twist changes
only Q). Apply (2) inside-out to (3), keeping the variables not yet
summed fixed. The three factors C*kappa^rank multiply to
C³*kappa^(2p.z-20+8). Consequently
   C³ kappa^(2p.z-12) <Xi,K_g^X>
      = A_alpha intAlgPart(q1,1) intAlgPart(q3,1)
                intAlgPart(q2,v) K_12(g).                 (4)
Here 2p.z-20+8 is the source natural-number expression; the written
2p.z-12 uses the rank guard 2p.z>=20. No division by kernel values.
No independent optimizing of Xi for each g. This is the equality
field of exists_test_form_inner_kernelForm at its actual caller.

## 4. Integrality and the required test-form annihilator

The same Xi must be a test form, not merely pair to (4).
At ell prime to levelNorm(v), each flat coefficient in xiSum is
integral: d is integral, Q a local unit, gramForm(1,d*T(h))
integral by point-kernel denominator bound; M clears stabilizer
orders (card_classAut_dvd_chosenGroupOrder). Thus each xiSum
preserves the integral submodule. The point-form vector c is integral
and fixed under the required chosen-column stabilizer; its gauge
at the block points and the delta-form gauge give integral F.
Three applications of xiSum_mem therefore give the SAME Xi integral.

For orthogonality fix a competitor y in the native Hecke kernel,
good-label image and theta-descent kernel of IsTestForm. Keep h2,h3
fixed and perform the inner q1 class sum, which is the untwisted
tail of rank 2p.z-20. At this point the summand has precisely the
pointForm/kernelVector shape in stdClassSum_period_eq_zero, with
N=the first 20 coordinates, selected twist row in the first block
part, tail representation of weight zero, x=1 and the fixed
residue columns. The coefficient from the flat q1 trivial lift
expands as a U(1) class sum; commute these class sums and use the
period lemma for each fixed U(1) class. The lemma's reflection
hypothesis follows from the native apt-rank-one label idempotent
and reflectionSum_mul_labelIdem, not from membership in the Hecke
kernel alone. Retain FitsParams, nontrivial twist characters,
2*card r+2*card N+3<card n, theta descent zero, tested Hecke root,
equivariant C map, support and residue stabilizer conditions.
The tail level fixes the flat residue indicator and the selected
columns: its chosen-place reduction acts by the tail block and
fixes its inclusion column; at twist places the selected rows
are off the tail. The native proof checks this with
map_block_eq_blockGL and mem_stabilizer_col_iff. This yields zero
for the inner sum, hence zero after the remaining xiSum weights,
even with conjugate-linear pairing. Do NOT replace the innermost
untwisted-tail period by a permuted arbitrary block.

Deep retained inputs: MemberOrthogonality.lean
aca8828d477a4510ab80964e1572f34ef220a2c1
stdClassSum_period_eq_zero and descentsVanish_hypSum (including
tower descent and period vanishing); depth_indicator_jet in
GluedFormTheta.lean c5f883f964a7a968320874ac8edad52a14678c3e;
local point-kernel denominator; harmonic coefficient duality;
rank-one label construction. This section is source-matched
reconstruction of their application, not a new proof of these
deep inputs.

## Caller and reduced graph

heightLe_inv_ratio (149–221) chooses alpha,x0, then z,psi by the
class Fourier selector and psi3,psi1 by multiplicative pigeonhole.
The flat pairs of those characters and the fixed q2 above enter
(4) in the actual K witness; insert (4) under the native class sum
over g*z using inner_trivialLift. The class count and vacuum powers
are then exactly those used in character peer 2999f952's paired
local height bound; no extra norm or absolute value before
cancellation. Keep t != 0 and the depth lower bound, common fit
family v=(theta_iota)^j, rank_one_bound, conductor guards and signed
repayment. This advances the C supplier of the unified determinant
contract, not the root by itself.

Original selected source edges: heightLe_inv_ratio -> test-form
existence -> {coefficient vector, pointForm, kernel factorization,
xiSum_mem, smul_apply_xiSum, period lemma}; period -> {tower descent,
reflection, Hecke root, stabilizer}. Reduced human edges: test-form
identity -> (3), (1), (2) repeated on the SAME F; test-form membership
-> integrality + innermost tail vanishing. No global dependencies
deleted, no axiom changes. Context key compact pin,D,j,p,v,ell,
alpha,x0,three flat pairs and chosen level. No reused cache entry
across incompatible witnesses or source pins.

## Controlled URT comparison and actual tests

The ordinary inside-out contraction reduces 3 independent scalar
sums to three sums and two multiplications. Optional fixed
pi/e+golden-angle priority (weights [2,1,1] for tail and two rank-4
factors; priority w_i*(1+(pi/e)*cos(i*theta)), theta=2pi/phi²)
orders [tail,q3,q2], instead of ordinary [tail,q2,q3].
All six scalar permutations have the same arithmetic count and
identity. Neither ranking provides a new period theorem; only
native tail-first argument retained for orthogonality. No speedup,
RAM or O(N) proof-search claim. The user algorithm is only an
ordering candidate, not an axiom.

Executed exact V8 Gaussian integer checks (abstract cyclic class
kernels, NOT computed automorphic data). 1,500 constant-pairing
assertions, 750 three-factor permutations. Omitting coefficient
conjugation fails 1,176 checks; replacing normalization C³ by C²
in a 3-class test fails 750. Reproduction (JS):
```
const z=(a,b=0)=>[a,b],add=(x,y)=>[x[0]+y[0],x[1]+y[1]],
mul=(x,y)=>[x[0]*y[0]-x[1]*y[1],x[0]*y[1]+x[1]*y[0]],
cj=x=>[x[0],-x[1]],sum=a=>a.reduce(add,z(0)),
prod=a=>a.reduce(mul,z(1)),eq=(a,b)=>a[0]===b[0]&&a[1]===b[1];
const vals=[z(-1),z(1),z(0,1),z(1,1),z(0,-1)],
perms=[[0,1,2],[0,2,1],[1,0,2],[1,2,0],[2,0,1],[2,1,0]];
let one=0,three=0,badConj=0,badNorm=0;
for(let j=0;j<125;j++){let t=j;
const k=Array.from({length:3},()=>{const x=vals[t%5];t=Math.floor(t/5);return x});
for(const vac of vals.slice(1)){const T=mul(vac,sum(k)), norm=mul(cj(T),T);
for(let g=0;g<3;g++){
const c=sum(k.map((_,h)=>mul(cj(T),k[(g+h)%3])));
if(!eq(mul(mul(z(3),vac),c),mul(z(3),norm)))throw Error("one");
one++; const wrong=sum(k.map((_,h)=>mul(T,k[(g+h)%3])));
if(!eq(mul(vac,wrong),norm))badConj++;}}}
for(let s=0;s<125;s++){const a=[0,1,2].map(i=>Array.from({length:3},
(_,j)=>vals[(s+i*3+j*2)%5]));const b=z(1,1),rhs=mul(b,prod(a.map(sum)));
for(const p of perms){let lhs=z(0);
for(let i=0;i<3;i++)for(let j=0;j<3;j++)for(let k=0;k<3;k++){
const h=[i,j,k];lhs=add(lhs,mul(b,prod(p.map(q=>a[q][h[q]]))))}
if(!eq(lhs,rhs))throw Error("three");three++;
if(!eq(mul(lhs,z(9)),mul(rhs,z(27))))badNorm++;}}
console.log({one,three,badConj,badNorm});
```

Native lean/lake not installed locally (command -v both empty).
Re-fetched actual status compute/rh-compact-union-graph-20261126/status.json
blob ea44d71556e0d21703e72fcd61bbaf2bee0ec563: run 45781154005
RESOURCE_BLOCKED before build, returncode 1. Latest branch orchestrator
45800685664 pending, 45800612145 in progress at retrieval; no native
PASS inferred. Older tools different pin, no compact rh_scan/prune run.
Prepared source audit and abstract scalar lemma below, not compiled.
External certification separate from incomplete human reconstruction.

RESUME HERE: integrate (1)–(4) and membership proof into C's rank-one
repayment section, independently check the source-matched period
application, then reconstruct depth_indicator_jet or the actual
tower-descent supplier (coordinate with theta/dependency workers).
HANDOFF TO integration, editor, audit, character boxes and kernel.
-/

#check Data.Pair.xiSum
#check Data.Pair.xiSum_mem
#check Data.Pair.smul_apply_xiSum
#check exists_int_vector_harmonicPoly_eq
#check Data.exists_test_form_inner_kernelForm
#check Data.heightLe_inv_ratio
#check stdClassSum_period_eq_zero
#print axioms Data.exists_test_form_inner_kernelForm
#print axioms Data.heightLe_inv_ratio

-- Prepared elementary scalar composition; no kernel execution claimed.
theorem run52_three_contraction (c1 c2 c3 y1 y2 y3 z a b1 b2 b3 : ℂ)
    (h1 : c1 * y1 = a * b1)
    (h2 : c2 * y2 = y1 * b2)
    (h3 : c3 * y3 = y2 * b3)
    (hz : z = y3) :
    (c1*c2*c3)*z = a*b1*b2*b3 := by
  calc
    (c1*c2*c3)*z = c1*c2*(c3*y3) := by rw [hz]; ring
    _ = c1*(c2*y2)*b3 := by rw [h3]; ring
    _ = (c1*y1)*b2*b3 := by rw [h2]; ring
    _ = a*b1*b2*b3 := by rw [h1]
