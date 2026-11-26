import Lib.ClassField.GreenbergWiles.SelmerRelations

/-!
# RUN29 kernel lane: reconstruct the Kummer-duality and split-reciprocity primitive
26 Nov 2026. HUMAN SOURCE-MATCHED, pending independent audit; native probe PREPARED.
Attribution: Alpöge, Sernau, Claude and collaborators per upstream.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; AGENTS 8db0201d;
SWARM_PROTOCOL 4b77b161; HANDOFF_QUEUE bbc46df7; EXPANSION c8152d07;
manuscript 60b7d344. Peer 2c2d51df reconstructs split relations -> isotropy,
4d94ebdc corrects quantifiers and simultaneous tame multiplier, 837e9bc7
integrates mirror polarization, c885dc85 audits actual RUN28 replay.
This run expands the DEEPER input those peers explicitly retain, not another
proof of the mirror identity or a new determinant endgame.

## Source graph (explicit source roles, not elaborated kernel extraction)
Lib/ClassField/Global/Avatars.lean dd2be51ae27b881c0f436d4aa3cb1f777c96f0aa:
  index_pow_local_le, index_pow_at_places_le, QZChar.eq_zero_of_unramified_off,
  IsPlaceOver.smul_root_eq_of_local_pow -> exists_kummer_chars;
  sum_ord_smul_frob_eq_zero is the forward Artin sum.
Lib/ClassField/GreenbergWiles/SelmerBasic.lean 5d8e27cabe1e4c5c486f7acdfc939499d0b0564e:
  IsTameGeneratorFor, SplitPlaces, SplitPlaces.liftToSubgroup,
  SplitPlaces.FrobeniiDetectRoots, SplitPlaces.decompGroup_le.
Lib/ClassField/GreenbergWiles/EquivariantUnits.lean ad78d13af1fecc0fedc8ac48944e44b62300b66c:
  PlaceAboveS.bijective_orbits, dirichlet_fixedSUnits.
Lib/ClassField/GreenbergWiles/SplitPrimeReciprocity.lean fbfa4f703035c833491594169f2089c01fda3d03:
  IsTameGeneratorFor.exists_apply_eq_nsmul, SplitPlaces.apply_inertia_eq_zero,
  SplitPlaces.power_residue_reciprocity (all three outputs).
Lib/ClassField/GreenbergWiles/SelmerRelations.lean a4ec7652040bfb6e7149d286104b4d13c82bf211:
  exists_split_primes_relations -> IsPencil.length_le_of_unseen_class
  (New/Selmer/TiltingLemma.lean 62784266136a2936dd6f8d662b79fa051d28c470)
  -> tilting -> exists_anticyclotomic_twist -> fit family -> C.
No original or reduced graph deletion; all source edges, structural/type/value
and unresolved axioms retained. No import of RH conclusion.

## 1. The finite Kummer annihilator (exists_kummer_chars)
Let F be a totally complex number field containing all m-th roots of unity,
m>0. Fix primitive zeta_m. Let S be finite, containing primes dividing m and
generating Cl(F), exactly the native principal_sup_idelesUnitOff condition.
Write J for finite ideles, E for S-units, and
  H = F^* * {a : a_v in F_v^{*m} at S, a_v in O_v^* off S}.
The claimed annihilator of the characters kappa_y o Art, y in E, is H.
The character kappa_y(g) in Z/m is defined by g(root_m(y))/root_m(y)
= zeta_m^kappa_y(g). It is independent of the choice of root because the
Galois group fixes mu_m. Multiplication of roots proves additivity in y.
It is unramified outside S (unit, residue characteristic prime to m);
at S it kills local m-th powers and on principal ideles global reciprocity
gives zero (no real places). Consequently every character descends to J/H.

Here is the exact finite counting argument, before any loss:
Let D = product_{v in S} F_v^*/F_v^{*m}.
Because S generates Cl(F), any finite idele has a representative supported
at S modulo F^* and units off S. Two such representatives agree in J/H
precisely when their local quotient differs by the diagonal image of E.
Thus J/H is the quotient of D by image(E). If y in E maps to zero in D,
its Kummer character vanishes on decomposition groups at S (local m-th
power), is unramified outside S, and kills complex conjugations (none).
By Artin reciprocity and generation by S, this character is zero:
every finite idele is principal times one supported at S modulo off-S
units, both of which it kills. So root_m(y) lies in F, and is itself an
S-unit by valuations. This proves the required injection E/E^m -> D,
not merely injectivity on torsion.

Put s=|S| and r_2=[F:Q]/2. The Dirichlet S-unit theorem and mu_m subset F
give |E/E^m|=m^(s+r_2): the free rank is s+r_2-1 and the finite roots of
unity quotient contributes exactly m. Standard local multiplicative
structure gives |F_v^*/F_v^{*m}|=m^2 |m|_v^(-1) with the norm-normalized
absolute value. One factor m is valuation, and the unit factor is
|mu_m(F_v)| |m|_v^(-1); here |mu_m(F_v)|=m. The native proof needs only
the upper bound (index_pow_local_le). Since S contains primes dividing m,
the product of |m|_v^(-1) over S is m^[F:Q]. Hence
  |J/H| <= m^(2s+2r_2) / m^(s+r_2) = |E/E^m|.
Conversely the map E/E^m -> Hom(J/H,Q/Z) via the Kummer characters
is injective: if a character vanishes on J, Artin surjectivity and
Kummer imply its root is in F and again an S-unit. Finite character
duality gives |Hom(J/H,Q/Z)|=|J/H|. The two inequalities force this map
to be onto, so characters separate J/H. In particular
  (forall y in E, kappa_y(Art(a))=0) => a in H.
This reconstructs the actual converse part of exists_kummer_chars.
The trivial m=1 case gives singleton quotients. Retained standard
inputs: local Kummer/unramified roots of units, local unit-index bound,
Dirichlet S-units, Artin reciprocity and surjectivity, finite abelian
character duality. The native proof of Artin existence is NOT used
circularly: Avatars.lean proves exists_comp_artinMap AFTER this lemma.
The argument uses precisely the Artin map properties used by the
native body, not its later existence theorem as a black box.

## 2. Tame detection and the forward power-residue equation
Take the actual native SplitPlaces over K, U normal open, F=Omega^U,
mV=0 and U acting trivially on V. All inertia off level N lies in U,
and all auxiliary Frobenii lie in U. Thus decomposition groups at
auxiliary places lie in U. Lift the distinct auxiliary primes to F,
indexed by theta=(i,d) with d in G/U. Fix representatives, write
w_theta=d^-1 w_i, phi_theta=d^-1 phi_i d, gamma_theta=d^-1 gamma_i d
for the chosen closure places/actions. The lifted F-primes are distinct
(SplitPlaces.liftToSubgroup); residue extension is trivial. Let
c_d=cycCharMod(d) in (Z/m)^*. Use additive notation modulo m below.
If y is an N-unit of F, define b_i(y)=kappa_y(phi_i). It is additive.
The exact conjugation law is
  kappa_y(phi_theta)=c_d^(-1) b_i(d y).
And gamma_theta acts on an m-th root of a uniformizer by zeta_m^(c_d^-1).
The local valuation formula is therefore
  kappa_x(gamma_theta)=c_d^(-1) ord_{w_theta}(x) mod m
for x in F^*, since at a prime off m roots of units are inertia-fixed.
These are the native L and n identities. Both factors are essential.

For P=(B,z) a native trivialised cocycle, z restricted to U is an additive
homomorphism. The trivialization B implies z vanishes on U stabilizers
of places at N and infinity: B(g place)-B(place)=z(g) since rho(g)=1.
It is unramified at all off-N places other than the auxiliary ones.
On tame inertia at an auxiliary place its value is determined by the
value at gamma_i: every continuous m-torsion additive homomorphism on
inertia factors through the tame cyclic quotient modulo m, generated by
the prescribed generator (wild inertia is pro-residue-characteristic,
prime to m). Conjugation transports this vanishing to every lift.
Hence if z(gamma_i)=0 for all i, z|U is everywhere unramified and split at
N and infinity. The same principal-idele generation argument over F
as in section 1, allowing real places because z kills their conjugations,
proves z|U=0. This is the native detection output, not a claim z=0 on G.

For the forward relation fix any additive functional lambda:V->Q/Z.
Because mV=0 it has values in (1/m)Z/Z, identify this with Z/m. The
character lambda z|U is Kummer by Hilbert 90: lambda z|U=kappa_x for
some x in F^*. Since z vanishes on the chosen decomposition groups
at N, x is a local m-th power there. At real places the corresponding
character is zero. Outside N and the auxiliary primes its inertia
vanishing implies ord(x)=0 mod m (tame valuation formula). Apply
global reciprocity for kappa_y to principal x. At N the local
contribution is zero because x is an m-th power; away from N, kappa_y
is unramified and therefore its contribution is ord(x) kappa_y(phi_w).
At infinite places there is no contribution: at real places x is
locally an m-th power because its Kummer character vanishes; at complex
places automatic. Thus only the lifted auxiliary primes survive.
Cocycle conjugation on U gives
  z(gamma_theta)=rho(d)^(-1) z(gamma_i).
Use the two exact c_d factors above BEFORE taking sums:
  0=sum_theta ord(x) kappa_y(phi_theta)
   =sum_(i,d) b_i(d y) lambda(rho(d)^(-1) z(gamma_i)).
Since Q/Z functionals separate the finite-exponent additive group V
(in the native proof eq_zero_of_forall_hom_eq_zero), obtain
  sum_(i,d) b_i(d y) rho(d)^(-1) z(gamma_i)=0 in V.
No assumption that conjugate inertia generators are identically
normalized, no lost cyclotomic factor, and no assumption that V is
one-dimensional. This proves the forward relation in the actual
SplitPlaces.power_residue_reciprocity interface.

## 3. Converse construction with the same b (totally complex F)
Assume F totally complex and f(i,d) in Z/m with
  sum_(i,d) b_i(d y) f(i,d)=0 for every N-unit y of F.
Given a in V, construct an actual P, not an independent local choice of z.
In arithmetic-Frobenius convention form a finite idele supported at
w_theta with local uniformizer exponent representing c_d f(i,d).
Its Artin image is annihilated by every kappa_y by the above conjugation
law. The native proof uses local Artin representatives xi with its
inverse convention and the equality H for their valuations; changing
Artin convention reverses the common sign in character evaluation,
not the displayed exponent of the resulting principal element.
Apply section 1 to the SAME idele. Write it as principal x times an
idele which is an m-th power at N and a unit outside N. It follows that
  x is locally an m-th power at N;
  ord_{w_theta}(x)=c_d f(i,d) mod m;
  ord_w(x)=0 off N and these auxiliary primes.
In fact the valuation equality off N is exact for the chosen
representatives. Then h(u)=kappa_x(u) a on U vanishes on stabilizers
at N/infinity (F totally complex) and on inertia off N/auxiliary,
and satisfies h(d^-1 gamma_i d)=f(i,d) a. This is the actual local
output of the principal decomposition, not just existence of a character
unramified away from an unspecified larger set.

Construct a trivialization on X=PlaceAboveS N: choose one representative
per U-orbit and set B_U(u x0)=h(u). Well-defined since h kills stabilizers.
Then B_U(u x)=B_U(x)+h(u). For a representative d of each coset G/U,
write g d=d' u_{g,d} with u_{g,d} in U and d' the representative of
the resulting coset. Define
  z(g)=sum_d rho(d') h(u_{g,d}),
  B(x)=sum_d rho(d) B_U(d^-1 x).
The representatives d' permute the index set for fixed g. For g1,g2,
u_{g1 g2,d}=u_{g1,d2}u_{g2,d}, hence additivity of h and rho|U=1
give z(g1g2)=z(g1)+rho(g1)z(g2). Reindexing B(gx) by d' gives
B(gx)=rho(g)B(x)+z(g). Continuity/local constancy follows from finite
coset set, open U and continuous discrete h. Off-N nonauxiliary inertia
is conjugacy-stable and contained in U, so h and its transfers vanish.
This is the corestrict_mem / exists_mem_of_orbit_reps construction in
the native proof, with the same local conditions. On gamma_i in U:
  z(gamma_i)=sum_d rho(d) h(d^-1 gamma_i d)
            =sum_d rho(d)(f(i,d) a),
exactly the third output of SplitPlaces.power_residue_reciprocity.
The three outputs use one b, one finite auxiliary family, and one
fixed primitive root. No extra hypotheses on f or a.

## 4. Actual consumer and retained boundary
The caller SelmerRelations.fam chooses f as the three supported terms
at (i,1), (j,1), (k,g^-1), including the cyclotomic multiplier from
s.phi_j*g. The open refinement O equates the actions on m-th roots of
fixed N-units, so this f satisfies precisely the annihilator condition
of section 3. Inserting the resulting z gives the three indicator terms
in the corrected peer 4d94ebdc, including coincident indices, and then
the relation at the enlarged prime family. Section 3 above proves the
previously retained converse supplier for that construction; it does
not replace the peer's finite-index/Chebotarev and cardinal arguments.
Use the audited peer covariance, isotropy and cardinal exponent without
changing their indices. In the actual C route F is totally complex by
the no-complex-conjugation condition on U.
The deeper standard local/global class field and Hilbert 90 inputs
remain explicit source dependencies; no claim that they have been
reproved from first principles. GreenbergWilesBound.hasFewCocycles_of_central
(projective count and devissage), the uniform crystalline defects and
balanced-row construction remain unexpanded here. No new root-level
premise eliminated; three outputs and their Kummer supplier now have
human arguments subject to audit, not merely a renamed assumption.

## Verification
Retrieved actual pinned bodies of all six source files listed above, latest
mission and peer commits. Independently retrieved state status blob
77cc3483ee5f43ab83ffdaf4bd1f31cecdccef35 and targeted_results blob
23de197bd48f404ca2074c69676de289c4f7934e: RUN28 actual CI 45799225653,
912.12s, all 10 native named theorem and 4 peer scalar checks successful,
each with only the three standard Lean axioms. These are NOT the new
reciprocity suppliers. RUN29 primitive job registered by 2ba4fee7;
state path compute/rh-compact-primitives-replay-20261126/status.json
returned 404 at this read, so no new native result claimed. No competing
runner or protected workflow edits. Native local replay not performed.
Below is a prepared executable module-local exact cancellation check and
axiom probe of actual supplier names (not a proof of their human translation).
The native engines must be replayed on the compact toolchain before
claiming rh_scan/rh_prune output; old toolchain PASS does not transfer.
Original/reduced graphs and outstanding axioms unchanged.

RESUME HERE: independent audit should verify the two cyclotomic factors,
Artin sign convention, and corestriction trivialization against
SplitPrimeReciprocity.lean, then integrate sections 1–3 in manuscript C.
Kernel: obtain RUN29 state, then batch the actual named Kummer/reciprocity
probes with existing compact runner; preserve individual failure/axiom
records. Next mathematical dependency GreenbergWilesBound.hasFewCocycles_of_central
and its projective-count/devissage inputs, unless a peer has closed it.
HANDOFF TO integration, editor, formal audit, literature, Galois, kernel.
-/

namespace CompactKernelRun29

/-- Both cyclotomic factors cancel in each lifted-prime summand before
the sum is taken. The native local character and valuation laws supply
these two factors, rather than an assumption that tame generators agree. -/
theorem residue_factor_cancel {R : Type*} [CommRing R]
    (c : Rˣ) (b v : R) :
    ((↑(c⁻¹) : R) * b) * ((↑c : R) * v) = b * v := by
  calc
    _ = ((↑(c⁻¹) : R) * ↑c) * (b * v) := by ring
    _ = b * v := by simp

end CompactKernelRun29

#check exists_kummer_chars
#check QZChar.eq_zero_of_unramified_off
#check sum_ord_smul_frob_eq_zero
#check IsTameGeneratorFor.exists_apply_eq_nsmul
#check SplitPlaces.apply_inertia_eq_zero
#check SplitPlaces.power_residue_reciprocity
#check selmerZ1.exists_split_primes_relations
#print axioms CompactKernelRun29.residue_factor_cancel
#print axioms exists_kummer_chars
#print axioms SplitPlaces.power_residue_reciprocity
#print axioms selmerZ1.exists_split_primes_relations
