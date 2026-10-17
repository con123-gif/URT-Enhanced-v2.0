#!/usr/bin/env python3
"""Target-free checks of the recovered v61 physical binding.

This does not change the canonical model or consume observed values.  It traces
the actual response dependencies and computes the nonzero bulk wall poles,
which are distinct from its zero-frequency endpoint Schur operator.
"""
from __future__ import annotations

import ast
from decimal import Decimal, localcontext
import hashlib
import importlib.util
import json
import math
from fractions import Fraction
from pathlib import Path
import sys

import numpy as np

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "canonical_sources/Cathedral/Newton_Cathedral_Full_v61.py"
OUT = Path(__file__).resolve().parent


def load_source():
    spec = importlib.util.spec_from_file_location("canonical_binding_v61", SOURCE)
    model = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = model
    spec.loader.exec_module(model)
    return model


def source_trace():
    raw = SOURCE.read_text()
    tree = ast.parse(raw)
    functions = {n.name: n for n in tree.body if isinstance(n, ast.FunctionDef)}
    selected = ["universal_response_law_certificate", "response_flavour_certificate",
                "response_mass_certificate", "response_couplings_certificate",
                "response_yukawa_matrices", "effective_ir_dirac_certificate",
                "microscopic_response_wall_certificate", "explicit_local_hamiltonian_certificate",
                "operational_observable_dictionary_certificate"]
    rows = {}
    for name in selected:
        if name not in functions:
            continue
        fn = functions[name]
        calls = sorted({n.func.id for n in ast.walk(fn)
                        if isinstance(n, ast.Call) and isinstance(n.func, ast.Name)
                        and n.func.id in functions})
        rows[name] = {"line_start": fn.lineno, "line_end": fn.end_lineno,
                      "canonical_function_dependencies": calls}
    needles = ["inverse = 137.0 +", "s_q12 =", "s_q23 =", "s_q13 =", "j_q =",
               "mixing_holonomy = np.block", "links = attenuation_links + [-mixing_holonomy]",
               "e_squared = 4.0 * math.pi / response_couplings", "response_yukawa =",
               '"gY_squared":', '"g2_squared":', '"g3_squared":']
    lines = raw.splitlines()
    anchors = [{"line": i + 1, "code": line.strip()} for i, line in enumerate(lines)
               if any(needle in line for needle in needles)]
    return {"source_sha256": hashlib.sha256(SOURCE.read_bytes()).hexdigest(),
            "function_graph": rows, "coefficient_anchors": anchors,
            "flavour_dependency_direction": ["frozen D,V,N,E,F,q,h,phi,Delta,gamma",
                "response_flavour_certificate (declared route coefficients)",
                "response_yukawa_matrices (terminal holonomy)",
                "microscopic_response_wall_certificate (local Schur reconstruction)",
                "explicit_local_hamiltonian_certificate", "interacting spectral observables"],
            "electromagnetic_dependency_direction": ["Delta",
                "137+(17572/1215)*Delta-(9/65)*Delta**2",
                "e_squared=4*pi/alpha_root_inverse", "gY_squared,g2_squared", "H_local"],
            "no_observed_mass_mixing_or_alpha_used_in_this_calculation": True}


def wall_poles(model):
    # These are EXACT same primitive link factors in the recovered executable.
    wall = model.microscopic_response_wall_certificate()
    results = {}
    for name, entry in wall["primitive_paths"].items():
        with localcontext() as ctx:
            ctx.prec = 130
            values = [Decimal(str(v)) for v in entry["factors"]]
            values += [Decimal(1)] * (12 - len(values))
            product = math.prod(values)
            # Sturm pivots of K K^T: a positive Jacobi matrix. Bisection does
            # not square tiny singular values in machine precision.
            diag = [r*r+(1 if i<11 else 0) for i,r in enumerate(values)]
            offdiag = [-values[i+1] for i in range(11)]
            def sturm_count(x):
                pivot = diag[0]-x
                count = int(pivot<0)
                for i in range(1,12):
                    if not pivot:
                        pivot = Decimal("1e-120")
                    pivot = diag[i]-x-offdiag[i-1]**2/pivot
                    count += int(pivot<0)
                return count
            lo,hi = Decimal(0),product*product
            assert sturm_count(lo)==0 and sturm_count(hi)>=1
            for _ in range(360):
                mid = (lo+hi)/2
                if sturm_count(mid):
                    hi=mid
                else:
                    lo=mid
            gap = ((lo+hi)/2).sqrt()
            eigenvalue_enclosure = [str(lo),str(hi)]
        # The full 13-wall A has one unused zero row and column per channel.
        # Removing them leaves K: diagonal -r_i and superdiagonal 1.
        kn = -np.diag([float(v) for v in values])+np.diag(np.ones(11),1)
        # Left terminal and right initial physical endpoint coordinates.
        d = np.block([[np.zeros((12, 12)), kn], [kn.T, np.zeros((12, 12))]])
        external = np.array([11, 12])
        internal = np.array([i for i in range(24) if i not in external])
        d_ee = d[np.ix_(external, external)]
        d_ei = d[np.ix_(external, internal)]
        d_ii = d[np.ix_(internal, internal)]
        inverse = np.linalg.inv(d_ii)
        schur = d_ee - d_ei @ inverse @ d_ei.T
        z_kin = np.eye(2) + d_ei @ inverse @ inverse @ d_ei.T
        approximate_gap = float(product) / math.sqrt(float(np.linalg.det(z_kin)))
        results[name] = {
            "primitive_factors": entry["factors"],
            "response_mass_product": float(product),
            "actual_bulk_wall_lowest_positive_gap": float(gap),
            "actual_gap_130_digit_decimal": str(gap),
            "Sturm_squared_gap_enclosure": eigenvalue_enclosure,
            "gap_over_response_product": float(gap / product),
            "endpoint_schur_offdiagonal_abs": float(abs(schur[0, 1])),
            "zero_energy_schur_relative_residual":
                float(abs(abs(schur[0, 1]) - float(product)) / float(product)),
            "endpoint_kinetic_Z": z_kin.tolist(),
            "linear_energy_expansion_gap": approximate_gap,
            "linear_expansion_relative_error": approximate_gap / float(gap) - 1,
            "kinetic_Z_positive": bool(np.min(np.linalg.eigvalsh(z_kin)) > 0),
            "gap_enclosure_relative_width": float((hi-lo)/(gap*gap)),
            "precision_scope": "Decimal Sturm computation for decimal representations of the frozen binary64 link factors; not an interval certificate for transcendental exact primitive values",
        }
    top_gap = results["t"]["actual_bulk_wall_lowest_positive_gap"]
    for name, result in results.items():
        normalized = result["actual_bulk_wall_lowest_positive_gap"] / top_gap
        result["actual_gap_ratio_to_top"] = normalized
        result["ratio_to_response_mass_ratio"] = normalized / result["response_mass_product"]
    checks = {
        "all_twelve_species_computed": len(results) == 12,
        "all_kinetic_Z_positive": all(r["kinetic_Z_positive"] for r in results.values()),
        "all_zero_energy_schur_relative_residuals_below_1e_13":
            max(r["zero_energy_schur_relative_residual"] for r in results.values()) < 1e-13,
        "actual_wall_mass_ratios_differ_from_endpoint_response_mass_ratios":
            abs(results["e"]["ratio_to_response_mass_ratio"] - 1) > 1,
        "top_gap_closed_form_2_sin_pi_over_50":
            abs(top_gap - 2*math.sin(math.pi/50)) < 1e-14,
        "unused_chiral_zero_modes_in_displayed_Dwall": 48,
    }
    assert all(v for k, v in checks.items() if isinstance(v, bool))
    return {"species": results, "checks": checks,
            "exact_effective_operator": "D_eff(z)=D_EE+D_EI(z I-D_II)^-1 D_IE",
            "kinetic_Z": "I+D_EI D_II^-2 D_IE",
            "scope": "literal free v61 displayed D_wall; not full gauge/Higgs interacting H_local",
            "consequence": "The zero-energy Schur identity alone does not establish physical pole-mass equality.",
            "no_canonical_coefficient_changed": True}


def currents(model):
    matrices = model.response_yukawa_matrices()
    masses = matrices["mass_diagonal"]
    yl = matrices["Y24"] / masses[None,:]
    flavour = model.response_flavour_certificate()
    quark = yl[:9,:9].conj().T @ yl[9:18,9:18]
    lepton = yl[18:21,18:21].conj().T @ yl[21:24,21:24]
    hypercharge = [Fraction(1,6)]*6+[Fraction(2,3)]*3+[Fraction(-1,3)]*3+[Fraction(-1,2)]*2+[Fraction(-1),Fraction(0)]
    t3 = [Fraction(1,2)]*3+[Fraction(-1,2)]*3+[Fraction(0)]*6+[Fraction(1,2),Fraction(-1,2),Fraction(0),Fraction(0)]
    em = [y+t for y,t in zip(hypercharge,t3)]
    trace_y2 = sum(y*y for y in hypercharge)
    trace_t2 = sum(t*t for t in t3)
    trace_yt = sum(y*t for y,t in zip(hypercharge,t3))
    trace_q2 = sum(q*q for q in em)
    assert (trace_y2,trace_t2,trace_yt,trace_q2)==(Fraction(10,3),Fraction(2),Fraction(0),Fraction(16,3))
    couplings = model.response_couplings_certificate()
    e2 = 4*math.pi/couplings["alpha_root_inverse"]
    weak = couplings["IR_response"]["sin2_theta_W"]
    gy2,g22 = e2/(1-weak),e2/weak
    photon_inverse = 1/gy2+1/g22
    checks = {
        "free_endpoint_CKM_residual": float(np.max(abs(quark-np.kron(flavour["quark"]["CKM"],np.eye(3))))),
        "free_endpoint_PMNS_residual": float(np.max(abs(lepton-flavour["lepton"]["PMNS"]))),
        "normalized_endpoint_left_frame_residual": float(np.linalg.norm(yl.conj().T@yl-np.eye(24))),
        "one_generation_trace_Y_squared": str(trace_y2),
        "one_generation_trace_T3_squared": str(trace_t2),
        "one_generation_trace_Y_T3": str(trace_yt),
        "one_generation_trace_Q_squared": str(trace_q2),
        "parent_trace_relative_sin_squared": str(trace_t2/(trace_y2+trace_t2)),
        "Hlocal_response_relative_sin_squared": weak,
        "Hlocal_photon_bare_inverse_equals_supplied_e_inverse_residual": abs(photon_inverse-1/e2),
        "Hlocal_photon_bare_alpha_inverse": 4*math.pi*photon_inverse,
        "physical_alpha_current_hessian_equality_independently_proved": False,
        "current_U1_absolute_norm_not_inferred_from_relative_trace": True,
    }
    assert checks["free_endpoint_CKM_residual"]<1e-12
    assert checks["free_endpoint_PMNS_residual"]<1e-12
    return checks


def main():
    model = load_source()
    report = {"trace": source_trace(), "literal_wall_poles": wall_poles(model),
              "literal_endpoint_currents_and_charge_traces": currents(model),
              "remaining_primitive_binding_equalities": {
                  "flavour": "U_response=U_hist/Hopf (Oct5 A->R map is retained; its spectra/current residues must be used)",
                  "electromagnetic": "Hessian of the electron-normalized pre-response source-dependent transfer = alpha_root_inverse/(4*pi) in a specified curvature/cell chart",
                  "wall_physical_gaps": "Full gauge-projected interacting transfer gaps and current residues, including energy-dependent Schur kinetic normalization, equal the proposed response outputs",
              },
              "nature_established_by_this_audit": False,
              "Hamiltonian_scope": {
                  "source_HF": "dGamma(gamma5 D_W tensor I+I tensor D_wall)+H_Y",
                  "commuting_Kronecker_summands": True,
                  "spectrum_before_HY": "eigen(gamma5 D_W)+eigen(D_wall)",
                  "physical_Hlocal_poles_computed_here": False,
                  "necessary_full_audit": "Recover entrywise v54 spinor/wall/Higgs/mirror placement and source vertices, then evaluate gauge-projected transfer poles. Do not substitute Dwall singular values for those poles.",
              },
              "measurement_inputs": []}
    (OUT/"binding_audit_results.json").write_text(json.dumps(report,indent=2))
    rows = []
    for name,r in report["literal_wall_poles"]["species"].items():
        rows.append(f"| {name} | {r['response_mass_product']:.12g} | {r['actual_bulk_wall_lowest_positive_gap']:.12g} | {r['ratio_to_response_mass_ratio']:.10g} |")
    markdown = """# Canonical physical-binding audit — 8 October 2026

The recovered v61 response coefficients, wall embedding and endpoint currents are reproduced. A new calculation resolves the literal bulk-wall kinetic correction: its zero-energy endpoint Schur mass is not its actual transfer gap. This is a calculation in the displayed free wall, not a rejection of the complete interacting Cathedral model.

## Source identity and dated scope

The canonical executable SHA-256 is `e6bd037ffd706150dd9fe8eeeca8908a7c1a88c71a21f589b7eb05ce93128d75`, identical to the recovered v61 integrity record. `binding_audit_results.json` gives AST function dependencies and exact code-line anchors. No measured masses, mixing entries, electromagnetic coupling, M_Z scale or other observational inputs are read by this audit.

The later v124 and 28 September audits retain the response formulas but distinguish their microscopic derivation. The October 5 amplitude-to-link equation `R_f,k=A_f,k+1^-1 A_f,k` and its polar connection supersede the September statement that no such map exists. This audit does not repeat that superseded statement. The October spectral/current output equality remains a separate, concrete computation.

## The actual dependency direction

The code first calculates `response_flavour_certificate`: `s12=1/sqrt(F-1/h)`, `s23=Delta*(phi^6-1)`, `s13=D*Delta/2` and `J=gamma*Delta*(1+9*gamma/5)`. It builds a unitary matrix from those values. `response_yukawa_matrices` places this matrix in the down-quark block and PMNS in the neutrino block. `microscopic_response_wall_certificate` uses eleven primitive attenuation links and the terminal link `-U_response`. Its exact Schur reduction reproduces this matrix because that terminal link carries it.

No measured mixing entry is used. Equally, the Schur reconstruction and the later free-current readout do not independently select the terminal holonomy: their dependency points from response formulas to wall to readout. The primitive-to-response equality to test is `U_hist/Hopf=U_response` with the actual October typed polar transport and canonical source history. None of the checks here changes that canonical model or adds a free parameter to it.

The electromagnetic code likewise evaluates `alpha_root_inverse=137+(17572/1215)*Delta-(9/65)*Delta^2`, then defines `e_squared=4*pi/alpha_root_inverse`, `gY_squared=e_squared/(1-sin2W)` and `g2_squared=e_squared/sin2W`. These numbers are used in H_local's electric/magnetic coefficients. The identity

\\[
4\\pi(g_Y^{-2}+g_2^{-2})=\\alpha_{\\rm root}^{-1}
\\]

is exact because of those definitions. Its zero residual is not an independent derivation from a pre-response source Hessian. The target-required hidden current norm is deliberately not used.

## Literal conserved-charge and endpoint-current tests

On the anomaly-free sixteen-state particle carrier the exact traces are

| Trace | Value |
|---|---:|
| Tr Y² | 10/3 |
| Tr T3² | 2 |
| Tr Y T3 | 0 |
| Tr Q², Q=Y+T3 | 16/3 |

These fix the relative parent-trace weak angle to 3/8; they do not fix the absolute electromagnetic coupling. The distinct response slot 3/13 is retained as a response slot, not equated to the parent-trace slot.

Recovering the endpoint left frame from `Y24 M^-1` reproduces both canonical charged-current matrices with maximum residual about 1.1e-16. This independently checks implementation of the endpoint identity, while preserving its response-coefficient dependency.

## New calculation: full free-wall poles and endpoint kinetic terms

Per species, the actual displayed 13-wall amplitude has one unused zero row and one unused zero column. Removing those leaves the 12 by 12 matrix

\\[
K_{ij}=-r_i\\delta_{ij}+\\delta_{j,i+1},\\qquad i,j=0,\\ldots,11.
\\]

The twelve `r_i` are exactly the canonical serial-response factors followed by identity padding; the final response holonomy is unitary and therefore cannot change these singular values. Its zero-frequency Schur endpoint mass is `m_S=product(r_i)`. The actual lowest positive eigenvalue of the corresponding Hermitian chiral wall is `s_min(K)`.

| Species | Schur response product | Actual free bulk-wall gap | Gap/top ratio divided by response ratio |
|---|---:|---:|---:|
""" + "\n".join(rows) + """

The top channel has every `r_i=1`, giving the exact closed form

\\[
m_{t,\\rm wall}=2\\sin(\\pi/50)=0.125581039058626\\ldots .
\\]

A single unit conversion cannot remove the discrepancy in the last column. In particular, the free wall's electron/top ratio is 2.407908218 times its endpoint response ratio. This result involves no comparison with experiment and no choice of a new source action.

The reason is the exact energy-dependent Feshbach reduction:

\\[
D_{\\rm eff}(z)=D_{EE}+D_{EI}(zI-D_{II})^{-1}D_{IE},
\\]
\\[
zI-D_{\\rm eff}(z)=zZ-D_{\\rm eff}(0)+O(z^2),\\quad
Z=I+D_{EI}D_{II}^{-2}D_{IE}>0.
\\]

For the electron, `Z_L=10.935255767769647`, `Z_R=1.0000991371395669`; for the top, both are 12. Canonically normalized endpoint fields give the leading mass `m_S/sqrt(Z_L Z_R)`, matching the tiny electron bulk gap to relative error 2.9e-11. The linear approximation is less accurate for the top because it is not deep in the infrared. Source vertices must be reduced with the same energy-dependent kernel; the mass correction does not authorize changing an observable or inserting a countermetric.

Decimal Sturm calculations retain tiny neutrino gaps without machine-precision squaring loss. They use 130-digit arithmetic for decimal representations of the source's frozen binary64 factors. They are high-precision numerical checks, not claimed rigorous enclosures of the exact transcendental primitive coefficients.

## Exact physical scope

The source's full fermion term is `H_F=dGamma(gamma5 D_W tensor I+I tensor D_wall)+H_Y`. It includes a Wilson spinor operator, Higgs/Yukawa couplings, and a retained mirror completion; the full model further includes dynamical compact gauge fields and projection. The free D_wall computation above does **not** evaluate that full Hamiltonian or its physical gauge-invariant pole spectrum.

For the two displayed tensor summands alone, their commutator vanishes and the spectrum is the sum of their spectra. It is therefore invalid to read the isolated D_wall singular values directly as the full physical poles. Recovering the entrywise v54 spinor/wall/Higgs/mirror source placement is necessary before the complete interacting observable can be evaluated. The endpoint kinetic correction already calculated here must then be retained.

The exact remaining electromagnetic test is the equality between the electron-normalized pre-response source-dependent transfer Hessian and `alpha_root_inverse/(4*pi)` in a specified curvature/cell chart. The recovered response Hamiltonian cannot prove that equality by re-reading a coefficient that it was given. This audit identifies a specific dependency and supplies a new canonical pole calculation; it neither claims nature established nor converts branch-specific findings into a global impossibility theorem.
"""
    (OUT/"binding_audit_report.md").write_text(markdown)
    print(json.dumps({"source_sha256": report["trace"]["source_sha256"],
                      "wall_checks": report["literal_wall_poles"]["checks"],
                      "electron_actual_to_response_ratio": report["literal_wall_poles"]["species"]["e"]["ratio_to_response_mass_ratio"],
                      "current_checks": report["literal_endpoint_currents_and_charge_traces"]},indent=2))


if __name__=="__main__":
    main()
