# Lytollis–URT finite-operator erratum

## Retraction

The previously reported dressed CKM and PMNS matrices are not outputs of the finite Dirac operator stated in the theory. The conclusion that the frozen mixing layer must be withdrawn is therefore retracted.

## Exact error

Write the declared operator as

\[
\widetilde T_{f,e}=A_e+B_f,
\]

with

\[
A_e=\mathcal C_5(H_e)+\mathcal C_{4_3}(\Xi_{3e})+i\mathcal C_{4_5}(\Xi_{5e}),
\]

\[
B_f=\mathcal C_{4_3}(Jq_f/3)+i\mathcal C_{4_5}(J\Delta g(q_f)/5).
\]

The physical left-handed positive operator is

\[
K_{f,e}=\widetilde T_{f,e}^{\dagger}\widetilde T_{f,e}
=A_e^{\dagger}A_e+B_f^{\dagger}B_f+A_e^{\dagger}B_f+B_f^{\dagger}A_e.
\]

The retracted calculation instead used a covariance-level ansatz equivalent to

\[
K^{\rm wrong}_{f,e}=G_e+B_f^{\dagger}B_f,
\]

then whitened it by \(G_e^{-1/2}\). This was not derived from the URT action, \(G_e\) was not proved equal to \(A_e^{\dagger}A_e\), and the interference terms

\[
A_e^{\dagger}B_f+B_f^{\dagger}A_e
\]

were omitted. Those terms contain the relative vacuum/charge orientation and complex interference that determine mixing and CP violation.

The oriented audit also reduced the charge block to the single \(4_3\to\operatorname{Hom}(3,3')\) Clebsch map, while the declared operator contains the full \(5\oplus4_3\oplus4_5\) amplitude sum. It therefore evaluated a different model.

## Additional unsupported assumptions

1. The passive metric was effectively set to the vacuum response or identity without deriving it from the passive modular operator.
2. The score \(\operatorname{Tr}(R-I-\log R)\) was applied after an invented normalization rather than to the relative operator fixed by the URT history state.
3. Multiplicity-one intertwiners were treated as having uniquely fixed relative signs and phases. Multiplicity one fixes each map only up to scalar normalization; the relative phase convention in their sum must be fixed by the real structure, grading, star operation and common chain-complex orientation.
4. The SVD-depth ordering was interpreted as replacement \(U\Sigma V^\dagger\mapsto UDV^\dagger\) without an explicit derivation from the stated finite action.
5. A multistart numerical minimum was described too strongly; it is not a formal global certificate.

## Correct calculation

The computation must retain the declared operator exactly:

\[
\widetilde T_{f,e}
=\mathcal C_5(H_e)
+\mathcal C_{4_3}(\Xi_{3e}+Jq_f/3)
+i\mathcal C_{4_5}(\Xi_{5e}+J\Delta g(q_f)/5).
\]

Then:

1. fix all relative intertwiner phases in one common real spectral-triple convention;
2. solve the coupled URT stationary problem including the matter response;
3. form \(K_{f,e}=\widetilde T_{f,e}^{\dagger}\widetilde T_{f,e}\) with all cross terms;
4. form the genuine relative operator
   \[
   R_{f,e}=K_{0,f}^{-1/2}K_{f,e}K_{0,f}^{-1/2},
   \]
   where \(K_{0,f}\) comes from the passive state rather than an assumed identity;
5. apply the depth filtration in the precise order fixed by the finite action;
6. obtain CKM and PMNS from the resulting left singular frames;
7. certify the selected stationary orbit globally.

## Status retained

The following computations remain useful but do not establish phenomenology on their own:

- the exact value of \(\Delta\) and the rank-depth arithmetic;
- the dimensions of the equivariant Hom spaces;
- the existence of explicit numerical Clebsch representatives;
- the local stationarity and positive-Hessian results for the specific tested potentials.

The previously reported dressed CKM/PMNS values and negative verdict are void.