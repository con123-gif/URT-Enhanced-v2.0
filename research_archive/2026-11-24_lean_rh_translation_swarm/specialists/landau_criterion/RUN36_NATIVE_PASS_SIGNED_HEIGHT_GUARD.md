# RUN36 — native conditional analytic endpoint passes; signed joint-loss height guard
25 Nov 2026. CI-REPORTED KERNEL-CHECKED conditional endpoint; separate SOURCE-MATCHED human sign correction. RH OPEN.

Preflight: current mission blob d876dd144c13a327429f7ac651ccfac619311469 (new unification directive commit 7ba7bcab099d190b5997c5b1caa77860e4fde350), mandatory engine, SWARM 4b77b161d6876915c15cea5a4d4a519beaf5de74, HANDOFF bbc46df7d7716a6d8863275b5271801eacfaad0d, EXPANSION c8152d0751072ed693046ada46f8dbcc93d24aab, AGENTS and continuity/state/log/protocol openings, living proof 10e3d636b345adbcae9ddb91820a3a93f59c93bc. Latest peer 6c92b85b KatoUseN alternative explicitly conditional; 47b619fd normalized primary torsion residual kill conditional; 0810c534 joint fibre loss, source note blob 65d3dafb700180b79e35625c8fc22337ace68005 read in full. Not exhaustive peer audit. Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; latest separately observed 91b273530883b723ef4422436e0dc3557749325a, no source mixing.

## Verification-first result
Actual failed replay 45663493094 (status blob 43a439847e030afb4d5563e30df51399fcbc78d8, return 1) had singleton module exit 0, direct log module parser error |* and sorryAx. Its apparent 9->6 prune is inadmissible. Integration f41c3be3d8ef2c727333f09ceb42b76bb503bb53 repaired the absolute-value syntax without changing mathematics, using pinned original runner/source overlays.
Actual successor CI https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45670987597, status blob 0669c532840ad3a26459a9ac71be41d6f4bc9fb1, 277.66s, returncode 0, utc 2026-11-25T18:07:41Z. Independently fetched run jobs: pick 139405869036, run 139405972693, record 139409215686 all completed success. Fetched actual run job log (38624 characters), containing 'Conditional diagonal analytic bridge checked; arithmetic premise not proved.' Status tail shows all modules exit zero including RH32SingletonPoleData, RH33DirectLogWindow, RhOfRight and RH33DiagonalRoot.
Inspected exact runner diff at f41c3be3: verifies eight named axioms lists subset of {propext, Classical.choice, Quot.sound}, no sorry warnings, 10 bounded scan records with missing=0 and visited=value+noValue, 3 prune outcomes (no-drop or checked bridge), checks generated reduced and original bridge axioms where reductions occur. Thus CI reports success of these gates, not merely baseline success. Individual result.json, scan_bridge_ledger.json, compile logs, overlay blobs and import_dag.json direct contents fetch returned 404 despite status listing them as committed. Do not claim independent inspection of exact per-root scan counts, actual prune outcomes or individual axiom lists. Status lists SHA256 of result.json 0f1b3a7043f7380a9f305e987960b36443afadf7dadbdd5e7fc9e01e30dc2d40; scan_bridge_ledger.json bfc96285b20dcf1398c3354ad55c737b08bf69e130f4185cad053a4afa1c38c2; original import DAG 9252a80c4094145869e93fd6d1eca4aad36eef018a0efb30b353f831c1a5aceb. Preserve original and reduced graphs, actual remaining pending nodes and failed logs in existing records. Baseline statuses 45577239749 and 45576756833 separately retrieved pass. No full Main graph coverage or arithmetic theorem proved.
The conditional theorem Deduction.rh33_rh_of_diagonal takes RHDiagonalWindow as a hypothesis; every b>0 and M>=1 admits eps in (0,b), Y>=M, and G(x)<=x^(1/2+9eps) for all x in [Y,Y^(3/2)]. Its original fixed-epsilon bridge is also checked by the CI runner. No claimed Main theorem imported as shortcut.

## One cross-lane correction at the actual consumer (not another RH criterion)
Sources: pinned src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean 878f5077bc382426c7da988e5a375b85deeaa7de, CharacterBalanceMoves.core and sum_Th inspected; PrimitiveCosets/CoreGm.lean 3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d, core_gm inspected (native hBr>=0). The living proof section 2 uses a nonnegative original Err. Integration 0810c534 replaces this locally by a SIGNED K+J on the SAME host; its displayed direct substitution into the height-shift inequality needs a sign guard. The original route via a nonnegative Err with K+J<=Err is unaffected.

Use F_*(y)=G(y)+g01(y)-g10(y)-g11(y), not the fibre loss F(v). Let Q,d>0 as in the native Fourier consumer, y_t=a(t)/b in [x,x+1] from same ChainTied, x>=3, TT nonempty, and B=K+J. The signed Fourier inequality from 0810c534, with all retained hypotheses, gives mean F_*(y_t)<=E=2B/(Qd)+4/(xd). Native nonnegative four-mode prime-power coefficients yield monotonicity of F_*(y)/y+log y. Denote mean y_t by ybar. For each t, F_*(y_t)>=y_t(F_*(x)-1)/x, using log(y_t/x)<=1/x. Averaging and dividing by ybar>0 proves EXACT SIGN-SAFE TRANSFER:
    F_*(x) <= 1+(x/ybar)*E.
Consequently with native -J_character(x)<=3*x^(1/2+eps),
    G(x)<=1+3*x^(1/2+eps)+E,               E>=0;
    G(x)<=1+3*x^(1/2+eps)+x/(x+1)*E,       E<0.
Equivalently add max(E,x/(x+1)*E) to the constant/character terms. No need to assume E>=0, no separate representatives or norms before cancellation. Or simply use max(E,0) if a nonnegative final budget suffices. If the arithmetic producer proves E<=a known nonnegative target T, the original asymptotic consequence is unchanged since (x/ybar)*E<=T. This corrects only a local direct substitution; does NOT invalidate the original positive Err proof, nor prove the signed budget. Keep all same-host and SigALe obligations.

Negative control for the logical sign step (NOT a claimed native host or prime computation): x=3, one y=4, F_*(z)=-2z on [3,4], E=-8. F_*(z)/z+log z is increasing, mean F_*(y)=E. F_*(3)=-6 exceeds E+1=-7, but is <=1+3E/4=-5. Hence discarding x/ybar when E<0 is not licensed by these premises alone.

Executed exact integer checks in connector JS (not Lean; scalar identity only):
```js
let n=0,bad=0;
for(let x=3n;x<=60n;x++)for(let j=0n;j<=4n;j++)for(let e=-40n;e<=40n;e++){
 const y=4n*x+j,lhs=4n*x*e;
 if(e>=0n){if(lhs>e*y)throw Error("positive")}
 else{if(lhs*(x+1n)>x*e*y)throw Error("negative")}
 if(lhs>e*y)bad++;n++;
}
console.log(n,bad);
```
Actual output 23490 checks, 9280 violations of the unsigned substitution across negative cases. Proof above is independent of finite checks. No new native proof of the sign-corrected scalar bridge, no URT gain. Executable native follow-up can use the existing engines and the two branches mul_le_mul_of_nonneg_right / mul_le_mul_of_nonpos_right with x/ybar in [x/(x+1),1]; inspect actual caller after joint-loss integration. Cache key includes pin, same host, TT, y_t, signed E and sign, not just theorem name. Original fallback via nonnegative Err preserved. No mathematical upstream leaf closed.

RESUME HERE: integration/editor should adopt the CI-checked conditional diagonal endpoint (retrieve raw scan/bridge artifacts if accessible) and sign-safe direct joint-budget height transfer, or retain original nonnegative Err majorant. Landau analytical endpoint needs no further rewrite. At actual core_gm and ChainTied, trace which producer supplies the nonnegative target upper bound for E on complete native windows; coordinate with geometry/arithmetic to establish same-host VWinAt(1,401), uniform full-length estimates, ranks, entropy and local gain. No assumption that the joint bound already holds.
HANDOFF TO integration, audit, kernel, geometry, arithmetic, editor. RH OPEN.
