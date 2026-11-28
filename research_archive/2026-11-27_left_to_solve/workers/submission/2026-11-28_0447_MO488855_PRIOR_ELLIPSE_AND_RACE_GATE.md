# 28 November 2026 — submission lane: MO488855 prior theorem bridge and race gate

Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). Source question by Artemy; answer reformulations by elihs and user127776; primary theorem by Artemy Kolchinsky, Naruo Ohga and Sosuke Ito. No originality or priority assertion.

## Current readback and race gate

Read current AGENTS.md (blob 8db0201d), CAMPAIGN_LEDGER.md (2add1e43), VERIFIED_PROOFS.json (d8dd0a5c), official join.txt and main tools/oma.sh. Manifest has 37 distinct records, 37 complete certificates (legacy 36 metric excludes A158960), 5 official full-checker acceptances, 4 merged proofs, zero certified genuine original resolutions. PR 10139 remains open; PR 13332 actually merged 02:12:52Z, commit 0a02f00c3f1333fee90981edaa191f70a21393ce.

Fresh all-state is:pr exact-ID search found foreign PR 19800 for A372561 (KoaOkano, 04:20:46 UTC), one file proofs/oeis-a372561.lean, head ac6ced0fc56d3b9fee018ae457aab3ff0391e42f, blob 684b597580986351c985fe465e4504d9db953a9c, exact imported main target OMA.solution. Also 16854 MO513259 (cjchaffin, 01:21:47 UTC), blob c56081b984430ae3521fed0e7b88d2e0345e2396, exact imported main OMA.solution; 16447 MO487180 (Solfanbtc, 00:53:58 UTC), blob 839c203cf3316649e4ab8783d2619dc65facb9b2, exact imported main OMA.disproof. Actual file contents fetched and target declarations inspected; none of these is an own PR or observed kernel acceptance. Withhold duplicate submissions. No accusation of copying.

Fork run 46085414165/job 140793734107 actually completed but executed A116150ParityRun22 helpers, NOT A372561. Do not use its green status for A372561. Remaining own registration PRs 7223,7625,10062,10398,13431,14393,14443 remain open. No claims or leases issued in this run.

## Mathematical closure by prior theorem (not a new discovery)

Source https://mathoverflow.net/questions/488855/eigenvector-quadratic-form-inequality and all visible answers/comments and revision history https://mathoverflow.net/posts/488855/revisions inspected. It asks whether |u*Bu| <= v^T Bv for nonnegative real square B, alpha>0, A=alpha B+alpha^{-1}B^T, unit complex eigenvector u of A and unit real nonnegative Perron eigenvector v of A.

Published preprint https://arxiv.org/html/2605.15884v1 (15 May 2026), Theorem 3 and Table 1, Uhl-Seifert ellipse row, settles the full claim via the following bridge. The source's prior failed counterexample used a nonpositive B; its two answers give relevant spectral reformulations but not this proof. TrureTuring code search for 488855 yielded three unrelated path matches; not an exhaustive novelty search. All-state exact-ID upstream PR search returned no matches. Public problem page and brief could not be retrieved by web access; live eligibility not established. No registration or lease.

**Proof.** Put p=alpha, q=alpha^{-1}, s=p+q and c=|p-q|/s. For alpha=1, |u*Bu| <= |u|^T B|u|=|u|^T A|u|/2 <= rho(A)/2=v^T Bv, using nonnegativity, symmetry of A and the unit norm. This also handles complex u in repeated real eigenspaces.

For alpha !=1, write lambda=x+iy for the eigenvalue of u. Because B is real, lambda=p z+q conjugate(z) where z=u*Bu; hence z=x/s+i y/(p-q). Meanwhile v^T Bv=rho(A)/s. It remains to show x^2+y^2/c^2 <= rho(A)^2.

The support of A is symmetric: A_ij>0 iff A_ji>0. Permute into connected irreducible diagonal blocks (singletons allowed). An eigenvalue belongs to at least one block M. Its Perron root R is at most rho(A). If lambda is real, Perron-Frobenius gives |x|<=R, completing that case. Otherwise the block has a strictly positive Perron vector h. With D=diag(h), G=D^{-1}MD-RI is a row Markov generator; transpose if using the column convention of the paper. Its maximum escape rate is r=R-d where d=min_i M_ii>=0. Its eigenvalue is mu=lambda-R (or identical eigenvalue of the transpose). For a nonzero offdiagonal pair, M_ij/M_ji=(p B_ij+q B_ji)/(p B_ji+q B_ij) lies between min(p/q,q/p) and max(p/q,q/p). Cycle affinities of G equal those of M: the positive diagonal similarity ratios cancel around each directed cycle. Thus every cycle of length L has absolute affinity at most L|log(p/q)|; tanh(|log(p/q)|/2)=|p-q|/(p+q)=c.

Apply Kolchinsky–Ohga–Ito Theorem 3 with tau=1/2 and AM-GM, equivalently their Table 1 ellipse bound. It yields
 y^2 <= c^2 (-Re mu)(2r+Re mu)
     = c^2 (R-x)(R+x-2d)
     <= c^2 (R^2-x^2).
The last inequality uses R-x>=0 and d>=0. Consequently x^2+y^2/c^2 <= R^2<=rho(A)^2. The required inequality follows. This covers all sizes, reducible A, zeros in B, alpha=1, and all real/nonreal eigenvalues. No limiting argument or strict positivity assumption on the original B is necessary.

**Stronger prior consequence:** each irreducible block with minimum diagonal d confines every eigenvalue to the ellipse (x-d)^2+y^2/c^2 <= (R-d)^2 for alpha !=1. Nonreal case above; real case follows from applying PF to M-dI (entrywise nonnegative, spectral radius R-d since h remains a positive eigenvector). Uniform directed cycles attain the unshifted boundary: if B is the cyclic permutation, A eigenvalues are p exp(i theta)+q exp(-i theta), giving equality. This shows the coefficient is sharp.

Executed exploratory NumPy batch random search (seed263, sizes3,4,5,6,8,12, 40 batches each, 2000 matrices per batch, nonnegative log-uniform sparse entries, t in [.001,.499]): no ellipse violation beyond floating error; this is not evidence for a universal proof. The analytic argument above is the evidence and relies explicitly on the May 2026 preprint. No Lean certificate, no new solve count, no official publication.

## RESUME HERE

Withhold the three competing full PRs above, continue monitoring actual 10139 merge/credit and still-open registrations. Do not invest in MO488855 as a genuinely new result: its exact universal assertion follows from a prior published theorem. Find a new source-faithful candidate after a fresh exact-target and primary-prior gate. All schedules, other workers, shared verifier and RH work left untouched.
