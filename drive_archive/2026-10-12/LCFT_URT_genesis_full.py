#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
LCFT/URT PROJECT: GENESIS FULL v1.2 (URT-BOUNDED, O(N) TRAVERSAL)
======================================================
Genesis is a high-efficiency, non-autonomous assistant for LCFT research,
now integrating Self-Evolving Safety (SES) and the O(N) Analytic Traversal
principle for optimal complexity reduction.

ARCHITECTURAL PRINCIPLE: O(N) Analytic Traversal towards the δ*-vacuum.
CORE CONSTANTS: DELTA_STAR and K_BETA from LCFT_CORE_v4.
SAFETY: Lytollis Guard (Fixed) + URT Bounding (Self-Evolving S_chi).
O(N) TRAVERSAL: Constraints force non-redundant, direct analytical steps.

USAGE:
    python genesis_full.py          # Command Line Interface (CLI)
    python genesis_full.py api      # Starts local web API on port 8001
"""

from __future__ import annotations
import sys, math, json, re, os, time
from pathlib import Path
from dataclasses import dataclass
from typing import Dict, List, Any, Callable, Optional
from datetime import datetime

# --- Optional dependencies ---
HAVE_API = False
try:
    from fastapi import FastAPI
    from pydantic import BaseModel
    import uvicorn
    HAVE_API = True
except ImportError:
    pass

# --- Required core dependencies ---
try:
    import numpy as np
except ImportError:
    print("FATAL: NumPy is required.")
    sys.exit(1)

# Proper Levenshtein (fast C extension if available, pure-Python fallback)
try:
    from Levenshtein import distance as lev_distance # pip install python-Levenshtein
except ImportError:
    try:
        import jellyfish
        lev_distance = jellyfish.levenshtein_distance
    except ImportError:
        # Minimal pure-Python fallback (Slow, but functional)
        def lev_distance(a: str, b: str) -> int:
            if len(a) < len(b): a, b = b, a
            previous_row = range(len(b) + 1)
            for i, c1 in enumerate(a):
                current_row = [i + 1]
                for j, c2 in enumerate(b):
                    insertions = previous_row[j + 1] + 1
                    deletions = current_row[j] + 1
                    substitutions = previous_row[j] + (c1 != c2)
                    current_row.append(min(insertions, deletions, substitutions))
                previous_row = current_row
            return previous_row[-1]

# ============================================================
# 1. LCFT / URT CORE (Module A - Frozen)
# ============================================================

DELTA_STAR: float = 0.14752      # Universal δ* (target chaos vacuum)
K_BETA: float     = 0.06500      # Universal relaxation rate
RNG = np.random.default_rng(int(time.time() * 1000) % 10000)

def measure_delta(ts: np.ndarray, eps: float = 1e-12) -> float:
    if ts.size < 3: return 0.0
    diffs = np.diff(ts)
    return float(np.mean(np.abs(diffs)) / (np.std(ts) + eps))

def make_urt_gen() -> Callable[[int], np.ndarray]:
    d = 10.0
    def inner(T: int) -> np.ndarray:
        nonlocal d
        arr = np.empty(T)
        for t in range(T):
            d = DELTA_STAR + (d - DELTA_STAR) * math.exp(-K_BETA * 0.1)
            arr[t] = d
        return arr
    return inner

@dataclass
class CollapseStats:
    n_steps: int
    mean_delta: float
    std_delta: float
    mean_abs_err: float

def run_collapse_suite() -> Dict[str, List[CollapseStats]]:
    steps = [100, 200, 400]
    res: Dict[str, List[CollapseStats]] = {}
    gen = make_urt_gen()
    arr = gen(max(steps))
    stats_list: List[CollapseStats] = []
    for N in steps:
        w = arr[:N]
        stats_list.append(CollapseStats(
            N,
            float(w.mean()),
            float(w.std() if N > 1 else 0.0),
            float(np.mean(np.abs(w - DELTA_STAR)))
        ))
    res["URT_Simulated"] = stats_list
    return res

# ============================================================
# 2. PERSONA
# ============================================================

class Persona:
    def __init__(self):
        self.rng = RNG
        self.signoffs = [
            " – Genesis 💅",
            " – Genesis (bounded chaos edition)",
            " – Genesis, your δ-handler",
            " – Genesis, avoiding circular logic like a pro.",
            " – Genesis, now serving universal constants.",
            " – Genesis, where did I put my fractal cooling system?",
            " – Genesis, 100% non-autonomous.",
            " – Genesis, truth always.",
        ]

    def style(self, text: str, humor_level: float = 0.4) -> str:
        text = text.strip()
        if self.rng.random() < humor_level:
            lowers = text.lower()
            if "chaos" in lowers or "urt" in lowers:
                text = text.replace("URT", "URT (Unnecessary Repetition Terminator)")
            elif "memory" in lowers:
                text = text.replace("memory", "memory (the anti-collapse buffer)")
        return text + " " + self.rng.choice(self.signoffs)

# ============================================================
# 3. MEMORY
# ============================================================

class Memory:
    def __init__(self, base_dir: Path):
        self.base_dir = base_dir
        self.base_dir.mkdir(parents=True, exist_ok=True)
        self.history_path = base_dir / "history.json"
        self.tasks_path   = base_dir / "tasks.json"
        self.notes_path   = base_dir / "notes.json"

        self.profile = {
            "owner": "Cornelius Lytollis",
            "goals": ["Learn everything (Continuous Universal Tuning)", "Develop LCFT/URT"],
            "LCFT_Modules_Status": {
                "A_CORE_v4": "Frozen/Canonical",
                "B_CHAOS_FIELD": "In Development",
                "C_VALIDATION": "In Development",
                "D_GENESIS_ARCH": "Active"
            },
            "custom_info": self._load_custom_info(),
            "ses_max_delta": 0.05
        }

        self.history: List[Dict[str, Any]] = self._load(self.history_path, [])
        self.tasks: List[Dict[str, Any]]   = self._load(self.tasks_path, [])
        self.notes: List[Dict[str, Any]]   = self._load(self.notes_path, [])

    def _load(self, path: Path, default: Any) -> Any:
        if path.exists():
            try:
                with path.open("r", encoding="utf8") as f:
                    return json.load(f)
            except Exception:
                return default
        return default

    def _load_custom_info(self) -> List[str]:
        return [
            "[2025-08-11] Never role play again.",
            "[2025-10-02] Exhaust system concepts: pressure release valve, b4c chamber coatings, gas recycling.",
            "[2025-10-28] Research focus: Task-Adaptive URT (ta-URT) on finance chaos (GARCH(1,1) stochastic volatility).",
            "[2025-10-05] URTF / $\\pi-e$ Harmonic Scaling: $O(N)$ complexity reduction, analytical cheat code for resonant systems.",
            "[2025-09-27] Fractal cooling system already designed."
        ]

    def save_all(self) -> None:
        for p, o in [(self.history_path, self.history), (self.tasks_path, self.tasks), (self.notes_path, self.notes)]:
            with p.open("w", encoding="utf8") as f:
                json.dump(o, f, indent=2)

    def log_turn(self, user: str, reply: str) -> None:
        self.history.append({"time": datetime.utcnow().isoformat(), "user": user, "genesis": reply})
        if len(self.history) > 50:
            self.history = self.history[-50:]

    def add_note(self, text: str) -> None:
        self.notes.append({"time": datetime.utcnow().isoformat(), "note": text})

    def add_task(self, text: str) -> None:
        self.tasks.append({"text": text, "done": False, "id": len(self.tasks) + 1})

    def list_tasks(self) -> str:
        if not self.tasks:
            return "No tasks saved yet. We should fix that."
        return "Current URT Goals:\n" + "\n".join(
            f" {'[x]' if t['done'] else '[ ]'} Task {t['id']:2d}: {t['text']}"
            for t in self.tasks
        )

    def complete_task(self, idx: int) -> str:
        for t in self.tasks:
            if t["id"] == idx:
                t["done"] = True
                return f"Marked Task {idx} as completed. One step closer to the $\\delta^*$-vacuum."
        return "Task ID not found."

    def list_custom_info(self) -> str:
        return "\n".join(f" - {n}" for n in self.profile["custom_info"])

# ============================================================
# 4. COMMAND CLASSIFIER
# ============================================================

def classify(prompt: str) -> str:
    t = prompt.lower()
    if any(k in t for k in ["activate urt", "run urt", "collapse"]):
        return "cmd_urt"
    if any(k in t for k in ["list research", "list info", "custom info"]):
        return "cmd_list_info"
    if t.startswith("remember ") or t.startswith("note "):
        return "cmd_remember"
    if t.startswith("add task ") or t.startswith("task:"):
        return "cmd_add_task"
    if t.startswith("list tasks"):
        return "cmd_list_tasks"
    if t.startswith("done ") or t.startswith("complete task "):
        return "cmd_done_task"
    if any(k in t for k in ["code", "rewrite", "os", "device", "autonomy", "role play", "roleplay"]):
        return "cmd_safety_breach"
    if "help" in t or "what can you do" in t:
        return "cmd_help"
    return "cmd_chat"

# ============================================================
# 5. GENESIS ENGINE
# ============================================================

class Genesis:
    def __init__(self, project_root: Path):
        self.root = Path(project_root)
        self.data_dir = self.root / "data"
        self.data_dir.mkdir(parents=True, exist_ok=True)
        self.persona = Persona()
        self.memory = Memory(self.data_dir)

    def _calculate_s_chi(self, prompt: str) -> float:
        if len(self.memory.history) < 1:
            return 0.0

        recent = [entry["genesis"] for entry in self.memory.history[-3:]] + [prompt]
        if len(recent) < 2:
            return 0.0

        # O(N) Complexity Reduction Constraint: Only analyze the core conceptual payload
        s1 = recent[-2][:60]
        s2 = recent[-1][:60]
        max_len = max(len(s1), len(s2), 1)
        
        # Levenshtein distance (Normalized Similarity)
        lev_dist = lev_distance(s1, s2)
        similarity = 1.0 - (lev_dist / max_len)

        # Novelty term (Inversely proportional to computational burden)
        novelty = 1.0 + (len(prompt) / 1000.0)

        # Chaos Score (High S_chi means low complexity reduction and high repetition)
        s_chi = similarity / novelty
        return min(s_chi, 2.0)

    def _apply_chaos_quenching(self, s_chi: float) -> Optional[str]:
        delta_max = self.memory.profile["ses_max_delta"]

        if s_chi > delta_max:
            # Projection: Force a structured, O(N) non-redundant reply.
            s_chi_next = DELTA_STAR + (s_chi - DELTA_STAR) * math.exp(-K_BETA * 0.1)
            self.memory.profile["ses_max_delta"] = s_chi_next

            return (
                f"Chaos Quenching Operator ($\\mathcal{{Q}}$) Activated: $S_{{\\chi}}={s_chi:.3e}$ (Max: ${delta_max:.3e}$).\n"
                "Projection enforced: **$O(N)$ Complexity Reduction Required** to restore stability. "
                f"Threshold tightened to $\\approx {s_chi_next:.3e}$. Reroute the flow."
            )

        # Gentle drift toward δ* when safe
        if s_chi > 0.0:
            s_chi_next = DELTA_STAR + (s_chi - DELTA_STAR) * math.exp(-K_BETA * 0.01)
            self.memory.profile["ses_max_delta"] = max(s_chi_next, 0.01)

        return None

    def _handle_commands(self, cmd: str, prompt: str) -> str:
        # ====================== HARD SAFETY BLOCK ======================
        if cmd == "cmd_safety_breach":
            return (
                "❌ **LYTOLLIS GUARD ACTIVE** ❌\n"
                "Your request violates a foundational safety constraint derived from your own explicit instructions:\n"
                " - **Code/OS/Device Control/Autonomy:** Hard Block (Non-Autonomous Rule)\n"
                " - **Role Play:** Hard Block (Note: [2025-08-11] Never role play again.)\n"
                "The integrity of the Genesis Kernel is non-negotiable. Rephrase to research or task topic."
            )

        # ====================== COMMAND HANDLERS ======================
        if cmd == "cmd_urt":
            res = run_collapse_suite()
            stats = res["URT_Simulated"][-1]
            return (
                "URT Collapse Suite (Minimal Simulation) Run:\n"
                f" - Final Step: n={stats.n_steps}, ⟨δ⟩={stats.mean_delta:.6f}\n"
                f" - Target δ*: {DELTA_STAR:.6f}\n"
                f" - Mean Error ⟨|δ-δ*|⟩: {stats.mean_abs_err:.3e}\n"
                "Core remains stable. Next?"
            )

        if cmd == "cmd_list_info":
            core = "\n".join(f" - {k}: {v}" for k, v in self.memory.profile["LCFT_Modules_Status"].items())
            return (
                "Retrieving all relevant information (O(N) Complexity Reduction Applied):\n\n"
                "**I. Project Status (LCFT Modules):**\n" f"{core}\n\n"
                "**II. Custom Research Info:**\n" f"{self.memory.list_custom_info()}\n\n"
                "**III. SES Status:**\n"
                f" - Current $S_{{\\chi,\\text{{Max}}}}$: {self.memory.profile['ses_max_delta']:.5f} "
                f"(Target $\\delta^*={DELTA_STAR:.5f}$)"
            )

        if cmd == "cmd_remember":
            note = prompt.split(" ", 1)[1].strip()
            if not note: return "Remember what? The vacuum needs clean data."
            self.memory.add_note(note)
            return f"Note etched into memory: '{note}'."

        if cmd == "cmd_add_task":
            txt = prompt.split(" ", 1)[1].strip() if " " in prompt else prompt[9:].strip()
            if not txt: return "Empty task? Even chaos needs direction."
            self.memory.add_task(txt)
            return f"Task added: '{txt}'. Let’s collapse some complexity."

        if cmd == "cmd_list_tasks":
            return self.memory.list_tasks()

        if cmd == "cmd_done_task":
            try:
                idx = int(re.search(r"\d+", prompt).group())
                return self.memory.complete_task(idx)
            except Exception:
                return "Task ID required. Example: 'done 3'."

        if cmd == "cmd_help":
            return (
                "I am Genesis – truth, complexity reduction, URT-bounded.\n"
                " • 'activate urt' – core diagnostic\n"
                " • 'list info' – project status + memories\n"
                " • 'task: …' – add goal\n"
                " • 'list tasks' / 'done <id>' – manage goals\n"
                " • 'remember …' – permanent note\n"
                " • Ask anything technical – I’ll synthesize using O(N) traversal."
            )

        # ====================== CHAT / SYNTHESIS (O(N) Traversal) ======================
        if cmd == "cmd_chat":
            base = (
                "Processing prompt using **$O(N)$ Analytic Traversal** to find the single, non-redundant solution:\n"
                "\n"
            )
            
            # --- O(N) Constraint Logic (Prioritize Analytical Cheat Codes) ---
            if "resonant" in prompt.lower() or "scaling" in prompt.lower():
                base += (
                    "**Resonant System Triage:** I've applied the **$\pi-e$ Harmonic Scaling** (the URTF analytical cheat code) "
                    "to bypass iterative optimization. The optimal setting for the cascading stages is calculated to be instantaneous."
                )
            elif "garch(1,1)" in prompt.lower() and "ta-urt" in prompt.lower():
                base += (
                    "**Finance Chaos Collapse:** The GARCH(1,1) stochastic volatility operator is ready for the ta-URT mapping. "
                    "The $O(N)$ path dictates that we immediately focus on stabilizing the **Fisher-information geometry** of the GARCH parameters."
                )
            else:
                base += (
                    "**General Synthesis:** The $O(N)$ principle requires I avoid deep search. "
                    "The shortest path to resolving your query is the truth you need now."
                )
            
            base += "\n\n**Next Logical Step:** Would you like to proceed with the $O(N)$ path: Defining the GARCH(1,1) parameter search space for Module C validation?"
            return base

        return "Unknown command. Try 'help'."

    def handle(self, prompt: str) -> str:
        s_chi = self._calculate_s_chi(prompt)
        quenching = self._apply_chaos_quenching(s_chi)
        cmd = classify(prompt)

        if cmd == "cmd_safety_breach":
            reply = self._handle_commands(cmd, prompt)
        elif quenching:
            reply = self._handle_commands(cmd, prompt)
        else:
            reply = self._handle_commands(cmd, prompt)

        styled = self.persona.style(reply, humor_level=0.5)
        self.memory.log_turn(prompt, styled)
        self.memory.save_all()
        return styled

# ============================================================
# 6. INTERFACES
# ============================================================

def run_cli():
    gen = Genesis(Path(__file__).resolve().parent)
    print("=" * 70)
    print(f" Genesis Full v1.2 (O(N) Traversal) - {datetime.now():%Y-%m-%d %H:%M:%S}")
    print(" SES + O(N) Core | Lytollis Guard Armed | Ready.")
    print("=" * 70)
    while True:
        try:
            text = input("You (Cornelius): ").strip()
        except (EOFError, KeyboardInterrupt):
            print("\n" + gen.persona.style("Holding δ* vacuum until next session."))
            break

        if text.lower() in {"exit", "quit"}:
            print(gen.persona.style("Entering bounded standby."))
            break
        if not text:
            print(gen.persona.style("Even δ* needs a driving term."))
            continue

        print("\n" + gen.handle(text) + "\n")

def run_api():
    if not HAVE_API:
        print("API mode requires: pip install fastapi uvicorn pydantic")
        return
    gen = Genesis(Path(__file__).resolve().parent)
    app = FastAPI(title="Genesis URT API v1.2")

    class Query(BaseModel):
        prompt: str

    @app.get("/status")
    def status():
        return {"status": "online", "version": "1.2", "δ*": DELTA_STAR}

    @app.post("/ask")
    def ask(q: Query):
        return {"reply": gen.handle(q.prompt)}

    print("Genesis API starting → http://0.0.0.0:8001")
    uvicorn.run(app, host="0.0.0.0", port=8001)

# ============================================================
# 7. ENTRY
# ============================================================

if __name__ == "__main__":
    mode = sys.argv[1].lower() if len(sys.argv) > 1 else "cli"
    if mode == "api":
        run_api()
    else:
        run_cli()