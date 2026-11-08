# URT full-state algorithm — actual prototype upgrade (2026-11-08)

The original `cathedral_core/urt.py` scalar `urt_step` is retained unchanged and remains available. **The new executable entry point is `native_urt_engine()`**; this is a real numerical state update, not a retrospective audit.

It operates on the existing **190 all-five Platonic cochains × 24 clock sites**, injects all **50 vertices** through the original **50→8→12** portal, retains native **64** six-bit histories through exact conditional Gaussian minimisation, implements the **charge-one and charge-two covariant clock links** and frozen `π/e`, `2π/φ²`, `Δ`, `η`, evaluates the **source-responsive Gibbs free energy**, and takes an accepted action-decreasing gradient step. No default controller values `alpha`, `beta` or `theta_h` appear in this full-state update.

```python
from cathedral_core.urt import native_urt_engine
import numpy as np

engine = native_urt_engine()
rng = np.random.default_rng(20261108)
state = engine.new_state((rng.standard_normal((24,190)) + 1j*rng.standard_normal((24,190)))*.035)
for _ in range(10):
    outcome = engine.update(state)
    state = outcome.state
    print(outcome.energy_before, outcome.energy_after)
# state.y has 24×64 complete native signed-history amplitudes.
```

Alternatively, `engine.relax_history(state, y, dt)` applies the **exact** fixed-source positive 64-history semigroup, including the 24-track charge-two coupling, without numerically approximating its exponential. `engine.gauge_transform` implements the exact local U(1) rephasing; `engine.reduced_energy_and_gradient` exposes the action and real complex-coordinate gradient, allowing independent physical-model changes without burying them in a controller constant.

**Verification:** the companion `tests/test_native_urt.py` runs the original 7 November archived implementation as a reference, checks numerical derivative against independently derived analytic gradient, U(1) local gauge covariance of action/gradient/full history, full 64-history semigroup composition, and monotone action reduction over five iterations. The original separate Markov-history diffusion and 24-clock/golden-angle results remain intact and reusable.

**Scope:** this is an executable implementation of the *already constructed* source-loaded finite Cathedral, and an improved controller that acts on its full state. It does **not** claim that gradient descent is uniquely selected as microscopic physical time evolution. The archived source remains the authority for the underlying model. Dependencies beyond baseline numpy: scipy and mpmath, inherited from that source.