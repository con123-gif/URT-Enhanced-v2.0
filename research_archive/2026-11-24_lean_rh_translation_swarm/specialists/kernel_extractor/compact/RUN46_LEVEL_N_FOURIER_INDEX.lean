import New.Columns.LocalStatement
import Mathlib.Tactic

/-!
# RUN46 — actual level-N Fourier lattice cost and chain transfer
2026-11-27. HUMAN SOURCE-MATCHED, prepared native probes and scalar
certificates; no new kernel replay. Credit Levent Alpöge, Luke Sernau,
Anthropic collaborators and Claude. Compact pin lsernau/grh-lean
72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0, Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679. Mission blob
9f4a2272265e847b3a46422b02d4b37e976bee10; previous RUN45 33febdb0;
editor RUN72 d14639a0, integration RUN73 9fbb841bf, audit a17effa4,
positivity 2952c52c. Completion-first compact route supersedes old pin
and outer-shell detour. Original graphs and axiom evidence unmodified.

Source ledger relative to grh-compact/src:
* New/Seesaw/LiftCharacters.lean db457ba5fb4c37feeb4c22c6b3f47fa9e5a8eb45:
  atPlaces_conj_mem_mirabolic, fourierOp_mem_column,
  exists_indexDvd_fourierOp_pow.
* New/Seesaw/NamesAtSplitLevel.lean f404d684189e658efb32374c500cd05900e12ba7:
  lastRowDatum_conj_u₀, LiftLaw.eq_zero_of_smul_invariant,
  LiftLaw.u₀_charDatum_eq_fourierOp, compUpTo_pairs_eq_smul.
* New/Columns/TwistedHeckeType.lean ccae44b8b21d1bface80bc3c8b10370a48c8ea48:
  chain₂_pairTranslates_eq_smul_chain, gaugeLe_Bmu_at_N,
  norm_detCharAt_diagN_le, name_lastColDatum_mem_raises,
  Columns.hasType_markOperator.
* New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547:
  Data.exists_indexDvd_Bmu_divisible (actual p=N branch).
* New/Core/ModuleIndex.lean 214cc116f97852925f444db42bfa36cf563af508:
  IndexDvd, of_det_dvd, comap, trans.
* New/Columns/ChainValuation.lean 19e853dfa8c645bfcdf3b3e21183f9b432620ef7:
  sum_height_mul_kappa_le (source search also confirmed exact statement).
* New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834;
  New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e.
* New/Columns/MarkedPrimeType.lean 5433d457d06b8f0e209209be1407fe1971ef86f8;
  New/Columns/SizeEstimates.lean 0b666c5f3cead375b65b97c6af8a25675486b473.

1. Local row/column exchange and exact nonunit removal.
Let u0=diag(I,N^-1) at ALL nonInducedPlaces S (do not replace S by
piPlaces). For rectangular S0=[A v;w z] the actual conjugate is
u0_target^-1 S0 u0_source=[A v/N; N w z].
The conjugate is integral with last row e_last mod N iff A,w,z integral,
v in N O and z congruent 1. This is precisely the integral last COLUMN
indicator for S0. No norm or loss. The chosen k_y with both last row
and last column y exists when y_last is a unit: put C=[I y_top;0 y_last]
and k_y=C C^T / y_last, with last column and row y. Its determinant
is a unit (all residue components). It is an algebraic construction
over the product residue ring, not a lift chosen independently for
the row and column.

For a ramified input phi=(1-pi(c_w))psi, scalar c_w has residue one
away from w. If a residue function is invariant under multiplying
the matrix by c_w, equivariance gives L[f]pi(c_w)psi=L[f]psi; hence
L[f]phi=0. In the charDatum expansion by last-last entry, terms whose
entry is zero at w are invariant under this scalar; so only vectors
with unit last entry survive. Expand the indicator by exact finite
sum, move k_y by integral equivariance, then apply diagNInv_law:
F_{j+1} B_j phi = gamma_j B_j F_j phi,
where B_j=L_j[lastColDatum e_last], F_j is the source fourierOp.
The same unit scalar commutes with F_j (centrality) and intertwines
B_j by integral_equivariant with inverse scalar on the opposite
side. Thus ramification survives every F and B; no assumption that
arbitrary vectors have the vanishing property.

In the pair sum, y with an entire zero component at a place gives
zero by the same scalar test on lastColDatum y. Every remaining y
is a nonzero vector in each residue field, so one product GL matrix
carries e_last to y, and integral equivariance cancels its two
adjacent occurrences. All surviving summands are identical with
the e_last summand. Denote their integer count o_i. Repeated
intertwining gives exactly the native pair formula
 C_q phi = [prod_{i<q} (d_i o_i prod_{l<2i+2} gamma_l)]
           B_{2q-1} ... B_0 F_0^q phi.
Induct on q: moving the new F through 2q already present B's
contributes prod_{l<2q} gamma_l; the new pair contributes its
two gammas. Thus the inner product over l is cumulative, not just
gamma_(2i) gamma_(2i+1). All scalar factors are the native ones;
the count is an integer of p-adic norm <=1. Retain LiftLaw and
actual pairWeilFinite_name, translateSum and character-factor
identification at chain₂_pairTranslates_eq_smul_chain; they are not
proved merely by this algebraic transfer.

2. Determinant cost for a single shifted column lattice.
Write d0=diagPointN 0, d_B=embedGL(diagN InitIndex B)^-1, and
M_B=integralFormsAt Column (d0*d_B), M=integralFormsAt Column d0.
At the actual choice of finite class representatives c, use
exists_mul_mem_integralAbove to choose gamma_c such that
stdEmbFin(gamma_c) c d0 d_B is integral at N, with the companion
d_B transport. The evaluation map E(phi) has coordinates
phi(stdEmbFin(gamma_c) c)_i for i a WeylIndex, exactly as in the
native comap. For phi in M_B these coordinates are in embValRing.
Let t(a)=sum_(c,i,tau) tableauWeight(i,tau,a).
On this coordinate space the diagonal matrix
 A_(c,i)=N^(sum_tau tableauWeight(i,tau,last))
has determinant N^t(last).
IndexDvd.of_det_dvd followed by map and comap shows the cost is
N^t(last), provided the diagonal image has gauge <=1 at d0.
Here the actual class decomposition g=stdEmbFin(gamma)c k and
atPlaces_conj_mem_mirabolic give the integral conjugated k factor.
The weight embedding of d_B is diagonal with entries 1 and N^-1
at the indicated subset; multiplying by the FULL positive
diagonal A cancels each such factor and leaves either 1 or N.
The native weylGauge_mul and norm_schur_mulVec_le then bound the
result by the norm of the integral coordinate vector. Hence
 IndexDvd(M_B,M,N^t(last)).
This argument uses the finite class reps at the same column level,
integralAbove transport and integral Schur basis, not an assumption
that embValRing is discrete or that a finite quotient has cardinal
N^t(last). IndexDvd is the finite-family determinant definition.
In particular M_piPlaces=integralFormsAt Column 1 (d0 d_B=1).

3. Iteration pays ONE determinant per Fourier step.
Let F=fourierOp(nonInducedRep 0). It preserves Column by the
native mirabolic_fix_fourierOp, not by assuming F integral.
The native induction applies IndexDvd.trans and the comap of
IndexDvd(M_S,M,N^t(last)) via F^(j+1), with the crucial
side condition F(M) subset M_S. In the source this is established
by fourierOp_mem_column, weylGauge_sum_le, weylGauge_smul,
P.norm_map_psi₀ and weylGauge_mul at the integral lift k_y,
ending with H.2 (_ / D.diagPointN 0). Retain that exact
gauge covariance/shift identity as a supplier pending a separate
orientation audit. In particular do NOT assume the reverse index
IndexDvd(M,M_S,...) or claim F(M_S) subset M.

Given this side condition, the induction is purely algebraic:
base q=0 uses B=piPlaces and M_piPlaces=integralFormsAt Column 1.
For step q→q+1, F^(q+1) sends (F^q)^-1 M into M_S; comap the
index estimate M_S→M along this map and compose with the
induction by IndexDvd.trans. Thus
 IndexDvd(integralFormsAt Column 1, (F^q)^-1 M,
          N^((q+1)t(last))).
One pays ONE determinant per step, not one per Fourier summand.
This argument uses the actual finite-family determinant definition;
it works even if embValRing is not discrete. The gauge orientation
remains an explicitly retained premise of this human derivation.

4. Last-coordinate cost via permutation symmetry before estimates.
For each a, diag(2 at a,1 elsewhere) acts on the integral
Schur basis with determinant 2^t(a). A permutation swapping a,b
conjugates the two diagonal matrices; applying the representation
and taking determinants yields 2^t(a)=2^t(b), hence t(a)=t(b).
This does not require the basis itself to be permuted. Summing
tableau weights over every letter equals (or is bounded by)
the diagram's total degree, which the exact native
sum_height_mul_kappa_le bounds by a_data at each tau.
Writing d=finrank_C Column and k=rank X_0>0 gives
 k*t(last) <= f*a_data*d.
The identification d=number of classes times number of WeylIndex
uses classAut_columnLevel_eq_bot and the free-level equivalence.
Now Magnitudes bounds a_data<=exp(logB+logX+1) and
k>=exp(5 logX-2); scale gives 4 logX>=3. Thus a_data<=k*b,
so t(last)<=f*b*d. With q=varrho+1=m/2 and m>=2,
q+1<=m. In particular the native weaker bound
 (q+1)*t(last) <= 4*m*f*b*d
holds. No limit or finite test used in this derivation.

5. Actual p=N caller.
Use the SAME preimage under F^q, intersected with original
integralColumns in Data.exists_indexDvd_Bmu_divisible, not a
separate submodule for each twist or datum. The actual
chain₂_pairTranslates_eq_smul_chain produces the common scalar
norm <=N^(2mfb); name_lastColDatum_mem_raises bounds each
of m transformed data by N^(fb). The retained chain valuation
and restrictToY_of_diag therefore give N^(3mfb). Since N is
outside nonsplitPrimes at the p=N branch and allowedLoss=4mfb,
the strict beta < -4mfb+1 and mfb>=1 imply beta+3mfb<=0.
The norm of N^(-beta) times the output is <=1. This is the
desired native branch, conditional on exact local character and
standard-data/gauge suppliers listed above. No marked-prime
assumption transferred to the level prime.

Remaining marked HasType construction: MarkedPrimeType defines
t(s)=c^s*tau, c=placeOfInt(-p)^d; order supplies injection and
hS identifies its range with the tops inducing l or conjugate l.
Parity alternates, so translation by 1 bijects the even and odd
sets, giving N_twist=2#even and A_l=a_data#even. Retain residue
Frobenius identity, exact parahoric/class double-coset transport
in Columns.hasType_markOperator, HeckeSizes guards, and elementary
divisor inputs. Not a new proof of this entire per-mark theorem.

Actual execution: lean/lake/elan absent on PATH. SymPy checked the
displayed rectangular block identity for a generic 3x3 block
symbolically (True); one rank-3 degree-5 monomial example gave
equal aggregate weights 35,35,35 in dimension 21. These are only
sanity checks, not proof or Schur-basis verification. First Python
command had a syntax error, corrected and rerun. Read actual CI
state compute/rh-compact-primitives-replay-20261126/outputs/
targeted_results.json blob 088cd2ec0e935ee1a282f10096949bcf671cc804:
six named B/C probes standard three axioms; A timeout 2700.11s
return 124; all_requested_checks_ok=false, full_RH_replay=false.
No new rh_scan/rh_prune/rh_reduce/rh_auto/frontier run or kernel
retirement. Old pin engine results do not certify this pin.
Prepared probes below target the actual caller. No import of Main
or claimed RH theorem. No new PASS claim.

RESUME HERE: independently audit the exact gauge orientation in
section 3 against integralFormsAt/weylGauge definitions (keep
native comap verbatim until then); derive the actual level-N
character multiplier and last-column standard-data bound in
TwistedHeckeType; finish per-mark Frobenius parity and
double-coset HasType at the same actual caller. Keep all retained
suppliers explicit; do not redo scalar branching or full-mark
stage induction. HANDOFF TO editor, integration, audit, theta,
acceleration and shared native runner. Human RH proof incomplete.
-/

namespace RHCompactRun46

lemma scalar_level_budget (q m t f b d : ℝ)
    (hm : 0 ≤ m) (ht : 0 ≤ t) (hfbd : 0 ≤ f*b*d)
    (hq : q+1 ≤ m) (h : t ≤ f*b*d) :
    (q+1)*t ≤ 4*m*f*b*d := by
  have h1 := mul_le_mul_of_nonneg_right hq ht
  have h2 := mul_le_mul_of_nonneg_left h hm
  have h3 : 0 ≤ m*(f*b*d) := mul_nonneg hm hfbd
  nlinarith [h1,h2,h3]

lemma scalar_level_guard (beta mfb : ℝ) (h : 1 ≤ mfb)
    (hb : beta < -4*mfb+1) : beta+3*mfb ≤ 0 := by linarith

#check Data.exists_indexDvd_fourierOp_pow
#print axioms Data.exists_indexDvd_fourierOp_pow
#check Data.chain₂_pairTranslates_eq_smul_chain
#print axioms Data.chain₂_pairTranslates_eq_smul_chain
#check Data.gaugeLe_Bmu_at_N
#print axioms Data.gaugeLe_Bmu_at_N
#check Data.exists_indexDvd_Bmu_divisible
#print axioms Data.exists_indexDvd_Bmu_divisible
#check Data.IsMarked.hasType_markOperator
#print axioms Data.IsMarked.hasType_markOperator
#print axioms scalar_level_budget
#print axioms scalar_level_guard

end RHCompactRun46
