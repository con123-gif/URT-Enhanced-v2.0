# Lytollis–URT finite-spectrum closure: consolidated result

## Scope completed

The executable audit now reconstructs both finite-operator branches from the fixed centred-icosahedral data:

1. the direct `5 + 4_3 + 4_5` entropy vacuum and its unique Clebsch/charge maps;
2. the oriented `5 + 3` chiral vacuum, its 30-fold orbit, covariance response and complex charge-word operator;
3. the covariance-composed, canonically normalized relative operator over every oriented vacuum branch;
4. the rank-depth mass spectrum, CKM/PMNS matrices, Jarlskog invariants, Hessians and branch action.

No measured masses or mixing entries enter any minimization, intertwiner construction or URT branch selection.

## Exact structural results

- `A5` order: `60`.
- Each map space `5 -> Hom(3,3')`, `4_3 -> Hom(3,3')`, `4_5 -> Hom(3,3')` has multiplicity `1`.
- Each charge-plane embedding into `4_3` and `4_5` has multiplicity `1`.
- Direct 13-dimensional vacuum:
  - potential `-0.075488620419519`;
  - stationarity residual `4.78e-12`;
  - minimum Hessian eigenvalue `0.692812533292`;
  - orbit size `15`.
- Oriented chiral vacuum:
  - coefficients `(0.9156221283301194, 0.3684186569566095, ~0, 0.9959358591260835)`;
  - potential `-0.435555231880576`;
  - stationarity residual `3.85e-15`;
  - minimum Hessian eigenvalue `0.925585820962`;
  - orbit size `30`;
  - 250 generic full-space starts plus all alphabet-aligned starts found no lower value; numerical gap `-8.88e-16`.

## Operator ordering resolved

For `T_tilde_f = U_f Sigma_f V_f*`, the phrase “followed by insertion of the depth matrix” is

`Y_f = U_f D_f V_f*`.

Thus the rank-depth entries are the physical singular values. The preliminary singular values `Sigma_f` determine the singular frames; multiplying `Sigma_f D_f` would define a different, more hierarchical operator.

Because `T: 3 -> 3'`, the unprimed left-handed diagonalizer is the source singular frame `V`, equivalently the eigenbasis of `T* T`.

## Forced vacuum dressing

Linearity of the covariance map gives

`K_raw(f,e) = G_e + T_f* T_f`.

Canonical normalization of the vacuum generation metric gives

`R(f,e) = G_e^(-1/2) K_raw(f,e) G_e^(-1/2)`.

The URT Gaussian relative spectral action `Tr(R-I-log R)` selects oriented branch `15` without experimental targets.

The selected output is

```
|V_CKM| =
[[0.86145678, 0.48003792, 0.16569795],
 [0.44825694, 0.57503999, 0.68439369],
 [0.23865861, 0.66248970, 0.71003483]]

J_CKM = 8.845478952730e-03
```

```
|U_PMNS| =
[[0.13278548, 0.82524269, 0.54894674],
 [0.46032975, 0.54069306, 0.70409341],
 [0.87776109, 0.16317326, 0.45045527]]

J_PMNS = -5.461512694081e-03
```

## Scientific verdict

The earlier statement that the explicit intertwiners, vacuum matrices and numerical spectra cannot be computed is false: they are now fully executable.

The resulting test is not a confirmation of the separately frozen CKM/PMNS layer. The action-selected, uniquely dressed operator does not reproduce those matrices. Even the best non-action-selected branches remain substantially displaced. Therefore the current exact finite operator is parameter-free and computationally closed, but its claimed observed mixing outputs are not derived by this operator.

This narrows the theory's remaining issue to a falsifiable structural choice: either another composition law must be derived uniquely from the URT action, or the frozen mixing layer must be withdrawn. Choosing a branch or composition because it resembles observation would reintroduce tuning and is excluded.