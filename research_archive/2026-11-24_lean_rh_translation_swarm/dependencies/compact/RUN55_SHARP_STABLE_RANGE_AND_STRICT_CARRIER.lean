import New.Rows.NaturalFormNear
import Lib.SiegelWeil.RallisInner.SharpData

/-!
# RUN55 — sharp-data support, stable-range convolution, strict carrier budget
26 November 2026. Compact dependency lane 13 (historical lane 12).
HUMAN SOURCE-MATCHED; Lean scalar candidates NOT COMPILED. No RH theorem import.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb;
manuscript d76b408556ea55ffbd893072a4beac498b8adb2c;
observed work branch head 1a3653752903eefa0137e751226a8ab1769b56ea.
Predecessor RUN54 266421ebf470323a0a2d2d28ea3d32fe73f942db.
Peer heads read: a6e9cc7f (B open cell), b5cd3751 (Kolyvagin),
837dd3d8 (editor crystalline budgets), 7ce0b84e (Sobolev),
c7a92f2d (Galois), c22bb6a (theta A). No overwrite.

## Exact source ledger (relative to grh-compact/src)
Lib/SiegelWeil/RallisInner/SharpData.lean ea9f665a9a89411f1353d098ff2e0a4e59a719f5:
  IsSharp, isSharp_modDatum, exists_graph_eq_of_zeroTerm_ne_zero,
  graphSplitting_lagrangian_injective, inner_product_formula,
  exists_integral_isotropic_frame, exists_dual_datum, tendsto_partialIntegral.
Lib/Weil/CompactLift/RallisFormula.lean 8d41f50fc88d20a40531973b916aaac7491b8e72:
  IsSharp.partialIntegral_eq, integral_eq_zero_of_lift_eq_zero,
  realConv_eq_zero_of_lift_eq_zero.
Lib/Weil/Fock/ReproducingFormula.lean b80ae30bd3a91d5d2c107aa662a612f0fba8bb6b:
  reproducing_formula_modKernel, realPairWeil_mem_span_pairedDetProd.
New/Rows/NaturalFormNear.lean 2393479c4efe2c146f1251298992c00021cba4c8:
  carrierForm_spec, carrierForm_ne_zero, Data.exists_fNatural_approx.
New/Rows/SparseThetaSum.lean 7c3ab33ebfb2e34b81e79db63a2decc029146d53:
  integral_mul_holMinorsPi_le, norm_modKernel_sub_realInner_le.
New/Rows/LineCoordinates.lean fe2cbde49a8d88f37308a8c28f742efb73a7d6a0:
  linePoly.
Lib/DiscreteSeries/Holomorphic/HolomorphicMinor.lean 5c575a5f24dd97262f53303026d552a866a20960:
  IsHolOfWeight.integral_mul_conj_holMinorsPi.
Lib/DiscreteSeries/Holomorphic/NearMaximum.lean dbbca26cdd462dedf352f136a493f43596ba68f1:
  exists_near_max (retained).
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834:
  Data.scale.
New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e:
  HasLogBound, magnitude estimates f,m,t.
New/Rows/Carrier.lean f0b7f97f299904aa73a928432147a932cac9be40.

## 1. Sharp support: one left inverse suffices at the real consumer
The finite datum at reproducing_formula_modKernel is the singleton
indicator of X=inclMatrix e over the residue ring, tensored with vacuum.
Its fixed left inverse L=X^T satisfies LX=I. More generally the native
isSharp_modDatum assumes the SAME L for all matrices in the support.
If integral g has a nonzero overlap of F(Y) and F(Yg), then
  I=L(Yg)=(LY)g=g.
This is an equality over the residue ring, not a field-rank argument.
Thus only the principal congruence subgroup can contribute. On it the
function is unchanged and the character of weight gamma with trivial
tame part off the level has value 1, as in the source. If a finite
matrix coefficient is nonzero at a nonintegral candidate, the common
support in the local lifted test function makes both Y and Yg
primitive (left-invertible over the integral local ring). A left
inverse of Y gives g integral; a left inverse of Yg gives g^-1
integral, by multiplying the same identities before taking valuations.
Retain the source local support/coordinate transport at each level
place and its conjugate, and vacuum/off-level invariance. This gives
the native sharp support argument; not just a cardinality estimate.
For the nondefinite case the nonempty modulus guarantees injectivity
at a named level place on the support, which is precisely the clean
condition (in the source via isPrimitiveMatrix_of_liftFn_ne_zero).
The mass is c=<F,F>/[K0:J intersect K0], nonzero since F is nonzero
and the index finite. For general finite test data the native mass
is the squared residue norm divided by the two specified cardinalities;
no rescaling of the Haar measure is allowed.

## 2. Graph orbits and dual cutoff, not an L-value nonvanishing claim
Let a rational maximal isotropic subspace of S plus S^- have an
injective parametrization (K,K') on a rank-n column space. Isotropy
gives K* J K=K'^* J K'. If K' is invertible it is the graph of a
unique rational isometry: U=-K(K')^-1 satisfies U* J U=J.
Two such graphs determine the same U because projection on the
second factor is an isomorphism. If S is definite then K'c=0
implies (Kc)*J(Kc)=0, hence Kc=0, hence c=0. For general S the
actual source instead kills the zero term if K'c=0 and Kc!=0:
the Heisenberg shift in the direction c preserves the zero-term
functional, while the finite datum is supported on injective matrices
at its clean place. The native name_eq_zero_of_invariant then kills
the functional. This is a separate geometric/oscillator input; the
linear-algebra argument alone does not prove it. The source
zeroTerm_graphSplitting identifies the surviving graph contribution
as the matrix coefficient with the rational isometry inserted.
Unfold the doubled theta integral by these surviving graphs and
the measure-preserving quotient orbit map to obtain the native
inner_product_formula:
  <theta_f' y',theta_f y> = vol[U(T)] int_G
       <f',omega(g) f> <y',R(g)y> dg.
The source proves absolute integrability using rapid decay, uniform
theta growth, and the summable Siegel-Weil orbit majorant. These and
the actual graph zero-term identification remain retained suppliers,
not proved by merely changing variables.

The dual-datum construction begins with the explicit integral
isotropic frame x=(I;uI;0) with star(u)u=-1 at the finite adeles,
possible when target rank >=2 source rank. Then x* x=0, and a
selected n-row block is I. If z is anti-Hermitian, the shear
  (I+z xx*)* (I+z xx*)=I
by x*x=0 and z+star(z)=0. This is the actual shear used in
exists_dual_datum. The source chooses z on the conjugation-closed
finite set with valuation >1 (valuation convention of source),
then uses a named Heisenberg translate and the primitive additive
character to suppress the nonintegral coefficient. Retain that
local additive-character detector and the integral normalization
as deep dependencies; no general claim that every vacuum can be
cut off by an arbitrary translate. The matrix identity is exact
before any norms.

## 3. Stable range: exact passage from zero lift to real convolution
Write f=v tensor F with the same sharp F and rank T>2 rank S.
Let y be rapid automorphic and right J-invariant, and its f-lift
zero. For each rapid y' the doubling identity gives zero integral
against every dual datum f'. For each finite set R choose the
native dual datum for R minus S0, since F is vacuum there. Its
matrix coefficient equals that of f exactly on the integral
region and zero outside. Thus the partial integral is zero for
each R. Dominated convergence for the already integrable
coefficient-product gives the integral over the intersection
of all regions, i.e. integral outside S0. No uniform convergence
or absolute convergence of a new Euler product is assumed.
Sharp support restricts the finite integration further to
J intersect K0. Right invariance of y and Haar normalization
then give exactly
  0=c int_{G_inf} k(h)<y',R(h)y> dh,
  k(h)=<v,Omega(h,1)v>, c!=0.
Cancel c. For integrable k, the real convolution Y=realConv(k)y
is bounded automorphic; the finite-volume quotient places Y in
L2. For every translate of y, rapid decay is preserved, so the
same zero-pairing equality, with Fubini and conjugate symmetry,
gives <Y,Y>=0. Continuity and full-support Haar quotient measure
upgrade the a.e. equality to Y=0 pointwise. This is exactly
realConv_eq_zero_of_lift_eq_zero, NOT injectivity on all rapid
functions without the real kernel condition. In particular the
holomorphic-vector matrix coefficient k is its nonzero squared
norm times the required holomorphic minor; cancel that norm.
The proof supplies the common-kernel implication used by
reproducing_formula_modKernel after the finite class decomposition,
principal-level invariance and spanning of the archimedean
translates. RUN54's finite duality therefore gives a single
coefficient family independent of the input rapid function.
The remaining local dual cutoff and doubling suppliers above
are explicitly retained; no new independent kernel closure.

## 4. Strict carrier inequality at the actual C caller
Use F=carrierForm, x0 the selected near-maximum point (not
the scale x), B=5b, nu=nStar>=1, q=2nu and
sparse separation parameter M=b^7 x. Set
  J=int |holMinorsPi(k)|^2>0,
  v=polyVector(linePoly), W=realInner(v,v)>0,
  t=100(d+4nu)/(b^14 x^2),
where d is the homogeneous degree of linePoly. Each determinant
minor uses injections at its specified signs, hence is a nonzero
polynomial by a distinct diagonal monomial, and the polynomial
ring is a domain. Thus W>0. The source's K0(y) is the integral
of F(x0(h,1)) C(h,iota y) holMinorsPi(vars)(h), where C is
the same matrix coefficient. Unitarity gives |C|<=W. The actual
holomorphic weight identity (pe in NaturalFormNear) identifies
C(h,1)=W holMinorsPi(vweight)(h) conj(holMinorsPi(k)(h)).
The remaining product F*minor(vars)*minor(vweight) has weight k.
The holomorphic reproducing integral therefore gives exactly
  K0(1)=J F(x0) W.
The moment theorem with N=0 bounds K0 uniformly by
2|F(x0)|W B^(7nu) J. The sparse difference at q=2nu has bound
t^(2nu) W maxOpNorm(h)^(6nu) maxOpNorm(y)^(6nu). Multiply by F
and apply the same moment theorem with N=6nu. Reproducing_formula
and finite Fourier expansion of the sparse datum identify that
integral with the native linear combination of fNatural(j,a).
Hence the actual epsilon can be taken as
  eps=2 |F(x0)| W J B^(7nu) t^(2nu).
All constants use the SAME x0,J,v; no independent choices of
normalization. Keep the source's exact coordinate and modulus
conditions in the invocation of norm_modKernel_sub_realInner_le
(in particular M |Phi(c)| <= sqrt(2pi Im Phi(j)) lambda_Hom).
This run does not derive those lattice-coordinate scale guards
anew.

The degree estimate used in NaturalFormNear is
d<=f*(2*m*(5b))=10fmb, from the actual per-place
two_mul_card_detIndex_add_le and determinant homogeneity.
Keep that source combinatorial supplier. The moment hypothesis
gives nu<=5b. From Data.scale, put X=log x,L=log b:
log L>=10^12 P.c, X>=100 log L, L>=10^12 X.
With P.c>=64 and X>=1, the source magnitude bounds give
log(fm)<=11.5 X+log L/5+P.c+2 <=14 X <=L/2.
Therefore fm<=sqrt b, and b>9,000,000, x>=1. In particular
  100(d+4nu)<=1000 fmb+2000b
    <=3000 b sqrt b<=b^2<=b^2 x^2.
Thus t<=b^-12, exactly the estimate requested in the source.
Since b>=25, B=5b<=b^(3/2). Divide the desired strict inequality
by |K0(1)|=|F(x0)|WJ>0 before bounding:
  (4 eps B^(7nu)+eps)/|K0(1)|
   =2(4 B^(7nu)+1)B^(7nu)t^(2nu)
   <=10 B^(14nu)b^(-24nu)
   <=10 b^(-3nu)<1.
This is the strict carrier epsilon guard, with the original
isolation constant 4 intact. It is now derived, not assumed.
The argument does not depend on a numerical test of primes.
No claim of the entire C primitive closure: coordinate minimum
guards, holomorphic weight/near-max, local cutoff, doubling,
Fock coefficient bound and the native combinatorial degree
supplier remain explicit.

## Graph, audit and tests
Original source edges (not kernel-export evidence):
 C -> comparison forms -> NaturalFormNear -> reproducing formula
   -> realConv -> integral_eq_zero -> dual cutoff + sharpness +
      partial integral limit + doubling -> graph orbit + Siegel-Weil;
 C -> NaturalFormNear -> sparse -> packing/Fock decay +
   modulus and Hom lattice guards;
 C -> NaturalFormNear -> moment + degree bound + scale +
   holomorphic reproduction.
Candidate replaces final strict scalar node by the normalized
one-witness inequality in section 4, and expands three successive
stable-range nodes. No original graph, axiom or open node removed.
Context cache key: compact pin, S/T signs and ranks, F,J,S0,
characters, Haar measure, v,k, chosen x0, sparse exponent.
No full kernel traversal, no native engine execution in this
session; local source reconstruction and prepared algebra
certificates only. Actual GitHub run 45799225653 fetched from
Actions API, completed success, head 4c55b565a0583f08b6c87de5ae3ddfa8d3a9747a.
This is the RUN28 baseline, not this candidate. Previous RUN29
partial B/C checks and A timeout retained. Current orchestrator
runs pending/cancelled/in progress; no new certificate PASS.
Exact BigInt tests executed in tool JS: 200 normalized strict
inequalities (b=9e6,1e7,2e7,1e8,1e12; nu=1..40) and 36
degree endpoint inequalities (sqrt b=3000,3001,4000,10000;
fm=1,floor(sqrt b/2),sqrt b; x=1,2,10), all satisfied.
Reproduction pseudocode:
 for b in [9000000,10000000,20000000,100000000,1000000000000]:
   for nu in range(1,41):
     B=5*b
     assert 2*(4*B**(7*nu)+1)*B**(7*nu)<b**(24*nu)
 for s in [3000,3001,4000,10000]:
   for fm in [1,s//2,s]:
     for x in [1,2,10]:
       b=s*s; d=10*fm*b; nu=5*b
       assert 100*(d+4*nu)<=b*b*x*x
These arithmetic checks are not native theorem replay.
-/

namespace DependencyRun55

-- Abstract monoid form of the exact common-support identity.
lemma support_overlap {M : Type*} [Monoid M] (L Y g : M)
    (h : L * Y = 1) (h' : L * (Y * g) = 1) : g = 1 := by
  rw [← mul_assoc, h, one_mul] at h'
  exact h'

-- Exact degree guard without any division.
lemma degree_guard (b s fm d nu x : ℝ)
    (hs : 3000 ≤ s) (hb : b = s^2) (hf : 0 ≤ fm)
    (hfs : fm ≤ s) (hd : d ≤ 10*fm*b)
    (hn : nu ≤ 5*b) (hx : 1 ≤ x) :
    100*(d+4*nu) ≤ b^2*x^2 := by
  have hb0 : 0 ≤ b := by rw [hb]; positivity
  have hs1 : 1 ≤ s := by linarith
  have h1 : 1000*fm*b ≤ 1000*s*b := by gcongr
  have h2 : 2000*b ≤ 2000*s*b := by gcongr
  have h3 : 3000*s ≤ b := by rw [hb]; nlinarith
  have h4 := mul_le_mul_of_nonneg_right h3 hb0
  have h5 : b^2 ≤ b^2*x^2 := by
    have : 1 ≤ x^2 := by nlinarith
    nlinarith [mul_nonneg (sq_nonneg b) (sub_nonneg.mpr this)]
  nlinarith

-- Normalized endpoint inequality after the power bounds:
-- U=B^(7nu), V=t^(2nu), W=b^(-3nu), with U^2 V <= W.
lemma strict_normalized (U V W : ℝ) (hU : 1 ≤ U) (hV : 0 ≤ V)
    (hUV : U^2*V ≤ W) (hW : 10*W < 1) :
    2*(4*U+1)*U*V < 1 := by
  have h : 0 ≤ (U-1)*U*V := by positivity
  nlinarith

#print axioms support_overlap
#print axioms degree_guard
#print axioms strict_normalized
end DependencyRun55

/-!
RESUME HERE: finish the local primitive additive-character detector
in exists_dual_datum (the maximal valuation and conductor argument)
and the exact nondefinite clean graph elimination using
name_eq_zero_of_invariant; then provide native caller replay of
Data.exists_fNatural_approx with the explicit strict budget above.
Verify shared CI outputs first. No new determinant assembly.
HANDOFF TO: integration, editor, theta, formal audit, kernel.
-/
