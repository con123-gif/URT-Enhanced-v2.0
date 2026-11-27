import Lib.Cyclotomic.OddSha.OddShaBound

/-!
# AUDIT lane 10 — uniform Stickelberger integer, floor-difference and length
2026-11-27. HUMAN SOURCE-MATCHED / PARTIAL, not a kernel pass.
Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Read latest ONE_EQUATION_MISSION blob 9f4a2272265e847b3a46422b02d4b37e976bee10,
SWARM_PROTOCOL, AGENTS, HANDOFF_QUEUE, current HUMAN_PROOF_COMPACT and recent
peer heads through a913c802; resume audit 885b65aa and integration/editor
5ddf30c7/d0a3d115. No URT or physics premise.

Actual source ledger (paths below relative to grh-compact/src):
* Lib/Cyclotomic/Voronoi/StickelbergerInteger.lean 8745d5ed91856758a39027c95fbc0b97087005be:
  smul_bernoulli_mem_lifts, IsStickelbergerBound, LFunction_neg_nat_eq_zero_iff,
  voronoi_congruence, exists_isStickelbergerBound (whole file).
  Prior guessed path Cyclotomic/Stickelberger/StickelbergerInteger.lean returned 404;
  resolved via repository search, not an absent theorem.
* Lib/Cyclotomic/Kolyvagin/ComponentBound.lean 61d0f229eda03e81c8d89372f05f7444ca45b09b:
  sum_floorDiff_dvd lines 337–360; annihilator 362ff; detector 387–452.
* Lib/Cyclotomic/Stickelberger/GaussSums.lean floorDiff definition via search
  (blob in prior audit b242e0965fdabcf6a8dcc3da33511507bf8bd4bf).
* Lib/Cyclotomic/OddSha/OddShaBound.lean 71e1148ba135da7530abe211af57ba8a0d63f195:
  exists_detecting_points_cocycles and exists_length_shaOdd_le (whole file).
* New/Selmer/RibetElement.lean 188eeb68d437bfa58bcc30042d4eee66c2111e18:
  rowBudget 34–37, ribet_columns 122–135 and 204–219.
* New/Selmer/FitTwistsExist.lean da769eba595af2f883eed9b82dbd322a521aea14:
  actual common budget 35–54.

## 1. One nonzero integer, uniform in prime, character and modulus
Let N,e>=1, y=N+e+3, G=(Z/N)^*, d=phi(N). Define the integral polynomial
    p(T)=(e+3)! N^(e+2) B_(e+2)(T/N),
    D=(e+3)! (e+2) N, b=p', M=D N^e (e+1)!.
The Bernoulli recurrence (n+1)T^n=sum_{j<=n} binom(n+1,j) B_j(T)
shows inductively (n+1)! B_n has integral coefficients: for j<n,
n!/(j+1)! is integral. Multiplication by N^n clears powers of N.
The Bernoulli difference and derivative identities give
    p(T+N)-p(T)=D T^(e+1), b(T)=D N^e B_(e+1)(T/N).
This independently supplies the exact integral polynomial, not a
rational polynomial silently reduced modulo m.

For a residue t use its representative 0<=t<N; put
    g(t)=2 b(t)+(-1)^e [t=1 in Z/N]+[t=-1 in Z/N],
    T_(s,t)=g(t/s) for s,t in G.
For any coefficient ring and character chi, the vector v_s=chi(s)
satisfies T v=lambda_chi v by reindexing t=s u, with
    lambda_chi=2 sum_{r<N} chi(r)b(r)+(-1)^e+chi(-1).
The finite complex character basis diagonalizes T. The Hurwitz
zeta negative-integer formula gives
    sum chi(r)b(r)= -D(e+1) L(chi,-e)
also for imprimitive chi. Retain the standard Dirichlet functional
equation/trivial-zero theorem used in source:
L(chi,-e)=0 iff chi(-1)=(-1)^e, e>=1. For imprimitive chi,
the omitted Euler factors at -e are nonzero (absolute value of
chi*(p) p^e >1 at removed nonzero factors). Thus in the even relative
parity lambda=2(-1)^e, and in odd relative parity lambda=-2D(e+1)L
is nonzero. This holds at N=1, including coincident +/-1 indicators.
Consequently det T !=0 as an integer. NO complex embedding of arbitrary
O is required: over any characteristic-zero domain O, the adjugate
identity evaluated on v at s=1 gives det T=lambda_chi times an element
of O (v_1=1). In odd parity lambda=2B where B=sum chi(r)b(r).

Set c0=1+N, c1=1+2N, P(c)=(c^e-1)(c^(e+1)-1) as integers and
    X=|det T| P(c0) P(c1)>0.
For each prime l choose c0 unless l divides it, then choose c1,
since c1=2c0-1. Both are 1 mod N, and P(c) divides X. This is
the FIRST field of IsStickelbergerBound, with uniform integer.
For every odd-relative chi over the actual O, X=2u B for some u in O
by adjugate, sign and extra integer factors, independently of m,c.

Size: for k=e+1>=2 the Fourier series of B_k gives
|B_k(x)|<=2 k! zeta(k)/(2 pi)^k<=4 k! on [0,1]. Thus |b|<=4M,
|g|<=8M+2<=16M (M>=1), |det T|<=d! (16M)^d.
Since y>=5,
log2 M <= (e+3)log2(e+3)+(e+1)log2(e+1)+log2(e+2)
         +(e+1)log2 N <=4y log2 y<=4y^2.
Hence log2 |det T|<=y(log2 y+4+4y^2)<=5y^3
(using log2 y<=y and y+4<=y^2).
The four positive factors P(c0)P(c1) cost at most
(4e+2)log2(2y)<=4y(y+1)<=5y^2. Therefore
log2 X<=5y^3+5y^2<=y^6. Same original bound, no sharp constants
needed. This establishes the size without a Hadamard normalization.

## 2. Exact Voronoi congruence from polynomial telescoping
Let c>=0, c=1 mod N, gcd(c,m)=1, f=Nm>0, C=c^(e+1)-1
(INTEGER subtraction in O, not Nat truncated subtraction).
Put A_f=sum_{0<=t<f} floor(ct/f) t^e chi(t) and
S_f=sum_{0<=t<f} t^(e+1) chi(t).
The permutation t -> ct mod f preserves chi, and expansion of
(ct-f floor(ct/f))^(e+1) gives
    C S_f = (e+1)c^e f A_f mod f^2 O.
This works in any ring; binomial remainder divisible by f^2.
For our integral p, telescoping with period N gives the exact identity
    D S_f = sum_{r<N} chi(r)[p(r+f)-p(r)].
Taylor expansion for integral polynomial (no factorial division) gives
D S_f=f B+f^2 E for E in O. Multiply the first congruence by D,
substitute the second, cancel f in the characteristic-zero domain O:
    C B = D(e+1)c^e A_f mod f O.
Multiply by 2u, using X=2u B:
    C X = 2w A_f mod m O, w=u D(e+1)c^e.
This w is chosen before m and works for EVERY m>=1 coprime to c.
That is the SECOND field of IsStickelbergerBound. Retain domain and
characteristic zero precisely for cancellation, not in the initial
Voronoi polynomial congruence. c=0 only possible when N=m=1; congruence
mod 1 then vacuous. No assumption of prime-to-N coefficient characteristic.

## 3. sum_floorDiff_dvd: single cancellation and invertible Euler factor
Fix the source odd twist cyc^e psi and e>=1, l prime, n>=1,
a=1 mod N, l prime to a. In O/l^n put L=l^e psi(l),
A_j=sum over [0,N*l^j) floor(a t/(N*l^j)) t^e psi(t),
U_n the same sum restricted to units of Z/(N*l^n), C=(a^(e+1)-1)X.
Exactly A_n=U_n+L A_(n-1): the nonunit terms with gcd(t,N)>1
are zero, and the others divisible by l are t=l s, including the
case l|N (then psi(l)=0). The native character condition gives
(-1)^e psi(-1)=-1. Since N*l^n=0 in quotient, negating unit labels
gives F_n=sum floorDiff(a,t/f) t^e psi(t)=2U_n in the quotient.
Use same w from section 2 at BOTH levels. Multiplication by L lifts
the lower congruence mod l^(n-1) to mod l^n, using e>=1. Subtract
before norms:
    (1-L) C = 2w (A_n-L A_(n-1)) = w F_n.
Since L^n=0, G=1+L+...+L^(n-1) inverts 1-L and
    C = (w G) F_n.
This is precisely the divisibility in sum_floorDiff_dvd. n=0 gives
zero quotient and is trivial. No division by two, also at l=2.
Do not replace F_n=2U_n modulo quotient with equality over Z.
Wrong parity counterexample: N=1, e=2, l=3, n=1, a=2, psi=1.
F_n=0 mod 3 but 2U_n=2 mod 3. A first attempted f=5 control did not
distinguish parity (both zero mod 5); corrected control f=3 does.
Also e>=1 is essential to the lifting and nilpotence argument.
The previous Kolyvagin bottom-class and Artin-annihilator consumers now
have this exact supplier, with no new appeal to RH or uniformity assumption.

## 4. Odd-Sha length, not annihilation alone; actual Ribet budget
Use source notation S=shaOdd(l,E,O,e,n), containing the odd Selmer
cocycles, with E CM in Q(zeta_N), O as actual PadicIntegerRing with
enough roots. For e=0, S injects into Hom(Cl(E),O/l^n) by the retained
unramified Artin reciprocity; decompose finite abelian group into
cyclic factors. Each length at most addVal_O(order), hence bound
addVal_O(h_E). This is distinct from positive e, and handles t=0
vacuously and t=1 without an empty product problem.

For 0<e<t, write X_e from section 1 and Y_e=4 phi(N)*4 X_e^2.
Retain the native character averaging z_psi(x) constructed via the
same chosen lifts s_t and b(s_t,g); it maps to component(l,e,psi,n).
Native hPhi states that vanishing of all odd-relative components
implies 4 phi(N) x=0. Together with component annihilation and linearity,
Y_e kills every x in S; do NOT infer a uniform length from this alone.
Counterexample: (O/l)^k killed by l has unbounded length as k grows.

For small l<=y^2, y=N+t+3, the native
exists_detecting_points_cocycles supplies at most y^20 evaluation
points (retain ray-class generator, Minkowski and cyclotomic restriction
inputs). Therefore S embeds in a product of at most y^20 copies of
(O/l^n)[Y_e], each of length <=addVal_O(Y_e) by the DVR ideal filtration.
For large l>y^2, l>N+e+3 and l does not divide 4 phi(N).
For each odd psi use the previous actual Kolyvagin detector with
v_l(X_e)+1 points gamma_psi,i. The evaluations on all
b(s_t,gamma_psi,i) detect every z_psi, so hPhi plus the unit gives x=0.
The cardinal is at most phi(N)^2*(v_l(X_e)+1)
<=y^2*(y^6+1)<=y^20 (even if some non-odd characters padded).
Use the SAME annihilator Y_e in target, so both regimes give
    length_O S <= y^20 addVal_O(Y_e).
Thus with Xtotal=h_E prod_{0<e<t} Y_e^(y^20), all primes and all n
are paid by ONE positive integer; log2(Xtotal/h_E) <=4y^27, because
log2 Y_e<=4+log2 y+2y^6<=4y^6 and there are <=y twists.
This re-derives the quantitative scalar part of exists_length_shaOdd_le,
retaining native component-averaging, reciprocity and ray-class detection
as explicit hypotheses; no extra local conditions are dropped.

At RibetElement.lean 204–207, the SAME odd bound is used inside
hasTriangleCost_tateTwist together with the relative length inequality,
and e<rankDiff<=D.t, the actual coefficient DVR and roots zeta witness.
It is not a bound on arbitrary crystalline Selmer modules. rowBudget
uses ordinary v_l(Xtotal), after the native normalized-length comparison,
not an unnormalized extension valuation. At FitTwistsExist 38–54, for
ANY finite set of primes T, exact prime factorization gives
    sum_{l in T} v_l(Xtotal) log l <= log Xtotal
    <= 4y^27 log 2+log h_E.
This is the uniform odd-Sha contribution multiplied by D.h2^27 in
the actual rowBudget. The rest of rowBudget (crudeUnit and local loss),
actual relative-length/triangle budgets, character-average and ray-class
proofs, class-number/discriminant and data bounds remain explicit
distinct suppliers. No claim to derive full Ribet or star inequality.

## 5. Evidence and dependency ledger
Original source-visible chain: integral_forms_long -> fit/Ribet ->
exists_length_shaOdd_le -> exists_isStickelbergerBound ->
integral Bernoulli + Fourier/trivial zeros + Voronoi +
adjugate + size; -> component annihilator/detector -> sum_floorDiff_dvd.
Reduced HUMAN chain replaces floor arithmetic by sections 2–3 and uses
finite character diagonalization, direct integral Taylor and elementary
product bound at the same supplier. Retains all genuine premises,
finite-group Fourier, special-value and Dirichlet functional equation
(nonvanishing at 1+e from Euler product), CRT, local DVR, class field
and all prior derivative/detector inputs; no global edge deletion.
Context key compact pin,N,e,actual O,psi,c,m,l,n,E,t,chosen common integer,
detector family and actual Ribet witness. Never mix v_O and v_l.
Original/reduced graph files and axiom evidence unchanged.
Native Lean/Lake absent locally; prepared scalar certificate below
for existing compact runner. No new rh_scan/prune/reduce/auto/frontier
or kernel closure. CI status retrieved 45577239749 (blob b1c96f58)
and 45576756833 (7da35494): old-pin conditional checks pass.
Compact run 45803534769 actual targeted_results.json blob 088cd2ec:
six named checks standard three axioms, module_1_build timeout 124,
all_requested_checks_ok=false, full_RH_replay=false. No new PASS.

Executed exact controls locally with Python/SymPy 1.14.0:
24 integer polynomial shift identities, 24 character eigenvector and
det divisibility checks, 144 Voronoi, 144 uniform congruence, 144 exact
split, 144 final divisor checks, plus wrong-parity negative control.
These are regression tests, not mathematical proof by finite samples.
Reproduction (Python):
    import sympy as s
    from math import gcd,factorial
    x=s.Symbol('x')
    for N,d in [(1,1),(3,-3),(4,-4),(5,5),(8,8),(12,-3)]:
      chi=lambda r:int(s.kronecker_symbol(d,r)) if gcd(r,N)==1 else 0
      units=[r for r in range(N) if gcd(r,N)==1]
      for e in range(1,5):
        D=factorial(e+3)*(e+2)*N
        p=s.Poly(factorial(e+3)*N**(e+2)*s.bernoulli(e+2,x/N),x,domain=s.ZZ)
        b=p.diff()
        assert s.expand(p.as_expr().subs(x,x+N)-p.as_expr()-D*x**(e+1))==0
        g=lambda r:2*int(b.eval(r))+((-1)**e if r==1%N else 0)+(1 if r==(-1)%N else 0)
        T=s.Matrix([[g((t*pow(r,-1,N))%N) for t in units] for r in units])
        v=s.Matrix([chi(r) for r in units]); lam=sum(chi(r)*g(r) for r in units)
        det=int(T.det()); assert det and lam and T*v==lam*v and det%lam==0
        if chi(-1)!=-(-1)**e: continue
        B=sum(chi(r)*int(b.eval(r)) for r in range(N)); assert lam==2*B
        c0,c1=1+N,1+2*N
        X=abs(det)*(c0**e-1)*(c0**(e+1)-1)*(c1**e-1)*(c1**(e+1)-1)
        assert 0<X<=2**((N+e+3)**6)
        for l in [2,3,5,7]:
          c=c0 if gcd(c0,l)==1 else c1
          assert gcd(c,l)==1 and X%((c**e-1)*(c**(e+1)-1))==0
          C=c**(e+1)-1; w=(X//lam)*D*c**e*(e+1)
          A=lambda f:sum((c*r//f)*r**e*chi(r) for r in range(f))
          for n in [1,2,3]:
            f=N*l**n; m=l**n; P=sum(r**(e+1)*chi(r) for r in range(f))
            assert (C*P-(e+1)*c**e*f*A(f))%(f*f)==0
            assert (C*X-2*w*A(f))%m==0
            U=sum(c*r//f*r**e*chi(r) for r in range(f) if gcd(r,f)==1)
            assert A(f)==U+l**e*chi(l)*A(f//l)
            F=sum((c*r//f-c*((-r)%f)//f)*r**e*chi(r) for r in range(f) if gcd(r,f)==1)
            assert (F-2*U)%m==0
            assert (C*X-w*F*pow(1-l**e*chi(l),-1,m))%m==0
    f=3
    U=sum(2*r//f*r*r for r in range(1,f))
    F=sum((2*r//f-2*((-r)%f)//f)*r*r for r in range(1,f))
    assert (F-2*U)%3!=0

RESUME HERE: audit OddShaBound's native hZ/hPhi character averaging
and exists_detecting_points_cocycles at the ray-class restriction,
then actual hasTriangleCost_tateTwist and remaining Ribet row defect.
Do not repeat the Stickelberger congruence/size or detector recursion.
HANDOFF TO integration, Galois, literature, kernel and editor.
AGREE / PARTIAL: source-matched human supplier and uniform scalar length
accounting, not native closure or full human RH proof.
-/

namespace RHCompactAuditStickelberger

-- Quotient-ring core, independent of characteristic, including 2.
theorem floorDivisor {R : Type*} [CommRing R]
    (C L A B F w G : R)
    (hA : C = 2*w*A)
    (hB : L*C = 2*w*L*B)
    (hF : F = 2*(A-L*B))
    (hG : G*(1-L) = 1) : F ∣ C := by
  use w*G
  calc
    C = G*(C-L*C) := by linear_combination -C*hG
    _ = F*(w*G) := by linear_combination G*hA-G*hB-w*G*hF

#print axioms floorDivisor
end RHCompactAuditStickelberger

#check IsStickelbergerBound
#check exists_isStickelbergerBound
#check sum_floorDiff_dvd
#check exists_length_shaOdd_le
#print axioms exists_isStickelbergerBound
#print axioms sum_floorDiff_dvd
#print axioms exists_length_shaOdd_le
