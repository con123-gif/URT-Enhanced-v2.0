# URT/Koide charged-lepton phase — October 16, 2026

This is a continuity-preserving verification of the **previously reported** Koide three-return phase analysis. It does not restart CKM/PMNS, gauge or typed-H64 mathematics.

Start with [the full exact Koide/Circulant/Gram derivation and empirical comparison](KOIDE_THREE_RETURN_PHASE_GATE.md).

**Standalone reproducible scripts**:
- [koide_phase_independent_check.py](koide_phase_independent_check.py) — Python stdlib; CODATA mu/e and PDG tau diagnostic, analytic phase inversion, exact 2/9 pair hypothesis rejection, tiny-Q correction alternative, original rank-one charge-plane Bargmann loops and URT three-step phase.
- [koide_circulant_invariant_gate.py](koide_circulant_invariant_gate.py) — NumPy; universal Koide trace ratio and determinant identity over multiple independent phases.

**Mathematical conclusion:** A Hermitian 3-return circulant with offdiagonal magnitude \(A/\sqrt2\) has \(\mathrm{Tr}H^2/(\mathrm{Tr}H)^2=2/3\) for every return phase. The normalized cubic determinant encodes the only surviving phase variable by \(\cos3\delta=[1+54\det H/(\mathrm{Tr}H)^3]/\sqrt2\). The original 4-species Hermitian charge-plane Gram remains rank one with vanishing triangle phases, so does not fix \(\delta\).

**Empirical finding (conditional):** CODATA mass ratio 206.7682827(46) implies \(\delta=0.222222047073088\pm3.96\times10^{-10}\) if \(Q=2/3\) exactly. An additional claim \(\delta=2/9\) then misses the mass ratio by 442σ. The rational phase alone can survive if \(Q-2/3=-1.42146\times10^{-7}\); this correction is NOT an independently computed URT prediction.

**Source caveat:** The user mentioned a separate script named kl_urt_koide_action.py; its bytes have not been found in the connected repository, available conversation files or library. The October 16 statement that individual action terms select 0°, 30° or 60° is recorded as *source reported*, not independently rerun here.

**Historical provenance:** [actual earlier Dirac charge-plane audit](../urt_dirac_selection_audit.py), [original H64 typed memory](../../docs/CLOSURE_LEDGER.md), and [October 16 conversation-first recovery](../2026-10-16_conversation_first_recovery/RECOVERED_PREVIOUS_FRONTIER_2026-10-16.md). Do not replace with the geometric 64-cell flavour toy.

No empirical input is used in constructing the algebraic rank-one charge Gram or the circulant trace/determinant identities. Observed masses are used **only** in labelled diagnostic comparisons. Full physical Q=2/3 and three-return \(\delta\) selection remain separate hypotheses pending an independent action calculation.
