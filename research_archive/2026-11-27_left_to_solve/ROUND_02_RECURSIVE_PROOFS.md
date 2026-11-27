# Left to Solve round 2 — exact recursive mathematics (2026-11-27)

Credit: con123-gif (URT/Newton's Cathedral research); assisted by ChatGPT (GPT-6.2). Separate mathematics track; no Cathedral physics gate or RH worker changes. These are mathematical derivations and executed sandbox checks, not Lean certificates. No novelty/priority claim, external submission or acceptance. The methods use recursive decomposition and binary phase constraints inspired by URT, not an execution of the original pi/e golden-angle controller.

## 1. Gold-grabbing game
Source: https://www.openproblemgarden.org/op/a_gold_grabbing_game
Related known theorem (even trees, first player gets at least half): Deborah and Tyler Seacrest, Grabbing the gold, Discrete Mathematics 312 (2012), 1804–1806, https://www.sciencedirect.com/science/article/pii/S0012365X12000222.

Let V(S) be the optimal score difference for the player about to move on a nonempty remaining connected tree S, and V(empty)=0. Then V(S)=max over vertices v of degree <=1 in S of (g(v)-V(S-v)). Induction on |S| proves exact minimax, and an argmax gives an optimal move. Memoize by remaining vertex set. Exponential worst-case in arbitrary trees; do not claim otherwise.

For a path, V(i,j)=max(w_i-V(i+1,j),w_j-V(i,j-1)), with singleton value w_i. Rolling interval-length arrays give O(n^2) arithmetic and O(n) memory.

For a star with center weight c and m leaf weights, while m>=2 take a largest leaf. Proof: the minimax value is 1-Lipschitz in each vertex weight, by induction using the recurrence (each move either takes the modified vertex, or changes one weight of the continuation). Comparing taking leaves x>=y, the remaining stars differ after relabeling only in one weight by x-y. Thus x-V(rem_x)>=y-V(rem_y). Once m=1, take the larger of the remaining center and leaf. Hence with descending weights a_0,...,a_(m-1), the exact value is sum_{i=0}^{m-2} (-1)^i a_i + (-1)^(m-1)|a_(m-1)-c|; for m=0 it is c. O(n log n) sorting and O(n) evaluation.

For a tree rooted arbitrarily with L original rooted leaves, every remaining connected induced subtree has a unique shallowest vertex r. On each original root-to-leaf path it intersects in an interval starting at r or in the empty set; encode the endpoint or empty symbol. This gives at most n(n+1)^L nonempty states; memoized minimax therefore polynomial for fixed L (e.g. O(n^2(n+1)^L) state/transition operations ignoring mask overhead). This is a conditional complexity result, not a general polynomial bound.

Actual execution: 100 random integer weight vectors for each n=1,...,12, both paths and stars, compared against independent exhaustive minimax: 2400/2400 assertions passed.

## 2. Exact infinite colorings — all c>m for m=3 and 4
Source: https://www.openproblemgarden.org/op/exact_colorings_of_graphs
Known context: Stacey & Weidl (1999), https://doi.org/10.1006/jctb.1998.1855; Ranđelović (2025), https://arxiv.org/abs/2512.04233. These are explicit special cases of Erickson's conjecture; no priority claim.

Partition countably infinite vertices into a finite core and infinite tail. Every infinite induced complete subgraph includes infinitely many tail vertices.

m=3: for c>=4 take a core of c-2 vertices, each with its own distinct color to the tail. All tail-tail edges get one fresh color and all core-core edges get another fresh color. All c colors occur. A subgraph with s core vertices has 1 color if s=0, 2 if s=1, and s+2 if s>=2. Thus exactly 3 is impossible for every c>3.

m=4: for c>=5 let t be the smallest integer with binomial(t,2)>=c-2. Color tail edges with one color and all cross edges with a second. Properly edge-color the core K_t with exactly c-2 other colors. Existence: if t=3 use 3 distinct colors; if t>=4, c-2>binomial(t-1,2) implies c-2>=t. The coloring of edge ij by (i+j) mod t is proper and uses at most t colors. Split color classes until exactly c-2 are used, preserving properness. A subgraph with s core vertices has 1,2,3 colors for s=0,1,2 respectively. If s>=3 it contains a triangle with 3 distinct core colors, hence at least 5 total. So exactly 4 is impossible for every c>4.

## 3. Geodesic Norine conjecture — exact affine single-dependency class in every dimension
Source: https://www.openproblemgarden.org/op/edge_antipodal_colorings_of_cubes
Original path conjecture reported proven by Wu and Yang (2026): https://arxiv.org/abs/2607.19276; stronger geodesic version remains distinct. See https://mathworld.wolfram.com/NorinesAntipodal-ColoringConjecture.html.

Let Q_n have vertices x in F_2^n; color an edge in direction i by c_i(x)=x_{p(i)}+b_i mod 2, p(i)!=i. This is well-defined and antipodal (complementing all coordinates changes the color). We construct a monochromatic antipodal geodesic, indeed of color zero, for arbitrary function p and constants b.

Choose an initial vertex x and total order of coordinate flips. Color zero on flip i is equivalent to x_{p(i)}+b_i+[p(i) precedes i]=0 in F_2. Thus with j=p(i), impose j before i iff x_j+b_i=1. The directed functional graph i->p(i) has one directed cycle per weak component, with trees feeding into it. Choose a numerical total order on each cycle, set x_j=b_i+[j precedes i] for the unique cycle child i of j on that cycle, and choose x_j=0 off cycles. Orient every precedence constraint accordingly. Cycle edges agree with the chosen order, including two-cycles (both constraints agree). Other edges form undirected trees attached to cycles, so they cannot create directed cycles. A topological ordering of all constraints exists. Flipping coordinates in that order yields an all-zero-colored path, flips each coordinate once, and ends at the complement. This is a geodesic of length n. With cycle identification by indegree pruning and topological sort, construction uses O(n) graph operations.

A separate broader conditional affine case: c_i(x)=(Ax)_i+b_i for binary zero-diagonal A with odd row sums. For a prescribed order, let h_i=sum of A_ij over j preceding i. The path of color zero exists iff A x=b+h over F_2. If A is invertible, any order works. Singular general matrices with multiple dependencies are not covered by the proof above.

Actual execution: 100 random p,b choices per n=2,...,32, explicit topological sort and verification of every edge and terminal complement: 3100/3100 assertions passed. No claim about arbitrary edge colorings or all affine matrices; originality not established.

## Reproduction code (Python 3 + NetworkX)
```python
from functools import lru_cache
from random import Random
import networkx as nx
r=Random(27)
def brute(adj,w):
    @lru_cache(None)
    def f(s):
        if not s: return 0
        return max(w[i]-f(s^(1<<i)) for i in range(len(w))
                   if s>>i&1 and (adj[i]&s).bit_count()<=1)
    return f((1<<len(w))-1)
def path(w):
    d=list(w)
    for k in range(2,len(w)+1):
        d=[max(w[i]-d[i+1],w[i+k-1]-d[i]) for i in range(len(w)-k+1)]
    return d[0] if d else 0
def star(c,w):
    a=sorted(w,reverse=True)
    if not a: return c
    return sum((-1)**i*x for i,x in enumerate(a[:-1]))+(-1)**(len(a)-1)*abs(a[-1]-c)
for n in range(1,13):
    for _ in range(100):
        w=[r.randrange(30) for i in range(n)]
        for g,ans in [(nx.path_graph(n),path(w)),(nx.star_graph(n-1),star(w[0],w[1:]))]:
            adj=[sum(1<<j for j in g[i]) for i in range(n)]
            assert brute(adj,w)==ans
print('2400 path/star tests passed')
def geo(p,b):
    n=len(p); g=nx.DiGraph();g.add_nodes_from(range(n));g.add_edges_from((i,p[i]) for i in range(n))
    x=[0]*n
    for cycle in nx.simple_cycles(g):
        for i in cycle:
            j=p[i];x[j]=b[i]^(j<i)
    h=nx.DiGraph();h.add_nodes_from(range(n))
    for i,j in enumerate(p):
        h.add_edge(*((j,i) if x[j]^b[i] else (i,j)))
    order=list(nx.topological_sort(h));y=x.copy()
    for i in order:
        assert y[p[i]]^b[i]==0
        y[i]^=1
    assert y==[1-z for z in x]
    return x,order
for n in range(2,33):
    for _ in range(100):
        p=[r.choice([j for j in range(n) if j!=i]) for i in range(n)]
        b=[r.randrange(2) for i in range(n)]
        geo(p,b)
print('3100 single-dependency affine cube certificates passed')
```

## Other catalogue status checks
Goddyn iterated circumcentres: proven by Ardanuy and independently by Kanda & Koizumi (2024), https://arxiv.org/abs/2407.19767. Erickson multiset iteration: source comments report solved by author in 2011, https://garden.irmacs.sfu.ca/op/a_sequence_defined_on_multisets. Neither claimed as ours. Graham four-prime central binomial problem remains a much harder target; prior published bounds dwarf naive searches, so no new bound claimed.

Resume: investigate general singular affine dependency matrices via exact F2 feasibility across flip orders; if successful, move to nonlinear antipodal constraints. Formalize individual complete cases in Lean after fork and verification access are established.
