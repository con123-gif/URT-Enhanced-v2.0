# Q109 — Actual 528-link charged Maxwell Hessian and dynamical spatial-vacuum instability

**2026-11-14. THEOREM/NUMERIC CERTIFICATE inside a CONDITIONAL joined moving–spatial Gaussian action. Physical photon ARF not derived.** No observed data or old four ARF shapes used.

## Provenance, premises and joint determinant

Recovered November 11 symmetry/frustration replaces the frozen URT starting point. Q101's actual five Platonic solids (190 cochains; 50-vertex portal), original hidden 4_3+4_5 and H64 map give the 60 moving minima. Q105 derives their charged SU2 weak-axis and shortest transport; Q106 proves the exact 30-state weak-band polynomial. Q108 supplies a finite Born-Fisher configuration-space photon-like metric, NOT a 4D Maxwell residue. Q109 does not collapse these structures to a 13-state universe: it verifies original Q101 to Q106 signed links and uses the genuine original v61 48-site, 528-link, 192-spinor Wilson source.

Specify ONE candidate, not a claimed uniquely selected physics law: Gaussian Grassmann fermions with charge-separated Hamiltonian H_joint(A)=H_moving + h_v61(q A), equal unit moving and spatial kinetic weights, and the original complete Q96 particle/antiparticle charge list. Integrating the Gaussian fermions determines the one-loop effective action exactly (no arbitrary bare Maxwell term):

    Gamma[A]=-log |det H_joint(A)|.

At A=0, the moving and Wilson pieces commute. The Q106 weak-band and ordinary 30-state singlet-band have 30 eigenvalues each. Three generations and charge conjugates yield q² multiplicity **16 for each band**. Therefore if h0 has spectrum e_a and J_e, W_ef are its exact Wilson first/second source derivatives, the all-charge joined second response on the ORIGINAL 528 links is

    Pi_ef = sum_{a,b} R_ab (J_e)_{ab} (J_f)_{ba}
            - sum_a R_a (W_ef)_{aa},

    R_ab =16 sum_{mu in weak+sing} 1/[(e_a+mu)(e_b+mu)],
    R_a  =16 sum_{mu in weak+sing} 1/(e_a+mu).

These are **explicit original microscopic currents and seagulls**, not a response toy matrix. The source's 192 Wilson bands are shifted by exact Q106 moving energies, and the full charge representation is used. This exact finite matrix formula follows from differentiating the same Gaussian determinant, and the first and second Wilson gauge Ward orders follow from its exact conjugation covariance. The full joint Hilbert dimension is 30×96×192, but its Hessian is reduced exactly to 528×528 without materialising a giant operator.

## Executed local results

The script builds every one of the 528 original Wilson hopping derivatives in the native eigenbasis and the complete 528×528 Hessian, checking the true 48-site incidence matrix and its 47 gradient directions. The Hessian annihilates all 47 gauge directions: norm of Pi incidence approximately 4.83×10^-11. The full physical spectrum is

    397 positive, 84 NEGATIVE, 47 gauge-zero eigenvalues.

Its extreme values are about -2456.45316259667 and +23326.2614526330. This **revises the earlier single-plaquette inference**: the closed native spatial xy plaquette has positive curvature +1746.6696095963 (contact -553.355826903, paramagnetic +2300.025436499), but the symmetric zero-gauge vacuum is an unstable saddle in the entire 481-dimensional transverse space. The earlier Q106 negative filled-sea *energy* Hessian is a DIFFERENT functional, and must not be confused with this determinant Hessian. This finite result is NOT a stable Maxwell photon or measured inverse alpha.

Independent finite differences of Gamma along the closed plaquette give about +1746.6693 at 0.0002 and +1746.6711 at 0.0004, verifying both contacts. The original full Q96 charge spectrum has exact conjugate pairs and the model obeys Gamma[A]=Gamma[-A], even though an individual symmetry-broken spatial field need not. The strongest transverse negative mode lowers Gamma for small nonzero link flux, without inserting a symmetry-breaking potential. An earlier local one-dimensional search found a nonzero line extremum near amplitude 0.43 and action drop about 94–95. The archived native Q109 CI later showed the fixed three-point Brent bracket is not guaranteed to enclose a minimum; this test now uses bounded [0,1.5] minimization, checks nonzero downhill action, and labels a stationary line extremum only when it is interior and a central-difference derivative is small. These numerical values are reference-only until the repaired native CI succeeds. Its value is affected by basis choices inside the degenerate negative eigenspace; no unique vacuum claimed.

An independent exploratory local computation calculated the *full nonlinear 528-link gradient*, confirmed it lies transverse to the 47 original gauge directions, and followed a second physical downhill direction. A two-dimensional minimisation lowered the action about 316 units from zero; it did **NOT** make all 481 physical derivatives vanish and is NOT a full stationary-vacuum theorem. The companion exploratory certificate reproduces this without claiming optimizer success is a theorem.

## Specific nonuniqueness addressed, not hidden

The unit coefficient of the moving vs spatial kinetic terms is not yet a theorem of primitive 190/64/24 positive transfer. A direct no-fit ratio scan using only already-present golden values yields sharply different one-plaquette induced curvatures:

    lambda=0        -2802.66510
    lambda=phi^-2  +23178.74825
    lambda=phi^-1   +5775.04524
    lambda=1        +1746.66961
    lambda=phi     +83165.80288.

The values depend strongly on near-zero joint eigenvalues (minimum gap about .00903 at unit ratio). Thus choosing one merely because it gives a positive value would be fitting in disguise. These are computations in different declared actions, not observed constants.

**Next actual physics problem:** construct a uniquely normalized microscopic 190+64+24 moving/spatial positive transfer and find a stable vacuum for the complete 481D spatial gauge kernel (including its 84 unstable directions). Only then take the same-action 4D transverse photon residue with unit electron source and derive a physical fine-structure law; mass/Higgs source must be treated independently. This result shows why symmetry breaking must be allowed to MOVE, consistent with the user's recovered November 11 directive.

## Verification

Local executed by GPT in its container using a precisely labelled, directly transcribed original v61 section-9 reference (not the archive): Q101 full original five-solid geometry, Q106 exact quaternion proof, 528 Wilson vertices/current/seagull, full Hessian 397/84/47, Ward residual and finite difference, nonlinear instability, 2D exploratory gradient. PASS local. The committed check imports the ACTUAL unmodified v61 original on GitHub CI and MUST remain CI PENDING until that run succeeds. No third-party Yang–Mills material or protected archive modified.

Run: python research_archive/2026-11-14_q109_joined_gauge_vacuum/Q109_NATIVE_FULL_HESSIAN.py
Optional descent: python research_archive/2026-11-14_q109_joined_gauge_vacuum/Q109_TWO_DIMENSIONAL_DESCENT.py
