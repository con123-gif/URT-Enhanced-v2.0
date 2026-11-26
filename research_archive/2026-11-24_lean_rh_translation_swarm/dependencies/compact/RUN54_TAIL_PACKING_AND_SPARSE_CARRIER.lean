import New.Rows.NaturalFormNear
import Lib.Weil.DualPair.KernelDecay

/-!
# RUN54 — reconstruct actual C tail and sparse-carrier suppliers
26 November 2026. HUMAN SOURCE-MATCHED, native candidate NOT COMPILED.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; manuscript
75252eaa39ca90a6bcab5bb1a085f7f35577def5; preceding dependency
2a8439aac6affdbdfab0fbfae7bbcaff42819bf4. Latest peer heads reviewed
f4015a8765ce (native primitive checks), bb09b6c2 (graph frontier),
0807db85 (editor), 40f4331a (integration), 2e075352 (B shell).
This is compact dependency lane 13, historical lane 12. No URT, no RH root import.

## Source ledger (paths relative to grh-compact/src)
Lib/Adelic/QuotientMeasure/Packing.lean 498aaa596eb8176d0ee865c61f94e8391a478f7a
  integral_rpow_neg_le_of_layers, encard_le_of_separated, tsum_inv_pow_le_of_separated.
Lib/DiscreteSeries/Haar/RegularRepL2.lean 6a3f37e076f6d5fce2dc6943adf74cf3b003e7e8
  measure_ball_le_covering.
Lib/DiscreteSeries/FlenstedJensen/TailBounds.lean 3c13565c8bfecf91497747b0fe7cd7e39e50369c
  norm_dsCoeff_sub_le, half_le_norm_dsCoeff, measure_ball_le_integral_dsCoeff, integral_tail_le.
Lib/DiscreteSeries/FlenstedJensen/PsiDecay.lean 2ca9efe4949fe0b10512153a3562daf2b97d2edf
  norm_dsCoeff_le_pow.
New/Rows/SparseThetaSum.lean 7c3ab33ebfb2e34b81e79db63a2decc029146d53
  integral_mul_holMinorsPi_le, firstMinimum_mul_le_hom, dataInner_traceChar,
  norm_modKernel_sub_realInner_le.
New/Rows/NaturalFormNear.lean 2393479c4efe2c146f1251298992c00021cba4c8
  Data.exists_fNatural_approx (consumer).
New/Weil/FockCoeffDecay.lean c0227b0795c824d1cbfe815bb33e30f153defba5
  norm_realInner_realHeisOp_le.
Lib/Weil/Fock/ReproducingFormula.lean b80ae30bd3a91d5d2c107aa662a612f0fba8bb6b
  reproducing_formula_modKernel.
Lib/Weil/DualPair/KernelDecay.lean 591247fdbe42900da1ac55c3c9d2ff733f235804
  exists_norm_name_le, Space.exists_short_isotropic, name_eq_zero_of_invariant.
Lib/Weil/Fock/FockHarmonicCoeff.lean a2d4e8450b0f5daea826885ad4ec55ddbc3bf076
  exists_enorm_le_mul_weightedNorm_of_sub.
New/SiegelWeil/DescentsVanishPlanes.lean 837e8a95ebb14d58a1e379cbba0426fc79b652b3
  descentsVanish_add_planes (boundedness consumer).

## 1. One layer-cake identity supplies both real tails and lattice sums
For measurable u>=1 and finite C0 with measure{u<=R}<=C0 R^d for
R>=1, Tonelli on the nonnegative integral gives, for A>d,
  int u^(-A) = A int_1^infty R^(-A-1) measure{u<=R} dR
              <= C0 A/(A-d).
No boundary atom is lost: the integral from u to infinity is exactly
u^(-A), including u=1. Thus the function is integrable.
For m-separated points in a real normed space of dimension d, disjoint
open balls of radius m/2 around centres of norm <=R lie in the ball
R+m/2. Comparing Haar volumes on every finite subset gives
N(R)<=(1+2R/m)^d. This also gives local finiteness and countability.
When every centre has norm >=m, apply the layer formula with u=norm/m
and counting measure; N(mR)<=(3R)^d. For integer k>=d+2,
  sum norm^(-k) <= m^(-k) 3^d k/(k-d) <= (5/m)^k.
Indeed k/(k-d)<=1+k/2 and (5/3)^k>=1+2k/3 by Bernoulli,
and d<=k. This retains the native constant 5 and exact gap. It is
not a numerical estimate or an assumption of a regular lattice.

## 2. Actual formal-degree bound and the global isolation moment
Let n=card n>=1, beta=n+L+1, psi the lowest K-type coefficient,
D_l=formalDegree=1/int |psi|^2>0. Haar measure and norm as in source.
The native Lipschitz lemma gives |psi(g)-psi(1)|<=100 beta^5||g-1||,
so |psi|>=1/2 on the radius 1/(200 beta^5) ball about 1.
Its measure is at most 4/D_l by integrating |psi|^2 there.
For ||g||<=R, R>=1, maximal centres separated in matrix operator norm
by 1/(D R), D=200 beta^5, give at most (1+2 D R^2)^(2n^2)
centres, using real dimension of complex n-by-n matrices. For each g
in the ball, choose a centre h with ||g-h||<=1/(D R). Then
||g h^-1-1||<=||g-h||||h^-1||<=1/D, since ||h^-1||=||h||.
Right-invariance yields the cover bound, also valid for the source
homomorphism j and offset y by taking g=j(s)y, h=j(t)y.
As 1+2 D R^2<=3 D R^2<=2000 beta^6 R^2, we get
  D_l measure{||g||<=R} <=4(2000 beta^6)^(2n^2) R^(4n^2).
Use section 1 with c>8n^2, so c/(c-4n^2)<=2, to obtain
  int D_l (2/||g||)^c <=8(2000 beta^6)^(2n^2) 2^c.
This is precisely the tail supplier consumed in SparseThetaSum and
also in BesselCut/RowsReached; no reliance on those downstream lemmas.
The Lipschitz lemma still uses the Casimir derivative estimate for
the rational Cayley path and the coefficient normalization; these
are retained as explicit native inputs, as is the large-gap theorem.

Now f=numInfPlaces, mu>=2 f n^3, B>=10^13, mu<=B, N<=6mu,
c=10 n^3, L=2 floor(B)+n. Native holomorphic-chamber identity at
gap 300mu gives parameter gap >=500n^3+8mu and both coefficient
decay and positive formal degree at each infinite place. Check
500n^3+8mu+n+1<300mu, c>8n^2 and c+N<=500n^3+8mu.
The latter is the actual gap threshold, NOT merely 8mu.
For a tuple h select a maximizing place a for norm(h_a).
The coefficient of weight w has decay exponent c+N at a and c
at every other place. Therefore before integration
  |A(h) M_w(h)| <= C 2^N prod_tau (2/||h_tau||)^c.
There is no sum over maximizing places and no f-fold N penalty.
With J=int |M_k|^2=prod_tau 1/D_(k,tau)>0, Fubini and the
tail theorem give
  |int A M_w|/J <= C 2^N [8(2000 (5B)^6)^(2n^2) 2^c]^f.
Here beta<=5B since n<=mu/2<=B/2 and B>=1.
The power of B is 12 f n^2<=6mu, the two-power exponent
fc+N<=11mu, and f<=mu/2, 2fn^2<=mu. Hence the remaining
constant is at most [8*2000^2*5^12*2^22]^(mu/2)<=B^mu.
Thus |int A M_w|<= C B^(7mu) J, with the integrable product
majorant already displayed. This supplies exactly the coefficient
moment consumed in RUN53 isolation and Data.exists_fNatural_approx.
No extra assumptions or altered quantitative scale.

## 3. Sparse-carrier approximation: exact Fourier filter before norms
Keep the same S,T,a,b,modulus, g,h, scalar c0!=0, and homogeneous
polynomial P of degree d; write v=polyVector P, q>f n n'.
The native lattice after moving Hom(S,T) consists of rational y
with c0*y integral. The condition
mu |Phi_tau(c0)|<=sqrt(2*pi*Im Phi_tau(j))*lambda_Hom
gives real norm of each nonzero y at least mu, using the actual
archCoords scaling, and differences obey the same guard.
The real dimension is 2 f n n', so 2q>=2 f n n'+2.
The first minimum of Hom used at the caller is obtained by choosing
the short rational basis Y of S: for any nonzero integral map A,
some A Y_i is nonzero, hence lambda_T<=||A Y_i||. The source
matrix/coordinate bound gives ||A Y_i||<=||A||_arch * n'n *
shortBasisConst/lambda_S, yielding exactly the native bound
lambda_Hom>=lambda_S lambda_T/(shortBasisConst*n'n).
Retain the different-ideal membership, nonzero ranks and short-basis
supplier, not just a real-space basis.

Define the native finite character combination
  Psi=E_t conjugate(modKernel(traceChar(t);g,h))*traceChar(t).
The expectation is over the full finite residue matrix group.
After theta unfolding, the normalized finite character average
is 1 if its reduction argument vanishes and 0 otherwise, by
translation by an element on which the nontrivial character is
not 1. This needs the actual primitive additive character and
trace pairing; a single character is not sufficient. The zero
rational vector contributes precisely realInner(v,realPairWeil(u,u')v).
The nonzero terms surviving the filter lie in the above c0-scaled
lattice by the native modulus integrality condition. Their phases
and vacuum factors have modulus at most 1. By FockCoeffDecay with
A=d+q, decay order q, each surviving term has modulus <=
  (4(d+2q))^q ||y||^(-2q) ||sigma||^(fnn'+2q) <v,v>,
where sigma=pairHomInf(u,u'). Its norm is at most
maxOpNorm(u) maxOpNorm(u'), both >=1. Apply section 1 to sum
BEFORE any bound on the number of terms:
  error <= (100(d+2q)/mu^2)^q
           (maxOpNorm(u) maxOpNorm(u'))^(3q) <v,v>.
This is the exact sparse-theta estimate at NaturalFormNear, including
the degree, level, and rank conditions. The nontrivial analytic
Fock coefficient estimate and native theta unfolding are retained.
The remaining carrier step is the exact reproduction coefficient
family and strict epsilon inequality; do not infer it from sparsity.

The reproduction formula itself follows by finite-dimensional
duality in the space of functionals (the original form space need
not be finite dimensional): if K vanishes on the common kernel
of finitely many L_i, factor K through the linear image of
psi -> (L_i psi)_i, extend the linear functional on the image to
the finite coordinate space, and read its coefficients. In the
native caller, the common-kernel implication uses stable-range
theta injectivity plus the span of translates of the holomorphic
vector at every standard class and the exact principal-level
covariance. These hypotheses, not just abstract linear duality,
are needed. Source reproducing_formula_modKernel; no independent
proof of stable-range injectivity in this run.

## 4. Boundedness branch: actual small-shift supplier, not a new bound
At descentsVanish_add_planes the source sets ell=theta-theta zeroTerm,
N=0, rho=height(V.move h)=1 because V is definite, H=height(W'.move g).
The native KernelDecay estimate is
  |L(v tensor Psi tensor f0)| H^N <= C mom_(N+A)(v) rho^(N+2A).
To reconstruct its key reduction put t=C0 rho/H with C0>=2.
If t<1 then H>2, so the source supplies short integral columns
d,c, one isotropic, with coordinate-norm product <=2Z rho/H.
Isotropy makes the Heisenberg translations Kz additive (central
commutator vanishes); rational invariance gives a periodic function
of z. Use a fixed bounded adelic fundamental domain and a fixed
nonzero integer M clearing finite components into the stabilizer
of name(P,Psi,f0). Multiplication by M is bijective on adeles,
so this does not restrict the family of shifts. Archimedean shifts
are bounded by C0 rho/H, where C0 absorbs M, domain bound, scaleIdele,
ranks and Z. All these depend on the fixed data, not g,h,H.
For the full-support nonannihilation alternative the quotient
mean is zero by name_eq_zero_of_invariant; subtract the mean
before bounding. For the other alternative (the actual descent
caller), the hypothesis already bounds L by the supremum of
the shift differences. Both give the precise small-shift guard
for exists_enorm_le_mul_weightedNorm_of_sub at order N+A.
The operator-norm bound on L restricted to the named finite
vector is at most fixed_const*(rho H)^A. Multiplying by
t^(N+A) and then H^N gives fixed_const*rho^(N+2A).
When t>=1 the Fock lemma needs no difference guard. This is the
actual uniform boundedness mechanism; it retains the Fock
weighted-norm lemma, rational-periodic stabilizer/coordinate
transports and adapted splitting supplied by the caller.
No claim that theta lift is bounded merely by automorphy.
N=0 and rho=1 give the uniform bound needed in RUN53 Hecke induction.

## Graph and verification
Original edges preserved:
C -> comparison -> isolation -> moment -> tail -> covering + Lipschitz
C -> comparison -> NaturalFormNear -> sparse -> packing + Fock decay +
  character unfolding + Hom first minimum -> short basis
C -> comparison -> descent -> KernelDecay -> Fock small-shift +
  stabilizer + adapted geometry.
Candidate shared node layer-cake for tail and packing, with distinct
measure (Haar vs counting), exponent, norm and source context; no
claim of global deletion or full kernel DAG. Cache key includes pin,
measure, norm, dimension, exponent, rank/weight and caller role.
No old source/graph/axiom evidence overwritten. No additional
essential root obligation independently closed.
Local command -v lean/lake returned no executable. Actual RUN28
45799225653 jobs succeeded, but do not check this certificate.
Independently fetched RUN29 state status a56e2d3afb99ed8275e81fd63c8494306e57c43f
and targeted_results 088cd2ec0e935ee1a282f10096949bcf671cc804:
six native B/C declarations checked with only standard three axioms;
A build timeout 124, overall task error, not PASS, not proof failure.
No new CI job, no new Lean axiom claims. Candidate scalar checks below
are prepared for shared native replay. Native engines on original pin
are not evidence for this compact candidate.

Actual local Python exact checks: constant 32768000000000000000000
<10^26; 4000 rank/exponent endpoint checks (n 1..50, f 1..20,
mu=2fn^3, N=0,1,6mu-1,6mu); 5050 exact rational packing checks
(d=0..100,k=d+2..d+51); 4355 cyclic character-support checks
(q=2..11, a,b,t=0..q-1, redundant t loop), not a test of all finite
residue fields or native Fourier unfolding.
First exploratory guard c+N<=8mu failed; corrected to source
gap 500n^3+8mu and reran all checks successfully. No claim of
new coefficient estimates from numerical testing.
-/

namespace DependencyRun54

lemma tail_layer_factor (c D : ℝ) (hD : 0 ≤ D) (hc : 2*D < c) :
    c ≤ 2*(c-D) := by linarith

lemma formal_degree_constant :
    (8 : ℕ)*2000^2*5^12*2^22 < 10^26 := by norm_num

lemma global_tail_exponent (f n mu N : ℕ) (hf : 0 < f)
    (hn : 0 < n) (hm : 2*f*n^3 ≤ mu) (hN : N ≤ 6*mu) :
    10*f*n^3+N ≤ 11*mu := by omega

lemma sparse_constant (d q : ℕ) :
    (4*(d+2*q)) * 5^2 = 100*(d+2*q) := by ring

lemma shift_budget (rho H C0 : ℝ) (hr : 0 < rho) (hH : 0 < H)
    (N A : ℕ) :
    (rho*H)^A * (C0*rho/H)^(N+A) * H^N
      = C0^(N+A)*rho^(N+2*A) := by
  rw [mul_pow, div_pow, mul_pow, pow_add H, pow_add rho, pow_mul]
  field_simp
  ring

#print axioms tail_layer_factor
#print axioms formal_degree_constant
#print axioms global_tail_exponent
#print axioms sparse_constant
#print axioms shift_budget
end DependencyRun54

/-!
RESUME HERE: shared native replay of the scalar certificates; then
read the actual body of the stable-range theta injectivity supplier
realConv_eq_zero_of_lift_eq_zero at reproducing_formula_modKernel
and the strict carrier epsilon calculation at Data.exists_fNatural_approx.
Continue to retain the Fock weighted-norm and Casimir derivative
inputs until explicitly reconstructed. No repeated determinant assembly.
HANDOFF TO: integration, editor, theta, formal audit, kernel.
-/
