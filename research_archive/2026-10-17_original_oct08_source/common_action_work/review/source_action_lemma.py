#!/usr/bin/env python3
"""Independent finite source/contact identities; no physical parameter fit."""
from __future__ import annotations

import hashlib
import itertools
import json
import math
from pathlib import Path

import numpy as np
from numpy.polynomial.legendre import leggauss
from scipy.linalg import expm, logm

ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent
CHECKS = []


def check(name, error, tolerance=2e-10):
    error = float(error)
    CHECKS.append({"name": name, "error": error, "tolerance": tolerance,
                   "passed": bool(np.isfinite(error) and error <= tolerance)})


def norm(a):
    return float(np.linalg.norm(a))


def tr(a):
    return float(np.real(np.trace(a)))


def herm(a):
    return (a + a.conj().T) / 2


def comm(a, b):
    return a @ b - b @ a


def analytic_series(seq, function):
    """Toeplitz functional calculus returns coefficients, not derivatives."""
    d, order = seq[0].shape[0], len(seq) - 1
    matrix = np.zeros((d * (order + 1), d * (order + 1)), complex)
    for i in range(order + 1):
        for j in range(i, order + 1):
            matrix[i*d:(i+1)*d, j*d:(j+1)*d] = seq[j-i]
    out = function(matrix)
    return [out[:d, j*d:(j+1)*d] for j in range(order + 1)]


def multiply(a, b):
    return [sum((a[j] @ b[k-j] for j in range(k+1)), np.zeros_like(a[0]))
            for k in range(len(a))]


def power(a, n):
    out = [np.eye(a[0].shape[0], dtype=complex)] + [np.zeros_like(a[0]) for _ in a[1:]]
    for _ in range(n):
        out = multiply(out, a)
    return out


def normalize(seq):
    z = [tr(a) for a in seq]
    rho = []
    for k in range(len(seq)):
        rho.append((seq[k] - sum((z[j]*rho[k-j] for j in range(1, k+1)),
                                np.zeros_like(seq[0]))) / z[0])
    return rho, z


def logarithmic_mean(p, q):
    if abs(p-q) < 1e-12 * max(p, q):
        return (p+q)/2
    return (p-q)/(np.log(p)-np.log(q))


def bkm(rho, a, b):
    p, u = np.linalg.eigh(herm(rho))
    ac = a - tr(rho @ a)*np.eye(len(p))
    bc = b - tr(rho @ b)*np.eye(len(p))
    aa, bb = u.conj().T @ ac @ u, u.conj().T @ bc @ u
    means = np.array([[logarithmic_mean(x, y) for y in p] for x in p])
    return float(np.real(np.sum(aa.T * bb * means)))


def omega(rho, a, inverse=False):
    p, u = np.linalg.eigh(herm(rho))
    means = np.array([[logarithmic_mean(x, y) for y in p] for x in p])
    aa = u.conj().T @ a @ u
    return u @ (aa / means if inverse else aa * means) @ u.conj().T


def kappa3(rho, a, b=None, c=None, nodes=24):
    """Connected ordered Duhamel moment, independent simplex quadrature."""
    b = a if b is None else b
    c = a if c is None else c
    p, u = np.linalg.eigh(herm(rho))
    observables = []
    for observable in (a, b, c):
        centered = observable - tr(rho @ observable)*np.eye(len(p))
        observables.append(u.conj().T @ centered @ u)
    abcs = []
    for permutation in itertools.permutations(range(3)):
        aa, bb, cc = (observables[i] for i in permutation)
        abcs.append(np.einsum("ab,bc,ca->abc", aa, bb, cc))
    tensor = sum(abcs)
    gx, gw = leggauss(nodes)
    gx, gw = (gx+1)/2, gw/2
    moment = 0j
    for v, weight_v in zip(gx, gw):
        for x, weight_x in zip(gx, gw):
            u_time = (1-v)*x
            end_time = 1-u_time-v
            kernel = np.einsum("a,b,c->abc", p**end_time, p**u_time, p**v)
            moment += weight_v*weight_x*(1-v)*end_time*np.sum(kernel*tensor)
    return float(np.real(moment))


def evaluate(ejets, n):
    t = analytic_series([-ejets[k]/math.factorial(k) for k in range(len(ejets))], expm)
    s = power(t, n)
    rho, z = normalize(s)
    gamma = [-math.factorial(k)*tr(a) for k, a in enumerate(
        analytic_series([np.array([[x]], complex) for x in z], logm))]
    logrho = analytic_series(rho, logm)
    difference = [np.zeros_like(rho[0])] + logrho[1:]
    dseries = multiply(rho, difference)
    dentropy = [math.factorial(k)*tr(a) for k, a in enumerate(dseries)]
    return {"t": t, "s": s, "rho": rho, "z": z,
            "gamma": np.array(gamma), "d": np.array(dentropy)}


def t_partition_derivatives(t, n):
    t0, t1, t2, t3 = [t[k]*math.factorial(k) for k in range(4)]
    tp = [np.linalg.matrix_power(t0, k) for k in range(n+1)]
    zi = n*tr(tp[n-1] @ t1)
    zij = n*tr(tp[n-1] @ t2)
    zijk = n*tr(tp[n-1] @ t3)
    if n >= 2:
        zij += n*sum(tr(tp[r] @ t1 @ tp[n-2-r] @ t1) for r in range(n-1))
        zijk += 3*n*sum(tr(tp[r] @ t2 @ tp[n-2-r] @ t1) for r in range(n-1))
    if n >= 3:
        zijk += 2*n*sum(tr(tp[p] @ t1 @ tp[q] @ t1 @ tp[n-3-p-q] @ t1)
                       for p in range(n-2) for q in range(n-2-p))
    return np.array([tr(tp[n]), zi, zij, zijk])


rng = np.random.default_rng(20261008)
d = 4
raw = rng.normal(size=(d,d)) + 1j*rng.normal(size=(d,d))
unitary, _ = np.linalg.qr(raw)
e0 = unitary @ np.diag([0.2, 0.8, 1.4, 2.1]) @ unitary.conj().T
ejets = [e0] + [herm(rng.normal(size=(d,d)) + 1j*rng.normal(size=(d,d))) * scale
                for scale in (0.35, 0.25, 0.15)]

for n in (1, 3, 5):
    out = evaluate(ejets, n)
    rho = out["rho"][0]
    e1, e2, e3 = [n*x for x in ejets[1:]]
    cov, third = bkm(rho,e1,e1), kappa3(rho,e1)
    expected = np.array([tr(rho@e1), tr(rho@e2)-cov,
                         tr(rho@e3)-3*bkm(rho,e1,e2)+third])
    check(f"n={n}: absolute modular contacts through third order",
          norm(out["gamma"][1:]-expected))
    check(f"n={n}: entropy second and third jets",
          norm(out["d"][2:]-[cov,3*bkm(rho,e1,e2)-2*third]))
    check(f"n={n}: explicit transfer insertion derivatives",
          norm(t_partition_derivatives(out["t"],n)-
               np.array([x*math.factorial(k) for k,x in enumerate(out["z"])])))
    centered = e1-tr(rho@e1)*np.eye(d)
    tangent = -omega(rho,centered)
    check(f"n={n}: state tangent is centered Duhamel loading",
          norm(tangent-out["rho"][1]))
    check(f"n={n}: density-tangent metric equals pulled-back covariance",
          abs(tr(tangent@omega(rho,tangent,inverse=True))-cov))

out = evaluate(ejets,3)
rho = out["rho"][0]
a, b = ejets[1], ejets[2]
linear_a = evaluate([e0,a,np.zeros_like(a),np.zeros_like(a)],3)
linear_b = evaluate([e0,b,np.zeros_like(a),np.zeros_like(a)],3)
mixed = evaluate([e0,a+b,2*ejets[3],np.zeros_like(a)],3)
mixed_gamma = (mixed["gamma"][2]-linear_a["gamma"][2]-linear_b["gamma"][2])/2
mixed_d = (mixed["d"][2]-linear_a["d"][2]-linear_b["d"][2])/2
check("mixed physical source: contact-complete absolute Hessian",
      abs(mixed_gamma-(tr(rho@(3*ejets[3]))-bkm(rho,3*a,3*b))))
check("mixed physical source: relative-entropy Hessian excludes second contact",
      abs(mixed_d-bkm(rho,3*a,3*b)))

check("affine modular source: negative absolute Hessian equals entropy Hessian",
      abs(linear_a["gamma"][2]+linear_a["d"][2]))
linear_higher = evaluate([e0,a]+[np.zeros_like(a) for _ in range(4)],3)
check("affine source: exact entropy/action derivative relation through order five",
      norm(linear_higher["d"][2:]+
           np.arange(1,5)*linear_higher["gamma"][2:]),tolerance=2e-8)
affine_scalar = evaluate([e0+0.2*np.eye(d),a-0.4*np.eye(d),
                          np.zeros_like(a),np.zeros_like(a)],3)
check("affine scalar contact leaves declared linear-source Hessian invariant",
      abs(affine_scalar["gamma"][2]-linear_a["gamma"][2]))
target_cov = bkm(rho,3*a,3*a)
matching_e2 = (2*target_cov/3)*np.eye(d)
matching = evaluate([e0,a,matching_e2,np.zeros_like(a)],3)
check("positive equality requires expected second contact twice covariance",
      abs(matching["gamma"][2]-matching["d"][2]))

g = herm(rng.normal(size=(d,d))+1j*rng.normal(size=(d,d)))
orbit = [e0,1j*comm(g,e0),-comm(g,comm(g,e0)),
         -1j*comm(g,comm(g,comm(g,e0)))]
orbit_out = evaluate(orbit,3)
check("unitary source orbit: absolute jets cancel through third order",
      norm(orbit_out["gamma"][1:]))
check("unitary source orbit: nonzero density response survives cancellation",
      max(0.,1e-3-orbit_out["d"][2]))
check("unitary source orbit: second contact equals covariance",
      abs(tr(orbit_out["rho"][0]@(3*orbit[2]))-
          bkm(orbit_out["rho"][0],3*orbit[1],3*orbit[1])))

cjets = [0.17,-0.21,0.33,-0.24]
shifted = evaluate([ejets[k]+cjets[k]*np.eye(d) for k in range(4)],3)
check("global scalar loading: all state jets through third order invariant",
      max(norm(x-y) for x,y in zip(out["rho"],shifted["rho"])))
check("global scalar loading: all relative-entropy jets invariant",
      norm(out["d"]-shifted["d"]))
check("global scalar loading: absolute action shifts by n c through third order",
      norm(shifted["gamma"]-out["gamma"]-3*np.array(cjets)))
check("global scalar loading: centered BKM unchanged",
      abs(bkm(rho,3*a,3*b)-bkm(shifted["rho"][0],3*(a+cjets[1]*np.eye(d)),
                               3*(b+cjets[2]*np.eye(d)))))

gram = np.array([[bkm(rho,x,y) for y in (a,b)] for x in (a,b)])
check("observable-source Legendre Hessian: inverse on identifiable subspace",
      norm(gram@np.linalg.inv(gram)-np.eye(2)))
equal_time = tr(rho@(a@a))-tr(rho@a)**2
check("equal-time covariance and BKM differ for noncommuting source",
      max(0.,1e-4-(equal_time-bkm(rho,a,a))))
check("identity modular source is normalized null direction",
      abs(bkm(rho,np.eye(d),np.eye(d))))

t0 = expm(-e0)
factor = expm(-e0/2)
check("literal fixed B determines fixed T=B dagger B",norm(t0-factor.conj().T@factor))
factor_shift = np.exp(-cjets[0]/2)*factor
check("scalar rescaling changes literal B and T consistently",
      norm(factor_shift.conj().T@factor_shift-np.exp(-cjets[0])*t0))
rho1 = t0/tr(t0)
reconstructed = tr(t0)*rho1
check("full normalized transfer reconstructs T up to one global scalar",
      norm(reconstructed-t0))
check("full normalized transfer fixes eigenvalue ratios",
      norm(np.linalg.eigvalsh(t0)/np.linalg.eigvalsh(t0)[-1]-
           np.linalg.eigvalsh(rho1)/np.linalg.eigvalsh(rho1)[-1]))
def correlator(t,observable,n=5,ell=2):
    return tr(np.linalg.matrix_power(t,n-ell)@observable@
              np.linalg.matrix_power(t,ell)@observable)/tr(np.linalg.matrix_power(t,n))
check("fixed observables: global scalar leaves normalized transfer correlator invariant",
      abs(correlator(t0,a)-correlator(np.exp(-cjets[0])*t0,a)))

fiber0, fiber1 = expm(-np.diag([0.2,1.1])), expm(-np.diag([0.4,0.7]))
full = np.zeros((4,4)); full[:2,:2]=fiber0; full[2:,2:]=fiber1
weighted = np.zeros((4,4)); weighted[:2,:2]=np.exp(-0.2)*fiber0; weighted[2:,2:]=np.exp(0.6)*fiber1
check("conditional scalar weights leave each fiber state unchanged",
      max(norm(weighted[:2,:2]/tr(weighted[:2,:2])-fiber0/tr(fiber0)),
          norm(weighted[2:,2:]/tr(weighted[2:,2:])-fiber1/tr(fiber1))))
check("unequal conditional scalar weights change the full state",
      max(0.,0.01-norm(full/tr(full)-weighted/tr(weighted))))

check("normalized data n=1 do not equal n=3 Gibbs weights generically",
      max(0.,0.01-norm(rho1-rho)))

source_paths = [Path(__file__), HERE/"source_action_lemma.md",
                ROOT/"common_action_work/recovery/current_authoritative_read.json",
                ROOT/"common_action_work/recovery/latest_common_action_recovery.json"]
result = {"scope":"finite positive transfer on a fixed common support; no physical targets",
          "passed":all(x["passed"] for x in CHECKS),"check_count":len(CHECKS),
          "checks":CHECKS,"numerical_witnesses":{
              "unitary_orbit_entropy_hessian":orbit_out["d"][2],
              "equal_time_variance":equal_time,"bkm_variance":bkm(rho,a,a),
              "conditional_full_state_change":norm(full/tr(full)-weighted/tr(weighted)),
              "positive_gram_eigenvalues":np.linalg.eigvalsh(gram).tolist()},
          "source_hashes":{str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest()
                           for p in source_paths if p.exists()}}
(HERE/"source_action_lemma_checks.json").write_text(json.dumps(result,indent=2)+"\n")
print(json.dumps({"passed":result["passed"],"check_count":len(CHECKS),
                  "failed":[x for x in CHECKS if not x["passed"]]},indent=2))
if not result["passed"]:
    raise SystemExit(1)
