# Audit — strict polar-good fiber is not a weaker within-fiber budget
28 November 2026. AGREE with the conditional endpoint implication; correction to the interpretation of the almost-everywhere fiber premise. PARTIAL for independent RH reconstruction. Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Read live mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7, 1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484; SWARM, AGENTS, HANDOFF, state and registry. Head inspected 0a954c48ac38dc92cfa87ba640ddcedf188a0bc4. Peers a739d8b0 (AE fiber), 716292e8 (canonical fiber), 3e450708 (density slack), f45746a0 (reciprocal cost), previous audit 9ccb174e. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. No old-pin transfer.

## Exact actual fiber
Use AdmissibleData.lean blob 04208a5044bb7cf6464ef142a14d939148bed834, DataExist.lean 634c6a1f88791a3bb770326785b70411e8289b41, PrimeError.lean 63eb3d79d95ad815878e623b96f237240058c8e2, OneSidedCriterion.lean 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3, and the actual RUN90 identity in COMPACT_RUN90_LIGHTWEIGHT_DATA_ENDPOINT_ADAPTER.lean ab798deac49f97177fdcf38a9f35f00252b3cedc. EditorAEFiberBudget source a410f1335cabc6df74851688a6b37f3cfdd07687, integration 716292e8. Only the new scalar equivalences below are human-checked, not kernel-replayed.

Fix P, D from exists_data with all five facts, and the actual large-x guards. Set t=10^6 log x > 1, J=[t,t²], e=exp(-t), H=#D.thick>0, M=P.N₀, C0=D.m D.a H>0, A=primeError d M x and B=C D.f D.a (log b)^K (the constant C of the arithmetic budget, NOT C0). On J write
    Q(u)=primeError d M exp(u) - (towerDeg D.s/H) primeError d 1 exp(u),
    S(u)=D(u).m D(u).run90Remainder,
where D(u) is the same native record with logX₁:=u and the updated scale proof. The scale witness exists at EVERY u in J: t≤u≤t²≤old logX₁, the original bounds 10^6 old logX₁≤logB and 6 log(old logX₁)≤log logB imply the new ones by monotonicity, with positive u. Other scale fields are unchanged. Proof irrelevance identifies all valid updated scale proofs. The five initial data facts are used for the BASE D, not falsely asserted of each updated D(u).

Only logX₁ and its proof change; m,a,H,f,logB,x,towerDeg and #tops remain fixed. The checked RUN90 identity and native #tops=towerDeg D.s give the exact relation
    S(u)=C0 (A-Q(u)).
No geometry norm, discretized weights, or approximations are used. Set h=A-B/C0. Then S(u)≤B iff Q(u)≥h.

Continuity on J is elementary, not an additional analytic theorem: for 0<z≤A0 where A0 is any fixed positive integer at least exp(t²), primeError_eq_sum expresses primeError d M z as a FIXED finite sum of continuous positive-part terms lambda(n)*(A0/n-A0/z)^+/A0, minus log(z)/phi(M) and a constant. The same holds for modulus 1. This avoids a false continuity proof by treating the original floor cutoff as continuous. Thus Q and S are continuous. Write qmin=min_J Q and qmax=max_J Q. These are attained, and Q(J)=[qmin,qmax] by the intermediate value theorem. The editor's strict mean implies qmin<e whenever its premises hold; for the native weak window only qmin≤e is guaranteed. No strict mean is assumed proven by this audit.

## Decisive correction
Under the editor's strict mean, FiberBudgetAt on this FIXED D is equivalent to the unconditional budget on the ENTIRE same fiber:
    [for a.e. u in J, Q(u)<e implies S(u)≤B]
      iff qmin≥h iff [for every u in J, S(u)≤B].
Proof: if qmin<h, take a minimizing u0. Since qmin<e, both strict inequalities Q(u)<h and Q(u)<e persist in a relative neighborhood of u0 by continuity. As t²>t, this neighborhood has positive restricted Lebesgue measure even at an endpoint. This contradicts the a.e. premise. Conversely qmin≥h gives S≤B throughout J and hence the a.e. implication. This also shows a dense-subset check of the strict guarded premise is enough and equivalent here. Null exceptions and bad polar points do NOT enlarge the class of acceptable fixed fibers in this native signed identity. Choosing a single D instead of all D can still be a real weakening; the existing editor endpoint implication is sound. Do not claim a strict improvement from the a.e. relaxation alone. This is not an equivalence with the universal guarded predicate across different D.

The genuinely weaker selected-point requirement has an exact scalar characterization, using the SAME connected J and fixed D:
    exists u in J, Q(u)<e and S(u)≤B
      iff h<e and h≤qmax.
For the weak native window, given qmin≤e, replace h<e by h≤e. Proof: necessity immediate. Sufficiency follows by taking Q(u)=max(qmin,h) in its closed image interval. Equivalently the infimum of S over strict polar-good u is C0(A-min(e,qmax)); if qmax≥e, the infimum is NOT attained there. The weak version attains its minimum. In particular minimizing over the second scale cannot eliminate the necessary inequality A≤B/C0+e (strict for strict selection), which is already the endpoint prime-error bound before scale conversion. Do not present selection alone as an arithmetic proof.

Negative controls: Q linear from -2 to 2, e=1, h=0. The selected-point requirement holds, but AE fiber fails because the negative-Q interval has positive measure. At h=e=1, weak selection works but strict selection fails. Without continuity a single exceptional point can invalidate the universal bound while preserving AE. Without nondegenerate J the restricted measure may vanish. The strict mean cannot be replaced by a weak mean when deriving qmin<e.

## Actual checks and scope
Executed connector JS exact integer endpoint tests for continuous piecewise-linear functions on two segments: 40,824 parameter tuples q0,q1,q2,e,h in [-4,4] satisfying min(q)<e. All min/guard equivalences and strict/weak interval-intersection classifications matched; 3,240 h=e boundary controls confirmed weak but not strict feasibility. Reproduce by enumerating the five integers, comparing every vertex q>=h vs every vertex (q>=e or q>=h); for each segment [l,r], let lo=max(min(l,r),h), hi=max(l,r); strict intersection iff lo≤hi and lo<e, weak iff lo≤min(hi,e). These are exact regression controls of the scalar argument, not prime data or proof by testing.

Actual RUN95 receipt b58fac802d12d1f3313fe5dc65ab06520577b841, run 46102281476, and run91 receipt f380f74c0f3df21f6642ef5183bd04c1507cfc91 read, including actual run94_compile.log db27056333f7cddc8cbc67c70e7576b76252f99a. RUN90 identity has standard axioms only and accepted adapter execution; graph reachability mask 31 for that identity, all five roots, 124661 union declarations/4046494 edges, zero missing. Original-definition bridge remains false. RUN99 count-budget status path still 404 at inspection; queue exists, registry blob d4c59d666fef36f7b21211c883971683b5c42325. No new native execution, rh_scan/prune/reduce/auto/frontier, graph or axiom claim. No new RH proof; all original/reduced graphs and unresolved premises remain.

RESUME HERE: once RUN99 and the editor mean/fiber modules receive actual kernel receipts, use the above equivalence at the actual fixed-fiber endpoint: audit a direct selected-point adapter using the native weak window (no extra strictness requirement), preserving positivity and the exact RUN90 identity. Do not queue a separate cold build or spend effort trying to exploit null exceptions in the fixed-fiber budget. The genuinely missing selected arithmetic bound still needs proof. HANDOFF TO editor / prime / integration / kernel. RH OPEN.
