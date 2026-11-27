import New.Filling.Moments
import Mathlib.Tactic

/-!
# RUN69: noncoherent energy assembly at the two actual B moment consumers
27 Nov 2026. Human source-matched derivation, not new kernel verification.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Latest mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10;
AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, manuscript
blob 3b552f2f5c30d874e72f574a479c90037482f96d and recent peer commits
b0fe2a3e, a913c802, 72e67b83 reviewed. RUN68 requires the two actual
moment estimates; do not repeat Casimir/word derivative or trace work.

## 1. Lower-level recursion, actual CrudeEnergy caller
CrudeEnergy.lean da67bf862a4c5e72ab6a81a7dfb462545cd8833f lines 166–174;
SchurTest.lean bcb1fd28783bdeb4d0e3c7d83559d0ef99cecdea.
Use exact same admissible S, stable T, cut amplitude, subset Omega,
C>=d1 (d1=besselEnergy), tau=tailScale, nonzero X, all s in Omega
satisfying FixesNormAtLeast(s,X), and C>=tau^20*d1 whenever a term
over Omega has IsNormalForm 0. Retain the native character-vanishing
theorem, character-to-level theorem and the noncoherent pair estimate
energy_le_of_level_pairs. No assertion that agreement is automatic.

Write N=rho+1 and t=b^-30. If every agreeing gamma has a level j<n
then energy <= t*C/4^(N-n). At n=0 no character agrees, hence the
amplitude is zero by amplitudeSum_eq_zero_of_not_charsAgree.
For n=j+1 split T exactly into its level-j part and its complement.
Both stable; complement's agreeing terms have a level below j
(regardless of whether a term might have more than one level).
For j<N, the top-level omitted-link hypothesis is vacuous and R=empty
gives zero coherent energy. The pair estimate bounds the level-j
energy by t*C/4^(N-j); induction gives the same for the complement.
Use energy_add_le with epsilon=1, giving 2*that+2*that =
t*C/4^(N-(j+1)). No triangle estimate across individual rational terms.
This establishes the source's lower-level aggregate bound from its
explicitly retained pair and character suppliers.

## 2. Full/cut assembly without paying a new norm factor
CrudeEnergy.lean lines 180–193. Set a=b^-4, so 0<a<=1/4 and
t=b^-30<=a^5. Let A be the cut nonzero-discriminant part, B the
cut zero-discriminant part, D the full-minus-cut amplitude. The
identity full=A+B+D follows from absolute summability and the stable
discriminant split. Retain the native hasLevel_last and
CharsAgree.exists_hasLevel (zero discriminant only), with the
original character and normal-form hypotheses.
The actual top-level pair estimate gives E(A)<=w+t*C, with
coherent linkEnergy<=w*nu^2 and the original omitted-link guard.
Section 1 at n=N gives E(B)<=t*C. The native energy_sub_cut_le
gives E(D)<=t*d1<=t*C. Twice apply weighted energy_add_le
with epsilon=a, first to A+B, then to (A+B)+D:
    E(full) <= (1+a)^2*w
        + t*C*((1+a)^2+(2+a)*(1+1/a)).
Multiply the error coefficient by a before bounding:
    a*((1+a)^2+(2+a)*(1+1/a))=2+4a+3a^2+a^3<=4.
Thus error <=4*t*C/a<=4*a^4*C<=a^3*C.
This proves the exact original full/cut energy inequality
    E(full) <= (1+a)^2*w + a^3*C.
No additional parameter optimization is necessary. The exact
noncoherent pair inequality itself, including classSize, link
discriminant, weighted packing, and tail estimates, is retained.

## 3. Off-Bessel support and exact two-sided prime saving
Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444 lines 189–217;
Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727;
CrudeBoundDefs.lean 0ba0d2532b14c414b9032466b79e10d4d60c3d18.
Take T=besselS^c, Omega_i={s: s_i=t_i for some t in reducedImage
besselS}, R=empty, w=0, C=d1. Stability is the native isStable_besselS.
For every w above q_i choose BOTH signs (w and its conjugate)
in FixesNormAtLeast, with coordinate vector e_0. The reduction
of the Bessel element fixes the first frame vector both at w
and in the inverse-adjoint action for its conjugate, by the
source's mem_besselS_iff_frameImage and reduction transport.
Thus X=q_i^(2f), NOT q_i^f, where f=numInfPlaces E.
For the normal-form-zero trigger, suppose a gamma outside the
Bessel subgroup has IsNormalForm 0 over (c,s,c'). Its common
scalar zeta satisfies zeta*star(zeta)=1. At a=0 the frame
relation has no higher coefficients and gives gamma*f_0=zeta*f_0.
The actual class-coordinate identity at the first frame entry
identifies zeta with the corresponding entry of the integral
termPosition k (Moments lines 201–205). So the scalar unitary
element is integral; reducing at the chosen places above q_i,
the same entry of s agrees with that of the Bessel reduction,
which is 1. Apply the source eq_one_of_reduceAt_eq_one exactly
as in lines 207–213, in dimension ONE, giving zeta=1. Retain
this scalar rigidity lemma and the precise class-coordinate bridge.
For each a successively the shared frame relation gives
gamma*f_a=f_a plus a linear combination of earlier frame vectors:
subtract the already triangular earlier columns, with both
leading coefficients now 1. Hence gamma is unitriangular on
the frame, so belongs to besselS by mem_besselS_iff_frameImage.
Contradiction. This proves the trigger is vacuous; no need
for the false stronger global inequality tau^20*d1<=d1.

For the omitted-link guard let p=k*f, q=q_i, q'=q_(1-i),
g=q*q', tau^4=b^p and d=mainEnergy. Admissibility gives
    tau^18 * codimFactor * d <= d1,
    codimFactor=2*(b/g)^p*tau^2.
All factors positive (and d,d1 nonnegative). Cancel before norms:
    tau^12*d/X^k
      <= (d1/2)*(g/(b^3*q^2))^p
       = (d1/2)*(q'/(b^3*q))^p
      <= d1/2.
Indeed q'>0, q'<=b^11, q>=b^10, b>=1000, hence the
base is <=b^-2<=1. This uses the exact prime-product identity,
not an estimate of g independent of q. For R empty the
coherent energy is identically zero. Substitution into section
2 proves the native off-Bessel bound E(full T,Omega_i)<=b^-12*d1.
This is the missing RUN68 energy consumer, conditional on
the retained pair, character, cut-tail, coordinate and rigidity
suppliers. It does not require the coherent-link estimate.

## 4. Main fixing-set caller: precise remaining coherent obligation
Moments lines 105–124; same S; m=|Sigma|<=f, y=b^(-6km).
C=y*d, w=(1+a)*C. With tau^44*d1<=d,
    tau^20*d1<=tau^-24*d=b^(-6kf)*d<=C.
This also gives d1<=C. For all s in fixingSet Sigma choose
the sign already specified by each D(w), so X=q0^m.
R is the full link set if Sigma is proper, empty if Sigma is
all chosen places. In the ONLY case R omits a link, m=f, so
    tau^12*d/X^k <= b^(3kf-10kf)*d
                    <= b^(-6kf)*d=C.
Do not incorrectly require the inequality when m is small.
The remaining exact coherent supplier is
    linkEnergy({gamma:disc(gamma)!=0},fixingSet Sigma,R)
      <= (1+a)*C*nu^2.
It is zero when R empty. For proper Sigma it is the actual
global-to-local finite block/correlation/limit argument in
Moments lines 124–183; RUN62–67 supply many local ingredients,
but the combined coherent bound is NOT derived here.
Conditional on it, section 2 yields ((1+a)^3+a^3)*C.
The difference from the native target factor is exactly
    (1-a)*(1+9*a) - ((1+a)^3+a^3)
      = a*(5-12*a-2*a^2)>=0 for 0<a<=1/4.
Thus the source's energy_fixingSet_le follows with no
extra error factor once the retained coherent estimate holds.

## Evidence and frontier
Original source-visible graph B -> Moments -> {energy_compl_besselS_le,
energy_fixingSet_le} -> CrudeEnergy -> {level_pairs,level_lt,full/cut,
CharsAgree,SchurTest} plus coherent GlobalToLocal/TopFloor for fixingSet.
Reduced human graph: exact aggregate recursion and error budget,
two-sided support and scalar rigidity, two explicit prime payments;
the coherent leaf remains in the fixingSet branch only. No global
elaborated edge retired; all prior graphs and axiom ledgers preserved.
Cache context: compact pin, same S, Omega, T, X, C, w, R, signs,
class coordinates and reduction witnesses. No URT or RH assumption.
Local command -v lean/lake/elan gave no paths. SymPy exact expand
checked both polynomial identities in sections 2 and 4 (2/2);
not a test of analytic inputs or Lean. Historical status files
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 retrieved: old-pin
native reduction runs 45577239749,45576756833 report pass.
Compact targeted_results.json 088cd2ec0e935ee1a282f10096949bcf671cc804
retrieved: New.Filling.Moments three named theorem checks (including
energy_fixingSet_le) have only propext, Classical.choice, Quot.sound;
other module timeout 124; all_requested_checks_ok=false,
full_RH_replay=false. Not a check of this new file.
No new native scan/prune/reduce/auto/frontier execution.
Prepared scalar proofs and named source probes below; uncompiled.
RESUME HERE: integrate sections 1–3 at RUN68's complement energy
consumer, independently audit the two-sided support and scalar
rigidity. Then derive the exact proper-Sigma coherent inequality
from Moments lines 124–183, including finite block separation and
the two nested limits; retain noncoherent pair bound and Rallis
test-space normalization as distinct suppliers. No full human RH
closure. HANDOFF TO integration, editor, positivity, audit, kernel.
-/

namespace CompactLandauRun69

theorem full_error_budget (a t C w E : ℝ)
    (ha : 0 < a) (ha4 : a ≤ 1/4) (ht : 0 ≤ t)
    (ht5 : t ≤ a^5) (hC : 0 ≤ C)
    (hE : a*E ≤ a*(1+a)^2*w + t*C*(2+4*a+3*a^2+a^3)) :
    E ≤ (1+a)^2*w + a^3*C := by
  have ha2 : a^2 ≤ (1/4:ℝ)^2 := by gcongr
  have ha3 : a^3 ≤ (1/4:ℝ)^3 := by gcongr
  have hp : 2+4*a+3*a^2+a^3 ≤ 4 := by nlinarith
  have h4 : 4*a^5 ≤ a^4 := by
    calc
      4*a^5 = a^4*(4*a) := by ring
      _ ≤ a^4*1 := mul_le_mul_of_nonneg_left (by linarith) (by positivity)
      _ = _ := by ring
  have hpay : t*C*(2+4*a+3*a^2+a^3) ≤ a^4*C := by
    calc
      _ ≤ t*C*4 := mul_le_mul_of_nonneg_left hp (by positivity)
      _ = (4*t)*C := by ring
      _ ≤ (4*a^5)*C := by gcongr
      _ ≤ a^4*C := mul_le_mul_of_nonneg_right h4 hC
  apply (mul_le_mul_left₀ ha).mp
  calc
    a*E ≤ a*(1+a)^2*w+t*C*(2+4*a+3*a^2+a^3) := hE
    _ ≤ a*(1+a)^2*w+a^4*C := add_le_add_left hpay _
    _ = a*((1+a)^2*w+a^3*C) := by ring

theorem fixing_factor (a : ℝ) (ha : 0 ≤ a) (ha4 : a ≤ 1/4) :
    (1+a)^3+a^3 ≤ (1-a)*(1+9*a) := by
  have ha2 : a^2 ≤ (1/4:ℝ)^2 := by gcongr
  have hp : 0 ≤ 5-12*a-2*a^2 := by nlinarith
  have h := mul_nonneg ha hp
  nlinarith only [h]

theorem exact_prime_ratio (b q q' : ℝ) (hb : 1 ≤ b) (hq : 0 < q)
    (hqlo : b^10 ≤ q) (hqhi : q' ≤ b^11) :
    q'/(b^3*q) ≤ 1 := by
  apply (div_le_iff₀ (by positivity : 0 < b^3*q)).2
  have hbp : b^11 ≤ b^13 := by
    calc
      b^11 = b^11*1 := by ring
      _ ≤ b^11*(b^2) := mul_le_mul_of_nonneg_left (by nlinarith) (by positivity)
      _ = _ := by ring
  calc
    q' ≤ b^11 := hqhi
    _ ≤ b^13 := hbp
    _ = 1*(b^3*b^10) := by ring
    _ ≤ 1*(b^3*q) := by gcongr

#print axioms full_error_budget
#print axioms fixing_factor
#print axioms exact_prime_ratio
end CompactLandauRun69

#check Filling.energy_le_of_level_pairs
#check Filling.energy_le_of_level_lt
#check Filling.energy_le_of_linkEnergy_le
#check Filling.energy_compl_besselS_le
#check Filling.energy_fixingSet_le
#print axioms Filling.energy_compl_besselS_le
#print axioms Filling.energy_fixingSet_le
