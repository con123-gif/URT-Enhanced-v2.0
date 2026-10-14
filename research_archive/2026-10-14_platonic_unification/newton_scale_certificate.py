#!/usr/bin/env python3
"""Newton Scale naming and mathematical certificate, 14 October 2026.

Runs the already preserved independently constructed Platonic Laplacian
and nonlinear transfer, rather than inserting a golden ratio as input.
Proves a CONDITIONAL relative scale, not a physical sub-Planck theorem.

Usage:
python research_archive/2026-10-14_platonic_unification/newton_scale_certificate.py
"""
from pathlib import Path
import runpy
import json
from math import log, pi, sqrt
import numpy as np

here=Path(__file__).resolve().parent
result=runpy.run_path(str(here/"first_principles_scale.py"))

s=float(result["s2"])
sr=float(result["s3"])
phi=(1+sqrt(5))/2
L=np.asarray(result["L"])
D=np.asarray(result["D"])
Plo=np.asarray(result["Plo"])
Phi=np.asarray(result["Phi"])
lo=3-sqrt(5)
hi=3+sqrt(5)

assert abs(s-sqrt(lo/hi))<1e-14
assert abs(s-phi**-2)<1e-14
assert abs(sr-s)<1e-8
assert np.linalg.norm(D@Plo@D.T-Phi)<1e-10
assert np.linalg.norm(D@Phi@D.T-Plo)<1e-10
assert np.linalg.norm(np.linalg.matrix_power(D,4)-np.eye(20))<1e-10

# The scale is NOT a global conjugation of the graph Laplacian.
defect=float(np.linalg.norm(D@L@D.T-L/s**2))
assert defect>1
# With a second-order physical matching assumption:
assert abs(lo/s**2-hi)<1e-12

out={
    "name":"Newton Scale Law — proposed Cathedral designation",
    "date":"2026-10-14",
    "verified_finite_theorem":"positive refinement ratio conditional on triplet spectral matching",
    "Newton_factor":s,
    "Newton_inverse":1/s,
    "graph_triplet_eigenvalues":[lo,hi],
    "graph_triplet_swap_residual":float(np.linalg.norm(D@Plo@D.T-Phi)),
    "nonlinear_transfer_volume_dictionary_factor":sr,
    "derived_ratio_discrepancy":abs(sr-s),
    "whole_graph_global_scaling_defect":defect,
    "log_length_period_if_physical":-log(s),
    "log_angular_frequency_if_physical":2*pi/(-log(s)),
    "absolute_length_meters_derived":False,
    "selected_species_H64_cross_scale_proved":False,
    "physical_sub_Planck_measurement_verified":False,
}
print(json.dumps(out,indent=2))
print("PASS: Newton Scale is the derived conditional Platonic triplet ratio.")
