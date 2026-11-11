# Q15 — Full native signed dictionary K2–K3 collision audit (2026-11-11)

**Result: OBSTRUCTION — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.**

**Named native source:** the 20-face icosahedral hidden-P5 quartic source, five rank-one A4 vacuum projectors, 64 six-bit history states and fixed de Bruijn Q(h,2h)=Q(h,2h+1)=1/2, reconstructed by the original Q11 and Q12 certificates. No synthetic source, measured input, fitted coefficient or physical ARF was used.

For each signed dictionary D and each of the five native vacuum lines g with squared norm r2, calculate K2/r2 and I3=K3(g)^2/r2^3. The five-vacuum signature is the exact multiset of ordered pairs (K2/r2,I3). K3 is the stationary third cumulant rate of the fixed Q6 process.

**Exact exhaustive result:** the 46,080 signed dictionaries have 768 proper-A5 orbits, grouped into exactly **96 distinct joint K2–I3 signatures**, each occurring in **8** proper-A5 orbits. The 384 central-inversion classes therefore form 96 groups of 4. There are exactly **96 * binomial(4,2) = 576** pairs of distinct inversion classes with equal joint signatures. The non-parity collision witness is D=(0,2,4,6,8,10), E=(0,2,8,10,7,4). They are not related by proper A5 or global inversion, but their five exact (K2,I3) pairs coincide.

**Method and proof:** Q12 enumerates all 768 orbit representatives and the original Q11 native vacuum lines. Work in integer pairs (a,b) representing a+b sqrt(5), using 60*g integral. Let Q^d be the exact 2^-d-weighted de Bruijn successor sum and mean be the 64-state average. Since Q^6 g=0 and g is centered, the infinite stationary cumulant sums truncate:
K2 = mean(g^2) + 2 sum_{d=1}^5 mean(g Q^d g);
K3 = mean(g^3) + 3 sum_{d=1}^5 [mean(g^2 Q^d g) + mean(g Q^d(g^2))] + 6 sum_{d,e=1}^5 mean(g Q^d(g Q^e g)).
All are exact Q(sqrt(5)) arithmetic. Every orbit representative is evaluated. For four representatives all 60 proper rotations preserve the joint signature; global inversion is checked for all 768 representatives. The Q14 exact I3 witness 4823127/1024000 +/- (41811/256000) sqrt(5) is reproduced. Independently, K3(25)-K3(24) from finite tilted-transfer moment recursion agrees for all ten native lines of Q14's two dictionaries.

**Execution:** GPT sandbox Python 3.11, SymPy 1.14, NetworkX 3.6.1, exit 0, 2026-11-11 00:16 UTC (~32 s), using a locally reconstructed Q11/Q12 native source shim; the committed certificate imports the archived originals directly. GitHub CI must re-execute the original import before this is called CI-verified.

**Scope:** exact finite native hidden-5 source only. This is non-uniqueness of the Gate A signed history dictionary under the first two nontrivial cumulant invariants, not a physical ARF derivation. No gate is closed.

## RESUME HERE
Q20 [compute]: For D=(0,2,4,6,8,10) and E=(0,2,8,10,7,4), evaluate exact native K4 with the Q6 Poisson/tilted-transfer recursion; does order four distinguish this surviving non-parity joint K2–I3 collision?
