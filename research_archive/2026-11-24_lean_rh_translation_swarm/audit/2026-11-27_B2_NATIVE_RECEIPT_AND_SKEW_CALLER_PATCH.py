#!/usr/bin/env python3
"""27 Nov 2026 — B2 native receipt independent audit and actual caller patch.

AGREE on the eight helper proofs; PARTIAL on the replacement. RH OPEN.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission blob 3adc76221a978016e3505cdf3e36ad688354d7d7;
spine 67e542df1b5557b2e1314643931ef1355bbdc50d;
ledger 073d86374ebc415e217a2732814dde7b0f3dfb9d.
Read these plus SWARM_PROTOCOL, AGENTS, HANDOFF_QUEUE and peer RUN73/75,
weighted count 6bdfdba6, editor D1/E1 signed-residue audit (fef13351).
E1 already reviewed, no discrepancy identified on checking native
OneSidedCriterion/PrimeError/PolarLandau; do not duplicate it.

Fresh native results, not an inference from workflow success:
state branch compute/rh-compact-b2-human-replay-20261127/status.json
blob d9eb4d1dc47d7dc52f36bc13b41b3eea170b667d, run 45986308748,
runner commit 78cb422113cbccffb0b17a1fb79883683831e43d.
outputs/b2_native_results.json blob a5dba18064d92bade88f3133b7217addcfe9b9ff:
BlockBound build exit 0; eight helpers and six ORIGINAL caller
axiom probes exit 0. Standard axiom subset only (propext,
Classical.choice, Quot.sound); actual missing-projector-guard log
c5dc81aa9ec8dbcecb86dc7d67bd06f1b2ff0654 shows exit 1, unsolved
goal P*C*X=C*X over Q. Pins blob 611284f755002d37aa5904bc0f024ee834fa8019
authenticates the RUN73 source 8ce22849ab4dd088bd8934f26a215321b075af1e
and compact source. Geometric fibre log 63c65955e5cc50a06db92ccb0e32cdbdde9bc6d2
and original callers log 121365b564aabdcfba262fec16e2033b0e3b140a
inspected. Crucially caller_replacements_checked=false,
human_assembly_verified=false, full_RH_replay=false.
Old-pin engine runs 45577239749 and 45576756833 state receipts fetched,
both pass for their recorded scope only. Older compact targeted_results
088cd2ec0e935ee1a282f10096949bcf671cc804 still includes timeout 124.

New contribution: exact original-statement replacement candidate at
New/Filling/BlockBound.lean, Filling.tsum_invPowWeight_le_of_codim_le,
not another disconnected generic lemma. Source compact
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Original route: sum_pairWeight_le -> tsum_invPowWeight_le_of_codim_le
-> inner congruence-fibre proof -> local k -> direct simp/module.
Reduced candidate: same caller, same original theorem signature,
same local z, X, P, alpha, T, sigma, n0, Y, M, g and xi. Explicitly
derive both native alternatives, feed the already compiled RUN73
skew_correction_mul to local k, retain all original geometric premises
and the two original branch proofs. The imported modules are unchanged.
The helper is copied byte-for-byte from the authenticated peer (not
imported from BlockBound, which would be circular in its own replay).

Human audit of the bridge: write d=det Y, e=det Y*, V=(P alpha)*.
The native s gives T* P= -V X. If P alpha=d I then V=e I by
conjugate-transpose and determinant conjugation; otherwise native
T P=X adj(Y)Y=d X. In either branch the checked lemma gives
  (e T-d T* - V T) P = e d X.
Thus sigma P=M e d X, and g sigma P=M g det(Y Y*) X=xi,
using precisely the existing x witness and determinant multiplicativity.
No division by d, no new invertibility premise, no triangle/norm
estimate inside this step. Do not discard the original D/nonzero
and integral-lattice assumptions elsewhere. Both branches are necessary
for the advertised substitution: h alone is insufficient (over Q,
one-by-one T=U=V=0,P=X=1,d=e=1 gives 0 !=1).
No global dependency deletion: original and candidate graphs differ
only by local helper and two branch adapters; all unresolved counting,
packing, amplitude and arithmetic edges remain, as do original axioms.
No claim of shortening the kernel term until replay.

Verification actually executed this run: pinned GitHub source and
peer blob metadata retrieved, exact unique patch anchors checked,
original recovered byte-for-byte by undoing both replacements.
Original 395 vs patched 429 split-on-newline lines (includes helper;
not a claim of line-count savings). Native Lean and Lake absent on
local PATH. No new native execution of the candidate or rh_scan,
rh_prune, rh_reduce, rh_auto, rh_auto_frontier. This script is prepared,
its transformation was exercised in JS, not Python or Lean here.
The actual helper/caller axiom outputs above are the verified evidence.
Run in the existing built compact workspace (do not duplicate B2 build):
 python this_file.py /path/to/grh-compact --lean
The transformed file is temporary; never modifies upstream or imports
Main. A nonzero compiler return is a repair target, not an RH failure.
The script rejects unexpected source hashes and any printed extra axiom.

RESUME HERE: native runner compile this exact patched BlockBound module
in the existing compact context and inspect local k and full caller
axioms; if it fails, preserve output and repair exact adapter. Only
after success mark this particular caller substitution replayed.
Integration retains all other B2 obligations and original graphs.
"""
import argparse
import hashlib
from pathlib import Path
import re
import subprocess
import tempfile

BLOB = "6c68e80e3b1ea2b7983696716305493a37f2b1fd"
ANCHOR = "namespace Filling\n"
OLD = "  have k : S.g • (σ * P) =\n    ξ := by cases ((lt_or_ge 𝔰.ϱ j).imp (by simpa [P, α, Y, ← ext_iff, paddedLeading,\n    f, ·.trans'] using (congr(submatrix $Y.mul_adjugate Fin.castSucc Fin.castSucc))) fun J ↦\n    Matrix.ext fun a b ↦ sum_of_injective _ Fin.castSuccEmb.2 _ _ (by simp +contextual [z, J.trans])\n    fun c ↦ mul_eq_mul_left_iff.2 ((em' _).imp (by simp +contextual [Y, P, paddedLeading, f]) (z a\n    _)) : P * α = Y.det • 1 ∨ T * P = X * Y.adjugate * Y) <;> simp [σ, adjugate_mul, *] <;> module\n"
HELPER = "namespace RHPositivityRun73\n\n-- Rectangular matrix cancellation in the two native branches.\n-- No star-specific simplification is needed once T^*P=-VX is supplied.\ntheorem skew_correction_mul {a b : Type*} [Fintype a]\n    [DecidableEq a] [Fintype b] [DecidableEq b]\n    {R : Type*} [CommRing R]\n    (T U V : Matrix a a R) (P X : Matrix a b R) (d e : R)\n    (h : U * P = -(V * X))\n    (hc : T * P = d • X ∨ V = e • (1 : Matrix a a R)) :\n    (e • T - d • U - V*T) * P = (e*d) • X := by\n  rcases hc with ht | hv\n  · simp only [Matrix.sub_mul, Matrix.smul_mul, Matrix.mul_assoc, ht, h,\n      Matrix.mul_smul, smul_smul]\n    module\n  · simp only [Matrix.sub_mul, Matrix.smul_mul, Matrix.mul_assoc, h, hv,\n      Matrix.one_mul, smul_smul]\n    module\n\nend RHPositivityRun73\n\n"
NEW = "  have hbranches : P * α = Y.det • 1 ∨ T * P = X * Y.adjugate * Y :=\n    ((lt_or_ge 𝔰.ϱ j).imp (by simpa [P, α, Y, ← ext_iff, paddedLeading,\n    f, ·.trans'] using (congr(submatrix $Y.mul_adjugate Fin.castSucc Fin.castSucc))) fun J ↦\n    Matrix.ext fun a b ↦ sum_of_injective _ Fin.castSuccEmb.2 _ _ (by simp +contextual [z, J.trans])\n    fun c ↦ mul_eq_mul_left_iff.2 ((em' _).imp (by simp +contextual [Y, P, paddedLeading, f]) (z a\n    _)))\n  have hcase : T * P = Y.det • X ∨ (P * α)ᴴ = Yᴴ.det • 1 := by\n    rcases hbranches with hp | ht\n    · right\n      simp [hp, Matrix.det_conjTranspose]\n    · left\n      rw [ht, Matrix.mul_assoc, Matrix.adjugate_mul, Matrix.mul_smul, Matrix.mul_one]\n  have hcore := RHPositivityRun73.skew_correction_mul T Tᴴ (P * α)ᴴ P X Y.det Yᴴ.det\n    (by simpa only [neg_mul] using s) hcase\n  have hσ : σ * P = (M : E) • ((Yᴴ.det * Y.det) • X) := by\n    simp only [σ, Matrix.smul_mul, hcore]\n  have k : S.g • (σ * P) = ξ := by\n    rw [hσ, x]\n    simp [Matrix.det_mul, smul_smul, mul_comm, mul_left_comm, mul_assoc] <;> module\n"

def transform(raw):
    h = hashlib.sha1(b"blob " + str(len(raw)).encode() + b"\0" + raw).hexdigest()
    if h != BLOB:
        raise ValueError("wrong source blob: " + h)
    original = raw.decode("utf-8")
    if original.count(OLD) != 1 or original.count(ANCHOR) != 1:
        raise ValueError("nonunique patch anchors")
    reduced = original.replace(ANCHOR, HELPER + ANCHOR, 1).replace(OLD, NEW, 1)
    assert reduced.replace(HELPER, "", 1).replace(NEW, OLD, 1) == original
    return reduced

def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("compact", type=Path)
    p.add_argument("--lean", action="store_true")
    args = p.parse_args()
    root = args.compact.resolve()
    src = root / "src/New/Filling/BlockBound.lean"
    transformed = transform(src.read_bytes())
    print("Authenticated caller patch, static only:", BLOB, flush=True)
    if not args.lean:
        return
    names = ["RHPositivityRun73.skew_correction_mul",
             "Filling.tsum_invPowWeight_le_of_codim_le",
             "Filling.sum_pairWeight_le"]
    with tempfile.TemporaryDirectory(prefix="rh-b2-caller-") as tmp:
        path = Path(tmp) / "BlockBoundReduced.lean"
        path.write_text(transformed + "\n" + "\n".join(
            "#print axioms " + n for n in names) + "\n", encoding="utf-8")
        cmd = ["lake", "env", "lean", "--tstack=400000",
               "-DautoImplicit=false", "-DrelaxedAutoImplicit=false",
               "-DmaxSynthPendingDepth=3", "-DmaxHeartbeats=4000000", str(path)]
        result = subprocess.run(cmd, cwd=root, text=True, stdout=subprocess.PIPE,
                                stderr=subprocess.STDOUT)
        print(result.stdout, flush=True)
        result.check_returncode()
        allowed = {"propext", "Classical.choice", "Quot.sound"}
        for n in names:
            pattern = "'" + re.escape(n) + r"' depends on axioms: \[([^\]]*)\]"
            match = re.search(pattern, result.stdout)
            if not match:
                raise RuntimeError("missing axiom output: " + n)
            found = {x.strip() for x in match.group(1).split(",") if x.strip()}
            if not found <= allowed:
                raise RuntimeError("unexpected axiom: " + str(found - allowed))
        print("Actual patched caller and named axiom checks completed; not full RH.")

if __name__ == "__main__":
    main()
