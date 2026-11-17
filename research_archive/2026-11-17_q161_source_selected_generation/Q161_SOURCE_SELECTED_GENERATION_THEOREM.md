# Q161 — exact native-source spontaneous generation splitting and chiral coupling

17 November 2026 — THEOREM on original Q101 downstream five-solid/190-cochain 50→8→12 source and genuine hidden 20-face incidence. The physical Yukawa coupling remains UNSELECTED.

## New operator: use an actual frustrated ground configuration, not an averaged artificial spectrum
The original source-to-generation theorem already proves Kgen=C^T(P3⊙P5)C with eigenvalues (5±2√5)/15, each threefold, and six zero modes. For each of the 30 original energy-ground outer-spin states with M=+4 and E=-6, define the *natural contact occupancy* N_s=diag((1+s_i)/2). This declaration uses existing spin values and no fitted parameters; its selection as a physical coupling, however, still needs a microscopic action.

The locally selected positive Gram is G_s=N_s Kgen N_s (nonzero spectrum agrees with Kgen^(1/2) N_s Kgen^(1/2)). **Exact SymPy evaluation for all 30 native source words** yields the same characteristic polynomial:

det(x I_8 - G_s|occupied) = x²(90x²−51x+1)(90x²−39x+1)(180x²−60x+1)/1458000.

The six nonzero eigenvalues are 0.0175954681667, 0.0203377693657, 0.0273697218067, 0.315737865167, 0.405963611527, 0.546328897301. Thus source selection genuinely lifts the symmetry-averaged threefold degeneracies without inserting arbitrary three-generation masses; the full 30-state orbit has identical numbers (orientation changes eigenvectors).

## Stronger exact 3↔3′ mixing theorem
Define the true two inequivalent A5 triplet spectral projectors Plo and Phi of Kgen using λlo=(5−2√5)/15 and λhi=(5+2√5)/15. The natural cross-triplet source bridge Y_s=Plo N_s Phi acts between the two 3D triplet carriers. In EXACT Q(√5) arithmetic for a native ground source,

(Y_s†Y_s)²=(1/20)(Y_s†Y_s), and Tr(Y_s†Y_s)=1/10.

So the three singular values of the 3×3 map are exactly (1/√20,1/√20,0). Direct independent native numerical checks recover that same spectrum at all 30 ground words to <=2e-14. A5 conjugacy then proves it across the whole proper icosahedral orbit. This is a *rank-two leading chiral selection rule*: one combination of three triplet channels is unsourced at leading linear contact order; the other two are equal in magnitude. It is NOT a prediction of any specific charged-lepton or neutrino mass, because no physical H64/24-to-Q96 Yukawa coupling or higher-order source correction has yet been derived.

## What was actually executed
Both standalone local scripts were run and passed: CATHEDRAL_Q161_SOURCE_SELECTED_GENERATION_2026_11_17.py (SymPy exact 30-fold polynomial, exact chiral projector idempotence and 30 numerical singular checks) and cathedral_generation_localizer_test.py (independent NumPy eigenspectrum). The accompanying GitHub certificate reproduces the SymPy exact proof and is registered for CI; treat CI success separately.

## Mandatory physics continuation
Derive from the original H64, 24-clock and Q96 Ward transport whether this contact occupancy Y_s is the actual charged chiral Yukawa vertex; its rank-two selection can then be tested against three-generation masses. If the microscopic vertex is different, replace Y_s instead of fitting its coefficients. Keep all five solids and the full source-to-generation state; do not claim that any mass or Standard Model law has been derived by the matrix polynomial alone.