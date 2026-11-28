# RUN102 — Thick-class contraction: remove the point-selection step in the human bound
28 November 2026. PARTIAL / independent human source audit and alternative
derivation; no fresh Lean replay. Resume RUN101 0dfa25553d68d9eebf868a0079da6b7651012757.
This audits the distinct common-shift transport, not orbit freeness, packet
normalization or the local open-cell construction.

Preflight: mission blob 3adc76221a978016e3505cdf3e36ad688354d7d7,
spine 1c4608f2190154fd4bc4b38fc77db10ec5e60e64, live B2 ledger,
manuscript 619ae01be98c32e053eef1c8bcd44ccddd0664e7 (especially 830ff),
root AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, expansion, state/log/protocol
excerpts and exact allocation amendment 99cfbd1f04c3a4c6d02c21a8fde207f2121aef20
inspected. RUN102 commit search empty. Physical CI 46123777851 is not RH replay.
Reuse integration/2026-11-26_COMPACT_OPEN_CELL_CONTRACTION.md section 6,
blob edde7b6245ec51d4326f2cd50545021acbdb9ba0, and its retained scalar
and support premises. Preserve all existing derivations.

## Actual source anchors and hypotheses
Alpöge–Sernau and collaborators, lsernau/grh-lean@
72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
- New/Filling/BlockBound.lean, blob 6c68e80e3b1ea2b7983696716305493a37f2b1fd,
  enorm_amplitudeSum_le_classSize_top 304–363, specifically 331–358;
  outer consumer 368–394.
- New/RealPlace/OpenCellBound.lean, 054e3375d3ef6c96633ab3c2e44b38df52a94755,
  BesselSystem.open_cell 16–23. Local joint law, common compact support,
  probability, finite controlling measure and contraction.
- Lib/DiscreteSeries/Bruhat/BigCell.lean, da06dcfda1a1401b8ad51f94649da9b760907a87,
  IsL2Contraction 43–44, pi 49–67; integrable_toReal_smul 33–35.
- New/Filling/Setup.lean, 622e7ebe5c04b7ae87652e460762da7fb2e40727,
  boxSize 247, IsBoxPartition 252–255, besselFn and besselKernel 259–264.
- New/Filling/AmplitudeSums.lean, 832e25af346bbbbdabdbec205b0e7f833170e0a1,
  hasSum_amplitudeSum_change_of_weight 119–155.
- New/Filling/SchurTest.lean, bcb1fd28783bdeb4d0e3c7d83559d0ef99cecdea,
  IsNear.le_classSize_and_cellMass_le 72ff, inCut_of_besselKernel_ne_zero 121–123.
- New/Filling/BesselSystem.lean, 847e2869ed2c189c30f6efef85e7c1f2451058,
  InCut 33, frameBox 36, W continuous field 104.

Retain SAME admissible S, stable T, nonzero termDisc on T, classes c,c',
reduction s, selected near representative gamma in X=T intersect termsOver,
and epsilon cutoff omega for c'. Other selected/nonselected cases are
handled by RUN101; a nonselected term has zero weight for both sides.
Let g=ratToInf gamma, rho=boxSize=b^(2n²), n=varrho+1,
f=#infinite places, nu=unipCovolume>0, a=classSize_top(termDiscNorm gamma),
q=b^(-k³ f). The actual near-class supplier with product norm >=1
(by integral nonzero termDisc) gives q<=a and
  product_v cellMass_v <= (nu a/2)^2.                       (102.1)
Do not reprove these packet/scale estimates in this run.

## Exact joint transport
For the selected gamma, the RUN101 weight is omega(g^-1 z).
Use the polymorphic weight-change theorem with BOTH sides:
the CUT HasSum is the amplitude at this caller, and the FULL
instantiation supplies the difference estimate. For every gamma the
individual error is bounded by the nonnegative total error:
  D_gamma=integral omega(g^-1 z) ||K_full(gamma,z)-K_cut(gamma,z)|| dz
          <= nu q/2 = e.                                   (102.2)
Both weighted kernels are Bochner integrable; this follows from the
respective F sigma fields. omega is measurable and 0<=omega<=1, so its
toReal conversion is exact; no infinite-weight ambiguity.

For each v take the actual open_cell witnesses B_v, l_v, m_v, tau_v.
The order here is controlling measure l, probability m. The joint
kernel is W_full(g_v tau_v(x_v)y_v)_i conj(W_full(tau_v(x_v)y_v)_j).
Let B=product B_v, m=product m_v, l=product l_v, t(x)_v=tau_v(x_v).
Local m_v is probability, l_v finite, volume restricted to compact B_v
finite (Radon Haar). Thus all the sigma-finite premises of
IsL2Contraction.pi hold. Joint measurability is by measurable tau and
continuous group operations and W. Each local kernel at fixed x_v is
continuous on the compact B_v and integrable there. Tensor the actual
contractions with the arbitrary bounded measurable global test function
omega.toReal (not a product cutoff). Reindex pairs of tuples to tuples
of pairs; the finite sum of squared coordinate moduli is the squared
Euclidean norm, with no factor of the number of coordinates.

Put
  F(x)=integral_B omega(y) K_full(gamma,g t(x)y) dy.
The two factors are exactly W(g t y) and conj(W(t y)), since
g^-1(g t y)=t y. On the common conull set E, t_v belongs to
U0 sup H at EVERY v; invariance gives omega(t y)=omega(y).
Hence this F(x) equals the native shifted FULL weighted integral on B
for x in E; its definition off E is simply the measurable tensor
integral. Product measure restriction is product of the restrictions,
and the contraction gives
  integral ||F(x)||² dm <= integral |omega(y)|² dl
                         <= product_v l_v(G_v)
                         <= product_v cellMass_v
                         <= (nu a/2)^2.                    (102.3)
No independence of the two kernel arguments is asserted: they use
the SAME local x and t. The finite product is over places only.

## Support and exact error transport
Refine E by the local open_cell conull implications, retaining
the universal quantifier over y for each x. The intersection over
finitely many places is conull. For x in E let z=g t y.
If omega(t y) K_cut(gamma,z) is nonzero, both z_v and t_v y_v
satisfy InCut by SchurTest.121. The cutoff support axiom gives
t_v y_v in frameBox(rho). Since t_v fixes the frame, the inverse-frame
definition and frameVector_mul give y_v in the same frameBox.
Also besselSize(z_v)<=b^(6n+2)<=rho by the native scale guard
(b>=1 and 6n+2<=2n²). Thus open_cell's implication at this SAME
x_v gives y_v in B_v. This proves support on B for the translated
weighted CUT kernel only.

Let C=integral omega(g^-1 z) K_cut(gamma,z) dz, a fixed vector.
For every x in E, left Haar translation z=g t(x)y has no Jacobian.
By the just-proved support and invariance,
  C=integral_B omega(y) K_cut(gamma,g t(x)y) dy.
Subtract the analogous F(x) integral BEFORE taking the norm.
The restricted difference is bounded by the integral of its norm;
undo the same translation and enlarge the nonnegative restricted
integral to the whole group. Equation (102.2) yields
  ||C-F(x)|| <= D_gamma <= e, for every x in E.             (102.4)
In particular the full integrand is NOT assumed supported on B.
The total error is not paid once per place or per possible x.

## Direct contraction of the constant cut amplitude (preferred human variant)
The native proof chooses x in E with ||F(x)||² <= its mean.
That selection is legitimate: if all x in E had strictly larger
values than the finite mean M, the nonnegative excess would be
positive a.e. on a probability space, hence would have strictly
positive integral, contradicting the definition of M. More explicitly,
some {||F||²-M >= 1/j} has positive measure by countable union.
No attainment of a minimum or maximum is necessary.

There is also a shorter human proof not needing the selection lemma:
since C is constant, (102.4) gives pointwise on E
  ((||C||-e)_+)² <= ||F(x)||².
Integrate the constant against the probability m, and use (102.3):
  ((||C||-e)_+)² <= integral ||F(x)||² dm <= (nu a/2)^2.    (102.5)
Taking the nonnegative square root and q<=a gives
  ||C|| <= nu a/2 + nu q/2 <= nu a.                        (102.6)
This is the exact selected near summand bound, with the original
indicator and classSize at the actual top-level caller. Combine
with the CUT HasSum and RUN101 zero cases. This proves the human
caller step from the retained native inputs. The source uses the
selection route; (102.5) is a proposed replacement presentation,
not a claim that any global Lean dependency has been removed.

## Rejected routes and scope
- Tensor independent left and right random shifts: changes the kernel.
- Require omega to split into local factors: not a premise and unnecessary.
- Use local point choices before tensoring: does not control the global integral.
- Drop the universal support implication in favor of separate exceptional
  sets for every y: cannot interchange those quantifiers without a proof.
- Infer full support from cut support, or translate by t alone: both wrong
  (the correct coordinate is z=g t y).
- Assume Haar measure on B invariant: only the whole-group measure is;
  translated restricted error is bounded by enlargement.
- Take the square root of a possibly signed difference without positive part:
  the squared lower bound then fails when ||C||<e.
- Treat (102.1) or open_cell as newly established from tensoring: retained
  primitive suppliers are essential.
- Multiply the global cutoff error by number of random shifts or places:
  (102.4) is a uniform per-term consequence of one global error budget.

Actual verification: independently inspected the pinned declaration bodies
listed above and derived (102.2)–(102.6), including measures, coordinate
permutation, support quantifiers and boundary cases. Conventional positive
part and finite-product integration suffice; no URT premise, speed
benchmark, local Lean execution or new kernel receipt. The existing
B2 caller module receipts remain separate. This audit is not full B2 or RH.

RESUME HERE: audit the outer thin/thick stable partition in
BlockBound.enorm_amplitudeSum_le_classSize 368–394, in particular the
direction of K versus its complement and the exact conversion of the
thick top-level termDiscNorm to the common classGauge, reusing RUN100–102.
HANDOFF TO integration/audit: the direct positive-part inequality (102.5)
is a concise alternative to selecting a shift, with exactly the same
native probability and support premises. Use one preferred presentation;
the local open_cell, packet and Bessel existence inputs are not discharged.
