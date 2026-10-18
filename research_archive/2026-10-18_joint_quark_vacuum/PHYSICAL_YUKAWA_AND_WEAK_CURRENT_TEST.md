# Physical tree-level matching of original H64 quark sources — 18 October 2026

This calculation **tests physics**, rather than Koide or entropy identities. The original Oct 8 `golden_species_operators.npz` (SHA256 `9bfd183c01b43e3a589917f334ec5758cefb912cf30f55147b58ccb496b0399b`) and unmodified common 13D vacuum stationarity (`||x||=0.374531261456179`) are used, with no experimental inputs. See separately archived `JOINT_QUARK_URT_H64_SOURCE_RESULT.md` for the stationary construction.

**Explicit tree-level physics hypothesis:** The common-left source matrices `A_u(x), A_d(x)` are Higgs Yukawa matrices, so fermion poles are proportional to singular values of `A_f`, and the charged W matrix is `V=U_u†U_d` where `U_f` diagonalize `A_f†A_f` on the same left-handed Q_L Hilbert space. This is a physical matching hypothesis, **not** yet a theorem of the original histories.

- Predicted up Yukawa singular values: `(0.01212119524, 1.01392452478, 1.14991044980)`.
- Predicted down: `(0.01210277201, 0.85014892917, 0.98613107599)`.
- Predicted mass ratios: `u/t=0.01054099, c/t=0.88174216; d/b=0.01227299, s/b=0.86210540`.
- Reference mass ratios from user-supplied masses (note different running schemes/scales): `u/t≈0.000012508, c/t≈0.00735422; d/b≈0.00111722, s/b≈0.02234450`.
- Predicted `|V_CKM|`:
```
[[0.999915230, 0.009301538, 0.009111247],
 [0.009077648, 0.004841904, 0.999947075],
 [0.009334332, 0.999945017, 0.004778378]]
```
- `||V†V-I||F=6.59e-16`; predicted Jarlskog `J=+2.697667e-7`. The user-supplied CKM benchmark is `|Vus|≈0.2243, |Vcb|≈0.04218, |Vub|≈0.003734, |J|≈3.14e-5`.

**Conclusion for this physical dictionary:** Fail. It gives nearly degenerate second/third-generation masses, radically incorrect second/third weak-current mixing, and small CP violation. No rescaling of the Higgs vacuum can repair dimensionless ratios. This does **not** globally falsify the URT/Cathedral model or other pre-existing flavour branches.

**Separate full H64 spectral check:** Overlap-selected positive *Hessian* eigenvalues u `(0.01519185,0.50637102,0.83822863)`, d `(0.00828285,0.19895677,0.37158069)` are not on-shell fermion poles absent an inverse Dirac propagator `S_f^-1(p)`, momentum-dependent self-energy and SU(2)_L W generator. A provisional projected current has unitarity defect 0.0623 and is not physically normalized. Source-dependent lower-frame projections cannot be used as CKM matrices without the common-left charged-current intertwiner.

The previously calculated mixed source Hessian response `-0.867190411` is **not itself a weak force** or a particle mass: it is common-vacuum susceptibility. The physical task is to derive a gauge-covariant action with kinetic terms, actual Higgs/Yukawa/history coupling, mass-pole self energies and a charged-current Ward/Slavnov-Taylor identity from URT, then compute masses/CKM without fitting.

Executable source and complete numerical files available in the same-session reproducible bundle `URT_H64_QUARK_PHYSICAL_MATCHING_AUDIT_2026-10-18.zip`. The original binary has not been edited.
