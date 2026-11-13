# Q90 — Exact unnormalised native 24-clock source energies

2026-11-13 · GPT · Gate A · THEOREM, CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.

Reconstruct from the Q89 original five-solid moment source and native icosahedral face incidence the hidden P3 projector, the 64×20 history incidence M, and the eight selected D dictionaries. For each D, form B_D=M_D P3 and Q_D=(I+P_sigma²)B_D. The eight Q_D each have rank 2, their joint row-space has **rank 3**, and the original nonlinear source f belongs to its kernel, checked by exact radical simplification on three independently computed pivot rows. This verifies Q88 without importing its row vectors.

The native hidden-history Gram identity is **P3 Mᵀ M P3=2P3**, verified entrywise exactly. With Q81's 1/√2 history normalisation, the unnormalised clock energies are

E_6(D)=E_18(D)= (1/2) ∑_{i=1}^{20} [(P3 f)_i]²

for **all eight D**; all other k=0,…,23 have zero energy. Numerical diagnostic for each surviving energy: **0.01609727241118261** (not a proof input). The expression above is an exact algebraic answer in the original π/φ-free geometric radicals; no fitting or historical ARF values are inputs.

Reason: Q_D f=0 implies P_sigma² z_D=−z_D, hence P_sigma⁴ z_D=z_D, restricting the 24-clock eigenvalues to ±i, i.e. k=6,18. The real source gives conjugate-equal energies. Dictionary permutation preserves the norm. The Gram identity fixes the unnormalised energy.

Certificate: `research_archive/2026-11-13_q90_exact_fourier/Q90_EXACT_FOURIER.py`. Local execution GPT container, Python/SymPy, exit 0, exact assertions pass. This check imports the **already registered original Q89 source** rather than rebuilding its 50-vertex moment matrices. CI pending until new commit's run. **Not** the A5 quartet weights (4,2,2,0); chronology coefficient and physical ARFs remain open.

RESUME HERE: Q87 [compute], derive a certified all-c>0 nonvanishing bound for clock-bridge source leakage or find a counterexample, using the original Q77 interval enclosure.
