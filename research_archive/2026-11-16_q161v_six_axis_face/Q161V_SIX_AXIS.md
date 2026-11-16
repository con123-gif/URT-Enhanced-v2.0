# Q161v — six-axis native face parity completeness
Status: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Result: THEOREM (conditional transfer interface).

Original Q161t native icosahedral coordinates determine 12 vertices, 20 triangular faces, six antipodal pairs, and the 64×20 face-history incidence M. The original Q161a 15 double-bit-flip average P and bit-axis conditional averages Q_i define R_i(a)=Q_i P diag(w_63) M a, with w_63(x)=(-1)^popcount(x). No fitted data or ARF input.

Exact certificate: rank M=20; rank R_i=10 for every i=0..5. R_i has zero columns for the ten faces not incident to antipodal axis i, while its other ten columns are linearly independent. Each face touches three axes. The stacked map (R_0,...,R_5) has rank 20 and kernel zero. Among the 20 unordered three-axis subsets, ten already have rank 20 and ten have rank 18. Hence there is no common face-amplitude null direction across all six parity readouts, although a single axis loses ten directions.

This is a structural injectivity result for six *conditional axis readouts*, not a demonstration that the primitive five-solid/190-cochain/24-clock H64 source actually implements those readouts, nor a Q96 Ward check, nor a physical transfer or photon derivation. Original icosahedral face geometry is used, not a synthetic stand-in. Q161o remains open.

Execution: GPT local container, `python research_archive/2026-11-16_q161v_six_axis_face/Q161V_SIX_AXIS.py`, exit 0 (the same standalone script was run before repository write). Next question: Does the original full five-solid/24-clock H64 source produce six independently addressable axis channels, and does its induced charged coupling commute with every Q96 generator?
