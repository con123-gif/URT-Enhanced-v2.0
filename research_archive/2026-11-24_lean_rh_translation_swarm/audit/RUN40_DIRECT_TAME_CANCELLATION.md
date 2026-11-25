# RUN40 — direct tame-inertia cancellation at CountV (audit lane)
25 Nov 2026. SOURCE-MATCHED human mathematical route / Lean algebra core PREPARED, NOT COMPILED. RH OPEN.

Read mission current blob f8b4b837301f8cf43d673be4979f04c4e4b415a4 (mandatory engine), SWARM, HANDOFF, AGENTS, research-state opening and continuity/protocol opening. Peer commit list through 51bb79ccc85e77748b48446d15d458f4e159c6d3; inspected exact RUN39 character boxes 1c042f1c0fd8891662ab6529fd62fea1683f031c, literature 94eea89ed765a700aed6ca93f0b3e1ac1b2859ca, math 51bb79cc, previous audit 989910ad. This is an independent upstream alternative to the character-boxes residual-depth reduction, not a repeat of its determinant limit.

## Mathematical result
At a place away from the coefficient prime l, let K be the local number field of residue characteristic p != l, and let O be the native finite integral DVR over Z_l, with fraction field E. Let theta=psi*chi_l^n, psi a continuous finite-image character, integer n != 0,1. Let z be a continuous O-valued theta-cocycle. Then z is a coboundary after multiplying by one nonzero integral scalar (native CobOn).

Proof: pass to the finite Galois local extension K' fixed by ker psi in the local decomposition group D. Its group H is normal in D, theta|H=chi_l^n. The residue size Q of K' is a positive p-power >1 (not necessarily the original residue size). The l-adic cyclotomic character is unramified on H. Consequently z on inertia I' is an additive continuous homomorphism to O. Wild inertia is pro-p and the additive O is pro-l, so z kills wild inertia; the tame inertia components of primes other than l also map to zero. These facts follow by reducing modulo every power of the maximal ideal, whose quotient additive group is finite l-primary, then using separatedness. On tame inertia arithmetic Frobenius F acts by Q-power, and chi_l(F)=Q.

Cocycle expansion and the inertia homomorphism therefore give the exact cancellation
    z(F t)=z(F)+Q^n z(t)=z(t^Q F)=Q z(t)+z(F)
    (Q^n-Q) z(t)=0.
Here the middle equality is after killing wild inertia, not an assertion that the wild relation holds exactly in the absolute group. Since Q^n != Q for n !=1 in characteristic zero, z vanishes on inertia. It descends continuously to the procyclic unramified quotient. Since Q^n !=1 for n !=0, choose a=Q^n-1 in O (Q is an l-adic unit), m=z(F). The residual w(h)=a z(h)-(theta(h)-1)m is zero at F and inertia, hence on all H by cocycle, continuity and density of the powers of F. It is a cocycle on D as well. For g in D, choose h0=F in H; normality gives h'=g h0 g^-1 in H and theta(h')=theta(h0). Expanding w(g h0)=w(h' g) gives
    (theta(h0)-1) w(g)=0.
Thus w(g)=0 throughout D. The same a,m work on D; no index factor or denominator averaging is necessary. This proves native-shaped CobOn at the human mathematical level, even when psi is ramified. No global class-group, local Euler-characteristic, H1 cardinality bound, local Tate duality or factorial annihilator is used in this replacement proof.

Standard local structure source: Lifting G-Valued Galois Representations when ell != p, Forum of Mathematics Sigma, section 5.1, Lemmas 5.1–5.3 (arithmetic Frobenius action, tame quotient): https://www.cambridge.org/core/journals/forum-of-mathematics-sigma/article/lifting-gvalued-galois-representations-when-ell-neq-p/1A84232602F99426E2C6AFE012A1632C . Native identification of Dec with the completion absolute Galois group and transport of topology, character, inertia and quotient remain to be linked in Lean. Do not count this as a native supplier yet. The reference supplies local structure, not RH. Keep both excluded weights: n=0 permits an unramified additive cocycle with z(F)=1 and all coboundaries zero; n=1 permits nonzero inertia cocycles (projection of the tame semidirect product to its l-adic translation coordinate).

## Source and graph
Upstream pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005, toolchain Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. All paths below relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/LevelCohomology/:
- SoLocTors.lean 03febd0586428cd935da832be4c378cc7628ad64 (actual target)
- SoLocKill.lean eca735f3751fb36df39d9a733b7b3abfd4c47110 (H1 uniform cardinality supplier)
- SoDecNe.lean 0c7f77ff142f96b2cde9aa70814e94c96255ab1b (native arithmetic Frobenius normalization and finite image)
- SoDefs.lean b3bbfe232c241fbf3f147b255dcf5b49b2d7d229 (Coc, CobOn exact native definitions)
- SoCobLim.lean a81309da5930263d568d2b9d86f9471ce06b5383 (factorial limit)
- SoCocL.lean dcf4e5309372b443b989f37055d34a1071aa9140 (actual locTors call with psi inverse)
- SoLineNeg.lean bc274f45064e9d602be9f6b0079fc8b1dd (actual soCocL call).
The source calls agree with peer's root-reachable CountV trace. No elaborated root reachability asserted independently.

Original graph: CountV -> So.hostVanE -> So.lineNeg -> So.soCocL -> So.locTors -> So.locKill [local finiteness, Tate, Euler; H0, H2 bounds] + So.decNe + So.cobLim [uniform H1 bound, factorial, DVR separation].
Candidate graph: same until locTors -> local completion comparison + finite-image kernel extension + inertia/tame decomposition + cyclotomic normalization + continuity/density + exact cancellation + normal descent. The separate global So.soCoc and above-l branches, LemmaK, PT, LF_K, LT_K, CountV and remaining VWin suppliers stay. No global deletion, no import of RH theorem. Cache key includes pin, actual k/Omega/l/O/psi/n/v/A, completion, kernel field and its residue size, original and restricted action. Backtrack to native locKill/cobLim if local structure transport unavailable. URT unnecessary. No claim of novelty relative to all literature or prior repository files.

## Execution
Local Python 3 exact Fraction tests: 86700 scalar Frobenius cases; 3264 weight-one nonzero negative controls (subset); 7808 normal-descent checks. These are regression checks on identities, not execution of local Galois theory. Reproducible script below. No Lean or Lake in local PATH; Lean helper only PREPARED (exact group relation on tame quotient and normal descent on original group); scans, prune, auto/reduce and axiom requests are not executed. Attempted upstream recursive tree listing: truncated before full native local comparison coverage; do not infer absence. A direct use of F t=t^Q F on absolute Galois group without killing wild inertia is rejected. Native baseline CI status files reread: b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and 7da354941e402b6f8b364ed03d8c5c82d27b7717, returncode 0 and runs 45577239749 / 45576756833. Conditional root axioms propext, Classical.choice, Quot.sound; no new native axioms evidence, no new CI closure. Existing native files untouched.

RESUME HERE: locate the pinned Dec/completion and tame inertia quotient transport, compile the two algebra helpers then substitute the full direct locTors proof at So.soCocL and check actual caller, original statement and transitive axioms; preserve all other CountV branches. HANDOFF TO character boxes, literature, kernel, integration.

VERDICT: AGREE with RUN39 determinant cancellation; PARTIAL stronger local route, mathematically justified with standard local structure, native transport remains open. RH unresolved.
