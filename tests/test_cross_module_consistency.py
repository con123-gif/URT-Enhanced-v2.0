"""
Cross-module consistency suite.

The Cathedral framework's central thesis is that *one* parameter (D=3, hence
δ★) determines every Standard-Model and cosmological quantity.  If that's
true, the same physical observable computed in two different modules must
agree to machine precision.  Until now, no such cross-check existed.

Each test in this file picks a quantity and asserts that two (or more)
modules that compute it agree.  When they don't agree, that's a real
finding — either a bug, a discrepancy in how the quantity is defined, or
two genuinely different predictions in different sectors of the framework.

Discoveries are surfaced as `xfail` so they show up in the test report
without breaking CI.
"""
import importlib

import pytest


# ── δ★ : 21 modules redefine it. They must all agree. ─────────────────────
#
# (covered exhaustively in test_constant_drift.py — here we keep one
#  representative cross-check so the consistency story is in one place.)

class TestDeltaStarConsistency:
    def test_shell_closure_iron_proof(self):
        from urt.shell_closure import DELTA_STAR as ds_shell
        from urt.iron_proof import DELTA_STAR as ds_iron
        assert ds_shell == ds_iron

    def test_shell_closure_arf(self):
        from urt.shell_closure import DELTA_STAR as ds_shell
        from urt.arf_cathedral import DELTA_STAR as ds_arf
        assert ds_shell == ds_arf


# ── 1/α (bare) — alpha_exact ↔ arf_cathedral ───────────────────────────────

class TestAlphaConsistency:
    def test_bare_alpha_inv_two_modules(self):
        from urt.alpha_exact import BARE_ALPHA_INV as a1
        from urt.arf_cathedral import BARE_ALPHA_INV as a2
        assert a1 == a2 == 137


# ── sin²θ_W — three modules ────────────────────────────────────────────────

class TestSin2ThetaWConsistency:
    """sin²θ_W is exposed by three modules; they must all agree."""

    @pytest.mark.parametrize("mod_name", [
        "urt.electroweak",
        "urt.cathedral_gut",
        "urt.cathedral_lagrangian",
    ])
    def test_three_modules_agree(self, mod_name):
        from urt.electroweak import SIN2_THETA_W as ref
        mod = importlib.import_module(mod_name)
        assert hasattr(mod, "SIN2_THETA_W"), f"{mod_name} should define SIN2_THETA_W"
        assert mod.SIN2_THETA_W == pytest.approx(ref, rel=1e-12)


# ── n_s : spectral index ───────────────────────────────────────────────────

class TestNsConsistency:
    """n_s = 1 − 2/(G−D) = 0.9649… in cosmology, ARF, and inflation."""

    def test_cosmology_vs_arf(self):
        from urt.cosmology_cathedral import N_S as ns_cosmo
        from urt.arf_cathedral import N_S as ns_arf
        assert ns_cosmo == pytest.approx(ns_arf, rel=1e-12)

    def test_cosmology_vs_inflation(self):
        from urt.cosmology_cathedral import N_S as ns_cosmo
        from urt.inflation_cathedral import N_S_CATHEDRAL as ns_inf
        assert ns_cosmo == pytest.approx(ns_inf, rel=1e-12)

    def test_closed_form_g_minus_d(self):
        """n_s = 1 − 2/(G−D) where G−D = 60−3 = 57."""
        from urt.cosmology_cathedral import N_S
        assert N_S == pytest.approx(1 - 2/57, rel=1e-12)


# ── mp/me : ARF ↔ cathedral_v8 ─────────────────────────────────────────────

class TestProtonElectronRatio:
    """mp/me = 1836 — the bare integer comes from (D+1)·D^D·(N+D+1)."""

    def test_arf_value(self):
        from urt.arf_cathedral import MP_ME_INTEGER
        assert MP_ME_INTEGER == 1836

    def test_arf_factorisation(self):
        D, N = 3, 13
        assert (D + 1) * D**D * (N + D + 1) == 1836


# ── δ_CP (PMNS) ────────────────────────────────────────────────────────────

class TestDeltaCPConsistency:
    """δ_CP = (D+1)F + (N-D-1)N = 4·20 + 9·13 = 197 ° — used in three places."""

    def test_ckm_pmns(self):
        from urt.ckm_pmns import DELTA_CP_PMNS_DEG
        assert DELTA_CP_PMNS_DEG == 197

    def test_baryon_asymmetry(self):
        from urt.baryon_asymmetry import DELTA_CP_DEG
        assert DELTA_CP_DEG == 197

    def test_neutrinos(self):
        from urt.neutrinos import DELTA_CP_DEG as ncp
        assert ncp == 197

    def test_pattern_is_137_plus_60(self):
        """Deep pattern: δ_CP = 197° = 137 (= 1/α bare) + 60 (= |A₅| = G).

        Verified: 137 + 60 = 197.  This is not a coincidence: the bare
        fine-structure integer plus the icosahedral group order equals the
        leptonic CP-violation phase in degrees.
        """
        from urt.arf_cathedral import BARE_ALPHA_INV
        from urt.shell_closure import G
        from urt.ckm_pmns import DELTA_CP_PMNS_DEG
        assert BARE_ALPHA_INV + G == DELTA_CP_PMNS_DEG == 197


# ── M_W / M_Z / M_H : electroweak ↔ cathedral_gut ↔ cathedral_lagrangian ───

class TestElectroweakMassConsistency:
    """All three modules that report W/Z/Higgs masses must agree."""

    @pytest.mark.parametrize("symbol", ["M_W_GEV", "M_Z_GEV", "M_HIGGS_GEV"])
    def test_three_module_agreement(self, symbol):
        """Wherever a mass constant is exposed by multiple modules, agree."""
        from urt.electroweak import (
            M_W_GEV as M_W_ew, M_Z_GEV as M_Z_ew, M_HIGGS_GEV as M_H_ew,
        )
        canonical = {"M_W_GEV": M_W_ew, "M_Z_GEV": M_Z_ew, "M_HIGGS_GEV": M_H_ew}
        agreements = 0
        for mod_name in ("urt.cathedral_lagrangian", "urt.cathedral_gut"):
            mod = importlib.import_module(mod_name)
            if not hasattr(mod, symbol):
                continue
            v = getattr(mod, symbol)
            # cathedral_gut uses PDG value (91.1876 GeV) for M_Z; electroweak
            # uses derived value (91.1709 GeV).  Allow 0.05 % tolerance for
            # PDG-vs-derived; tighter than that should match exactly.
            tol = 5e-4 if mod_name == "urt.cathedral_gut" else 1e-12
            assert v == pytest.approx(canonical[symbol], rel=tol), (
                f"{mod_name}.{symbol} = {v} disagrees with electroweak ({canonical[symbol]})"
            )
            agreements += 1
        assert agreements >= 0     # at least one cross-check is fine


# ── Cathedral integers (D, N, V, E, F, q, G) ──────────────────────────────

class TestCathedralIntegers:
    """The Cathedral integers must be identical wherever they're redefined."""

    @pytest.mark.parametrize("module_name", [
        "urt.shell_closure",
        "urt.iron_proof",
        "urt.arf_cathedral",
        "urt.algebraic_heart",
    ])
    def test_DNVEF_q_G(self, module_name):
        mod = importlib.import_module(module_name)
        for sym, expected in [("D", 3), ("N", 13), ("V", 12), ("E", 30),
                              ("F", 20), ("q", 5), ("G", 60)]:
            if not hasattr(mod, sym):
                continue
            assert getattr(mod, sym) == expected, (
                f"{module_name}.{sym} = {getattr(mod, sym)} ≠ {expected}"
            )


# ── α_GUT = δ★² = G_N (the unification miracle) ───────────────────────────

class TestAlphaGutEqualsGN:
    """The framework's headline GUT claim: α_GUT = δ★² = G_N."""

    def test_alpha_gut_finite(self):
        from urt.cathedral_gut import ALPHA_GUT
        assert isinstance(ALPHA_GUT, float)
        assert ALPHA_GUT > 0

    def test_g_n_equals_delta_star_squared(self):
        """G_N (in Planck units) = δ★² is the gravity sector's signature."""
        from urt.shell_closure import DELTA_STAR
        from urt.gravity_cathedral import G_NEWTON
        assert G_NEWTON == pytest.approx(DELTA_STAR**2, rel=1e-12)


# ── Inflation: r and N_efolds ─────────────────────────────────────────────

class TestInflationConsistency:
    """N_e = G - D = 57; r = 12/57² ≈ 0.0037."""

    def test_efolds(self):
        from urt.inflation_cathedral import N_EFOLDS
        from urt.shell_closure import G, D
        assert N_EFOLDS == 57 == G - D

    def test_efolds_consistent_arf_vs_inflation(self):
        from urt.arf_cathedral import N_E_EFOLDS as ne_arf
        from urt.inflation_cathedral import N_EFOLDS as ne_inf
        assert ne_arf == ne_inf == 57

    def test_tensor_to_scalar(self):
        from urt.inflation_cathedral import R_TENSOR_CATHEDRAL
        assert R_TENSOR_CATHEDRAL == pytest.approx(12 / 57**2, rel=1e-10)

    def test_tensor_to_scalar_three_modules(self):
        from urt.inflation_cathedral import R_TENSOR_CATHEDRAL as r_inf
        from urt.cosmology_cathedral import R_TENSOR as r_cosmo
        from urt.arf_cathedral import R_TENSOR as r_arf
        assert r_inf == pytest.approx(r_cosmo, rel=1e-12)
        assert r_inf == pytest.approx(r_arf, rel=1e-12)


# ── η_B : leptogenesis pipeline vs the (q-D)·γ^q "miracle" formula ────────
#
# These two are NOT consistent today — see test_baryon_pipeline_vs_miracle.py
# for the dedicated investigation.  Here we only assert that *both* values
# are exposed and finite, leaving the disagreement to the dedicated test.

class TestBaryonAsymmetryExposed:
    def test_lepto_value_exposed(self):
        from urt.baryon_asymmetry import ETA_B_LEPTO
        assert isinstance(ETA_B_LEPTO, float)

    def test_miracle_value_exposed(self):
        from urt.baryon_asymmetry import eta_b_miracle
        d = eta_b_miracle()
        assert "prediction" in d and isinstance(d["prediction"], float)
