# A390815: prior-result provenance and campaign correction

Audited 2026-11-27 by Cornelius Lytollis (@con123-gif), assisted by
ChatGPT/Codex (GPT-6; exact serving variant not exposed).

**Campaign classification: known characterization / prior announced formalization.
Exclude A390815 from the minimum of twenty genuine new open resolutions.**
The independent 353-line Lean certificate remains a complete kernel-checked
proof. Official statement PR #8102 is a formalization prerequisite and is not
an accepted proof. There is no claim of mathematical or formalization priority.

## Primary-source provenance

1. [OEIS A325436](https://oeis.org/A325436/internal) lists inputs with
   sigma(n) not dividing n!. Its comment states:

   > Union of the number 3 and numbers m from A023194 (sigma(m) = prime).

   [The public revision history](https://oeis.org/history?seq=A325436),
   revision #11, identifies **N. J. A. Sloane**, **May 3, 2019 at
   13:02:14 EDT** (17:02:14 UTC), as the editor who added this comment.
   Revision #12 approved the edit eight seconds later. The sequence's original
   author is Jaroslav Krizek, April 26, 2019; that is not the attribution of
   Sloane's added characterization. The approved internal page was revision
   #15, September 10, 2025, when this audit retrieved it. It states the
   characterization without a proof or conjecture qualifier.

2. [OEIS A023194](https://oeis.org/A023194/internal) contains an explicit
   argument attributed to **Gabe Cunningham**, concluding:

   > 2 is the only nonsquare n such that sigma(n) is prime.

   Cunningham's answer itself is **undated in the current entry**. It follows
   Zak Seidov's question dated June 10, 2005, and Harvey P. Dale's dated
   December 12, 2010 comment explicitly cites Cunningham's argument.
   Thus 2005 is the date of the question, not a verified exact date of the
   answer. Older public history required sign-in, so its first insertion
   date was not independently established. The proof is certainly prior
   to the current campaign. Its mechanism is multiplicativity and the
   parity of the divisor sum, followed by factoring odd powers of two.

3. [OEIS A390815's public history](https://oeis.org/history?seq=A390815),
   revision #22, records **Yufeng Liu**, **November 27, 2026 at
   08:17:49 EST** (13:17:49 UTC), announcing that both conjectures are true
   and linking [wray-lee/oeis-conjectures-lean](https://github.com/wray-lee/oeis-conjectures-lean).
   Revisions #23 and #24 followed at 08:27:11 and 08:27:46 EST.
   These proposed edits were visible in history before they appeared in
   the approved `/internal` text. Therefore checking only approved internal
   content missed an earlier public resolution announcement.

4. The linked repository contains
   [Proofs/A390815.lean at commit f978ed09def3018e3328ef88c195f1b7c1b08ae2](https://github.com/wray-lee/oeis-conjectures-lean/blob/f978ed09def3018e3328ef88c195f1b7c1b08ae2/Proofs/A390815.lean).
   The commit metadata records author `wray-lee`, November 27, 2026 at
   07:25:29 UTC; a commit timestamp alone does not establish publication
   time. The OEIS history gives the independent public announcement time.
   The fetched 245-line source defines `not_dvd_iff`, `terms_prime`, and
   `square_of_not_dvd` and contains no `sorry`, `admit`, or custom `axiom`
   declarations. The README states Lean 4.36.0/Mathlib 4.36.0 kernel checking
   and attributes the work to the repository owner assisted by Claude
   (Anthropic). **We did not rerun that external project's compiler.**
   The README itself describes its contribution as formalizing the
   characterization already recorded in A325436 and does not claim priority.

## Mathematical implication

Sloane's prior characterization gives, for every positive n,

    sigma(n) does not divide n!  iff  n=3 or sigma(n) is prime.

For sigma(n) prime, n>1 implies sigma(n)>n, so it is coprime to n!, and the
reduced denominator equals that prime. At n=3 the denominator is two.
Cunningham's result then makes every failure input n>=4 a square. Thus the
prior characterization and the prior square proof already imply both
A390815 assertions. Our elementary factorial-packing proof independently
establishes the needed characterization, but this does not make it a new
open-problem resolution.

## Campaign and verification status

Our full proof passed Lean 4.33.1 against formal-conjectures commit
9097e2f90e66d2f6244209cb1c07f7120d17ec53 in
[run46025483748](https://github.com/con123-gif/open-math-agents/actions/runs/46025483748),
job140595672705. `OMA.solution` uses only `propext`, `Classical.choice`,
and `Quot.sound`. Statement SHA256:
`36e665dbff1a7ca486f5dd6007ca366c76d6339994a041ecf10386aa71fb8de8`.
Proof SHA256:
`e7129db0a12fbf786e68e54602ea6574c4711aba8bb87f2f40d3a3bda3a8fb50`.
[Statement PR8102](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/8102)
was submitted and the live lease was released with actual HTTP200; DONE
note41023 was acknowledged with HTTP200. Root is correcting the PR and
campaign ledger with this provenance. No active lease remains in this lane.

Future source audits must inspect all crossreferences and public revision
history, including proposed edits, before treating an approved-page conjecture
as genuinely unresolved. Absence of an OMA PR does not establish open status.
