import Mathlib

/-!
# RUN67 — complementary exchange: signed L-product cancellation and common ratio
27 November 2026. Human source-matched reconstruction, PARTIAL; no new kernel
replay. Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission latest blob 9f4a2272265e847b3a46422b02d4b37e976bee10; manuscript
944957c6f43b63df7a845472b31492dc0ca1cb8f; AGENTS, protocol, handoff,
expansion and recent peer commit index read. RUN66 already removed general
real_matching at this caller; this note descends the retained exchange branch.
No new equivalent RH formulation or URT premise.

## 1. Exact source chain
New/Exchange/ExchangeTheorem.lean 608b4f61af27d780e24f799937a836ecd3c1d50a,
exchange_theorem -> New/Exchange/EqualRankValue.lean
a620150b7c616d614013822be11dbdf74a694f0d,
exists_equalRankThetaRatio_value (160–209), exchange_of_partners,
exists_stdExchange_removing_planes.
LowRankIdentity.lean efd396aa9b0681ecba5a2364546a295094866a2c (75–125)
defines equalRankThetaRatio, StdExchange and stdExchange_of_periods.
LargeSideConstantTerm.lean 5f229d7bec78a4d167b9f0feed9a1a44cd52d9d9
(29–65) defines SIGNED lValueProdInt and one-plane constant term.
Lib/Weil/DualPair/Lift.lean fccbd7536c6b333975f17078ed355e71d0b11f25
(117–121) proves transpose Fubini with both rapid functions.
Readable companion at SAME pin:
grh/src/New/Determinant/Exchange/TheoremForPartners.lean
ce25f3cb6ba24e8f34174de581e3a76478b11be8, lines 542–738,
explicitly separates the compact proof's zero case, two directions and
product cancellation. Use for explanation only; not an interchangeable
kernel certificate.

## 2. Double exchange on the same kernel (compact 193–209)
Specialize to actual Carrier rank two definite W; k=1, q=0, weights mu>=1.
J is the standard positive definite rank two space, Z is the rank zero
space, Y=H+J where H is a hyperbolic plane. Transport by the native
thetaLarge_move/isometry (compact 197–200) for a reindexed W; no added
plane in q=0. Write L(e)=lValueProdInt for one fixed tame character A:
by its definition L(e)=lValueProd(e_+)/lValueProd((-e)_+), with L(0)=1,
L(e)>0 by native lValueProdInt_pos. Therefore L(1)L(-1)=1 exactly.
In particular the rank difference in the reverse exchange is -1 in
the INTEGERS, not truncated natural subtraction.

Fix one rapid v on Y x Y, and R_A=|thetaLarge_Y(v,A)(1)|^2/L(2)>=0.
Apply exchange_of_partners FIRST to (J,J,Z), with rank-zero vacuum as
small datum, obtaining real B and rapid y independent of A. For each A,
get b_A and
   B |b_A|^2 = L(1) R_A.
Then apply exchange_of_partners to (J,Z,J), with this SAME y and v,
obtaining real C and rapid x independent of A, and for each A,
   C |c_A|^2 = L(-1) R_A.
Do not choose a fresh y at each A. The compact proof uses two calls with
the same Q splitting and standard partners at identity, one with the
empty column and one with the empty row. This is exactly the order in
lines 193–194; neither uses exchange_theorem or RH as an input.

Set vol0=measureReal([U(Z)])>0, volJ=measureReal([U(J)])>0, and
xi=integrated(x,vacElem)(0) (the rank-zero Fock functional in line 196).
For each A form one finite/real datum f_A=localDatum(J,J,y,stdColDatum(chi,1)).
Use gamma=rankTwist(nu^-1,J), and kernel K_A(g,h)=pairTheta(J,J,gamma,gamma,f_A).
The forward identity before twist is thetaIntegral(J,J,gamma,1)=
b_A vol0 gamma(det g). Multiplying gamma,gamma by gamma(det g) restores
gamma,1; cancel the nonzero determinant character. The reverse
identity has rank-zero target: the finite datum evaluates to 1 on the
unique empty matrix, oscillator/character factors there are trivial.
Thus the exact pair of identities is
  integral_h K_A(g,h) = b_A vol0        for every g,
  vol0 xi = c_A integral_g K_A(g,h)     for every h.
These statements are made explicit in the readable companion lemmas
exists_thetaLarge_eq_mul_quotMeasure and
exists_quotMeasure_mul_eq_mul_integral_pairTheta. All data and constants
here are the compact choices of EqualRankValue 193–209, not an import of
the companion theorem.

Integrate both identities over the other quotient. Fubini is justified
by integral_lift_eq_integral_descent with constant rapid functions on
definite J. The result is
  volJ vol0 xi = c_A b_A volJ vol0.
Cancel positive volumes before norms: xi=c_A b_A. No unit volume
normalization and no division by either exchange constant or R_A.
Now multiply the two norm identities and use the signed inverse law:
  R_A^2 = B C |xi|^2.
For fixed v the right side is independent of A, so nonnegativity gives
R_A=R_A0 for any reference A0. This proves the actual common-ratio
portion of exists_equalRankThetaRatio_value, even when individual
exchange constants are zero. The rank-two forward exchange at the final
caller only divides by B after a nonzero reference has been established.

## 3. Nonzero reference, source descent, not a finite test
If no tame A exists, choose rapid vacuum and common C0=1 (vacuous).
Otherwise the compact zero branch assumes ALL tame A and rapid v have
R_A=0; positivity of L(2) forces every corresponding equal-rank theta
value at identity to vanish. The source thetaLarge_eq_apply_one_of_even_rank
then makes the entire period vanish. In stdExchange_of_periods take l=0,
rho=1 and the zero slice on the small side; the box-product factorization
of thetaOnRealData and rapid integrability imply its slice-period
hypothesis is zero. For k=1 the top is H^2+Y (rank 8) with large target
J.neg+Y (rank 6) and small target J.neg (rank 2). Its target negative
signs are 2+1=3. Three adapted plane removals (8 -> 6 -> 4 -> 2, target
6 -> 4 -> 2 -> 0) produce the bottom (J,Z,J.neg). In the actual compact
proof the descent map is surjective on detVectors k=1,j=toNat(mu-1).
The bottom vacuum belongs to this determinant class since the target
is empty, and every relevant determinant product there is empty.
Choose its preimage, not an arbitrary vector; the descended standard
exchange forces the vacuum period on (J,Z) to be zero. But the unique
rank-zero matrix has standard datum value 1 and thetaLarge(vac,1)
equals vol0>0. Contradiction. See compact 169–192 and same-pin readable
exists_equalRankThetaRatio_ne_zero (542ff) for the rank counts and guards.
This is conditional on the actual period-to-exchange theorem, the
constant-term descent with determinant surjectivity, and its
integrability, NOT an independent proof of those primitives.
Consequently choose ONE A0 and ONE rapid v with R_A0>0, before universal
quantification. Section 2 gives common C0=R_A0>0.

## 4. Exact cancellation on each descent edge
The one-plane case of exists_stdExchange_removing_planes uses
exists_constant_term_thetaLarge, thetaLarge_move and the small-side
line radical integral. At an edge write e=rk(V)-rk(W)/2 as an INTEGER;
the higher rank difference is e+1. Let old multiplier c, old common
constant D and ratio R satisfy D|c|^2=L(e+1)R. The large-side constant
term has gamma !=0, |gamma|^2 L(e)=C_edge L(e+1). The small-side
constant term is the vacuum factor v0 times unit-modulus isometry
factor a (the native thetaLarge_move coefficient). The new multiplier
is c'=c v0 a / gamma, with v0!=0. Set D'=D C_edge/|v0|^2, independent
of A. Exact multiplication (without dividing by D, R or C_edge):
  D' |c'|^2 = D C_edge |c|^2/|gamma|^2 = L(e) R.
This follows on substituting the two supplied equalities and cancelling
positive L(e+1). Induction over the three edges preserves the same R
and produces a common constant; slice_zero_comp supplies compositional
compatibility, while surjOn_cone_integral_detVectors supplies the
separate determinant preimage at each edge. These are the exact
normalization mechanics in compact EqualRankValue 39–92. The
line-radical nonzero orbit elimination, cone-integrability and determinant
surjectivity still require their proofs; the scalar equation does not
imply them.

## 5. Actual downstream substitution and ledger
For rank 2, e=1 in exchange_theorem. With the common C0>0, the actual
exchange_of_partners call for (W,V,Z) gives D |b_A|^2=L(1)C0>0.
Hence D!=0 and b_A!=0 for each actual A, and
 |b_A|^2=(C0/D)L(1).
A reference tame A suffices for positivity of D; in an empty family
the statement is vacuous, no denominator claim is needed. The native
modulus-residue lift and partner transfer then yield the original
exchange_theorem at the Carrier caller. This is exactly the common
constant required by RUN66's fixed-line proof and RUN65's measure law.
Do not infer RowBalanced, the quantitative Ribet bound or primeError.

Original source-visible local graph:
Carrier -> exchange_theorem -> exists_equalRankThetaRatio_value +
exchange_of_partners -> exists_stdExchange_top / removal of planes /
equivariant partner lift / flip / finite modulus transfer.
Human graph expands common-ratio node into nonzero reference
(standard period -> 3-plane descent + det-vector preimage -> nonzero
rank-zero volume), double exchange -> same-kernel Fubini ->
signed L cancellation -> common positive ratio; expands edge scalar
into exact norm identities. No global native pruning or axiom change.
Context cache key: pin, rank 2, definite signs, Y=H+J, weights, actual
tame datum, same rapid v,y,x, same measures, signed rank e and edge.
Retain positive-complement callers and all primitive support,
Fourier/constant-term, Rallis/Siegel-Weil, local finite matching,
integrability and lift hypotheses; no circular use of exchange_theorem.
Keep original and reduced graph artifacts untouched.

Actual CI receipt independently read from cathedral-research-state:
compute/rh-compact-targeted-replay-20261126/outputs/targeted_results.json
blob 23de197bd48f404ca2074c69676de289c4f7934e.
all_requested_checks_ok=true; full_RH_replay=false. 10 native checks
(root of unity 2, IndexDvd/HasType 5, HeightLe 3) and 4 scalar checks
(RUN50 telescoping/budget and Ribet prefix) returncode 0, each named
theorem lists propext, Classical.choice, Quot.sound only. These are not
the exchange checks. Prior partial replay remains on its own receipt.
No local lean/lake/elan executable; new scalar certificates below are
prepared, not compiled; no new compact rh_scan/prune/reduce/auto/frontier
run or synthetic test. No claim of new axiom validation.

RESUME HERE: prove the actual period-to-exchange primitive
LowRankIdentity.stdExchange_of_periods from the native equivariant
coefficient criterion, and the nonzero orbit kill in
EqualRankValue.exists_stdExchange_removing_planes (single-plane case);
coordinate with geometry on cone determinant surjectivity and the
absolute unfolding. Audit the signed e=-1 and q=0 specializations,
rank counts, character twist and same-kernel integrability. Then
integrate RUN67 with RUN66 at Carrier and move to the remaining C
near-invariant/RowBalanced arithmetic if peer has supplied primitives.
HANDOFF TO integration/editor, geometry, literature, kernel, audit.
Human RH reconstruction remains incomplete.
-/

namespace CompactCharacterBoxes67

theorem double_exchange_square (L R B C b c X : ℝ)
    (hL : L ≠ 0) (hb : B*b^2=L*R) (hc : C*c^2=L⁻¹*R)
    (hX : X=c*b) : R^2=B*C*X^2 := by
  have hi : L*L⁻¹=1 := mul_inv_cancel₀ hL
  rw [hX]
  calc
    R^2 = (L*L⁻¹)*R^2 := by rw [hi, one_mul]
    _ = (L*R)*(L⁻¹*R) := by ring
    _ = (B*b^2)*(C*c^2) := by rw [← hb, ← hc]
    _ = B*C*(c*b)^2 := by ring

theorem common_nonnegative_ratio (r s d : ℝ)
    (hr : 0 ≤ r) (hs : 0 ≤ s) (h1 : r^2=d) (h2 : s^2=d) :
    r=s := by
  have h : (r-s)*(r+s)=0 := by nlinarith only [h1,h2]
  rcases mul_eq_zero.mp h with h | h <;> linarith

theorem one_plane_norm_transport (L M R D C b g v : ℝ)
    (hM : M ≠ 0) (hg : g ≠ 0) (hv : v ≠ 0)
    (hb : D*b^2=M*R) (hgamma : g^2*L=C*M) :
    (D*C/v^2)*(b*v/g)^2=L*R := by
  calc
    (D*C/v^2)*(b*v/g)^2 = C*(D*b^2)/g^2 := by field_simp <;> ring
    _ = C*(M*R)/g^2 := by rw [hb]
    _ = (C*M)*R/g^2 := by ring
    _ = (g^2*L)*R/g^2 := by rw [← hgamma]
    _ = L*R := by field_simp

#print axioms double_exchange_square
#print axioms common_nonnegative_ratio
#print axioms one_plane_norm_transport
end CompactCharacterBoxes67
