# A372556 — complete exchange argument, draft awaiting Lean

Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT. Source conjecture: Antti Karttunen, OEIS A372556 revision 14 (May 10, 2024). This is not a claim of global novelty or acceptance.

Let J_0=0, J_1=1, J_{i+2}=J_{i+1}+2J_i. Discard the duplicate J_1=J_2=1 and use coin indices i>=2. Then J_i is strictly increasing for i>=2, and
J_{i+1}=2J_i+(-1)^i,
J_{i+2}=4J_i+(-1)^i.
Every n admits a finite coin representation because J_2=1. Among representations with minimum number of coins choose one whose descending list of indices is lexicographically greatest. This choice exists: all positive coin indices and the number of coins are bounded in terms of n. Alternatively, choose a minimum-length representation maximizing sum 5^i over the coin indices; each particular exchange below strictly increases this score if the number of coins is unchanged. Either choice separately justifies the exchanges.

Write d_i for its multiplicities.

1. If i>=3 is odd, d_i<=1. Otherwise replace 2J_i by J_{i+1}+J_2, using 2J_i=J_{i+1}+1. The number of coins is unchanged and the greatest changed index increases.

2. If i>=2 is even and d_i>=4, there cannot be any additional coin J_l with 2<=l<=i. Indeed
4J_i+J_l=J_{i+2}+(J_l-1).
The remainder J_l-1 has a representation using at most four coins of index strictly less than l: it is 0 for l=2; it is 2J_{l-1} for odd l>=3; it is 4J_{l-2} for even l>=4. Thus the five removed coins are replaced by at most five coins and one index i+2. A decrease contradicts minimality, and equality contradicts maximality. In particular d_i<=4, with d_i=4 forcing every lower coefficient zero.

3. For every i>=2, it is impossible to have d_i>=2 and d_{i+1}>=1. The replacement 2J_i+J_{i+1}=J_{i+2} reduces three coins to one.

Now induct on the largest allowed index h. For every prefix of this normal form, let S_h=sum_{i=2}^h d_i J_i. We show:
- h even: S_h<=J_{h+2}-1;
- h odd: S_h<=J_{h+1}-1.
The empty prefix h=1 has value 0=J_2-1. For even h, either d_h=4 and S_{h-1}=0, giving S_h=4J_h=J_{h+2}-1, or d_h<=3 and induction gives S_{h-1}<=J_h-1, hence S_h<=4J_h-1<J_{h+2}. For odd h, d_h<=1. If it is 0, the even-prefix bound gives S_h<=J_{h+1}-1. If it is 1, condition 3 gives d_{h-1}<=1; the odd-prefix bound two levels earlier gives S_{h-2}<=J_{h-1}-1, so
S_h<=J_h+2J_{h-1}-1=J_{h+1}-1.
The h=3 case uses S_1=0 and works identically.

For n>0 take k>=2 with J_k<=n<J_{k+1}. No representation of n can use indices greater than k. If the chosen optimum used no J_k or J_{k-1}, its largest index h would be at most k-2. The prefix bounds would give n<J_k, a contradiction. Thus some optimal representation uses J_k or J_{k-1}, exactly the source conjecture. Since A372556 picks the largest index appearing in any optimum, it too is k or k-1. For n=0 the source a(0)=A130249(0)=0, separately trivial.

Boundary note: J_1 and J_2 both equal 1. We use index 2 for this denomination, matching the source largest-index convention. For n=1, k=2 and the one-coin representation already has index k.

Status: full theorem kernel-verified on the exact official pin in run 46055072139/job 140695454190, commit 31aab2c222341cd3d3cb7d5b310493fe52ca98ab. OMA.solution depends only on propext, Classical.choice and Quot.sound; actual exit 0. Official submission and acceptance remain pending; no lease held at this checkpoint. Initial current-source audit found A372556 revision14 still conjectural, related A372555/A372561 do not state this proof. Exact global Lean A372556/A372555 searches and exact TrureTuring catalogue/repository searches returned zero. Broader literature/prior search is bounded, not a global priority guarantee. No lease and no official submission.

The source index bridge is proved in the certificate, not assumed: for every n>0, k=floor(log_2(3n+1)) satisfies k>=2 and J_k<=n<J_(k+1). Indeed 2^k<=3n+1<2^(k+1), together with 3J_i=2^i-(-1)^i, gives both inequalities by the two parity cases and integer rounding. Thus the affordable index k in this hand proof is exactly A130249(n).
