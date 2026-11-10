# Newton's Cathedral / URT — exact face-to-edge A5 quartet completion

**10 November 2026. Original add-only theorem, no fitted parameters, no historical ARF inputs.** This continues the archived A5-symmetric third-cumulant theorem and original all-five-Platonic 190-cochain source, 64 signed histories, 24-clock, hidden 4_3/4_5, and H13⊕H51 research. The standalone test reconstructs the icosahedral face/edge and H13 pairing representations; the full original 190+64 action is *inherited*, not independently re-executed here. The geometric-history dictionary and any physical matter identification remain explicit hypotheses.

## 1. Exact, complete native face-to-edge intertwiners

The original icosahedron has 12 vertices, 30 edges and 20 triangular faces. Let C be the native unsigned 20×12 face–vertex incidence and D the unsigned 30×20 edge–face incidence, with D[e,f]=1 precisely when e bounds f. Let L_F=3I_20−A_F be the dual face Laplacian. The combinatorial identity

**D†D=3I+A_F=6I−L_F**

holds exactly. The archived hidden rank-four orthogonal projectors P3 and P5 satisfy L_F P3=3P3, L_F P5=5P5 and P3P5=0. Therefore

**T3=D P3/√3, T5=D P5**

are canonically normalized **partial isometries** from the two hidden face quartets into the 30-edge space:

T3†T3=P3, T5†T5=P5, T3†T5=0.

The stronger, independently verified identity is

**Π4(edge) = T3 T3† + T5 T5† = D P3 D†/3 + D P5 D†**,

where Π4(edge) is the complete A5 quartet isotypic projector on the 30 nearest-neighbour edges. Proof: the 30 edges form one A5 orbit with stabilizer C2; the 4-character is (4,0) on C2, so the edge representation has exactly (4+0)/2=2 copies of the quartet (dimension eight). The two orthogonal isometric rank-four images are A5 intertwiners and exhaust this space. Independently, the full 60-rotation integer central projector M/15 obeys M²=15M, Tr M=120 and equals the stated incidence projector *entrywise*. Separate floating eigenspaces of the dual Laplacian recover the two normalization factors 3 and 1.

This is an explicit no-fit **geometric map into nearest-neighbour charged Weyl-pair flavor space**; it does not derive the dynamical Yukawa coupling or its physical normalization.

## 2. Exact spatial localization of all H13 quartet pairings

Under the explicitly conditional hypothesis of uniform charge-one Weyl flavors, a Lorentz-scalar spin-singlet flavor pair lies in Sym² H13 (dimension 91), with H13 = one center + twelve icosahedral sites. Its four A5 quartet copies (16 dimensions) localize as follows:

| Unordered pair orbit | Number of pairs | Quartet copies | Quartet dimensions |
| --- | ---: | ---: | ---: |
| On-site, including center | 13 | 0 | 0 |
| Center–vertex | 12 | 0 | 0 |
| Nearest-neighbour edges | 30 | 2 | 8 |
| Distance-two vertex pairs | 30 | 2 | 8 |
| Antipodal vertex pairs | 6 | 0 | 0 |
| **Total** | **91** | **4** | **16** |

The 30-pair orbits have C2 stabilizers, each giving two quartets. The 12-site permutation module is 1⊕3⊕3′⊕5, and antipodal pairs form 1⊕5, so neither contains 4. A new independent integer 91×91 central projector check gives M²=15M, Tr M=240, with the five exact block ranks (0,0,8,8,0).

**Selection:** A native charge-two hidden 4 cannot couple A5-equivariantly to an on-site H13 Weyl singlet. Its shortest-range representation-compatible pairing is on an icosahedral edge; the original D supplies **both** nearest-neighbour quartet copies. The existence of this pairing does not prove a nonzero coupling in the original action.

The earlier *additional* dark-orbit face-normal composites carry A5 irreps 5 and 3′, not a bare 4. In contrast, the 12-site on-site pair space contains precisely one 5 and one 3′. Exact 12-site Laplacian projectors V5 and V3′ were reconstructed and checked. They supply a separate **conditional on-site pairing route for the dark tensor composites**. The original bare h3 and h5 still vanish on the 24 dark histories: the edge embedding alone does not activate those histories.

## 3. Conditional charge-two 24-clock Schur response and Ward contacts

**Additional explicit hypothesis:** insert a charge-two edge-pair source into the existing native Gaussian history channel using T3† and T5† with the inherited source weights 1 and Δ. This insertion is **not derived from the original physical fermion action**. The resulting exact conditional 24-clock × 30-edge kernel is

Kθ = (18I24+r²L2(θ))⁻¹ ⊗ (T3T3†) + Δ²(16I24+r²L2(θ))⁻¹ ⊗ (T5T5†),

where r=π/e, Δ=3/20−80π/(1053φ), φ=(1+√5)/2, q=2, and L2=D2†D2 with D2 f(t)=f(t+1)−exp(2iθ_t)f(t).

This is positive semidefinite and has rank 24×8=**192** out of 720. For holonomy Θ=Σ_t θ_t and m=0,…,23, its nonzero eigenvalues are

1/[18+r²λ_m(Θ)] (multiplicity 4), and Δ²/[16+r²λ_m(Θ)] (multiplicity 4),

where λ_m(Θ)=2−2cos((2πm−2Θ)/24). Thus the **conditional Gaussian source-supported kernel has no massless pole**; its 528 null directions are absent source response, not divergent propagator poles.

Under θ→θ+dλ and U=diag(exp(2iλ_t)), K transforms as K(θ+dλ)=(U⊗I30)K(θ)(U†⊗I30). The standalone code checks this at generic nonuniform phases and tests the full quadratic source functional. For each mass a=16,18, put A=aI+r²L2, s=A⁻¹b, Λ=diag(λ), q=2. With A′=iq[Λ,A], A″=−q²[Λ,[Λ,A]], b′=iqΛb, b″=−q²Λ²b, the complete second gauge-orbit Ward identity is

**−Re(s†b″) + ½Re(s†A″s) − (b′−A′s)†A⁻¹(b′−A′s)=0**.

The terms are respectively source acceleration, Wilson seagull, and Schur relaxation. Both analytic and independent finite-difference checks passed. Local charge-two Yukawa source/pair contacts are −2+2=0 at first order and −4+8−4=0 at second order. No spatially local gauge action, fermion-loop Ward identity, or H51-specific physical charge assignment is claimed: a spatially local U1 edge pair needs a properly anchored spatial Wilson transporter, whereas the archived native U1 is diagonal across spatial sites.

## Verification, falsification and remaining proof

The executable independently reconstructs 12 vertices, 30 edges, 20 faces, exact SymPy hidden projectors, 60 proper A5 rotations, full integer 91×91 central idempotent, exact incidence normalization, independent numerical Laplacian eigenspaces, exact on-site 3′/5 projectors, and the 24-clock Schur/Ward identities. The original five-solid total 14+26+26+62+62=190 is retained. The 64-history H64 isometry and original source construction are inherited from the archived exact theorems, not rebuilt here.

**Proved:** the face-edge quartet completeness identity, the full spatial locality classification, and the conditional Gaussian 24-clock Ward-complete response. **Ruled out:** an on-site A5-invariant Yukawa pairing of a bare hidden quartet. **Not proved:** a uniquely selected physical H13⊕H51 fermion vertex, its coupling strength, full spatial and fermionic Ward contacts, a physical pole/residue, or any of the four historical ARFs. No target ARF or fitted parameter entered.

**Precise next step:** derive the actual spatial Wilson-anchored edge-pair or dark on-site 5/3′ insertion from the original full 190+64+24 action with its physical H13⊕H51 charge/chirality operators; uniquely fix its normalization and compute the complete gauge-covariant fermion two-point/pole residue including every source, Wilson, Schur and fermion contact. A representation-compatible source is not yet a physical ARF.

Reproduce: `OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python URT_FACE_EDGE_QUARTET_PAIRING_2026_11_10.py`.
