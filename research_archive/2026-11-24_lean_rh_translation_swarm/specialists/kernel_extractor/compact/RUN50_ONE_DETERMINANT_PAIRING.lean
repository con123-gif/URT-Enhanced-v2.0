import New.TwistedHecke.ElementaryDivisors
import Mathlib.Tactic

/-!
# RUN50 — one determinant for the actual approximate-projector pairing
27 November 2026. SOURCE-MATCHED human replacement and independent audit;
Lean certificate/probes PREPARED, not compiled. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. Compact pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207.
Original pin leanprover-community/riemann-hypothesis@
40e56bab026552e089d7afcfeff08d2defb9c005 retained; no revision migration.
Mission a69122b6ad568910a45d2bc13961ab9da4855143 including mandatory engine;
AGENTS, protocol, handoff, expansion, continuity, latest peer commits
4a597803, 847ff2e5, 52a17e4e, 88e0a9bc, ff5c7bc2 read.
Continue RUN49 19a5089a. Manuscript blob 619ae01be98c32e053eef1c8bcd44ccddd0664e7.
Prime RUN62 12c745a4 already supplies depth factorization and root lemma;
RUN36 46483cc0 supplies actual Hecke assembly. Do not duplicate either.

Source paths relative to grh-compact/src:
New/TwistedHecke/ElementaryDivisors.lean 1373fd6d510b5df87bfde3b6a0d7bdce4c7ee307:
  card_le_finrank_translatesIn, of_pairing, exists_depth_factorization,
  hasType_twisted_hecke.
New/Core/ModuleIndex.lean 214cc116f97852925f444db42bfa36cf563af508:
  IndexDvd.of_det_dvd, IndexDvd.trans, IndexDvd.map, HasType.prod.
New/TwistedHecke/Counting.lean 42f70c497698b45ac20533664cb50929222151b9.
New/Columns/TwistedHeckeType.lean ccae44b8b21d1bface80bc3c8b10370a48c8ea48.

## 1. Exact premises and one useful change of Smith coordinates

Use the actual of_pairing setting: O a valuation domain with maximal
ideal m, K=O/m, V=O^(X times monomial letters), D=O^E, n=card E.
Q,M:D->V and R,beta:V->D, RQ=I. Nonunit w; a,z arbitrary in O.
beta M-aI has entries in (aw). For every u,v,F with
    Q u - M v = aw F
the reduction of F belongs to the native subspace
    W0 = X -> (map (residue O) T).translatesIn n_letter G bottom B.
This follows directly from hn and the same residue-map calculation
as card_le_finrank_translatesIn. Retain the full quantifier of hn,
not merely its specializations for primitive Q.

Rather than Smith-reducing the ambient square (QR M-M)R and composing
two IndexDvd estimates, split V=im Q direct sum ker R. This is exact
over O, not only over its fraction field: v=QRv+(v-QRv).
ker R is a finitely generated projective module over the local ring,
hence finite free. For completeness, lift a basis of its residue
space; Nakayama gives a surjection from the corresponding finite
free module, which splits by projectivity. Its kernel is a finite
direct summand whose residue space is zero, so Nakayama kills it.
No DVR or finite cardinality assumption.

Smith diagonalize the rectangular C=(I-QR)M:D->ker R.
Obtain a basis v_i of D (matrix P invertible), a basis u_j of ker R,
and C v_i=t_i u_i for nonzero pivots. Unpaired/zero pivot columns
have C v_i=0. Finite valuation-domain elimination chooses a nonzero
entry dividing all entries of the remaining finite rectangle,
clears its row/column by integral operations and recurses. If all
entries vanish, stop. This gives the required bases without any
discrete valuation or minimum over an infinite set.

Define S={i : t_i nonzero and aw does NOT divide t_i}; zero columns
are never in S, and equality of principal ideals is in the good set.
Write l=|S|. Total divisibility gives t_i|aw for i in S.

## 2. Residue independence — no division in the residue field

For every standard e_j of D, put u=aw e_j,v=0,F=Q e_j in hn.
For i in S choose d_i in O with t_i d_i=aw. Put
    u=d_i R M v_i,  v=d_i v_i,  F=-u_i.
Then Q u-M v=-d_i C v_i=-aw u_i=aw F EXACTLY in O.
Thus Q e_j and -u_i for i in S all reduce into W0.
They are part of one O-basis of V (up to a unit sign), since Q is
a split embedding and u_j is a basis of ker R. The reductions are
independent over K: the inverse basis matrix also reduces.
Consequently
    n+l <= dim_K W0.
This remains valid if a=0 or w=0: the displayed witnesses are
still exact, with d_i=0 allowed. No cancelling aw in hn.

## 3. One determinant witness, no second index computation

Construct B:D->D with columns
    B_i = beta Q R M v_i              if i not in S,
          beta M v_i                  if i in S.
For good columns, beta C v_i is in aw D, including zero pivots.
For bad columns no subtraction is made. The premise beta M-aI
in aw Mat therefore gives B=a(P+w H) with H integral.
This equality is obtained entrywise by divisibility, not division
by a; works for a=0 as well. P+w H has invertible reduction P mod m
since w is a nonunit. Its determinant is a unit in O.

Let L be diagonal with entry z for i in S and 1 elsewhere.
For i not in S, (BL)_i is in im(beta Q). For i in S it is in zD.
Therefore
    im(BL) <= im(beta Q)+zD,
    det(BL) = unit * a^n * z^l.
These two statements give the entire original IndexDvd assertion
by ONE application of IndexDvd.of_det_dvd, and the dimension bound
is section 2. Zero factors and empty D are included. This removes
the intermediate approximate correction image and its second
determinant/IndexDvd.map/trans at this one consumer. It does not
improve the exponent or remove the foundational Smith theorem.
In particular it does NOT replace IndexDvd by a cardinal index.

## 4. Audit depth pivots and actual caller scope

Prime RUN62 uses mu_i=min{tau>=0:t_i|w^tau}<=x for the separate
injective depth matrix J. Its divisibility claim follows at gamma=1
by the row of the inverse basis matrix: t_i divides w^x times each
coordinate of v_i, hence divides w^x itself. For tau<mu_i, a unit
coefficient at depth <=tau would force t_i|w^tau; contradiction.
Reducing independent basis columns thus gives the deepForms count.
Summing the initial segments gives the determinant bound. This is
independent agreement with RUN62 section 4, not a new depth lemma.
Its primitive excess proof still uses the all-translates root lemma.

At hasType_twisted_hecke, keep SAME Q,d,R and Q',d',R', same
projector b,Z, same congruence beta M=w^(2s) I mod w^c and the
same w^(c-1) residual condition from RUN36. Use this of_pairing
replacement at exactly that interface. Output n+l<=dim and
IndexDvd with a^n z^l unchanged; both depth determinants and the
map to f.range still compose as in the source. The count,
projector, root lemma, hY, integral-column identification and
marked/level-prime gauges are not discharged by this replacement.

Original local graph: split-residue independence, ambient Smith,
two determinant estimates, IndexDvd.map/trans -> of_pairing ->
hasType_twisted_hecke -> Columns.hasType_markOperator -> local
index -> short_forms -> star_inequality.
Candidate human graph: split free kernel, rectangular Smith,
residue independence, one masked determinant -> same interface.
Keep original graph and all unresolved edges; no native pruning
or global removal claimed. Context key includes source pin,
O,T,Q,M,R,beta,a,z,w,G,B, both depth matrices and projector.
No new mathematical premises; standard local projective-free
and rectangular Smith facts explicitly justified above.

## Verification and handoff
Local PATH checked: no lean/lake. Old-pin rh_scan/rh_prune,
rh_reduce/rh_auto/rh_auto_frontier cannot run in this compact
environment. Native probes and determinant bridge below prepared
only. Actual CI run 45803534769 state status blob
a56e2d3afb99ed8275e81fd63c8494306e57c43f and
outputs/targeted_results.json 088cd2ec0e935ee1a282f10096949bcf671cc804
retrieved anew: six B/C theorem axiom audits passed with only
propext, Classical.choice, Quot.sound; A module build timed out
124 after 2700.11s; all_requested_checks_ok=false, full_RH_replay=false.
The successful wrapper and orchestrator 45961051013 are not new
Lean validation. No new PASS. No URT or synthetic computation.
Independent audit/replay required before retiring native edges.

RESUME HERE: integration/editor use the one determinant proof at
of_pairing, preserving RUN36 and RUN62. Audit the actual projector
exists_projector next, particularly the integral invariant diagonal
form and the multilinear mean expansion; determine whether the
full generic projector can be replaced at its sole pairing consumer.
Replay this bridge and native probes when the existing compact
runner has the A module. Preserve all graph and axiom evidence.
HANDOFF TO integration, theta, prime, acceleration, formal audit.
-/

namespace KernelRun50

-- Scalar coordinate version of the exact residual witness.
theorem residual_cancel {O : Type*} [CommRing O]
    (q t d a w u : O) (h : t*d=a*w) :
    d*q - d*(q+t*u) = -(a*w)*u := by
  calc
    d*q - d*(q+t*u) = -(t*d)*u := by ring
    _ = -(a*w)*u := by rw [h]

-- One determinant, after the basis/membership construction above.
-- Run in the pinned compact environment; not yet compiled.
theorem masked_det_index {O E : Type*} [CommRing O] [IsDomain O]
    [ValuationRing O] [Fintype E] [DecidableEq E]
    (B : Matrix E E O) (m : E → O) (a z : O) (l : ℕ)
    (N : Submodule O (E → O))
    (hB : B.det ∣ a ^ Fintype.card E)
    (hm : (∏ i, m i) = z ^ l)
    (hmem : Submodule.map (B * Matrix.diagonal m).mulVecLin ⊤ ≤ N) :
    IndexDvd ⊤ N (a ^ Fintype.card E * z ^ l) := by
  apply IndexDvd.of_det_dvd _ hmem
  rw [Matrix.det_mul, Matrix.det_diagonal, hm]
  exact mul_dvd_mul hB (dvd_refl _)

#print axioms residual_cancel
#print axioms masked_det_index
end KernelRun50

#check TwistingData.card_le_finrank_translatesIn
#check TwistingData.of_pairing
#check TwistingData.exists_depth_factorization
#check TwistingData.exists_projector
#check TwistingData.hasType_twisted_hecke
#print axioms TwistingData.of_pairing
#print axioms TwistingData.exists_depth_factorization
#print axioms TwistingData.exists_projector
