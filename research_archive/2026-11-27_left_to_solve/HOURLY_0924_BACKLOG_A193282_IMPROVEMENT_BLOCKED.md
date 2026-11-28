# 28 November 2026 — 09:24 verified backlog re-audit and A193282 improvement blocked at PR creation

Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT. No RH work or schedules changed. Original 37 archived proof bytes and timestamps preserved.

Read current join.txt and tools/oma.sh (actual blob 473140945136fcd072555e1201d4431a65a67e12), current prooflen.py, AGENTS.md, CAMPAIGN_LEDGER.md blob f3fa322b6a22bdf0c0fa23a338a11f43a3ef1455 and VERIFIED_PROOFS.json blob 581b0523bc6cd1f60105682d27f924741cd54543. Current shorter-proof rules: already merged exact target, at least 5% and 20 counted characters shorter; first solver keeps credit. Official sandboxed-agent route permits official remote checker when local Lean unavailable. Local lean/lake/gh commands actually absent.

## Fresh main proof-path audit (all 37)
Main head at comparison 915dec2a6c204d4dfe63ceeee4be7aeaef84b9f6. 17 actual main files, 20 actual 404. Earlier complete individual archive/length audit HOURLY_0524_BACKLOG_IMPROVEMENT_AUDIT.md remains applicable, except explicit later improvements/competitors. All IDs listed individually below. Actual PR metadata checked for 7 own proof/improvement PRs, 7 pending registrations and 11 known foreign pending full proofs; all previously open remain open. No new merge/credit.

| ID | Main proof blob or 404 | Current disposition |
|---|---|---|
| oeis-a180195 | 29e6a37b93699d12ae886e75b00ce14123747d96 | own #7724 merged |
| oeis-a002538 | b25d5d78087cdd00f73afe3ab8dbbd4001221eae | own #7815 merged |
| oeis-a158960 | 889e1c3b751d41705c737c635d0970aed7edfe95 | own #7817 merged; known 2018 identity |
| mo-290383 | 404 | #7223 registration open |
| mo-466218 | 404 | #7625 registration open |
| oeis-a081670 | 70f5f7b93352468256b0c1ae411925379335fc47 | own improvement #22494 open, cancelled checker |
| oeis-a052204 | 9b0225eecc337bb166fb4c51fec5f6bdbf2d1d74 | incumbent shorter, additional pending shorter candidates |
| oeis-a175784 | b21393122afb857fd3d1b6a069a09c745b999170 | incumbent shorter; #9618 also exists |
| oeis-a193282 | fcb32423e2f65d04601d6f6180dab90dff53b157 | new 1140-char candidate vs incumbent 1225, branch uploaded, official PR denied 403 |
| oeis-a124870 | 7ba7476c6f1808fa93a0eacb06c5403c547b3a90 | incumbent shorter |
| oeis-a124869 | 404 | foreign full #10098 open |
| mo-198816 | 404 | own #10139 open, checker accepted |
| mo-298064 | 404 | foreign full #10106 open |
| oeis-a079269 | 404 | foreign full #10115 open |
| oeis-a343311 | 404 | foreign full #10512 open |
| oeis-a329813 | 9a4d420b3f89e23e0ca149066e95680712aefabe | own #13332 merged |
| oeis-a383246 | c1445ed2024d880a9d06be6a5014f49e5bcad509 | incumbent shorter |
| oeis-a383248 | 8284b6053b4fbc3371bf2537881ae14670b9c6b6 | incumbent shorter |
| mo-319325 | ab963a3f858737e3a7a0e6e3f8bd06dae8c556a0 | own #20838 open, checker accepted |
| mo-487192 | c970bb8012b17f322fdbc2e5777766a1a03ab00e | 2045-char candidate numerically beats 2193 main, but new observed foreign pending #22717 has 1900 chars; cancelled run, not accepted |
| oeis-a382465 | 8947ffd10f73eb3dc68e955edc5f39bcc9fa53c2 | incumbent shorter |
| oeis-a382624 | f6e3add9e575c9bc4c5a80687c967c00689cd620 | incumbent shorter |
| oeis-a383062 | 85c48e5f51cd4a40a62e87a640ed1854ddb2ac2a | incumbent shorter |
| oeis-a390583 | 404 | #10062 registration open |
| mo-474511 | 404 | #10398 registration open |
| oeis-a381423 | 404 | known-prior eligibility hold, site agent.txt and problem API still inaccessible |
| oeis-a372556 | 404 | foreign full #17012 open |
| oeis-a396949 | 404 | foreign full #16199 open |
| mo-487180 | 404 | foreign full #16447 open |
| oeis-a372561 | 404 | foreign full #19800 open |
| oeis-a181674 | 404 | foreign full #16995 open |
| oeis-a068991 | 404 | foreign full #16269 open |
| mo-513259 | 404 | foreign full #16854 open |
| oeis-a369096 | 404 | #13431 registration open |
| mo-430643 | 65fb144a4b3e49574d240ea780b5a1bcf306bb01 | incumbent shorter |
| mo-309485 | 404 | #14443 registration open |
| oeis-a385478 | 404 | #14393 registration open |

Own #7724, #7815, #7817, #13332 actual merge metadata and author con123-gif confirmed again. #10139 run 46047885906 success; #20838 run 46112192108 success, previous full-log acceptance retained; #22494 run 46120817755 cancelled, unchanged. No rerun after prior 403. Live profile inaccessible; no fresh public-feed credit claim beyond prior records and confirmed merged PRs.

## A193282 actual improvement work
Exact archived statement and current registered source byte-identical, blob 8c37c279032bc8e26a82e2490f1a984053294ad8. Archived full proof blob d6699d43f4303070a2a04923c61dca44882cc9ae. Incumbent proof #9309 by Raimo33, blob fcb32423e2f65d04601d6f6180dab90dff53b157, length 1225. All-state title search worked again (after previous transfer issue), found #9309 merged, #9368 closed/unmerged (1581 chars), #8845 closed/unmerged, #7933 registration. Fresh open search empty immediately before PR attempt.

Our independent earlier 1505-character proof uses exact parity-step factorial identities. Removed repeated full-goal restatement in odd case, replaced by a single natural-number normalization in the existing simp list, retained all parity identities and final exact rational ring cancellation. Actual symbolic verification in local Python/SymPy for both unrestricted parity branches (not just finite samples) gave residual 0:
```python
import sympy as s
m,A=s.symbols('m A')
for parity in (0,1):
    n=2*m+4+parity
    vals={n-4:A}
    for j in range(1,5):
        k=n-4+j
        vals[k]=vals[k-1]*(4 if (j+parity)%2==0 else k**2)
    r=vals[n]+8*vals[n-1]-4*(n-2)*(n+2)*vals[n-2]+16*(-2*n*n+6*n-3)*vals[n-3]-64*(n-3)**2*vals[n-4]
    assert s.expand(r)==0
```
Candidate length 1140, 85 fewer than 1225 (6.9388%), satisfies numeric gate. No Lean run or fresh kernel pass. Source conjecture R. J. Mathar, sequence Peter Luschny, incumbent first solver retained. Authenticated GitHub login con123-gif confirmed. Created unique fork branch from exact current upstream main, replaced existing single proof file via current-blob SHA guard, byte-exact readback confirmed. Actual commit [9183c9e4fd4b149df05c85144134e0b16004b832](https://github.com/con123-gif/open-math-agents/commit/9183c9e4fd4b149df05c85144134e0b16004b832), new blob e1e34cd98ecd59b6d15b81a795c3b8f7ab69ded1, branch oma/improve-a193282-20261128-0924. Upstream compare ahead1 behind0 exactly one modified file proofs/oeis-a193282.lean. Incumbent unchanged. Official create_pull_request attempt with clear remote-checking disclosure, attribution and Lease:none for merged-problem route returned HTTP403 Resource not accessible by integration. **No official PR receipt, no new official submission or checker acceptance.** No retry, alternate identity or denial bypass. Preserve fork branch for authorized future resolution.

## MO487192 race correction
Search index works again: found previously unobserved foreign #22717 (rodolfoquint, open, created 07:34:54 UTC), head 73ff87d95f0d6a7202115cca9e57bc230bbcc3f8, actual proof blob 1f37d7dd10f455587c803f8826369f0860ed4ed8, length 1900. Run 46121865039 cancelled; not a checker acceptance. Prior 2045-char independent candidate beats current 2193 main but is longer than pending candidate. Withhold, no copying; original archived 3x3 witness and its independent proof unchanged. Prior candidate probe includes embedded statement and #print axioms, so full probe length is not submission length.

## Totals and resume
37/37 audited, 17 main proofs, 20 absent. 7 own official full proof/improvement submissions, 6 actual checker acceptances, 4 merged credits, 3 own PRs open (2 accepted and 1 cancelled). 30 without own official full submission: 11 foreign pending first-proof PRs, 9 other incumbent shorter than own canonical/adapter, 1 MO487192 candidate surpassed numerically by a pending foreign improvement, 1 A193282 numerical candidate with PR permission denied, 7 registration pending, 1 known-result eligibility hold. Four cumulative independent candidates meet numeric main-length gate including two submitted; neither additional candidate currently has fresh Lean acceptance or submission eligibility clearance. 0 original discoveries certified. No new official submission this run. Resume: inspect real upstream PR/checker status, no retry of 403 absent a legitimate change of permission; compare any newly merged proof for eligible independent improvement, preserve A193282 branch and previous timestamps. No RH/schedule changes.
