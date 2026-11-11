#!/usr/bin/env python3
"""Koide derivation gate for the Cathedral signed-history H64 (18 Oct 2026).

Question: does the selected H64 dynamics, with no Koide input, give
  (R1) Q = 2/3 (Brannen amplitude r = sqrt2),
  (R2) the measured phase delta,
  (R3) m_mu/m_e and m_tau/m_e from its eigenvalues?

Inputs: the repo's restored October H64 arrays (run
  research_archive/2026-10-17_recovery_assets/restore_matrices.py first),
  CODATA 2022 (m_e, m_mu/m_e) and PDG 2026 (m_tau). NumPy + SciPy only.
Usage: python3 koide_h64_derivation_gate.py <repo>/research_archive
No Koide relation, phase or mass enters any H64 computation below.
"""
import sys
from pathlib import Path
import numpy as np
from scipy.optimize import brentq, minimize

ARCH = Path(sys.argv[1] if len(sys.argv) > 1 else "research_archive")
GOLD = np.load(ARCH / "2026-10-17_exact_14D_H64_reduction/golden_species_operators.npz")
SIGN = np.load(ARCH / "2026-10-17_h64_quadratic_koide_phase/combined_signed_source_operators.npz")
rng = np.random.default_rng(20261018)
phi = (1 + 5 ** 0.5) / 2
alpha = phi ** -2
Delta = 0.15 - 80 * np.pi / (1053 * phi)
I3 = np.eye(3)
SPECIES = ["u", "d", "e", "nu"]
NF = np.array([3, 3, 1, 1])
W = 3                                   # 3-sigma acceptance for the gate


def line(s=""):
    print(s)


# ---------------------------------------------------------------- invariants
def Q(lam):
    lam = np.asarray(lam, float)
    return (lam ** 2).sum() / lam.sum() ** 2


def lode(lam):
    """Basis-free Koide phase: cos 3delta = sqrt6 Tr X~^3 / (Tr X~^2)^(3/2), delta in [0, pi/3]."""
    t = np.asarray(lam, float) - np.mean(lam)
    return np.arccos(np.clip(np.sqrt(6) * (t ** 3).sum() / ((t ** 2).sum()) ** 1.5, -1, 1)) / 3


def r_amp(q):
    return np.sqrt(max(6 * (q - 1 / 3), 0.0))


def koide_sqrt(d, r=np.sqrt(2)):            # k = 0 tau, 1 e, 2 mu
    return np.array([1 + r * np.cos(d + 2 * np.pi * k / 3) for k in range(3)])


# ------------------------------------------------------------------ section 0
me, dme = 0.51099895069, 0.00000000016          # MeV, CODATA 2022
rmu, drmu = 206.7682827, 0.0000046              # m_mu/m_e, CODATA 2022
mt, dmt = 1776.93, 0.09                          # MeV, PDG 2026
mmu = rmu * me
rtau, drtau = mt / me, dmt / me
lep = np.sqrt([me, mmu, mt])
Qm = Q(lep)
dQ = abs(Q(np.sqrt([me, mmu, mt + dmt])) - Qm)
dm = lode(lep)
ddm = abs(lode(np.sqrt([me, mmu, mt + dmt])) - dm)


def mu_over_e(d):
    s = koide_sqrt(d)
    return (s[2] / s[1]) ** 2


dstar = brentq(lambda d: mu_over_e(d) - rmu, 0.2, 0.25, xtol=1e-16)
ddstar = abs(brentq(lambda d: mu_over_e(d) - (rmu + drmu), 0.2, 0.25, xtol=1e-16) - dstar)
s = koide_sqrt(dstar)
mtau_koide = me * (s[0] / s[1]) ** 2
line("=" * 78)
line("0) TARGETS  (CODATA 2022 m_e, m_mu/m_e; PDG 2026 m_tau)")
line(f"   measured Q            = {Qm:.8f} +- {dQ:.1e}   (2/3 is {abs(Qm-2/3)/dQ:.2f} sigma away)")
line(f"   measured delta (Lode) = {dm:.8f} +- {ddm:.1e} rad   (no Koide assumed)")
line(f"   delta* (Q=2/3 exact)  = {dstar:.12f} +- {ddstar:.1e}")
line(f"   2/9 - delta*          = {2/9-dstar:.3e}  = {(2/9-dstar)/ddstar:.0f} sigma  -> exact 2/9 with exact Q=2/3 excluded")
line(f"   Koide m_tau from e,mu = {mtau_koide:.3f} MeV  ({(mtau_koide-mt)/dmt:+.2f} sigma vs PDG)")
line(f"   ratios to hit         : m_mu/m_e = {rmu:.7f},  m_tau/m_e = {rtau:.2f} +- {drtau:.2f}")

# ------------------------------------------------------------------ section 1
line("=" * 78)
line("1) EXACT IDENTITIES (any Hermitian 3x3 sqrt-mass operator X; checked numerically)")
err1 = 0.0
for _ in range(200):
    A = rng.normal(size=(3, 3)) + 1j * rng.normal(size=(3, 3))
    X = A + A.conj().T + 3 * np.eye(3)
    lam = np.linalg.eigvalsh(X)
    Xbar = np.trace(X).real / 3 * np.eye(3)
    Xt = X - Xbar
    err1 = max(err1, abs(Q(lam) - (1 / 3 + np.linalg.norm(Xt) ** 2 / (3 * np.linalg.norm(Xbar) ** 2))))
line(f"   T1  Q = 1/3 + ||X~||^2 / (3 ||Xbar||^2)          max error {err1:.1e}")
line("       => Q = 2/3  <=>  traceless norm = trace norm  (r = sqrt2 is this equality)")
line(f"   T2  Lode angle of the Koide spectrum at delta*    {lode(koide_sqrt(dstar)):.12f} (= delta*)")

# T3: log-weight theorem
line("   T3  Gamma = (k/2) Tr X^2 - c0 ln Tr X - c1 ln ||X~||  stationary  =>  Q = 1/3 + c1/(3 c0), delta flat")
for c0, c1, kap in [(1, 1, 0.7), (1, 2, 2.3), (2, 1, 1.1), (4, 4, 5.0), (3, 5, 1.0)]:
    def G(lam, c0=c0, c1=c1, kap=kap):
        S = lam.sum()
        t = np.linalg.norm(lam - lam.mean())
        if S <= 0 or t <= 0:
            return 1e9
        return 0.5 * kap * (lam ** 2).sum() - c0 * np.log(S) - c1 * np.log(t)
    qs, ds = [], []
    for _ in range(6):
        o = minimize(G, rng.uniform(0.2, 2.0, 3), method="Nelder-Mead",
                     options={"xatol": 1e-13, "fatol": 1e-15, "maxiter": 40000})
        qs.append(Q(o.x)); ds.append(lode(o.x))
    line(f"       c0={c0} c1={c1} k={kap}:  Q = {np.mean(qs):.10f}  (theory {1/3+c1/(3*c0):.10f}),"
         f"  delta over starts {min(ds):.3f}..{max(ds):.3f}")
line("       => r = sqrt2 exactly when the two log weights are equal (c0 = c1); delta needs a separate term")

# T4: three-return form
errQ = errD = 0.0
w3 = np.exp(2j * np.pi / 3)
for _ in range(200):
    n = 9
    Bm = np.linalg.qr(rng.normal(size=(n, n)) + 1j * rng.normal(size=(n, n)))[0]
    T = Bm @ np.diag(w3 ** rng.integers(0, 3, n)) @ Bm.conj().T
    ph = rng.normal(size=n) + 1j * rng.normal(size=n)
    ph /= np.linalg.norm(ph)
    F = np.column_stack([ph, T @ ph, T @ T @ ph])
    Gm = F.conj().T @ F
    lam = np.linalg.eigvalsh(Gm)
    a1 = np.vdot(ph, T @ ph)
    errQ = max(errQ, abs(Q(lam) - (1 / 3 + 2 * abs(a1) ** 2 / 3)))
    errD = max(errD, abs(np.cos(3 * lode(lam)) - np.cos(3 * np.angle(a1))))
line(f"   T4  sqrt-mass = Gram(phi, T phi, T^2 phi), T^3 = 1:  Q = 1/3 + (2/3)|<phi|T phi>|^2,"
     f"  cos3delta = cos(3 arg<phi|T phi>)")
line(f"       max errors {errQ:.1e}, {errD:.1e}  => Koide <=> three-return survival probability = 1/2,"
     f" phase = return phase")
C9 =np.kron(np.eye(3), np.roll(np.eye(3), 1, axis=0))
O = np.linalg.qr(rng.normal(size=(9, 9)))[0]
Treal = O @ C9 @ O.T                                                 # real orthogonal, order 3
pr = rng.normal(size=9)
pr /= np.linalg.norm(pr)
lam = np.linalg.eigvalsh(np.column_stack([pr, Treal @ pr, Treal @ Treal @ pr]).T @
                         np.column_stack([pr, Treal @ pr, Treal @ Treal @ pr]))
line(f"   T5  real T, real phi -> Gram eigenvalues {np.round(lam, 6)}: a degenerate pair, delta in {{0, pi/3}}")

# ------------------------------------------------------------------ section 2
line("=" * 78)
line("2) ACTUAL H64: re-select the vacuum from the restored period action (no archived vacuum used)")
U = SIGN["U64"]
C5, C43, C45 = GOLD["C5"], GOLD["C43"], GOLD["C45"]
F5, Qp, Qmn = GOLD["F5"], GOLD["Qplus"], GOLD["Qminus"]
cas = GOLD["complex_amplitude_sources"]
Lk, bp = [], np.zeros((4, 12, 3, 3), complex)
for k in range(12):
    chi = (-1) ** k
    Lk.append((C5 @ F5.T + C43 @ Qp.T + 1j * chi * C45 @ Qmn.T) @ np.linalg.matrix_power(U, k))
    for f in range(4):
        bp[f, k] = (cas[f].real + 1j * chi * cas[f].imag).reshape(3, 3)
stack = np.vstack([q for l in Lk for q in (l.real, l.imag)])
sv, vec = np.linalg.eigh(stack.T @ stack)
V = vec[:, sv > 1e-10]
rank = V.shape[1]
amap = np.array([(l @ V).T.reshape(rank, 3, 3) for l in Lk])


def mb(a):
    return np.block([[I3, a.conj().T], [a, np.zeros((3, 3))]])


def dmb(a):
    return np.block([[np.zeros((3, 3)), a.conj().T], [a, np.zeros((3, 3))]])


Mi = np.array([[dmb(a) for a in amap[k]] for k in range(12)])


def amp(x, f, k):
    return np.einsum("i,iab->ab", x, amap[k]) + bp[f, k]


def period_action(x, sgn=1.0):
    """Original conditional period action (hidden constant dropped); sgn=-1 is the fermion-loop sign."""
    val = 0.5 * alpha * x @ x
    grad = alpha * x.copy()
    for f, n in enumerate(NF):
        for k in range(12):
            m = mb(amp(x, f, k))
            q = alpha * np.eye(6) + m @ m
            R = np.linalg.inv(q)
            val += sgn * n * np.linalg.slogdet(q)[1] / 24
            qi = np.einsum("iab,bc->iac", Mi[k], m) + np.einsum("ab,ibc->iac", m, Mi[k])
            grad += sgn * n * np.einsum("ab,iba->i", R, qi).real / 24
    return val, grad


opt = minimize(period_action, np.zeros(rank), jac=True, method="BFGS", options={"gtol": 1e-12, "maxiter": 5000})
xs = opt.x
gnorm = np.linalg.norm(period_action(xs)[1])
Hfd = np.array([(period_action(xs + 1e-6 * e)[1] - period_action(xs - 1e-6 * e)[1]) / 2e-6 for e in np.eye(rank)])
Pdiff = np.linalg.norm(V @ xs - SIGN["common_period_field_P64"])
line(f"   decoder rank {rank};  |grad| = {gnorm:.1e};  Hessian min eig = {np.linalg.eigvalsh((Hfd+Hfd.T)/2).min():.4f}"
     f";  |P - archived P| = {Pdiff:.1e}")
sig_k = np.array([np.linalg.svd(amp(xs, 2, k), compute_uv=False) for k in range(12)])
sig = sig_k[0]
line(f"   e-type singular values (all 12 clock steps equal to {np.ptp(sig_k, axis=0).max():.0e}): {np.round(sig, 9)}")

rows = []
lower = np.abs(0.5 - np.sqrt(0.25 + sig ** 2))
rows.append(("sigma as sqrt-mass (Yukawa amplitude)", sig))
rows.append(("sigma as mass", np.sqrt(sig)))
rows.append(("golden lower eigenvalue as sqrt-mass", lower))
# 64->3 Feshbach poles of the conditional e-type cross-history witness
K = GOLD["e_K64_cross_variant_conditional"]
E = GOLD["generation6_frame"] @ GOLD["e_lower_frame"]
ev, eu = np.linalg.eigh(K)
wts = np.linalg.norm(E.conj().T @ eu, axis=0) ** 2
pick = np.sort(ev[np.argsort(wts)[::-1][:3]])
rows.append(("K64 Feshbach poles as sqrt-mass", pick))
rows.append(("K64 Feshbach poles as mass", np.sqrt(pick)))
line(f"   {'reading':40s} {'Q':>9s} {'r':>7s} {'delta':>8s} {'m_mu/m_e':>10s} {'m_tau/m_e':>10s}")
line(f"   {'measured':40s} {Qm:9.6f} {r_amp(Qm):7.4f} {dm:8.5f} {rmu:10.3f} {rtau:10.1f}")
for lab, lamr in rows:
    l = np.sort(lamr)
    line(f"   {lab:40s} {Q(l):9.6f} {r_amp(Q(l)):7.4f} {lode(l):8.5f} {(l[1]/l[0])**2:10.3f} {(l[2]/l[0])**2:10.3f}")
gate_vals = (Q(sig), lode(np.sort(sig)), (np.sort(sig)[1] / np.sort(sig)[0]) ** 2, (np.sort(sig)[2] / np.sort(sig)[0]) ** 2)

# ------------------------------------------------------------------ section 3
line("=" * 78)
line("3) WHY IT FAILS (each item computed from the restored H64)")
# (a) the vacuum spectrum is the primitive charge source, nudged toward Q=1/3
b0 = (C43 @ (GOLD["J3"] @ GOLD["qcoords"][2] / 3)).reshape(3, 3)
s2 = np.sort(np.linalg.eigvalsh(b0 @ b0.T))
exact = np.sort([5 / 3, (13 + 105 ** 0.5) / 6, (13 - 105 ** 0.5) / 6])
sx0 = np.linalg.svd(amp(np.zeros(rank), 2, 0), compute_uv=False)
line(f"   a) e source at Delta->0: sigma^2 = {{5/3, (13+-sqrt105)/6}}  (error {np.abs(s2-exact).max():.1e});"
     f"  Q = 9(13-sqrt105)/64 = {9*(13-105**0.5)/64:.6f}")
line(f"      with rail Delta: Q(x=0) = {Q(sx0):.6f}  ->  selected vacuum Q = {Q(sig):.6f}  (|x*| = {np.linalg.norm(xs):.4f})")
fq, fa = [], []
for sc in [0.0, 1.0, 3.0, 6.0, 10.0, 15.0, 20.0]:
    for rep in range(3):
        o = minimize(lambda x: period_action(x, -1.0), rng.normal(scale=sc, size=rank) if sc else np.zeros(rank),
                     jac=True, method="BFGS", options={"gtol": 1e-9, "maxiter": 8000})
        fq.append(Q(np.linalg.svd(amp(o.x, 2, 0), compute_uv=False)))
        fa.append(o.fun)
line(f"      fermion-loop sign (-ln det), {len(fq)} starts: every minimum has Q in [{min(fq):.4f}, {max(fq):.4f}]"
     f" (lowest action: Q = {fq[int(np.argmin(fa))]:.4f})")
line("      -> per-eigenvalue log-dets pull the spectrum toward degeneracy, Q = 1/3")
line("      the action has no term that weights trace and traceless sectors separately (T3 needs c0 = c1)")
# (b) only equal-size sector pair: hidden quartets 4_3 (+) 4_5
D = SIGN["full64_D"][2, 0]
kp = np.trace(Qp.T @ D @ Qp).real / 4
km = np.trace(Qmn.T @ D @ Qmn).real / 4
line(f"   b) equal-size pair 4_3 (+) 4_5: radial logs c0 = c1 = 3 would give Q = 2/3 only if stiffness were equal;")
line(f"      H64 D on quartets = {kp:.6f}, {km:.6f} (sqrt3, sqrt5).  Radial modes give")
for lab, k0, k1 in [("D^2 stiffness", kp ** 2, km ** 2), ("D stiffness", kp, km)]:
    line(f"      {lab:14s}: Q = {1/3 + k0/(3*k1):.6f} or {1/3 + k1/(3*k0):.6f}   (2/3 needs ratio 1, H64 has {k1/k0:.4f})")
# (c) phase carriers
pret = max(np.linalg.norm(SIGN[f"{n}_polar_return"] - I3) for n in SPECIES)
t4 = 0.0
for n in SPECIES:
    T = I3.astype(complex)
    for k in range(4):
        T = SIGN[f"{n}_polar_links"][k] @ T
    t4 = max(t4, np.linalg.norm(T - I3))
ang, cnt = np.unique(np.round(np.degrees(np.angle(np.linalg.eigvals(np.linalg.matrix_power(U, 4)))), 6), return_counts=True)
line(f"   c) selected-history polar return: max ||U_ret - I|| = {pret:.1e};  4-step transport ||T - I|| = {t4:.1e}")
line(f"      -> no complex order-3 generation map on the amplitude sector at the vacuum")
line(f"      three-return U^4 on histories: real, eigen-angles {dict(zip(ang.tolist(), cnt.tolist()))}")
for lab, psi in [("selected history P*", V @ xs), ("e-loaded history", SIGN["loaded_real_histories"][2, 0])]:
    Fm = np.column_stack([psi, np.linalg.matrix_power(U, 4) @ psi, np.linalg.matrix_power(U, 8) @ psi]) / np.linalg.norm(psi)
    line(f"      three-return Gram of {lab:20s}: eigenvalues {np.round(np.linalg.eigvalsh(Fm.T @ Fm), 6)}  (T5: pair)")
line(f"   d) hidden bridge: sum ||K_35||_F^2 = 2/9 is a squared norm; as a phase with exact Q it is"
     f" {(2/9-dstar)/ddstar:.0f} sigma off")

# ------------------------------------------------------------------ section 4
line("=" * 78)
q, d, rm, rt = gate_vals
R1 = abs(q - Qm) < W * dQ
R2 = abs(d - dm) < W * ddm
R3 = abs(rm - rmu) < W * drmu and abs(rt - rtau) < W * drtau
line("4) GATE (selected H64 vacuum, e-type eigenvalues as sqrt-masses; every other reading in section 2 also fails)")
line(f"   R1  Q = 2/3 (r = sqrt2)        : {'PASS' if R1 else 'FAIL'}   Q = {q:.6f}, r = {r_amp(q):.4f}")
line(f"   R2  phase = measured           : {'PASS' if R2 else 'FAIL'}   delta = {d:.6f} vs {dm:.6f}")
line(f"   R3  three masses               : {'PASS' if R3 else 'FAIL'}   m_mu/m_e = {rm:.3f} vs {rmu:.3f};"
     f" m_tau/m_e = {rt:.3f} vs {rtau:.1f}")
line(f"   VERDICT: {'DERIVED' if (R1 and R2 and R3) else 'NOT DERIVED by the restored H64 dynamics'}")
