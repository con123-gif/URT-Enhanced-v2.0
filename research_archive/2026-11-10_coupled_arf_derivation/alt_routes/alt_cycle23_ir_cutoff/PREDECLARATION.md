# Predeclaration — alt_cycle23: IR regulators from inside the system

Date: 2026-11-10 (Europe/London)
Route: (23) Test whether the KMS temperature η = −ln Δ, the 24-clock gap λ_min(L2) ≈ 0.007658, or the hidden Hessian small eigenvalue 2.711×10^{-6} provides a parameter-free IR cutoff that makes the cycle-19 electromagnetic ratio finite. Predeclare R_EM before computing; only then compare to R_α with look-elsewhere.

## Predeclared cutoffs (no others will be scanned)
Using the same Hodge, q = 1, icosahedral 30-edge setting as alt_cycle19, write
    R_EM(ε) = λ_min(Π_T(ε)) / λ_min(Δ1_T)
where Π(ε) is the Hessian at A = 0 of log det(Δ_A + ε I) and the subscript T means the 19-dimensional transverse edge space. λ_min(Δ1_T) = 3 − √5. The three named cutoffs are
    ε_KMS   = η = −ln Δ,                     Δ = 3/20 − 80π/(1053 φ)
    ε_clock = λ_min(L2),                     L2 = charge-2 gold-angle 24-clock Laplacian
    ε_hid   = 2 Δ² c5,                       golden-mode hidden Hessian eigenvalue on 4_5
             with c5 = 1/4 − 1/(2(16 + r² λ_min(L2))), r = π/e

Two structural completions of the clock option, also predeclared (not searched after the fact):
    Π_sum      = Σ_k Π(ε = λ_k(L2))                 (product kinetic Δ ⊗ I + I ⊗ L2)
    Π_sum,r²   = Σ_k Π(ε = r² λ_k(L2))              (archived hidden pairing r² L)
    R_EM^{sum}     = λ_min((Π_sum)_T) / λ_min(Δ1_T)
    R_EM^{sum,r²}  = λ_min((Π_sum,r²)_T) / λ_min(Δ1_T)

Identifications that will not be used: ε = 1/η, ε = η², ε = 1/λ_min(L2), or any fitted multiple.

## Comparison protocol (executed only after the five numbers are written)
Compare each R_EM to
    R_α = 3/(64 φ) + 1/(79 φ²)
by relative error. Then run the alt_cycle08 T1 grammar on the strict Cathedral alphabet
    G_strict = {1,2,3,4,5,6,8,12,13,15,16,18,20,24,30,32,50,51,60,64,80,81,90,120,190}
(unordered two-atom sums a/(n φ^k) + b/(m φ^l), coefficients in {±1,±2,±3,±4,±5,±7,±8}, k,l ∈ {0,1,2}). Report nearest rivals of R_α in that grammar and whether any predeclared R_EM lies within relative 10^{-4} of R_α. A numerical near-hit is not a derivation. 79 is not admitted by hand (it is absent from G_strict).

## Hypotheses
H1. Each of ε_KMS, ε_clock, ε_hid is a positive parameter-free number already present in the archive, and each makes Π_T finite.
H2. Using ε_KMS or ε_hid as a spatial Laplacian mass is an extra identification (KMS temperature and the hidden 4_5 Hessian are not fermion kinetic terms). The product-sum constructions are the natural clock completions, but they assume that H13 fermions carry the 24-clock (CONDITIONAL).
H3. None of the five predeclared ratios equals R_α as an identity. Any numerical proximity will be reported with the look-elsewhere census and will not be promoted to a derivation.

## Integrity
No ARF target is inserted into Π. Comparison occurs only after the five R_EM values are recorded. Classification PROVED / CONDITIONAL / FALSIFIED / OPEN.
