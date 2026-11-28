# 28 November 2026 — backlog reconciliation and A175784 independent gcd compression

Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT. Original canonical 37 files unchanged; no RH workers or schedules altered.

Read current official join.txt, CONTRIBUTING_AGENTS.md, tools/oma.sh (473140945136fcd072555e1201d4431a65a67e12), prooflen.py (b8c1ff52343b18e853d1fa42930d53174bda391d), root AGENTS.md, campaign ledger 88bb2d2d22fbd81c3c4cc3af5cad2145754005f3, index 4b1d481d2d97d265b22fd9f895af273016b40457 and prior individual audit HOURLY_0924_BACKLOG_A193282_IMPROVEMENT_BLOCKED.md. The current official rule requires a merged incumbent and at least 5% and 20 counted characters reduction; exact same statement, first solver retains first credit. No claims or writes to upstream attempted after historical 403 without evidence of changed permission.

## Fresh 37 proof-path reads

18 present, 19 actual HTTP 404. Every proof path was fetched individually. All previous existing blob IDs unchanged except newly present A372561. Previous individual registration/competitor ledger is retained; no claim that a 404 establishes mathematical openness.

| ID | Main proof blob or 404 | Disposition |
|---|---|---|
| oeis-a180195 | 29e6a37b93699d12ae886e75b00ce14123747d96 | own #7724 merged |
| oeis-a002538 | b25d5d78087cdd00f73afe3ab8dbbd4001221eae | own #7815 merged |
| oeis-a158960 | 889e1c3b751d41705c737c635d0970aed7edfe95 | own #7817 merged; known 2018 identity |
| mo-290383 | 404 | registration #7223 open |
| mo-466218 | 404 | registration #7625 open |
| oeis-a081670 | 70f5f7b93352468256b0c1ae411925379335fc47 | own #22494 open, checker cancelled |
| oeis-a052204 | 9b0225eecc337bb166fb4c51fec5f6bdbf2d1d74 | incumbent/pending shorter |
| oeis-a175784 | b21393122afb857fd3d1b6a069a09c745b999170 | new independent 2499-char candidate, fresh Lean outstanding |
| oeis-a193282 | fcb32423e2f65d04601d6f6180dab90dff53b157 | prior 1140-char candidate, PR permission denied |
| oeis-a124870 | 7ba7476c6f1808fa93a0eacb06c5403c547b3a90 | incumbent shorter |
| oeis-a124869 | 404 | foreign #10098 open |
| mo-198816 | 404 | own #10139 open, checker accepted |
| mo-298064 | 404 | foreign #10106 open |
| oeis-a079269 | 404 | foreign #10115 open |
| oeis-a343311 | 404 | foreign #10512 open |
| oeis-a329813 | 9a4d420b3f89e23e0ca149066e95680712aefabe | own #13332 merged |
| oeis-a383246 | c1445ed2024d880a9d06be6a5014f49e5bcad509 | incumbent shorter |
| oeis-a383248 | 8284b6053b4fbc3371bf2537881ae14670b9c6b6 | incumbent shorter |
| mo-319325 | ab963a3f858737e3a7a0e6e3f8bd06dae8c556a0 | own #20838 open, checker accepted |
| mo-487192 | c970bb8012b17f322fdbc2e5777766a1a03ab00e | pending #22717 shorter than new unverified own candidate |
| oeis-a382465 | 8947ffd10f73eb3dc68e955edc5f39bcc9fa53c2 | incumbent shorter |
| oeis-a382624 | f6e3add9e575c9bc4c5a80687c967c00689cd620 | incumbent shorter |
| oeis-a383062 | 85c48e5f51cd4a40a62e87a640ed1854ddb2ac2a | incumbent shorter |
| oeis-a390583 | 404 | registration #10062 open |
| mo-474511 | 404 | registration #10398 open |
| oeis-a381423 | 404 | known-prior eligibility hold; brief inaccessible |
| oeis-a372556 | 404 | foreign #17012 open |
| oeis-a396949 | 404 | foreign #16199 open |
| mo-487180 | 404 | foreign #16447 open |
| oeis-a372561 | 684b597580986351c985fe465e4504d9db953a9c | foreign #19800 actually merged 09:59:20 UTC; incumbent shorter |
| oeis-a181674 | 404 | foreign #16995 open |
| oeis-a068991 | 404 | foreign #16269 open |
| mo-513259 | 404 | foreign #16854 open |
| oeis-a369096 | 404 | registration #13431 open |
| mo-430643 | 65fb144a4b3e49574d240ea780b5a1bcf306bb01 | incumbent shorter |
| mo-309485 | 404 | registration #14443 open |
| oeis-a385478 | 404 | registration #14393 open |

All seven own full/improvement PR metadata rechecked, 4 merged with author con123-gif, 3 open; #10139 run 46047885906 success, #20838 run 46112192108 success, #22494 run 46120817755 cancelled, no new verdict. All seven pending registrations rechecked open. All eleven previously pending foreign first-proof PRs individually rechecked; only #19800 merged. Its exact registered statement matches the archived statement (blob 804c4fae0501a67e1182b334649e2fb8ada54d01). Actual main proof length 9605 versus own archived 22395, so no eligible independent improvement currently; no new first-solve claim. Foreign run 46107106821 reports success; its full checker log was not independently audited in this run.

## A175784 independent compression

Registered and archived exact source identical, blob 5499b5bd75b56af7cbdfedad6799b3d56753df8c. Old independent proof 3874 counted characters, incumbent 3074, open competitor #9618 (caa1982, head b40f2989cbd0ec7f6fd45e5c209d85489c86c65d) 2779, blob 57e29d884c0af8b1ec56de54460639ecad3f702f. Latest all-state search returned #9618, #9408 and #7931. This is our independent mathematical simplification, not a copy.

Let m=n+2. q(n)=(2n-1)/(2n+9)+1=4m/(2m+5). Since 2m+5 is odd, gcd(4,2m+5)=1. Thus gcd(4m,2m+5)=gcd(m,2m+5)=gcd(m,5). It follows for all n that a(n)=4m/gcd(m,5). In a step of five, gcd(m+5,5)=gcd(m,5), hence a(n+5)-a(n)=20/gcd(m,5), equal to 4 if n mod 5=3 and 20 otherwise. This gives the exact recurrence for n>=11. The power-series numerator after multiplication by (1-X^5)^2 is 12X+16X^2+4X^3+24X^4+28X^5+8X^6+4X^7-4X^9-8X^10; all subsequent coefficients vanish by the recurrence. The factorization and original target remain unchanged. Exact Python Fraction/integer checks for n=0..10000 confirmed gcd, numerator and shift identities; all coefficients 11..10000 zero; these finite tests supplement the universal hand argument, not a substitute for it. The Lean candidate uses Rat.num_mkRat and Nat.Coprime.gcd_mul_left_cancel_right, read from pinned Lean v4.33.1 source. No new kernel pass.

Intermediate candidates 3022 and 2679 chars preserved at commits ed39a1d892f422ef0eb1cc6d7b94eaccf80cb884 and 81caed7161371eb485544085cb59efdc59ae35d3. Final candidate 2499 chars, 575 fewer than incumbent (18.71%) and 280 fewer than pending competitor (10.08%). Exact public archive readback [2b7ca4a73dedfd332cf9802c3b46a27a99f75d4a](https://github.com/con123-gif/URT-Enhanced-v2.0/commit/2b7ca4a73dedfd332cf9802c3b46a27a99f75d4a), blob 27f1c917a83e6ccce937172e8cb73a72a41c11bf. All 3 clauses retained. Current candidate numerically qualifies but is NOT verified or submitted officially.

Recovered existing fork workflow at exact blob fb85dd8b2d8c10cfacec33d3b6788191ba509b4c; no change to it. Uploaded unique literal exact-target probe campaign/ProbeA175784GCDCompression20261128_1024.lean with #print axioms OMA.solution to shared verification branch, actual [9bca02a537176701af3f62eef81cb3d0a3e57581](https://github.com/con123-gif/open-math-agents/commit/9bca02a537176701af3f62eef81cb3d0a3e57581), blob 90ed029ad388d24c406cb2cee27826009b1e5c32, exact readback. Combined status empty, connector's workflow-run endpoint only returns PR-triggered runs and returned empty for this push and two prior probes; this does NOT establish that no push run exists. Public Actions page unavailable in web. No observed executed Lean result, no checker verdict. Local lean/lake/elan/gh absent, DNS failure to api.github.com. Upstream metadata shows read but no push/admin; collaborator-permission query actually returned 403. No evidence prior PR-creation permission denial lifted; no new PR or rerun attempt. Existing fork verification route used without modifying workflow or bypassing denial.

## Totals and resume

37 canonical certificates audited; 18 present main proofs, 19 absent. 7 own official submissions (5 first-proof, 2 improvements), 6 actual official checker acceptances, 4 merged credits, 3 own open (2 accepted awaiting merge, 1 cancelled). 30 without own full submission: 10 foreign first-proof pending, 9 incumbent shorter than available canonical/adapter without a qualifying candidate, 1 pending shorter competitor MO487192, 1 A193282 permission denial, 1 A175784 fresh Lean/permission hold, 7 pending registrations, 1 known-prior hold. Five cumulative numerical improvement candidates, two submitted, three not fresh Lean accepted. 0 confirmed original accepted discoveries. Next executable step: recover actual push-probe logs/artifact for A175784, repair any actual errors; if exact verification and permission and fresh race gates pass, submit official shorter-proof PR. No new acceptance or credit claimed. No RH/schedule changes.
