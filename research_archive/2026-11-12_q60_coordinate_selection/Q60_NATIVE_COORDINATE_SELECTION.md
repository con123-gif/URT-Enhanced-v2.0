# Q60 — exact 2I face-coordinate hidden selection

Status: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING for the stated 2I-derived face-coordinate multiplication only. Q60 charged Ward join remains OPEN.

Source: original 120 binary-icosahedral quaternion orbit, its 20 face normals and the resulting native dodecahedral face Laplacian L=3I-A; prior certificate `research_archive/2026-11-12_q60_hopf_h64_frame/` and earlier Q60 antipodal parity calculation. This certificate reconstructs the face frame from exact icosian generators, not synthetic matrices. No empirical values, fitted parameters or historical ARFs are inputs.

Let J exchange antipodal face normals and let P3,P5 be the exact spectral projectors of L at eigenvalues 3,5 (both rank four). The existing parity theorem is JP3=-P3 and JP5=P5. For each Cartesian component a=1,2,3 of the native quaternion-derived face normal, define the face multiplication X_a=diag(n_{1a},...,n_{20a}). Since J X_a J=-X_a, parity forces P3 X_a P3=P5 X_a P5=0. The executed exact certificate additionally gives rank(P3 X_a P5)=4 and Tr[(P3 X_a P5)^T(P3 X_a P5)]=1/3 for each a. Thus each original coordinate is a nonzero full-rank hidden 4_3↔4_5 mixing operator, while same-parity hidden matrix elements vanish exactly. These equalities refer to the unnormalized face normals generated from the order-six icosian imaginary axis in the script.

This is a finite, basis-independent selection rule for a specific native geometric operator, NOT a calculation of the charged Hopf T_{±2,±4} intertwiner, the all-five U_h face-frame join, either Ward order, or any physical ARF. The three coordinate operators are not substitutes for the still-unconstructed charged source.

Executed: `python research_archive/2026-11-12_q60_coordinate_selection/Q60_NATIVE_COORDINATE_SELECTION.py` in local Python/SymPy sandbox on 2026-11-13; exit 0. Output: hidden J traces -4,+4; for each a=0,1,2, CROSS_RANK 4, CROSS_NORM_SQUARED 1/3; Q60_NATIVE_COORDINATE_SELECTION_OK.

RESUME HERE: determine whether the original charged Hopf link operator, transported by the audited Q60 face-frame map, obeys the same antipodal-odd selection rule; explicitly calculate P3 T P3, P5 T P5 and P3 T P5 before asserting a Ward join.
