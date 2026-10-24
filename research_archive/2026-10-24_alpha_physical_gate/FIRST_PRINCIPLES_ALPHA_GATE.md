# First-principles electromagnetic coupling: H64 / BKM / Maxwell gate
Date: 2026-10-24. Additive, unfitted mathematical result; physical alpha remains OPEN.

## Input (frozen)
phi=(1+sqrt(5))/2; Delta=3/20-80*pi/(1053*phi); eta=-ln(Delta).
rho*=(I4 ⊕ Delta² I4)/(4(1+Delta²)).
Do not use measured alpha, the historical alpha polynomial, or an empirically selected photon norm in the microscopic action.

## New exact native BKM inner products
Let p5=Delta²/(1+Delta²), Y=[[0,I4],[I4,0]]/sqrt(8), V=d(rho*)/d(p5)=diag(-I4,I4)/4.
For density tangents, g_BKM(X,Z)=sum_ij X*_ij Z_ij (ln(r_i)-ln(r_j))/(r_i-r_j) with diagonal limit 1/r_i.
Then
  g_BKM(Y,Y) = chi35 = 8 eta (1+Delta²)/(1-Delta²) = 47.9669783033801
  g_BKM(Y,V) = 0 exactly
  g_BKM(V,V) = 1/[p5(1-p5)] = 161394.727270527.
Y is the HS-unit off-quartet singlet from Hom(4_3,4_5). V is block diagonal.
Therefore the Oct-12 claim that the *native* off-quartet singlet is parallel to the entropy/occupation gradient is not proved by BKM isotropy; for this natural embedding the two are orthogonal. A nontrivial typed intertwiner would be required. This is not a global no-go for another physical photon map.

## Exact 20-face gauge-invariant Maxwell covariance
For outward oriented face-edge incidence D in R^(30x20), rank D=19, K=D D^T,
  D^T K^+ D = I20 - 11^T/20.
Single-face variance =19/20, off-face covariance=-1/20. Executable independent icosahedron reconstruction gives matrix residual < 8e-16. For S_lambda[A]=lambda A^T K A/2, with unit Wilson charge,
  <exp(i n^T D^T A)> = exp[-n^T (I-11^T/20)n/(2lambda)].
Thus Maxwell topology and the Ward identity alone leave lambda>0 free. A selected chronological matter/history action must determine it.

## Archived conditional alpha convention
If one assumes alpha^-1 = 4 pi chi35 ||J_physical||², matching the frozen scalar candidate
137+(17572/1215)Delta-(9/65)Delta² requires
  ||J_physical||² = 0.22734344982921045...
The natural HS-unit singlet has norm²=1. This target norm is diagnostic ONLY, not a derived parameter or license to fit.

## Source-first H64 photon determinant — exact prerequisite
For full *species-loaded* gauge-covariant H64 inverse propagator
D64[A]=[[A13[A],B[A]],[C[A],A51[A]]],
  det(D64[A]) = det(A51[A]) det(A13[A]-B[A] A51[A]^-1 C[A]).
Differentiating the full -log det matter action gives
  Pi_ef = Tr(G D_f G D_e) - Tr(G D_ef), G=D64[0]^-1.
Keep BOTH the hidden-51 determinant and the dressed-13 determinant, as well as the seagull/contact term. Verify gauge Ward transversality before defining a 4D infrared Coulomb residue. The Oct-17 source-order check requires species source before Schur projection.

## Next non-fitted structural candidate
The Oct-23 five-orientation centraliser is two-dimensional with traceless C²=(15/4)I8. Therefore Q=2C/sqrt(15) is a canonically normalised involution commuting with W_a. It is a candidate charge-sector splitter, NOT an established electromagnetic generator. First verify [Q,rho*], [Q,D64], correct integer electron charge, gauge covariance and Maxwell source embedding before constructing an induced photon stiffness.

Status: exact finite BKM and Wilson projector CHECKED; physical alpha not derived. No historical closure silently discarded or new free coefficient introduced.
