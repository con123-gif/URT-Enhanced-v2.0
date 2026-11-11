# Pre-registration: the URT's own three-return as the Koide generation cycle (18 Oct 2026)

Written before computing. URT dynamics as fixed in the repo (framework_core.engine_invariants):
logistic map f(x) = r x (1 - x) at r_URT = 3.84167378699470935954, whose stable 6-cycle carries
delta_star = (80/81) pi/(13 phi). The map sends low -> mid -> high -> low: a native Z3 three-return.

Targets: measured Q = 0.66666446 +- 5.1e-6 and measured Lode phase 0.22222476 +- 6.3e-6.
Pass = all three values positive, Q and delta both within 3 sigma. Nothing is tuned; r is not varied.

- U1 the period-3 orbit of f at r_URT (one point per cluster), points as sqrt-masses.
- U2 the same orbit, points as masses.
- U3 the stable 6-cycle split into its two f^2 three-cycles (even and odd steps), each as sqrt-masses.
- U4 (diagnostic, not a pass route) each triple written as mu (1 + eps cos(theta + 2 pi k/3)):
     report eps (Koide needs sqrt2) and theta (Koide needs delta*).
- Control: Q and delta of the period-3 orbit across the whole period-3 window, to show whether
  r_URT is special or any r would do as well.
