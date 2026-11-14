# Q106 — Exact broken-charge Berry spectrum and the original v61 joined Wilson-sea curvature

**14 Nov 2026. NEW FINITE THEOREM + CONDITIONAL CHARGED COUPLING. Physical ARFs still open.** No measured parameter or historical four-ARF equation was used. The original URT action, old mass formulas and uniform tiny Peierls law are *revisable* and do not constrain this derivation. A new **equal unit moving–spatial kinetic sum** is explicitly identified below as a modelling assumption.

## Provenance and exact input

Q98 recovered the missing 11 Nov symmetry-breaking instruction and old Library documents. Q101 reconstructs all five Platonic solids with 190 cochains, the 50→8→12 harmonic source, hidden 4₃/4₅ face projectors, native 64-history isometry, and 60 φ-centred frustrated ground states. Their minimal two-spin transitions split into two 30-state rectified icosahedron graphs, with the original full-five hidden signed current B. Q105 derives a **state-dependent charged16 Weyl-axis** Q_s=Y+n_s·T (n_s=φΣs_i v_i/4) and the shortest SU2 transport U_ab=(I+S_a S_b)/sqrt(2(1+d)), with d=(1−√5)/4 on each moving edge; it preserves the original Q96 charge spectrum and Ward identities. The physical origin of the shortest-transport and unit kinetic coefficients is NOT already selected. Q4 proves the v61 spatial lattice has no A5 order-five automorphism, so its site graph must not be identified with geometric icosahedral sites. The join below acts on **internal charge**, not a fake A5 Wilson-site map.

Previous original actual Wilson source: \`research_archive/2026-10-17_original_oct08_source/canonical_sources/Cathedral/Newton_Cathedral_Full_v61.py\` (48 sites ×4 spinor =192 Hermitian operator, 528 links); \`research_archive/2026-10-17_original_oct08_source/common_action_work/matter/microscopic_source_currents.py\` defines its exact filled-sea contact and current-current formula. The earlier \`ACTUAL_A4_WILSON_PILOT_RESULT.md\` establishes TrQ96²=32 but does **not** evaluate the new broken-configuration spinor bands or their jointly shifted sea.

## Theorem 1: exact native spinor spectrum, without a fitted polynomial

Let n_a denote the 30 unit spontaneous directions in one minimum-energy branch. Write S_a=n_a·σ and let Hspin on C³⁰⊗C² have SU2 hopping U_ab=(I+S_a S_b)/sqrt(2(1+d)) on the actual 60 geometric moving edges, zero otherwise. Let

\[
s=\sqrt{2-2\sqrt5/5},\quad X=H_{\mathrm{spin}}/s,\quad \varphi=(1+\sqrt5)/2.
\]

Since sqrt(2(1+d))=(sqrt5/2)s, the exact edge block of X is

\[
X_{ab}={\varphi\over2}(I+S_a S_b)
={\sqrt5\over4} I+{i\varphi\over2}(n_a\times n_b)\cdot\sigma.
\]

Every coefficient now lies in the **exact algebraic field Q(√5)** in the quaternion basis (I,iσx,iσy,iσz), enabling exact arithmetic over rational fractions rather than numerical polynomial fitting.

Define

\[
\begin{aligned}
p_2(x)&=x(x-\sqrt5),\\
p_4(x)&=x^2+\varphi^2x+\tfrac38(\sqrt5-3),\\
p_6(x)&=x^3-x^2-(3+\sqrt5)x+\tfrac14(5+\sqrt5).
\end{aligned}
\]

**Exact polynomial theorem:**
\[
\boxed{p_2(X)\,p_4(X)\,p_6(X)=0.}
\]

The attached executable constructs the original 12-vertex nearest-neighbour graph, enumerates all 4096 spin configurations to select the 30 positive-magnetisation golden-centre minima, builds all 60 moving links and X, and verifies the *entire 30×30 quaternionic matrix identity*, every component, in **Fraction-based Q(√5) exact arithmetic**. Then the exact full 60-dimensional complex-spinor traces for k=0,1,2,3 are

\[
\operatorname{Tr}X^k=
60,\quad 0,\quad 150+30\sqrt5,\quad -15+15\sqrt5.
\]

The four squarefree irreducible/split factors 0, x−√5, p4, p6 are pairwise coprime. Their root power sums and these four trace moments give exact full-spinor multiplicities 4,4,8,12 per root/factor. The antiunitary SU2 quaternionic time reversal maps positive and negative spin bands and guarantees equal spectra. Therefore one moving **charged weak band** has the **exact 30-state characteristic polynomial**

\[
\boxed{\det(xI_{30}-X_+)=p_2(x)^2p_4(x)^4p_6(x)^6.}
\]

This is a newly derived finite *charged* spectrum, fundamentally different from Q101's earlier uniform tiny phase magnetic adjacency spectrum. Its seven levels have multiplicities 4,6,2,4,6,2,6 when sorted numerically. The zero level is exact. This new polynomial is not an old ARF mass polynomial and is not labelled a physical charged-particle mass.

## Theorem 2: exact 96-state electric charge moments

The original three-generation, conjugate-paired Weyl registry has electric-charge values and multiplicities

\[
q\in\{-1,-2/3,-1/3,0,1/3,2/3,1\},\quad
m=(6,18,18,12,18,18,6).
\]

All odd moments vanish and, for integer k≥1,

\[
\boxed{M_{2k}=\mathrm{Tr}_{96}(Q^{2k})=
12+36{1+2^{2k}\over3^{2k}}.}
\]

Specifically M2=32, M4=176/9, M4/M2=11/18, M6=1232/81. All are exact representation invariants, not fitted outputs. For a **charge-sector replicated** v61 filled-sea functional F96(t)=Σ_q m_q Esea(qt) about zero gauge field, every Taylor derivative satisfies F96^(n)(0)=M_n Esea^(n)(0) where these derivatives exist. This is a **conditional, diagonal Wilson charge replication**, not the interacting total-sea response of the moving Hamiltonian.

## Theorem 3: a genuine joined 30×96×192 filled-sea response, computed without a giant matrix

Specify ONE conditional kinetic completion on the *actual charged Weyl registry*, each geometric configuration a, and original spatial Wilson spinor:

\[
\mathbb H(A)=
H_{\mathrm{move,charged}}\otimes I_{192}
+\sum_{a=1}^{30}|a\rangle\langle a|
\otimes\sum_q P_{a,q}\otimes h_{\mathrm{v61}}(qA).
\]

Its full Hilbert dimension is 30×96×192 = 552,960. The moving blocks are the *actual geometric shortest SU2 transport* and identity on right-handed singlets; no invented 192 Wilson matrix or fake 48-site A5 action. Because P_{a,q} U_ab=U_ab P_{b,q}, every moving block commutes with the **state-dependent local spatial-gauge transformation** G_a(ω)=Σ_q P_{a,q}⊗ diag_x[e^{iqω_x}]⊗I4. The original h_v61(qA) is individually spatial-gauge covariant; therefore the **whole joined Hamiltonian** is covariant, and its exact first and second Ward current/seagull operators follow from differentiating that single conjugation identity. Q105 verified the corresponding native Wilson Ward derivatives separately; Q106 checks each native moving charged link's gauge intertwining.

The equal unit coefficients of H_move and h_v61 are **model premises**: nothing yet proves that the complete π–φ–e dynamics selects them. The moving term now modifies the true filled-sea occupancy, so **the naive 32×Wilson curvature is not the joined answer**.

For the precise closed spatial xy plaquette at t=0,z=0, on the native 48-site/528-link Wilson lattice, the actual original 192-filled-sea one-copy curvature is

\[
K_0=K_\text{contact}+K_\text{para}
=0.3181063329621053-2.6683413620433596
=\boxed{-2.3502350290812544}.
\]

The original v61 sea has 96 negative and 96 positive states with minimum gap 0.8255933138; the seagull and current operators reproduce finite differences of h_v61 itself. Thus replicated charge-sector curvature M2 K0 = −75.2075209306001, an **internal one-configuration diagnostic**, not alpha.

Diagonalising the moving band exactly from Theorem 1, and using the ordinary 30-state unsigned adjacency eigenvalues for the eight right singlets, the joint zero-field occupied energies are **Kronecker sums** μ_moving+e_Wilson. For each μ let K_v61(μ) be the original current+seagull sea Hessian with occupation determined by e_Wilson+μ<0. Because current J_v61 is diagonal in moving eigenstates, its second derivative separates by μ with no inaccessible 552,960×552,960 inversion. The full 96-state q² traces split equally: **16 on weak doublets** and **16 on singlets**, including 3 generations and charge conjugates. Therefore

\[
\boxed{K_\mathrm{joint}
=16\sum_{\mu\in\operatorname{spec}H_{\mathrm{weak}}}K_{\mathrm{v61}}(\mu)
+16\sum_{\mu\in\operatorname{spec}A_{30}}K_{\mathrm{v61}}(\mu).}
\]

The spectral sums (30 eigenlevels including multiplicity each) are

\[
K_\text{weak modes}=-27.744460751340064,\quad
K_\text{singlet modes}=-18.897779696194874,
\]

hence

\[
\boxed{K_\mathrm{joint}=-746.275847160559}
\quad\text{(or }-24.8758615720186\text{ per moving configuration)}.
\]

Compare naive uncoupled 30×M2×K0=−2256.225627918: the moving occupied sea changes the response ratio to 0.330762951154493. Minimum distance of any joined zero-field level from zero is 0.0090333917, so the local second derivative is well-defined. Direct independent finite differences of the *full charge-typed Kronecker-sum occupied spectrum* at t=0.001,0.002,0.004 reproduce the joined curvature within 0.001, without allocating a 552,960-dimensional matrix.

**CRITICAL SIGN/SCOPE:** These negative numbers are the derivative of the **specified finite negative-eigenvalue filled-sea energy**. They are not automatically the positive physical Euclidean Maxwell stiffness, let alone α^-1. Other dynamical sectors, renormalization, source normalization, physical clock and primitive selection of the moving–spatial kinetic relative coefficient remain required. The native Wilson regulator fractions r and M are sourced from v61, not derived afresh from π–φ–e. Never add bare Maxwell coefficients just to match a desired experimental number.

## Execution and evidence

\`\`\`
python research_archive/2026-11-14_q106_exact_berry_wilson/Q106_EXACT_BERRY_SPECTRUM.py
python research_archive/2026-11-14_q106_exact_berry_wilson/Q106_JOINED_NATIVE_WILSON.py
\`\`\`

The exact Fraction/Q√5 quaternion proof was executed locally and passed. The whole-five/H64/charged/joined numerical checker was executed locally with a *direct transcription of the named native v61 interface*, explicitly **reference-only**, and passed; it is now registered to import **the actual unchanged archived v61 source** on GitHub CI and must not be described as native CI PASS before that run. No Q101 or other protected original source overwritten. Full GitHub CI pending.

**RESUME HERE:** complete the physical source selection by deriving relative moving/spatial kinetic weights and the electromagnetic Gauss-law/continuum source from the whole 190/64/24 plus charged-sector transfer. The exact 30 charged-band polynomial and its joined v61 curvature supply concrete computed inputs, not free target ARFs. Reconcile all pending CI results before proceeding.