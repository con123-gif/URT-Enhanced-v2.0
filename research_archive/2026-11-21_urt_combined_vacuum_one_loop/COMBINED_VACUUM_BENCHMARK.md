# Combined vacuum: Standard Model one-loop benchmark and supertrace cancellation test

2026-11-21. Parent 43289d7. User asks whether dark energy is the residual of the whole interacting vacuum, and requests an actual calculation. REVIEW / CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. This is the conventional perturbative benchmark, not a primitive URT joint interacting vacuum, a fit, or a prediction of absolute vacuum energy.

At the tree electroweak minimum, in Landau gauge and MSbar determinant convention, use V_tree=-m_h² v²/8 and V_1(mu)=sum_i n_i m_i^4 [ln(m_i²/mu²)-c_i]/(64*pi²), with signed multiplicities n_i, c_i=5/6 for massive vector bosons and 3/2 for scalars and fermions. The three tree-massless Goldstones, photon, gluons and minimal Standard Model massless neutrinos contribute zero to this flat-space dimensionally regulated mass-dependent determinant. This does not mean they have zero fluctuations or zero higher-order interaction contributions. The benchmark uses representative masses listed in calc.py, including m_t=163 GeV (running-mass scale illustration, not a precision common-scale matching calculation), v=246.22 GeV. Evaluating at the tree minimum gives the first-order vacuum potential value in the loop expansion, up to a renormalized additive vacuum term. It is not a calculation of the interacting quantum-gravity vacuum.

At mu=v, in GeV^4:
V_tree=-118596339.96286048
Higgs loop=-1106719.5492892398
W=-1217698.0710151393
Z=-926031.0044120026
top=31179249.19608625
all remaining fermions=57.289911 approximately
V_1=27928857.86128229
V_tree+V_1=-90667482.10157819.
At mu=163 and 1000 GeV with the same fixed input masses, partial sums are -100812942.62895939 and -56194708.76791568. These are explicit scale diagnostic values, NOT independent physical predictions of the vacuum density. Scale dependence must cancel with running parameters, vacuum counterterms and higher orders.

The signed quartic mass supertrace is -7768257279.221887 GeV^4 (bosons +702687587.2864691, fermions -8470944866.508356). At fixed masses dV_1/dln(mu)=-Str(m^4)/(32*pi²)=24596531.94903025 GeV^4. A cancellation of this explicit logarithmic coefficient by the existing spectrum would require top mass 87.47716140860487 GeV with other inputs unchanged, rather than the representative 163 GeV. This is a diagnostic necessary condition for explicit-log cancellation in this fixed-spectrum expression, not a proposed mass fit and not a necessary condition for a general dynamical cancellation including running and counterterms. Vanishing supertrace would not alone cancel the finite or tree terms.

For comparison only, dark energy benchmark (2.25 meV)^4=2.562890625e-47 GeV^4. Absolute partial result is 3.537703919829907e54 times this value, with opposite sign. Conventional QCD characteristic scale (0.2 GeV)^4=.0016 GeV^4 is about 1.765e-11 of the magnitude of the partial EW result; this is not a derived QCD condensate value or a full strong contribution, as higher-loop QCD/top matching terms are not included. The finite free Maxwell curvature term was already evaluated in 43289d7. Gravitational loops, nonperturbative QCD, all mixed force contributions, and the renormalized cosmological term are NOT calculated by this determinant. They are not set to zero. No arbitrary cancellation term is inserted. Thus the conventional benchmark shows partial cancellation, but no tiny positive residual is predicted. The actual joint URT vacuum remains open.

References: PDG 2025 particle properties, https://pdg.lbl.gov/2025/listings/particle_properties.html; standard one-loop potential e.g. https://doi.org/10.1103/PhysRevD.109.055044. Prior force accounting in 43289d7. Local Python calc.py executed exit 0, explicit scale-difference check and sign regression. New remote CI pending; prior launch issue repaired at 52da374 and still awaiting completed verification.

RESUME: derive a joint microscopic vacuum action with a physical normalization, including the nonperturbative strong sector and metric degrees, from actual native URT dynamics. Do not interpret the perturbative benchmark as the URT prediction or vary inputs to make the result close to zero.
