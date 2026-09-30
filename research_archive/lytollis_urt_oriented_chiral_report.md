# Oriented 30-vacuum chiral closure

## Vacuum certificate

- Fixed-subspace coefficients: `(0.9156221283301194, 0.3684186569566095, 1.948762300704804e-16, 0.9959358591260835)`
- Stationarity residual: `3.849e-15`
- Minimum Hessian eigenvalue: `0.925585820962`
- Orbit size: `30`
- Best full-space multistart gap relative to the chiral root: `-8.882e-16`

## Exact charge-word spectrum

The complex word is

`w_f = q_f/3 + i Delta g(q_f)/5`,

and the exact squared-singular polynomial is

`lambda^3 - n lambda^2 + (8n^2/27 - 5|s|^2/108)lambda - 20|p|^2/27`.

All four numerical blocks agree with this polynomial to the errors recorded in the JSON output.

### Charge-word CKM

```
[[0.945952135 0.259055421 0.195102144]
 [0.170671333 0.113904587 0.978722147]
 [0.275764127 0.959122533 0.063546142]]
```

`J = 8.229963330039e-05`

### Charge-word PMNS

```
[[0.305573684 0.673965556 0.672603266]
 [0.001149709 0.706651707 0.707560628]
 [0.952167738 0.215438609 0.21670903 ]]
```

`J = 4.813667063423e-17`

## Vacuum-dressed relative operator

Linearity of the covariance response and canonical normalization force

`K_raw(f,e) = G_e + T_f^*T_f`,

`R(f,e) = G_e^(-1/2) K_raw(f,e) G_e^(-1/2)`.

The URT relative spectral action selects branch **15** with action
**111.886875361228**.

### Action-selected dressed CKM

```
[[0.86145678  0.48003792  0.165697953]
 [0.44825694  0.575039988 0.684393694]
 [0.238658611 0.662489703 0.71003483 ]]
```

`J = 8.845478952730e-03`

### Action-selected dressed PMNS

```
[[0.132785478 0.825242689 0.548946738]
 [0.460329753 0.540693064 0.704093409]
 [0.877761093 0.163173264 0.45045527 ]]
```

`J = -5.461512694081e-03`

## Decisive result

The computation is no longer missing. The oriented vacuum, intertwiners, spectra and mixing matrices are all explicit. The result is a stringent internal test: the present raw operator does **not** generate the separately frozen CKM/PMNS numbers. A final theory must therefore derive one precise composition of the vacuum covariance response with the charge-word Dirac block. Merely listing both outputs is not enough, and selecting a vacuum pair by closeness to observation would be tuning.