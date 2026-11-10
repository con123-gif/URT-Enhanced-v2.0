# Exact antipodal C3 and holonomy-resolved 24-clock pairing theorem

**10 November 2026; new original, no-fit analysis.** This extends the original A5-symmetric third-cumulant source theorem and the native face-edge and edge-distance-two pairing maps. The full five-Platonic 190-cochain architecture (14+26+26+62+62), 64 signed histories, hidden 4_3 and 4_5, and H13⊕H51 carrier are inherited. The *new* exact calculation concerns the nearest-neighbour 30-edge pair submodule of Sym²H13, not the complete physical fermion action. Neither the historical four ARFs nor any fitted mass or coupling enter.

## The new parameter-free geometric operator

Let Pi be the archived 30×30 A5-equivariant bijection from nearest-neighbour edges to distance-two pairs and R the archived 30×30 antipodal cross-incidence. Let A_e be the antipodal involution on the 30 edges and P_even=(I+A_e)/2. Define

**V=(Piᵀ R)/2** on the 30-edge space.

Exact integer matrix multiplication gives

- (PiᵀR)(PiᵀR)ᵀ = 2(I+A_e);
- (PiᵀR)^3 = 4(I+A_e);
- **VVᵀ=VᵀV=P_even, Vᵀ=V², V³=P_even.**

The 30 edges form 15 antipodal pairs. V induces an honest permutation of those 15 classes consisting of **five disjoint 3-cycles**. No new geometric weight or period was fitted or imposed: the factor 1/2 is the partial-isometry normalization of the already archived integer incidence maps. V commutes with the proper 60-element A5 action because Pi, R and antipodal pairing do.

Its complete complex spectrum is

**spec(V)={0 (15), 1 (5), exp(2πi/3) (5), exp(-2πi/3) (5)}.**

With the archived normalized hidden embeddings T_e3=D P3/√3 and T_e5=D P5,

**V T_e3=0, V T_e5=T_e5.**

Even more strongly, the *entire* fixed projector is

**P_fixed=(P_even+V+V²)/3=J_30/30 + T_e5 T_e5ᵀ.**

Thus the exact five-dimensional spatial fixed space is the uniform A5 singlet plus precisely the 4_5 hidden quartet. The 4_3 quartet is annihilated by V. The remaining two five-dimensional eigenspaces carry the nontrivial cube roots. This is a constructive symmetry selector on the existing pair geometry, **not** evidence that the original physical action chooses V.

## Gauge-covariant 24-clock lift

Under the explicitly conditional assumption that the relevant H13 Weyl pair has temporal diagonal charge q=2, define the covariant eight-link shift

(T_8(theta)f)_t = exp[-2i Σ(j=0..7) theta_(t+j)] f_(t+8), indices mod 24.

The eight-step interval is 24/3, matching the independently obtained spatial order-three operator. Let Theta=Σ(t=0..23)theta_t and define the auxiliary pairing transport on C^24⊗C^30:

**U_theta = T_8(theta) ⊗ V**,  **P=I_24⊗P_even**.

Exact identities:

**U_theta†U_theta=U_theta U_theta†=P, U_theta³=exp(-2iTheta) P.**

For local phases lambda_t and theta_t→theta_t+lambda_(t+1)-lambda_t, U_theta transforms by conjugation with G_lambda=diag(exp(2i lambda_t))⊗I_30. Thus its spectral data and the quadratic conditional pairing functional are gauge-covariant.

Its full 720-dimensional characteristic polynomial is

**det(zI_720-U_theta)=z^360 (z³-exp(-2iTheta))^120.**

Proof: the odd antipodal edge subspace is a 360-dimensional kernel. The even subspace is 360-dimensional, U³ is the scalar holonomy there, and tr U=tr U²=0. Each of the three cubic roots consequently has multiplicity 120. On the 4_5 source subspace (dimension 24×4=96) each nonzero root has multiplicity **32**. The 4_3 source subspace (also 96 dimensions) is in the kernel.

## Exact conditional resolvent and residues

Let z be an arbitrary off-spectrum complex verification variable, not a physical energy. The complete resolvent is the *closed rational identity*

**(zI-U_theta)^(-1) = (I-P)/z + (z²P+zU_theta+U_theta²)/(z³-exp(-2iTheta)).**

For each root rho³=exp(-2iTheta), its residue is the rank-120 orthogonal projector

**E_rho = (P+U_theta/rho+U_theta²/rho²)/3.**

These satisfy E_rho²=E_rho=E_rho†, Σ_rho E_rho=P, tr(E_rho P_4_5)=32, E_rho P_4_3=0. Gauge covariance holds for the full resolvent and for the unordered set of residue projectors. The three root labels can permute under a holonomy winding; none is a uniquely selected physical mass.

**Typing warning:** These are poles of an explicitly constructed *auxiliary edge-pair transport resolvent*. They are **not** poles of the archived charged H13⊕H51 fermion propagator, and no physical photon residue or ARF follows.

## Complete first/second Ward contacts of this conditional term

For K_theta=U_theta+U_theta† and a charge-two composite-pair source b, define F=b†K_theta b. On a gauge orbit b'=2i Lambda b, b''=-4Lambda² b, K'=2i[Lambda,K], K''=-4[Lambda,[Lambda,K]], with Lambda=diag(lambda_t)⊗I_30. The first Ward derivative vanishes:

2 Re(b'† K b)+b†K'b=0.

The *full* second derivative is the sum of four distinct terms:

**2 Re(b''†Kb) + 2 b'†Kb' + 4 Re(b'†K'b) + b†K''b = 0.**

They are source acceleration, source quadratic contact, source–Wilson cross contact, and Wilson seagull. The executable checks them individually, the exact finite gauge orbit, and independent first/second link finite differences. The archived Gaussian Schur relaxation and existing fermionic contacts are **not silently claimed to be included** in this new conditional composite term.

## Verification and precise limit

An independent standalone reconstruction executed successfully: all five Platonic cochain counts, exact icosahedral incidence, both hidden quartets, all 60 A5 rotations, five antipodal 3-cycles, exact source K_ddd=3/128 regression, the 720-dimensional Wilson operator, closed resolvent and residue projectors, and all four Ward contacts. The shorter committed executable imports the archived original dual-pair and third-cumulant scripts and was tested locally against an independently reconstructed dual-pair adapter; a separate execution against the GitHub-hosted source after commit is not claimed.

**Proved:** an exact canonical antipodal C3 partial isometry; a 1⊕4_5 fixed sector; a conditional gauge-covariant 24-clock transport, its entire auxiliary spectrum/resolvent/residues, and its first/second Ward identities. **Not proved:** dynamical selection of this operator by the original pi/phi/e URT action, the charge/chirality embedding into the physical H13⊕H51 carrier, a uniquely normalized charged-matter interaction, the Schur-plus-fermion Ward-complete physical pole, or any of the four historical ARFs.

**Next theorem:** extract the actual physical charge-one Weyl pair operator and spatial Wilson anchoring from the archived microscopic_source_currents.py / charge registry, evaluate its matrix elements against P_fixed and the two other C3 sectors, and perform the Schur+fermion resolvent join with all Ward contacts. Only a pole of that joined physical operator can be compared with an ARF.

Reproduce in new_gate: OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python URT_ANTIPODAL_C3_CLOCK_MATTER_2026_11_10.py.
