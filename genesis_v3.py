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
    print("GENESIS v3.0 — Cathedral Edition")
    print(f"δ★ = {DELTA_STAR:.8f}  |  C_mass = {C_MASS:.6f}  |  D=3 forced")
    print("Commands: web · ask ai · delta · spectrum · prove · ladder")
    print("          casimir · black hole <M> · logistic")
    print("          periodic · holography · consciousness · riemann")
    print("          metamaterial · swarm [m] · gw [M☉] · exit")
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

        else:
            # Default: Cathedral-aware response
            topics = ("periodic table, holography, consciousness, Riemann zeros, "
                      "metamaterials, drone swarms, gravitational waves, plasma, "
                      "black holes, epilepsy, the cosmological constant")
            reply = (
                f"Cathedral substrate active. δ★ = {DELTA_STAR:.8f}, C_mass = {C_MASS:.6f}. "
                f"I cover: {topics}. "
                "Use a command (gw 65, swarm 200, holography...) or 'ask ai' for the 70B backbone."
            )
            print("\nGenesis:", style(reply), "\n")

        # Log response
        with open(LOG_FILE, "a") as f:
            f.write(json.dumps({"role": "genesis", "ts": time.time()}) + "\n")


if __name__ == "__main__":
    main()
