import Lib.CM.FormalGroup.FormalHeight
import Mathlib.Tactic

/-!
# RUN76 — replace the odd-degree formal-height section proof by good reduction
27 November 2026. HUMAN SOURCE-MATCHED independent replacement candidate
at actual A3 caller, not native-verified. Credit Alpöge, Sernau,
Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Original pin leanprover-community/riemann-hypothesis@
40e56bab026552e089d7afcfeff08d2defb9c005 retained separately.
Current mission 4aed2e68e6bd724826bc1e669c07a48e0b95eddd
(including mandatory reduction), live spine 42a627f92d333109537ceeb3b920a931f0518685,
live obligations 17d915cc436b188878df50e1384d77a5a1d4cdcc,
AGENTS, swarm, handoff/expansion consulted. RUN75 b892a87c retained.
Peer b167736d and 4b2ec292 derive the integral section/order route;
82672996 period normalization and c8d08359 finite cutoff read, distinct.
This is a genuinely different replacement at the same formal-height
interface, not a repetition of their section argument.

## 1. Exact source and weaker premises
Lib/CM/FormalGroup/FormalHeight.lean 640cabefca81dde25d092fd6ac057c3bcdd3516e:
CMLattice.exists_unit_coeff_degree_le is a theorem with proof body,
not an axiom. Actual consumer New/Curve/FormalParameter.lean
61130bd5600a2b1f1679cfe0a18123d2c458d425, exists_formal_parameter,
local cg in the nonsplit branch. Keep this same C, a, q, p, iota, Z, g.
The proof below needs only integrality of H=phi(Z), not of all
f(Z) for f in phiSeriesRing; in the actual source the latter implies
the former via isSeriesGenerator_translatedWpDeriv.generator_mem.
It needs no odd-degree assumption. The native caller has both stronger
hypotheses, so the replacement entails its precise conclusion.
Do not change the source's other uses of oddness.
Lib/CM/LocalHeight/IntegralParameter.lean
9dc955b1e8a0650c27c8eda49f6e4adaf94680bd:
norm_disc_eq_one, norm_a₁_le_one, phiSeriesRing, curve identity.
Lib/CM/Sigma/CurveTheta.lean cd276f383c2768ee6039051e407ecac800a7f0d7:
CMLattice, translatedWp, translatedWpDeriv.
Lib/CM/LocalHeight/IsogenyIntegrality.lean
1b7411b4a950de12649c1f2cd171de834f8363fa is retained for its other callers.

## 2. Match the actual integral elliptic curve, not a different model
The native complex functions x(z)=wp(z+t)-wp(t),
y(z)=(wp'(z+t)-a1*x(z))/2 identify C/Lambda with the cubic
  y^2+a1*x*y=x^3+x.
This follows by substituting in the Weierstrass equation, using
a1^2=12wp(t), g2=12wp(t)^2-4 and wp'(t)=0. The usual identity
of this cubic is infinity, but z=0 maps to T=(0,0), a two-torsion
point. Translation by T (an involution) gives the pointed
uniformization. The local coordinate y at T is valid in every
residue characteristic: partial derivative in x at T is -1.
By wp''(t)=2, y(0)=0, y'(0)=1. The source norm_disc_eq_one
and norm_a₁_le_one give an integral coefficient and unit
discriminant for precisely this model, including p=2,3.
Indeed b2=a1^2, b4=2, b6=0, b8=-1,
c4=a1^4-48, c6=-a1^6+72a1^2, Delta=a1^4-64.
In particular, this is NOT just potential good reduction.

One must not apply a DVR theorem directly to the nondiscrete O_Cp.
Here is a descent that avoids doing so. By the CM lattice condition
the j-invariant is algebraic (Mertens, Some applications of singular
moduli and complex multiplication, Thm 2.2.1, p.30; also the
classical CM singular-modulus theorem).
The explicit formula j=(a1^4-48)^3/(a1^4-64) implies a1 is
algebraic: it is a root of a monic degree-12 polynomial over Q(j).
The endomorphism induced by a is algebraic by complex elliptic
uniformization. It descends to a number field after finite extension:
its finite kernel of order q lies in E[q], hence has algebraic
coordinates on the algebraic model; quotient by that subgroup
exists over the algebraic closure of Q, and the pointed isomorphism
from the quotient to E is algebraic (the Weierstrass change of
variables between two elliptic curves over an algebraically closed
field; all such pointed isomorphisms descend here). Thus both curve
and chosen map are defined over one number field F, not merely an
abstract isomorphic model. Restrict the given embedding iota to F,
complete at its induced place and base change to O_Cp only after
using a finite DVR extension. No algebraicity required of Z or g.

## 3. Exact formal coordinate conjugation and ramification bound
Let f be the endomorphism fixing infinity corresponding to z->az;
its degree is q, the lattice index. Let f_T=translation_T o f o
translation_T; it fixes T, has degree q and corresponds to z->az
in the native unpointed coordinates. This avoids assuming f fixes T
and is why oddness is unnecessary here.
The good-reduction model is an elliptic scheme, hence its Neron model.
The Neron mapping property extends f to the model over the DVR;
translation by the integral section T also extends. Degree is
preserved on reduction: Silverman Advanced Topics II.4.4, as also
stated in Cohen--Stevenhagen Computational Class Field Theory,
MSRI 44 (2008), p.523, for CM endomorphisms. Alternatively degree
preservation follows by comparing the degree of the pullback of
the relative origin line bundle on both fibers (degree of a line
bundle in a proper flat family of curves is constant). In particular
the special fiber map is nonconstant, even for p dividing q.
On completed local rings at T its pullback of y is an integral
series F(Y) with F(0)=0. After reduction its first nonzero
coefficient index e_T is the ramification index at T, which
satisfies 1<=e_T<=deg(f_T)=q, including inseparable maps (use
the fiber divisor f_T^*(T), with multiplicities; geometric residue
field may be taken algebraically closed).

In the source formal variable set H(X)=y(Z(X)), applying iota to y.
By the retained hypothesis H belongs to O_Cp[[X]], H(0)=0, H'(0)=1.
The equality Z(g)=iota(a) Z and the uniformization imply EXACTLY
  H(g(X)) = F(H(X)).
There is no norm estimate in this equation. Formal substitution is
valid since all inner series have zero constant. Reduction commutes
with substitution coefficient by coefficient (finite sums).
Since H_bar has order one, both left and right orders are preserved
under conjugation by H_bar. Thus the single decisive equation is
  ord_X(g_bar) = ord_Y(F_bar) = e_T(f_T_bar) <= q.
This proves the original conclusion that at least one coefficient
through q has norm exactly 1, and actually identifies the first
unit degree. It also rules out g_bar=0. The actual nonsplit cg
caller has q=m+1 and all lower-degree coefficients of norm <1;
hence the unit occurs precisely at m+1 as required. No RH premise.
This route is shorter than the native section-integrality, Tate
height, theta multiplier, degree-q coefficient and residue-order
argument at this particular supplier. It does NOT replace other
uses of those sections, e.g. torsion translate integrality or
the rest of exists_formal_parameter, or the split guard and inert
log-theta coefficient supplied by one_le_norm_coeff_translatedWp_nonsplit.

## 4. Literature ledger and verification boundary
- Mertens 2019 Thm 2.2.1, p.30 (PDF page index 29):
  https://www.math.rwth-aachen.de/~Michael.Mertens/HabilShort.pdf
  original statement inspected visually. Only algebraicity is used.
- Cohen and Stevenhagen 2008, p.523 (PDF page index 26):
  https://library.slmath.org/books/Book44/files/15cohenpsh.pdf
  original degree-preservation statement inspected visually.
- Silverman, Advanced Topics in the Arithmetic of Elliptic Curves,
  II.4.4, DOI 10.1007/978-1-4612-0851-8; proposition number
  corroborated by secondary sources, original book proposition
  not directly inspected; use Cohen--Stevenhagen for read statement.
- Snowden, Lecture 9, Neron models:
  https://public.websites.umich.edu/~asnowden/teaching/2013/679/L09.html
  mapping property and identification of good reduction abelian
  scheme read directly. Standard quotient/isomorphism descent and
  fiber degree formula are mathematical inputs; not claimed imported
  Lean declarations or checked external axioms.
- Original graph: exists_formal_parameter -> exists_unit_coeff_degree_le
  -> integral sections / Tate height / degree-q theta multiplier /
  residue divisibility. Reduced HUMAN graph: same caller ->
  good reduction + CM algebraicity/descent + extension and
  degree preservation + coordinate conjugation. Original graph
  unchanged; no global deletion, no new axiom assigned; prior
  root gaps A1--E1 all remain open. Cache key compact pin, C, model,
  t, a, q, p, iota, chosen F, Z, g. Backtrack to peer section proof
  if standard AG interface not acceptable to editor.

Executed local SymPy check (not native Lean), exact identity:
    import sympy as s
    A=s.symbols('A')
    b2=A**2; b4=2; b6=0; b8=-1
    c4=b2**2-24*b4; c6=-b2**3+36*b2*b4-216*b6
    D=-b2**2*b8-8*b4**3-27*b6**2+9*b2*b4*b6
    print(c4,c6,D,s.expand(c4**3-c6**2-1728*D))
    assert s.expand(c4**3-c6**2-1728*D)==0
Output exit 0:
A**4 - 48 -A**6 + 72*A**2 A**4 - 64 0.
This tests normalization only, not the geometric proof.
No lean or lake on local PATH. No native rh_scan/prune/reduce/auto
available. Actual old-pin CI receipts re-read on cathedral-research-state:
compute/rh-recursive-reduction-strip-root-20261125/status.json
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
compute/rh-proof-term-prune-native-20261125/status.json
7da354941e402b6f8b364ed03d8c5c82d27b7717 exit 0, not this theorem.
Compact primitive replay output 088cd2ec0e935ee1a282f10096949bcf671cc804:
six named B/C checks standard axioms only, module_1_build exit 124,
all_requested_checks_ok=false, full_RH_replay=false.
No new native PASS or axiom evidence. The scalar Lean certificate
below is PREPARED only; it does not certify the algebraic geometry.
Native source theorem is included for a future exact axiom check.
No URT experiment or schedule/workflow edits.

RESUME HERE: editor/integration compare this direct A3 degree proof
to RUN57/RUN74 section route, retain exactly one preferred human
supplier, keep both evidence paths. Native batch runner should
replay actual FormalHeight declaration and audit transitive axioms,
then check this scalar certificate; no full geometric Lean replacement
claimed. Literature next independently audit norm_disc_eq_one's
Weber unit source, at its actual everywhere-good-reduction consumer.
Do not reopen the period product or duplicate acceleration.
RH and weighted prime lower bound remain OPEN.
-/

namespace CompactLiteratureRun76

theorem curve_invariants (A : ℤ) :
    (A^4-48)^3-(-A^6+72*A^2)^2 = 1728*(A^4-64) := by
  ring

/-- At the actual caller, the first unit index must be q if all
    smaller coefficients are nonunits; the existence premise is
    supplied by the geometric argument, not by this scalar lemma. -/
theorem unit_at_boundary (q : ℕ) (u : ℕ → Prop)
    (h : ∃ n ≤ q, u n) (hsmall : ∀ n < q, ¬ u n) : u q := by
  obtain ⟨n, hn, hu⟩ := h
  rcases lt_or_eq_of_le hn with hlt | heq
  · exact False.elim (hsmall n hlt hu)
  · simpa [heq] using hu

#print axioms curve_invariants
#print axioms unit_at_boundary
#check CMLattice.exists_unit_coeff_degree_le
#print axioms CMLattice.exists_unit_coeff_degree_le

end CompactLiteratureRun76
