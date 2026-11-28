# Golden anchor — exact Hankel criterion and numerical challenge
28 November 2026. Independent exploratory RH formulation; not a closure of the compact arithmetic proof. No schedules changed. Credit prior Li and generalized Li criteria (Sekatskii, arXiv:1304.7895), and the established theory of moment sequences and Xi positivity (Sra, On some positivity properties of the Riemann Xi function). No claim of literature novelty.

Define a=5/4=(phi-1/2)^2, F(z)=xi(1/2+sqrt(a-z)). The functional equation makes F entire, of order 1/2 (at most), with zeros r_j=a-(rho_j-1/2)^2, indexed by one representative of each reflection pair rho,1-rho with multiplicity. The upper-half-plane representatives suffice, using absence of real nontrivial zeros. F(0)=xi(phi)>0. By genus-zero factorization and sum_j |r_j|^-1<infty,
 F(z)/F(0)=product_j(1-z/r_j),
 m_k=-k [z^k] log F(z)=sum_j r_j^-k (k>=1).
Let H_N=(m_(i+j+1)) for i,j=0,...,N-1. RH iff H_N is positive definite for all N (equivalently all leading determinants strictly positive). Proof forward: x_j=1/r_j>0 under RH, so H_N is the moment Gram matrix of sum_j x_j delta_(x_j); infinitely many distinct nodes imply strict positivity. Converse: the Hamburger moment theorem applied to s_n=m_(n+1) gives a positive real measure nu. Analyticity near zero gives |s_n|<=C R^n; the even moments force support in [-R,R], since any positive mass beyond R+epsilon would violate the bound as n grows. Thus sum s_n z^n = integral (1-zx)^-1 dnu(x) extends analytically off the real axis. The same series is -F'(z)/F(z), a meromorphic function, whose poles at every zero r_j have nonzero residues (minus multiplicities). The identity theorem on each half-plane with discrete poles removed forces all r_j real. Since Im(r_j)=-2(Re rho_j-1/2) Im rho_j and Im rho_j !=0, RH follows. No positivity assumption is hidden except the criterion itself. Anchor a can be replaced by many positive real choices; phi is not demonstrated necessary.

## Actual numeric tests (100-digit working precision, CPython mpmath)
```python
import mpmath as mp
mp.mp.dps=100
a=mp.mpf(5)/4
def xi(s):
    return s*(s-1)/2*mp.pi**(-s/2)*mp.gamma(s/2)*mp.zeta(s)
co=mp.taylor(lambda z: mp.log(xi(mp.mpf('.5')+mp.sqrt(a-z))),0,12)
m=[-k*co[k] for k in range(1,13)]
for n in range(1,7):
    H=mp.matrix([[m[i+j] for j in range(n)] for i in range(n)])
    H1=mp.matrix([[m[i+j+1] for j in range(n)] for i in range(n)])
    print(n,mp.nstr(mp.det(H),9),mp.nstr(mp.det(H1),9))
```
Output:
1 0.0230587514 3.68152475e-5
2 1.91246346e-9 3.74332002e-15
3 2.08124906e-22 2.94801444e-31
4 1.09696683e-41 8.47491272e-54
5 1.76971753e-67 6.97138421e-83
6 7.05390968e-100 1.05909144e-118
These are approximate signs, not interval-certified; no RH assumption in xi evaluation. Six leading Hankel and six shifted Hankel determinants positive.

## Exact negative control
Synthetic (not actual zeta zeros) reflection-symmetric set with upper-half-plane zeros 1/2+14i and 1/2 +/- 1/4+30i, together with their conjugates. Nodes v=4/789 and w=(230704+3840i)/207965161 and conjugate w. |w|/v approx 0.21885 <1/2, so all scalar m_k=v^k+2Re(w^k)>0 for all k, despite off-line zeros. The 3x3 Hankel determinant is strictly negative by Vandermonde: v|w|²(v-w)^2(v-conj w)^2(w-conj w)^2<0. Executed SymPy exact sign checks for N=1,2,3: +,+,-; approx determinants 0.00728838780219, 1.76442263141e-10, -2.09379930940e-27. This disproves relying on scalar coefficient positivity alone for general reflection-symmetric spectra.

RESUME: derive positivity of all H_N using actual theta/Euler arithmetic, not assume RH or positive spectral nodes. Consider explicit bounds on the negative part of a finite Hankel quadratic form using the original arithmetic prime-error inequality as a possible bridge. No all-order proof, no native Lean replay, no implication that the existing compact bottleneck is solved. No worker reallocations.