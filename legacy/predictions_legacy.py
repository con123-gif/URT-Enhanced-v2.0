"""
LEGACY — Physics Predictions Registry (preserved for reference)

This file contains the original predictions registry that mapped the
mathematical G13 + URT framework onto a large set of physical observables
(QED, QCD, electroweak, cosmology, dark sector, etc.).

It is kept here during the transition of the grok-review branch to a
pure mathematical focus.

DO NOT import from this file in new code on this branch.

See:
- BRANCH_DIRECTION.md
- README.md (current pure-math framing)
- legacy/README.md

The original full implementation remains in git history.
"""

# Original docstring from predictions.py (for historical record):
"""
The predictions registry — single source of truth for the framework's
numerical claims.

Forty-five+ observables across QED, QCD, electroweak, fermion masses,
mixing matrices, cosmology, inflation, dark sector, gravity, periodic
table, and nuclear physics — all closed forms in
{D, q, V, E, F, G, N, γ, φ, π} (with the single dimensional input
ρ_Λ = (2.34 meV)⁴ for absolute mass scales).

Status (May 2026):
    confirmed  : ~40    (median rel-err < 0.1 %)
    predicted  :  1     (r tensor-to-scalar — within current bound)
    open       :  6     (axion, sterile-ν, WIMP, Casimir, microwave line,
                         next noble gas)
"""

# The full original code (Prediction dataclass, all_predictions(),
# and all the imports from physics-named modules) is preserved in git history
# under the commit before this move.
#
# If you need the old functionality for comparison or archival work,
# check out an earlier commit on this branch or the newtons-cathedral branch.

print("[legacy] predictions_legacy.py loaded — this module is deprecated on grok-review.")
