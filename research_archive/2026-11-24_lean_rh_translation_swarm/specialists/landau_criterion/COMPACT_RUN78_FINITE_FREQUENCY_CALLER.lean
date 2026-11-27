import New.Filling.FiniteSystem
import Mathlib.Tactic

/-!
# RUN78 — finite frequency shell-to-sieve supplier
27 Nov 2026. SOURCE-MATCHED HUMAN DERIVATION, with prepared/uncompiled
Lean helpers. RH OPEN. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 3adc76221a978016e3505cdf3e36ad688354d7d7, live spine
636b4e3942cfed705dadb2887c1dec7eef1ca4ae, ledger
ad9e569597e603278d1b6f281f887aaf63032c38; AGENTS, continuity and lane protocols
read. Manuscript 619ae01be98c32e053eef1c8bcd44ccddd0664e7 §§6g and
line 1797 already contains rational-frequency summability, but retains
the actual finite frequency fields. Do not rederive sum_frequencies_le.
B2 active implementation note 0013b56c543a6078699bf6d4d332fba0e47d664a
already supplies both inner and outer index bridges. Run 45994173721
job 140489349705 was actually in_progress at inspection, no status.json
yet. Do not duplicate that job or Run77. Advance B3 instead.

## 1. One gauge for both heads (actual TopFloor caller)
Source New/Filling/TopFloor.lean 9762970967aef90b3a4e025b7f2891d892c70111,
247–274 exists_gauge_depth_of_ne_zero; StandardLevel.lean
ec149f4a38c54931f75c7e106ce94d1d6e65c5a4. Keep SAME F,Z,j,p,q,
0<=j<=rho, k=Shape.k, n=rho+1, g=F.g, R=product local integers.
All scalars denoted units are units of the ambient semilocal field A,
not necessarily of R. Normalized additive Haar md, md(star a)=md(a),
genIndex(a)=1/md(a), c=1.
If formMajorant is identically zero, its bounded form is zero.
Otherwise extract the nonzero pair/pivot from the actual support
as in native proof. The retained minors_mem_ofSize at this nonzero
near pair says that P_l=prod_(a<l) p_a is integral for 0<=l<=j;
similarly Q_l for q. Set beta_p=prod_(l=0)^j P_l and beta_q analogously.
Every beta_p/P_l is integral by removing one factor; beta_p/p_i
is integral because beta_p/P_(i+1) and P_i are integral.
In particular beta_p,beta_q are integral ambient units. These
are the SAME heads, not a separate rational rescaling.
Native finHeadWeight(K,j,p) = sqrt(genIndex(beta_p))^K.
Set alpha=g*star(beta_p beta_q)*beta_p beta_q.
This is self-conjugate (star_g), integral, invertible in A.
The gauge has size m iff alpha^m x lies in R and
Lambda=2/md(alpha). The beta quotients prove the two IsHead
conditions and alpha/g integral. Also alpha*(1/p_i-1/q_i)
is integral by the two beta/p_i quotients. All needed head
conditions of TopFloor.lintegral_shells_le now hold.
With G=2/md(g), u=sqrt(genIndex beta_p), v=sqrt(genIndex beta_q),
we obtain the EXACT identity
    Lambda=G*(u*v)^4.
All G,u,v>=1. Thus for 4E<=K,
    Lambda^E <= G^K * finHeadWeight(K,j,p)*finHeadWeight(K,j,q).
This is the native gauge-depth budget. It is not a proof of
the retained near-pair/minor theorem; keep actual pivots and lifts.

## 2. One denominator ideal supplies both frequency losses
TopFloor 348–394, IntegralPlace.IsStdLevel.enorm_floorForm_le;
New/RealPlace/LocalTheorem.lean 671350f97491467f09b80eafa0df13685dd8ddc6,
Gauge.formModulus_sq_le_of_char, Gauge.formModulus_sq_le_of_heads.
Set beta=alpha^(200 n^2). All following units belong to A.
For nonzero/unit xi in the actual finite place product A=LocProd T,
construct eta componentwise over the DVRs:
    eta_w=xi_w if v_w(xi_w)<=v_w(beta_w), otherwise beta_w.
Then eta is a unit of A, eta divides xi and beta integrally,
and eta-xi belongs to beta R (including equality of valuations).
Let w0=beta/eta. We have w0 in R, xi*w0 in R, and
    md(w0)/md(beta)=genIndex(eta).
Consequently for every z in gauge size 200 n^2, (eta-xi)z is
integral. Self-duality of the native additive character implies
psi(eta z)=psi(xi z). This is the actual character matching in
formModulus_sq_le_of_char. No character approximation is made.
For the alternative unequal-head branch omega=1,
xi=g^-1(1/p_i-1/q_i), j=i+1, choose eta=xi, w0=beta.
The size multiplication condition (g^-1 of size 1, inverse
head difference of size 1, beta exponent >=2) gives xi*beta in R.
The native heads Fourier inequality applies directly; no character
matching needed in that branch.

Put e=min(1,sqrt(genIndex eta)), J=genIndex xi, D=denomIndex(R,xi).
In BOTH cases e<=sqrt J: xi/eta integral ambient unit so its
index >=1. Also e^2<=md(w0)/md(beta); this is equality before
the min in the character case and just e^2<=1 in the head case.
Because w0 R lies in R intersect xi^-1 R, md(w0)<=1/D,
where D>0 by compactness and openness (denomIndex_ne_zero).
This proves the unified cap
    e^(t+12) <= (sqrt J)^t * (1/D)^6 * md(beta)^(-6).
The proof is to split e^(t+12)=e^t*(e^2)^6 BEFORE bounding.
The denominator factor is not bounded separately by J, nor
discarded for mixed-sign local valuations. All md values are
positive finite; the inequality is valid at e=1.

## 3. Actual shell caller and normalization
Use the native formModulus<=formMajorant and the two Fourier
inequalities (square bounded by genIndex(eta)^(card ambient)
times selfNormProduct). If e<1, volumeExponent<=card ambient
gives exactly e^(2 volumeExponent) required by RUN67 shell bound.
Apply lintegral_shells_le at t+12 (not t), using the rank guard
t+10^10 n^4<=k, which implies t+12+10^8 n^4<=k for n>=1.
The native norm-to-integral bound (Level.enorm_floorForm_le) yields
    |floorForm| <= massRatio * e^(t+12) * Lambda^(10^9 n^4).
Since beta=alpha^(200n^2), md(beta)^(-6)<=Lambda^(1200n^2).
Combine with the cap of section 2 to obtain the actual bound
    |floorForm| <= massRatio * (sqrt J)^t * D^-6
                  * Lambda^(10^9 n^4+1200n^2).
Since n>=1 the Lambda exponent is <=2*10^9 n^4, and
4*(2*10^9 n^4)<=K under the native K>=10^10 n^4.
Use section 1, not a second independent gauge:
    |floorForm| <= massRatio*(sqrt J)^t*D^-6*
       (2/md(g))^K*finHeadWeight(K,j,p)*finHeadWeight(K,j,q).
This is exactly TopFloor.enorm_floorForm_le, conditional on the
retained two Fourier inequalities, minor/near inputs, and RUN67
shell result. The character construction is given specifically
for the actual product of completions; the general native
semilocal theorem uses valPair and is not replaced by that
specialization at arbitrary A.

At FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7,
235–278, choose K=n^6, t=k-n^7 (natural subtraction).
Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727 pow_chain:
10^10 n^4<=n^6, 3n^6+12<=n^7<=k. Hence both rank guards.
Using the actual md_g and g_le_b_pow, 2/md(g)<=b^(1+46f)
(f=numInfPlaces E, g<=b^23, f>=1); n>=100001 implies
(1+46f)n^6<=n^9 f. Dividing by SAME positive massRatio gives
    |floorForm/massRatio| <= frequencyGain(xi) *
          finHeadWeight(n^6,j,p)*finHeadWeight(n^6,j,q).
This is local helper Er in exists_finite_sieveSystem. For j<rho
the source integral_floorForm_succ transfers it to the integral
field. For j=rho the normalized top-kernel Fourier transform is
the average over L of psi(-xi*l) times the floor-form transform,
by the integral_skew_product identity in that source. The
average modulus is <=1 because volume(L) is positive finite
(compact open subgroup containing 0). Thus no new Fourier loss
is needed at the top. Keep integral_skew_product, integrability,
continuous_topKernel, positive semidefiniteness and the RUN66
bottom/fixed-lines bound as distinct suppliers. For top integral
identity the source uses ae_isUnit, not pointwise nonzero at every
coordinate. At unequal-head branch xi is the actual unit
provided by the SieveSystem field, not an arbitrary zero pivot.

## 4. Graph / verification / handoff
Original source-visible graph:
B->Moments.energy_fixingSet_le->FiniteSystem.exists_finite_sieveSystem
->TopFloor.enorm_floorForm_le -> {exists_gauge_depth_of_ne_zero,
lintegral_shells_le, formModulus_sq_le_of_char/heads, native valPair}.
Reduced local presentation: one beta per head -> alpha -> one
local denominator ideal -> split cap -> same shell -> Er.
Preserve all old/reduced graphs and axiom evidence, no global
elaborated edge retirement. Context key: pin,S,T,F,Z,j,p,q,
xi,omega,actual same alpha,g,K,t,L,measure. A/C, star and signed
Landau obligations unchanged. No use of URT or claimed RH root.
Actual source files fetched at pinned commit. lean/lake/elan
not present on PATH or ~/.elan/toolchains in this run. No
native scan/prune/reduce/auto/frontier or replacement execution.
Old-pin CI statuses b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 read (45577239749,
45576756833 pass); compact helper receipt d9eb4d1dc47d7dc52f36bc13b41b3eea170b667d
re-read: eight helpers, six original probes, negative control,
caller_replacements_checked=false. New helpers below uncompiled.
No fresh scalar tests needed; independent audit of the actual
Fourier inequalities is more relevant. No duplicate shared job.

RESUME HERE: prove the retained Gauge.formModulus_sq_le_of_char
in New/RealPlace/LocalTheorem.lean 389–419 at the actual head
context, including the Fourier cancellation of a nonintegral
pairing and its precise cardinality exponent; then attach to
this shell-to-sieve argument. HANDOFF TO positivity, integration,
editor, audit and shared native runner. Do not redo rational
frequency summability, B2 inner/outer bridges or the final Landau step.
-/

namespace CompactRun78

/-- Exact split of the single frequency cap, before any loss estimate. -/
theorem cap_split (e u d l : ℝ) (t : ℕ)
    (he : 0 ≤ e) (hu : e ≤ u) (hd : 0 ≤ d) (hl : 0 ≤ l)
    (hcap : e^2 ≤ d*l) :
    e^(t+12) ≤ u^t * (d*l)^6 := by
  calc
    e^(t+12) = e^t * (e^2)^6 := by rw [pow_add]; ring
    _ ≤ u^t * (d*l)^6 := by gcongr

/-- One gauge, two head weights; no independent choice of scales. -/
theorem gauge_budget (G u v L : ℝ) (E K : ℕ)
    (hG : 1 ≤ G) (hu : 1 ≤ u) (hv : 1 ≤ v)
    (hL : L = G*(u*v)^4) (hK : 4*E ≤ K) :
    L^E ≤ G^K * (u^K*v^K) := by
  have hEK : E ≤ K := by omega
  calc
    L^E = G^E * (u^(4*E)*v^(4*E)) := by
      rw [hL, mul_pow, ← pow_mul, mul_pow]
    _ ≤ G^K * (u^K*v^K) := by gcongr

#print axioms cap_split
#print axioms gauge_budget
#check IntegralPlace.IsStdLevel.exists_gauge_depth_of_ne_zero
#check IntegralPlace.IsStdLevel.lintegral_shells_le
#check IntegralPlace.IsStdLevel.enorm_floorForm_le
#check Gauge.formModulus_sq_le_of_char
#check Gauge.formModulus_sq_le_of_heads
#check Filling.IsFillingLevel.exists_finite_sieveSystem
#print axioms IntegralPlace.IsStdLevel.enorm_floorForm_le
#print axioms Filling.IsFillingLevel.exists_finite_sieveSystem
end CompactRun78
