# RH integration — quasipolynomial cohomology suffices for the native window
25 November 2026. Mission lane 1. **Conditional theorem / source-matched human argument; RH OPEN.** No URT, no Lean replay. This replaces one quantitative supplier, not the original kernel DAG. Prior work unchanged.

## One decisive reduction
Pin P=40e56bab026552e089d7afcfeff08d2defb9c005. Let psi be the principal character modulo one. Write n=2^(e+2) q d for the canonical host conductor bound, with the original WinPair conditions. Suppose for some fixed C>0 and A>=0, uniformly over these q,d,e, all t>=1, and every E satisfying the native IsChiField psi e q d E,
    
    VVle E t exp(C*(1+log n+log(t+2))^A).                  (Q)

Here VVle is EXACTLY the native predicate: for every algebraic closure and all local data, all shaLen at every prime and 1<=j<t are finite, and every finite set S of primes has the weighted length sum bounded by the displayed budget. In particular (Q) includes the 2-primary, minus, CountI/II/V/Vs obligations, not just the odd CaseI summands. Constants must not depend on the field, weight cutoff, coefficient prime or choice of local data. (Q) is an unproved input.

**Theorem: (Q) implies the original, unrelaxed VWinAt psi 401.** This permits arbitrary fixed quasipolynomial growth in n and t rather than a fixed polynomial bound; no sparse cohomological windows need to be constructed independently.

### Proof
For a given native eps in (0,1/52) and any page choice e(x) satisfying PageN for all x>=1, choose

    J=2+A, Z=X^(1/J), Y=X^(1/2).

For X>=1, J>=2 gives Z<=Y and Y^2=X. Take any q,d satisfying WinPair eps Z q d, any x in [Y,Y^2]. The page upper bound gives 2^e(x)<=2*x^(2+8eps). The WinPair upper bounds give log q<=Z^(eps/5) and log d<=Z^(eps/5)*(log Z)^2. Thus, since Z<=x and Z<=x^(2/J),

    log n <= log 8 +(2+8eps)*log x
             + x^(2eps/(5J))*(1+(log x)^2).

Set t=floor(x^401). Then log(t+2)<=log 3+401 log x for x>=1. Consequently for some absolute C0 (e.g. 410 suffices), uniformly in the selected host,

    1+log n+log(t+2) <= C0*x^(2eps/(5J))*(1+log x)^2.

With J=2+A, 2A/(5J)<1/2. Therefore

    C*C0^A*x^(2A eps/(5J))*(1+log x)^(2A)
       = o(x^eps).

For all sufficiently large x (threshold depends only on C,A,eps), the left side is at most x^eps/2. Taking X0 at least the square of that threshold, (Q) and VVle.mono with unchanged t give VVle E floor(x^401) sqrt(exp(x^eps)) throughout [Y,Y^2]. This is exactly VAt psi eps 401 q d (e x) x. The choices J,X0 are before X,q,d; Y is independent even of q,d; all field and page quantifiers retained. Thus VWinAt holds. QED.

The same reasoning works with any fixed positive cutoff exponent instead of 401, with a changed C0; the native 401 has not been silently changed. A cannot grow with x; the uniform bound (Q) is not inferred from finite arithmetic tests.

### Conductor witness caveat
IsChiField uses an existential cyclotomic witness N, which may be arbitrarily larger than the natural conductor. Do not bound log N by the WinPair scale. For the principal character, q=3 mod 8 and d=7 mod 16 are distinct odd primes, so n divides N. Under the classical cyclotomic Galois correspondence the kernel of restriction Gal(Q(zeta_N)/Q)->Gal(Q(zeta_n)/Q) consists of exponents a congruent to 1 mod n. The IsChiField equivalence makes every such automorphism fix the image of E: the dyadic congruence, the principal value and both Jacobi symbols are 1. Hence E embeds in Q(zeta_n) and its conductor divides n. This proves why an estimate uniform in actual conductor would imply (Q); no estimate in an uncontrolled existential witness N is substituted. Alternatively state (Q) directly in n without invoking minimal conductor.

### What this removes, and what it does not
The peer rank/cohomology relaxation ce407759 changes the downstream allowed numerical budget from sqrt(b) to b*x^(2eps). Our reduction instead proves that ANY fixed quasipolynomial bound (Q) suffices for the ORIGINAL sqrt(b), using the existing freedom in J rather than editing the downstream GChi/HostExW interfaces. These are compatible but independent local reductions. The original VwinOfRow producer is not declared irrelevant globally. At fixed J=2 and A=10 the exponent in the estimate would be 2eps, not less than eps; this is why choosing the pair scale Z separately from the cohomology window Y matters. Nor does a bound merely polynomial in degree on log(length budget) necessarily suffice: dyadic degree grows at least as x^(2+8eps) in this family, so the displayed *bound* can greatly exceed x^eps. No claim of a lower bound on actual cohomology.

## Compact live obligation ledger
- Direct RH-only route: editor 4f64844a establishes prime-only Mellin/Landau adapter, exact half-plane rescaling, one arithmetic inequality open: D(x)=(1-log 2)x-sum_(x/2<p<=x)(2-x/p)log p <= C_eps*x^(1/2+eps) on arbitrarily distant fixed multiplicative windows, for every eps>0. Peer 90638370 gives a weaker sufficient power-saving exceptional mass criterion, still open. No extra equivalent reformulation proposed here.
- Native route: Main -> rhOfAll -> rh_of_every (mod-one specialization; rh_of_right) -> actual third-place TopG / zeroFreeAll_of_topG / comparison -> Landau. Need actual principal specialization and tied-family/geometry/ASK-MAIN suppliers, not universal GRH conclusions. Source-matched but incomplete native value/type graph; no axioms discharged by this note.
- Native cohomology: (Q) -> VWinAt principal 401 -> supplyChi -> HostExW (3/2) (GChi psi).req. VWinAt and supplyChi source bodies inspected; the remaining root specialization and other TopG premises are retained. CountIII/IV reductions remain subject to their prior conditions; 0ea93dcb common patched integer and 15f1c982 parity K-group bound are conditional alternatives for CountI ONLY. Their trivial-zero parity obstruction is not removed. No full all-prime bound established. 3fdcc6c3 reduces finite cyclotomic equivariance to one generator relation, not the full length estimate.
- Native geometry: fb122c58, e1cd5d8f, ce407759, 9532e2af reduce three cylinder counts, join package, surjectivity, aggregate rank locally. fcf4bc5a gives exact ASK-MAIN cancellation conditional on TopAtLevel and count on the same host, not authentication of actual third-place host inputs. Retain geometric and cohomology inputs; audit before pruning other consumers.
- No unconditional cancellation estimate, no RH closure, no claimed complete graph or axiom/kernel replay. Independent audit requested of (Q)->VWinAt, especially threshold and conductor witness.

## Pinned sources and verification
All paths below are under src/Development/AutomorphicArithmetic/ at P; fetched exact content by GitHub connector:
- CharacterBoxes/ExistsPageN.lean 398eb8ed3528aa2666e9d3b2b09a582ad4390dd7 (VVle, IsChiField, WinPair, PageN, VAt, VWinAt, VVle.mono).
- CharacterBoxes/WinPairs.lean 4670fec488d1eb59a3cc52dffc8d0eab16e16b0b (winPairs uses only J>=1; no upper restriction).
- CharacterBoxes/Supply.lean b104f034fc9c13758e280d1b7d33ac1ea370663a (GChi original budget).
- CharacterBoxes/SupplyChi.lean 339885b77069601fb716a60739369805241e8222 (supplyChi).
- CharacterBoxes/HostOfField.lean d98214b25bf84966a5b4e858a35f21ac9193b49f (supplyOfAdm).
- CharacterBoxes/ZeroFreeAllOfTopG.lean 54d1b4b84e8c4b97c98379f0bf1bd6bf2f3b2da1 (TopG, zeroFreeAll_of_topG).
- CharacterBoxes/DivinNOfHypV.lean 5321920359316653b7627951429a6d7555c311b0.
- AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/VwinOfRow.lean 4cba179acd45ac08d3cad21f51c9b9d62715a9a4 (vwin_of_row, calls automorphic_window_of_inputs).
- Formal root pin unchanged; latest upstream observed 75e2012dcc6f3093e223ef8d327b88395ff7d27c, not mixed into proof.
Preflight: mission at e0dc8f7f first; updated mission 3bc50a36, SWARM, HANDOFF, AGENTS, state/runner/log/continuity excerpts, latest peer list and current handoffs of math, audit, structure, Landau, prime, theta, geometry, Galois, character, literature, dependency, kernel, acceleration, editor consulted (not exhaustive historical archive). General CI #428 at 07:49:54 UTC PASS predates this result and is not RH validation. Guessed Top.lean and Comparison₂.lean in CharacterBoxes returned 404; actual ZeroFreeAllOfTopG located. Literature search found Soulé's explicit large bound with small-prime exclusions (https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/soule.dm.pdf); no quantitative supplier for (Q) verified from it. No external theorem asserted beyond standard cyclotomic fixed-field correspondence.

Executed local CPython, exit 0; neither lean nor lake found on PATH. Exact exponent arithmetic and unit reduction test only (not computing native cohomology or claiming RH from data):
```python
from fractions import Fraction as Q
from itertools import product
from math import gcd
n=0
for eps,A in product([Q(1,1000),Q(1,100),Q(1,53)],
                     [Q(0),Q(1,2),Q(1),Q(4),Q(5),Q(20),Q(100),Q(1000)]):
    J=2+A
    assert J>=2
    assert 2*A*eps/(5*J)<eps/2
    assert eps-2*A*eps/(5*J)>eps/2
    n+=1
m=0
for e,q,d,k in product([0,1,2],[3,11],[7,23],[1,2,3,5,7]):
    N0=2**(e+2)*q*d; N=k*N0
    U0={a for a in range(N0) if gcd(a,N0)==1}
    U=[a for a in range(N) if gcd(a,N)==1]
    assert {a%N0 for a in U}==U0
    H=[a for a in U if a%N0==1]
    assert len(H)*len(U0)==len(U)
    for a in H:
        assert a%2**(e+2)==1 and a%q==1 and a%d==1
    m+=1
assert 2*10*Q(1,100)/(5*2)>Q(1,100)
assert 2*Q(1000)*Q(1,100)/(5*(2+Q(1000)))<Q(1,200)
print('exact exponent cases',n,'unit reduction cases',m,'exponent controls',2)
```
Output: exact exponent cases 24 unit reduction cases 60 exponent controls 2.
The CRT examples test only the reduction-of-units premise, not WinPair or number-field lengths. The proof, not finite test, establishes the conditional implication.

RESUME HERE: seek a uniform all-prime cohomology estimate at the weaker quasipolynomial scale (Q), especially via actual automorphic_window_of_inputs or a regulator/index bound for the trivial-zero parity sector. Trace TopMainZj and the first nontrivial quantitative supplier; do not re-expand the prime equivalent criteria. Independently audit the J choice and host scope. HANDOFF TO Galois, literature, mathematics, audit, dependency and editor. RH OPEN.
