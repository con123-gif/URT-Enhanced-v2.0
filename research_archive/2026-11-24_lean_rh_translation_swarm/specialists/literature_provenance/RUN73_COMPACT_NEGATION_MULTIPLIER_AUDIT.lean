import Lib.Weil.DualPair.PairSumNegation
import Mathlib.Tactic

/-!
RUN73 — independent Rallis graph/negation audit and exact determinant phase,
27 November 2026. Human source-matched derivation; scalar certificate prepared,
not compiled. Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Original source leanprover-community/riemann-hypothesis@
40e56bab026552e089d7afcfeff08d2defb9c005, Main.lean blob
dbd5db70bc11b35f18fa5751216ab335321e7bfc re-read; latest upstream search
7c4ccbd64d02774b0a5f923f5b7a18e8abc not adopted.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src. Mission blob 7b03ba9740905da93d1cd7cd9d8036c400faeb03,
including mandatory native pipeline; protocol, queue, expansion, AGENTS,
continuity read. Compact manuscript blob bff8e0abac557928fb1efd193293f07ebe00a30d.
Peer integration a1866e42 (doubling phase note blob
fa626ccdeba32a1ef36bb99face4f27090385375), a4bb5084e (convergence/graph),
1ae8974a (Landau character audit, as recorded by mission), d4c26f66
(Galois depth, distinct), 5b49b9ab (Hecke degree, distinct).
No reopening of already derived absolute bounds or canonical scalar endgame.

Actual caller and source blobs:
Lib/SiegelWeil/RallisInner/SharpData.lean
 ea9f665a9a89411f1353d098ff2e0a4e59a719f5
 lines 56–67 doubleDatum and graphSplitting, 95–107 zeroTerm_graphSplitting,
 150–174 inner_product_formula and its q,e identities.
Lib/Weil/DualPair/PairSumNegation.lean
 d2f45383d2e972574a7e749da0f2b4bb9283c6da
 negSource, weilMultiplier_neg, pairWeil_negSource,
 exists_theta_negSource, theta_boxProd_source, pairWeil_boxProd_source.
Lib/Weil/DualPair/PairSplitting.lean
 7060d2715dc64318e5f657357bce32c32bf11772
 124–125 det_onHom, 173–177 pairWeil_of_mem_Gamma, 210–212 homSource.
Lib/Weil/MixedModel/NameWeilAction.lean
 a8bee0d694dc7891bb451bc6503f45aed919d2d3
 80–85 Std.omega_map (notation omega = ω).
Lib/Weil/Construction/PairDefs.lean
 8a5eaed1249fcc1c482e3af4f15373682fa34af1
 188–196 dataInner_eq_quotMean, 216–218 theta_rho, 292–301 pairChar/pairWeil.
Lib/Weil/MixedModel/ZeroTerm.lean
 e26a6037c53efb630f1dd8cf959aef3e0855fc5d
 560–561 zeroTerm_apply.
Lib/Weil/Construction/FiniteMultiplier.lean
 7b35474d42010a69abe9ba5868c0fce4d4490efc
 chiAdelic, chiFin, Sat.glMultiplier_eq, glMultiplier_inv, glMultiplier_star,
 finMultiplier_inv, upsilon_mul_finMultiplier.
Lib/Weil/Construction/ThetaFunctional.lean
 b21b5f01564922bbd2ed309ef614111698b2384a
 127–129 definition and description of global Weil multiplier.
Lib/Adelic/Witt/SpaceOperations.lean
 42d0ff55145da26c116891f9822c3a3dfddec57a
 178–193 finite norm-minus-one unit; 218–222 actual negated space.

1. Independent agreement on D6–D8, conditional on the native
normalized theta functional, rational invariance and zero-term laws.
Put J=J_S and Jd=diag(J,-J). For the graph k=(delta;-I),
k*Jd=(delta*J,J)=(J delta^-1,J); companion is
l=(delta;I)(1/2)J^-1. This verifies the orientation from the actual
homSource frame T.J^-1 tensor (k*Jd)^transpose, without substituting
the l frame instead. In rational matrix coordinates the two blocks
are (Y delta^-1,Y) with Y=J_T^-1 Z J. As both Gram matrices are
invertible over E, Z->Y is a bijection of the rational matrix
space and its adelization. On the compact additive quotient it
preserves normalized Haar, not necessarily a separately fixed
unquotiented Haar. The second STANDARD block is multiplied by
c=normNegOneIdele because S.neg.x=c S.x. The standard first block
is T.x^-1 Y delta^-1 S.x. This is exactly the standard-coordinate
right action of the rational embedded inverse, not the bare
rational matrix in standard coordinates. N=rho-compatible negation
satisfies N rho(y)=rho_minus(cy) N. c need not be rational; lattice
transport holds because the negative space point is changed too.

Use the auxiliary unit-rescaled doubling D of integration D4.
The product theta equals theta(f) conj(theta(f')), with ONE constant
rescaling independent of the data. Then the graph integrand is
theta(rho(Y delta^-1)f) conj(theta(rho(Y)f')), in rational notation.
For R=Omega(delta^-1,1), covariance gives
R rho(Y delta^-1)=rho(Y) R. Rational theta invariance gives
theta(rho(Y delta^-1)f)=theta(rho(Y) R f).
The native dataInner_eq_quotMean takes first argument conjugate-linear:
mean [ (R f)(y) conj(f'(y)) ] = dataInner(f',R f).
This agrees with SharpData.zeroTerm_graphSplitting and does not
lose the inverse. Pair characters are trivial on rational delta,
so the same coefficient is weilMatrixCoeff b. No new Haar scalar.
This verifies the graph/pairing component, not the independent
absolute convergence suppliers or the whole Rallis theorem.

2. Finite negation multiplier: no need to rederive the cocycle
or to identify projectively equivalent actions. Set Lambda=Ohat^r.
For finite invertible b and a saturating frame u,
u Lambda=Lambda intersect b^-1 Lambda; b u Lambda is
Lambda intersect b Lambda. Thus b u is a saturating frame for
b^-1. The source's Bezout formulation is also immediate: if
L u+M b u=I then M(bu)+L b^-1(bu)=I. Hence directly
 Delta_f(b^-1)=chiFin(det b) Delta_f(b).
For the conjugate transpose the invariant factors of the
underlying local lattice map are unchanged by transpose (Smith
normal form over each local DVR, or native integral left/right
equivalence to transpose); conjugation transports the factors
to the conjugate place. The finite character is unramified,
conjugation inverts upsilon, and preserves idele absolute value.
Thus Delta_f(b*)=conj Delta_f(b). These are precisely
glMultiplier_inv and glMultiplier_star; retain saturation existence,
the finite character construction and integral equivalence,
not a bare invocation of an unspecified Weil splitting.
For the native finite unitary H, H^-1=H* and det H has idele
absolute value one (norm-one determinant at the paired places).
Therefore
 conj Delta_f(H)=upsilon(finIdeleIncl det H) Delta_f(H).
This recovers the exact finite phase used in weilMultiplier_neg.
It holds also at the places above 2 under the original WeilData;
no use of odd-residue formulas. It is not a new proof of WeilData
or of the finite cocycle construction.

3. Real negation multiplier by one complementary-minor identity.
Write real H in its positive/negative blocks [A B; C D], J=diag(I,-I).
H*JH=J gives A*A=I+C*C and D*D=I+B*B, hence A,D invertible.
From block elimination,
det H=det D det(A-B D^-1 C).
The top-left inverse block is (A-B D^-1 C)^-1=A*, since
H^-1=J H* J. Consequently
 det D = det H conj(det A).
Empty blocks use determinant one; same argument or the trivial
full-block unitary identity. Old real multiplier is conj(det D),
new (sign-reversed) real multiplier is conj(det A). Thus
conj(old multiplier)=det H * new multiplier, including noncompact
real H. This is U.principalMinor_compl as used by
weilMultiplier_neg, with the orientation made explicit.
Multiply over all archimedean places and use the exact finite
identity in section 2. Retain the native character factorization
upsilon_eq_prod_mul_of_v_eq at infinity/finite places
(the prescribed archimedean determinant character and finite
unramified valuations). The conclusion is the actual source
conj(Delta_old(H))=upsilonU1(det H) Delta_new(H.neg).
No assumption that either Delta itself is of unit modulus.

4. Exact character cancellation at pairWeil_negSource.
Let n=rk S, M=rk T, H=onHom(g,h), A=a(det h), B=b(det g),
U=upsilonU1(det h), V=upsilonU1(det g). All four are unit scalars.
The native onHom determinant is det(h)^n det(g)^(-M);
hence the global twist factor is C=U^n V^(-M).
The scalar coordinate change defining N commutes with the
underlying matrix action on Hom and conjugates the Heisenberg
bicharacter; its transport is Std.omega_map, whose actual proof
uses the vacuum integral and the multiplier, not just covariance.
With Delta_old, Delta_new as in section 3, it gives
N omega_old(H) = C omega_new(H.neg) N.
Since N is conjugate-linear, N(A B^-1 omega_old(H) f)
= A^-1 B C omega_new(H.neg) Nf.
On the other side the new pair character for
(a^-1 upsilon^n, b^-1 upsilon^M) is
 (A^-1 U^n)(B^-1 V^M)^-1 = A^-1 B U^n V^-M.
The scalars are IDENTICAL; this derives the exact all-adelic
pairWeil_negSource needed in SharpData q, with no residual character.
No need for a comparison of arbitrary classical splitting choices.
Block covariance separately follows from the native block
multiplier factorization and omega_boxProd; keep that supplier.

5. Scope and provenance ledger.
Original local source-visible caller:
inner_product_formula.q -> pairWeil_negSource -> Std.omega_map,
weilMultiplier_neg, det_onHom -> U.principalMinor_compl,
upsilon_mul_finMultiplier -> glMultiplier_inv, glMultiplier_star.
Graph e -> zeroTerm_graphSplitting -> normalized theta pairing,
homSource, rational pair invariance, quotient Haar.
Reduced human replacement: one saturation identity, one Schur
complement identity, one determinant character cancellation,
and the same normalized graph pairing. This is an independently
derived human supplier at the actual Rallis caller, not a native
dependency graph prune; all original and reduced graphs and
axiom records remain intact. Cache by compact pin, S,T, signs,
ranks, character, finite integral lattice and actual pair action.
The source headers attribute Weil representation and splitting
to Weil 1964 and Kudla 1994; no external theorem was imported
as an axiom and those citations alone do not establish the
native normalizations. The accepted inputs here are explicit
source bodies/retained construction results, not PublishedTheorems
or OpenLiteratureStatements names. Remaining separate suppliers:
the global Weil construction/cocycle, actual finite dual-datum
at CharacterLiftNorm/TriangleArrows, named-model cutoff/conductor,
absolute majorants, all other A/B/C primitives. No claim of
independent verification of the full stable-range equality.

Execution: local Python/SymPy exact Laurent cancellation for
(n,M)=(0,0),(1,1),(2,3),(3,2),(8,17) returned zero.
For an exact noncompact U(1,1) test H=diag(i,1) times
[[5/3,4/3],[4/3,5/3]], H*JH=J and
D-det(H)*conj(A)=0; replacing det(H) by its inverse is nonzero.
These are scalar regression controls, not native data or a
substitute for the general proof above. Lean and Lake not
installed locally (command -v returned no path). Current mission
receipt: six named native checks plus timeout124, full_RH_replay=false.
Orchestrator summary 27 Nov 07:29:26 run 45956225375 pertains to
19a5089, not this file. No new native PASS; scalar certificate below
prepared for shared runner, no execution of rh_scan/prune/reduce/
auto/frontier in this unavailable native environment. No graph
retirement or RH claim.

RESUME HERE: independently audit the remaining exact finite dual-datum
multiplier at CharacterLiftNorm/TriangleArrows; match the actual
character and conductor before using a named-model cutoff. Integrate
sections 2–4 at SharpData.q and record the independent graph audit
at SharpData.e. Check the shared native replay before promoting
the prepared certificate. Retain all other unresolved obligations.
HANDOFF TO: integration, audit, positivity, theta and native runner.
-/

namespace LiteratureRun73

/-- Exact scalar endpoint of the native negated pair action.
The phase variables stand for nonzero circle scalars; no RH theorem. -/
theorem negation_character_cancel {G : Type*} [CommGroup G]
    (A B U V D Dneg : G) (n M : ℕ)
    (h : D = U ^ n * (V ^ M)⁻¹ * Dneg) :
    (A⁻¹ * U ^ n) * (B⁻¹ * V ^ M)⁻¹ * Dneg =
      (A * B⁻¹)⁻¹ * D := by
  rw [h]
  group

#print axioms negation_character_cancel

end LiteratureRun73
