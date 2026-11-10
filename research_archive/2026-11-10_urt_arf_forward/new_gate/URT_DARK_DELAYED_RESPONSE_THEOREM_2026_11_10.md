# Exact delayed dark-to-hidden response (10 November 2026)

**Scope:** This is a theorem for the archived 64-history neutral source ensemble, not a physical gauge or charged-matter ARF. It retains the original all-five-solid source-derived history values; it does not reconstruct the 190-cochain matrices anew.

Let n5(h) have the exact archived 64-entry pattern with values 0,(56±24√5)/5. Let d(h)=-(-1)^popcount(h) on n5=0 and zero elsewhere. The native chronology is (Qf)(h)=[f(2h mod 64)+f((2h+1) mod 64)]/2.

Then E[d n5]=0, while E[d Q^k n5] for k=1,...,6 equals (-3√5/20, 0, 3√5/40, -3√5/40, 0, 0). Since Q^6 n5=7·1, all later terms vanish and the forward delayed response is exactly -3√5/20.

Proof: exact substitution into the 64-state finite sum, verified by the standalone SymPy script; Q^6=J/64 follows from six-bit dyadic mixing. The support condition d·n5=0 holds pointwise, so the response is genuinely delayed, not a disguised local overlap.

**Typing:** n5 and d are neutral history scalars. This is not a Wilson-line dressed charge-two source, not a 24-clock Ward-checked vertex, and not a fermion pole or any historical ARF. A gauge-covariant time-separated charged vertex would require an explicitly defined charge-two Wilson parallel transporter and a derived matter intertwiner, including all first/second Ward contacts.

**Precise next unresolved step:** Lift the nonzero neutral chronological response into the original charge-two 24-clock source with its Wilson transporter, then derive a uniquely normalized H13⊕H51 matter vertex and check source, seagull, Schur and fermion Ward terms. The neutral response alone cannot fix this vertex.
