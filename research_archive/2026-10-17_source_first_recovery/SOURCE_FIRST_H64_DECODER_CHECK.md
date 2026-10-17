# Recovered original H64 species-source ordering — October 17, 2026

Verified directly from original October 8 `golden_species_operators.npz`, with no measured lepton masses or Koide phase as inputs.

The real 13-dimensional decoder is span(F5,Qplus,Qminus) = 5+4+4. Its projector differs in Frobenius norm **4** from the canonical retained-H13 projector (their overlap trace is 5). The real affine amplitude decoder has rank 13, but rank 5 on retained H13 and rank 8 on hidden H51.

**All four primitive species charge-source vectors lie wholly in H51.** Their retained-H13 projections have norms less than 3e-16. Projecting onto H13 before species loading therefore deletes the source terms; the correct source-first amplitude L s_f is nonzero.

Source norms: up 1.699681385582; down 1.247222374618; charged-lepton 2.449514329724; neutrino 1.414218294148. Original charged source-only 3x3 Yukawa singular values: 0.677385230402,1.291007407192,1.968392637594. Their conditional Koide Q as root-mass amplitudes is 0.387147548537, not 2/3. They are not proven physical pole masses.

This is a validated original-source distinction, not a newly imposed source prescription. It changes the correct reconstruction sequence: species source in full 64 first, then selected vacuum and 13/51 Schur elimination with the original 51-dimensional hidden determinant and current vertices. It does **not** supply the missing photon-to-H64 current coupling or independently solve Koide.

The executable source-order regression, original NPZ, JSON and hash manifest are attached in the current conversation as `urt_source_first_h64_checkpoint_2026-10-17.zip`.