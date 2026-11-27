import Lib.DiscreteSeries.Theta.LocalThetaCorrespondence
import Mathlib.Tactic

/-!
# Dependency RUN76 — Howe generation needs only a single negative-root witness
27 November 2026. SOURCE-MATCHED human replacement proof; independent audit
and native replay pending. Credit Alpöge, Sernau, Anthropic collaborators
and Claude. No RH conclusion from this result.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Original source leanprover-community/riemann-hypothesis@
40e56bab026552e089d7afcfeff08d2defb9c005: Main.lean
dbd5db70bc11b35f18fa5751216ab335321e7bfc re-read (not imported).
Mission a69122b6ad568910a45d2bc13961ab9da4855143 including mandatory engine;
AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, continuity and current CI read.
Observed head 82672996240b7cd9693769fe28eb396a775526ac.
Resume RUN75 fc239d31; previous RUN69 47581d42 already bypasses the
swapped Casimir comparison at its consumer; do not claim this twice.
Peers fab4aba0 (exchange), 80f4ff6e (finite class average), 446c68f9
(geometric energy), c8d08359 (finite dual datum) work distinct branches.

## Source and exact replacement
Read pinned:
* Lib/DiscreteSeries/Theta/HoweArgument.lean
  4a68183128d5be3f39e8a5ed7556bac698b3f4b6:
  IsJointHarmonic.howe_argument, actual proof body.
* Lib/DiscreteSeries/Theta/FischerDecomposition.lean
  49f936d3c6cd2934066c84faa46f002adcf4f2c8:
  mapsTo_perpInDegree, fockLaplacian_eq_zero,
  fockLaplacian_eq_zero_of_isKHighest (commutator).
* Lib/DiscreteSeries/Theta/JointHarmonicUnique.lean
  f255a9013e232ab082c4033e07943cdf3d2b967d:
  polarisation_eq_of_isCompactPrimitive, IsMatch.unique,
  sign_mul_lowestKType_sub_nonneg.
* Lib/DiscreteSeries/Theta/OscillatorDefs.lean
  9da98cd30d3aac174f3c2fc1c9f3c479827dbcad:
  oscRows, fockLaplacian, IsPreJointHarmonic, IsJointHarmonic.
* Lib/DiscreteSeries/FlenstedJensen/RepresentationDefs.lean
  94fea15fbc65ed74c2a44e83dda2cd423d39fbea:
  HCParam.rootCone, IsKHighest, HasGap, GlModule.E.
* Lib/DiscreteSeries/Rigidity/HighestVectors.lean
  05e2716ad17f0ae4dc6043a359ff16f22687e7cb:
  exists_highest_vector.
* Lib/DiscreteSeries/Theta/LocalThetaCorrespondence.lean
  2a5c865a64dcbd1a9c75218fcc4d93ee4b4c6bf8:
  exists_bump_integratedRep_eq (actual hG, h0, hc, K, L consumer).
* Lib/Weil/Fock/OscillatorPair.lean 9642e4bc0993c0f25680cd11fc923414706851ca
  inner_pos, realInner_detTwist_pos; FockHarmonicCoeff.lean
  a2d4e8450b0f5daea826885ad4ec55ddbc3bf076:
  fockMatrixCoeff_eq_realInner, realInner_polyVector.

Let E_ab be T.oscRows.E a b, E'_cd the swapped row action, and
Lambda=l.lowestKType. Write L_ab=T.fockLaplacian a b. Preserve all
matched parameter and joint harmonic premises. In howe_argument replace
the quantified hc over arbitrary nu and X outside rootCone with ONLY:
  for a,b with eps_a != eps_b and l_a < l_b, and Q row K-highest
  of weight Lambda+e_a-e_b, E_ba Q belongs to G.             (HC')
Keep original h0 (Phi in G), K (images of compact lowerings), L
(images of E_aa-Lambda_a). Full column invariance hG may be stated
only on matrix units because its action is complex-linear; the proof
below needs compact invariance and opposite-sign E' units on G.
The conclusion remains G=all polynomials; not a weaker conclusion.
For the actual local caller take iota=pi(e_lambda) o polyVector and
G=iota^-1(range of alpha -> pi'(alpha^inv)iota(Phi)).
The source's integratedRep_eq_zero_of_notMem_rootCone supplies HC'
with X the single matrix unit; no arbitrary highest weight is needed
at this consumer. Keep the original source graph and other callers.

## Proof of the replacement (no norm estimates or analytic limits)
Let V_j denote all polynomials of total degree at most j and choose
the least j>=0 with V_j not contained in G. Set W=V_j orthogonal to
V_j intersection G for the Fischer form (inside V_j). This is a
nonzero finite-dimensional space. V_k subset G for every k<j,
including negative k (V_k=0). Compact E' operators preserve degree
and their adjoints are the reversed E' units. Hence they preserve W:
for Z in V_j intersection G, E'_dc Z is still there and
<Z,E'_cd P>=<E'_dc Z,P>=0. Choose a nonzero column compact highest
P in W by simultaneous diagonal weights and maximizing l' dot weight
(the native exists_highest_vector). Only compact primitivity of P
on the column side is used by the final uniqueness theorem.

Row compact highest and row weight require no separate projection
estimate. For Z in V_j, by K and L the vectors E_ba Z (l_b<l_a,
eps_a=eps_b) and (E_aa-Lambda_a)Z are in V_j intersection G.
Fischer adjointness gives
  <Z,E_ab P>=0, <Z,(E_aa-Lambda_a)P>=0.
Both target polynomials lie in V_j. Taking Z equal to each target
gives zero. Thus P is row K-highest of weight Lambda.

For opposite signs the actual oscillator definition gives the exact
adjoint cancellation
    E_ba = sigma (L_ba - L_ab^*).                            (F)
Indeed L_ab=-sum_{c:varSign(a,c)=-1} partial_ac partial_bc,
whose adjoint is the negative sum of X_ac X_bc. E_ba consists
of those positive creation terms and the complementary negative
derivative terms, all multiplied by sigma. Use the swapped sigma
for E' units. For Q=L_ab P, deg Q <=j-2 and deg L_ba Q<=j-4.
If E_ba Q belongs to G then by (F) L_ab^* Q belongs to
V_j intersection G. Therefore
                 ||Q||_F^2 = <P,L_ab^* Q>_F = 0.            (1)
For the column group E'_ba Q belongs to G by column invariance and
minimal degree. This proves all column Laplacians vanish. No hidden
closure or infinite-dimensional orthogonal projection used.

Write d=card C-card R (signed integer), xi_a=l_a-2gamma+card C.
Native polarisation_eq_of_isCompactPrimitive, together with
sign_mul_lowestKType_sub_nonneg, now implies: if xi_a>d, every
derivative of P in row a of sign -1 vanishes; if -xi_a>d,
every derivative of sign +1 vanishes. The conditions use the
actual relative weights and column harmonicity just established.
For opposite-sign a,b with l_a>l_b, the native large gap yields
xi_a-xi_b=l_a-l_b>2d (also if d<=0); so xi_a>d or -xi_b>d.
Every term in L_ab contains a sign -1 derivative in row a and
a sign +1 derivative in row b. In either case L_ab P=0.
Consequently
        Q_ab=L_ab P !=0 implies l_a<l_b.                    (2)
No equality case lost: l injective and eps_a!=eps_b.

Suppose some row Q_ab is nonzero; choose among these finitely many
pairs one maximizing h_ab=l_a-l_b. The commutator explicitly
proved in fockLaplacian_eq_zero_of_isKHighest is
 E_xz Q_ab=L_ab E_xz P + delta_(z,a) Q_xb - delta_(b,x) Q_az
 for eps_x=eps_z. The diagonal case gives weight
nu=Lambda+e_a-e_b. For a compact raising E_xz, E_xz P=0.
Each surviving index term has opposite signs, and height exactly
h_ab+(l_x-l_z)>h_ab; by maximality it is zero. Thus Q_ab itself
is row K-highest, without the general finite integer-weight
induction. By (2), the single admissible order o=-l gives
        <o,nu-Lambda> = l_b-l_a > 0.                        (3)
This is an explicit witness to nu-Lambda outside native rootCone,
which uses ALL such orders with inequality <=0. HC' gives
E_ba Q_ab in G. Equation (1) contradicts Q_ab!=0. All row
Laplacians vanish. We have exactly IsPreJointHarmonic l l' P
(nonzero, column primitive, row harmonic, row highest, column harmonic).
The given Phi satisfies the same predicates by its native joint
highest assumption. IsMatch.unique gives P=c Phi; hence P in G,
contradicting P nonzero in W. Therefore G is everything.

This eliminates the general outside-cone quantifier and the separate
integer-weight induction at this one Howe caller. It does NOT eliminate
rootCone projection at other callers, the source commutator identity,
Fischer adjointness/positivity, the native polarization lemma,
joint-harmonic uniqueness or the actual smoothing-range invariance.
To realize hG in exists_bump_integratedRep_eq, the source applies
bumpDeriv along each real Lie direction and uniqueness of derivatives
via hasDerivAt_smear; complexification and linearity supply E' units.
Do not replace that differentiation by topological closure: the
range of compactly supported smoothing is not assumed closed.
The actual h0 is supplied by exists_bump_conv_dsKernel and
integratedRep_fix (the latter has the separate RUN69 candidate).

## Nonnegative oscillator supplier
RUN75 weakened the projected positivity premise to nonnegative
real part on all positive-definite z plus x!=0. The native
realInner_detTwist_pos starts with positive definite z,f(z), harmonic
P, and A=(complexLinearPart(f(z)))^-1. Retain invertibility of the
complexLinearPart (needed in fockMatrixCoeff_eq_realInner), positive
principal minor and det(z)^gamma, and choose A=b b* with the source
matrix positivity law. By the exact fock coefficient identity and
the native linSubst_mul / fockPairing_linSubst identities the
coefficient is a positive scalar times a Fischer square norm of a
linearly substituted polynomial. Nonnegativity follows even without
showing that this substituted polynomial is nonzero. Thus the
strictness proof via congrArg and inverse substitution can be omitted
at the RUN75 consumer, with strictness recovered from the positive
value at identity. Do not omit the positive definite model hypotheses
or its inverse matrix in the coefficient formula. Keep the original
OscillatorRep.inner_pos field for any other consumers until audited.
No new global deletion or assumed native replay.

## Evidence and reproducibility
Original local graph: exists_bump_integratedRep_eq -> howe_argument
-> fockLaplacian_eq_zero_of_isKHighest -> finite integer-weight
induction; howe_argument -> fockLaplacian_eq_zero, mapsTo_perpInDegree,
polarisation_eq_of_isCompactPrimitive, sign_mul_lowestKType_sub_nonneg,
IsMatch.unique; hc -> integratedRep_eq_zero_of_notMem_rootCone.
Candidate graph at this caller: least degree W -> Fischer adjoint
cancellation (1) -> support sign (2) -> maximal height + native
commutator + single witness (3) -> HC' -> contradiction by (1)
-> IsMatch.unique. Keep full original proof/type/value/axiom graphs;
these are source-visible edges, not a completed kernel graph.
No global frontier retirement claimed. The original prime-window/
CorG obligations and compact arithmetic mR<=fa(log b)^5 remain open.

Local Python exact integer regression actually executed:
  d in [-8,8], xi_a,xi_b in [-30,30]:
  31182 strict centered-gap implications.
  All permutations of ranks 2..6, distinct a,b and x,z raising:
  12164 one-order witnesses, 118540 commutator height increases.
  Negative controls: xi_a=2,xi_b=-2,d=2 at equality (neither strict
  alternative), reversed witness l_a-l_b instead of l_b-l_a.
These are finite checks of the sign/height algebra only; not model
or asymptotic verification. Exact script:
  for d,a,b in product(range(-8,9),range(-30,31),range(-30,31)):
      if a-b>2*d: assert a>d or -b>d
  for rank in range(2,7):
      for l in permutations(range(rank)):
          for a,b in product(range(rank),repeat=2):
              if a==b: continue
              if l[a]<l[b]:
                  beta=[int(i==a)-int(i==b) for i in range(rank)]
                  assert sum(-l[i]*beta[i] for i in range(rank))==l[b]-l[a]>0
              for x,z in product(range(rank),repeat=2):
                  if l[x]<=l[z]: continue
                  h=l[a]-l[b]
                  if z==a: assert l[x]-l[b]==h+l[x]-l[z]>h
                  if x==b: assert l[a]-l[z]==h+l[x]-l[z]>h
  # imports: from itertools import product, permutations

Local command -v lean/lake/elan returned none. Prepared scalar Lean
checks below, not compiled. Native rh_scan/prune/reduce/auto/frontier
cannot be executed in this container. Existing actual CI receipt
compute/rh-compact-targeted-replay-20261126/outputs/targeted_results.json
on cathedral-research-state blob 23de197bd48f404ca2074c69676de289c4f7934e
re-read: all_requested_checks_ok=true, full_RH_replay=false. Only
listed scalar and RootsOfUnityPoints/ModuleIndex/Heights checks;
no new verification of the present proof. Keep older conditional
half-strip and prune receipts. URT not used.

RESUME HERE: audit exact smoothing range invariance in the actual
exists_bump_integratedRep_eq caller, especially right/left derivative
of alpha^inv and supports; prove it directly without a closure
assumption. Request native batch replay with axioms and role graph
of howe_argument, exists_bump_integratedRep_eq and (1)-(3) through
the existing compact runner; coordinate with integration/kernel.
HANDOFF TO integration, audit, editor, kernel extractor.
RH OPEN.
-/

namespace RHDependencyRun76

theorem centered_gap_support (a b d : ℤ) (h : 2*d < a-b) :
    d < a ∨ d < -b := by omega

theorem height_increase_left (a b x z : ℤ)
    (hz : z = a) (hx : z < x) :
    x-b = (a-b)+(x-z) ∧ a-b < x-b := by omega

theorem height_increase_right (a b x z : ℤ)
    (hx : x = b) (hz : z < x) :
    a-z = (a-b)+(x-z) ∧ a-b < a-z := by omega

theorem witness_negative_root (a b : ℤ) (h : a < b) :
    0 < (-a) - (-b) := by omega

end RHDependencyRun76

#check @IsJointHarmonic.howe_argument
#check @Fischer.fockLaplacian_eq_zero
#check @Fischer.fockLaplacian_eq_zero_of_isKHighest
#check @polarisation_eq_of_isCompactPrimitive
#check @IsMatch.unique
#check @OscillatorPair.exists_bump_integratedRep_eq
#print axioms RHDependencyRun76.centered_gap_support
#print axioms RHDependencyRun76.height_increase_left
#print axioms RHDependencyRun76.height_increase_right
#print axioms RHDependencyRun76.witness_negative_root
#print axioms IsJointHarmonic.howe_argument
#print axioms OscillatorPair.exists_bump_integratedRep_eq
