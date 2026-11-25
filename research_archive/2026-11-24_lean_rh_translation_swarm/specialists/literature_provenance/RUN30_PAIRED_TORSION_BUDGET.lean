import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.NumThree
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.ExponentLe
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN30 — paired integral homology torsion budget, actual sNum consumer.
STATUS: SOURCE-MATCHED human derivation; exact source replacement generated,
not executed in Lean. Original source and all surviving obligations preserved.
Mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc read first, SWARM
4b77b161, HANDOFF bbc46df7, EXPANSION c8152d07, AGENTS 8db0201d;
continuity/state/log/protocol excerpts and manuscript
75026c85481848e3c615fcec6e25bec2cfae1dbb read. Latest peer commits
b99ef9ad (projected zeros), e70e93e7 (automorphic card), 91754a9c
(two reference integers; CountVs still needs LemmaK) and 15 recent
commit summaries inspected. Distinct from RUN29 rational rank and peers.

PIN 40e56bab026552e089d7afcfeff08d2defb9c005.
Source paths relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties:
 ModularityArgument/ClassCounting/NumThree.lean 900c8e3fca10cdf9256061213dcc9453bf98f3d2
 ModularityArgument/ClassCounting/ExponentLe.lean 2b3e4233ad68b7007573c70feaf4703d85452b47
 ModularityArgument/ClassCounting/LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10
 ModularityArgument/ClassCounting/LemmaKOfLitN.lean 2b1e21f70e69ace53b5219e9e0807b6de0d1920e
 GeneratorCountTuples/TorsBoundPow.lean 3552e823716da4241d053c2cdfe0a116039e7886
 GeneratorCountTuples/LemmaK.lean 8726ea4259cd1f0fcb350eca97a3be2478261c87
 HermiteNormalForms/Assembly.lean 2170a3e28188b4e75f62aade0ae9e7890155076c
 HermiteNormalForms/Orbnum.lean 91b6071b9a06356e587ccafae21fd8354f52cb76
 HermiteNormalForms/Imports.lean d7007a24b38bfa8e61b6c94547f48b70a39f5265
 HermiteNormalForms/ImportsAlt.lean e85bc5d2c2050cfbdba746269f219b1ef05d9ebb
 TorsionBoundsChains/LogLeExp.lean c579335d4b6901c3a2c6aeaf4a1d8e7294127fdc
 TorsionBoundsChains/TupExact.lean 56183e94888a25f047c33ba954ba790c4a920b03
 TorsionBoundsChains/TorsBoundOf.lean 9002d8b8aaf709028c6ec4db9110e3d4ed732c11.
Upstream head 8e5cefeeaffe7e4c12153385b7bb33fb7223c41a differs from prior
251c7b05; ExponentLe same path 404, not theorem deletion evidence.
Head LemmaKOfSteps 6c94d18327b294796f3856cd04b1a382724de5db,
Assembly 1f6109281f921127f8dca77c0bc4600ed0865b1e, LogLeExp
161d3638de7a113d6454fe2c698b179c381c8dcf; no mixing revisions.

INTEGRATION BLOCK (ordinary math):
Let E>=1, N=4E+6, n=[L:Q], D=|disc L|, d=nN; write T_m for
the torsion subgroup of H_m(GL_N(O_L),Z). SLayer supplies a totally
complex L with r2>2E+1. The only uses of STors in sNum are
m=2E+1 and 2E. Indeed its output before taking logarithms is
l^s <= |T_(2E+1)| |T_(2E)| l^X. Finiteness/positivity of the
two natural cardinals also follows from this displayed inequality,
since infinite Nat.card is zero. Taking logarithms after exact
cancellation of (l^nu)^r2 gives s log l <= log|T_(2E+1)|
+ log|T_(2E)| + X log l. Thus the sum of those two logs, not all
degrees nor two separate upper estimates, is the necessary input.
All other premises SFew, SCount, SSha, SLayer and SFinal remain.

The native torsion bound already has a genuine source-body supplier.
Let A=orbBound L N m, s0=3^(dN). KH.mainFace (exact equivariant
augmented tuple chains, orbit count <=A, finite stabilizers <=s0,
boundary l1 norm <=m+2) gives finite T_m and
  log|T_m| <= A [log(m+2) + m s0^m log s0].
This is KH.TorsLe.log_le, with no real-rank inference. Native orbnum
gives A <= (2Dd)^(12(m+1)d^3 N). Substituting before weakening
gives one direct all-prime bound. The geometric supplier
sx_exact -> good -> acyc_simp/tupExact, orb and stab remain.
For a compact uniform envelope, KH.TorsLe.log_le_exp with
a=12(m+1)d^3 N log(2Dd), sigma=2dN gives
  log|T_m| <= exp(a+(m+1)sigma+2m).
On actual SLayer fields n>=4 (in fact r2>2E+1 and n=2r2),
x=2En>=8, m<=2E+1, N<=10E<=5x/4, d<=5x,
m+1<=4E<=x/2, D>=1. Put Y=log(2D)>=1/2.
log(2Dd)=Y+log d<=Y+d-1<=10xY.
Consequently a<=9375 x^6 Y; (m+1)sigma<= (25/4)x^3;
2m<=x. Therefore the whole exponent <=
  (9375+13+2)x^6 Y = 9390 x^6 Y <= x^11 Y
since x>=8 and 8^5=32768. This provides the aggregate bound
  log|T_(2E+1)|+log|T_(2E)| <= 2 kBound(11,E,n,D).
The improved C=11 argument is human-only; the Lean file checks
the weaker actual caller and the original-statement bridge, NOT
the new exponent envelope. If the C=11 supplier is later replayed,
the existing sNum arithmetic would give ShaK exponent
5*(max(11,9)+2)+11=76 instead of 141 from C0=24; this is NOT
a bound on final CK nor a proof of RH.

LITERATURE / TRUST LEDGER:
- Soulé, A Bound for the Torsion in the K-Theory of Algebraic
  Integers, Documenta Math. Extra Vol. Kato (2003), 761–788,
  Thm 1 p.778, Thms 2,3 and Prop 4 p.779.
  https://www2.math.ethz.ch/EMIS/journals/DMJDMV/vol-kato/soule.dm.pdf
  Actual text retrieved. PDF screenshot requests for indices 17,18
  returned 404; no visual-page validation claimed. Thm 1 discards
  primes <=1+max(n,N); Thm 2 discards small primes in K-theory;
  Thm 3 bounds etale H2 only for p>=4j-1 and p>=n+2.
  Prop 4(i) has log-log bound involving sqrt(D) and powers of log(D).
  These cannot directly replace the full native STors budget for all
  prime factors and growing fields. Not an added premise. No inference
  from names such as PublishedTheorems/OpenLiteratureStatements.
- Native STors, SNum, ShaK, SLayer and new STorsPair are Prop
  definitions, not stand-alone axioms; sTors, torsAll, tors_le,
  orbnum, mainFace, log_le and sNum have theorem bodies.
  torsAll invokes tors_le and orbnum; sTors wraps torsAll.
  No transitive kernel axiom classification claimed. Existing Poitou-
  Tate, local finiteness, local duality and other external premises
  in lemmaK remain exactly as in RUN28, not assumed discharged.
  Do not identify K-groups with integral group homology without proof.

Original local source-call overlay: LemmaK -> lemmaK_of_steps ->
sNum(hFew,hCount,hSha,hLayer,sTors) -> torsAll -> tors_le,orbnum,
log_le_exp,exponent_le; tors_le -> mainFace,sx_exact,orb,stab.
Reduced consumer: sNum_pair -> same first four inputs + STorsPair;
STorsPair <- STors (checked bridge PREPARED), or the above human
direct quantitative supplier. No global graph deletion asserted.
Cache key = pin, consumer sNum, actual SLayer field, E>=1,
r2>2E+1, N=4E+6, consecutive m, same D,n, integral coefficients.
Shared uses of STors/tors_le elsewhere are unaffected. Root link is
the prior CountVs/LemmaK source-call path, not a new authenticated
kernel reachability proof. Backtrack to original sNum on replay failure.

EXECUTION: fetched 13 pinned files as recorded and 4 head paths.
Compared latest peer patches/handoffs. Actual source-text generation
checked 3 unique anchors; old hT1b/hT2b references zero; hC0 L' calls
2 -> 1, no other original proof text changed. Copied private helpers
because they cannot be imported by unqualified name. Old CI status
files retrieved: 45577239749 returncode 0 (conditional strip root);
45576756833 returncode 0 (bounded rh_of_right scan, 324 pending).
These do not validate this file. Local command -v lean/lake/elan
returned no paths. New certificate not executed, not queued, no PASS.
No URT, no synthetic experiments. Native reduction tools prepared
below; existing axiom/role evidence unchanged.
RESUME HERE: compile this actual paired consumer with pinned source
and native engine imports; prove the C=11 supplier in Lean using
tors_le, orbnum, log_le_exp and SLayer degree guard; then replay
lemmaK_of_steps at CountVs. Retain all automorphic/geometry leaves.
HANDOFF TO integration/editor, audit, kernel, Galois.
-/
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.LemmaKOfSteps
import Development.AutomorphicArithmetic.AutomorphicVarieties.GeneratorCountTuples.NumGens

open NumberField IsDedekindDomain UpperTheory.V UpperTheory.V.KL UpperTheory.V.ZK

private theorem num_three (C u Y t : ℝ) (hu : 2 ≤ u) (hY : 1 / 2 ≤ Y) (P : ℝ) (hP : P ≤ u ^ 9 * Y)
    (ht : t ≤ 2 * Real.exp (u ^ C * Y) + P) : t ≤ Real.exp (u ^ (max C 9 + 2) * Y) := by
  have hu1 : (1:ℝ) ≤ u := by linarith
  have hu0 : (0:ℝ) < u := by linarith
  have hY0 : (0:ℝ) < Y := by linarith
  have hA1 : u ^ C ≤ u ^ (max C 9) := Real.rpow_le_rpow_of_exponent_le hu1 (le_max_left _ _)
  have hA2 : u ^ (9:ℕ) ≤ u ^ (max C 9) := by
    rw [← Real.rpow_natCast]
    exact Real.rpow_le_rpow_of_exponent_le hu1 (by push_cast; exact le_max_right _ _)
  have h2 : u ^ (max C 9 + 2) = u ^ (max C 9) * u ^ (2:ℕ) := by
    rw [Real.rpow_add hu0, Real.rpow_two]
  have hu9 : (256:ℝ) ≤ u ^ (9:ℕ) := by
    calc (256:ℝ) ≤ 2 ^ 9 := by norm_num
      _ ≤ u ^ 9 := pow_le_pow_left₀ (by norm_num) hu 9
  have hAC : u ^ C * Y ≤ u ^ (max C 9) * Y := mul_le_mul_of_nonneg_right hA1 hY0.le
  have hPA : P ≤ u ^ (max C 9) * Y := le_trans hP (mul_le_mul_of_nonneg_right hA2 hY0.le)
  have hA9 : u ^ (9:ℕ) * Y ≤ u ^ (max C 9) * Y := mul_le_mul_of_nonneg_right hA2 hY0.le
  have hApos : 1 ≤ u ^ (max C 9) * Y := by nlinarith
  have hu2 : (4:ℝ) ≤ u ^ (2:ℕ) := by nlinarith
  have h4A : 4 * (u ^ (max C 9) * Y) ≤ u ^ (max C 9 + 2) * Y := by
    rw [h2]
    have : u ^ (max C 9) * u ^ (2:ℕ) * Y = u ^ (2:ℕ) * (u ^ (max C 9) * Y) := by ring
    rw [this]
    exact mul_le_mul_of_nonneg_right hu2 (by linarith)
  have e1 : Real.exp (u ^ C * Y) ≤ Real.exp (u ^ (max C 9) * Y) := Real.exp_le_exp.mpr hAC
  have e3 : 3 * (u ^ (max C 9) * Y) + 1 ≤ Real.exp (3 * (u ^ (max C 9) * Y)) := by
    have := Real.add_one_le_exp (3 * (u ^ (max C 9) * Y))
    linarith
  have e4 : Real.exp (4 * (u ^ (max C 9) * Y)) =
      Real.exp (u ^ (max C 9) * Y) * Real.exp (3 * (u ^ (max C 9) * Y)) := by
    rw [← Real.exp_add]
    ring_nf
  have eA := Real.add_one_le_exp (u ^ (max C 9) * Y)
  have ep := Real.exp_pos (u ^ (max C 9) * Y)
  have e5 : Real.exp (u ^ (max C 9) * Y) * (3 * (u ^ (max C 9) * Y) + 1) ≤
      Real.exp (u ^ (max C 9) * Y) * Real.exp (3 * (u ^ (max C 9) * Y)) :=
    mul_le_mul_of_nonneg_left e3 ep.le
  calc t ≤ 2 * Real.exp (u ^ (max C 9) * Y) + u ^ (max C 9) * Y := by linarith
    _ ≤ Real.exp (4 * (u ^ (max C 9) * Y)) := by rw [e4]; nlinarith
    _ ≤ Real.exp (u ^ (max C 9 + 2) * Y) := Real.exp_le_exp.mpr h4A

private theorem num_poly (u Y t b g c v : ℝ) (hu : 2 ≤ u) (hY : 1 / 2 ≤ Y) (ht : t ≤ u)
    (hb0 : 0 ≤ b) (hb : b ≤ u + 2 * u ^ 2) (hg0 : 0 ≤ g) (hg : g ≤ u + 2 * u * Y + 2) (hc0 : 0 ≤ c) (hc : c ≤ u)
    (hv0 : 0 ≤ v) (hv : v ≤ u) : ((b + v) * g + c + v) * t ≤ u ^ 9 * Y := by
  have hu0 : (0:ℝ) ≤ u := by linarith
  have hY0 : (0:ℝ) < Y := by linarith
  have huY : 1 ≤ u * Y := by nlinarith
  have hu2 : 2 * u ≤ u ^ 2 := by nlinarith
  have hbv : b + v ≤ 3 * u ^ 2 := by nlinarith
  have hg' : g ≤ 6 * (u * Y) := by nlinarith
  have h1 : (b + v) * g ≤ 3 * u ^ 2 * (6 * (u * Y)) :=
    mul_le_mul hbv hg' hg0 (by positivity)
  have h4 : (4:ℝ) ≤ u ^ 2 := by nlinarith
  have h4' : 4 * (u * Y) ≤ u ^ 2 * (u * Y) := mul_le_mul_of_nonneg_right h4 (by positivity)
  have hcv : c + v ≤ 4 * (u * Y) := by nlinarith
  have hS0 : 0 ≤ (b + v) * g + c + v := by positivity
  have hsum : (b + v) * g + c + v ≤ 19 * (u ^ 3 * Y) := by nlinarith
  have hst : ((b + v) * g + c + v) * t ≤ ((b + v) * g + c + v) * u :=
    mul_le_mul_of_nonneg_left ht hS0
  have hsu : ((b + v) * g + c + v) * u ≤ 19 * (u ^ 3 * Y) * u :=
    mul_le_mul_of_nonneg_right hsum hu0
  have h5 : (32:ℝ) ≤ u ^ 5 := by
    calc (32:ℝ) = 2 ^ 5 := by norm_num
      _ ≤ u ^ 5 := pow_le_pow_left₀ (by norm_num) hu 5
  have h4Y : 0 ≤ u ^ 4 * Y := by positivity
  have hfin : 19 * (u ^ 3 * Y) * u ≤ u ^ 9 * Y := by
    have e : 19 * (u ^ 3 * Y) * u = 19 * (u ^ 4 * Y) := by ring
    have e' : u ^ 9 * Y = u ^ 5 * (u ^ 4 * Y) := by ring
    rw [e, e']
    exact mul_le_mul_of_nonneg_right (by linarith) h4Y
  linarith

set_option maxHeartbeats 800000 in
private theorem num_down (C : ℝ) (hC : 0 ≤ C) (E n D n' D' d w : ℕ) (hE : 1 ≤ E) (hn : 1 ≤ n) (hD : 1 ≤ D)
    (hD' : 1 ≤ D') (h1 : n' = d * n) (hn' : 1 ≤ n') (h2 : d ≤ (n + 1) * (4 * E + 4)) (hw : w ≤ 2 * n')
    (h3 : D' ≤ D ^ d * w ^ n') : kBound C E n' D' ≤ kBound (5 * C + 11) E n D := by
  have hw1 : 1 ≤ w := by
    rcases Nat.eq_zero_or_pos w with h | h
    · subst h
      rw [zero_pow (by omega), mul_zero] at h3
      omega
    · exact h
  unfold kBound
  apply Real.exp_le_exp.mpr
  have hE' : (1:ℝ) ≤ E := by exact_mod_cast hE
  have hn1 : (1:ℝ) ≤ n := by exact_mod_cast hn
  have hD1 : (1:ℝ) ≤ D := by exact_mod_cast hD
  have hD'1 : (1:ℝ) ≤ D' := by exact_mod_cast hD'
  have hn'1 : (1:ℝ) ≤ n' := by exact_mod_cast hn'
  have hw1R : (1:ℝ) ≤ w := by exact_mod_cast hw1
  have h1R : (n':ℝ) = d * n := by exact_mod_cast h1
  have h2R : (d:ℝ) ≤ (n + 1) * (4 * E + 4) := by exact_mod_cast h2
  have hwR : (w:ℝ) ≤ 2 * n' := by exact_mod_cast hw
  have h3R : (D':ℝ) ≤ D ^ d * w ^ n' := by exact_mod_cast h3
  have hd0 : (0:ℝ) ≤ d := Nat.cast_nonneg d
  have hd16 : (d:ℝ) ≤ 16 * E * n := by
    have : ((n:ℝ) + 1) * (4 * E + 4) ≤ (2 * n) * (8 * E) :=
      mul_le_mul (by linarith) (by linarith) (by positivity) (by positivity)
    nlinarith
  have hn'16 : (n':ℝ) ≤ 16 * E * n ^ 2 := by
    rw [h1R]
    have := mul_le_mul_of_nonneg_right hd16 (by linarith : (0:ℝ) ≤ n)
    nlinarith
  set x : ℝ := 2 * E * n with hx
  have hx2 : 2 ≤ x := by nlinarith
  have hx0 : 0 < x := by linarith
  have hEn : (E:ℝ) * n ^ 2 ≤ E ^ 2 * n ^ 2 := by
    have : (E:ℝ) ≤ E ^ 2 := by nlinarith
    exact mul_le_mul_of_nonneg_right this (by positivity)
  have hn'x : (n':ℝ) ≤ 4 * x ^ 2 := by
    have : x ^ 2 = 4 * E ^ 2 * n ^ 2 := by rw [hx]; ring
    nlinarith
  have hd8 : (d:ℝ) ≤ 8 * x := by rw [hx]; linarith
  have hx3 : 8 ≤ x ^ 3 := by nlinarith
  have hbase : 2 * (E:ℝ) * n' ≤ x ^ 5 := by
    have a1 : 2 * (E:ℝ) * n' ≤ 2 * E * (16 * E * n ^ 2) :=
      mul_le_mul_of_nonneg_left hn'16 (by positivity)
    have a2 : 2 * (E:ℝ) * (16 * E * n ^ 2) = 8 * x ^ 2 := by rw [hx]; ring
    have a3 : 8 * x ^ 2 ≤ x ^ 3 * x ^ 2 := mul_le_mul_of_nonneg_right hx3 (by positivity)
    have a4 : x ^ 3 * x ^ 2 = x ^ 5 := by ring
    linarith
  have hbase0 : (0:ℝ) ≤ 2 * E * n' := by positivity
  have hpowC : (2 * (E:ℝ) * n') ^ C ≤ (x ^ 5) ^ C := Real.rpow_le_rpow hbase0 hbase hC
  have hx5C : (x ^ 5) ^ C = x ^ (5 * C) := by
    rw [← Real.rpow_natCast, ← Real.rpow_mul hx0.le]
    norm_num
  have hxadd : x ^ (5 * C + 11) = x ^ (5 * C) * x ^ (11:ℕ) := by
    rw [Real.rpow_add hx0, ← Real.rpow_natCast]
    norm_num
  have hL2 : (0.6931471803:ℝ) < Real.log 2 := Real.log_two_gt_d9
  have hLD : Real.log 2 ≤ Real.log (2 * (D:ℝ)) := Real.log_le_log (by norm_num) (by linarith)
  have hlogD : Real.log D ≤ Real.log (2 * (D:ℝ)) := Real.log_le_log (by linarith) (by linarith)
  have hlogD0 : 0 ≤ Real.log (D:ℝ) := Real.log_nonneg hD1
  have hlogw0 : 0 ≤ Real.log (w:ℝ) := Real.log_nonneg hw1R
  have hlogw : Real.log (w:ℝ) ≤ 8 * x ^ 2 := by
    have := Real.log_le_sub_one_of_pos (by linarith : (0:ℝ) < w)
    linarith
  have hlogD' : Real.log (2 * (D':ℝ)) ≤ Real.log 2 + d * Real.log D + n' * Real.log w := by
    have hDd : (0:ℝ) < (D:ℝ) ^ d := pow_pos (by linarith) _
    have hwn : (0:ℝ) < (w:ℝ) ^ n' := pow_pos (by linarith) _
    calc Real.log (2 * (D':ℝ)) ≤ Real.log (2 * ((D:ℝ) ^ d * (w:ℝ) ^ n')) :=
          Real.log_le_log (by linarith) (by linarith)
      _ = Real.log 2 + d * Real.log D + n' * Real.log w := by
          rw [Real.log_mul (by norm_num) (by positivity), Real.log_mul hDd.ne' hwn.ne',
            Real.log_pow, Real.log_pow]
          ring
  have hlogD'0 : 0 ≤ Real.log (2 * (D':ℝ)) := Real.log_nonneg (by linarith)
  set LD := Real.log (2 * (D:ℝ)) with hLDdef
  have t1 : (d:ℝ) * Real.log D ≤ 8 * x * LD :=
    mul_le_mul hd8 hlogD hlogD0 (by positivity)
  have t2 : (n':ℝ) * Real.log w ≤ 4 * x ^ 2 * (8 * x ^ 2) :=
    mul_le_mul hn'x hlogw hlogw0 (by positivity)
  have t2' : 4 * x ^ 2 * (8 * x ^ 2) = 32 * x ^ 4 := by ring
  have hLD1 : 1 ≤ 2 * LD := by linarith
  have hx40 : 0 ≤ 32 * x ^ 4 := by positivity
  have t3 : 32 * x ^ 4 * 1 ≤ 32 * x ^ 4 * (2 * LD) := mul_le_mul_of_nonneg_left hLD1 hx40
  have hx4 : 1 ≤ x ^ 4 := by nlinarith
  have hxx4 : x ≤ x ^ 4 := by nlinarith
  have hx7 : 128 ≤ x ^ 7 := by
    calc (128:ℝ) = 2 ^ 7 := by norm_num
      _ ≤ x ^ 7 := pow_le_pow_left₀ (by norm_num) hx2 7
  have hLD0 : 0 ≤ LD := by linarith
  have s1 : 1 * LD ≤ x ^ 4 * LD := mul_le_mul_of_nonneg_right hx4 hLD0
  have s2 : x * LD ≤ x ^ 4 * LD := mul_le_mul_of_nonneg_right hxx4 hLD0
  have tsum : Real.log (2 * (D':ℝ)) ≤ 73 * (x ^ 4 * LD) := by
    have e1 : 8 * x * LD = 8 * (x * LD) := by ring
    have e2 : 32 * x ^ 4 * (2 * LD) = 64 * (x ^ 4 * LD) := by ring
    linarith
  have tfin : Real.log (2 * (D':ℝ)) ≤ x ^ (11:ℕ) * LD := by
    have e : x ^ (11:ℕ) * LD = x ^ 7 * (x ^ 4 * LD) := by ring
    have h0 : 0 ≤ x ^ 4 * LD := by positivity
    have : 73 * (x ^ 4 * LD) ≤ x ^ 7 * (x ^ 4 * LD) :=
      mul_le_mul_of_nonneg_right (by linarith) h0
    rw [e]
    linarith
  rw [hxadd, ← hx5C]
  calc (2 * (E:ℝ) * n') ^ C * Real.log (2 * (D':ℝ)) ≤ (x ^ 5) ^ C * (x ^ (11:ℕ) * LD) :=
        mul_le_mul hpowC tfin hlogD'0 (by positivity)
    _ = (x ^ 5) ^ C * x ^ (11:ℕ) * LD := by ring

private theorem gens_le (L : Type) [Field L] [NumberField L] :
    (gens L : ℝ) ≤ 2 * (Module.finrank ℚ L : ℝ) +
      2 * (2 * (Module.finrank ℚ L : ℝ)) * Real.log (2 * ((discr L).natAbs : ℝ)) + 2 := by
  have key := K.numGens 2 L (classNumber L) (by apply Nat.le_mul_of_pos_right; positivity)
  have key0 := K.numGens 2 L 0 (Nat.zero_le _)
  simp only [Nat.cast_zero, Real.log_zero, Nat.cast_ofNat] at key key0
  have hl2 : 0 < Real.log 2 := Real.log_pos (by norm_num)
  have hnD : 0 ≤ 4 * (Module.finrank ℚ L : ℝ) * Real.log (2 * ((discr L).natAbs : ℝ)) := by
    nlinarith
  have hk : (Nat.log 2 (classNumber L) : ℝ) ≤
      4 * (Module.finrank ℚ L : ℝ) * Real.log (2 * ((discr L).natAbs : ℝ)) := by
    rcases Nat.eq_zero_or_pos (classNumber L) with h0 | hpos
    · rw [h0, Nat.log_zero_right, Nat.cast_zero]
      exact hnD
    · have hp : 2 ^ Nat.log 2 (classNumber L) ≤ classNumber L := Nat.pow_log_le_self 2 hpos.ne'
      have hpR : (2:ℝ) ^ Nat.log 2 (classNumber L) ≤ (classNumber L : ℝ) := by exact_mod_cast hp
      have hlog : (Nat.log 2 (classNumber L) : ℝ) * Real.log 2 ≤ Real.log (classNumber L) := by
        rw [← Real.log_pow]
        exact Real.log_le_log (by positivity) hpR
      nlinarith
  show ((2 * Module.finrank ℚ L + Nat.log 2 (classNumber L) + 2 : ℕ) : ℝ) ≤ _
  push_cast
  linarith

set_option maxHeartbeats 800000 in
/-- The only torsion input consumed by sNum: a combined budget at the two
consecutive degrees, in the actual SLayer field. -/
def UpperTheory.V.ZK.STorsPair : Prop :=
  ∃ C : ℝ, ∀ (L : Type) [Field L] [NumberField L], IsTotallyComplex L →
    ∀ E : ℕ, 1 ≤ E → 2 * E + 1 < InfinitePlace.nrComplexPlaces L →
      Real.log (tc L (4 * E + 6) (2 * E + 1)) +
        Real.log (tc L (4 * E + 6) (2 * E)) ≤
        2 * kBound C E (Module.finrank ℚ L) (discr L).natAbs

theorem UpperTheory.V.ZK.run30_pair_of_STors (h : STors) : STorsPair := by
  obtain ⟨C, hC⟩ := h
  refine ⟨C, ?_⟩
  intro L _ _ hTC E hE _
  have h1 := hC L hTC E hE (2 * E + 1) le_rfl
  have h2 := hC L hTC E hE (2 * E) (by omega)
  linarith

theorem UpperTheory.V.ZK.run30_sNum_pair :
    SFew → SCount → SSha → SLayer → STorsPair → ∃ C, ShaK C := by
  intro hFew hCount hSha hLayer hTors
  obtain ⟨C0, hC0⟩ := hTors
  refine ⟨5 * (max C0 9 + 2) + 11, ?_⟩
  unfold UpperTheory.V.ZK.ShaK
  intro l hl L i1 i2 hTC hMu E hE
  obtain ⟨k, rfl⟩ : ∃ k, E = k + 1 := ⟨E - 1, by omega⟩
  obtain ⟨L', i3, i4, c, d, hTC', hTop, hlc, hcp, hdeg, hd, hlc2, hdisc, hsha⟩ :=
    hLayer L l (k + 1) hMu hE
  have hl1 : 1 < l := hl.out.one_lt
  have hB : ∀ (F : Type) [Field F] [NumberField F] [Algebra L' F] (ν : ℕ) (ζ : (𝓞 F)ˣ)
      (γ : Gal(F/L')), Lay l c ν ζ γ →
      Finite ↑(EqHom γ ((1 + l ^ c) ^ (k + 1)) (l ^ ν)) ∧
        Nat.card ↑(EqHom γ ((1 + l ^ c) ^ (k + 1)) (l ^ ν)) ≤
          tc L' (4 * k + 10) (2 * k + 3) * tc L' (4 * k + 10) (2 * k + 2) *
            l ^ ((2 * k + 2 + (2 * k + 3) * (c + (2 * k + 3)) + (k + 1).factorization l) * gens L' +
              c + (k + 1).factorization l) := by
    intro F i5 i6 i7 ν ζ γ hLay
    have hfew := hFew L' F hTC' l c ν k ζ γ hLay (by omega) (by omega)
    have hcnt := hCount L' F hTC' l c ν (k + 1) _ _ ζ γ hLay (by omega) hfew
    refine ⟨hcnt.1, ?_⟩
    have hP : 0 < (l ^ ν) ^ InfinitePlace.nrComplexPlaces L' := pow_pos (pow_pos (by omega) _) _
    have h2 := hcnt.2
    apply le_of_mul_le_mul_left _ hP
    calc _ = Nat.card ↑(EqHom γ ((1 + l ^ c) ^ (k + 1)) (l ^ ν)) *
          (l ^ ν) ^ InfinitePlace.nrComplexPlaces L' := mul_comm _ _
      _ ≤ _ := h2
      _ = _ := by ring
  obtain ⟨s, hs, hlsB⟩ := hSha L' hTC' l c (k + 1) _ hTop hE hB
  have hne : LDataCardLeFinrank.shaInv L l ((k + 1 : ℕ) : ℤ) ≠ ⊤ := by
    intro htop
    rw [htop, hs] at hsha
    exact ENat.coe_ne_top s (top_le_iff.mp hsha)
  refine ⟨(LDataCardLeFinrank.shaInv L l ((k + 1 : ℕ) : ℤ)).toNat, (ENat.coe_toNat hne).symm, ?_⟩
  have hs0 : (LDataCardLeFinrank.shaInv L l ((k + 1 : ℕ) : ℤ)).toNat ≤ s := by
    have h := hsha
    rw [← ENat.coe_toNat hne, hs] at h
    exact_mod_cast h
  set s0 := (LDataCardLeFinrank.shaInv L l ((k + 1 : ℕ) : ℤ)).toNat with hs0def
  set T1 := tc L' (4 * k + 10) (2 * k + 3) with hT1
  set T2 := tc L' (4 * k + 10) (2 * k + 2) with hT2
  set bN := 2 * k + 2 + (2 * k + 3) * (c + (2 * k + 3)) with hbN
  set fN := (k + 1).factorization l with hfN
  set g := gens L' with hg
  set X := (bN + fN) * g + c + fN with hX
  have hlsB' : l ^ s ≤ T1 * T2 * l ^ X := hlsB
  have hBpos : 1 ≤ T1 * T2 * l ^ X := le_trans (Nat.one_le_pow _ _ (by omega)) hlsB'
  have hT1ne : T1 ≠ 0 := by
    intro h
    rw [h] at hBpos
    simp at hBpos
  have hT2ne : T2 ≠ 0 := by
    intro h
    rw [h] at hBpos
    simp at hBpos
  have hlR : (1:ℝ) < l := by exact_mod_cast hl1
  have hl0R : (0:ℝ) < l := by linarith
  have hlog0 : 0 < Real.log (l:ℝ) := Real.log_pos hlR
  have hlogs : (s:ℝ) * Real.log l ≤ Real.log T1 + Real.log T2 + (X:ℝ) * Real.log l := by
    have hT1R : (0:ℝ) < T1 := by exact_mod_cast Nat.pos_of_ne_zero hT1ne
    have hT2R : (0:ℝ) < T2 := by exact_mod_cast Nat.pos_of_ne_zero hT2ne
    calc (s:ℝ) * Real.log l = Real.log ((l:ℝ) ^ s) := by rw [Real.log_pow]
      _ ≤ Real.log ((T1:ℝ) * T2 * (l:ℝ) ^ X) := by
          apply Real.log_le_log (pow_pos hl0R _)
          exact_mod_cast hlsB'
      _ = Real.log T1 + Real.log T2 + (X:ℝ) * Real.log l := by
          rw [Real.log_mul (by positivity) (pow_pos hl0R _).ne', Real.log_mul hT1R.ne' hT2R.ne',
            Real.log_pow]
  have hTb := hC0 L' hTC' (k + 1) hE hcp
  rw [show 4 * (k + 1) + 6 = 4 * k + 10 by ring,
      show 2 * (k + 1) + 1 = 2 * k + 3 by omega,
      show 2 * (k + 1) = 2 * k + 2 by omega] at hTb
  unfold kBound at hTb
  have hcard := InfinitePlace.card_add_two_mul_card_eq_rank L'
  have hn'big : 2 * k + 4 ≤ Module.finrank ℚ L' := by omega
  have hc0 : c ≠ 0 := by
    intro h
    rw [h, pow_zero] at hlc
    omega
  have hcl : c < l ^ c := Nat.lt_pow_self hl1
  have hll : l ≤ l ^ c := Nat.le_self_pow hc0 l
  have hf : fN < k + 1 := Nat.factorization_lt l (by omega)
  have hDne := NumberField.discr_ne_zero L'
  have hD'1 : 1 ≤ (discr L').natAbs := Int.natAbs_pos.mpr hDne
  have hD'1R : (1:ℝ) ≤ ((discr L').natAbs : ℝ) := by exact_mod_cast hD'1
  have hgl := gens_le L'
  set n' : ℝ := (Module.finrank ℚ L' : ℝ) with hn'
  set Y := Real.log (2 * ((discr L').natAbs : ℝ)) with hY
  set u : ℝ := 2 * ((k + 1 : ℕ) : ℝ) * n' with hu
  have hkR : (0:ℝ) ≤ k := Nat.cast_nonneg k
  have hn'bigR : 2 * (k:ℝ) + 4 ≤ n' := by rw [hn']; exact_mod_cast hn'big
  have hk1 : ((k + 1 : ℕ) : ℝ) = k + 1 := by push_cast; ring
  have hu' : u = 2 * ((k:ℝ) + 1) * n' := by rw [hu, hk1]
  have hn'0 : (0:ℝ) ≤ n' := by linarith
  have hn'u : 2 * n' ≤ u := by
    rw [hu']
    have := mul_le_mul_of_nonneg_right (show (2:ℝ) ≤ 2 * ((k:ℝ) + 1) by linarith) hn'0
    linarith
  have hku : 2 * ((k:ℝ) + 1) ≤ u := by
    rw [hu']
    have := mul_le_mul_of_nonneg_left (show (1:ℝ) ≤ n' by linarith)
      (show (0:ℝ) ≤ 2 * ((k:ℝ) + 1) by positivity)
    linarith
  have hu2 : 2 ≤ u := by linarith
  have hL2 : (0.6931471803:ℝ) < Real.log 2 := Real.log_two_gt_d9
  have hY2 : Real.log 2 ≤ Y := Real.log_le_log (by norm_num) (by linarith)
  have hYh : 1 / 2 ≤ Y := by linarith
  have hcR : (c:ℝ) ≤ 2 * n' := by
    have : c ≤ 2 * Module.finrank ℚ L' := by omega
    rw [hn']; exact_mod_cast this
  have hlR2 : (l:ℝ) ≤ 2 * n' := by
    have : l ≤ 2 * Module.finrank ℚ L' := le_trans hll hlc2
    rw [hn']; exact_mod_cast this
  have hfR : (fN:ℝ) ≤ k + 1 := by
    have : fN ≤ k + 1 := hf.le
    exact_mod_cast this
  have htl : Real.log l ≤ u := by
    have := Real.log_le_sub_one_of_pos hl0R
    linarith
  have hbR : (bN:ℝ) = 2 * k + 2 + (2 * k + 3) * (c + (2 * k + 3)) := by rw [hbN]; push_cast; ring
  have hb0 : (0:ℝ) ≤ bN := Nat.cast_nonneg _
  have hbb : (bN:ℝ) ≤ u + 2 * u ^ 2 := by
    rw [hbR]
    have a1 : (2 * (k:ℝ) + 3) * (c + (2 * k + 3)) ≤ n' * (3 * n') :=
      mul_le_mul (by linarith) (by linarith) (by positivity) (by linarith)
    have a2 : 2 * (k:ℝ) + 2 ≤ u := by linarith
    have a3 : n' * (3 * n') ≤ 2 * u ^ 2 := by
      have h4 : (2 * n') ^ 2 ≤ u ^ 2 := pow_le_pow_left₀ (by positivity) hn'u 2
      have e1 : (2 * n') ^ 2 = 4 * n' ^ 2 := by ring
      have e2 : n' * (3 * n') = 3 * n' ^ 2 := by ring
      have h5 : 0 ≤ n' ^ 2 := by positivity
      linarith
    linarith
  have hg0 : (0:ℝ) ≤ g := Nat.cast_nonneg _
  have hgg : (g:ℝ) ≤ u + 2 * u * Y + 2 := by
    have hY0 : 0 ≤ Y := by linarith
    have : 2 * (2 * n') * Y ≤ 2 * u * Y := by
      have := mul_le_mul_of_nonneg_right hn'u hY0
      linarith
    have hgl' : (g:ℝ) ≤ 2 * n' + 2 * (2 * n') * Y + 2 := hgl
    linarith
  have hc0R : (0:ℝ) ≤ c := Nat.cast_nonneg _
  have hcu : (c:ℝ) ≤ u := by linarith
  have hf0 : (0:ℝ) ≤ fN := Nat.cast_nonneg _
  have hfu : (fN:ℝ) ≤ u := by linarith
  have hP := num_poly u Y (Real.log l) bN g c fN hu2 hYh htl hb0 hbb hg0 hgg hc0R hcu hf0 hfu
  have hXR : (X:ℝ) = ((bN:ℝ) + fN) * g + c + fN := by rw [hX]; push_cast; ring
  have hP' : (X:ℝ) * Real.log l ≤ u ^ 9 * Y := by rw [hXR]; exact hP
  have ht : (s:ℝ) * Real.log l ≤ 2 * Real.exp (u ^ C0 * Y) + (X:ℝ) * Real.log l := by
    have e : Real.log (T1:ℝ) + Real.log (T2:ℝ) ≤
        2 * Real.exp (u ^ C0 * Y) := hTb
    linarith
  have h3 := num_three C0 u Y ((s:ℝ) * Real.log l) hu2 hYh _ hP' ht
  have hs0R : (s0:ℝ) * Real.log l ≤ (s:ℝ) * Real.log l :=
    mul_le_mul_of_nonneg_right (by exact_mod_cast hs0) hlog0.le
  have hC : 0 ≤ max C0 9 + 2 := by
    have := le_max_right C0 9
    linarith
  have hn1 : 1 ≤ Module.finrank ℚ L := Module.finrank_pos
  have hD1 : 1 ≤ (discr L).natAbs := Int.natAbs_pos.mpr (NumberField.discr_ne_zero L)
  have hdown := num_down (max C0 9 + 2) hC (k + 1) (Module.finrank ℚ L) (discr L).natAbs
    (Module.finrank ℚ L') (discr L').natAbs d (l ^ c) hE hn1 hD1 hD'1 hdeg (by omega) hd hlc2 hdisc
  have hmid : Real.exp (u ^ (max C0 9 + 2) * Y) =
      kBound (max C0 9 + 2) (k + 1) (Module.finrank ℚ L') (discr L').natAbs := by
    unfold kBound
    rfl
  linarith


namespace UpperTheory.V.ZK
theorem run30_sNum_original : SNum := by
  intro hFew hCount hSha hLayer hTors
  exact run30_sNum_pair hFew hCount hSha hLayer (run30_pair_of_STors hTors)

theorem run30_sNum_native : SNum := by
  first | rh_reduce 2 using [run30_sNum_original] | exact run30_sNum_original

theorem run30_pair_native : STorsPair := by
  rh_auto_frontier 2
  all_goals first | exact run30_pair_of_STors sTors | rh_auto 2
end UpperTheory.V.ZK

rh_scan UpperTheory.V.ZK.sNum limit 2000
rh_scan UpperTheory.V.KT.tors_le limit 2000
rh_scan UpperTheory.V.ZK.run30_sNum_pair limit 2000
rh_prune UpperTheory.V.ZK.run30_pair_of_STors as run30_pair_pruned
#print axioms UpperTheory.V.ZK.sNum
#print axioms UpperTheory.V.ZK.sTors
#print axioms UpperTheory.V.KT.tors_le
#print axioms UpperTheory.V.ZK.run30_sNum_pair
#print axioms UpperTheory.V.ZK.run30_sNum_original
#print axioms UpperTheory.V.ZK.run30_pair_native
