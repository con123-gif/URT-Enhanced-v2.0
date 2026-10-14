"""A5 hidden-four projection and positive return in the recovered v113 H64 branch.

Requires numpy/scipy and the original archived October 8 reconstruction.
Run: python research_archive/2026-10-14_hidden4/A5_hidden4_positive_return.py
This is a finite mathematical witness, not the later physical T_star.
"""
from pathlib import Path
import itertools
import os
import subprocess
import sys
import tempfile
import numpy as np

root = Path(__file__).resolve().parents[1]
src = root / "2026-10-14_recovered_H64" / "Cathedral_Rederivation_2026-10-08.py"
assert src.exists(), str(src)
with tempfile.TemporaryDirectory() as tmp:
    env = dict(os.environ, OPENBLAS_NUM_THREADS="1", OMP_NUM_THREADS="1")
    subprocess.run([sys.executable, str(src), "--output-dir", tmp],
                   env=env, capture_output=True, text=True, check=True)
    with np.load(Path(tmp) / "Cathedral_Rederived_Operators_2026-10-08.npz") as z:
        vertices = z["vertices"]
        faces = z["faces"]
        H = z["H13"]
        N = z["Hidden"]
        vacuum = z["vacuum"]
        J = z["Jac"]

# Rebuild all 60 proper icosahedral rotations.
base = vertices[list(faces[0])].T
rotations = []
for face in faces:
    for cyclic in range(3):
        ids = list(face[cyclic:]) + list(face[:cyclic])
        R = vertices[ids].T @ np.linalg.inv(base)
        transformed = vertices @ R.T
        idx = np.argmin(np.linalg.norm(vertices[:,None,:] -
                        transformed[None,:,:], axis=2), axis=0)
        assert len(set(idx)) == 12
        assert np.max(np.linalg.norm(vertices[idx] - transformed, axis=1)) < 1e-10
        rotations.append(R)
assert len(rotations) == 60

# Signed permutation action on six antipodal axes, hence 64 spin histories.
axes = []
for v in vertices:
    a = v / np.linalg.norm(v)
    if not any(abs(a @ old) > 1-1e-10 for old in axes):
        axes.append(a)
axes = np.array(axes)
bits = np.array(list(itertools.product((-1,1), repeat=6)))
lookup = {tuple(v): i for i,v in enumerate(bits)}
P4 = np.zeros((64,64))
multiplicity = dict.fromkeys(("1","3","3p","4","5"), 0.0)
multiplicity13 = dict.fromkeys(multiplicity, 0.0)
class_orders = []
for R in rotations:
    transformed = axes @ R.T
    indices = np.argmax(abs(transformed @ axes.T), axis=1)
    signs = np.sign(np.sum(transformed * axes[indices], axis=1)).astype(int)
    assert len(set(indices)) == 6
    assert np.max(abs(transformed - signs[:,None]*axes[indices])) < 1e-10
    U = np.zeros((64,64))
    for i, spin in enumerate(bits):
        target = np.zeros(6, dtype=int)
        for old_axis in range(6):
            target[indices[old_axis]] = signs[old_axis] * spin[old_axis]
        U[lookup[tuple(target)],i] = 1
    power = np.eye(3)
    order = 0
    for n in range(1,7):
        power = power @ R
        if np.linalg.norm(power-np.eye(3)) < 1e-9:
            order = n
            break
    assert order in (1,2,3,5)
    class_orders.append(order)
    tr = float(np.trace(R))
    characters = {
        "1": 1,
        "3": tr,
        "3p": (1-tr if order==5 else {1:3,2:-1,3:0}[order]),
        "4": {1:4,2:0,3:1,5:-1}[order],
        "5": {1:5,2:1,3:-1,5:0}[order],
    }
    P4 += (4/60)*characters["4"]*U
    for irrep, character in characters.items():
        multiplicity[irrep] += character * np.trace(U) / 60
        multiplicity13[irrep] += character * np.trace(H.T@U@H) / 60
P4 = (P4+P4.T)/2
P4h = N.T@P4@N

# Positive Gram completion and positive hidden-sector return.
G = J.T@J
Bg = H.T@G@N
Dg = N.T@G@N
B4 = Bg@P4h
G4 = B4@B4.T
assert np.linalg.eigvalsh(G).min() > 0
assert np.linalg.norm(P4@P4-P4) < 1e-10
assert np.linalg.norm(P4@H) < 1e-10
assert np.linalg.norm(P4h@P4h-P4h) < 1e-10
assert np.linalg.norm(G4-G4.T) < 1e-10
assert np.linalg.eigvalsh(G4).min() > -1e-12

print("A5 class sizes by order:", {n:class_orders.count(n) for n in (1,2,3,5)})
print("H64 multiplicities:", {k:round(v) for k,v in multiplicity.items()})
print("H13 multiplicities:", {k:round(v) for k,v in multiplicity13.items()})
print("H51 multiplicities:", {k:round(multiplicity[k]-multiplicity13[k]) for k in multiplicity})
print("P4 rank:", round(np.trace(P4)), "||P4 H13||F:", np.linalg.norm(P4@H))
print("positive Gram eigenvalue interval:", np.linalg.eigvalsh(G)[[0,-1]])
print("||B||F:", np.linalg.norm(Bg), "||B4||F:", np.linalg.norm(B4))
print("rank B4:", np.linalg.matrix_rank(B4,tol=1e-9))
print("trace B4 B4^T:", np.trace(G4), "fraction:", np.trace(G4)/np.trace(Bg@Bg.T))
eig, V = np.linalg.eigh(Dg)
for t in (0,1,5):
    half = (V*np.exp(-0.5*t*eig))@V.T
    K4 = Bg@half@P4h@half@Bg.T
    K = Bg@half@half@Bg.T
    assert np.linalg.eigvalsh(K4).min() > -1e-12
    print("positive heat return t=", t, "trace hidden4=", np.trace(K4),
          "full trace=", np.trace(K), "fraction=", np.trace(K4)/np.trace(K))


# Check connected coupling across the three canonical Walsh-degree layers.
Walsh = {}
for degree in (2,3,4):
    columns = []
    for subset in itertools.combinations(range(6), degree):
        columns.append(np.prod(bits[:,subset],axis=1)/8)
    wk = np.column_stack(columns)
    Walsh[degree] = P4 @ wk @ wk.T @ P4
for degree, projector in Walsh.items():
    A = H.T @ G @ projector
    print("four-sector degree:", degree,
          "rank:", round(np.trace(projector)),
          "squared visible coupling:", np.linalg.norm(A)**2)
for left,right in ((2,3),(2,4),(3,4)):
    print("degree mixing",left,right,
          "||P_left G P_right||F:",
          np.linalg.norm(Walsh[left]@G@Walsh[right]))
