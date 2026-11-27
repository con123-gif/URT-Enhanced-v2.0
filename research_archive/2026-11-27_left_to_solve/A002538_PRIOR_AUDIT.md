# A002538: novelty and earlier mathematics audit

27 November 2026. Independent review by the number-theory lane for Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex. This audit separates acceptance of a Lean certificate from priority for a mathematical theorem. It makes no first-discovery claim.

## Finding

The exact third-order recurrence remains labelled a conjecture attributed to R. J. Mathar, 27 October 2014, in the fully read current [primary OEIS entry](https://oeis.org/A002538/internal), revision138 dated18 August2026. Nevertheless it is an immediate algebraic consequence of older unmarked formulas in that same entry. It should be described as an elementary formalized consequence of known mathematics, and conservatively excluded from the campaign's count of genuinely new open mathematical resolutions. An accepted upstream Lean certificate remains an actual accepted contribution.

I did not locate an earlier document printing and proving the literal third-order formula in the bounded searches below. That absence does not turn an immediate consequence of published known identities into an established original research discovery.

## Exact target and decisive prior formulas

The target, for every n>=3, is

\[
R_n=a_n-2(n+2)a_{n-1}+(n^2+4n+1)a_{n-2}-n(n-1)a_{n-3}=0.
\]

The same primary entry gives, without a conjecture qualification,

\[
a_0=0,\qquad a_n=(n+2)a_{n-1}+n\,n!\quad(n\ge1).
\]

It also contains David Callan's7 March2006 combinatorial proof of the harmonic formula

\[
a_n=(n+2)!H_{n+2}+(n+1)!-2(n+2)!.
\]

The displayed harmonic formula gives the first-order recurrence directly using H_{n+2}-H_{n+1}=1/(n+2). Gary Detlefs's25 March2011 formula is an equivalent expression. Vladeta Jovovic's15 September2003 exponential generating function is another earlier exact description. Thus prior knowledge here does not rest on a bare unexplained conjecture being used as a definition.

Three substitutions of the known first-order recurrence prove the target:

\[
\begin{aligned}
R_n&=(n-1)a_{n-2}-n(n-1)a_{n-3}-(n-2)(n-1)!\\
&=(n-1)(n-2)(n-2)!-(n-2)(n-1)!\\
&=0.
\end{aligned}
\]

This is exactly the substance of the accepted certificate: unfold three recursion steps, expand factorials and use polynomial normalization. The earlier research note already calls this routine elementary recurrence algebra and disclaims priority.

## Primary literature cross-check

I read Dengji Qi, [Note: On the second order Eulerian numbers](https://ajc.maths.uq.edu.au/pdf/50/ajc_v50_p183.pdf), Australasian Journal of Combinatorics50(2011),183-185, completely. Lemma1.1 gives the classical triangular recurrence; Corollary2.2 gives its factorial boundary. Specializing the triangular recurrence to T(n+1,n-1) yields precisely the first-order recurrence above: the adjacent boundary contributes n*n!, and the other coefficient is n+2. Qi cites Concrete Mathematics,2nd edition(1994), for the classical recurrence. The cited book itself has not been read in full during this audit; this attribution is explicitly through Qi's primary paper.

Michael Z. Spivey's [Recurrent Combinatorial Sums and Binomial-Type Theorems](https://cs.uwaterloo.ca/journals/JIS/VOL23/Spivey/spivey36.pdf), Journal of Integer Sequences23(2020), article20.5.5, was opened as further primary context. Its inspected introduction concerns general triangular recurrences and recurrent combinatorial sums. I do not claim it prints or proves the literal A002538 third-order relation.

## Bounded search scope and limits

Strong web searches used the exact identifier with proof/recurrence/Mathar and structural second-order-Eulerian/harmonic terms. They surfaced the primary entry and classical triangular-recurrence literature, without a located earlier literal third-order proof. Exact-ID searches of the locally downloaded TrureTuring research catalogue, the complete Eppie/oeis-proofs archive's text/Lean files, and three already downloaded Fried papers found no match. These are finite checks of named sources, not a universal literature or priority certification.

The current primary source and complete accepted-certificate draft were read. The present review did not exhaust all138 OEIS historical revisions or every source listed in the bibliography. None of those limitations affects the explicit elementary derivation from the already published first-order and harmonic formulas.

## Reporting recommendation

Record A002538 as an accepted Lean formalization of Mathar's displayed recurrence, derived by elementary algebra from classical known formulas. Do not call it a new breakthrough or count it as a genuinely new open theorem solely because a stale conjecture label survived in OEIS. Keep the official acceptance count and the strict genuine-new research count separate.

Local evidence: `number_work/a002538_source_current.html`; `runtime_research/A002538_RESEARCH.md`; `runtime_research/A002538_statement.lean`; `runtime_research/A002538_proof.lean`. Official contribution: [proof PR7815](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7815).
