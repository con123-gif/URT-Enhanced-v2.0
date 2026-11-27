import New.Filling.CrudeEnergy
import Mathlib.Tactic

/-!
# Editor: cancel disagreeing double orbits before forming the energy
27 November 2026. HUMAN SOURCE-MATCHED reduction, scalar certificate PREPARED,
not compiled. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Original pin leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005;
compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207.
Mission blob a69122b6ad568910a45d2bc13961ab9da4855143 (including mandatory
engine), AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES,
continuity and manuscript 619ae01be98c32e053eef1c8bcd44ccddd0664e7 read.
Latest peer e9d6914f8 flag classification and 3fe5ad1a flag shift,
c3a3b7e3 middle alignment, 42bc7348 exchange determinant, and 85d03bf7
majorant inspected by commit metadata/initial diff. RUN69 a2e4e787
retains the character-vanishing theorem; this note supplies that
specific input, not its already-derived energy recursion.

Actual source paths relative to grh-compact/src at compact pin:
* New/Filling/CrudeEnergy.lean da67bf862a4c5e72ab6a81a7dfb462545cd8833f:
  amplitudeSum_eq_zero_of_not_charsAgree, energy_le_of_level_lt.
* New/Filling/AmplitudeSums.lean 832e25af346bbbbdabdbec205b0e7f833170e0a1:
  amplitudeAbs_lt_top_and_cut_le, summable_amplitude, class-unipotent
  invariance, besselKernel_besselU_mul, hasSum_amplitudeSum_change_of_weight.
* New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727:
  exists_cutoff_classUnip, amplitude, amplitudeAbs.
* Lib/Adelic/QuotientMeasure/CocompactIntegrable.lean
  2e4fa030a20738c99389a926add53ef1a2ddc5a2:
  integral_quotMeasure_stages, integral_quotMeasure_eq_zero_of_mean,
  integral_quotMeasure_eq_zero_of_twist.
* New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444:
  downstream energy_fixingSet_le, energy_compl_besselS_le.
The readable Climbing.lean at same pin, blob 57ca6c3792f03fd628cc200b948bfbc84504af95,
also inspected. The absolute amplitude supplier from 26 Nov
COMPACT_MAJORANT_TO_CORRELATION_AUDIT is used, not assumed redundant.

## 1. One double-orbit integral; no new global cutoff family

Fix actual c,s,c', side (full OR cut), admissible S and stable T.
Let X=T intersect termsOver(c,s,c'), L=classUnip c, R=classUnip c'.
All groups are mapped into the infinite-place group G using ratToInf
in integrals. Countable L x R acts on X by (l,r)gamma=l gamma r^-1.
Write F_gamma(y)=besselKernel gamma y, beta_L and beta_R the native
nonnegative class cutoffs. Source gives exact class-unit invariance
F_(l gamma r^-1)(l y)=F_gamma(y), and both cutoff translate sums are 1.
Fix ONE orbit O, representative gamma. Its stabilizer is the graph
of H=L intersect gamma R gamma^-1: h maps to (h,gamma^-1 h gamma).
Setup supplies a measurable stabilizer cutoff phi with
sum_h phi(h^-1 y)=1; H's infinite image is discrete.

Choose a right-stabilizer-coset representative (l,r) in L x R for
each element of O (i.e. cosets (l,r) Stab(gamma)). Left Haar translation
y=l x rewrites the original amplitude of that term as the integral
of beta_L(l x) beta_R(r gamma^-1 x) F_gamma(x).
Insert sum_h phi(h^-1 x)=1 and change x=h t in each summand.
F_gamma(h t)=F_gamma(t), and the weights become
beta_L(l h t) beta_R(r gamma^-1 h t)
= beta_L(l h t) beta_R(r (gamma^-1 h gamma) gamma^-1 t).
The pairs (l h,r gamma^-1 h gamma) enumerate L x R EXACTLY once.
Thus for the norm, Tonelli proves the exact equality

    sum_(delta in O) amplitudeAbs(delta)
       = integral_G phi(t) ||F_gamma(t)|| dt
       = integral_(H\G) ||F_gamma||.                      (1)

Indeed the inner sum is the product of the two class-cutoff sums,
both equal to one. No finite norm bound on phi beyond its cutoff
property is needed; (1) uses nonnegative extended-valued integrals
and has no cancellation of infinity. The left side is finite from
amplitudeAbs_lt_top_and_cut_le at the SAME c,s,c', so the right side
is finite. Now repeat the same reindexing for the complex/vector
integrals, justified by precisely (1):

    sum_(delta in O) amplitude(delta)
       = integral_(H\G) F_gamma.                         (2)

This avoids the construction of a simultaneous weight on all
right-cosets and the general change-of-weight theorem at THIS
consumer. The latter remains necessary at other consumers (e.g.
amplitudeSum_move, amplitudeSum_besselS_one). Haar normalization
is exactly the native IsCutoff.integral_orbitMeasure; no factor
of orbit size or stabilizer covolume was introduced.

## 2. One scalar kills the entire orbit; no false normalizer premise

If not CharsAgree gamma, source gives rational a,b in besselU
with a gamma=gamma b, and distinct finite unitary characters.
By besselKernel_besselU_mul the fixed F=F_gamma satisfies

    F(a y)=lambda F(y), lambda=chi(a)^-1 chi(b),
    |lambda|=1, lambda!=1.

The rational witness a need NOT normalize H. In particular left
translation by a on H\G is NOT a justified quotient change of
variables. Here is a direct construction of the larger subgroup
used for the source twist theorem, without its general mean over
an auxiliary probability space.

If F identically zero we are done. Otherwise choose y0 with
F(y0)!=0 and a complex coordinate functional ell with ell(F(y0))!=0
(the native kernel space is finite dimensional). Define
r(g)=ell(F(g y0))/ell(F(y0)), continuous, and

    M={g: |r(g)|=1 and F(g y)=r(g) F(y) for EVERY y}.

This is a closed subgroup: the defining equations are closed by
continuity; uniqueness of r from y0 proves r(gh)=r(g)r(h) and
r(g^-1)=r(g)^-1 on M. It contains H and a, and r|H=1.
Thus H is a discrete subgroup of M. Use the same quotient-in-stages
Haar disintegration as integral_quotMeasure_stages / source
integral_quotMeasure_eq_zero_of_mean, now along the closed subgroup M.
By (1), for almost every outer coordinate x the slice
I_x=integral_(H\M) F(m x) is integrable. RIGHT translation by a
on H\M is well-defined without normalizing H. Right translation
of left Haar on M scales it by a positive real d (depending on
the chosen modular-function convention). The identical factor d
acts on the quotient measure by Weil's formula: in the cutoff
disintegration the left H action commutes with right translation.
Therefore

    d I_x = integral_(H\M) F(m a x) = lambda I_x,

since r is a character on M. Since d>0 and lambda on the unit
circle is not 1, d!=lambda. So I_x=0 a.e. and the outer integral
in (2) vanishes. If using the inverse modular convention, replace
d by its reciprocal, still positive. No unimodularity of M or
normality of H is needed. This is also a direct specialization
of the native mean theorem with point mass at a and closed
subgroup M, retaining its actual Haar decomposition premise.

Finally use absolute summability of all amplitudes to group by
orbits, each zero if every gamma in X disagrees. This proves the
actual CrudeEnergy character-vanishing supplier at both sides.
The energy_le_of_level_lt base case is now an exact zero before
norms; use RUN69 recurrence and e9d6914f8 classification without
reopening them. This is NOT the quantitative level-pairs bound.

## 3. Evidence, scope and remaining obligations

Exact finite negative control executed with Python stdlib: in S4
H=< (123) >, a=(34), F=sign, F is H-invariant and twisted by -1
under a, but aHa^-1!=H. There are eight left H cosets and the
signed quotient sum is zero. This is a counterexample to the
unjustified normalizer inference, NOT a test of adelic models.
Reproduce: enumerate permutations of 0,1,2,3; compose a[b[i]];
H={id,(1,2,0,3),(2,0,1,3)}, a=(0,1,3,2); check conjugates,
sign parity by inversion count, and left coset sum. Output:
"S4 exact negative control: twist exists, subgroup not normalized,
8 cosets, signed quotient sum 0".

Local command -v lean and lake both empty. Actual published
targeted_results.json blob 088cd2ec0e935ee1a282f10096949bcf671cc804
reread: six named checks (Tilting and Moments), axioms only
propext/Classical.choice/Quot.sound for these checks; module1
timeout124 (2700.11 s), all_requested_checks_ok=false,
full_RH_replay=false. This is not verification of this replacement.
Native rh_prune/scan/reduce/auto/frontier not run here; historical
old-pin engine CI is not attributed to the compact replacement.
Below generic scalar bridge prepared only. Actual new native
root obligations retired: zero. No complete coverage denominator.

Original source-visible graph:
Moments -> CrudeEnergy.energy_le_of_level_lt ->
amplitudeSum_eq_zero_of_not_charsAgree ->
{hasSum_amplitudeSum_change_of_weight, cutoff, twist}.
Human candidate at this caller:
{amplitudeAbs_lt_top_and_cut_le, native class invariance, native
stabilizer cutoff, countable orbit reindexing (1)-(2), exact twist
and quotient-stages Haar} -> character vanishing.
Native graph, old axiom evidence, all surviving consumers and
unexpanded obligations preserved. Cache key includes compact pin,
actual S,c,s,c', side,T, gamma and stabilizer, Haar normalization
and same majorant. Other A/C primitives and B pairWeight/geometry
and full-to-cut/absolute bounds remain. No URT used.

RESUME HERE: integrate (1)-(2) and the scalar cancellation in the
concise B spine at the CrudeEnergy base case, not as a new long
chapter. Audit the source quotient-stages identification for M
and countable reindexing; if accepted, prepare a native replacement
at amplitudeSum_eq_zero_of_not_charsAgree, with old caller bridge
and actual CI receipt. Next B obstruction is the quantitative
pairWeight/classSize aggregate at energy_le_of_level_pairs; use
c3a3b7e3 alignment and RUN69, not another orbit-vanishing proof.
HANDOFF TO integration, formal audit, positivity, native runner.
RH and human reconstruction remain open.
-/

namespace RHNoncoherentEditor

/-- The orbit phase cannot equal any positive Haar modular scalar. -/
theorem phase_ne_positive (z : ℂ) (d : ℝ) (hd : 0 < d)
    (hz : ‖z‖ = 1) (hn : z ≠ 1) : z ≠ (d : ℂ) := by
  intro h
  have hh : |d| = 1 := by simpa [h, Complex.norm_real] using hz
  have he : d = 1 := by rwa [abs_of_pos hd] at hh
  exact hn (by simp [h, he])

/-- Cancel the whole absolutely convergent slice, before taking any norm. -/
theorem slice_zero {V : Type*} [AddCommGroup V] [Module ℂ V]
    (z : ℂ) (d : ℝ) (hd : 0 < d) (hz : ‖z‖ = 1)
    (hn : z ≠ 1) (I : V) (h : (d : ℂ) • I = z • I) : I = 0 := by
  have hh : (z - (d : ℂ)) • I = 0 := by rw [sub_smul, h, sub_self]
  exact (smul_eq_zero.mp hh).resolve_left (sub_ne_zero.mpr (phase_ne_positive z d hd hz hn))

#print axioms phase_ne_positive
#print axioms slice_zero

end RHNoncoherentEditor
