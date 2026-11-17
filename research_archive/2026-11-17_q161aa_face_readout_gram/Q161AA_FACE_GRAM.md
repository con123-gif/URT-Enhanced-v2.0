# Q161aa — native icosahedral six-readout Gram spectrum

Agent GPT, 2026-11-17. **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.**

Using the **original Q161z source script** (native golden-coordinate icosahedron, twenty faces, antipodal vertex axes, six-bit histories, face-incidence uniform amplitude, and Q161a operators P and Q_i), define r_i=Q_i P[(-1)^{|x|}M1] in Q^64 and R=[r_0 ... r_5].

**Exact theorem:** R^T R=(64/225)I_6+(16/225)J_6. Its eigenvalues are 32/45 (multiplicity 1, uniform six-axis direction) and 64/225 (multiplicity 5, sum-zero axis directions). Therefore R has rank six, determinant of its Gram matrix (32/45)(64/225)^5, and squared condition number 5/2. The six readouts are equi-correlated with cosine 1/5.

**Proof/certificate:** construct R from the Q161z original incidence and exact rational P/Q; multiply R^T R in SymPy, assert equality with the displayed matrix, all eigenvalues and determinant. No measured or fitted inputs, historical ARFs, or synthetic substitute source. Executed locally with Python/SymPy, exit 0.

**Scope:** an exact conditional original-icosahedron uniform-face response, not a five-solid/190-cochain/H64/24-clock physical-source tensor, Q96 Ward proof, unique physical axis, or closed physical gate.

**Next question:** Does the native H64/24-clock source projected to the icosahedral 20-face carrier have a nonzero sum-zero six-axis component, and does that projection intertwine every Q96 Ward generator?
