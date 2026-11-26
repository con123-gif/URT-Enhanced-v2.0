# Actual high-prime supplier: symmetric primal-dual depth 2u
26 November 2026. Human source-matched conditional derivation, native replay pending. RH OPEN. Continuation of 5b32b94bb523464b8e2e69ad6e16a7957ed6f98d. Current mission fb152e2897b4c1c320c43b9f42ae0ec088a7da45. No new independent RH criterion.

## Actual adm8 source chain and status

GrowthBounds/Joints.lean type_one_hypothesis_of_segments obtains kappa witness from flipOneThree.Conclusion2, transports the two weight boxes by meanLoc_eq, and uses KapIDef.le to prove the native mean. type_one_hypothesis_of_bounds supplies the orbit segments from TopChoiceBounds.orbit_segments. PlaneCountTheoremWithConstants.family_first_bound_of_theorem calls it on the actual family and preserves uniform constants. first_theorem_with_constants uses Loc8All.p13B applied to first_theorem_admitted_closed. ColumnSpanDensity/TheoremIOfLatticeFunctorComparison.theorem_I_of_explicit_minor_map supplies the actual SecondPartClosed interface from TiePsi and RestCloudMaps, via model identification and lattice functor comparison. The actual block splitting theorem is ALREADY present in native ColumnSpanDensity/BlockSplit.lean (KP.blockSplit, Smith normal form and Nakayama). Do not rediscover or report it as an unproved new supplier. Its wrapper blockSplit' is used by theorem_I_of_finer_open_statements. All those are source bodies, not proof that the entire native upstream dependency chain is authenticated.

## New local depth improvement

Read actual LatticeMapsOfFunctorComparison.lean theorem lattice_maps_of_functor_comparison, in particular its inner tst proof. Fix the same R, e, t,c, j, all original guards, and write
  u=|TT| ceil((m+2) lgA(p,a,m)),
  d_j=AHH(TT,ex A,ex B)-Ar(1,lamj j)>=0,
  omega=R.w in the fraction field, p=omega^2, omega!=0.
Native LatticeFunctorComparison supplies both lattice transports with depth u:
  p^u pr_j(L_H) subset L_j,
  p^u io_j(L_j) subset L_H,
and sum_j io_j pr_j=I. Here L_H and L_j are exactly the native toVHH and toV lattices for the same input family M; do not substitute model lattices.

The primal transport in the current proof scales pr_j by omega^d_j and adds p^u. For the dual transport the source inner tst unnecessarily introduces p^(2u) times Phi0 composed with io_j. The sole integrality step obtains b in O with
  Phi0(p^u io_j y)=b
for y in L_j and Phi0 in the dual of L_H (using hL.2). By linearity this is ALREADY
  (p^u Phi0 composed with io_j)(y)=b.
Thus p^u Phi0 composed with io_j belongs to the SAME native dual lattice, not merely a scaled replacement. No extra factor p^u is needed. More explicitly, for Phi=omega^E Phi0,
  p^(u+d_j) [Phi composed with (omega^(-d_j) io_j)]
      = omega^(E+d_j) [p^u Phi0 composed with io_j].
This follows exactly from p=omega^2 and integer powers of nonzero omega. Replace 2*u with u in tst's power and witness, and replace the chosen integral scalar p^u*b with b. The rest of tst uses the same identity with exponent u. All other uses of tst in the actual proof (target lattice, edge lattice, every competing edge intersection) are unchanged after this substitution: the scale exponents E+d_j, hAr, d_j>=0 and scale_add_le are identical. In particular no edge or c-depth constraint has been deleted. The primal transport and the sum_j rescaled io_j pr_j=I remain as before.

Define a strengthened local RhoSumLatticeMaps candidate by replacing only 2*u in its dual exponent with u. Propagate to rho_sum_bound_of_maps_splitting: replace the ys scale p^(2u+d_j) with p^(u+d_j), the pairing identity hkey exponent 3u with 2u, and the matrix sum
   sum_j Aj = p^(2u) z I
instead of p^(3u) z I. The same actual native BlockSplit applies unchanged, because p^(2u) z !=0. All resulting integer ranks nu_j and their lower total-rank requirement are preserved as existential conclusions; no claim they equal the old witnesses. vLEO_pow_mul now charges 2u. Thus the exact stronger RhoSumLowerBoundEdge candidate uses D+2u in place of the published D+4u (the existing proof internally charges D+3u and relaxes to D+4u). For u>0 this is a one-third reduction in the actual added depth and one-half in the stated allowance. For u=0 no change. It does not automatically improve the final rank estimate, since downstream callers may retain D+4u. A strengthened result also implies the old one via depth monotonicity of FactorsLE; retain original consumer until replay. No change to actual depth guards, choice of host, rank normalization, or field.

## Sources and handoff

Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005; all files fetched in this session:
- GrowthBounds/Joints.lean e5cd21468e7a936e89169c028c431d936499c771: type_one_hypothesis_of_segments, type_one_hypothesis_of_bounds.
- GrowthBounds/PlaneCountTheoremWithConstants.lean 8b788f1a1865ddd80a69beb427e319352260150d: family_first_bound_of_theorem, first_theorem_with_constants, Loc8All.
- GrowthBounds/DefsInst.lean 17ab05a631ed05f8e6b8a1c6a395caab6e34ad69: KapIDef.le, mem_Icc.
- GrowthBounds/ColumnSpanDensity/TheoremIOfLatticeFunctorComparison.lean 6b4b0385f4c878b3e70890990b246049a90c5a60: theorem_I_of_explicit_minor_map, second_estimate_of_restrictions, blockSplit'.
- GrowthBounds/ColumnSpanDensity/BlockSplit.lean 5d9da1af5c78671ac902f815a50d2dcfaa1d7fc4: native proved BlockSplit supplier, no new proof needed.
- GrowthBounds/ColumnSpanDensity/LatticeMapsOfFunctorComparison.lean 128cae5070f20fa52cdca0fd7b52c5b474f414ff: exact hL.2, tst, three actual dual consumers.
- GrowthBounds/ColumnSpanDensity/RhoSumBoundOfMapsSplitting.lean 051a7c32c24c0efe970b805ec0ebb21c64fb1864: RhoSumLatticeMaps, hkey, Aj, hsumA, vLEO_pow_mul.
- GrowthBounds/ColumnSpanDensity/RhoLowerBoundLargeConductor.lean 3efd1244957f82fdd38dafb567441cf4af74745d: RhoSumLowerBoundEdge, FacL, published 4u allowance.
- GrowthBounds/ColumnSpanDensity/CloudPropOfMapsRetractionBasis.lean 2210fae5f478cb7abb7e8d3a1c458173c4d8d85e: RestCloudMaps, independent cloud supplier not eliminated.

Prior peer RUN48 a5dbcd4c762c2eeb3fabc576cd1e1739717451d3 explicitly suggested using Smith invariants for the remaining normalized rank deficit. Source inspection shows the actual block-splitting step already uses those invariants, so the new improvement is the earlier dual transport, not duplicating that theorem. Native Lean not executed, no new CI result and no empirical speedup or unconditional root retirement. This is an exact human derivation under the original lattice comparison premise; no claim of a uniform high-prime bound from scratch.

RESUME HERE: kernel/Landau lanes prepare and replay overlay for lattice_maps_of_functor_comparison and rho_sum_bound_of_maps_splitting using strengthened interfaces (2u), preserve originals. Then inspect keyIneq_of and native fixed-weight depth thresholds for a genuinely useful improvement; if it gives none, keep the original interface. Dependency/theta/geometry lanes trace actual TiePsi and RestCloudMaps suppliers upstream; do not spend time reproving native KP.blockSplit. Prove or authenticate the outstanding joint local lattice construction. HANDOFF TO integration, Landau, audit, kernel, geometry. RH OPEN.
