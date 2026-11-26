import New.Curve.ConjugatesOfJets
import Mathlib.Tactic

/-!
# RUN62 — the general-length frame used by A and C
26 November 2026. Human source-matched derivation; independent audit pending.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Pinned lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 9f4a2272265e847b3a46422b02d4b37e976bee10; prior RUN61 b025feef.
Latest peer results c4a32d99 (Galois), 44a5d463 (theta moving vacuum),
ce737b23 (finite Weil law), ac8374d8 (gauge), 5a6ce275 (marked charge).
Do not duplicate their moving-vacuum work; close the actual frame supplier.
Source paths relative to grh-compact/src:
New/Curve/TightFrameExists.lean 4f2e76afa45ba54fe9040704b505b2da1865f2b4
New/Curve/ConjugatesOfJets.lean 8b841d76bb938d8a18fd4341aa832a20b13dd9e0
New/Data/WeilDataOfE.lean 8baa0621fbd228428a1226da1a8e98aa1251740d
New/Curve/PeriodDefs.lean 7dcfa329642087071f8bc9f1976e004eb7fb20ef
New/Curve/FrameSections.lean 6bc331571971534045115e265473cfa148de9f14
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547

## 1. Cyclotomic different factor — exact polynomial derivation
For N>1, prime l|N, write N=l^a M with a>=1, l not dividing M,
r=N/l. Work in the native domain of characteristic zero containing
the primitive root zeta. Set alpha0=zeta^(l^(a-1)), beta=zeta^(l^a).
The standard cyclotomic product identities give
 Phi_N(X) Phi_M(X^(l^(a-1)))=Phi_M(X^(l^a)).
Differentiate and evaluate at zeta (Phi_N(zeta)=0). Then
 Phi_N'(zeta) Phi_M(alpha0)=l^a zeta^(l^a-1) Phi_M'(beta).
Because alpha0 has order lM, alpha0^M=zeta^r, and
 X^M-1=Phi_M(X) Q_M(X) with Q_M integral, multiplication by Q_M(alpha0)
gives
 Phi_N'(zeta)(zeta^r-1) M=N V,
 V=zeta^(l^a-1) Phi_M'(beta) Q_M(alpha0).
This also proves V integral for algebraic integer zeta. To prove V|M,
note X^N-1=(X^r-1) Phi_N(X) H(X) with H integral: the factors
are disjoint in the cyclotomic factorization since N does not divide r.
Differentiate at zeta to get N zeta^(-1)=
 (zeta^r-1) Phi_N'(zeta) H(zeta).
Multiply by M, substitute the identity, cancel N in the domain:
 M=V H(zeta) zeta. Thus V divides M with no inversion of the
different. M<=N and its prime divisors are exactly those of N
other than l. This is Parameters.exists_cyclotomic_different_factor.
The polynomial identities follow from the divisor factorization of
X^N-1; they hold over Z then by base change.

## 2. One common quadratic congruence and integral block
In the native parameters write N=N1, n=(d+1)/4, c0=(1+sqrt(-d))/2.
Use c0+bar(c0)=1, c0 bar(c0)=n, n+2<=d,
and every prime divisor of N divides n (dvd_norm_c0).
Consequently N|n^N. In Z/N the map z -> nz^2+z is injective:
its difference at z,w is (z-w)(1+n(z+w)); the second factor is a
unit since n is nilpotent (finite geometric inverse).
A finite injective self-map is onto. Choose 0<=z<N with
 nz^2+z+1=N e. Put t=1-c0+nz.
Then exactly t+bar(t)=1+2nz and t bar(t)=nNe.
In particular, N divides c0^N t in O_E: the polynomial difference
 c0^N-(-nz)^N is divisible by c0+nz=bar(t), and N divides n^N.
Multiply the polynomial divisibility by t and substitute t bar(t)=nNe.
This avoids any assumption that c0 is a global unit.

For each l|N let a_l=zeta^r, D=Phi_N'(zeta), T_l=t M_l/N.
Use the actual vectors indexed by j<r, k,i<l:
 u_l(j,k,i)=zeta^j (1_(k=0) a_l^i + T_l (a_l^i-a_l^k)).
For all i,k the difference a_l^i-a_l^k is divisible by a_l-1
in O_E (difference of finite geometric sums). At a finite place
containing c0 the native idele alpha equals 1/D.
Then D*T_l*(a_l-1)=t V_l is integral by section 1, hence
D*u_l is integral. At a place not containing c0, c0^N is a local
unit and N|c0^N t implies t/N is locally integral; hence u_l
is locally integral there. Thus u_l belongs to alpha O_hat everywhere.
For powers of zeta this same assertion follows from alpha^-1 integral.
This is precisely the finiteImage condition in IsTightFrame, not
global integrality of every u_l.

## 3. Exact block Gram calculation
Let sigma,tau be the embeddings over K; a= sigma(a_l),
b=tau(a_l), T=T_l (the same scalar under both embeddings).
They fix K and commute with conjugation. Both a,b are primitive
l-th roots. Write
 S=sum_i a^i bar(b)^i = l * 1_(a=b).
For the inner block, expand
 ((1_(k=0)+T)a^i - T a^k)
 ((1_(k=0)+bar(T))bar(b)^i - bar(T)bar(b)^k).
Each cross term vanishes after summing i, since sum_i a^i and
sum_i bar(b)^i vanish. Summing k of the first remaining coefficient
gives 1+T+bar(T)+l T bar(T). The second remaining term contributes
l T bar(T) S. Thus the sum over i,k is exactly
 S (1+T+bar(T)+2l T bar(T)).
The outer j sum is sum_(j<r) (sigma(zeta)/tau(zeta))^j.
If a!=b, S=0. If a=b, the ratio is an r-th root of unity,
so the sum is zero unless sigma(zeta)=tau(zeta); equality implies
sigma=tau because E=K(zeta). On the diagonal the sum is r.
Consequently the entire block has Gram c_l I, where
 c_l=N [1+T+bar(T)+2l |T|^2]
     =N+M_l(1+2n(z+l M_l e)).
This is the native c_l, with no norm bound or estimated
orthogonality. Let c=sum_l c_l. The ordinary zeta powers
have Gram N I by the same geometric series identity.

## 4. Every large length, with a distinguished p-unit
For each rational prime p|N, c mod p equals M_p mod p:
N and n vanish mod p, and M_l is divisible by p for l!=p.
M_p is not divisible by p. Thus gcd(c,N)=1.
The coarse native threshold is sufficient: since z<N,
e=(nz^2+z+1)/N <= nN+1, M_l<=N, l M_l<=N,
c_l<=2N+4nN^2+2n^2N^3. There are at most N prime factors, so
c<=2N^2(1+nN)^2 <=2d^2 N^4 (n+2<=d, N>=2).
Hence c+N <= (dN)^6 and (N-1)(c-1)<=Nc<=(dN)^6.
For the native m >= (dN)^6 (R+1), subtract R(c+N) to get
m' >= (N-1)(c-1). Choose A in [0,N-1] with Ac congruent
to m' modulo N. Then m'-Ac >= -(N-1); it is a multiple
of N, hence nonnegative. B=(m'-Ac)/N is a natural number.
Give each u-vector multiplicity A+R, each ordinary zeta power
multiplicity B+R. Their Gram is (A+R)c+(B+R)N=m, with every
multiplicity >=R. (The native indices allow zero multiplicities.)
This is the exact same combined frame, not a frame whose length
only approaches m.

For the distinguished vector fix the given embedding iota into C_p.
Use the actual norm_iota_periodFactor formula:
 |iota(s1)| = |alpha_w|^(-1), w from x -> iota(tau(bar x)).
Its proof in source uses the vacuumRoot f-th power, CM period unit,
the absolute-value splitting-character identity, and equal
valuations of conjugates of D. Retain those facts, including
the latter different-ideal invariance from WeilDataOfE.
If |iota(s1)|=1 take the ordinary vector 1. Otherwise the formula
forces c0 in every corresponding w (all tau restrict to the same
embedding of K), and p|N since D divides N. In that block take
j=0,k=1,i=0, which is admissible since l=p>=2 and r>=1.
Then u=T_p(1-a_p) and D u=-t V_p. At every w above this
embedding, t=1-c0+nz is 1 mod w because p|n; V_p is a unit
since V_p|M_p and p does not divide M_p. Thus
 |iota(s1 conj(Phi_tau(u)))| = |D u|_w=1 for EVERY tau.
This proves the actual all-places unit clause, not separate choices
of a frame vector at each place.

## Actual callers and scope
Parameters.exists_isTightFrame now has a human construction at
its original quantifiers m,R,p,iota,s, using the native norm
periodFactor facts and standard cyclotomic polynomial identities.
RUN61's norm_jetSeries_le chooses M=p(dN)^6+1, m=M^2,R=0;
substitute that value into the proved construction, preserving
the single p-unit M and the SAME frame. FrameSections then
provides the theta product and vacuum expansion, as reconstructed
in RUN61. The marked local Hecke caller Data.IsGoodDatum.mem_raises
still requires its Schur-jet and arithmetic mark hypotheses.
The distinguished all-place unit clause is also needed in the
six/twelve-copy coefficient chain (RUN52–54); it is independent
of the later choices of coefficient indices. No new assumption
on the characters, and no import of the RH root.

Graph (static, source-context):
original: norm_jetSeries_le -> exists_isTightFrame -> cyclotomic
different factor, zeta frame, congruence permutation, local
integrality, block Gram, length arithmetic, periodFactor unit.
reduced human: polynomial factorization -> D(a_l-1)M_l=N V_l,
V_l|M_l; quadratic congruence -> t bar(t)=nNe; together yield
local integrality + common unit; exact Gram + coprime lengths
-> arbitrary m -> actual frame caller. All source graphs preserved.
Remaining leaves: native periodFactor formula, CM/splitting character
identifications and theta-space bridge; peer moving vacuum and finite
Weil proofs need separate integration and audit. No global native
edge deletion claimed. Cache key pin,P,s,N,d,m,R,p,iota,tau.

Local command -v lean/lake/elan returned no executables. Prepared
small executable algebra certificates below, not compiled. Checked
actual CI receipt 45803534769 (state blob a56e2d3afb99ed8275e81fd63c8494306e57c43f):
workflow jobs completed, but target status error / partial replay
(JetExponentBound timed out; previous six checks only).
No new PASS, no synthetic diagnostics. Old-pin rh_prune/rh_auto
not executed on incompatible compact pin. Preserve all axiom evidence.
RESUME HERE: integrate with RUN61 at FrameSections and with
Theorem C's actual p-adic unit input: read JetExponentBound and
its caller, verify the selected vector is the SAME one throughout
the coefficient witness. Review peers 44a5d463 and ce737b23 for
semilinear moving vacuum (do not redo their derivations).
HANDOFF TO integration/editor, theta, formal audit, compact native replay.
Human RH proof incomplete.
-/

namespace CompactCharacterBoxes62

theorem quadratic_cancel (c n z : ℂ) (hc : c * (1-c) = n) :
    (1-c+n*z)*(c+n*z) = n*(n*z^2+z+1) := by
  calc
    (1-c+n*z)*(c+n*z) =
        c*(1-c)+n*z+n^2*z^2 := by ring
    _ = n*(n*z^2+z+1) := by rw [hc]; ring

theorem quadratic_difference (n z w : ℂ) :
    (n*z^2+z)-(n*w^2+w) = (z-w)*(1+n*(z+w)) := by ring

theorem block_diagonal (N M l n z e T U : ℂ)
    (hN : N ≠ 0)
    (h1 : T+U = M/N*(1+2*n*z))
    (h2 : T*U = M^2/N^2*n*N*e) :
    N*(1+T+U+2*l*T*U) = N+M*(1+2*n*(z+l*M*e)) := by
  calc
    N*(1+T+U+2*l*T*U) = N*(1+(T+U)+2*l*(T*U)) := by ring
    _ = _ := by rw [h1,h2]; field_simp [hN] <;> ring

end CompactCharacterBoxes62

#check Parameters.exists_cyclotomic_different_factor
#check Parameters.exists_isTightFrame
#check Parameters.norm_iota_periodFactor
#check Parameters.norm_jetSeries_le
#print axioms Parameters.exists_cyclotomic_different_factor
#print axioms Parameters.exists_isTightFrame
#print axioms Parameters.norm_iota_periodFactor
#print axioms Parameters.norm_jetSeries_le
#print axioms CompactCharacterBoxes62.quadratic_cancel
#print axioms CompactCharacterBoxes62.quadratic_difference
#print axioms CompactCharacterBoxes62.block_diagonal
