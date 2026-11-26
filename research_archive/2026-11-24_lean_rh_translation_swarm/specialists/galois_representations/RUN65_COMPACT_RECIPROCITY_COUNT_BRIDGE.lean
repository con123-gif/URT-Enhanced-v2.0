import New.Selmer.ReciprocityLaw

/-!
RUN65 — the actual Greenberg–Wiles count B and double-cocycle
reciprocity bridge at exists_isLaw.
26 Nov 2026. HUMAN SOURCE-MATCHED DERIVATION conditional on
explicit native primitive suppliers; independent audit pending.
Lean certificates PREPARED, NOT RUN.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10
(completion-first sprint, compact primary pin, mandatory unified
engine section also read). Read AGENTS, continuity, swarm protocol,
handoff, expansion, HUMAN_PROOF_COMPACT and RUN64. Latest peer
commits inspected: 3a912a78 (CM torsion), d24dae79c (Weil doubling),
a1532be3 (Landau), a5929b54 (C period vanishing), 6822e2d2
(A basis), 02d32ee8 (Hasse). No duplicate of their arguments.
Source pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Actual bodies read:
New/Selmer/ReciprocityLaw.lean 7b82ced3dd3ff2be7eedbfa63f92f2f743093223
Lib/ClassField/GreenbergWiles/SelmerRelations.lean a4ec7652040bfb6e7149d286104b4d13c82bf211
Lib/ClassField/GreenbergWiles/ProjectiveCount.lean 3e305e3ad3797609b9c4b4783ce7901ce828c3e9
Lib/ClassField/GreenbergWiles/SplitPrimeReciprocity.lean fbfa4f703035c833491594169f2089c01fda3d03
Lib/ClassField/GreenbergWiles/EquivariantUnits.lean ad78d13af1fecc0fedc8ac48944e44b62300b66c
Lib/ClassField/GreenbergWiles/GreenbergWilesBound.lean ddd24b83ab5ad751a37cf473fec89994838c2746
New/Selmer/TiltingLemma.lean 62784266136a2936dd6f8d662b79fa051d28c470
Lib/Cyclotomic/OddSha/OddShaBound.lean 71e1148ba135da7530abe211af57ba8a0d63f195
Lib/Cyclotomic/Kolyvagin/ComponentBound.lean 61d0f229eda03e81c8d89372f05f7444ca45b09b (367-end).

1. The count is on ell-torsion COCOCYCLES, not H^1.
Fix the actual exists_isLaw hypotheses: r>0, K=E^+,
at least four infinite places, k<=|I|, the I distinct real
primes of the split x_i, and the k specified y_i.
Identify G_E with its open index-two subgroup of G_K.
Let c0 be complex conjugation and p(g)=g for g in G_E
and p(g)=g c0 otherwise (viewed in G_E).
The multiplication formula is p(gh)=p(g)p(h) or
p(g)c0 p(h)c0, according to the coset of g.
The cyclotomic character kappa=chi_l o p is multiplicative,
since chi_l is conjugation invariant. In particular kappa(c0)=1.
Keep S the union of the places over ell and the I real primes.
Put A=Z/ell^r with the modified cyclotomic action kappa^(-e)
and W=A[ell]; |W|=ell since r>0. The local space L_v imposes
zero on all g for which (v|ell => kappa(g)=1); at v not over
ell this means zero everywhere. The source proves the
coboundary inclusion because the action is trivial on the
specified g. It proves inertia outside S acts trivially using
the stably-unramified hypothesis (the projection p of that
inertia remains inertia over E, not an arbitrary projection
of inertia in a ramified quadratic extension).
Let Y be the finite Selmer cocycle module A with the original
auxiliary split primes s, and Z=Y[ell]. W is stable. A cocycle
in Z is pointwise W-valued; inclusion of W is injective, so
its cocycle, local and infinity equations are exactly the
same equations with values in W. It embeds into the W Selmer
cocycles for the enlarged auxiliary prime set s' below.
The map is injective on actual cocycles, without quotienting
by coboundaries or claiming surjectivity after reduction.

2. The two extra places and projectivity.
Use V=G_E intersect ker(chi mod ell^r) from the original
exists_split_primes_relations construction. Its open normal
quotient separates the roots of the relevant fixed S-units;
retain that construction and its FrobeniiDetectRoots field.
Let psi=(action on W, chi mod ell), O=ker psi. V<=O, and
[G_K:O] divides (ell-1)^2 because Aut(W) has ell-1 elements
and the cyclotomic factor has ell-1 elements. This also holds
at ell=2 (both groups are trivial). Hence the index is
prime to ell. Higman projectivity follows by taking the
identity additive endomorphism divided by [G_K:O] in F_ell:
its conjugates sum to the identity. On W take z=1,n=0 in
FiniteKilledFixedInj: 1-0 is injective, and O fixes W.

The source chooses gamma in O whose kappa-image generates
kappa(O) topologically. Retain the native procyclic-image
theorem with four_dvd_cycChar_sub_one; no assertion that
the entire group O is procyclic. The second element is
c0 if c0 belongs to O, and 1 otherwise. Select two distinct
extra primes by Chebotarev avoiding q and all existing s.v,
whose Frobenii lie in the corresponding cosets modulo V.
This keeps the two Frobenii in O and preserves SplitPlaces,
including the original principal-ideles condition by
restriction along V<=O. The enlarged index is |iota|+2.

Check the root-fixing hypothesis of
card_trivialised_of_isHigmanProjective. For a root y with
ell*y in fixedSUnits(q,O) and fixed by all enlarged Frobenii,
the original root-detection field applies to y as an
ell^r-th root: ell^r*y is V-fixed and an S-unit by multiplication
by ell^(r-1). It gives V<=F=Stab(y). The extra Frobenii
are in the required cosets modulo V, so gamma and the chosen
second element belong to F. If g in O has kappa(g)=1, then
p(g) (or its inverse) lies in V. If g is outside G_E, the
identity g=p(g)c0 forces c0 in O, hence c0 in F. Thus
ker(kappa|O)<=F. F intersect O is closed and contains gamma,
so its image under kappa is all kappa(O) (equivalently use
the source procyclic-generator subgroup clause). Therefore
O<=F. This is precisely the z=1,n=0 root-fixing hypothesis,
not the stronger assertion that all roots are fixed by O.
The native projective-count theorem now gives
   |trivialised cocycles of W| <= ell^(|iota|+3).
CAUTION: the exponent is |iota|+3, NOT |iota|+2,
since the theorem adds ONE to the enlarged prime count.

3. Exact cardinal cancellation, at the actual count B.
The source card_mul_pow_le uses the map
  (z,m_v,m_infty) ->
  ((z|D_v - d m_v)_{v in S},
   ((z-d m_v)(Frob_v))_{v|q,v outside S}).
The kernel injects into trivialised cocycles: outside S
and the extra primes, inertia vanishes, so vanishing of the
Frobenius value and inertia gives vanishing on D_v; on S it
is exactly the specified local trivialisation. At infinity
the action is trivial and the Selmer cocycle vanishes on
complex conjugations. Extend the trivialisation from the
chosen orbit representatives by equivariance; its values
there determine all other values. The image is bounded by
the product of the local spaces intersected with Z^1 and
one W for each v|q outside S. Cancel that last factor against
the matching factor in the domain cardinality. This yields
  |Z| ell^(|S|+r_inf) <= ell^(|iota|+3) prod_{v in S}|J_v|.
Here J_v=L_v intersect Z^1(D_v,W). At v off ell, J_v={0},
so its cardinal is 1. At v over ell, every such local cocycle
vanishes on ker(kappa|D_v); it factors as a continuous
cocycle on the procyclic image, since its action also factors
through kappa. Its evaluation on a topological generator is
injective (use cocycle identity on integer powers including
negative powers, then continuity). Thus |J_v|<=ell.
Write a=#(v in S over ell), b=#(v in S off ell).
Injectivity of the real-prime map and splitness imply b>=|I|>=k.
With r_inf>=4, cancel ell^(a+3)>0 exactly:
  |Z| ell^(b+r_inf-3) <= ell^|iota|.
Since b+r_inf-3>=k+1,
  |Z| ell^(k+1) <= ell^|iota|.
This is the native B, with its exact three-unit cost,
not an improved estimate from an erroneous exponent.
The proof uses the stated projective count and local
procyclicity, not any class-group bound or an asymptotic RH
statement. RUN64 section 2 then supplies the primitive row.
No extra infinite-place or auxiliary-prime loss is hidden.

4. The equivariant relation extension and the local bridge.
The native exists_split_primes_relations first chooses a
finite quotient of G_K acting on the relevant roots of
fixed S-units (finite generation and open stabilizer).
It chooses one split Frobenius per quotient class in V.
For any relation (n_i) annihilating tame evaluation vectors,
define the map n(pi(g)) on V using the quotient. Its
equivariance follows from the actual fam supplier:
if the Frobenius class i equals j*(g*k*g^-1), then for each
a in A there exists a Selmer cocycle with tame evaluation
vector
  delta_i a - delta_j a - delta_k(chi(g) A(g^-1) a).
This uses the power-residue reciprocity converse, i.e. the
corresponding exponent vector annihilates all fixed S-units
and can be realized by a trivialised cocycle. Applying the
given relation gives the required additive/equivariant law.
The same fam construction with an added new prime gives a
cocycle whose evaluation equals the original value at that
new prime, offset by the corresponding original index.
Subtract the sum of these correction cocycles: it vanishes
on all the added tame generators, so by tame generation
and the trivial action on inertia it belongs to the old
Selmer module. Apply the old relation and use the explicit
evaluation vectors. This proves extension to arbitrary
new split primes outside the same finite exceptional T.
Keep power_residue_reciprocity, Kummer/Artin reciprocity,
and the root/idele construction as genuine dependencies.

To apply that law to c in evenClasses over an arbitrary
coefficient O, compose with any additive map f:O/(ell^r)->A
for which f o c is a scalar continuous cocycle (all additive
maps preserve the integer-residue cyclotomic action).
Set X(g)=f(c(p(g))). Evenness and the multiplication formula
for p show X is a continuous cocycle over K for the modified
action. Use 2X, NOT X, for the relation law:
- Off the allowed ramification set, p carries inertia to
  inertia as above; scalar c vanishes there.
- At an original split place v, the degree-one split
  Frobenius is res(x_i.frob^-1), and its decomposition
  group is generated modulo inertia by this Frobenius.
  The prescribed zero of c on x_i.frob and the unramified
  condition therefore give zero on that group.
- At v|ell and g in its decomposition group with
  kappa(g)=1, g^2 is in G_E and p(g^2) lies in the relevant
  E decomposition group, in the cyclotomic kernel. The
  local condition on c kills X(g^2); since the action on g
  is 1, X(g^2)=2X(g). Hence 2X satisfies L_v.
- At complex conjugations d, kappa(d)=1, d^2=1, so
  2X(d)=X(d^2)=0. No division by 2.
For new split primes w_j, use delta_j the K-side tame
generator and res(w_j.tameGenerator) in its inertia.
Since ell is prime to the residue characteristic and
A is killed by ell^r, tame generation gives an integer
m with X(res(tau_j))=m X(delta_j). The actual geometric
Frobenius on the K side is res(w_j.frob^-1), so the
coefficient n(pi(res(w_j.frob^-1))) is exactly z(w_j.frob).
If all other z-values vanish, the reciprocity sum for 2X
reduces to 2 z(w_j.frob) X(delta_j)=0. If 2z divides n
in A, multiply the relation by its quotient and by m:
  n f(c(tau_j))=0.
All such scalar maps kill n c(tau_j), so the exact cyclic
separation lemma eq_zero_of_mem_evenClasses implies
n c(tau_j)=0 in O/(ell^r). This works at ell=2 and for
nonunits; it neither assumes f is O-linear nor cancels 2.
The equivariant law gives the weight e+1 (cyclotomic
factor times inverse action) and oddness under c0.
The primitive unit coordinate from RUN64 supplies the
required unit-valued law on the cyclotomic kernel.

Actual consumer: exists_isLaw -> exists_isPrimeTriangle
(RUN64) -> hasTriangleCost_tateTwist (RUN63) ->
ribet_columns -> row budget (RUN60) -> C. This completes
the human supplier argument for exists_isLaw conditional on
the named projective count, Kummer/Artin, procyclicity,
Chebotarev, and stably-unramified/local-condition bridges.
No proof of these deep foundations is asserted here.
ProjectiveCount is not replaced by a citation to an
unmatched classical Greenberg–Wiles theorem. Its native
proof uses equivariant Dirichlet, surjectivity of the
intertwining map via Higman averaging and exact cardinal
multiplication; retain it on the frontier until independently
derived or exact external theorem matched. Likewise the
power-residue converse is not just abstract orthogonality:
the principal idele/Kummer lifting is essential.

Next compact source actually inspected: ComponentBound
367-end. nsmul_component_eq_zero uses a hypothetical
nonzero (4X^2)z, Frobenius detection of (2X^2)z,
Jacobi family Artin law and exact floor-difference
divisibility. The large-prime detector uses a DIFFERENT
construction, descending induction on subsets of a finite
prime set with m=v_ell(X)+1 and mod-ell reciprocity. No
deduction of the detector bound merely from the annihilator
is valid. Both remain open as independently human-derived
arguments; no false closure.

Execution: command -v lean/lake/elan found none.
Actual CI targeted_results.json reread (state branch blob
088cd2ec0e935ee1a282f10096949bcf671cc804, run 45803534769):
three TiltingLemma and three Filling.Moments checks
report propext, Classical.choice, Quot.sound; module_1_build
return 124; all_requested_checks_ok=false, full_RH_replay=false.
No new compact native rh_prune/scan/reduce/auto/frontier
execution. The two old-pin engine runs are not new-pin
evidence. Scalar lemmas below are executable candidates only.
No original or reduced global graph, axiom ledger or
verified frontier deletion changed. Context: pin, K/E,
ell,r,e, same chosen S,V,O,s,s', and scalar W. No RH theorem
imported; no URT or finite synthetic experiments.

RESUME HERE: audit the local decomposition bridge at ell,
the plus-field projection and the exact +3 exponent.
Then reconstruct ComponentBound.nsmul_component_eq_zero
and exists_detecting_points_component from the actual
Jacobi/Artin law, floor-difference and Kolyvagin recursion;
do not substitute mere annihilation for detector rank.
Retain projective count and power-residue converse as
explicit foundation leaves, and merge this result at the
RUN64 law premise. HANDOFF TO integration/editor, audit,
literature and compact native replay.
-/

namespace RHGaloisRun65

-- Scalar certificates: no native replay claimed.
theorem count_exponents (a b r : ℕ) (hr : 4 ≤ r) :
    a + b + r = (a + 3) + (b + r - 3) := by omega

theorem count_slack (b r k : ℕ) (hb : k ≤ b) (hr : 4 ≤ r) :
    k + 1 ≤ b + r - 3 := by omega

theorem reciprocity_scalar_cancel {R : Type*} [CommRing R]
    (z x q m n : R) (h : 2*z*x = 0) (hn : n = 2*z*q) :
    n*(m*x) = 0 := by
  calc
    n*(m*x) = (q*m)*(2*z*x) := by rw [hn]; ring
    _ = 0 := by rw [h, mul_zero]

#print axioms count_exponents
#print axioms count_slack
#print axioms reciprocity_scalar_cancel
#check selmerZ1.card_mul_pow_le
#check SplitPlaces.card_trivialised_of_isHigmanProjective
#check selmerZ1.exists_split_primes_relations
#check exists_isLaw
#print axioms exists_isLaw

end RHGaloisRun65
