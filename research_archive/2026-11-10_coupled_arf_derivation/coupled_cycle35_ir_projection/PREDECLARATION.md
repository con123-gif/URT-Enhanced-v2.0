# Coupled cycle 35 predeclaration — archive IR massless-photon projection and α_eff

Date: 2026-11-10 (Europe/London)

Cycle 32 found that the subcritical branch at T = η has a positive,
nearly Maxwell-like kernel with a near-zero London mass, independent
of y_even. This cycle asks whether the archive itself supplies a
unique rule that turns that kernel into a single infrared coupling
κ_IR and a conversion α_eff(κ_IR), with every 4π/e² convention
fixed in advance.

This cycle is first an archival reading, then (only if a unique rule
exists) a numerical application of that rule to the already-computed
cycle-32 kernel at the derived subcritical vacuum (A = 0, T = η,
r = 0). No new kernel is computed here. Historical ARFs and the
PDG value 1/137.036 are comparison targets only and are not inserted
into any action or used to select a rule. The original
`newtons-cathedral` tip remains read-only at `6bad7b3`.

## Sources to be read (read-only)

- `Cathedral_URT_Theory_of_Nature_2026-08-22.md` §41 (electromagnetism
  and continuum fields) and the electromagnetic-response route of §29.
- `2026-10-24_alpha_physical_gate/WHY_24_STATE_SYMMETRY_IS_NOT_YET_ALPHA.md`
- `2026-10-24_alpha_physical_gate/TWO_INDEPENDENT_GEOMETRIC_ALPHA_EXACT_GATE.md`
  (especially section D and the constructive K_EM gate).
- `2026-10-24_alpha_physical_gate/CHARGE_TRACE_TO_ALPHA_EXACT_REDUCTION.md`
- `2026-10-24_alpha_physical_gate/FIRST_PRINCIPLES_ALPHA_GATE.md`
- `2026-10-24_alpha_physical_gate/EXACT_A4_WILSON_CONTINUUM_COEFFICIENT.md`
- `2026-10-16_sourced_gauge_hidden_berry/README.md` (unit-cochain
  Maxwell action and the finite-shell warning).

## What would count as a unique rule

A unique rule must, using only statements already present in those
sources, do both of the following with no extra choice:

1. Extract a single number κ_IR from a discrete transverse kernel
   Π_T defined on the 19-dimensional cycle space of the icosahedral
   1-skeleton (or state that Π_T is not the object the rule applies
   to).
2. Convert that number to α_eff with a fixed 4π/e² convention.

If several inequivalent extractions or conversions are stated, or
if the archive explicitly leaves the relevant coefficient free, or
if it defines K_EM only as a continuum q → 0 residue that the
finite shell does not possess, then there is no unique rule.

Inequivalent discrete avatars that will NOT be selected among
unless the archive names exactly one of them:

- κ_iso = ⟨Π_T, Δ1_T⟩_F / ||Δ1_T||_F²
- κ_REM = λ_min(Π_T) / λ_min(Δ1_T)  (the 3−√5 eigenspace)
- the cycle-29 projection coefficient κ in
  Π_T = m² I + κ Δ1_T + β Δ1_T² + R
- Tr(Π_T) / Tr(Δ1_T)
- λ_min(Π_T) itself
- any volume- or symbol-rescaling of the above (the 1/16 continuum
  symbol of 16 October; the factor 1/24 in WHY_24 theorem 2; the
  charge-trace 16/3)

## Continuum conversion that the archive does state

The Thomson / electron-unit convention, repeated in WHY_24 and in
the constructive gate of TWO_INDEPENDENT, is

    Γ_EM^{(2)}[A] = (K_γ / 4) ∫ F²
    α(0)^{-1} = 4π K_γ

equivalently K_EM = lim_{q→0} (1/((d−1) q²)) Tr[P_T(q) Π(q)],
then α^{-1} = 4π K_EM, in the electron Q = −1 chart. CHARGE_TRACE
writes the same Thomson relation as α(0)^{-1} = 4π (16/3) C_IR
once 1/e² = (16/3) C_IR, i.e. K_γ = (16/3) C_IR. That identifies
C_IR with a charge-weighted overall factor, not with a graph κ.

This conversion will be used if and only if the reading produces a
unique discrete extraction of K_γ (or of C_IR) from our Π_T.

## Comparison protocol (used only if a unique rule exists)

Recorded before any application to numbers:

    R_α = 3/(64 φ) + 1/(79 φ²)
    α_PDG := 1/137.036          (PDG/CODATA check only, last)

    α_eff := 1 / (4π κ_IR)     if the unique rule is α^{-1} = 4π K_γ
                                with κ_IR identified with K_γ;
              or whatever unique conversion the archive states.

A numerical match to R_α or to α_PDG is declared only if
|α_eff − target| / target < 10^{-4}. Look-elsewhere ensemble,
independent of the measured κ_IR:

    S = {1,2,3,4,5,6,7,8,9,12,13,14,15,16,18,20,24,30,32,35,40,
         50,51,63,64,79,80,81,90,105,190}
    E = { n / (m φ^k) : n, m ∈ S, m ≠ 0, k ∈ {0,1,2} }

Report hits of E within 10^{-4} of R_α, of α_PDG and of α_eff.
A match at 10^{-4} is a coincidence unless it is an identity.

If the reading finds no unique rule, this comparison is not
performed and no candidate α_eff is published.

## Hypotheses

H1. The archive uniquely states the continuum conversion
    α(0)^{-1} = 4π K_γ for a 4D infrared transverse q² residue K_γ
    in the electron chart.
H2. The archive does not uniquely specify how to extract that K_γ
    from the finite-graph kernel Π_T of cycles 25–32 (Maxwell +
    Ward leave the graph coefficient λ free; the finite shell has
    no q → 0 mode; several inequivalent discrete avatars exist;
    “massless photon projection” in CHARGE_TRACE is the electroweak
    Q = Y+T_3 projection plus running, not the 3−√5 eigenspace).
H3. Therefore no unique κ_IR is defined and no comparison with
    R_α or 1/137.036 is performed.

Classification: PROVED / CONDITIONAL / FALSIFIED / OPEN by the
reading. No ARF target is used to select a rule.
