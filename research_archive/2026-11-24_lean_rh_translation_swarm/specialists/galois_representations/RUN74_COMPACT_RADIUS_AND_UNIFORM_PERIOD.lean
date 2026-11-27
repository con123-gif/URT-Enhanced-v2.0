import Lib.PadicHodge.Comparison.CrystallineLimit
import Mathlib.Tactic

/-!
RUN74, 27 November 2026 — radius induction and caller-specific uniform period
bound. Human source-matched conditional reduction, scalar certificate PREPARED,
not native replay. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission blob a69122b6ad568910a45d2bc13961ab9da4855143. Read protocol, queue,
expansion, AGENTS, research state/continuity, prior RUN73 d4c26f66 and current
peer commits d12d3e65 (vacuum/index), 0a9f1882 (dual datum), e8b07e40 (projector).
Original root pin leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005
Main.lean blob dbd5db70bc11b35f18fa5751216ab335321e7bfc; recent upstream
7c4ccbd64d02774b0a5b40a5f923f5b7a18e8abc not adopted.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207.
Paths below relative to grh-compact/src:
Lib/PadicHodge/Comparison/CrystallineLimit.lean e3cf139874cd85a9e5642c277e8b51b9343add9a
  radius_lemma and uniform_period_bound, actual proof bodies.
Lib/PadicHodge/WachKisin/PeriodMatrixBasis.lean cd91a46eb5624b88af20a96d0450bdf059994b93
  exists_tau_mul_E_eq_mul_epsTilt_pow_sub, IsPeriodMatrix.
Lib/PadicHodge/WachKisin/ChartScalars.lean 8dc59315a323816ecb0eedf46b5aae0a8c714fc5
  coefficient approximation, extensions and z-adic separation.
Lib/PadicHodge/WachKisin/CrystallinePeriodMatrix.lean cf83fda104fb44177d374d62f06b4d6e68e3db08
  exists_isPeriodMatrix.
Lib/PadicHodge/WachKisin/PeriodMatrixFrame.lean 348d083320f3e9f59100db1a2f96f5a3f8e92923
  IsPeriodMatrix.exists_frame.
Lib/PadicHodge/WachKisin/FrameTheorem.lean 57d6daa6060f9f00eb27be6525460ba942a73f08
  actual radius near-invariance consumer.

1. Radius factorization, with no rank-dependent p denominator.
Use native chart notation S, Ainf, B+, S_B, z, E=p+zr, tau, and
P=p^l>=3e. Let Z'Z=E^h I, Z entries in S_B, tZ=ZG with G integral,
t(z)=qz, q=[epsilon], t fixes Lambda and theta(z). The source assumes
the fixer hypotheses (not just a relation on z). From the earlier
RUN73 congruence/cancellation, tau*z divides G-I entrywise.
Choose u=p^-1 in S_B. Apply the actual coefficient approximation to
each entry u^h Z': p^m u^h Z'_ij=w_ij+z y_ij with w_ij in Lambda.
Use possibly different m_ij; set B_ij=u^m w_ij, Y_ij=u^m y_ij.
Then B fixed by the fixer of Lambda and
    R=BZ=I+zW,
    W=u^h ((E^h-p^h)/z) I-YZ
has entries in S_B. Also tR=RG. No determinant estimate on B
is used at this stage.

Work on one row R_i. Maintain A in Ainf^d, Q a natural integer,
and W in S_B^d with A=Q R_i-z^k W, k=n+1. Initially k=1, Q=1,
A=e_i. (All images in B+ suppressed.)
Put v=v_p(k). Then
    AG-tA=z^k[(q^k-1)W-tau*z*D],
where tau*z*D=WG-W-q^k(tW-W).
The two terms are divisible by tau*z from the previous congruence
and G-I divisibility. The exact native coefficient supplier is
    alpha(q^k-1)=tau E(p^v+beta*z).
Multiply before taking any valuation. Therefore
    alpha(AG-tA)=tau*z^k [p^(v+1) W
                           -z(alpha D-(p^v r+beta E)W)].
Left is integral. Native tau_mul_z_pow_dvd (h=0) makes the quotient
by tau*z^k integral in Ainf. Apply the extended oneIndex coordinate
projection, which is S-linear and fixes S_B pointwise on the
distinguished coordinate. In particular do not assume D itself
belongs to S_B. This produces s in S^d and W' in S_B^d with
    p^(v+1)W=s+z W'.
Update Q'=p^(v+1)Q, A'=p^(v+1)A+z^k s; the new relation is
A'=Q'R_i-z^(k+1)W'. This is the exact native induction state.

2. Exact factorial cancellation gives the convergent power series.
Let f_n=v_p(n!), a=k-f_k>=0. The source identity
    n-f_n+2 = a+v+1
is just f_k=f_n+v. Write X=z^P/p^2 in B+; native chart z^P is
divisible by p^3 in Amax, so X is the image of an Amax element
divisible by p. The source constructs ev0:S[[X]] -> Amax and
ev:S[[X]] -> B+ (here X also denotes the formal variable).
Set L_n=p^(n-f_n+2) phi^l(W_n). Then exactly
    L_n=p^a phi^l(s_n)+X L_(n+1).
Iterating, L_0 lies in the range of ev, with the coefficients
p^a phi^l(s_n) in S. Justification: the formal series exists;
after any finite truncation both evaluations differ by X^N,
and X-adic separation in B+ follows from the native z-adic
separation and p invertibility there. Thus equality, not just
an asymptotic bound. Applying this to every entry of R=I+zW_0
gives phi^l(R)=ev(U), U=I+X F invertible over S[[X]]
(constant coefficient I). The product phi^l(B) phi^l(Z) is a
unit; square matrices over a commutative ring imply both factors
are units, by determinant multiplicativity. Put
    eps=1+X*p*phi^l(r), so phi^l(E)=p ev(eps).
eps is a unit by its constant term. For arbitrary b>=0 choose
C=p^(-b) phi^l(B)^(-1), V=ev0(eps^(-b) U).
Then phi^l(Z)=phi^l(E)^b C V, with C fixed by the fixer of
Lambda and V invertible over Amax. This proves the factorization
conditional on the retained exact chart/period foundations.
No estimate accumulates over the rank.

3. Near-invariance span: exact two-factor denominator, and its limit.
For the separate FrameTheorem caller, e A<=P delta. Truncation of
a formal series F after D terms gives
    p^(2D) ev(F)=s_D+z^(PD) ev(G_D),
    s_D=sum_{0<=j<D} p^(2(D-j)) z^(Pj) F_j in S.
Use D=delta. The chart divisibility z^(P delta)=p^A a in Amax,
and the existing E^A approximation of p^A times the extended
coordinate, show p^(2 delta)ev(F) agrees with an S element
mod E^A B+. Here the extended coordinate fixes ev(G_D), using
truncation and z-adic separation as in native radius_lemma.
Do NOT claim that ev(G_D) itself is integral over S or that
the congruence holds before projection.

Write c0=p^(2 delta), R_A=B+/(E^A), i:S->R_A.
For V and V^-1 choose N_+,N_- over S with i(N_+)=c0 Vbar,
i(N_-)=c0 Vbar^-1. Thus Vbar i(N_-)=c0 I, and the columns
of N_- are allowed vectors (natural constant c0 or 0).
The columns of c0^2 I-N_-N_+ are also allowed, with constant 0.
The entire spanning argument is
    c0^2 x=(c0^2 I-N_-N_+)x+N_-(N_+ x).
This proves the native p^(4 delta)S^d span statement. No
matrix inverse over S, no new hypothesis of quotient injectivity.
The abstract two-factor step cannot generically be replaced
by c0 alone: S=Z[t], R_A=Q[t], c0=p prime,
    B0=[[1,t],[0,p^2]], V0=[[p,-t/p],[0,1/p]].
Then V0 B0=pI and both pV0 and pV0^-1 are integral. If
V0 y=r in N^2, then y=B0 r/p integral forces both constant
r_i divisible by p (compare coefficients of t). All such y
have second coordinate divisible by p^2, so their S-span does
not contain p e_2. This is an exact abstract negative control
only, NOT a native chart counterexample; no claim that a sharper
native result is impossible.

4. Caller-specific genuine pruning candidate: uniform_period_bound
does not consume the near-invariance span or arbitrary b.
Use its actual nonnegative jump interval [0,h], period matrix
U=M in B+ mapped to the invariant matrix M in Bcris, and the
existing frame Q L=tau^h I, UZ=E^h Q. Set b=0 in sections 1–2,
so phi^l Z=C V and no normalization eps is required. In Bcris
put alpha=the native map Ainf -> Amax after phi^l,
q0=alpha(E^h Q), L0=alpha(L), U0=q0 V^-1, U1=V L0.
Then U0=phi^l(M) C, hence invariant under the representation's
semilinear action (C is fixed by the image of Gamma which fixes
Lambda; retain native chart construction). Direct exact product:
    U0 U1 = alpha((E tau)^h) I.
Both matrices over Amax, and alpha(E tau)^h is a unit in Bcris
since E tau associated to mu and native Frobenius sends mu to
a Bcris unit. This scalar is independent of representation rank
and lattice, with chart and l chosen before T. Its columns imply
the fixed-period span immediately. No near-invariance or
determinant-derived denominator is needed at THIS caller.
Keep section 3 for FrameTheorem, which actually consumes it.
This is a human replacement branch only, no native graph retirement.

Local graph: original radius_lemma -> both uniform_period_bound
and frame_theorem. Candidate split: radius factorization -> both;
quotient span -> frame_theorem only. Existing frame existence
and period comparison -> both. No original graph, axiom ledger,
or unexpanded node changed. Actual Theorem C local jump branch
uses frame_theorem; this is the recorded source chain, not a
new complete elaborated reachability claim. Context keys pin,
actual chart, l, b, A, delta, and consuming theorem. No URT or RH
conclusion assumed.

Remaining: prove PeriodMatrixBasis.exists_basis and
PeriodMatrixFrame.exists_frame (especially mod-p determinant
contradiction and coordinate-saturation), actual value-field
comparison, and other Theorem C suppliers. The original scalar
coefficient and native chart approximation laws remain premises.
The weighted-prime lower bound is not proved.

Execution: local Python/SymPy exact coefficient cancellation (1)
and abstract matrix identities (2), 8000 integer factorial
recurrences (p=2,3,5,7,11,13,17,19; n=0..999), and 208
constant residue controls for p=2,3,5,7,11. Reproduce recurrence
by updating f by v_p(n+1) and asserting n-f_old+2 ==
(n+1-f_new)+v_p(n+1)+1. Matrix control is polynomial arithmetic
on the displayed B0,V0; it is not a simulated Galois operator.
Local lean/lake/elan absent. No native rh_scan/rh_prune/rh_reduce/
rh_auto/rh_auto_frontier execution or new CI dispatch. Shared
targeted_results.json on cathedral-research-state remains
blob 088cd2ec0e935ee1a282f10096949bcf671cc804, six older checks,
module_1_build timeout 124 at 2700.11s, all_requested_checks_ok=false,
full_RH_replay=false. Latest orchestrator summary run 45963051483
is not a certificate for this file.

RESUME HERE: derive the exact determinant contradiction and basis
saturation of IsPeriodMatrix.exists_frame/exists_basis at compact
pin, retaining the fixed-kernel support argument, Frobenius and
tilt coefficient hypotheses. Audit sections 1–4 and split
factorization from near-span only at the actual uniform period
caller. Do not redo scalar radius recurrence. HANDOFF TO
integration, editor, Galois, independent audit and native replay.
-/

namespace RHGaloisRun74

theorem radius_coefficient_cancel {R : Type*} [CommRing R]
    (p z r a D W pv beta : R) :
    (p+z*r)*(pv+beta*z)*W-z*a*D =
      p*pv*W-z*(a*D-(pv*r+beta*(p+z*r))*W) := by ring

theorem radius_span_split {R : Type*} [Ring R] (c Nminus Nplus : R) :
    (c*c-Nminus*Nplus)+Nminus*Nplus=c*c := by abel

theorem radius_product_cancel {R : Type*} [Monoid R]
    (q v w L : R) (h : v*w=1) :
    (q*v)*(w*L)=q*L := by
  rw [mul_assoc, ← mul_assoc v w L, h, one_mul]

#print axioms radius_coefficient_cancel
#print axioms radius_span_split
#print axioms radius_product_cancel
#check Lift.Chart.radius_lemma
#check Lift.uniform_period_bound
#check Lift.Chart.IsPeriodMatrix.exists_frame
#check Lift.KummerChart.JumpLattice.frame_theorem
#print axioms Lift.Chart.radius_lemma
#print axioms Lift.uniform_period_bound

end RHGaloisRun74
