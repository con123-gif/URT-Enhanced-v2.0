# Operation Condor — Next Reconstruction

The minimal kernels have done their job: they prove that species loading before reduction plus frozen data can produce multi-scale spectra without anchors. They also isolate the precise missing piece — the explicit Feshbach resolvent of H_51.

## Concrete construction sequence (ready to execute)

1. Build the 13-dimensional visible block from the canonical centred Laplacian spectrum.
2. Allocate the 51-dimensional complement according to the frozen multiplicity list.
3. Define the golden A4 bridge S : 3 → 3' acting between the relevant irreps.
4. Embed each charge word as a diagonal operator on the visible sector before any reduction.
5. Form the off-diagonal couplings B_f, C_f from the bridge and the charge word.
6. Compute the resolvent (z I_51 - D_f)^{-1} symbolically or at high precision.
7. Form K_f(z) and locate its roots.

This sequence uses only objects already declared CLOSED / FROZEN. No new continuous parameter is introduced.

When the roots are obtained they will be recorded here and the claim ledger updated. If three physical poles appear per species, the gate moves to CLOSED INTERNALLY. If not, the exact obstruction is written down.

Fruition is the ledger entry, not a chat message.
