# Newton's Cathedral / URT

**Canonical research repository — reconstructed 30 September 2026**

This repository contains the full working record of the URT / Newton's Cathedral program: the canonical mathematics, the active physics construction, the audit trail, the verification code, the failed and superseded branches, the Navier–Stokes/vortex program, and the downstream engineering work.

The repository no longer treats the May/June 2026 "D=3 -> all observables" scripts as the current theory. Those files remain part of the historical record, but later audits changed the evidentiary status of several claims.

## Current causal spine

```text
raw possibility / chaos
    ->
URT selection / piecewise contraction
    ->
bounded history-dependent response
    ->
independent symmetry + Hodge reduction
    ->
5 -> 4 -> 3 -> 12 -> 13
    ->
finite 13-site / A4-A5 algebra
    ->
81 = 80 + 1 closure
    ->
dual rails d_* and d_cl
    ->
master state rho_*
    ->
entropy / Kubo-Mori geometry
    ->
one 16-dimensional geometry + gauge carrier
    ->
gravity + gauge + matter response
    ->
continuum interpretation and external tests
```

URT and entropy play different roles:

- **URT is the selection principle** on admissible histories.
- **Entropy is the physical/information geometry** of the selected history.
- Entropy does not replace URT.

## Canonical equations

The original URT spiral law is

[
r_{k+1}=(pi/e)r_k,qquad
	heta_{k+1}=	heta_k+2pi/phi^2.
]

The historical bounded-response recursion is

[
P_{k+1}=eta[alpha(P_k-	heta_Harphi(P_k))+u_k],
]

with bounded branch nonlinearity (arphi). For the archived canonical numerical values
(alpha=1.155,eta=0.235,	heta_H=2.4), the fibre is piecewise contractive away from branch-switching surfaces.

The canonical rail sector is

[
gamma=1/81,qquad
d_star={(1-gamma)piover 13phi},
qquad
d_{m cl}=3/20,
qquad
Delta=d_{m cl}-d_star.
]

The master entropy/information state is

[
ho_star={I_4oplusDelta^2 I_4over 4(1+Delta^2)}.
]

The 16-dimensional response carrier is

[
16=4_goplus1_Yoplus3_Woplus(3'oplus5)_C.
]

## Status discipline

Every nontrivial result should be read with a status:

- **EXACT** — theorem / identity / rank / spectrum for explicitly defined objects.
- **NUMERICAL** — independently computed numerical certificate.
- **CONDITIONAL** — theorem under stated hypotheses.
- **CANDIDATE PHYSICS** — mathematically defined mapping whose physical identification is not yet independently closed.
- **NO-GO / FALSIFIED** — failure of a specified construction under specified assumptions.
- **SUPERSEDED** — retained only for provenance.
- **OPEN** — unresolved.

A no-go is local to its assumptions. It is not automatically a no-go for the whole multiplex Cathedral machine.

## Important audit corrections

The September 30 archive audit retired the following as independent evidence:

- forced-(delta) 20K / 5.4K collapse experiments whose controller steered toward the target;
- PCA as proof of intrinsic five-dimensionality;
- seeded icosahedral "emergence";
- threshold-tuned random-cloud decoding as proof of URT-specific icosahedral emergence;
- frozen Standard Model/cosmology values later reused as if they were fresh predictions;
- circular terminal-wall flavour/mass closures;
- the old four-gate alpha/RG normalization route.

The later 5D ambient-manifold construction, exact 13-site algebra, 81=80+1 closure, entropy/BKM construction, gauge carrier, and gravity program must stand on their own derivations.

## Repository map

- `cathedral_core/` — compact current implementation of the canonical finite machine.
- `docs/` — canonical state, claim ledger, project map, provenance rules.
- `research_archive/` — chronological research corpus and verification outputs.
- `legacy/` — older public-package framing retained for provenance.
- `newtons_cathedral/` — original public package; historical until reconciled module-by-module.
- `tests/` — legacy tests plus new canonical tests.

See `docs/CANONICAL_STATE_2026-09-30.md` first.

## Current frontier

The main unresolved physics problems are not the existence of the finite carrier but the final physical identifications:

1. derive a unique continuum gravitational normalization from the entropy/BKM state;
2. derive the absolute gauge/current normalization without reintroducing a free scale;
3. close flavour masses/mixings without circular use of observed targets;
4. finish the unforced Navier–Stokes/vortex program as a theorem or explicit counterexample;
5. move engineering branches to independent blind validation.

## Repository branch

This reconstruction is staged on:

`cathedral-full-project-2026-09-30`

It is intended to replace the outdated May/June top-level framing after review.
