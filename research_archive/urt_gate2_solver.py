#!/usr/bin/env python3
"""
Gate-2 solver for the frozen Lytollis-URT finite matter operator.

This script:
  1. loads the audited centred-icosahedral seed matrices;
  2. reconstructs the representative edge K4 charge frames;
  3. fixes the relative Clebsch sign by the explicit mixed portal;
  4. solves the A5-quotiented classical-CAR vacuum at eta_Delta and eta_conf;
  5. assembles the frozen blocks
         M_f = \widetilde M_f (Q1 + Delta Q2 + Delta^2 Q3);
  6. returns mass ratios, CKM, PMNS and Jarlskog invariants.

It intentionally tests the last frozen formula without fitting or target selection.
"""

from __future__ import annotations

import itertools
import math
from pathlib import Path

import numpy as np
from scipy.optimize import minimize
import torch


BASE = Path(__file__).resolve().parent
SEED = BASE / "urt_seed_geometry_matrices.npz"
OUT = BASE / "urt_gate2_solution.npz"

torch.set_default_dtype(torch.float64)

phi = (1.0 + math.sqrt(5.0)) / 2.0
Delta = 3.0 / 20.0 - 80.0 * math.pi / (1053.0 * phi)
eta_delta = -math.log(Delta)
eta_conf = 9.8601129428

data = np.load(SEED)

vertices = data["vertices"]
faces = data["faces"]
edges = [tuple(map(int, edge)) for edge in data["edges"][:30]]
d1 = data["d1"]
B = data["B"]
U3 = data["U3"]
U3p = data["U3p"]
U5 = data["U5"]
H3 = data["H3"]
H5 = data["H5"]
rotations = data["rotations"]
J43 = -data["J43"]  # sign fixed by positive alignment with the mixed physical triplet portal
J45 = data["J45"]
J5 = data["J5"]

# -------------------------------------------------------------------------
# Group action
# -------------------------------------------------------------------------

def permutation_from_rotation(rotation: np.ndarray, points: np.ndarray) -> tuple[int, ...]:
    mapped = (rotation @ points.T).T
    return tuple(
        int(np.argmin(np.linalg.norm(points - point, axis=1)))
        for point in mapped
    )


vertex_permutations = [
    permutation_from_rotation(rotation, vertices)
    for rotation in rotations
]

face_lookup = {
    tuple(sorted(map(int, face))): index
    for index, face in enumerate(faces)
}

face_permutations = [
    tuple(
        face_lookup[tuple(sorted(permutation[int(v)] for v in face))]
        for face in faces
    )
    for permutation in vertex_permutations
]


def permutation_matrix(permutation: tuple[int, ...]) -> np.ndarray:
    matrix = np.zeros((len(permutation), len(permutation)))
    for source, target in enumerate(permutation):
        matrix[target, source] = 1.0
    return matrix


Pv = [permutation_matrix(p) for p in vertex_permutations]
Pf = [permutation_matrix(p) for p in face_permutations]

rho3 = [U3.T @ p @ U3 for p in Pv]
rho3p = [U3p.T @ p @ U3p for p in Pv]
rhoH3 = [H3.T @ p @ H3 for p in Pf]
rhoH5 = [H5.T @ p @ H5 for p in Pf]


def group_index(rotation: np.ndarray) -> int:
    return int(np.argmin([np.linalg.norm(rotation - r) for r in rotations]))


identity = group_index(np.eye(3))
multiplication = np.array(
    [
        [group_index(rotations[i] @ rotations[j]) for j in range(60)]
        for i in range(60)
    ],
    dtype=int,
)

orders: list[int] = []
for element in range(60):
    power = identity
    for order in range(1, 61):
        power = multiplication[power, element]
        if power == identity:
            orders.append(order)
            break

order_two = [i for i, order in enumerate(orders) if order == 2]
order_three = [i for i, order in enumerate(orders) if order == 3]


def pi_axis(rotation: np.ndarray) -> np.ndarray:
    values, vectors = np.linalg.eigh((rotation + rotation.T) / 2.0)
    axis = vectors[:, np.argmax(values)]
    return axis / np.linalg.norm(axis)


axes_two = {element: pi_axis(rotations[element]) for element in order_two}

# -------------------------------------------------------------------------
# Edge alphabet and representative charge frame
# -------------------------------------------------------------------------

edge_alphabet = []
edge_geometry = []

for edge_index, (i, j) in enumerate(edges):
    u = vertices[i]
    v = vertices[j]

    midpoint = u + v
    midpoint /= np.linalg.norm(midpoint)

    difference = u - v
    difference /= np.linalg.norm(difference)

    normal = np.cross(midpoint, difference)
    normal /= np.linalg.norm(normal)

    axes = [midpoint, difference, normal]
    projectors = np.array([np.outer(axis, axis) for axis in axes])

    half_turns = []
    for axis in axes:
        element = max(order_two, key=lambda g: abs(np.dot(axes_two[g], axis)))
        if abs(np.dot(axes_two[element], axis)) < 1.0 - 1.0e-7:
            raise RuntimeError("Could not identify edge K4 half-turn.")
        half_turns.append(element)

    cycle_candidates = []
    for element in order_three:
        representation = rho3[element]
        error = sum(
            np.linalg.norm(
                representation @ projectors[k] @ representation.T
                - projectors[(k + 1) % 3]
            )
            for k in range(3)
        )
        if error < 1.0e-7:
            cycle_candidates.append(element)

    incident = [
        face_index
        for face_index, face in enumerate(faces)
        if i in face and j in face
    ]

    unsigned = np.zeros(20)
    unsigned[incident] = 1.0
    signed = d1[:, edge_index]

    xi3 = H3.T @ unsigned
    xi5 = H5.T @ unsigned
    signed3 = H3.T @ signed
    signed5 = H5.T @ signed

    Em3 = xi3 / np.linalg.norm(xi3)
    En3_reference = signed3 / np.linalg.norm(signed3)
    Ed5 = signed5 / np.linalg.norm(signed5)

    scored_cycles = []
    for element in cycle_candidates:
        element_squared = multiplication[element, element]
        En3 = rhoH3[element_squared] @ Em3
        scored_cycles.append((float(np.dot(En3, En3_reference)), element))

    score, cycle = max(scored_cycles)
    if score < 1.0 - 1.0e-7:
        raise RuntimeError("Could not orient the edge C3 normalizer.")

    cycle_squared = multiplication[cycle, cycle]

    Ed3 = rhoH3[cycle] @ Em3
    En3 = rhoH3[cycle_squared] @ Em3

    Em5 = rhoH5[cycle_squared] @ Ed5
    En5 = rhoH5[cycle] @ Ed5

    E3 = np.column_stack([Em3, Ed3, En3])
    E5 = np.column_stack([Em5, Ed5, En5])

    vertex_indicator = np.zeros(12)
    vertex_indicator[[i, j]] = 1.0
    Hedge = U5.T @ vertex_indicator
    Hedge /= np.linalg.norm(Hedge)

    edge_alphabet.append(np.concatenate([Hedge, xi3, xi5]))
    edge_geometry.append(
        {
            "E3": E3,
            "E5": E5,
            "Q": projectors,
            "half_turns": half_turns,
        }
    )

edge_alphabet = np.asarray(edge_alphabet)
precision = np.concatenate([np.ones(5), 3.0 * np.ones(4), 5.0 * np.ones(4)])

representative = edge_geometry[0]
E3 = representative["E3"]
E5 = representative["E5"]
Q = representative["Q"]
R_delta = Q[0] + Delta * Q[1] + Delta**2 * Q[2]

charges = {
    "u": np.array([1.0, 3.0, -4.0]),
    "d": np.array([1.0, -3.0, 2.0]),
    "e": np.array([-3.0, -3.0, 6.0]),
    "nu": np.array([-3.0, 3.0, 0.0]),
}


def quadratic_charge_covariant(q: np.ndarray) -> np.ndarray:
    a, b, c = q
    raw = np.array([b * c, c * a, a * b])
    return raw - raw.mean()


def unvec_f(vector: np.ndarray) -> np.ndarray:
    return vector.reshape((3, 3), order="F")


def block(phi_vector: np.ndarray, sector: str) -> np.ndarray:
    H = phi_vector[:5]
    Xi3 = phi_vector[5:9]
    Xi5 = phi_vector[9:]

    q = charges[sector]
    g = quadratic_charge_covariant(q)

    raw = (
        unvec_f(J5 @ H)
        + unvec_f(J43 @ (Xi3 + E3 @ q / 3.0))
        + 1j * unvec_f(J45 @ (Xi5 + Delta * E5 @ g / 5.0))
    )

    return raw @ R_delta


# -------------------------------------------------------------------------
# Classical vacuum
# -------------------------------------------------------------------------

def classical_value_gradient(x: np.ndarray, eta: float) -> tuple[float, np.ndarray]:
    logits = eta * (edge_alphabet @ x)
    shift = float(logits.max())
    weights = np.exp(logits - shift)
    weights /= weights.sum()

    value = (
        0.5 * np.dot(precision * x, x)
        - (shift + math.log(np.exp(logits - shift).mean())) / eta
    )
    gradient = precision * x - weights @ edge_alphabet
    return float(value), gradient


def classical_minimum(eta: float) -> np.ndarray:
    initial = np.concatenate(
        [
            0.9 * edge_alphabet[0, :5],
            0.1 * edge_alphabet[0, 5:9],
            0.2 * edge_alphabet[0, 9:],
        ]
    )
    result = minimize(
        lambda x: classical_value_gradient(x, eta),
        initial,
        jac=True,
        method="BFGS",
        options={"gtol": 1.0e-12, "maxiter": 2000},
    )
    return result.x


# -------------------------------------------------------------------------
# CAR-backreacted branch action
# -------------------------------------------------------------------------

tJ5 = torch.tensor(J5)
tJ43 = torch.tensor(J43)
tJ45 = torch.tensor(J45)
tE3 = torch.tensor(E3)
tE5 = torch.tensor(E5)
tR = torch.tensor(R_delta)
tAlphabet = torch.tensor(edge_alphabet)
tPrecision = torch.tensor(precision)
tCharges = {name: torch.tensor(q) for name, q in charges.items()}
tG = {
    name: torch.tensor(quadratic_charge_covariant(q))
    for name, q in charges.items()
}


def torch_unvec_f(vector: torch.Tensor) -> torch.Tensor:
    return vector.reshape(3, 3).T


def torch_block(x: torch.Tensor, sector: str) -> torch.Tensor:
    H = x[:5]
    Xi3 = x[5:9]
    Xi5 = x[9:]

    q = tCharges[sector]
    g = tG[sector]

    source3 = Xi3 + tE3 @ q / 3.0
    source5 = Xi5 + Delta * tE5 @ g / 5.0

    raw = (
        torch_unvec_f(tJ5 @ H + tJ43 @ source3).to(torch.complex128)
        + 1j * torch_unvec_f(tJ45 @ source5).to(torch.complex128)
    )

    return raw @ tR.to(torch.complex128)


def car_scalar(x: torch.Tensor) -> torch.Tensor:
    return 0.5 * x * torch.tanh(0.5 * x) - torch.log(torch.cosh(0.5 * x))


def branch_action(x: torch.Tensor, eta: float) -> torch.Tensor:
    matrices = {
        sector: torch_block(x, sector)
        for sector in charges
    }

    KQ = (
        matrices["u"].conj().T @ matrices["u"]
        + matrices["d"].conj().T @ matrices["d"]
    )
    KL = (
        matrices["nu"].conj().T @ matrices["nu"]
        + matrices["e"].conj().T @ matrices["e"]
    )

    SQ = 2.0 * torch.sum(
        car_scalar(torch.sqrt(torch.linalg.eigvalsh(KQ).clamp_min(0.0)))
    )
    SL = 2.0 * torch.sum(
        car_scalar(torch.sqrt(torch.linalg.eigvalsh(KL).clamp_min(0.0)))
    )

    logits = eta * (tAlphabet @ x)
    classical = (
        0.5 * torch.dot(tPrecision * x, x)
        - (torch.logsumexp(logits, dim=0) - math.log(30.0)) / eta
    )

    return classical + (SQ + SL) / eta


def solve_branch(eta: float) -> np.ndarray:
    start = classical_minimum(eta)
    x = torch.tensor(start, requires_grad=True)

    optimizer = torch.optim.LBFGS(
        [x],
        lr=0.8,
        max_iter=1000,
        tolerance_grad=1.0e-12,
        tolerance_change=1.0e-15,
        line_search_fn="strong_wolfe",
    )

    def closure() -> torch.Tensor:
        optimizer.zero_grad()
        value = branch_action(x, eta)
        value.backward()
        return value

    optimizer.step(closure)
    return x.detach().numpy()


def observables(phi_vector: np.ndarray) -> dict[str, np.ndarray | float]:
    matrices = {sector: block(phi_vector, sector) for sector in charges}
    singular_values = {}
    left_vectors = {}

    for sector, matrix in matrices.items():
        eigenvalues, vectors = np.linalg.eigh(matrix.conj().T @ matrix)
        order = np.argsort(eigenvalues)
        singular_values[sector] = np.sqrt(np.clip(eigenvalues[order], 0.0, None))
        left_vectors[sector] = vectors[:, order]

    CKM = left_vectors["u"].conj().T @ left_vectors["d"]
    PMNS = left_vectors["e"].conj().T @ left_vectors["nu"]

    J_CKM = float(
        np.imag(
            CKM[0, 0]
            * CKM[1, 1]
            * np.conj(CKM[0, 1])
            * np.conj(CKM[1, 0])
        )
    )
    J_PMNS = float(
        np.imag(
            PMNS[0, 0]
            * PMNS[1, 1]
            * np.conj(PMNS[0, 1])
            * np.conj(PMNS[1, 0])
        )
    )

    result = {
        "CKM_abs": np.abs(CKM),
        "PMNS_abs": np.abs(PMNS),
        "J_CKM": J_CKM,
        "J_PMNS": J_PMNS,
    }

    for sector, values in singular_values.items():
        result[f"mass_ratio_{sector}"] = values / values[-1]

    return result


solutions = {}
for label, eta in (("closure", eta_delta), ("confinement", eta_conf)):
    phi_star = solve_branch(eta)
    solution = observables(phi_star)
    solution["phi_star"] = phi_star
    solution["eta"] = eta
    solutions[label] = solution

np.savez_compressed(
    OUT,
    Delta=Delta,
    eta_delta=eta_delta,
    eta_conf=eta_conf,
    **{
        f"{label}_{key}": value
        for label, solution in solutions.items()
        for key, value in solution.items()
    },
)

for label, solution in solutions.items():
    print(f"\n{label.upper()} DEPTH")
    print(f"eta = {solution['eta']:.15f}")
    phi_star = solution["phi_star"]
    print(
        "vacuum norms =",
        np.linalg.norm(phi_star[:5]),
        np.linalg.norm(phi_star[5:9]),
        np.linalg.norm(phi_star[9:]),
    )
    for sector in charges:
        print(sector, solution[f"mass_ratio_{sector}"])
    print("|CKM| =\n", solution["CKM_abs"])
    print("|PMNS| =\n", solution["PMNS_abs"])
    print("J_CKM =", solution["J_CKM"])
    print("J_PMNS =", solution["J_PMNS"])

print(f"\nSaved {OUT}")