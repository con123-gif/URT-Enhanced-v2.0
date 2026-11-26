import New.Selmer.FitTwistsExist
import Lib.Cyclotomic.Voronoi.StickelbergerInteger

/-!
RUN50 compact literature provenance, 26 Nov 2026. HUMAN SOURCE-MATCHED
DERIVATION, native audit PREPARED, no new kernel replay. Mission blob
23f64d503b7d64bb13b9667156b499021038d742 (expanded workload). Source
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude. No URT.
Recent peer commits reviewed: 946448b0, 18aa81b0, 03751400, 284991cd,
de382b26 (shared native audit). Focus on the distinct odd-Sha supplier.
Old CountPAlt/long-pin lane work is archival, not a premise of compact C.

ACTUAL SOURCE LEDGER (static body edges, not elaborated graph):
Lib/Cyclotomic/Voronoi/StickelbergerInteger.lean
  blob 8745d5ed91856758a39027c95fbc0b97087005be:
  smul_bernoulli_mem_lifts, LFunction_neg_nat_eq_zero_iff,
  voronoi_congruence -> exists_isStickelbergerBound.
Lib/Cyclotomic/Kolyvagin/ComponentBound.lean
  blob 61d0f229eda03e81c8d89372f05f7444ca45b09b:
  sum_floorDiff_dvd consumes IsStickelbergerBound;
  nsmul_component_eq_zero and exists_detecting_points_component consume
  the congruence and Artin/Kolyvagin machinery.
Lib/Cyclotomic/OddSha/OddShaBound.lean
  blob 71e1148ba135da7530abe211af57ba8a0d63f195:
  exists_length_shaOdd_le chooses X_e via exists_isStickelbergerBound
  and uses both component suppliers, detecting points and class number.
New/Selmer/FitTwistsExist.lean
  blob da769eba595af2f883eed9b82dbd322a521aea14:
  exists_isFitFamily uses exists_length_shaOdd_le in prime budget sum,
  then denominatorLe_rowBudget; C uses this actual fit-family witness.
New/Selmer/DenominatorBound.lean blob 5889d96fe1a6ad7926e0df09a7d183232f91c534.
New/Endgame/LongForms.lean blob 9eff36cf003ac398fbd24361e80e95a03d0b0e05.
Original graph retained. Reduced human exposition combines first four
Voronoi declarations into the single lemma below; no global native
edge deletion, no new axioms. Do not replace any other consumer.

HUMAN THEOREM (exact original interface and sufficient size):
N>=1, e>=1. There exists one positive integer X <= 2^((N+e+3)^6)
satisfying IsStickelbergerBound N e X, including all primes and all
characteristic-zero domains O with Dirichlet characters of opposite parity.
No prime, coefficient ring, modulus m or character is fixed when X is chosen.

1. Put n=e+1, D=(e+3)!(e+2)N, p(t)=(e+3)!N^(e+2) B_(e+2)(t/N),
b=p'. Bernoulli recurrence gives (j+1)! B_j integral by induction:
multiply (j+1)B_j=-sum_{i<j} binom(j+1,i) B_i by j!.
Thus p is an integer polynomial; b(t)=D N^e B_n(t/N) and
p(t+N)-p(t)=D t^n. This reconstructs the integral polynomial supplier.
For m>=1, f=Nm, S=sum_{0<=t<f} psi(t)t^n and
B=sum_{0<=t<N} psi(t)b(t). Periodicity and telescoping give EXACTLY
 D S = sum_{0<=t<N} psi(t)[p(t+f)-p(t)] = f B (mod f^2).
Use integer polynomial Taylor expansion; no division by f in a quotient.

2. For c=1 mod N, gcd(c,m)=1, write ct=f k_t+r_t, 0<=r_t<f.
Multiplication by c permutes residues mod f and psi(r_t)=psi(t).
The binomial expansion gives
 (c^n-1)S = n c^e f F (mod f^2),
 F=sum_{0<=t<f} floor(ct/f) t^e psi(t).
Combining with step 1 and cancelling f in the characteristic-zero
domain O yields (c^n-1)B = D n c^e F (mod f).
This is the native twisted Voronoi statement, valid even for
imprimitive characters; no norms or estimates before cancellation.

3. G=(Z/N)^*, g(t)=2b(rep(t))+(-1)^e [t=1]+[t=-1],
T_(u,v)=g(v/u), as in source. The vector psi(u) has eigenvalue
 lambda_psi=2B+(-1)^e+psi(-1).
For complex characters the full character basis diagonalizes T.
If psi(-1)=(-1)^e, L(-e,psi)=0 by the functional equation and
use the EXACT normalization:
 L(-e,psi)= -N^e/n sum psi(t) B_n(t/N),
 hence B=-D*n*L(-e,psi).
If psi(-1)=-(-1)^e, L(-e,psi) is nonzero, because the primitive
functional equation relates it to the absolutely convergent nonzero
Euler product at 1+e, and missing imprimitive Euler factors
1-psi_0(p)p^e are nonzero for e>=1. For N=1, the endpoint t=0
can replace t=1 since B_n(0)=B_n(1) for n>=2.
Thus matching parity eigenvalue is 2(-1)^e, opposite parity eigenvalue
is 2B !=0. det T is a nonzero integer. For ANY characteristic-zero
domain O and its opposite-parity psi, multiply T v=lambda v by
adj(T), read coordinate u=1 (psi(1)=1). Then 2B divides det T in O.
This proves uniform divisibility without requiring O to contain every
character or inverting the group order; complex diagonalization is
only used to establish integer det(T)!=0.

4. Let c_1=1+N, c_2=1+2N and
 X=|det T| prod_{i=1,2}(c_i^e-1)(c_i^n-1).
Both factors are positive, gcd(c_1,c_2)=1. For each prime l one
of these c_i is prime to l and its required product divides X.
For any allowed O,psi, opposite parity, choose u in O with X=2B*u.
Multiply step 2 by 2u: (c^n-1)X = 2w F (mod m),
where w=u D n c^e is independent of m. This is EXACTLY the second
conjunct of IsStickelbergerBound, not just a fixed-prime bound.
For size put y=N+e+3>=5, M=D N^e n!<=y^(3e+6).
Bernoulli Fourier series gives |B_n(z)|<=4 n! for 0<=z<=1
(n>=2, zeta(n)<=2), so |g(t)|<=10M. Leibniz bound
|det T|<=phi(N)! (10M)^phi(N)<=y^((3e+9)N).
Each c_i<=y^2 so the extra factors <=y^(8e+4).
Exponent (3e+9)N+8e+4 <=3y^2+17y+4<=y^4 for y>=5.
Since log_2 y<=y, X<=y^(y^4)<=2^(y^5)<=2^(y^6).
Original size bound retained; no optimization needed.

5. ACTUAL CONSUMER: for t>=1 choose X_e above for 0<e<t;
OddShaBound constructs the SINGLE integer
 H=h_E * prod_{0<e<t} [16 phi(N) X_e^2]^(N+t+3)^20.
It is nonzero and bounded by 2^(4(N+t+3)^27) h_E.
This last estimate follows directly: y=N+t+3>=5,
X_e<=2^(y^6), phi(N)<=y, log2(16 phi(N))<=4+y;
log2(H/h_E)<=t*y^20*(2*y^6+4+y)<=4*y^27.
For t=0 or 1 the product is empty. This is the same native budget
supplier, not an assertion that H annihilates Sha without the
remaining component/detection and local-condition argument.
At e=0 the source uses unramified class field theory separately.
All-prime small-prime cases, including l=2, are RETAINED.

PROVENANCE:
NIST DLMF 24.4.1, 24.4 derivative, 24.5 recurrence,
24.8.1-3 Fourier (https://dlmf.nist.gov/24.4,
https://dlmf.nist.gov/24.5, https://dlmf.nist.gov/24.8);
25.15.4-5 primitive/imprimitive and functional equation
(https://dlmf.nist.gov/25.15). Standard Hurwitz special value
zeta(1-n,x)=-B_n(x)/n (DLMF 25.11).
No RH input. The source declares these as lemmas with actual bodies,
not bare axioms; transitive axiom audit still requested below.
REFERENCES.md blob bc5207de20acf124d1f70c078a5157be639089b1 reports
only 57 citations directly compared with confirmed location; its
bibliography is not a blanket proof verification.
Rubin, Kolyvagin's System of Gauss Sums, 1991, pp309-324,
https://doi.org/10.1007/978-1-4612-0457-2_14, publisher abstract checked:
class group result, NOT authentication of the exact twisted
cocycle/finite-level all-prime statement. Coates-Sinnott, Rubin
Euler Systems III.4.6, Greither Thm 3.2 are native related references,
not accepted substitutes for the formal component proofs. No claim
that their exact hypotheses were independently compared this run.

EXECUTION: local Python/SymPy (not Lean), exact integer diagnostics:
72 determinant/size cases, 768 polynomial telescoping congruences,
2280 reindexing and applicable opposite-parity bound congruences.
Reproduce with N=1..12,e=1..6,m=1..8,c=1+kN,k=1..4,gcd(c,m)=1,
principal character and Legendre character for odd prime N. Set p,b,T,X
as above; assert det nonzero, X.bit_length()<=y^6, and congruences
in steps 1,2,4 modulo f^2,f^2,m respectively. These finite checks
are diagnostic only, not the uniform proof. No Lean/Lake locally.
Old native engines were on different source/toolchain; no attempt to
claim their prior CI verifies this compact module. The following
audit commands are prepared for the single shared compact runner,
not an independent formalization of the human proof and not a
replacement of upstream theorem bodies. No new CI PASS.
RESUME HERE: translate sum_floorDiff_dvd, artin_law_component,
nsmul_component_eq_zero and exists_detecting_points_component as one
connected cluster with the exact finite-level and coefficient-ring
guards; then the character averaging and e=0/class-number argument
in exists_length_shaOdd_le. Do not optimize the sufficient constants.
HANDOFF TO: integration/editor and mathematics C; use steps 1-5 as
the explicit Stickelberger supplier and preserve the remaining
Kolyvagin and class-field steps. Kernel lane: run these axiom checks
on compact pin in existing shared replay when available.
-/

#check smul_bernoulli_mem_lifts
#check LFunction_neg_nat_eq_zero_iff
#check voronoi_congruence
#check exists_isStickelbergerBound
#check sum_floorDiff_dvd
#check nsmul_component_eq_zero
#check exists_detecting_points_component
#check exists_length_shaOdd_le
#check exists_isFitFamily

#print axioms exists_isStickelbergerBound
#print axioms sum_floorDiff_dvd
#print axioms nsmul_component_eq_zero
#print axioms exists_detecting_points_component
#print axioms exists_length_shaOdd_le
#print axioms exists_isFitFamily

example (N e : ℕ) [NeZero N] (he : e ≠ 0) :
    ∃ X ≠ 0, X ≤ 2 ^ (N + e + 3) ^ 6 ∧ IsStickelbergerBound N e X :=
  exists_isStickelbergerBound N e he
