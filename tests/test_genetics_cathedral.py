"""Tests for urt/genetics_cathedral.py — DNA codons, amino acids, Cathedral integers."""

import pytest
from math import isfinite


def test_imports():
    from urt.genetics_cathedral import (
        N_DNA_BASES, CODON_LENGTH, N_CODONS,
        N_AMINO_ACIDS, N_STOP_CODONS, N_CODING_CODONS,
        REDUNDANCY_EXACT, N_RIBOSOME_SITES,
        N_SECONDARY_STRUCTURES, A_DNA_BP_PER_TURN, Z_DNA_BP_PER_TURN,
        INFO_PER_CODON_BITS, INFO_EQ_2D,
        codon_table, information_genetics, dna_geometry,
        protein_structure, genetics_summary, print_genetics_report,
    )


# ── Genetic code constants ────────────────────────────────────────────────────

def test_dna_bases_eq_D1():
    """DNA has D+1 = 4 bases."""
    from urt.genetics_cathedral import N_DNA_BASES
    from urt.shell_closure import D
    assert N_DNA_BASES == D + 1
    assert N_DNA_BASES == 4


def test_codon_length_eq_D():
    """Codon length = D = 3 bases."""
    from urt.genetics_cathedral import CODON_LENGTH
    from urt.shell_closure import D
    assert CODON_LENGTH == D
    assert CODON_LENGTH == 3


def test_total_codons():
    """Total codons = (D+1)^D = 4^3 = 64."""
    from urt.genetics_cathedral import N_CODONS, N_DNA_BASES, CODON_LENGTH
    from urt.shell_closure import D
    assert N_CODONS == N_DNA_BASES ** CODON_LENGTH
    assert N_CODONS == (D + 1) ** D
    assert N_CODONS == 64


def test_amino_acids_eq_F():
    """Standard amino acids = F = 20 = icosahedral faces!"""
    from urt.genetics_cathedral import N_AMINO_ACIDS
    from urt.shell_closure import F
    assert N_AMINO_ACIDS == F
    assert N_AMINO_ACIDS == 20


def test_stop_codons_eq_D():
    """Stop codons = D = 3."""
    from urt.genetics_cathedral import N_STOP_CODONS
    from urt.shell_closure import D
    assert N_STOP_CODONS == D
    assert N_STOP_CODONS == 3


def test_coding_codons():
    """Coding codons = 64 - 3 = 61."""
    from urt.genetics_cathedral import N_CODING_CODONS, N_CODONS, N_STOP_CODONS
    assert N_CODING_CODONS == N_CODONS - N_STOP_CODONS
    assert N_CODING_CODONS == 61


def test_redundancy_approx_D():
    """Average redundancy ≈ D = 3."""
    from urt.genetics_cathedral import REDUNDANCY_EXACT
    from urt.shell_closure import D
    # 61/20 = 3.05, should be close to D=3
    assert abs(REDUNDANCY_EXACT - D) < 0.1
    assert REDUNDANCY_EXACT > D - 0.1


# ── Information theory ────────────────────────────────────────────────────────

def test_bits_per_codon_eq_2D():
    """Bits per codon = 2D = 6."""
    from urt.genetics_cathedral import INFO_PER_CODON_BITS, INFO_EQ_2D
    from urt.shell_closure import D
    assert abs(INFO_PER_CODON_BITS - 2 * D) < 1e-12
    assert INFO_EQ_2D is True
    assert INFO_PER_CODON_BITS == 6.0


def test_info_max_eq_2D():
    """Maximum information = 6 = 2D bits."""
    from urt.genetics_cathedral import INFO_MAX_BITS
    from urt.shell_closure import D
    assert abs(INFO_MAX_BITS - 2 * D) < 1e-12


def test_chargaff_independent_frac():
    """Chargaff: D-1 = 2 independent base fractions."""
    from urt.genetics_cathedral import N_INDEPENDENT_BASE_FRACS
    from urt.shell_closure import D
    assert N_INDEPENDENT_BASE_FRACS == D - 1
    assert N_INDEPENDENT_BASE_FRACS == 2


# ── DNA geometry ─────────────────────────────────────────────────────────────

def test_a_dna_bp_per_turn():
    """A-DNA: 11 bp/turn = N - D + 1 = 11."""
    from urt.genetics_cathedral import A_DNA_BP_PER_TURN
    from urt.shell_closure import N, D
    assert A_DNA_BP_PER_TURN == N - D + 1
    assert A_DNA_BP_PER_TURN == 11


def test_z_dna_bp_per_turn():
    """Z-DNA: 12 bp/turn = V = 12."""
    from urt.genetics_cathedral import Z_DNA_BP_PER_TURN
    from urt.shell_closure import V
    assert Z_DNA_BP_PER_TURN == V
    assert Z_DNA_BP_PER_TURN == 12


# ── Protein structure ─────────────────────────────────────────────────────────

def test_secondary_structures_eq_D():
    """Secondary structure types = D = 3."""
    from urt.genetics_cathedral import N_SECONDARY_STRUCTURES
    from urt.shell_closure import D
    assert N_SECONDARY_STRUCTURES == D
    assert N_SECONDARY_STRUCTURES == 3


def test_ribosome_sites_eq_D():
    """Ribosome A, P, E sites = D = 3."""
    from urt.genetics_cathedral import N_RIBOSOME_SITES
    from urt.shell_closure import D
    assert N_RIBOSOME_SITES == D
    assert N_RIBOSOME_SITES == 3


# ── Function tests ────────────────────────────────────────────────────────────

def test_codon_table_function():
    from urt.genetics_cathedral import codon_table
    r = codon_table()
    assert r["bases_eq_D1"] is True
    assert r["codon_length_eq_D"] is True
    assert r["codons_exact"] is True
    assert r["amino_acids_eq_F"] is True
    assert r["stop_eq_D"] is True
    assert r["amino_acids"] == 20
    assert r["total_codons"] == 64


def test_information_genetics_function():
    from urt.genetics_cathedral import information_genetics
    r = information_genetics()
    assert r["bits_eq_2D"] is True
    assert r["bits_per_codon"] == 6.0
    assert r["chargaff_independent_eq_D1"] is True


def test_dna_geometry_function():
    from urt.genetics_cathedral import dna_geometry
    r = dna_geometry()
    assert r["A_DNA_exact"] is True
    assert r["Z_DNA_exact"] is True
    assert r["A_DNA_bp_per_turn"] == 11
    assert r["Z_DNA_bp_per_turn"] == 12


def test_protein_structure_function():
    from urt.genetics_cathedral import protein_structure
    r = protein_structure()
    assert r["secondary_eq_D"] is True
    assert r["ribosome_sites_eq_D"] is True


def test_genetics_summary():
    from urt.genetics_cathedral import genetics_summary
    r = genetics_summary()
    assert "codon_table" in r
    assert "information" in r
    assert "dna_geometry" in r
    assert len(r["key_results"]) >= 5


def test_print_genetics_report(capsys):
    from urt.genetics_cathedral import print_genetics_report
    print_genetics_report()
    out = capsys.readouterr().out
    assert "20" in out
    assert "EXACT" in out
    assert "amino" in out.lower() or "codon" in out.lower() or "DNA" in out
    assert len(out) > 200
