# URT-ZPE: combined force vacuum contributions and gravitational entropy accounting

2026-11-21. Standalone ZPE research; user requested the other fundamental forces be considered rather than repeated lattice boundary fits. Parent e2b2b47. REVIEW and exact identities for low-energy covariant effective action; CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Standard Model parameters used only to illustrate known physical scale separation, not as inputs for fitted URT constants. No new primitive SM action or observed cosmological constant derived.

## Covariant accounting

In natural units hbar=c=k_B=1, signature -+++, write the low energy effective action as integral sqrt(-g)[(1/(16pi G_b)+B) R_scalar - rho_0 + higher curvature terms] plus nonlocal/state-dependent terms. B includes curvature thresholds induced by all matter sectors, with sign and value dependent on matching, couplings and renormalization. rho_0 includes electroweak vacuum, QCD, all threshold shifts and a cosmological counterterm. This is the usual effective field theory organisation, not a postulated calculation of B from URT. Interactions contribute to the combined effective action; arbitrary separate force allocations can be scheme dependent.

For B constant, varying integral sqrt(-g) B R_scalar gives an Einstein tensor contribution. If shifted to the matter side T_B=-2 B G_munu. In exact de Sitter radius R, G_munu=-3 g_munu/R^2, hence rho_B=-6 B/R^2. Equivalently 1/G_eff=1/G_b+16pi B. The horizon Wald entropy contribution of that same action term is S_B=4pi B A. For A=4pi R^2, T=1/(2pi R), areal volume V=4pi R^3/3, T S_B/V=+6B/R^2. Thus T S_B/V=-rho_B. This is an exact sign/accounting identity, not a physical negative energy from all matter or a generic identity equating von Neumann and Wald entropies. If the entropy area term already incorporates this threshold into measured G, it cannot be counted again as an independent positive dark-energy contribution. Prior URT R^-2 scaling does not establish that its source is a B R_scalar term; that dictionary remains to be derived.

For flat FLRW, after collecting B into G_eff, 3H^2/(8pi G_eff)=rho_m+rho_r+rho_0+rho_higher. The local B term alone modifies the coupling, not the equation of state of conserved matter or a cosmological constant. If rho_0 and higher terms vanish and no matter is present, the local Einstein theory with positive total coefficient has H=0. This does not exclude nonlocal or dynamical terms. Curvature-squared local terms have vanishing metric variations on exact 4D de Sitter with constant curvature; the conformal anomaly is not obtained just by adding a constant coefficient R^2 term.

## Actual force benchmarks

Free Maxwell in a de Sitter invariant vacuum: trace anomaly T^mu_mu=-(a/(4pi)^2) E4, a=31/180, E4=24 H^4, Weyl squared and box R vanish. By maximal symmetry T_munu=-rho g_munu, rho_gamma=31 H^4/(480 pi^2). Restored units rho_gamma=31 hbar H^4/(480 pi^2 c^3). Relative to rho_dS=3c^2 H^2/(8pi G), ratio=31/(180pi) (H t_P)^2. This is the universal free-photon curvature contribution, not every QED vacuum contribution. Massive electron and other charged-field loops contribute to local matching and suppressed low-curvature corrections. Actual interacting QED and all coupled SM terms not derived.

EW tree Higgs potential at minimum relative to origin = -m_h^2 v^2/8, illustrative m_h=125 GeV v=246 GeV gives -1.181953125e8 GeV^4. Strong QCD scale illustrative .2 GeV gives characteristic .0016 GeV^4 (not a calculation of its sign, exact condensate or scheme-independent absolute vacuum). Massive weak bosons, quarks and hadrons do not yield unsuppressed new long-distance propagation at H far below their masses, but constant vacuum and Einstein-term matching contributions remain. Standard local EFT does not make these vacuum thresholds disappear.

Benchmarks, not fit: H_ref=sqrt(.7)*70 km/s/Mpc=1.89800134e-18 s^-1, rho_dS=5.79042055e-10 J/m^3=2.77689286e-47 GeV^4. Maxwell anomaly=3.32369239e-133 J/m^3, ratio 5.73998444e-124. EW characteristic magnitude/rho_dS=4.25638722e54. QCD characteristic ratio=5.76183556e43. Historical 4.38426% deficit would be 2.53867247e-11 J/m^3 at that benchmark; not an independently established physical missing energy. There is no justified sum of these estimates yielding this value. Neither exact full-force cancellation nor gravitational emergence is proved.

## Why entropy alone cannot normalise the constant

At fixed metric and temperature, H -> H+C I changes Z -> exp(-beta C) Z, leaving rho=exp(-beta H)/Z, all normalized matter observables and entropy unchanged. A constant vacuum energy density in the generally covariant action is instead physically relevant to gravity: adding -delta rho integral sqrt(-g) shifts T_munu=-delta rho g_munu. Metric backreaction then changes the geometry and horizon entropy; fixed-background entropy cannot distinguish the shifted Hamiltonians. Thus entropy by itself at fixed background does not fix the absolute cosmological constant. A microscopic generally covariant principle fixing the constant term, or a derived relation between vacuum and geometric degrees (not double-counting measured G), is necessary. The original ratio uses an assumed horizon identification and is not a measured missing 4.38%.

## References and executable verification

- Solodukhin, Newton constant, contact terms and entropy, arXiv:1502.03758, Phys Rev D 91 084028 (2015).
- Franchino-Viñas et al., Vacuum Effective Actions and Mass-Dependent Renormalization in Curved Space, Universe 5 67 (2019), https://doi.org/10.3390/universe5030067.
- Saharian et al., Electromagnetic vacuum fluctuations around a cosmic string in de Sitter spacetime, EPJC (2017), https://doi.org/10.1140/epjc/s10052-017-5047-7 (Maxwell de Sitter density).
- Martin, Everything you always wanted to know about the cosmological constant problem, C R Physique (2012), https://doi.org/10.1016/j.crhy.2012.04.008.
- https://doi.org/10.1140/epjc/s10052-022-10484-w (discussion of EW/QCD contributions; alternative running-vacuum prescriptions not assumed).
cert.py executed locally with SymPy, exact geometric identities and anomaly coefficient plus numerical comparison, exit 0. Not a native interacting URT gauge-sector certificate. Prior horizon registry repairs in 52da374 not yet confirmed by CI. No protected files modified.

NEXT physical target: derive the single covariant combined URT matter-gravity effective action, especially its constant term and curvature term from the same interacting theory. Avoid adding separate forces as numerical percentages or selecting more boundary orientations. First test whether the entropy scale corresponds to induced gravitational coupling instead of an independent source.
