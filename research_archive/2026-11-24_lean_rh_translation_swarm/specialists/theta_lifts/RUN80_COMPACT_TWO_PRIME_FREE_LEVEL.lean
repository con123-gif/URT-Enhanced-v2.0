import New.Data.ChosenPlaceLevels
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.Tactic

/-!
# RUN80 — two-prime freeness at the actual short-column and chain callers
27 November 2026. HUMAN SOURCE-MATCHED reduction; independent audit and native
replacement replay pending. Credit Alpöge, Sernau and collaborators.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Old pin 40e56bab026552e089d7afcfeff08d2defb9c005 retained separately.

Read ONE_EQUATION_MISSION blob 3adc76221a978016e3505cdf3e36ad688354d7d7,
LIVE_PROOF_SPINE 67e542df1b5557b2e1314643931ef1355bbdc50d,
LIVE_OBLIGATIONS 073d86374ebc415e217a2732814dde7b0f3dfb9d,
AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, continuity.
Reuse short spanning appendix integration/2026-11-26_COMPACT_SHORT_SPANNING_COLUMNS.md
blob 576e1b4f592a01ef3147eba7815b39fdef8fd9a6, not a second spanning proof.
RUN79 theta f93cf29c11cceefe76becc115a9b8223c3a96030 covers finite pairing.
Peer prime 3b3629d3281d344c41bcca75900198d21f4ab5d2 covers fixed-J normalization;
acceleration 263f17633ff7322374e8b7498dbd2c2aabf14513 covers marked frame.
Both read; this is a distinct common supplier for short span and class chains.
Recent peer head b6356a24cc6eb818a48c8c9a17602ee02ac361a1 inspected.

## Actual source
All paths relative to compact source:
* New/Data/ChosenPlaceLevels.lean d6b4c62956e3ca1259fd69dd8c882a6fe021e7c3:
  chosenEquiv, card_chosenPlace, chosenLevel, prod_q_chosenPlace,
  classAut_eq_bot_of_le_chosenLevel, card_classAut_dvd_chosenGroupOrder.
* Lib/Shimura/IntegralModel/NeatLevel.lean 045eae758ea2326d3b665f2d687985cff4ad5ef8:
  classAut_eq_bot uses IsSignedFrameFor.eq_one_of_congr_large_norm,
  signed-frame similitude/root norms and trace norm inequality.
* New/Columns/ColumnDefs.lean 104b875374798b99448625fe6ce062ea6bfbfe65:
  columnLevel, classAut_columnLevel_eq_bot.
* New/Columns/ChainValuation.lean 19e853dfa8c645bfcdf3b3e21183f9b432620ef7:
  span_isShort_eq_top, ramifyingOp_finrank_comap_and_short,
  span_short_ramifiedColumns, exists_chain_eq_sum.
* Lib/Adelic/Transference/MassBasic.lean ab9b5714cab038182220a2e1631a96f2de1ddf78:
  exists_short_basis_stdSpace.
* New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547:
  weylNormSq_Bmu_le, gaugeLe_markOperator_pow (uses the class chain).
* New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a:
  Data.short_forms, actual A consumer.

## 1. Replace the large-norm neatness argument by two different residue characteristics

Let E be the SAME CM field and the rational unitary space be I_n (totally
positive definite). Let K be a subgroup of the finite integral unitary
group, reducing to the identity at two finite places w0,w1 with distinct
rational residue characteristics p0,p1. For every finite adelic unitary g,
the rational stabilizer of gK is trivial.

Proof: gamma in the stabilizer preserves the full O_E-lattice
L_g = E^n intersect g O_hat_E^n, since g^-1 gamma g is integral invertible
at every finite place. The lattice is full: choose a nonzero integer
clearing the finitely many denominators in g and g^-1, then
d O_E^n <= L_g <= d^-1 O_E^n. Under all infinite embeddings, gamma
is unitary, so every power gamma^j preserves the Euclidean length of each
vector of a fixed Z-basis of L_g. The image of each such vector belongs
to a finite intersection of the lattice with a bounded ball. The tuple
of basis images determines gamma^j. Therefore the powers form a finite
set and gamma has finite order M>0. This argument needs no mass formula,
class number or global lattice basis over O_E; the Z-basis suffices.

At w over p, H=g_w^-1 gamma g_w lies in GL_n(O_w), H=I modulo the
maximal ideal m_w. Write M=p^a u with gcd(u,p)=1. Then T=H^(p^a) is
congruent to I mod m_w and T^u=I. If T != I, let k>=1 be the minimum
finite valuation of entries of T-I=A (normalize the DVR valuation so
a uniformizer has valuation one). Expand the exact matrix identity
    0 = T^u-I = u A + sum_(j=2)^u binom(u,j) A^j.
No commutativity of arbitrary matrices is used: I and A commute.
Every entry of A^j has valuation >=jk, so the sum is in m_w^(2k).
The integer u is a unit at w. An entry of uA has valuation exactly k,
contradiction since 2k>k. Thus T=I, even at p=2 and in ramified
extensions. Injectivity of E -> E_w gives gamma^(p^a)=I.
Repeat at both places, retaining the SAME gamma. The decisive equality is
    ord(gamma) | gcd(p0^a0, p1^a1) = 1.
Therefore gamma=I. This also handles rank zero by the trivial group.
No norm-of-trace threshold or comparison with the size of the finite
residue field is needed.

Guards are necessary: one residue characteristic is insufficient (rank
one, E=Q(i), gamma=-1 at the place above 2); without definiteness, the
integral unipotent I+6E12 in GL_2(Q) has infinite order and reduces to I
at 2 and 3. Neither is a counterexample to the actual definite two-prime
statement. These are explicit counterexamples to the omitted hypotheses,
not sampling evidence for the general theorem.

## 2. Instantiate at the exact native data, no new assumptions

For D, choose one place from each of D.ChosenPlace 0 and D.ChosenPlace 1,
using chosenEquiv and nonempty infinite places of the CM field. Their
residue characteristics are the distinct rational primes D.g 0,D.g 1
(the native g_injective and q_eq_g, already used in isConjApart_chosen).
K <= chosenLevel implies K <= Kf and identity reduction at both chosen
places by mem_levelOf. The previous proof applies. Thus the existing
classAut_eq_bot_of_le_chosenLevel conclusion holds for ANY finite rank,
not just card n <= 2*n_m. Its old rank premise can be ignored at this
specific definite caller. In particular the conclusion applies to every
columnLevel j and to all the chosen-level subgroups in the short-column
argument and exists_chain_eq_sum, with the same g and D.
It is not a replacement for the indefinite IsSignedFrameFor theorem,
nor for card_GL_dvd_chosenGroupOrder, which still needs its rank bound.

## 3. Audit the existing A2 short spanning construction at this interface

In span_isShort_eq_top, actual coefficient matrix is
  A_f = (prod_tau det(weightEmbedding(f,tau)(Y_(c.out^e_tau))))
         * weylRep(kappa,0)(weightEmbedding(f)(Y_c.out)).
This agrees with appendix sections 2–3, including negative determinant
weights: det(c^-1)^e_tau det(Y_(c^e_tau)) =
det(c^(-e_tau)Y_(c^e_tau)). The determinant exponent never enters the
archimedean norm bound, since each powered adele has its own short Y
from the same uniform family. The class freeness just proved ensures
deltaForm has no stabilizer average factor. The short matrices need
only an E-basis with integral columns locally, not an O_E-basis.
The half-trace Euclidean dual is 2 different^-1 L_g by Hermitian
unimodularity, as in the existing appendix; keep the cited Euclidean
transference theorem and actual Schur Gram/evaluation supplier. No
new proof of those foundations is claimed. The ramifyingOp range
preserves span and multiplies squared bounds by 4^#piPlaces=4^f.
This is a direct audit of those interfaces, not a proof of the full
numerical scale/Gram guards. The same S is integral at all places and
short at every conjugate, independently of sigma, s, and q. Use it in
Data.short_forms with original normalization or prime RUN79's
alternative, never switch S or q mid-assembly.

RUN64's archimedean chain and local chain share the same freeness
supplier exists_chain_eq_sum. Both can use the simpler argument above.
No independent choice of class lattice or lift datum is introduced.

## 4. Dependency and verification
Original selected source graph:
short_forms -> {span_short_ramifiedColumns, weylNormSq_Bmu_le,
  exists_indexDvd_Bmu_divisible} -> {span_isShort_eq_top, exists_chain_eq_sum}
-> classAut_eq_bot_of_le_chosenLevel -> classAut_eq_bot ->
IsSignedFrameFor.eq_one_of_congr_large_norm -> signed frame and norm trace.
Candidate human graph:
same callers -> definite full lattice + two-prime local reduction ->
finite order and prime-power torsion -> trivial stabilizers.
The omitted guard is a rank/large norm guard ONLY at the freeness theorem;
rank bounds at other consumers are preserved. All original/reduced
graphs, axiom evidence and open A1–A3/B/C/D1/E1/V1/V2 are unchanged.
Context cache: compact pin,D,E,n,K,g,w0,w1 and residue characteristics;
not valid for an indefinite space or two places of the same characteristic.
No URT premise, no global graph-edge removal until native replay.

Local shell command -v lean/lake/elan found none. No native rh_scan,
rh_prune, rh_reduce, rh_auto or rh_auto_frontier was executed here.
Actual compact receipt targeted_results.json blob
088cd2ec0e935ee1a282f10096949bcf671cc804: 6 original B/C native checks,
A module build timed out 124; overall false. NEW actual B2 receipt:
compute/rh-compact-b2-human-replay-20261127/status.json
d9eb4d1dc47d7dc52f36bc13b41b3eea170b667d, run 45986308748,
2026-11-27 11:14:10 UTC. Read outputs/b2_native_results.json
a5dba18064d92bade88f3133b7217addcfe9b9ff: eight helper proofs compiled,
six original caller axiom reports standard axioms, omitted-projector
control rejected. caller_replacements_checked=false,
human_assembly_verified=false, full_RH_replay=false. This is genuine
peer replay, NOT A2 or this certificate. No old-pin CI transferred.
The helper below is PREPARED, uncompiled, for the coprime-order step;
the source probes are for shared compact runner. No synthetic test run
or claim that the local DVR proof has been kernel-checked.

RESUME HERE: at the shared compact A replay, implement the two-place
prime-power torsion lemma for actual LocField/LocInt and the exact
classAut_eq_bot_of_le_chosenLevel bridge, then inspect its axiom
report and replay span_short_ramifiedColumns and exists_chain_eq_sum
callers. Use this alongside existing short-spanning/archimedean proofs;
do not reopen the fixed exponents. Retain actual Schur/scale and
remaining marked local/frame/height premises. HANDOFF TO integration,
editor, kernel and independent audit. RH remains OPEN.
-/

namespace ThetaRun80

/-- The common group element is killed by two coprime exponents. -/
theorem coprime_power_trivial {G : Type*} [Group G]
    (x : G) (a b : ℕ) (h : a.Coprime b)
    (ha : x ^ a = 1) (hb : x ^ b = 1) : x = 1 := by
  have hd : orderOf x ∣ Nat.gcd a b :=
    Nat.dvd_gcd (orderOf_dvd_of_pow_eq_one ha) (orderOf_dvd_of_pow_eq_one hb)
  have h1 : Nat.gcd a b = 1 := h
  rw [h1] at hd
  have ho : orderOf x = 1 := Nat.dvd_one.mp hd
  simpa [ho] using (pow_orderOf_eq_one x)

#print axioms coprime_power_trivial
end ThetaRun80

#check Data.classAut_eq_bot_of_le_chosenLevel
#check Data.card_chosenPlace
#check Data.chosenEquiv
#check classAut_eq_bot
#print axioms Data.classAut_eq_bot_of_le_chosenLevel
