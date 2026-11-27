# MO198816: exact counterexample to the spectral-radius conjecture

Status: complete exact rational counterexample, with reproducible arithmetic;
complete candidate Lean certificate written, pinned verification pending.
No official solution acceptance is claimed.

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

lambda=3151/3200+(7/40)i,

so |lambda|^2=1+2401/10240000>1. Define b=(1-epsilon)/(2lambda-1) and

x_i=1-b^(i+1) for i<12;   x_12=sum_(k=0)^12 b^k.

The geometric-sum identity gives sum_i x_i=13. Entrywise substitution gives

P x=lambda*x+(1-lambda)*1.

Let delta=1/1000000. Give every coordinate weight delta, and add positive
weights at coordinates 0, 3, 12. Solve the three rational linear equations
sum w_i=1, Re(sum w_i*x_i)=0, Im(sum w_i*x_i)=0. The exact resulting rational
weights are stored in `combinatorics_work/mo198816_exact_witness.json`.
The three additional weights are approximately 0.9150269540, 0.00330360936,
0.08165643662, and are all strictly positive. All thirteen full weights are
positive and sum exactly to one. The display decimals are explanatory only;
the proof uses the exact fractions.

Define the nonzero vector v=x+(1/lambda-1)*1. Since w^T*x=0 and w^T*1=1,

w^T*v=1/lambda-1,
(I-1*w^T)v=x,
M v=P(I-1*w^T)v=P x=lambda v.

Consequently lambda is an eigenvalue of the complexification of M, and
rho(M)>=|lambda|>1. This contradicts the proposed strict bound.

## Evidence and remaining work

`combinatorics_work/mo198816_exact_check.py` regenerates the rational data
and checks positivity, both dominance conventions, all stochastic identities,
the weight equations, the resolvent equation, and the nonzero eigenvector.
The parent independently replayed the complete exact certificate.

`scout_work/mo198816_statement.lean` preserves the full universal source
statement and its spectral radius. The finite witness and generic spectral
bridge are joined in `scout_work/mo198816_disproof.lean` and must pass pinned Lean
before any formal verification is asserted. A statement-only PR is a prerequisite
to registering the target; it will not count toward the accepted-proof target.

The desk's claim endpoint initially returned HTTP 500, then succeeded on a request
with a descriptive user agent. A single formalization lease is held, role lead,
with zero others working at claim. Its token is private. No official submission
has been made for this problem yet.

## Optional smaller-rational certificate

A separate exactly checked variant preserves the same n and P, while choosing
b=9/10-(7/20)i first. It gives

lambda=183241/186500+(69993/373000)i,
|lambda|^2-1=212001/373000000>0.

Use baseline delta=1/1000 and support indices 0,1,12. The added positive
weights are approximately 0.8795515818, 0.0021106891, 0.1053377291. The same
three rational equations give an exact strictly positive probability vector
and the same explicit eigenvector construction. Here all weight literals
have about twenty digits, and vector components about thirty, reducing the
cost of formal arithmetic.

The separate reproducible script is `scout_work/mo198816_simple_exact_check.py`,
data `scout_work/mo198816_simple_witness.json`, and full candidate Lean
certificate `scout_work/mo198816_simple_disproof.lean`. All exact arithmetic
checks and the unmodified official static lint gate pass. Pinned Lean is
pending. This remains a second certificate for the **same** problem, never
an additional independently counted solution. The original in-flight source
is preserved until the actual compiler feedback selects a verified version.
