#!/usr/bin/env python3
"""RUN76, 2026-11-27 — independent audit F3–F10 and native rank-premise patch.

Status: SOURCE-MATCHED human REVIEW (agree under retained model laws);
candidate native patch PREPARED, not kernel-replayed. RH remains OPEN.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission current blob a69122b6ad568910a45d2bc13961ab9da4855143.
Starting upstream 40e56bab026552e089d7afcfeff08d2defb9c005; actual
compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207.
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Scope: independent review of integration/
2026-11-27_COMPACT_DUAL_DATUM_PROJECTOR_AUDIT.md
(blob 862200f0eb186e3f7af0b9b18eda71113a37a0dc).
This is at the actual Rallis consumer, NOT a new prime-window proof.
Source blobs (relative to grh-compact/src):
 Lib/SiegelWeil/RallisInner/SharpData.lean ea9f665a9a89411f1353d098ff2e0a4e59a719f5
 Lib/Weil/Construction/Projections.lean 7a187f8be18a00b889082b56818393f20a7f88e4
 Lib/Weil/Construction/FiniteMultiplier.lean 7b35474d42010a69abe9ba5868c0fce4d4490efc
 Lib/Weil/Construction/FiniteVacuum.lean b775c3efc7afae92b21402691f615e0dfbf73ee1
 Lib/Weil/Construction/WeilOperators.lean 78ab91ea471ba9b7f57c1955b05e2cf04edaafef
 Lib/Weil/Construction/ThetaFunctional.lean b21b5f01564922bbd2ed309ef614111698b2384a
 Lib/Weil/CompactLift/RallisFormula.lean 8d41f50fc88d20a40531973b916aaac7491b8e72

1. F3: derive from the actual integral, not omega_vacElem_sum (which
depends on projOn_omega and would be circular here). In the native finite
reproducing model e(y)=1_Lambda(y) s(y), where s=semichar. By weilOp,
omega(k)e = Delta(k) integral e(y) rho(ky)e dy. Evaluation at zero is
<e,omega(k)e>; on Lambda intersect k^-1 Lambda the two phases are the
same s(y)=s(ky), since k preserves the Hermitian dot product. They
multiply to 1 by semichar_mul_self (or use normalized H instead of
rho). Outside the intersection the integrand is zero. The source
latticeMeasure_inter_eq_glMultiplier, finMultiplier_inv, nonzero
multiplier therefore give EXACTLY
  <e,omega(k)e>=Delta(k)/|Delta(k)|^2=1/Delta(k^-1).
This fixes the inverse/conjugate, without assuming unit modulus.
Retain finAction trivial cocycle and exact vacuum construction.

2. F4: no unproved tensor factorization or density of arbitrary
Schwartz functions needed. On the adapted native determining family
integrated(P, H(y)e), with y zero on C=A union bar A, k supported on C
fixes y. P_A commutes with H(y) and the real integration. The global
vacuum identity dataInner_vacElem_smul_vacElem gives
projReal P_all omega(k)e = c e with c from (1). Since k is identity at
infinity and off C, omega(k)e is already fixed by projReal and P_Cc;
P_all=P_Cc P_A. Consequently P_A omega(k)e=c e. This equality extends
on the determining family by the native ext_integrated theorem, which
tests bounded linear maps on the P_A-fixed subspace. Thus for every
P_A f=f, P_A omega(k)f=c f. This is the source projOn_omega, using its
actual separation premise rather than an assumed tensor identification.

3. F5–F7: strict rank m>2n is unnecessary FOR THE FINITE CUTOFF.
The isotropic frame x exists for m>=2n using (I;u I;0), star(u)u=-1
in the finite integral model. Let eta select the I rows on C. On C
x*x=0 and eta*x=x*eta=I. For antihermitian z supported on C,
k=I+zxx*, k^-1=I-zxx*, and k*k=I exactly. Choose z with |z_w|>1
on every w in C by clearing finitely many denominators as in source.
Delta(kappa^-1) multiplies f BEFORE omega and H(eta). If the right
source action g is integral, its transformed vector Z remains
P_A-fixed. H(eta) fixes Z, so its insertion can be removed from the
left inner argument. Then P_A omega(kappa)(Delta(kappa^-1) f)=f at
vector level; conjugate-linearity introduces no residual phase.

4. F8–F10: suppose the coefficient is nonzero. If some entry of row i
of g is nonintegral at w in C, take a maximal absolute-value entry
g_il and mu of size max(|z_w|, |g_il|_w); sigma supported at w equals
mu^-1 there. For EVERY d in O-hat set y=E_(u(l),i) d sigma, v=k y g
(using the source inverse-argument convention). Both k^-1 v=y g and
p^-1 v=k y are integral and supported on C. Thus H(v) fixes the
two vectors before H(eta). Unitarity and the exact commutator imply
that the nonzero coefficient is unchanged by a factor
psi_0(star(eta) dot v), or its conjugate if moving it across the
antilinear slot. Either gives the identical character=1 condition.
Selected-row contraction at w:
  tr(eta* k y g)=tr((eta* y+z eta* x x* y)g)
                = (1+z) d sigma g_il.
The first summand d sigma g_il is integral and is killed BEFORE
using self-duality. Thus for all d, psi_0(d sigma z g_il)=1.
The native forall_psi0_mul_eq_one_iff forces sigma z g_il integral,
contradicting |sigma z g_il|=min(|z|,|g_il|)>1. No division by
2, no bound on the inverse of the coefficient, and no rank gap in
this finite argument. Integral entries of g on conjugation-closed
C imply integral entries of g*=g^-1 and exactly localLevel membership.
The determinant character is a common unit factor. Empty C and
rank zero use the trivial cutoff; the argument needs no bad entry
in these cases. The universal f_A' is chosen before arbitrary g.

5. Actual caller RallisFormula.integral_eq_zero_of_lift_eq_zero:
inner_product_formula hM gives absolute integrability for each paired
datum and the zero-lift identity. The exact finite cutoff converts
the varying paired integrands to the original one times indicators.
tendsto_partialIntegral then uses ONE L1 majorant, not uniform norms
of the varying paired data. IsSharp.partialIntegral_eq gives the
nonzero mass times the real integral. Agreement on F3–F10, conditional
on the stated primitive model/absolute Rallis hypotheses, not an
independent audit of convergence or theta lifting as a whole.

6. Actual native reduction candidate: SharpData.exists_dual_datum
line 245 changes rank < to <=; line 248 changes h.le to h. The outer
rank hypothesis appears explicitly only at its binder and the frame
call; the other three literal h occurrences are locally bound
(V's hypothesis twice, final fun w h). Tactics may use context, so
this source observation is NOT a kernel check. The script authenticates
the exact original blob, modifies only these two lines in a temporary
file and optionally asks native Lean to replay the FULL modified module
and print axioms of exists_dual_datum. No import of Main/RH theorem,
no assumed cutoff result, no overwrite of native files. At the caller,
replace exists_dual_datum b hM by exists_dual_datum b hM.le only if
the replay succeeds; keep strict hM for the stable-range Rallis formula.
This removes one strict local hypothesis, not the global rank gap.

Original graph (static, context keyed by source blob and this consumer):
 integral_eq_zero_of_lift_eq_zero -> inner_product_formula (strict hM),
 exists_dual_datum (strict hM), tendsto_partialIntegral,
 IsSharp.partialIntegral_eq;
 exists_dual_datum -> exists_integral_isotropic_frame (hM.le),
 projOn_omega, finHeisOp_projOn, finHeisOp_comm,
 forall_psi0_mul_eq_one_iff, denominator clearing, integral GL test.
Candidate reduced graph: same edges and primitive obligations;
 exists_dual_datum uses weak rank directly; strict rank remains at
 inner_product_formula. No global graph deletion or axiom inference.
Original evidence and unresolved A/C, ASK-MAIN, prime window and
noncoherent absolute-amplitude/exchange suppliers are preserved.

Actual checks this run: GitHub pinned source fetched; exact source
string transform in JS found precisely two changed lines (245,248),
with all content outside the declaration unchanged. No native Lean or
Lake installed in local container. Historical CI jobs 45577239749 and
45576756833 and their state status.json checked: returncode 0, conditional
root/prune baseline only, axioms propext/Classical.choice/Quot.sound;
bounded scan pending 324. These do not validate this new patch.
No new PASS, no complete proof claim, no URT ranking experiment.

Usage on a built pinned compact checkout:
 python RUN76_finite_dual_datum_audit.py /path/to/grh-compact
 python RUN76_finite_dual_datum_audit.py /path/to/grh-compact --lean
Second command executes actual modified source and fails on any
nonzero return; inspect axiom output before accepting. Native compact
imports must already be built. First command is only a static check.

RESUME HERE: native kernel lane replay this precise two-line rank
weakening, then caller bridge with hM.le and full axiom audit. Integration
can use independent F3–F10 review above immediately at its conditional
human caller. Next positivity task: separate noncoherent absolute
amplitude/exchange supplier and weighted lattice-discriminant sum,
after checking latest peer results. Do not reopen the finite phases
without a specific discrepancy. HANDOFF TO integration, formal audit,
kernel extractor. All prior schedules and original graphs unchanged.
"""
import argparse
import hashlib
from pathlib import Path
import subprocess
import tempfile

REL = Path("src/Lib/SiegelWeil/RallisInner/SharpData.lean")
BLOB = "ea9f665a9a89411f1353d098ff2e0a4e59a719f5"
OLD = (
    "lemma exists_dual_datum (h : 2 * card n < card m)",
    "exists_integral_isotropic_frame (E := E) h.le",
)
NEW = (
    "lemma exists_dual_datum (h : 2 * card n ≤ card m)",
    "exists_integral_isotropic_frame (E := E) h",
)

def transform(raw):
    blob = hashlib.sha1(b"blob " + str(len(raw)).encode() + b"\0" + raw).hexdigest()
    if blob != BLOB:
        raise ValueError("Unexpected pinned source blob: " + blob)
    original = raw.decode("utf-8")
    patched = original
    for old, new in zip(OLD, NEW):
        if patched.count(old) != 1:
            raise ValueError("Patch anchor is not unique: " + old)
        patched = patched.replace(old, new, 1)
    a, b = original.splitlines(), patched.splitlines()
    assert len(a) == len(b)
    changed = [i for i, (x, y) in enumerate(zip(a, b), 1) if x != y]
    assert changed == [245, 248], changed
    return patched, changed

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("compact", type=Path)
    parser.add_argument("--lean", action="store_true")
    args = parser.parse_args()
    root = args.compact.resolve()
    patched, changed = transform((root / REL).read_bytes())
    print("STATIC authenticated blob:", BLOB, "changed lines:", changed, flush=True)
    if not args.lean:
        print("Native replay not requested; no kernel result.")
        return
    with tempfile.TemporaryDirectory(prefix="rh-run76-") as tmp:
        file = Path(tmp) / "SharpDataReduced.lean"
        file.write_text(patched + "\n#print axioms exists_dual_datum\n", encoding="utf-8")
        cmd = ["lake", "env", "lean", "--tstack=400000",
               "-DautoImplicit=false", "-DrelaxedAutoImplicit=false",
               "-DmaxSynthPendingDepth=3", "-DmaxHeartbeats=4000000", str(file)]
        subprocess.run(cmd, cwd=root, check=True)
    print("Modified source replay exited zero; inspect printed axioms separately.")

if __name__ == "__main__":
    main()
