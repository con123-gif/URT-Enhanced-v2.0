import New.Seesaw.GoodDatumExists

/-!
# RUN75 — exact odd-string neighbour membership and denominator matching
27 November 2026. SOURCE-MATCHED human derivation; executable scalar certificates
prepared, NOT executed. Compact pin lsernau/grh-lean
72fead102f663d5c7a407964a13dc0cf9d977207 (Lean 4.35.0, Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679). Credit Alpöge, Sernau, Anthropic
collaborators and Claude. Continue RUN74 (2e613067). Read current mission
(blob c960cfc62fc12f5c44f9327d0cd5507ab386c7ea), protocols, AGENTS,
and peers e91491fb, 998ff341, 19a5089a, 3b218469: no duplicate marked-orbit
or Rallis work. The actual compact caller is GoodDatumExists 21–38.
The earlier readable companion gives the same coordinate formulas (see
ledger); check against compact definitions rather than import its theorem.

## 1. One inverse lattice criterion, not separate coordinate estimates
Write R=A_f(E), O=Ohat, bar=star. In an odd string of length l, let z
be its unique middle coordinate and e the last index of X+Unit.
The basis G=gradedLatticeBasis is the identity on ordinary X coordinates,
has e-column e/bar(pi)+u z/(pi bar(pi)), and string columns u times the
coordinate vectors. This follows entrywise from LatticeAndTorsionDefs 16–20
using b=b.rev iff 2b+1=l. Thus G^-1 v has ordinary coordinates v_j,
e-coordinate bar(pi)v_e, central coordinate u^-1 v_z-pi^-1 v_e,
and other string coordinates u^-1 v_b. This is exact by multiplying G;
pi and u are units. Since xFin=G k, k in GL(O), integrality of xFin^-1 v
is EQUIVALENT to integrality of these coordinates (both k,k^-1 integral).
The compact helper inv_xFin_mulVec_mem_of_spansLattice is its sufficient
direction with the other string coordinates zero. In particular the
central residual is tested in O, not the two potentially nonintegral
summands separately.

## 2. Common scale and local denominator match
Let g=D.chosenIdele, beta=D.piGBar viewed in O, a=alpha/bar(g),
delta=g/bar(g). Let eta=Weil.normNegOne with eta in O and eta bar(eta)=-1.
Let s=bar(eta)bar(alpha)/alpha, t=s^-1 as in xV of
isAdmissibleEval_finEval, so s(a/bar(a))=bar(eta)delta exactly.
For M=2rho+2 and i<=rho the exponent (M-j+1)/2 of latticeScale
is rho-i+1 at j=2i AND 2i+1, and rho-i at j=2i+2 (Nat floor).
Write u=latticeScale(2i+1)=latticeScale(2i), u'=latticeScale(2i+2).
Then s u=bar(eta)delta u'; u'=1 at i=rho.
Use the SAME a, pi, u, u' and lattice witnesses of spansLattice_gradingY.

The valuations of g equal those of beta at every finite w by
v_chosenIdele, and star transports w to star w. Thus
v(bar(beta)delta)=v(beta) at every w, by multiplicative cancellation of
v(bar(g)), nonzero since g is an idele. delta bar(delta)=1; at places
over N the chosen supports and conjugates are absent, g=bar(g)=1 and
v(beta)=1. Consequently bar(beta)kappa is integral for every row
(kappa=1 or delta), and selfOrConj(beta)kappa integral too (left rows
always kappa=1). These are hN,h1,hG,hkappa,hdelta at the actual caller;
retain isSplitLevel_piPlaces, piIdele_spec and generator_spec.

For hA (support matching), middlePair's ordinary-coordinate columns
are inclusions in their original block, so the row weights coincide.
lastPair also keeps all but its final column in their own block.
The exceptional column e'' maps to z/pi in the LEFT block, with
kappa(e'')=delta. The required row weight identity is precisely
v(beta)=v(bar(beta)delta). The scalar pi^-1 does not change which
matrix entries are zero; hA is a support condition, not an assertion
that that matrix is itself integral. All zero entries satisfy the other
disjunct. No independent estimate is needed at the two conjugate places.

## 3. Middle pair: common correction c
Take an arbitrary neighbour (c,x) from IsNeighbourVector, set
A=pi^-1 x_e, B=pi^-1 x_e'', r=c-A in O, r'=bar(eta)c-B in O.
All ordinary coordinates integral and bar(pi)x_e,bar(pi)x_e'' integral.
delta c=c. With l>1 odd, both outer strings are odd. middlePair includes
the hyperbolic directions (z-z'')/(2N), z+z'' and the ordinary blocks.
The input to hM has first hyperbolic coefficient 0, second s u c, left
ordinary coordinates s x and right x. Hence after dividing left by s
(the flipSum inverse frame formula), the central coordinates are u c
on left and s u c=u' bar(eta)c on right; all other string coordinates
zero. Section 1 gives central residuals r and r' exactly. Both are in O.
The ordinary and e-coordinate conditions are the actual neighbour
hypotheses, so BOTH outer inverse-frame vectors are integral. The
(2N)^-1 column never contributes: its input is exactly zero.
This establishes hM in the middle branch, with no norm or valuation loss.

## 4. Last pair: eliminate the common correction before taking valuations
At i=rho, left string length 1, middle and right length 0,
u'=1 and s u=bar(eta)delta. lastPair maps the final column e'' to
z/pi (pi is the principal idele of the rational p with p bar(p)=N).
No hyperbolic-plane contribution remains. The input right-final entry
is delta x_e'', so the left central coordinate AFTER the flip scale
is t delta B = -eta u B, since t s=1 and eta bar(eta)=-1.
By section 1 the central inverse-basis coordinate is
        -A - eta B = (c-A) + eta (bar(eta)c-B) in O.       (*)
Both residuals on the right are integral and eta is integral.
No division by c or eta is used, and delta c=c is NOT needed for this
last central check. The ordinary left coordinates and bar(pi)x_e are
integral by the neighbour premises. On the standard last space the
inverse frame is identity, and all surviving right coordinates exclude
e,e'', hence integral. This establishes hM in the last branch.
Note that (*) must be formed before applying valuations: bounding A and
B independently can introduce a spurious denominator at N.

## 5. Exact consumer, including even source frame and scope of closure
At AdmissibleEvaluation 167–211, B_matrix is the Kronecker product of
the inverse-frame image of the neighbour columns and the transpose of
J^T xFin_middle, with J the inclusion of the grade-zero ordinary X'
indices. Middle string length is even. Its gradedLatticeBasis has
ordinary block identity, no off-diagonal middle-column contribution
(no fixed point of reversal), so J^T xFin_middle consists of the
ordinary rows of integral k. The first factor is integral by sections
3–4, the second by this even basis argument. Each Kronecker entry is
therefore integral: hB. hA ensures weighted support, using the retained
hgamma support of the explicit neighbour matrix. The zero-frequency
annihilation tau=B_matrix^H stackedTFin=0 at line 197 is retained
as the separate source string-map/Gram identity, NOT inferred merely
from integrality. The source isAdmissibleEval_finEval then gives
isAdmissibleEval_pairEvalY for every i<=rho with one constant per i,
uniform in the coprime n and inputs. Retain the explicit finite
neighbour matrix, named-box expansion and zeroTermFin covariance
inside that theorem: this is a discharge of its geometric hA/hM
suppliers, not an independent proof of the entire representation theorem.
At GoodDatumExists 43–82 the constant is product over i of these
constants, and the original denominator/size rules of IsAdmissibleComb
are unchanged. This connects to RUN74's seesaw consumer and preserves the
same common good datum; no new local scaling choice per test or prime.

## Provenance and selected graph (all compact paths under grh-compact/src)
New/Seesaw/LatticeAndTorsionDefs.lean d92de3b66fe1dc9c9a356de9a50779dc36289ac0 12–26
New/Seesaw/AdmissibleEvaluation.lean 4a0070f1658927e4faf4e596cceb0009478b6c2d 32–40,60–64,167–211
New/Seesaw/EdgePair.lean 02588c1ebc8eed128efaa107d9a9e1b5863d4d02 237–258
New/Trace/GoodIdempotent.lean 638eaebb14d06d09a7e028258d4ecd84716ccf1f 54–70
New/Seesaw/PairTensorData.lean ade3783be65d0ac72f29b46220354147ffdca110 (v_chosenIdele, spansLattice_gradingY)
New/Seesaw/GradingsOfY.lean 9a0ce95531f7ef503b23167e9d90ef3d417f1bf8 (pairEvalY, lastGrading)
New/Seesaw/GoodDatumExists.lean cc6f93272fb65dd22d8079236a66454b034182b9 21–38,43–82
Readable companion grh/src/New/UpperBound/Seesaw/AdmissibleEvaluation.lean
ebc9ac14fd3c6e6782b5eb9adf32e8db9a9d5040 lines 657–807:
liftsNeighbours_middleDoubleLift, matchesDenominators_middleDoubleLift,
liftsNeighbours_lastDoubleLift, matchesDenominators_lastDoubleLift.
Companion GoodDatum.lean 872c165dc29a781435b6e066f8cab5166d221c84
(latticeScale_two_mul, flipScale_mul_divStar_ideleA).
Original selected edges:
star_inequality -> short_forms -> seesaw -> exists_isAdmissibleComb_reducedVacuum
-> isAdmissibleEval_pairEvalY -> {isAdmissibleEval_finEval, middlePair,
lastPair, inv_xFin_mulVec_mem_of_spansLattice, spansLattice_gradingY}.
Reduced HUMAN edges: the same caller consumes sections 1–4 and retained
finite-neighbour/zero-term supplier; no native graph deletion or claimed
complete graph. Cache key compact pin,D,i,N,pi,a,u,u',delta,eta,grading
and actual common lattice witnesses. Earlier source/axiom records remain.
Native lean/lake/elan absent from PATH (checked); rh_scan/prune/reduce/auto/
auto_frontier not executed, no URT. Re-fetched CI state
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804: six B/C declaration axiom
audits propext,Classical.choice,Quot.sound; A build exit 124 (2700.11s),
all_requested_checks_ok=false, full_RH_replay=false. No new PASS.
All original analytic and A/B/C obligations remain unless separately proved.

RESUME HERE: integration/editor attach hA/hM/hB above to RUN74 and
RUN72–73 at the actual GoodDatumExists caller. Independently audit the
flipScale orientation and e'' mapping against pinned definitions.
Next prime-window task: derive retained tau=0 from the grade-zero map
and stackedT string reversal, and the finite-neighbour matrix support
and denominator index in exists_isAdmissibleEval_std (if not already
covered by latest peers); then attach the whole local evaluation argument.
Shared native runner to batch the probes and scalar certificates below
when compact A build available; no protected workflow change.
HANDOFF TO integration, theta, editor, independent audit, kernel runner.
-/

namespace CompactPrimeRun75

theorem middle_residual {R : Type*} [CommRing R] (s u up etab delta c : R)
    (hscale : s * u = etab * delta * up) (hc : delta * c = c) :
    s * u * c = up * (etab * c) := by
  calc
    s * u * c = (etab * delta * up) * c := by rw [hscale]
    _ = up * etab * (delta * c) := by ring
    _ = up * (etab * c) := by rw [hc]; ring

theorem last_scale {R : Type*} [CommRing R] (s t u eta etab delta : R)
    (hscale : s * u = etab * delta) (hts : t * s = 1)
    (hnorm : eta * etab = -1) : t * delta = -(eta * u) := by
  linear_combination (t * eta) * hscale - (eta * u) * hts + (t * delta) * hnorm

theorem last_residual {R : Type*} [CommRing R] (O : Subring R)
    (eta etab c A B : R) (hnorm : eta * etab = -1)
    (he : eta ∈ O) (hA : c - A ∈ O) (hB : etab * c - B ∈ O) :
    -A - eta * B ∈ O := by
  have h : (c - A) + eta * (etab * c - B) = -A - eta * B := by
    linear_combination c * hnorm
  rw [← h]
  exact O.add_mem hA (O.mul_mem he hB)

end CompactPrimeRun75

#check Data.isAdmissibleEval_pairEvalY
#check Data.exists_isAdmissibleComb_reducedVacuum
#check @isAdmissibleEval_finEval
#check @inv_xFin_mulVec_mem_of_spansLattice
#print axioms CompactPrimeRun75.middle_residual
#print axioms CompactPrimeRun75.last_scale
#print axioms CompactPrimeRun75.last_residual
#print axioms Data.isAdmissibleEval_pairEvalY
