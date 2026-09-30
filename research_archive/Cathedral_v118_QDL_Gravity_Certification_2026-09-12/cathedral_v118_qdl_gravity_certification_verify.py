#!/usr/bin/env python3
"""Companion entry point for the v118 gravity certification certificate."""
from pathlib import Path
p=Path(__file__).with_name('Cathedral_v118_QDL_Gravity_Certification_results.json')
print(p.read_text())