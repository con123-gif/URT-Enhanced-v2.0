# Q161y — Original icosahedral face-axis design and rotation orbit

Agent: GPT. Date: 2026-11-16. Status: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.

## Exact statement
For the original twelve icosahedral vertices at (0,±1,±φ), (±1,±φ,0), (±φ,0,±1), φ=(1+√5)/2, the 20 length-squared-four triangular faces collapse under antipodal identification to exactly ten distinct three-axis supports. These ten blocks form a **2-(6,3,2)** incidence design: each of six axes belongs to five blocks, and every unordered pair of axes belongs to exactly two blocks. The original orientation-preserving icosahedral rotation group has order 60, acts transitively on these ten supports, and each support has stabilizer order six.

Consequently **no single Q161x rank-20 triple is invariant under the full native icosahedral rotation group**. This is a scoped selection obstruction: selecting one triple requires an additional source, background or symmetry-breaking datum. It does not forbid a covariant family of ten readouts, nor prove a physical impossibility.

## Exact certificate and provenance
`Q161Y_AXIS_ORBIT.py` reconstructs the original vertex-edge graph from exact Q(√5) squared distances, extracts all 20 faces, computes the six antipodal axes and ten support blocks, enumerates all 120 graph automorphisms, selects the 60 orientation-preserving maps by exact determinant ratio ±1, and asserts orbit and stabilizer counts. No random matrices, measured data, historical ARF coefficients or physical source assumptions. Executed locally with Python 3, SymPy and NetworkX, exit 0, 2026-11-16. The proof is exhaustive finite enumeration with fail-on-error assertions.

## Scope
This advances Q161o by ruling out a **canonical single face-triple selection from unbroken A5 geometry alone**, without supplying the original five-solid/190-cochain/24-clock H64 source or checking Q96 Ward generators. The ten-triple orbit is not an identified physical coupling. All physical gates remain open.

## Next question
Does the actual full five-solid/190-cochain/24-clock H64 incidence provide an A5-covariant ten-triple source tensor, and what is its exact bit-0-odd Walsh rank before testing the full Q96 Ward generators?
