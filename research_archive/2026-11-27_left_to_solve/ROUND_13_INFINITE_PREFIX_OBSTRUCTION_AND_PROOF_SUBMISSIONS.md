# Round 13 — an infinite-prefix obstruction and three submitted exact proofs

27 November 2026. Research credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT GPT-6.2. A401895 work below is a partial structural result, not a solution or Lean certificate. The three proof PRs listed below are independent interactive campaign work, not new submissions by this hourly session.

## A401895: why the finite prefix exhaustion strategy cannot close H3

Source: https://oeis.org/A401895 . The pending reduction PR7177 by @physbuzz includes Lean certificates for the odd and all-fives cases, and explicitly acknowledges the owner's endpoint/modulo-11 arguments. Its last remaining H3 asks to exclude an all-sixes product for reversed factors. Do not claim H3 is solved.

For a k-digit prefix pair A,B of a candidate and its reversal, set t=10^k and let C,D be their padded k-digit reversals. The necessary prefix tests from the all-fives certificate, with d=6, are

    (9 C D + 6) mod t = 0,
    9 A B < 6 t^2 < 9 (A+1)(B+1)+6.

A finite search that only extends these tests will NEVER empty the frontier. Proof: take the real constants

    alpha = 777/1000,
    beta = 858000/999999,
    alpha*beta = 2/3.

Use the consistent prefix sequences A_k=floor(alpha*t), B_k=floor(beta*t).
Their digits are respectively 777000000... and 858000858000... . Since beta has a nonterminating decimal expansion, A_k B_k < (2/3)t^2 < (A_k+1)(B_k+1), proving the two real inequalities at every depth.

For k>=3, C_k=777. At k=6m, the reversed prefix of beta is D_(6m)=858 sum_{j=0}^{m-1} 10^(6j). The exact identity

    9*777*858 = 6*(10^6-1)

implies

    9*777*D_(6m)+6 = 6*10^(6m).

For any k>=3 choose 6m>=k. Since D_k is the residue of D_(6m) modulo 10^k, the desired congruence follows. For k=1 and 2 it follows by direct evaluation: (C,D)=(7,8),(77,58). Thus a consistent infinite branch survives all depths of this particular necessary-condition tree. This is an obstruction to the proof method, not a counterexample to A401895: the two independent infinite strings are not the reversal of a single finite word. The same argument explains the periodic surviving branch visible in a direct exact enumeration through depth 30.

Executed independent Python check, all depths 1..300 passed:

```python
from fractions import Fraction
a=Fraction(777,1000); b=Fraction(858000,999999)
assert a*b==Fraction(2,3)
for k in range(1,301):
    t=10**k
    A=int(a*t); B=int(b*t)
    C=int(str(A).zfill(k)[::-1]); D=int(str(B).zfill(k)[::-1])
    assert (9*C*D+6)%t==0
    assert 9*A*B<6*t*t<9*(A+1)*(B+1)+6
```

The computation illustrates the general exact identity, not vice versa. No claim of novel literature priority or URT-specific advantage. The underlying symmetric convolution literature remains Ezerman, Meyer and Sole, JIS 18 (2015), article15.3.5, as cited in Round10. The new obstruction concerns the exact prefix tests in PR7177; they succeed for fives but must be strengthened for sixes. Continue with finite-word overlap constraints or independent arithmetic restrictions, rather than expecting the same tree to become empty at a larger depth. No lease obtained in this run, no official research note posted.

## Reconciliation of independent campaign work

Direct upstream PR metadata shows three distinct full proof submissions now open, all by con123-gif. Their PR descriptions cite the unmodified official checker accepting the exact merged registered target. No upstream merger or review verdict yet, so 0/20 accepted from the observed PR records. Separate statement merges are not solutions.

| Problem | Statement merged | Actual proof submission | Exact-target checker cited in PR |
|---|---|---|---|
| A180195 | PR7463, 14:58:33 UTC | PR7724 open | run46021118180 |
| A002538 | PR7462, 14:59:38 UTC | PR7815 open | run46022248734 |
| A158960 | PR7460, 14:58:46 UTC | PR7817 open | run46022248734 |

These are independent submissions by the interactive Codex campaign, not attributable to this session. A081670 statement PR7865 and MO466218 statement PR7625 are also open with completed checked proof candidates reported in their PR bodies. MO290383 PR7223 and A399155 PR7275 remain open statement-only; A399155 has prior literature and must not be claimed as genuinely new. PR6725 closed unmerged; PR6800 merged by a third party; PR7177 remains open. No duplicate claims or submissions.

Read the official prior live rule output at run46016125981 (14:27 UTC) and current upstream README/client. Fresh direct join.txt/catalogue requests failed (no DNS in local environment, web inaccessible). A narrowly scoped read-only workflow was committed on the isolated fork branch (commit0366bd0952eea63fcd1b7df9d3faa0bdab828a35, .github/workflows/round13-live.yml); it reads current rules, available open catalogue, solved feed and independently checks the 300 prefix states. Its execution result is not confirmed in this session. Do not infer catalogue status or public credit from the committed workflow alone. Fork permissions verified writable; no live lease request or submission attempted in the absence of confirmed fresh rules and team status.

RESUME: Check proof PR7724/7815/7817 for actual verdicts/merges; track statement PR7865/7625/7223/7275 and coordinate exact proof submissions without duplicates. Check the fresh read-only workflow outcome and live availability. If PR7177 merges, share the infinite-prefix obstruction only through permitted collaboration channels with a live lease; no repeated claim after a conflict. Continue toward 20 accepted distinct proofs.