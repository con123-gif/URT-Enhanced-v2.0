import Mathlib

/-!
# B3/B4: relaxed native energy budget, after Bessel-main obstruction

27 November 2026. Source-matched conditional human reduction; scalar Lean
certificate PREPARED / UNRUN. RH remains OPEN.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Current mission/spine/ledger blobs read:
3adc76221a978016e3505cdf3e36ad688354d7d7,
87e949a9ea899dd09d297aa30f59df4d1b533fc4,
261b9e8bf027af37e6abe6920deb544b23352d48.
AGENTS, SWARM, HANDOFF, EXPANSION and research state consulted.
No integration/RESUME_HERE.md exists at current branch (404); use
the previous actual commit 4cc35babae8b96e3c322db07b44d2ee0d248d2a2.
Latest editor 055cbd4a06ef71250ef565b8c3a7032bd3c9db46 rejects the
Bessel-main-only witness by the actual arithmetic rank cap. ACCEPT
that obstruction; do not try to drop the complement. Reuse editor
40091ec1b986a04a3b45b10d2310c1da2073449a DEFICIT and integration CLIP.
B2/C2 native receipts in live ledger are separate.

Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Sources relative to grh-compact/src:
- New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444,
  lines 105–185 energy_fixingSet_le; 226–258 sum_le_of_positive_type;
  301 onward Fits.exists_translate_finrank_comap_le, hu and second
  moment step. Read exact source, not just comments.
- New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727,
  mainEnergy, besselEnergy, IsAdmissible size bounds.
- New/Filling/GlobalSieve.lean 0ad01a3eec4c5dcd2a51bb1d9773f7834970e372,
  sieve (172 onward), one_sided_poisson.
- New/Filling/FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7,
  sum_blocks_le_topKernel, exists_finite_sieveSystem.
- New/Filling/CrudeEnergy.lean da67bf862a4c5e72ab6a81a7dfb462545cd8833f,
  energy_le_of_linkEnergy_le (180 onward).
- Exact rank and coordinate bridges retained from editor DEFICIT.

## 1. A concrete relaxation at the ACTUAL arithmetic energy supplier

Same admissible data, unitary rho, P=tQ with t nonzero and
t²*c_native*unipCovolume=1. Set G=S.GRes, N_G=|G|,
c=S.columnDim>0, m0=S.besselDegree*mass>0, Dexp=N_G*m0,
R the same good central orthogonal projection, d=rank R<=Dexp.
Let eta=b^-2, delta=eta², alpha=eta^4, b>=1000.
Retain the two actual first moment estimates and ramification
codimension bound from editor DEFICIT. They give d>0 and
tr(T_W)>=(1-5 delta)c for T_W=R T R restricted to W,
T=mean_g rho(g) P P* rho(g)*.

Define the normalized full amplitude Kfull(g)=P* rho(g)P,
using conjugate of native hu entries. Expanding the trace BEFORE
norm estimates and using unitary multiplication gives exactly
  tr(T²) = (1/N_G²) sum_g,h ||P* rho(g^-1 h) P||_HS²
          = (1/N_G) sum_s ||Kfull(s)||_HS²
          = energy(S.amplitudeSum .univ)(univ)/N_G.
One unipCovolume division in Kfull, squared only in energy.
Compression cannot increase Hilbert–Schmidt norm, so
tr(T_W²)<=tr(T²).

Instead of the native B3 target (1+9 delta) mainEnergy, it is
sufficient to prove the following WEAKER actual numerical estimate:
  energy(S.amplitudeSum .univ)(univ)
      <= (1+eta)*S.mainEnergy.                        (RELAXED)
Indeed S.mainEnergy=c²/m0 by Setup, hence
tr(T_W²)<=(1+eta)c²/Dexp.

For x>=0, min(1/2,x)>=x-x²/2 (two elementary quadratic
inequalities). Apply with x=Dexp*lambda/c, retaining all zero
eigenvalues and using the SAME upper row dimension bound:
  sum_i min(c/(2Dexp),lambda_i)
      >= tr(T_W) - Dexp/(2c)*tr(T_W²)
      >= c*(1/2 - eta/2 - 5 delta).
Because d<=Dexp, raising the threshold to c/(2d) can only increase
this clipped sum. Consequently the exact deficit budget of the
already-proved conditional editor rank bridge follows from
  eta/2 + 6 delta + alpha <= eta,
valid even for 0<=eta<=1/1000. In particular the clipped Fourier
criterion is obtained without computing any irreducible spectrum.

More generally, an energy upper multiplier 1+z suffices whenever
z>=0 and z/2+6delta+alpha<=eta. This is a sufficient bound only,
not a characterization of spread. At b=1000 the allowed RELAXED
relative excess eta is 10^6/9 times the original 9delta.
This is a relaxation of a target constant, NOT a runtime speedup,
nor an actual measured improvement in the sieve.

## 2. Transfer the relaxation to the native fixing-set induction

Do not reprove the already-derived rank-to-star argument. The
actual remaining supplier can now be sought with the looser
coefficient at the level of energy_fixingSet_le:
  energy(fullAmplitude)(fixingSet A D)
    <= (1-delta)*(1+eta)*mainEnergy
         * (b^(6k))^(-|A|).                           (LOCAL)
This is strictly weaker than the original target for b>=1000.

Source-matched substitution plan, NOT a new compiled declaration:
in Moments.sum_le_of_positive_type use C=1+eta everywhere the
target coefficient 1+9/b^4 occurs, and assume LOCAL in place of
energy_fixingSet_le. The contradiction step hK asserts total
positive-type mass U > C*mainEnergy*b^(-6k|A|). Its proof proceeds
by downward induction on sets of fixed places. In the nonterminal
case the missing place w is inserted and the induction hypothesis
is used on the tensor of the original vector family with the
permutation vector of an additional fixed frame vector.
The comparison after ih uses hK, so C cancels: the child mass is
bounded by U/b^(6k). The determinant-count bound
card_mul_sum_det_le and the escape-class cardinality estimates
in lines 239–258 therefore retain their original size hypotheses,
independent of the numerical choice of C. The proof bounds the
mass off fixingSet by delta*U; keep that bound, the h0/hu/hB/hA
hypotheses, the exact frame conditions and the terminal all-places
case. If these same source-visible escape steps replay with LOCAL,
then
  U <= (1-delta)*C*mainEnergy*b^(-6k|A|) + delta*U
implies the required relaxed induction conclusion by cancellation
of the positive factor 1-delta. In the top case A=empty take
Theta=||Kfull(s)||_HS², the same nonnegative positive-type function
used in the native second moment (Gram of the translated PP*).
hB is equality on each finite subset by definition of energy.

This identifies an actual caller edit and looser quantitative
supplier, not a proof of LOCAL from scratch. In particular the
current sharp local theorem is sufficient, but using it retains
all B3 dependencies. No removal of one_sided_poisson, finite
system, weighted packing, head/frequency bounds, or primitive
first-moment proofs. Do not claim LOCAL from a PSD Bessel-only
kernel: the editor's actual rank obstruction remains binding.
The native induction generalization needs whole-file replay;
the scalar cancellation below is not that replay.

## 3. Actual checks and retained evidence

Local PATH has no lean/lake. Exact CPython Fraction checks executed
in this run: 2825 total. Reproduce:
```python
from fractions import Fraction as F
n=0
for b in [1000,1001,2000,10**4,10**6]:
 e=F(1,b*b); d=e*e; a=d*d
 assert e/2+6*d+a<=e
 assert (1-d)*(1+e)>(1-d)*(1+9*d)
 assert 6*F(1,b**9)<d
 n+=3
for D in range(1,8):
 for j in range(401):
  x=F(j,100); c=F(3,2); scale=F(D); v=x*c/scale
  assert min(c/(2*scale),v)>=v-scale*v*v/(2*c)
  n+=1
b=1000; eta=F(1,b*b); delta=eta**2
x=F(1,2*b); eig=[(1-x)/2,(1+x)/2]
assert sum(eig)==1
assert 2*sum(t*t for t in eig)==1+eta/4
assert 1+9*delta<1+eta/4<1+eta
n+=3
print('exact regression checks',n)
print('b=1000 allowed relative error ratio',eta/(9*delta))
```
Output: exact regression checks 2825; ratio 1000000/9.
Last spectrum is abstract, not actual admissible D; demonstrates
strict numerical relaxation without claiming counterexample to source.

Context key: compact pin, SAME D,P,R, c,d,Dexp,b,ramification and
native amplitude normalization. Original graph and axiom records
unchanged; reduced source-visible route is star -> DEFICIT ->
RELAXED -> LOCAL + retained induction + first moments + ramification.
Original sharp energy path remains preferred verified-source fallback.
Native rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier not
executed here. No new CI PASS, no proof of the relaxed local supplier
without the original theorem, no new closed root obligation.
No URT performance claim.

RESUME HERE: specialize the actual energy_fixingSet_le local
topKernel/sieve aggregation to LOCAL, preserving exact cutoffs,
finite measure and Bessel degree normalization; prove the relaxed
bound from any weaker available primitive estimate, or backtrack
to the existing sharp supplier if no primitive is simplified.
Use existing shared native runner for the C-generalized induction
and scalar certificates rather than a competing cold source build.
HANDOFF TO B3/B4, editor, audit, kernel. RH remains OPEN.
-/

namespace RHIntegrationRelaxedEnergy

theorem clip_quadratic (x : ℝ) :
    x - x^2 / 2 ≤ min (1/2) x := by
  apply le_min
  · nlinarith [sq_nonneg (x-1)]
  · nlinarith [sq_nonneg x]

theorem relaxed_budget (eta : ℝ) (h0 : 0 ≤ eta)
    (h1 : eta ≤ 1/1000) :
    eta/2 + 6*eta^2 + eta^4 ≤ eta := by
  have hs : eta^2 ≤ eta/1000 := by
    nlinarith [mul_nonneg h0 (sub_nonneg.mpr h1)]
  have hs1 : eta^2 ≤ 1 := by linarith [hs]
  have hf : eta^4 ≤ eta^2 := by
    nlinarith [mul_nonneg (sq_nonneg eta) (sub_nonneg.mpr hs1)]
  linarith

theorem cancel_escape (U B delta : ℝ) (h : delta < 1)
    (hu : U ≤ (1-delta)*B + delta*U) : U ≤ B := by
  have hp : 0 < 1-delta := sub_pos.mpr h
  apply (mul_le_mul_left hp).mp
  linarith

#print axioms clip_quadratic
#print axioms relaxed_budget
#print axioms cancel_escape
end RHIntegrationRelaxedEnergy
