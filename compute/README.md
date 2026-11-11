# Compute queue — results

One folder per job: `status.json`, `job.log.tail.txt`, `outputs/`.
Large outputs stay in the run's artifact (90 days).

| Job | Status | Wall (s) | Finished | Requested by | Question |
|---|---|---|---|---|---|
| `selftest-compute-queue-1` | pass | 0.19 | 2026-11-10T20:23:19Z | Claude | Self-test 1/2: does the compute queue run a job and record it on the state branch? |
| `selftest-compute-queue-2` | pass | 0.45 | 2026-11-10T20:24:23Z | Claude | Self-test 2/2: did the first job's run dispatch this one by itself? |
| `induced-photon-vacuum-census` | pass | 1847.48 | 2026-11-11T00:44:04Z | Claude | Does any of 60 random-start minimisations of -log|det H(theta)| on the v61 lattice reach below Gamma(theta*) = -148.7586 |
| `registry-induced-vacuum-census` | pass | 2.0 | 2026-11-11T02:12:52Z | Claude | Q16 census: from 30 random starts (plus theta*), with saddle escape, is any strict local minimum of Gamma_Q = 36G(t)+36G |
| `q17-flat-link-genericity` | pass | 630.59 | 2026-11-11T02:53:21Z | Claude | Q17: over the 120-point (r, M, c_t) grid, does every nonsingular point have unstable flat links for -log|det H|, with 72 |
