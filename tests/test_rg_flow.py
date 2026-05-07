"""Tests for urt.rg_flow — running couplings and crossover scale."""

import pytest
from math import isfinite
from urt.rg_flow import rg_flow, crossover_scale, running_alpha_inv, running_alpha_s


def test_crossover_scale():
    """μ_c must lie between 150 and 250 GeV."""
    mu_c = crossover_scale()
    assert 150 < mu_c < 250


def test_rg_flow_limits():
    """δ(μ) must be bounded between 0.14 and 0.16 for all physical scales."""
    for mu in [1e-3, 0.938, 1.0, 91.2, 125.0, 172.7, 197.0, 1e4]:
        d = rg_flow(mu)
        assert 0.14 < d < 0.16, f"δ({mu} GeV) = {d} out of range"


def test_rg_flow_ir_limit():
    """At very low energies, δ → δ_IR ≈ 0.15."""
    d_low = rg_flow(1e-3)
    assert abs(d_low - 0.15) < 0.005


def test_rg_flow_uv_limit():
    """At very high energies, δ → δ★ ≈ 0.14751."""
    d_high = rg_flow(1e16)
    assert abs(d_high - 0.14751) < 0.005


def test_rg_flow_monotone():
    """δ(μ) must decrease monotonically from IR to UV."""
    mus = [1e-3, 1.0, 91.2, 197.0, 1e4, 1e16]
    deltas = [rg_flow(mu) for mu in mus]
    for i in range(len(deltas) - 1):
        assert deltas[i] >= deltas[i + 1], f"Non-monotone at {mus[i]} GeV"


def test_running_alpha_inv():
    """1/α must be finite and positive at all scales."""
    for mu in [1e-3, 0.938, 91.2, 1e4]:
        a = running_alpha_inv(mu)
        assert isfinite(a) and a > 0


def test_running_alpha_s():
    """α_s(M_Z) must be within 5% of 0.118."""
    alpha_s = running_alpha_s(91.2)
    assert abs(alpha_s - 0.118) / 0.118 < 0.05


def test_running_alpha_s_decreases():
    """α_s must decrease as μ increases (asymptotic freedom)."""
    a1 = running_alpha_s(10.0)
    a2 = running_alpha_s(91.2)
    a3 = running_alpha_s(1000.0)
    assert a1 > a2 > a3
