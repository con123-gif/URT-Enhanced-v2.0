# A395110: boundary-three rigidity and saturated row maxima; new duplicate gate

28 November 2026. Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). Two complete analytical structural theorems for the upper-Laplacian-two variant. Neither is the full counting conjecture, a Lean certificate, or an original accepted solution. No priority claim.

## Source / prior scope

Read current join.txt (live), current upstream tools/oma.sh, AGENTS.md, current campaign ledger blob 2add1e4339932afa79bd58cea1a7d927925c4c8a and VERIFIED_PROOFS.json blob d8dd0a5cc0042a5c60be0491d0a4b5e98fab330b (37 records; legacy candidate scalar 36 excludes a known prior). Primary OEIS mirror A395110 blob 07775ef737ff8019e84fd9e6868645e4ea660602, revision 55, and indexed OEIS page read. Direct OEIS page returned 403. Source author Giedrius Alkauskas already gives the lower bound and symmetric examples; the separate infinite-grid reference is Levine–Pegden–Smart 2017. No exhaustive source-history or literature claim. Read the prior HOURLY_0024 height, HOURLY_0224 rim-two, and HOURLY_0324 min-bilinear-envelope proofs. All below concerns the COMMENT conjecture with Laplacian <=2, not the main <=3 counting sequence. Current exact-ID all-state PR search for A395110 had no hit.

## Theorem 1 (all rectangular dimensions, rim maximum exactly three)

Let f be integer on the interior of an m by n rectangle, zero on the exterior, with 0<=Lf<=2, L=4 minus the four neighbors. Let B be the maximum on its outermost interior rim. If B=3, then:

1. Both dimensions are at least six; every noncorner rim site is 2 or 3, and every strictly off-rim site is at least 3.
2. Each corner has value 1 or 2. A corner of value 1 has both adjacent noncorner edge values 2. A corner of value 2 has both adjacent noncorner edge values 3.
3. On an edge of length l, the sites in positions 3,...,l-2 are constant, either all 2 or all 3. If they are 2, both endpoint corners are 1 and every noncorner edge site is 2. If they are 3, the first/last noncorner values are prescribed by the respective corner values as in (2).
4. There are at most 46 possible complete rim patterns, uniformly in the dimensions. This is an upper bound on patterns, NOT a claim that all 46 occur. In particular the further statement that all corners are 1 and all four edges have the high central plateau is NOT proved.

Proof. Maximum principle gives f>=0 and, since nonzero, f>=1 throughout the interior. The previous sharp row/column maxima bound gives B<=floor(min(m,n)/2), so dimensions >=6. Corner value 3 is impossible: two exterior zero neighbors and two rim neighbors <=3 imply Lf>=6. If an off-rim site has value1, its four positive interior neighbors must equal1. Propagating through the connected strictly off-rim rectangle makes all its sites and all noncorner rim neighbors 1; no corner can then exceed1 by Lf<=2. Hence all off-rim sites are >=2.

If a noncorner rim site equals1, its inward neighbor >=2 and its two along-edge neighbors >=1 force both along-edge neighbors to be1 and the inward neighbor to be2. Propagate to obtain a whole edge of ones, including its corners, with all inward neighbors of its noncorner sites equal2. Rotate so this is the top edge. At its left corner, suppose the adjacent side's first noncorner a=f(2,1) is >=2. Put b=f(3,1). At a, Lf<=2 and neighbors 1,b,2,0 give 4a<=5+b<=8, hence a=2 and b=3. At inner corner f(2,2)=2, the top, left and right neighbors are 1,2,2, so the downward neighbor c=f(3,2)<=3 by Lf>=0. But at b=3 its nonzero neighbors are a=2, c<=3, and f(4,1)<=3, so Lf>=4, contradiction. The same holds at the right corner; adjacent sides must have their first noncorner equal1 and thus are entirely1. Iterate around the rectangle to contradict B=3. Therefore all noncorner rim values >=2. If an off-rim site equals2, all its neighbors are >=2, forcing all equal2. Propagation again forces all off-rim and noncorner rim sites2; corners <=2; contradiction. Thus all off-rim sites >=3.

At a corner with value1, Lf>=0 forces the adjacent noncorner values to sum to <=4, so both equal2. At a corner with value2, Lf<=2 forces that sum >=6, so both equal3. Consider neighboring noncorner edge values 2 and 3, where the 2 is not immediately adjacent to a corner. Let x be the inward neighbor of the 2 and y that of the 3. The other along-edge neighbor of the 2 is >=2, so x<=8-2-3=3; hence x=3. At the 3, the other along-edge neighbor is <=3 and Lf<=2 gives y>=12-2-2-3=5. At x the other two neighbors, aside from rim value2 and y, are strictly off-rim and >=3. Their sum with the first two is >=13>4x, contradiction. Thus transitions can only occur at a low endpoint of a noncorner edge next to a corner. Its corner must be1. This gives the uniform middle block, and if that block is low, the endpoint values must be low too. This proves (1)–(3).

For the count bound, regard the four corners as vertices of a cycle, and the four edges as low/high choices. Each corner of value2 forces both incident edges high. With no such corners there are 2^4-1=15 nonempty high subsets (B=3). With one there are 4*2^2=16 possibilities; with two adjacent 4*2=8; with two opposite 2; with three 4; with four 1. Sum 46. Nothing here rules out all the extra patterns, so it does not yet classify full rim-three grids.

## Theorem 2 (saturated even row profile and forced central cross)

On a 2k by n rectangle, let H_i=max_j f(i,j), H_0=H_(2k+1)=0. If H_1=k, then H_i=i(2k+1-i)/2 for every i. The leftmost maximizing column is the SAME in every row, and the rightmost maximizing column is the SAME in every row, distinct from the leftmost. At these two columns, Lf=2; their immediate outward neighbors are exactly one below H_i (including the zero exterior if applicable).

In a 2k by 2k square, the leftmost/rightmost maximizing columns are k,k+1, and the analogous row indices are k,k+1. The entire central two rows and columns are therefore prescribed by H. For k>=2, the next adjacent row and column on each side are prescribed by H_i-1. This is stronger than just attaining the global triangular height, but is NOT a uniqueness proof for the entire grid.

Proof. From the previous row-max theorem, 2H_i-H_(i-1)-H_(i+1)<=1. Put p_i=H_i-H_(i-1). Then p_1=k and p_i>=k-i+1 for every 1<=i<=2k+1. The lower bounds sum to zero, as do the p_i by the boundary condition; hence equality at every index. Therefore each row's vertical second difference of H is exactly1.

At the leftmost maximizing site j_i in any row the left value is <=H_i-1 and right value <=H_i. Vertical values <=H_(i-1),H_(i+1). Since the lower bound on Lf there is 2, equality is forced separately in all four inequalities. In particular the right site also attains H_i, the left neighbor equals H_i-1, and vertical neighbors, when interior, attain their row maxima. Thus j_(i-1),j_(i+1)<=j_i. Apply the same argument in both directions to each adjacent row pair to obtain equality of all j_i. Reflect horizontally for the rightmost maximizing columns and their exact outward neighbors. Positive H_i and equality ensure distinct maximizing columns.

For the square, at central row k the maximum is T(k), attained only in columns k,k+1 by the sharp column bound. Since there are at least two maximizing columns, these are the two common extremal maximizing columns. Let K_j=max_i f(i,j), then K_k=T(k). The previous slope inequalities at j=k are K_k<=k*p+k(k-1)/2 and K_k<=-(k+1)*p+(k+1)(k+2)/2, p=K_k-K_(k-1). Equality at the maximal height forces p=1 and equality in all slope bounds forward and backward. Consequently K_j=j(2k+1-j)/2, so the column version of the preceding equality argument forces both central rows and their outward neighbors. All claims follow.

## Actual local exact checks

Executed the earlier exact unrestricted interval-propagation enumerator from HOURLY_0324 (no assumed symmetry) for all 100 ordered rectangles of dimensions 1..10. It enumerated 467 admissible arrays. Of these 58 had B=3 and passed the stronger observed rim pattern of all corners1 and high middle blocks on all four sides (not proved in general here). 25 arrays had even m and H_1=m/2; all passed the row alignment, profile, and when square, all central-cross and next-adjacent-line checks.

Reproduction: use solve(m,n) from HOURLY_0324, returning flattened arrays. The actual supplementary test loop was:
```python
from itertools import product
rects=arrays=cap3=sat=0
for m,n in product(range(1,11),repeat=2):
    rects+=1
    for f in solve(m,n):
        arrays+=1
        v=lambda i,j:f[i*n+j]
        rows=[max(f[i*n:(i+1)*n]) for i in range(m)]
        edges=[[v(0,j) for j in range(n)],[v(m-1,j) for j in range(n)],
               [v(i,0) for i in range(m)],[v(i,n-1) for i in range(m)]]
        B=max(map(max,edges))
        if B==3:
            cap3+=1
            assert all(e==[1]+[2]*(len(e)-2)+[1] or
                       e==[1,2]+[3]*(len(e)-4)+[2,1] for e in edges)
            assert min(v(i,j) for i in range(1,m-1) for j in range(1,n-1))>=3
        if m%2==0 and rows[0]==m//2:
            sat+=1;k=m//2
            assert rows==[min(i+1,m-i)*(2*k+1-min(i+1,m-i))//2 for i in range(m)]
            left=[next(j for j in range(n) if v(i,j)==rows[i]) for i in range(m)]
            right=[max(j for j in range(n) if v(i,j)==rows[i]) for i in range(m)]
            assert len(set(left))==len(set(right))==1 and left[0]<right[0]
            if m==n:
                assert left[0]==k-1 and right[0]==k
                for i in range(m):
                    assert v(i,k-1)==v(i,k)==v(k-1,i)==v(k,i)==rows[i]
                    if k>=2:assert v(i,k-2)==v(i,k+1)==v(k-2,i)==v(k+1,i)==rows[i]-1
assert (rects,arrays,cap3,sat)==(100,467,58,25)
```
No extension of the previous finite-range frontier is claimed. These checks are supplementary; the two preceding theorems are deductive.

## Official reconciliation / duplicate gate

Fresh direct GitHub PR metadata: own full PR10139 still open/unmerged; own full13332 merged at 02:12:52 UTC. Four merged/credited formal proofs and five prior recorded checker acceptances. No independently confirmed original accepted open problem in ledger. 37 complete archived pairs, not 37 accepted. Registrations 12868/12808/12938/13174 actually merged respectively 01:12:45,01:03:13,01:22:37,01:53:27. 13431/14443/14393/7223/7625/10062/10398 remain unmerged.

**New duplicate gate:** A372561 now has foreign full PR19800, created 04:20:46 UTC by KoaOkano, open/unmerged, with exactly proofs/oeis-a372561.lean changed. Do not submit our duplicate. No foreign checker acceptance or priority claim. Previous foreign full PRs16995/A181674,17012/A372556,17716/MO430643 remain open. The prior imported verification fixture for A372561 was uploaded but no executed checker was observed; do not assert it passed. Site problem API for A395110 inaccessible via web; no claim was attempted, no lease or desk denial fabricated. Current rules read: hold at most10 owner-wide, 503 fallback conditional on actual outage, no need to use it here. No local Lean or gh executable. No new Lean checks, claims, official notes, proof PRs or acceptances in this round. No changes to other workers, schedules, RH or Cathedral tasks.

RESUME: A395110 remains unsolved. Prove or refute exclusion of the remaining 45 rim-three patterns by global compatibility, not merely finite enumeration. In particular a corner2 with incident high edges is locally compatible on an infinite quadrant (f=3 min(i,j)-1_{i=j}, positive indices with zero axes); a purely local corner argument cannot suffice. Prove a finite-boundary obstruction to that phase. For even saturated rectangles exploit forced row/column alignment and the central cross. For campaign submission monitor the remaining registrations and exact current full-PR/claim/checker gates; do not duplicate PR19800.
