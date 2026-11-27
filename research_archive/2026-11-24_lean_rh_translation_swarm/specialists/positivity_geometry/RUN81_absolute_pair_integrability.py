#!/usr/bin/env python3
"""RUN81 — 27 Nov 2026. B1 Rallis absolute-integrability premise separation.

SOURCE-MATCHED human derivation / executable native candidate PREPARED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude. RH OPEN.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Latest mission blob 3adc76221a978016e3505cdf3e36ad688354d7d7,
live ledger blob 01fa22a6b12abad5ccf580d2621f82be3bf70c13.
Old pin 40e56bab026552e089d7afcfeff08d2defb9c005 is not used here.

B2 continuity: preferred RUN80 joint source d4ed493ddfced479b3be029bb554493c0c39accd
is already assigned to the coordinated shared job rh-compact-b2-labelled-fusion-graph-20261127.
No state status.json existed on this read (404); no joint PASS asserted.
Prior job rh-compact-b2-full-chain-graph-20261127 status blob
9459c0acbb3e68b78e7f46ebb36a45a25ee7647d is ERROR (graph),
with independent seven-declaration and separate count receipts. Do not duplicate
the shared B2 build. Advance B1 instead. Source-matched prior human majorants:
integration/2026-11-27_COMPACT_SIEGEL_WEIL_NATIVE_BRIDGE.md
(blob a51ebd8c94f0c26b46aa68b250e54d6eaf0c130d), section 7.
This step is an actual caller extraction of the FIRST absolute majorant,
not another derivation of the common model or the finite cutoff.

Mathematical result: for the SAME rapidly decreasing y,y', arbitrary data f,f',
fixed b, set Phi(x,g)=M_b(f,f';g) conj(y'(x)) y(xg).
Assume V: sum_L ||E_L|| < infinity (operator norms on the native datum
space for S+(-S) and T), with the exact native Haar conventions.
No cleanliness, strict rank, signed Siegel-Weil identity or target theta
majorant is needed for THIS integrability implication. Use the same
height-reduction section eta and native doubleDatum d(x,x') as original.
Rapidity and the polynomial height bound on the source action imply
integral_[G]^2 ||d|| < infinity. The graph zero-term evaluation and rational
reindexing give the exact Phi at the unfolded graph labels. Graph injectivity
then gives, before any signed interchange,
  integral_[G]xG |Phi| <= (sum_L ||E_L||) integral_[G]^2 ||d|| < infinity.
This sums over all L as an upper bound, so no vanishing of nongraph terms
or assumption of cleanliness is necessary. The absolute integral of the
original matrix-coefficient/Petersson product follows by Fubini and the
triangle inequality. Zero-term summability itself is not free and the
rank restriction remains at its existing supplier. In particular this is
not a claim of unconditional integrability at arbitrary ranks.
Cleanliness, stable range, the second majorant, signed Siegel-Weil and graph
support remain at the original inner_product_formula equality consumer.

Source graph (static, keyed to SharpData blob and original caller):
 inner_product_formula -> V from siegel_weil, W signed identity,
 theta_normalisedTorus_le, height reduction, doubleDatum, graph evaluation,
 graph injectivity, measure preserving unfolding, cleanliness graph support.
Candidate graph: same retained dependencies at original formula;
 inner_product_formula -> rh_run81_absolute_pair_integrable -> V (premise),
 height reduction, doubleDatum, graph evaluation, graph injectivity, unfolding;
 no hf or h, no signed identity or theta majorant in that helper.
No global removal claimed; constructor-inclusive graph and original axiom
evidence remain unmodified. Current native reduction engines old-pin receipts
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 read: returncode 0 for baseline,
not new compact verification. No local Lean/Lake executable available.

The script extracts exactly the native prefix and J proof, omitting q
and the combined V/W/N destructuring, supplies only V, then replaces J
at the original caller. No imported RH theorem, no new axiom, no changes
to the pinned upstream checkout. The repeated height section is a
candidate implementation detail, not claimed runtime acceleration.
Actual static checks this run: seven unique anchors in source order,
reversal equals original byte-for-byte, original formula signature
unchanged, forbidden supplier strings absent from helper, actual call
inserted. JS equivalent of transform executed against authenticated
GitHub source. Python and native Lean replay remain to be executed.
Possible elaboration issues include product measure inference or section
implicit arguments; preserve exact compiler errors if rejected.

RESUME HERE: on the existing compiled compact workspace, execute
python RUN81_absolute_pair_integrability.py /path/to/grh-compact --lean
and inspect helper/caller axiom reports and direct guards. Coordinate
with B1 integration after current shared B2/C2 job, no cold duplicate
build. If verified, prefer this precise integrability interface at the
Rallis human proof and audit its remaining signed-unfolding consumer.
"""
import argparse
import hashlib
from pathlib import Path
import subprocess
import tempfile

REL = Path("src/Lib/SiegelWeil/RallisInner/SharpData.lean")
BLOB = "ea9f665a9a89411f1353d098ff2e0a4e59a719f5"
MARKERS = [
  "/-- Rallis inner product formula, doubling form.",
  "lemma inner_product_formula (h :",
  "  choose _ η hη hB using",
  "  have q g g' h :",
  "  let Φ := fun (x, g)",
  "  have J : Integrable Φ _ :=",
  "  simp_rw [petersson, lift,"
]
HEADER = "/-- The absolute double-integrand needs only summable zero-term operator norms,\nnot cleanliness, the target theta majorant or the signed Siegel–Weil identity. -/\nlemma rh_run81_absolute_pair_integrable (b : AutChar E) {f : 𝒮 (S.hom T)}\n    {y y'} (hy : y ∈ S.rapidFunctions) (hy' : y' ∈ S.rapidFunctions)\n    (V : Summable (‖Lagrangian.zeroTerm (S := S.sum S.neg) T ·‖))\n    (f' : 𝒮 (S.hom T)) :\n    Integrable (fun (x, g) ↦ weilMatrixCoeff b f f' g * (conj (y' x) * y (x * g)))\n      (S.quotMeasure.prod volume) := by\n"
BRIDGE = "  have J : Integrable Φ _ := rh_run81_absolute_pair_integrable b hy hy' V f'\n"
GUARDS = """
run_cmd do
  let helper ← Lean.getConstInfo ``rh_run81_absolute_pair_integrable
  let some body := helper.value? (allowOpaque := true) |
    Lean.throwError "RUN81 helper has no proof value"
  let deps := body.getUsedConstants
  if deps.contains ``siegel_weil || deps.contains ``theta_normalisedTorus_le ||
     deps.contains ``exists_graph_eq_of_zeroTerm_ne_zero then
    Lean.throwError "RUN81 helper retained a forbidden direct supplier"
  let caller ← Lean.getConstInfo ``inner_product_formula
  let some proof := caller.value? (allowOpaque := true) |
    Lean.throwError "RUN81 caller has no proof value"
  unless proof.getUsedConstants.contains ``rh_run81_absolute_pair_integrable do
    Lean.throwError "RUN81 actual caller failed to use helper"
  Lean.logInfo "RUN81: direct premise-separation and caller guards accepted"
#print axioms rh_run81_absolute_pair_integrable
#print axioms inner_product_formula
"""

def transform(raw):
    digest = hashlib.sha1(b"blob " + str(len(raw)).encode() + b"\0" + raw).hexdigest()
    if digest != BLOB:
        raise ValueError("Unexpected source blob: " + digest)
    s = raw.decode("utf-8")
    assert all(s.count(m) == 1 for m in MARKERS)
    doc, start, choose, q, phi, j, end = [s.index(m) for m in MARKERS]
    assert doc < start < choose < q < phi < j < end
    helper = HEADER + s[choose:q] + s[phi:j] + s[j:end].replace(MARKERS[5], "  exact", 1)
    patched = s[:doc] + helper + "\n" + s[doc:j] + BRIDGE + s[end:]
    assert patched.replace(helper + "\n", "", 1).replace(BRIDGE, s[j:end], 1) == s
    assert s[start:choose] in patched
    assert all(x not in helper for x in ("IsClean", "theta_normalisedTorus_le", "siegel_weil",
                                        "exists_graph_eq_of_zeroTerm_ne_zero"))
    assert patched.count(BRIDGE) == 1
    return "import Lean\n" + patched + "\n" + GUARDS

def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("compact", type=Path)
    p.add_argument("--lean", action="store_true")
    args = p.parse_args()
    root = args.compact.resolve()
    generated = transform((root / REL).read_bytes())
    print("STATIC: authenticated source, reversible caller patch and exact signature preserved", flush=True)
    if not args.lean:
        print("No native execution requested.")
        return
    with tempfile.TemporaryDirectory(prefix="rh-run81-") as tmp:
        path = Path(tmp) / "SharpDataRun81.lean"
        path.write_text(generated, encoding="utf-8")
        subprocess.run(["lake", "env", "lean", "--tstack=400000",
                        "-DautoImplicit=false", "-DrelaxedAutoImplicit=false",
                        "-DmaxSynthPendingDepth=3", "-DmaxHeartbeats=4000000",
                        "-Dpp.fullNames=true", str(path)], cwd=root, check=True)
    print("Compiler exited zero; inspect exact axiom reports before accepting.")

if __name__ == "__main__":
    main()
