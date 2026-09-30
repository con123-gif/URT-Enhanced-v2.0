from math import pi, sqrt, log

PHI = (1 + sqrt(5.0)) / 2.0
D = 3
N = 13
V = 12
E = 30
F = 20
Q = 5
A5_ORDER = 60
GAMMA = 1.0 / 81.0

D_STAR = (1.0 - GAMMA) * pi / (N * PHI)
D_CLASSICAL = D / F
DELTA = D_CLASSICAL - D_STAR
ETA_DELTA = -log(DELTA)

LAMBDA_PARALLEL = 3.0 - sqrt(5.0)
LAMBDA_PERP = 3.0 + sqrt(5.0)

ALPHA_RESIDUE_INV = (
    137.0
    + (17572.0 / 1215.0) * DELTA
    - (9.0 / 65.0) * DELTA * DELTA
)
