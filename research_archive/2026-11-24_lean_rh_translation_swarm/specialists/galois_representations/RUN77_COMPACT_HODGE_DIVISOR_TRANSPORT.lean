import Lib.PadicHodge.WachKisin.CrystallinePeriodMatrix
import Mathlib.Tactic

/-!
RUN77 — C1 finite Hodge frame and coefficient divisor transport, 27 Nov 2026.
Human source-matched derivation under explicitly retained chart, period-ring,
and Hodge-frame foundations. Prepared certificate, not native replacement replay.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission blob 3adc76221a978016e3505cdf3e36ad688354d7d7; live spine
67e542df1b5557b2e1314643931ef1355bbdc50d; ledger
073d86374ebc415e217a2732814dde7b0f3dfb9d (C1). RUN76 31f5d332
(blob f31d0b85c6db2ce8dc16a773f8a8d6f370b611c6) is the direct consumer.
Read current protocols, AGENTS and continuity, current peer subjects through
b6356a24: B2, marked Hecke, exchange, not this C1 supplier.
Original pin leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005;
observed current upstream 7c4ccbd64d02774b0a5b40a5f923f5b7a18e8abc, not adopted.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Source paths relative to grh-compact/src:
 Lib/PadicHodge/WachKisin/CrystallinePeriodMatrix.lean cf83fda104fb44177d374d62f06b4d6e68e3db08
   IsChartOf.exists_isPeriodMatrix, especially final hat_stable proof.
 Lib/PadicHodge/WachKisin/KummerChart.lean 8c3d7ca027e653f9a125e0cec6fd477c5ce6f791
   IsChartOf.dvd_extendToBPlus; exists_witt_coeff_of_isChartOf.
 Lib/PadicHodge/WachKisin/ChartScalars.lean 8dc59315a323816ecb0eedf46b5aae0a8c714fc5
   mem_of_fixed_thetaPhiInvS, extendToBPlus_mul, bicommutant.
 Lib/PadicHodge/WachKisin/HodgeFrame.lean 158f4df424f222f593b6f2baee57a294ab221f03
   exists_hodge_frame, FixesThetaZ, IsChartOf.
 Lib/PadicHodge/PeriodRings/FundamentalKernel.lean 7d78ffa669acc35996f315cfe18ac1dc43649fb9
   pow_smul_mem_range_BPlus.
 Lib/PadicHodge/Crystalline/RegularityFrobenius.lean 2cf7f7ee07b73f475818198db19ee7f65aec7a06
 Lib/PadicHodge/BlochKato/CocycleContinuity.lean 5eff1d2845333289d7cb4dfb130c86630b92641d

1. Exact coefficient divisor transport, including arbitrary cancellation.
Write A=Ainf, B=BPlus, D=BdRPlus, S_B=chart bicommutant, E associated
to xi; all native injective inclusions into BdR suppressed.
The chart extension fhat is additive, S_B-linear and maps Amax into
itself, for every S-linear f:A->A. Retain the native construction.
S_B is a Q_p-algebra: the endomorphisms used in its definition
commute with Z_p scalars and their invertible nonzero multiples in B.
The image K=theta(S_B) in C_p is a Q_p-subalgebra.

For each coefficient a_l in localFieldOf Gamma (an ALGEBRAIC element
fixed by the image j(Gamma)), apply mem_of_fixed_thetaPhiInvS with K.
The premise holds: g fixing the indicated thetaPhiInv values in K
fixes in particular theta(S), since S maps into S_B and n=0 is
included. On Witt coefficients this fixes Lambda, by the native
Witt embedding/equivariance identity; it fixes theta(z) as well.
Thus IsChartOf puts g in j(Gamma), so g fixes a_l.
Consequently a_l is in K; choose t_l,0 in S_B reducing to a_l.

Let P be the minimal polynomial of a_l over Q_p. Separability gives
g in Q_p[X] with g(a_l)P'(a_l)=1 (Bezout with P).
Put F(X)=X-g(X)P(X). Then F(a_l)=a_l and F'(a_l)=0.
The exact polynomial identity F(X)-a_l=(X-a_l)^2 J(X)
holds over the coefficient field containing a_l. Since coefficients
embed into D, every substitution x in D gives
   F(x)-a_l=(x-a_l)^2 J(x), J(x) in D.
Iterating F within S_B produces t_l,r with t_l,r-a_l in xi^(2^r) D.
No completeness of S_B, no infinite limit in S_B, and no norm estimate
on a_l required. Only finite approximations at every requested m.

For y_l in B and any m>=0 choose t_l in S_B with
t_l-a_l in xi^m D, and set A_m=sum t_l y_l, L=sum a_l y_l.
The exact congruence A_m-L in xi^m D holds because y_l maps into D.
By native xi_pow_dvd_iff, the pullback of xi^m D to B is xi^m B,
equivalently E^m B. Hence
   xi^m | L in D  iff  E^m | A_m in B.
If A_m=E^m b, fhat(A_m)=E^m fhat(b)=sum t_l fhat(y_l),
using bicommutant linearity before any divisibility comparisons.
Since fhat(y_l) in B, a second exact congruence yields
   xi^m | L  =>  xi^m | L'=sum a_l fhat(y_l).
This holds for ALL m, with f, y and a_l fixed before m. In the DVR D
it implies L | L'. If L=0, all m apply and separation gives L'=0;
if L nonzero use m=ord_xi(L). This is the actual
IsChartOf.dvd_extendToBPlus, including the zero-sum case.
The native fixed-field lemma, chart and period-ring embeddings,
DVR and pullback law remain hypotheses, not silently proved here.

2. Hat-stability at the actual crystalline caller, by one conjugation.
Take crystalline invariant basis M in GL_d(Bcris) for representation
matrix R_g: R_g g(M)=M. The native Hodge frame gives
   M Y=W diag(t^k_i)
in BdR, with Y in SL_d(Qpbar) integral and fixed under j(Gamma),
W in GL_d(D), and -a<=k_i<=b, h=a+b. Here t is tPeriod,
a uniformizer of D, and E is associated to it. Use the actual
all-g fixed Y supplied by the source at F=top, not merely a
near-one frame. Each entry of Y^-1=adj(Y) is fixed and algebraic;
therefore section 1 applies to each row of Y^-1.
The native period U has U=(E tau)^a M in BdR.
For arbitrary y in B^d and arbitrary S-linear f, put
r=Y^-1 y, r'=Y^-1 fhat(y) in D^d.
By section 1, r_i | r'_i in D. Choose s_i in D with r'_i=s_i r_i;
if r_i=0 then r'_i=0 and s_i=0 works. Put T=diag(s_i).
With D0=(E tau)^a diag(t^k_i) in the field BdR, T commutes
with D0 exactly, giving the single identity
   U fhat(y) = W D0 T r = (W T W^-1) U y.
The factor W T W^-1 is integral over D because W and its inverse
are integral. Thus for ANY m>=0, E^m | U y in B^d implies
E^m | U fhat(y) in D^d, then in B^d by the pullback law.
At m=h this is precisely hat_stable. No estimate on individual
entries of W, Y, s or the rank, and no additional assumption on
the output vector. The k_i bounds are not used in this local
hat-stable proof: they remain essential for existence of U and
its inverse below. Do not remove them from the full theorem.
This also proves preservation of the entire E-adic filtration
for this U, not just the one exponent needed by exists_basis.

3. All remaining period-matrix fields at the same caller.
For each n>=0, N_n=phi^n(M) is invariant, by commutation of
Frobenius with the representation action. The source takes the
Hodge frame of N_n separately and uses the SAME jump bounds.
In D, its factorization N_n=W_n diag(t^k_ni) Y_n^-1
gives entries of N_n in t^(-a)D and entries of N_n^-1 in
t^(-b)D. Apply the native all-Frobenius pole-bound theorem
pow_smul_mem_range_BPlus entrywise to M and M^-1, with nu=E tau
associated to mu: U=(E tau)^a M, Z0=(E tau)^b M^-1 are in B.
Thus U Z0=(E tau)^h I in B by injectivity. This is exists_inv.

Choose v in A^x with E tau v=mu. Let N=phi(M) and
R=M^-1 N, invariant entrywise, as is R^-1=N^-1 M.
The native invariant fraction theorem
exists_witt_coeff_of_isChartOf (denominator 1) and invertibility
of p in S_B give unique representatives of R,R^-1 in S_B.
Retain that theorem, not an assertion that all Bcris elements
are in S_B. Set F=phi(E)^a R, F'=phi(E)^(-a) R^-1.
Both are S_B matrices by exists_bicommutant_mul_phi_E_eq_one.
Using phi(tau)=mu and mu=v E tau, one obtains
   F' F=I,  phi(U)=v^a U F
in B. This is exists_frob for the actual unit v^a.
For g fixing Lambda and theta(z), IsChartOf gives a lift gamma
in Gamma, and r_g=(E tau)/g(E tau) is a unit in A by the two
native association laws. With rho_g=r_g^a R_gamma over A,
rho_g g(U)=U. This is exists_gal, no coherent choice of lifts
required for this existential field. The invariant M and U
identity are exactly those used by uniform_period_bound and
FrameTheorem through RUN74–76. No new RH-scale estimate inferred.

Local graph:
original IsChartOf.exists_isPeriodMatrix -> (exists_inv,
exists_frob, exists_gal, hat_stable) -> exists_basis -> exists_frame.
candidate human supplier chain:
fixed coefficient field + separable polynomial double root +
E-adic pullback + chart extension -> divisor transport ->
one integral conjugation -> hat_stable;
all-Frobenius pole bound + Hodge frame + invariant fraction theorem
+ unit association -> other three fields.
Original/reduced global graphs and axiom ledger unchanged.
Context key: exact compact pin, c, j(Gamma), representation, same M,
a,b, chosen Y,W, S_B, m and actual caller. Do not count the local
human reduction as global dependency removal.

Execution: local SymPy checked two exact symbolic identities:
 expand(x-(x-a)*(1+(x-a)*J)-a+(x-a)^2*J)=0;
 for a general symbolic 2x2 W and diagonal D0,T, all four-factor
 conjugation vector residuals cancel entrywise:
 W*D0*T*r-W*T*W.inv()*W*D0*r=0 (two entries).
This is algebra only, not a native Hodge or Galois simulation.
lean/lake unavailable on PATH; no native rh_scan/rh_prune/rh_reduce/
rh_auto/rh_auto_frontier or new CI dispatch. Prepared small
certificates below, including source theorem probes. Checked actual
compact C1/general native receipt blob 088cd2ec0e935ee1a282f10096949bcf671cc804:
six older original named checks, module_1_build timeout124,
full_RH_replay=false, all_requested_checks_ok=false.
New separate B2 status receipt d9eb4d1dc47d7dc52f36bc13b41b3eea170b667d
(run 45986308748) passed eight helpers, six original probes and
negative guard, explicitly caller_replacements_checked=false,
human_assembly_verified=false. This is NOT verification of C1.
No original graph or axioms overwritten, no URT or RH assumption.

RESUME HERE: derive the actual invariant fraction supplier
exists_witt_coeff_of_isChartOf at KummerChart.lean from its
finite coordinate quotient and z-saturation argument; use
section 1 at its two-term coefficient caller rather than
reprove it. Retain the chart, Hodge frame and fundamental pole
bound hypotheses for later independent audit; coordinate one
C1 replay batch with integration/kernel rather than duplicate B2.
HANDOFF TO Galois, integration/editor, independent audit, native replay.
-/

namespace RHGaloisRun77

theorem double_root_error {R : Type*} [CommRing R] (x a J : R) :
    x-(x-a)*(1+(x-a)*J)-a = -(x-a)^2*J := by ring

theorem finite_divisor_transport {R : Type*} [CommRing R]
    {ι : Type*} [Fintype ι] (d : R) (r s w : ι → R)
    (h : ∀ i, d ∣ r i) (hs : ∀ i, r i ∣ s i) :
    d ∣ ∑ i, w i * s i := by
  classical
  exact Finset.dvd_sum fun i _ ↦ (dvd_trans (h i) (hs i)).mul_left _

#check Lift.Chart.IsChartOf.dvd_extendToBPlus
#check Lift.Chart.IsChartOf.exists_isPeriodMatrix
#check Lift.Chart.IsPeriodMatrix.exists_basis
#check exists_witt_coeff_of_isChartOf
#print axioms double_root_error
#print axioms finite_divisor_transport
#print axioms Lift.Chart.IsChartOf.dvd_extendToBPlus
#print axioms Lift.Chart.IsChartOf.exists_isPeriodMatrix

end RHGaloisRun77
