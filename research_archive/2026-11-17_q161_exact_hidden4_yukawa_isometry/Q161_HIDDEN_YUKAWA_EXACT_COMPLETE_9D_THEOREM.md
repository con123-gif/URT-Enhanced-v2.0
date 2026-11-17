# Newton's Cathedral — exact five-plus-four flavor-isometry theorem

17 November 2026. **THEOREM: complete conditional representation-level bridge from original hidden 4 and vertex 5 into 3×3 chiral Yukawa matrix space.** This is a *kinematic source-selection theorem*, not observed particle masses or a finished Standard Model action.

## Original geometry and definition

Retain the full upstream Cathedral Q101 geometry: five Platonic solids with 190 cellular cochains; its 50-vertex harmonic source/8-dimensional portal/12 icosahedral contacts; original 20 triangular faces; original hidden `4_3 ⊕ 4_5` and antisymmetric `W²=-15 P_hidden`; original H64 and 24-clock history structure. None are replaced by an invented 13-state model. The theorem uses the exact downstream icosahedral operators already constructed by Q101.

Let `C` be original unsigned 20×12 face–vertex incidence and `L` the original dodecahedral face Laplacian. Let `P3=(I−C(CᵀC)⁻¹Cᵀ)(5I−L)/2` and `P5=(I−C(CᵀC)⁻¹Cᵀ)(L−3I)/2` be the two rank-four hidden Hodge projectors. The genuine positive face-to-generation bridge `K=Cᵀ (P3 ⊙ P5) C` has rank-six eigenspaces `V_lo,V_hi` of dimensions 3 and 3, for eigenvalues `(5−2√5)/15` and `(5+2√5)/15`. Its induced `Hom(V_hi,V_lo)` is the full 9D real Yukawa space `3⊗3′=4⊕5`.

Define original vertex-local scalar Yukawa image `S(a)=V_loᵀ diag(a) V_hi` for any 12-vertex amplitude `a`. For each outward-oriented icosahedral face `f=(i,j,k)` define the **non-invented geometric face circulation**

`O_f = (e_i e_jᵀ−e_j e_iᵀ)+(e_j e_kᵀ−e_k e_jᵀ)+(e_k e_iᵀ−e_i e_kᵀ)`.

Define the new *canonical hidden chiral* map `T(h)=V_loᵀ[Σ_f h_f O_f]V_hi` for a genuine 20-face amplitude `h`.

## Exact theorem and proof

The exact three-by-three-space Hilbert–Schmidt Gram identities are:

`Sᵀ S = (3/20) P_vertex,5`

`Tᵀ T = (3/2) P_hidden,4_3`

`Sᵀ T = 0`.

`SᵀS=Plo ⊙ Phi` was checked **exactly** using the original quadratic golden-ratio projectors. For `TᵀT`, write each Gram entry as `Tr(Phi O_fᵀ Plo O_g)`; exact symbolic evaluation of all 20 entries of the row for face `f=0` equals `(3/2)(P3)_{0,g}`. Proper A5 acts transitively on the 20 faces, preserves outward orientation and both projectors; therefore this equality determines all 400 Gram entries. Similarly all 12 exact vertex-face overlaps for `f=0` vanish, hence `SᵀT=0` by A5 face transitivity. The two maps have disjoint ranks 5 and 4, spanning nine dimensions.

Consequently, the **normalized, parameter-free combined source map**

`U_flavor = ( sqrt(20/3) S |_(vertex 5) ) ⊕ ( sqrt(2/3) T |_(hidden 4_3) )`

is an isometric isomorphism **from native 5⊕4 to the entire 9-dimensional real Yukawa matrix space**:

`U_flavor† U_flavor = I_5 ⊕ I_4` and `U_flavor U_flavor† = I_9`.

The original Hodge `W` supplies the second hidden quartet by `T W P_hidden,4_5 / √15`; its Gram is `(3/2)P_hidden,4_5`. Thus *both* original hidden 4s have an unambiguous geometrical route into the missing Yukawa 4, using the already-established signed operator, not a fitted coefficient. The image of the 4 channel is independent of whether it comes from `4_3` or `4_5`.

## Original 30-history source and physical testing

For each of the 30 true frustrated ground outer-contact words at fixed centre orientation, take original Q101 face amplitude `f_s=(C P_linear s)²`, with `P_linear=P_3vertex+P_5vertex`. Original five-channel source is `Y5_s=S(Cᵀ f_s)`; the hidden channels are `Y43_s=T(P3 f_s)` and `Y45_s=T(W P5 f_s / √15)`.

All 30 proper-A5-related ground states have the same measured-from-source squared Hilbert–Schmidt norms (local independent numerical precision ~1e−14):

`||Y5||²=276/125`, `||Y43||²=48/5`, `||Y45||²=16/5`, `〈Y43,Y45〉=0`.

The old vertex-only `Y5` gives singular values `[0.281377674,0.881377674,1.162755348]`. If assigned to charged-lepton Yukawas with a common scale it gives `m_e/m_mu=.31924756` and `m_mu/m_tau=.75800784` and (when up/down matrices are proportional) trivial CKM, contrary to established particle data. It cannot by itself be the complete physical mass law. A5-average of the 30 original source words obeys `<Y5>=0`, `<Y5†Y5>=92/125 I3` exactly by A5 Schur symmetry. A separate check of the original A5-equivariant 444-state centre-current NESS gives `<Y5†Y5>=.73714657923 I3`: the centre bias alone does not split generation masses.

**Constructive physics outcome:** the missing non-diagonal 4-plet flavor channel is now derived from the original hidden Hodge sector, giving an exact fully populated 9D source *space*. This is stronger than adding a free 3×3 matrix and resolves a representation-level missing operator. It does **not yet** fix the dynamics-dependent relative amplitudes and phases of the available 5, 4_3 and 4_5 channels, select SU2 up/down chiral Yukawas, or predict experimental masses, CKM or CP. The finite Q125 centre-bias alone cannot provide that selection because its rates are still A5 equivariant.

## Executable proof and verification

The local symbolic proof `q161_exact_hidden4_yukawa_short.py` executed with exit 0 in ~2.8 seconds: all 20 exact representative face Gram entries, vertex fiveplet Gram, 12 exact face–vertex cross terms. The full independent numerical `Q161_EXACT_HIDDEN4_TO_YUKAWA_PHYSICS_CERT.py` executed with exit 0, checked full A5 proper automorphisms, all 400 Gram entries, 30 physical-source words, the W-partner, and mass-ratio consequences. Its JSON results accompany this report. The GitHub CI status must be reported separately after registering the source.

**RESUME HERE — physics, not more generic matrix tests:** derive the *relative 5 : 4_3 : 4_5 weights and relative complex phases from the existing H64/24-clock/KMS transfer*, followed by electroweak sector-specific contractions of the original Q96 Hopf vertex. Calculate the actual 3×3 up, down, lepton and neutrino mass operators before comparing their eigenvalues, CKM or PMNS with experiment. Do not fit those weights to the observed data. Do not declare the theory completed before it passes.