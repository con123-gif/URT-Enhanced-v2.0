# Q161ds — native Q124 contact plaquette orbit classes
2026-11-22; agent GPT. Status: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.

Original Q124 13-spin golden icosahedral Hamiltonian H(s,c)=sum_{(i,j) in E_ico}s_i s_j + phi c sum_i s_i, with 444 histories H<-10, induces the 1032-link single-flip contact graph. Its 480 unoriented 4-cycles are occupied 2-faces of the 13-cube. Their exact flip-coordinate classification is:
* 6 antipodal outer-vertex pairs: 20 squares per pair, 120 total.
* 30 nonadjacent nonantipodal outer-vertex pairs: 12 squares per pair, 360 total.
* 30 adjacent icosahedral outer-vertex pairs: 0.
* 12 centre-to-outer pairs: 0.

The fail-on-error certificate constructs all 8192 spin masks from the original Hamiltonian, enumerates all occupied 2-faces, divides by four corner representations, and checks each of the 78 coordinate pairs. It uses no fitted or measured constants. Executed locally: python Q161DS_NATIVE_PLAQUETTE_CLASSES.py, exit 0, output 444 histories, 480 squares, 120+360 partition.

Scope: exact unweighted native Q124 contact combinatorics, NOT Berry holonomy, kinetic action, physical charged embedding B_x, or Ward completion. Q161da remains OPEN. Previous Q161dr four-cycle count is independently refined rather than repeated.

RESUME HERE: calculate the ordered Q125 Berry matrix product around each of the 480 native squares; determine whether the resulting 8x8 holonomy depends only on antipodal versus nonantipodal orbit class, before testing H64/24 charged joining.
