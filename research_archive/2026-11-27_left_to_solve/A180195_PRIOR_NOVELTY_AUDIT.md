# A180195: prior mathematics and the limits of novelty claims

Independent review, 27 November 2026, for Cornelius Lytollis (@con123-gif), assisted by ChatGPT (Codex).

The formal proof settles the exact recurrence still labelled a conjecture in the current primary OEIS entry, attributed there to R. J. Mathar on 24 July 2022. The proof uses elementary algebra on an already-published defining alternating sum. It is a routine consequence of known sequence formulas, with no new mathematical method. Neither formal acceptance nor an OEIS conjecture label establishes historical priority.

## Concrete earlier identity located

The primary [A082030 internal record](https://oeis.org/A082030/internal), in the explicitly delimited comment credited to Peter Bala on 10 July 2008, states that

\[
c_n=n!(n^2+n+1)=\operatorname{A001564}(n)
\]

satisfies

\[
c_n=(n+3)c_{n-1}-(n-1)c_{n-2}\qquad(n\ge2),
\]

with initial values 1 and 3. This is exactly our certificate's auxiliary factorial recurrence, after reindexing. The current [A001564 entry](https://oeis.org/A001564) independently repeats that same recurrence, credited to Mathar on 1 July 2022. Its factorial-polynomial formula is credited to Mitch Harris in 2008, and the sequence itself appears in Sloane's 1973 handbook and Sloane–Plouffe's 1995 encyclopedia.

The [A180195 entry](https://oeis.org/A180195) defines

\[
a_n=(-1)^n\sum_{j=1}^n(-1)^j c_{j-1}.
\]

Splitting off its last summand gives the immediate identity

\[
a_n+a_{n-1}=c_{n-1}.
\]

Substitute this into Bala's existing recurrence at index n−1. The left side becomes

\[
(a_n+a_{n-1})-(n+2)(a_{n-1}+a_{n-2})
 +(n-2)(a_{n-2}+a_{n-3}),
\]

which simplifies to the exact purportedly conjectural expression

\[
a_n-(n+1)a_{n-1}-4a_{n-2}+(n-2)a_{n-3}=0.
\]

Thus our `b_recurrence` lemma is an independently checked instance of an explicitly earlier known identity, and the final A180195 recurrence follows from it by a standard linear substitution. The Lean contribution supplies a complete machine-checked certificate and an explicit derivation for the catalogue assertion. It does not establish a new factorial identity, a new holonomic method, or first discovery of the sequence.

## Myers (2002): actual access limitation

The source links Amy N. Myers, *Counting Permutations by Their Rigid Patterns*, Journal of Combinatorial Theory A 99 (2002), 345–357, DOI [10.1006/jcta.2002.3279](https://doi.org/10.1006/jcta.2002.3279). The publisher's accessible bibliographic search record confirms this title, author, journal and abstract about exact enumeration of rigid patterns. The current author page at Bryn Mawr links `https://www.brynmawr.edu/math/people/anmyers/PAPERS/Perms.pdf`; opening that actual link returned HTTP404. Publisher article/PDF access returned HTTP403, including a direct official PDF download attempt, whose response was HTML rather than PDF. The full paper was therefore **not read**, and it would be incorrect to assert that Myers either contains or omits the exact recurrence based on the abstract alone.

Additional bounded access checks retrieved OpenAlex and Crossref's DOI metadata. OpenAlex points to the same publisher PDF and an old author-hosted/CiteSeer record (`10.1.1.84.7815`, historical `www.sju.edu/~amyers/PAPERS/Perms.pdf`); both actual retrievals returned404. Crossref's official publisher text-mining URL returned403. All responses were checked for PDF magic, and none was represented as paper text. The metadata and access receipts are `A180195_Myers_access_metadata.json` and `A180195_Myers_additional_access_receipt.json`.

Strong exact-ID/title/recurrence searches located the source record and related known formulas, but did not locate an earlier explicit full A180195 proof. This is a bounded search result, not a priority certificate. The newly located 2008 auxiliary recurrence is positive evidence of substantial prior mathematics, not evidence that the exact A180195 statement itself was explicitly published there.

## Appropriate reporting

Report official checker acceptance/merge separately from scientific novelty. If independently confirmed by the parent, the campaign may record an accepted certificate for the precise catalogue conjecture. Its research description should say **routine derivation from known formulas; first-ever novelty unverified**, with Bala, Harris, Mathar, Deutsch, Myers and the sequence sources acknowledged as applicable. Do not call this a major new result, claim a novel technique, or infer historical priority from a Lean kernel pass. Conversely, this audit has not established an earlier explicit publication of the exact A180195 recurrence, so it does not falsely assert such a prior proof.
