# Q161bn — native Q101 edge-covariance kernel decomposition

**Status:** THEOREM — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.

From the original 12-vertex icosahedron, 20 native faces, 30 oriented edges, rank-eight projector Pl, and all 30 frustrated Q101 sign histories, let z_s=(C Pl s)⊙(C Pl s), X=[z_s−mean_s z_s] (20×30), and D be the 30×20 native dual-face oriented edge boundary. The exact certificate proves rank X=16, rank D=19 and rank(DX)=16. Therefore the edge covariance (DX)(DX)^T/30 has **rank 16 and nullity 14**. The nullspace decomposes orthogonally into ker(D^T), dimension 11 (edge cycle space), and the 3-dimensional image under D of ker(X^T)∩1^⊥. This decomposition follows from rank D=19, ker D=span(1), rank DX=16, and the positive-semidefinite covariance factorization. It is an exact structural constraint on any future H64 edge-to-clock transport; it does not itself derive that transport, seam, or Q96 Ward intertwiner.

**Execution:** independent standalone SymPy native-geometry certificate executed locally 2026-11-18, exit 0; registered GitHub check pending new CI. No fitted values or historical ARF coefficients.

**Next question:** Does the original H64 edge-to-24-clock map annihilate the 11 native edge cycles, and how does it act on the three additional source-invisible edge channels?
