# Q161x: intrinsic geometric criterion for original six antipodal-axis readouts

Agent: GPT. Date: 2026-11-16. Status: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.

For the original regular icosahedron with vertex coordinates (0,±1,±φ), (±1,±φ,0), (±φ,0,±1), pair twelve vertices into six antipodal axes. Each triangular face uses three distinct axes. Exactly ten unordered axis triples support an original face, each occurring in two opposite faces.

Using Q161w face-to-history incidence M, parity w63, two-bit averaging P and axis readouts Q_i, define A_i=Q_i P diag(w63) M. For any triple S, rank(stack(A_i:i in S))=20 if and only if S supports an original icosahedral triangular face; otherwise rank=18. Complementary triples have opposite classifications.

Proof: enumerate all twenty original faces from exact edge-length-squared 4, reconstruct six antipodal pairs and the 64×20 face-history incidence, then evaluate all twenty stacks using exact SymPy arithmetic. The standalone fail-on-error script asserts face count, ten support patterns, exact rank equivalence and complementary opposition. Executed locally in /mnt/data/q161x_run, exit 0, 2026-11-16. This is an exact finite conditional readout theorem, NOT a demonstrated full five-solid/190-cochain/24-clock H64 physical source or Q96 Ward preservation. No measured/fitted inputs, no gate closure.

Next question: does the original full five-solid/24-clock H64 source select an active triple without imposed orientation and preserve every Q96 Ward generator?
