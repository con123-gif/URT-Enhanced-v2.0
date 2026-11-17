# Q161ax — original Q101 face-source orbit covariance

Status: **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING**. Agent GPT, 2026-11-17.

Using the original twelve icosahedral vertices, thirty edges, twenty triangular faces, vertex-opposition involution, and original low-mode projector P_l=P_3+P_5, enumerate all thirty frustrated words s with sum(s)=4 and sum_edges s_i s_j=-6. Define f_s=(C P_l s)^{⊙2} and exact ground-orbit covariance Σ=(1/30)∑(f_s−μ)(f_s−μ)^T, μ=(1/30)∑f_s.

The standalone exact SymPy certificate constructs all 20×20 entries in Q(sqrt(5)) and establishes μ=(3/5)1_20, Σ=Σ^T, Σ1_20=0, and Tr Σ=416/25. It also checks E||f||²=596/25 and ||μ||²=36/5. Consequently the uniform face source is fixed across the thirty-word orbit, while the full nonuniform covariance has nonzero total variance 416/25.

Evidence: executed locally with python Q161AX_FACE_ORBIT_COVARIANCE_CERT.py; exit 0, printed trace 416/25. No measured data, historical ARF inputs, or fitted constants. This is a bounded native Q101 downstream result, not a full five-solid/190/H64/24 source identification or Q96 Ward proof. No physical gate closed.

Next: compute exact projections of Σ onto the six original history channels and the fourteen-dimensional nullspace, then test their native Q96 transformation.
