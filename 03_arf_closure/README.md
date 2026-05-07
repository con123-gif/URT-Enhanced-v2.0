# 03 — ARF Closure: δ★ → All of Physics

## The Analytic Residue Function (ARF)

The ARF bridges the geometric constant δ★ to every measured particle physics constant.
Four residues are *solved* (not fitted) at the fixed point:

```
Δδ      = −(1/6)  · (δ★/π)²          →  vacuum fine-tuning
C_mass  =  30     · δ★                →  mass scale
R_α     =       1 · δ★²·φ·(1−δ★/4)   →  EM coupling correction
R_mass  = −(33/2) · δ★                →  hadronic mass correction
```

The coefficients 1/6, 30, 1, 33/2 satisfy closure conditions — they are fixed by requiring that the ARF maps δ★ back to itself. No free parameters.

## Predictions vs observation

| Constant | Predicted | Observed | Error |
|----------|-----------|----------|-------|
| 1/α (fine structure) | **137.035999** | 137.035999084 | < 0.001% |
| m_p/m_e | **1836.1524** | 1836.15267 | < 0.001% |
| m_μ/m_e | **206.769** | 206.768 | < 0.001% |
| m_τ/m_μ | **16.817** | 16.817 | < 0.001% |
| sin²θ_W | **0.2312** | 0.2312 | < 0.001% |
| α_s(M_Z) | **0.11801** | 0.1179 | 0.01% |
| Ω_m | **0.3077** | 0.3111 | 1.1% |
| Ω_Λ | **0.6923** | 0.6889 | 0.5% |
| η_B | **6.14×10⁻¹⁰** | ~6.1×10⁻¹⁰ | ~0.7% |
| n_s | **0.9667** | 0.9649 | 0.2% |

All from N=13, D=3, V=12, E=30, F=20, q=5, G=60.

## Notebooks (chronological development)

| File | Content |
|------|---------|
| `arf_residue_closure_v1.ipynb` | First ARF fixed-point derivation |
| `arf_constants_closure_v2.ipynb` | Extended to all lepton masses |
| `arf_constants_closure_v3.ipynb` | Neutrino sector added |
| `arf_cathedral_monolith.ipynb` | Complete analytic monolith — all constants, one notebook |
| `arf_closure_v4.ipynb` | RG-corrected closure |
| `arf_closure_v5.ipynb` | Cosmological sector |
| `arf_closure_v6.ipynb` | Neutrino masses and PMNS matrix |
| `arf_closure_v7.ipynb` | Axion mass prediction |
| `arf_closure_v8_final.ipynb` | Final frozen closure — canonical reference |

## Frozen snapshot

`../analytic_snapshot_2025_12_05/` contains JSON snapshots of all ARF residues and
predictions frozen at 5 Dec 2025. Use this for reproducibility checks.
