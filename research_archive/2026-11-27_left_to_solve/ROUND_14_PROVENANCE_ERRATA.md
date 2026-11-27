# Provenance correction

Cunningham's square argument in A023194 is prior mathematics, but its precise date was not established. June10,2005 dates Seidov's question, not the answer. Earlier Round14 references to a '2005 proof' should be read as Cunningham's prior argument, known to have been cited by Dale in2010. No exact answer year is asserted.

A390815 has an earlier public proof announcement in its OEIS history revision22, November27,2026 at08:17:49EST, by Yufeng Liu, linking wray-lee/oeis-conjectures-lean. Pinned source f978ed09def3018e3328ef88c195f1b7c1b08ae2 contains Proofs/A390815.lean proving both assertions. We inspected source and did not independently rerun that repository's4.36 toolchain. The independent353-line certificate in this campaign passed4.33.1, but is excluded from the genuine-new minimum. PR8102 was corrected to acknowledge the prior source.

A058128 and A401715 were also detected as prior-resolved before new claims. Their independent candidates are archived only as known-result work; A058128 did not pass a Lean run in this session, and the A401715 hand proof has no Lean certificate here. Neither counts toward20.
