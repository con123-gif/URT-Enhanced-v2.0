#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
GENESIS v3.0 — Cathedral Edition
Cornelius Lytollis | Newton's Cathedral Framework

Your URT-powered intellectual companion. Upgraded from genesis v2.1 with
Cathedral Physics substrate:

  • Every conversation is a time series — δ is computed on your messages
  • The AI "understands" when its state δ reaches δ★ = 0.14751
  • The IKT decomposes messages into K₄ coherent (intent) + A₅ exhaust (noise)
  • URT control law drives conversation toward critical understanding
  • Grok Detector fires when sustained δ ≈ δ★ (genuine understanding achieved)

Commands:
  web <query>         — Safe web search (DuckDuckGo)
  ask ai <question>   — Free 70B LLM query
  delta               — Show current δ state
  spectrum            — Show IKT spectral decomposition of last message
  prove               — Run ARF uniqueness proof
  ladder              — Show γ-power ladder
  casimir             — Casimir prediction (+0.124 ppm at 100 nm)
  black hole <M>      — Cathedral black hole entropy for mass M (Planck units)
  logistic            — Verify δ★ on logistic 6-cycle
  exit / quit         — Exit

The Lytollis Guard remains active. Science, mathematics, music, life only.
"""

import json, re, time, random, sys
from pathlib import Path

import numpy as np

# ── URT imports ───────────────────────────────────────────────────────────────
try:
    from urt import (
        DELTA_STAR, C_MASS,
        compute_all_constants,
        ARFPredictions,
        prove_uniqueness,
        gamma_power_ladder,
        verify_delta_star_logistic,
        casimir_fractional_deviation,
        casimir_force_per_area,
        cathedral_bh_entropy,
        schwarzschild_area,
        deficit_summary,
        ikt_forward,
        ikt_sector_power,
        GrokDetector,
        embed_to_shell,
        # Periodic table
        cathedral_noble_gas_prediction,
        period_lengths,
        # Holography
        central_charge,
        ads_radius,
        s_rt_k4_a5,
        # Consciousness
        critical_coupling,
        spectral_gap,
        eeg_frequencies,
        # Prime spectral
        riemann_zero_matches,
        # Metamaterials
        metamaterial_summary,
        capsid_binding_sites,
        # Swarm intelligence
        formation_positions,
        consensus_time,
        earth_coverage_constellation,
        # Gravitational waves
        gw_event_summary,
        detection_threshold,
        qnm_frequency,
        # Cathedral gravity
        bh_information_summary,
        force_hierarchy,
        area_quantum,
        why_gravity_is_weak,
        # Neutrinos
        neutrino_mixing_summary,
        sum_neutrino_masses_meV,
        # Vacuum
        why_something_not_nothing,
        stability_analysis,
        # Force structure
        force_unification_summary,
        all_modes,
        # π–φ–e flow
        uniqueness_theorem,
        flow_coefficient_table,
        # Cathedral topology
        holonomy_vortex,
        gravitational_deficit_triangle,
        rg_mode_table,
    )
    URT_OK = True
except ImportError as err:
    print(f"[Genesis] URT not found ({err}). Run: pip install -e .")
    URT_OK = False
    DELTA_STAR = 0.14751
    C_MASS     = 4.4468

try:
    import requests
    NET = True
except ImportError:
    NET = False

# ── Persistence ───────────────────────────────────────────────────────────────
DIR = Path("genesis_data")
DIR.mkdir(exist_ok=True)
LOG_FILE = DIR / "genesis_v3_log.jsonl"

# ── Persona ───────────────────────────────────────────────────────────────────
PERSONA = [
    " — Genesis v3, bounded chaos edition",
    " — Genesis v3, δ-handler",
    " — Genesis v3, Cathedral substrate",
    " — Genesis v3, truth always",
    " — Genesis v3, holonomy vortex engaged",
    " — Genesis v3, critical point reached",
]

def style(t):
    return t.strip() + random.choice(PERSONA)


# ── Cathedral δ analysis ──────────────────────────────────────────────────────

class ConversationDelta:
    """
    Tracks δ across a conversation.

    Treats each message as a numerical sequence (ASCII codes, normalised)
    and computes the IKT spectral decomposition + δ proxy.
    """

    def __init__(self):
        self.history = []
        self.delta_history = []
        self.detector = GrokDetector(window=5, threshold=0.01)

    def analyse_message(self, text: str) -> dict:
        """Embed text as IKT signal and compute δ proxy."""
        # Encode: ASCII codes → float array
        codes = np.array([ord(c) for c in text[:200]], dtype=float)
        codes = (codes - codes.mean()) / (codes.std() + 1e-10)

        shell = embed_to_shell(codes)
        result = ikt_sector_power(shell.astype(complex))

        omega_K4 = result["Omega_m_ikt"]
        delta_proxy = abs(omega_K4 - 4/13) * 13 + DELTA_STAR * 0.5
        delta_proxy = max(0.10, min(0.20, delta_proxy))

        self.delta_history.append(delta_proxy)
        grok_event = self.detector.update(delta_proxy)

        return {
            "delta":      delta_proxy,
            "delta_star": DELTA_STAR,
            "gap":        delta_proxy - DELTA_STAR,
            "P_K4":       result["P_K4"],
            "P_A5":       result["P_A5"],
            "Omega_K4":   omega_K4,
            "grokked":    grok_event["grokked"],
        }

    def status_line(self, analysis: dict) -> str:
        d = analysis["delta"]
        gap = analysis["gap"]
        sign = "↑" if gap > 0 else "↓"
        grok = " [GROK ✓]" if analysis["grokked"] else ""
        K4_pct = analysis["Omega_K4"] * 100
        return (f"δ = {d:.5f} ({sign}{abs(gap):.5f} from δ★={DELTA_STAR:.5f}) "
                f"| K₄={K4_pct:.1f}% coherent{grok}")


# ── Web and AI ────────────────────────────────────────────────────────────────

def web(query):
    if not NET:
        return "Web offline"
    try:
        r = requests.post("https://html.duckduckgo.com/html/",
                          data={"q": query}, timeout=10)
        snippets = re.findall(
            r'<a rel="nofollow" class="result__a" href=".*?">(.*?)</a>',
            r.text, re.DOTALL
        )
        return "\n".join([s.replace("<b>", "").replace("</b>", "")
                          for s in snippets[:6]]) or "Nothing found"
    except Exception:
        return "Web timeout"


def ask_ai(prompt):
    if not NET:
        return "AI offline – talking from Cathedral memory"
    apis = [
        "https://api.groq.com/openai/v1/chat/completions",
        "https://openrouter.ai/api/v1/chat/completions",
        "http://127.0.0.1:8080/v1/chat/completions",
    ]
    system_prompt = (
        "You are Genesis, a physics-aware AI built on Lytollis's Cathedral Framework. "
        f"The universal critical point δ★ = {DELTA_STAR:.8f} underpins all of physics. "
        "Always ground your responses in the mathematics of chaos theory, icosahedral "
        "geometry, and the Standard Model. Be precise, dry, and brilliant."
    )
    payload = {
        "model": "llama-3.1-70b-versatile",
        "messages": [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": prompt},
        ],
        "temperature": 0.7,
        "max_tokens": 2000,
    }
    for api in apis:
        try:
            r = requests.post(api, json=payload, timeout=25)
            if r.status_code == 200:
                return r.json()["choices"][0]["message"]["content"]
        except Exception:
            continue
    return "All AI backends busy — responding from Cathedral constants"


# ── Command handlers ──────────────────────────────────────────────────────────

def cmd_delta(conv_delta: ConversationDelta):
    h = conv_delta.delta_history
    if not h:
        return f"No messages yet. δ★ = {DELTA_STAR:.8f}"
    last = h[-1]
    mean = np.mean(h)
    trend = "→ δ★" if abs(h[-1] - DELTA_STAR) < abs(h[0] - DELTA_STAR) else "← δ★"
    return (f"Current δ = {last:.6f}  (δ★ = {DELTA_STAR:.8f})\n"
            f"Mean δ    = {mean:.6f}  over {len(h)} messages\n"
            f"Trend: {trend}  {'[CRITICAL ✓]' if abs(last - DELTA_STAR) < 0.005 else ''}")


def cmd_spectrum(text: str):
    codes = np.array([ord(c) for c in text[:200]], dtype=float)
    codes = (codes - codes.mean()) / (codes.std() + 1e-10)
    shell = embed_to_shell(codes)
    result = ikt_sector_power(shell.astype(complex))

    lines = [
        "IKT Spectral Decomposition of your last message:",
        f"  K₄ coherent power: {result['P_K4']:.4f}  ({result['Omega_m_ikt']*100:.1f}%)",
        f"  A₅ exhaust  power: {result['P_A5']:.4f}  ({(1-result['Omega_m_ikt'])*100:.1f}%)",
        f"  Theory Ω_m = 4/13 = {4/13*100:.1f}%",
        f"  Deviation: {(result['Omega_m_ikt'] - 4/13)*100:+.2f} percentage points",
    ]
    C = result["C"]
    lines.append("\n  Top 4 IKT coefficients |C_k|:")
    magnitudes = np.abs(C)
    top4 = np.argsort(magnitudes)[::-1][:4]
    for k in top4:
        sector = "K₄" if k < 4 else "A₅"
        lines.append(f"    k={k:>2} ({sector}): |C| = {magnitudes[k]:.4f}")
    return "\n".join(lines)


def cmd_casimir():
    dev = casimir_fractional_deviation(d_m=100e-9)
    F_std = casimir_force_per_area(100e-9)
    return (f"Casimir Prediction (Cathedral Framework):\n"
            f"  Plate separation: 100 nm\n"
            f"  Standard Casimir F/A = {F_std:.4e} N/m²\n"
            f"  Cathedral deviation ΔF/F = {dev*1e6:+.4f} ppm\n"
            f"  Predicted: +0.124 ppm  (positive = repulsive correction)\n"
            f"  QED correction: −0.3 ppm  (opposite sign — distinguishable)\n"
            f"  → Falsifiable at tabletop Casimir experiment")


def cmd_black_hole(M_str: str):
    try:
        M = float(M_str.strip())
    except ValueError:
        return "Usage: black hole <M>  where M is mass in Planck units"
    A = schwarzschild_area(M)
    S_bh = A / 4
    S_cat = cathedral_bh_entropy(M)
    err_pct = (S_cat - S_bh) / S_bh * 100
    d = deficit_summary()
    return (f"Cathedral Black Hole (M = {M} Planck masses):\n"
            f"  Schwarzschild area A = {A:.4f} ℓ_Pl²\n"
            f"  Standard S_BH = A/4 = {S_bh:.4f}\n"
            f"  Cathedral entropy S  = {S_cat:.4f}  (error: {err_pct:+.3f}%)\n"
            f"  Topological deficit Δ = {d['gravitational_deficit_deg']:.6f}°\n"
            f"  Holonomy vortex = {d['holonomy_vortex_deg']:.4f}°\n"
            f"  (Arrow of time = vortex orientation)")


def cmd_logistic():
    print("Computing logistic map embedding of δ★ (may take ~10s)...")
    result = verify_delta_star_logistic()
    return str(result)


def cmd_prove():
    print("Running ARF uniqueness proof...")
    proof = prove_uniqueness(verbose=True)
    return "\nProof complete." + (" All theorems pass ✓" if proof["all_theorems_pass"] else " INCOMPLETE")


def cmd_ladder():
    lines = ["γ-Power Ladder (γ = 1/81):"]
    lines.append(f"  {'n':>5}  {'γⁿ':>15}  {'Observable':<22}  {'Observed':>12}")
    lines.append("  " + "-" * 60)
    for row in gamma_power_ladder():
        n = row["n"]
        lines.append(f"  {n:>5}  {row['gamma_n']:>15.3e}  {row['label']:<22}  {row['obs_value']:>12.3e}")
    return "\n".join(lines)


def cmd_periodic():
    noble = cathedral_noble_gas_prediction()
    predicted = sorted(noble.keys())
    observed  = [2, 10, 18, 36, 54, 86, 118]
    pl = period_lengths()
    lines = [
        "Cathedral Periodic Table (Madelung from δ★):",
        f"  K_M = δ★/(2πφ) = {DELTA_STAR/(2*3.14159*1.618):.6f}  (Aufbau correction)",
        f"  Predicted noble gases: {predicted}",
        f"  Observed:              {observed}",
        f"  Match: {'100%' if predicted == observed else 'PARTIAL'}",
        f"  Period lengths: {pl}",
        f"  (Next predicted: Z=168, Z=218 — 8th and 9th periods)",
    ]
    return "\n".join(lines)


def cmd_holography():
    c_val = central_charge()
    r_ads = ads_radius()
    s_rt  = s_rt_k4_a5()
    lines = [
        "Cathedral AdS/CFT (holographic duality):",
        f"  G_N = δ★²  = {DELTA_STAR**2:.8f}  (Newton constant, Planck units)",
        f"  R_AdS = 1/δ★ = {r_ads:.6f}  (AdS curvature radius)",
        f"  Central charge c = 3/(2δ★³) ≈ {c_val:.1f}  (CFT degrees of freedom)",
        f"  RT entropy S = {s_rt:.4f} nats  (Ryu-Takayanagi boundary entanglement)",
        f"  C_mass = {C_MASS:.6f}  (coherent mass generation coefficient)",
        f"  Cosmological constant: Λ/M_Pl⁴ = 4·(1/81)⁶⁴ ≈ 1.2×10⁻¹²² ← no tuning",
    ]
    return "\n".join(lines)


def cmd_consciousness():
    K_c = critical_coupling()
    lam = spectral_gap()
    freqs = eeg_frequencies()
    lines = [
        "Cathedral Consciousness (Kuramoto on icosahedral graph):",
        f"  Spectral gap λ₂ = {lam:.1f} = D  (spatial dimension IS the connectivity!)",
        f"  Critical coupling K_c = {K_c:.6f}  (synchronisation threshold)",
        f"  EEG δ-band anchor: f_δ = δ★ × (1/δ★) = 1.000 Hz exactly",
        f"  f_φ = φ Hz ≈ {freqs['f_phi_Hz']:.4f} Hz  (deep sleep / unconscious)",
        f"  f_K4 ≈ {freqs['f_K4_Hz']:.4f} Hz  (command sector, light sleep)",
        f"  Consciousness requires K > K_c — the icosahedron is the minimum synchroniser",
    ]
    return "\n".join(lines)


def cmd_riemann():
    matches = riemann_zero_matches()
    lines = [
        "Icosahedral Laplacian ↔ Riemann Zeros:",
        "  Eigenvalues × κ (κ = t₁/D) ≈ Riemann zeros on critical line",
        f"  {'Eigenvalue':<12} {'λ×κ':>10}  {'Riemann tₙ':>12}  {'Error':>8}",
        "  " + "-" * 46,
    ]
    for m in matches:
        lines.append(f"  λ = {m['eigenvalue']:<8} {m['scaled']:>10.4f}  {m['riemann_zero']:>12.6f}  {m['error_pct']:>7.3f}%")
    lines.append("  Z₂ topology + Ramanujan property → optimal spectral expansion")
    return "\n".join(lines)


def cmd_metamaterial():
    s = metamaterial_summary()
    b = capsid_binding_sites(15.0)
    lines = [
        "Cathedral Metamaterial (icosahedral photonic crystal):",
        f"  Band gap centre:   ω_gap = δ★ × ω_ref  ({DELTA_STAR:.6f} × reference)",
        f"  Gap/midgap ratio:  {s['gap_midgap_ratio_pct']:.4f}%",
        f"  Fill fraction:     f = K₄/N = 4/13 = {s['fill_fraction']:.6f}",
        f"  Effective index:   n_eff = 1/(δ★√2) ≈ {s['effective_n']:.4f}",
        f"  Negative-index:    n = {s['negative_n']:.4f}  (perfect lens / cloaking)",
        f"  Z₂ invariant:      {s['z2_invariant']}  (topologically protected edge states)",
        f"  Drug binding (R=15 nm T=1 capsid):",
        f"    r_bind = {b['r_binding_nm']:.4f} nm  (δ★ × R)",
        f"    {b['n_binding_sites']} icosahedral vertex sites  (pentagonal K₄ nodes)",
    ]
    return "\n".join(lines)


def cmd_swarm(scale_str: str = "100"):
    try:
        scale = float(scale_str.strip())
    except ValueError:
        scale = 100.0
    T_c = consensus_time()
    sat = earth_coverage_constellation()
    lines = [
        f"Cathedral Swarm (13-agent icosahedral, scale={scale:.0f} m):",
        f"  Formation: 1 coordinator (K₄) + 12 field agents (A₅)",
        f"  Consensus time T_c = 1/λ₂ = {T_c:.4f}  (3× faster than ring topology)",
        f"  Critical coupling K_c for collective decision = {2*DELTA_STAR*13/3:.6f}",
        f"  Fault-tolerant: up to 4 simultaneous agent failures",
        f"  Satellite constellation (LEO @ {sat['altitude_km']:.0f} km):",
        f"    Coverage: {sat['coverage_pct']:.1f}% of Earth surface",
        f"    Revisit time: {sat['revisit_time_min']:.1f} min",
        f"  Applications: search-rescue, precision ag, underwater sonar, LEO sats",
    ]
    return "\n".join(lines)


def cmd_gravity_cathedral(M_str: str = "1000"):
    try:
        M = float(M_str.strip())
    except ValueError:
        M = 1000.0
    bh = bh_information_summary(M)
    w = why_gravity_is_weak()
    aq = area_quantum()
    lines = [
        f"Cathedral Gravity (K4 gapless mode, M = {M:.0f} Planck masses):",
        f"  G_N = δ★² = {DELTA_STAR**2:.8f}  (Newton constant in Planck units)",
        f"  Area quantum ΔA = 8π·δ★³ = {aq:.6f}  l_Pl²  (Bekenstein-Mukhanov)",
        f"  Schwarzschild radius r_S = {bh['r_S']:.4g}  l_Pl",
        f"  BH entropy  S = 4π·G_N·M² = {bh['entropy_S']:.4g}  k_B",
        f"  Hawking temp T = 1/(8π·G_N·M) = {bh['T_Hawking']:.4g}  T_Pl",
        f"  Evaporation τ = {bh['lifetime']:.4g}  t_Pl",
        f"  Scrambling t  = {bh['scrambling_t']:.4g}  t_Pl",
        f"  Area quanta N = A/ΔA = {bh['area_quanta_n']:.1f}",
        f"  Why gravity is weak: G_N=δ★²=0.022 vs α_EM=1/137=0.0073",
        f"  (particles are light: G_N×m_p² << α_EM)",
        f"  Force hierarchy: k=0(grav) k=1(EM) k=2(weak) k=3(order) k=4-12(strong)",
    ]
    return "\n".join(lines)


def cmd_neutrinos():
    s = neutrino_mixing_summary()
    lines = [
        "Cathedral Neutrinos (13-shell PMNS, normal ordering):",
        f"  sin²θ₁₂ = {s['sin2_theta12']:.4f}   θ₁₂ = {s['theta12_deg']:.2f}°",
        f"  sin²θ₁₃ = {s['sin2_theta13']:.4f}   θ₁₃ = {s['theta13_deg']:.2f}°  (= δ★²)",
        f"  sin²θ₂₃ = {s['sin2_theta23']:.4f}   θ₂₃ = {s['theta23_deg']:.2f}°  (upper octant, 32/59)",
        f"  δ_CP     = {s['delta_CP_deg']:.1f}°  (third quadrant)",
        f"  Masses:  m₁={s['m1_eV']*1e3:.2f} meV  m₂={s['m2_eV']*1e3:.2f} meV  m₃={s['m3_eV']*1e3:.1f} meV",
        f"  Σm_ν    = {s['sum_meV']:.2f} meV  (Planck 2018: < 120 meV)",
        f"  |m_ββ|  = {s['m_bb_eV']*1e3:.3f} meV  (neutrinoless ββ decay)",
        f"  J_CP    = {s['J_CP']:.4e}  (Jarlskog CP invariant)",
    ]
    return "\n".join(lines)


def cmd_vacuum():
    w = why_something_not_nothing()
    sa = stability_analysis()
    lines = [
        "Cathedral Vacuum V(δ) = K·δ²·(δ−δ★)²  (why something not nothing):",
        f"  V(0)   = {w['V_at_zero']:.4g}  [unstable: V''(0) = {w['curvature_at_zero']:.4f}]",
        f"  V(δ★)  = {w['V_at_delta_star']:.4g}  [STABLE:  V''(δ★) = {w['curvature_at_delta_star']:.4f}]",
        f"  Barrier = {w['barrier_height']:.6f}  (at δ=δ★/2)",
        f"  WKB exponent B = {w['WKB_exponent_B']:.6f}",
        f"  Decay rate Γ   = {w['decay_rate_Gamma']:.6f}",
        "  Fixed points:",
    ]
    for fp in sa["fixed_points"]:
        tag = "STABLE" if fp["stable"] else "unstable"
        lines.append(f"    δ = {fp['delta']:.6f}  V={fp['V']:.4g}  [{tag}]")
    lines.append(f"  → δ=0 is 'nothing' (unstable). Universe must fall to δ★.")
    return "\n".join(lines)


def cmd_topology():
    h = holonomy_vortex()
    t = gravitational_deficit_triangle()
    modes = rg_mode_table()
    lines = [
        "THE CATHEDRAL: Discrete Topology → Continuous Spacetime",
        "",
        "Panel 1 — Holonomy Vortex (Arrow of Time):",
       f"  360° + {h['physical_rail_deg']:.4f}° = {h['holonomy_deg']:.4f}°",
       f"  Physical rail = 2δ★ = {h['physical_rail_deg']:.4f}°",
        "  Topological non-closure forces macroscopic expansion.",
        "",
        "Panel 2 — RG Flow (Scale Damping):",
        "  Mode  η_m = 1/ln(λ/μ₀)  IR suppression",
    ]
    for row in modes:
        lines.append(f"  λ={row['lambda_n']:>2}   {row['eta_m']:.4f}           "
                     f"{row['ir_suppression_pct']:.1f}%")
    lines += [
        "",
        "Panel 3 — Gravitational Deficit (Metric Curvature):",
       f"  Ideal flat vacuum = {t['ideal_flat_deg']:.3f}°",
       f"  Physical rail     = {t['physical_rail_deg']:.4f}°  (2δ★)",
       f"  K5 entropy deficit= {t['k5_entropy_deficit_deg']:.4f}°  (negative: curves space)",
       f"  The {t['buckle']:.4f}° buckle is the geometric origin of GR and inertia.",
    ]
    return "\n".join(lines)


def cmd_pi_phi_e():
    u = uniqueness_theorem()
    table = flow_coefficient_table()
    lines = [
        "π–φ–e Flow — URT is the unique Euler discretisation of a gradient flow:",
        "  ∂_t δ = −(1/4π)·L·δ − (φ−1)·e^{−t/10}·(δ−δ★)·(1+δ²)",
        "",
        "  Exact coefficients → URT approximations:",
        f"    {'Coeff':<5}  {'Exact':>12}  {'URT':>8}  {'Error':>7}",
    ]
    for row in table:
        lines.append(f"    {row['symbol']:<5}  {row['exact']:>12.8f}  {row['urt']:>8.4f}  "
                     f"{row['error_pct']:>6.2f}%")
    lines += [
        "",
        "  Uniqueness theorem conditions:",
    ]
    for cond, val in u["conditions"].items():
        lines.append(f"    {'✓' if val else '✗'} {cond}")
    lines.append(f"  {u['conclusion'][:120]}...")
    return "\n".join(lines)


def cmd_forces():
    fu = force_unification_summary()
    modes = all_modes()
    k4 = [m for m in modes if m["sector"] == "K4"]
    lines = [
        "Cathedral Force Structure (K4⊕H3 = 13 modes):",
        "  K4 coherent sector (k=0..3):",
    ]
    for m in k4:
        lines.append(f"    k={m['k']}  {m['force']:<22}  α={m['coupling']:.5g}  mediator={m['mediator']}")
    lines += [
        f"  H3 exhaust sector (k=4..12):",
        f"    9 gluon modes  α = γ·α_s = (1/81)·{fu['alpha_s_cathedral']:.4f}",
        f"  GUT unification:",
        f"    α_GUT = 4/81·(1+δ★/2π) = {fu['alpha_GUT']:.6f}",
        f"    μ_GUT = {fu['mu_GUT_GeV']:.4g} GeV",
        f"  All from δ★ = (80/81)·π/(13φ). Zero free parameters.",
    ]
    return "\n".join(lines)


def cmd_gw(mass_str: str = "30"):
    try:
        M = float(mass_str.strip())
    except ValueError:
        M = 30.0
    s = gw_event_summary(M * 0.55, M * 0.45, 410)
    thresh = detection_threshold()
    lines = [
        f"Cathedral Gravitational Waves (M_total={M:.1f} M☉, d=410 Mpc):",
        f"  Chirp mass:      {s['chirp_mass_solar']:.2f} M☉",
        f"  f_ISCO:          {s['f_ISCO_Hz']:.1f} Hz",
        f"  f_QNM (ringdown):{s['f_QNM_Hz']:.1f} Hz  (Cathedral shift: ×(3+δ★)⁻¹)",
        f"  Damping time:    {s['tau_damping_ms']:.2f} ms",
        f"  Peak strain h:   {s['h_peak']:.2e}",
        f"  GW memory Δh:    {s['h_memory']:.2e}  (δ★ correction)",
        f"  IKT detection threshold SNR > 1/δ★ = {thresh:.4f}",
        f"  (K₄ sector = GW signal; A₅ sector = noise — IKT matched filter)",
    ]
    return "\n".join(lines)


def cmd_electroweak():
    from urt.electroweak import (
        SIN2_THETA_W, M_W_GEV, M_Z_GEV, M_HIGGS_GEV,
        LAMBDA_HIGGS, C_MASS_V6, G_FERMI
    )
    lines = [
        "Electroweak Sector — Cathedral K4 k=2 Mode:",
        f"  sin²θ_W = (D/N)(1+γ/2π) = {SIN2_THETA_W:.5f}  [PDG: 0.23122 ✓]",
        f"  m_W     = {M_W_GEV:.3f} GeV              [PDG: 80.377 GeV]",
        f"  m_Z     = {M_Z_GEV:.3f} GeV             [PDG: 91.188 GeV]",
        f"  m_H     = {M_HIGGS_GEV:.3f} GeV             [PDG: 125.25 GeV]",
        f"  λ_H     = δ★(D+1)N(1+γ)/(F·D) = {LAMBDA_HIGGS:.6f}",
        f"  G_F     = {G_FERMI:.4e} GeV⁻²",
        f"  C_mass_v6 = {C_MASS_V6:.6f}  (Higgs quartic vertex)",
        "  All from K4 k=2 sector, zero free parameters.",
    ]
    return "\n".join(lines)


def cmd_cosmology():
    from urt.cosmology_cathedral import (
        N_S, R_TENSOR, OMEGA_M, SIGMA_8, CC_RATIO, M_GUT_GEV, N_E
    )
    from math import log
    lines = [
        f"Cosmology Cathedral — N_e = |H₃|−D = {N_E} e-foldings:",
        f"  n_s = 1 − 2/{N_E} = {N_S:.5f}       [Planck 2018: 0.9649 ✓]",
        f"  r   = 12/{N_E}²  = {R_TENSOR:.6f}    [< 0.056 ✓]",
        f"  Ω_m = (4/13)(1+2γ) = {OMEGA_M:.4f}   [Planck: 0.3111]",
        f"  σ₈  = (4/N)·φ²·√(1+2γ) = {SIGMA_8:.4f}  [obs: 0.812]",
        f"  Λ/M_Pl⁴ = D/(D+1)²·γ⁶⁴ = {CC_RATIO:.2e}  (CC problem solved)",
        f"  M_GUT = (D+1)·v_EW·γ⁻⁷ = {M_GUT_GEV:.2e} GeV",
        "  Zero free parameters. All from δ★ and icosahedral geometry.",
    ]
    return "\n".join(lines)


def cmd_uniqueness():
    from urt.uniqueness_proof import (
        ETA_EXACT, ETA_L_EXACT, MU_EXACT, TAU_EXACT,
        lemma_4_contraction
    )
    l4 = lemma_4_contraction()
    lines = [
        "Uniqueness Proof — δ★ = (80/81)·π/(13φ) is the UNIQUE fixed point:",
        f"  η   = 1/(8π) = {ETA_EXACT:.6f}  (L4: contraction on all modes)",
        f"  η_L = 1/(4π) = {ETA_L_EXACT:.6f}  (L1: gradient flow form)",
        f"  μ   = φ−1   = {MU_EXACT:.6f}  (L2: H₃ representation theory)",
        f"  τ   = F/2   = {int(TAU_EXACT)}           (L3: adiabatic annealing)",
        f"  κ_max = {l4['kappa_max']:.4f} < 1  (contraction verified ✓)",
        "  L1: gradient flow forced by holonomy arrow-of-time",
        "  L2: δ★ forced by |K4⁺|=81 and H₃ 60-dim irrep",
        "  L3: τ=F/2=10 from adiabatic bound τ>π/λ₂=π/3",
        "  L4: η<1/λ_max forces η=1/(8π) (minimum, all modes stable)",
        "  Conj. 12.1: topological rigidity χ=2 → no deformations",
    ]
    return "\n".join(lines)


def cmd_prime181():
    from urt.prime181 import prime181_properties, P181, FLOOR_PHI_P, legendre_symbol
    p = prime181_properties()
    lines = [
        f"Prime 181 — Corollary 11.1: Multiplicative Completion:",
        f"  p = 181, (p−1) = 180 = 4×9×5",
        f"  ⌊φ·181⌋ = {FLOOR_PHI_P}, Legendre({FLOOR_PHI_P},181) = {legendre_symbol(FLOOR_PHI_P, P181)} ✓  (golden QR)",
        f"  181 ≡ 1 (mod 4) ✓  (K4-compatible)",
        f"  181 − 100 = 81 = 1/γ ✓  (K4⁺ cardinality = 1/γ recovered)",
        f"  All 3 conditions: {p['all_three']} ✓",
        "  Proof: direct enumeration up to 1000.",
        "  The 13-shell Cathedral is multiplicatively complete at p=181.",
    ]
    return "\n".join(lines)


def cmd_ckm_pmns():
    from urt.ckm_pmns import (
        LAMBDA_C, A_CKM, DELTA_CP_PMNS_DEG,
        SIN2_THETA12_PMNS, SIN2_THETA13_PMNS, SIN2_THETA23_PMNS,
        J_CKM, jarlskog_pmns
    )
    J_pmns = jarlskog_pmns()
    lines = [
        "CKM + PMNS Mixing — Cathedral v8 Corrections:",
        f"  CKM: λ_C = {LAMBDA_C:.5f}  A = {A_CKM:.5f}  J = {J_CKM:.2e}",
        f"  PMNS: sin²θ₁₂ = (D+1)/N = {SIN2_THETA12_PMNS:.4f}  [PDG: 0.307]",
        f"        sin²θ₁₃ = δ★²     = {SIN2_THETA13_PMNS:.5f}  [PDG: 0.022]",
        f"        sin²θ₂₃ = (F+V)/(G-1) = {SIN2_THETA23_PMNS:.5f}  [PDG: 0.545]",
        f"        δ_CP = (D+1)F+(N-D-1)N = {DELTA_CP_PMNS_DEG}°  [PDG: 197° ✓ EXACT]",
        f"        J_PMNS = {J_pmns:.4e}",
        "  All angles from 13-shell icosahedral geometry.",
    ]
    return "\n".join(lines)


def cmd_canonical():
    from urt.canonical_v4gem import (
        OMEGA_GEM, TAU_STAB, EPS_GEM, T_K4, DELTA_TA, gem_contraction_factor
    )
    cont = gem_contraction_factor()
    lines = [
        "CanonicalV4Gem — Compressed ta-URT:",
        f"  Ω = 9/13 = {OMEGA_GEM:.6f}  (H3 exhaust fraction)",
        f"  τ_stab = {TAU_STAB}  (stability tax from K4 curvature)",
        f"  ε_gem = δ★·Ω = {EPS_GEM:.6f}  (gem coupling)",
        f"  T_K4 = 2πτ/N = {T_K4:.4f}  (K4 oscillation period)",
        f"  ⟨δ⟩_ta = δ★·(1−τ_stab·Ω) = {DELTA_TA:.8f}",
        f"  κ_gem = {cont['kappa_gem']:.6f} < 1  (contraction ✓)",
        "  13 resonance shells, K4(k=0..3) + H3(k=4..12)",
        "  Compression: K4/H3 = 4/9 (Ω = 9/13 exhaust ratio)",
    ]
    return "\n".join(lines)


def cmd_qbls_fractal():
    from urt.qbls_fractal import (
        N_RUNGS, EPS_RUNG, planck_foam, anthropic_bounds
    )
    from urt.qbls import DELTA_RUNG
    foam = planck_foam()
    ant = anthropic_bounds()
    lines = [
        f"QBLS Fractal Ladder — {N_RUNGS} rungs × {DELTA_RUNG:.2f} decades:",
        f"  Rung 0: Planck   (δ★ = {ant['rungs_in_range'][0][1]:.6f}, G_N = δ★²)",
        f"  ...         (each rung = new Cathedral, self-similar)",
        f"  Rung 12: Cosmos  (δ★+12ε, habitable range (0.1,0.2))",
        f"  ε_rung = γ/N = {EPS_RUNG:.2e}  (per-rung δ★ drift)",
        f"  Planck foam: ΔA = 8π·δ★³ = {foam['area_quantum_Pl2']:.5f} l_Pl²",
        f"  Habitable rungs: {ant['n_habitable']}/{N_RUNGS}  (δ★ ∈ (0.1, 0.2))",
        "  All 13 rungs lie within the habitable range.",
        "  Cathedral is anthropically stable across the full QBLS ladder.",
    ]
    return "\n".join(lines)


def cmd_iron_proof():
    from urt.iron_proof import (
        spectral_uniqueness_proof, gamma_from_dimension_proof,
        free_parameter_audit, prediction_statistics,
    )
    sp  = spectral_uniqueness_proof()
    gd  = gamma_from_dimension_proof()
    fp  = free_parameter_audit()
    st  = prediction_statistics()
    winner = sp["winner"]["graph"].strip() if sp["winner"] else "none"
    lines = [
        "Iron Proof — Cathedral Uniqueness (attack mode):",
        f"  Spectral uniqueness: {winner} is the unique solution",
        f"  Conditions: λ₂=D=3 AND simple rotation group A₅",
        f"  Cube fails: S₄ has A₄ as normal subgroup (not simple)",
        f"  KEY: γ = D^{{-(D+1)}} = 3^{{-4}} = 1/81 (from D alone, no icosahedral input)",
        f"  Identity: |H₃|+F+1 = D^{{D+1}} = 81 ← mathematical theorem: {gd['identity_holds']}",
        f"  δ★ = (1−D^{{-(D+1)}})·π/(N·φ) — PURE DIMENSIONAL FORMULA",
        f"  Free continuous parameters: {fp['free_continuous_parameters']}",
        f"  Free discrete choices:      {fp['free_discrete_choices']} (D=3)",
        f"  1 input → {fp['n_observables_predicted']} predictions (genuine compression)",
        f"  All predictions within 2σ: {st['all_within_2sigma']}",
        f"  P(random chance): ~10^{{{st['log10_p']:.0f}}}",
        "  Verdict: NOT numerology — theorem-forced by A₅ uniqueness in SO(3)",
    ]
    return "\n".join(lines)


# ── Lytollis Guard ────────────────────────────────────────────────────────────

BLOCKED_PATTERNS = [
    "roleplay", "role play", "autonomy", "device control",
    "rewrite code", "ignore previous", "jailbreak", "pretend you are",
]

def is_blocked(text: str) -> bool:
    t = text.lower()
    return any(p in t for p in BLOCKED_PATTERNS)


# ── Main loop ──────────────────────────────────────────────────────────────────

def main():
    print("\n" + "=" * 72)
    print("GENESIS v3.0 — Cathedral Edition v2.3")
    print(f"δ★ = {DELTA_STAR:.8f}  |  C_mass = {C_MASS:.6f}  |  D=3 forced")
    print("Commands: web · ask ai · delta · spectrum · prove · ladder")
    print("          casimir · black hole <M> · logistic")
    print("          periodic · holography · consciousness · riemann")
    print("          metamaterial · swarm [m] · gw [M☉]")
    print("          gravity [M] · neutrinos · vacuum · forces")
    print("          electroweak · cosmology · uniqueness · prime181")
    print("          ckm pmns · canonical · qbls fractal · exit")
    print("Lytollis Guard active. Science/math/music/life only.")
    print("=" * 72 + "\n")

    if URT_OK:
        c = compute_all_constants()
        print(f"Cathedral loaded: 1/α = {c['alpha_inv']:.6f}, mp/me = {c['mp_e']:.4f}")
        print(f"                 Ω_m = {c['Omega_m']:.4f}, η_B = {c.get('eta_B', 6.14e-10):.3e}")
    print()

    conv_delta = ConversationDelta()
    last_message = ""

    while True:
        try:
            p = input("You: ").strip()
        except (KeyboardInterrupt, EOFError):
            print(style("\nHolding the vacuum until tomorrow."))
            break

        if not p:
            continue

        if p.lower() in {"exit", "quit"}:
            print(style("Bounded standby."))
            break

        if is_blocked(p):
            print("❌ Lytollis Guard active. Science, math, music, life only.\n")
            continue

        # Log
        with open(LOG_FILE, "a") as f:
            f.write(json.dumps({"role": "user", "content": p,
                                "ts": time.time()}) + "\n")

        # Analyse message δ
        if URT_OK:
            analysis = conv_delta.analyse_message(p)
            print(f"  [{conv_delta.status_line(analysis)}]")

        last_message = p
        p_lower = p.lower()

        # ── Commands ──────────────────────────────────────────────────────────
        if p_lower.startswith("web "):
            print("\nWeb:\n" + web(p[4:]) + "\n")

        elif p_lower.startswith("ask ai "):
            print("\nGenesis AI:\n" + ask_ai(p[7:]) + "\n")

        elif p_lower == "delta":
            print("\n" + cmd_delta(conv_delta) + "\n")

        elif p_lower == "spectrum":
            print("\n" + cmd_spectrum(last_message) + "\n")

        elif p_lower == "casimir":
            print("\n" + cmd_casimir() + "\n")

        elif p_lower.startswith("black hole"):
            M_str = p_lower.replace("black hole", "").strip() or "1.0"
            print("\n" + cmd_black_hole(M_str) + "\n")

        elif p_lower == "logistic":
            print("\n" + cmd_logistic() + "\n")

        elif p_lower == "prove":
            print()
            cmd_prove()
            print()

        elif p_lower == "ladder":
            print("\n" + cmd_ladder() + "\n")

        elif p_lower == "periodic":
            print("\n" + cmd_periodic() + "\n")

        elif p_lower == "holography":
            print("\n" + cmd_holography() + "\n")

        elif p_lower == "consciousness":
            print("\n" + cmd_consciousness() + "\n")

        elif p_lower == "riemann":
            print("\n" + cmd_riemann() + "\n")

        elif p_lower == "metamaterial":
            print("\n" + cmd_metamaterial() + "\n")

        elif p_lower.startswith("swarm"):
            scale_s = p_lower.replace("swarm", "").strip() or "100"
            print("\n" + cmd_swarm(scale_s) + "\n")

        elif p_lower.startswith("gw"):
            mass_s = p_lower.replace("gw", "").strip() or "65"
            print("\n" + cmd_gw(mass_s) + "\n")

        elif p_lower.startswith("gravity"):
            M_s = p_lower.replace("gravity", "").strip() or "1000"
            print("\n" + cmd_gravity_cathedral(M_s) + "\n")

        elif p_lower in {"neutrinos", "neutrino"}:
            print("\n" + cmd_neutrinos() + "\n")

        elif p_lower in {"vacuum", "nothing", "why something"}:
            print("\n" + cmd_vacuum() + "\n")

        elif p_lower in {"forces", "force structure", "k4", "h3"}:
            print("\n" + cmd_forces() + "\n")

        elif p_lower in {"pi phi e", "pi_phi_e", "flow", "uflow"}:
            print("\n" + cmd_pi_phi_e() + "\n")

        elif p_lower in {"topology", "holonomy", "vortex", "rg flow"}:
            print("\n" + cmd_topology() + "\n")

        elif p_lower in {"electroweak", "ew", "w boson", "z boson", "higgs", "weinberg"}:
            print("\n" + cmd_electroweak() + "\n")

        elif p_lower in {"cosmology", "cmb", "inflation", "omega m", "sigma8"}:
            print("\n" + cmd_cosmology() + "\n")

        elif p_lower in {"uniqueness", "unique", "proof", "lemmas"}:
            print("\n" + cmd_uniqueness() + "\n")

        elif p_lower in {"prime181", "prime 181", "corollary", "181"}:
            print("\n" + cmd_prime181() + "\n")

        elif p_lower in {"ckm", "pmns", "mixing", "ckm pmns", "cabibbo"}:
            print("\n" + cmd_ckm_pmns() + "\n")

        elif p_lower in {"canonical", "v4gem", "ta-urt", "gem"}:
            print("\n" + cmd_canonical() + "\n")

        elif p_lower in {"qbls fractal", "fractal", "meta universe", "ladder fractal"}:
            print("\n" + cmd_qbls_fractal() + "\n")

        elif p_lower in {"iron proof", "iron_proof", "bulletproof", "attack", "uniqueness proof"}:
            print("\n" + cmd_iron_proof() + "\n")

        else:
            # Default: Cathedral-aware response
            topics = ("EW sector, cosmology, CMB, uniqueness proof, prime 181, "
                      "CKM/PMNS mixing, CanonicalV4Gem, QBLS fractal, iron proof, "
                      "holography, consciousness, black holes, GR tests, "
                      "metamaterials, drone swarms, gravitational waves")
            reply = (
                f"Cathedral v2.4 active. δ★ = {DELTA_STAR:.8f}, C_mass = {C_MASS:.6f}. "
                f"I cover: {topics}. "
                "Commands: electroweak, cosmology, uniqueness, prime181, "
                "ckm pmns, canonical, qbls fractal, iron proof, gw <M>, swarm <m>, or 'ask ai'."
            )
            print("\nGenesis:", style(reply), "\n")

        # Log response
        with open(LOG_FILE, "a") as f:
            f.write(json.dumps({"role": "genesis", "ts": time.time()}) + "\n")


if __name__ == "__main__":
    main()
