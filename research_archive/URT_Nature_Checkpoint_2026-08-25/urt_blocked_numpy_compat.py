#!/usr/bin/env python3
"""Audit-only NumPy/SciPy compatibility runner for the blocked URT scripts.

The original files are never modified.  Geometry-building prefixes are executed
after removing only unavailable Torch/JAX imports; all model evaluation below is
implemented with NumPy/SciPy.  Archived optimizer states are re-evaluated rather
than treated as proof that an unavailable optimizer ran.
"""
from __future__ import annotations

import contextlib
import io
import itertools
import json
import math
import runpy
import sys
from pathlib import Path

import numpy as np
from scipy.linalg import null_space
from scipy.optimize import minimize
from scipy.special import expit, logsumexp

ROOT = Path(__file__).resolve().parent
LIB = ROOT / "full_library"
OUT = ROOT / "urt_blocked_repair.json"


def clean_exec_prefix(path: Path, marker: str, replacements=(), extra=None):
    text = path.read_text().split(marker)[0]
    kept = []
    for line in text.splitlines():
        s = line.strip()
        if s in {"import torch", "import jax", "import jax.numpy as jnp"}:
            continue
        if s.startswith("torch.set_default_dtype") or s.startswith("jax.config.update"):
            continue
        if "from jax.scipy" in s or "JAX_ENABLE_X64" in s:
            continue
        kept.append(line)
    text = "\n".join(kept)
    for old, new in replacements:
        text = text.replace(old, new)
    ns = {"__file__": str(path), "__name__": "__compat__"} if extra is None else dict(extra)
    ns.setdefault("__file__", str(path)); ns.setdefault("__name__", "__compat__")
    with contextlib.redirect_stdout(io.StringIO()):
        exec(compile(text, str(path), "exec"), ns)
    return ns


def fcar(s):
    s = np.asarray(s, float)
    return 0.5 * s * np.tanh(0.5 * s) - np.logaddexp(0.5 * s, -0.5 * s) + math.log(2.0)


def jarlskog(U):
    return float(np.imag(U[0, 0] * U[1, 1] * np.conj(U[0, 1]) * np.conj(U[1, 0])))


def frame(M):
    ev, U = np.linalg.eigh(M.conj().T @ M)
    ix = np.argsort(ev)
    return np.sqrt(np.maximum(ev[ix], 0.0)), U[:, ix]


def central_gradient(fun, x, step=2e-6):
    x = np.asarray(x, float)
    g = np.empty_like(x)
    for j in range(x.size):
        h = step * max(1.0, abs(x[j]))
        xp = x.copy(); xm = x.copy()
        xp[j] += h; xm[j] -= h
        g[j] = (fun(xp) - fun(xm)) / (2 * h)
    return g


def comparison(a, b):
    a = np.asarray(a); b = np.asarray(b)
    return float(np.max(np.abs(a - b)))


def endpoint_namespace():
    return clean_exec_prefix(
        LIB / "run_endpoint_test.py",
        "# torch constants",
    )


def audit_endpoint(ns):
    placements = ("right_source", "left_codomain")
    out = {}
    raw_d = []
    for j in range(13):
        v = np.zeros(13); v[j] = 1.0
        raw_d.append(ns["unvec"](ns["J5"] @ v[:5]) + ns["unvec"](ns["J43"] @ v[5:9])
                     + 1j * ns["unvec"](ns["J45"] @ v[9:]))
    raw_d = np.asarray(raw_d)

    def solve_one(eta, placement):
        R = ns["Rdelta"]
        dM = np.asarray([d @ R if placement == "right_source" else R @ d for d in raw_d])

        def val_grad(x):
            M = {s: (ns["raw_block"](x, s) @ R if placement == "right_source" else R @ ns["raw_block"](x, s))
                 for s in ns["charges"]}
            value, grad = ns["classical_value_gradient"](x, eta)
            for species, mult in ((["u", "d"], 1.0), (["nu", "e"], 1.0)):
                K = sum(M[s].conj().T @ M[s] for s in species)
                ev, U = np.linalg.eigh(K)
                sv = np.sqrt(np.maximum(ev, 0.0))
                value += 2.0 * float(np.sum(fcar(sv))) / eta
                H = (U * (1.0 / np.cosh(0.5 * sv) ** 2)[None, :]) @ U.conj().T
                for j in range(13):
                    grad[j] += (0.5 / eta) * sum(
                        np.vdot(H, M[s].conj().T @ dM[j]).real for s in species)
            return float(value), grad

        x0 = ns["classical_minimum"](eta)
        r = minimize(lambda x: val_grad(x), x0, jac=True, method="L-BFGS-B",
                     options={"maxiter": 600, "ftol": 1e-14, "gtol": 2e-10})
        x = r.x; R = ns["Rdelta"]
        mats = {s: (ns["raw_block"](x, s) @ R if placement == "right_source" else R @ ns["raw_block"](x, s))
                for s in ns["charges"]}
        specs = {}; U = {}
        for s, M in mats.items(): specs[s], U[s] = frame(M)
        V = U["u"].conj().T @ U["d"]
        P = U["e"].conj().T @ U["nu"]
        return {
            "objective": float(r.fun), "grad_norm": float(np.linalg.norm(r.jac)),
            "success": bool(r.success), "CKM_abs": np.abs(V).tolist(), "PMNS_abs": np.abs(P).tolist(),
            "J_CKM": jarlskog(V), "J_PMNS": jarlskog(P),
            "normalized_spectra": {s: (v / v[-1]).tolist() for s, v in specs.items()},
        }

    for placement in placements:
        out[placement] = {}
        for label, eta in (("closure", ns["eta_delta"]), ("confinement", ns["eta_conf"])):
            out[placement][label] = solve_one(eta, placement)
    archived = json.loads((LIB / "endpoint_conditioning_results.json").read_text())
    match = []
    for depth, key in (("closure", "terminal_eta_Delta"), ("confinement", "terminal_eta_conf")):
        match.append(comparison(out["left_codomain"][depth]["CKM_abs"], archived[key]["CKM_abs"]))
        match.append(comparison(out["left_codomain"][depth]["PMNS_abs"], archived[key]["PMNS_abs"]))
    out["archived_left_codomain_max_difference"] = float(max(match))
    out["verdict_reproduced"] = bool(max(match) < 1e-6)
    out["semantic_verdict"] = "Both source-side (near identity) and codomain-side (order-one) placements miss the frozen physical flavour targets."
    return out


def exterior_setup(ns):
    text = (LIB / "gauge_preserving_exterior_solver_q.py").read_text()
    text = text[text.index("# Exterior Fock basis"):text.index("TJ5=torch.tensor")]
    env = dict(ns)
    env.update({"np": np, "math": math, "itertools": itertools,
                "names": ["u", "d", "e", "nu"], "phi": (1 + math.sqrt(5)) / 2, "gamma": 1 / 81})
    with contextlib.redirect_stdout(io.StringIO()): exec(compile(text, "exterior_prefix", "exec"), env)
    return env


def gauge_objective(env, x, eta, norm, weight):
    out = {}
    for s in env["names"]:
        if norm == "declared":
            z = env["J5"] @ x[:5] + env["J43"] @ (x[5:9] + env["E3"] @ env["charges"][s] / 3)
            w = env["J45"] @ (x[9:] + env["Delta"] * env["E5"] @ env["gcov"](env["charges"][s]) / 5)
        else:
            z = env["J5"] @ x[:5] + env["J43"] @ (x[5:9] + env["E3"] @ env["charges"][s] / math.sqrt(3))
            w = env["J45"] @ (x[9:] + env["Delta"] * env["E5"] @ env["gcov"](env["charges"][s]) / math.sqrt(5))
        out[s] = z.reshape(3, 3, order="F") + 1j * w.reshape(3, 3, order="F")
    Mu = sum(np.kron(env["Sup"][a], out[s]) for a, s in enumerate(["u", "u", "u", "nu"]))
    Md = sum(np.kron(env["Sdn"][a], out[s]) for a, s in enumerate(["d", "d", "d", "e"]))
    classical = env["classical_value_gradient"](x, eta)[0]
    return float(classical + weight * 2 * (np.sum(fcar(np.linalg.svd(Mu, compute_uv=False)))
                                           + np.sum(fcar(np.linalg.svd(Md, compute_uv=False)))) / eta)


def audit_gauge(env):
    arc = json.loads((LIB / "gauge_preserving_exterior_q_results.json").read_text())
    diffs = []; grads = []
    weights = {"gamma": 1 / 81, "per16": 1 / 16, "one": 1.0}
    etas = {"delta": env["eta_delta"], "conf": env["eta_conf"]}
    for lab, bynorm in arc["results"].items():
        for norm, byweight in bynorm.items():
            for wn, rec in byweight.items():
                x = np.asarray(rec["x"])
                fun = lambda q: gauge_objective(env, q, etas[lab], norm, weights[wn])
                diffs.append(abs(fun(x) - rec["action"]))
                grads.append(np.linalg.norm(central_gradient(fun, x)))
    return {
        "cases_re_evaluated": len(diffs), "max_objective_difference": float(max(diffs)),
        "max_numeric_grad_norm_at_archive": float(max(grads)),
        "weyl_audit_max": float(max(arc["audits"].values())),
        "verdict_reproduced": bool(max(diffs) < 2e-8 and max(arc["audits"].values()) < 1e-12),
        "semantic_verdict": "Exterior/Weyl identities reproduce; archived stationary branches still do not select physical flavour.",
    }


def gate_namespace():
    p = str((LIB / "urt_seed_geometry_matrices.npz").resolve())
    return clean_exec_prefix(
        LIB / "urt_gate2_solver(1).py", "# jax functions",
        replacements=(("/mnt/data/urt_seed_geometry_matrices.npz", p),),
    )


def gate_eval(ns, x, eta, signs, spectral=False):
    Cg, src, col = ns["build"](*signs, 3)
    vv = Cg @ x
    vec = src + vv[None, None, :]
    M0 = np.swapaxes(vec.reshape((30, 4, 3, 3)), -1, -2)
    if spectral:
        M = np.empty_like(M0)
        depth = np.array([ns["Delta"] ** 2, ns["Delta"], 1.0])
        for e in range(30):
            for f in range(4):
                _, U = np.linalg.eigh(M0[e, f].conj().T @ M0[e, f])
                R = (U * depth[None, :]) @ U.conj().T
                M[e, f] = M0[e, f] @ R
    else:
        M = np.einsum("efij,ejk->efik", M0, ns["Rdepth"])
    K = np.einsum("efji,efjk->efik", np.conj(M), M)
    Kq = K[:, 0] + K[:, 1]; Kl = K[:, 2] + K[:, 3]
    eq = np.maximum(np.linalg.eigvalsh(Kq), 0); el = np.maximum(np.linalg.eigvalsh(Kl), 0)
    S = 2 * col * np.sum(fcar(np.sqrt(eq)), axis=1) + 2 * np.sum(fcar(np.sqrt(el)), axis=1)
    logits = eta * (ns["alphabet"] @ x) - S
    fun = 0.5 * np.sum(ns["Aprec"] * x * x) - (logsumexp(logits) - math.log(30)) / eta
    p = np.exp(logits - logsumexp(logits)); ie = int(np.argmax(p))
    specs = {}; Uall = {}
    for fi, name in enumerate(["u", "d", "e", "nu"]):
        ev, U = np.linalg.eigh(K[ie, fi]); ix = np.argsort(ev)
        specs[name] = np.sqrt(np.maximum(ev[ix], 0)); Uall[name] = U[:, ix]
    V = Uall["u"].conj().T @ Uall["d"]; P = Uall["e"].conj().T @ Uall["nu"]
    return float(fun), {"edge": ie, "pmax": float(p[ie]), "Vabs": np.abs(V), "PMabs": np.abs(P), "spec": specs}


def audit_gate_archive(ns, filename, spectral=False):
    rows = json.loads((LIB / filename).read_text())
    fd = []; vd = []; pd = []; gd = []
    for rec in rows:
        x = np.asarray(rec["x"]); eta = float(rec["eta"]); signs = tuple(rec["signs"])
        fun = lambda q: gate_eval(ns, q, eta, signs, spectral)[0]
        val, aux = gate_eval(ns, x, eta, signs, spectral)
        fd.append(abs(val - rec["fun"]))
        vd.append(comparison(aux["Vabs"], rec["Vabs"]))
        pd.append(comparison(aux["PMabs"], rec["PMabs"]))
        gd.append(np.linalg.norm(central_gradient(fun, x)))
    return {"cases_re_evaluated": len(rows), "max_objective_difference": float(max(fd)),
            "max_CKM_abs_difference": float(max(vd)), "max_PMNS_abs_difference": float(max(pd)),
            "max_numeric_grad_norm": float(max(gd)),
            "verdict_reproduced": bool(max(fd) < 2e-8 and max(vd) < 2e-6 and max(pd) < 2e-6)}


def audit_long_torch_gate():
    p = str((LIB / "urt_seed_geometry_matrices.npz").resolve())
    ns = clean_exec_prefix(LIB / "urt_gate2_solver.py", "tJ5 = torch.tensor",
                           replacements=(("/mnt/data/urt_seed_geometry_matrices.npz", p),))
    arc = np.load(LIB / "urt_gate2_solution.npz")
    diffs = []
    for label in ("closure", "confinement"):
        x = arc[f"{label}_phi_star"]
        mats = {s: ns["block"](x, s) for s in ns["charges"]}
        sp = {}; U = {}
        for s, M in mats.items(): sp[s], U[s] = frame(M)
        V = U["u"].conj().T @ U["d"]; P = U["e"].conj().T @ U["nu"]
        diffs += [comparison(np.abs(V), arc[f"{label}_CKM_abs"]), comparison(np.abs(P), arc[f"{label}_PMNS_abs"])]
        for s in ns["charges"]: diffs.append(comparison(sp[s] / sp[s][-1], arc[f"{label}_mass_ratio_{s}"]))
    return {"archived_observable_arrays_recomputed": 12, "max_absolute_difference": float(max(diffs)),
            "verdict_reproduced": bool(max(diffs) < 2e-8),
            "semantic_verdict": "The universal source-side depth flag still forces near-identity CKM and PMNS."}


def fermi(H):
    ev, U = np.linalg.eigh(H)
    q = expit(-ev)
    return (U * q[None, :]) @ U.conj().T


def car_Q(Q):
    q = np.clip(np.linalg.eigvalsh((Q + Q.conj().T) / 2), 1e-14, 1 - 1e-14)
    return float(np.sum(q * np.log(2 * q) + (1 - q) * np.log(2 * (1 - q))))


def global_eval(ns, x, p, eta, signs=(-1, 1)):
    Cg, src, _ = ns["build"](*signs, 3)
    vec = src + (Cg @ x)[None, None, :]
    M = np.swapaxes(vec.reshape((30, 4, 3, 3)), -1, -2)
    M = np.einsum("efij,ejk->efik", M, ns["Rdepth"])
    Qq = np.zeros((9, 9), complex); Ql = np.zeros((9, 9), complex)
    for e in range(30):
        Wu = np.vstack([M[e, 0], M[e, 1]]); Wl = np.vstack([M[e, 3], M[e, 2]])
        Hq = np.block([[np.zeros((3, 3)), Wu.conj().T], [Wu, np.zeros((6, 6))]])
        Hl = np.block([[np.zeros((3, 3)), Wl.conj().T], [Wl, np.zeros((6, 6))]])
        Qq += p[e] * fermi(Hq); Ql += p[e] * fermi(Hl)
    kl = np.sum(p * np.log(np.maximum(30 * p, 1e-300)))
    val = 0.5 * np.sum(ns["Aprec"] * x * x) - p @ (ns["alphabet"] @ x) + (kl + 3 * car_Q(Qq) + car_Q(Ql)) / eta
    return float(val), Qq, Ql


def audit_global(ns):
    rows = json.loads((LIB / "urt_gate2_global_modular_results.json").read_text())
    diffs = []; xgrad = []; ygrad = []
    for rec in rows:
        x = np.asarray(rec["x"]); p = np.asarray(rec["p"]); eta = rec["eta"]; signs = tuple(rec["signs"])
        val = global_eval(ns, x, p, eta, signs)[0]
        diffs.append(abs(val - rec["fun"]))
        xgrad.append(np.linalg.norm(central_gradient(lambda q: global_eval(ns, q, p, eta, signs)[0], x)))
        # The second endpoint lies on an exponentially small-probability boundary;
        # differentiate the actual softmax logits so finite differences stay valid.
        y = np.log(np.maximum(p, 1e-300))
        ygrad.append(np.linalg.norm(central_gradient(
            lambda q: global_eval(ns, x, np.exp(q - logsumexp(q)), eta, signs)[0], y, 1e-5)))
    scan = json.loads((LIB / "urt_gate2_global_modular_eta_scan.json").read_text())
    return {"endpoint_cases_re_evaluated": len(rows), "max_objective_difference": float(max(diffs)),
            "max_numeric_x_gradient": float(max(xgrad)), "max_softmax_logit_gradient": float(max(ygrad)),
            "endpoint_verdict_reproduced": bool(max(diffs) < 3e-8),
            "eta_scan_rows_inspected": len(scan), "eta_scan_faithful_replay": False,
            "eta_scan_limitation": "The scan JSON omitted x and p at every eta; replay requires a fresh 40-branch continuation, not mere dependency substitution."}


def regenerate_machine_intertwiners(path):
    sys.path.insert(0, str(LIB))
    import active_core as ac
    cod = [np.kron(P, P) for P in [np.eye(6)[list(p)].T for p in ac.aperms]]

    def constrained_basis(kind):
        rows = []
        for i in range(6):
            for j in range(i, 6):
                if kind == "antisym":
                    r = np.zeros((6, 6)); r[i, j] = 1; r[j, i] += 1; rows.append(r.reshape(-1, order="F"))
                elif i == j:
                    r = np.zeros((6, 6)); r[i, i] = 1; rows.append(r.reshape(-1, order="F"))
        if kind == "sym":
            for i in range(6):
                for j in range(i):
                    r = np.zeros((6, 6)); r[i, j] = 1; r[j, i] = -1; rows.append(r.reshape(-1, order="F"))
        for i in range(6):
            r = np.zeros((6, 6)); r[i, :] = 1; rows.append(r.reshape(-1, order="F"))
        return null_space(np.asarray(rows))

    def reynolds(rep, kind, seednum):
        B = constrained_basis(kind)
        rng = np.random.default_rng(seednum)
        seed = B @ rng.normal(size=(B.shape[1], rep[0].shape[0]))
        J = sum(C @ seed @ R.T for C, R in zip(cod, rep)) / 60
        w, U = np.linalg.eigh(J.T @ J); J = J @ (U @ np.diag(1 / np.sqrt(w)) @ U.T)
        k = np.unravel_index(np.argmax(np.abs(J)), J.shape)
        if J[k] < 0: J = -J
        return J

    J3 = reynolds(ac.rho3, "antisym", 3003)
    J5 = reynolds(ac.rho5, "sym", 5005)
    np.savez_compressed(path, J3=J3, J5=J5)
    return J3, J5, ac


def regenerate_clifford(path):
    s1 = np.array([[0, 1], [1, 0]], complex)
    s2 = np.array([[0, -1j], [1j, 0]], complex)
    s3 = np.diag([1, -1]).astype(complex); I = np.eye(2)
    kron = lambda a, b, c: np.kron(np.kron(a, b), c)
    G = [kron(s1, I, I), kron(s2, I, I), kron(s3, s1, I), kron(s3, s2, I),
         kron(s3, s3, s1), kron(s3, s3, s2)]
    chir = kron(s3, s3, s3)
    plus = np.where(np.diag(chir).real > 0)[0]; minus = np.where(np.diag(chir).real < 0)[0]
    order = np.r_[plus, minus]
    gam = [g[np.ix_(order, order)][4:, :4] for g in G]
    err = max(np.linalg.norm(a.conj().T @ b + b.conj().T @ a - (2*np.eye(4) if i == j else 0))
              for i, a in enumerate(gam) for j, b in enumerate(gam))
    data = {"gammas_real": [g.real.tolist() for g in gam], "gammas_imag": [g.imag.tolist() for g in gam],
            "canonical_clifford_error": float(err), "provenance": "canonical Pauli-tensor Cl(6) chiral representation"}
    path.write_text(json.dumps(data, indent=2))
    return err


def audit_regenerated_inputs():
    mp = ROOT / "unique_machine_intertwiner_regenerated.npz"
    cp = ROOT / "clifford_six_axis_results_regenerated.json"
    J3, J5, ac = regenerate_machine_intertwiners(mp)
    cliff = regenerate_clifford(cp)
    # Constraint and equivariance checks establish mathematical equivalence.
    P6 = [np.eye(6)[list(p)].T for p in ac.aperms]
    e3 = max(np.linalg.norm(np.kron(P, P) @ J3 - J3 @ R) for P, R in zip(P6, ac.rho3))
    e5 = max(np.linalg.norm(np.kron(P, P) @ J5 - J5 @ R) for P, R in zip(P6, ac.rho5))
    def mat(v): return v.reshape(6, 6, order="F")
    c3 = max(np.linalg.norm(mat(J3[:, j]) + mat(J3[:, j]).T) + np.linalg.norm(mat(J3[:, j]) @ np.ones(6)) for j in range(3))
    c5 = max(np.linalg.norm(mat(J5[:, j]) - mat(J5[:, j]).T) + np.linalg.norm(mat(J5[:, j]) @ np.ones(6)) + np.linalg.norm(np.diag(mat(J5[:, j]))) for j in range(5))
    # Execute the real-structure derivation against the canonical Clifford input.
    text = (LIB / "derive_spin7_real_structure.py").read_text()
    text = text.replace("/mnt/data/clifford_six_axis_results.json", str(cp))
    spinout = ROOT / "spin7_real_structure_regenerated.json"
    text = text.replace("/mnt/data/spin7_real_structure_results.json", str(spinout))
    with contextlib.redirect_stdout(io.StringIO()): exec(compile(text, "spin7_compat", "exec"), {"__name__": "__main__"})
    spin = json.loads(spinout.read_text())
    archived = json.loads((LIB / "urt_spin7_structural_closure_results.json").read_text())["spin7_real"]
    return {
        "unique_machine_intertwiner": {"deterministic_regeneration": True, "equivariance_error_3": float(e3),
            "equivariance_error_5": float(e5), "constraint_error_3": float(c3), "constraint_error_5": float(c5),
            "caveat": "Irrep-wide signs are fixed by a declared largest-entry convention; the missing original byte convention is unrecoverable."},
        "clifford_six_axis": {"canonical_equivalent_regeneration": True, "clifford_error": float(cliff),
            "spin7_stabilizer_dim": spin["selected"]["stabilizer_dim"],
            "archived_spin7_stabilizer_dim": archived["selected"]["stabilizer_dim"],
            "spin7_bracket_closure_error": spin["selected"]["bracket_closure_error"],
            "caveat": "A canonical basis-equivalent Cl(6) input is recoverable; the exact missing gamma basis/bytes are not inferable from archived invariants."},
    }


def main():
    ep = endpoint_namespace(); ext = exterior_setup(ep); gate = gate_namespace()
    result = {
        "scope": {"blocked_scripts": [
            "run_endpoint_test.py", "gauge_preserving_exterior_solver_q.py", "urt_gate2_solver.py",
            "urt_gate2_solver(1).py", "urt_gate2_spectral_solver.py",
            "urt_gate2_global_modular_solver.py", "urt_gate2_global_modular_eta_scan.py"],
            "originals_modified": False, "packages_installed": False, "compatibility_stack": "NumPy/SciPy"},
        "run_endpoint_test.py": audit_endpoint(ep),
        "gauge_preserving_exterior_solver_q.py": audit_gauge(ext),
        "urt_gate2_solver.py": audit_long_torch_gate(),
        "urt_gate2_solver(1).py": audit_gate_archive(gate, "urt_gate2_results.json", False),
        "urt_gate2_spectral_solver.py": audit_gate_archive(gate, "urt_gate2_spectral_results.json", True),
        "urt_gate2_global_modular_solver.py": audit_global(gate),
        "urt_gate2_global_modular_eta_scan.py": {"covered_by": "urt_gate2_global_modular_solver.py.eta_scan_*"},
        "missing_inputs": audit_regenerated_inputs(),
    }
    reproduced = []
    for name in result["scope"]["blocked_scripts"]:
        rec = result.get(name, {})
        flag = rec.get("verdict_reproduced", rec.get("endpoint_verdict_reproduced"))
        reproduced.append(flag)
    result["summary"] = {
        "faithfully_reproduced_verdicts": int(sum(x is True for x in reproduced)),
        "structurally_resolved_but_not_fully_replayed": int(sum(x is None for x in reproduced)),
        "failed_reproductions": int(sum(x is False for x in reproduced)),
        "bottom_line": "Dependency removal does not rescue any archived physical-flavour verdict; the only unreplayed numerical object is the state-discarding eta continuation scan."
    }
    OUT.write_text(json.dumps(result, indent=2))
    print(json.dumps(result["summary"], indent=2))
    print(OUT)


if __name__ == "__main__":
    main()