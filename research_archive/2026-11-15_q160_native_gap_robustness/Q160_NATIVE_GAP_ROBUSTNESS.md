# Q160 — native Q159 moving-singlet crossing is stable in an exact rational neighbourhood

Status: **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING** for the inherited Q109/v61 conditional Gaussian family. Not a primitive URT transfer derivation, not a photon, and not a physical continuum construction.

## Native provenance

The original v61 source `research_archive/2026-10-17_original_oct08_source/canonical_sources/Cathedral/Newton_Cathedral_Full_v61.py` defines `R_EXACT=355508034923519/10^15` and `M_EXACT=790940592107124/10^15`. Original Q106 30-vertex singlet moving adjacency has eigenvalue μ=−2 with multiplicity ten, as reconstructed in `research_archive/2026-11-15_q159_native_continuum_photon/Q159_NATIVE_BLOCH_PHOTON_AND_GAP.py`. That source derives the exact endpoint dispersion for the native diagonal spatial momentum path at temporal p_t=π/6:

E²(0)=(1−m−√3/2)²+1/4;

E²(π/2)=(3r+1−m+(√3−1)/8)²+3+((1+√3)/8)².

The actual singularity occurs where E²=4, because the native μ=−2 shift is present. This certificate does not substitute a synthetic matrix or a fitted physical input: it certifies exact inequalities for the source-derived endpoints and their local parameter dependence.

## New exact robustness theorem

For **every** real r′,m′ satisfying |r′−r|≤1/1000 and |m′−m|≤1/1000, the two source-derived endpoint expressions obey E²(0;r′,m′)<4<E²(π/2;r′,m′). Consequently, continuity yields a diagonal spatial momentum s∈(0,π/2) with E(s;r′,m′)=2, so the conditional Gaussian matter inverse remains singular in this entire parameter box. This is a robustness certificate for the Q159 obstruction, **not** permission to tune r or m or evidence of a unique physical normalization.

Proof: use exact rational enclosure 1732050807568/10¹²<√3<1732050807569/10¹², propagate the r,m rational intervals through the displayed squares (including zero crossing), and assert strict margins. The standalone script prints both rational endpoint enclosures and strictly positive margins and exits nonzero on failure.

## Evidence

Local container: `python research_archive/2026-11-15_q160_native_gap_robustness/Q160_NATIVE_GAP_ROBUSTNESS.py`, exit 0 on 2026-11-15; no measured data, historical ARFs or fitted inputs. Original Q159 Bloch source was retrieved from GitHub; no full v61 or Q106 matrices were re-executed here. The theorem is conditional on Q159's already verified native endpoint formulas. New CI must separately execute this check.

## RESUME HERE

The robustness bound does not select primitive positive transfer or a continuum photon. Next concrete calculation: derive an explicit positive transfer kernel on the native five-solid 190-cochain/H64/24 carriers, and prove whether its induced moving/spatial kinetic normalization avoids the Q159 μ=−2 crossing without an arbitrary regulator.
