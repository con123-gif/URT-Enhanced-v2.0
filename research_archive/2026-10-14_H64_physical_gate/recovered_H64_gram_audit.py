"""2026-10-14: original October 8 Cathedral v113 Walsh history-source audit.

Run from the repository alongside the recovered original reconstruction. The original code builds the
64-state Walsh basis, signed Jacobian and 13x51/51x51 history blocks. Here we
also test its positive Gram completion J.T@J and differentiate the resulting
Feshbach response. This is NOT the later species-loaded physical operator.
"""
import os
import sys
import subprocess
import tempfile
from pathlib import Path
import numpy as np
from scipy.linalg import null_space

src = Path(__file__).resolve().parents[1] / "2026-10-14_recovered_H64" / "Cathedral_Rederivation_2026-10-08.py"
assert src.exists()
with tempfile.TemporaryDirectory() as tmp:
    env = os.environ.copy()
    env["OPENBLAS_NUM_THREADS"] = "1"
    env["OMP_NUM_THREADS"] = "1"
    subprocess.run([sys.executable, str(src), "--output-dir", tmp],
                   env=env, capture_output=True, text=True, check=True)
    f = np.load(Path(tmp) / "Cathedral_Rederived_Operators_2026-10-08.npz")
    U, W = f["H13"], f["Hidden"]
    x = U.T @ f["vacuum"]
    J0 = f["Jac"]
    alpha, beta, theta = np.sqrt(4/3), .25, 12/5
    r = np.linalg.norm(x)
    P = U @ x
    grad = (1/beta-alpha)*x+alpha*theta*U.T@np.sin(P)
    multiplier = x@grad/r**2
    Hess = (1/beta-alpha)*np.eye(13)+alpha*theta*U.T@np.diag(np.cos(P))@U
    Q = null_space(x[None, :])
    HT = Q.T @ (Hess-multiplier*np.eye(13)) @ Q
    assert np.linalg.eigvalsh(HT).min() > 0
    def block_response(y, positive):
        J = alpha*beta*(np.eye(64)-theta*np.diag(np.cos(U@y)))
        H = J.T @ J if positive else J
        B, D = U.T@H@W, W.T@H@W
        return B@np.linalg.solve(np.eye(51)-D, B.T)
    assert np.allclose(U.T@J0@W, f["scalarB"])
    assert np.allclose(W.T@J0@W, f["scalarD"])
    print("Recovered signed spectrum",np.linalg.eigvalsh(J0)[[0,-1]])
    print("Positive Gram spectrum",np.linalg.eigvalsh(J0.T@J0)[[0,-1]])
    for positive in (False, True):
        H = J0.T@J0 if positive else J0
        B, D = U.T@H@W, W.T@H@W
        R = np.linalg.solve(np.eye(51)-D,B.T)
        print("positive",positive,"SigmaF",np.linalg.norm(B@R))
        for i in (0,1):
            source = np.eye(13)[:,i]
            dx = Q@np.linalg.solve(HT,Q.T@source)
            dJ = alpha*beta*theta*np.diag(np.sin(P)*(U@dx))
            dH = dJ@J0 + J0@dJ if positive else dJ
            dB, dD = U.T@dH@W, W.T@dH@W
            derivative = dB@R+B@np.linalg.solve(np.eye(51)-D,dB.T+dD@R)
            h = 1e-5
            yp = r*(x+h*dx)/np.linalg.norm(x+h*dx)
            ym = r*(x-h*dx)/np.linalg.norm(x-h*dx)
            numeric=(block_response(yp,positive)-block_response(ym,positive))/(2*h)
            error=np.linalg.norm(derivative-numeric)
            assert error < 1e-7
            print("positive",positive,"singlet",i,"chi",source@dx,
                  "dSigmaF",np.linalg.norm(derivative),"fd_error",error)
print("PASS: real scalar-history H64 blocks; Gram test; analytic derivatives")
