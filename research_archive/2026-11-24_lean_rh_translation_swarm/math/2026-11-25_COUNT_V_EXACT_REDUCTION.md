# CountV: exact root-reachable reduction and surviving quantitative leaf

25 November 2026. **PARTIAL / source-matched human proof.** This is one
compact proof block for the shared one-equation manuscript, not an RH proof and
not a replacement theorem. Upstream source is
`leanprover-community/riemann-hypothesis` at
`40e56bab026552e089d7afcfeff08d2defb9c005`.

## Result

The deep exceptional-character input `CountV` is not itself an unexplained
estimate at the pinned root. The actual theorem
`UpperTheory.V.UnitaryThreeInertia.countV_of_finiteness_duality_euler_host`
reduces it to thirteen named inputs. Source-body dependency reduction also
shows that the `CaseV` conjunct is unused: the body consumes `hP.2` (the deep
conductor inequality) and never `hP.1` (`CaseV`). Therefore the identical body,
with that single projection removed, proves the stronger predicate

\[
 \operatorname{CountVDeep}:=
 \operatorname{CountShape}\bigl(R_1(h,\ell,\psi)\le2^{c_2(\psi)}\bigr),
\]

and `CountVDeep -> CountV` is the pointwise bridge which sends
`(CaseV, deep)` to `deep`. This is mathematical premise weakening at the actual
consumer, not deletion of any finiteness, duality, rigidity, or host-number
input. The theorem's only final numerical step is the
following exact implication. Put

\[
 X=\ell Ne,\qquad E=e(\mathcal O),\qquad
 s=\sum_i v_\ell\!\left(\operatorname{tr}r_i(\phi)-
                  \operatorname{tr}r_z(\phi)\right).
\]

If `a` is the normalized Selmer length before division by `E`, and

\[
 a\le V,\qquad V\le 2Es,\qquad
 s\log\ell\le X^C,\qquad X\ge2,
\tag{CV}
\]

then

\[
 \boxed{\frac aE\log\ell\le X^{C+1}}. \tag{CV*}
\]

For `E=0`, Lean's real division convention makes the left side zero. For
`E>0`, divide the first two inequalities before taking any norm or absolute
value:

\[
 \frac aE\log\ell\le 2s\log\ell
 \le 2X^C\le X\,X^C=X^{C+1}.
\]

This proves exactly the private lemma `arith` used at the last line of the
source theorem. No fitted constant or asymptotic inference is involved.

## Exact source statement and quantifiers

`CountV` is `CountShape` restricted by

\[
 \operatorname{CaseV}(h,\ell,e)\quad\text{and}\quad
 R_1(h,\ell,\psi)\le 2^{c_2(\psi)}.
\]

Thus the theorem must choose one exponent before the host and then handle,
uniformly: every host of the fixed primitive base character, every sufficiently
large weight cutoff `t`, every algebraic closure, every odd prime `ell`, every
coefficient DVR, every `1 <= e < t`, and every `psi` in the host character set
satisfying the two deep-CaseV conditions. Its conclusion is `VLe` with bound
`(ell*N*e)^(C+1)`, including both finiteness of `Vlen` and (CV*).

The thirteen hypotheses, in their source order, are:

1. `ThmS6_s`;
2. `LemmaM` and `LemmaM'`;
3. local finiteness, local Tate duality, and the local Euler characteristic;
4. global finiteness and the global Euler characteristic;
5. normalized Poitou--Tate duality;
6. `HostVanE` and `HostXpp`;
7. `HostRigid_s`;
8. `HostNumber_s`.

The last premise contains the genuinely quantitative equation in this block:
for a CM field `K` with `IsQi K`, it supplies `C`, a single group element
`phi`, trace separation from the reference representation, and

\[
 \left(\sum_i v_\ell(\operatorname{tr}r_i(\phi)-
             \operatorname{tr}r_z(\phi))\right)\log\ell
 \le (\ell Ne)^C                                      \tag{HN}
\]

for every finite pairwise-nonisomorphic family of the specified Type-I
representations. The exponent is uniform in the host, `ell`, `N`, `e`, and the
coefficient DVR after `K` is fixed.

## Proof-body reconstruction

1. Choose the Gaussian CM field supplied by
   `gaussian_field_range_eq_ker_quartic_char`; apply `HostNumber_s` to obtain
   `C` and (HN).
2. For the arbitrary deep CaseV datum, `hostData_of_host` constructs its
   `HostData`; the deep inequality is used here, not discarded.
3. `exists_hostFrame` constructs `S,A,F`. A complex embedding of the
   algebraic closure of `Q_ell` is chosen.
4. `ThmS6_s` gives the marked point `g1` and a family theorem `hS`.
   `hostFrame_phi`, `hostFrame_ok`, and `exists_isUniv` provide the universal
   deformation and the finiteness/boundedness inputs consumed below.
5. `HostNumber_s` selects `phi`, gives nonvanishing of the trace difference,
   and gives (HN).
6. `abstract_count` applies the two commutative-algebra lemmas, local/global
   finiteness-duality-Euler inputs, Poitou--Tate, `HostVanE`, the class-one
   frame, `HostXpp`, rigidity and trace separation. It returns a finite list
   `r_i`, an integer `V`, and
   `V <= 2 E s`; it also bounds every nonzero specialization of the Selmer
   length by `V`.
7. `vlen_le` gives `a <= V`. Hence `Vlen` is finite because it is bounded by
   the finite natural `V`.
8. Primality of `ell`, positivity of `N`, and `e>=1` give `X=ell*N*e>=2`.
   Applying (CV*) finishes `VLe` with exponent `C+1`.

Every theorem-level hypothesis is used after recursively expanding this proof.
The only removed item is the nested `CaseV` conjunct just identified; the
original and reduced graphs are therefore

`13 inputs -> CountShape(CaseV AND deep) -> CountV -> VWin`

and

`13 inputs -> CountVDeep -> CountV -> VWin`,

where the middle bridge is the one-line projection above. `rh_prune`/`rh_scan`
were unavailable locally because this checkout has no Lean executable; no
native premise-removal PASS is claimed. The source-matched expansion replaces
the opaque frontier label `CountV` by its exact premises and isolates (HN) as
the quantitative leaf. Exact algebraic cancellation is performed before the
final bound, as in the source.

## Root reachability and correction to the current interpretation

The pinned route is

`Main.riemannHypothesis -> ... -> vwin_of_row ->`
`v_window_of_literal_automorphy_n -> vwin_of_hypotheses_H_E_alt ->`
`HV.Core.of_four_alt -> vwin_of_counts`.

`vwin_of_hypotheses_H_E_alt` passes
`count_v_of_printed_bound_k_reduced_unitary_lift hH hK hE.2` as the `CountV`
argument of `of_four_alt`. Therefore the current manuscript's phrase "the deep
weight-one branch still requires native CountV" is correct but incomplete:
the exact surviving burden is the producer of the thirteen inputs above,
especially the uniform trace-valuation inequality (HN). The final conversion
from those inputs to the stronger `CountVDeep`, then to `CountV`, is now
completely explained. This does **not**
prove (HN), `ThmS6_s`, rigidity, or the cohomological inputs.

## Source anchors

- `.../DenseThresholdCases/WindowBoundOfLiteratureLevel.lean`, blob
  `01c499108485b16d33791a9e46fbb1e2af865522`: root caller and exact `CountV`
  argument.
- `.../DenseThresholdCases/HVCore.lean`, blob
  `f4b900eb48df14f16eea03d08b7d9ef077f3d4a1`: `of_four_alt` and the
  `CountI/II/III/V` interface.
- `.../DenseThresholdCases/CountVOf.lean`, blob
  `c875ff7cfd31de0e8df8d3a528b956f83b20dd57`: theorem and private `arith`.
- `.../UnitaryThreeDeformations/AbstractCount.lean`, blob
  `0a54e6e89ff542a518f05e239d1cb2e190049ff6`: the finite representation and
  Selmer-length reduction.
- `.../DenseThresholdCases/HostNumberS.lean`, blob
  `05374a9d545e1b9e978adb1719c2572cf43b1453`: definition of `HostNumber_s`.
- `.../HeightAndVanishing/Counts.lean`, blob
  `0d9f87aacf2d53abe43d894c1d822f071599ee57`: `CountShape` and `CountV`.

## Checks and failed attempts

- Executed `python3 math/verify_countv_arith.py`: exact rational exhaustive
  regression of both `E=0` and `E>0` branches (not a proof substitute).
- Inspected the six pinned source bodies above through the GitHub connector.
- Checked the exact `CountVOf.lean` body: its sole use of the nested hypothesis
  is `hP.2`; `hP.1` has no value or type dependency in the body. The stronger
  replacement is prepared as a source-identical one-token change, but was not
  elaborated locally.
- Native Lean was unavailable (`command -v lean` and `command -v lake` empty),
  so no Lean PASS or axiom audit is claimed.
- Failed attempt: source code search on the repository default index returned
  incomplete empty results; exact pinned paths/blobs were retrieved instead.

**RESUME HERE:** trace and reconstruct the exact producer
`count_v_of_printed_bound_k_reduced_unitary_lift`, stopping at the first
unproved supplier of `HostNumber_s` equation (HN); do not re-expand the proven
`CountV` assembly above.

**HANDOFF TO:** integration/editor should replace the opaque CountV sentence by
the boxed reduction and one-line trust boundary; audit/Galois should verify the
`HostNumber_s` producer and transitive axioms.
