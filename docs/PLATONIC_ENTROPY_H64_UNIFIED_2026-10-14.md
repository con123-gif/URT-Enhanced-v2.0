# Newton's Cathedral — complete finite Platonic / URT-vortex integration
**14 October 2026 — conversation-first continuation; no observational fitting**

## Result 1: all five Platonic incidence sectors
For the vertex/face incidence C, the (vertex, face) kernel nullities are tetrahedron (0,0), cube (4,2), octahedron (2,4), dodecahedron (8,0), icosahedron (0,8). Five inscribed cubes are found by searching antipodal four-axis cliques in the 20 dodecahedron vertices. The five 4D cube-kernel projectors P_j obey Tr(P_j P_k)=5/8 for j!=k and their mean obeys exactly
  Pbar=(P_4_3+P_4_5)/4 +(2/5)P_5;
  spec(Pbar)={0 x7, (1/4) x8, (2/5) x5}.
The 8D quarter-weight eigenspace is **exactly the dodecahedron incidence kernel ker(C^T)**. Its 13D combined span is 4_3+4_5+5, while its 7D complement is 1+3+3prime. Note that the dodecahedral 13D composite is NOT the same A5 representation as the centred icosahedral 13D visible carrier, which is 2(1)+3+3prime+5; they connect through the actual dual incidence map and nonlinear products.

## Result 2: the old entropy generator is the actual graph Laplacian
Let L_dod=3I-A_dod be the ordinary 20-vertex dodecahedron Laplacian, P8 the projector onto ker(C^T). Five inscribed tetrahedral alternations make a regular 4-simplex (Gram diag 1, offdiag -1/4), whose four-dimensional span is P_4_3. The orthogonal hidden quartet is P_4_5=P8-P_4_3. Direct numeric identity:
  ||P8 L_dod P8 - (3 P_4_3 +5 P_4_5)||_F < 5e-15.
Hence L_hidden=3 P_4_3+5 P_4_5 is **derived from the Platonic graph**, rather than an independently postulated spectral seed. Using the frozen rail gap Delta=3/20-80 pi/(1053 phi) and eta=-ln Delta gives
  rho_star=exp(-eta L_hidden)/Tr_hidden exp(-eta L_hidden)
          =(P_4_3+Delta^2 P_4_5)/(4(1+Delta^2)),
  p5=Delta^2/(1+Delta^2)=6.196027670655e-6,
  chi_BKM=8 eta (1+Delta^2)/(1-Delta^2)=47.9669783033801.
The normalized Gibbs-state match is ~1.3e-15. No second entropy normalization has been inserted. Delta itself retains its prior rail construction; this computation does NOT newly derive the rail gap.

## Result 3: hidden-to-visible dual nonlinear contact
The dodecahedron's 12 pentagonal faces are the dual icosahedron's 12 vertices. Its 20x12 incidence C satisfies, exactly,
  C^T C=5 I_12 +2 A_ico,
where A_ico is the 5-regular icosahedral adjacency; its squared singular values are
  15 (x1), (5+2sqrt5) (x3), 3 (x5), (5-2sqrt5) (x3).
Linear contacts C^T P_4_3 = C^T P_4_5 =0. But pointwise multiplication (with its canonical tensor-product inner product) has:
  C^T Sym^2(4_3) → 1+5, exact rank 6;
  C^T (4_3⊗4_5) → 3+3prime, exact rank 6;
  combined shell rank 12/12.
The unprojected quadratic product maps into 1+4_5+5 (not back to 4_3), and the mixed product into 3+3prime+4_3. This is a parity-selection rule, not just dimensional matching. The centred L13 graph with centre-to-shell weight 1 has spectrum {0, (6-sqrt5) x3, 7 x5, (6+sqrt5) x3, 13}; its positive heat semigroup maps the quadratic shell singlet to a nonzero central response.

Define Se=C^T Sym^2(4_3) with sqrt(2) on off-diagonal tensor basis vectors, So=C^T(4_3⊗4_5), and the **geometric source-map Gram** K=Se Se^T+So So^T. This PSD matrix has EXACT eigenvalues:
  3 (x1), 3/25 (x5),
  (5+2sqrt5)/15 (x3), (5-2sqrt5)/15 (x3).
The triplet response eigenvalue ratio is (5+2sqrt5)/(5-2sqrt5)=9+4sqrt5=phi^6=17.944271909999, with residual <1e-14. BEFORE applying incidence projection, the two triplet parts of the hidden mixed product have equal strength. The golden asymmetry is thus created by the dual geometric contact. These are canonical **finite contact strengths**, not measured SM gauge couplings.

## Result 4: vortex doubling becomes actual composite-hidden automorphism
Five cube labels form an A4 simplex; doubling j→2j mod5 is a 4-cycle on the nonzero labels, conjugates a 5-cycle R to R², and reverses the orientation of each 4D hidden simplex. Reconstruct the 20 dodecahedral vertices as oriented triples of five cube labels under A5; this gives an explicit 20x20 *permutation* D with D^4=I, which transports each one of the five cube projectors to another. It normalizes the 60 rotations and enlarges their combinatorial group to 120 elements (S5). Direct verification: ||D Pbar D^T-Pbar||_F <1e-14, and D separately preserves both 4_3 and 4_5 projectors. D exchanges A5 triplets 3↔3prime under its outer automorphism and hence exchanges the two Hodge-handed rotational triplets of End(R4)=1+(3+3prime)+(4+5)=1+6+9. The bracket selection [9,9]⊂6 shows how two symmetric distortions can make an antisymmetric rotation generator.

Critical distinction: D **does not preserve the spatial dodecahedral adjacency**, ||D L_dod-L_dod D||_F≈10.95445115. It nevertheless **commutes with the hidden-restricted L_hidden and rho_star** (rho residual <3e-21) and with the five-cube composite-incidence kernel. Thus the larger 120-element symmetry belongs to the **combinatorial hidden overlap**, not ordinary SO(3) spatial rotations.

The optional digital-root doubling mod9 has the distinct 6-cycle 1→2→4→8→7→5 and pair 3↔6, zero fixed; its joint period with the mod5 4-cycle is 12. This is an optional clock, NOT a forced identity with the icosahedral twelve shell vertices. The exact 1+6+9 response decomposition is numeral-base independent. The unsourced "Tesla 3-6-9" quotation plays no role in proof.

## Cathedral insertion: without replacing URT or fitting a new master transfer
raw history → canonical URT spiral/metaplectic selection → selected positive T_star=B_star†B_star → Platonic dual cube-incidence carrier → L_hidden(3,5) → existing rho_star and dual Kubo–Mori stiffness → even/odd nonlinear contacts → complete 12-shell and 13-centre transfer → finite gauge/curvature response. One compatible polar contact is C_step=(U_URT⊗D_hidden) B_star, so C_step†C_step=B_star†B_star; this **algebraic compatibility** does not prove that the later physical B_star actually implements D.

Retain H64 results: full 64-state Walsh representation is 4(1+3+3prime+4+5), with four hidden quartets; in the recovered dated v113 Gram-test branch its nonzero positive hidden-four return has trace 0.00020907943517 (11.5264% instantaneous return), and four-quartet degree-layer mixing is nonzero. Do NOT identify its four isotypic copies uniquely with the two newly geometry-selected dodecahedral quartets without a physical intertwiner. The older v113 Jacobian/Gram-test is not the fully species-loaded T_star.

**Status:** exact finite geometry, group action, entropy eigenspaces, nonlinear rank/composition and geometric positive source spectrum; not proof of emergent Einstein equations, particle identities, Standard Model gauge couplings, physical gravity or observed vortex flows. No new broad no-go and no retirement of previously frozen URT/spin/entropy sectors.

## Executable checkpoint
The full standalone 299-line verified calculation is attached in the conversation as cathedral_full_platonic_integration.py alongside cathedral_integrated_platonic_actual.npz. Earlier repository scripts for the H64 test and the A4 doubling clock remain in research_archive/2026-10-14_hidden4/ and research_archive/2026-10-14_platonic_vortex/.
