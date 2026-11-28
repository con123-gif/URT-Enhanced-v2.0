# RUN101 — Thick class orbit cutoff: a singleton fibre, not an orbit cardinal
28 November 2026. PARTIAL / independent human source audit, not native replay.
Resume RUN100 a6ccfe572f74db859eae928aead1ce2668a76ac8; do not repeat thin
normalization or the already-audited packet scalar. Preferred thick note:
integration/2026-11-26_COMPACT_OPEN_CELL_CONTRACTION.md, blob
edde7b6245ec51d4326f2cd50545021acbdb9ba0, section 6. This audit fills in
the precise representative/weight step used there.

Preflight: latest mission 3adc76221a978016e3505cdf3e36ad688354d7d7,
spine 1c4608f2190154fd4bc4b38fc77db10ec5e60e64, ledger
579ecc1cafdb28eae7d1c97565700c571dfa7484, manuscript
619ae01be98c32e053eef1c8bcd44ccddd0664e7 (weight-change and B passages),
SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, root AGENTS and
relevant state/log/protocol excerpts inspected. Exact binding amendment
99cfbd1f04c3a4c6d02c21a8fde207f2121aef20 read. RUN101 commit search
returned no entries; recent branch commits checked. Physical CI
46119328442 is not RH verification.

## 1. Actual source and premises
Alpöge–Sernau and collaborators, lsernau/grh-lean@
72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
- New/Filling/BlockBound.lean 6c68e80e3b1ea2b7983696716305493a37f2b1fd:
  enorm_amplitudeSum_le_classSize_top 304–363; orbit fibre 307–327;
  sum/support 328–330, 355–363; actual outer caller 368–394.
- New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727:
  frameProducts 105–107, termPosition 233, termsOver 237,
  classUnip 240–241, classUnip0 244, IsBoxPartition 252–255,
  kernel 263–264, IsStable 400.
- New/Filling/AmplitudeSums.lean 832e25af346bbbbdabdbec205b0e7f833170e0a1:
  hasSum_amplitudeSum_change_of_weight 119–154 (reuse manuscript
  lines 1157ff; do not assume unconditional integrability).
- New/Filling/BoxPartition.lean 53f11966247a892d94cf688e8b366e887a92f641:
  IsNearRep 371; isBoxPartition_epsilon 453ff; exists_classUnip_mul_mem_boxedPoints 558–561.
- New/Filling/CrudeBoundDefs.lean 0ba0d2532b14c414b9032466b79e10d4d60c3d18:
  HasLevel 92–93, boxedPoints 106–107, IsNear 111.
- New/Filling/NearTerms.lean bd8a969f8d1bda48ca0468c28a8a62bc78e280ce:
  frameImage_mul 187; right U0 fixes frame 189–190;
  hasLevel_last 230–231; IsNear.mul_of_mem_besselU0 268–270.
- Lib/Adelic/Witt/FrameAction.lean cd3f13d59a5f2351c2fa22267765c723bd3b6001:
  eq_one_of_mem_besselU_of_fix 174–178.
- New/Filling/SchurTest.lean bcb1fd28783bdeb4d0e3c7d83559d0ef99cecdea:
  inCut_of_besselKernel_ne_zero 121–123.

Same admissible S, StablyUnram E, CMType E and Side.cut as the
native theorem. Fix stable T with termDisc(g)!=0 for every g in T,
classes c,c', reduction s. Let X=T intersect termsOver(c,s,c'),
H=classUnip(c), H0=classUnip0(c), K=classUnip(c'), K0=classUnip0(c').
Use hats for ratToInf, a homomorphism. Let omega be the native
epsilon box partition for c'. These are the original groups and
weight, not arbitrary finite group substitutions.

## 2. The actual freeness needed
For every g in T, the native hasLevel_last gives the nonzero
full leading minor of Z=frameProducts(g); hence Z is invertible
over E. Let F be the standard full n=varrho+1 frame matrix.
The e*_1,...,e*_varrho rows of gF are the FIRST varrho rows of Z
(the last frame pairing has a different middle normalization).
Set B=gF Z^-1 J where J inserts the first varrho standard
coordinates. Its e*-row block is I_varrho, since Z Z^-1 J=J.
This is precisely the normalized B in BlockBound.322–326.

If l in H, m in K0 satisfy l g=g m, then m fixes F, so l gF=gF
and l B=B. Apply FrameAction.eq_one_of_mem_besselU_of_fix, since
H<=besselU and B has the identity e*-row block. Thus l=1 and
m=1 by group cancellation. In particular
    H intersect g K0 g^-1 = {1}.                      (101.1)
No assertion about H intersect g K g^-1; no use of arbitrary
orthogonal or compact group freeness. Nonzero termDisc is a
sufficient actual source hypothesis, not replaced by an unproved
converse involving det Z.

## 3. Collapse the mixed double-coset fibre
Let Q be the double cosets H\G/K0. Choose r(q) in each class,
preferring an element satisfying IsNearRep whenever one exists.
This is the exact effect of exists_maximalFor with a Boolean
predicate at BlockBound.308–309: either it has a witness and
the selected element is a witness, or it has none. No ordering
of numerical norms or finite number of double cosets is needed.
The canonical out in IsNearRep is instead for H0\G/K0.

Define phi(delta,y)=1_{r([delta])=delta} omega(hat(delta)^-1 y).
For gamma in X and y arbitrary, the full action in
AmplitudeSums.119–121 is (u,v):(gamma,y)->(u gamma v^-1,hat(u)y).
The argument of omega in phi at this point is exactly
    (hat(u gamma v^-1))^-1 hat(u)y = hat(v) hat(gamma)^-1 y.
Consequently by Tonelli the orbit weight is
    sum_(v in K) a(v) omega(hat(v)hat(gamma)^-1 y),    (101.2)
where
    a(v)=sum_(u in H) 1_{u gamma v^-1=r([gamma v^-1])}.
For fixed x in K put g=gamma x^-1. Stability gives g in T;
termsOver is preserved too, by the level subgroup condition.
For b in K0, gamma (b x)^-1 = g b^-1 and [g b^-1]=[g].
Choose u0 in H and v0 in K0 with r([g])=u0 g v0.
Then a(bx) counts solutions u g b^-1=u0 g v0. The unique pair
is (u,b)=(u0,v0^-1): any solution has
    (u0^-1 u)g = g(v0 b),
so (101.1) forces u=u0 and v0 b=1. Hence
    sum_(b in K0) a(bx)=1 for EVERY x in K.             (101.3)
This is the precise fibre orientation K0 x, not x K0. The
argument requires neither K0 normal nor a finite quotient.
The nonnegative tsum of a singleton is one, including infinite
groups; no division by a group order or by omega.

Apply the defining IsBoxPartition property to a, at
hat(gamma)^-1 y. Equations (101.2)–(101.3) yield
    sum_(u in H,v in K)
      phi(u gamma v^-1,hat(u)y)=1.                     (101.4)
Measurability for each fixed delta follows from that of omega
and left translation; the indicator is a constant in y.
This proves exactly the hypotheses of the actual weight-change
theorem. It supplies HasSum of the new cut integrals, individual
integrability and the same global full-minus-cut error bound.
There is no separate error cost per representative.

## 4. Non-near representatives contribute exactly zero
Suppose phi(delta,y).toReal times the CUT kernel is nonzero.
Then r([delta])=delta, omega(hat(delta)^-1 y)!=0, and both
points satisfy InCut at every place. By omega's support axiom
the second point z=hat(delta)^-1 y belongs to boxedPoints.
BoxPartition.558–561 gives u in H with hat(u)y boxed. Now
    (hat(u delta))^-1 hat(u)y = z,
so u delta is near. Take eta=out([u delta]_(H0,K0)).
It is in H0 (u delta) K0. NearTerms.268–270 shows eta is
near as well. By the defining out property eta is IsNearRep
and lies in the SAME mixed class [delta]_(H,K0).
The preferred selection property gives IsNearRep(r([delta])),
and r([delta])=delta. Therefore
    nonzero weighted cut integrand => IsNearRep(delta). (101.5)
Contraposition gives pointwise vanishing for all non-near
representatives (also for any unselected delta). No claim that
the full kernel vanishes there. The source uses nonzero
integral -> exists nonzero point, which is weaker than (101.5).

Thus if I_delta denotes the new CUT integral and X the same
set of terms, the weight-change theorem and norm triangle
inequality give
    ||A_T(c,s,c')||_e <= sum_(delta in X) ||I_delta||_e
        = sum_(delta in X, IsNearRep(delta)) ||I_delta||_e.
For the equality, the sum on the right is over ALL canonical
near representatives; unselected ones have zero integrals.
This is exactly the reduction needed before the open-cell
mass estimate at BlockBound.331ff. It does not claim that
every canonical near representative is selected or that the
selected representative is near without the support argument.
Keep original full-to-cut and local open-cell suppliers.

## 5. Failed shortcuts and verification
- Select H0\G/K0 instead of H\G/K0: does not give (101.3)
  since the left summation is over all H.
- Replace K0 x by x K0: not justified by the partition interface;
  even if normality is separately available it is unnecessary.
- Select a near element without requiring canonical out:
  insufficient for the actual IsNearRep counting predicate.
- Drop the full leading minor when claiming (101.1):
  fixed frame may not span the requisite e* rows, so the
  native freeness lemma cannot be applied.
- Use arbitrary representative and declare non-near terms zero:
  preference is essential; u delta need not equal delta.
- Sum full-kernel support instead of CUT: InCut is not available.
- Assume that a unique pair occurs over all K at once:
  singleton is per K0 x, and (101.4) needs omega.
- Multiply the error bound by the number of classes:
  the native weight-change error is already a global nonnegative sum.

Actual verification: fetched pinned source bodies and definitions above,
read RUN100 and open-cell integration note, independently derived
(101.1)–(101.5) using ordinary group cancellation, normalized frame
freeness and Tonelli. No fresh Lean execution or measured acceleration.
URT-inspired grouping removes the nested existential/counting description
from the human derivation; the mathematical content is the conventional
fibre identity. No claim of new globally removed dependencies, complete B2,
or RH. Native replay remains pending; missing primitive mathematics stays
separate from the orbit step audited here.

RESUME HERE: audit the remaining distinct common-shift tensor contraction
and full-to-cut support transport in BlockBound.335–358, using the
existing open-cell note section 6 and RUN56 packet/support work; verify
the exact shared probability witness and restricted integral at the caller
without reopening O11/O12 or (101.1)–(101.5).
HANDOFF TO integration/audit: reuse (101.1)–(101.5) at the actual mixed
double-coset cutoff; preserve the native freeness, box partition,
measurability and amplitude change-of-weight suppliers.
