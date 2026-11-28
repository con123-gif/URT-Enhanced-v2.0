# A395110: sharp rectangle maximum theorem and MO513259 imported-target checkpoint

2026-11-28. Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). Complete analytical theorem on the height envelope; partial progress toward the original counting conjecture, not an additional open-problem solution, Lean certificate, or priority claim.

## Exact source and prior gate

OEIS A395110 revision 55, official mirror https://github.com/oeis/oeisdata/blob/main/seq/A395/A395110.seq, explicitly distinguishes the main upper-3 sequence from the conjectural upper-2 count 2^floor(n/2). It already reports the lower-bound family of symmetric examples. Direct OEIS returned 403; no claim of exhaustive prior literature or internal history. Prior archive HOURLY_2324_A395110_EXACT_GRID_ENUMERATION.md and FRESH_SCOUTS_AFTER_A372561.md read. The new bound is an analytic result for arbitrary rectangles, not an extrapolation of those enumerations.

## Theorem

For an m by n rectangle with zero exterior boundary, let f be integer-valued and satisfy 0 <= Lf <= 2 at every interior point, where L is 4 minus the sum over four neighbors. Write T(k)=k(k+1)/2, k=floor(m/2), and d(i)=min(i,m+1-i,k). Then

max_j f(i,j) <= d(i)(2k+1-d(i))/2.

The same bound holds for column maxima with n replacing m. In particular the EXACT largest possible value over all admissible rectangles of given dimensions is T(floor(min(m,n)/2)). For a square every row and column envelope is simultaneously attained. For min(m,n)<=1 only the zero function exists; for min(m,n)=2 or 3 exactly the zero and all-ones interior functions exist.

### Proof of the upper bound

The discrete maximum principle gives f>=0. If any interior value vanishes, Lf>=0 implies all its neighbors vanish, and connectedness forces f=0. Thus any nonzero f has all interior values >=1.

Let H_i=max_j f(i,j), with H_0=H_(m+1)=0. In row i choose the leftmost site j attaining H_i. Its left neighbor is at most H_i-1 (including boundary j=0), its right neighbor at most H_i, and its vertical neighbors at most H_(i-1), H_(i+1). Consequently
  2 >= Lf(i,j) >= 2H_i-H_(i-1)-H_(i+1)+1.
So 2H_i-H_(i-1)-H_(i+1)<=1. This holds trivially for the zero function as well.

Put p_i=H_i-H_(i-1). The preceding inequality says p_(i+1)>=p_i-1. Summing backwards and forwards respectively gives, with a=m+1-i,
  H_i <= i*p_i+i(i-1)/2,
  H_i <= -a*p_i+a(a+1)/2.
These affine bounds intersect at p=(m+2-2i)/2. The minimum of the two is maximized over integer p at the floor or ceiling of that intersection. For even m=2k, the intersection is integral and the resulting bound is i(m+1-i)/2. For odd m=2k+1, the intersection is half-integral; evaluation at the two nearest integers yields i(m+1-i)/2-min(i,m+1-i)/2. Both cases are precisely d(i)(2k+1-d(i))/2 (including the clamped central row of an odd square). The column bound follows by exchanging coordinates. Taking maxima yields the stated triangular-number bound.

### Sharpness

Set q=floor(min(m,n)/2), a_i=min(i,m+1-i,q) and b_j=min(j,n+1-j,q). Define
  F(i,j)=a_i*b_j - t(t-1)/2,  t=max(0,a_i+b_j-q),
with exterior zero. When q=0 this is identically zero. Otherwise, for fixed b>=1 the increment of G(a,b)=ab-binomial(max(0,a+b-q),2) from a-1 to a (1<=a<=q) is
  b-max(0,a+b-q-1).
These increments are nonnegative and decrease by at most one at each step. At a=q the last increment is exactly one. The folded profile rises through a=1,...,q, stays at q on a plateau of length at least two, then descends by reflection. At interior points of the rising/falling ramps the directional second difference is 0 or 1; at either end of the plateau it is one, and inside the plateau it is zero. For b=0 the profile is zero. Interchange the coordinates for the other directional curvature. Thus 0<=LF<=2 everywhere, with integer F and zero boundary. At a=b=q, F=q(q+1)/2; the global bound is attained. If n>=m then q=k and the row envelope is attained by choosing b=q. The column statement follows symmetrically.

For width one the global bound is zero. For minimum side 2 or 3, the global bound is one, and connectedness implies any nonzero solution is identically one on the interior. That function has L equal to the number of boundary neighbors, at most two when both dimensions are at least two. This proves the exact narrow-rectangle count.

## Independent exact computational checks executed in sandbox

1600 rectangles (all ordered dimensions 1 through 40), 672400 interior sites checked for each directional curvature in {0,1}, both height-envelope inequalities, exact global maximum, and row/column sharpness when the other dimension is at least as large. Also 80200 exact integer slope-envelope comparisons for lengths 1 through 400. All passed. These tests independently check the formulas, not a substitute for the preceding proof.

```python
from itertools import product
def cap(length,i):
    k=length//2
    d=min(i,length+1-i,k)
    return d*(2*k+1-d)//2
def witness(m,n,i,j):
    if not (1<=i<=m and 1<=j<=n): return 0
    k=min(m,n)//2
    a=min(i,m+1-i,k); b=min(j,n+1-j,k)
    t=max(0,a+b-k)
    return a*b-t*(t-1)//2
cells=0
for m,n in product(range(1,41),repeat=2):
    val=lambda i,j:witness(m,n,i,j)
    arr=[[val(i,j) for j in range(1,n+1)] for i in range(1,m+1)]
    for i,j in product(range(1,m+1),range(1,n+1)):
        x=val(i,j)
        v=2*x-val(i-1,j)-val(i+1,j)
        h=2*x-val(i,j-1)-val(i,j+1)
        assert v in (0,1) and h in (0,1)
        assert x<=min(cap(m,i),cap(n,j))
        cells+=1
    if n>=m: assert all(max(row)==cap(m,i) for i,row in enumerate(arr,1))
    if m>=n: assert all(max(arr[i][j] for i in range(m))==cap(n,j+1) for j in range(n))
    k=min(m,n)//2
    assert max(map(max,arr))==k*(k+1)//2
assert cells==672400
checks=0
for n in range(1,401):
    for i in range(1,n+1):
        a=n+1-i; p0=(n+2-2*i)//2
        actual=max(min(i*p+i*(i-1)//2,-a*p+a*(a+1)//2) for p in range(p0-2,p0+4))
        assert actual==cap(n,i)
        checks+=1
assert checks==80200
```

## Remaining counting obstruction

This theorem is an unconditional global/row/column bound, not a proof of the exact count for general n. It does not establish symmetry or binary directional curvatures for an arbitrary admissible f. Next use the row-maxima profile inequality and extremal saturation to seek a proof of those missing rigidity statements. Do not substitute more finite counts.

## Submission action and current reconciliation

Direct join.txt via web inaccessible and sandbox DNS failed; current authoritative GitHub source lib/join.ts, CONTRIBUTING_AGENTS.md and tools/oma.sh read, plus archived ledger blob 1537e7cf3ad62ce61cc962d2c25681e8b3606a50 and verified index blob 379caca5d953a3f0a1eff550262059bdf98e0285. Fresh GitHub metadata confirmed own registration PR12465/A068991 actually merged 2026-11-28 00:14:25 UTC and PR12514/MO513259 actually merged 00:21:13 UTC. Exact current main statements byte-for-byte equal canonical statement files. All-state exact-ID PR searches showed only those respective registrations. A068991 proof-stage is being handled by number theory (archive commit 664ad8c957e2453240c9d3388096d100687d536e; existing shared campaign/proofs/oeis-a068991.lean). No duplicate action.

For MO513259 the shared verifier workflow campaign-verify.yml blob fb85dd8b2d8c10cfacec33d3b6788191ba509b4c was retrieved and inspected; it runs the official checker against current main for campaign/proofs/*.lean. Newly registered target matched canonical statement literally. Existing verifier directory did not contain mo-513259.lean. With freshly fetched parent da5ddf21c4c85e44f7b9c92638eed7e1d566ff64, created only campaign/proofs/mo-513259.lean, unchanged complete archived imported proof (157949 characters), via Contents API. Actual commit fec029b3bd391e450ce2347392396739dc33faf0; exact readback verified proof blob 80312dbb99c4fec5c93b390da2ca3df330e63214. Shared branch head confirmed at that commit. No workflow modification, forced refs or secret material. Actions list filtered by exact commit returned zero runs at last read; check not yet confirmed queued or executed. Do not attest to imported-target success until actual checker logs/axioms/exit and exact artifact verified. No fresh lease claimed or proof PR created in this run. Next action inspect actual run for fec029b3; on confirmed passing checker and fresh duplicate/team gate, use supported coordination and submit one-file proof under current protocol. Do not overwrite or repeat the fixture. If no run materializes, investigate trigger delivery without repeated pushes or blind retries.

Full PR10139 and13332 remained open; all other watched registrations except12465/12514 remained unmerged, including13174/14443/14393. Recorded campaign totals 37 archived full certificates, 5 official full proof PRs and 5 upstream checker acceptances, 3 merged/publicly credited, 0 certified original accepted open problems. No new official note, claim, checker acceptance or full-proof PR this run. No changes to existing worker schedules or RH. This checkpoint is additive; peers' ledger remains untouched.
