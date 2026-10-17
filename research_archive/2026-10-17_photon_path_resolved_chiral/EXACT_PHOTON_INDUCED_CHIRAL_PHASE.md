# Native Cathedral: exact photon-induced phase from coherent dual-path transport

Executed 17 October 2026 against unmodified cathedral_strict_64_closure.py.

**New constructive result:** A single centred Gaussian photon Wilson factor is real and only attenuates amplitude; a coherent sum of complex geometric paths carrying **different** real photon Wilson attenuations acquires an actual phase shift. The previous common-factor calculation did not include this interference. This is an explicit, gauge-covariant, *specified* finite model, NOT a claim to have uniquely recovered the final species-loaded H64 mass action.

## Geometric and photon data
Use native icosahedron, its dual dodecahedron (20 face-centre vertices, 30 edges), and the 12 oriented pentagonal boundary cycles assembled from the icosahedron vertex stars. Let Ddual be 30x12, rank 11, and Kdual=Ddual Ddual^T. Exact dual-loop covariance: Ddual^T Kdual^+ Ddual=I12-J12/12.

Use native chiral face operator J=W/sqrt(15), W²=-15(P3+P5), and Pi+=(P3+P5-iJ)/2. Every nonlocal face-centre matrix element is dressed by the equal average of all shortest dual-graph paths between those face centres; closed triple products are gauge invariant. This equal-shortest-path rule is an **additional explicit dynamical choice**, with no continuously fitted parameter. All resulting closed-path variances belong to {0,11/12,5/3,9/4}.

## Exact pure-chiral photon amplitude

With x=g²:

B(x) = 1013/364500 - i sqrt(15)/13500
   + (73/60750 - i sqrt(15)/12150) exp(-11x/24)
   + (7/121500 - i sqrt(15)/24300) exp(-5x/6)
   + (7/182250 - i sqrt(15)/60750) exp(-9x/8).

At x=0, B(0)=743/182250-i13sqrt(15)/60750, the independently verified native chiral loop. Its exactly derived phase slope is (15393sqrt15)/1149728 = 0.0518529884008833 per unit x.

At the *conditional* coupling candidate g²=4pi/137.035999178195=0.0917012368262333, its phase changes from -0.200559441135205 to -0.195916819434091 radians, shift +0.004642621701114. All 20 oriented icosahedral faces yield the same dressed complex loop to 1.58e-17.

## Canonical Gibbs-dressed photon amplitude

For Delta=3/20-80pi/(1053phi), rho_chi=(P3+Delta²P5-iDelta J)/[4(1+Delta²)], the same exact finite path computation gives

Bchi(x,d) = 1/(1+d²) [
  (665d²+14i sqrt15 d+687)/729000
  -(15d²+10i sqrt15 d-3)exp(-11x/24)/182250
  +(18d²-10i sqrt15 d-21)exp(-5x/6)/364500
  +(7d²-4i sqrt15 d+21)exp(-9x/8)/364500
].

At x=0 it reduces to (699+655d²-54i sqrt15 d)/[729000(1+d²)], the exact original KMS chiral loop. At conditional candidate x it changes phase -0.000744762209231 -> -0.000692453749920 radians, shift +5.23084593106e-5. The exact zero-coupling phase derivative is sqrt15*d*(55669d²+59595)/(2*(429025d⁴+959430d²+488601)).

## Physical stationary-phase test
A *separately hypothesized* minimal C3 Wilson potential V=-2A|B|cos(3delta-arg B) selects |delta|=0.065305606478 for the pure chiral source, or |delta|=0.000230817917 for the KMS one (modulo the 2pi/3 branch). Interpreted literally with Koide Q=2/3, the positive-angle muon/electron ratios would be 3.04613 and 1.00387, not observed 206.76828. Thus the calculation **derives a real photon-induced geometric phase mechanism**, but NOT the physical Koide phase or lepton pole masses. The actual path rule and photon–H64 source map must be selected by the theory.

## Reproduce
Conversation artifact cathedral_photon_exact_2026-10-17.zip contains original canonical geometry, photon_wilson_on_urt_shell.py, gauged_chiral_face_loops.py, symbolic_gauged_chiral.py, exact symbolic coefficient certificate and numerical JSON outputs. Requires NumPy, SymPy, NetworkX. No lepton mass measurements are used anywhere in the operator construction.
