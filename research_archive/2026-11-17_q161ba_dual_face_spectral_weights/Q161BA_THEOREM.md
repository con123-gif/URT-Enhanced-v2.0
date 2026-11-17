# Q161ba — exact native Q101 dual-face covariance spectral weights

**Result:** THEOREM; CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. No Q96/H64/24-clock physical charged action is inferred.

From the original Q101 outward icosahedral vertices, 30 edges, 20 faces and antipodal permutation, construct the native low projector P_l = vvᵀ/[4(1+φ²)] + (I+K_v)/2 − J/12. Enumerate exactly the 30 frustrated words with magnetization 4 and edge sum −6. Define f_s=(C P_l s)^{⊙2}, μ=E f_s, Σ=E[(f_s−μ)(f_s−μ)ᵀ], and A the original face-dual adjacency (faces sharing an edge).

**Exact certificate:** μ=(3/5)1; Tr(A^kΣ) for k=0..5 equals respectively
(416/25, 16/25+(16/5)√5, 736/25, −304/25+16√5, 2976/25, −1584/25+80√5).
The original dual adjacency has distinct eigenvalues (3,−2,1,√5,−√5,0) with multiplicities (1,4,5,3,3,4). Inverting the exact Vandermonde moment matrix gives the **nonnegative sector traces**
(0,32/15,368/75,16/5,0,32/5).
Thus the entire −√5 three-dimensional native face sector is dark to the 30-ground nonlinear covariance; the +√5 sector carries 16/5 variance. The uniform sector is also dark. This strengthens Q161az commutation by resolving the excited irreducible spectral sectors, not a physical Ward coupling.

**Proof:** Q(√5) rational-pair arithmetic constructs all native coordinates and P_l and enumerates every ground word, so the moments are exact. The six eigenvalues are pairwise distinct, hence their six-by-six Vandermonde matrix is invertible. Its inverse uniquely determines Tr(P_λΣ), and the script asserts the six exact weights and moment reconstruction. Since Σ is positive semidefinite, zero trace on an orthogonal eigenspace implies its entire covariance restriction vanishes. Existing Q161az establishes [A,Σ]=0.

**Execution:** `python Q161BA_CERT.py` executed locally in container, exit 0, exact output. No measured data, fitted constants or historical ARF inputs.

**Next question:** Which original Q96/H64/24-clock charged source operator acts on the four excited face sectors, and does its native Ward commutator vanish on each without a chosen mass insertion?
