import Lib.SiegelWeil.Formula.ZeroTermHeight
import Mathlib.Tactic

/-!
# RUN74 — Finite Schwartz probes replace the unadapted vacuum peak
27 November 2026. Human source-matched replacement, conditional on explicitly
retained background; scalar certificate prepared, not compiled.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Original leanprover-community/riemann-hypothesis pin
40e56bab026552e089d7afcfeff08d2defb9c005, Main.lean blob
dbd5db70bc11b35f18fa5751216ab335321e7bfc re-read (root rhOfAll not imported).
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob a69122b6ad568910a45d2bc13961ab9da4855143; protocol, queue,
expansion, AGENTS and continuity read. Integration native bridge blob
a51ebd8c94f0c26b46aa68b250e54d6eaf0c130d, sections 2–6.
Peer 0a9f1882 already audits finite dual-datum F3–F10 and weak rank;
0e9b893e already supplies noncoherent cancellation and projector/coset audit;
d12d3e65 supplies common zero-term scalar. Do not duplicate these results.

## 1. Literature guard, exact caller
Yifeng Liu, Arithmetic theta lifting and L-derivatives for unitary groups I,
Algebra & Number Theory 5 (2011), pp.858–859, Theorem 2.1(1).
Publisher PDF https://msp.org/ant/2011/5-7/ant-v5-n7-p.pdf ;
printed pages 858–859 (PDF indices 11–12) inspected directly.
For rational Hermitian T of dimension M, split skew-Hermitian source
dimension 2r, admissible global chi restricting to epsilon^M, target action
ordinary pullback, M>2r, the Eisenstein sum at s0=(M-r)/2 is absolutely
convergent for each Schwartz–Bruhat input and equals the theta integral
with probability Haar. The preceding paragraph explicitly supplies
absolute theta integral convergence for every Schwartz input in this range.
In particular the theorem is not restricted to K-finite inputs in its stated
form. Do not use coefficient 2 from the boundary case. This is a published
analytic theorem, not a proof of the native model comparison.

The actual SharpData.inner_product_formula (blob
ea9f665a9a89411f1353d098ff2e0a4e59a719f5) and OneVector use the operator
norm summability of zero terms at identity, not a pointwise vacuum peak.
The integration note §§4,6 obtains this by a full unadapted-vacuum
Fourier calculation including dyadic phase and rank-one kernel. The
following finite-probe argument avoids those steps at THIS consumer
without weakening absolute operator norm summability.

## 2. Fixed adapted vacuum core already suffices
Keep integration §§2–3 (J_P, exact native/classical Heisenberg polarization,
Hilbert comparison), rational theta invariance and the target pullback.
Let P split the rational source completely, X be the native Banach model,
E0 the bounded zero term on P.lagrangian. Put D=P.homSource T.
By D.exists_isAdapted_and_frame_eq 1 select a SINGLE native Hom group
element g0 adapted to that complete splitting; set v0=omega(g0)vac.
The actual IsAdapted.mixedTerm_omega_vacElem says
  J_P v0(x)=c |vacuumFn(Lx)|^2, c != 0
up to the fixed nonzero rank-zero theta coordinate and invertible adelic
linear frame L. This is Schwartz–Bruhat (Gaussian at infinity, compact
open lattice indicator at finite places), nonzero at 0. The phase is
constant, because the native formula is already a squared modulus.
By the exact mixed Heisenberg law all v in
  X_ad = span{rho(y)v0 : y in the full adelic Hom space}
have J_P v Schwartz–Bruhat. Covariance rewrites the family as
omega(g0)rho(y)vac. Native ext_of_vacElem makes it a determining family
for bounded linear maps. In particular if a bounded scalar functional
is zero on X_ad it is identically zero. This is sufficient below;
the actual reproduction identity also implies density.

Native rational invariance and the matched classical theta distribution
fix the scalar phases exactly as in integration §5, now using X_ad rather
than the unadapted vacuum orbit. Some v in X_ad has nonzero theta since
theta is a nonzero bounded functional. The Hilbert scalar commutant
identifies native/classical rational operators on J_P X_ad; by continuity
the equality is pointwise. Thus for any rational gamma and v in X_ad,
  E_{gamma^-1 L0}(v)= (B_gamma J_P v)(0).
No identification of nonrational source phases is needed. The same
rational coset bijection, theta normalization, Haar factor V, and native
parabolic laws are retained. We do not import the desired identity.

## 3. Compact finite-probe argument
Native Iwasawa supplies for every rational gamma (in adelic coordinates)
  gamma = p_gamma k_gamma,  k_gamma in K,
where K=maxCompact, p_gamma stabilizes P.lagrangian. In the actual
Splitting.iwasawa convention gamma*kappa=p_gamma and k_gamma=kappa^-1.
K is compact and closed under inverse. The native exact law
norm_zeroTerm_parabolic_mul gives for every f in X
  |E_L(f)|=h_gamma |E0 Omega(k_gamma)f|,
  h_gamma=|det a_gamma|_A^(M/2)>0.
Here a_gamma is the action on the chosen frame, not its inverse.
Rational L=gamma^-1 L0. The norm law is enough; no phase calculation
at k_gamma or p_gamma. Keep the actual native Iwasawa and parabolic
covariance prerequisites.

The family F_k=E0 o Omega(k), k in K, consists of nonzero bounded
linear functionals (E0 nonzero by v0; Omega(k) invertible).
Joint continuity and compact uniform boundedness yield
  R=sup_{k in K} ||F_k|| < infinity.
For each k there exists a probe v_k in X_ad with F_k(v_k) != 0 by
ext_of_vacElem. Rescale v_k by a constant so |F_k(v_k)|>1.
Continuity in k provides a relatively open neighborhood U_k on which
the same probe satisfies |F_l(v_k)|>1. Compactness selects finitely many
U_{k_j}, j=1,...,J covering K. The probes v_j are fixed ONCE, before
gamma, and each has a Schwartz–Bruhat J_P image. Hence for all k in K:
  ||F_k|| <= R <= R sum_{j=1}^J |F_k(v_j)|.
Multiplying by the exact positive h_gamma BEFORE taking any sums gives
  ||E_L|| <= R sum_{j=1}^J |E_L(v_j)|.                       (FP)
This compares operator norms to finitely many scalar values uniformly
over EVERY rational L; pointwise convergence on a dense core alone
would not imply this estimate.

Sum (FP) over rational L. Each probe sum is absolutely convergent
by the rational identification of section 2 and Liu Theorem 2.1(1).
Since J is finite, sum_L ||E_L|| < infinity follows.
The compact probe set is allowed to depend on the actual P,T and K;
no uniformity across arbitrary input spaces is claimed or needed.
No explicit frame-counting, unadapted-vacuum dyadic calculation,
unadapted-vacuum Schwartz phase or rank-one Fourier kernel is required.
This is an alternative to the 0dcbf571 arithmetic normal-form count
and the a99f1fa8 vacuum peak route, not a claim either was incorrect.

Negative control: on l1(N), coordinate evaluations have norm 1 each;
for every f their scalar absolute sum is finite but their norm sum
is infinite. Compact normalized probe control is the essential new
supplier; it cannot be inferred from the scalar convergence alone.
Another failure if probes are selected separately for each L:
absolute convergence for each fixed probe gives no uniform series.

## 4. Retain the other absolute bound and extend the identity
The existing Wiener compact window at identity and positive classical
Schwartz majorant give the integrable N(h) in bridge §6; retain that
bound unchanged. Both sides of the exact classical-to-native
Siegel–Weil equality define bounded linear functionals on X by that
bound and (FP). Equality on X_ad follows from Liu under the rational
comparison with the same normalization (multiply by native V).
Native ext_of_vacElem extends equality to X. Thus no need to prove
the unadapted vacuum itself Schwartz, nor to establish a Banach/Schwartz
norm equivalence. Use the SAME two bounds at Rallis and OneVector.
The strict stable range M>2r and rapid-form/integrability conditions
remain; do not borrow the weak rank cutoff to weaken the analytic range.

## 5. Source ledger and native status
ZeroTermHeight.lean 0a910704dae028b30156fc8ab362d3425e50ada8:
zeroTerm_lagrangian_eq_theta, zeroTerm_isometrySplitting,
norm_zeroTerm_parabolic_mul (exact sqrt(ideleAbs det)^M).
PairDefs.lean 8a5eaed1249fcc1c482e3af4f15373682fa34af1:
ext_of_vacElem, nonzero theta and Heisenberg covariance.
ZeroTerm.lean e26a6037c53efb630f1dd8cf959aef3e0855fc5d:
exists_isAdapted_and_frame_eq, IsAdapted.mixedTerm_omega_vacElem,
exists_tsum_mixedTerm_le. ZeroTermLaw.lean
56812986f0809836a77e0bf3384f2d45f03dc173: mixed inner law.
SiegelSets.lean b66ffc7b1f8383e88184259475bd735150e8d0bb:
existing compact normal-form proof; unchanged.
Same-pin readable grh/src/Lib/Adelic/Witt/IwasawaDecomposition.lean
5d19000318957195c1d4176e2bc9d351f25639e8 explicitly gives
gamma*kappa=radical*levi, ActsOnFrame and kappa in maxCompact.
Compact ZeroTermHeight calls P.iwasawa, and its uniform bound invokes
pairThetaKer.exists_norm_le_of_isCompact; retain these native suppliers.
No new conjecture or axiom introduced in the human replacement;
the external theorem is a literature input, not a new Lean axiom or
a native proof of the bridge.

Original human edge: identity norm sum -> unadapted vacuum peak +
Schwartz phase + rational comparison + classical convergence.
Reduced human edge: identity norm sum -> native compact Iwasawa +
bounded zero term + adapted determining core + parabolic norm law +
finite compact subcover + rational comparison + classical convergence.
Keep original and reduced graphs separate; no native global retirement
claimed. Context key: same compact pin, P,T, full X, E0,K, g0,
normalization, rank and rational gamma; probes fixed before gamma.
Local command -v lean/lake found neither. Historical state files
compute/rh-recursive-reduction-strip-root-20261125/status.json
and compute/rh-proof-term-prune-native-20261125/status.json were read
from cathedral-research-state; both report status pass, returncode 0.
These are old conditional root/engine checks, NOT verification of this
replacement. No native rh_scan/prune/reduce/auto/frontier executed here.
Scalar bridge below prepared only, #print axioms not executed.
Full upstream and A/C frontier, unresolved axioms, and weighted
prime-window lower bound remain open.

RESUME HERE: integration/editor replace §§4 and (18) of native bridge
with adapted-core + (FP) where useful; independent audit specifically
check Iwasawa orientation, exact positive height, probe uniformity and
rational-only phase fixing. Keep other absolute bound and clean graph
inputs. Kernel lane replay finite-probe scalar bridge and actual source
context when environment available; preserve original graph and axiom
evidence. Literature next audit remaining external suppliers at the
live root frontier, avoiding duplicate rank/cutoff/noncoherent work.
HANDOFF TO integration, independent audit, editor and kernel.
-/

namespace CompactLiteratureRun74

/-- Scalar part of FP after compactness selects a fixed finite probe set.
    The native model, compactness and convergence are separate premises. -/
theorem finite_probe_domination {ι : Type*} (s : Finset ι) (q : ι → ℝ)
    {R h c L : ℝ} (hR : 0 ≤ R) (hc : 0 < c)
    (hL : L ≤ R * h) (hq : ∀ j ∈ s, 0 ≤ q j)
    (hprobe : ∃ j ∈ s, c * h ≤ q j) :
    L ≤ (R / c) * ∑ j ∈ s, q j := by
  obtain ⟨j, hj, hjq⟩ := hprobe
  have hs : q j ≤ ∑ i ∈ s, q i :=
    Finset.single_le_sum (fun i hi => hq i hi) hj
  calc
    L ≤ R * h := hL
    _ = (R / c) * (c * h) := by field_simp [ne_of_gt hc] <;> ring
    _ ≤ (R / c) * ∑ i ∈ s, q i :=
      mul_le_mul_of_nonneg_left (hjq.trans hs) (div_nonneg hR hc.le)

#print axioms finite_probe_domination

end CompactLiteratureRun74
