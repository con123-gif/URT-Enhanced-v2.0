# Compact proof B: replace positive-type induction by one normalized-mass maximum
26 November 2026. Exact source-matched human argument for the native finite-group consumer; native Lean replay outstanding. External machine-checked RH/GRH proof is distinct from incomplete human reconstruction. Compact source pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Follows 5fb8da26fd75fcfe2b80b94932ab986477b6d787. No independent RH criterion.

## Native interface and retained inputs

Work in exactly the context of New/Filling/Moments.lean, sum_le_of_positive_type: G=S.GRes, finite, Theta>=0, Gram realization <u_a,u_b>=Theta(a^-1 b); A0 a finite set of chosen places over levelPrime 0; each D0(w) a fixed nonzero frame-vector condition (either ordinary or contragredient); Theta supported on their simultaneous fixers; for every Omega subset G, sum_{s in Omega} Theta(s)<=energy(amplitudeSum .univ,Omega). Set b=S.b>=1000, k=shape.k, n=shape.rho+1, r=shape.r=k+2rho+1, E=S.mainEnergy>=0, B=b^(6k)>0, delta=b^-4.

Native energy_fixingSet_le gives, for every A and its prescribed vectors D,
  energy(amplitudeSum .univ,fixingSet(A,D))
       <= (1-delta)(1+9delta) E B^(-|A|).
The actual fixingSet is the set of elements fixing all D(w), w in A, and either A is the whole set of chosen places or there exists a place with ALL leading minors of its frameGram nonzero. In particular its complement on the prescribed support, when A is not full, consists of elements having some zero leading minor at EVERY chosen place. We use this actual disjunction, not a condition invented on a selected place.

The other retained native input is card_mul_sum_det_le in New/Heights/OneDeterminant: for a nonnegative positive-type weight F of mass M on G, and given pair of n_l-column frame matrices, if the mass on each ordinary/dual nonzero-vector stabilizer is <=Y, then
  q mass{singular leading minor} <= 2M + q^(n_l+r/2)Y.
Here q=|residue field|=levelPrime 0, n_l<=n, r=k+2rho+1. This is exactly the determinant bound already used in the original induction, including both actions and their matching frame matrices. No replacement of the difficult local Bessel/sieve energy estimate is claimed.

## One finite extremal argument

Consider only the following finite family of restrictions of the ORIGINAL Theta: extend A0 to any subset A of the fixed finite chosen-place set; keep its old vectors D0 and select one ordinary/contragredient nonzero frame-vector condition D(w) at each newly included place. Define
  F_{A,D}(s)=Theta(s) product_{w in A\A0} 1_{s fixes D(w)}.
Every factor is a subgroup indicator, and is positive type: if the group acts on the orbit of the specified vector v, use the orthonormal delta vectors e_{a v}; their inner products are 1_{a^-1 b fixes v}. For the dual condition use the actual contragredient action, a group representation as in the native proof. Tensor those vectors with the original u_a to realize the product weight. All restrictions remain nonnegative and pointwise <=Theta; they inherit the bound by energy for EVERY subset Omega and all fixed-vector support conditions. This is precisely the tensor operation in the original induction, but performed only on one finite family. No compactness of an unrestricted family of positive-type functions is asserted.

Put M(A,D)=sum_s F_{A,D}(s). The finite set of values of B^|A| M(A,D) is nonempty because it includes the initial conditions. Choose a maximizer (A*,D*), set M*=M(A*,D*), F*=F_{A*,D*}. If M*=0, the initial mass is zero and the conclusion is immediate. Otherwise for any w outside A*, every permissible nonzero-vector fixer K at w satisfies
  B^(|A*|+1) sum_{s in K} F*(s) <= B^|A*| M*,
hence
  sum_{s in K} F*(s) <= M*/B.
This is the entire normalized-loss induction invariant; both ordinary and dual stabilizers are included. Note that the maximum is taken over all restrictions of the same original Theta, not separately over arbitrary weight functions and not over one vector at all places.

If A* is the full chosen-place set, the support of F* lies in fixingSet(A*,D*) and the native energy bound immediately bounds the maximum. Otherwise select ONE w outside A*. For any s in the support outside fixingSet(A*,D*), some leading minor at that w is zero, since the native existence disjunction fails. For every leading size l the two matrices in the original proof are
  A_b = frameImage(cond b splitGram 1) * inclMatrix(Fin.castLE l.is_le),
where the Gram matrix and fields are exactly those of w. Their products with nonzero vectors are in the prescribed frame or dual frame, and they are nonzero: frame columns are distinct; splitGram is invertible at the chosen level, and the prefix inclusion is injective. This is the native map_ne_zero_iff argument. Thus the extremal property supplies Y=M*/B for every stabilizer needed by card_mul_sum_det_le.

The size calculation can be written explicitly. q is between b^10 and b^11 by Filling.le_levelPrime, levelPrime_le and card_resField_eq_levelPrime. From 1000(2rho+2)<=k,
  n_l+r/2 <= rho+1+(k+2rho+1)/2
             = k/2+2rho+3/2 <= (1/2+1/1000)k.
Hence q^(n_l+r/2)<=b^(11*0.501*k)<=b^(6k)=B. Native determinant estimate now gives, for each leading minor,
  mass_F*{minor zero} <= 3 M*/q <= 3b^-10 M*.
The number of leading sizes is <=n=rho+1<=b by Filling.succ_le_b (zero-size convention, if present, contributes no singular event since its determinant is 1). Union bound at the single selected w, using nonnegativity, yields
  mass_F*(G\fixingSet(A*,D*)) <= 3b^-9 M*.
If A* full this inequality also holds with zero left side. Consequently
  (1-3b^-9) M* <= (1-b^-4)(1+9b^-4) E B^(-|A*|).
This is a direct inequality, no repeated contradiction or induction over arbitrary Gram spaces.

Finally initial normalized mass <= extremal normalized mass, so
  sum_s Theta(s) <= E B^(-|A0|) * (1-b^-4)(1+9b^-4)/(1-3b^-9).
This is at least as strong as native (1+9b^-4) because 3b^-9<=b^-4. In fact for b>=1000,
  (1-b^-4)(1+9b^-4) <= (1-3b^-9)(1+8b^-4)
since this is equivalent to 3(1+8b^-4)<=9b. Thus the stronger bound with 1+8b^-4 holds, but the important simplification is the single normalized maximum, not the small coefficient improvement.

This proves the existing sum_le_of_positive_type from the actual energy and finite determinant lemmas; the downstream centered filling argument can use the original weaker moment constant 9 unchanged. It does NOT construct the difficult orbital integral estimates or remove their premises. No executable algorithm requiring enumeration of the extremal family is proposed; the family could have exponentially many restrictions, and this is an existence proof. No claim of linear proof search or speedup.

## Source evidence and next actions

All at compact pin:
- New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444: sum_le_of_positive_type actual induction and energy_fixingSet_le.
- New/Filling/CrudeBoundDefs.lean 0ba0d2532b14c414b9032466b79e10d4d60c3d18: vectorFixer and fixingSet exact definitions.
- New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727: mainEnergy and all scale guards used above.
- Lib/General/LinearAlgebra/ExtendColumns.lean 78e4142cc81dbb52e50f39dcb2be4ab1a6c41dc5: Shape.n,k,r, frameImage, leadingMinor, frameGram.
- New/Heights/OneDeterminant.lean 329f004f845b9e2becc896419c8594e82dfef0a6: card_mul_sum_det_le actual theorem.
- New/Filling/SchurTest.lean bcb1fd28783bdeb4d0e3c7d83559d0ef99cecdea: energy already divides squared amplitude by unipCovolume^2. In earlier centered-filling note, do NOT add a further such denominator to energy; its parenthetical caveat is resolved here. The moment is mean normalized energy (sum divided by |G|).
- New/Filling/FixedLines.lean a9305a4f1db1dc1cc9861ce3abe53a8a6331fdc9: native existence of intermediate groups and factor B per fixed place, next actual mathematical target.
- New/Filling/CrudeEnergy.lean da67bf862a4c5e72ab6a81a7dfb462545cd8833f inspected as adjacent supplier.

Human proof uses exact pinned interfaces; no new Lean replay, no numerical simulation, no claim of proving the deep Bessel/adelic energy estimate, no whole-proof completion. The full source formal proof is already externally machine-checked, unlike our shorter human reconstruction. 

RESUME HERE: focus on the original energy_fixingSet_le and exists_intermediateGroup_lines, then standard local factorization/measure supplier and sieve, not another optimization of the scalar coefficient. For kernel replay, finite choice of extra vector conditions and their tensor Gram representation, maximum comparison, exact frame map membership and native determinant theorem instantiation are the relevant declarations. Retain existing fallback and merge with centered filling only on identical normalization. HANDOFF TO geometry, audit, kernel, integration, editor.
