/- RUN37 | 2026-11-25 | positivity_geometry | SOURCE-MATCHED HUMAN PROOF; LEAN PREPARED, NOT EXECUTED
Pin: leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005.
Observed upstream 98d36aafeeb30c1f40fdda96c3574faa34dfa413; no source substitution.
Mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4; live proof 10e3d636b345adbcae9ddb91820a3a93f59c93bc.
Peers read: 21574277, a7ba9251, 2a39654b, 42529776, e9256be1.
Previous geometry: ddc287ea (RUN36), 04a29a86 (RUN35).

NEW REDUCTION: one positive finite calibration rectangle suffices for the entire
candidate IsVolMeas condition. Fix the SAME D, V, P, Q and native normalized
Haar measure mu. If nu is Haar, then nu=c mu. On any S with 0<mu(S)<infinity,
nu(S)=mu(S) forces c=1. Hence nu=mu, including every frame and every measurable
rectangle in IsVolMeas. This is not an existence theorem for mu; the original
native existence supplier is retained. A zero or infinite calibration cannot
be used (2*0=0 and 2*infinity=infinity).

ACTUAL CONSUMER: GlobalTheory.VolumeRatioTypings.volMeas_unique, then VolTie
and GlobalTheory.Glob.volMeas_fundDomain_eq_of_tiedIndep. The latter still needs
signature-independent covolume. The original two full IsVolMeas hypotheses
give the calibration by choosing one U from exists_isOpen_measure_lt_top,
one theta and one A from the first hypothesis, and using that same native
rectangle in both hypotheses. Each cd(U) is positive finite, hence so is
the finite product. This is exactly the native uniqueness proof's cancellation;
the replacement makes its weaker interface explicit.

DIRECT HUMAN TAMAGAWA NORMALIZATION REDUCTION (conditional on comparison):
For the F-Lie algebra of a nondegenerate Hermitian unitary group, B(X,Y)=tr_E(XY)
is F-valued by adjoint and cyclic trace, and nondegenerate by extension to E,
where the Lie algebra becomes gl_n and B is the matrix trace pairing.
For an F-basis e, d=det(B(e_i,e_j)) is in F^*. The invariant local density
relative to its rational top form is |d|_v^(1/2). The number-field product
formula makes the product of these factors one. Thus one need not evaluate
the Gram determinant or choose matching rational bases across the forms.
Use the SAME conventional Tamagawa regularization and base-field factors;
the character module (determinant norm-one torus) is shared.

At an archimedean place let C have columns a real basis of u_J expressed
in the standard complex matrix coordinates; complexification is an
isomorphism. B has matrix C^t P C, with P the permutation matrix that
pairs matrix entries (i,j) and (j,i). Therefore sqrt(|det B|)=|det_C C|.
Under (X,Y)->X+iY the real Jacobian is |det_C C|^2. The defining pushforward
of IsOmegaLeb fixes its density to |det_C C|, exactly the trace density.
CDHaar.trick uses the same positive finite multiplier as the compact dual
of rank n. Conjugation of frames preserves B. RUN36 establishes equality
of finite-place trace densities on corresponding self-dual stabilizers.
These calculations avoid separate absolute determinant estimates.

Let T_W be conventional Tamagawa Haar and R_W one native calibration
rectangle K_f x product B_rho. If the local comparison yields
T_W(R_W)=b(F,E,n)*product cd(B_rho), with b positive finite, then by the
single-set lemma mu_W=b^(-1)*T_W (in ordinary adelic coordinates).
Thus the remaining global quotient comparison is
  vol_native(W) / vol_native(W0) = tau(U(W)) / tau(U(W0)) = 1
on the SAME host and rank, via Kottwitz inner-form invariance (RUN35).
No numerical bound or new root discharge claimed here. In particular the
actual restricted-product topology, rational subgroup identification, and
the calibration for the entire global measure must still be authenticated;
local comparisons alone do not certify this. The native tensor real/finite
split and real coordinate suppliers are identified below. Apply FD image
transport separately on each W, not between different real signatures.
No assumption that real groups of different signatures are isomorphic.

ORIGINAL SOURCE GRAPH RETAINED:
volume_signature_independent -> volSigIndep_of -> volSigIndep_of_hU ->
volMeas_fundDomain_eq_of_tiedIndep -> retie_volTieG_and_cdScaleTie.
Also native rank-one mass unfolding; see RUN35/36. Native uniqueness uses
two IsVolMeas predicates -> Haar scalar relation and common rectangle -> equality.
REDUCED LOCAL GRAPH:
reference IsVolMeas + candidate Haar + one positive finite calibration
-> one_calibration -> candidate IsVolMeas -> VolTie at same W.
Alternative global route: trace product formula + CDHaar.trick + RUN36
finite density + adelic identification + Kottwitz -> signature independence.
No original edge deleted, no unresolved axiom discharged. Root-reachability
of this specific replacement not yet verified by native graph scan.
Cache key includes source pin, D/host, W, P,Q, theta,A, rectangle, measures,
normalization and proof obligations; do not reuse across different hosts.
Backtrack to native volMeas_unique / original unfolding if candidate fails.
No URT comparison attempted; not relevant to exact cancellation.

SOURCE EVIDENCE (all at pin; 26/26 exact SHA and text-anchor checks in JS):
Formalism/SharpRestriction/GlobalSchurBounds/StandardLattice.lean cb758a6c5f78e610b8f946d4b733d07902b15f5d
Formalism/LocalRingCardinality/DataCD.lean 449d5479b4d8ec9baeaebd3459f95232094ae222
Development/AbelianVarietyTheory/Proofs/FoundationProofs/RightInvariantOfFiniteCovolume.lean ac5d03984f0b1f26bff2d488a4216cdda0b1517b
Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/AdelicQuotientVolumeEqOfSignatureRankIndep.lean 5df13f58118a8edd91ceed1143cf20581f71a1ec
Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/IsFundamentalDomainIffImageHA.lean a031016b09028273b7075a882ac12b820af0615c
Development/AbelianVarietyTheory/Proofs/UnitaryExistence/ExistsAdeleRingTensorEquivInfiniteProdFinite.lean 6efcfa7fffd73e9509215b0a1f6b74eda90860b5
Development/AbelianVarietyTheory/Proofs/UnitaryExistence/AdelicUnitaryEqRealMulFiniteSplit.lean 53ebeed2cebc169d170a4201607e1ccd47dd5dab
Development/AbelianVarietyTheory/Proofs/FoundationProofs/ExistsCompactAdele.lean 1732c48f8c8b91947c3427626caa8617b616edf8
Two JS arithmetic negative controls returned true. These are not Lean checks.
Baseline CI status blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 reread, returncode 0,
runs 45577239749 and 45576756833. Neither verifies this new certificate.
Native scan/prune and recursive search pending; no new axiom evidence.
Lean 4.33.1; Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

RESUME HERE: prove the global restricted-product identification with integral
lattice stabilizers using the native split/coordinate maps; evaluate ONE
finite positive calibration rectangle against Tamagawa Haar. Apply
isFundamentalDomain_iff_image separately to each form. Then replay this
certificate in existing CI and propagate the resulting same-rank identity
to the actual count consumer (signed mass defect interval -2L <= delta <= m).
Retain all other joint-loss and prime-window premises. HANDOFF: integration,
kernel/audit, human editor. RH remains open.
-/

import Development.AbelianVarietyTheory.Proofs.FoundationProofs.RightInvariantOfFiniteCovolume
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.AdelicQuotientVolumeEqOfSignatureRankIndep

noncomputable section
namespace RHPositivity37
open NumberField IsDedekindDomain MeasureTheory Formalism.BasicNotions Formalism.BasicNotions.TH Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes Formalism.MainNotions.StandardLattice Formalism.L2.Theta
open scoped TensorProduct Matrix ENNReal
attribute [local instance] Formalism.BasicNotions.Host.cmStar
variable {D : D7}

theorem one_calibration (V : HSp D) {P Q : ℕ}
    {μ ν : Measure (GA D V)} (h : IsVolMeas D V P Q μ)
    (hν : ν.IsHaarMeasure) (S : Set (GA D V))
    (hn : μ S ≠ 0) (ht : μ S ≠ ⊤) (he : ν S = μ S) :
    ν = μ := by
  obtain ⟨i1, i2, i3⟩ := GlobalTheory.AdelicUnitaryTop.lcsc_adelicUnitary D.host.F D.host.E D.sp.cm.sig V.rank V.gram
  have := Formalism.L2.GlobalTheoryTheory.GenusMassVolumes.Unfold.topGroupHA D.sp.cm.sig V.gram
  have := Formalism.L2.GlobalTheoryTheory.GenusMassVolumes.Unfold.borelHA D.sp.cm.sig V.gram
  have := h.1
  have e : ν = (ν.haarScalarFactor μ : ℝ≥0∞) • μ := Measure.isMulLeftInvariant_eq_smul ν μ
  rw [e, Measure.smul_apply, smul_eq_mul] at he
  have hc := (ENNReal.mul_left_inj hn ht).1 (he.trans (one_mul _).symm)
  rw [e, hc, one_smul]

theorem one_calibration_isVolMeas (V : HSp D) {P Q : ℕ}
    {μ ν : Measure (GA D V)} (h : IsVolMeas D V P Q μ)
    (hν : ν.IsHaarMeasure) (S : Set (GA D V))
    (hn : μ S ≠ 0) (ht : μ S ≠ ⊤) (he : ν S = μ S) :
    IsVolMeas D V P Q ν := by
  rw [one_calibration V h hν S hn ht he]
  exact h

theorem one_calibration_to_vol (V : HSp D) {P Q : ℕ}
    {μ ν : Measure (GA D V)} (h : IsVolMeas D V P Q μ)
    (hν : ν.IsHaarMeasure) (S : Set (GA D V))
    (hn : μ S ≠ 0) (ht : μ S ≠ ⊤) (he : ν S = μ S)
    (hT : VolTie D) (hW : V.SigOK) (hs : ∀ τ, V.sig τ = (P,Q))
    (𝓕 : Set (GA D V)) (hFD : IsFundamentalDomain (GQ V) 𝓕 ν) :
    ν 𝓕 = ENNReal.ofReal (D.vol V) := by
  exact ((hT V P Q hW hs).2 ν (one_calibration_isVolMeas V h hν S hn ht he)).2 𝓕 hFD

#print axioms one_calibration
#print axioms one_calibration_isVolMeas
#print axioms one_calibration_to_vol
#print axioms GlobalTheory.VolumeRatioTypings.volMeas_unique
end RHPositivity37
