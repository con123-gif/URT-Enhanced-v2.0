# alt_cycle31 — spontaneous gauge flux in the condensed A4 phase

Classification: PROVED on H1–H3, with the unique physical pattern CONDITIONAL on the underived Maxwell coefficient κ.
Advances a physical ARF? No.

## Arena
The London instability of alt_cycle29 lives on the 12-vertex, 30-edge icosahedral pairing graph. The five-solid complex has 90 spatial edges, but the other 60 have no derived hopping into this 12-component magnetic Laplacian (alt_cycle27 did not supply a unique inter-solid current) and were not promoted to extra dynamical variables. Frozen real Δ is already in unitary gauge for the charge-2 condensate; the icosahedron is not bipartite and Δ is supported on every edge, so the residual continuous gauge symmetry that would preserve real Δ is trivial. The configuration space is the compact torus (ℝ/2πℤ)^{30}.

The Hodge kinetic used to normalise R_EM identifies the local Maxwell density as κ/2 ||dA||², or its 2π-periodic counterpart κ Σ_f (1 − cos Φ_f). The real number κ is not fixed by the archive: κ = 0 is the alt_cycle29 (fermion-only) action; κ = 1 is that Hodge unit identification. Both discrete choices are reported. No intermediate κ was fitted.

## Result

### κ = 0 (fermions only)
A = 0 is a saddle. Among the distinguished seeds (A = 0, the all-π connection, six random starts) and L-BFGS from each, the minimiser at both T = η and T = 0 is the all-π connection: A_e ≡ π, every face holonomy −1, every principal flux Φ = π.

The unpaired constant mode is lifted to E = 10, because K[A=π] v0 = 10 v0 (the maximum of ⟨v0|K[A]|v0⟩ on the 5-regular graph). The fermion gain relative to A = 0 is

- T = 0: ΔΩ = −5.000 (exactly −½ × 10, as predicted from the unpaired mode)
- T = η: ΔΩ = −1.880

The domain is compact, so the minimum is finite without new parameters.

Stabiliser:

- flux-only (the 20 holonomies, all equal to −1): the full A5, order 60
- combined with the even 4_5 condensate Δ: A4, order 12 (the flux pattern is A5-invariant, so it does not reduce the A4 already selected by Δ)
- holonomies are real, so A ↦ −A (equivalently Φ ↦ −Φ) does not change the pattern: time reversal is not broken and no handedness is picked. There is no residual chiral T, ℤ3 or ℤ2 from the flux.

### Joint variation of the condensate
A first scan that subtracted F(r, A=0) dropped the O(10^6) pairing condensation energy and falsely suggested r ~ 254. The absolute potential Ω = c_even r² + F(r, A) has its minimum at the same r_* = 8.61261×10^5 for A = 0 and for A = π (relative shift 0 on a ±2% window about r_*). The A-dependent piece is O(1) and does not move the tree/pairing balance. The O(10) London gain and the O(10^6) condensation energy simply add: Ω(r_*, π) − Ω(r_*, 0) = −5.000 at T = 0 and −1.880 at T = η.

### κ = 1 (Hodge unit identification)
The Maxwell cost of the all-π pattern is ½ ||dA||² = 10 π² ≈ 98.696 (noncompact, using the raw π-lift) or Σ_f (1 − cos Φ_f) = 40 (compact). Either overwhelms the O(1) fermion gain, so all-π is not the κ = 1 minimum.

At T = 0 the noncompact action, among the same seeds, returns to A = 0 (holonomies +1). That restoration is only local: A = 0 remains a critical point, and L-BFGS started there stays there.

Independently of the transverse (magnetic) London kernel, gradient deformations A = dλ have dA = 0, so they cost no Maxwell at any κ. Because residual continuous gauge symmetry preserving real Δ is trivial, these directions are physical relative pairing phases. Explicit probes lower Ω and lift the unpaired mode (a vertex dipole gives E_min ≈ 0.766 and ΔΩ(T=0) ≈ −0.383 ≈ −E_min/2, with zero flux). The T = η, κ = 1 noncompact run found a configuration with ||A|| ≈ 6.69 that is 99.994% exact (Hodge), principal fluxes of order 10^{-2}, E_min ≈ 2.97 and ΔΩ ≈ −0.178. The T = 0 compact run found a 2π-lattice representative of the same kind of nearly-flat connection (principal fluxes 0.002–0.080, E_min ≈ 6.78, ΔΩ ≈ −3.37). These are zero-flux (or 2π-equivalent) phase-winding vacua, not orbital magnetic flux.

So at κ = 1 the order-π magnetic pattern is disfavoured, and A = 0 is not in general restored: Maxwell does not penalise the longitudinal instability. The qualitative vacuum — all-π flux versus a zero-flux phase winding — is CONDITIONAL on the underived coefficient κ.

## Verification
`/workspace/arf_research/alt_cycle31_spontaneous_flux/test_spontaneous_flux.py` and `results.json`.
Predeclaration sha256: `ca3dc438de76083657f7edd0b4e7b22362122047aa4182a27d69647b444d6eb3`.

## Next obstruction
A unique flux vacuum without a free Maxwell coefficient is not available from the archive. The κ = 0 pattern (every face π) does not break A4 or time reversal. Whether a derived Maxwell term exists with 0 < κ ≪ 1, small enough for π-flux to survive, is not settled here.
