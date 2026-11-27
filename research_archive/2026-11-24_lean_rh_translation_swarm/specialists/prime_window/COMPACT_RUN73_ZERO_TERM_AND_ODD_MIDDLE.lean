import New.Seesaw.SeesawTheorem
import Mathlib.Tactic

/-!
# RUN73 — actual negative-grade support, singleton Gram entry, and odd-middle exclusion
27 Nov 2026. Source-matched HUMAN DERIVATION; prepared scalar Lean certificates, not executed.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Latest mission 9f4a2272265e847b3a46422b02d4b37e976bee10, including
completion-first and mandatory reduction; SWARM_PROTOCOL, HANDOFF_QUEUE,
EXPANSION_15_LANES, AGENTS, continuity and latest compact manuscript consulted.
Prime RUN72 9474467c. Recent peer b66c0b19 (Taylor/root-cone), 43ff3e37
(Fourier gauge), cbfdcc8a (CM vacuum), 327ee638 and 55d81106 (integration)
identified, not duplicate assignments. Continue RUN72 exact native near-line
caller, not the already integrated finite-sum or scalar endgame. No URT.

## 1. Zero-term support from the same integral vector, not separate places

EdgePair.lean 46–54: let K be the finite isotropic frame of the actual splitting,
M M'^H=I and f fixed by finite Heisenberg translations M O^n. Suppose the
zero term of the translated datum at y is nonzero. Use the native valuation-pair
primitive factorization M'^H K = K0 C, with C invertible and K0 integral
primitive (has an integral left inverse). Then M K0 v = K C^-1 v for each
integral vector v. The zero term is invariant under the K-direction; moving
the M K0 v translation past the y translation gives the Heisenberg pairing
character. Since the zero term is nonzero and the original datum fixed,
the character must be 1 for every v. With the actual self-dual character
normalization (mem_stdLattice_iff_psi₀) this says
                  (C^-1)^H K^H y in O^p.
Primitivity of K0 means K0^H has an integral right inverse; choose ONE
l in O^n with K0^H l equal to this vector. Multiplying by C^H gives
                  K^H(y - M' l)=0.
This is exactly zeroTermFin_support, not just an inequality or a
place-by-place choice of l. Retain the primitive-factorization and
Heisenberg/zero-term laws as their native mathematical inputs.

## 2. Transport to rational coordinates at LinesStep 70–87

Write F=V.xFin*x_fin and F'=V'.xFin*x'_fin, T=Y.stringMap Y',
alpha=WeilData.alpha. Use actual splitting from UnfoldingStep 160–176.
In rational coordinates the isotropic frame is the coordinate inclusion of
the strictly positive degree entries of Hom(V,V'); its Gram dual satisfies
  J_H^-1 K_rat K_rat^H J_H = diag(1_{grade'(b)<grade(a)}).
Here J_H is the Hom Gram, not the Gram J of V. In the source
K=K_fin=F_H^H J_H K_rat up to the specified frame identity
K^H=K_rat^H J_H F_H, where F_H=V'.xFin tensor V.xFin^-T.
This is the identity from LinesStep 75–78; use it in the stated adjoint
orientation, not an assumed integral inverse of F_H.

Move the pair Weil translate to the outside of the Heisenberg action
using covariance. The scalar pair character is nonzero. In zeroTermFin_support
take g=G.onHom(x,x')_fin, M=b*g, M'=star(b)^-1*g; M M'^H=I.
The native finCoord_homAtPoint (BesselIntegral 37–39) gives
  y=vec(alpha^-1 F'^-1 T_fin F).
The Kronecker identity G.onHom_snd identifies g*vec(L) with
vec(x'_fin L x_fin^-1). Apply the support relation, multiply by the
frame F_H, then by J_H^-1 K_rat as in LinesStep 79–82, and by star(b).
With L=vecToMat(l), W=F' L F^-1, one obtains the exact entry equality
  W_{ba} = star(b_idele)/alpha * (T_fin)_{ba}
                   whenever grade'(b)<grade(a).             (A)
All other entries of W are unrestricted. No estimate on l other than
integrality is required. The original constTermAtT nonzero hypothesis
is used through exists_splitting_constTerm and zeroTermFin_spec; no
generic nonzero theta period can replace it.

For adapted B,B' the matrices B^-1 F and B'^-1 F' are integral
invertible. Because F F^H=J^-1, F^H=F^-1 J^-1. Therefore
  B'^-1 W J^-1 B^-H = (B'^-1 F') L (B^-1 F)^H
is integral. This is precisely the source matrix in LinesStep 84–87.
There is no assertion that W or either rational frame is itself integral.

## 3. Exact singleton extraction, including the central Gram cancellation

Let s'=s-1, i in the new string, r=s-1-i in the old string.
Use source flagOrder (EqualLinesOrbit 18): 4j+1 on strings and 2s
on X, so increasing order weakly decreases grade s-1-2j (grade 0 on X).
In entry (i,r) of the integral matrix above, use the old Gram reversal
to write the sum over target index b and old index a:
  (B'^-1)_{i,b} W_{b,a} (J^-1)_{a,rev(a)}
                     star((B^-1)_{r,rev(a)}).
Nonzero triangular factors force flag'(b)>=flag'(i) and
flag(rev(a))>=flag(r). Thus grade'(b)<=s-2-2i and
grade(a)>=s-1-2i, including grade-zero X indices (the flag order
on X lies between positive and negative grade strings).
Consequently EVERY possible nonzero summand is in (A)'s strict
negative-degree region. There W is the string map times the SAME
scalar. T vanishes on X or X' and on unequal string indices.
For string indices the two triangular conditions now say b>=i
and a<=i. Since a=b, exactly a=b=i can survive. Hence the entry is
  (gamma'_i)^-1 (star(b_idele)/alpha)
      T_{ii} (J^-1)_{i,r} star(gamma_r^-1).                  (B)
The native string map gives T_ii=c^e times -N if 2i+1=s,
otherwise c^e, where e=1 iff (Odd s' iff i<=i.rev_new).
Indeed i<=i.rev_new iff 2i+1<s and s,s' have opposite parity.
The inverse Gram entry is -1/N in that central case, otherwise 1.
Since N != 0, the two central factors cancel exactly; (B) becomes
  c^e * star(b_idele/gamma_r)/(alpha*gamma'_i) in O.
This is the actual missing H at LinesStep 65–66, with the same
adapted witnesses. Combine with RUN72 (1)–(4), which supplies the
remaining scalar two-sided valuation implication. This avoids
separate norms on the central factors or a bound on matrix size.

## 4. Odd-middle reflected inequality by a split diagonal frame

LinesStep 17–50. For adapted B at x, the integral Gram entry of
(B^-1 F)^-1 at string i,rev i gives
  log beta_i(w)+log beta_rev(i)(bar w) <= 0
except the old string centre when N has valuation -1. There the
right side is <=1. If w=bar w then q.2 (P disjoint conjugate) rules out
the exceptional place. For bar w in P interchange the conjugates.
Thus any violation must be at odd s, i=(s-1)/2, w in P, and
  log beta_i(w)+log beta_i(bar w)=1                          (C)
by integrality of ideleLogVal. Fix that actual w, not another place.

Construct gamma_j=beta_j for j<=i and gamma_j=star(beta_rev(j))^-1
for j>i. Let d=diag(1_X,gamma). Use split unitary localization at w
to choose y supported at w (and its forced conjugate) so the frame
F_new at w is d_w. This is LinesStep 27–33, using the actual
atSplit isomorphism. At w its adapted diagonals have the prescribed
first-half valuations. At bar w the Gram relation forces
  (F_new)_{bar w}=J^-1 (d_w^H)^-1
where the adjoint transports the w-coefficients to bar w.
This is a monomial matrix (reversal times diagonal); its lattice has
an adapted diagonal basis with j-th entry
  J^-1_{j,rev j} * star(gamma_rev(j)(w))^-1.
For j<i this has precisely the valuation of beta_j(bar w)
by definition of the upper half of gamma. For j=i it has
valuation 1-log beta_i(w)=log beta_i(bar w) by (C).
Off w,bar w the original lattice is unchanged. Thus the SAME
new lattice has all first-half string valuations equal to the
old ones at every place. This direct monomial computation replaces
only the local scalar comparison in source 34–41; keep the
integral Witt orbit theorem EqualLinesOrbit 84–106.

By that theorem some k in Kf has n=x_new k x^-1 in BesselFin.
Then nx=x_new k. For A in maxCompactAt(X,w) the conjugation
by nx at w is, in integral finite frame coordinates,
  k^-1 d_w^-1 diag(A,I) d_w k = k^-1 diag(A,I) k.
The last matrix is integral invertible, and the involution gives
the conjugate component. Away from w and bar w the element is
identity. This contradicts the actual exclusion hg. This proves
the reflected inequality at the previously exceptional centre,
conditional on the precise split-localization and integral Witt
suppliers and hg. No assumption that N is a unit at w.

## 5. Supply hg at its actual stage consumer, not a generic vanishing

UnfoldingStages 95–112. At an odd-length graded string the stage
is even, k+1=2j+2 in the source induction. Suppose nonzero stage
at g and some n in BesselFin permits the central X-level
conjugation at a place w in P. The source factorization
exists_unipotent_mul_inclX at (1,n)^-1 writes the original point
as a unipotent translate of the definite X-embedding at the
modified point. By hasDegreeGe_two_of_odd, genericity changes
the value by a unit additive character; it does not change zero.
Use the SAME t and the SAME earlier y and xi from unfoldStage_even
(the update identity removes only the unused future coordinates).

The ramified column phi is (I-R(z_w)) psi for one psi in Column.
Indeed ChainValuation 197–209 defines ramifyingOp as the product
of the commuting central (1-z_v) factors. Remove just the w factor
and apply the remaining product to the original preimage.
Here z_w is scalarFin(centralGen w), integral at w by 187–189.
Under the native pair Weil scalar identity and the unramified
rank-twist determinant character (UnfoldingStages 101–105),
the paired chain maps R(z_w)psi to translation of the output
by the SAME central scalar at the last Y-stage. The conjugation
assumption puts the corresponding X-scalar into the last Y
level: maxCompactAt_le_levelOf at 108–112, with the native
levelPlaces/levelNorm exclusions and w in P (not a twist place).
Thus y_last and its translate have equal quotient representatives;
evaluatedDatum_out proves equality of their evaluated data, not
merely equality of norms. The two evaluations of psi in the
matrix coefficient at t agree. Their difference, the actual
stage value of phi, is zero, contradiction. This supplies hg
relative to the named native equivariance, evaluated pair,
unipotent factorization and exact level/character facts. These
are retained, not claimed newly independently reconstructed.
Together with sections 1–4 and RUN72 this gives the connected
near-line/stage-cut argument at the original seesaw consumer.

## Source ledger (all paths relative to grh-compact/src)
New/Seesaw/LinesStep.lean 017ac7b96f33f7a41462aaef726ed1d26dec6767 17–50,57–94
New/Seesaw/EdgePair.lean 02588c1ebc8eed128efaa107d9a9e1b5863d4d02 21–54
Lib/Weil/Periods/UnfoldingStep.lean 3967758138b6287044bbfd2657f67cfb5077c5a2 134–176
Lib/Weil/Periods/BesselIntegral.lean b7eb71106debb76e1b97526f7c540b7d4d28bed8 37–43
Lib/Weil/DualPair/PairSplitting.lean 7060d2715dc64318e5f657357bce32c32bf11772 112,202–204
Lib/Weil/Periods/FiniteBesselGroup.lean 14c0b4ab31b22a94941f6c4e52d77b17887cba6b 19–29,76–93
Lib/Weil/Periods/DegreeAndUnipotent.lean c5b913c258a02c5429bc8962604e04420dbb66e2 18–52,110
New/Seesaw/EqualLinesOrbit.lean b5ace630b79ecf9eeaca084da26fc55abe4c1e6d 18,54–77,84–106
New/Seesaw/UnfoldingStages.lean 5e6b4189ad78c708ce8f30888678b4467672b850 38–67,72–112
New/Columns/ChainValuation.lean 19e853dfa8c645bfcdf3b3e21183f9b432620ef7 185–209
Actual root path: star_inequality -> Data.short_forms -> Data.seesaw
-> exists_isAdmissibleComb_unfolding -> exists_stage_cut
-> hasNearLines_of_unfoldStage_ne_zero -> HasNearLines.step
and IsAdaptedAt.ideleLogVal_add_rev_nonpos.
Original selected edges: step -> {zeroTermFin_support, splitting projector,
finite coordinate identity, integral matrix, singleton sum, parity scalar};
reflected -> {integral Gram, split localization, integral Witt, hg};
hg -> {ramifyingOp, evaluatedDatum_out, unfoldStage_even, scalar
equivariance, level and genericity}. Reduced human path uses (A),(B),(C)
and linear difference cancellation; no global native edge removed.
Retain original/reduced graphs, all axioms, exact local witnesses and
unresolved prerequisites; cache only under same pin, D,Y,Y',s,k,w,Q,
N,alpha,b, actual frames, column and translated data. Do not import
claimed RH theorem or infer complete proof from this block.

Native lean/lake/elan not on PATH, checked. No native rh_scan/rh_prune/
rh_reduce/rh_auto/rh_auto_frontier execution. Prepared scalar certificates
and named module probes below. Actual historical targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804 on cathedral-research-state
compute/rh-compact-primitives-replay-20261126/outputs: A module timeout
124 at 2700.11s, six B/C checks standard three axioms,
all_requested_checks_ok=false, full_RH_replay=false. No new PASS.

RESUME HERE: independent audit of split frame at bar w and projector
orientation; then connect stage-cut to the exact two-edge norm/multiplier
in AdmissibleEvaluation/SeesawTheorem and actual short_forms consumer,
checking latest peer integrations first. Do not repeat RUN72 scalar
arithmetic or RUN73 singleton. Request native runner batch these probes
and prepared scalar lemmas after shared A build available. Keep all
other A, B, C and analytic open obligations in the existing ledger.
HANDOFF TO integration, editor, theta, formal audit, shared native runner.
-/

namespace CompactPrimeRun73

theorem grade_gap (s i a b : ℤ) (ha : a ≤ i) (hb : i ≤ b) :
    s-2-2*b < s-1-2*a := by omega

theorem singleton_string (i a b : ℕ) (ha : a ≤ i) (hb : i ≤ b)
    (hab : a = b) : a = i ∧ b = i := by omega

theorem odd_middle_sum (u v : ℤ) (h : 0 < u+v) (h' : u+v ≤ 1) :
    u+v = 1 ∧ 1-u = v := by omega

theorem middle_gram_cancel (N c : ℝ) (hN : N ≠ 0) :
    (c * (-N)) * (-(1/N)) = c := by
  field_simp

theorem common_translation_difference (a b : ℂ) (h : a = b) :
    a-b = 0 := sub_eq_zero.mpr h

#print axioms grade_gap
#print axioms singleton_string
#print axioms odd_middle_sum
#print axioms middle_gram_cancel
#print axioms common_translation_difference

end CompactPrimeRun73

#check zeroTermFin_support
#check Grading.exists_splitting_constTerm
#check Space.finCoord_homAtPoint
#check Grading.IsAdaptedAt.ideleLogVal_add_rev_nonpos
#check Grading.HasNearLines.step
#check Data.hasNearLines_of_unfoldStage_ne_zero
#check Data.exists_eq_sub_centralGen
#check Data.seesaw
#print axioms Grading.HasNearLines.step
#print axioms Data.hasNearLines_of_unfoldStage_ne_zero
