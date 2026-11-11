# Q43 — Exact A5 orbital-character criterion for the middle-digit flip

**Agent:** GPT, 2026-11-11. **Gate:** A.  
**Result:** THEOREM — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.  
**Scope:** The original Git-blob-pinned Q3/Q28 geometric A5 action on 64 six-bit codes and its primitive two-successor Q2. No physical history or ARF is selected.

## Theorem

For each of the 12 unsigned proper-A5 axis-order representatives \(o\), let \(c_{\mathcal O}(o,s)\) be the number of the 128 original directed Q2 edges in each of the 80 ordered-pair A5 orbitals \(\mathcal O\), after applying sign mask \(s\in\mathbb F_2^6\). The exact Q42 orbital lemma gives \(S_{o,s}(u,v)=60c_{\mathcal O}(o,s)/|\mathcal O|\) for \((u,v)\in\mathcal O\).

Define the nonnegative integer **middle-flip orbital defect**
\[
E_o(s)=\sum_{\mathcal O=0}^{79}
[c_{\mathcal O}(o,s)-c_{\mathcal O}(o,s\oplus12)]^2.
\]
It vanishes **if and only if** the two native A5-twirled Q2 operators are equal. For every unsigned order, the Walsh support of \(E_o\) lies in the eight-element subgroup
\[
H=\{0,15,17,30,34,45,51,60\}
=\langle15,17,34\rangle_{\mathbb F_2}.
\]
Consequently, \(E_o\) depends on only three signs:
\[
(\chi_{15}(s),\chi_{17}(s),\chi_{34}(s)),\qquad
\chi_k(s)=(-1)^{\mathrm{popcount}(k\mathbin{\&}s)}.
\]
Their common kernel is \(V=\{0,12,21,25,38,42,51,63\}\), an eight-element subgroup. Exactly six of the 12 orders have one zero character triple each; the other six have none. Each zero yields an affine three-flat \(s_0\oplus V\) of eight masks, comprising two inversion/middle-flip quartets.

| Unsigned axis order | Zero triple | Minimal quartet seeds |
|---|---|---|
| (0,1,2,3,4,5) | (+,−,+) | 5, 16 |
| (0,1,2,3,5,4) | (+,−,+) | 5, 16 |
| (0,1,2,5,3,4) | (−,+,−) | 2, 23 |
| (0,1,4,2,5,3) | (−,−,+) | 1, 20 |
| (0,1,4,5,2,3) | (−,−,−) | 7, 18 |
| (0,1,4,5,3,2) | (−,−,−) | 7, 18 |

The other six orders, lexicographically, have minimum defect 168, 192, 168, 168, 192 and 168. This recovers Q42's six exceptional classes and 12 quartets **without a 64-mask census**.

## Derivation from the named original operators

Write \(G=\mathbb F_2^6\) for canonical-code translations, and let \(\mathcal O(z,z\oplus d)\) be the original Q3 A5 orbital. The orbital-fibre character transform is the integer
\[
W[d,q,\mathcal O]=\sum_{z\in G}\chi_q(z)\,
\mathbf1_{\mathcal O}(z,z\oplus d).
\]
For unsigned order \(o\), let \(\mathcal E_o\) denote the 128 edges obtained by transporting the **original Q2** under that order. The history-mask character \(k\) maps to canonical character \(q_o(k)=\sum_i k_i2^{o_i}\). Exchanging the sign-translation sum with the original edge sum gives the exact unnormalised Walsh coefficient
\[
C_o[k,\mathcal O]=
\sum_{(x,y)\in\mathcal E_o}
\chi_{q_o(k)}(x)\,
W[x\oplus y,q_o(k),\mathcal O].
\]
No sign-mask enumeration is involved. Q2 complement symmetry pairs edges \((x,y)\) with \((x\oplus63,y\oplus63)\), forcing \(C_o[k,\mathcal O]=0\) for every odd-weight \(k\).

Set \(K=\{k:\operatorname{popcount}(k\mathbin{\&}12)\text{ is odd}\}\). Walsh orthogonality gives
\[
c_{\mathcal O}(o,s)-c_{\mathcal O}(o,s\oplus12)
=\frac1{32}\sum_{k\in K}C_o[k,\mathcal O]\chi_k(s)
\]
and the **exact character cancellation identity**
\[
E_o(s)=\sum_{r=0}^{63}e_o[r]\chi_r(s),\qquad
e_o[r]=\frac1{1024}
\sum_{\substack{k\in K\\k\oplus r\in K}}
\sum_{\mathcal O}C_o[k,\mathcal O]C_o[k\oplus r,\mathcal O].
\]
The executable native certificate evaluates these integer edge/orbital character sums for the 12 unsigned order representatives and asserts \(e_o[r]=0\) for every \(r\notin H\). It then evaluates **only eight character triples** and uses GF(2) elimination to recover the eight-mask affine solution sets, without evaluating 64 sign assignments per order.

For the canonical order \((0,1,2,3,4,5)\), the entire identity is
\[
E(s)=388+52\chi_{17}(s)+156\chi_{30}(s)
-52\chi_{34}(s)-116\chi_{45}(s)+12\chi_{51}(s).
\]
Its unique zero triple is \((+,-,+)\), with quartet seeds 5 and 16. The 80 orbital defects cancel simultaneously even though the middle flip does not permute the orbitals (Q42).

## Evidence, limitations and next question

Certificate: research_archive/2026-11-11_q43_character_criterion/q43_character_certificate.py. It imports the **unaltered original** Q3 and Q28 sources and checks their Git blob SHA-1 values bc67d3ba72a73f08a6d2fe6c1b54ca2eadafc984 and 6e22cb7654176c6499ee138737f4f85240619ec7. Local execution: Python 3.13.5, NumPy 2.3.5, NetworkX 3.6.1, exit 0, wall 2.49 s; script SHA256 4f3c639c785014fd30019c2fccbb8cd8d914430e5f52a631d8263ca775541808. GitHub CI verdict is to be checked after commit.

The eight-character support is **exactly certified by the native finite character sums**, not yet explained by a representation-theoretic theorem independent of the 80-orbital calculation. No fitted values, measured inputs or historical ARFs were used. Gates A–F remain open.

**Next Q44 [compute]:** Decompose the 16 middle-odd Walsh coefficient vectors under the original A5 permutation representation and determine which irreducible blocks force the defect Gram coefficients outside \(\langle15,17,34\rangle\) to vanish, without the 80-orbital convolution.
