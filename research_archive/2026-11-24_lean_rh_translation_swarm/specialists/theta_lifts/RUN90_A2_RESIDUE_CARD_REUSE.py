#!/usr/bin/env python3
"""RUN90 — use the pinned Mathlib characteristic/cardinality theorem
at the actual A2 residue-characteristic helper (not a new RH route).

27 Nov 2026. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Current mission/spine/ledger:
3adc76221a978016e3505cdf3e36ad688354d7d7 /
40aaf0afcc897a74d688bd6e9bae708428ffdabd /
579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, SWARM, HANDOFF and EXPANSION read. Peer RUN87 acceleration
8025afa5d8b70280627ca6c6a4fe1e1bdabc88ee cache intake and RUN63 kernel
869e5afc0af1029194b4d8407f141c1a0822a6a6 common map work inspected by
commit metadata; no competing cold build or new branch.

Exact reduction: in RUN82.cast_prime_ne_zero_of_card_prime, retain
the statement, local field k, cardinal q, distinct primes p and q.
The pinned Mathlib/Algebra/CharP/CharAndCard.lean (blob
b8a85da389100d453d79c8e951fa6a4e651d106b, lines 82–85) already proves
charP_of_card_eq_prime with Fact q.Prime, using Nat.cast_card_eq_zero
and CharP.charP_iff_prime_eq_zero. Thus q is the characteristic and
p=0 in k implies q divides p, hence q=p. Contradiction.
No finite-field power classification, ringChar extraction, positive
exponent or prime-power divisibility lemma is needed in this helper.
The proposed body uses the exact same original statement and local
context. The old body remains preserved. Negative mathematical control:
if p=q, the cast is zero, so the distinctness premise is essential.
No claim of deleting those dependencies globally (or even transitively
until native graph checked); no new mathematical input.

Actual source verification this run: pinned RUN82 blob
f8f7fbd14a1d8372e71e46dc5438ec886ecd9d25 and CharAndCard blob above
retrieved; exact old-body unique substitution and byte-string roundtrip
checked using JS on actual connector source; two negative controls
(mutated body, duplicate anchor) rejected. No Lean compilation.
Local shell lean/lake/elan absent, git remote DNS failed. Shared
A1/A2 run 46023465491 actual status ERROR, blob
07a2b14930c38095e6771ae9ed1a10a3cf1bf678. RUN61 retry status and
cache manifest still 404 on state branch. Separate C1/C2 run
46055305146 in progress at inspection, not A2 evidence.
No rh_scan/prune/reduce/auto/frontier native execution, no new PASS.

This wrapper reuses the authenticated RUN89 generator; creates a separate
candidate with only this body and one explicit import changed, then
optionally replays it with the existing full-statement and axiom audit.
The previous source and receipt stay intact. No changes to upstream
checkout, registry, live ledger, protected workflows or schedule.
All A1–A3/B/C/D/E/V remain open. Context includes same D and chosen
place w, q=D.g i, actual p from stabilizer, not arbitrary adelic point.

RESUME HERE: in shared original compact checkout with accepted cache,
run this file ROOT NEW_OUT --replay; require actual exit 0 and one
THETA89_LEAF_CHECKED. If failure, inspect first actual diagnostic.
Only on success carry the exact verified helper body to RUN88 caller
transport, then check strict constructor-inclusive graph/axioms.
HANDOFF TO kernel / acceleration / integration / audit.
"""
import argparse
import hashlib
import json
import pathlib
import re
import shutil
import subprocess
import sys

HERE = pathlib.Path(__file__).resolve().parent
OLD = "  intro hz\n  obtain ⟨a, hchar, hpow⟩ := FiniteField.card k (ringChar k)\n  have hdiv : ringChar k ∣ q := by\n    rw [← hc, hpow]\n    exact dvd_pow_self _ a.ne_zero\n  have heq : ringChar k = q := (Nat.prime_dvd_prime_iff_eq hchar hq).1 hdiv\n  have hdp : ringChar k ∣ p := (CharP.cast_eq_zero_iff k (ringChar k) p).1 hz\n  exact hne ((Nat.prime_dvd_prime_iff_eq hchar hp).1 hdp |>.symm.trans heq)"
NEW = "  letI : Fact q.Prime := ⟨hq⟩\n  letI : CharP k q := charP_of_card_eq_prime hc\n  intro hz\n  exact hne ((Nat.prime_dvd_prime_iff_eq hq hp).1\n    ((CharP.cast_eq_zero_iff k q p).1 hz)).symm"
IMPORT = "import Mathlib.Algebra.CharP.CharAndCard\n"

def require(ok, why):
    if not ok:
        raise RuntimeError(why)

def substitute(src):
    require(src.count(OLD) == 1, "old residue body not unique")
    require(src.count(NEW) == 0, "already replaced")
    require(src.count("import Lean\n") == 1, "import boundary changed")
    require(IMPORT not in src, "duplicate explicit import")
    result = src.replace(OLD, NEW).replace("import Lean\n", IMPORT + "import Lean\n")
    require(result.replace(NEW, OLD).replace(IMPORT, "") == src, "roundtrip failed")
    return result

def main():
    p = argparse.ArgumentParser()
    p.add_argument("root", type=pathlib.Path)
    p.add_argument("out", type=pathlib.Path)
    p.add_argument("--replay", action="store_true")
    a = p.parse_args()
    root, out = a.root.resolve(), a.out.resolve()
    require(root != out and root not in out.parents, "external output required")
    require(not out.exists(), "preserve prior output")
    out.mkdir(parents=True)
    original = out / "run89-original"
    subprocess.run([sys.executable, str(HERE / "RUN89_A2_LEAF_ONLY_REPLAY.py"),
                    str(root), str(original)], check=True)
    src = (original / "ThetaFreenessLeafRun89.lean").read_text()
    patched = substitute(src)
    rejected = 0
    for bad in [src.replace("FiniteField.card k (ringChar k)", "FiniteField.card k p", 1),
                src + OLD]:
        try:
            substitute(bad)
        except RuntimeError:
            rejected += 1
        else:
            raise RuntimeError("damaged source accepted")
    require(rejected == 2, "negative controls")
    candidate = out / "ThetaFreenessLeafRun90.lean"
    candidate.write_text(patched)
    receipt = {"original_receipt": "run89-original/receipt.json",
               "candidate_sha256": hashlib.sha256(candidate.read_bytes()).hexdigest(),
               "negative_controls_rejected": rejected,
               "native_verified": False, "strict_graph_verified": False,
               "full_RH_replay": False}
    def save():
        (out / "receipt.json").write_text(json.dumps(receipt, indent=2) + "\n")
    save()
    if not a.replay:
        print("RUN90 source generation only; not native PASS")
        return
    require(shutil.which("lake"), "lake unavailable; source receipt preserved")
    log = out / "theta90.log"
    with log.open("w") as f:
        proc = subprocess.run(["lake", "env", "lean", "--tstack=400000", str(candidate)],
                              cwd=root / "grh-compact", stdout=f, stderr=subprocess.STDOUT)
    result = log.read_text(errors="replace")
    marker = result.count("THETA89_LEAF_CHECKED")
    receipt.update(returncode=proc.returncode, marker_count=marker,
                   log_sha256=hashlib.sha256(log.read_bytes()).hexdigest())
    receipt["native_verified"] = (proc.returncode == 0 and marker == 1 and
                                  not re.search(r"\berror(?:\([^)]*\))?:|sorryAx", result))
    save()
    require(receipt["native_verified"], "leaf replay failed: inspect actual diagnostic")
    print("A2 leaf native guards accepted; caller/strict graph/RH OPEN")

if __name__ == "__main__":
    main()
