# First-principles ARF form freedom — Con's correction (2026-11-14)

**Status: user directive / research method; not a theorem, not a physical prediction.**

Con clarified that the four historical ARFs **may be wrong**. "Derive them from first principles" means derive the laws and physical observables, **not** recover the four existing equations. Any/all historical equations, coefficients, polynomial structure, pole residues, exponent choices, and even the number of laws may be discarded.

## Derivation order (no retrofitting)
1. Begin with the entire native Cathedral: π, φ, e and URT recurrence; five Platonic solids and 190 cochains; D6→H3/A4/A5; H64 = H13⊕H51 with its original 64-history dynamics; the hidden 4₃⊕4₅; the full 24-track process; charged-sector dynamics and relevant bridges. Do not reduce the construction to the 13-cell alone.
2. Derive a unique or correctly classified generator/transfer law from native assumptions, with explicit necessity claims and exact symmetry reduction. Do not assume the old `H + c·Abar` is the law; it is only a conditional family already studied.
3. Derive the charge-compatible source, gauge normalisation, observable response, poles and residues, with Ward identities at both orders. Do not bake in `(4,2,2,0)`, a historical alpha formula, or the measured values.
4. State physical dimensions and renormalisation scale, and test predictions independently. Only now compare with earlier ARFs and experiment. If predictions differ, record the contradiction rather than adding correction terms to force agreement.
5. Keep exact mathematical statements separate from conditional physical interpretations and from empirical validations. Do not mark gates closed without the full proofs/tests.

## One instructive algebraic example (not a physical ARF)
The already-audited native hidden isometry obeys
`H_bits U_h P3 = 18 U_h P3` and `H_bits U_h P5 = 16 U_h P5`.
Consequently, for `z` off the spectrum,
`U_h† (zI - H_bits)^(-1) U_h = P3/(z-18) + P5/(z-16)`.
For a source vector `s` the scalar response has residues `||P3 s||²` and `||P5 s||²`; these *cannot be prescribed* before deriving the source and its normalisation. For the **conditional** eight-state Gibbs density `ρ* = (P3 + Δ² P5)/[4(1+Δ²)]`, the normalized trace response is
`R_ρ(z) = [1/(z-18) + Δ²/(z-16)]/(1+Δ²)`,
with high-frequency coefficient `zR_ρ → 1`. The historical handover `(2/5)/(z-18) + (2/15)/(z-16)` has `zG→8/15`: it is not the same normalized trace; it could represent a separately normalised sourced response **only if** that source and scale are independently derived. This illustration neither fixes a physical photon coupling nor validates Δ as a fundamental law.

## Immediate operational implications
- Gate A and its Q92 chronology-coefficient enquiry may analyse the old `H+c·Abar` hypothesis but **must not** require it to hold; a new native law can replace the whole ansatz.
- Gate F means **laws derived from Gate E**, not reproduction of "four ARFs" by numerical matching.
- Retain the historical equations only in dated archive comparisons, with provenance and status.
- All prior finite-operator certificates remain valid within their exact stated assumptions; this correction does not erase those results.
- No extra parameters, fitted constants, synthetic substitutes or circular choices are permitted.

Source records: `AGENTS.md`; `docs/RESEARCH_STATE.md` §§3,5–8; `research_archive/cathedral_arf_runner/RESEARCH_LOG.md` ACTIVE PROBLEM A; `newtons_cathedral/arf.py`.
