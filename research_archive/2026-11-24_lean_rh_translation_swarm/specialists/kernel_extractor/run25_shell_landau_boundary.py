#!/usr/bin/env python3
"""RUN25, 2026-11-25. Static-source only; OPEN RH.

One-equation mission (e0dc8f7faa1e35a5e3210b817b5b34f8d8cf20f1):
audit the minimal analytic consumer of the outer-shell bound, not another
archive sweep or a rederivation of the bound. Peer shell note 596dc680,
CountI note 0dfa42f3, Landau RUN24 and kernel RUN24 read. Preflight AGENTS,
SWARM, HANDOFF, EXPANSION, ONE_EQUATION_MISSION, continuity/log/protocol
excerpts, CI #425, 14 recent peer commit handoffs. Blueprint not reopened.
No physics or protected files changed.

RESULT: SOURCE-MATCHED generic Landau theorem and seven-field interface.
For the shell observable g(u)=-B_2(exp u), the generic theorem consumes
PoleData g Phi Z and WindowHypU g theta delta, NOT CharFamily. The separate
family adapter lemmaL creates poleData F and handles Re(s)>=1; the rpow
adapter additionally constructs WindowHyp. These are source distinctions,
not claims of absence from transitive kernel/import dependencies.

Exact human simplification: if Z has no real points, the residue-sign
condition in PoleData.pole is vacuous. More generally the real-pole arm
of landau_dichotomy cannot be entered if Z has no real point above theta.
The first statement permits constructing the original PoleData without
a separate residue-sign assumption; the second alone does not suffice
to construct PoleData (its sign condition covers ALL real poles).
For the zeta-only shell, use the separate proof of no positive real zeta
zeros (Euler product and alternating eta series), not the window bound.
Keep measurable g, exponential growth, Laplace identity, positive pole
real parts, differentiability off Z, isolation at every positive-real-part
point, nonzero simple residues and local analytic remainder. Keep both
theta inequalities, delta>0 and all window quantifiers/integrability.
No real-pole branch can supply the missing arithmetic cancellation.

Execution: 23 source assertions, 6 connector-reported pinned blob matches,
6/6 deliberate source mutations rejected in V8. Python replay below is
equivalent but not executed in this session. No lean/lake on local PATH;
the Lean probe below is PREPARED, NOT COMPILED, no axioms reported as fact.
The probe prints axioms separately for generic consumer, its helpers,
family adapter and new conditional wrapper. A nonempty list must be
reviewed; no claim of trust closure. Source checks are not kernel edges.
Latest upstream observed a18a350c3e5aad997766cff2670b292313e46574, unchanged
since RUN24. At that revision the first two source blobs below became
f4c5124f8a0188f85b60b2687864d531f9c0a3d8 and
c3ef70f724a72f916a4f17e1f3c52d73870e862a; other four old paths returned
404, not proof of removal. Do not mix pins or infer changed theorem status.

Usage: python run25_shell_landau_boundary.py /path/to/pinned/rh
       python run25_shell_landau_boundary.py /path/to/pinned/rh --lean
The latter requires the pinned built Lake environment and fails on errors.
RESUME HERE: run the probe in a built pinned environment or use shared
authenticated export to get actual axiom paths for Deduction.landau_window
versus Deduction.lemmaL. Then separately formalize the shell PoleData
supplier and obtain the missing one-sided prime bound. Do not substitute
a new graph count for the bound; do not duplicate queued raw archive work.
HANDOFF TO Landau, prime, integration, audit, dependencies, acceleration.
"""
import argparse
import hashlib
import pathlib
import re
import subprocess
import tempfile

PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
BASE = "src/Development/AutomorphicArithmetic/DedekindLFunctions/"
TARGETS = [
    ("LandauZeroFreeCriterion.lean","54fd0de979e0dad6ac7709ad8ecbec8a29e21872"),
    ("LandauTheorems/landauWindow.lean","7915058f10b33a52652290cd887cbccdc00e676a"),
    ("LandauTheorems/LandauDichotomy.lean","947dae363ce629febcba27b1b70355438f8639a0"),
    ("LandauTheorems/LandauPoleReLe.lean","205c7380b79e78b2752ed67aeb069f2a9d12cc77"),
    ("LandauTheorems/lemmaL.lean","6c37aebd05121b6d68e3532d8529f0ce8357386f"),
    ("LandauTheorems/ZeroFreeOfRpowWindow.lean","2ed00ad3aa862f3e522686557fb8f559b17fc002"),
]

def audit(rows):
    n = 0
    def ck(v, msg):
        nonlocal n
        if not v:
            raise AssertionError(msg)
        n += 1
    d,w,di,pr,l,z = rows
    fields = re.findall(r"^  (\w+) :",d.split("structure PoleData")[1].split("def WindowHypU")[0],re.M)
    ck(fields == "meas growth laplace pos diff iso pole".split(),"PoleData fields")
    wh = d.split("def WindowHypU")[1].split("open Classical")[0]
    for q in ["∀ η : ℝ, 0 < η → ∀ U₀ : ℝ, ∃ U : ℝ, U₀ ≤ U",
              "∃ R : ℝ → ℝ","IntegrableOn","Icc U ((1 + δ) * U)",
              "0 ≤ R u ∧ g u ≤ R u","≤ Real.exp (η * U)"]:
        ck(q in wh,q)
    th = w[w.index("theorem landau_window {"):]
    sig = th.split(":=")[0]
    ck(all(q in sig for q in ["(hP : PoleData g Φ Z)","(hW : WindowHypU g θ δ)","∀ ρ ∈ Z, ρ.re ≤ θ"]),"signature")
    for q in ["landau_window_key hP hθ hθ1 hδ hW","landau_pole_re_le hP",
              "landau_dichotomy hP.iso","landau_nearest hP.iso","hP.pole ρ hρ",
              "hP.pole β hβZ","hc (Complex.ofReal_im β)","landau_cauchy",
              "landau_pole_asym","landau_window_contra"]:
        ck(q in th,q)
    ck(not re.search(r"\b(CharFamily|zeroSet|ZeroFree|Gm|poleData|lemmaL)\b",th),"generic direct body")
    ck("(∃ β : ℝ, (β : ℂ) ∈ Z ∧ θ < β" in di,"real branch")
    ck(all(q in pr for q in ["hP.laplace","hP.growth","hP.pole"]),"pole bound")
    ck(all(q in l for q in ["poleData F","landau_window hP","windowHypU_of_windowHyp F",
                            "charFamily_LFunction_ne_zero_of_one_le_re"]),"family adapter")
    ck("lemmaL F hθ hθ1 hδ (windowHyp_of_rpow F hδ h)" in z,"rpow adapter")
    return n

LEAN = r"""
import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.ZeroFreeOfRpowWindow
open Complex MeasureTheory Set Filter Topology
noncomputable section

namespace ShellAudit
theorem poleDataOfNoReal {g : ℝ → ℝ} {Φ : ℂ → ℂ} {Z : Set ℂ}
    (hm : Measurable g)
    (hg : ∃ C : ℝ, ∀ u : ℝ, 0 ≤ u → |g u| ≤ C * Real.exp (2 * u))
    (hl : ∀ s : ℂ, 2 < s.re → Φ s = ∫ u in Ioi (0 : ℝ), (g u : ℂ) * cexp (-s * u))
    (hp : ∀ ρ ∈ Z, 0 < ρ.re)
    (hd : DifferentiableOn ℂ Φ ({s : ℂ | 0 < s.re} \ Z))
    (hi : ∀ z : ℂ, 0 < z.re → ∀ᶠ w in 𝓝[≠] z, w ∉ Z)
    (hn : ∀ ρ ∈ Z, ρ.im ≠ 0)
    (hr : ∀ ρ ∈ Z, ∃ c : ℂ, c ≠ 0 ∧
      ∃ h : ℂ → ℂ, AnalyticAt ℂ h ρ ∧ ∀ᶠ s in 𝓝[≠] ρ, Φ s = c / (s - ρ) + h s) :
    Deduction.PoleData g Φ Z := by
  refine ⟨hm, hg, hl, hp, hd, hi, ?_⟩
  intro ρ hρ
  obtain ⟨c, hc, h, ha, he⟩ := hr ρ hρ
  exact ⟨c, hc, fun him => (hn ρ hρ him).elim, h, ha, he⟩

-- No extra arithmetic premise is discharged by this wrapper.
theorem genericConsumer {g : ℝ → ℝ} {Φ : ℂ → ℂ} {Z : Set ℂ}
    (p : Deduction.PoleData g Φ Z) {θ δ : ℝ}
    (hθ : 0 < θ) (hθ1 : θ < 1) (hδ : 0 < δ)
    (w : Deduction.WindowHypU g θ δ) : ∀ ρ ∈ Z, ρ.re ≤ θ :=
  Deduction.landau_window p hθ hθ1 hδ w
end ShellAudit

#print axioms ShellAudit.poleDataOfNoReal
#print axioms ShellAudit.genericConsumer
#print axioms Deduction.landau_window
#print axioms Deduction.landau_window_key
#print axioms Deduction.landau_dichotomy
#print axioms Deduction.landau_pole_re_le
#print axioms Deduction.lemmaL
#print axioms Deduction.zeroFree_of_rpow_window
"""

def main():
    p = argparse.ArgumentParser()
    p.add_argument("root",type=pathlib.Path)
    p.add_argument("--lean",action="store_true")
    args = p.parse_args()
    root = args.root.resolve()
    def git(*a):
        return subprocess.check_output(["git",*a],cwd=root)
    rows = []
    for name,sha in TARGETS:
        b = git("show",PIN+":"+BASE+name)
        actual = hashlib.sha1(b"blob "+str(len(b)).encode()+b"\0"+b).hexdigest()
        if actual != sha:
            raise AssertionError((name,actual,sha))
        rows.append(b.decode())
    n = audit(rows)
    mutations = [(0,"  pos :","  removed :"),(0,"0 ≤ R u ∧ g u ≤ R u","g u ≤ R u"),
                 (1,"hc (Complex.ofReal_im β)","hc"),(2,"θ < β","θ ≤ β"),
                 (4,"poleData F","otherData F"),(5,"windowHyp_of_rpow F hδ h","h")]
    for i,a,b in mutations:
        changed = list(rows)
        if a not in changed[i]:
            raise AssertionError("missing control input")
        changed[i] = changed[i].replace(a,b,1)
        try:
            audit(changed)
        except (AssertionError,IndexError,ValueError):
            continue
        raise AssertionError("accepted corruption: "+a)
    print("STATIC-SOURCE", n, "assertions;",len(TARGETS),"blob checks;",len(mutations),"rejected controls")
    if args.lean:
        if git("rev-parse","HEAD").decode().strip() != PIN:
            raise AssertionError("native probe requires pinned HEAD")
        for name,sha in TARGETS:
            b=(root/(BASE+name)).read_bytes()
            if hashlib.sha1(b"blob "+str(len(b)).encode()+b"\0"+b).hexdigest()!=sha:
                raise AssertionError("dirty source: "+name)
        if (root/"lean-toolchain").read_text().strip()!="leanprover/lean4:v4.33.1":
            raise AssertionError("wrong toolchain")
        if git("status","--porcelain","--untracked-files=no").strip():
            raise AssertionError("dirty tracked checkout")
        with tempfile.TemporaryDirectory() as tmp:
            f=pathlib.Path(tmp)/"ShellAudit.lean"
            f.write_text(LEAN)
            proc=subprocess.run(["lake","env","lean",str(f)],cwd=root,text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
            print(proc.stdout)
            if proc.returncode or "sorryAx" in proc.stdout or "uses 'sorry'" in proc.stdout:
                raise SystemExit("native probe failed or reported sorry")
            print("Native probe executed; review printed axiom sets; imported .olean provenance and full independent kernel replay remain separate.")
    else:
        print("Lean not invoked; no axiom or kernel claim.")

if __name__=="__main__":
    main()
