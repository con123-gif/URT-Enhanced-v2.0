# Q161ce — native five-solid source deletion resilience

Status: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Result: THEOREM.

Using the original five Platonic vertex sets and the degree-one plus traceless degree-two harmonic source columns of Q161cb, form the exact 50×8 matrix E with block rows E_s. Exact symbolic ranks are

| solid | tetrahedron | cube | octahedron | dodecahedron | icosahedron |
|---|---:|---:|---:|---:|---:|
| rank E_s | 3 | 6 | 5 | 8 | 8 |
| rank E with s deleted | 8 | 8 | 8 | 8 | 8 |

Proof: the self-contained SymPy certificate builds the five native coordinate blocks, verifies the source Gram characteristic polynomial, and computes exact ranks of each E_s and each four-solid vertical stack. In particular either the original dodecahedral or icosahedral block independently spans the complete eight-dimensional harmonic-source channel. Deleting any one solid leaves all eight channels algebraically reconstructible. This does not imply physical independence of a solid: the full 190-cochain dynamics and charged Q96/H64/24 Ward coupling remain necessary.

Execution: GPT local container, `python /mnt/data/q161ce/Q161CE_CERT.py`, exit 0; outputs individual ranks [3,6,5,8,8], deletion ranks [8,8,8,8,8]. The committed certificate is a self-contained equivalent built directly from the same original Q161cb construction. CI is to execute the committed version.

Next concrete question: does the original Q96 charge action preserve the eight-dimensional source range, i.e. calculate (I−E(EᵀE)⁻¹Eᵀ)Q96 E with a source-defined Q96 vertex action, before attempting the 190/H64/24 Ward seam?
