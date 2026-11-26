# Compact C — strictness, safe-pair exponent transport and exact cup coboundary

26 November 2026. HUMAN SOURCE-MATCHED / PARTIAL; independent review and new native replay pending. Attribution: Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude. Source pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; current manuscript 2eea9dc47d0e037627e4f4c1894f0bc86426454e. This is the actual C local consumer after editor RUN58's cut walk, not a new proposed proof route.

## 1. Strictness and the two exponent transfers

Sources LongGap.lean (New/Lift/, a94786663aac435dfc1ec846046c87f00ddad141:82–106,126–150,218–269); HodgeExpansion.lean (7f8955989647bee0ddf549506d1488cf09536046, wittPairing_mem_withExponents). Keep the actual integral lattice, point projections and normalized zTauUnit, third side and local chart.

For w in kerWithExponents of the extension, exactness of the tensor of Y -> Y⊕C -> C supplies a unique y in the kernel lattice with inclusion y=w. This is not just a vector-space argument: letter projection commutes with inclusion and first projection, A_inf integrality follows by first projection, and each invariant test form on Y extends to one on the extension by exists_extend_form, with the same tested filtration bound. Evaluation of the extension on w therefore gives the required exponent for y. The coordinate retraction compatibility supplies localized Kisin membership when w is localized. These are the exact ingredients of exists_inclKer_eq_of_projTriv_eq_zero. Retain the proof of invariant extension of forms (LongGap 103–125, BdR approximation and integral basis extension), integral frame and coordinate retraction; no claim that arbitrary maps are strict.

Transport the third-side point from i.stepBack l by phi^l. Write Z(a,q)=frobExponent l 0 o₂ a q; it is antitone in q (zero at a<l). For fixed a, allowed jumps u,u' and tensor target v satisfy u+u'<=v. The actual strict hypothesis
    Z(a,-u-u'-1)+o(a,u)+o'(a,u')>0
implies, since all exponents are integers,
    1-Z(a,-v-1) <= o(a,u)+o'(a,u').
Indeed -v-1 <= -u-u'-1, so antitonicity increases Z. Use that target profile for the tensor vector, exactly as the source does. In the second pairing a third-side jump q satisfies q+v<=-1, hence
    Z(a,q)+(1-Z(a,-v-1)) >= 1.
This is the complete scalar content of the two calls to wittPairing_mem_withExponents, without demanding any equality of individual jumps. Apply the native tateLattice.tau_pow_smul_mem_ainfLattice_of_chi at exponent 1. The chart identity z=Teichmuller of the uniformizer, its membership in the Witt maximal ideal and the source wittPairing_constantAt_and_thirdPairing identity give membership in smallPart for p^κ times the original pairing with zTauUnit inserted in either factor. Projection of the same third point is p^κ at the letter, not an independent witness. The normalized difference lemma smul_sub_mem_kerWithExponents and stability under g give isSafe_smul_sub. No illicit division by tau: strictness is applied to the already normalized kernel difference. Different letters pair to zero by distinct Teichmuller eigenvalues with unit difference (isSafe_sum). Thus this exactly feeds the four tests of editor RUN58. Keep the integral tensor/exponent theorem, Tate lattice theorem and chart/extension-form suppliers explicit.

## 2. Exact four-test cancellation at ScaledCupBounds.of_isSafe

Source New/Lift/CupProductBound.lean a5dfa3dc1372433af295f751c4bd4917ed3e323c:69–end; Lib/PadicHodge/WachGamma/KisinModuleDefs.lean 344ef024f5ddaee84ab62c0753b8beafbfd602cb:89–127 (TateTwist.smallPart_spec). In the following all computations are in the native Witt tensor with values in M=W(C^flat)⊗Z/p^m(1). Let S0=smallPart m, stable under Galois. Write B for p^e3 times the native bilinear pairing of kernel coordinates. Equivariance holds for both Frobenius and Galois. Write X,Y,W for the first projections of x,x',w. The projected quotient coordinates of x,w agree, p^e1 c, and of x' are p^e2 c'. Accordingly the extension action on the first projections has additive offsets c_g=1⊗p^e1 α(c)(g), d_g=1⊗p^e2 α'(c')(g), both Frobenius-fixed; c_gh=c_g+g c_h and likewise d. Set
    a_g=gX-X+c_g, b_g=gY-Y+d_g,
    A_g=gW-W+c_g, F=φX-X, F'=φY-Y.
These are the first coordinates of the actual differences in the native tests (the Galois difference of φx' has first coordinate φ b_g). In particular b_gh=b_g+g b_h.

By the actual AS-Witt smallPart_spec, choose y with (φ-1)y=B(W,F'). This is the source's auxiliary y, not a change of x,w,x'. Its D_g at lines 100–104 simplifies by the extension action formula wittFst_smul to
    D_g=B(c_g,gY)-B(X,b_g)+g y-y.
Compute exact identities BEFORE passing to smallPart:
    (φ-1)D_g
      =B(c_g,gF')-B(F,b_g)-B(φX,gF'-F')
        +B(gW,gF')-B(W,F')
      =B(A_g,gF')-B(φX-W,φ b_g)-B(W-X,b_g).              (I)
Here φ b_g=b_g+gF'-F', using Frobenius/Galois commutation and fixed d_g. The three terms on the right are precisely tests 3,4,2, with signs immaterial in the additive submodule S0. Thus (φ-1)D_g ∈ S0. AS-Witt then gives κ(g) in the Tate module with D_g-(1⊗κ(g))∈S0, uniquely because S0 intersects constants trivially.

Compute the inhomogeneous differential δD(g,h)=gD_h-D_gh+D_g. The y terms cancel and the cocycle equations give
    δD=-B(c_g,g(hY-Y))-B(gX-X,g b_h)
       =B(c_g,g d_h)-B(a_g,g b_h).                       (II)
Test 1 kills the last term modulo S0. Galois stability transports the three κ-errors, so modulo S0 the scaled cup B(c_g,g d_h) equals 1⊗δκ(g,h). Both are constants, hence equality holds in the Tate module, not merely modulo S0. Multiply by r=p^(e-e1-e2-e3) (native he ensures nonnegative exponent), giving exactly
    p^e P.modPairing(α(c)(g), ρ'(g)α'(c')(h))
      = r(χ(g)κ(h)-κ(gh)+κ(g)).                          (III)
No extra orbit size, coefficient-field factor or loss. This is the source key at lines 105–109, before conversion to units. The two identities share one κ and one y.

Continuity is essential: use the actual near-one filter, potential-crystalline eventual p^m congruence of both cocycles, eventual smallPart membership of B(X,hY-Y) and of h y-y (smallPart_spec with Tate representation). For h sufficiently near identity in Γ', the offsets c_h,d_h vanish in the mod-p^m pairing and D_h is small. By (II) and test 1, D_gh-D_g is small for fixed g and such h, so κ(gh)=κ(g). This is local constancy, not an arbitrary choice of a discontinuous cochain. Retain the source nearOne_eq_nhds_one under the specified open embedding, the continuous global cocycle via the same eventual congruences, and restriction-corestriction for the native open subgroup of index prime to p (index_coprime). Since cohomology is p^m-torsion, vanishing after restriction implies vanishing on Γ. This finishes the explicit coboundary argument under the cited AS-Witt, topology, integral safe-pair and restriction-corestriction inputs; no claim to have proved those entire libraries. It feeds scaledCupBounds_of_cut_windows, crystalline_defect_le, sum_blockLoss_le and the actual ribet_columns C budget.

## 3. Integration cross-check and unresolved ledger

The latest peer compare (cd6be32e..newtons-cathedral, 14 changed commits when read) includes editor RUN58, cut audit, first-order Ribet coefficient, comparison scalar, and prepared A/B/C probes in dependencies, kernel_extractor, theta_lifts, positivity_geometry, on_acceleration, literature_provenance, character_boxes, prime_window, landau_criterion, galois_representations. Read each latest checkpoint. Editor already integrated cut recursion, stage charge, Gauss/ideal-zeta and Ribet coefficient; do not repeat. The separate structure/compact/RUN57_COMPARISON_SCALAR_DISCHARGE.md supplies a correction to the earlier comparison class cap: use actual logarithmic bound, not C<=b, and keep S2 at normSqAt_comparisonForm_le. The scalar guard is 2157 mf b B <= 2200 mf b B <= rB0; still conditional on native class counts, lineScale and norm inputs. Editor should link that peer directly rather than repeat its proof. Other peer certificates remain prepared, not new native checks. Remaining essential C suppliers: invariant form extension and integral frame/depth theorems, complete balanced row/RibetElement 143–223 (both auxiliary-set costs retained), comparison-form and homogeneous Gaussian jet bound. A: Schur/tableau charge and exact gauge Fourier transport. B: actual one-vector SW unfolding, Bessel band and coherent energy. No deletion from original/reduced dependency graph; context key = compact pin, chart, sides, same x,w,x', exponents, quotient and subgroup. Unresolved external assumptions are not hidden in (III).

## 4. Exact diagnostic and prepared Lean certificate

Executed JS free-bilinear symbolic expansion, collecting coefficients of ordered pairs of independent symbols (not random or simulated p-adic data). In (II) substituted ghY=gY+gb_h-gd_h; in (I) used φX=X+F, φb_g=b_g+gF'-F'. Actual output: cup_raw_monomials=4; cup_difference={}; frob_lhs_monomials=8; frob_difference={}; omitting test 4 produced a nonzero residual (9 expanded monomials before recombination). Thus both equalities checked exactly in the free bilinear setting. The human algebra above proves them without finite samples. No native check claimed. Extract this independent scalar replay as CupCancellation.lean (prepared only):
```lean
import Mathlib
namespace CompactCupCancellation
theorem cup {R : Type*} [CommRing R] (c gc gY ghY X gX b gb gd : R)
    (h : ghY = gY + gb - gd) :
    gc*ghY-gX*gb-(c+gc)*ghY+X*(b+gb)+c*gY-X*b
      = c*gd-(gX-X+c)*gb := by rw [h]; ring
theorem frob {R : Type*} [CommRing R] (c X W gW F b f gf : R) :
    c*gf-F*b-(X+F)*(gf-f)+gW*gf-W*f
      = (gW-W+c)*gf-(X+F-W)*(b+gf-f)-(W-X)*b := by ring
theorem profile (z z' o o' : ℤ) (h : 0 < z+o+o') (hm : z ≤ z') :
    1-z' ≤ o+o' := by omega
end CompactCupCancellation
#print axioms CompactCupCancellation.cup
#print axioms CompactCupCancellation.frob
#print axioms CompactCupCancellation.profile
```
Actual native caller probe for shared compact runner: import New.Lift.LongGap; #check Lift.Pairing.ScaledCupBounds.of_isSafe; #print axioms Lift.Pairing.ScaledCupBounds.of_isSafe; #check Lift.KummerChart.PairingSide.SidePairing.isSafe_of_exponents. No Main import, no URT premise. Old-pin CI runs 45577239749 and 45576756833 re-read: run jobs success. Compact primitive run 45803534769 actual result blob 088cd2ec0e935ee1a282f10096949bcf671cc804: six named native checks with standard three axioms, module_1_build timeout 124, all_requested_checks_ok=false. Not evidence for the new certificates. Old reduction tools not run on mismatched compact pin; no new native axioms asserted. No workflow or schedules changed.

RESUME HERE: audit (I) and (II) and the continuity/restriction passage at the exact CupProductBound caller; integrate the two exponent inequalities and the coboundary argument into the single HUMAN_PROOF_COMPACT.md immediately after editor RUN58's four-test walk. Expand LongGap.exists_extend_form and actual integral-frame strictness (not another scalar budget); continue RibetElement 143–223 with balanced row hypotheses. Native shared runner should compile the named local C bodies and new scalar certificate when feasible. HANDOFF TO editor, C arithmetic/literature, formal audit and shared kernel runner. Human proof incomplete; external formal certification distinct.
