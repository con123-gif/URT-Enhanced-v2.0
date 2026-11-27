# MO504014: excluded from the genuinely new open-solution campaign

The exact source is https://mathoverflow.net/questions/504014. Current question, zero answers, and all three comments were read. The source starts indexing at 1 and asks for actual equality to a remainder, not merely a congruence.

The independent counterexample is a(1)=2 and a(n)=6 for every n>=2. Its tail gcds are g(1)=2 and g(n)=6 for n>=2, so the displayed nonconstant-gcd branch chooses d=2. Both asymptotic assumptions hold: a(n)/2^n tends to 0 and the adjacent ratio tends to 1. Every signed sum is congruent to plus or minus 2 modulo 3, so zero is unattainable. At every positive even n the total 6n-4 is divisible by 4, so the asserted eventual equality to the total modulo 2d predicts zero and fails. The actual minimum is 4 at positive even n and 2 at odd n.

## Decisive published prior obstruction

The same author, John C, explicitly discusses the general obstruction in the later primary question https://mathoverflow.net/questions/515847 (October 2026). The full question and its empty answer/comment lists were inspected. It writes a(n)=lambda*b(n)+c(n), with infinitely many odd b(n), and explains that a sufficiently small absolutely summable perturbation c prevents signed sums from reaching magnitude <=1 on infinitely many prefixes.

Specialize lambda=6, b(1)=0, b(n)=1 for n>=2, c(1)=2, and c(n)=0 for n>=2. This gives exactly the counterexample above and the same lower bound 6-2=4 on every positive even prefix. It is an explicit prior general result containing this example, so an independent derivation does not constitute a new open-problem solution.

The stronger strictly increasing variant a(1)=2, a(n)=8n for n>=2 is likewise contained in the same published perturbation obstruction. It is not a workaround for the novelty issue.

## Formal status

A complete statement/disproof draft and combined probe were written in this directory and passed the repository's official static lint. They have NOT been executed by the Lean kernel. No lease was taken, no official submission was made, and no acceptance is claimed. The drafts are retained as known-prior work only. The exception branch uses the positive first term b and a(n)=b*2^(n-1), so it includes the half-integer values of the source's unspecified c without narrowing the statement.

Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6 Codex); independent source and mathematical challenges by the other campaign agents. The obstruction itself is prior mathematics of John C, not a new theorem attributed to this campaign.
