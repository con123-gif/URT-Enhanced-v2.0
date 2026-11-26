# Integration RUN11 — power-residue reciprocity from the exact Kummer quotient
26 November 2026. **Human derivation, source-matched; independent audit and native replay pending.** This expands the actual primitive left open in the editor's §6 C split-prime discussion, not another downstream mirror proof. Standard global/local class field theory, Kummer theory and Hilbert 90 are explicitly retained. No claimed RH theorem is used.

## Provenance and context
Latest ONE_EQUATION_MISSION.md blob 9f4a2272265e847b3a46422b02d4b37e976bee10; current HUMAN_PROOF_COMPACT.md blob 68331b985665914f2ec5edf78b11ca704906aecd. Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, research state, recent peer summaries and lead/editor/audit RUN60. Reviewed math/2026-11-26_COMPACT_SPLIT_RECIPROCITY_ISOTROPY.md (3775230fa19f17b2bbbb01fc9591e50d21d0a94a) and audit/2026-11-26_COMPACT_RECIPROCITY_TAME_PAIR_AUDIT.md (da786c8fbf1843aa4cf8b083ccd412e0b0432418); both explicitly leave this primitive open.

Source pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src; Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
- Lib/ClassField/GreenbergWiles/SplitPrimeReciprocity.lean fbfa4f703035c833491594169f2089c01fda3d03, SplitPlaces.power_residue_reciprocity (47–124), especially the conjugation factors n and L, and the corestriction.
- Lib/ClassField/Global/Avatars.lean dd2be51ae27b881c0f436d4aa3cb1f777c96f0aa, exists_kummer_chars, QZChar.eq_zero_of_unramified_off, sum_ord_smul_frob_eq_zero, IsPlaceOver.smul_root_eq_of_local_pow.
- Lib/ClassField/GreenbergWiles/SelmerBasic.lean 5d8e27cabe1e4c5c486f7acdfc939499d0b0564e, SplitPlaces fields, liftToSubgroup.
- Lib/ClassField/GreenbergWiles/SelmerRelations.lean a4ec7652040bfb6e7149d286104b4d13c82bf211, exists_split_primes_relations.
- New/Selmer/TiltingLemma.lean 62784266136a2936dd6f8d662b79fa051d28c470, IsPencil.length_le_of_unseen_class.
- New/Selmer/LinePointPowers.lean 654567bac00341a29102ee3b83266bda10ab22a9, card_le_torsion_of_isotropic.
Context key: compact pin; G=Gal(Omega/K), open normal U; F=Omega^U, D=G/U; m,N, I, discrete V with mV=0 and U acting trivially; fixed s and gamma; fixed primitive root zeta, same Artin orientation and coset reps. D is NOT the auxiliary indexing quotient pi in SelmerRelations.

## 1. Exact Kummer annihilator (Avatars' Xi)
Let S be the finite primes of F dividing N. The actual SplitPlaces fields give m|N, mu_m in F, and J=F^* J_unitOffS for the finite idele group J. The last equality is equivalent to Cl(O_{F,S})=0, by taking valuations outside S. Let H=F^* (J_powS(m) intersect J_unitOffS), where the first subgroup in parentheses requires local mth powers at every S-prime.

For x in F^*, choose r with r^m=x; kappa_x(g) is the exponent of zeta in g(r)/r for g in U. It is independent of the root chosen since U fixes mu_m; multiplicativity gives additivity in x. For y an S-unit, kappa_y is unramified off S: at those places the residue characteristic does not divide m, and an mth root of a unit is fixed by inertia (unramified roots of the reduced separable polynomial). Its Artin character kills H when F is totally complex: principal ideles by global reciprocity and no real factors, mth powers at S by m-torsion, units elsewhere by unramifiedness.

Conversely assume F totally complex. J/H is finite (the preceding generation equality reduces it to a quotient of the product of F_w^*/F_w^{*m} for w in S) and has exponent dividing m. It is an open quotient, so global CFT identifies its characters with continuous abelian exponent-m Galois characters unramified off S. Kummer theory (mu_m in F, Hilbert 90) represents each by a class x in F^*/F^{*m}. Unramifiedness away from S implies ord_w(x)=0 mod m there: the chosen tame generator evaluates kappa_x to ord_w(x) mod m. Since Cl(O_{F,S})=0, the outside-S divisor of x divided by m is principal there; divide x by the mth power of a generator. Its new representative y is an S-unit. Thus the characters arising from S-units are ALL the characters of J/H, and separate its points. Hence

  [for all S-units y, kappa_y(Art a)=0]  <=>  a in H.    (1)

This is precisely Xi's needed direction and also its converse. No counting estimate or restriction to prime m. The standard CFT input used is reciprocity plus existence/character correspondence for open finite-index idele quotients with principal ideles in the kernel; no new theorem about Selmer groups is assumed. For m=1 the quotient and characters are trivial. This argument uses total complexity only here and in the realization below, not for the vanishing implication of the native theorem.

### Established-theorem applicability checked at integration

The primary statements were opened in Milne, *Class Field Theory*,
version 4.03, V Theorems 5.3 and 5.5, printed p. 179, and VII Appendix A
Theorem A.3, printed p. 226:
<https://www.jmilne.org/math/CourseNotes/CFT.pdf>. For the finite-idele
quotient here, multiply H by all archimedean components to obtain an open
finite-index subgroup of the full ideles containing the diagonal F^*.
Its quotient is exactly J/H. F is totally complex, so this introduces
no real sign condition. The existence theorem and reciprocity identify
its finite characters with the required Galois characters; Kummer applies
since mu_m is contained in F and m>0. Local mth powers are open of finite
index in each characteristic-zero completion, so openness is checked,
not inferred from abstract finite index. Outside S, m is a unit and the
tame valuation formula applies. The full source definitions and the
corestriction/trivialization sign were read at integration. This checks
the stated standard-theorem replacement and its guards; independent
audit of the complete combined Selmer caller remains pending. The source
itself proves existence later from Kummer counting; the human replacement
uses this independently established published theorem, not that later
native proof as a circular input. Inverting the local Artin convention
changes every character evaluation by the same sign and leaves the
annihilator and principal decomposition unchanged.

## 2. Conjugation factors and necessity (native n and L)
Fix reps r_delta of D. The original auxiliary primes v_i split completely in F: outside N inertia lies in U and the selected Frobenius lies in U, so the whole decomposition group lies in U. The lifted family w_{i,delta} is exactly the primes over them, with chosen places r_delta^{-1} A_i, Frobenius r_delta^{-1} phi_i r_delta, and inertia generator r_delta^{-1} gamma_i r_delta. In particular all pairs index distinct primes, with the same residue norm. Set chi(delta)=cyclotomic action mod m of r_delta (well defined and a unit). Write ord for additive valuation with uniformizer +1, i.e. minus native valuation.log.

For y in the S-units define b_i(y)=kappa_y(phi_i). Directly applying r_delta to the quotient of two roots gives

  kappa_y(r_delta^{-1} phi_i r_delta)=chi(delta)^{-1} b_i(r_delta y).
  kappa_x(r_delta^{-1} gamma_i r_delta)=chi(delta)^{-1} ord_{w_{i,delta}} x (mod m). (2)

The second equality follows by removing the uniformizer power: the remaining unit has an inertia-fixed mth root. The generator gamma_i is normalized by zeta before conjugation, hence the inverse cyclotomic factor. Negative valuations are allowed.

Let P=(trivialization,c) be any native trivialised cocycle, with c vanishing on I. Its restriction h to U is additive. At any place above N and any infinite place, h vanishes on the U-stabilizer because U acts trivially on V and the trivialization has coboundary law on that stabilizer. Away from N and the auxiliary primes h vanishes on inertia by I. If all c(gamma_i)=0, conjugation covariance h(r^{-1} gamma_i r)=rho(r)^{-1}c(gamma_i) and the cyclic exponent-m tame quotient imply vanishing on the remaining inertia groups. Global reciprocity and F^* J_unitOffS=J then give h=0: each scalar character of h is zero on all local factors and principal ideles; real factors also vanish by the stabilizer condition. Scalar characters to Z/m separate m-torsion abelian groups (embed into the Q/Z dual); thus c|U=0.

For the residue sum choose any additive lambda:V->Z/m. It gives a Kummer character lambda h=kappa_x by Hilbert 90. At S and at the archimedean places x is locally an mth power (trivial decomposition character); outside S and the auxiliary primes its valuation is divisible by m (trivial inertia character). For an S-unit y apply global reciprocity to kappa_y at the principal idele x. At S its value is zero by mth-power local x; at real places the local factor is also zero, even if kappa_y itself does not kill complex conjugation (for even m x is positive, for odd m the character kills the order-two group). Elsewhere kappa_y is unramified, so only the lifted auxiliary primes can contribute. Therefore
  0=sum_{i,delta} ord_w(x) kappa_y(r_delta^{-1} phi_i r_delta)
   =sum_{i,delta} lambda(rho(r_delta)^{-1} c(gamma_i)) b_i(r_delta y).
Here (2) cancels both cyclotomic factors EXACTLY; no division by m or use of an inverse of a nonunit. Since lambda is arbitrary,

  sum_{i,delta} b_i(r_delta y) rho(r_delta)^{-1} c(gamma_i)=0 in V. (3)

This is the native required necessity, including the case of a non-totally-complex F. It uses cocycle restriction and trivialization, not an unjustified assertion that a general global cocycle is additive.

## 3. Sufficiency: one compatible array produces a single global cocycle
Assume F totally complex and let f_{i,delta} in Z/m satisfy
  sum_{i,delta} b_i(r_delta y) f_{i,delta}=0 for every S-unit y.
At each w=w_{i,delta} choose a uniformizer (or the native local Artin representative xi with ord=1). Form the finite idele a with these components to integral powers lifting chi(delta) f_{i,delta}, and with component 1 elsewhere. Since kappa_y is unramified here, (2) gives kappa_y(Art a)=0 for every y. Equation (1) gives a=principal(x)*j with j in J_powS(m) intersect J_unitOffS. Thus x is locally an mth power at every S-prime, has ord_w(x)=chi(delta) f_{i,delta} mod m at the auxiliary primes, and ord=0 at all other primes outside S. For a fixed arbitrary v0 in V, define h:U->V by h(u)=kappa_x(u)v0. It is continuous and additive, vanishes on all U-stabilizers at S and infinity and on I (use the local-power and unit criteria); by (2),
  h(r_delta^{-1} gamma_i r_delta)=f_{i,delta} v0.

Here is explicit corestriction, including the trivialization witness (the native corestrict_mem and exists_mem_of_orbit_reps steps). Choose the same reps r_delta and write g r_delta=r_{bar(g)delta} u(g,delta) with u(g,delta) in U. Put
  c(g)=sum_delta rho(r_{bar(g)delta}) h(u(g,delta)).
The identity u(gk,delta)=u(g,bar(k)delta) u(k,delta) and a permutation of the finite index D give c(gk)=c(g)+rho(g)c(k), since rho(U)=1. For g in U this becomes sum_delta rho(r_delta)h(r_delta^{-1} g r_delta). It vanishes on I because I is conjugation-stable and contained in U. Continuity follows from finite locally constant cosets and continuity of h.

On the G-set X of places above N and infinity, choose a representative x0 of each U-orbit and put T_U(u x0)=-h(u). This is well-defined because h vanishes on the stabilizer, and T_U(u x)=T_U(x)-h(u). Set
  T_G(x)=sum_delta rho(r_delta) T_U(r_delta^{-1}x).
Reindex by bar(g)delta using the SAME coset identity, obtaining T_G(gx)=rho(g)T_G(x)-c(g). Hence (T_G,c) satisfies precisely the trivialised-cocycle coboundary equation rho(g)T_G(x)=T_G(gx)+c(g). This proves existence with the native orientation, rather than asserting that h extends to G. In particular
  c(gamma_i)=sum_delta rho(r_delta)( f_{i,delta} v0 ).    (4)

Equation (4) is the exact output for every compatible f and v0, with b fixed before both. No separate cocycle is chosen per i. The integer lifts of exponents and choices of local units do not change the asserted mod-m values.

## 4. Integration and remaining premises
Insert sections 1–3 immediately before the existing manuscript's "fixed relation indices and simultaneous tame multiplier" paragraph. The output is all three clauses of SplitPlaces.power_residue_reciprocity: definition of b, detection/necessity (3), and simultaneous realization (4). Use (4) in SelmerRelations' three-term correction and retain the already-audited fixed pi, root-detection and new-prime avoidance clauses. Then its two-place consequence supplies mirror isotropy, with the previously audited common tame multiplier and sign. No extra dimension or valuation loss.

Reduced human frontier for this primitive: standard local and global CFT (including open finite-index existence), Hilbert 90/Kummer, local tame/unramified criterion, and the actual SplitPlaces generation, fixed-field and m|N guards. The source's Kummer counting implementation is not additionally required when using the stated standard CFT existence theorem. This is premise replacement at the human level, not pruning of an elaborated term. Preserve original/reduced graphs and axiom ledger. HasFewCocycles (ProjectiveCount), actual balanced local lengths, simultaneous fit twists, comparison-form and determinant obligations, A and B all remain separate. Root inequality m*remainder <= f*a*(log b)^5 NOT discharged. No URT.

Rejected shortcuts: using only global reciprocity to infer the reverse annihilator inclusion (requires existence or native Xi counting); treating every h:U->V as extendible without corestriction; ignoring cyclotomic normalization at conjugate places; dropping total complexity in sufficiency; identifying D with pi's index. None used.

## 5. Verification and replay
Executed: fetched the pinned source bodies and peer corrections; independently inspected actual old native state receipts:
- compute/rh-recursive-reduction-strip-root-20261125/status.json b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc: pass, returncode 0, conditional strip root; axioms propext, Classical.choice, Quot.sound.
- compute/rh-proof-term-prune-native-20261125/status.json 7da354941e402b6f8b364ed03d8c5c82d27b7717: pass, returncode 0; root scan bounded at 2000, 324 pending. Neither proves this new human derivation. Local command -v lean/lake/elan returned no paths. Native engines on old pin cannot substitute for compact verification; no fresh kernel PASS, no new axiom claim. No redundant finite diagnostics.

Prepared executable declaration/axiom probe for the shared compact runner (not a formalization of this human alternative):
~~~lean
import Lib.ClassField.GreenbergWiles.SplitPrimeReciprocity
import Lib.ClassField.GreenbergWiles.SelmerRelations
#check exists_kummer_chars
#check SplitPlaces.power_residue_reciprocity
#check selmerZ1.exists_split_primes_relations
#print axioms exists_kummer_chars
#print axioms SplitPlaces.power_residue_reciprocity
#print axioms selmerZ1.exists_split_primes_relations
~~~
Run in pinned compact root with lake env lean <extracted-file>; inspect actual output, do not infer verification from previous jobs. No Main or RH theorem import.

RESUME HERE: editor incorporate (1)–(4) at actual split-relation caller after independent audit of CFT hypotheses and the transfer/trivialization sign. Then follow ProjectiveCount's HasFewCocycles dependency and remaining actual balanced-local-length inputs, without redoing mirror polarization or sharp Fitting polynomial. Retain new lead Hodge frame and the H=2a correction; audit independently. HANDOFF TO editor, math C, Galois, formal audit and kernel extractor. This note is insertion-ready and leaves the canonical manuscript untouched to avoid concurrent overwrite.
