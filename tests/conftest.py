"""
pytest configuration for Newton's Cathedral test suite.

All tests assume the urt package is installed (pip install -e .).

Markers
-------
- slow:    >5s tests (logistic map verification, etc.).  Run with --runslow.
- physics: tests asserting agreement with experimental observations.
- exact:   tests asserting exact (closed-form) Cathedral identities.
- drift:   regression tests guarding against numerical drift between
           modules that redefine the same constant locally.

Run all:    pytest
Run fast:   pytest -m "not slow"
Run slow:   pytest -m slow
Run physics-only: pytest -m physics
"""
import os
import random

import numpy as np
import pytest


# ── markers ──────────────────────────────────────────────────────────────────

def pytest_configure(config):
    config.addinivalue_line("markers", "slow: marks tests as slow (>5s)")
    config.addinivalue_line("markers", "physics: physics-vs-observation tests")
    config.addinivalue_line("markers", "exact: closed-form Cathedral identities")
    config.addinivalue_line("markers", "drift: cross-module constant-drift guards")
    config.addinivalue_line("markers", "property: hypothesis property-based tests")


def pytest_collection_modifyitems(config, items):
    """Skip slow tests unless --runslow is passed."""
    if config.getoption("--runslow", default=False):
        return
    skip_slow = pytest.mark.skip(reason="use --runslow to run")
    for item in items:
        if "slow" in item.keywords:
            item.add_marker(skip_slow)


def pytest_addoption(parser):
    parser.addoption(
        "--runslow", action="store_true", default=False,
        help="run slow tests (logistic map verification, etc.)"
    )


# ── deterministic RNG for the entire suite ──────────────────────────────────
#
# Several tests use np.random / random.random without an explicit seed.
# We seed both at the start of every test so that any future stochastic
# assertion is reproducible bit-for-bit.

_GLOBAL_SEED = int(os.environ.get("URT_TEST_SEED", "1475108"))   # δ★ × 10⁷


@pytest.fixture(autouse=True)
def _seed_rngs():
    """Reset the numpy + python RNG before every test for reproducibility."""
    np.random.seed(_GLOBAL_SEED)
    random.seed(_GLOBAL_SEED)
    yield


@pytest.fixture
def rng():
    """A fresh, deterministic numpy Generator scoped to a single test."""
    return np.random.default_rng(_GLOBAL_SEED)
