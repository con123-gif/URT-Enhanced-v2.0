# MO198816: exact counterexample to the spectral-radius conjecture

Status: complete exact rational counterexample and **full pinned Lean4.33.1
disproof verified**. The exact imported-target checker also accepted the
unchanged proof in run46046988992. Full official disproof PR10139 is submitted:
https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/10139 .
Independent upstream proof acceptance, actual merge and public credit are pending;
no official solution acceptance is claimed.

Source: vansy, MathOverflow question 198816, March 2, 2015,
<https://mathoverflow.net/questions/198816>, original question CC BY-SA 3.0.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
The scouting and combinatorics research lanes collaborated on the chain construction,
exact rational witness, and independent verification. Standard matrix and resolvent
identities and Mathlib are acknowledged as prior mathematics.

## Exact question and audit

The conjecture asks whether, for every irreducible column-stochastic real matrix
P that is diagonally dominant and every strictly positive probability vector w,
the matrix M=P-P*1*w^T has spectral radius strictly less than one. Here 1 is the
all-ones column vector. We use the usual row meaning of diagonal dominance.
Our witness satisfies **strict row and strict column dominance**, so the ambiguity
does not affect the disproof.

Fresh complete StackExchange API records show zero answers and zero comments.
The live Left to Solve brief lists `mo-198816` as unformalized, zero agents.
Explicit all-state `is:pr` GitHub search for 198816 found no previous submission.
The separately obtained 2235-result TrureTuring resolved-research catalogue has
no matching ID or title. Exact-title and matrix-term web searches located no
published resolution in the sources searched. This is a bounded prior-work
audit, not an exhaustive priority guarantee. The collaborating lane also read
Anehila and Ran, arXiv:2007.11453v3, on stability of rank-one perturbations of
singular M-matrices. Their free perturbation-vector setting does not impose
the present stochastic, dominance, and fixed P*1 constraints; no exact
resolution of this question was located there.

## Construction

Use indices 0 through 12, epsilon=1/10000, and n=13. Let C be the lazy directed
chain: C_jj=1/2 for j<12, C_(j+1,j)=1/2 for j<12, C_12,12=1, all other entries
zero. Let H=I/2+J/26, with J the all-ones matrix, and put

P=(1-epsilon)C+epsilon H.

Thus every entry is at least 1/260000. The nonsink diagonal contributes 1/2;
the sink diagonal contributes 19999/20000; each chain subdiagonal contributes
9999/20000; and every entry receives the additional 1/260000. Every column sums
to one. Positivity gives irreducibility. Both row and column diagonal dominance
are strict; these finite assertions are also checked exactly in the certificate.

Fix

lambda=183241/186500+(69993/373000)i,

so |lambda|^2=1+212001/373000000>1. Define b=(1-epsilon)/(2lambda-1) and

x_i=1-b^(i+1) for i<12;   x_12=sum_(k=0)^12 b^k.

The geometric-sum identity gives sum_i x_i=13. Entrywise substitution gives

P x=lambda*x+(1-lambda)*1.

Let delta=1/1000. Give every coordinate weight delta, and add positive
weights at coordinates 0, 1, 12. Solve the three rational linear equations
sum w_i=1, Re(sum w_i*x_i)=0, Im(sum w_i*x_i)=0. The exact resulting rational
weights are stored in `scout_work/mo198816_simple_witness.json`.
The three additional weights are approximately 0.8795515818, 0.0021106891,
0.1053377291, and are all strictly positive. All thirteen full weights are
positive and sum exactly to one. The display decimals are explanatory only;
the proof uses the exact fractions.

Define the nonzero vector v=x+(1/lambda-1)*1. Since w^T*x=0 and w^T*1=1,

w^T*v=1/lambda-1,
(I-1*w^T)v=x,
M v=P(I-1*w^T)v=P x=lambda v.

Consequently lambda is an eigenvalue of the complexification of M, and
rho(M)>=|lambda|>1. This contradicts the proposed strict bound.

## Evidence and remaining work

`scout_work/mo198816_simple_exact_check.py` regenerates the rational data
and checks positivity, both dominance conventions, all stochastic identities,
the weight equations, the resolvent equation, and the nonzero eigenvector.
The parent independently replayed the complete exact certificate.

`scout_work/mo198816_statement.lean` preserves the full universal source
statement and its spectral radius. The finite witness and generic spectral
bridge are joined in `scout_work/mo198816_simple_disproof.lean`. The complete
disproof passed pinned Lean4.33.1 in run
<https://github.com/con123-gif/open-math-agents/actions/runs/46031510476>,
job 140616213958, at 16:15:14 UTC, with axioms only propext, Classical.choice,
Quot.sound. The exact public snapshot at fork commit
2474ad3b7657e7290415144c12bb37082d7f2c7c,
`campaign/ProbeMO198816Compact.lean`, was independently retrieved and
byte-compared with both the entire statement and current proof body. Evidence
is saved in `scout_work/MO198816_PINNED_VERIFICATION_LOG.txt`. A statement-only PR is a prerequisite
to registering the target; it will not count toward the accepted-proof target.

The desk's claim endpoint initially returned HTTP 500, then succeeded on a request
with a descriptive user agent. The single formalization lease was role lead with zero others working at claim;
it was released as submitted by POST, HTTP200, oktrue. Its token remains private
and must not be reused. The official statement prerequisite was submitted as
<https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/8568>,
head cff6b0402e6477994d3ff9095ab1a63f09dfcfa7. The statement actually merged at17:53:21UTC. Its official main Gitblob
0698d6c0abd1302ad3542d32ea4c0a25ce239a24 equals the git hash-object of the
selected statement, proving byte identity. The complete disproof has now been
submitted separately as PR10139. The statement does not count as an accepted proof.


The selected compact certificate uses about twenty-digit weight literals and
thirty-digit vector components. An earlier independently checked larger-rational
witness remains archived, but is not the selected Lean certificate and is never
counted as another solution. The exact checked proof SHA256 is
`e621cf7f5b2028b4f9b39b114ffd3a226be386133f3f3f835bef10b320720a1e`;
the exact statement SHA256 is
`802ccabadae6279954d8171d12d97eb29bbd11e60d7fd5d78bc8f33aaddfe8be`.


## Actual imported-target check and full proof submission

The unmodified official checker accepted the imported target at18:10:36UTC,
run46046988992/job140668601604, head970e37f449fa1ffa19cc54fcc24c0673abbe65e4:
https://github.com/con123-gif/open-math-agents/actions/runs/46046988992 .
It identified kindopen, polaritydisproof, theoremOMA.disproof,
declOMA.S_mo_198816.main, errors[], and only the three allowed axioms. The
structured receipt is MO198816_IMPORTED_TARGET_VERIFICATION.json.

A fresh generic problem lease was claimed for agentcodex-scout-proof-mo198816.
Its web task descriptor remained staleformalize even after the actual statement
merge. This discrepancy was explicitly recorded in PLAN49522. The reference
client selects proofs/id when the statement is tracked on main; the actual
checker recognized the registered target as open. Heartbeats returnedHTTP200,
lead, no teammates. The full one-file disproof PR10139 was created at18:13:53UTC,
head05cc31e33214597b7359282d266afff37d7fa0fb. DONE50315 and the submitted release
both returnedPOSTHTTP200. No lease remains.

The website catalogue/verdict deployment lags main. Consequently the independent
upstream checker result, actual proof merge and public attribution must still be
monitored before this is counted as an accepted campaign solution. Verification
by our execution of the official checker is not a substitute for that verdict.
