"""
pytest configuration for Newton's Cathedral test suite.

All tests assume the urt package is installed (pip install -e .).
Heavy tests (logistic map verification ~30s) are marked 'slow'
and excluded from the default run.

Run all:    pytest
Run fast:   pytest -m "not slow"
Run slow:   pytest -m slow
"""
import pytest


def pytest_configure(config):
    config.addinivalue_line("markers", "slow: marks tests as slow (>5s)")


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
