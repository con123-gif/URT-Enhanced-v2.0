# Q161 — Original-source graded gauge Hessian recheck (17 November 2026)

Status: REVIEW / CLOSED INTERNALLY — PHYSICAL IDENTIFICATION PENDING. Original 190/H64/24-to-continuum physics OPEN.

The existing native Q101/Q124/Q125 currents and 192×528 v61 Wilson source are preserved and imported unmodified. A locally executed independent native-formula reconstruction of the **specified conditional** Q125 joined graded determinant gives **409 positive / 72 negative / 47 gauge zeros** over all 48 11×11 Fourier blocks at homogeneous A=0. Each of six temporal modes has negative counts [3,2,2,1,2,1,1,0] over spatial 000,001,010,011,100,101,110,111. Max Ward residual 4.5368e-16. The first temporal-mode implementation used the wrong Fourier sign; that failed its Ward check and was corrected before claiming this result.

The local calculation independently matched the logarithmic determinant second finite differences in four real-field directions including non-selfconjugate temporal momenta with relative errors 1.37e-7, 1.09e-7, 3.07e-7 and 1.15e-7. Scripts and 48-mode JSON are packaged in the conversation file Q161_GRADED_48_INDEPENDENT_AUDIT_2026-11-17.zip.

This repository checkpoint adds a **stronger source-native CI certificate**, which imports Q101/Q124/Q125/v61 directly, rebuilds the two 444-state charged chiral spectral classes with Q96 trace weights 16+16, derives the native first-link current and second-link seagull, checks 48 Fourier blocks and all gauge Ward identities, and writes a JSON result. Local reconstructed calculation is executed; this *new source-native script* must pass CI before being labelled native-CI verified.

The graded algebraic identity K(A)^2=h_v61(A)^2+k_KMS^2 H_ch^2 is a conditional finite exact result due to the native Q96 charge intertwiner and spin grading. It **does not imply positive gauge Hessian**. Its homogeneous vacuum has physical negative modes in this calculation. That is a scoped mathematical-physical result, not a global obstruction to other derived actions, and not a completed nature theory.

RESUME HERE: compute full non-Fourier graded 528-link Hessian at the *original Q152 nonuniform vacuum* with actual Q96 transport and Ward tests, or derive a new primitive positive 190/H64/24 transfer. Keep Q161 physical gate OPEN. Never fabricate the 481-positive signature, loop coefficient 17572/1215, fermion pole masses, or Einstein constants from this finite theorem.
