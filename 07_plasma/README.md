# 07 — Plasma: Tokamak and MHD Stabilisation

## What URT does to plasma

Uncontrolled tokamak plasma grows: norm 1.0 → 1.35+ in simulation.
With URT control on the magnetic coils: norm 1.0 → 0.3–0.5 (50–70% damping).
Resonant kink modes are suppressed. Drift-wave instabilities are killed.
Cost: O(N) computation — real-time capable on embedded hardware.

## Control architecture

```
Plasma state vector x(t)  [density, velocity, magnetic field perturbations]
          ↓
Measure δ(x) using urt_operator(x)
          ↓
If δ ≠ δ★: apply URT correction u = −κ·(δ − δ★)·∇H
          ↓
Coil currents updated at each timestep
```

The URT controller doesn't need a plasma model — it only needs the δ signal.

## Simulation hierarchy

| Type | Notebooks | Physics |
|------|-----------|---------|
| Toy MHD | `tokamak_urt_colab.ipynb`, sandbox v1–v4 | Linear MHD-inspired ODE |
| 3D PIC | `enhanced_3d_plasma_pic_urt.ipynb`, `pic_plasma_urt_stabilization.ipynb` | Particle-in-cell, Cloud-in-Cell, Boris pusher |
| RMHD | `urt_rmhd_clean_core.ipynb`, `urt_rmhd_super_cell.ipynb` | 2D reduced-MHD vorticity |
| Full MHD | `urt_3d_full_mhd_engine.ipynb` | 3D compressible MHD |
| Real data | `lapd_plasma_turbulence_delta.ipynb` | LAPD/UCLA turbulence data |
| HW2D | `hw2d_plasma_urt_sim.ipynb` | Hasegawa–Wakatani 2D drift-wave |

## Key results

- **Mode suppression**: 70–95% reduction in kink mode amplitude vs. uncontrolled
- **Convergence**: All configurations converge to δ★ attractor
- **LAPD validation**: δ metric consistent with real UCLA plasma turbulence data

## Notebooks

| File | Content |
|------|---------|
| `plasma_adaptive_urt_v1.ipynb` | First adaptive URT plasma demo |
| `plasma_urt_simplified.ipynb` | Simplified resonant mode damping |
| `tokamak_urt_colab.ipynb` | Standard Colab tokamak demo |
| `plasma_3d_simulator_urt.ipynb` | 3D field confinement and turbulence suppression |
| `enhanced_3d_plasma_pic_urt.ipynb` | 3D electrostatic PIC with multi-component URT |
| `tokamak_3d_mhd_4coil.ipynb` | 4-coil actuator system |
| `pic_plasma_urt_stabilization.ipynb` | FFT Poisson solver + URT adaptive control |
| `turbulent_plasma_drift_wave.ipynb` | Drift-wave instability generation and suppression |
| `enhanced_plasma_cic_boris.ipynb` | Cloud-in-Cell deposition, Boris pusher |
| `enhanced_3d_plasma_v2/v3.ipynb` | Progressive improvements to 3D plasma physics |
| `fusion_tokamak_coil_control.ipynb` | 4-coil harmonic mode suppression |
| `tokamak_mhd_v2/v3.ipynb` | MHD-inspired v2/v3 with advection and diffusion |
| `plasma_3d_isosurface_renderer.ipynb` | 3D isosurface visualisation |
| `tokamak_mhd_sandbox_v1–v4.ipynb` | Iterative sandbox development |
| `urt_mhd_lcft_plasma_demo.ipynb` | LCFT field theory applied to plasma |
| `urt_rmhd_clean_core.ipynb` | 2D RMHD vorticity with URT |
| `urt_rmhd_super_cell.ipynb` | Super-cell RMHD |
| `urt_3d_full_mhd_engine.ipynb` | Full 3D compressible MHD engine |
| `lapd_plasma_turbulence_delta.ipynb` | Real LAPD UCLA turbulence data analysis |
| `hw2d_plasma_urt_sim.ipynb` | Hasegawa–Wakatani simulation |
