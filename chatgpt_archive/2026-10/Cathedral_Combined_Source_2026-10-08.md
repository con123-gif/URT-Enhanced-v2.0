# Newton's Cathedral / URT: combined source construction

Later physical-join refinement: the earlier linear hidden8 gauge source passes the quadratic test but fails a quartic continuous-gauge test. Reference constant-G entropy stationarity remains valid. Exact tensor gauge completion, conserved scalar/coframe equations, full-period field poles, magnetic contacts and critical causal geometry follow in [the physical joins](Cathedral_Physical_Joins_2026-10-08.md).

8 October 2026. This continuation combines the recovered entropy–area law,
the actual hidden incidence, all twelve signed-history phases, the physical
gauge carrier, and repeated correlated photon transfer. It corrects an earlier
entropy-counting error and supplies explicit operators, source derivatives,
positive realizations and executed checks. No measured parameter is fitted.

## 1. Recovered area law and the corrected factor eight

The September 28 relation, read together with the September 30 negative
fixed-volume entropy balance and October 2/5 retained area ratio, is

\[
e^{-\sigma_S}=H_2(p_5)/\ln2,\qquad A=C_Ae^{\sigma_S/2},
\qquad \delta_V S_{\rm UV}+\delta_V S_{\rm IR}=0.
\]

Here \(C_A\) is an unspecified constant along the declared source curve,
\(\sigma_S\) is its entropy-depth coordinate, and \(H_2\) is one binary
entropy in natural units. Eliminating \(\sigma_S\), with
\(u=A/A_\star\), gives the complete nonlinear relation

\[
H_2(p(u))=H_\star/u^2,\qquad
H'_A=-2H_2/A,\qquad H_\star=H_2(p_\star).
\]

Consequently the local entropy density is \(\zeta_A=2H_2/A\) and

\[
G_{\rm ent}=\frac1{4\zeta_A}=\frac{A}{8H_2}.
\]

**Correction:** the earlier assertion that the factor eight needs two entropy
copies is false under this recovered relation. One entropy gives the factor
eight. Likewise the earlier free-slope witnesses test weaker reference-state
premises; they do not leave the slope free after this nonlinear law is imposed.
The original calculations remain archived with this correction governing their
interpretation. Spectral-action normalization is not reinstated.

The unfitted reference values are

\[
\Delta=\frac3{20}-\frac{80\pi}{1053\phi},\quad
\eta_\star=-\ln\Delta,\quad p_\star=\frac{\Delta^2}{1+\Delta^2},
\]
\[
H_\star\simeq0.0000804963073331,\qquad
G_\star/A_\star\simeq1552.866263575.
\]

This last number is a dimensionless ratio in the declared area chart. It does
not assign a physical area unit. A source varying the state of one region is
also distinct from enlarging a region by independent boundary copies. The
latter scales area and entropy together and preserves the reference density;
the former has \(G(u)/A_\star=u^3/(8H_\star)\). A single source curve therefore
does not prove a constant universal Newton coefficient.
There is also an exact functional distinction: integrating the required UV
entropy derivative gives \(S_{\rm UV}/k_B=C-H_2\) on this curve. Substituting
the varying \(G(u)\) into the absolute quotient \(A/(4G(u))\) instead gives
\(2H_2\), whose variation fails the declared balance by \(3dH_2\).
The local tangent identification is not an absolute global area-entropy
functional with a state-dependent coefficient silently held constant.

## 2. Full modular source and a positive realization

On the small-population branch, \(H_2\) is strictly increasing. The state is
uniquely fixed for \(u\ge u_{\min}=\sqrt{H_\star/\ln2}\simeq0.01077644\):

\[
p(u)=H_2^{-1}(H_\star/u^2),\quad
q(u)=\ln\frac{1-p(u)}{p(u)},\quad
\rho(u)=\frac{1-p(u)}4P_3+\frac{p(u)}4P_5.
\]

Both rail projectors have rank four; their labels are eigenvalues, not ranks.
The normalized modular operator and its first two population sources are

\[
K_\rho=-\ln[(1-p)/4]P_3-\ln[p/4]P_5,
\]
\[
p_u=-\frac{2H}{uq},\qquad
p_{uu}=\frac{6H/u^2+p_u^2/[p(1-p)]}{q},
\]
\[
q_u=-\frac{p_u}{p(1-p)},\qquad
q_{uu}=-\frac{p_{uu}}{p(1-p)}+
\frac{p_u^2(1-2p)}{p^2(1-p)^2}.
\]

The identity part of the normalized modular operator is retained. Executed
matrix checks give \(e^{-K_\rho}=\rho\),
\(\operatorname{Tr}\rho K_{\rho,u}=0\), and
\(\operatorname{Tr}\rho K_{\rho,uu}=\operatorname{Cov}_{KM}
(K_{\rho,u},K_{\rho,u})\). Thus a normalized state family has a nonzero state
metric but zero normalized log-partition Hessian after its source contact.
The exact reference relative-entropy identity is retained. Away from the
reference point \(dH=q(u)dp\); freezing \(q=2\eta_\star\) is incorrect.

At the reference point the former arbitrary area-source label is fixed to

\[
b_{\rm required}=\frac{H_\star}{2\eta_\star^2p_\star(1-p_\star)}
\simeq0.180692996836.
\]

For the round-screen incidence of section 3, set

\[
L(u)=\frac{3P_3+5P_5}{u},\qquad
\beta(u)=\frac{u q(u)}2,\qquad B(u)=e^{-\beta(u)L(u)/2}.
\]

This is an all-order positive realization: \(B^\dagger B\), normalized by
its trace, equals the displayed \(\rho(u)\). Twelve equal commuting positive
factors \(e^{-\beta L/24}\) have product \(B\). Its contacts are
\(\beta_u=q/2+uq_u/2\) and \(\beta_{uu}=q_u+uq_{uu}/2\).
A left unitary attachment to the complete \(B\) leaves its Gram operator
unchanged. Arbitrary interleaved unitary attachments need not do so.

This constructs the clock profile required by the recovered law once the
screen and operator normalization are declared. It does not prove that an
independently recovered full selector already generates that profile. Scalar
identity costs also remain invisible to the normalized state while changing
the absolute transfer action. At \(u_{\min}\) the modular gap has a square-root
endpoint and source derivatives diverge; the differential formulas above
apply to the interior.

## 3. Actual incidence, coframe contacts and fixed-volume curvature

The calculation rebuilds the twelve icosahedral vertices, twenty faces and
thirty edges. With vertex/face incidence \(B_{vf}\) and face/edge differential
\(D_{fe}\), it verifies \(B_{vf}B_{vf}^T=5I+2A_{\rm ico}\),
\(\dim\ker B_{vf}=8\), and hidden spectrum \(3^4\oplus5^4\).
Metric face and edge Hodge matrices give

\[
L_2=H_2^{1/2}D_{fe}H_1^{-1}D_{fe}^TH_2^{1/2},\quad
G=E_0^TH_2E_0,\quad Q=H_2^{1/2}E_0G^{-1/2},\quad L_{\rm hid}=Q^TL_2Q.
\]

The moving hidden frame is differentiated. The full six-source Jacobian and
36 matrix Hessian entries are stored. Its five spatial shear singular values
are all \(4.091551778\). At the symmetric reference point their mean rail,
area and occupation gradients vanish, although the operators split quartets.
For fixed-volume affine polyhedral shear the area Hessian is exactly
\((8A_0/15)I_5\). The uncoarse-grained hidden entropy then also has a
within-quartet term; a binary occupation entropy cannot silently replace it.
Those flat cell-shape variations are not geodesic-ball curvature variations.

For an actual round geodesic ball of reference radius \(R\), sectional
curvature \(K\), and fixed spatial volume, the derived boundary expansion is

\[
u(K)=\frac{A(K)}{A_0}
=1-\frac{R^2}{5}K-\frac{3R^4}{175}K^2+O(K^3).
\]

Assigning the canonical incidence directions to that spherical screen gives
\(L_{\rm hid}^{\rm norm}=L_0/u\), preserving the two maximally mixed quartets,
and hence

\[
(L_{\rm hid}^{\rm norm})_K=\frac{R^2}{5}L_0,\qquad
(L_{\rm hid}^{\rm norm})_{KK}=\frac{4R^4}{35}L_0.
\]

An exact fixed-volume radial solve checks both jets. The raw spherical Hodge
normalization is recorded separately. Combining these jets with section 2
fixes, in the displayed normalized convention at \(R^2=\phi+2\),

\[
\beta_K=-5.12255484995,\qquad \beta_{KK}=-2.61780764456.
\]

Fixed \(\eta_\star\) surface geometry alone gives the opposite entropy–area
sign. The constructed profile supplies the required compensating source.
The incidence-to-physical-screen identification and its derivation from the
complete selected clock remain declared premises of this realization.
The separately calculated curved coordinate-polyhedron has a different
boundary coefficient and is not substituted for this ball.

## 4. All twelve signed-history phases and the shared source

For the actual signed sixty-four-state carrier, the full chronological real
source decoder has rank **18**, with kernel dimension 46. A one-phase decoder
has rank 13; premature restriction to the retained thirteen-dimensional input
has rank only 5. The full period is therefore necessary. Its classical decoder
kernel is not the quantum fifty-one-dimensional hidden complement.

A declared common probe potential \(V=\alpha_{\rm URT}\|P\|^2/2\), with all
twelve log-determinants retained, has one shared eighteen-coordinate stationary
point: gradient norm \(7.95\times10^{-16}\) and minimum Hessian eigenvalue
2.44623. The probe declares its regulator and potential; action density per
clock cell is not an assumption of uniform physical exposure.

Chronological raw links are \(R_k=\mathcal A_{k+1}^{-1}\mathcal A_k\).
Their product telescopes to identity when \(\mathcal A_{12}=\mathcal A_0\).
Polar factors do not generally telescope. On an executed common nonstationary
field, polar return distances from identity range from 0.822 to 1.143 while the
raw product is identity to roundoff. Weighted positive history returns and
phase exposures are calculated separately and need not be uniform.

The Walsh degree-five source is blind to every decoder phase, commutes with
the signed history and A5 action, and has zero overlap with the hidden-eight
quantum rail carrier. An explicit deformation at the Dirac operator preserves
\(Q=\chi+D^2\) and the generation block. Its full-period trace-log shift is
constant in every shared history coordinate within the declared decoupled
completion; it therefore preserves that completion's history-field stationarity while
altering other hidden response data. Phase exposures in the declared weighted
full64 history are checked rather than assumed unchanged. A physical support
that removes the deformed sector can remove its observable contribution.
This is a completion comparison for
typed history slots, not permission to append terms to a fully fixed action.
On a supplied mathematical primitive-source tangent the comparison changes
the first and second full64 determinant contacts by approximately 15.38534
and 4.60735, verified to 3.66e−15. History-field stationarity does not imply
identical charged-source response or an identical absolute action.

The signed cube and exterior Fock space have the same total A5 character but
different degree decompositions and outer traces: \(\operatorname{Tr}U_{64}=0\)
versus \(\operatorname{Tr}\Gamma(C)=\det(I+C)=2\). A dimension count does not
identify their histories. The former generation-depth filter remains retired.

## 5. Physical gauge carrier and source pullback

The recovered exterior-family construction is extended to explicit gauge
matrices on sixteen states, and to three generations with conjugates on
ninety-six states. The v61 certificate declares the three-plus-two split,
compact gauging and physical family dictionary as premises; these matrices
realize that conditional identification entry by entry. The commuting color,
weak and hypercharge actions live on this declared physical carrier. The shared-five frame inside H13 does
not by itself furnish commuting color and weak actions.

For electron-normalized hypercharge and the usual fundamental generator trace
normalization, the computed indices per generation are
\((k_Y,k_2,k_3)=(10/3,2,2)\). Three generations and their conjugates give
\((20,12,12)\). A declared common unweighted parent trace therefore has
relative hypercharge index \(5/3\) and \(\sin^2\theta=3/8\) at that action
scale. These are representation-theoretic trace ratios. They neither select
the common scalar action coefficient nor give a low-energy running coupling.

All sixty A5 matrices give actual End4 projectors of ranks 1,3,3,4,5. The weak 3
seed lifts to the 120-element binary icosahedral group; the color 3′ seed embeds
in SU3. An explicit orthogonal intertwiner maps its adjoint 3′+5 into the hidden
response carrier, with maximum equivariance residual 3.36e−15. Density-coordinate
BKM and modular-coordinate Kubo–Mori metrics are related by their actual Gibbs
Jacobian; choosing one without that source map would change the normalization.

The current common-history amplitudes enter an explicit covariant 48/96-state
Higgs/Yukawa insertion. All twelve gauge Ward/contact tests pass; their
log-determinant contact-minus-connected residual is at most 3.33e−16. This uses
the declared history continuation's matrices, without identifying them as
physical pole masses. Full matrices, charge assignments, anomaly sums and
charged-link contacts are included in the gauge report. Gauge algebra, hidden
geometric incidence, history and source response retain their distinct maps.

## 6. Repeated correlated photon transfer

The ten K5 face hats remain correlated through six cycle variables. With
\(F=Dx=\delta Dy\), \(W(y)=\prod_f(1-|Dy|_f)_+\), and
\(s=ag^2/2\), the exact N-slice trace is

\[
Z_N=\left(\frac\delta{2\pi}\right)^{6N}
\int\prod_t d^6y_t W(y_t)
K_s\bigl(\delta(y_t-y_{t+1})\bigr),\qquad y_N=y_0.
\]

It is not an integral of \(W^N\) at one common point. At fixed clock the
narrow-hat leading operator is rank one. The controlled scaling
\(ag^2=\tau\delta^2\) instead retains the nontrivial kernel

\[
M_\tau(y,y')=\exp[-(y-y')^TG_E^{-1}(y-y')/(2\tau)]
\quad\hbox{in }L^2(Wdy/\!\int Wdy).
\]

All temporal returns and equal-time contacts enter

\[
C(\omega)=\sum_rR_r\frac{1-r_r^2}
{1-2r_r\cos\omega+r_r^2},\qquad\Gamma=C^{-1}
\]

on the six-dimensional Bianchi image. Direct transfer products, spectral tail
bounds, an explicit source contact and a derivative of the ground log
eigenvalue independently check the same susceptibility.

| Confined clock ratio \(\tau\) | Equal-time coefficient | Static coefficient | Inverse static coefficient for \(F/\delta\) | Frequency-squared coefficient |
|---:|---:|---:|---:|---:|
| 0.25 | 0.153685 | 0.196066 | 5.10032 | 0.800284 |
| 1 | 0.178729 | 0.191964 | 5.20930 | 0.200036 |
| 16 | 0.188924 | 0.189819 | 5.26818 | 0.0125018 |

These are S5-projected finite quadrature estimates. Last-refinement static
drift is 0.30–0.67% and frequency drift 0.19–0.30%; the unsymmetrized finite
tensor retains 1.2–1.6% symmetry residuals. These diagnostics are not rigorous
error intervals. They do not replace the more accurate cached one-slice
covariance or its replicate error bars.

Analytically \(\Gamma_{F/\delta,\omega^2}=1/(5\tau)+O(\tau^{-2})\).
Physical-time normalization is essential: with \(j=aJ\) and \(\omega=a\Omega\),
\(C_{\rm phys}=aC_{\rm slice}(a\Omega)\) and
\(\Gamma_{\rm phys}=\Gamma_{\rm slice}(a\Omega)/a\).
The triangle-area pullback \(B_2^TB_2=5I\) then yields

\[
\frac{5a}{4\delta^2}\Gamma_{F/\delta,\omega^2}
=\frac1{4g^2}+O(1/(g^2\tau)).
\]

This recovers the stated electric kinetic coefficient as a function of the
Hamiltonian's coupling. It does not determine that coupling. The restriction
has no magnetic potential, charged matter or full spatial momentum and hence
does not certify the complete four-dimensional massless photon residue.

## 7. Common variation and what the construction fixes

The contact-complete joint variation and bordered constraint Hessian remain
the governing variational equations. The new sources enter them as concrete
operator jets, not as independent fitted response constants. For an actual
selected transfer, all source-dependent clocks, measures, projectors, support
boundaries, hidden determinants and constraint-multiplier contacts remain.
Constructing a positive normalized rail state does not determine the absolute
selected free energy or all matter interactions.

| Result | Established scope |
|---|---|
| Single-entropy factor eight and unique diagonal source curve | Exact consequences of the recovered nonlinear area law on its declared branch |
| Positive round-screen clock profile and matrix curvature contacts | Constructed to all orders conditional on the physical screen identification |
| Actual incidence metric Jacobian/Hessian | Executed geometric completion; spherical and polyhedral sources distinguished |
| Full-period decoder rank 18 and chronological return identities | Actual recovered signed cube and specified source maps |
| Gauge matrices, charges, trace indices and covariant matter contacts | Entrywise realization of the recovered conditional exterior-family representation; no predicted running couplings |
| Multi-slice correlated susceptibility and leading electric coefficient | Exact transfer formulas plus quantified quadrature for the free-electric local graph restriction |
| Historical spectral normalization and generation-depth filter | Superseded physical routes; archived calculations retain their declared mathematical scope |

To identify the resulting candidate as a complete physical theory, the same
selected action must produce the constructed modular clock, regional area
normalization, physical matter embeddings and interacting poles. The derived
conditional source realization is now explicit and testable; those physical
identifications are not replaced by a finite-test count.

## 8. Recovery, checks and reproducible files

Recovered source excerpts and chronology are saved in
`combined_source_work/recovery/combined_chat_recovery.json`. The available
complete files and targeted conversation recovery do not constitute a verified
reading of one hundred complete conversations. Retrieval failures are not
evidence that equations never existed.

`run_combined_sources.py` validates the executed records, source hashes and
finite matrices without repeating the numerical quadrature. Its `--recompute`
option reproduces the finite constructions; `--reintegrate-photon` explicitly
repeats the new correlated kernel calculation. Python, NumPy and SciPy suffice.

Detailed derivations are in the gravity, species, gauge, photon and review
subfolders of `combined_source_work/`, with JSON checks and NPZ operators.
The continuation package includes this report and updates the current theory
specification and governing ledger. The independent audit distinguishes exact
identities, conditional completions and numerical approximation errors.
There are 142 named checks across the entropy curve, gauge join, photon
response and two independent reviews, plus the direct metric, round-transfer
and signed-history assertions. Every saved check record passes. Their finite
scope is the one stated in each record.

Primary background sources: [Discrete Exterior Calculus](https://arxiv.org/abs/math/0508341),
[Delaunay Hodge Star](https://arxiv.org/abs/1204.0747), and
[Entanglement Equilibrium and the Einstein Equation](https://arxiv.org/abs/1505.04753).
They supply the established geometric/entropy frameworks; they do not validate
Cathedral's new incidence, clock or matter identifications.