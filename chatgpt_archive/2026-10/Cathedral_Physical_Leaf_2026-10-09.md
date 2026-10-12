# Newton’s Cathedral conserved leaf and common physical clock

9 October 2026. The conserved boundary leaf is retained and its positive transfer is constructed fibrewise. Its compatible external symplectic chart, exact A4 slicing, normal-memory source reduction and relative bare clock conditions are derived below. These results join the previously retained carrier, charge and entropy interfaces without identifying different clocks or discarding crossing interactions.

## 1. The recovered conserved four dimensional leaf

The original manifold reference and complete September v116 checkpoint give

\[
\dot b=0,\qquad I_b=\operatorname{pr}_{\mathcal B},\qquad I_b\circ F=I_b,
\]

\[
M_{b_0}=S^1_\theta\times\mathbb R^+_\chi\times S^1_\vartheta
\times\mathbb R_\tau\times\{b_0\}\cong T^2\times\mathbb R^2.
\]

Thus the source-designated base leaf has dimension four. When the independent label space has dimension one, the ambient base has dimension five. The literal labels are phase/frequency, amplitude/scale, coupling/orientation, cascade/progression and boundary parameter. The conserved boundary label is distinct from a breathing radius also named b, an internal retained projector, an A4 graph height and a complete history state advanced by a shift.

The historical affine map is

\[
F(u,x,\tau,b)=(u+\log\kappa,Ax+\Omega,\tau+1,b),\qquad
A=\begin{pmatrix}2&1\\1&1\end{pmatrix},\quad \kappa=\pi/e.
\]

Its boundary first integral remains valid. Its toral Anosov matrix belongs to the historical branch: eigenvalues \(\phi^{\pm2}\) cannot be the unit-modulus eigenvalues of the corrected October simultaneous rotations. The additional invariant \(u-\tau\log\kappa\) is an extra constraint if fixed; it does not replace the independent boundary label.

For an admitted nonlinear map, conservation of the entire label is the concrete condition \(F^b(y,b)=b\). Preservation of a single chosen leaf only requires \(F^b(y,b_0)=b_0\) on that leaf. These statements do not determine a laboratory time from a dimension count.

The [recovery proof](leaf_geometry_work/recovery/leaf_boundary_recovery_report.md) retains the original text and image bytes, the corrected current specification and the independently checked source identities. The [original image](leaf_geometry_work/recovery/URT_5D_Manifold_Reference.png) has SHA-256 `29b1062179c720734675d64e36114bd973279b59053d395b5f4c37b98b0f779f`.

## 2. A symplectic chart compatible with the corrected transport

Set \(\ell_\kappa=\log\kappa\), \(\alpha=2\pi/\phi^2\), \(u=\log\chi\), and \(e_\gamma=(\cos\gamma,\sin\gamma)\). The explicit dimensionless chart

\[
\Phi(\theta,\chi,\vartheta,\tau,b)
=(q=\chi e_\theta,\ p=\kappa^{-\tau}e_\vartheta,\ b)
\]

is a global diffeomorphism on each fixed leaf onto
\((\mathbb R^2\setminus\{0\})_q\times(\mathbb R^2\setminus\{0\})_p\).
Its inverse uses \(\chi=|q|\), the two circle angles and \(\tau=-\log|p|/\ell_\kappa\). A momentum reference radius would only change its coordinate unit. This constructed phase-space chart does not assign physical momentum or interpret \(\tau\) as laboratory time.

For \(\delta=\vartheta-\theta\), \(\rho=\chi\kappa^{-\tau}\), the pulled forms are

\[
\lambda=p\cdot dq=\rho(\cos\delta\,du+\sin\delta\,d\theta),
\qquad\omega=-d\lambda,
\]

\[
\omega=\rho\left[
\cos\delta(d\theta\wedge d\vartheta-\ell_\kappa du\wedge d\tau)
-\sin\delta(du\wedge d\vartheta+\ell_\kappa d\theta\wedge d\tau)
\right],
\]

\[
\frac{\omega\wedge\omega}{2}
=\ell_\kappa\rho^2\,d\theta\wedge du\wedge d\vartheta\wedge d\tau\ne0.
\]

Extending its canonical Poisson tensor by zero in the boundary direction gives rank four and \(\Pi\,db=0\). Every Hamiltonian flow of this compatible tensor preserves the label, including a Hamiltonian depending parametrically on b. A dissipative part retains it when its mobility likewise annihilates \(db\).

The corrected external map pulls back exactly to

\[
(\theta,\chi,\vartheta,\tau,b)
\mapsto(\theta+\alpha,\kappa\chi,\vartheta+\alpha,\tau+1,b).
\]

It conserves

\[
D=q\cdot p=\rho\cos\delta,\quad
L=q_1p_2-q_2p_1=\rho\sin\delta,\quad\{D,L\}=0,
\]

and has dimensionless Hamiltonian interpolation \(H_{\rm ext}=\ell_\kappa D+\alpha L\). Its vector field in the leaf chart is \((\alpha,\ell_\kappa,\alpha,1)\). Its metaplectic lift can be written

\[
(U\psi)(q)=\kappa^{-1}\psi(\kappa^{-1}R_\alpha^Tq),
\qquad U^\dagger(\hat q,\hat p)U=S_{\rm ext}(\hat q,\hat p),
\]

up to its sheet sign. The Weyl dilation generator \(-i\hbar(q\cdot\nabla+1)\) has spectrum of both signs; this unitary generator is kept separate from the positive heat Hamiltonian. Every invariant real quadratic is a linear combination of D and L, so an invariant positive oscillator energy is not supplied by this hyperbolic transport.

For a regular nonlinear map conserving both D and L, the local form is \(Q=e^\sigma R_\beta q\), \(P=e^{-\sigma}R_\beta p\). Symplecticity adds the exact condition

\[
dD\wedge d\sigma+dL\wedge d\beta=0.
\]

Locally on a fixed leaf, \(\sigma=h_D\), \(\beta=h_L\). Conserving D and L alone does not supply that condition. The [independent algebra proof](leaf_geometry_work/recovery/algebra/urt_external_invariant_algebra.md) also separates global spiral-quotient circle invariants from a lifted real angle expression and from the independent boundary label.

## 3. The conserved positive transfer on each leaf

Represent a continuous boundary label by

\[
\mathscr H=\int^\oplus\mathscr H_b\,d\mu(b).
\]

When the local Hamiltonian entries act on field and graph variables within each boundary sector, they form a measurable self-adjoint family \(H_b\). Let the repaired selector \(W_{\delta,b}\) and Gauss constraint \(P_{G,b}\) be fibre operators too. With the required lower bound and heat domains,

\[
B_b=e^{-aH_b/2}W_{\delta,b}^{1/2}P_{G,b},\qquad
T_b=B_b^\dagger B_b
=P_{G,b}W_{\delta,b}^{1/2}e^{-aH_b}W_{\delta,b}^{1/2}P_{G,b}\ge0.
\]

This closes conserved-sector positivity in the typed registry with the same transfer step a. It needs no extra entry coefficient. Admitted sources that remain decomposable preserve it. Equivalently, bounded factors commute with all label multiplication projections; unbounded Hamiltonians strongly commute with that algebra, including their spectral and domain conditions.

For a non-atomic \(\mu\), the singleton multiplication projector \(\mathbf1_{\{b_0\}}\) is zero. A single leaf is a fibre/superselection sector, rather than a nonzero orthogonal projection onto that singleton in the full direct integral. Choosing an exceptional fibre additionally requires a stated representative or continuity prescription. This qualification preserves the recovered leaf and makes its operator restriction precise.

Internal history projections obey separate tests. For any bounded B and orthogonal P,

\[
PB^\dagger BP=(PBP)^\dagger(PBP)+(QBP)^\dagger(QBP),\quad Q=I-P.
\]

Positive compression is automatic; equality with the compressed-factor Gram requires \(QBP=0\). Reduction of the transfer does not require an independently chosen polar unitary to reduce. For a moving frame the leakage test is \((I-P_{k+1})B_kP_k=0\). The literal internal signed \(U_{64}\) leaks out of a fixed retained \(P_{13}\), while \(P_k=U_{64}^kP_{13}U_{64}^{-k}\) is transported exactly and returns after twelve phases. Neither statement substitutes an internal carrier frame for the base boundary leaf.

The [compression proof](leaf_geometry_work/review/leaf_compression_lemma.md) and [normal-memory proof](leaf_geometry_work/review/normal_memory_source_report.md) retain the source contacts and strong-commutation requirements. Internal normal memory can remain entirely inside a conserved b-fibre.

## 4. Exact A4 slicing with crossing interactions retained

On the integral A4 lattice \(\sum_{i=0}^4n_i=0\), choose height \(h=n_4\). A unimodular adapted basis is \((e_0-e_3,e_1-e_3,e_2-e_3,e_4-e_3)\). Height slices are A3 lattices: six spatial root links and eight translated spatial triangles. Four links and twelve translated triangle types cross slices. The spatial cell volume is 2 and the normal spacing is \(\sqrt5/2\), whose product is the A4 volume \(\sqrt5\).

This height is a coordinate of the four-coordinate graph, conditional on its embedding within the fixed-b base leaf. It is not the conserved boundary label. The old staggered square/triangle reflection construction is retained in its own action; its time reconstruction is not automatically inherited by this root-height foliation.

For the induced eight-triangle spatial action,

\[
\operatorname{spec}K_{A_3}
=\{0,(4-|S_4|)\times2,(4+|S_4|)\times2,8\},\quad
S_4=1+\sum_{\mu=0}^2e^{iq_\mu}.
\]

All \(13^3=2197\) modes obey the formula. At zero momentum rank is three; at all 2196 nonzero modes rank is five. Freezing crossing links in the full action instead gives exactly

\[
K_{ss}^{\rm full}=K_{A_3}+2I_6.
\]

Its pure spatial gauge gradient acquires energy, with maximum lattice Ward norm 7.99916. The literal full-face hat weight restricted by freezing crossing links similarly includes extra link hats: a checked pure gauge has induced spatial weight 1 but frozen full weight about \(4.06\times10^{-18}\). Deleting crossing faces defines a different induced action; freezing their links is not an inherited gauge-invariant restriction.

Honest static crossing Schur elimination restores the Ward null. The crossing block itself has a gapless band \(4-|S_4|\), so a uniform fast-normal approximation cannot be inferred from the root labels. The complete one-slice Gaussian source marginal retains all \(13^4=28561\) bulk modes. With \(P_s\) extracting six spatial links and \(M_8\) their spatial curl matrix,

\[
C_{\rm slice}(q)=\frac1{13}\sum_{p_h}P_sK_{\rm full}(q,p_h)^+P_s^\dagger,
\quad C_{\rm face}=M_8C_{\rm slice}M_8^\dagger,
\]

\[
K_{\rm leaf}=M_8^\dagger C_{\rm face}^+M_8.
\]

Gauge nulls and global flat modes use the stated Gaussian quotient. At external squared frequency t, the full inverse is first evaluated as \((K_{\rm full}+tI)^{-1}\) on that physical quotient. If \(C_{\rm face}(t)=C_0-tC_2+O(t^2)\), then on the common source support

\[
\partial_tK_{\rm leaf}(0)=M_8^\dagger C_0^+C_2C_0^+M_8.
\]

The complete marginal has maximum Ward error \(5.20\times10^{-15}\). At spatial integer mode (1,0,0), its transverse static coefficient divided by \(|q|^2\) is 5.40307 and its external-clock coefficient is 5.66940; the induced action instead gives 0.986665 and 1.99035. Independent finite-frequency differences verify the marginal clock derivative to relative errors below \(1.11\times10^{-10}\). Thus integration, freezing and action deletion are quantitatively different operations.

The induced A3 action has leading magnetic coefficient 1 and external-clock electric coefficient 2 per spatial volume, giving inherited \(c_\gamma^2=1/2\). Decomposing the full four-dimensional Euclidean face action by geometric height instead gives equal electric and magnetic coefficients \(\sqrt5/2\). The latter is a geometric-time candidate; a positive time transfer along that coordinate requires its own reconstruction. The [complete slicing calculation](leaf_geometry_work/gauge/a3_height_foliation_report.md) records both constructions and the retained crossing matrices.

## 5. Exact root symbols and a single bare cone condition

The full n-vertex simplex positive roots obey \(\sum_{\rho>0}\rho\rho^T=nI_{n-1}\), with root length \(\sqrt2\). The full A4 action has n=5; the induced A3 has n=4. Restricting full A4 momentum to a spatial tangent keeps all ten roots and constant five, whereas deleting the four inclined roots gives the induced constant four.

For the Spin-covariant unit root Clifford direction \(\Gamma_\rho=\gamma\cdot\rho/\sqrt2\), the rederived Wilson symbol is

\[
D_W=-M+rs+i\gamma\cdot v,\quad
s=\sum_{\rho>0}(1-\cos(q\cdot\rho)),\quad
v=\frac1{\sqrt2}\sum_{\rho>0}\rho\sin(q\cdot\rho).
\]

With \(h=\gamma_5D_W\),

\[
h^2=\bigl[(-M+rs)^2+|v|^2\bigr]I,
\]

\[
E_f^2=M^2+(n^2/2-nMr)|q|^2
+(Mr/12-n/6)F_4(q)+r^2n^2|q|^4/4+O(q^6),
\]

where \(F_4(q)=\sum_{\rho>0}(q\cdot\rho)^4\). The Wilson parameters remain symbolic. Constant chiral rotations give equivalent unit Clifford conventions; the literal retained chirality convention chooses its representative. These rederived root conditions are not a claim to have recovered the missing original v54 entrywise assignment.

With canonical temporal terms and the declared external Hamiltonian clock, the unit scalar gradient gives \(E_s^2=m_s^2+n|q|^2+O(q^4)\). The critical fermion slope is \(n/\sqrt2\); a gapped particle instead has zero group velocity at rest and the above dispersion curvature. The exact bare coefficients in units \(\ell/a\) are

| Root action | Scalar speed | Critical fermion speed | Photon speed |
|---|---:|---:|---:|
| Full A4 | \(\sqrt5\) | \(5/\sqrt2\) | \(1/\sqrt2\) |
| Induced A3 | 2 | \(4/\sqrt2\) | \(1/\sqrt2\) |

A common length/clock conversion multiplies every speed equally. A field scaling multiplies its temporal and spatial quadratic coefficients equally. For one clock and any rank-three spatial principal restriction, under any common invertible coordinate map the normalized generalized eigenvalue shapes remain \(\{1,2n,2n,2n\}\) for scalar/photon and \(\{1,n^2,n^2,n^2\}\) for fermion/photon. The full A4 extra-clock cone has four spatial entries instead. Those raw differences therefore cannot be removed by a shared change of units or coordinates.

Under the additional **bare common-cone condition**, with temporal terms and the photon reference chart fixed, let \(z_s\) multiply the scalar spatial gradient and \(z_f\) multiply the first-order fermion Hamiltonian kinetic term. The unique positive solution within that class is

\[
z_sn=\frac12,\qquad z_f\frac n{\sqrt2}=\frac1{\sqrt2},\qquad
z_s=\frac1{2n},\quad z_f=\frac1n.
\]

It gives (1/10,1/5) on full A4 and (1/8,1/4) on induced A3. These factors are derived from root counts and that extra cone premise; they are not recovered canonical coefficients or a fit to a measured speed. At an interacting selected limit the matching equations use the actual renormalized principal source kernels, including hidden elimination and contacts. An isotropic four-dimensional Euclidean action with one direction reconstructed as time is a distinct route: its common kinetic factor multiplies temporal and spatial derivatives together. It is not a sector-specific reset of the extra-clock Hamiltonian.

The [Wilson source calculation](leaf_geometry_work/matter/common_clock_root_symbols_report.md) retains all bulk and induced-slice symbol polynomials. The [clock matching proof](leaf_geometry_work/clock/common_cone_matching_report.md) verifies the normalized cone invariants and derived relative factors.

## 6. Normal memory and physical source normalization

Conserving b leaves internal and graph normal modes available within each fibre. For an actual retained/normal block Hamiltonian

\[
H=\begin{pmatrix}A&C^\dagger\\C&D\end{pmatrix},\quad
R(z)=(zI-D)^{-1},\quad
K(z)=zI-A-C^\dagger R(z)C,
\]

the retained full inverse is \(K(z)^{-1}\). At real \(z\) outside the hidden spectrum, its full-state lift and positive pole normalization are

\[
\mathcal L(z)=\begin{pmatrix}I\\R(z)C\end{pmatrix},\qquad
K_z=I+C^\dagger R(z)^2C=\mathcal L^\dagger\mathcal L.
\]

At a real eligible pole the denominator is \(r^\dagger K_zr\). Source derivatives differentiate every endpoint, the hidden inverse and second contacts. The Gaussian determinant also retains its hidden factor, \(\det(zI-H)=\det(zI-D)\det K(z)\). Moving source frames require their connection contacts. Changing the clock gives \((aH)_i=aH_i+a_iH\), with the corresponding second derivatives.

One-step compression does not remove this memory:

\[
Pe^{-aH}P-Pe^{-aPHP}P=\frac{a^2}{2}PHQHP+O(a^3).
\]

Repeated projection gives a Zeno dynamics instead. Exact equality of the two heat restrictions for a finite self-adjoint matrix at one nonzero clock forces reduction; approximate numerical equality does not.

The actual archived thirty-six-state compact-source cycle supplies a nonzero normal self-energy of norm 1.61321412; removing it changes the retained resolvent by 0.36545696 at the declared algebraic resolvent point. Full first/second contacts, hidden determinant derivatives and all 36 eligible pole lift norms agree with the full matrices. This is an actual source elimination test, not a substitution of that historical cycle for the current hidden51 law.

For the actual A4 coframe image J and six normal link bands N, the exact squared-frequency Schur kernel is

\[
K_{\rm cf}(t)=J^\dagger K_{20}J+tJ^\dagger P_GJ
-M(H_h+tI)^{-1}M^\dagger,
\quad H_h=N^\dagger K_{20}N,\quad M=J^\dagger K_{20}N,
\]

\[
K_{\rm cf}'(0)=J^\dagger P_GJ+MH_h^{-2}M^\dagger.
\]

Here \(N^\dagger N=I\) and \(N^\dagger J=0\); the hidden block is invertible at the stated momenta. The actual Gauss null is retained. This positive frequency-squared memory coefficient contributes beyond a retained static matrix. The [source proof and executable](leaf_geometry_work/review/normal_memory_source_report.md) give the full first/second formulas and independent numerical evidence.

## 7. The joined statement and its physical scope

The literal fixed-b leaf, compatible external symplectic transport and fibrewise positive transfer are now joined explicitly. The A4 graph can be sliced without hiding crossing faces, and its one-slice Gaussian source response is calculated with every normal momentum retained. Bare shared-clock compatibility has an exact root-count condition, while full interacting compatibility remains the condition on the selected principal source kernels.

The common physical action must use the same conserved fibre, admitted species/gauge/coframe sources, target-independent vacuum and reconstructed time. Its source pullback must obey the constraint stationarity equations, second contacts, hidden determinant terms and Gauss/diffeomorphism Ward identities. Physical observables use the corresponding full lift and residue normalization, including the previously retained charged-Gauss dressing and infrared threshold scope.

The retained all-timelike fixed-volume entropy/area interface remains conditional on its physical coframe and modular-stress identifications; it yields the Einstein principal equation and \(D_{TT}=32\pi G_{\rm ent}P_2/p^2\) in that scope. Nothing in this leaf calculation inserts a separate \(FR/2\) coefficient, rescales the entropy or derives a charged spectrum by filtering generations.

The conserved-leaf component is resolved within the typed local action registry. The independent physical time/coframe embedding and complete nonlinear canonical species action are not established by these finite restrictions. The completed proofs support those exact statements; they do not constitute empirical establishment of a theory of nature.

The [independent audit](leaf_geometry_work/review/leaf_source_audit.md) checks the conserved-fibre, compression, root, source and clock distinctions. Reproduce and validate the local records with:

```sh
python3 run_physical_leaf.py
python3 run_physical_leaf.py --recompute
```

The package includes original source snapshots, scripts, strict finite JSON, finite operator arrays and their provenance. The current specification input is frozen at its preceding revision so that the new integrated specification can be checked without rewriting the mathematical input history. Continued derivations 67–73 contain these seven components; the earlier closed calculations remain intact.