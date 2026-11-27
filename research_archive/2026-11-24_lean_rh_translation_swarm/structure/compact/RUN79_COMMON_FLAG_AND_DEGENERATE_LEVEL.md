# RUN79 — exact common-flag propagation and degenerate-level supplier

27 November 2026. Status: SOURCE-MATCHED HUMAN DERIVATION, pending independent audit and fresh Lean replay. No new kernel closure. Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude. Source pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Mission blob a69122b6ad568910a45d2bc13961ab9da4855143 (including sole-URT allocation), manuscript blob 619ae01be98c32e053eef1c8bcd44ccddd0664e7, protocol 4b77b161d6876915c15cea5a4d4a519beaf5de74. Continue RUN78 0e9b893e at its exact RESUME HERE, not the already integrated Siegel–Weil bridge. The manuscript already contains pair-weight level decomposition and RUN78 supplies the incompatible-character orbit vanishing; neither counted again here.

## 1. Native data and anchors

- New/Filling/CrudeEnergy.lean da67bf862a4c5e72ab6a81a7dfb462545cd8833f, 43–82 (hasCommonFlagVector_of_le, CharsAgree.exists_hasLevel), 166–191 (actual energy consumers).
- New/Filling/CrudeBoundDefs.lean 0ba0d2532b14c414b9032466b79e10d4d60c3d18, 54–68, 90–93, 113–116: common flag, normal form, level and character agreement definitions.
- New/Filling/EichlerFlag.lean 3da2606a049a092719b779802cb8ead3af7141ce, 41–43, 152–175: discriminant, frame maps, covector representation, Eichler character supplier.
- Lib/DiscreteSeries/Bruhat/EichlerMaps.lean c1d16d7a700fa344bce743a2ead6ecee7ab0fa8a, 18–32, 44–53: map, isometry, Gram identity and adjugate vector.
- New/Filling/StableCells.lean 236a41919b3697e1e30c4be840140f6452642599, 34–49: inverse normal form, shared-tail construction, stability.
- New/Filling/BoxPartition.lean 53f11966247a892d94cf688e8b366e887a92f641, 316–323: padded leading matrix.
- New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727, 72–82, 105–107, 141–145, 164–167, 389–391: form, frame products, characters and discriminant.
- Lib/Adelic/Poincare/BesselSubgroup.lean 4cfedb82d9c709e48f4c7ada365b284a9e68642d, 48–55; Lib/Adelic/Witt/FrameAction.lean cd3f13d59a5f2351c2fa22267765c723bd3b6001, 151–169: simple-root and flag conventions.

Let E be the native CM field, n=ϱ+1, N>0 the native norm parameter, V the split hyperbolic blocks surrounding the middle form diag(I_k,-N). Write V=X⊕X₀⊕Ez⊕X* where X and X* are the paired isotropic blocks, z is the distinguished last frame vector, X₀ positive definite at the complex embeddings. Frame F=(e_0,...,e_{n-2},z), G=γF for rational unitary γ. Hermitian h is conjugate-linear in first argument. Thus F*JF=G*JG=diag(0,...,0,-N), Z=F*JG. Write D_j=det Z_{[0,j),[0,j)}, D_0=1 and d=|D_n|²-N²|D_{n-1}|², with |s|²=s star(s) in E (not a chosen complex absolute value until embedding). The native condition CharsAgree is equality of finite characters for EVERY rational u,u' in the Bessel unipotent subgroup with uγ=γu'. Retain nonzero g,ϖ and the continuous nontrivial finite additive character ψ_f, density E→A_f (weak approximation), and the native finite lattice-basis simple-root transport used in CrudeEnergy line 59. That transport preserves the simpleRootSum on passage from rational coordinates to ratToFin; do not assume all matrix entries are unchanged by lattice basis change.

## 2. One-step propagation by exact covector annihilation

Suppose Fx=Gy with both coordinate vectors zero above a and leading entries c,c' at a. If a<n-1, let S denote the right shift on E^n (Sx)_0=0, (Sx)_i=x_{i-1}. Let W=span(F_i,G_i : i≤a). We claim

    F Sx - G Sy ∈ W.                                  (P)

Let l be ANY E-linear row functional annihilating W. Nondegeneracy gives v with h(v,w)=l(γw) for all w, hence h(γv,w)=l(w). For t∈E set r=-gϖ t and X_r=r Fx=r Gy. Since a<n-1, X_r is isotropic. It is orthogonal to γv, and equivalently γ⁻¹X_r is orthogonal to v.

Use the source Eichler map E(X,u,s)=I+X h(u,·)−(u+sX)h(X,·), where s+star(s)=h(u,u). For example s=h(u,u)/2 over E (source uses its trace-one element). To see the isometry algebra directly, write A=h(X,w), B=h(u,w) and similarly A',B' for w'. On expanding h(Ew,Ew')−h(w,w'), cross terms star(A)B' and star(B)A' cancel, and the remaining coefficient is [h(u,u)−s−star(s)]star(A)A'=0. The correction operator K=E−I has K²=−h(u,u) X h(X,·), K³=0, so the inverse is I−K+K². No approximation or projective equality.

Apply EichlerFlag.165–175 to (x,r,γv,l) and (y,r,v,lγ) with cutoff a+1. The resulting rational unipotents u₁,u₂ obey u₁=γu₂γ⁻¹ because their defining vectors transform by γ and h(γv,γv)=h(v,v); use the same trace-one scalar in both. Their simple-root sums are

    σ(u₁)=r l(F Sx),    σ(u₂)=r l(G Sy).

Indeed the last correction term contributes nothing on the frame columns since X_r is in X, and the superdiagonal from X_r h(γv,·) is r sum_{i=0}^{n-2} x_i l(F_{i+1}). The native Bessel membership is the EichlerFlag lemma under its explicit support/annihilation hypotheses; these are precisely x_i=y_i=0 for i≥a+1 and l kills both prefixes. The direct matrix expansion gives the phase value; no integral Eichler element is needed because CharsAgree tests rational elements.

The actual native character is ψ_f(−σ/(gϖ)). Consequently agreement gives

    ψ_f(t · l(F Sx − G Sy))=1    for EVERY t∈E.

If the scalar inside were nonzero, multiplication by it would permute E; by density and continuity ψ_f would be identically 1 on A_f, contradiction. Thus every l∈W^⊥ kills the difference, giving (P) by finite-dimensional double annihilator (extend a basis of W to a basis of V). Express (P) as Fp−Gq with p,q supported ≤a; then F(Sx−p)=G(Sy−q). Both new vectors have the original leading coefficients c,c' at a+1, and no coordinates beyond a+1.

Repeat to any b≥a. At b=n−1, equality of the self-pairings gives −N c star(c)=−N c' star(c'), so c star(c)=c' star(c'). This establishes hasCommonFlagVector_of_le, including a=n−1 directly and the zero-leading case. The native lemma uses reverse induction, while this is its ordinary finite forward shift formulation.

## 3. Minimal common suffix, no low relation

Select the least j∈{0,...,n} for which IsNormalForm j γ holds. Existence at j=n is vacuous, scalar 1. Normal form means there is ONE norm-one scalar c such that for every b≥j (b<n) there is a common vector leading (c,1) at b.

If Fx=Gy and y supported strictly below j, then x=y=0. Otherwise choose a largest index where either vector is nonzero. The result of §2 forces their entries there to have equal norms, hence both nonzero (field and involution). Thus a<j. Divide by y_a, obtaining leading (x_a/y_a,1), norm-one first entry. §2 propagates precisely that SAME scalar to every b≥a, contradicting minimal j. This is the M assertion of CrudeEnergy lines 69–72. It is stronger than merely excluding a common vector whose two supports were assumed equal.

A useful companion is the native shared-tail lemma: given prescribed y_b for b≥j, one can realize them as the tail of a common pair Fx'=Gy' by descending from n−1 to j. At each b add the normal-form vector at b multiplied by the discrepancy of the current y'_b; higher entries unchanged. Inverse normal form swaps F and G and uses scalar star(c) since c star(c)=1. Hence one can also prescribe arbitrary F-side tail. This reproduces StableCells.34–44.

## 4. Leading block nonzero from positive middle complement

If D_j=0, paddedLeading j Z (first j rows of Z, rest identity) is singular, so take nonzero y with y_b=0 for b≥j and (Zy)_b=0 for b<j. First handle j=n separately in this argument: when j=n the condition on y is empty and Zy=0; under the standing discriminant-zero hypothesis, D_n=0 alone does not force y_last=0. The next paragraph handles all cases without silently making that inference.

For j<n, y_last=0. For every b≥j, prescribe F-side tail equal to the coordinate vector at b using inverse normal form. Thus there is common Fw=Gv with w_i=δ_ib for i≥j. Then

    star(w)^T Zy = h(Fw,Gy) = h(Gv,Gy) = −N star(v_last)y_last=0.

Since the prefix of Zy is zero, this proves (Zy)_b=0. So Zy=0. For j=n, this holds directly, and d=0 and D_n=0 imply D_{n-1}=0. If a kernel vector y has y_last≠0, its norm h(Gy,Gy) is negative, whereas Gy⊥F because Zy=0. But F⊥=X⊕X₀ has nonnegative norm at a complex embedding; contradiction. Therefore y_last=0 also in this case. (The same positivity reasoning applies for any j once Zy=0.)

In all cases Gy lies in F⊥ and is isotropic, since y_last=0. In F⊥=X⊕X₀ the form is the positive norm of its X₀ coordinate, so isotropy forces that coordinate zero. Thus Gy∈X⊂im F. This yields a nonzero common relation with y supported below j (for j=n this support restriction is vacuous), contradicting §3. Therefore D_j≠0. This is the human positive-middle argument replacing the opaque norm_sq_middle_part_eq calculation at CrudeEnergy.76–82; it uses definiteness of the ACTUAL rational middle form at an archimedean embedding, not merely Hermitian nondegeneracy.

## 5. Degenerate top level is impossible

Suppose j=n. The preceding result says D_n≠0. Take y=adj(Z)e_{n−1}. Then Zy=D_n e_{n−1}, y_last=D_{n−1} by the last diagonal cofactor. Put w=Gy. Its orthogonality to e_0,...,e_{n−2} shows w∈X⊕X₀⊕Ez; and h(z,w)=D_n implies its z coefficient t=−D_n/N. Write w=u+v+t z with u∈X,v∈X₀. Its norm gives

    h(v,v)−N|t|²=−N|D_{n−1}|²,
    N h(v,v)=|D_n|²−N²|D_{n−1}|²=d=0.

Positive definiteness of X₀ at a complex embedding forces v=0, so w∈im F. Since Zy≠0, y≠0, contradicting §3 for j=n. Hence j≤n−1=ϱ.

Together with normal form and D_j≠0, this gives exactly HasLevel j γ when d=0: both sides of (ϱ<j ↔ d≠0) are false. This discharges CharsAgree.exists_hasLevel, including ϱ=0: the flag shift is then empty, but minimal suffix and last norm arguments are valid.

## 6. Actual consumer and comparison

CrudeEnergy.energy_le_of_linkEnergy_le (180–191) splits stable T into its discriminant-nonzero and discriminant-zero parts. The zero-discriminant part, by this result, has each agreeing γ at some j<last (last=n). It therefore supplies the quantified hypothesis of energy_le_of_level_lt at last, while RUN78 supplies vanishing for nonagreeing γ. Stable-level and discriminant invariance are the separately retained StableCells and EichlerMaps results; the pair estimates, absolute amplitude exchange, and quantitative constants at the energy caller are NOT replaced by this note. In particular no claim of closure of Theorem B.

URT candidate: shift symmetry and exact cancellation suggested using one relation and its propagated suffix rather than a separate search for each flag vector. Conventional double-annihilator linear algebra and Hermitian positivity justify every step. The native proof already uses the same shift structure, so no distinct performance gain or O(N) proof-search claim. A tempting simplification (norm equality follows from any initial common vector, without phase propagation) is false: in the hyperbolic plane plus negative line take γ=diag(2,1,1/2) in the ordered basis (e,z,e*); γ is an isometry and F(2,0)=G(1,0), yet norms of the leading coefficients are 4 and 1. It does not obey CharsAgree: the simple root scales under conjugation. This is why the character step cannot be dropped. Another invalid shortcut is to infer y_last=0 from support below j when j=n; §4 explicitly treats that boundary by positivity instead.

Verification: actual pinned source blobs read as above; complete algebraic human derivation under native character transport, weak approximation/nontriviality and explicit CM form. No fresh Lean execution or numerical regression claimed. Previous independent audit remains pending. External formal certification and this partial human reconstruction are distinct. No changes to native source, protected workflows, prior results, or physical gates.

RESUME HERE: CrudeEnergy.energy_le_of_level_pairs 127–160, reconstruct the exact weighted-pair inequality at the actual sigma-indexed injection and scalar bound H, consuming the existing pairInvariant/classGauge derivations; check the manuscript's previously recorded pair-weight estimate before deriving any missing part.
HANDOFF TO integration and audit: §§2–5 supply the two exact degenerate level declarations at lines 46–82 and the quantified input at line 188; retain all other analytic and geometric bounds. Independent review requested.
