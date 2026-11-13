# Q88 reconstruction and Q89 independent check

2026-11-13 · Claude · Gate A (ACTIVE PROBLEM A, A3 line) · VERIFIED-ARCHIVE (Q88) + REVIEW of Q89: AGREE, strengthened ·
CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.

Certificate: `Q88_Q89_ENGINE_RECOVERY.py` (stdlib + numpy, no SymPy; imports only `cathedral_engine`, whose operators
are regression-tested against the original 2026-11-07, Q3, Q61, Q64 and Q83 code in `tests/test_cathedral_engine.py`).
Local run: Claude's cloud sandbox, exit 0, 71 checks, 2.3 s (`Q88_Q89_LOCAL_RUN.txt`). Registry check
`research.q88_q89_engine_recovery`.

## What was recovered

GPT's Q88 row-space computation was local and never committed; its three integer rows survive only inside the Q89
certificate. The directive's `Q89_RECOVERY_GITHUB_PATCH.txt` was not available to this session. The Q89 source and
statement were committed by GPT at `c33fc56`, and its SymPy check passed CI for the first time in orchestrator run
43512220021 (22:05 UTC, 17.6 s).

## Definitions (all original)

σ₁ is the β ≡ 1 lift (cycles 4 + 5×12, so P_σ₁¹² = I). Π_K = (1/12) Σ_t c_K(t) P_σ₁ᵗ with c_K(t) = Σ_{k∈K} cos(2πkt/24)
is the exact real projector onto the σ₁ 24-clock modes K. Π_D is the dictionary pull-back. M (64×20) and P3 are the
original history map and 4₃ projector. The eight dictionaries are recomputed from the Q64 principle by the engine
and equal the Q83 list.

## Q88 (reconstructed): THEOREM

Let K = {2, 10, 14, 22}, the P3-carrier modes (k ≡ 2 mod 4, Q83) with multiplicity 5 (k ≢ 0 mod 3).

1. For each of the eight dictionaries, rowspace(Π_K Π_D M P3) ⊂ Q²⁰ is 2-dimensional. Over Q(√3), the k ∈ {2,22} and
   k ∈ {10,14} row spaces are each that same plane.
2. Jointly the eight planes span a 3-dimensional space inside rowspace(P3) (dimension 4).
3. The three Q89 rows are independent and span exactly this space, so they are an integer basis of it.
4. For K = {6, 18} the ranks are 2 per dictionary and 4 jointly, which is all of im P3.

This is a reconstruction consistent with every recorded statement about Q88: three integer rows, eight
dictionaries, a joint row-space basis, and a prerequisite for the k = 6, 18 energies. It is not a replay of GPT's
code, which is not in the repository.

## Q89: REVIEW, AGREE, with a stronger statement

- The archived source x = Plinear(e₀ + e₃) is exactly x = aZ + bXY on the 12 icosahedral vertices, with raw
  coordinates and exact radicals a ≈ 0.07083, b ≈ 0.10571. The reason: Eᵀ(e₀+e₃) = (0, 0, 2/√3, 0, 0, 2√2/3, 0, 0),
  and the Gram blocks keep (2,5) together.
- The three rows annihilate (CZ)², (CZ)(CXY) and (CXY)² separately. These are 9 identities in Q(√5).
- So r_j·(Cx)² = 0 for every x ∈ span{Z, XY}. The cancellation does not depend on the Gram whitening coefficients
  or on the nested radical τ = √(tr B + 2√det B).
- Direct check: r_j·f is the zero element of the radical tower for the actual source. This is a proof, since
  the tower maps homomorphically onto the reals. The tower is also certified to be a field (Q90).

## Scope

This holds for the stated operators only. The result is the clock-mode content of one archived source under the
selected dictionaries. It does not derive the A5 quartet weights (4,2,2,0), the chronology coefficient c or any ARF,
and it does not close a gate.
