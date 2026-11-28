#!/usr/bin/env python3
"""RUN98, 28 Nov 2026 — actual compiler diagnostic repair, PREPARED.
Credit Alpoge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679, Lean 4.35.0.
Read mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7 /
1c4608f2190154fd4bc4b38fc77db10ec5e60e64 / 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Actual run 46108201939, state-branch compute/rh-compact-a2-cached-leaf-20261128:
status blob 477906a035eb6a27397e0bdf82ed159dade0db8c, ERROR; 105.83s.
All 9 pre-leaf stages exit 0; authenticated artifact true, no cold build.
RUN92 leaf compiled 7.08s exit 1; sorryAx, no graph or prune.
Published exact leaf git blob fb32154912a700c3ec0c4ea7c0e7fd3744bc604b.
Published log SHA256 e4f4fa73d074f6d638fff6a8bf24c577754914e8585d1f94f8d5662d4fb61d03.
Original declaration standard axioms; candidate has sorryAx.
Already kernel-elaborated helpers with standard axioms: finite_group_trivial,
chosenLevel_free_of_prime_kill, smallerLevel_free, cast_prime_ne_zero_of_card_prime,
gl_map_injective. Not sufficient to accept the replacement.

Six exact edits targeting ALL actual failed goals before the final axiom gate:
33: explicit one_pow and sum_const; exact geometric sum of u copies of I.
149: choose valuation-subring carrier R explicitly; source reduceGL uses
residue (LocInt w) and v.integer. Do not ask TC to infer local-ring
structure on the underlying subring presentation.
171: expose the identity as the GL unit before map_one.
182: omega instead of classical decision reduction.
189/193: install Fintype.ofFinite locally; upstream supplies Finite, not Fintype.
202: prove conjugation power for a fresh k, independent of prime/order
hypotheses on p, then specialize; no impossible induction hypotheses.
Sources: Lib/Adelic/Unitary/CongruenceLevel.lean blob
07e6502ac533d1868d68f817a00bdd2ac95f4616 (reduceGL, reduceAt_eq_of_atPlace);
Lib/Adelic/Adeles/AdeleTopology.lean (card_ResField, instFiniteResField);
Lib/Adelic/Adeles/LocalComponents.lean blob
bae4e852f02d8f66cb3bbba5fe0e4eabab644555 (mem_Kf_iff).
All source at compact pin. Exact statements, same-place rational injection,
finite stabilizer, both distinct chosen primes and local congruence retained.
Candidate drops the original rank premise only in strengthened theorem;
original adapter and axiom/graph guards preserved. No new mathematics
assumed. Original A1 and A2 root obligations remain open.

Actual checks performed against published failed leaf via JS: six unique
anchors, 12/12 missing/duplicated-anchor controls, exact reverse and
same 11-theorem roster. No local Lean/lake; remote DNS unavailable.
No native PASS for repaired candidate. Preserve original failed receipts,
RUN92 graph/axiom/prune procedure and original RUN97 artifact authentication.
RESUME HERE: inspect state-branch compute/rh-compact-a2-leaf-repair-20261128/
outputs/theta92/leaf.log, theta92_result.json and run97.json; fix first actual
remaining compiler/graph diagnostic or consume accepted leaf at RUN93.
HANDOFF kernel/integration/acceleration/audit.
"""
import hashlib
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
SELF = Path(__file__).resolve()
PARENT = HERE / "RUN97_A2_CACHED_NATIVE_QUEUE.py"
LEAF = HERE / "RUN92_A2_CACHE_LEAF_GRAPH.py"
PARENT_BLOB = "40b7afeca8fd200abf5dbd662955993f410b0fc4"
LEAF_BLOB = "768c917293b75dcedb0bc7b4616fe416ad18e5c8"
FAILED_BLOB = "fb32154912a700c3ec0c4ea7c0e7fd3744bc604b"
PAIRS = [
  [
    "    simp [S, map_sum, hf, Nat.cast_smul_eq_nsmul]",
    "    simp only [S, map_sum, map_pow, hf, one_pow, Finset.sum_const,\n      Finset.card_range, Nat.cast_smul_eq_nsmul]"
  ],
  [
    "  have hmat : T.1 = 1 := ThetaRun81.matrix_torsion_eq_one T.1 p",
    "  have hmat : T.1 = 1 := ThetaRun81.matrix_torsion_eq_one\n    (R := ↥(LocInt w)) T.1 p"
  ],
  [
    "    simpa only [map_one] using hmap",
    "    change Matrix.GeneralLinearGroup.map f γ.1 =\n      Matrix.GeneralLinearGroup.map f (1 : GL n E)\n    rw [map_one]\n    exact hmap"
  ],
  [
    "(by decide : (0 : Fin 2) ≠ 1)",
    "(by omega : (0 : Fin 2) ≠ 1)"
  ],
  [
    "  have hcard : Fintype.card (ResField w) = D.g i := by",
    "  letI : Fintype (ResField w) := Fintype.ofFinite _\n  have hcard : Fintype.card (ResField w) = D.g i := by"
  ],
  [
    "    have e : h ^ p = g⁻¹ * y.1 ^ p * g := by\n      induction p with\n      | zero => simp [h]\n      | succ p ih => rw [pow_succ, ih, pow_succ]; dsimp [h]; group\n    rw [e, hy']; simp",
    "    have e : ∀ k : ℕ, h ^ k = g⁻¹ * y.1 ^ k * g := by\n      intro k\n      induction k with\n      | zero => simp [h]\n      | succ k ih => rw [pow_succ, ih, pow_succ]; dsimp [h]; group\n    rw [e p, hy']; simp"
  ]
]

def blob_bytes(data):
    return hashlib.sha1(f"blob {len(data)}\0".encode()+data).hexdigest()

def blob(path):
    return blob_bytes(path.read_bytes())

def require(ok, msg):
    if not ok:
        raise RuntimeError(msg)

def replace_exact(source):
    old = source
    for a,b in PAIRS:
        require(source.count(a)==1, "missing/duplicate repair anchor: "+a)
        source=source.replace(a,b,1)
    reverse=source
    for a,b in reversed(PAIRS):
        require(reverse.count(b)==1, "ambiguous reverse")
        reverse=reverse.replace(b,a,1)
    require(reverse==old, "repair not exactly reversible")
    return source

def main():
    require(blob(PARENT)==PARENT_BLOB and blob(LEAF)==LEAF_BLOB,
            "parent drivers changed")
    if "--compact-root" in sys.argv:
        import RUN92_A2_CACHE_LEAF_GRAPH as leaf
        base=leaf.patcher.patch
        def patch(raw):
            source=base(raw)
            require(blob_bytes(source.encode())==FAILED_BLOB,
                    "not the exact published failed leaf")
            fixed=replace_exact(source)
            for a,b in PAIRS:
                for bad in (source.replace(a,"",1),source.replace(a,a+"\n"+a,1)):
                    try:
                        replace_exact(bad)
                    except RuntimeError:
                        pass
                    else:
                        raise RuntimeError("negative control accepted")
            return fixed
        leaf.patcher.patch=patch
        leaf.main()
    else:
        import RUN97_A2_CACHED_NATIVE_QUEUE as queue
        require(queue.INPUTS[LEAF]==LEAF_BLOB,"unexpected prior input")
        # Child runs this exact checked-in script; original driver stays immutable.
        queue.LEAF=SELF
        queue.INPUTS={**queue.INPUTS, SELF:blob(SELF)}
        queue.main()

if __name__=="__main__":
    main()
