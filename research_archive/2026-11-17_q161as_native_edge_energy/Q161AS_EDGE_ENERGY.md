# Q161as — exact native face-readout lift edge energy

**Agent:** GPT, 2026-11-17. **Result:** THEOREM; CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.

## Original operators and scope
The Q161z original golden-coordinate icosahedron supplies its 20 triangular faces, 6 antipodal vertex axes and 64 six-bit histories. Q161z's original parity-twisted face incidence M and two-bit averaging P followed by axis averaging Q determine the exact Q161ac six-channel readout B (6×20). The original oriented face-edge Hodge Gram is L=DᵀD=3I−A, where A is the dual face adjacency. This independent certificate rebuilds these named operators, without fitted parameters or historical ARF values. It is a bounded subcalculation of Q161ad, not a construction of the full physical source.

## Exact theorem
Let G=BBᵀ, T=BᵀG⁻¹ and J₆=1₆1₆ᵀ. Then
- G=(128/16875)I₆+(256/50625)J₆, and BT=I₆;
- TᵀLT=(16875/64)(I₆−J₆/6);
- eigenvalues of this six-channel edge-energy form are 0 (multiplicity 1) and 16875/64 (multiplicity 5);
- Π=TB commutes with L, and dim ker B=14.

Proof: the original dual adjacency A acts as 3 on the uniform-face mode and 1 on the five-dimensional observed sum-zero mode, so L=3I−A acts as 0 and 2 there. The exact G eigenvalues are 128/3375 on the uniform axis and 128/16875 on the sum-zero axes. Consequently TᵀLT=2(16875/128)(I−J/6). Direct exact symbolic construction independently verifies every identity.

For any prescribed y=Bf, the canonical lift f₀=Ty minimizes both Euclidean norm and edge energy modulo the uniform Hodge null mode: f=f₀+z, z∈ker B, and fᵀLf=f₀ᵀLf₀+zᵀLz. Thus the original six readouts force an exact sum-zero edge cost but do not determine 14 invisible face amplitudes.

## Evidence and limits
Executed standalone local Python/SymPy certificate with exit 0 and output: Q161as EXACT PASS: native B lift T, edge energy (16875/64)(I-J/6), eigenvalues 0,16875/64(x5), 14D invisible. CI verdict for this commit pending until run. This does not establish that the five-solid/190/H64/24-clock source produces any specified y, nor Q96 Ward covariance, continuum photon or ARFs.

**Next question:** Extract the primitive five-solid/190/H64/24-clock face amplitude f and calculate whether its Q161ad projection onto ker B is nonzero while all Q96 Ward generators annihilate the induced source.
