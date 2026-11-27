#!/usr/bin/env python3
"""Audit the minimal relation-transport interface in compact TwistForRows.

This authenticates pinned source and checks exact finite algebra controls.
It is not a Lean elaboration or an RH certificate.
"""

from __future__ import annotations

import argparse
import hashlib
from itertools import product
from pathlib import Path


PIN = "72fead102f663d5c7a407964a13dc0cf9d977207"
FILES = {
    "New/Selmer/TwistForRows.lean": "802242498ad4530e7f52cc4f14e0a03be2c59f4d",
    "New/Selmer/TwistTheorem.lean": "bdf0bed65edefd067b584695b1fac0b6acbbd754",
    "New/Selmer/AptTupleDefs.lean": "ba41ff0e729d5182ac236911898dfd0865165f8c",
    "New/Selmer/DeterminantBound.lean": "686d1d98ab6ce7bb70ff4f087d2a10cbae8b85df",
    "Lib/General/Algebra/FittingDuality.lean": "50c522f409cc0214163df1d26b77aede4aa8100a",
    "Lib/ClassField/Places/SelmerDefs.lean": "ce10f7c03f6155db4ccd49bc228eb03bc23e2347",
}


def git_blob_sha(data: bytes) -> str:
    return hashlib.sha1(f"blob {len(data)}\0".encode() + data).hexdigest()


def source_checks(root: Path) -> None:
    texts: dict[str, str] = {}
    for rel, expected in FILES.items():
        data = (root / rel).read_bytes()
        actual = git_blob_sha(data)
        assert actual == expected, (rel, actual, expected)
        texts[rel] = data.decode()

    twist = texts["New/Selmer/TwistForRows.lean"]
    bridge = twist[twist.index("rintro O' ⟨hO, ψ', k, s₇⟩") :]
    assert bridge.count("length_mono ?_") == 1
    assert bridge.count("normLength_mono") == 1
    assert bridge.count("forall_dual_apply_eq_zero_iff O _") == 1
    assert bridge.count("crysCocycles.map") == 1
    assert bridge.count("eq_one_of_mem_decompGroup") == 1
    assert bridge.count("mapRel _ f") == 1
    assert "by simpa [mapRel]" in bridge
    assert "(inclusion.faithfulSMul hO).to_isTorsionFree" in bridge
    assert "Finite.right ℤ_[ℓ] O.1 O'.1" in bridge

    theorem = texts["New/Selmer/TwistTheorem.lean"]
    assert "mapRel (inclusion hO).1 '' (L i ∪ {.single (γ i) 1})" in theorem

    fitting = texts["Lib/General/Algebra/FittingDuality.lean"]
    assert "def mapRel" in fitting
    assert "def relationsOn" in fitting
    assert "lemma length_mono" in fitting

    selmer = texts["Lib/ClassField/Places/SelmerDefs.lean"]
    assert "def twistRep" in selmer
    assert "def selmerModule := obeying" in selmer

    apt = texts["New/Selmer/AptTupleDefs.lean"]
    assert "def SelmerLengthLe" in apt
    assert "(crysRels ρ)" in apt

    det = texts["New/Selmer/DeterminantBound.lean"]
    assert "def crysRels" in det


def obeying(q: int, relations: tuple[tuple[int, ...], ...], x: tuple[int, ...]) -> bool:
    return all(sum(a * b for a, b in zip(r, x)) % q == 0 for r in relations)


def finite_direction_checks() -> int:
    """More relations give a smaller obeying module, never the reverse."""
    checks = 0
    for q in (2, 3, 4, 5, 7):
        vectors = tuple(product(range(q), repeat=2))
        pool = ((1, 0), (0, 1), (1, 1), (1, -1))
        for mask in range(1 << len(pool)):
            old = tuple(pool[i] for i in range(len(pool)) if mask & (1 << i))
            for extra in pool:
                new = old + (extra,)
                for x in vectors:
                    assert not obeying(q, new, x) or obeying(q, old, x)
                    checks += 1
    return checks


def negative_controls() -> None:
    # C2 sign-twist cocycle: z(1)=0, z(s)=1 and s acts by -1.
    z_one, z_s = 0, 1
    z_s2_twisted = z_s + (-1) * z_s
    old_cocycle_relation = z_s2_twisted - z_s - z_s
    assert z_s2_twisted == z_one
    assert old_cocycle_relation == -2 != 0

    # Every Z-linear hom Z/2 -> Z kills 1: 2*phi(1)=phi(0)=0.
    # Yet 1 mod 2 is nonzero, so dual separation fails for this torsion extension.
    phi_one = 0
    assert 2 * phi_one == 0
    assert 1 % 2 != 0


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--source-root", type=Path, required=True)
    args = parser.parse_args()
    source_checks(args.source_root)
    direction = finite_direction_checks()
    negative_controls()
    print(f"pinned source blobs: PASS ({len(FILES)}, {PIN})")
    print("minimal bridge calls: PASS")
    print(f"contravariant relation-direction checks: PASS ({direction})")
    print("local-triviality negative control: PASS")
    print("torsion dual-separation negative control: PASS")
    print("Lean kernel replay: NOT RUN")


if __name__ == "__main__":
    main()
