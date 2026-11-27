import Lib.CM.KroneckerLimit.LogTheta
import Mathlib.Tactic

/-!
# RUN75 — replace the Kronecker-limit proof at the actual CM period caller
27 November 2026. Human source-matched literature bridge and independent
review of RUN75 acceleration. Generic Lean scalar certificate PREPARED,
not compiled. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Original pin leanprover-community/riemann-hypothesis@
40e56bab026552e089d7afcfeff08d2defb9c005; Main.lean blob
dbd5db70bc11b35f18fa5751216ab335321e7bfc re-read, not imported.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission a69122b6ad568910a45d2bc13961ab9da4855143 including mandatory engine,
AGENTS, protocol, handoff, expansion and continuity consulted. Peer
0aa83347 (CM class product), 85d03bf7 (adapted majorant), 42bc7348
(exchange), f1abc81e (marked index) read. Do not duplicate those tasks.
Latest peers report original upstream main 7c4ccbd6, compact main
unchanged; frozen pins retained (not independently rechecked main here).

## 1. Precisely match the existing published result

Fernando Chamizo, A simple evaluation of a theta value, the Kronecker
limit formula and a formula of Ramanujan, Ramanujan Journal (2022),
DOI 10.1007/s11139-022-00586-0,
https://link.springer.com/article/10.1007/s11139-022-00586-0 .
Publisher HTML section 3, Proposition 1, formula and hypotheses read
directly this run. The native comment calls it Prop. 3.1; use the
publisher's numbering, not an unverified preprint numbering.
For Q(m,n)=a m²+b mn+c n² with a>0, D=4ac-b²>0,
tau_Q=(-b+i sqrt(D))/(2a), Z_Q(s)=sum over nonzero pairs Q^(-s),
the proposition gives the right-hand limit of
sqrt(D)/(4*pi) Z_Q(s)-zeta(2s-1)
as log(sqrt(a/D)/|eta(tau_Q)|²).
Only this real right limit is needed, not full meromorphic continuation
of the Epstein zeta. No RH assumption.

Actual source: Lib/CM/KroneckerLimit/LogTheta.lean
99b01af94328fe9bcfd29a14db9933e72ac5c626, kronecker_limit,
is a lemma WITH proof body (not an axiom or a naked wrapper).
It uses row/integral comparison, cotangent expansion, eta products,
uniform convergence, zeta pole and Gamma derivatives. The human
proof may instead invoke Chamizo directly at precisely this interface.
The actual CMLattice.chowla_selberg calls kronecker_limit on every
conjugate D_c with k=2/sqrt(d), in Lib/CM/FormalGroup/FormalHeight.lean
640cabefca81dde25d092fd6ac057c3bcdd3516e. The latter is itself a lemma
with a proof body, not a literature axiom. Its actual subsequent
consumer is Parameters.periodFactor, New/Curve/PeriodDefs.lean
7dcfa329642087071f8bc9f1976e004eb7fb20ef, and the ConjugateGenerator
normalization audited in peer 0aa83347.

## 2. One exact substitution, including all scaling factors

Write the actual lattice L=omega*(Z+tau Z), tau=x+i y, y>0,
omega!=0. Its area A=|omega|² y. Fix arbitrary k>0 as in the
native statement (so in particular the actual k=2/sqrt(d)).
Choose Q(m,n)=|m-n tau|²/(k y); negating n is a bijection of
integer pairs, so its series is precisely the native lattice
series |ell|²/(k A) to power -s. For s>1 both absolutely converge.
The native sum includes ell=0, whose value is zero under the
Lean Real.rpow convention 0^(-s)=0. Remove just this term before
using the classical series.

a=1/(k y), b=-2x/(k y), c=|tau|²/(k y).
Hence D=4/k², sqrt(D)/(4*pi)=1/(2*pi*k),
tau_Q=tau and sqrt(a/D)=sqrt(k/y)/2.
Chamizo plus the ordinary Laurent expansion at 1 gives, as t->0+,
 Z_Q(1+t)/(2*pi*k)
 = 1/(2t)+gamma+ (log k-log y)/2-log 2-2 log|eta(tau)|+o(1).
Multiply by 2*pi*k*t BEFORE taking a derivative. Define F(1)=pi*k
and F(s)=(s-1)Z_Q(s) for 1<s<2, arbitrarily elsewhere.
Then the right derivative exists and is
 pi*k*(2gamma+log k-log y-2log 2-4log|eta(tau)|).

The actual source g₂_g₃_eq_eisenstein in Lib/CM/Sigma/CurveTheta.lean
cd276f383c2768ee6039051e407ecac800a7f0d7 states
 g₂³-27g₃²=(2*pi/omega)^12*discriminant(tau).
Using the standard eta product discriminant(tau)=eta(tau)^24
(and its nonvanishing in the upper half plane), set Delta=g₂³-27g₃².
All quantities inside real logs below are strictly positive.
The entire normalization collapses to the identity
 log(A/(k*pi²))+(1/6)log|Delta|
 = log(y/k)+2log 2+4log|eta(tau)|.                    (K)
The omega scale and pi cancel EXACTLY. Thus the derivative is
 precisely F(1)*(2gamma-log(A/(k*pi²))-(1/6)log|Delta|).
The limit quotient also proves the claimed HasDerivWithinAt
on Ioi 1, since it is local at 1; arbitrary extension beyond 2
is irrelevant. This is every conjunct of native kronecker_limit.
No replacing the exact equality by asymptotic comparability,
no choice of complex logarithm branch, and no assumption of RH.

## 3. Independent review of the actual class product in peer 0aa83347

Use J_c=a_(c²)/a_c. Since squaring permutes the ideal classes
under the source prime-discriminant genus hypothesis, the chosen
representatives in numerator and denominator occur with exactly
the same multiplicity; their fractional-ideal product is O_K.
The forward/inverse isogeny integrality at every p and embedding
implies the product U of the scalars and U^-1 are integral (not
each factor individually). Multiplying fractional modules uses
finite sums of products, so this step needs no choice of principal
generator of each J_c. This confirms the peer's product argument
conditional on its same retained isogeny laws, not a proof of those laws.
For a class c, the integral ideal (ell) b_c^-1 has inverse ideal class
to b_c, so as the lattices cover all classes the ideal sum covers
each exactly once, with two generators under d>=7 and units +-1.
This inverse convention does not alter the sum. Formula (K) fixes
the derivative constant and verifies the peer's factor 1/6.
At the actual k=2/sqrt(d), the pole residue is 2 L(1,chi)=h*pi*k;
dividing the derivative sum by it and applying the Laurent expansion
gives exactly
 (1/h) sum_c [log A_c+log|Delta_c|/6]
 = log(k*pi²)+gamma-Re(L'/L)(1).
Combined with the peer's root product this verifies the claimed
period normalization, not just its proportionality. A bare citation
of classical Chowla-Selberg or Gross's periods is not sufficient to
assert existence of one common all-p/all-embedding unit: retain
the native fractional-module integrality and conjugate isogeny
transport. This review closes no primitive CM input.

## 4. Dependency/provenance ledger

Original human edge: ConjugateGenerator scale -> chowla_selberg
-> kronecker_limit -> uniform row/integral convergence, cotangent,
Gamma differentiation, eta product and lattice normalization.
Reduced candidate human edge: same caller -> class product ->
Chamizo Proposition 1 + ordinary zeta Laurent expansion +
g₂_g₃_eq_eisenstein + eta^24 + (K).
The row/integral, cotangent and Gamma derivations can be omitted
from the human proof at this consumer. They remain in the original
native graph, including any shared uses. No original axiom or graph
node removed. The published proposition is an external established
mathematical theorem used in human reconstruction, not an additional
Lean axiom or a kernel replay. Keep all A/B/C primitive gaps and
the weighted prime lower bound open. Context key: compact pin, L,
omega,tau,y,A,k,s, exact discriminant convention, class representatives,
all embeddings and unchanged period data. No URT needed.

## 5. Actual executed checks and verification boundary

Local mpmath regression (60 digits, square and Eisenstein lattices)
used known factorizations Z_unscaled(s)=w*zeta(s)*L(s,chi),
w=4,6 respectively. The Eisenstein lattice has y=sqrt(3)/2.
These are independent scalar special cases, not source-kernel or
general-lattice tests. Exact reproducible script:

    import mpmath as m
    m.mp.dps=60
    for z,c in [(1j,[0,1,0,-1]),(m.exp(m.pi*1j/3),[0,1,-1])]:
        z=m.mpc(z); y=z.imag; w=4 if len(c)==4 else 6
        q=m.exp(2*m.pi*1j*z); eta=m.exp(m.pi*1j*z/12)*m.qp(q,q)
        for k in map(m.mpf,['0.25','1','3.5']):
            target=m.pi*k*(2*m.euler+m.log(k/y)-2*m.log(2)-4*m.log(abs(eta)))
            def F(t):
                s=1+t
                return t*(k*y)**s*w*m.zeta(s)*m.dirichlet(s,c)
            t=m.mpf('1e-10'); d=lambda t:(F(t)-m.pi*k)/t
            err=abs(2*d(t/2)-d(t)-target)
            wrong=abs(2*d(t/2)-d(t)-(target+m.pi*k*2*m.log(2)))
            print(len(c),str(k),m.nstr(err,5),m.nstr(wrong,5))
            assert err<m.mpf('1e-16') and wrong>m.mpf('0.1')

Output (exit 0):
4 0.25 6.3505e-22 1.0888
4 1.0 3.6864e-22 4.3552
4 3.5 6.0244e-20 15.243
3 0.25 6.8999e-22 1.0888
3 1.0 6.5851e-22 4.3552
3 3.5 5.5694e-20 15.243
The negative control omits the factor 2 in the logarithm.
The universal argument is the analytic substitution, not numerical tests.

Local command -v lean and lake found neither. No native rh_prune,
rh_scan, rh_reduce, rh_auto, rh_auto_frontier run here. Actual CI
receipts read from cathedral-research-state:
compute/rh-recursive-reduction-strip-root-20261125/status.json
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
compute/rh-proof-term-prune-native-20261125/status.json
7da354941e402b6f8b364ed03d8c5c82d27b7717 both returncode 0,
prior conditional root/engine only.
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
088cd2ec0e935ee1a282f10096949bcf671cc804 shows six named B/C checks
with propext, Classical.choice, Quot.sound; module_1_build timeout
124 at 2700.11s, all_requested_checks_ok=false, full_RH_replay=false.
No new native PASS, no new axiom audit. Scalar identities below
prepared only. No schedule or protected workflow changes.

RESUME HERE: integration/editor use Chamizo Proposition 1 and (K) as
the exact KLF supplier at CMLattice.chowla_selberg; retain all CM unit
and conjugation prerequisites. Kernel lane replay native source and
scalar certificate when the compact environment is available.
Literature next inspect the exact published CM formal-group height
supplier at CMLattice.exists_unit_coeff_degree_le and its actual
consumer; distinguish degree-of-isogeny argument from unsupported
identification with a formal height theorem. Coordinate with acceleration
on their vacuumRoot task, do not duplicate it.
HANDOFF TO integration, editor, acceleration, formal audit and kernel.
RH and the decisive weighted prime inequality remain open.
-/

namespace CompactLiteratureRun75

/-- Log normalization after taking real logs of the exact positive
    lattice area and discriminant products; the product identities
    and their positivity are independent native inputs. -/
theorem lattice_log_cancel (A D w y k p l e : ℝ)
    (hA : A = 2*w+y) (hD : D = 12*(l+p-w)+24*e) :
    A-k-2*p+D/6 = y-k+2*l+4*e := by
  rw [hA, hD]
  ring

/-- The constant term after the substitution in Chamizo. -/
theorem limit_constant_cancel (A D w y k p l e g : ℝ)
    (hA : A = 2*w+y) (hD : D = 12*(l+p-w)+24*e) :
    2*(g+(k-y)/2-l-2*e) = 2*g-(A-k-2*p)-D/6 := by
  rw [hA, hD]
  ring

#print axioms lattice_log_cancel
#print axioms limit_constant_cancel
#check kronecker_limit

end CompactLiteratureRun75
