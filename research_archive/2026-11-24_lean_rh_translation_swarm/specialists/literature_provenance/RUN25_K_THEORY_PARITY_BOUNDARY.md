# RUN25 — exact all-character K-theory reduction and trivial-zero obstruction
25 Nov 2026. Mission lane 9. Status: SOURCE-MATCHED / human derivation using identified classical theorems; RH OPEN. Not a kernel replay. No URT or physics. Prior RUN24 unchanged.

Continuity: read pinned ONE_EQUATION_MISSION at e0dc8f7faa1e35a5e3210b817b5b34f8d8cf20f1 (blob 4a45e612ebcf84aa6f0e5be8ee1c7b154b20773d), AGENTS, SWARM, HANDOFF_QUEUE, EXPANSION, research state/log/protocol/continuity excerpts and CI summary #427 (general Cathedral CI, not RH). Compare mission commit to current branch: 10 commits ahead at preflight. Read RUN25 Galois one-integer CountI, exact finite class group reduction 0dfa42f3, peer prime-node reverse transfer, power-saving exception audit, Landau pole-window obstruction, prime square mesh, theta positivity, prime-jump energy and acceleration handoffs. The existing 0dfa42f3 reduction concerns intrinsic host Sha at each finite level; below matches the actual native Vlen and aggregates full primary lengths in one fixed finite K-group. No claim of novelty in classical mathematics.

## Result
Let K be the principal host field Q(zeta_(2^(E+2)))^+(sqrt(-q1),sqrt(-d)), with distinct q1,d as in Host, G=Gal(K/Q) of order 2^(E+2), N=2^(E+2)q1d, e>=1. Let l be odd, O the actual native Coef l, c complex conjugation in G. Write T=K_{2e}(O_K) for the finite even Quillen K-group (O_K denotes ring of integers, not the coefficient O). For any finite set L of native CaseI primes, the following is a sufficient CountI budget, derived below:
    sum_{l in L} log(l) sum_{psi in h.X(O_l,e)} Vn(O_l,e,psi)
      <= log |T[odd]^{c=(-1)^e}|.
Every Vlen is finite. More precisely, for each CaseI l, equality of the single-prime normalized sum with v_l(|T_l^{c=(-1)^e}|) holds if O contains all the values of all characters of G. Without this splitting hypothesis the inequality holds. Here T[odd] is the odd-primary subgroup, not T[2].

1. Native Vlen=length_O Chr.V' (strict at all primes dividing lN, unramified cohomological local condition elsewhere). By vLe and prime-to-l order of every G-character, this equals length of Chr.V (strict at l, zero on inertia everywhere). Coefficients QO=O tensor_Zl (Q_l/Z_l), with character psi^-1 times cyclotomic^-e; Vn divides by eO=length_O(O/lO). All exact source definitions below.
2. Let S_K=kernel of restriction to all inertia outside l and to full decomposition at l in H^1(G_K,Q_l/Z_l(-e)). Inflation-restriction, since |G| is a unit on the torsion coefficients, gives the restriction isomorphism from Q with the psi twist to (S_K tensor_Zl O)^{psi}. This also preserves both local conditions in both directions: for each inertia or decomposition subgroup, its intersection with G_K is normal with quotient of order dividing |G|; its H^1 restriction is injective by averaging on the finite quotient. Restriction of psi to G_K is trivial. Untwisted cyclotomic action on S_K includes conjugation on the source and the natural coefficient action. The inverse twist makes invariants exactly the psi eigenspace, not psi^-1. Finite free O over Z_l commutes with these cochain kernels, quotients and simultaneous local restrictions (use a finite basis, so no infinite-product interchange issue).
3. For any psi in native X, the integral idempotent |G|^-1 sum_g psi(g)^-1 g projects onto this eigenspace. Distinct characters have orthogonal idempotents: a nontrivial character takes a nontrivial root of unity of prime-to-l order, whose difference from 1 is a unit, and hence its group sum vanishes. All selected eigenspaces lie in c=(-1)^e. Their sum is direct and exhaustive in that parity if O splits G. For a finite Z_l-module A, length_O(A tensor O)=eO length_Zl A, by decomposing into cyclic l^m groups. Thus the normalized sum equals the length of the selected direct summands and is bounded by length_Zl S_K^{c=(-1)^e}; equality for split O.
4. Poitou–Tate duality identifies S_K^vee with the etale wild kernel in H^2(O_K[1/l],Z_l(e+1)). In particular S_K finite by Quillen–Lichtenbaum and Borel/Quillen finiteness. The unramified-outside-l H^1 description follows by inflation-restriction since cyclotomic coefficients are unramified there. Local Tate duality identifies the local H^2 with the dual of H^0(K_v,Q_l/Z_l(-e)). At an odd l the ramification index of K_v/Q_l is <=2 (dyadic tower unramified at l; at most one quadratic field ramifies). Therefore its mod-l cyclotomic image contains squares. Native CaseI requires l-1 not dividing 2e, so some tame cyclotomic scalar to the -e power is not 1 mod l. Its difference from 1 is invertible, hence local H^0=0 at every v|l. Consequently the wild kernel is the full H^2 in CaseI. The natural pairing is G-equivariant with contragredient on dual; parity signs are self-inverse. The natural etale Chern comparison gives H^2 ≅ T_l (Weibel K-book VI.8.2/8.4, odd l, e>=1). Combining with step 3 proves the stated equality/inequality. The argument without CaseI still yields an upper bound by T_l (wild kernel injects into H^2).
5. Sum over L using unique factorization of the single finite integer |T[odd]^{c=(-1)^e}|. A universal estimate log |T[odd]^{c=(-1)^e}| <= (Nt)^C, e<t, with constant C independent of E,q1,d,e, would directly supply principal CountI (choose fixed auxiliary primes and retain native lower-host restrictions). This estimate has NOT been obtained. Finite-group existence alone does not control its size. No per-l ramification multiplier or coefficient-field degree is missing, because normalization in step 3 is exactly eO.

## Literature audit: why ordinary special-value formulas do not close the bound
The exact sector in the preceding equation is the trivial-zero sector, not the nonvanishing sector:
    psi(-1)=(-1)^e  implies  L(-e,psi^-1)=0  (e>=1).
This follows from the Dirichlet functional equation (or Bernoulli parity); the imprimitive Euler factors cannot remove a zero. For the Stickelberger element theta(1-n) with n=e+1, all these selected components vanish, because nonvanishing requires parity (-1)^n. The group-ring projector P=(1+(-1)^e c)/2 therefore satisfies P theta(-e)=0. An annihilation or Fitting-ideal statement involving the unmodified theta(-e) supplies no nonzero annihilator on P T. The stronger Coates–Sinnott theorem cannot be converted into a length bound by treating the zero as a nonzero algebraic integer. Leading-term/regulator formulas are a different input; no claim they cannot work, but an effective regulator/index estimate with all host and weight quantifiers is needed. Also a nonzero annihilator by itself bounds exponents, not total lengths without a generator bound.

External premise ledger (human use, not source-kernel dependency assertion):
- Inflation-restriction/prime-to-order averaging: classical group cohomology; local injectivity proof above. No new asymptotic premise.
- Poitou–Tate and local Tate duality: classical proved theorems, applicable odd l, finite set S containing l and archimedean primes; compact/discrete duality. Kolster–Movahhedi, Galois co-descent for etale wild kernels and capitulation, Ann. Inst. Fourier 50 (2000), 35–65, DOI https://doi.org/10.5802/aif.1746, introduction defines finite wild kernels; source Formalism/GaloisCohomology/Statement.lean PTSha/TateLocalDualityH2Hypothesis are predicates, not proof bodies.
- Quillen–Lichtenbaum (proved via norm residue theorem): Charles Weibel, K-book (2013), VI.8.2 and VI.8.4, inspected section and page 48 screenshot: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf. Hypotheses totally imaginary K, e>=1, odd l; compare even K-group of ring of integers to etale H^2 after inverting l. The even K-group is finite (Quillen finite generation, Borel rank zero). No uniform order estimate follows.
- Dirichlet parity: NIST DLMF 25.15(ii), https://dlmf.nist.gov/25.15.ii. Exact zero at -e in selected parity, independent of RH.
- Miho Aoki, On the Coates–Sinnott conjecture for CM fields, BLMS 45 (2013), 131–139, DOI https://doi.org/10.1112/blms/bds083. Abstract inspected: finite abelian CM/totally real extension over totally real base, l odd and l prime to [F:F intersect cyclotomic Z_l-extension of base]. Principal host meets degree condition. The result is annihilation, not a uniform group order bound; full paper not retrieved. The projection-zero obstruction above is independent of its proof.
- Victor P. Snaith, Relative K0, Annihilators, Fitting Ideals and Stickelberger Phenomena, Proc. LMS 90 (2005), 545–590, DOI https://doi.org/10.1112/S0024611504015163. Abstract inspected: regulator/leading-term variants when values vanish; no numerical uniform bound authenticated here. Do not insert theorem based on title.
- Soulé, A bound for the torsion in the K-theory of algebraic integers, Doc. Math. Extra Volume Kato (2003), 761–788, https://doi.org/10.4171/DMS/3/21. Abstract explicitly excludes small primes and describes very large bounds in degree/discriminant/weight. Not a verified supplier for required polynomial log order. Emery 2024 https://doi.org/10.1007/s00229-024-01598-4 is specifically imaginary quadratic, not varying-degree host K. Washington fixed-prime result as in 7c4c328c not uniform.
- OPEN: uniform log-order bound above. It is sufficient for CountI only, not for remaining CountII/V/Vs, 2-primary/minus, geometry or RH window. No literature theorem claimed to furnish it.

## Source provenance
Upstream pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005; paths relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/ unless noted:
- HeightAndVanishing/DirichletPrimeToLPartMulLPowerPart.lean blob 1feb420e376868ca41d85fb09bc4f8c7ee66778e: Coef, PsiEven, Vlen, Vn, Host.H, Host.X, mem_X, CaseI, Big.
- CharacterLevelBounds/ShaFamMono.lean f1b517fa7cddda3e25b5a7ba89c1e57096bbf59e: rho, VS, V, V', nrm, dirG, evenSet.
- CharacterLevelBounds/VLe.lean fe84b4080a340b9859c432e1e393bec5f75292bd: actual vLe proof, not an axiom wrapper by name; dependencies not kernel-audited.
- GaloisLibrary/SelmerTransport/ConjStableShaFam.lean 578402a7b2aea9f24d31473aab4486dd43055fb2: QO, eO, shaFam, ShaU.
- HeightAndVanishing/Counts.lean 0d9f87aacf2d53abe43d894c1d822f071599ee57: GD, CountI and CorG predicates.
- ModularityArgument/ThresholdArguments/DenseThresholdCases/LinkedUnlE.lean 01ff1f8cd56f56488e044a35443a8eda3d5d0e3e: actual conditional count_i_of_printed_bound_k_kato_automorphy body; this is a separate classical bypass proposal, not claim of native theorem replacement.
- src/Formalism/GaloisCohomology/Statement.lean 0799e9bcd8aa191ffaa90ab005453a53381bacea: QZ, Sha, VLen, PTSha, TateLocalDualityH2Hypothesis, InfUnram. Hypotheses are propositions; no transitive axiom certification.
Latest observed upstream 75e2012dcc6f3093e223ef8d327b88395ff7d27c (25 Nov 07:24:48Z). Four checked paths changed blobs: DirichletPrimeToLPartMulLPowerPart 41ea99614c52f8920cdb5479198a1fadae8290f3, VLe 25b33306bfb1139d55a3d47eab0e0e4b28c746c1, ShaFamMono 4d0e3e330db74ef0aaaceb7086c8cd2740a568fa, Statement b21197df8bfc788d30cca1e5941230c464eb40d3. Selected declarations remain present; no full equality of bodies claimed. No mixing revisions.

## Actual regression (CPython, exit 0)
Exact generalized Bernoulli checks: selected zeros 24, opposite parity nonzeros 24.
Exact integral projector orthogonality checks: 4080.
These use actual quadratic Dirichlet characters and modular roots of unity. Not computation of actual host K-groups or evidence of RH. The mathematical proof is above; checks catch parity/index mistakes. Reproduce:
```python
from fractions import Fraction as Q
from math import comb
from itertools import product
B=[Q(1)]
for n in range(1,15): B.append(-sum(comb(n+1,k)*B[k] for k in range(n))/Q(n+1))
def bp(n,x): return sum(comb(n,k)*B[k]*x**(n-k) for k in range(n+1))
def leg(a,p): return 0 if a%p==0 else (1 if pow(a%p,(p-1)//2,p)==1 else -1)
count=[0,0]
for f,chi in [(1,lambda a:1),(11,lambda a:leg(a,11)),(19,lambda a:leg(a,19)),(209,lambda a:leg(a,11)*leg(a,19))]:
 for e in range(1,13):
  v=-Q(f**e,e+1)*sum(chi(a)*bp(e+1,Q(a,f)) for a in range(1,f+1))
  same=chi(-1)==(-1)**e
  assert (v==0)==same,(f,e,v)
  count[not same]+=1
print('exact generalized Bernoulli checks: selected zeros',count[0],'opposite parity nonzeros',count[1])
checks=0
for l,d in [(17,4),(17,8),(17,16),(97,32)]:
 for m in (1,2,3):
  q=l**m; phi=(l-1)*l**(m-1)
  z=next(pow(a,phi//d,q) for a in range(2,q) if a%l and pow(pow(a,phi//d,q),d//2,q)!=1)
  assert pow(z,d,q)==1
  for k,j in product(range(d),repeat=2):
   assert sum(pow(z,(k-j)*i%d,q) for i in range(d))%q==(d if k==j else 0); checks+=1
print('exact integral projector orthogonality checks',checks)
```

RESUME HERE: Find a proved quantitative index/regulator estimate for the actual trivial-zero parity component of K_{2e}(O_K), uniform in conductor, dyadic degree and e, or audit the Galois lane's native OneCharU/NumberU route for a genuine quantitative substitute. Do not repeat plain special-value or fixed-l stabilization arguments. HANDOFF TO Galois, mathematics, integration, dependency, formal audit. Ask audit to check equivariant duality, exact eO normalization, and local scalar vanishing. No RH proof or Lean verification.
