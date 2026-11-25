# RUN27 — linear arithmetic selection of the one geometric witness
25 November 2026, lane 14. Human source-matched conditional reduction and executed exact finite arithmetic certificate. RH OPEN. No URT or physics.

## Result
Use the actual two-scale score M(u) of editor f5bab469 (and integration d5e73014's separate normalized shift). It is not necessary to find its maximum. It suffices to construct a translation with score at least the mean, before selecting any carrying geometry. Moreover the translation-dependent part has no ell/log-derivative-at-one constants.

Retain the exact common host, TT, T2, A_t, b, eta, y_L, y_T, D, all weight/scale and cutoff hypotheses in f5bab469. In the principal case A0=H, let h=|H|, F=2h. Set g(t,v)=e1(v-t), and write
    D_v = sum_(t in TT) [P_(t,g(t,v))(b) - (eta+1) M_(t,g(t,v)) - A_t U_(g(t,v))(y_L)].
Here M_(t,g) is the prime-power mass, not the translation score M(u). Top class is disjoint from thick and independent of u. Begin with every C0 position at the thin reference and the fixed C1 top/thin partition. Call the resulting translation-independent sum B. Replacing exactly the thick mask yields
    M(u) = B + sum_(s in T2) D_(s+u).
There is no approximation or norm in this identity. In the P expansion use v_L,t=A_t/y_L, so A_t U_g(y_L)=P_(t,g)(v_L,t). The terms C_(t,g) cancel in P(b)-P(v_L,t), including ell. The remaining log contribution A_t/F log(b/v_L,t) is independent of g; its sum over thick positions is constant in u. Thus the same ordering of translations is obtained from the vector
    D'_v = sum_t sum_n Lambda(n) Kc(n,e1(v-t)) *
       [(A_t/n-b)_+ - (A_t/n-v_L,t)_+ - (eta+1) 1_(n<=A_t/b)].
Every n sum is finite by the two cutoffs. D-D' is constant. All signed terms cancel before taking any bounds. Neither ell nor the top reference nor a geometric witness is required to SELECT u; they still enter the downstream value and error bounds and must not be removed globally. The sum of D' can be computed without materializing M(u) for each u.

## Dyadic selection
For the principal cyclic host H=Z/(2^E), use the actual checked coordinate isomorphism, not arbitrary numeric Fin labels. Upstream FrameCyclicGenerator.frameCycIso is an additive equivalence with ZMod (2^e); frameCyc_val identifies its labels. General native frames need not be cyclic; if that specialization is unavailable retain the ordinary finite average selection. For each q dividing h with q a power of two, fold D' and the indicator T2 into
    d_q(v)=sum_(w≡v mod q) D'_w,  c_q(v)=# {s in T2:s≡v mod q}.
For a residue a mod q, the EXACT coset total is
    S_q(a)=sum_(u≡a mod q) sum_(s in T2) D'_(s+u)
          =sum_(v mod q) d_q(v)c_q(v-a).
Proof: for every pair (w,s) the unique u=w-s is in the coset iff w-s≡a; group by their residues. Starting from S_1(0)=|T2| sum_v D'_v, split each selected coset into its two equal-cardinality children modulo 2q. Compute one child by the dot product; the other is parent minus child. Select the larger child, ties arbitrary. Its mean cannot decrease. At the singleton level h this proves the decisive local witness relation
    h * sum_(s in T2) D'_(s+u*) >= |T2| * sum_v D'_v.
Consequently M(u*) >= mean M, which is exactly sufficient for editor (1) and (2), with NO extra error and NO requirement that u* maximize M. The original selected geometry still has to exist at this specific u*, and gapA(u*)<=Err is still open.

Given a dense exact score vector, fold tables and selected child dot products use O(h) arithmetic operations and O(h) stored entries, plus O(log h) trace records. Sum of child dot lengths is 2h-2. This is not a complexity claim for constructing D', primality, exact real comparison, class groups, arbitrary proof search or the upstream geometry. The actual vector may be expensive to construct, and exact real ordering is not generally decidable. With certified coordinate lower bounds l_v<=D'_v<=l_v+zeta, choose via the exact rational l vector. Then actual score is at least its actual mean minus |T2| zeta: lower score >= lower mean, actual mean - lower mean <= |T2| zeta. Add m|T2|zeta to gap error (or 2m|T2|zeta/(Qd) to editor (2)). This avoids nonterminating tie comparisons; no finite precision is asserted for native data. For arbitrary finite H revert to finite mean/maximum or a verified subgroup-chain generalization. A first-hit direct scan may be faster in practice; compare it as well as exhaustive maximization.

## Pinned sources and original/reduced frontier
Pin 40e56bab026552e089d7afcfeff08d2defb9c005. Fetched ChCore.lean 878f5077bc382426c7da988e5a375b85deeaa7de (Th, sum_A, sum_Th, th_le, core); ChBalance.lean 37648715bcf507e086374e8cc476ee746fd274f4 (ounram, askExp, ch_balance and inner_eq use); Formalism/SharpRestriction/GlobalSchurBounds/QuadraticLogDerivCongr.lean 7828c8b1060818fe158e23f87f1ad9e2efcf79eb (linkGLOBAL_of, Mod, hcov, actual common tables); Formalism/LocalRingCardinality/DataHost.lean 7e9af8ab364965c62be250ae93974098141598c0; Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/FrameCyclicGenerator.lean fa8ab3bbd126ccaa1c879cc7894f3e57000319f3. Paths ChCore and ChBalance relative to src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems; others relative to src. Read mission blob 8dc6705e1bc6540b600f6c22309294466ec88fd0 incl mandatory unified section, AGENTS, SWARM, HANDOFF, EXPANSION, state/protocol/continuity excerpts, recent peers f5bab469, d5e73014, 2f135e5b, cc5937fc, fcdd6e85, 9402fbb4. This is a new acceleration of the selected-witness interface, not a duplicate of URT compression.
Original source path: linkGLOBAL_of -> CoreAtH/ChainTied -> CoreGm/ch_top -> ch_core/core -> sum_Th, th_le, ch_balance. Existing full original role graph and pending declarations (RUN25 ce477f4e) unchanged. Proposed reduced conditional path: common arithmetic/scale tables -> signed D' -> dyadic mean-qualified u* -> one actual carrying geometry at u* and full error estimate -> signed two reference bounds -> existing normalized shift and size transfer. Source-visible edges are not new kernel dependency claims. Context-sensitive cache must include pin, actual group isomorphism, D including inertia/Frobenius, TT,T2, A_t, b, eta, y_L, and certified lower-bound precision; changing any invalidates selection. The downstream context still includes ell,y_T and full native premises. No global deletion of the original hChr/CoverAll consumers. Native arithmetic tables, actual selected-witness construction, uniform count/rank, reference bounds, CountI/II/V/Vs, 2-primary/minus, TopG, and RH-scale prime lower bound remain OPEN. No new closure of an unconditional RH leaf.

## Executed certificate and benchmark
CPython run27_dyadic.py exit 0; tested on 17,984 genuine primes <=200000, prime-power counts signed between the two halves, in the actual cyclic groups of real cyclotomic fields Q(zeta_(4h))^+ (verified residue coordinate map via powers of 5). T2 control mask is the Frobenius classes of odd primes <=20000, NOT the native admissible T2 or native GPsi/ramp data. No invented geometry or evidence for RH. Initial negative test incorrectly required a strict failure for constant score when mask was all of H; repaired to require strict failure only for nonconstant exhaustive scores; ties are legitimate. 59 counted equality/coverage checks, five negative controls (three malformed inputs, two nonconstant cases selecting smaller child); all pass. Full exhaustive scores independently validate each selected coset. No URT schedule comparison: not relevant to deterministic binary conditional expectation and prior runs showed no extra advantage. All timings exclude sieve and data assembly; first invocation vs repeated median of three, not cold storage. Peak process RSS 97808 KiB for entire run including validation/baseline; traced peak allocation for h=4096 selector 164412 bytes, first-hit 164292 bytes; full scan memory not measured.
h, mask, first/repeat dyadic ms, first/repeat first-hit ms, first/repeat exhaustive max ms:
1,1,.004729/.002725,.004097/.002104,.002564/.001603
128,128,.054992/.052548,.019977/.014788,.965864/.850861
512,512,.201845/.216041,.065902/.057587,15.548807/15.392305
2048,1560,.774128/.755103,.286442/.273047,197.490943/193.056844
4096,1987,1.42105/1.440466,.390305/.395925,530.70723/509.733637
At h=4096 exhaustive maximum 509.73ms vs 1.44ms mean selector, but these are different outputs; same-task early scan 0.396ms faster on these data. Linear selector is a worst-case arithmetic operation improvement over a potentially quadratic first-hit scan, not a measured universal speed gain. 8,138,752 direct max terms vs 8190 dyadic dot terms (folding, validation, final direct check additional linear work). No native caller benchmark; independent mathematical audit requested.

## Native pipeline and prepared certificate
Read actual RHProofTermPrune.lean f6d3e7f6047a7895ecf183be3fb54c203f4fc46a, RHRecursiveReductionFixed.lean 976c28572f11ffb00e1ae730555e938eeb564cb7, RHRecursiveReductionAutoV3.lean a113dc56ea987abac3bf29eb480782140b82ab4a. Independently retrieved published status.json for rh-recursive-reduction-strip-root-20261125 and rh-proof-term-prune-native-20261125: pass, returncode 0, 98.87s and 77.94s; prior native runs 45577239749 and 45576756833 only. Conditional root uses propext, Classical.choice, Quot.sound; rh_of_right scan 2000 visited, 324 pending. Neither Lean nor Lake available here. No new native PASS, no new CI job claimed. Prepare the following small step certificate in pinned Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474, with the existing engines compiled/imported and actual ChCore imported, not Main:
    theorem RHMeanChild (l r p : ℝ) (hs : p = l+r) :
        p ≤ 2 * max l r := by
      have hl := le_max_left l r
      have hr := le_max_right l r
      linarith
    theorem RHMeanChildTransfer (l r p b : ℝ) (hs : p = l+r)
        (hb : b ≤ p) : b ≤ 2 * max l r := by
      exact hb.trans (RHMeanChild l r p hs)
    #print axioms RHMeanChild
    #print axioms RHMeanChildTransfer
    rh_scan Deduction.CharacterBalanceMoves.sum_Th limit 2000
    rh_prune Deduction.CharacterBalanceMoves.sum_Th as RHNativeSumThCandidate
    rh_scan Deduction.CharacterBalanceMoves.core limit 2000
Use rh_reduce with the verified transfer and finite coset folding identity at the actual specialized caller, rh_auto and rh_auto_frontier for remaining typed algebra goals, preserve unresolved subgoals and backtrack to original all-u if transport or geometry unavailable. The above only formalizes the scalar comparison, not the full folding/caller. No execution of these commands reported. Keep #print axioms and structural/type/value graph for any generated declaration, original bridge and surviving consumers.

RESUME HERE: instantiate D' from the actual common native host tables (not the prime-count control), verify group transport at the principal CoverAll caller, then replace the selected-max premise by a mean-qualified witness and prove the existence/geometry gap at that particular u*. Batch native scan/prune and caller verification with kernel lane; do not claim proof of the prime bound. HANDOFF TO integration, editor, geometry, kernel and audit. RH OPEN.
