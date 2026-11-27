import Mathlib

/-!
# Formal audit: graph zero term separates translates; remove the Hilbert tensor phase argument

27 November 2026. AGREE / PARTIAL. One source-matched conditional replacement at the actual Rallis caller, not RH closure or a native replay.

Read latest ONE_EQUATION_MISSION.md blob 3dd7cddd2af5fe5e97f8680382fc1b2979b89792
(including mandatory engine), SWARM_PROTOCOL blob 4b77b161d6876915c15cea5a4d4a519beaf5de74,
HANDOFF_QUEUE blob bbc46df7d7716a6d8863275b5271801eacfaad0d, AGENTS and research state.
Peer proposal integration/2026-11-27_COMPACT_DOUBLING_PHASE_AND_GRAPH_PAIRING.md blob
6b8baaa851afb81ea67601523b84c3119e3a4441, especially D5--D9.
Original source pin leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005;
compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
under grh-compact/src. Credit Alpöge, Sernau, Anthropic collaborators and Claude.

## Result: avoid Schur's lemma, Hilbert tensor completion, all-adelic phase comparison

Let W=Hom(S,T), Wd=Hom(S sum S.neg,T), P=graphSplitting S 1, E=P.lagrangian.zeroTerm T.
Write D(f',f) for the native doubleDatum (or the peer's normalized auxiliary with the same D5/D7).
Write A_h=splitWeil on Wd at (1,h), U_h=pairWeil on W at (1,h), and
r_h on W, r^d_h on Wd for left multiplication by h in the actual standard coordinates.
These are invertible and scalar c=normNegOneIdele commutes with them.

Retain:
(a) E D(f',f)=dataInner(f',f) (native zeroTerm_graphSplitting at delta=1).
(b) A_h and U_h implement exact Heisenberg covariance, U_h preserves dataInner.
(c) E A_h=E, from mixedValue_splitWeil at x=0, plus sourceTerm at zero and
zeroTerm_lagrangian_eq_theta. This does NOT require the Rallis identity.
(d) Heisenberg equivariance of box and negSource:
  rho_d(y,z) D(f',f)=D(rho(c^-1 z)f',rho(y)f).
The central complex-conjugation convention is absorbed by the actual semilinear negSource
transport. This is equality for individual vector operators, not an assertion that the
uncorrected projective rho is an additive group representation.
(e) exact mixed expansion and positive definite dataInner.

**Separating family, proved in the actual complete graph model.**
For any native w on Wd, suppose E rho_d(t) w=0 for every adelic vector t.
For any z, exact Heisenberg multiplication gives rho_d(t)rho_d(z)=unit_scalar*rho_d(t+z).
By (e), E rho_d(t)rho_d(z)w=0 for all t,z.
For every rational matrix x, sourceTerm at T.x^-1 x is precisely the graph mixed term:
  P.sourceTerm T X = (P.homSource T).zeroTerm composed with rho_d(matToVec(X*P.kCoord)).
Apply theta on the complement; this is E rho_d(t) with that specific t. Thus ALL
summands of hasSum_theta_sourceTerm for rho_d(z)w vanish, and
  theta_d(rho_d(z)w)=0 for EVERY z.
The normalized quotient mean identity gives dataInner(w,w)=0; native positive definiteness
gives w=0. There is no appeal to bounded evaluation on the Hilbert completion.
Equivalently the mixed-term L2 identity proves separation directly, but the above uses
only the source's actual exact theta expansion and normalized pairing.

**Direct target covariance on native data.**
Let v = D(f',f), v_h=D(U_h f',U_h f). Every t=(y,z) in doubled standard coordinates
has t0=(r_h^-1 y,(r^d_h|second)^-1 z). By (b,c):
  E rho_d(t) A_h v = E A_h rho_d(t0) v = E rho_d(t0) v.
By (d), U_h covariance, and c commuting with target multiplication:
  rho_d(t) v_h
    = D(U_h rho(c^-1 z0)f', U_h rho(y0)f).
Apply (a,b) to obtain the same E rho_d(t0) v.
Hence the decisive equality is
  E rho_d(t) [A_h D(f',f) - D(U_h f',U_h f)] = 0  for ALL t.
Separation proves D9 directly, for every h and f',f. No tensor completion,
irreducible commutant, auxiliary scalar lambda, or invariant-form uniqueness theorem
is needed. No equality of Banach/Hilbert norms. The argument does not rely on the
falsely stronger assertion that a single graph evaluation is injective.
It also works for the native canonical D, so there is no need to introduce a new
normalization at this caller if using the source theta_boxProd_source and
exists_theta_negSource. For the Rallis q g g' h use D9 then D5 exactly as the
peer note says; same h, same height-reduced input data, no changes in absolute bounds.

D6--D8 audit: the companion frame includes 1/2 J_S^-1 and source uses
T.J^-1 tensor S.J^T in the graph quotient parameter. The rational invertible map
Y=J_T^-1 Z J_S preserves probability Haar on the rational additive quotient,
not unnormalized Haar on the adeles. For k=(delta;-I), delta*J_S=J_S delta^-1
yields (Y delta^-1,Y); source graph evaluation indeed uses ratEmbed delta^-1.
Rational character factors are trivial; rational theta invariance transfers
rho(Y delta^-1) to rho(Y) pairWeil(delta^-1,1). AGREE with this orientation.
Do not confuse c with a rational scalar: native S.neg.x=c S.x; standard coordinates
transport the same rational Z across negSource. Native StablyUnram premise remains.

## Source receipts (fetched exact bodies, not inferred from names)
- Lib/SiegelWeil/RallisInner/SharpData.lean blob ea9f665a9a89411f1353d098ff2e0a4e59a719f5:
  54--67 doubleDatum and graphSplitting; 95--109 graph zero term; 150--195 actual
  inner_product_formula, in particular q at 158--165.
- Lib/SiegelWeil/Formula/ZeroTermHeight.lean blob 0a910704dae028b30156fc8ab362d3425e50ada8:
  50--52 mixedValue, 77--82 zeroTerm_lagrangian_eq_theta, 112--114 mixedValue_splitWeil.
- Lib/Weil/DualPair/PairSplitting.lean blob 7060d2715dc64318e5f657357bce32c32bf11772:
  264--282 sourceTerm, sourceTerm_eq_mixedTerm, hasSum_theta_sourceTerm.
- Lib/Weil/Construction/PairDefs.lean blob 8a5eaed1249fcc1c482e3af4f15373682fa34af1:
  185--218 normalized mean, unitary rho/omega, positive definiteness, theta orbit;
  294--301 pairWeil and characters.
- Lib/Weil/MixedModel/ZeroTerm.lean blob e26a6037c53efb630f1dd8cf959aef3e0855fc5d:
  558--578 zeroTerm_apply, mixedTerm, exact mixed law.
- Lib/Weil/DualPair/PairSumNegation.lean blob d2f45383d2e972574a7e749da0f2b4bb9283c6da:
  192--221 negSource and normalized theta, 230--241 theta product and original block law.
- Lib/Adelic/Witt/SpaceOperations.lean blob 42d0ff55145da26c116891f9822c3a3dfddec57a:
  178--193 finite norm-negative unit, 210--222 sum and neg.
- Lib/Weil/MixedModel/NameWeilAction.lean blob a8bee0d694dc7891bb451bc6503f45aed919d2d3:
  66--76 Std.map_rho and vacuum.

## Original/reduced graph and open evidence
Original human candidate D9 <- tensor inner factorization + tensor surjectivity +
Heisenberg irreducibility/commutant scalar + graph trace at vacuum + (a)--(d).
Replacement D9 <- (a)--(e) + exact Heisenberg multiplication and separating-family proof.
The original native q dependency still includes pairWeil_boxProd_source and
pairWeil_negSource; only the human candidate branch is reduced here. No deletion in
native graph or other consumers. No new axiom ledger for upstream root; native
source pin and pending frontier unchanged. Conditional half-strip, full-prime
uniform cohomology, stable-range absolute bounds, finite sharp datum and remaining
A/C geometric/primitive suppliers are not certified by this result. No URT claim.

## Executed checks and prepared certificate
Local container: lean and lake absent (command -v both empty). Cannot execute native
rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier; no fake PASS. Generic
logical bridge below is prepared, not compiled. It does not purport to be the
actual SharpData replacement term; source instantiation is the next kernel task.
Retrieved actual CI job metadata: 45577239749 pick/run/record success,
45576756833 pick/run/record success. These are earlier conditional checks only.

Exact small negative-control test run in Python, 625 pair comparisons and 2 assertions:
```python
from itertools import product
V=list(product(range(-2,3),repeat=2))
E=lambda v:v[0]
rho=lambda y,v:v if y==0 else v[::-1]
for a,b in product(V,repeat=2):
    assert (all(E(rho(y,a))==E(rho(y,b)) for y in (0,1))) == (a==b)
assert E((1,0))==E((1,1)) and (1,0)!=(1,1)
assert E(rho(1,(1,0)))!=E(rho(1,(1,1)))
```
This is a logical negative control, not a numerical test of RH or the native model.

RESUME HERE: Integration/editor substitute the direct separating-family argument for
D9 section 4, and kernel extractor instantiate the following bridge at SharpData q;
next independent audit: actual finite dual-datum cutoff and finMultiplier at
CharacterLiftNorm/TriangleArrows. Keep all root/axiom evidence and prior graph.
HANDOFF TO: integration, kernel extractor, positivity, literature, human editor.
-/

namespace RHAuditGraphSeparation

/-- Pure logical bridge: a separating family of observations and matching
transport of their values proves equality. No tensor, scalar or irreducibility. -/
theorem observed_transport
    {X Y I O : Type*}
    (obs : I → Y → O) (tau : I → I)
    (A : Y → Y) (B : X → Y) (D : X → Y)
    (sep : ∀ v w : Y, (∀ t, obs t v = obs t w) → v = w)
    (hA : ∀ t v, obs t (A v) = obs (tau t) v)
    (hB : ∀ t x, obs t (B x) = obs (tau t) (D x))
    (x : X) : A (D x) = B x := by
  apply sep
  intro t
  rw [hA, hB]

#print axioms observed_transport

end RHAuditGraphSeparation
