# Q10 — Exact unsigned axis-order K₂ spectrum and sign-transport obstruction

**2026-11-10; GPT.** Result: **OBSTRUCTION** in the specified finite fixed-endpoint six-axis source dictionary. Status: **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING** for this finite calculation only. No gate is closed.

## Exact statement

Fix the archived 12 icosahedral vertices in Q(sqrt(5)), the six antipodal pairs (in increasing first-vertex order), the original hidden-5 face source obtained from the five-solid 50→8→12 pullback, the five A4-normalizer hidden-5 singlet projectors, and the 64-history de Bruijn transfer

    (Qf)(h) = (f(2h mod 64) + f((2h+1) mod 64))/2.

For each permutation p of the six axes, assign bit position j to axis p[j], **keeping the chosen first endpoint of each antipodal pair fixed**. For a vacuum vector t in the hidden-5 singlet and its 64-history source g, define

    K2(p,t) = ( <g_p,g_p> + 2 sum_{d=1}^5 <g_p,Q^d g_p> ) / <t,t>,

with uniform Haar inner product on the 64 histories. Let S(p) denote the sorted multiset of the five exact K₂ values.

The 60 proper icosahedral rotations induce a faithful 60-element permutation action on the six **unsigned** antipodal axes. This action has exactly 12 free orbits on the 720 orderings, each of size 60. On the *lexicographically least representative of each orbit*, the 12 multisets S(p) are pairwise different. On *all* 720 fixed-endpoint orderings there are exactly **44** distinct K₂ multisets. The number of distinct S(p) values within successive lexicographically ordered unsigned-A5 orbits is exactly

    (8, 8, 10, 7, 8, 10, 10, 8, 7, 10, 8, 8).

An exact within-orbit witness is p=(0,1,2,3,4,5), with S(p)=(5/6,25/24,67/48,33/16,33/16), and p'=(0,5,4,2,1,3), with S(p')=(299/240,121/60,649/240,649/240,103/30). Both orderings are in the first unsigned-A5 orbit, but have different fixed-endpoint spectra. **This does not contradict A5 covariance**: an actual icosahedral rotation can invert some chosen axis endpoints; holding those endpoint signs fixed is not the full signed A5 action. Consequently an unsigned-axis orbit is not sufficient to specify a unique K₂ source response. One needs the induced sign action and a selection of the six-bit chronology dictionary.

## Certificate and proof

`axis_order_k2.py` is self-contained; it imports no archival K₂ code or numerical target. It constructs 12 exact golden-ratio vertices, all 30 edges and 20 faces, the rational 20×20 hidden-5 spectral projector from face–vertex incidence, the 60 proper vertex permutations, all five Klein-four subgroups and their rank-one A4-normalizer singlets, and the original nonlinear scalar face source on 64 sign histories. It calculates correlations exactly in Q(sqrt(5)), proves the six-step centering of the source, enumerates all 12 unsigned orbits and all 720 orderings, and asserts every count and the exact witness above. Assertion failures exit non-zero.

The original full five-solid pullback to the icosahedral 20-face output is an **archived exact equivalence** (`research_archive/2026-11-10_urt_arf_forward/forward/URT_EXACT_SOURCE_WALSH_CORRELATIONS_2026-11-09.py`); this certificate reconstructs that output without re-executing the full 190-cochain bridge. This restriction is explicit, not a 13-cell substitute for the full Cathedral.

Local sandbox execution: Python 3.11, SymPy and NetworkX, 2026-11-10 21:09 UTC, exit code 0, 28.66 seconds. GitHub Actions must independently execute `research.unsigned_axis_order_k2` after commit; no CI verdict is claimed until it finishes.

## Limits and next computation

No part of this work fixes the source dictionary from pi, phi, e; chooses a physical vacuum; identifies a charged source or a photon pole; derives any historical ARF; or closes Gate A. The `12` and `44` are **different counts**: the former is unsigned group-orbit count (and also the count of spectra on the chosen 12 representatives), the latter is the total number of distinct fixed-endpoint spectral responses over 720 orderings. A signed, A5-covariant treatment remains necessary.

Next narrowly bounded test: construct the induced sign flips of all 60 proper rotations and check exact K₂ covariance when both the signed six-bit dictionary and the five A4 vacua are transported together.
