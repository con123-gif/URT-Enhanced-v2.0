#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
GENESIS vTest
-------------
Single-file unified Genesis + URT.

Features:
- Female persona with humour
- No circles
- No repeats
- Persistent JSON memory
- URT Master Engine built-in
- One-file. No API keys. No external bullshit.
"""

import os, json, math, re
from pathlib import Path
import numpy as np

# ============================================================
# URT MASTER ENGINE — BUILT IN
# ============================================================

DELTA_STAR = 0.14752
K_BETA     = 0.065
RNG        = np.random.default_rng(12345)

def delta_from_DKY_tau(D_KY, tau):
    return (D_KY - 1)*(tau - 2)

def logistic_step(x, r):
    return r * x * (1 - x)

def estimate_local_lyap(x, r):
    d = abs(r*(1-2*x))
    return math.log(max(d, 1e-12))

def surrogate_delta(x, r):
    lam = max(estimate_local_lyap(x,r), 0)
    D_KY = 1 + 0.35*lam
    tau  = 2 + 0.85/(lam+0.02)
    return delta_from_DKY_tau(D_KY, tau)

def urt_step(x, r):
    d = surrogate_delta(x,r)
    r_next = r * math.exp(-K_BETA*(d-DELTA_STAR))
    r_next = min(max(r_next,0),4)
    x_next = logistic_step(x,r_next)
    return x_next, r_next, d

def run_urt(n=4000, x0=0.1234, r0=3.9):
    x, r = x0, r0
    deltas=[]
    for i in range(n):
        x,r,d = urt_step(x,r)
        if i>300:
            deltas.append(d)
    arr = np.array(deltas)
    return {
        "mean_delta": float(arr.mean()),
        "std_delta": float(arr.std()),
        "mean_abs_err": float(np.mean(np.abs(arr-DELTA_STAR)))
    }

# ============================================================
# GENESIS PERSONA / MEMORY / GUARDS
# ============================================================

class Persona:
    def __init__(self):
        import numpy as np
        self.rng=np.random.default_rng(98765)
        self.sign=[
            " – Genesis 💅",
            " – Genesis 🐉",
            " – Genesis (bounded chaos edition)"
        ]

    def style(self,text):
        return text.strip()+" "+self.rng.choice(self.sign)

class Memory:
    def __init__(self):
        self.dir=Path("data")
        self.dir.mkdir(exist_ok=True)
        self.path=self.dir/"mem.json"
        if self.path.exists():
            try:
                self.mem=json.loads(self.path.read_text())
            except:
                self.mem={}
        else:
            self.mem={}
        self.mem.setdefault("history",[])
    def save(self):
        self.path.write_text(json.dumps(self.mem,indent=2))
    def log(self,u,g):
        self.mem["history"].append({"u":u,"g":g})
        if len(self.mem["history"])>500:
            self.mem["history"]=self.mem["history"][-500:]
        self.save()

class NoRepeat:
    def __init__(self):
        self.seen=set()
    def check(self,t):
        t=t.lower().strip()
        if t in self.seen:
            return True
        self.seen.add(t)
        return False

def is_circular(t):
    t=t.lower()
    return any(k in t for k in ["repeat","again","said already","circle"])

# ============================================================
# GENESIS CORE
# ============================================================

class Genesis:
    def __init__(self):
        self.persona=Persona()
        self.memory=Memory()
        self.norep=NoRepeat()

    def handle(self, prompt:str):
        # guards
        if self.norep.check(prompt):
            reply="I'm not repeating myself, sweetheart."
            fin=self.persona.style(reply)
            self.memory.log(prompt,fin)
            return fin
        if is_circular(prompt):
            reply="We are not going in circles today. New angle please."
            fin=self.persona.style(reply)
            self.memory.log(prompt,fin)
            return fin

        t=prompt.lower().strip()

        # URT
        if t in ["activate urt","run urt","urt","run collapse"]:
            r=run_urt()
            msg=(
                "URT activated.\n"
                f"⟨δ⟩ = {r['mean_delta']:.5f}\n"
                f"std = {r['std_delta']:.5f}\n"
                f"⟨|δ-δ*|⟩ = {r['mean_abs_err']:.4e}\n"
                f"Target δ* = {DELTA_STAR}"
            )
            fin=self.persona.style(msg)
            self.memory.log(prompt,fin)
            return fin

        # Research listing
        if "list research" in t:
            d=Path("data/research")
            if not d.exists(): 
                fin=self.persona.style("No research directory yet.")
                self.memory.log(prompt,fin)
                return fin
            files=[str(p.name) for p in d.glob("*") if p.is_file()]
            if not files:
                fin=self.persona.style("Research folder empty.")
                self.memory.log(prompt,fin)
                return fin
            msg="I see these research files:\n"+"\n".join(" - "+f for f in files)
            fin=self.persona.style(msg)
            self.memory.log(prompt,fin)
            return fin

        # Help
        if "help" in t:
            msg=(
                "I can:\n"
                " - activate urt\n"
                " - list research\n"
                " - be your assistant\n"
            )
            fin=self.persona.style(msg)
            self.memory.log(prompt,fin)
            return fin

        # Default chat
        msg=f"You said: “{prompt}”. I'm here, with URT in my core."
        fin=self.persona.style(msg)
        self.memory.log(prompt,fin)
        return fin

# ============================================================
# CLI
# ============================================================

if __name__=="__main__":
    gen=Genesis()
    print(gen.persona.style("Genesis test instance online."))
    while True:
        try:
            t=input("You: ")
        except (EOFError,KeyboardInterrupt):
            print("\n"+gen.persona.style("Shutting down. δ* remains guarded."))
            break
        if t.lower().strip() in ["quit","exit"]:
            print(gen.persona.style("Goodbye, troublemaker."))
            break
        print(gen.handle(t))
