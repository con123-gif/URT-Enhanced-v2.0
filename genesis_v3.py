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
        DELTA_STAR,
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
    )
    URT_OK = True
except ImportError as err:
    print(f"[Genesis] URT not found ({err}). Run: pip install -e .")
    URT_OK = False
    DELTA_STAR = 0.14751

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
    print("\n" + "=" * 65)
    print("GENESIS v3.0 — Cathedral Edition")
    print(f"δ★ = {DELTA_STAR:.8f}  |  13-site icosahedral shell  |  D=3 forced")
    print("Commands: web · ask ai · delta · spectrum · prove · ladder")
    print("          casimir · black hole <M> · logistic · exit")
    print("Lytollis Guard active. Science/math/music/life only.")
    print("=" * 65 + "\n")

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

        else:
            # Default: Cathedral-aware response
            reply = (
                "Cathedral substrate active. "
                f"δ★ = {DELTA_STAR:.8f} governs everything from epilepsy to the "
                "cosmological constant. Ask me anything — physics, mathematics, "
                "plasma, finance, consciousness, music. Or use 'ask ai' for "
                "the 70B LLM backbone."
            )
            print("\nGenesis:", style(reply), "\n")

        # Log response
        with open(LOG_FILE, "a") as f:
            f.write(json.dumps({"role": "genesis", "ts": time.time()}) + "\n")


if __name__ == "__main__":
    main()
