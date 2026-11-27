# A399155: proof and source audit

Status: complete mathematical argument; Lean draft awaiting execution.
Prepared 2026-11-27 for Cornelius Lytollis (@con123-gif), assisted by ChatGPT.

Source: https://oeis.org/A399155, retrieved using the OEIS JSON API on 2026-11-27.
The source was created in August 2026 and updated on 26 November 2026.
It explicitly conjectures that repeatedly subtracting the greatest prime
factor never takes more steps than repeatedly subtracting the least prime
factor, for starting integers n>=2. No resolution is recorded in its full
comments. GitHub issue search found no existing PR for this ID before claim.

Let F(n) and G(n) be the respective step counts, with F(0)=G(0)=0.
For n>1, subtracting a prime divisor p cannot leave one: p divides n and
n-p=1 would imply p divides one. Hence the trajectories never encounter
the exceptional input one.

Every subtraction on either trajectory is at least two. Consequently,
G(m)<=floor(m/2) whenever m!=1. This follows by induction on the number
of permitted steps, using p>=2 and the fact that the next input is not one.

If m is even, the smallest factor is two throughout its trajectory, so
F(m)=m/2. For an arbitrary n>=2, let p be its least prime factor. The
number n-p is even: both n and p are even when n is even; both are odd
when n is odd. Thus

    F(n)=1+(n-p)/2.

Let q be the greatest prime factor of n. Then q>=p, so

    G(n)=1+G(n-q)<=1+floor((n-q)/2)
        <=1+(n-p)/2=F(n).

This proves the full conjecture, including prime starting values (both
counts are one), n=2, and n=4. The theorem does not rely on a finite search.

The same reasoning proves a stronger fact: any rule that chooses a prime
factor at each step takes at most F(n) steps. The upper bound G(m)<=m/2
uses only that each chosen factor is at least two and divides the current
value, while the first factor is always at least minFac(n). In particular,
the least-factor rule maximizes the number of steps among these rules.

The Lean statement uses a fuel bound equal to n. Every subtraction strictly
decreases the current nonzero natural number, so n iterations suffice.
The proof works with arbitrary fuel for the upper bound and with fuel at
least the current even input for the exact smallest-factor count.

Executed checks on 2026-11-27:

- `python3 combinatorics_work/a399155_exact_check.py`: 9,999 inputs n=2..10000,
  all intermediate formula/bound checks true, and all 90 published OEIS
  terms matched exactly.
- Official `tools/lint.py` on `statements/oeis-a399155.lean`: `ok: true`.
- Official PLAN note acknowledged as note 36010.
- Lean elaboration/kernel verification has NOT yet been executed.

RESUME HERE: execute the statement and proof drafts with the pinned official
Lean checker. Then submit the statement, wait for its acceptance, claim the
resulting proof target, check the exact proof file and submit it. No proof
acceptance, official PR or novelty claim has yet been asserted.
