import Formalism.LocalToGlobal.GlobalTheory.GL5.PNamed
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN33 — exact finite-adelic lattice and infinite-place normalization transport.
25 Nov 2026. HUMAN SOURCE-MATCHED / native certificate PREPARED, NOT compiled.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed upstream
d91ae2678eea19a0c3045ffca37f1da757c2e719. Mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc read first.
AGENTS, SWARM, HANDOFF, EXPANSION, continuity/state/log/protocol and live
spine 464e82f81f646d4af85e1f5f70d379026df46261 inspected (long files in part).
RUN32 56f51000, editor 3e1000ef, integration 38b6cc25 and 95545ee1,
editor 57f243bc/088245be; peers a910af41 (Landau), d91e1e45 (cyclotomic),
1b03d6e3 (CountQ), 6ea6da30 (DH), 46c378ee (Clozel), 3c6f175e (near-field).
Backtrack from general GenusMassStd: 3e1000ef has removed its necessity
at both selected packet consumers given VolSigIndep. Do not duplicate that
or claim removal at every caller. This run addresses the missing transport
in 95545ee1, not another downstream relaxation.

## Compact human proof insertion: actual normalized adelic group

Let F be the native totally real field, E/F the native CM quadratic
extension, and W a nondegenerate Hermitian space with its full self-dual
O_E lattice L0. Use W.frame to write L=L0c(D,W) in E^n. All comparisons
are on the SAME host D; assume the actual indexing FactEmb at D and
that its cmType selects exactly one embedding above each real place
(verify native CM-type construction, not merely the cardinality).

1. Fix any F-basis of E. Finite-dimensional scalar extension identifies
Af(F) tensor_F E with a finite direct power of Af(F); the matrix of
multiplication in the basis has coefficients in F. Clearing denominators
in the basis and in the integral lattice O_E changes only finitely many
local reference lattices. Consequently the coordinate isomorphism
identifies this tensor algebra with the restricted product of E tensor_F
F_v, with the usual restricted-product topology. Both the ring involution
and the matrix equation g*Jg=J act componentwise. An invertible matrix
over this algebra is precisely a family of local invertible matrices
whose entries AND inverse entries are integral at almost every place:
the two directions follow by applying the coordinate isomorphism
to the matrix and its inverse. Thus HA is U(W)(A_F), not a larger
product of unrestricted points. HFinIn is the diagonal rational group,
because its definition is the image of the F-rational unitary matrices
by inclR, then subgroupOf; inclR is injective. This is a topological
group identification in the finite-basis topology (moduleTopology);
at infinity use the analogous finite-product identification.

2. Crucial exact equality for the actual native latHat: its closure is
ADDITIVE SUBGROUP generation, not a topological closure. Put
Rhat=prod_{v finite} O_{F_v}=intAf(F). L is finitely generated as O_F
module: it is finite over O_E and O_E is finite over O_F. Choose a
finite generator list l_1,...,l_s. For every finite v the image of
O_{F_v}^s under these generators is precisely the completed lattice L_v
(base change is exact because localization and DVR completion are flat).
Under the isomorphism in step 1, each native pure generator a tensor l
has local components in L_v, so latHat is contained in prod L_v.
Conversely if (y_v)_v belongs to prod L_v, choose coefficients
a_{j,v} in O_{F_v} with y_v=sum_j a_{j,v} l_j. For each j the family
a_j=(a_{j,v})_v is integral at EVERY place and hence is a member of intAf.
The same finite generator list works at all places. It follows exactly,
with no limit or infinite algebraic sum, that

      latHat(D.host.F,D.host.E,L) = prod_v L_v
                                 = sum_{j=1}^s Rhat l_j.

Therefore the native condition forall y, y in latHat iff g*y in latHat
is precisely the product of the local lattice stabilizers K_v. Because
g is invertible, the iff is equivalent to equality g(Lhat)=Lhat;
componentwise equality follows by testing tuples supported at a single
place. No global lattice freeness or choice of a common local isometry
is required. The finite subgroup is compact open.

3. For a native compatible IsInfEmb theta extending tau, restrict theta
to Ainf(F) = prod_{v|infty} R. The finitely many coordinate idempotents
are orthogonal and sum to 1; their images in C are 0 or 1, exactly one
being 1. On the selected real factor the continuous unital ring map to
C fixes Q and hence R. By the tensor relation the chosen factor MUST
restrict on F to tau|F. Thus

      theta(a tensor e) = a_{v(tau)} tau(e).

Since pure tensors additively span, this determines theta uniquely.
The CM property identifies E tensor_F F_v with C using either of the
two conjugate embeddings above v. FactEmb and eTau give exactly the
native cmType without repetition (see Lean bridge below); the one-per-
real-place property is still to be authenticated for this native cmType.
A compatible frame A has A* J_(P,Q) A = W.gram_tau and is invertible
(n=P+Q by SigOK). Hence the native condition
b A=A infMat(h) is exactly b=A infMat(h) A^{-1}; these are the standard
local real unitary groups in their chosen frames.

4. Short archimedean normalization argument, supplementing 95545ee1:
write J=diag(+1,-1), J^2=I. For X*J+JX=0, (JX)*=-JX.
Thus X -> JX identifies the real Lie space with the compact Lie space.
On the complexification, multiplication by J has absolute determinant 1
(it changes signs of rows), so under the native map
(X,Y)->entries(X+iY), this sends the product Lie Lebesgue measure to
the SAME compact normalization. Uniqueness follows from additive Haar
uniqueness and positivity of the scalar: scaling lam by c scales the
product by c^2. In a trace-pairing basis equivalently the coefficient
is |det tr_E(X_i X_j)|_v^(1/2). A frame similarity has complex determinant
one, as left and right multiplication determinants cancel. This proves
there is no signature-dependent frame or coordinate Jacobian. The
native CDHaar.trick identifies the small exponential-ball density with
the compact one, and CDHaar.prob fixes the compact measure. Invariant
smooth Haar densities are determined by their value at identity
(the exponential differential at 0 is the identity); thus the
archimedean factors are exactly the signature-independent trace-density
multipliers established in 95545ee1, not simply arbitrary Haar measures.

5. By steps 1-3 the set in IsVolMeas is literally
K_f times prod_v B_v in these group coordinates. The native equality
for every measurable B_v says its measure is prod_v cd(P,Q)(B_v).
The product Haar measure with K_f mass one and each real factor cd
has that value. Both Haar measures agree on a compact/open finite
factor times relatively compact real neighborhoods of positive finite
measure; Haar uniqueness then gives equality on ALL measurable sets.
This avoids needing a new global product-rectangle uniqueness theorem.
Rank zero is the trivial group and cd(0,0) is a probability, so its
volume is one. No regularized infinite product is used at rank zero.

For positive rank the global normalization in 95545ee1 now applies
as ordinary mathematics: the unramified integral unitary group of a
self-dual lattice has trace-pairing measure of K_v equal to
prod_{j=1}^n(1-eta_v^j q_v^(-j)), where eta_v is +1 (split) or -1
(inert); this is independent of W. The determinant-torus convergence
factors and F-discriminant factors also agree, and the standard unitary
Tamagawa number is 2. Comparing the SAME regularized normalizations
therefore gives equal quotient volume for W,W0 of equal rank:

          vol_mu(U(W)(F) backslash U(W)(A_F))
          = vol_mu0(U(W0)(F) backslash U(W0)(A_F)).

This is precisely the intended VolSigIndep statement, under the CM-type
indexing, conventional topological/Haar transport and cited Tamagawa
theorem. The argument above explicitly supplies the finite lattice and
infinite embedding identifications in ordinary mathematics. It does
NOT certify the full Lean representation/instance dictionary, the
native CM-type selection theorem, or the imported Tamagawa theorem.
No assumption of an indefinite-to-definite rational isometry; such
an isometry is impossible for different signatures. No numerical
regression or finite-to-infinite inference. No URT advantage claimed.

## Evidence and graph

Original source-visible graph: PNamed.vol_eq_of_indep <- VolSigIndep,
VolTie; PNamed.volRatioTrue_of_indep -> theorem_two_of_landherr;
editor 3e1000ef supplies the candidate packet caller without GenusMassStd.
Alternative integration 38b6cc25 needs only a one-sided covolume bound.
Replacement frontier for VolSigIndep: native CM/CMType indexing + finite
basis/latHat exact transport + native CD normalization + ordinary
Tamagawa measure comparison -> VolSigIndep -> same-rank mass -> original
sharp-count and covolume consumers. No global deletion: preserve original
typed/value/constructor/axiom edges, all independent root suppliers, and
the original graph; authenticated root reachability of every specific
packet producer is still open. Cache context by source pin,D,F,E,W,
frame,rank,signature,place,measure. Backtrack to original VolSigIndep
hypothesis if transport fails. The Lean bridge below checks only
embedding enumeration and the exact native VolTie interface; it does not
formalize the global Tamagawa argument. No new axiom output claimed.

Pinned source blobs and anchors, all 39 source/blob assertions executed
via connector JS:
src/Formalism/SharpRestriction/GlobalSchurBounds/StandardLattice.lean
  cb758a6c5f78e610b8f946d4b733d07902b15f5d (intAf, latHat, IsInfEmb,
  embOf, IsVolMeas, VolTie);
src/Formalism/SharpRestriction/GlobalSchurBounds/GeneralLinearActions/GenusMassVolumes.lean
  525618b770cb535fd890f10277af11ffbe76af40 (HA,HFinIn,topTens,AF,Ainf,Af);
src/Formalism/LocalRingCardinality/DataCD.lean
  449d5479b4d8ec9baeaebd3459f95232094ae222 (lieU,IsOmegaLeb,OmegaDensity,CDHaar);
src/Formalism/LocalRingCardinality/DataHost.lean
  7e9af8ab364965c62be250ae93974098141598c0 (FactEmb);
src/Formalism/LocalRingCardinality/RhoDetPrimeEqMuTildeMulChiPow.lean
  6ab57a7f313a9f8c351005051933a60a22a0da08 (eTau);
src/Formalism/LocalToGlobal/GlobalTheory/GL5/PNamed.lean
  fcfd96e6e8385ec5e1de13f41d5706803d565c5d (VolSigIndep,vol_eq_of_indep);
src/Formalism/LocalRingCardinality/DataSpaces.lean
  f1d2da346f8996c2527724b50fd6409dc8ab937b (CMData,HSpace).
All seven same-path upstream blobs at observed head differ from pin;
do not combine versions or infer mathematical changes from blob changes.
No Lean/Lake on local PATH. CI status JSON b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717 retrieved; returncode 0 for
prior engine/strip-root and prune runs only. New candidate not compiled.
Native commands below are prepared for a pinned runner with its imports.

RESUME HERE: authenticate native cmType one-per-real-place and FactEmb
supplier; use the finite-generator transport and real density calculation
above for the actual VolSigIndep caller, audit the precise Tamagawa
reference and native module topology/Haar instances. Compile this
certificate and editor 3e1000ef on exact pin, inspect scan/prune/axioms.
Do not repeat the general genus proof or claim the RH equation established.
HANDOFF TO integration/editor, literature, kernel, formal audit. RH OPEN.
-/

noncomputable section
namespace Formalism.L2.GlobalTheoryTheory.GenusMassVolumes

open Formalism.BasicNotions Formalism.MainNotions.StandardLattice
open Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes
open MeasureTheory
attribute [local instance] Formalism.BasicNotions.Host.cmStar

theorem rh33_embOf_enumerates (D : D7)
    (hB : Function.Bijective D.host.emb)
    (hP : ∀ g : D.R.GG, D.host.emb g ∈ D.host.cmType ↔ g ∈ D.R.Psi) :
    Function.Injective (embOf D) ∧
      ∀ τ : D.host.E →+* ℂ,
        (∃ ρ : D.what₂.Tau, embOf D ρ = τ) ↔ τ ∈ D.host.cmType := by
  constructor
  · intro a b hab
    apply D.eTau.injective
    apply Subtype.ext
    exact hB.1 hab
  · intro τ
    constructor
    · rintro ⟨ρ, rfl⟩
      exact (hP (D.eTau ρ).1).2 (D.eTau ρ).2
    · intro ht
      obtain ⟨g, hg⟩ := hB.2 τ
      have hp : g ∈ D.R.Psi := (hP g).1 (hg.symm ▸ ht)
      refine ⟨D.eTau.symm ⟨g, hp⟩, ?_⟩
      simpa only [embOf, Equiv.apply_symm_apply] using hg

theorem rh33_embOf_of_fact (D : D7) (h : FactEmb) :
    Function.Injective (embOf D) ∧
      ∀ τ : D.host.E →+* ℂ,
        (∃ ρ : D.what₂.Tau, embOf D ρ = τ) ↔ τ ∈ D.host.cmType := by
  first
  | (rh_reduce 3 using [rh33_embOf_enumerates]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact rh33_embOf_enumerates D (h D.R D.host).1 (h D.R D.host).2

-- Exact interface for the ordinary equal-rank quotient volume comparison.
-- This is an adapter, not a proof of its mathematical normalization premise.
theorem rh33_sigIndep_of_vol (D : D7) (hT : VolTie D)
    (hV : ∀ (W W₀ : HSpace D.host.E) (P Q P₀ Q₀ : ℕ),
      W.SigOK → W₀.SigOK →
      (∀ τ, W.sig τ = (P,Q)) → (∀ τ, W₀.sig τ = (P₀,Q₀)) →
      W.rank = W₀.rank → D.vol W = D.vol W₀) :
    VolSigIndep D := by
  intro W W₀ P Q P₀ Q₀ hW hW₀ hs hs₀ hr μ 𝓕 μ₀ 𝓕₀ hμ hF hμ₀ hF₀
  obtain ⟨-, hall⟩ := hT W P Q hW hs
  obtain ⟨-, hvol⟩ := hall μ hμ
  obtain ⟨-, hall₀⟩ := hT W₀ P₀ Q₀ hW₀ hs₀
  obtain ⟨-, hvol₀⟩ := hall₀ μ₀ hμ₀
  rw [hvol 𝓕 hF, hvol₀ 𝓕₀ hF₀, hV W W₀ P Q P₀ Q₀ hW hW₀ hs hs₀ hr]

rh_scan vol_eq_of_indep limit 2000
rh_scan rh33_embOf_of_fact limit 2000
rh_scan rh33_sigIndep_of_vol limit 2000
rh_prune rh33_embOf_enumerates as RH33EmbPruned
rh_prune rh33_sigIndep_of_vol as RH33VolumePruned
#print axioms rh33_embOf_enumerates
#print axioms rh33_embOf_of_fact
#print axioms rh33_sigIndep_of_vol
#print axioms vol_eq_of_indep

end Formalism.L2.GlobalTheoryTheory.GenusMassVolumes
