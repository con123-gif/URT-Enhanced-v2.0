# Newton's Cathedral / URT — Five-Minute Verification Certificate

## Scope

This certificate deliberately separates **arithmetic/mathematics** from **physical identification**.
The companion script uses only the Python standard library and imports none of the Cathedral codebase.

## Result summary

**All 16/16 independent arithmetic/algebra checks passed.**

| Claim | Independent result | Math status | Physical status |
|---|---:|---|---|
| Locked rail gap Δ | 0.00248918984042037494 | PASS | model primitive/selection still a physics question |
| α-root inverse | 137.035999178194999 | PASS arithmetic | **not yet derived as physical electromagnetic α** |
| Cabibbo response sqrt(8/159) | 0.224308861636818 | PASS arithmetic | response-to-CKM identification remains theory-dependent |
| Ωm = 6/19 | 0.315789473684211 | PASS arithmetic | no microscopic Friedmann derivation yet |
| ΩΛ = 13/19 | 0.684210526315789 | PASS arithmetic | no microscopic Friedmann derivation yet |
| Entropy slope dS/(kB dp5) = 2ηΔ | 11.991595973482628 | PASS identity | gravity identification conditional |
| BKM χ35 | 47.966978303380195 | PASS identity | common force stiffness is a candidate physical reading |
| Generator-dual κ = η²/χ | 0.749465460810106 | PASS identity | curvature-to-generator normalization still open |
| A4 triangle frame M²=5M, rank 6 | residual 0.0e+00 | PASS exact integer algebra | continuum gauge reading conditional |
| A5 4⊗4 | 1⊕3⊕3′⊕4⊕5 | PASS character calculation | carrier-to-force identification conditional |
| Sym²(4) | 1⊕4⊕5 | PASS character calculation | geometry/color reading conditional |
| Λ²(4) | 3⊕3′ | PASS character calculation | weak/color reading conditional |
| Parent trace | Tr(T1²)=1/2; ratio=5/3 | PASS | gives relative, not absolute, gauge normalization |
| Parent sin²θW | 3/8 | PASS algebra | boundary-scale physical interpretation conditional |

## Transparent comparison with published values

These are **retrospective concordance checks**, not blind predictions.

- CODATA 2022: α⁻¹ = 137.035999177(21)
  - Cathedral candidate: 137.035999178194999
  - difference: 1.195e-09
  - standardized difference: 0.057 σ

- PDG 2025: |Vus| = 0.22431 ± 0.00085
  - Cathedral Cabibbo response: 0.224308861636818
  - difference: -1.138e-06
  - standardized difference: -0.001 σ

- Planck 2018 base-ΛCDM: Ωm = 0.315 ± 0.007
  - Cathedral 6/19: 0.315789473684211
  - difference: 7.895e-04
  - standardized difference: 0.113 σ

## Independent finite-algebra checks

### A4 shortest-triangle frame

Ten raw shortest-triangle bivectors were generated directly from
(e_i-e_j)∧(e_j-e_k).  Their integer Gram/frame operator M satisfies exactly

M² = 5 M

and has rank 6.  This verifies that its nonzero image is a six-dimensional
isotropic bivector carrier.  No Cathedral source code is imported.

### A5 representation decomposition

Using only the standard A5 character table and class sizes (1,15,20,12,12),
the independent character inner products give

4⊗4 = 1⊕3⊕3′⊕4⊕5,

Sym²(4) = 1⊕4⊕5,

Λ²(4) = 3⊕3′.

Thus the dimension/representation skeleton behind the 16 = 4 + 1 + 3 + 8
routing is genuine representation theory.

## Entropy check

For

ρ* = a I4 ⊕ b I4,
a = 1/[4(1+Δ²)],
b = Δ²/[4(1+Δ²)],

the script independently verifies

ln[(1-p5)/p5] = 2ηΔ,

χ35 = ln(a/b)/(a-b)
    = 8ηΔ(1+Δ²)/(1-Δ²),

and for generator perturbations

κgen = ηΔ²/χ35
     = (ηΔ/8)(1-Δ²)/(1+Δ²),

with

χ35 κgen = ηΔ².

These are exact internal information-geometric identities.

## What this certificate does NOT establish

It does not establish any of the following:

1. α-root is the physical fine-structure constant.
2. sqrt(8/159) is uniquely forced to be the physical Cabibbo angle.
3. 6/19 and 13/19 follow from a derived Friedmann cosmology.
4. the 4⊕1⊕3⊕8 carrier necessarily describes gravity+SM forces in nature.
5. the absolute curvature-to-information normalization is fixed.
6. the interacting four-dimensional continuum theory exists and is the SM+GR.

Those require additional derivation or prospective empirical tests.

## Current scientific verdict

The short audit finds **real, reproducible mathematics and striking numerical
concordances**, not a verified theory of nature.  The decisive remaining
physics problem is no longer whether the displayed arithmetic exists; it is
whether the mathematical invariants are uniquely connected to the physical
currents, continuum dynamics and observables without using those observations
to choose the map.
