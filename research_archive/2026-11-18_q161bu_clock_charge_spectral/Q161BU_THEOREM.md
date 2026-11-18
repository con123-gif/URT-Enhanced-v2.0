# Q161bu — native rational-charge 24-clock spectrum

Status: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. THEOREM for explicitly declared conditional embedding, **not** the physical H64 source transport.

Original URT θ=2π/φ², original 24-cycle S e_j=e_(j+1 mod 24). Declare T_q=exp(iqθ)S for rational Q96 charge q. Then det(zI−T_q)=z^24−exp(2πi24q/φ²). Shared eigenvalues for q≠r require 24(q−r)/φ² integer, impossible because 1/φ²=(3−√5)/2 is irrational. Thus all 21 pairs among q=−1,−2/3,−1/3,0,1/3,2/3,1 are spectrally disjoint. Original clock reversal R e_j=e_(-j) satisfies RSR=S⁻¹ and R T_q R=T_(−q)⁻¹. Intertwiners commuting with these T_q cannot mix distinct charges. This does not derive a source-dependent physical Ward coupling.

Certificate: python research_archive/2026-11-18_q161bu_clock_charge_spectral/Q161BU_CERT.py, exact SymPy locally executed 2026-11-18 exit 0. No empirical or fitted input.

Prior: Q161bs irrational holonomy; Q161bf/Q161bh alternative conditional charge clocks. Next: recover actual original H64/190→24 source map J and calculate Q96 Ward residual. Physical gates OPEN.
