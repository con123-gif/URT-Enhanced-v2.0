import Lib.PadicHodge.WachKisin.CrystallinePeriodMatrix
import Mathlib.Tactic

/-!
RUN79 — C1 all-Frobenius pole saturation, 27 November 2026.
SOURCE-MATCHED human proof of the native supplier under named primitive
period-ring laws; prepared Lean helper, not native replay. Credit Alpöge,
Sernau, Anthropic collaborators and Claude. Compact pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Old pin 40e56bab026552e089d7afcfeff08d2defb9c005 not mixed.
Mission blob 3adc76221a978016e3505cdf3e36ad688354d7d7, live spine
30924a758e7dc18f58e424b5e54c7d21f4b060e2, ledger
7a20a39bd945378ed2daab0953e9b65571d0a196. Read lane protocol,
handoff, expansion, AGENTS and continuity, RUN77 (105f328c),
RUN78 (a4f73545), current B2 caller receipt. No duplicate RUN79
in the Galois directory at inspection; latest peer C2 RUN79 is distinct.

Exact source paths relative to grh-compact/src:
 Lib/PadicHodge/PeriodRings/FundamentalKernel.lean
   7d78ffa669acc35996f315cfe18ac1dc43649fb9:
   pow_smul_mem_range_BPlus, Bcris.exists_padic_eq_of_frobEnd_fixed.
 Lib/PadicHodge/PeriodRings/ThetaKernel.lean
   ab5766dd9ea95412ad15247cef74b9b701250797:
   theta_eq_zero_iff_xi_dvd, theta_iterate_frobEnd_mu,
   theta_iterate_frobEnd_xi, mu_dvd_of_theta_frobEnd.
 Lib/PadicHodge/PeriodRings/BdRPlus.lean
   f828ee87f4914572d457b364b38c6c6b0fbc8372:
   BPlus.exists_Ainf_approx, BPlus.dvd_of_thetaBPlus_frobEnd_eq_zero,
   thetaBdR_algebraMap_BPlus, thetaBPlus_eq_zero_iff.
 Lib/PadicHodge/PeriodRings/AmaxStructure.lean
   1be9736d2c48bece6dd038c72d14b6f807cff9df: definitions BPlus, Bcris.
 Lib/PadicHodge/TateSen/DeRhamFiltration.lean
   dc4c23217762fe5c0da0a7c70a3d3f7bf297c84b:
   hodgeFil, algebraMap_mem_hodgeFil_one_iff.
 Lib/PadicHodge/PeriodRings/BdR.lean
   326d41233ac7638a50194f3ade22350c9b038ad5:
   associated_xi_tPeriod, injective embeddings.
 Lib/PadicHodge/WachKisin/CrystallinePeriodMatrix.lean
   cf83fda104fb44177d374d62f06b4d6e68e3db08:
   Lift.Chart.IsChartOf.exists_isPeriodMatrix, local X, T, J,
   actual inverse-existence field.

1. Ainf simultaneous kernel: a finite telescoping argument.
Let A=Ainf, V=OFlat, phi the automorphism on A, theta native
Fontaine map, mu=xi*tau, phi(tau)=mu. Retain:
A is p-adically complete/separated, A/p=V is the perfect tilt
valuation domain, the nonzero image m=mu mod p, V is separated
for powers of any nonunit, theta(phi^j(mu))=0 for all j>=0,
ker theta=(xi), theta(phi^(j+1)(xi))=p != 0, theta(p)=p.
These are period-ring foundations, not consequences of RH.
Put I={a:theta(phi^j(a))=0 for every j>=0}.
This ideal is p-saturated since phi(p)=p and the target has
no p-torsion. It contains mu.

For a0=a in I, write a_i=xi*b_i by the n=0 kernel identity.
Set a_(i+1)=phi(b_i). The remaining theta equations and the
nonzero value theta(phi^(j+1)(xi))=p imply a_(i+1) in I.
Iterating yields the exact finite factorization
   a = q_N phi^(-N)(a_N),
   q_N = product_(i=0)^(N-1) phi^(-i)(xi),
   q_N phi^(-N)(mu) = mu.
The second equality telescopes using xi*phi^(-1)(mu)=mu.
Thus q_N divides a in A for each N. Write bars for reduction
to V. If bar(a)=0 then m divides bar(a) already. Otherwise
if m does not divide bar(a), the valuation-domain property
gives m=c*bar(a) with c a nonunit. Since bar(a)=bar(q_N)*d_N
and m=bar(q_N)*m^(1/p^N), exact cancellation (bar(q_N)!=0)
gives c*d_N=m^(1/p^N). Therefore c^(p^N) divides m for ALL N.
Separation and p>=2 force m=0, contradiction. Hence m divides
bar(a) for every a in I, without taking limits of q_N or
assuming finite factors are comaximal.

Lift a mod p quotient to b0 in A, so a=mu*b0+p*a1.
p-saturation gives a1 in I. Repeat to obtain
   a = mu*sum_(j<N) p^j b_j + p^N a_N'
for every N. Completeness gives the quotient sum in A, and
separation gives a=mu*b. This proves I=mu A, the exact native
mu_dvd_of_theta_frobEnd under its named primitive foundations.
This proof uses an explicit compatible p-adic lifting instead
of an abstract coefficient-divisibility lemma. No uniform
denominator in unrelated rings is asserted.

2. Lift the kernel to B=BPlus, not to all of Bcris.
Write B=Amax[1/p], C=B[1/mu], D=BdRPlus, F=BdR. Retain the
native injective maps, theta_B extending theta, Frobenius
equivariance of the A->B map, p invertible in B, and
BPlus.exists_Ainf_approx at k=0,n=1:
   p^r c = a + p^r mu w, a in A, w in AmaxImage.
If theta_B(phi^j(c))=0 for every j, apply theta_B phi^j to
this identity. The error term vanishes because every phi^j(mu)
has zero theta, so theta(phi^j(a))=0. Section 1 gives a=mu*b
in A. Then c=mu*(p^(-r)b+w) in B.
Conversely mu*B has zero theta at all forward iterates.
This gives the single exact saturation identity
   intersection_(j>=0) ker(theta_B o phi^j) = mu B.
It is the specialization s(j)=j, nu=mu of the actual
BPlus.dvd_of_thetaBPlus_frobEnd_eq_zero. No independent
completion/closure assertion about B is needed.

3. Finite denominator descent and exact pole criterion.
The native filtration H_k=t^k D in F uses the uniformizer
t=tPeriod; its residue map is theta_D extending theta_B.
mu is associated to t in D: mu=xi*tau, theta(tau)!=0,
xi associated to t. Moreover
   phi^j(mu)=mu*product_(i=1)^j phi^i(xi).
All extra factors have residue p, a nonzero element of the
residue FIELD C_p, even though p is nonunit in Ainf.
Hence ord_t(phi^j(mu))=1 for EVERY j>=0.

For z in C satisfying phi^j(z) in D for all j, choose a finite
localization denominator N with c=mu^N*z in B. If N>0, then
   theta_B(phi^j(c))=0
for every j: its image in F lies in t^N D, and theta on B
agrees with theta_D. Section 2 gives c=mu*c' in B, and
c'=mu^(N-1)*z in C by cancellation of the localization unit.
Descend in N, ending with z in B. The reverse implication
is immediate since phi preserves B and B maps to D.
No convergence in C, determinant, or rank exponent needed.

Now for y in C and a>=0, put z=mu^a*y. By exact order one
of every forward phi^j(mu), the preceding equivalence is
   mu^a*y in B  iff  phi^j(y) in t^(-a)D for every j>=0.
For nu=mu*s in A, multiply by s^a in B. This proves the actual
pow_smul_mem_range_BPlus with its original nu premise and
arbitrary a including zero, not only a pole bound on the
initial iterate. The converse is asserted for mu (and units
times mu in B with all unit images), not arbitrary nu.
The minimal denominator exponent is thus the smallest
nonnegative integer dominating all forward pole orders.
In particular this exact equivalence is stronger than the
one-way native caller requires, but use only its forward
implication in the live proof.

4. Exact same-matrix caller, not a new choice of basis.
At the RUN77 crystalline construction take its actual
invariant matrix M in GL_d(C). For every n the native
Hodge-frame theorem applied to N_n=phi^n(M) gives a
factorization N_n=W_n diag(t^(k_ni)) Y_n^(-1) in F.
The SAME fixed jump interval [-a,b] holds for all n,i by
the source hasJumps_of_rows argument; W_n and inverse over D,
Y_n and inverse algebraic hence over D. Entrywise:
phi^n(M) in t^(-a) D, phi^n(M^-1) in t^(-b) D, since
phi preserves matrix products and inverses. The powers
of t are scalar and the bounds hold before summing.
Use section 3 with nu=E*tau associated to mu in A.
Obtain U=nu^a M and Z=nu^b M^-1 in B entrywise. Then
   U Z=Z U=nu^(a+b) I
in B by injectivity into C. This is the actual exists_inv
field at local X in CrystallinePeriodMatrix. It reuses RUN77
and RUN78 for the remaining period-matrix fields. No separate
incompatible matrix, no new Galois condition, no rank loss,
no assumption of RH. The Hodge-frame existence theorem,
primitive theta laws, separation, approximation and embeddings
are still explicit obligations for audit/replay.

Local dependency delta (source edges, not kernel-export graph):
ThetaKernel.mu_dvd_of_theta_frobEnd -> BdRPlus.dvd_of_thetaBPlus...
 -> FundamentalKernel.pow_smul_mem_range_BPlus -> local X
 -> IsChartOf.exists_isPeriodMatrix -> IsPeriodMatrix.exists_basis
 -> integral frame -> C1.
Candidate proof replaces the first three proof bodies with
finite telescoping + compatible p-adic lift + one approximation
+ finite denominator descent. The p-saturation, all-forward
residue tests, approximation and fixed jump bounds remain.
Do not claim global graph/axiom deletion; originals unchanged.
Context-sensitive cache key: compact pin, same p,A,B,C,D,phi,theta,
all nonnegative iterates, nu, a,b, M and C1 inverse caller.
Failed route: only initial/finitely many residue tests cannot
justify simultaneous kernel without additional hypotheses.
No URT comparison or benefit asserted.

Execution on local Python/SymPy:
20 exact toy Q[X] denominator descents with mu=X(X-1)(X-2),
a=0..3,N=0..4 and quotient X^2+2; recovered quotient exactly.
32 finite telescoping exponent checks p=2,3,5,7,N=1..8,
sum_(i=0)^(N-1)(p^(N-i)-p^(N-i-1))=p^N-1.
Negative control: X(X-1) vanishes at 0,1 but not 2 and is not
divisible by mu. These are algebra controls only, not native
period-ring tests or a substitute for the proof. No Lean,
lake or elan on local PATH; native rh_scan/rh_prune/rh_reduce/
rh_auto/rh_auto_frontier not executed. Helper below prepared.
Actual compact targeted_results.json blob
088cd2ec0e935ee1a282f10096949bcf671cc804: module_1_build exit124,
all_requested_checks_ok=false, full_RH_replay=false.
New independent B2 receipt verified_callers.json blob
1e251101d4361719016913df601ec32a0fc8dce1: compiler exit 0,
four original statement matches and direct caller guards,
standard three axioms only, full_RH_replay=false; no C1 evidence.
No new CI dispatch; coordinate a C1 batch through shared runner.
Original/reduced global graphs, original axiom evidence preserved.

RESUME HERE: derive exists_hodge_frame in
Lib/PadicHodge/WachKisin/HodgeFrame.lean (blob 158f4df424f222f593b6f2baee57a294ab221f03)
at F=top as used by CrystallinePeriodMatrix.local T/J, retaining
the actual algebraic fixedness and jump identification. Reuse
RUN77-79; audit/replay these rather than rederive absent a
specific discrepancy.
HANDOFF TO: Galois, integration/editor, independent audit, kernel.
-/

namespace RHGaloisRun79

/-- Abstract finite denominator descent; the native simultaneous kernel
    supplies the step, which is deliberately an explicit premise. -/
theorem finite_denominator_descent {R S : Type*} [CommRing R]
    [CommRing S] [IsDomain S] (f : R →+* S) (mu : R) (z : S)
    (hmu : f mu ≠ 0)
    (hstep : ∀ (c : R) (N : ℕ), f c = f mu ^ (N+1) * z → mu ∣ c)
    (N : ℕ) (c : R) (hc : f c = f mu ^ N * z) :
    ∃ d : R, f d = z := by
  induction N generalizing c with
  | zero => exact ⟨c, by simpa using hc⟩
  | succ N ih =>
    obtain ⟨d, hd⟩ := hstep c N hc
    apply ih d
    apply mul_left_cancel₀ hmu
    calc
      f mu * f d = f c := by rw [hd, map_mul]
      _ = f mu ^ (N+1) * z := hc
      _ = f mu * (f mu ^ N * z) := by rw [pow_succ]; ring

#check mu_dvd_of_theta_frobEnd
#check BPlus.dvd_of_thetaBPlus_frobEnd_eq_zero
#check pow_smul_mem_range_BPlus
#check Lift.Chart.IsChartOf.exists_isPeriodMatrix
#print axioms finite_denominator_descent
#print axioms mu_dvd_of_theta_frobEnd
#print axioms pow_smul_mem_range_BPlus

end RHGaloisRun79
