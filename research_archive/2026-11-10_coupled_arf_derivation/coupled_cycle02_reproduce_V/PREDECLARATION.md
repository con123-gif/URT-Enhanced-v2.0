# Coupled cycle 02 predeclaration — reproduce the archived nonlinear V
Time: 2026-11-10 06:44 Europe/London
Status: written BEFORE execution.

Using the reconstructed operators, independently compute
  h3 = 2 P3[(C t) ⊙ (C f)]
  h5 = P5[(C f) ⊙ (C f)]
  A3 = 18 I24 + (π/e)² L2
  A5 = 16 I24 + (π/e)² L2
  V_hist = (|h3|² + Δ²|h5|²)/4 − 1/2 (h3† A3^{−1} h3 + Δ² h5† A5^{−1} h5)
where t, f are amplitudes along the native whitened icosahedral 3- and 5-harmonics
(the Iico columns of the 7 November construction), and L2 is the charge-2 golden
24-clock Laplacian. Evaluate V on the golden Fourier mode m=18 (the charge-2
minimizer) and also at vanishing clock Laplacian, and for every pair of
Iico 3-axes with Iico 5-axes.

Compare the coefficients of t² f² and f⁴, and the mixed derivative 4 a t f,
to the reported
  V = 0.490435304391 t² f² + 4.16132699108e−7 f⁴
  mixed derivative 1.961741217564 t f.
Report the best-matching normalization and any discrepancy. Also compute the
full unrestricted Nov 7 source P_s[(C(t u3+f u5))⊙²] to see whether the
archived numbers instead come from that untruncated map.

No ARF coefficient is an input. Classification: PROVED if a stated
normalization reproduces the numbers to the printed precision; CONDITIONAL
if they match only after an explicit extra convention; FALSIFIED if no
matching convention among those listed is found (a discrepancy will then
be reported, not silently corrected).
