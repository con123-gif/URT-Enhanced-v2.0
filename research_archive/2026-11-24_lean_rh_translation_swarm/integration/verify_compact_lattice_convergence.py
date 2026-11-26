#!/usr/bin/env python3
"""Exact scalar certificates and optional source authentication.

These certificates prove the polynomial inequalities used by the human
geometric derivation on their full domain. They do not verify lattice geometry,
integration arguments, caller substitution, or RH. No Lean replay is performed.
"""
import argparse
from collections import defaultdict
import hashlib
import json
from pathlib import Path

PIN = "72fead102f663d5c7a407964a13dc0cf9d977207"
SOURCES = {
    "New/Filling/GramLiouville.lean": "e0e55155b72a00bb6c11d618bf1961e52a4e696c",
    "New/Filling/NearTerms.lean": "bd8a969f8d1bda48ca0468c28a8a62bc78e280ce",
    "New/Filling/BlockBound.lean": "6c68e80e3b1ea2b7983696716305493a37f2b1fd",
    "New/Filling/AmplitudeSums.lean": "832e25af346bbbbdabdbec205b0e7f833170e0a1",
    "New/Filling/BoxPartition.lean": "53f11966247a892d94cf688e8b366e887a92f641",
    "New/Filling/StableCells.lean": "236a41919b3697e1e30c4be840140f6452642599",
    "New/Filling/Setup.lean": "622e7ebe5c04b7ae87652e460762da7fb2e40727",
    "New/Filling/LatticeChart.lean": "5c87f908fd39bf1c6b11ffe37af9dd5f764c782c",
    "New/Filling/LinkPairing.lean": "a802533ca5a385d6f44c3254f1a4d600b28fc416",
    "New/RealPlace/VolumeKernel.lean": "fc115f79a99192fc8ea0e72c2caa0bf2546b5cf0",
    "Lib/Adelic/QuotientMeasure/Packing.lean": "498aaa596eb8176d0ee865c61f94e8391a478f7a",
    "Lib/Adelic/Reduction/MinkowskiSecond.lean": "cc0f8a639dfe23caf2ca91b348a09628e60f814e",
    "Lib/General/Algebra/LatticeComplement.lean": "2af8405ff10f2d3fd924d048627b67397f0c5960",
    "Lib/Adelic/Hecke/ClassMean.lean": "b9d642228711dcfb20687f0b2579fa8ff99838f3",
    "New/RealPlace/FlatCharts.lean": "cc98bd4c6c1bf499ec8298a4476f0715e9c3b2f4",
    "New/RealPlace/FloorKernels.lean": "594b1553ed02ba5c074180fb32d0f5215918ad52",
    "New/RealPlace/WeightPlancherel.lean": "65619443ca5867bf45af038448a16dc1262103fd",
    "New/RealPlace/LocalTheorem.lean": "671350f97491467f09b80eafa0df13685dd8ddc6",
    "New/RealPlace/LevelGauge.lean": "05b4a710e4192b2f3d289a8e52161a6d12a2866e",
    "New/RealPlace/ComplexShells.lean": "351cfdf7fa54238f79b1b950c3532feef1f74f53",
    "New/RealPlace/ComplexGauge.lean": "86c2d26bfaf34292de7d1e79c1634b020b26c1f3",
    "Lib/DiscreteSeries/Bruhat/ComplexPlace.lean": "74d2fd4581e30ba76a2c6dbd7604848bf7e6f3d0",
    "Lib/DiscreteSeries/Bruhat/BigCell.lean": "da06dcfda1a1401b8ad51f94649da9b760907a87",
    "Lib/General/Measure/Place.lean": "300ee7d1e3e3d7b1d2ec8538b7f6feb365c70975",
    "New/RealPlace/Size.lean": "3b57ba677471f6d26fceca1a7990eaac9bffa3db",
    "New/RealPlace/GramSectionBounds.lean": "5044a4a899b36f1f42d538968eeb0c733c181a2d",
    "New/RealPlace/GramSection.lean": "ec493dc810dfa20dece008342e16316f60e48dd8",
    "New/RealPlace/CellNeighbourhood.lean": "6930631979c8d744667e5e3f832e35cf8477e8c6",
    "New/RealPlace/SobolevCell.lean": "e17e4a553395ce74293990336836cafe0b60d519",
    "Lib/DiscreteSeries/Bessel/UnipotentCoords.lean": "4dbc16d9e327b2b9667b1bb7982e497d5fb6ef78",
    "Lib/DiscreteSeries/Bruhat/ComplexFloorMeasure.lean": "d91b5cc6f018256da1d1c7869bd1ef88bdf0f775",
    "Lib/DiscreteSeries/Haar/CompactDualMeasure.lean": "f635acc5ac6f4c029eaa652374087216a1dccb6a",
    "Lib/DiscreteSeries/Haar/HaarColumnChart.lean": "74de856ef0fac9b9ce703a27c09f760642c4a75d",
    "Lib/DiscreteSeries/Haar/SphereFibreIntegral.lean": "ebabe442d9a5a231b59774a75b94d5ef05972c82",
    "Lib/DiscreteSeries/Bruhat/FloorGroups.lean": "ec03810781f335ba1c19f6b818b015f6d4014bac",
}


class Polynomial:
    """Integer polynomials in (u,v,s), with explicit coefficient expansion."""
    def __init__(self, value=0):
        self.terms = {k: v for k, v in value.items() if v} if isinstance(value, dict) else (
            {(0, 0, 0): value} if value else {})

    @staticmethod
    def coerce(value):
        return value if isinstance(value, Polynomial) else Polynomial(value)

    def __add__(self, other):
        out = defaultdict(int, self.terms)
        for k, v in self.coerce(other).terms.items():
            out[k] += v
        return Polynomial(dict(out))

    __radd__ = __add__

    def __neg__(self):
        return Polynomial({k: -v for k, v in self.terms.items()})

    def __sub__(self, other):
        return self + (-self.coerce(other))

    def __rsub__(self, other):
        return self.coerce(other) + (-self)

    def __mul__(self, other):
        out = defaultdict(int)
        for a, x in self.terms.items():
            for b, y in self.coerce(other).terms.items():
                out[tuple(i+j for i, j in zip(a, b))] += x*y
        return Polynomial(dict(out))

    __rmul__ = __mul__

    def __pow__(self, exponent):
        assert isinstance(exponent, int) and exponent >= 0
        out = Polynomial(1)
        for _ in range(exponent):
            out = out*self
        return out

    def value(self, u, v, s):
        return sum(c*u**a*v**b*s**d for (a, b, d), c in self.terms.items())

    def nonnegative_certificate(self, name):
        assert self.terms and all(c >= 0 for c in self.terms.values()), name
        return {"name": name, "domain": "u,v,s >= 0", "coefficient_method":
                "exact integer polynomial expansion; every coefficient nonnegative",
                "terms": [{"powers_u_v_s": list(k), "coefficient": c}
                          for k, c in sorted(self.terms.items())]}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--source-root", type=Path,
                    help="Pinned grh-compact/src; optional, no network or build")
    ap.add_argument("--out", type=Path)
    args = ap.parse_args()
    u, v, s = (Polynomial({tuple(int(i == j) for i in range(3)): 1}) for j in range(3))
    n = 1+u
    k = 512000*n**9+v
    r = k+2*n-1
    # Exactly 1000 times the difference in equation (9).
    lattice = 250*k*(s+1)-1000-60000*n*(s+1)-(k+1)*s
    # Exactly the remaining exponent in equation (17), less the claimed 1.
    amplitude = r**3-k**3-12*r*n**3-2*k-1
    fourier = 1000000*n**3 - 99*n*(60*n**2+12) - 99*n*(99*n**2+12)
    inverse_moment = 198*n*(s+1) - (148+2*s+9*n+6*n*s)
    cone = 198*n*(s+1) - (2*n+1+(4*n-2)*s)
    shell = 10**9*n**4 - (108900000*n**4+3000000*n**3+9999*n+3)
    matrix_size = 99*n-(20*n-1)
    certificates = [lattice.nonnegative_certificate("class_discriminant_exponent"),
                    amplitude.nonnegative_certificate("full_to_cut_exponent"),
                    fourier.nonnegative_certificate("character_floor_fibre_exponent"),
                    inverse_moment.nonnegative_certificate("complex_gauge_inverse_moment_exponent"),
                    cone.nonnegative_certificate("complex_gauge_cone_mass_exponent"),
                    shell.nonnegative_certificate("complex_shell_sum_exponent"),
                    matrix_size.nonnegative_certificate("shell_back_substitution_matrix_exponent")]
    # Check the expansion arithmetic against independent direct integer formulas.
    for nn, vv, ss in [(1, 0, 0), (2, 3, 1), (7, 11, 5), (100001, 23, 1000)]:
        kk = 512000*nn**9+vv
        rr = kk+2*nn-1
        assert lattice.value(nn-1, vv, ss) == (
            250*kk*(ss+1)-1000-60000*nn*(ss+1)-(kk+1)*ss)
        assert amplitude.value(nn-1, vv, ss) == rr**3-kk**3-12*rr*nn**3-2*kk-1
        assert fourier.value(nn-1, vv, ss) == (
            1000000*nn**3-99*nn*(60*nn**2+12)-99*nn*(99*nn**2+12))
        assert inverse_moment.value(nn-1, vv, ss) == (
            198*nn*(ss+1)-(148+2*ss+9*nn+6*nn*ss))
        assert cone.value(nn-1, vv, ss) == 198*nn*(ss+1)-(2*nn+1+(4*nn-2)*ss)
        assert shell.value(nn-1, vv, ss) == (
            10**9*nn**4-(108900000*nn**4+3000000*nn**3+9999*nn+3))
        assert matrix_size.value(nn-1, vv, ss) == 99*nn-(20*nn-1)
    # Negative controls: the guards are necessary for these proposed estimates.
    assert 250*1-1000-60000*1 < 0
    assert 2**3-1**3-12*2-2*1-1 < 0
    authenticated = []
    if args.source_root:
        for name, expected in SOURCES.items():
            data = (args.source_root/name).read_bytes()
            actual = hashlib.sha1(b"blob "+str(len(data)).encode()+b"\0"+data).hexdigest()
            assert actual == expected, (name, actual, expected)
            authenticated.append({"path": name, "git_blob": actual})
    result = {"scope": "exact scalar inequalities and optional pinned source byte checks",
              "source_commit": PIN, "native_Lean_replay": False,
              "human_geometry_independently_audited": False, "RH_proof_verified": False,
              "substitution": "n=1+u, k=512000*n^9+v, u,v,s>=0",
              "certificates": certificates, "authenticated_sources": authenticated,
              "guard_negative_controls_detected": True}
    if args.out:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(json.dumps(result, indent=2)+"\n")
    print(json.dumps({"scalar_certificates": len(certificates),
                      "nonnegative_coefficients": [len(x["terms"]) for x in certificates],
                      "authenticated_sources": len(authenticated),
                      "scope": result["scope"], "native_Lean_replay": False}))


if __name__ == "__main__":
    main()
