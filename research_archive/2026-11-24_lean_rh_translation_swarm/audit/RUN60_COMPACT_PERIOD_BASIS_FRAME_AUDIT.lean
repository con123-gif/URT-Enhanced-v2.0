import Lib.PadicHodge.WachKisin.FrameTheorem
import Lib.PadicHodge.WachKisin.CrystallinePeriodMatrix

/-!
# Independent compact C audit — period basis and frame, 26 Nov 2026
PARTIAL / SOURCE-MATCHED HUMAN AUDIT. Credit Levent Alpöge, Luke Sernau,
Anthropic collaborators and Claude. Source lsernau/grh-lean
@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10; current manuscript
d0652210fe34dca432b89f44bc75472faf346749. Read mission, AGENTS, protocol,
handoff, state/log and continuity excerpts. Peer 34b26ecb/c9759dfb (basis
appendix blob b513fdd6f7c7fd5a13c2f455c5581f0f54527884), ce3f88d1
(determinant descent blob 451ea2e428c03ecb8271bd72954b8ed44c68a030),
198752ed (period matrix), f301858e and a5106634 (radius), prior audit
57db85ec. This run audits the actual period-basis chain, not the old-pin
prime-window route superseded by the 26 Nov completion-first mission.

Source anchors (relative to compact src):
* Lib/PadicHodge/WachKisin/PeriodMatrixBasis.lean
  cd91a46eb5624b88af20a96d0450bdf059994b93, IsPeriodMatrix structure,
  exists_basis:81–153.
* Lib/PadicHodge/WachKisin/PeriodMatrixFrame.lean
  348d083320f3e9f59100db1a2f96f5a3f8e92923, exists_frame:53–128.
* Lib/PadicHodge/PeriodRings/AmaxStructure.lean
  1be9736d2c48bece6dd038c72d14b6f807cff9df, free_finite_of_rank_le:94–104.
* Lib/PadicHodge/PeriodRings/BdR.lean
  326d41233ac7638a50194f3ade22350c9b038ad5, contraction:113–131.
* Lib/PadicHodge/PeriodRings/BdRPlus.lean
  f828ee87f4914572d457b364b38c6c6b0fbc8372:28–58.
* Lib/PadicHodge/WachKisin/ChartScalars.lean
  8dc59315a323816ecb0eedf46b5aae0a8c714fc5:15–77,100–185.
* Lib/PadicHodge/WachKisin/HodgeFrame.lean
  158f4df424f222f593b6f2baee57a294ab221f03:109–115,206–261,278ff.
* Lib/PadicHodge/WachKisin/CrystallinePeriodMatrix.lean
  cf83fda104fb44177d374d62f06b4d6e68e3db08:24–84.
* Lib/PadicHodge/WachKisin/FrameTheorem.lean
  57d6daa6060f9f00eb27be6525460ba942a73f08:46–130.
* New/Selmer/CrystallineBound.lean
  7b7ba1c2ac12f09651b5c1285109ff0435258e79, crystalline_defect_le.

## 1. Two height variables must not be identified at the actual caller

The abstract period matrix has height H and frame identities QL=tau^H I,
UZ=E^H Q, YZ=E^H I. The native FrameTheorem line 62 fixes a=L.jumpBound,
line 64 invokes exists_isPeriodMatrix a a, and therefore H=a+a, NOT a.
Lines 69–75 define n_j by tau^a n_j=s(Qe_j). Lines 99–109 extract
E_m^(2a) times a coordinate, not E_m^(2H). Line 110 obtains
nu_0(L alpha)=tau^a x for x=s(alpha), by
tau^a nu_0(L alpha)=s(QL alpha)=tau^(2a) x and cancellation.
This is the exact bridge into the saturation induction at lines 120–130:
if tau^N x lies in the integral lattice, tau^(N+a)x lies in the span
of n_j; inductively divide the coefficients by tau using the tests at
m>=1. The exponent in the extraction is 2a=H throughout. The old
manuscript paragraph at line 1012 uses h both for abstract frame height
and for jump bound, giving QL=tau^h and tau^h n_j=s(Qe_j) and
E_m^(2h)t_j simultaneously. Read in one notation this loses a factor of
two. Replace that paragraph's first three clauses by the equations here.
This is a correction to the human text, not a defect in native Lean.
In particular do not replace the native H=a+b asymmetric construction
by H=max(a,b) either.

## 2. Independent short finite-freeness proof at exists_basis

In the actual chart S is isomorphic to W(F_(p^f))[[z]], complete at
I=(p,z), with residue field k and regular parameters p,z. The module
P={x in A_inf^d: Uy=E^H x for y in S_B^d} is separated for I, p acts
injectively, and z is injective on P/pP. The last is because zx=pw
implies p|x in A_inf^d (p prime, p not dividing z), and x/p belongs
to P by the same witness y/p in S_B. These are the actual native
hypotheses, not a finite generation assumption.

For any S-module M with those two regularity properties, prove first
  (I^n M : p) = I^(n-1) M     (n>=1).
If p x in I^n M, write p x=p u+z^n w with u in I^(n-1) M.
Reduction modulo p forces w=p w' by injectivity of z^n there.
Cancel p: x=u+z^n w' in I^(n-1) M. The reverse inclusion is immediate.

Consequently the canonical homogeneous map
  direct_sum_{i=0}^n M/IM -> I^n M/I^(n+1) M,
  (m_i) -> sum p^i z^(n-i) m_i
is an isomorphism. Surjectivity follows from generators of I^n.
For injectivity, if the sum is in I^(n+1) M, reduce modulo p: there
is w with z^n m_0=z^(n+1)w mod pM, so m_0 in IM. Subtract that term,
divide the remaining terms by p using the colon identity, and induct
on n; base n=0 is the definition of M/IM. No completeness of M used.

Choose arbitrary lifts b_j of a k-basis of M/IM. Every finite family
of lifts is S-independent. Otherwise take a nonzero relation, let n
be the least I-order of its nonzero coefficients (S separated), and
take degree n initial forms. The corresponding homogeneous maps for S
and M are isomorphisms by the preceding argument. The relation gives
a k-linear relation among distinct residue basis vectors in each
monomial coefficient, forcing all degree n coefficients zero, a
contradiction. Apply to P: the independent families have length <=d
by the peer coordinate test proof (lambda_i(a_j) in S, extended maps
S_B-linear). Thus the residue basis has at most d elements.
For x in P, lift its residue as a finite combination, then lift each
successive I^n error by combinations with coefficients in I^n using
the homogeneous maps. The coefficient sequences converge in complete
S; the resulting finite combination equals x by separatedness of P.
So P is free finite of rank <=d, with no appeal to completeness of
P or Nakayama before finite generation. This directly supplies the
actual free_finite_of_rank_le call for this nonzero-p chart. It does
not claim the broader p=0 branch of that native theorem.

Negative controls for dropping hypotheses (exact mathematical examples):
M=S/(z) is separated and p injective but z kills M/pM; it is nonzero
torsion and not free. M=S[1/p] is p-torsion-free and M/pM=0, has rank
one, but I^nM=M so is not separated, and its empty residue basis does
not generate M. These reject both candidate premise deletions.

## 3. Contraction and exact division: AGREE with explicit guards

Checked peer equations (1)–(7): x integral, y possibly arbitrary B^d.
Use WU=(E tau)^H I from UW=(E tau)^H I and injective U. Hence
Wx=tau^H y. The n,k denominator bounds are for matrices W and U once,
not per approximation. For f_minus=phi^-1 f phi, S-linearity follows
from phi(S) subset S; no assertion that phi^-1(S) subset S. Its
extension intertwines Frobenius by the native uniqueness lemma and
both maps preserving A. With x_minus=phi^-1(v E^H x), obtain
Uy_minus=E^H x_minus and F phi(y_minus)=phi(E)^H y. The latter uses
invertible F and tau-divisibility reflection before cancellation.
Then phi(E)^H phi(w_minus)=v phi(E)^H E^H w, hence
xi^H w=epsilon^H v^-1 phi(w_minus). The set of all p^(n+k)w_i
is closed under finding such a predecessor. Contraction proof uses
xi=pX in A, and A_inf intersect p^m A=(p,xi)^m; both are needed to
identify the limit, not simply p-adic completeness of A_inf.
The appendix's ideal comparison uses regularity of X mod p even if
A_inf/(p,xi) has zero divisors; its proof of prime-to-p ideal closure
is sound with the stated rank-one valuation and p-completeness.
For the last cancellation write p^N a=delta b; if N>0, primality
and p not dividing delta imply p|b, so divide by p in the domain
and repeat. This requires no primality or invertibility of delta.

The section 6 coefficient bridge uses theta_n surjectivity,
ker theta_n=(phi^n E), and the S-linear retraction lambda_0.
For a fixed N and tilt y, Ax gives a single approximation x in the
union K; membership persists in all sufficiently large K_n.
The subsequent q_n in S can vary with n. No uniform choice in y,N
is assumed. The simultaneous finite choice of n for determinant
coordinates is valid. AGREE conditional on the stated Ax theorem
and actual chart/ring suppliers; not a fresh proof of Ax.
In the determinant proof, normalized coordinate a_nu=1 stays 1
under coefficient projection to O_C/p; it is a unit even though
the quotient is not a domain. This is the precise reason adjugate
annihilation forces the projected determinant zero. No nonzero-only
weakening permitted. The recurrence K det C_n | K^(p^n) uses
K=det B0 det N0, both nonzero by chart selection and Frobenius
separatedness. Do not infer Q mod p invertible from det Q mod p
nonzero; OFlat is not a field. The native adjugate divisibility
clause, not inverse mod p, supplies QL=tau^H I.

## 4. Audit inverse and initial period-matrix interface

For the integral approximation X=p^N(U-mu^H W0), the witness supplied
to hQ must be Y0=E^H p^N(I-t^H W W0), where UW=(E tau)^H I,
mu=tE tau. Then UY0=E^H X, giving X=QH0 in A_inf. The inverse
Z'=p^-N H0+(tE)^H L W0 satisfies QZ'=U, so Q(Z'Z-E^H I)=0.
Cancellation uses det Q nonzero and injective A_inf -> B^+; it
never inverts Q integrally. AGREE.

Correction to the basis appendix's description of the fourth
IsPeriodMatrix field: native hat_stable quantifies over ALL y over
B^+, with witness w over B^+, not only those with integral x.
The basis proof only uses the weaker restricted test, but when
asserting the full structure at exists_isPeriodMatrix:74–84 or
passing it to exists_frame, preserve the stronger native field.
Literature RUN59 section 4 proves it for arbitrary B^+ y using the
row divisibility test, conditional on Hodge frame and fixed coefficients.
Also the current manuscript already corrects RUN59's omitted S_B
factors at the valueField caller: keep that correction. No new claim
of closing the fixed-fraction Fontaine or Hodge frame/continuity
premises; those require distinct exact audits.

## Evidence and handoff

Original and reduced graphs, axioms and unresolved nodes untouched.
Audit-only candidate edge: exists_basis regularity -> finite free P
-> SAME Q,Z -> exact division -> determinant descent -> hQ -> frame
identities with H=2a -> FrameTheorem saturation. Other consumers
and all A/B, row and reciprocity leaves remain. No global pruning.
Local command -v lean/lake/elan returned no executable; old-pin
rh_prune/rh_scan/rh_reduce/rh_auto cannot be replayed here or used as
compact evidence. Native probes below are prepared only.
Retrieved actual shared CI output
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
on cathedral-research-state, blob 088cd2ec0e935ee1a282f10096949bcf671cc804:
six named checks in New.Selmer.TiltingLemma and New.Filling.Moments,
each lists propext, Classical.choice, Quot.sound; module_1_build
returncode 124 after 2700.11s, all_requested_checks_ok=false,
full_RH_replay=false. Not evidence for this certificate. No finite
diagnostics repeated: the above two counterexamples and homogeneous
argument are exact proofs. No new kernel-checked closure or PASS.

RESUME HERE: editor correct height symbols and fourth field; independently
audit fixed-fraction Fontaine identification and valueField S_B bridge
against KummerChart and CrystallinePeriodMatrix, then exact Hodge
frame/continuity input, avoiding circular admissibility. Retain radius
and normalized row suppliers. HANDOFF TO integration/editor, literature,
C arithmetic, shared native runner. Verdict AGREE/PARTIAL with two
specific human-interface corrections. Human RH reconstruction incomplete.
-/

-- Executable source probes for the compact shared native runner; uncompiled here.
#check Lift.Chart.IsPeriodMatrix.exists_basis
#check Lift.Chart.IsPeriodMatrix.exists_frame
#check Lift.Chart.IsChartOf.exists_isPeriodMatrix
#print axioms Lift.Chart.IsPeriodMatrix.exists_basis
#print axioms Lift.Chart.IsPeriodMatrix.exists_frame
#print axioms Lift.Chart.IsChartOf.exists_isPeriodMatrix

namespace AuditPeriodBasis
-- Exact ordered cancellation abstraction of the final inverse consumer.
theorem inverse_transport {R : Type*} [Monoid R] (Q U Z Z' E : R)
    (hQ : Function.Injective (fun X : R => Q * X))
    (h₁ : Q * Z' = U) (h₂ : U * Z = Q * E) : Z' * Z = E := by
  apply hQ
  rw [← mul_assoc, h₁, h₂]

#print axioms inverse_transport
end AuditPeriodBasis
