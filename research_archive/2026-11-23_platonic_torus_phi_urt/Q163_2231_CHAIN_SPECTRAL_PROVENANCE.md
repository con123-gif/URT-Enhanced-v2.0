# Q163 five-solid face-loop torus: reproducibility checkpoint (2026-11-23 22:31 UTC)

Status: **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING** for the declared cellular projection; **OPEN** for native magnetic twisted transport and physical toroidal emergence.

Base: newtons-cathedral 72e74671f6a47f318ccfe67993925849df7c68e2. Distinct lane from Q161eo charged Ward and URT-ZPE. Prior provenance: Q161cu original five-solid geometry; Q163 programme; earlier isolated Q163 face-chain and Hodge-spectrum checkpoints. No novelty is claimed for the original five-solid Hodge identities.

Locally executed `Q163_FACE_TORUS_SPECTRAL_CERT.py` (not committed in this checkpoint): exit 0, scipy ConvexHull original Platonic coordinates and integer incidence matrices. Five original (V,E,F) blocks: (4,6,4),(8,12,6),(6,12,8),(20,30,12),(12,30,20); sum (50,90,50), 190 cochains, 90 edges, Tr D²=720; Hodge nullities (1,0,1) on each block. All 50 face cycles (4+6+8+12+20) checked.

For each oriented native n-gon face f, the **declared** comparison torus is C_n × C_3 with (3n,6n,3n) cells. Its integer cellular boundary matrices D1,D2 and projection P0,P1 to the native solid satisfy D1 D2=0, P0 D1=b1 P1, P1 D2=0. The meridian maps to zero; the longitude maps to the native face boundary b2[f], hence both induced H1 classes vanish in the spherical target. This is a genuine topological obstruction to *injective H1 transport through this projection*, not a no-go for a separate magnetic or dynamical thickening.

Printed unweighted vertex-Laplacian eigenvalues: tetra 0,4×3; cube 0,2×3,4×3,6; octa 0,4×3,6×2; dodeca 0, (3-√5)×3,2×5,3×4,5×4,(3+√5)×3; icosa 0,(5-√5)×3,6×5,(5+√5)×3. These are native incidence spectra, **not** magnetic twisted spectra.

Reproducibility gap: executable remains a locally mounted artifact, not a GitHub-tracked certificate. Therefore no independent GitHub CI result for this new checkpoint. Latest inspected primary CI: #342, run 45250226145, PASS at 72e7467. No registry, Queue, protocol or protected-file edits; no physical gates closed.

**RESUME HERE:** commit the full executed `Q163_FACE_TORUS_SPECTRAL_CERT.py` into this Q163 folder and register a deterministic native check after source-provenance review. Then obtain the original Q161cu Hopf magnetic link phases, replace the untwisted edge differential on the same five incidence blocks, and compute actual flux-sensitive spectrum and gauge Ward residuals. Do not identify C4³'s 64 graph vertices with H64 without an intertwiner.
