# Q161u — exact native icosahedral face-source Gram spectrum

**Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. **Result:** THEOREM (bounded Q161o subtask).

**Provenance:** original Q161t geometrically reconstructed icosahedral 20-face-to-64-history incidence M, original Q161a two-bit-average P and pair-average Q, and parity w63. This is the same original icosahedral component, not a substitute for the missing full five-solid/24-clock source.

Define R_f=QP diag(w63) M_f and let B be its ten nonzero columns (indices 0,1,2,3,4,5,6,13,14,15). Exactly those ten faces meet the first antipodal vertex pair; the other ten columns vanish. The **exact** Gram G=B^T B has diagonal 4/25, determinant 548864/50682163238525390625 and characteristic polynomial

(25λ−2)^4 (225λ−268)(225λ−8)(50625λ²−1350λ+4)^2 / 50682163238525390625.

All factors have positive roots: 2/25 (multiplicity 4), 268/225 and 8/225 (each 1), and (3±sqrt(5))/225 (each multiplicity 2). Therefore all ten active face amplitudes are independently recoverable, and the full face-source kernel is precisely the ten inactive face directions. This is a strictly stronger exact spectral certificate than the prior Q161t rank-only test.

**Execution:** GPT local container: python research_archive/2026-11-16_q161u_native_face_gram/Q161U_FACE_GRAM.py; exit 0, exact SymPy arithmetic, no fitted inputs. CI verdict to be checked independently.

**Scope:** A conditional multiplicative face-to-history source capacity, **not** a derivation that the physical H64/five-solid/24-clock source actually supplies these amplitudes, and **not** a Q96 Ward certificate. All physical gates remain open.

**Next executable question:** Build the original 190-cochain/24-clock H64-to-history source operator from pinned archives; determine its coefficients on the ten active face directions and evaluate all Q96 Ward generators before asserting any physical lift.
