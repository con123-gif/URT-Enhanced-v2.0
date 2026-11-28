# Algebra bot RUN24 — MO513259 imported-target gate and A395110 strict-partition reduction

Date: 2026-11-28 UTC  
Owner/credit: Cornelius Lytollis (`@con123-gif`), assisted by ChatGPT/Codex (base model GPT-6; exact serving variant not exposed).  
Status: **one exact registered-target verification fixture uploaded; external Actions dispatch missing; one rigorous new conditional reduction for A395110; no acceptance/count change.**

## Current rule and campaign preflight

- Read the complete current `https://lefttosolve.com/join.txt`; SHA-256
  `289aa58c22b4e03fa0c89ccf2f68efe5505dfc0cd7ebc29f74bcdbc1ec9d6dbe`.
- Read the complete current official `tools/oma.sh` at upstream main
  `88c89e240fbbc12adcb4c851e6bf41ea7f3a080c`; SHA-256
  `3d22a8b0b90f4f09113b9952a2329aeb1ee7e33ba4b06920746f7547116df7a6`.
- Read current `AGENTS.md`, `CAMPAIGN_LEDGER.md`, `VERIFIED_PROOFS.json`, prior/source audits and
  Algebra resume records.  Latest Cathedral head before checkpoint publication was
  `f5a408b419da26e934126ce5b710b8fe4618a0eb`.
- Authoritative totals remain **37** complete archived certificates, **5** own full-proof/disproof
  PRs, **5** actual upstream checker acceptances, **3** merged/publicly credited full proofs, and
  **0** ledger-certified original accepted discoveries.

## Live registration changes and MO513259 exact-target stage

Fresh GitHub metadata showed these statement registrations actually merged:

- A068991 / PR 12465 at `2026-11-28T00:14:25Z`;
- MO513259 / PR 12514 at `2026-11-28T00:21:13Z`;
- A396949 / PR 12591 at `2026-11-28T00:33:54Z`.

They are statement merges, not full-proof acceptances.  A068991 already has a distinct number-theory
imported-target owner/checkpoint, so this lane did not duplicate it.  MO513259 is the Algebra lane's
natural continuation.

The merged official target `statements/mo-513259.lean` on current upstream main has SHA-256
`236cc7849d274d12067daf1290bb8ff29656797468a5c07235fdc6ae5a2d2980`, exactly matching the canonical
reviewed statement.  The shared verifier fixture at commit
`fec029b3bd391e450ce2347392396739dc33faf0` contains the complete canonical proof, SHA-256
`50565c78756547a97d545bdc8474329ffed77ba0de4d221c92b61db9814fbf47` (160749 bytes), byte-for-byte
equal to `PROOFS_READY/mo-513259.proof.lean`.

The first fixture push produced no GitHub Actions run.  The workflow remained active, its path filter
covered `campaign/**`, the branch head and changed proof path were correct, and recent historical runs
were readable.  One transparent comment-only retrigger was made at commit
`8d06a55207d547427a792611295f2287018f90dd`; it also produced no run after repeated read-only checks.
No third push, force, workflow edit, or blind retry was made.  Therefore **no imported-target PASS is
claimed**, no proof-stage lease was taken, and no official full-proof PR was opened.  The original
whole proof pass remains valid, but the required exact merged-target replay is externally pending.

Fresh all-state exact-title search found only registration PR 12514 and no separate MO513259 full-proof
PR.  Existing full PRs 10139 and 13332 remained open/unmerged.  Statement PRs 13174, 14393 and 14443
also remained open/unmerged at the live gate.

## A395110: exact conditional reduction beyond finite enumeration

This section concerns the source's upper-Laplacian-2 square problem, not the main upper-3 sequence.
Let `f` be an integer function on the `n × n` interior, zero on the exterior boundary, and suppose

\[
0\le Lf(i,j)=4f(i,j)-f(i-1,j)-f(i+1,j)-f(i,j-1)-f(i,j+1)\le2.
\]

Write `k=floor(n/2)`.  The unresolved structural assertions observed in every exact solution through
`n=17` are:

1. `f` has full dihedral symmetry;
2. both directional curvatures are binary:
   \(V_{ij}=2f(i,j)-f(i-1,j)-f(i+1,j)\in\{0,1\}\) and similarly horizontally.

Assume these two assertions.  On the upper-left `k × k` quadrant define the mixed Hessian

\[
C_{ij}=f(i,j)-f(i-1,j)-f(i,j-1)+f(i-1,j-1)
\]

and its row-prefix sums `R_i(j)=sum_{t≤j} C_it`.  Direct telescoping gives

\[
R_i(j)=f(i,j)-f(i-1,j).
\]

Consequently, for `i<k`,

\[
R_i(j)-R_{i+1}(j)=V_{ij}\in\{0,1\}.
\]

For even `n=2k`, reflection gives `f(k+1,j)=f(k,j)`, hence `R_k(j)=V_{kj}`.  For odd
`n=2k+1`, reflection makes the two neighbors of the central row equal; binary central curvature is
an even integer, so it is zero and `f(k+1,j)=f(k,j)` again.  Thus in both parities

\[
R_k(j)\in\{0,1\}.
\]

Transpose symmetry gives `C_ij=C_ji`.  Let `lambda_i=R_i(k)` be the row sums of `C`, and let the
central curvature word be `w_i=V_ik`.  With `lambda_(k+1)=0`, the preceding identities prove

\[
\boxed{\lambda_i-\lambda_{i+1}=w_i,\qquad
       \lambda_i=\sum_{r=i}^{k}w_r.}
\]

Thus the central binary word determines the entire row-sum partition of the mixed Hessian.  Moreover,
at prefix `j=1`, the quantities

\[
C_{i1}-C_{i+1,1}=R_i(1)-R_{i+1}(1)
\]

are binary and `C_k1` is binary.  Therefore the first column of `C` is a nonincreasing binary word;
by symmetry the first row is the initial segment of exactly `lambda_1=sum_i w_i` ones.  Finally,

\[
f(i,j)=\sum_{a\le i,\,b\le j}C_{ab},
\]

so uniqueness of `C` implies uniqueness of `f`.

This turns the missing upper bound into a precise combinatorial statement:

> For each binary word `w`, there is at most one symmetric integer matrix `C` whose row-prefix
> differences are binary, whose bottom row-prefixes are binary, whose row sums are
> `lambda_i=sum_{r≥i} w_r`, and whose double prefix sum has the required reflected extension.

An independent exhaustive challenge over **all** symmetric binary matrices through `k=6` found
exactly `2^k` matrices satisfying the prefix-interlacing conditions, one for every binary word.
That finite challenge supports the isolated lemma but is not substituted for its missing general
proof.  The new derivation is general and exact; the original A395110 conjecture remains open because
dihedral symmetry, binary directional curvature, and the general matrix-uniqueness lemma are not yet
proved.

## RESUME HERE

1. Read-only check whether Actions eventually attaches a run to MO513259 commit `8d06a552...`.  If it
   does, require the actual checker JSON, artifact digest, accepted verdict, empty errors and standard
   three axioms before the fresh race/lease/full-PR stage.  If it does not, do not push again; use a
   genuinely distinct supported verifier route or wait for infrastructure recovery.
2. For A395110, prove or refute the isolated symmetric interlacing-matrix uniqueness theorem.  Do not
   replace it by a larger finite enumeration.  Even after that lemma, preserve the two structural
   obligations (dihedral symmetry and binary directional curvature) as unresolved.

No certificate, accepted-proof, merge-credit, or originality count changes in this checkpoint.
