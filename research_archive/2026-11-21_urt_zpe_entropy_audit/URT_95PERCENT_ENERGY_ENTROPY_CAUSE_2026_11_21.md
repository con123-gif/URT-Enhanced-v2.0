# Why the original entropy–ZPE ratio was 0.956157373..., not 1

21 November 2026. **Scope:** standalone URT magnetic ZPE, not Riemann hypothesis and not the full Cathedral. **Result class:** independent computational REVIEW plus an exact GR-normalization identity. **Scientific status:** the cause of the historical **numerical coefficient difference** is identified; no cosmological measurement is reproduced, no new parameter is fitted, and no 4.38% counterterm is introduced.

## Provenance: keep all established mathematics, but do not mix quantum states

Source 1: `research_archive/2026-11-21_urt_entropy_frustration/FRUSTRATION_CORRELATION_CERT.py` calculates `2*pi*d/s_star=0.956157...`, with `d=Tr(sqrt(2I-A_plus))-Tr(sqrt(2I-A_minus))` and `s_star=ln(4)+H2(Delta^2/(1+Delta^2))`.

Source 2: `research_archive/2026-11-21_urt_zpe_gaussian_joint/URT_JOINT_ZPE_ENTROPY_THEOREM.md` quantizes **the same actual four-site degree-two magnetic cycle** and obtains both its ZPE and its physical-site gauge-invariant entanglement entropy from one pure Gaussian ground state. Source 3: `research_archive/2026-11-21_urt_prime_pair_information/PRIME_URT_TWO_CARRIER_INFORMATION_THEOREM.md` distinguishes the degree-two finite cycle from the degree-four compressed prime shifts. Source 4: `research_archive/2026-11-21_urt_zpe_complete_3d/URT_ZPE_THEORY_COMPLETE_CONDITIONAL_2026_11_21.md` extends the original finite oscillator to a genuine three-dimensional connected model and proves an entanglement boundary area law, not the Bekenstein–Hawking coefficient.

These are not redundant calculations, and the finite `2I-A` is mathematically **valid**. Its physical horizon normalization remains an **unproved identification**.

## 1. What the 95.6157% number actually measures

Take the Gibbons–Hawking temperature and horizon entropy in 3+1D:

`T_GH=hbar*c/(2*pi*k_B*R)`, `S_H/k_B=pi*R^2/l_P^2`, `l_P^2=hbar*G/c^3`.

For a spatially flat de Sitter horizon with radius R, the geometric energy within the Hubble sphere is `E_MS=rho_dS*(4*pi*R^3/3)=c^4 R/(2G)` (Misner–Sharp energy). It obeys the **algebraic identity** `E_MS=T_GH*S_H`. This statement is not a universal de Sitter first-law sign convention; the first law of cosmological horizons and matter Killing energy is subtler.

The *historical proposed* URT identification was `E_URT=N*d*hbar*c/R`, `S_H=N*k_B*s_star`, i.e. one **eight-state** entropy carrier is counted for one **four-site magnetic oscillator loop**, with no explicit map between their Hilbert spaces. Therefore

`E_URT / (T_GH S_H) = 2*pi*d/s_star`.

Equality to one is **not a property of either microscopic theory**. It is an additional condition on two independent spectral/entropy coefficients, `2*pi*d=s_star`. The fact that they are numerically close does not select an entropy-based physical horizon map.

## 2. Exact numerical decomposition, zero fitting

`phi=(1+sqrt(5))/2`, `theta=2*pi/phi^2`, `Delta=3/20-80*pi/(1053*phi)`, `p=Delta^2/(1+Delta^2)`.

- Finite four-site original relative ZPE: `d = 0.21097460556941908232333723758594939...`.
- Relative energy coefficient: `2*pi*d=1.3255925419017825327143299113809968...`.
- Visible entropy `ln(4)=1.3862943611198906188344642429163531...`.
- Hidden/tag correction `H2(p)=0.000080496307333131436074330174565195...`.
- Assumed independent master entropy `s_star=1.3863748574272237502705385730909183...`.
- Exact coefficient difference `s_star-2*pi*d=0.060782315525441217556208661709921576...`.
- Breakdown: `ln(4)-2*pi*d=0.060701819218108086120134331535356381...`; hidden term `0.000080496307...` is **only 0.1324337624% of the coefficient mismatch**.
- Historical normalized ratio `0.95615737316656298383899791643961413...`, 4.3842626833437016% short of the chosen target.
- Equality to 1 *under those old assumptions* would require `d=s_star/(2*pi)=0.22064841153786430564736688365433076...`, which is `0.0096738059684452233240296460683813783...` above the native `d`. This is a diagnostic difference only; **do not add it to the Hamiltonian, entropy or gravity**.

The preexisting hidden-entropy correction is too small and of the opposite sign. This does not show that interactions cannot modify the physical theory; it shows they are not **needed to explain the arithmetic fact that two unrelated coefficients differ**.

## 3. Same Hamiltonian, same state: the actual entanglement differs

For the original `L_F=2I-A(e^{iF})`, the canonical complex oscillator has pure Gaussian ground state with `E0(F)/(hbar*omega0)=Tr sqrt(L_F)`. Its physical-site reduced covariance is `Q_A=R[(L_F^-1/2)_A]/2`, `P_A=R[(L_F^1/2)_A]/2`. Its entropy is `S_A/k_B=2*sum_j h(nu_j-1/2)`, where `nu_j=sqrt(eig[(L_F^-1/2)_A (L_F^1/2)_A])/2`. Both ZPE and entropy are gauge invariant with physical-site local algebras.

Native eigenvalue results, checked independently by the attached script:

| Flux sector | `E0/(hbar omega0)` | adjacent two-site cut `S_A/kB` | diagonal two-site cut `S_A/kB` |
|---|---:|---:|---:|
| + (`F=theta`) | 5.203810807053427 | 0.542933527495885 | 0.854893665050608 |
| − (`F=pi-theta`) | 4.992836201484024 | 1.438786007428358 | 1.696483305074630 |

**Higher flux gives higher ZPE but lower entanglement for the very same physical-site cut.** The entropy `s_star=1.38637...` is not the entropy of these states: the total Gaussian vacuum is pure and has total entropy zero; its reduced entropy is cut- and sector-dependent. Treating `S_A/2` as a possible 'entropy per physical site' *for stress testing only* gives `2*pi*d/(S_A/2) = 4.883074906115` for + and `1.842654202999` for −, neither close to the old 0.956. The cut and sector dependence show why this is NOT a proposed replacement horizon count.

The exact bosonic modular Hamiltonian of the reduced Gaussian state has per-mode dimensionless entanglement energies `epsilon_j=ln[(nu_j+1/2)/(nu_j-1/2)]`, doubled for two real polarisations. For the adjacent two-site cut:

- + sector: `epsilon={3.09022558557, 4.22208496770}`;
- − sector: `epsilon={1.51877224577, 4.84273039699}`.

Thus the full reduced-state modular spectrum has actual structure; it cannot be replaced by the independent scalar `s_star` and treated as a Gibbons–Hawking horizon entropy without a physical horizon-algebra or modular-flow identification. A single thermal *temperature* can coexist with different mode energies, so the inequality of modular levels alone is **not** proof that a thermal identification is impossible.

## 4. Conclusion and constructive next mathematical target

**Answer:** The 4.384% is currently a difference between a **finite four-cycle relative ZPE** and the **entropy of an independent eight-state master density**. Horizon thermodynamics supplies `2*pi` in the chosen background normalization but **does not derive the correspondence between these two quantum systems**. It is therefore not a demonstrated deficit in dark energy, nor is frustration mathematically required to make the ratio exactly 100%.

What must be derived, using no fitting:

1. A *physical horizon subsystem algebra* for the existing full three-dimensional magnetic Gaussian model (or an explicit native map from the eight-state master density into it), not arbitrary selection of 'one four-cycle = one horizon carrier'.
2. The **same-state** horizon modular Hamiltonian and its entropy/energy/area normalization, with the correct gravitational energy and first-law convention; compare with `T_GH` only afterwards.
3. Its boundary coefficient in the thermodynamic limit and the stress tensor; test whether an exact `E=T_H S_H` identity follows from the dynamic theory rather than imposing it.

**RESUME HERE:** The next calculation should use the original finite/3D magnetic Gaussian operator and derive a natural gauge-invariant boundary modular energy observable. Do not fit `0.0096738`, `0.0607823`, introduce a 4.38% tax, or interpret the historical 95% as experimentally validated. This review does not close a physical gate.
