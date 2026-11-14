# Recover the November 11 symmetry-breaking correction — not another frozen-URT derivation

**2026-11-14. User correction is overriding: treat all prior URT equations/actions as revisable hypotheses. No-fitting. Full Cathedral stays in scope.** The recovered November 11 conversation must be considered before the dated Q93–Q97 work. The mathematical computations here establish an internal candidate only, not physical ARFs.

## What was missing and where it was found

**Recovered from the user’s saved Library, not from GitHub:**
- \`CATHEDRAL_URT_COUPLING_SELECTOR_2026-11-11.md\` (copied verbatim here). It itself states explicitly **“Working files prepared locally; no GitHub commit or upload performed.”** It derives a local hidden 4_3 × 4_5 → visible 3 ⊕ 3′ bridge using \(B^T(u\odot v)\), with eigenstrengths \((5\pm2\sqrt5)/15\), eigenratio \(\varphi^6\) and amplitude ratio \(\varphi^3\). The locality hypothesis is explicit and it does not prove observed couplings.
- \`cathedral_emergent_time_2026-11-11.md\` (copied verbatim). It also expressly records **“Not saved to GitHub”** and separates modular-time algebra from physical proper time.

**Recovered from the November 11 user discussion and independent calculation:** after the coupling-selector idea, Con explicitly corrected it: the core source was **asymmetry/frustration from the mismatch, not selection of histories or couplings**. Con argued that a perfectly symmetric icosahedral shell cannot select its own beginning, that the 3D kissing-number 12 plus a centre matters, that φ contributes, and that the mismatch might permit matter–antimatter imbalance. This **later correction supersedes** the earlier interpretation of “URT selects permitted couplings”. Preserve the earlier calculation as evidence about *available channels*, not as the current explanation of genesis.

The local filenames \`CATHEDRAL_HIDDEN_QUASICRYSTAL_BRIDGE_2026-11-11.md\` / \`cathedral_hidden_icosahedral_bridge.py\`, mentioned in earlier discussion, were **not retrieved as their full original files** in this Library search. Their most important finite bridge identities are already recorded in the recovered coupling-selector document. Do not claim that every missing 11 November file has been recovered.

## Independent verification of the forgotten asymmetry calculation

1. **Frustration, genuine enumeration.** Put Ising spins ±1 on each of the 12 icosahedral contact vertices and minimize \(\sum_{\langle i,j\rangle}s_i s_j\) over all 2¹² configurations of the original 30 nearest-neighbour edges. The ground energy is −10 and **72** configurations attain it (all with zero net outer magnetization). Now add a centre spin \(s_0\) with ferromagnetic radial coupling \(-\varphi s_0\sum_i s_i\), minimize also over \(s_0\). The ground energy is \(-6-4\varphi\), attained by **60** decorated configurations (30 outer magnetization +4 and 30 −4, with corresponding central sign). **No unique orientation or beginning follows**: 60 remain.

2. **Exact π–φ–24 winding mismatch** in the selected 3-fold comparison chart:
   \[
   24(2\pi/\varphi^2)-(18\pi+\pi/3)
   =\varepsilon=\pi/(3\varphi^{12})=0.003252197674803\ldots.
   \]
   The equality is **exact** in \(\mathbb Q(\sqrt5)\pi\), not fitted. Its use as a dynamically selected comparison/reference phase is **not** derived; the baseline is a 3-fold clock chart hypothesis. This \(\varepsilon\) is **not** the older \(\Delta=3/20-80\pi/(1053\varphi)\).

3. **Actual signed hidden geometry.** For the 20 oriented icosahedral faces define \(W_{ab}\) from the sign of the oriented cross product of their face-centre vectors, contracted with their common original vertex; use the exact original 20×12 \(C\), face Laplacian \(L\), and spectral projectors \(P_3,P_5\). Exact symbolic computation establishes
   \[
   W^T=-W,\quad W^2=-15(P_3+P_5),\quad LW+WL=8W,
   \]
   and antipodal inversion \(\mathcal P W\mathcal P=-W\), \(\mathcal P P_3=-P_3\), \(\mathcal P P_5=P_5\). Therefore \(\chi=iW/\sqrt{15}\) is Hermitian, \(\chi^2=P_h\), parity odd, while \(X=P_5-P_3\) anticommutes with \(\chi\) and \(X^2=P_h\).

4. **Revisable new hidden dynamics, explicitly CONDITIONAL** (not the original Hbits action):
   \[
      H_\varepsilon=4P_h+X+\varepsilon\chi,\qquad
      \rho_\varepsilon=e^{-\eta H_\varepsilon}/\operatorname{Tr}_{P_h}e^{-\eta H_\varepsilon},\quad
      \eta=-\ln\Delta.
   \]
   This is one **testable replacement hypothesis**, not a deduction that URT fixes the coefficient of \(\varepsilon\chi\). It preserves the full eight hidden modes and their \(A_5\) covariance while mixing the two opposite-parity quartets. Its exact hidden eigenvalues are \(4\pm\sqrt{1+\varepsilon^2}\), each multiplicity 4, and
   \[
     \boxed{\langle\chi\rangle_\varepsilon=
       -\frac{\varepsilon}{\sqrt{1+\varepsilon^2}}\,
        \tanh\!\left(\eta\sqrt{1+\varepsilon^2}\right)}
       =-0.00325214017738987\ldots.
   \]
   This is a **nonzero signed geometric hidden response** without experimental fitting. Conjugation by inversion sends \(H_\varepsilon\to H_{-\varepsilon}\). Thus the complete spectrum and partition function are **even in the sign of ε** while \(\langle\chi\rangle\) reverses. A symmetric mixture of both orientations gives zero signed asymmetry. Neither its branch sign, physical CP violation, baryogenesis nor distinct three-generation charged masses has been derived.

5. **Distinguish an earlier conditional state-rotation experiment.** The November 11 discussion also considered \(\rho'_\varepsilon=e^{\varepsilon J}\rho_*e^{-\varepsilon J}\), \(J=W/\sqrt{15}\), with reported orientation-odd probe \(-[(1-\Delta^2)/(1+\Delta^2)]\sin(2\varepsilon)\approx-0.006504268884\). That is a **different dynamics** preserving the eigenvalues of ρ*. Do not merge its number with the new Gibbs-Hamiltonian expectation above or claim either number is the observed matter asymmetry.

## Consequences for the actual task

- The old scalar controller \`cathedral_core/urt.py\`, original \`Hbits\`, the 24-clock action and archived four ARFs are **working records, not axioms**. Their failure to select an asymmetry must trigger a revised dynamical law test, not endless correction terms or a prohibition based only on old-model no-go proofs.
- The first concrete revised object is the chirality-mixing sector \(\chi\), with an exact, parameter-free winding residual candidate \(\varepsilon\). It must be embedded into **all 190 five-solid cochains, H13⊕H51/64 histories, original 24-clock, D6→H3 and charged Wilson 192-state sector**, rather than treated as the whole Cathedral.
- The **new model still has a dynamical selection problem**: how the 24-track winding produces the signed cross-quartet generator and how the universe selects one parity branch, not a postulated \(\varepsilon\chi\). Physical charged currents, masses, Maxwell normalisation, and four ARFs are not yet derived. There is no valid claim of a zero-parameter theory of nature from these identities alone.
- Saved sources must be reconciled before further novelty claims. This recovery corrects the Q97 approach: Q97's \(A_5\)-invariant vacuum/old source does not rule out **changing the underlying law**, and \(\chi\) provides an explicit parity-odd direction even though it does not alone split an irreducible \(A_5\) triplet.

**Reproduce:** \`python research_archive/2026-11-14_symmetry_breaking_recovery/ASYMMETRY_NATIVE_CERTIFICATE.py\` (executed in local Python, exact SymPy + numpy, exit 0; CI pending). Do not replace the signed result with a fitted ARF.
