import New.Columns.LocalStatement
import Mathlib.Tactic

/-!
# RUN70 — exact mixed-model scalar at the marked Hecke caller
27 November 2026. HUMAN-DERIVED relative to the named Weil and
Schrodinger foundations, independent audit pending. Native replay
not executed for this file.

Compact pin: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207.
Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Latest mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 read,
including completion-first and unified reduction instructions.
Protocol, handoff, expansion, AGENTS and current human manuscript
52c0ccfd0dc525f446dd8bc935a7df71912c8709 read. In particular the
integration theta-chain-height note already derives the archimedean
caller; do not duplicate it. RUN69 6de4f9d9 and the later integration
retain the precise mixed-model action at the Hecke caller; recent
theta peer supplies the canonical two-torsion/isogeny multiplier
separately. This note addresses the former, not the latter.

## 1. The overlap is a projection, not an arbitrary phase

Fix the actual conjugate-disjoint place set A, space V and finite
unitary g supported on A union bar(A), identity outside. Write
P=projOn A, B=boxIndicator at A, N(F)f=name A F f.
The native identities are
  N(B)=P, N(F)P=N(F),
  <N(F)v,N(H)f>=<F,H>_A <Pv,Pf>.
The inner product is conjugate-linear in its first argument. All
F,H here are Schwartz-Bruhat over A. Thus for arbitrary v,
  <v,P N(H)f>=<Pv,N(H)f>=<B,H>_A <v,Pf>.
Nondegeneracy gives P N(H)f=<B,H>_A Pf. No division by a vector
or its norm, and no assumption of a one-dimensional global space.

Let a be g cut to A (identity outside A), D=finMultiplier(g),
d=|glMultiplier(a)|^2>0. Put H(x)=B(gx), the pullback of the
box, and u=omega(g) N(H)f.
The actual localInner_boxIndicator_mulVec says
  <B,H>_A = vol(L intersect a^{-1}L) = d^{-1}.
Indeed a saturating matrix b has bL=L intersect a^{-1}L:
b and ab integral give inclusion and b^{-1}=l+ma with integral
l,m gives the reverse. Haar measure normalized by vol L=1
gives vol(bL)=|det b|; the unitary splitting character has
absolute value 1, so |glMultiplier(a)|^2=|det b|^{-1}.
This proves the overlap including nonunit determinant.

## 2. Why the same u works for every named function

Use the native Heisenberg law and covariance omega(g)rho(y)=
rho(gy)omega(g). On the split local coordinates the Schrodinger
action on functions is translation on A and multiplication by the
dual character on bar(A). The change F(x)->F(g^{-1}x) intertwines
these actions with y->gy: the translation identity is substitution,
and the dual-character identity follows from g preserving the
Hermitian pairing. The factors on A and bar(A) are contragredient.
In particular the transported box H above goes to B.

For a Schrodinger generator rho_A(y)B, apply the inverse coordinate
change to express it as a generator applied to H; then covariance
gives N(rho_A(y)B)u on the right. The integral Heisenberg subgroup
fixing B fixes u by the same identity with the inverse transported
subgroup, hence Pu=u (P is its normalized average). Every compactly
supported locally constant function above A is a finite linear
combination of such generators (exists_schrodingerComb_eq).
Linearity therefore yields
  omega(g)N(F)f = N(F o g^{-1})u,  Pu=u.
This is the supported finite case of Space.omega_name, with the SAME
u for all F and no scalar chosen separately per F. Retain the
actual Schrodinger span and covariance, including their normalizations.

## 3. Determine u by a single projection identity

For any P-fixed v the native compression identity is
  P omega(g) v = finMultiplier(g^{-1})^{-1} v.
Here is its exact support argument. The P-fixed subspace is generated
densely, for the bounded linear identities in question, by the
integrated polynomial vectors times finite Heisenberg translates
of the vacuum supported off A union bar(A) (ext_integrated).
These commute with omega(g) by its support and with P by disjoint
support; the real component of g is identity. For the vacuum,
project also onto the complementary finite lattice and the real
vacuum. Those complementary projections already fix omega(g)vac,
since they commute with this supported finite g and fix vac.
Consequently P omega(g)vac is its projection onto the full vacuum
line. The scalar is <vac,omega(g)vac>=1/conj(finMultiplier g).
Use finMultiplier_inv and extend the identity by ext_integrated.
This is precisely projOn_omega, not an assertion that omega(g)
fixes the vacuum before compression.

Apply the compression to g^{-1} and the already P-fixed u:
  D^{-1} u = P omega(g^{-1})u = P N(H)f = d^{-1} Pf.
For the same cut a the native determinant identity
finMultiplier_eq_of_supportedOn is
  D=d * conj(chiAdelic(det a)).
It follows either from the separate conjugate-place saturation
matrices or glMultiplier_star_inv_mul: at the conjugate place
the matrix is star(a^{-1}); the product of the two multipliers
is |glMultiplier(a)|^2 conj(chiAdelic(det a)).
Thus
  u = conj(chiAdelic(det a)) Pf.
Substitute this into section 2 and use N(F)P=N(F) to get exactly
  omega(g)N(F)f
    = conj(chiAdelic(det a)) N(F o g^{-1})f.
The entire positive overlap cancels before any norm is taken.
Zero f is included. The only inverted quantities D,d are nonzero
by the native determinant and multiplier statements.

## 4. Dual-pair normalization at the actual Hecke caller

For source rank n and target rank n', let G=det(g_A), H=det(h_A)
be cut ideles. The Hom action x->h x g^{-1} has determinant
H^n/G^{n'} by the Kronecker determinant formula, and inverse
action on the named function is x->h^{-1}xg. The finite norm-one
determinants in pairChar are G/bar(G), H/bar(H).
Since chiAdelic(t)=upsilon(t)|t|^{-1/2}, conjugating gives
upsilon(t)^{-1}|t|^{-1/2}. Multiply by the pair character:
  a(H/bar(H))/b(G/bar(G))
       * upsilon(H^n/G^{n'})^{-1} * |H^n/G^{n'}|^{-1/2}
  = [a.baseChange(H) upsilon(H)^{-n}]
       /[b.baseChange(G) upsilon(G)^{-n'}]
       * sqrt(|G|)^{n'} / sqrt(|H|)^n.
The brackets are exactly a.spaceChar(n), b.spaceChar(n').
This is pairWeil_name_on with its native phase and half powers.
In particular for a local uniformizer with |varpi|=1/q, the
source factor from G of valuation i is q^{-n'i/2}/spaceChar_b(G),
whereas the target factor from H is q^{ni/2} spaceChar_a(H).
For the inverse uniformizer the powers reverse. Use the actual
inverse-coset orientation in HeckeTransfer, not a sign inferred
from a bare rank count.

For finite parts in Kf, the integral box is preserved and its
pullback equals B, so u=omega(g)Pf=P omega(g)f. The name absorbs
this P; multiply by the same pairChar to obtain pairWeil_name_of_mem.
For supported Kf elements the cut determinant has valuation zero,
so chiAdelic is 1 (native finite splitting character unramified);
the projected vector itself is fixed by omega. This gives
pairWeil_eq_smul_of_projOn_eq with exactly pairChar, not an
unspecified modulus-one multiplier.

## 5. Dependency graph and status

Original root path retained:
Schrodinger span/covariance, projection inner identity and compression,
finite saturation and phase -> omega_name_on -> pairWeil_name_on,
pairWeil_name_of_mem, pairWeil_eq_smul_of_projOn_eq
-> HeckeTransfer split local sums and LocalStatement.exists_hecke_transfer
-> exists_move_markOperator / gaugeLe_markOperator_pow
-> uniform local index -> short_forms -> A+B+C -> prime bound.
Reduced human slice is sections 1–4, using one scalar projection
calculation rather than individual phase estimates. It does NOT delete
native dependencies globally. Independent audit of the shared WeilData,
global theta-functional, CM normal form and other A/B/C suppliers
remains required. No claimed RH theorem imported or used.

Pinned source blobs, relative to grh-compact/src:
  Lib/Weil/MixedModel/Names.lean
    7dc9e83b6974266a3ed74a0ab24b47ec63a3e953 lines 35–104
  Lib/Weil/MixedModel/NameWeilAction.lean
    a8bee0d694dc7891bb451bc6503f45aed919d2d3 lines 180–203
  Lib/Weil/Construction/Projections.lean
    7a187f8be18a00b889082b56818393f20a7f88e4 lines 126–203
  Lib/Weil/Construction/FiniteMultiplier.lean
    7b35474d42010a69abe9ba5868c0fce4d4490efc lines 71–72,156–199
  Lib/Weil/Construction/PairDefs.lean
    8a5eaed1249fcc1c482e3af4f15373682fa34af1 lines 257–299
  Lib/Weil/DualPair/PairSumNegation.lean
    d2f45383d2e972574a7e749da0f2b4bb9283c6da lines 28–105
  New/Columns/LocalStatement.lean
    9d5bd0d698b0db2850cbd306d8d400d7e99a3547, marked Hecke caller.

Native lean/lake/elan not on local PATH (checked). Native rh_scan,
rh_prune, rh_reduce, rh_auto and frontier not executed on compact
source. Actual historical CI run 45803534769 jobs re-read; run-job
wrapper success is not a declaration-level PASS. Its job log explicitly
describes partial primitive replay; no new certificate was compiled.
Earlier A timeout evidence and original/reduced graphs and axiom
archives preserved. The probe below is prepared, not executed. No
synthetic numerical test used in place of the identity.

RESUME HERE: integration/editor audit sections 1–4 against the
actual HeckeTransfer scalar and join to RUN69, RUN60 and the marked
index chain. Shared Weil/CM foundations are retained, not waived.
Next prime-lane work: independently audit the joined marked gauge
and uniform index at the A short_forms caller, especially same
witnesses and the local degree/valuation thresholds; inspect newer
peer results first. Do not redo theta-chain height or short basis
already in the human manuscript. Request kernel replay of the
small mixed-model import separately from the timed-out A import
when supported by the shared runner. No human RH closure.
-/

namespace CompactPrimeRun70

-- Algebraic cancellation after multiplying by the same positive overlap.
theorem cancel_overlap (D d c : ℂ) (hd : d ≠ 0) (hD : D = d * c) :
    D * d⁻¹ = c := by
  rw [hD]
  calc
    d * c * d⁻¹ = c * (d * d⁻¹) := by ring
    _ = c := by simp [hd]

end CompactPrimeRun70

#check Space.dataInner_name
#check Space.localInner_boxIndicator_mulVec
#check Space.projOn_ω
#check Space.omega_name
#check Space.ω_name_on
#check finMultiplier_eq_of_supportedOn
#check pairWeil_name_on
#check pairWeil_name_of_mem
#check pairWeil_eq_smul_of_projOn_eq
#check Data.IsGoodDatum.exists_hecke_transfer
#print axioms Space.ω_name_on
#print axioms pairWeil_name_on
#print axioms CompactPrimeRun70.cancel_overlap
