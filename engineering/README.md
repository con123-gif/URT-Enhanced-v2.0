# Engineering

Applied URT work lives here so engineering evidence stays separate from claims about fundamental physics.

## Areas

### Chaos lab
`chaos_lab/`

Merged from the former `lytolllis-chaos-lab` repository. Contains:
- bounded-chaos / URT control code;
- plasma surrogate experiments;
- DKY / relaxation-time notebooks;
- URT control application notebooks.

### Additional engineering tracks

The research archive also contains work on:
- EEG / seizure early warning;
- sensing / Golden Frame;
- fusion / tungsten / materials;
- vortex-flow control;
- inverse design and constrained optimization.

As these branches mature, reusable engineering code should move here while raw exploratory artifacts remain in `research_archive/`.

## Validation rule

Engineering success is evaluated independently of the fundamental-physics programme. Prefer blind tests, held-out targets, reproducible baselines and explicit failure reporting.

## URTF analytical algorithm and Cathedral Symmetry Compiler

[URTF–Cathedral Symmetry Compiler](urtf_symmetry_compiler/README.md) — a reusable finite mathematical tool specialized to the existing original URT O(N) boundary-cascade programme. Original URT's pi/e scaling, golden-angle phase and one-pass recursion **predate** the 15 October 2026 compiler. This implementation adds proper-A5 representation reduction, cubic Cayley–Hamilton inverse formulas, Woodbury corrections, a 64-cell test suite and nearest-stage O(number of stages) direct coupling. Results, dependencies, and reproducibility instructions are all committed in that folder. No universal optimization or complete physical-action claim is made.

## URT Mathematics Direct Solver and Structure Engine (15 October 2026)

[URT Mathematics & Structure-Compiled Computing](urt_math_direct_solver/README.md) now contains the prior harmonic O(N) direct solver, mathematical stress report, numerical evidence and a new cross-domain problem dispatcher. It supports low-rank harmonic interactions, block-local differential operators, coupled local-plus-global resonances, linear oscillator networks, and a restricted nonlinear quartic reduction, each with numerical residual checks and labelled complexity. Ten independent local tests passed; arbitrary unstructured inputs use a labelled fallback. The original URT O(N) recursion predates this new software extension. Broad applicability is an engineering objective, **not** a proven universal exact optimizer.
