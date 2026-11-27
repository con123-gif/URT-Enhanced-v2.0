import New.Columns.LocalStatement
import Lib.Weil.Unramified.HeckeTransfer
import Mathlib.Tactic

/-!
COMPACT RUN69 — 27 November 2026. Split local Weil Hecke sum,
rank-defect factor and actual bilinear pairing transfer; exact marked
character norm. Human source-matched derivation, independent audit and
native replay outstanding. Credit Levent Alpöge, Luke Sernau,
Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10; manuscript
944957c6f43b63df7a845472b31492dc0ca1cb8f. Integration 219694f2 and
editor cbe51302 explicitly request actual marked Hecke; theta 3af9c4a3
covers conjugate isogeny transport separately. Reuse RUN60 80b36408
coefficient extraction and charge, RUN59 support, RUN61 index, RUN68
7fbfc4ba theta basis. Character RUN65 determinant filter already used
the finite q-binomial count at a different C caller; reuse its proof,
not its specialized X or its integrated period normalization.

Source ledger (all compact pin):
Lib/Weil/Unramified/HeckeTransfer.lean 9145e115beff2378fb879e699ce56a40149f62cd
  32–37 heckePolyOp_eq_sum; 49–51 det_maxCompactAt_eq_one;
  61–77 sum_heckePolyCoeff_smul_pairWeil; 86–96 hecke_transfer_of_equivariant;
  101–110 hecke_transfer_of_pairing.
Lib/Weil/Unramified/UniformiserScalar.lean 51969de5cd90a47fac42404faf1a7b4fcce39645
  8–11 AutChar.frobValue.
Lib/Weil/Unramified/HeckeGL.lean 923db13430eeb318ab80421c84b9a18a3d021ad3
  v_mul_inv_le_one_iff, basicCosetRep_spec, heckeGL_eq_sum, inverse coset sum.
Lib/Weil/Unramified/SphericalHecke.lean 37493fc793c98f8e31d1d2e101e77a4ac2a4023b
  20–80 sphericalAt, heckeSplit_star, heckeSplit_adjoint;
  160–170 heckePolyOp; 232–235 heckePolyOp_adjoint.
Lib/ClassField/HeckeCharacter/CharacterConjugates.lean
  aeadd310d540e48ae4c0ce8d129330d6c413cc66 125–133 norm_padic_eq_prod.
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
  50–101 exists_hecke_transfer; 106–194 actual gauge consumer.
New/Columns/JetExponentBound.lean bedef08c7c1707f74e9afce0c8008b88ba37dc8a
  86–97 marked symmetry and valuation_p.
PairSumNegation.lean pairWeil_name_on exact signature inspected via
repository search at compact pin; retain this mixed-model formula as
an input, not an independently established global Weil construction.

1. Pointwise finite local Hecke calculation on the SAME vacuum datum.
Fix w split with residue field of q elements, source rank n, target
rank m=n+k, unramified characters a,b at w and f fixed by the native
projection (S.hom T).projOn {w}. This is stronger than merely a
spherical image; keep the actual vacuum hypothesis hf.
Let alpha=a.frobValue n w, beta=b.frobValue m w, both nonzero:
alpha=chi_S(varpi) q^(n/2), beta=chi_T(varpi) q^(m/2).
Native heckePolyOp uses coefficients (-X)^i q^binom(i,2), no
additional normalization. Denote P_d(Y)=prod_{j=0}^{d-1}(1-q^j Y).

In the split mixed model, write the integral matrix z as m by n.
For each i-dimensional residue subspace U choose gamma_U from
basicCosetRep, with residue kernel U and elementary divisors
varpi (i copies) and 1 (others). By heckePolyOp_eq_sum the target
acts by h=gamma_U^t; the conjugate-place source acts by
g=gamma_U^(-1). The exact local action on a name is the scalar
chi_S(det h)/chi_T(det g) times |det g|^(m/2)/|det h|^(n/2),
with matrix substitution z -> h^(-1) z g.
For target h, det has valuation i; this contributes alpha^i.
For conjugate source g, det has valuation -i; this contributes
beta^i. Unramifiedness removes all unit factors. These statements
use the unitary split embedding and the same uniformizer convention
as frobValue; no complex absolute value is used on characters.

The target support test (gamma_U^t)^(-1) z integral is equivalent
to z integral and U subset ker(zbar^t), by transposing and applying
v_mul_inv_le_one_iff. For source z gamma_U^(-1) integral it is
equivalent to z integral and U subset ker(zbar). For completeness:
if the transformed matrix is integral, multiply by gamma_U to
recover integrality of z; reduction gives the kernel condition.
Conversely varpi gamma_U^(-1) is integral and each of its residue
columns belongs to U, since gamma_U(varpi gamma_U^(-1))=varpi I.
The kernel condition makes z(varpi gamma_U^(-1)) divisible by varpi,
so z gamma_U^(-1) is integral. The transpose version is identical.
Thus both sums vanish off the integral box, and for integral z
with r=rank(zbar), dimensions of the kernels are m-r and n-r.

Reuse the q-binomial identity for every d:
sum_{U <= F_q^d} (-Y)^dim(U) q^binom(dim(U),2) = P_d(Y).
Proof: with a fixed hyperplane, a j-subspace either lies inside
or meets it in a (j-1)-subspace; for each such intersection there
are q^(d-j) lifts. Multiplying by q^binom(j,2) gives exactly the
coefficient recurrence for (1-q^(d-1)Y)P_{d-1}(Y), including d=0.
At the SAME f and X the target sum is therefore named by
P_{m-r}(alpha X), and the conjugate-source sum at parameter Y
by P_{n-r}(beta Y). This proves the two fields of the native
sum_heckePolyCoeff_smul_pairWeil, using its actual local action,
coset representatives and linearity of names. It is not an
eigenvector calculation or a restricted scalar test.

2. Factor the rank defect before any averaging.
Because r<=n and m=n+k, for all residual ranks (even r=n),
  P_{m-r}(alpha X) = P_k(alpha X) P_{n-r}(q^k alpha X).
Set Y=q^k alpha/beta * X (beta nonzero). The target sum is exactly
P_k(alpha X) times the conjugate-source sum at Y, as a vector
identity in the Weil representation. The factor is independent of
z, so can leave the name and commute with every linear pairing.
No division by P_k or by a possibly vanishing Hecke polynomial.
Note q^k alpha/beta = q^(k/2) chi_S/chi_T; the actual Lean
formula uses q^k and frobValue, NOT q^(k/2) times frobValue ratio.

At compact groups the local action on hf is the identity: the
integral box is preserved and both determinant characters are
unramified, determinant norms 1. Applying any equivariant linear
map gives spherical vectors and the above Hecke identity in both
representations. This supplies hecke_transfer_of_equivariant at
86–96, without an assumed Hecke eigenvalue.

3. Transfer through the actual bilinear caller without extending B
to the full ambient space.
Keep precisely hB of hecke_transfer_of_pairing 101–105: for every
g,h,v there is Psi in the domain M with value omega(g,h) f and
rho(h) B(f,v)=B(Psi,pi(g)v). Since inclusion of M is injective,
Psi for fixed g,h is uniquely determined and independent of v.
Let M0 be span of the local orbit of f under G_source(w) x
G_target(w). Every orbit vector belongs to M by hB; M0 is stable
by representation multiplicativity. Define L on M0 by
L(u)(v)=B(u,v). On Hom(W,Z) use the commuting actions
A(g)F=F o pi(g^(-1)), R(h)F=rho(h) o F.
Replacing v by pi(g^(-1))v in hB yields
L(omega(g,h)f)=R(h)A(g)L(f).
By translating f and using the representation multiplication law,
the same equality holds on each orbit vector, hence on M0.
Only the orbit span is required; no extension outside M, no
assumed invariance on all of M, and no new choice of lift datum.

F=L(f) is spherical for both Hom actions. Indeed compact source
or target fixes f by hf and unramifiedness, then the preceding
identity implies the corresponding compact action fixes F.
The vector identity of section 2 lies in M0. Applying L:
  H_w^R(X) F = P_k(alpha X) H_barw^A(Y) F.
Evaluate on the original spherical v. The bilinear evaluation
E(F,v)=F(v) satisfies E(A(g)F,pi(g)v)=E(F,v). Thus the spherical
Hecke adjoint relation (SphericalHecke 232–235) gives
  (H_barw^A(Y)F)(v)=F(H_w^pi(Y)v).
It is the conjugate-place adjoint, with NO conjugation of Y
since evaluation is complex bilinear. The normalization on both
sides is the same unnormalized coset count. Consequently
  H_w^rho(X) B(f,v)
    = P_k(alpha X) B(f,H_w^pi(q^k alpha/beta X)v).
Target compact invariance also gives B(f,v) spherical. This is
exactly hecke_transfer_of_pairing, the missing single-stage
supplier in RUN60. It is a source-matched human proof, retaining
the local mixed-model action, coset identities and adjoint;
the finite/global Weil construction is not inferred from it.

4. Marked-place character norm at LocalStatement 65–73.
Use the same marked l in Lambda, stage e, good datum, prime p
coprime to twist norm, and chain character mu with its native
HasWeight w_e. The finite idele a_l is a uniformizer at l,
1 elsewhere; its norm-one ratio u=a_l/star(a_l) has archimedean
component 1. The baseChange value mu(u) is mu.baseChange.atUnif l.
For each CM embedding tau, the native valuation_p gives
|a_l,tau|_p=p^(-1) if inducedPlace(tau)=l, otherwise 1
(the unit choice of uniformizer does not affect this value).
For star(a_l) use the conjugate place. Thus norm_padic_eq_prod
gives p to the power
  sum_tau w_e(tau) [1_(inducedPlace(tau)=l)
                     -1_(star inducedPlace(tau)=l)].
The sum is ZERO by IsMarked.sum_inducedPlace_sub_star_eq_zero
with G(c,w)=c if w=l, else 0, l in Lambda.
Hence |iota_p(mu.baseChange.atUnif l)|=1, stronger than the
native <=1 needed for I(e). This is independent of the choice
of x in Psi.support. No inference from complex unitarity;
the algebraic HasWeight product and marked permutation are essential.
The original source uses a negative sign in G, also gives zero.

At LocalStatement 79–101 the unramified characters, projected
translated datum and lift_equivariant are the SAME hypotheses
provided by the actual good-datum caller. Insert the pairing
identity with k=D.t+1 and n=D.n e. The character ratios and rank
scales are those in RUN60; its Q_e(U) coefficients integral by
the just-established I(e). Its formal coefficient inverse
and p^delta denominator payment then give the same c_i for all
x and spherical phi, before the marked-gauge transfer.
This attaches a genuine single-stage supplier to RUN60, not
another restatement of the eventual prime error. Keep its original
gauge/CM jet and index premises and all other A/B/C leaves.

Source-visible graph: local split name action + elementary divisor
coset and q-binomial -> sum_heckePolyCoeff_smul_pairWeil -> rank
factor -> hecke_transfer_of_equivariant / pairing ->
exists_hecke_transfer <- marked symmetry + norm_padic_eq_prod ->
exists_move_markOperator -> gaugeLe_markOperator_pow ->
exists_indexDvd_Bmu_divisible -> Data.short_forms -> star_inequality.
Orbit-span restriction replaces full ambient extension only at this
caller. Original/reduced native graphs and all axiom evidence remain
unchanged; no kernel edge deleted. Cache key: compact pin, w, wbar,
a,b,n,m,f,hf, B,M,pi,rho,v, X, actual D,p,Lambda,l,stage e.
No URT or imported RH theorem. No finite simulations. Local command
-v lean/lake/elan returned no paths. Old-pin rh_scan/prune/reduce/
auto/frontier cannot be replayed against compact here. Actual
status and targeted_results reread on cathedral-research-state:
a56e2d3afb99ed8275e81fd63c8494306e57c43f,
088cd2ec0e935ee1a282f10096949bcf671cc804, run 45803534769.
Six B/C named audits standard three axioms; A timeout 124 at 2700.11s;
all_requested_checks_ok=false; full_RH_replay=false. Wrapper job
success does not change this. New scalar certificates and native
probes below PREPARED ONLY; no new native PASS or full proof.

RESUME HERE: independently audit source/target inverse-transpose
and character atUnif signs, orbit-span argument and exact stage
rank rescaling in LocalStatement 79–101. Then discharge remaining
native local mixed-model name action at PairSumNegation.pairWeil_name_on
and canonical CM pullback multiplier (coordinate with theta lane);
integrate RUN60/69 at actual exists_hecke_transfer and gaugeLe_Bmu_of_isMarked,
retaining all still-open standard datum, finite Weil, CM and index
suppliers. HANDOFF TO integration, editor, theta, formal audit,
kernel and shared compact runner. Human RH reconstruction incomplete.
-/

namespace PrimeWindowRun69

theorem rank_defect (m n k r : ℕ) (h : m = n+k) (hr : r ≤ n) :
    m-r = k+(n-r) := by omega

theorem split_parameter (q a b X : ℂ) (hb : b ≠ 0) (k : ℕ) :
    b * (q^k*a/b*X) = q^k*(a*X) := by
  field_simp <;> ring

theorem character_norm_cancel (p : ℝ) (hp : 0 < p)
    (u v : ℝ) (h : u=v) :
    p ^ (u-v) = 1 := by rw [h, sub_self, Real.rpow_zero]

end PrimeWindowRun69

#print axioms PrimeWindowRun69.rank_defect
#print axioms PrimeWindowRun69.split_parameter
#print axioms PrimeWindowRun69.character_norm_cancel
#check sum_heckePolyCoeff_smul_pairWeil
#check hecke_transfer_of_equivariant
#check hecke_transfer_of_pairing
#check heckePolyOp_adjoint
#check AutChar.HasWeight.norm_padic_eq_prod
#check Data.IsGoodDatum.exists_hecke_transfer
#print axioms sum_heckePolyCoeff_smul_pairWeil
#print axioms hecke_transfer_of_pairing
#print axioms Data.IsGoodDatum.exists_hecke_transfer
