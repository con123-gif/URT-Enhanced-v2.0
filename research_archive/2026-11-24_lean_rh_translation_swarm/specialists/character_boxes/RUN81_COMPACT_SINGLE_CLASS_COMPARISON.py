"""RUN81 — C2: actual separation/comparison caller premise weakening.
27 November 2026. Source-matched human reduction + reversible exact edit
check; native replacement PREPARED, NOT replayed. RH remains OPEN.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Mission/spine/ledger blobs: 3adc76221a978016e3505cdf3e36ad688354d7d7,
4878ea106b791c42b5f5a45810162de59701c4d9, 01fa22a6b12abad5ccf580d2621f82be3bf70c13.
Peer C2 work record 832dafc37d21d81357471ccb2960540f854cfde3.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Old pin 40e56bab026552e089d7afcfeff08d2defb9c005 remains separate.

ACTUAL RUN80 replay state: first Carrier build and seven originals passed,
but candidate failed and downstream propagation was not attempted (run
46012543617). Integration has prepared a combined replay with cache
15206556705, not a PASS. At this read, compute run 46023465491 was running
A1/A2 transport (not C2), 46024434790 was pending with no jobs yet.
State compute directory still contains only the first C2 replay record.
No duplicate cold build or workflow edit. No native tools executed here.

MATHEMATICAL REDUCTION (actual source, not a synthetic scalar example):
For fixed D and j, set
  I_F(i,zeta)= integral conj(F(g) fNatural_j(i,g)) tableTheta_j(zeta)(g) dg.
Source Separation.eq_zero_of_integral_fNatural_tableTheta assumes zero
for every table zeta. Inspect its actual proof: h occurs exactly twice,
once at the binder and once at the final application to
  i, Pi.single c.1 (star v),
where range_toPoly.ge supplies v for the actual nablaBasis index c.2.
All other steps are independent of h, including the near-maximum,
isolation, approximation, holomorphic reproduction and rapid/level
premises. Thus the identical argument needs only I_F(i,e_c v)=0 for
each choice i, class c and coefficient vector v. This is a restricted
test family, not a claim that one class works for every F. The original
statement is recovered by direct specialization; no new analytic theorem.

At actual ComparisonForms.exists_comparison_forms, BOTH uses of separation
can consume this restricted supplier. First, if kappa(theta)=0, its native
coset equality gives fNatural_i(g)=0 for every i,g. Hence every
single-coordinate test vanishes for every F, and separation contradicts
positive row dimension. This proves kappa(theta) != 0 before division.
Second, let A=u_1^* gl_1 and F perpendicular to range A. For each (i,c,v)
use the one table supported at (i,c) in the native inner-adjoint identity.
The fixed coefficients for that i (congruence group size, gProd power,
lineScale, Weil scalar) are nonzero by the existing source lemmas.
Consequently I_F(i,e_c v)=0, so F=0. Finite-dimensional orthogonal
complement then gives surjectivity of A. No arbitrary-table separation
premise needed at either call. Original comparison statement unchanged.

The SAME native scalar and pairing now give, before norms,
  conj(kappa_theta) u_theta^* gl_theta = conj(kappa_1) A.
Hence u_theta^* gl_theta = conj(kappa_1/kappa_theta) A, with no
character-dependent choice of A. With the native norm relation
|kappa_theta|^2=C/Gamma_theta, the source's nonzero values give
|conj(kappa_1/kappa_theta)|^2=Gamma_theta/Gamma_1.
Do not assume C nonzero independently: it follows only from the
nonzero kappa and native denominator relation. Keep the tested-form
orthogonality and all integral/archimedean estimates unchanged.

Actual local graph:
  exists_comparison_forms -> original separation (two uses)
    -> near maximum/isolation/reproducing formula + arbitrary-table h.
  candidate same comparison -> single-class separation (two uses)
    -> identical analytic primitives + single-class h.
  original separation -> single-class bridge (retained for other callers).
  heightLe_liftVolume_ratio -> exists_comparison_forms -> same A and gamma.
  cosetKernelSum_eq_fNatural -> explicit_matching, carrier, class sums
    (unchanged; the RUN79/80 branch still requires native repair).
No global dependency deletion, no closure of C2 signed height, no claim
that separation is proved independently of its original primitive inputs.
Cache key includes exact source pin, D, j, same Haar measure, class c,
choice i and coefficient v. Cannot reuse this for arbitrary groups.

STATIC EXECUTION: fetched both actual source blobs and ran the 5 exact
unique substitutions in the connector JS sandbox, including inverse
substitutions restoring original strings; all 5 anchors unique,
both reversals exact. Counted exactly 2 occurrences of h in the source
separation theorem. This script reproduces the checks using git-blob hashes.
Python script itself and resulting Lean modules have NOT been executed.
No native rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier run.
No new axioms accepted; original and reduced local graphs above preserved.
Full constructor-inclusive graph and original-type/axiom replay pending.

RESUME HERE: in the shared native runner, after the coordinated cached
RUN80/79 replay has an actual receipt, apply this patch ONLY to an isolated
copy of the authenticated compact source; build New.Rows.ComparisonForms
and audit Data.eq_zero_of_integral_fNatural_tableTheta_single,
Data.eq_zero_of_integral_fNatural_tableTheta and exists_comparison_forms
for clean compiler exit, exact original types for the last two, standard
axioms only, and two actual direct edges to the restricted supplier.
Retain all errors, native graph and axiom evidence. No new root closures.
HANDOFF TO integration / native runner / audit.
"""
import argparse
import hashlib
from pathlib import Path

HEAD = """lemma Data.eq_zero_of_integral_fNatural_tableTheta {P} {D : Data P} {j : D.LiftIndex} (F :
  D.goodForms (D.spaceW j)) (h : ∀ i ζ, ∫ g, conj (F.1.1 g * fNatural j i g) * tableTheta j ζ
  g ∂(D.spaceW j).quotMeasure = 0) : F = 0 := by"""
NEW_HEAD = """lemma Data.eq_zero_of_integral_fNatural_tableTheta_single {P} {D : Data P} {j : D.LiftIndex} (F :
  D.goodForms (D.spaceW j)) (h : ∀ i c v, ∫ g, conj (F.1.1 g * fNatural j i g) *
  tableTheta j (Pi.single c v) g ∂(D.spaceW j).quotMeasure = 0) : F = 0 := by"""
WRAPPER = "\n\n/-- Original statement, recovered by testing single-coordinate tables. -/\n" + HEAD + "\n  exact Data.eq_zero_of_integral_fNatural_tableTheta_single F (fun i c v ↦ h i (Pi.single c v))\n"
PATCHES = [
    ("Separation.lean", "cbd60ebb20b771dc6107f3d54df0397ee7707e4d", [
        (HEAD, NEW_HEAD),
        ("$(h i (Pi.single c.1 (star v)))", "$(h i c.1 (star v))"),
    ], WRAPPER),
    ("ComparisonForms.lean", "14ef893c54f5db837ea7e4f143b2b1a444b89b5a", [
        ("(eq_zero_of_integral_fNatural_tableTheta · (by simp [e ϑ, h]))",
         "(eq_zero_of_integral_fNatural_tableTheta_single · (by simp [e ϑ, h]))"),
        ("(bot_unique fun F m ↦ eq_zero_of_integral_fNatural_tableTheta F fun i ζ ↦ ?_)",
         "(bot_unique fun F m ↦ eq_zero_of_integral_fNatural_tableTheta_single F fun i c v ↦ ?_)"),
        ("(m _ ⟨.toLp 2 fun b ↦ ite (b.1 = i) ζ 0 b.2, rfl⟩)))",
         "(m _ ⟨.toLp 2 fun b ↦ ite (b.1 = i) (Pi.single c v) 0 b.2, rfl⟩)))"),
    ], ""),
]

def blob_hash(raw):
    return hashlib.sha1(b"blob " + str(len(raw)).encode() + b"\0" + raw).hexdigest()

def substitute(s, pairs):
    for a, b in pairs:
        if s.count(a) != 1:
            raise ValueError("nonunique anchor: " + a)
        s = s.replace(a, b, 1)
        if s.count(b) != 1:
            raise ValueError("nonunique replacement: " + b)
    return s

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("compact", type=Path, help="isolated grh-compact workspace")
    ap.add_argument("--apply", action="store_true", help="modify isolated copy only")
    args = ap.parse_args()
    staged = []
    for filename, expected, pairs, suffix in PATCHES:
        p = args.compact / "src" / "New" / "Rows" / filename
        raw = p.read_bytes()
        if blob_hash(raw) != expected:
            raise ValueError("source pin mismatch: " + str(p))
        source = raw.decode("utf-8")
        candidate = substitute(source, pairs)
        if substitute(candidate, [(b, a) for a, b in reversed(pairs)]) != source:
            raise ValueError("reverse patch failed")
        staged.append((p, (candidate + suffix).encode("utf-8")))
        print(filename, "exact edits", len(pairs), "source", expected,
              "candidate", blob_hash(staged[-1][1]))
    if args.apply:
        for p, data in staged:
            p.write_bytes(data)
    print("Static source checks only; no Lean proof replay performed.")

if __name__ == "__main__":
    main()
