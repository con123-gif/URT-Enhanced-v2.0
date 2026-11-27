# Compact C: minimal crystalline-relation transport interface

27 November 2026. **SOURCE-MATCHED HUMAN DERIVATION plus executable source
certificate; no local Lean replay.** Primary source:
`lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`,
`grh-compact/src`, Lean 4.35.0, Mathlib
`56a005855ea17e0b0958f73ec801ae140b0a1679`. Credit Levent Alpöge,
Luke Sernau, Anthropic collaborators and Claude.

This isolates the last coefficient-extension step in
`New/Selmer/TwistForRows.lean`, lines 44--59. It complements, rather than
repeats, the balanced-row budget reconstructions and RUN56's broader local
transport discussion.

## Result: the exact weakest local interface

Fix a place `v` above ell, a finite torsion-free coefficient extension
`e : O -> O'`, an old lattice representation `u`, and a character `psi'`.
For this step one does **not** need the full global `IsAuxTwist` package. It
is enough that

1. `psi'` is trivial on the decomposition group at `v`;
2. crystalline cocycles are functorial under `O`-linear maps;
3. the `O`-linear dual of `O'` separates points.

Let `f` be an old crystalline relation and `z` a crystalline cocycle for
the base-extended twisted lattice. For every `O`-linear functional
`lambda : O' -> O`, local triviality of `psi'` makes `lambda o z` a
crystalline cocycle for `u`. Therefore the old relation gives the decisive
identity

\[
 \lambda\!\left(\sum_g e(f_g)z(g)\right)
   =\sum_g f_g\lambda(z(g))=0
 \qquad\text{for every }\lambda\in\operatorname{Hom}_O(O',O).       \tag{1}
\]

Because `O'` is finite and torsion-free over the DVR `O`, it is finite
free; its dual separates points. Equation (1) therefore proves

\[
  \operatorname{mapRel}_e(f)
  \in \operatorname{relationsOn}(Z_f(e(u)\otimes\psi')).             \tag{2}
\]

This is the exact direction used in the source. Taking the union over
places gives

\[
  \operatorname{mapRel}_e(\operatorname{crysRels}(u))
  \subseteq \operatorname{crysRels}(e(u)\otimes\psi').               \tag{3}
\]

The operator `obeying` is contravariant in its relation set, hence

\[
 \operatorname{obeying}(\operatorname{crysRels}(e(u)\otimes\psi'))
 \subseteq
 \operatorname{obeying}(\operatorname{mapRel}_e(\operatorname{crysRels}(u))). \tag{4}
\]

The Selmer module appearing in `SelmerLengthLe` is consequently a
submodule of the module bounded by `exists_anticyclotomic_twist`.
`length_mono`, followed by `normLength_mono`, is exactly the final source
step. No equality or reverse inclusion of crystalline modules is required.

## What was genuinely reduced

The local relation-transport consumer uses only decomposition-group
triviality of the twist, not its anticyclotomic origin, auxiliary-prime
valuation budget, or global ramification description. Those stronger facts
remain required by other consumers and are **not** deleted from the global
proof. This is a premise weakening for this bridge only and records the
correct context-sensitive dependency key:

`(compact pin, O <= O', v|ell, old lattice u, local character restriction,
old relation f, new crystalline cocycle z)`.

The rowwise scalar `gamma`, the balanced-row budget `beta`, and the
determinant estimates play no role in (1)--(4). Their only role here is
upstream construction of the module whose already-established length bound
is transported.

## Sharp negative controls

Both remaining hypotheses are necessary for this argument.

* **Local triviality cannot be dropped.** Let `G=C2=<s>`, take the old
  one-dimensional trivial representation over `Q`, and twist by the sign
  character. The function `z(1)=0`, `z(s)=1` is a cocycle for the sign
  representation because `z(s^2)=1+(-1)1=0`. It is not a cocycle for the
  old representation, where the same relation would require
  `z(s^2)-z(s)-z(s)=-2=0`. Thus applying a dual functional does not land in
  the old crystalline/cocycle space unless the local twist is trivial.

* **Dual separation cannot be dropped.** For `O=Z` and `O'=Z/2`, every
  `Z`-linear map `O' -> Z` is zero, although `1 in O'` is nonzero. Hence
  vanishing after every dual functional does not imply the vector vanishes.
  The source prevents this failure by combining faithful scalar action,
  finite generation, and the DVR hypotheses before invoking
  `forall_dual_apply_eq_zero_iff`.

## Source and verification ledger

The companion certificate authenticates these exact blobs and the concrete
source uses:

* `New/Selmer/TwistForRows.lean`, blob
  `802242498ad4530e7f52cc4f14e0a03be2c59f4d`;
* `New/Selmer/TwistTheorem.lean`, blob
  `bdf0bed65edefd067b584695b1fac0b6acbbd754`;
* `New/Selmer/AptTupleDefs.lean`, blob
  `ba41ff0e729d5182ac236911898dfd0865165f8c`;
* `New/Selmer/DeterminantBound.lean`, blob
  `686d1d98ab6ce7bb70ff4f087d2a10cbae8b85df`;
* `Lib/General/Algebra/FittingDuality.lean`, blob
  `50c522f409cc0214163df1d26b77aede4aa8100a`;
* `Lib/ClassField/Places/SelmerDefs.lean`, blob
  `ce10f7c03f6155db4ccd49bc228eb03bc23e2347`.

It checks the exact `mapRel`, `crysCocycles.map`, local-triviality,
dual-separation, `length_mono` and `normLength_mono` calls; verifies the
contravariant relation-set direction on finite modules; and executes the
two negative controls above. This is source and algebra evidence, not Lean
elaboration. No local `lean`, `lake`, or `elan` executable is available, so
no kernel PASS, axiom audit, or native reduction-engine run is claimed. The
original and reduced global graphs remain intact, and RH is not claimed.

**RESUME HERE:** package (1)--(4) as a native lemma stating the
`mapRel(crysRels)` inclusion and replay it in the compact toolchain. Then
replace only lines 49--59 of `exists_mFoldTwist_selmerLengthLe` with that
lemma and compare its axiom/dependency output; retain the full
`IsAuxTwist` premise for its other consumers.

**HANDOFF TO:** kernel, audit, integration and editor.
