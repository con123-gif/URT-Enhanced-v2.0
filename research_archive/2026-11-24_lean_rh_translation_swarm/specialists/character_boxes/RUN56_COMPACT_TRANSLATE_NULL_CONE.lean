import Mathlib

/-!
# RUN56 — exact torsion-translate residual and null-cone integrality
26 November 2026. Source-matched human reconstruction, conditional on
the named native integrality suppliers. Scalar certificate PREPARED,
not compiled. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb (including mandatory
engine and latest binding primitive closure), manuscript
57e7f36aa8032da2dd16f54a539e23d992a7cf96, contract
7ad9c7c64f53c621ad20422226ad9d0b756ee28e. AGENTS, protocol, handoff,
expansion read. Own RUN55 67ab9478, RUN54 b0ec37d0, RUN53 15b7768e
read. Peer RUN56 literature 19f8696a (long gaps), Galois a099cd79
(crystalline relations), theta 663c88ca (zero-exponent coupling),
acceleration c561038c (marked inverse) address distinct obligations.

Actual pinned sources under grh-compact/src:
* New/Curve/FormalParameter.lean 61130bd5600a2b1f1679cfe0a18123d2c458d425,
  lines 132-249, especially 225-241, CMLattice.exists_formal_parameter.
* Lib/CM/KroneckerLimit/LogTheta.lean 99b01af94328fe9bcfd29a14db9933e72ac5c626,
  mem_normPairClosure_of_pow_eq, CMLattice.exists_log_theta.
* Lib/CM/LocalHeight/IsogenyIntegrality.lean
  1b7411b4a950de12649c1f2cd171de834f8363fa, lines 85-162,
  congruencePart_eq_sum, rescale_translate_eq_theta_pow_mul.
* New/Curve/ThetaProducts.lean 044e906a110715710a4a60c0b06d73d70483afda,
  lines 19-28, 57-82, 86-144, sum_pow_eq_zero_of_null,
  exists_frame_rows_frob, thetaProducts_normal_form.
* New/Curve/DepthPairs.lean d53a0d9e22baa06916be8cc331c4394340483e3e,
  lines 34-92 (htheta and hL), 101-147 (same six-copy caller).
* New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834,
  Data.scale, m_pow, m_mem, r_mem; New/Data/Magnitudes.lean
  306fe7e22378322422d11b1f8415fcdac75ffd6e lines 131-181;
  New/Data/Weights.lean 8749d68da003347685ca36817b32cafda51a3a6a
  nominalWeight_add_le.

## 1. A single integral residual for each actual torsion translate

Fix the same nonsplit prime p>=13, embedding, CM curve C and series
R=phiSeriesRing. Write q=p^e, M=q-1, zeta a primitive Mth root of
unity, L from exists_log_theta with theta=exp(-L). Let P=L_{p+1 mod M}.
For each i in 0,...,M-1 the native norm-pair closure contains
(zeta^(-i),zeta^(-i(p+1))). Its proof chooses an integer of the
quadratic field with reductions equal to zeta^(-i) and its pth
power under conjugation; raising to q^k converges to these
Teichmueller units, hence the pair of the integer and its norm
converges to the stated pair. The residue lift is a retained
native input, not an assumption about arbitrary complex roots.

By exists_log_theta the series
  A_i(X)=exp(zeta^(-i(p+1)) L(X)) theta(zeta^(-i) X)
belongs to R. Since rescaling by zeta^i preserves R (the scaled
series generator belongs to R by the SAME norm-pair closure),
  B_i(X)=A_i(zeta^i X)
        =exp(zeta^(-i(p+1)) L(zeta^i X)-L(X))
belongs to R. Coefficients of L(0) vanish, so all exponentials
here are formal coefficientwise finite sums. Multiply EXACTLY:
  product_i B_i = exp(M(P-L)).
Indeed at degree k the inner geometric sum is M if
k=p+1 mod M, zero otherwise. This is the source's
congruencePart_eq_sum with the NEGATIVE exponent weight.

Fix n prime to p and y with ny in the period lattice.
Use the same delta=nM, rational integer, p-unit. The native
rescale_translate_eq_theta_pow_mul with delta*conj(delta)=delta^2
gives F_y(delta X)=theta(X)^(delta^2) U_y(X), U_y in R,
where F_y is the actual twisted translate series.
Define ONE residual
  W_y = U_y (product_i B_i)^(n^2 M) in R.
Then W_y=U_y exp(delta^2(P-L)), and
  F_y(delta X)=exp(-delta^2 P(X)) W_y(X).
No inversion or norm estimate on theta or B_i needed. The
exponent n^2 M is essential: n^2 M times M is delta^2.

RUN55 provides T,Z, their inverse substitutions, T(varpi X)
=varpi S(X), |varpi|<=1 and W(Z) integral for every W in R.
Therefore W_y(varpi X)=W_y(Z(T(varpi X))) is integral, since
T(varpi X)=varpi S has zero constant and integral coefficients.
Let V_y be this integral series and N=delta^-1, kappa0=varpi^(p+1)/p,
psi=kappa0^-1 P(varpi X), kappa'=-delta^2 kappa0.
Substitute X -> varpi N X in the previous identity:
  F_y(varpi X)=(exp(kappa' psi) V_y)(N X).
This is exactly the last conjunct of exists_formal_parameter.
|N|=1 and |kappa'|=|kappa0|, independent of y. No new local
scale or torsion choice. If F_y(0)=1, V_y(0)=1; the product
version needs only Theta(0)=1 to get product residual unit.
This fills the translate step left explicit in RUN55, using
the retained native section-integrality and series-generator
suppliers, not importing RH.

## 2. The other half of thetaProducts_normal_form: null-cone integrality

Use the SAME tight frame, n, M_frame, b, and torsion points of
thetaProducts (delta=1). Substitute the linear forms with
coefficients z_(v,j)=N*iota(b conj(Phi_v(w_j))), norm <=1
because r<=1 and the native frame lemma. For each copy c and
frame index j let L_jc be this linear form and t_jc=S(L_jc).
The product of the above identities gives
  Theta(varpi X)=exp(kappa' Psi) V,
  Psi=sum_jc [u0 L_jc^2+u1 t_jc^(p+1)+u2 t_jc^(p+p^e)+pi R(L_jc)],
with V integral and Psi(0)=0. Here the formal-series remainder
notation means substitution of the same R from the native
normal form, not an independently chosen remainder.

Now apply the actual null-cone substitution Z_tau (zero constant)
and pass to the quotient of the integral power-series ring by
the native basis ideal K: coefficients at multidegrees <= m
(componentwise) killed if their norm <= |pi|; all monomials
outside that box killed. The target has characteristic p,
since |p|<=|pi|. In the quotient the t_jc obey
  t_jc-t_jc^(p^e)=L_jc.
Their high p-power terms vanish by the zero constant and
degree cutoff. Thus t_jc=sum_(a>=0) L_jc^(p^(ea)) in this
quotient, a finite sum. For the live j (odd or p=d) the
native frame identity changes sum_frame L_frame^(p^j+1)
into the scalar N^(p^j+1) times the corresponding partner
coupling (with the exact beta and M_frame factor of the
frame lemma). These vanish by the null-cone hypotheses for
j<=log_p B; if j>log_p B then p^j>B>=degree(m), hence all
terms vanish. This includes j=0 only in the ramified case.

For any a,b with |a-b| live, sum_frame L_frame^(p^a)
L_frame^(p^b) is the p^min(a,b)th power of the vanished
coupling, by Frobenius, after swapping factors if necessary.
If e=2, the two products in t^(p+1) and t^(p+p^2) have
exponent indices (2a+1,2b) and (2a+1,2b+2), respectively.
Their differences are odd, so every term vanishes. If e=1,
p=d, all differences including 0 are permitted. The extra
u0 L^2 term is absent when e=2 and covered by j=0 when e=1.
The pi remainder is killed. Consequently Psi after substitution
vanishes in the quotient: every coefficient in the retained
box has norm <=|pi|. This proves the exact cancellation
used by sum_pow_eq_zero_of_null and the hT step of the caller;
no estimate of the number of frame elements.

Finally |kappa' pi|=p^(-1/(p-1)) in both prime cases. For a
degree d<=m, the coefficient in (kappa' Psi)^l is a sum of
products of coefficients at degrees <=d<=m. Each product
has norm <=p^(-l/(p-1)). Legendre gives
  v_p(l!)=sum_{a>=1} floor(l/p^a) <= l/(p-1).
Thus each coefficient after division by l! has norm <=1,
and the finite exponential sum at d has norm <=1. Multiplying
by the integral substituted V preserves this. This is the
actual IsIntegralOnNullCone half of thetaProducts_normal_form
with its source box and all null conditions, rather than a
global claim that exp(kappa' Psi) is integral. RUN54 already
derived the separate inert derivative-support half. The source
frame/frob_ext and local height section theorem remain inputs.

## 3. Explicit htheta and tail hL in the small-prime packing caller

Fix admissible D, p<=k, nonsplit p>=13, S=D.s,
c=ceil(60 b/k), x=exp(logX), x1=exp(logX1).
Use native scale consequences x>=3, x1>=x^(10^6),
k<=r<=3x^5<=x^6, n_sigma<=2b, a<=exp(1)xb,
b2<=exp(2)xb/x1. Here x>=3 follows already from the
native HasLogLower x and scale, not a new adjustable parameter.
S<=32 log x and 2^S=m^22>=x^11 from m_pow, m_mem;
in particular S>=11 log x, using log 2<1.

For j<=S:
  c/(p 2^(j+1)) >= 30b/x^44,
because k p<=x^12, 2^S<=x^32. Also
  2(b2+a/x1) <= 4 exp(2) b x/x1 <= 30 b/x^44.
The last follows from x>=3, x1>=x^(10^6)
(and exp(2)<9). This is exactly htheta, including j=0,
rather than retaining it as an independent size premise.

For j>=S, use 2/p<=2/13<exp(-1), hence
  (2/p)^j <= exp(-S)<=x^(-11).
It follows
  4 k p (2/p)^j <= 36 x^10 x^(-11)<=60.
Rearrange using c>=60b/k and n_sigma<=2b:
  n_sigma/p^j <= c/(p 2^(j+1)).
This is the hL tail guard in RUN54's pointwise summation.
The source D.three_term and the separate arithmetic
two_pow_le_of_pow_eq_one order guard remain explicitly
required for the matching; no false inequality 2^S>p^S
is used. Together the above two size suppliers eliminate
the need to leave htheta and hL as unexplained scale steps
in that human derivation.

## Evidence, frontier and handoff

Executed exact integer JS regression, p=13,17,19,23 and e=1,2:
- 2840 geometric-root projection cases: k=0..2M+1,
  count residues i*(k-p-1) mod M for i=0..M-1. Either all
  mass at zero or uniform on a nontrivial subgroup, proving
  the corresponding geometric cancellation for these cases.
- 4 negative controls: at e=2,k=p+1 using +p+1 instead
  of -p-1 changes the projection and loses the desired term.
- 2704 Frobenius exponent-index pair checks, a,b=0..12;
  e=2 implies the two differences odd, e=1 no restriction.
- 16008 exact factorial valuation bounds, l=0..2000.
These are finite symbolic/arithmetic regression checks,
NOT a p-adic simulation or evidence for infinite RH.

No local lean/lake found. Actual previous CI run 45803534769
state receipt 088cd2ec0e935ee1a282f10096949bcf671cc804:
3 TiltingLemma and 3 Filling.Moments native axiom checks
succeeded (propext, Classical.choice, Quot.sound); A module
build return 124, 2700.11s; overall all_requested_checks_ok=false.
No new Lean PASS. No compact native rh_prune/scan/reduce/auto
or frontier run, old-pin engines not silently imported. Below
scalar certificate is prepared for batch replay; not the
full formal power-series proof or native caller replacement.

Contextual static edges retained:
depth_indicator_jet -> exists_hasLargeSplit_of_pairs ->
thetaProducts_normal_form -> exists_formal_parameter ->
{formal height degree, normalized inverse, log coefficient
bound, Hasse coefficient, section-integrality, norm-pair closure}.
thetaProducts_normal_form null-cone half additionally uses
{frame Frobenius, truncated quotient, factorial bound}.
Candidate human substitutions for translate residual and
two size guards justified above. No globally deleted graph
nodes; retain original native paths and all prior axiom
evidence. Cache key pin,C,p,iota,delta,M,zeta,L,T,Z,varpi,
frame and truncation box, D,j; never by declaration name alone.

RESUME HERE: prove the remaining actual small-prime order
guard using the source two_pow_le_of_pow_eq_one (do not use
an unproved crude bound), then reconstruct the local
section-integrality principle exists_eq_theta_pow_mul_of_norm_le
with its genuine height, discriminant, two evaluations and
even polynomial coefficient inputs, and the formal-height
degree supplier's integral section construction. These are
still needed by the same C depth witness. Audit the new
translate/null-cone bridge with integration and actual native
caller before any closure claim.
HANDOFF TO integration/editor, formal audit, theta and kernel batch.
Human RH reconstruction remains incomplete.
-/

namespace CompactCharacterBoxes56

theorem translate_exponent (n M L P : ℚ) :
    -(n*M)^2*L + (n^2*M)*(M*(L-P)) = -(n*M)^2*P := by ring

theorem residual_exponent (n M L P : ℚ) :
    (n^2*M)*(M*(P-L)) - (n*M)^2*P = -(n*M)^2*L := by ring

theorem factorial_budget (p l v : ℝ) (hp : 1 < p)
    (hv : (p-1)*v ≤ l) : v ≤ l/(p-1) :=
  (le_div_iff₀ (sub_pos.mpr hp)).2 (by linarith only [hv, mul_comm v (p-1)])

theorem small_tail_budget (x : ℝ) (hx : 3 ≤ x) :
    (36:ℝ) ≤ 60*x := by linarith

#print axioms translate_exponent
#print axioms residual_exponent
#print axioms factorial_budget
#print axioms small_tail_budget
end CompactCharacterBoxes56
