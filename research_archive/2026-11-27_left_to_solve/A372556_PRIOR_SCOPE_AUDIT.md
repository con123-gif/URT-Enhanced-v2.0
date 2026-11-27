# A372556: independent source, proof and prior challenge

27 November 2026. Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6; exact serving variant not exposed. This is a bounded independent review, not a kernel-pass, acceptance or worldwide priority claim. No lease was claimed by this lane.

The full current OEIS A372556 revision14 source and the full exchange argument in reversal_work/fresh/A372556_COMPLETE_HAND_PROOF.md were read. The exact source quantity is the largest index occurring in any representation of n using the fewest Jacobsthal summands. Its conjecture puts this index at the largest affordable Jacobsthal index or the preceding one. The n=0 convention and duplicate denominations J1=J2=1 require separate treatment, as the draft does.

## Mathematical challenge: pass

For odd i>=3, replacing two copies of Ji by J(i+1)+1 preserves the number of summands and raises the greatest changed index. For even i, four Ji plus any additional Jl with l<=i equal J(i+2)+(Jl-1). The residual has zero, two or four smaller summands according as l=2, odd l>=3, or even l>=4. The exchange therefore lowers the count or preserves it while increasing the highest changed index. Finally 2Ji+J(i+1)=J(i+2) strictly lowers the count. All parity signs in these identities were checked independently.

A representation of minimum count and then maximum index score exists: each positive coin is at most n, the coin indices are bounded because the denomination sequence is strictly increasing from index2, and the coin count is bounded. Replacing index1 by index2 removes the duplicate denomination without changing the represented value or count.

The stated prefix bounds follow with their exact endpoints: even h gives S_h<=J(h+2)-1, odd h gives S_h<=J(h+1)-1. In the odd case with a top coin, the local exchange forces the previous multiplicity at most1, and the two-level prefix estimate gives the desired equality bound. The h=3 base uses the empty prefix correctly. These inequalities force some optimum to contain Jk or J(k-1) whenever Jk<=n<J(k+1). No representation can use a larger coin. Consequently the actual source maximum-over-all-optima index also lies in that pair.

For the formal source bridge, either use the actual A130249 definition as the maximum affordable index or prove its equivalent floor(log2(3n+1)) formula using Ji=(2^i-(-1)^i)/3. This bridge should be explicit in the final statement/proof rather than leaving k unrelated to the OEIS index.

## Actual older primary literature inspected

A.F.Horadam, *Jacobsthal Representation Numbers*, Fibonacci Quarterly34.1(1996),40-54, was opened from the primary journal PDF and read, including all of section4 and its theorem/discussion/table, surrounding sections and references:
https://fq.math.ca/Scanned/34-1/horadam2.pdf

Its Theorem1 constructs a patterned representation with coefficients0,1,2 and a neighboring-coefficient restriction. The subsequent discussion says this selected representation uses the greatest affordable coin. This is not a theorem about the fewest summands: its representation of63 has five summands, whereas3*21 has three. Its local recurrence restriction is prior mathematics and should be acknowledged. The introductory language about minimality cannot supply the missing global optimality conclusion;84 has a four-coin optimum4*21 outside the stated coefficient restriction.

The explicitly linked older article was also opened and inspected through its complete21-page text (pages499-518 plus continuation550), with all six sections and theorem statements:
L.Carlitz, R.Scoville and V.E.Hoggatt,Jr., *Representations for a Special Sequence*, Fibonacci Quarterly10.5(1972),499-518,550.
https://www.fq.math.ca/Scanned/10-5/carlitz3-a.pdf
https://fq.math.ca/Scanned/10-5/carlitz3-b.pdf

This paper studies the same recurrence under another name. Its canonical representations use binary coefficients with a parity rule on the first occupied index; its later results concern derived integer sequences, composition of sequence functions and generating functions. No global fewest-summands theorem or the largest-or-previous index assertion was located. Its canonical representations are a different optimization problem from A372556.

Exact-ID and structural Jacobsthal/minimum-summand/change-making searches in both engines did not locate another full resolution in this bounded audit. The target and related current OEIS comments retain the conjectural status; historical completeness is not claimed. A proper fresh upstream deduplication and live eligibility check remain required before any official lease/publication. The reversal lane owns the candidate and must separately obtain actual full Lean verification.
