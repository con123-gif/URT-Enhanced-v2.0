import New.Selmer.RibetFirstOrder
import New.Selmer.RibetElement

/-!
# Audit: exact double Cramer, block rows, triangular Fitting and squarefree coefficient
27 November 2026. AGREE/PARTIAL. Human source-matched reconstruction, not native replay.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission latest blob 9f4a2272265e847b3a46422b02d4b37e976bee10, compact manuscript
29820c25acc91450aa8ec712774b57b3d0051c41. Read SWARM_PROTOCOL, HANDOFF_QUEUE,
AGENTS, research state/log/protocol and continuity headers. Previous own
5512bf37. Latest peer results inspected 06aae25d (filtered lift), 1f40f707
(Landherr), 08451434 (E descent); not duplicating. Completion-first compact
mission supersedes old outer-shell route. Actual chain: Main -> New.grh ->
star_inequality -> C -> fit twists / lift-volume comparison -> Ribet element.
No RH conclusion used. Preserve old graph and all unresolved dependencies.

Source ledger (relative to grh-compact/src):
New/Selmer/RibetFirstOrder.lean a05cb18d1ee62520f104d41361099db4b23cbe1f,
  exists_mem_fittingIdeal_block, ribet_first_order (actual complete bodies).
New/Selmer/RibetCramer.lean 6f5a4b0d00c600aaa0acdbf118da2f7dffee1e69,
  amitsur_charpoly_mem_matrix, exists_ribet_element_cramer, ribetNormaliser.
Lib/General/Algebra/BlockFittingBound.lean 9107737c82be74338b8843ab315bf11d1b186d51,
  exists_rows_addVal_det_le.
Lib/General/Algebra/FittingDuality.lean 50c522f409cc0214163df1d26b77aede4aa8100a,
  exists_matrix_addVal_det_le_length, mem_of_forall_form_eq_zero,
  fittingIdeal.triangle, fittingIdeal.exists_cost_le_relLength.
New/Selmer/BlocksAndCocycles.lean 2bc5a11b2127e4b46eb4f57bfc1ef55.
New/Selmer/RibetElement.lean 188eeb68d437bfa58bcc30042d4eee66c2111e18,
  ribet_columns (actual consumer), sum_blockLoss_le.
New/Selmer/TwistForRows.lean 802242498ad4530e7f52cc4f14e0a03be2c59f4d.
No fresh elaborated edge extraction.

## 1. Double Cramer without inverses (actual trace ideal)
Let A=S[G], where S is the native coefficient algebra of polynomial families.
Write rho for the representation over the ambient matrix algebra of families.
Use the actual Amitsur supplier: characteristic-polynomial coefficients for
individual group elements give coefficients for every element of S[G].
For the flattened block matrix this also follows from the native
amitsur_charpoly_mem_matrix: spanning elementary block matrices have the
same nonzero characteristic-polynomial part as their diagonal entry
(the off-diagonal case has only zero eigenvalues). Retain this established
integrality theorem, not a presumed integrality of individual matrix entries.

V is a LEFT-module linear map, represented by a column b of V(e_j).
Write w as a row; v=V(w)=w b. The actual row hypothesis decomposes M b
as r + m v, with each r_i in the trace-ideal span, m_i in the designated
left ideal. Work after embedding original coefficients into S. By
Cayley-Hamilton adjugates, there exist a polynomial adjugate W of M in
the matrix algebra over S[G], and eta of v in S[G], whose represented
images satisfy W M=det(rho M) I and rho(v eta)=det(rho v) I. This uses
the characteristic polynomial of the FLATTENED block representation,
not an undefined determinant in a noncommutative group ring.

Define a=det(rho M) 1 - w W m (the scalar belongs to S).
Then represented a v = w W r exactly. Let h be the source test element
with rho_x(m_i h)=0 at the special points. Set f=tr(rho(a h)) in S
by the coefficient-of-characteristic-polynomial trace formula.
At those points f_x=det(rho_x M) tr(rho_x h). Globally, cyclicity
of the ordinary matrix trace gives the exact identity
  det(rho v) tr(rho(a h))
    = tr(rho(eta h a v))
    = sum_i tr(rho(eta h (w W)_i r_i)).
The right side belongs to the trace ideal: its defining all-g test
extends by S-linearity to every multiplier in S[G], and left spans
remain allowed by cyclicity. Thus f beta belongs to the ideal, even
if v or M is singular. No inverse or division by determinant,
and no pointwise-to-global inference about vanishing of m_i h.
This is the actual exists_ribet_element_cramer implication.

## 2. Block row bound, strict inequality essential
For psi:A->M_d(O) onto and N an A-submodule of A^s, the O-span L
of rows of evaluated tuples from N is a submodule of O^(sd).
Left matrix units, lifted through psi, isolate any one coordinate
row and put it in any prescribed row. Therefore the image of N
under psi is exactly the set of d-row matrices whose rows lie in L.
Adjoin p O^(sd) to obtain L'. Smith normal form over O yields exponents
e_i in [0,v(p)] and a basis of L' with determinant valuation sum e_i.
Its dual annihilator in (O/p)^(sd) has length sum e_i (diagonal
kernel length min(e_i,v(p))). It is precisely the native vectors
killed by all N after unflattening, so sum e_i<=b<v(p).
Choose that basis and write every row as one in L plus p times
an integral vector. Assemble the L rows into s block rows using
lifted matrix units and addition, hence into B with rows in N.
The flattened determinant agrees with the basis determinant mod p.
Since basis determinant valuation <v(p), their valuations agree.
This proves the exact exists_rows_addVal_det_le, including the
otherwise essential strict guard; at equality determinants p and 0
are congruent mod p but have different valuations.
In ribet_first_order the rho_pi block uses h_rho onto from the
span of rho_pi(G); evaluation at all X=0 is essential. Native map
from killed vectors to cocycles uses finite generators x=W+s0+s,
the relations hg,hK,h_tau,h_omega,hx, and the scalar unit y(pi)-1.
Retain hb0 and hlt; no automatic bound on arbitrary cocycles.

## 3. Triangular Fitting scalar, with original costs
Use the native formsMod dual separation (SNF of Phi^{-1}(K) containing
pO^n, hence the O/p dual detects its quotient). First apply
exists_cost_le_relLength with V=functions zero on L: enlarge N to K,
pay e with v(e)<=relLength Z V, obtaining Phi(z(g)) in K for g in L.
In the native triangle, write d_j=Phi(z(phi(j,true))-z(phi(j,false))),
t_j similarly using tau. Then t_j-X_j d_j belongs to K. Adjoin d_i for
earlier i in I. Their dual forms now have equal earlier phi pairs.
For i<j outside I the native hI says X_i times every vector belongs
to N, so earlier tau differences vanish in the dual. h2 of HasTriangleCost
therefore makes C times the j-th tau difference vanish for every
remaining form. Dual separation gives C t_j in the enlarged module,
and exact subtraction gives C X_j d_j there. Adjoining d_j costs C X_j
in Fitting ideals by the alternating determinant lemma: expansion
of determinants uses at most one occurrence of the newly added row,
because two proportional copies have zero determinant.
Induction pays product over I. Next add the ideal of all variables,
and use the second native relative-length cost lemma with C-torsion.
At this stage the forms are zero at every tau, agree on phi pairs
on I, and remain zero at L. Thus the two relative costs together
are <=b by h3. C Phi(z(g)) is now in the enlarged module, so using
hs each C times standard basis row is present. Its determinant
is C^|s|. The Fitting ideal after adding the variable ideal is
contained in the original Fitting ideal plus that ideal (reduce
each determinant modulo the ideal). Hence choose d4 in the
Fitting ideal whose constant term is C^|s| times the second cost
scalar. Combining gives Gamma=e C^|I| d4 with
  Gamma product_(j in I) X_j in Fitt N,
  v(Gamma(0))<=b+(|I|+|s|)v(C).
This uses exactly the native two relative-cost suppliers and
duality, not an assumption that the entire Selmer module is short.
The relative-cost lemma itself is retained: its Noetherian induction
uses a strict height decrease of the image modulo V at each
uniformizer step, not an unproved cardinality argument.

## 4. Exact finite-support cancellation at the actual squarefree coefficient
Let I_e={j:ty j=e}, P_e=product_(j in I_e) X_j,
P=product_e P_e. Let q=(X_j^2 : j in J) in Lambda=O[X_J];
this is precisely restrictSupportIdeal for the complement of the
lower set of the all-ones multiindex. For empty J it is zero.
The monomial ideal is an upward-closed support condition; in
particular multiplying by an arbitrary polynomial cannot create
a coefficient at any exponent n<=1_J.

The source hGamma and fittingIdeal.sup_smul_top_le give
  D_e = Gamma_e P_e = F_e + zeta_e,
  F_e = sum_i w_ei det B_ei,
  zeta_e product_(a<e) P_a in q.
The last condition is the actual colon ideal in ribet_first_order,
not zeta_e in q by itself. Earlier i<j with ty i<e are killed
by this colon ideal, since multiplying their X_i by the preceding
product duplicates X_i. All other earlier indices lie in I_e,
by monotonicity of ty. This is the actual triangular hI supplier.

Use ordered telescoping BEFORE taking coefficients:
  product_e D_e - product_e F_e
    = sum_e (product_(a<e) D_a) zeta_e (product_(a>e) F_a) in q.
Each summand contains the exact earlier product of P_a and the
required zeta_e; no division and no independent coefficient estimates.
Consequently for every polynomial T,
  coeff_n(T product_e F_e)=coeff_n(T product_e Gamma_e P_e)
  for n<=1_J.
This proves the native hd' step uniformly for every special x.
At n strictly below 1_J the right side is zero, and at 1_J it
is T(0) product_e Gamma_e(0). Terms outside the lower set are
allowed; no false assertion that the entire f is divisible by P.

## 5. Same actual special point pi and complete valuation accounting
At x in the native special set, k constructed as a product of
(y_x-gamma_x)/(y_x-1) has psi_x(k)=0 and eta_e(k)=1.
Here division is only by the given units. The Lagrange q_e satisfies
eta_a(q_e)=C if a=e and zero otherwise; no division by C.
Let a=(product_v o_v(1)) C^|s|. With the native M_i constructed
from the delta polynomial rows, nu rows, and q_e-weighted lower
blocks, the evaluated character block determinant is
a det B_e(i_e): block triangularity gives o_v(1) on the top
diagonal, identity on the middle diagonal, C B_e on the last.
Retain the exact correction witnesses nu and w' from the source.
The interpolated matrix B0+k(M_i-B0) evaluates to B0 on psi_x
and to M_i on each eta_e. All rows satisfy the original N condition
by hB0, hH, h_nu, h_w'. The trace selector k q0 times
product_e w_e(i_e) has trace C product_e w_e(i_e) on the
special set and kills the ideal multipliers (eta_0=0 on that ideal).
Apply section 1 to each such matrix, then sum f_i; ideal membership
survives addition. On the special set the exact resulting polynomial is
  f_x = C a^t det(flat psi_x(B0)) product_e F_e.
By section 4 this has no coefficient properly below P and the
P coefficient at pi is precisely
  c = C a^t det(flat psi_pi(B0))(0) product_e Gamma_e(0).
The original beta vanishes on the special set because the trivial
character block of each u(g)-1 is zero. This is the actual
IsRibetElement, not just a bound on some unrelated determinant.
Combining valuations at the SAME pi yields
  v(c) <= b0 + sum_e b_e
        + t (sum_v v(o_v(1)) + 2 |s| v(C))
        + (|J|+1) v(C).
The two |s| costs are distinct (Gamma_e and a^t); do not cancel.
The partition sum sum_e |I_e|=|J| is exact. This matches
ribet_first_order without changing exponent or constants.
At ribet_columns, the native caller retains its actual block loss,
row budget, triangle cost and normalized DVR-to-ellVal bridge;
it uses this bound plus its own arithmetic to obtain
ellVal(chosenGroupOrder^3*d)<=card(r)*rowBudget.
No independent claim of RowBalanced, crystalline defect, odd-Sha
or actual reciprocity-to-isotropy supplier closure here.

## Evidence
Native lean/lake/elan absent (command -v); no rh_scan/prune/reduce/auto
executed, no local or CI kernel PASS for this certificate. Actual compact
CI receipt compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
on cathedral-research-state, blob 088cd2ec0e935ee1a282f10096949bcf671cc804:
6 named checks (TiltingLemma and Filling.Moments), standard three axioms;
module_1 build timeout 124; all_requested_checks_ok=false;
full_RH_replay=false. These are not checks of current theorem.
Orchestrator summary da094c04 run 45950378335 pertains to other checks.
Original and reduced graphs preserved separately; local human DAG:
Amitsur + adjugate + trace ideal -> double Cramer;
DVR dual + matrix units -> B0;
relative cost + triangle -> Gamma_e;
Gamma_e + colon + ordered telescoping -> coefficient at pi;
all above + native row corrections/selectors -> first-order Ribet consumer.
Cache key compact pin, O, N, p,p0, exact pi, ty,I_e, q, h_rho,
actual family u, exact witnesses k,q_e,M_i, B0. Do not global-delete
other consumers. Prepared probes below, no new native axiom evidence.

Exact local regression (Python/SymPy, executed 7 assertions):
import sympy as s
x,y,z=s.symbols('x y z'); R=(x,y,z)
def cut(f): return s.Poly(f,*R).as_dict()
D=[x*(1+x+y),y*(2+x*z),z*(3+y)]
Z=[x*x,x+y*y,y+z*z]; F=[d-e for d,e in zip(D,Z)]
err=cut(s.prod(D)-s.prod(F)); assert all(any(i>1 for i in m) for m in err)
assert cut(s.prod(F)).get((1,1,1),0)==6
assert cut(x*y-x*(y-1)).get((1,0,0),0)==1
B=s.Matrix([[2,1],[0,1]]); W=s.Matrix([[0,1],[1,1]])
H=s.Matrix([[1,2],[0,3]]); m=s.Matrix([[1,0],[2,1]])
for V in [s.Matrix([[1,0],[0,0]]),s.Matrix([[1,2],[3,4]])]:
    Vw=W*V; r=B*V-m*Vw; a=B.det()*s.eye(2)-W*B.adjugate()*m
    assert a*Vw==W*B.adjugate()*r
    assert Vw.det()*s.trace(a*H)==s.trace(Vw.adjugate()*H*W*B.adjugate()*r)
Output: 7 exact assertions succeeded; singular and nonsingular target,
lower-set negative control. First attempt failed due to an incorrectly
chosen negative control (its error was y^2, already outside lower set);
replaced by missing-prefix example above. These are algebra checks only.

RESUME HERE: follow ribet_columns' actual caller to the lift-volume
comparison, independently audit the remaining normalized row-budget
supplier and the first-order coefficient-to-evaluation argument (do
not equate formal coefficient with evaluation at a tame parameter
without the actual valuation/specialization guards). HANDOFF TO
integration/editor/Galois/kernel. AGREE/PARTIAL: exact source-matched
Ribet coefficient assembly, conditional on retained suppliers.
-/

namespace AuditRibetCoefficient
theorem ordered_two {R : Type*} [CommRing R] (D₁ D₂ F₁ F₂ z₁ z₂ : R)
    (h₁ : D₁ = F₁ + z₁) (h₂ : D₂ = F₂ + z₂) :
    D₁ * D₂ - F₁ * F₂ = z₁ * F₂ + D₁ * z₂ := by
  rw [h₁, h₂]
  ring

theorem ordered_three {R : Type*} [CommRing R]
    (D₁ D₂ D₃ F₁ F₂ F₃ z₁ z₂ z₃ : R)
    (h₁ : D₁ = F₁ + z₁) (h₂ : D₂ = F₂ + z₂) (h₃ : D₃ = F₃ + z₃) :
    D₁ * D₂ * D₃ - F₁ * F₂ * F₃ =
      z₁ * F₂ * F₃ + D₁ * z₂ * F₃ + D₁ * D₂ * z₃ := by
  rw [h₁, h₂, h₃]
  ring

#check exists_rows_addVal_det_le
#check exists_ribet_element_cramer
#check exists_mem_fittingIdeal_block
#check ribet_first_order
#check ribet_columns
#print axioms ordered_two
#print axioms ordered_three
#print axioms exists_rows_addVal_det_le
#print axioms exists_ribet_element_cramer
#print axioms exists_mem_fittingIdeal_block
#print axioms ribet_first_order
#print axioms ribet_columns
end AuditRibetCoefficient
