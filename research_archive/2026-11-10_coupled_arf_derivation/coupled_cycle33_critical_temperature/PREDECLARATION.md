# Coupled cycle 33 predeclaration — T_c(y_even) and the derived temperature η

Date: 2026-11-10 (Europe/London)

Cycle 18 / alt 25 computed the even-channel critical coupling at
two temperatures: y_c(η) and y_c(0). This cycle inverts the
relation to a critical temperature T_c(y_even) and asks whether
any derived temperature (in particular the KMS value η) places
the system above T_c for all O(1) couplings.

Frozen ingredients, used as named inputs, not fitted:

    φ = (1+√5)/2,   δ★ = 80π/(1053 φ),   Δ = 3/20 − δ★,   η = −ln Δ
    c_even = Δ² c5 = 1.3555131567782033×10^{-6}
    even unit pairing = cycle-18 even_hat on the cycle-11 even frame
    Nambu Ω and pairing susceptibility χ of cycle 18:
        Ω_f(s; T) := fermion_omega(E_BdG(K, s Δ_unit), |ξ(K)|, T)
        χ(T) := lim_{s→0} −Ω_f(s; T) / s²
        y_c(T) := sqrt(c_even / χ(T))   (when χ(T) > 0)
    primary kinetic: 12-site icosahedral graph Laplacian
    (the same carrier as cycles 23–32). Control: H13 Hodge kinetic
    of cycle 18, which supplied the quoted y_c,even(η) = 0.006011318618427269.

No historical ARF is inserted. The overall y_even scale remains
free (cycle 22); this cycle does not fix it.

## Definition of T_c

T_c(y_even) is the unique T ≥ 0 at which y_c(T) = y_even, i.e.

    χ(T_c) = c_even / y_even²,

when such a T exists. Equivalently, the origin r = 0 is linearly
stable for T > T_c and unstable for T < T_c.

- If y_even ≤ y_c(T = 0) then χ(T) ≤ χ(0) < c_even / y_even² for
  all T (χ decreases with T), so there is no condensation at any
  temperature and we report T_c = 0 with the flag `never_condenses`.
- If y_even > y_c(0) there is a unique positive T_c, because χ(T)
  is continuous, χ(0) > c_even / ye², and χ(T) → 0 as T → ∞.

‘Above T_c’ means the normal / subcritical phase (r = 0).
‘O(1) couplings’ means y_even ∈ {0.1, 0.5, 1, 2, 5, 10}, the
natural O(1) window around the Yukawa normalisation y = 1 used
in alt 25 and cycles 19–29. The tiny critical values
y_c(η) ≈ 0.006 and y_c(0) ≈ 0.004 are not O(1).

## Observables, in this order

1. Recompute χ(T) at T = 0 and T = η with the cycle-18 procedure
   (s = 10^{-4} at T = 0, s = 10^{-3} at T > 0) and confirm
   agreement with cycle 18’s stored values to relative 10^{-8}:
       ico:   χ(η) = 0.038415791436818836, y_c(η) = 0.005940144040707988
              χ(0) = 0.09166640779767476,  y_c(0) = 0.003845446400083969
       H13:   χ(η) = 0.037511483697016956, y_c(η) = 0.006011318618427269
              χ(0) = 0.07737952500974643,  y_c(0) = 0.004185418011108536
2. Compute χ(T) on the grid
       T ∈ {0} ∪ {η} ∪ geomspace(10^{-2}, 10^3, 49)
   and the corresponding y_c(T). Record the high-T diagnostic
       χ_HT(T) := ||Δ_unit||_F² / (8 T)
   which follows from Ω = −n T log 2 − Σ E_+² / (8T) + O(T^{-3})
   together with Σ E_+² = Tr(K²) + ||Δ||_F². Report the residual
   |χ(T) − χ_HT(T)| / χ(T) at T = 10, 100, 1000.
3. For each ye in {0.01, 0.1, 0.5, 1, 2, 5, 10} invert χ(T_c) =
   c_even / ye² by safeguarded scalar root-finding (Brent) on
   [0, T_max] with T_max large enough that χ(T_max) < target
   (or report never_condenses if ye ≤ y_c(0)). Also report the
   high-T estimate T_c^{HT} = ||Δ_unit||_F² · ye² / (8 c_even).
4. Compare each T_c(ye) to η. Report the ratio T_c(ye) / η and
   the logical value of “T = η is above T_c” (i.e. ye < y_c(η)).
5. List every derived temperature in the frozen data of this
   programme (η itself, and any other KMS / modular scale that is
   a temperature rather than a coupling: there is no second
   temperature). Ask whether any of them satisfies
   T_derived > T_c(ye) for all ye in the O(1) window.

No ARF comparison is performed. T_c is not an ARF.

## Hypotheses

H1. χ(T) is positive and strictly decreasing from χ(0) to 0, so
    T_c(ye) exists, is unique and is strictly increasing in ye
    for every ye > y_c(0).
H2. For every O(1) coupling, T_c(ye) ≫ η. Equivalently, η lies
    below T_c whenever ye > y_c(η) ≈ 0.006, which includes the
    entire O(1) window. The system at the KMS temperature is
    deep in the condensed (supercritical) phase for all O(1)
    Yukawas.
H3. No other derived temperature of the programme inverts this:
    there is no archived T that places all O(1) couplings above
    T_c. (A temperature T ≳ T_c(ye = 10) ~ O(χ_HT^{-1} · 100)
    would be required; nothing of that magnitude is derived.)
H4. The high-T formula χ ≈ ||Δ_unit||_F² / (8T) already agrees
    with χ(η) at the ten-percent level and becomes accurate at
    large T; the qualitative comparison T_c ≫ η does not depend
    on the small-T pairing details.

Classification: PROVED / CONDITIONAL / FALSIFIED / OPEN by the
hypotheses. No ARF target is used.
