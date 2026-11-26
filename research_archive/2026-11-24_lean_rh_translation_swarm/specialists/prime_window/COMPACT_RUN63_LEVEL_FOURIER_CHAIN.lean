import New.Columns.TwistedHeckeType
import Mathlib.Tactic

/-!
RUN63 — 26 November 2026. Level-N Fourier pair-chain and aggregate
index at the actual A local caller. Human source-matched derivation;
independent audit and native replay outstanding. Credit Levent
Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10; latest manuscript
e31631247c97cb90685d74c54b3051d55cfaf608. Read mission, protocols,
AGENTS and previous RUN62. The planned class representative identity
and HeckeSizes are now supplied by theta a599aa5c and lead 403556a7.
Do not duplicate them. Peer 57550c80 and 6bae6781 concern marked
split Hecke transfer at p != N, not the level-prime Fourier operator.
Latest observed branch head 5c2a8c47. Prior graph and axioms retained.

Source ledger (grh-compact/src):
New/Seesaw/NamesAtSplitLevel.lean f404d684189e658efb32374c500cd05900e12ba7
  exists_GL_last_col_and_row 98-104; fourierOp 106-107; mirabolic,
  ramified and LiftLaw 111-149; lastRowDatum_conj_u₀ 161-165;
  mirabolic_fix_fourierOp 178-189; LiftLaw.eq_zero_of_smul_invariant
  198-203; inclGL_lastColDatum 205-208; u₀_charDatum_eq_fourierOp
  212-226; compUpTo_pairs_eq_smul 233-255.
New/Seesaw/LiftCharacters.lean db457ba5fb4c37feeb4c22c6b3f47fa9e5a8eb45
  nonInducedPlaces, isSplitLevel_nonInducedPlaces, diagPointN,
  lastColDatum_conj_ne_zero_iff, atPlaces_conj_mem_mirabolic,
  mem_ramified_of_mem_ramifiedColumns 54-109;
  fourierOp_mem_column 112-124; exists_indexDvd_fourierOp_pow 128-169.
New/Columns/TwistedHeckeType.lean ccae44b8b21d1bface80bc3c8b10370a48c8ea48
  Data.chain₂_pairTranslates_eq_smul_chain 82-106;
  Data.gaugeLe_Bmu_at_N 113-135.
New/Columns/ChainValuation.lean 19e853dfa8c645bfcdf3b3e21183f9b432620ef7
  mem_columnLevel 161-164, exists_eq_sub_centralGen 207-209,
  sum_height_mul_kappa_le 211-212.
New/Columns/ColumnDefs.lean 104b875374798b99448625fe6ce062ea6bfbfe65
  columnLevel and classAut_columnLevel_eq_bot.
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
  Data.exists_indexDvd_Bmu_divisible 285ff.
New/Core/ModuleIndex.lean 214cc116f97852925f444db42bfa36cf563af508
  IndexDvd.of_det_dvd, map, comap, trans.
New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e
  HasLogBound for a,k,b and m; m>=10000.

1. Exact local permutation proof, independent of any size estimate.

Use P=nonInducedPlaces, residue algebra R=product_w F_N, integral
local group K=GL_n(O), last vector e, u=diag(1,...,1,N^-1).
Write k_y for the actual lift of a residue matrix with last row and
column y, defined when y_last is a unit at every w. Existence is
explicit: if C is identity with last column y, then
K_y = y_last^-1 C C^T. Its determinant is a unit, and both last
column and last row equal y (the last row of C is y_last e^T).
No averaging over the lift choices is needed.

Let M be the subgroup of K with reduction fixing e. If g in M,
then h=u^-1 g u belongs to K and its last row reduces to e^T.
Indeed in block form g=[A B; C d], B=0 mod N and d=1 mod N;
h=[A B/N; NC d]. The same applies to g^-1, so h is invertible
integral, not merely integral entrywise. Hence y -> hbar*y is
a permutation of the vectors with unit last entry, preserving
y_last exactly. Also k_(hbar y)^-1 h k_y is in M because its
reduction sends e to e.

For the native linear endomorphism T with
rho(a) T rho(b) phi=phi whenever a g b in M, choose
a=(u k_(hbar y))^-1, b=u k_y. The condition holds by the
previous identity, and gives
   T rho(u k_y) phi = rho(u k_(hbar y)) phi.
Multiply by psi_N(y_last) and sum; change variables by the
permutation, retaining the same coefficient, to obtain TF phi=F phi.
This proves mirabolic_fix_fourierOp. At the global column caller,
take g=atPlaces(d0^-1 k d0), T=right translation by k in columnLevel.
The native last-column criterion (84-95) is exactly block
integrality plus the last-row congruence at piPlaces (including
the conjugate inverse at the other primes). If a g b in M then
the relative supported element
  conjEmbed(a) k conjEmbed(b) k^-1
is integral, and its inverse is integral, by that criterion
applied to a g b and its inverse. Its residue constraints
follow from the same criterion at the two members of each split
pair, and its support lies over N, away from chosen primes.
mem_chosenLevel_of_supportedOn and mem_columnLevel put it in
columnLevel. Consequently conjEmbed(a) k conjEmbed(b) fixes phi,
and the local argument applies. This gives fourierOp_mem_column.
This uses both forward and inverse integrality and retains the
source's split-level dictionary, not an arbitrary mirabolic
subgroup at a nonsplit prime.

2. Fourier transfer through a single lift, with ramification.

Keep the actual LiftLaw L with scalar gamma. For a residue matrix
Z, denote its last column by c and its last row by r. Write
B_y=1_{c=y}, E_y=1_{r=y}, C_y=psi_N(r dot y), extended by
zero outside integral matrices. Put A=L[B_e].
If the input phi belongs to ramified, for each w write
phi=(1-rho(x_w))v_w with scalar unit x_w, trivial modulo N
at all other factors. Integral equivariance at (x_w,1)
shows L[f]phi=0 whenever f is invariant under multiplying
Z by x_w. In particular B_y vanishes on phi if y_w=0,
and the indicator of any fixed bottom-right entry t vanishes
on phi if t_w=0. This applies to the aggregate bottom-right
indicator, NOT to an arbitrary single row or column with
last entry zero. Decompose C_e by that bottom-right entry
and discard precisely these vanishing aggregate terms.
The result is both the sum over B_y and over E_y with
y_last a unit, coefficient psi_N(y_last).

Integral equivariance gives
  L[B_y]phi=rho'(k_y) A phi,
  L[E_y]phi=L[E_e]rho(k_y)phi.
The second equality uses the last ROW of k_y, the first its
last COLUMN. Thus after multiplying on the left by rho'(u),
the column expansion is F' A phi. The row expansion and
the native diagonal law rho'(u)L[E_e]=gamma A rho(u)
give gamma A F phi. Therefore
  rho'(u)L[C_e]phi = F' A phi = gamma A F phi.
No division by gamma or by any Gauss sum is needed.

3. Pair-chain transfer, exact common scalar.

For each adjacent pair j=2i, j+1 and an intermediate vector y,
if y is zero at some w then L_j[B_y]phi=0 by section 2.
Otherwise choose a residue matrix k with k e=y independently
at each field (extend the nonzero vector to a basis), then lift.
By column covariance and integral equivariance on the next lift,
  L_(j+1)[C_y] L_j[B_y]phi
    = L_(j+1)[C_e] A_j phi.
Indeed C_e(Z k)=C_y(Z), so the input rho(k) is removed
by the source covariance, with no inverse remaining on y.
The number o_i of such vectors is exactly
product_w (N^(n_(2i+1))-1), an integer; there is no inverse
of this number. After the outside rho_(j+2)(u), section 2
changes this pair to
  o_i gamma_(j+1) A_(j+1) F_(j+1) A_j phi
   = o_i gamma_(j+1) gamma_j A_(j+1) A_j F_j phi.

To repeat on an existing chain, the central scalar rho(x)
commutes with F (scalar matrices commute with u and k_y).
Also A_j rho_j(x)=rho_(j+1)(x) A_j: scalar equivariance
with a=x^-1, b=x leaves the datum unchanged because the
local ring is commutative. Thus every intermediate
A_(j-1)...A_0 F_0^q phi is ramified at the SAME w with
the SAME scalar witness x_w; its witness vector is the
image of v_w under this composition. Now induct on q.
Moving F_(2q) through the earlier 2q A's adds each
gamma_l, l<2q, exactly once. A pair with scalar d_i
therefore multiplies the previous coefficient by
d_i o_i product_(l<2i+2) gamma_l. Starting from the empty
chain gives the precise native identity
  pairedChain_p phi =
   (product_(i<p) d_i o_i product_(l<2i+2) gamma_l)
       * A_(2p-1)...A_0 F_0^p phi.
This proves compUpTo_pairs_eq_smul for the actual LiftLaw
assumptions. At p=0 both sides are phi. The actual D
specialization at p=varrho+1 uses pairWeilFinite_name,
translateSum_eq_sum_name and the character/diagonal law
verified in TwistedHeckeType 88-102. Keep those exact
normalizations as separate suppliers. This is not a claim
to prove the whole actual chain norm without them.

4. Aggregate weight-index and its level-N consumer.

Use O=embValRing at N, dimension C=dim_C D.Column, and the
native finite index set I=class representatives times
WeylIndex. Freeness of class stabilizers gives #I=C.
At stage zero the determinant exponent is zero. For each
basis coordinate a of the k-dimensional standard space put
t_a=sum_(i in I)sum_tau tableauWeight(i,tau,a).
Permutation of alphabet labels gives the same total for
each a: equivalently, on the Schur space the two diagonal
matrices with entry 2 at positions a and b are conjugate
by a permutation matrix. Their determinants are respectively
2^t_a,2^t_b (repeat across class coordinates). Equality
and injectivity of integer powers of 2 imply t_a=t_b.
The source tableau total bound at each tau is <=D.a;
there are f embeddings. Hence k*t_last <= f*a*C, with
no per-coordinate maximum loss.

For each native subset S, let d_S be the inverse embedded
diag_N(S), d0=diagPointN. The intermediate lattice comparison
in LiftCharacters 132-151 is IndexDvd(I_(d0 d_S),I_d0,N^t_last),
where I_d=integralFormsAt Column d. The actual proof selects
the same class-wise rational gamma by exists_mul_mem_integralAbove
and pulls back the diagonal map on I whose entries are
N^(sum_tau tableauWeight(i,tau,last)). Its determinant
is exactly N^t_last. At evaluation on these shifted class
points, the d0 d_S gauge is integral by the hypothesis.
The source then moves to an arbitrary g=c*k with the
chosen rational left representative and k in columnLevel;
at N the conjugated k is in the mirabolic subgroup by
section 1. The diagonal Schur action has exponents
sum_tau tableauWeight, and the surviving diagonal entries
of the residual action are 1 or N; their N-adic norm is
<=1. This is the precise determinant/pullback route.
The class-wise integral-above choice and full gauge
identity in 136-150 remain explicit inputs to this note;
their arithmetic existence is not proved here.

The ultrametric gauge step of 153-162 is independent of
the number of Fourier summands. F preserves Column by
section 1. Every summand of F is an integral K translation
after the one u translation, psi_N has N-adic norm 1,
and weylGauge_mul at the embedded integral element
identifies its gauge with the input gauge at the shifted
point. Therefore F maps I_d0d_P into I_d0, with P the
nonInducedPlaces. The finite sum has gauge at most the
maximum. Keep the source exact shift d0 and no claim
that F preserves I_1.

The base comparison uses S=piPlaces, so d0 d_S=1.
Iterate the P comparison by pullback under F^q and
IndexDvd.trans, obtaining at q=varrho+1
  IndexDvd(I_1,(F^q)^-1 I_d0,N^e),
  e=(q+1)t_last.
The native definition of IndexDvd is a determinant
certificate for every finite list, not a literal finite
quotient of cardinality N^e. With m=2q, q>=1,
q+1<=m. Since a/k<=4b by HasLogBound (indeed
a<=exp(log b+log x+1), k>=exp(5 log x-2)
and x^4>=e^3/4 under the native scale guards), we have
  e*k <= m*f*a*C <= 4*m*f*b*C*k.
Cancel k>0 to get e<=4*m*f*b*C. This gives the
scalar and index-composition consumer of
Data.exists_indexDvd_fourierOp_pow with the above
class-wise lattice transport retained.

At Data.exists_indexDvd_Bmu_divisible (p=N branch)
allowedLoss=4mfb and beta<1-4mfb, gain indicator=0.
The same ramified phi in that pullback satisfies the
actual gaugeLe_Bmu_at_N, once its character and standard
datum inputs are supplied, with gauge <=N^(3mfb).
Multiplication by N^(-beta) multiplies the gauge by
N^beta (N-adic norm N^-1). Since mfb>=1,
3mfb+beta<1-mfb<=0, so the normalized Bmu is integral.
This closes the scalar consumer without bounding the
number of terms or replacing the integral lattice.

Local source graph (not elaborated): residue row/column identity
+ ramified scalar annihilation -> single LiftLaw transfer
-> pair chain -> chain₂_pairTranslates_eq_smul_chain
-> gaugeLe_Bmu_at_N; mirabolic permutation -> F preserves
Column -> lattice comparisons and t_a symmetry -> level-N
IndexDvd -> exists_indexDvd_Bmu_divisible -> short_forms.
The class-wise integral-above and exact name/character
normalization, gauge raises, and chain archimedean height
remain separate unresolved suppliers here. No global edge
pruned, no original graph or axiom evidence overwritten.
Context includes compact pin,P,N,D,actual lifts,characters,
class reps,embedding and same ramified vector.

Execution: local lean/lake/elan absent (PATH checked).
Legacy native engines are old pin, not run on compact.
CI 45803534769 actual receipt re-read from state branch:
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804:
all_requested_checks_ok=false, module_1_build returncode 124
after 2700.11s; six B/C probes with standard three axioms.
Workflow wrapper success is not native A PASS. No redundant
numerical tests. Scalar certificates and actual symbol/axiom
probes below prepared for compact runner, not executed.
Independent audit requested, especially orientation of
rho(k) and exact ramification witness through the chain.

RESUME HERE: merge sections 1-3 with the A level-Fourier
chain; complete the exact actual LiftLaw gamma at
TwistedHeckeType 88-106 (pairWeilFinite_name and detCharAt
normalization), the name_lastColDatum_mem_raises argument
46-74 and the shifted class-wise gauge transport 136-150.
Then gaugeLe_Bmu_at_N, without redoing marked Hecke or
the aggregate index. Preserve all open B/C and A norm
dependencies. HANDOFF TO theta, kernel, integration/editor,
independent audit. Human reconstruction remains incomplete.
-/

namespace CompactPrimeRun63

theorem aggregate_index (q m t k f a C b : ℝ)
    (ht : 0 ≤ t) (hk : 0 < k) (hq : 0 ≤ q)
    (hm : q+1 ≤ m) (hf : 0 ≤ f) (hC : 0 ≤ C)
    (hweight : k*t ≤ f*a*C) (ha : a ≤ 4*b*k) :
    (q+1)*t ≤ 4*m*f*b*C := by
  have hm0 : 0 ≤ m := by linarith
  have h1 := mul_le_mul_of_nonneg_left hweight hm0
  have h2 := mul_le_mul_of_nonneg_right
    (mul_le_mul_of_nonneg_left ha hf) hC
  have h3 := mul_le_mul_of_nonneg_left h2 hm0
  have h4 := mul_le_mul_of_nonneg_right
    (mul_le_mul_of_nonneg_right hm ht) hk.le
  have h5 : ((q+1)*t)*k ≤ (4*m*f*b*C)*k := by
    calc
      _ ≤ (m*t)*k := h4
      _ = m*(k*t) := by ring
      _ ≤ m*(f*a*C) := h1
      _ ≤ m*(f*(4*b*k)*C) := h3
      _ = _ := by ring
  exact (mul_le_mul_right hk).mp h5

theorem level_gauge (mfb beta : ℝ) (h : 1 ≤ mfb)
    (hb : beta < 1-4*mfb) : 3*mfb+beta ≤ 0 := by linarith

#print axioms aggregate_index
#print axioms level_gauge

end CompactPrimeRun63

#check IsSplitLevel.mirabolic_fix_fourierOp
#check IsSplitLevel.LiftLaw.u₀_charDatum_eq_fourierOp
#check IsSplitLevel.compUpTo_pairs_eq_smul
#check Data.fourierOp_mem_column
#check Data.exists_indexDvd_fourierOp_pow
#check Data.chain₂_pairTranslates_eq_smul_chain
#check Data.gaugeLe_Bmu_at_N
#print axioms Data.exists_indexDvd_fourierOp_pow
#print axioms Data.chain₂_pairTranslates_eq_smul_chain
#print axioms Data.gaugeLe_Bmu_at_N
