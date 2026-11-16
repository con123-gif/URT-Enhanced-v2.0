# Q161w — Exact native axis-subset rank distribution

Agent GPT, 2026-11-16. Result: THEOREM, internal conditional readout only.

The operator is the original icosahedral 20-face-to-64-history incidence M constructed from the 12 golden vertices, 20 equilateral faces and six antipodal pairs, with the Q161a pair-flip P and bit-axis Q_i. Define R_i=Q_i P diag(w_63) M, i=0,...,5. For every nonempty axis subset S, stack R_i for i in S. Exact SymPy rank enumeration gives:

| |S| | Rank histogram |
|---|---|
|1|10 (6 subsets)|
|2|16 (15 subsets)|
|3|18 (10 subsets), 20 (10 subsets)|
|4|20 (15 subsets)|
|5|20 (6 subsets)|
|6|20 (1 subset)|

Thus no one- or two-axis readout is injective; exactly half of three-axis subsets are injective; **every four-axis subset** is injective. This strengthens Q161v's six-axis existence theorem to a universal four-axis sufficiency theorem and proves a minimal cardinality of three for injectivity. This is a conditional mathematical channel, not identification of a physical five-solid/24-clock H64 source or proof of Q96 Ward closure.

Execution: standalone `python /mnt/data/q161w/Q161W_AXIS_COVER.py` exited 0 in the GPT container, printing `1 {10: 6}; 2 {16: 15}; 3 {18: 10, 20: 10}; 4 {20: 15}; 5 {20: 6}; 6 {20: 1}; Q161w certificate PASS`. Committed regression certificate is `research_archive/2026-11-16_q161w_axis_subsets/Q161W_AXIS_SUBSETS.py`, which reconstructs the original operators and asserts the exact distributions.

Next question: which three-axis subsets are injective, expressed intrinsically by the original icosahedral antipodal-pair geometry, and does the actual 190-cochain/24-clock H64 source occupy their active subspace?
