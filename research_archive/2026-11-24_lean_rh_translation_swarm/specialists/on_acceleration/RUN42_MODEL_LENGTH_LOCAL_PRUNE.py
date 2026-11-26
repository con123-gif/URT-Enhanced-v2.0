#!/usr/bin/env python3
"""RUN42, 26 Nov 2026 UTC. SOURCE-MATCHED / PREPARED, NOT COMPILED.
Mission latest f8b4b837301f8cf43d673be4979f04c4e4b415a4 read first, including
mandatory pipeline. SWARM/HANDOFF/EXPANSION/AGENTS openings consulted.
Peers f304da1a (shared CountI/CountV NumberU3U_s), 3b2b21cf (trace catalogue),
5adee016, 13df4d53, and own 619e11df inspected. Do not combine uncompiled peers.
Actual CountI -> OneCharU_s -> FOneCharU has the same-model comparison
  Vlen <= M.len, M.len != top, nrm(M.len) <= 2 sum vl(trace-t).
The upper model theorem never uses its introduced eta(sigma)=1 proof;
the lower theorem introduces IsUnit(2:O) anonymously, with no textual use.
Remove both at these actual consumers, not globally. FOneCharU still uses
D.eta_ker for isomorphism transport, odd l elsewhere, and retains all
nonvanishing, finiteness, rigidity, admissibility and length premises.
VlenLe drops only the unused IsUnit proof projection, retaining dat_facts hK.
Original selected graph: FOneCharU -> model_upper (eta sigma=1);
FOneCharU -> vlen_le -> model_lower (IsUnit 2); both -> same M.
Reduced selected graph: OneChar42 -> model_upper42, vlen_le42 -> model_lower42.
All original pinned files preserved, no global dependency deletion. Cache
by pin/toolchain/exact D,U,S,M,sigma,l,coefficient,character,caller role.
Backtrack on failed replay; transitive type/value/constructor/axiom evidence
unchanged and pending. No new essential premise closed or runtime speedup.
Baseline CI jobs actually fetched for 45577239749,45576756833,45670987597:
pick/run/record success each; none verifies this candidate.
Lean/lake absent locally. 51 executed fail-on-error source checks in connector
JS (blob, unique edits, reverse reconstruction, occurrences, retained
trace/length, bridge signatures); the Python generator below is unexecuted.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1, Mathlib
0df444a360eaa60ab8c11dca51a86af692955474.
RESUME HERE: generate fresh overlays, compile in order in warmed pinned
environment with existing engine oleans, audit original/reduced axioms and
rh_prune. If private resolution fails, use same-module overlays. Then
prioritize actual LemmaM/LemmaM' same-model budget and trace catalogue;
do not count premise edits as the missing quantitative proof.
HANDOFF TO kernel, audit, integration, Galois. RH OPEN.

Usage: python RUN42_MODEL_LENGTH_LOCAL_PRUNE.py PINNED_CHECKOUT NEW_STAGING
Compile generated modules in printed order with the pinned source and
existing engine oleans on LEAN_PATH; preserve actual compiler outputs.
"""
import argparse
import hashlib
import pathlib
import subprocess

PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
FILES = [
  [
    "RHModelUpper42",
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/ModelUpper.lean",
    "b5bd5708c17a55d1a0f190eb9908ff15e2b3cd44"
  ],
  [
    "RHModelLower42",
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/ModelLower.lean",
    "379b0931221b31a8931364fec40eb0bd9ad8962a"
  ],
  [
    "RHVlenLe42",
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/VlenLe.lean",
    "7366053a17524d379ac789425deea06678f2d3bf"
  ],
  [
    "RHOneChar42",
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/FOneCharU.lean",
    "3560d196d696e5ebceded72e747a060392837b91"
  ]
]
EDITS = [
  [
    [
      "theorem UpperTheory.V.U3.model_upper :",
      "theorem UpperTheory.V.U3.model_upper42 :"
    ],
    [
      "∀ σ : Γ, η σ = 1 →",
      "∀ σ : Γ,"
    ],
    [
      "hfin hpt σ hσ htr",
      "hfin hpt σ htr"
    ]
  ],
  [
    [
      "theorem UpperTheory.V.U3.model_lower :",
      "theorem UpperTheory.V.U3.model_lower42 :"
    ],
    [
      "(M : Model S K), IsUnit (2 : O) → Marks",
      "(M : Model S K), Marks"
    ],
    [
      "S M _ hm hM hU hΨ hN a ha MM",
      "S M hm hM hU hΨ hN a ha MM"
    ]
  ],
  [
    [
      "theorem UpperTheory.V.U3.vlen_le :",
      "theorem UpperTheory.V.U3.vlen_le42 :"
    ],
    [
      "⟨-, -, -, -, -, hK, h2, -⟩",
      "⟨-, -, -, -, -, hK, -, -⟩"
    ],
    [
      "model_lower S M h2 hg hM'",
      "model_lower42 S M hg hM'"
    ]
  ],
  [
    [
      "private theorem oneChar_unramU (",
      "private theorem oneChar_unramU42 ("
    ],
    [
      "theorem UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy :",
      "theorem UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy42 :"
    ],
    [
      "  have hσ : D.η (galEmb ℚ K Ω σ) = 1 := by\n    rw [← MonoidHom.mem_ker, D.η_ker]\n    exact galEmb_mem ℚ K Ω σ\n  have htr : ∀ f,",
      "  have htr : ∀ f,"
    ],
    [
      "model_upper S M hG.l_odd",
      "model_upper42 S M hG.l_odd"
    ],
    [
      "(galEmb ℚ K Ω σ) hσ\n",
      "(galEmb ℚ K Ω σ)\n"
    ],
    [
      "have hV := vlen_le hC hLM'",
      "have hV := vlen_le42 hC hLM'"
    ],
    [
      "refine oneChar_unramU hC",
      "refine oneChar_unramU42 hC"
    ]
  ]
]
IMPORTS = [
  [],
  [],
  [
    "RHModelLower42"
  ],
  [
    "RHModelUpper42",
    "RHVlenLe42"
  ]
]
BRIDGES = [
  [
    "model_upper",
    "model_upper42",
    "l _ c Γ H _ _ _ _ _ _ η Ψ N ι hι U I cc g₁ S M hl hmk hLM hfin hpt σ hσ htr",
    "S M hl hmk hLM hfin hpt σ htr"
  ],
  [
    "model_lower",
    "model_lower42",
    "O _ _ _ _ _ K _ _ Γ H _ _ _ _ _ _ η Ψ N ι hι U I cc g₁ S M _ hm hM hU hΨ hN a ha MM _ _ γ hinj hγ",
    "S M hm hM hU hΨ hN a ha MM γ hinj hγ"
  ]
]

def require(ok, msg):
    if not ok:
        raise RuntimeError(msg)

def unique(s, old, new):
    require(s.count(old) == 1, "not unique: " + old)
    return s.replace(old, new, 1)

def main():
    p = argparse.ArgumentParser()
    p.add_argument("source", type=pathlib.Path)
    p.add_argument("out", type=pathlib.Path)
    a = p.parse_args()
    head = subprocess.check_output(["git", "-C", str(a.source), "rev-parse", "HEAD"], text=True).strip()
    require(head == PIN, "wrong checkout")
    a.out.mkdir(parents=True, exist_ok=False)
    for i, (mod, path, sha) in enumerate(FILES):
        raw = (a.source / path).read_bytes()
        require(hashlib.sha1(b"blob " + str(len(raw)).encode() + bytes([0]) + raw).hexdigest() == sha, "wrong blob " + path)
        src = raw.decode("utf-8")
        t = src
        for old, new in EDITS[i]:
            t = unique(t, old, new)
        rev = t
        for old, new in reversed(EDITS[i]):
            rev = unique(rev, new, old)
        require(rev == src, "round trip " + mod)
        if i < 2:
            old, new, intro, args = BRIDGES[i]
            marker = "theorem UpperTheory.V.U3." + old + " :"
            require(src.count(marker) == 1, "bridge signature")
            sig = src.split(marker, 1)[1].split(" := by", 1)[0]
            require("intro " + intro in src, "bridge intro")
            t += "\n\ntheorem UpperTheory.V.U3." + old + "42_original :" + sig + " := by\n  intro " + intro + "\n  first\n  | (rh_reduce 1 using [" + new + "]; done)\n  | (rh_auto_frontier 1; done)\n  | (rh_auto 1; done)\n  | exact " + new + " " + args + "\n"
        extra = ["RHProofTermPrune", "RHRecursiveReductionFixed", "RHRecursiveReductionAutoV3"] + IMPORTS[i]
        if i < 2:
            extra += [path.removeprefix("src/").removesuffix(".lean").replace("/", ".")]
        t = "".join("import " + imp + "\n" for imp in extra) + t
        (a.out / (mod + ".lean")).write_text(t, encoding="utf-8")
        print("SOURCE-MATCHED", mod, sha, "native compilation not run")
    audit = """import RHOneChar42
rh_prune UpperTheory.V.U3.model_upper as RHModelUpperNative42Pruned
rh_prune UpperTheory.V.U3.model_lower as RHModelLowerNative42Pruned
rh_scan UpperTheory.V.U3.model_upper limit 2000
rh_scan UpperTheory.V.U3.model_upper42 limit 2000
rh_scan UpperTheory.V.U3.model_lower limit 2000
rh_scan UpperTheory.V.U3.model_lower42 limit 2000
rh_scan UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy limit 2000
rh_scan UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy42 limit 2000
#print axioms UpperTheory.V.U3.model_upper42
#print axioms UpperTheory.V.U3.model_upper42_original
#print axioms UpperTheory.V.U3.model_lower42
#print axioms UpperTheory.V.U3.model_lower42_original
#print axioms UpperTheory.V.U3.vlen_le42
#print axioms UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy42
"""
    (a.out / "RHModelLengthAudit42.lean").write_text(audit, encoding="utf-8")
    print("Compile order:", " ".join(row[0] for row in FILES), "RHModelLengthAudit42")

if __name__ == "__main__":
    main()
