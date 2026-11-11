# Q20 — native signed-dictionary fourth-cumulant collision (2026-11-11)

**Result:** OBSTRUCTION — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.

## Statement

For the native icosahedral hidden-5 quartic face source and the five exact A4
projector lines, with the fixed 64-history binary chronology
\(Qf(h)=(f(2h\bmod64)+f(2h+1\bmod64))/2\), consider the signed dictionaries

\[
D=(0,2,4,6,8,10),\qquad E=(0,2,8,10,7,4).
\]

For each vacuum line \(t\), let \(r_2=\langle t,t\rangle\) and let
\(K_n\) be the stationary n-th cumulant rate of the tilted Q transfer
with source \(g_t(h)=\langle t,S(D(h))\rangle\). The joint
sign/scale-independent invariants
\[
I_2=K_2/r_2,\quad I_3=K_3^2/r_2^3,\quad I_4=K_4/r_2^2
\]
have **identical five-vacuum multisets** for D and E, including the
matching between the three invariants on each vacuum. These are the
non-parity-distinct proper-A5 classes identified by Q15. Thus fourth
order does not resolve this *specific* signed chronology ambiguity.

## Exact certificate values (both dictionaries)

The two distinct rows with \(I_2=33/16\) are distinguished by their
\(I_3\) values.

| I2 | I3 | I4 |
|---|---|---|
| 5/6 | 6591161/3072000 + (34727/128000)√5 | 7547/900 + (447/200)√5 |
| 25/24 | 4823127/1024000 − (41811/256000)√5 | 280439/28800 + (1503/800)√5 |
| 67/48 | 1535489/768000 − (55499/64000)√5 | 19163/57600 + (103/50)√5 |
| 33/16 | 32876847/1024000 + (1089909/256000)√5 | 552571/19200 + (15201/1600)√5 |
| 33/16 | 36030987/1024000 + (341847/128000)√5 | 502531/19200 + (17631/1600)√5 |

## Proof and execution

The registered script `native_k4_collision.py` loads the **original**
`2026-11-10_signed_a5_covariance/signed_a5_covariance.py` (the
icosahedral face-vertex incidence, hidden P5 projector, five A4 singlet
lines, and native quartic face source) and the **original**
`2026-11-10_urt_arf_forward/new_gate/URT_NATIVE_Q6_TILTED_TRANSFER_ALL_CUMULANTS_2026_11_10.py`
(Poisson/Taylor recursion). The six signed bit positions are
reindexed exactly by Q12's dictionary convention; Q itself is not
reordered. All computations use exact rational pairs in Q(√5).

The script checks (1) both dictionary sources have zero mean,
(2) both share the entire joint I2–I3 multiset, (3) the entire joint
I2–I3–I4 multiset is equal, and (4) independently for each of ten
vacuum/dictionary combinations, the 25-step minus 24-step **finite-time**
fourth cumulant equals the stationary K4 from the Poisson recursion.
Every assertion is fail-on-error.

Local run: Python 3.11 / SymPy 1.14.0 / NetworkX 3.6.1;
`python research_archive/2026-11-11_native_k4_collision/native_k4_collision.py`,
exit 0, 9.81 seconds, exact 10/10 finite-time checks. Due to unavailable
direct GitHub DNS in the local container, the local run used a faithful
reconstruction of Q11's native source definitions (omitting only Q11's
unrelated full-group covariance assertions) and of the Q6 cumulant core.
The committed Q20 script instead imports the original repository files;
GitHub CI is responsible for the verbatim-source rerun.

No measured data, fitted constants or historical ARF target values were
used. This is an exact finite native-source statement only. It does not
prove that all orders collide, select a physical chronology, or derive
any of the four ARFs.

**Next question (Q24):** Does K5 separate this same pair, or is there
an exact tilted-transfer conjugacy accounting for the persistence?
