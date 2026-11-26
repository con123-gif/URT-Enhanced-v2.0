import Mathlib

/-!
COMPACT RUN52, 2026-11-26. Source-matched human reduction; Lean scalar certificate
PREPARED, not replayed. No original-pin file changed. Mission blob
3731f12ed73e738313fd7f93a30759d9086141e9 migrates to lsernau/grh-lean
72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0 / Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679. Credit Levent Alpöge and collaborators.
Read protocol, handoff, expansion and AGENTS, current peer commits de382b26,
03751400, 4340a55, 284991cd, 05bb424d, e28fed80. No competing graph/build job.

Actual original source path (static selected edges, NOT elaborated graph):
Main.riemannHypothesis -> New.grh -> eventually_primeError_le_rpow ->
exists_data -> exists_three_term_free -> order lower bound and sphere cardinality.
Keep all other edges, including star_inequality, remainder_eq, IsPolar window,
entireL criterion, prime existence, class-group pairs, every scale guard and
A/B/C common family. New/Main.lean blob 198ed5bf26aa294898931e0649bc2b88f1389f65;
New/Data/DataExist.lean blob 634c6a1f88791a3bb770326785b70411e8289b41,
lines 16-33 (sphere), 44-end (exists_data); New/Data/Different.lean
44f64349db3642e89b752cc92979999edac5c185, lines 193-201
(actual modulus 2^(s+1), NOT 2^s); New/Data/AdmissibleData.lean
04208a5044bb7cf6464ef142a14d939148bed834, Data fields scale, three_term.
ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a, remainder_eq
lines 86-110. All paths relative to grh-compact/src.

Human proof of a simpler thick-place construction, replacing only that
part of exists_data. Fix Parameters P, epsilon in (0,1/100), then n>22/epsilon,
n>=3 (the native n chosen for prime existence is already larger). For every
large x, take the native m=2^(o+1) in [sqrt x,2 sqrt x] and s=22(o+1).
Set S=2^s=m^22 in [x^11,2^22 x^11], hence s=O(log x).
Let C=3^(floor(log_3 s)+5) <=243s, Q=P.N0*C, v=v2(P.N0)>=4,
B=2^(v-1), L=324s. All P-dependent constants and n fixed BEFORE x.
The native group map is placeClass for divisor 2^(s+1), g=placeOfInt(s,Q+1),
c0=placeOfInt(s,-1). Q+1 is coprime to N1 (Q includes every prime divisor);
placeClass_placeOfInt identifies its image with 1+Q modulo 2^(s+1).
All primes in Q are already in N1 and Q divides N1. The exact order is
 O=ord(phi(g))=2^max(s+1-v,0).
Proof: v2(Q)=v as C odd. Induct on j using
 (1+Q)^(2^(j+1))-1 = ((1+Q)^(2^j)-1)((1+Q)^(2^j)+1).
The second factor is 2 mod 4, hence its valuation is 1; first has
valuation v+j. The group of units modulo 2^(s+1) has power-of-two order;
the smallest j with v+j>=s+1 gives the exact order. Thus O=S/B for
large s. No asymptotic prime theorem is used in this order argument.

Instead of native power-of-two digit selection, let M=floor(O^(1/n)/L).
For all sufficiently large x, O^(1/n)/L>=2, so
 O^(1/n)/(2L) <= M <= O^(1/n)/L.
The existing exists_three_term_free accepts ANY natural M, not only a
power of 2. Hence (LM)^n<=O and it returns one T with
 #T >= M^(n-2)/n >= O^(1-2/n)/(n*(2L)^(n-2)).
Each member is c0*g^e, so has class -1 modulo Q and every divisor of Q;
same T satisfies the native three_term condition. The sphere argument:
base LM encoding is injective on digit vectors and on the two weighted
vectors in the relation j b=i c+(j-i)a (no carry; digits <LM).
All vectors on the same sphere; squared-norm identity gives
 i(j-i)||c-a||^2=0, hence a=b=c. This is the same actual native
exists_three_term_free, not a new independent hypothesis.

Divide the native towerDeg=C*S by #T:
 C*S/#T <= n*C*B^(1-2/n)*(2L)^(n-2)*S^(2/n)
         = O_P,n((log x)^(n-1)*x^(22/n)) = o(x^epsilon).
Consequently #T>=towerDeg/log b for every sufficiently large x,
since log b=x^epsilon. All quantifiers are eventual atTop for fixed P,
epsilon,n. This is a self-contained replacement of only the thick-place
size/construction argument. It preserves the full prime-existence and
class-group witnesses; no dependence on x1 is introduced. All other
Data fields are unchanged. This avoids using W=x^(epsilon/6) to round
the digit base, or the growing Q factor in the order lower bound; W
remains needed elsewhere, especially prime windows and scale guards.
No global deletion or closure until actual caller replay. Old route
and graphs remain archived. Reduced static edge: replace digit-rounding
and coarse order/cardinality proof with exact order + floor + growth;
retain sphere and all Data fields. Full original and reduced typed
graphs / axiom rows await native extraction; none invented.

Numerical checks executed in connector V8 BigInt (not Lean): q=1..32,
s=1..180, N0=18480q; order-power assertions 5760, half-order nonidentity
5633. For q in [1,2,7,32], s=64..512 step 16, n in [3,4,5,8],
441 nonzero-digit cases checked exact floor brackets and the scalar
budget below with T=ceil(M^n/(n*M^2)); no claim of constructing full
native Data or of checking asymptotic bounds by finite sampling.
Reproduce (Python, exact integers):
  def v2(a): return (a & -a).bit_length()-1
  def c3(s):
      p,j=243,1
      while 3*j<=s: p,j=3*p,3*j
      return p
  def root(a,n):
      l,h=0,1
      while h**n<=a: h*=2
      while h-l>1:
          m=(h+l)//2
          if m**n<=a: l=m
          else: h=m
      return l
  for q in range(1,33):
      N=18480*q
      for s in range(1,181):
          Q=N*c3(s); mod=2**(s+1); O=2**max(0,s+1-v2(N))
          assert pow(1+Q,O,mod)==1
          if O>1: assert pow(1+Q,O//2,mod)!=1
  for q in (1,2,7,32):
      B=2**(v2(18480*q)-1)
      for s in range(64,513,16):
          S=2**s; O=S//B; L=324*s; C=c3(s)
          for n in (3,4,5,8):
              M=root(O,n)//L
              if not M: continue
              assert (L*M)**n<=O<(2*L*M)**n
              T=(M**n+n*M*M-1)//(n*M*M)
              assert C*S<=C*B*(2*L)**n*n*M*M*T

Native old CI jobs 45577239749 and 45576756833 have successful run jobs,
but use old pin and cannot certify this certificate. Compact shared
compute/rh-compact-union-graph-20261126/status.json blob
ea44d71556e0d21703e72fcd61bbaf2bee0ec563, run 45781154005:
RESOURCE_BLOCKED, returncode 1, wall 0.04s. Local lean/lake absent.
Native rh_scan/prune/reduce/auto/frontier and new axiom/graph export
not executed. No competing job, no protected workflow modifications.
Publisher README reports successful external kernel and Comparator
checks; our human reconstruction and new certificate are incomplete.

RESUME HERE: independently audit exact order (modulus s+1), floor
bounds and the n>22/epsilon choice. Integrate short human construction
in compact DataExist section, preserve remaining prime windows and
class-group pair proof. Next derive those prime-window supplier
quantifiers and class group cross-pair using native exists_prime_modEq_one_log_mem;
do not reopen old G(x) route or rerun finite tests absent changes.
HANDOFF TO: formal audit, kernel shared compact replay, integration,
human editor; native candidate below checks only scalar multiplication,
not the full new exists_data proof.
-/

namespace RHCompactRun52

-- Finite scalar loss bound, avoiding division and retaining exact cancellation.
theorem thick_budget (C B L M S T : ℝ) (n : ℕ)
    (hC : 0 ≤ C) (hB : 0 ≤ B) (hL : 0 ≤ L)
    (hS : S ≤ B * (2 * L)^n * M^n)
    (hT : M^n ≤ (n : ℝ) * M^2 * T) :
    C * S ≤ C * B * (2 * L)^n * (n : ℝ) * M^2 * T := by
  have hcoeff : 0 ≤ B * (2 * L)^n := by positivity
  calc
    C * S ≤ C * (B * (2 * L)^n * M^n) :=
      mul_le_mul_of_nonneg_left hS hC
    _ ≤ C * (B * (2 * L)^n * ((n : ℝ) * M^2 * T)) :=
      mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left hT hcoeff) hC
    _ = _ := by ring

-- Coordinate convexity identity used by the sphere argument.
theorem sphere_balance (a b c i j : ℝ)
    (h : j*b = i*c + (j-i)*a) :
    j*(i*c^2 + (j-i)*a^2) - j^2*b^2 =
      i*(j-i)*(c-a)^2 := by
  nlinarith [congrArg (fun t : ℝ => t^2) h]

#print axioms thick_budget
#print axioms sphere_balance

end RHCompactRun52
