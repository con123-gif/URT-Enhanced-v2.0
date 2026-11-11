# Q16 — the induced vacuum of the full 96-state charge registry (2026-11-11)

Status: CONDITIONAL (declared premise) / numerical certificate — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.
Certificate: `REGISTRY_INDUCED_VACUUM_2026_11_11.py` (check `research.registry_induced_vacuum`, 3 random starts; compute
job `registry-induced-vacuum-census`, 30 starts). Executed in Claude's sandbox with 2 random starts.

**Premise (a choice, not archived).** Each registry state s carries the archived v61 operator with link phases scaled by
c_s = 3q_s. Q4 showed the archive defines no other join of registry and lattice.

**Results.**
1. Charges in units of 1/3: ±1 (18 each), ±2 (18 each), ±3 (6 each), 0 (12); Σc² = 288 = 9 Tr Q96².
2. Charge conjugation: |det H(−θ)| = |det H(θ)| (to 7e-14), so Γ_Q = 36G(θ) + 36G(2θ) + 12G(3θ) + const, G = −log|det H|.
3. θ = 0 is a saddle: Hessian 288 Π(0), 72 unstable physical modes (as for one charge).
4. The single-charge vacuum θ* is not stationary for Γ_Q (physical gradient 301.4).
5. From θ*, descent passes two saddles (19 and 1 unstable modes, Γ_Q = −10666.878 and −10679.520) and ends at a strict
   local minimum: Γ_Q = −10679.896670, 6508.96 below flat links, physical gradient 7e-13, physical Hessian in
   [0.0094, 290.4]. Two random starts end at higher local minima (−10163.80, −10146.12).
6. The minimum is not a one-parameter flux family: triangle fluxes/π ≈ 0.00016, 0.00076, 0.4986, 0.9214; four-cycles fall
   into 18 classes (near 0, 0.42, 0.50, 0.58, 0.92, 0.996).
Census evidence only; the lowest point found is not claimed to be the global minimum.

**Maxwell test (answered, `REGISTRY_MAXWELL_TEST_2026_11_11.py`).** The physical Hessian at the registry vacuum is not
proportional to any loop-flux form: residual 86.3 % (triangles), 88.1 % (four-cycles), 88.0 % (both); the generalized
coupling spectrum spans 0.078–18.1 (triangles) and 0.0024–1.06 (both). As for one charge at θ*, the v61 lattice with the
full registry defines no photon coupling, and nothing near 137.
