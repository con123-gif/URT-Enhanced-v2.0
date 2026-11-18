# Q161br — native Q101 edge / 24-track reversal (2026-11-18)
Status: THEOREM — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.

Using the actual golden-icosahedral 30×20 oriented face boundary D and its induced signed antipodal edge involution E, and the canonical 24-track cyclic shift S and reversal R on Z/24Z, the exact identities ED=DP, RSR=S^{-1}, R(S-S^{-1})R=-(S-S^{-1}), and R(2I-S-S^{-1})R=2I-S-S^{-1} hold. The native oriented clock derivative A=S-S^{-1} has rank 22 (zeros at Fourier k=0,12); D has rank 19, hence the explicit factorized edge-clock operator D⊗A has rank 418 and nullity 62 on the 480-dimensional face-clock domain. The reflection eigenspaces have dimensions 13 and 11.

This is a **bounded factorized native-operator calculation**, not the sought H64-derived edge-to-clock coupling J. No Q96 charged Ward residual was calculated, and no physical gate is closed. In particular, the factorization D⊗A is a diagnostic, not a claimed microscopic H64 transfer. The oriented clock derivative is reflection-odd; a parity-even candidate requires additional orientation/parity structure.

Evidence: standalone SymPy script Q161BR_CERT.py executed locally 2026-11-18, exit 0, exact assertions; CI pending.
Next: locate archived original H64/190→24 source map J and test (E⊗R)J versus J P_source, followed by the actual Q96 charge Ward commutator.
