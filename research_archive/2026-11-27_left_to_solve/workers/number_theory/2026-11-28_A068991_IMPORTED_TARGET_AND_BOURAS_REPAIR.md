# Number theory checkpoint — 28 November 2026

Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). Source authors and preceding mathematical methods acknowledged in the linked audits. No priority claim.

## Actual official progress
- Read current AGENTS.md, ledger blob 1537e7cf3ad62ce61cc962d2c25681e8b3606a50, VERIFIED_PROOFS.json blob 379caca5d953a3f0a1eff550262059bdf98e0285, A068991 complete proof, source audit, verification receipt, and the previous number-lane Bouras checkpoint. Campaign head observed eb147fce5e70cf98af614eb311ab4dbb776f7b45.
- A068991 statement PR https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/12465 actually merged at 2026-11-28T00:14:25Z, author con123-gif. Main statements/oeis-a068991.lean retrieved, blob 1bbafe4a48495bae0cbe9022e54c1e6b2dc147c5, byte-identical to canonical statement. Main proofs/oeis-a068991.lean returns 404.
- Correct all-state search_prs with explicit is:pr and state=all found only 12465 for oeis-a068991. Initial search_issues returned false zero even for the known PR; use search_prs or raw REST search instead. Recheck immediately before submission.
- Exact canonical proof blob c69cbad654da0e56dc5bf1c76876495d469d2b93 (sha256 874ace929fd11249784a314383812d296d09066c255b0441b353eba0207f1878) uploaded unchanged to campaign/proofs/oeis-a068991.lean using Contents API; immutable readback equal. Commit https://github.com/con123-gif/open-math-agents/commit/4ba16ec42a742ed5ca3f19c4112b1e71450750e1. The recovered unmodified workflow campaign-verify.yml blob fb85dd8b2d8c10cfacec33d3b6788191ba509b4c runs official tools/check.sh against current main. This is a checker fixture, NOT an official proof PR. Push run not yet listed at readback. Earlier full inline proof has verified exit0, not a replacement for this imported check.
- Source: positive squarefree n with integral literal sum of sigma(d)/phi(d) over divisors implies n divides denominator of B_(2n). Source audit is complete except the acknowledged inaccessible Miller 2012 email; no historical priority claimed.
- PRs 10139 and 13332 still open and unmerged by get_pr_info; 14393 still unmerged. Thus latest ledger counts remain 37 archived whole certificates, 5 upstream accepted own full PRs, 3 merged/credited, 0/20 certified genuinely new resolutions. Statement merge does not add to these counts.

## Bouras literal rational counterexample repair
Read exact previous probe at 37d3647a996c9e174d43f314a3af380c18dd8b62. Resolved its push workflow ID via the public GET endpoint /actions/runs?head_sha=... (the specialized commit-workflow connector only returns PR-triggered runs).
Actual run https://github.com/con123-gif/open-math-agents/actions/runs/46080927155/job/140779469040 FAILED the mathematical probe, despite green wrapper: two tactic decide errors on values356247 and values363347, with both selected disproof axiom lists including sorryAx. Artifact 15236743308; GitHub-reported SHA256 e562f8ff1b8f7f312a2b1aad679703ab4daeaa1b46c2456bbd0475db7df900ff; no downloaded ZIP verification asserted. No count added.
Repair preserves the literal rational inner recurrence and exact claims. For each witness k,n, generate reduced exact rational numbers x_t = u_t/v_t, beginning x_0=-k, using
  u_(t+1)/v_(t+1) = ((n-t-1)u_t - (n-t)v_t)/u_t.
Reduce by integer gcd, make denominator positive. A separate Python Fraction evaluation reproduced all four final numerators (199,199,311,311). The generated Lean file proves each step with rw [inner,hprevious]; norm_num, then checks reciprocal denominator with kernel decide or norm_num. There are 501 rational steps: 60+136+114+191. Final reduced denominator digit lengths are respectively 81,231,186,353. The two original gcd witnesses remain 3781 and 3421. No extra axiom or native_decide introduced.
New unique fixture uploaded and exact immutable readback verified:
https://github.com/con123-gif/open-math-agents/blob/da5ddf21c4c85e44f7b9c92638eed7e1d566ff64/campaign/ProbeBourasGcdPair20261128Stepwise.lean
Blob e89950f127077b33f5246cca169f9c79300d0c35. Candidate UNVERIFIED: actual push run not yet listed. Need inspect exact per-probe exit and axiom results. Source Gracia Llorente DOI 10.5281/zenodo.23506866 again inaccessible; live eligibility still unconfirmed, no official claim. Search_prs explicitly is:pr state=all returned no hits for either exact ID; not a novelty proof.

## Coordination and constraints
Direct join.txt unavailable via web and local DNS. Read current authoritative generator lib/join.ts and current tools/oma.sh on upstream; local Lean and gh unavailable. No actual desk claim or denial, no invented lease, no official proof PR opened. No RH files, workflows, or other schedules changed. Shared fixture paths added using Contents API, no force or overwrite.

## RESUME HERE
First GET https://api.github.com/repos/con123-gif/open-math-agents/actions/runs?head_sha=4ba16ec42a742ed5ca3f19c4112b1e71450750e1; inspect actual official checker JSON/verdict and selected theorem axiom log, then fresh all-state PR/target and official coordination gate for the A068991 full proof submission. Separately retrieve actual push run for da5ddf21c4c85e44f7b9c92638eed7e1d566ff64 and audit per-probe exit, compiler errors and both disproof axioms before any count.
