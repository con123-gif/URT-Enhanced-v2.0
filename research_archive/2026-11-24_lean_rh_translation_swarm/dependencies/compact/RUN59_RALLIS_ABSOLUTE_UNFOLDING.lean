import Lib.Weil.CompactLift.RallisFormula
import Mathlib.Tactic

/-!
# RUN59 — absolute unfolding and the actual C Rallis caller
2026-11-26. SOURCE-MATCHED HUMAN reconstruction; local certificates
prepared, NOT compiled. Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb, including mandatory
engine and primitive-closure focus; protocol, handoff, AGENTS, continuity,
HUMAN_PROOF_COMPACT read. Resume from 5321cfa72d9b01340e5c7ec47e388e5a96d28745.
Recent peer commits 3347d944 (jet basis), ec29276e (threshold correction),
e82befc5 (projector), ce3f88d1 (period-frame determinant), 3c29c488 (editor),
1c42c408 (minimal-support period), 329c06fd (one-vector unfolding in B).
This is the distinct C doubling integral supplier, not B's unfolding or
another redesign of the sufficient global determinant.

## Exact native ledger
Lib/SiegelWeil/RallisInner/SharpData.lean ea9f665a9a89411f1353d098ff2e0a4e59a719f5:
  doubleDatum 56, zeroTerm_graphSplitting 95,
  exists_graph_eq_of_zeroTerm_ne_zero 115,
  graphSplitting_lagrangian_injective 141, inner_product_formula 150--195,
  hasSum_partialIntegral_coset 208ff, tendsto_partialIntegral 230ff.
Lib/SiegelWeil/Formula/SiegelWeilFormula.lean 4277ff0a84d10e7e1f73516d9ff76505072899ea:
  siegel_weil (actual full body inspected).
Lib/SiegelWeil/Formula/SiegelSets.lean b66ffc7b1f8383e88184259475bd735150e8d0bb:
  eq_zero_of_le_tsum_zeroTerm (initial argument inspected; not fully reconstructed).
Lib/Weil/CompactLift/RallisFormula.lean 8d41f50fc88d20a40531973b916aaac7491b8e72:
  IsSharp.partialIntegral_eq, integral_eq_zero_of_lift_eq_zero 221,
  realConv_eq_zero_of_lift_eq_zero, rallis_inner_product_euler 250--266.
New/Exchange/CharacterLiftNorm.lean 3a83f00d1356032da157bf4709b7ab4d9d829c3e:
  Data.auxLift_injective_and_hasSum_inner 113--132.
New/Rows/ComparisonForms.lean 14ef893c54f5db837ea7e4f143b2b1a444b89b5a:
  comparisonForm 70, inner_adjoint_comparisonForm 81--111,
  comparisonForm_mem_integralForms 116--126, normSqAt_comparisonForm_le 131,
  tableTheta_adjoint_eq_zero 170. No new comparison bound inferred from Rallis.

## 1. Two absolute majorants, one bounded doubled datum
Write G=U(S)(A), Gamma=U(S)(E), X=Gamma\G with native quotient
measure, H=U(T)(A), Y=U(T)(E)\H. Assume rank(T)>2 rank(S),
f clean, f' arbitrary, y,y' rapid. The chosen rational eta(g) from
exists_rat_norm_le_height satisfies the native polynomial operator
norm bound. Define u_y(g)=y(g) omega_swap(1,eta(g)g) as in line 156.
Rapid decay at the exponent used by that bound makes ||u_y(g)|| <= C_y,
uniformly on the chosen representatives, and likewise for y'.
For d(g,g')=doubleDatum(u_y'(g')f',u_y(g)f), bilinear operator
norm bounds give ||d|| <= D where
 D=||doubleDatum|| C_y C_y' ||f|| ||f'||.
The constants need not be uniform over all twists: they justify
each integral separately. Retain the actual height and rapidity
suppliers. X has finite quotient measure, so integral_{X^2}||d||
<= D mu(X)^2 < infinity (line 177). No measurability of the chosen
eta itself is assumed: the integrands below are continuous native
expressions or bounded above pointwise by the constant D.

From siegel_weil obtain V=sum_L ||ev_L|| < infinity, with ev_L
the continuous zero-term functional of each rational Lagrangian.
From theta_normalisedTorus_le obtain a nonnegative integrable N(h)
with |theta(omega(1,h)d)| <= N(h)||d|| at torus exponent zero
(lines 166,190--191). Consequently both
 sum_L |ev_L(d)| <= V D
 and |theta(omega(1,h)d)| <= N(h) D
have finite integrals over X^2 and X^2 x Y respectively.
These are DISTINCT majorants (sum of operator norms versus
integral of a theta majorant) with the SAME D. The former is not
a consequence merely of pointwise convergence. The latter
justifies switching the target and source integrals before
applying Siegel-Weil. No interchange of conditional sums.

## 2. Exact orbit unfolding, including the relative variable
Let M(g)=<f',omega(g,1)f>, Phi(x,g)=M(g) conj(y'(x)) y(xg).
This is Gamma-invariant in x. Use the native quotient/orbit
integration formula: integrate over x in X and g in G, substitute
g=x^-1 gamma z, with z in X and gamma in Gamma, by left Haar
invariance and quotient measure disintegration (line 179).
For each x,z the map
 delta -> eta(x)^-1 ratEmbed(delta) eta(z)
is a bijection from rational isometries to Gamma. The source's
graphSplitting uses delta^-1, so no multiplicity or orientation
factor arises. The actual zero-term identity (line 171) is
 ev_graph(delta^-1)(d(z,x)) = Phi(x,x^-1 epsilon(z,x)(delta) z),
using common rational invariance of y and the pairing covariance.
Graph injection and absolute summability give
 integral_X integral_G |Phi(x,g)| dg dx
 = integral_{X^2} sum_delta |ev_graph(delta^-1)(d(z,x))|
 <= V D mu(X)^2 < infinity.
The equality is the native measure-preserving orbit formula for
nonnegative integrands; no integration against a putative
counting measure on a non-discrete adelic group.
Thus Phi is integrable and k(g)=integral_X Phi(x,g) dx is
integrable. The clean-data support lemma says every nonzero
ev_L(d(z,x)) has L=graph(delta^-1); scalar factors y,y' do not
alter this. The same bijection now gives the exact COMPLEX
integral, not just its absolute bound:
 integral_{X^2} sum_L ev_L(d(z,x)) = integral_G k(g) dg.
The product-of-theta identity q at line 158 equates the
integrand of the expanded lift inner product to the doubled
theta function, using conjugate linearity in f', opposite
source and its normalization. By the second majorant above,
Fubini and Siegel-Weil give
 <lift_f' y', lift_f y> = vol(Y) integral_G k.
All factors are the native measures; there is no missing volume
of X. This is the human argument of inner_product_formula,
conditional on the retained norm-height, orbit measure,
clean-graph, theta-product and Siegel-Weil suppliers.

## 3. Sharp support and exhaustion supply the SAME Euler sum
For F sharp, f=v tensor F, K0=Kf, mass c=<F,F>/[K0:J intersect K0].
Continuity and nonzero value at identity, together with the
sharp coefficient identity, show J intersect K0 contains an
open neighborhood of identity. It has finite positive index
in compact K0; c != 0. With the native Haar measure(K0)=1,
the integral over finite points integral off S0 of the
finite matrix coefficient is precisely c. Right J-invariance
of y eliminates the finite translate on that support, even
after a left finite translate u. Thus the partial integral is
 c integral_real <v,Omega(x)v> <y',R(xu)y> dx,
exactly IsSharp.partialIntegral_eq, not a norm estimate.
For A=S0 complement, t_gamma the chosen supported-on-A
representatives of Gf/localLevel(A), the full group is the
disjoint union of the left translates of the A-integral region
by t_gamma. These cosets are open; the native countability
lemma and Integrable k justify sum of restricted integrals.
Vacuum off S0 gives the exact factor vacuumCoeff(t_gamma)
under left translation, by the projection identity. Substitution
of the partial-integral formula and the real-edge convolution
identity yields the actual HasSum of
 A_real c vacuumCoeff(t_gamma)<y',R(t_gamma)y>,
where A_real=vol(Y) times the real edge inner scalar,
nonzero by K.inner_ne_zero and native volume nonvanishing.
This is rallis_inner_product_euler's second component.
Do not claim absolute summability of unweighted matrix
coefficients or an Euler product without the actual datum.

## 4. Injectivity uses the arbitrary left datum, not positivity
If lift_f y=0, inner_product_formula has zero left side
for EVERY f'. For any finite R outside S0 choose the native
exists_dual_datum at R\S0, using sharp vacuum off S0.
It equals the original coefficient on the integral-at-R\S0
region and zero outside, hence each restricted integral is zero.
The regions decrease to integral-off-S0 as R exhausts finite
places. Dominated convergence by |k| (already integrable)
gives zero for the limiting partial integral. Divide by c !=0
to obtain zero real convolution pairing for every rapid y'.
Choose y'=y, then use the actual edge convolution scalar
identity: its scalar is nonzero, so the Petersson self-inner
product of y is zero; positivity implies y=0. This is the
first component of rallis_inner_product_euler (not an inference
from a possibly signed coset sum). The alternative realConv
statement also uses boundedness/automorphy and integrability
of the real coefficient; not needed as a separate conclusion
at this particular caller, but no global dependency deletion.

## 5. Actual caller and remaining frontier
CharacterLiftNorm lines 116--132 chooses the edge for the
untwisted pair with rank guards; the same edge scalar works
for every allowed twist with the stated weights. The actual
adjoint theta/formLift equality U transports both arguments.
The native mass identity c and level-form Petersson
normalization give A=C * card(WeylIndex) and gramFactor in
the HasSum. The cancellation is termwise, prior to norm
estimates; both nonzero factors are justified in native
lines 118 and 126--129. This completes the local conditional
human derivation of the Rallis assembly, not the primitive
arithmetic reciprocity-to-isotropy or balanced-row estimates.

Original source edges:
 C volume -> auxLift_injective_and_hasSum_inner ->
 rallis_inner_product_euler -> inner_product_formula,
 IsSharp.partialIntegral_eq, hasSum_partialIntegral_coset,
 integral_eq_zero_of_lift_eq_zero, real edge, actual sharp witness.
 inner_product_formula -> siegel_weil, theta_normalisedTorus_le,
 exists_rat_norm_le_height, graph support/injection, quotient
 disintegration, theta-product, rapid data.
 integral_eq_zero_of_lift_eq_zero -> exists_dual_datum,
 tendsto_partialIntegral, inner_product_formula.
Reduced human DAG shares the bounded d and the integrability
proof across both coset sum and zero-lift exhaustion, with all
above source suppliers retained. No native edge removed.
Cache context pin,E,S,T,signs,ranks,a,b,f,f',y,y',eta,
quotient measures,S0,J,v,twist,j. Do not merge differently
instantiated edge or quotient measures.

CI independently reread actual RUN29 status and targeted_results:
a56e2d3afb99ed8275e81fd63c8494306e57c43f and
088cd2ec0e935ee1a282f10096949bcf671cc804. Run 45803534769
checked three named Selmer and three Filling declarations,
only propext, Classical.choice, Quot.sound; module_1 build
timeout 2700.11s, overall ERROR. Workflow job success does
not override this payload. No new Lean execution or axiom
evidence, no claim of rh_prune/scan/reduce/auto execution;
prepared scalar certificates below and native checks for
shared runner. No independent full RH proof or new root
closure. Previous graphs and unresolved ledgers untouched.

RESUME HERE: trace the actual comparisonForm integral
construction at New/Rows/ComparisonForms.lean 70--111,
in particular the uniform finite congruence-group factor
and exact twist-independent glue lattice / weilScalar;
then trace its remaining reciprocity and local defects
at C's actual caller, coordinating with period-frame peers.
Retain Siegel-Weil's own unexpanded induction suppliers.
HANDOFF TO integration, audit, kernel, literature.
-/

namespace CompactDependencyRun59

-- Exact cancellation of the sharp mass in the zero-lift limit.
theorem zero_from_sharp_mass (c I : ℂ) (hc : c ≠ 0)
    (h : c * I = 0) : I = 0 :=
  (mul_eq_zero.mp h).resolve_left hc

-- Nonvanishing of the real-edge scalar times target volume.
theorem edge_volume_ne_zero (V A : ℂ) (hV : V ≠ 0)
    (hA : A ≠ 0) : V * A ≠ 0 := mul_ne_zero hV hA

-- The same bounded doubled datum controls the summable orbit majorant.
theorem bounded_datum_majorant (v d D : ℝ) (hv : 0 ≤ v)
    (hd : d ≤ D) : v * d ≤ v * D :=
  mul_le_mul_of_nonneg_left hd hv

-- Exact scalar transport in the HasSum caller, before taking norms.
theorem normalize_term (C w c r : ℂ) :
    w * (C * c * r) = (C * w) * c * r := by ring

end CompactDependencyRun59

#check inner_product_formula
#check siegel_weil
#check hasSum_partialIntegral_coset
#check tendsto_partialIntegral
#check IsSharp.partialIntegral_eq
#check rallis_inner_product_euler
#print axioms CompactDependencyRun59.zero_from_sharp_mass
#print axioms CompactDependencyRun59.edge_volume_ne_zero
#print axioms CompactDependencyRun59.bounded_datum_majorant
#print axioms CompactDependencyRun59.normalize_term
