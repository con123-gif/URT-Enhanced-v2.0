# 28 November 2026 — exact obstruction to the A395110 relaxation and A372561 submission gate

Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). A395110 source: Giedrius Alkauskas, May 2026; acknowledge the earlier campaign's exact binary H-self-adjoint reduction and explicit min-bilinear construction. The result below is a complete mathematical theorem about that conditional reduction, NOT the original square-count theorem, NOT a Lean certificate, and NOT a claim of priority.

## Current preflight

Read live https://lefttosolve.com/join.txt and the current official tools/oma.sh (including the current submit fallback and STOP rules); repository AGENTS.md blob 8db0201da965541e0487d6dd1271e010bdaa0972; CAMPAIGN_LEDGER.md blob 2add1e4339932afa79bd58cea1a7d927925c4c8a; VERIFIED_PROOFS.json blob d8dd0a5cc0042a5c60be0491d0a4b5e98fab330b; current branch head before this checkpoint c1f43d7084ba7ae5f93ea4eaf739a5000f08c524. Read FRESH_SCOUTS_AFTER_A372561.md, HOURLY_0224_A395110_BOUNDARY_TWO_CLASSIFICATION_AND_A329813_MERGE.md, HOURLY_0324_A395110_MIN_BILINEAR_ENVELOPE.md, and Algebra RUN25/RUN26. The earlier A395110 source/prior gate distinguishes the open upper-2 square variant from the upper-3 OEIS sequence and the cited 2017 infinite-grid result. Re-read the actual OEIS mirror A395110 revision 55. No exhaustive new literature clearance is asserted. This is an independent obstruction, not duplication of the current algebra worker's weight-three proof.

## Theorem: no nontrivial central word has a unique real-box extension

Let k>=2, H_ij=min(i,j) for 1<=i,j<=k, and let w be a binary length-k column. Consider the relaxation of the binary H-self-adjoint extension problem:

    P(w) = { X in [0,1]^(k x k) : HX = X^T H, Xe_k=w }.

Then P(0)={0}; for EVERY nonzero w, P(w) contains an explicitly constructible nonbinary rational matrix. Moreover, the relaxation allows an unbounded discrepancy from the actual unique binary extension in the weight-one family. Thus neither real LP uniqueness nor a uniform sub-unit rounding bound can prove the remaining binary uniqueness theorem.

Proof. Put v=Hw and T=v_k=sum_r r*w_r. For w=0 the kth row of HX must be zero by symmetry and the specified last column. Its entries are sum_r r*X_rj; positivity gives every entry of X zero.

For w nonzero, T>0 and 0<v_j<=T. Define X=w*v^T/T. Every entry is between 0 and 1; its last column is exactly w. Also HX=v*v^T/T is symmetric. If w has any nonzero entry at an index r>=2, then v_1=sum w_r < T; every nonzero row has X_i1=v_1/T strictly between 0 and 1. The only remaining nonzero word is e_1. Begin with X=e_1*1^T; replace its first column e_1 by e_2/2, leaving every other column unchanged. The change in HX is -e_1*e_1^T/2, because H(e_2/2-e_1)=(-1/2,0,...,0)^T. So it remains symmetric and the last column remains e_1. The entries are valid and the new matrix is fractional. This covers all nonzero binary w.

For the gap, take w=e_k. The binary solution is necessarily X=I: the (1,k) equality gives sum_r r*X_r1=1, hence X_col1=e_1. Then the (1,j) equality gives sum_r X_rj=1 for every j. The (k,j) equality says sum_r r*X_rj=j, so its sole 1 is at r=j. Thus the integer height array F=HX is H itself. In contrast the explicit fractional construction gives F_ij=ij/k. For k divisible by 4 and i=j=k/2, the two height values differ by exactly k/4. This proves an unbounded discrepancy in actual height coordinates, not just curvature coordinates. The real relaxation has an integral point (the prior envelope construction) and a distinct rational point for every nonzero w. Integrality is essential. QED.

This is a negative methodological result, not a counterexample to A395110. The original unconditional dihedral-symmetry and directional-binary-curvature obligations still stand, as does general binary extension uniqueness. No finite test is used in the proof.

## Executed exact rational challenge

Local Python 3, Fraction arithmetic. All 1,020 binary words for dimensions 2..9 (1,012 nonzero), plus k divisible by 4 through 400, were checked, with 137,292 successful exact assertions. Reproducible script:

```python
from fractions import Fraction as Q
from itertools import product
words=checks=nonzero=0
for k in range(2,10):
    H=[[min(i,j) for j in range(1,k+1)] for i in range(1,k+1)]
    for w in product((0,1),repeat=k):
        words+=1
        v=[sum(a*b for a,b in zip(row,w)) for row in H]
        if not any(w): X=[[Q(0) for j in range(k)] for i in range(k)]
        elif w==(1,)+(0,)*(k-1):
            X=[[Q(w[i]) for j in range(k)] for i in range(k)]
            X[0][0]=Q(0);X[1][0]=Q(1,2)
        else:X=[[Q(w[i]*v[j],v[-1]) for j in range(k)] for i in range(k)]
        assert tuple(row[-1] for row in X)==w;checks+=1
        F=[[sum(H[i][r]*X[r][j] for r in range(k)) for j in range(k)] for i in range(k)]
        for i,j in product(range(k),repeat=2):
            assert 0<=X[i][j]<=1;assert F[i][j]==F[j][i];checks+=2
        if any(w):
            assert any(x.denominator>1 for row in X for x in row);checks+=1;nonzero+=1
        else:assert all(not x for row in X for x in row);checks+=1
for k in range(4,401,4):
    t=k//2
    assert Q(t)-Q(t*t,k)==Q(k,4);checks+=1
assert (words,nonzero,checks)==(1020,1012,137292)
```

## Official submission gate and exact runtime obstruction

Fresh actual GitHub PR metadata: MO198816 #10139 open/unmerged; A329813 #13332 closed/merged at 2026-11-28T02:12:52Z, author con123-gif, merge 0a02f00c3f1333fee90981edaa191f70a21393ce. Independently re-read actual upstream job logs 140671608373 and 140766605596: respective executed acceptance lines 2026-11-27T19:10:39.3670774Z and 23:11:08.1876756Z, kernel accepted, axioms within propext/Classical.choice/Quot.sound. No new execution claimed. Current ledger totals: 37 archived whole certificates, 5 official full-proof checker acceptances, 4 actual merged full proofs, 0/20 independently certified original accepted discoveries. Live site profile and specific problem pages unavailable through web, so public-site credit refresh not claimed. A329813 mirror A329813/A329654 source explicitly already supplies the seed-scaling law; no new novelty claim.

Registration metadata confirms all seven merges previously seen (12465,12514,12591,12717,12808,12868,12938) and foreign registration 13174. All-state PR search with is:pr for exact IDs shows A372561 still has only registration 12868; MO513259 has another PR16854, MO487180 another PR16447, MO430643 another PR17716. Existing foreign/own stage gates and reservation records respected; no duplicate submitted. Older registrations7223/7625/10062/10398 and newer13431/14393/14443 still open at read.

For A372561, independently compared literal entire archived statement against actual upstream main statement; blob 804c4fae0501a67e1182b334649e2fb8ada54d01 identical. Entire archived proof and exact imported fixture match blob 804b4309f0c329665ede7e6a272658740f8c44ae (34,890 characters), final selected theorem OMA.solution imports OMAStatements.S_oeis_a372561 and applies fullMain for all three clauses. Actual fork head dad8786dc7d4bb9cf7ec37a74f1bd23897170caa, its only changed file campaign/proofs/oeis-a372561.lean. Unmodified campaign workflow blob fb85dd8b2d8c10cfacec33d3b6788191ba509b4c was read; push trigger explicitly matches the branch and campaign/** path, and exact official check.sh invocation is present.

Unlike the specialized PR-only workflow wrapper, direct approved REST GET actions/runs?head_sha=dad8786dc7d4bb9cf7ec37a74f1bd23897170caa returns total_count=0. Both the branch-filtered and unfiltered fork Actions listing show the latest actual run as 46085414165 at 2026-11-27T23:59:00Z (head f76ab795148eaa44949a089dfa6d8332563bb6c2). Therefore the blocker is absence of a triggered run, not an observed Lean error, and not merely a limitation of a PR-only listing. Cause unestablished. No local lean/lake/gh executable found; sandbox curl to api.github.com returns 000 DNS resolution failure. Direct site brief unavailable. No actual new claim or desk response, no lease/token created or reused, no unsupported submission or workflow alteration. No blind retrigger.

## RESUME HERE

For A372561, obtain an actual execution of the existing exact imported-target fixture on authorized pinned infrastructure; verify whole checker verdict and selected theorem axioms, then fresh team/PR/desk gate and immediate official one-file submission if still eligible. Do not mistake an absent run for a failed proof. On A395110, work on integer-specific rigidity instead of real LP uniqueness or pointwise sub-unit rounding. The conditional H-reduction can additionally be localized as X H^{-1}=H^{-1} X^T, whose tridiagonal differences are symmetric; that direction preserves binary integrality. No new complete source certificate, accepted count, or schedule change in this checkpoint.
