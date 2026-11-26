import New.Selmer.TiltingLemma

/-!
# RUN30 — native C/B primitive replay and independent central-element audit
26 November 2026. HUMAN SOURCE-MATCHED audit + actual partial native replay.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Claude and collaborators. No RH root imported.
Mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb, manuscript
75252eaa39ca90a6bcab5bb1a085f7f35577def5, unified witness 7ad9c7c6.
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES and AGENTS.
Peer dc4a4eec5070014c8641dd739563e0af9a261dec already reconstructed
the central count and Cartan devissage; this is its independent audit,
not a competing proof. RUN29 c0a35b56 is the preceding Kummer derivation.
Latest peers bb09b6c2 (bounded graph frontier), 0807db85 (editor),
d064b084 (balanced row correction) retain their own unresolved suppliers.

## 1. Actual native verification evidence (not a replay of human proofs)
State branch cathedral-research-state, directory
compute/rh-compact-primitives-replay-20261126.
status.json blob a56e2d3afb99ed8275e81fd63c8494306e57c43f,
outputs/targeted_results.json blob 088cd2ec0e935ee1a282f10096949bcf671cc804.
Run 45803534769; task status error, wall 5147.99 s. The outer GitHub jobs
pick/run/record report success but that does NOT imply the compute task
passed: its own state says all_requested_checks_ok=false.
Native checks independently inspected, not inferred from wrapper status:
* New.Selmer.TiltingLemma build 1051.08 s, probe 4.62 s, returncode 0:
  IsPencil.length_le_of_unseen_class, tilting, IsPencil.length_le_of_drop_ties.
* New.Filling.Moments build 1291.02 s, probe 4.88 s, returncode 0:
  Filling.energy_fixingSet_le, Filling.sum_le_of_positive_type,
  Filling.Fits.exists_translate_finrank_comap_le.
For each of these six named declarations the recorded #print axioms list
is exactly propext, Classical.choice, Quot.sound.
* New.Columns.JetExponentBound build returncode 124, 2700.11 s, no probe.
  module_1_build.log blob c52e8f60211ead133d2f19f4c8ea6093cba513b0
  ends at build counter 9367/9376, last successful SiegelSets, then
  TIMEOUT. This is a bounded execution timeout, not a mathematical
  counterexample, missing theorem or detected kernel rejection. Nine
  remaining counter slots are NOT nine mathematical obligations.
No fresh local Lean/lake executable found. Do not label this RUN29 PASS
overall. Do not infer explicit dependency coverage from #print axioms.
Old rh_scan/rh_prune engine passes do not transfer to the compact pin.
No new CI job launched in competition with the shared runner.

## 2. Central-element proof audit: transport one sign consistently
Source Lib/ClassField/GaloisCohomology/DiscreteUnits.lean
8f36777d8514e71b861507c96eee9d56f6d8fa61, actual definition:
  rho(g) f(x) = f(g x) + c(g).
The doc comment and prior human notes use other conventions. To combine
RUN29 with peer dc4a4eec use B=-f, retaining exactly the SAME c. Then
  B(g x)=rho(g)B(x)+c(g).
This is an additive bijection on the complete pairs, commuting with
coefficient maps and leaving all inertia evaluations unchanged.
Do NOT reverse c alone in the residue relation. Native d0(v)(g)
=rho(g)v-v uses the native f convention: constant f=v gives c=d0(v).
In human B convention constant B=v gives c=d0(-v).
In particular for the converse in RUN29 the native U-trivialisation is
f_U(u x0)=-h(u), not h(u). The displayed human B_U=+h(u) is correct after
this transport. Continuity is required on c, not a new condition on f.

Source Lib/ClassField/GreenbergWiles/ProjectiveCount.lean
3e305e3ad3797609b9c4b4783ce7901ce828c3e9, r and p in
SplitPlaces.card_trivialised_of_isHigmanProjective.
For an element of ker r, c|U=0 by native tame detection. Since U acts
trivially, f descends to Z=X/U. The native H identity is precisely the
above sign convention. Let Q=G/U, T_g=rho(g), and let tau be the Higman
operator, sum_g T_g tau T_g^-1=id. Put
  a=sum_g T_g tau(T_g^-1 f(g x0)).
For k in Q, substitute j=kg in T_k a. The argument of tau becomes
  T_j^-1 T_k f(k^-1 j x0)
  =T_j^-1(f(j x0)+c(k)).
Consequently T_k a=a+c(k) by the trace identity. Thus c=d0(a),
not a coboundary with an untracked sign. This gives p:ker r->im d0.
p is onto because the constant native f=v and d0(v) have zero inertia
values at the split primes (their decomposition groups are in U).
ker p consists exactly of equivariant functions on Z. Combine the
native regulator-character equality and the surjectivity of j:
  |T(V)| |V^Q| = |Hom_Q(D0,V)| |V| |im r|
  |ker j| |Hom_Q(D,V)| = |V|^d |V^Q|.
Cancel the same positive |V^Q| and |Hom_Q(D,V)| BEFORE bounding.
Since im r subset ker j and Hom_Q(D0,V) injects into Hom_Q(D,V),
the native |T(V)|<=|V|^(d+1) follows. Equality requires BOTH
im r=ker j (converse reciprocity) and the torsion-annihilation map
when cyc_l(z)=n, plus totally complex base. Do not apply equality
on arbitrary real bases or when these two guards are absent.

## 3. Central root detection and exact descent: independent audit
Source Lib/ClassField/GreenbergWiles/GreenbergWilesBound.lean
ddd24b83ab5ad751a37cf473fec89994838c2746 and SelmerBasic.lean
5d8e27cabe1e4c5c486f7acdfc939499d0b0564e.
For original split family at l^r with r>0, take P/U a Sylow l-subgroup
and B the normalizer of P. Then [G:B] prime to l, [B:P] prime to l,
P normal in B, central-mod-U z belongs to B. The lifted primes for
either U or P are indexed by iota x G/B, with the coset 1 represented
by 1. This last condition is essential for root detection. If l*y is
a fixed N-unit for the chosen larger subgroup and every lifted Frob
fixes y, then l^r*y is a U-fixed N-unit and every ORIGINAL Frob fixes
y. Hence y is U-fixed by FrobeniiDetectRoots. For g in the larger
subgroup (acting trivially on l*y), (g-1)y is l-torsion. As z fixes
mu_l and [z,g] is in U, (g-1)(z-1)y=(z-1)(g-1)y=0. In this
commutation identity U normal also fixes z*y. Valuations of y are
zero off N because l*y is an N-unit. Thus (z-1)y meets the native
root guard. This verifies the transfer without imposing root detection
for arbitrary independently chosen prime families. P fixes mu_l
because P/U is an l-group and mu_l automorphism group has order l-1.

The important correction at the B-to-G exactness step is to write the
constant correction in native signs. For target (f,c) on G and a
representative d of G/B,
  rho(d) f(d^-1 x)=f(x)+c(d).
Thus the corestricted trivialisation of its restriction is
  f_cor(x)=[G:B] f(x)+s,   s=sum_d c(d).
Given an equivariant coefficient surjection pi:A->C, lift the
restricted pair to B using equality in the projective count and
short-exact cardinal bound. Corestrict the lift to G. Choose an
a in A with pi(a)=s and subtract the constant native trivialisation
a with its coboundary d0(a). Then multiply by the inverse of
[G:B] modulo l. The resulting f maps exactly to the target f.
The c component is forced by c(g)=rho(g)f(x)-f(gx) for a fixed
x in nonempty X. Therefore the map of full native pairs is onto,
not just the map of cohomology classes or of one component.
Conjugacy-stable inertia conditions are exactly those required by
corestrict_mem and preserved by the constant correction (I subset U).
For human B=-f the correction is plus s; these are the same proof
under the sign map. This establishes the multiplicativity step
used in the peer's Cartan proof with the original common witness.

## 4. Affine hyperplane filtration audit and caller
Source Lib/Adelic/Cartan/ProjectiveModules.lean
284b9007cf1c69d6bfd81a4896aa55ca42684ea6, actual declarations
devissage_induction, exists_permModule_isHigmanProjective,
IsMultiplicative.eq_one_of_isHigmanProjective, eq_one_of_prod_quotient.
Use S=<z^(l^j)> in Q where ord(z)=l^j n, l not dividing n; S is
central and has order n. On functions on any Delta=Q/S-set, a z-fixed
function is fixed by z^(l^j), which acts trivially on the argument.
Its coefficient difference from identity is (rho(z)-1)^(l^j)
in characteristic l, invertible. This proves the retained central
injectivity guard for all permutation modules, not merely free ones.
The trace-one function divided by n proves Higman when its Delta
trace is 1. For the two affine hyperplanes X_e=sum^-1(e),
transport by any basepoint of X_1 to X_0; the difference of the two
actions is a translation. Their common affine extension has kernel
the additive group X_0, killed by l. Filter the common finite module
by nonzero translation-fixed submodules, then repeat on quotients.
A nonzero module over F_l with l-group action has nonzero fixed
space by orbit count. Normality makes the filtration invariant.
On each successive piece the two restricted actions coincide:
their lifts differ by an element of the kernel acting trivially.
Each restricted module is admissible because it is a subquotient
of an admissible permutation module; z-1 invertible passes to
submodule/quotient by finiteness, not because z is trivial there.
The multiplicative ratio agrees on the two hyperplanes. X_1 has
trace-one evaluation at the identity and X_0 has fixed point zero.
Orbit decomposition of X_0 x Delta/K includes an orbit with stabilizer
K and all other stabilizers are conjugate into K. Induction on subgroup
order gives a positive power of the ratio for Delta/K equal to 1.
Positive rationality forces ratio=1. This checks the peer's Cartan
step with the actual hypotheses. For l^r coefficients, the last
devissage is the upper bound via short exact sequences, not an
assertion of multiplicativity on arbitrary higher torsion.

Actual C consumer New/Selmer/TiltingLemma.lean
62784266136a2936dd6f8d662b79fa051d28c470:
IsPencil.length_le_of_unseen_class explicitly calls
sigma.hasFewCocycles_of_central with the same U and split-family d
from exists_split_primes_relations, coefficient V=(O/a)^n. The
balanced scalar s-1 is a unit; cycChar(z)=1 comes from the specified
inertia place off l; central-mod-U commutators are explicitly passed.
All these guards remain essential. Thus the central-count derivation
is source-matched and independently audited (conditional on native
Kummer/regulator/class-field inputs already identified), not a
substitute for the separate balanced row, local crystalline or fit
family construction. Native caller axiom check in section 1 confirms
its transitive axiom set, not separate compilation of these human
proofs or extraction of every referenced premise.

Original/reduced graphs preserved: no edge deletion. The proof
supplier path is ProjectiveCount -> GreenbergWilesBound ->
TiltingLemma.length_le_of_unseen_class -> TwistTheorem.exists_isPencil
-> exists_anticyclotomic_twist -> fit family -> C. All explicit type,
structural, value and pending nodes retained from previous exports.
No native compact rh_scan/rh_prune/rh_reduce/rh_auto run here; prepare
module-local probes below for shared runner, not a new job.
No claim of proof completion, global minimality or new root closure.

RESUME HERE: integration/editor adopt native-sign convention or the
explicit B=-f transport in the audited C argument and merge peer
dc4a4eec without duplicating it. Kernel runner: prioritize the
previously timed-out A module alone within the permitted runner budget,
or its source-matched smaller dependencies with explicit check list;
do not override protected guards. Preserve RUN29 successful C/B
results separately from the timeout. Next compact kernel batch:
probe actual central count, reciprocity and Cartan declarations
through already built TiltingLemma, then independently replay
the human replacement lemmas. Need actual native graph extraction
before claiming no dropped elaborated references. Remaining mathematical
frontier: actual balanced-row/crystalline suppliers and A/B primitives
as directed by latest mission.
HANDOFF TO integration, editor, Galois, audit, acceleration, kernel.
-/

open scoped BigOperators
namespace CompactKernelRun30

/-- Native corestriction's constant correction; no division by an
unknown cardinal. The invertibility of the index modulo the prime
is a separate native Sylow hypothesis. -/
theorem native_constant_correction {ι A : Type*} [Fintype ι]
    [AddCommGroup A] (f : A) (c : ι → A) :
    (∑ i, (f + c i)) - (∑ i, c i) = Fintype.card ι • f := by
  classical
  rw [Finset.sum_add_distrib, Finset.sum_const, Finset.card_univ,
    add_sub_cancel_right]

/-- Translate native f to human B=-f without modifying c. -/
theorem sign_transport {A : Type*} [AddCommGroup A]
    (T : A →+ A) (f fx c : A) (h : T f = fx + c) :
    -fx = T (-f) + c := by
  rw [map_neg, h]
  abel

end CompactKernelRun30
#print axioms CompactKernelRun30.native_constant_correction
#print axioms CompactKernelRun30.sign_transport
#print axioms SplitPlaces.power_residue_reciprocity
#print axioms SplitPlaces.card_trivialised_of_isHigmanProjective
#print axioms SplitPlaces.hasFewCocycles_of_central
#print axioms DiscreteModule.IsMultiplicative.eq_one_of_isHigmanProjective
#print axioms IsPencil.length_le_of_unseen_class
