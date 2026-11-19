# Q161cf — exact five-solid source subset-rank classification

**Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. **Result:** THEOREM.

Source: original normalized linear and traceless quadratic harmonics of all five Platonic vertex sets, reconstructed by the existing Q161ce certificate `research_archive/2026-11-19_q161ce_source_deletion/Q161CE_CERT.py`. These are the existing 50×8 source blocks, not a synthetic operator.

Order: tetrahedron (T), cube (C), octahedron (O), dodecahedron (D), icosahedron (I). The exact source ranks for individual solids are (3,6,5,8,8). For all ten pairs: TC=6; TO=8; TD=8; TI=8; CO=8; CD=8; CI=8; OD=8; OI=8; DI=8. Every subset of three, four, or five solids has rank eight. In particular the tetrahedron+octahedron pair reconstructs all eight source harmonics without either golden solid, while tetrahedron+cube cannot. These statements concern source *linear-algebraic span*, not physical decoupling of the other solids.

Proof: For each subset A form the exact positive Gram G_A=sum_{s in A} E_s^T E_s. Since ker(G_A)=intersection ker(E_s), rank(G_A)=rank(vertical stack E_s). Exact SymPy elimination over Q(sqrt(5)) evaluates all 31 nonempty subsets and asserts the listed values; monotonicity of Gram kernels independently explains why adding solids cannot reduce rank.

**Execution:** GPT local standalone Python/SymPy, exit 0, printed `Q161cf EXACT PASS` with all 31 subset ranks on 2026-11-19. The committed certificate imports the preexisting native Q161ce source reconstruction. CI after this commit must be checked separately.

**Limitation:** Rank eight does not identify Q96 charged action, source-dependent H64/190-to-24 transport, or a physical Ward observable. No physical gate closed.

**Next question:** Does the native Q96 charge generator preserve the eight-dimensional five-solid source image, i.e. what is the exact rank of (I-P)Q96 E using the actual source-defined charge insertion?
