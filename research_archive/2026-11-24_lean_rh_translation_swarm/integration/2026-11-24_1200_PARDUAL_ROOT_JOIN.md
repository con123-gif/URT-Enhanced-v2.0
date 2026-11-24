# Duality: finite inflation to the RecT dual field

Pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream head observed 5f2c8594adf1f48032d37583118512cd7bbf3afa, not substituted. Extends 1100 ParEx chapter. Correction: GoodMap has only one, twist, and Par fields; dual belongs to CuspT and then RecT. RecTTransport 86–97, 265–286; CuspEx 107–137, 218–221. Adjacent JSON has source paths, blob SHAs, typed guards, selected dependency edges and unresolved imports.

## Nonzero dual inflation (ParDual.lean, exists_dual_map)
Keep groups G,K,Γ, topological group G, finite Γ, complex modules V,W with W finite-dimensional, smooth π on V, ρ on W, homomorphisms ι:K→G and surjective q:K→Γ, compact H≤G. Require q(k)=1⇒ι(k)∈H, and every x∈H has a lift k with q(k)=1. Let nonzero B:W→V* satisfy B(ρ(qk)w,π(ιk)v)=B(w,v). Choose w₀,v₁ with B(w₀,v₁)≠0. The second kernel condition gives H-invariance in the second argument, so B vanishes on the span of π(h)v−v. The smooth compact-subgroup fixed/coinvariant complement (isCompl_fixed_twKer) writes v₁=v₀+b with v₀ H-fixed and b in that span, thus B(w₀,v₀)≠0.

Choose a section s of q; define Ψ(l)=Σγ l(ρ(γ)w₀)π(ι(sγ))v₀. The first kernel condition applied to (k s((qk)⁻¹γ))⁻¹sγ fixes v₀, so reindexing by (qk)⁻¹ gives Ψ(ρ∨(qk)l)=π(ιk)Ψ(l). Nonvanishing is not automatic: set f(w)=B(w,v₀), P(w)=f(w)w₀ and T=Σγ ρ(γ)Pρ(γ)⁻¹. Invariance gives l(Tw)=B(w,Ψ(l)). If Ψ=0 all dual functionals annihilate Tw, hence T=0. But trace(T)=|Γ| trace(P)=|Γ| f(w₀)≠0 over ℂ. Contradiction. No finite-dimensionality of V or positivity assumption added.

For inflates_dual, compose the nonzero inflation into σ with the equivalence σ≃contra π and inclusion of the smooth dual into V*. DzIso supplies surjectivity and both kernel conditions, KOne compactness supplies H, and contra_apply proves invariant pairing. Therefore τ∨ inflates into π.

## Finite-field duality
For invertible y∈GL_n(F_g), p_y(X)=det(XI−y). Multiplying the inverse charmatrix by y gives Xy−I, so det(y)p_{y⁻¹}(X)=(-1)^n rev(p_y)(X). The nonzero constant term makes reversal degree-preserving and involutive; reversal respects products, so a nontrivial factorization of the reverse would reverse to one of p_y. Irreducibility and reciprocal-unit-root transfer follow. Names uses χ_{τ∨}(y)=χ_τ(y⁻¹), inverting the Frobenius-character terms. Regularity survives inversion by injectivity.

Cuspidality survives: the norm-one character condition is invariant under inversion. For the unipotent radical in a+b=n, write I+Y with Y supported only in upper-right a×b block. Y²=0, inverse I−Y has same support; reindex the radical sums by inversion to recover the original vanishing. This retains simplicity and every cuspidality test.

## Universal ParDual transport
Preserve full ParDual ambient prefix E, Ω, A, w, h, local Artin a and ha, prime g with continuous local isomorphism; y cusp, DZ y, DualCl y y', and Par a y V. WDBasic gives irreducibility, rank preservation, tameness, inverse determinant and inverse inertia eigenvalues for the dual. ClBasic identifies y' rank and inverse central character. Thus four Par fields hold.

For the fifth take arbitrary target TypeAt data: prime g, continuous i, positive n, D,R,D.Res R, regular θ, finite cuspidal τ with Names, representative σ with cls σ=y', inflation witness. Unpack DualCl and equality of sigma classes: rank agrees and σ is equivalent to the contragredient of chosen π. Section one gives inflation of τ∨ into π; finite-field argument gives regular θ⁻¹, cusp τ∨ and Names g n θ⁻¹ τ∨. Apply original universal hV.type to exactly those data. Its roots are θ⁻¹(R(t)^(g^j)), j=0,…,n−1. WDBasic inverts every nonzero root, yielding ∏_j (X−θ(R(t)^(g^j))) for V.lpDual. Monodromy zero follows from irreducible-dual field. All target witnesses were arbitrary. No assumption one type choice suffices.

## Root join
CuspEx.Gm.dual treats rank one via ParOne. For a good cusp twist x=u⊗χ, ClBasic gives dual u', cusp and DZ preservation and y=u'⊗χ⁻¹. Gm.par supplies Par for r(u),r(u'); ParDual supplies Par for r(u)∨ on u'; ParUniq identifies r(u')=r(u)∨. Twist laws, smoothness and χ⁻¹∘a=(χ∘a)⁻¹ yield r(y)=r(x)∨. CuspEx carries this into the good branch of the piecewise map; no bad-branch dual assertion.

ExtDual works only for Good(cls π) and contragredient equivalence. Pr.dual pairs segments of equal length l, with dual first terms related by ν^(l−1). Normalized dual shift −(l−1)+(l−1)/2=−(l−1)/2. The special WD factor and dual/list-sum laws come from imported weilDeligneParam_dual_listSum_absTwist_special. Forall₂ induction gives equality of mapped lists, then sumList and the two IsLExt equations yield the field assigned in RecTExists. Imported producers remain obligations.

## Evidence and integration index
V8 connector runtime executed source anchor and finite exact regression checks: {"anchors":70,"edges":18,"nodes":18,"frontier":46,"rejected":5,"poly":9330,"avg":484,"eqv":8712,"half":100}; six pinned blob matches. The finite S3 example checks trace and equivariance, not the general theorem. First regression rejected its own harness because single-occurrence source mutation left a repeated anchor intact; replaced all occurrences, then reran. Earlier source dump truncated, targeted ranges recovered. No Node or Lean kernel replay, no independent review of this chapter, no URT claim. Preserve 0800 root graph, 0900 field graph, 1000 uniqueness, 1100 existence and this chapter, plus peer editor 1156, character boxes run5, Galois run5, theta run5, Grok green run8 and latest audit checkpoints. Counts are local, not global coverage.

Full export job rh-verified-export-stream-closure-20261124 returned error after 350862311 bytes, digest bd484ac9886a96f26b1d9a7a59ebd45b7a70d102c015d4f31f9302bbdd6ab2b9 (run https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45348756372). Retry status path 404. No kernel denominator. Cathedral CI #366 PASS (run 45385315955) before this commit, not RH validation. No physical changes.

RESUME HERE: Trace the producer of weilDeligneParam_dual_listSum_absTwist_special and its monodromy/segment normalization. Dependency lane: diagnose authenticated byte/hash failure, do not count partial bytes as coverage. HANDOFF TO: proof editor, audit, structure, dependencies and math.
