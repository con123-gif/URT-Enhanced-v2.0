# Coupled cycle 26 — spinor-lift kernel about its π-flux vacuum

Classification: **PROVED**. About the spinor all-π vacuum with the
4_5 condensate, at the large-vev slice, the gauge-invariant
transverse kernel is positive definite and identity-like, not
Maxwell-like. There is no unique derived κ, so α_eff was not
compared to R_α. Advances a physical ARF? No.

`results.json` records `classification: CONDITIONAL` only because
the predeclared 10^{-6} Ward threshold fails at r_* for the same
BdG round-off reason as cycle 25. Gauge invariance and the Ward
identity hold at r = 100 to 10^{-8}; H1, H2 (not usable) and H3
(ye-independence) all pass their predeclared tests.

## Background
E_min(A_π) = 9.253254, matching alt 34’s lifted spinor doublet
(0.747 → 9.253). The A = 0, r = r_* = 1.734931582640836×10^6,
T = 0 control recovers Π_T ≈ −0.141772 I (alt 34: −0.141771 I;
relative 1.0×10^{-5}). Finite-difference ε = 0.02 versus 0.05
agrees to relative 4.3×10^{-5}. Gauge invariance about A_π holds
to 10^{-13} at r = 100 and to 3×10^{-9} at r_*.

## Transverse kernel about A_π
At (r_*, T = 0):

    Π_T = +0.141772 I_19
    (identity residual 4.58×10^{-5}; all 19 eigenvalues in
    [0.141761, 0.141783]).

This is precisely the sign reverse of the A = 0 control. It is
positive definite but not Maxwell-like (residual 0.4588, generalised
κ in [0.02708, 0.18559], spread 2.326, κ_iso = 0.035443 = c_I/4).
The same usability tests as cycles 25 / alt 34–35 therefore reject
a unique Maxwell coefficient.

At (r_*, T = η) the kernel remains positive definite and
identity-like (c_I = 0.091267, identity residual 0.0148, Maxwell
residual 0.451, spread 2.255). The unpaired-doublet estimate
tanh(E_min/(2η)) × 0.141772 ≈ 0.09184 is within 0.6 %.

## y_even dependence
The predeclared comparison of r_* with r_*/10 passes at both
temperatures (T = 0: c_I = 0.141772 versus 0.141753; T = η:
0.091267 versus 0.091246). At r = 100 the kernel is already
positive definite (c_I = 0.1062 at T = 0) and is approaching the
same identity. In the large-vev limit the leading piece is
independent of y_even; pairing corrections vanish as 1/ye².

## α_eff versus R_α
Not compared: the kernel is not a unique positive Maxwell
coefficient. No rewriting of +0.141772 or of κ_iso was promoted
after the fact. Look-elsewhere was not run.

## Integrity
Predeclaration sha256:
`2010f21ddb51b29d746ae0a56b8ffc4772f51ea3db13b52af716062df22048c4`.
Test-script hashes (original and the scipy.linalg.eigh patch) are
in HASHES.txt. No ARF target was used.
