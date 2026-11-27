import New.Exchange.StandardCoefficients

/-!
# RUN71 — actual radical bridge and partner-data generator

27 November 2026. Human source-matched derivation; native certificate below
PREPARED, not executed. Completion-first mission blob
9f4a2272265e847b3a46422b02d4b37e976bee10, compact pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
RUN70 01809db99e2ca5c5d816688657d28d64c07c357e retained.
Latest peer titles inspected: 15bf637f (common coordinate correction),
4b2ec292 (formal height), 7cdfbc59 (adapted orbit), 6526a8e7
(one-vector normalization), 22990488 (zero-term), b66c0b19 (Taylor),
43ff3e37 (Fourier gauge), cbfdcc8a (CM vacuum), 327ee638 (editor),
55d81106 (integration), 21ccc35d (Ribet audit), 9ce5a9fb (energy).
Latest compact manuscript blob ea51739eda55a41749858377bc5635f7e9c49d41.
These were checked for assignment collisions by title, not all proof bodies.
No changes to any peer or shared ledger.

## 1. Shear-invariance theorem, exact averaging rather than pointwise claim

Source Lib/Weil/GaussSum/ShearInvariance.lean
1fe3a70f51455d1bfd976a4ad11661810ba91c7a, shear_invariant.
Let F be the actual semilocal field, O its compact integer ring,
s an integral b-by-n matrix, u a column, r a row, su=ru=0.
Write Q(y)=stdColDatum chi s y: zero unless y integral and sy
integrally invertible, otherwise chi(det sy)^(-1).
Let M be the source subspace of Schwartz-Bruhat data, Q and
Q_r(y)=Q(y+u r y) in M. Assume the actual functional invariance
Lambda( f(y+u z s y) )=Lambda(f) for every f in M and every row z.
For t in Mat_{n,b}(O), tau_t(y)=y+u r t s y, inverse tau_-t.
This is a compact additive parameter group. Haar probability
averages commute with Lambda on these functions: the joint
locally constant families in the native Schwartz-Bruhat space
have finite image on the compact parameter set (the source
isLocallyConstant_curry lemma); average is a finite linear
combination, no continuity of an arbitrary algebraic Lambda assumed.
The invariance gives Lambda(Q)=Lambda(avg Q∘tau_t), likewise Q_r.

Pointwise compare the two averages. If no row rho has
Q(y+u rho) nonzero, both vanish. Otherwise fix such rho and x=y+u rho.
Then x integral, sx=sy has integral inverse m; take t0=x m
integral. Since ru=0, r t0 sy=r x=r y. Because su=ru=0,
 Q_r(tau_t y)=Q(y+u r(t+t0) s y).
Translation t->t+t0 preserves compact additive Haar. Both averages
are equal for EVERY y, with t0 allowed to depend on y (not on t).
Hence Lambda(Q_r)=Lambda(Q). The orbit support premise is used
only for choosing the integral translating element. This proves
the actual shear_invariant input without asserting pointwise
invariance of Q under a nonintegral shear.

## 2. Actual all-A bordered radical invariance

Source New/Exchange/StandardCoefficients.lean
85616f797460e30c5134a146bd5220fadc28855c, lines 29–54;
Lib/Weil/MixedModel/EquivariantCoefficients.lean
9b779698c36ab64b5a1964a948cb7089587a3fce,
IsEquivariantLift.centreCoeff_shear and exists_linear_centreCoeff.
Lib/SiegelWeil/SingularForms/SingularForms.lean
c20825fdaddc310c665e54348390cd17ec47fd06, RadicalInvariant.

For every adapted comparison splitting A,B, every allowed w,nu,g,
and every bordered index R=[sigma1 sigma2;0 T], take the native
linear coefficient functional Lambda at the comparison point x.
The native read-at map is pi=componentsAt, and s is the integral
row-block (adaptedFrame readsAt D).L'. In the comparison frame the
source identifies this block with
 ((removePlanes b W).lCoord * A.iCoord * (nu*g).mat).map pi.
The native equality k is supplied by evaluating the conjugate
unitary form identity on the selected S component, using
lCoord.eq_1, star_notMem and mat_preserves_stdForm. It is not
a global equality of unrelated adelic frames. Preserve that
coordinate bridge as an explicit source-matched input until
the independent auditor checks the exact w,g,nu substitutions.

The shear action is y->y+u r y where
 u=(x^-1.mat*c).map pi, r=(krow*x.mat).map pi
in centreCoeff_shear, krow*c=0; for the actual radical c is
the carried isotropic line. The frame orthogonality gives su=0
and the nilpotent radical condition gives ru=0. Both data in M
by hPsi and centreCoeff_shear. For the auxiliary row z use the
native central parameter [0 z;0 0] at the SAME coefficient
functional, not a different functional. Its phase is trivial:
 R [0 z;0 0]=[0 sigma1*z;0 0], so trace is zero, also after
the invDifferent scaling and local read-at map. Consequently
Lambda(f(y+u z s y))=Lambda(f) for every f in M and z, from
exists_linear_centreCoeff. Section 1 gives equality on the
arbitrary radical shear. centreCoeff_shear relates this value
to the coefficient at nu^-1*x; taking x=nu*g gives the desired
coefficient equality at g and nu*g, with the source star-idem
orientation (its argument is Prod.star_def). This is exactly
RadicalInvariant at every A required by freitag, subject to
the coordinate bridge identified above. No division by
Lambda(Q) and no assumption that a zero coefficient is nonzero.

The native skew-Hermitian index deduction (from dual-family
periodicity) and weak approximation/automorphy remain explicit
inputs at the outer caller. RUN70 strong-index and inverse-row
steps retain their O-comparison guards.

## 3. Finite matrix Gauss sum: only singular support is needed

Source Lib/Weil/GaussSum/LocalHomUnit.lean
bee7de70e18e0ad7658f38984b4ff83e0ad1eb33,
exists_primitive_residue_addChar, matrix_gauss_sum.
Lib/General/Topology/LocalDefs.lean
8a83774755d15b9cb31d982a0c5afee42aa52e22, TameLocalChar:
eta is the cut-off INVERSE of chi on integral units, not chi.
Let R=O/(varpi O) in the source presentation via surjection pi,
phi primitive additive induced by phi(pi a)=psi(varpi^-1 a).
Let G(B)=sum_{v in Mat_b(R)} eta(det v) phi(tr(Bv)).
For invertible g, changing v->g v gives
 eta(det g) G(Bg)=G(B).
If B not invertible, the endomorphism of finite R^b is not
injective (a bijective linear map would give an inverse).
Choose 0!=a in ker B, a_i!=0. Primitivity of eta yields c
with eta(1+c a_i) neither 0 nor 1. The rank-one update
g=I+c a e_i^T has det g=1+c a_i, so g invertible and Bg=B.
Thus G(B)=0. This proves the needed implication over the
actual finite commutative residue ring, not only finite fields.
The full Fourier norm and Gauss-sum value are unnecessary at
this local caller. Keep them for other consumers.

## 4. Actual standard generator in the kernel

Source New/Exchange/StableSpaces.lean
38b5bd48274f38b35b66ebb7d6e48ac565636b86,
IntegralFrame.partner_mem_of_unimodular_vanishing.
Use exact frame K,I,L and inverse K',I',L'; in particular
K'K=L'L=1, K'L=L'K=0 and all blocks integral.
S_z(y)=stdColDatum chi K' (y+L z K'y).
The actual assumptions: S_z in M for ALL z, and any f in M
annihilated by every compatible functional belongs to P.
A compatible Lambda obeys Lambda(S_z)=psi(tr(Tz)) Lambda(S0)
and vanishes on S0 if T primitive integral.
Integral Z gives S_(z+Z)=S_z: the integral automorphism
I+L Z K' and its integral inverse preserve integrality and K'y.
Therefore if Lambda(S0)!=0, testing single-entry integral Z
and using HasIntegralConductor forces every entry of T integral.
Choose lifts l(v) integral with l(1)=1 and pi(l(v))=v.
Set F0=sum_v eta(det v) S_(varpi^-1 l(v)) in M.
Then Lambda(F0)=Lambda(S0) G(pi T) exactly.
If Lambda(S0)=0 this is zero directly (even when T not integral).
Otherwise T integral; primitive T gives zero by hypothesis;
nonprimitive T has nonunit residue determinant because the
native reduction reflects units. Section 3 then gives G=0.
Thus F0 belongs to P by the native compatibility test.
This removes the need for the full Gauss-sum evaluation at
this consumer; no assumption of unramified/trivial eta.

Apply the allowed GL_n(F) action -varpi^-1 I to F0.
Let p(y)=F0(-varpi^-1 y), s=L', x=L-varpi K.
For each v with a nonzero term define a=-varpi^-1 K'y.
Then a is integral invertible and
 z=-varpi^-1 y+varpi^-1 L l(v) a is integral.
So y=L l(v) a-varpi z is integral; pi(L'y)=v pi(a).
The nonzero eta(det v) forces v invertible and hence L'y
integrally invertible. In each such term
 eta(det v) invOnUnits chi(det a)
   = eta(det(pi(L'y))) = stdColDatum chi L' y.
It follows that p(y)=r(y) stdColDatum chi s y where r(y)
is the number of nonzero contributing terms, a nonnegative
integer. At x=L-varpi K: sx=1, a=1, v=1 has lift 1 and
z=K, so r(x)>=1. These signs depend on eta being inverse chi
and using varpi^-1 in S_z. No triangular estimate of phases.

## 5. Compact averaging generates every locally constant partner

Same StableSpaces, partner_mem_of_stdColDatum; PartnerAlgebra
33127494244b01a114c01867c73cb4c86df78970, IsPartner.right_mul;
PartnersMatch 35d11a9da3d9e95a287e2a2b23db12347f46ef4f.
Let p in GL_n(F)-stable P, p=r stdColDatum chi s,
r(x)>0, sx=1, s,x integral. Let Psi be any locally constant
partner. Its support is primitive integral, and
 Psi(y m) chi(det m)=Psi(y) for m in GL_b(O).
It is uniformly locally constant on the compact integral
matrix space: choose c so congruence mod varpi^c implies
equal Psi values there. This follows from local constancy and
finite subcover, matching the source's nilpotent-neighborhood
argument. Write e=xs, e^2=e, d=e+varpi^-c(I-e),
d^-1=e+varpi^c(I-e) integral. In particular d x=x, sd=s.
For compact K0=GL_n(O), form
 C=integral_K0 |p(d k x)| dk >0
(the integrand is continuous nonnegative and nonzero at 1).
Consider J(y)=integral_K0 Psi(k^-1 x) p(d k y) dk.
The vector-valued integrand belongs to P by stability and
scalar multiplication and is locally constant in k into the
Schwartz-Bruhat family, hence its integral is in P by finite
compact averaging. This does not assume P topologically closed.
For each nonzero p(d k y), put m=s k y=s d k y in GL_b(O).
Since d^-1 integral, y integral; m invertible gives an
integral left inverse m^-1 s k for y, so y primitive.
Integral d k y implies (I-e)k y in varpi^c Mat(O).
Hence k^-1 x m ≡ y mod varpi^c, and the partner law gives
 Psi(k^-1 x)=chi(det m) Psi(y).
Since |chi(det m)|=1, integrand equals |p(d k y)| Psi(y)
(including zero terms). For primitive y, compact transitivity
on primitive matrices gives y=k0 x for k0 in K0 (extend
both frames to bases), so right Haar invariance gives integral
of |p(d k y)| equal to C. For nonprimitive y all terms vanish.
Thus J=C Psi pointwise and Psi in P. This is the full
generator/averaging argument under the actual native partner
and Schwartz-Bruhat assumptions, not a claim about an
arbitrary noncompact orbit.

Apply with P=M intersect ker Dcal, stability provided by
IsEquivariantLift.comp_mul_mem_ker and actual compatibility
test supplied by StandardCoefficients via Fourier vanishing.
The represented-class base h0 still needs the exact
V'.exists_eq_move bridge, both represented and nonrepresented
cases, and the coordinate and dual-family bridge in section 2
need independent audit. No claim that this checkpoint alone
proves exchange theorem or star_inequality.

## Evidence and handoff

Original source-visible edges:
exchange_theorem -> exchange_of_partners -> stdExchange_of_periods
-> apply_stdColDatum_eq_zero -> freitag + partner_mem_of_unimodular_vanishing
-> shear_invariant / centreCoeff_shear / exists_linear_centreCoeff /
matrix_gauss_sum / partner_mem_of_stdColDatum.
Reduced human local support route: finite rank-one stabilizer
+ character primitivity -> G(singular)=0 -> common F0 in P ->
weighted standard generator -> compact average. No native node
deleted globally. Original/reduced graph artifacts and axiom evidence
preserved unchanged. Cache context: actual S, residue O/pi, eta
primitive inverse chi, psi conductor, frame, M/P, all Lambda and
all z, actual bordered T, all comparison points A, and pin.
No unverified standard theorem substitution.

Actual command -v lean/lake/elan returned no executable.
Actual state artifact compute/rh-compact-primitives-replay-20261126/
outputs/targeted_results.json blob 088cd2ec0e935ee1a282f10096949bcf671cc804
re-fetched: six named native Selmer/Filling checks with standard
three axioms; one module timed out (2700.11 s, return 124);
all_requested_checks_ok=false; full_RH_replay=false. No new
rh_scan/prune/reduce/auto/frontier or native replay; below
are prepared native probes and a matrix-associativity certificate
for the shared compact runner, not PASS. No protected edits.
No new RH-scale prime estimate established.

RESUME HERE: locate and reconstruct V'.exists_eq_move at
StandardCoefficients lines 70–77, preserving exact real signature,
local norm/Gram, global rational isometry and adelic transport;
audit section 2 coordinate identification k and star-idempotent
orientation and RUN70 O-comparison instantiations. Then integrate
the now explicit finite partner generator with exchange theorem
and the actual C caller; no further Gauss norm optimization.
HANDOFF TO integration/editor, formal audit, literature, native
runner. Human RH reconstruction incomplete.
-/

namespace CompactCharacterBoxes71

theorem right_translation {R : Type*} [NonUnitalNonAssocSemiring R]
    (y u r t0 t v : R) (h : r * t0 = v) :
    y + u * (r * t + v) = y + u * (r * (t + t0)) := by
  rw [mul_add r, h]

theorem stabilizer_cancel {a b : ℂ} (h : a * b = b) (ha : a ≠ 1) :
    b = 0 := by
  by_contra hb
  exact ha (mul_right_cancel₀ hb (by simpa using h))

#check shear_invariant
#check matrix_gauss_sum
#check IntegralFrame.partner_mem_of_unimodular_vanishing
#check partner_mem_of_stdColDatum
#check IsEquivariantLift.centreCoeff_shear
#check IsEquivariantLift.exists_linear_centreCoeff
#check IsEquivariantLift.apply_stdColDatum_eq_zero
#print axioms shear_invariant
#print axioms matrix_gauss_sum
#print axioms IntegralFrame.partner_mem_of_unimodular_vanishing
#print axioms partner_mem_of_stdColDatum
#print axioms IsEquivariantLift.apply_stdColDatum_eq_zero
#print axioms right_translation
#print axioms stabilizer_cancel

end CompactCharacterBoxes71
