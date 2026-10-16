# Newton's Cathedral: actual physics operator and anti-fitting gate
16 October 2026. Original URT selection and the Cathedral's earlier finite closures remain intact.

## Why this checkpoint exists

The research task is to derive physically testable dynamics from original finite operators, rather than repeatedly assess summaries. **No parameter fitting, no unexplained constants, and no code labeled verified until it has been executed.** Any historical output survives with a lineage and a distinction between an internal algebraic identity and an independent physical observable.

## Gate A — what does the fiveplet BKM action actually imply for gravity?

The previously verified five-dimensional icosahedral quadrupole is isometric, by the signed-face operator, to a five-dimensional off-quartet BKM density tangent with stiffness

    chi35=8 eta_Delta (1+Delta²)/(1-Delta²)=47.9669783033801.

Represent a smooth scalar field phi by the unique rotationally equivariant *second-order* symmetric-traceless spatial Hessian,

    Q_ij[phi] = (partial_i partial_j - delta_ij Laplacian/3) phi.

In Fourier space, with k²=|k|²,

    Q_ij(k)^* Q_ij(k) = (2/3) k^4 |phi(k)|².

Therefore, an **assumed** action that pulls back the BKM quadratic directly along this scalar-to-fiveplet map,

    F_STF[phi]=(chi35/2) integral |Q[phi]|² - integral s phi,

has Euler–Lagrange operator

    (2 chi35/3) Laplacian² phi=s.

This is a BIHARMONIC k^4 operator, not the Newtonian k² Poisson equation. On infinite R³ its distributional fundamental solution grows as r rather than decaying as 1/r. This is a local, exactly derived result for the declared scalar-to-fiveplet map; it is not a global no-go for the Cathedral's 4D coframe dynamics.

A genuine two-derivative *scalar* action, separate from the STF-Hessian pullback, has the form

    F_scalar[phi]=(kappa/2) integral |grad phi|² - g integral rho phi.

It gives -kappa Laplacian phi=g rho. For a static point source, phi(r)=g m/(4 pi kappa r), with interaction energy -g mtest phi and inverse-square attraction

    F(r)=-[g²/(4 pi kappa)] m mtest rhat/r².

Hence the effective Newton coupling **conditional on that action** is

    G_eff = g²/(4 pi kappa).

The 13-cell contains a *scalar singlet* in addition to its fiveplet, but the existing verified finite operators have not uniquely constructed the scalar kinetic coefficient kappa, dimensional length/time conversion, coupling g to stress-energy, or Einstein's constraints. DO NOT set kappa=chi35 kBT or g=1 merely because it numerically produces a desired force.

The symmetric-traceless 3x3 representation has five components and TT rank 2 when a physical nonzero propagation wavevector is supplied. A pure isotropic stress tensor proportional to delta_ij has **zero TT projection**, so the two propagating spin-2 modes alone cannot carry the static isotropic point-mass Newtonian constraint. 4D h00/lapse/constraint dynamics must be built, not added as a label.

**Independent executable test:** [cathedral_scalar_spin2_derivative_gate.py](cathedral_scalar_spin2_derivative_gate.py) checks the STF symbol, TT constraint rank and isotropic-source annihilation on 100 randomized wavevectors, and verifies k^4 vs. k² at five scales. The run completed successfully with no fitted physical input.

## Gate B — alpha candidate coefficient provenance is internal, not proof of physical coupling

Historical Cathedral candidate:

    alpha_root^{-1}=137+(17572/1215) Delta-(9/65) Delta².

The coefficients have an exact *internal arithmetic decomposition*, for the current frozen definitions:

    137=N²-E-(D-1),          N=13,E=30,D=3
    17572/1215=N+W_scalar-S_ent,
    W_scalar=9/5,            S_ent=(1+gamma)/D=82/243,
    9/65=S_exh=(N-D-1)/(q N), q=5.

These statements **explain the formula's internal bookkeeping only**. None of the following has thereby been uniquely derived:
- why precisely this sum and difference corresponds to physical photon polarization;
- why the current-current correlator has this normalization;
- whether these terms were chosen before examining measured alpha;
- whether alternate historical Cathedral alpha expressions were examined and rejected after observing values;
- independent scale-dependent QED running and electromagnetic Ward/current normalization.

Consequently this is **an internally defined scalar candidate**, not an independently confirmed physical prediction. The historical repository contains other alpha formulas and a legacy 'confirmed' predictions registry. Their output must be preserved with provenance labels, not quietly discarded or reported as established QED.

A legitimate target-free closure would start from the fixed microscopic charge/current operators and compute the vacuum polarization/current correlator to obtain the physical residue *without inserting measured alpha anywhere in operator construction, model selection, or current normalization*. Blind predictions should be declared before new data comparisons and verified with held-out observables.

## Gate C — reproducibility / regression

The October theorem script used to overwrite its committed JSON artifact when invoked from the pytest suite. This is corrected: the script now accepts an optional --output path, and the regression test writes to pytest's temporary directory and re-reads the committed fixture to ensure it stays unchanged. Syntax checking has also been added for the integrated runner following its corrected missing bracket.

All future numerical closure reports should record: exact input operators and their source commits, algorithm and solver tolerance, software requirements, executed return code, residual, negative controls, alternate candidate formulas, independent validation, and clear *provisional versus derived* labels. One successful floating-point identity check is not evidence that an equation holds physically.

## Scope and next physical derivation

Continue the full Cathedral programme. The next **specific physical mathematical object** is the 4D coframe/constraint operator coupling the existing scalar singlet to the physically conserved stress tensor and the two transverse-traceless spin-2 modes. Its symbolic Fourier principal part must be computed. The candidate either has a gauge-protected second-order massless field with the right source/energy Ward identities, or it doesn't; no empirical G is to be used to select between actions.

This is not a proposal to abandon mass/flavour/CKM/PMNS/cosmology work; preserve and separately validate all original conversation-first branches with explicit typed-H64 and circularity provenance.

## Continuum-physics follow-up (16 October)

[Gemini continuum bridge fully reconciled with the existing October 14 wave and massless-scale-chain work](GEMINI_CONTINUUM_BRIDGE_RECONCILIATION_2026-10-16.md). This checkpoint confirms the exact 5-to-2 helicity and symmetrized curl, reuses the already derived icosahedral (k^2-a^2k^4/20) wave symbol and massless (Q^\dagger Q) scale-chain, and computes the **conditional** BKM/EH scale ratio ℓ_P/ℓ_0=0.05331701726349. A constant anisotropic metric tensor does not map to the singlet under vertex quadrupole sampling; gauge shift symmetry remains a separate dynamical condition. The Golden UV drive and continuum \(ck\) prescription disagree at the quoted cutoff; unscaled Gaussian BKM noise still violates density positivity. This is a physics synthesis and verification, not a proof of measured G or full Einstein dynamics.
