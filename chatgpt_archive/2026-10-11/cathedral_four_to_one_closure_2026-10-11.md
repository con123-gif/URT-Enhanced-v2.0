# Cathedral / URT — Four-to-one orbital test

Date: 11 October 2026. Status: exact conditional finite construction; no claim of physical unification. Numerical verification: `cathedral_four_to_one_test.py`.

## 1. Hypothesis (not theorem)
Four centred 13-site icosahedral carriers form four layers in a tetrahedrally symmetric network. Every pair of layer states has the same *effective* synchronization weight `g = Delta`, where

    phi = (1+sqrt(5))/2
    Delta = 3/20 - (80*pi)/(1053*phi)
    eta = -ln(Delta).

Tetrahedral symmetry fixes the **form** of the uniform-pair Laplacian, not its scalar g. It does not force g=Delta. Overlap-site identifications need additional geometric data beyond the four-layer tensor model.

## 2. Exact layer algebra

    L4 = 4*I4 - J4 = 4*P_relative
    P_common = J4/4; P_relative = I4-P_common
    spec(g L4) = {0,4g,4g,4g}.

With g=Delta, the layer amplitude semigroup is

    A(t) = exp(-t Delta L4) = P_common + exp(-4 Delta t) P_relative.

Consensus acts on a labelled 52-dimensional 4 x 13 carrier. The common 13-dimensional subspace is invariant; the 39-dimensional transverse subspace decays. The 39 components are not physically destroyed: the mode count is after synchronized projection/coarse-graining. For a common internal **unitary** U13(t), the product C(t)=A(t) tensor U13(t) maintains the internal 13-state dynamics without damping it. A unitary 13-state example is U13(t)=exp(-i t L13). This is not automatically the full URT metaplectic representation.

    t_star = eta / (4 Delta) = 602.1836793420971 (dimensionless)
    A(t_star) = P_common + Delta P_relative
    T(t_star) = C†C = (P_common + Delta² P_relative) tensor I13

Thus T has 13 eigenvalues 1 and 39 eigenvalues Delta². The 13-state icosahedral graph with a central hub has eigenvalues {0:1,6-sqrt(5):3,7:5,6+sqrt(5):3,13:1}; those are preserved by U13(t), not damped.

At unit time, exp(-4 Delta)=0.990092645..., so differences reduce ~0.9907% per step. The e-fold time 1/(4Delta)=100.434..., and 99% suppression takes ln(100)/(4Delta)=462.517... . These times have no physical units unless a clock calibration is independently derived.

## 3. Modular/entropy match (conditional)
The four-layer no-jump selected state from an initially maximally mixed layer state is

    rho4 = (P_common + Delta² P_relative)/(1+3 Delta²).

Its one high eigenvalue and three low eigenvalues yield

    p_relative=3 Delta²/(1+3 Delta²) = 1.858785267e-5,
    S4/kB=H2(p_relative)+p_relative ln 3,
    (dS4/dp_relative)|rho4 = 2 eta.

The canonical Cathedral hidden state has four high and four low eigenvalues:

    rho_hidden = (I4 + Delta² I4)/(4(1+Delta²)),
    p5=Delta²/(1+Delta²)=6.196027671e-6,
    (dS_hidden/dp5)|rho_hidden=2 eta.

The entropy-slope agreement is exact for any multiplicities m and n when the **per-eigenvalue** weight ratio is Delta²; it is not unique evidence for physical identification. The two states have different dimensions and degeneracies (1+3 versus 4+4), different excitation probabilities, and different BKM metric coefficients:

    chi_1+3 = 2 eta (1+3 Delta²)/(1-Delta²) = 11.9918931782
    chi_4+4 = 8 eta (1+Delta²)/(1-Delta²) = 47.9669783034.

Do not identify the two operators or their gauge stiffnesses without an explicit mapping.

## 4. Physical channel / information-accounting test
For layer unit vector |s> = (1,1,1,1)/2 and any orthonormal basis |r_a>, a=1..3, of the relative subspace, the four Kraus operators at t_star are

    E0 = P_common + Delta P_relative,
    Ea = sqrt(1-Delta²) |s><r_a|, a=1,2,3.

They satisfy sum_a Ea†Ea = I4 (include E0), so form a completely positive, trace-preserving channel. As Delta -> 0 the channel sends every input layer state to |s><s| while retaining the reduced internal 13-state density operator (for product-layer Kraus operators E_a tensor I13). The environment carries the lost relative-layer information. With finite Delta the output retains residual relative weight.

**Important distinction:** the normalized no-jump/postselected state rho4 above is not the unconditional output. For a maximally mixed input, the no-jump probability at t_star is (1+3Delta²)/4 = 0.250004647..., while the unconditional output eigenvalues are 1-3Delta²/4 (1x) and Delta²/4 (3x). This unconditioned state has a different modular ratio. Interpreting T=C†C as a complete physical evolution without the other channels would be invalid.

## 5. Stress tests and obstructions

- The coefficient Delta is **not fixed by tetrahedral symmetry**. Tetrahedral symmetry gives a Laplacian up to a nonnegative scalar g.
- Delta contains pi divided by the algebraic, nonzero phi, plus a rational term, hence Delta is transcendental. Eigenvalues of finite unweighted graphs (or any graph with algebraic edge weights) are algebraic. Therefore, an exact eigenvalue 4Delta cannot come from bare finite unweighted icosahedral overlap combinatorics. Some additional angular/metric/URT prescription must introduce Delta.
- Multiplying the layer amplitude per step by the **raw scalar** URT spiral factor q=(pi/e) exp(2pi i/phi²) gives transverse magnitude (pi/e) exp(-4Delta)=1.144277... > 1. Thus relative physical amplitude is not bounded by synchronization alone under that naive scalar map; only the deviation/common *ratio* contracts. The canonical metaplectic URT lift is unitary and distinct from this scalar-amplitude approximation. Extra URT selection or nonlinear saturation would be necessary in the raw-amplitude formulation.
- Neither the layer map nor rho4 fixes U(1), SU(2), SU(3) current embeddings, the electromagnetic normalization, Einstein coupling, mass scales, flavour parameters or the continuum limit. Couplings cannot be declared derived from this layer symmetry.
- Four geometric icosahedra with shared sites do not automatically admit a literal tensor factorization C4 tensor H13. The model assumes corresponding 13-state labels and homogeneous pairwise links. A concrete geometric incidence matrix must be computed to claim that physical overlap generates it.

## 6. Status
**Proved inside the specified model:** tetrahedral 1+3 layer splitting; 52->13 invariant synchronized subspace; exact transfer spectrum; common entropy modular slope; constructive CPTP completion with an environment; naive scalar-URT boundedness failure.

**Not proved:** geometric necessity of g=Delta, matching 1+3 to Cathedral 4+4 hidden carrier, a microscopic force operator, and a parameter-free continuum theory of nature. This is a self-contained finite-math test and a falsifiable target for the proposed overlap geometry.