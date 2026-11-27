import Lib.PadicHodge.WachKisin.PeriodMatrixFrame
import Mathlib.Tactic

/-!
RUN75 — determinant contradiction and saturation at the crystalline frame caller.
27 November 2026. HUMAN SOURCE-MATCHED derivation conditional on the exact
exists_basis and chart foundations, not a native replacement replay.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission blob a69122b6ad568910a45d2bc13961ab9da4855143, including unified
pipeline; AGENTS, continuity, protocol, queue and expansion consulted.
Peer branch head observed 0f636e8e (Landau); acceleration 0aa83347 deals
with a different, CM finite-frame denominator, not this Kisin argument.
Prior Galois RUN74 bdfcbcdc, blob 4db11b827a9e15cbdce75e9875260800b9ed24ca.
Original source pin leanprover-community/riemann-hypothesis@
40e56bab026552e089d7afcfeff08d2defb9c005; upstream head checked
7c4ccbd64d02774b0a5b40a5f923f5b7a18e8abc, not adopted.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207.
Paths relative to grh-compact/src:
 Lib/PadicHodge/WachKisin/PeriodMatrixBasis.lean cd91a46eb5624b88af20a96d0450bdf059994b93
 Lib/PadicHodge/WachKisin/PeriodMatrixFrame.lean 348d083320f3e9f59100db1a2f96f5a3f8e92923
 Lib/PadicHodge/WachKisin/ChartScalars.lean 8dc59315a323816ecb0eedf46b5aae0a8c714fc5
 Lib/PadicHodge/WachKisin/CrystallinePeriodMatrix.lean cf83fda104fb44177d374d62f06b4d6e68e3db08
 Lib/PadicHodge/WachKisin/FrameTheorem.lean 57d6daa6060f9f00eb27be6525460ba942a73f08
 Lib/PadicHodge/PeriodRings/AmaxStructure.lean 1be9736d2c48bece6dd038c72d14b6f807cff9df

1. Retain actual exists_basis output, not merely det Q != 0.
Write A=A_inf, R=OFlat=A/p, S=chart ring, S_B=bicommutant,
pi:A->R, overbars reduction. A is a p-adically separated domain,
R is a perfect valuation domain. Suppress injective maps into B+.
The input gives det Q!=0, UZ=E^h Q, Z over S_B, and
(hN) if Uy=E^h x, y over S_B, x integral, then x=Qs with s over S;
(hA) if Uy=E^h x, y over B+, x integral, and lQ=delta*g with
p not dividing delta, then delta divides l*x in A.
U has nonzero determinant and U U'=(E tau)^h I.
Frobenius U^phi=v U F, F over S_B, and phi(E) inverse in S_B.
Apply hN to columns of E^h phi(E)^(-h) F phi(Z). This produces
B over S with phi(Q)=v Q B. Crucially B has entries in S.
For g fixing S pointwise, g fixes E and the chart hypotheses hold.
The operator g on B+ preserves Amax and is S-linear; commutation
with multiplication by Z_ij, evaluated on 1, gives gZ=Z.
Using rho*g(U)=U, obtain rho*g(Q)=Q for an integral rho.
These are actual native equations, not assumptions on arbitrary matrices.

2. Coordinate rank detection using the basis property hN.
Write lambda_i:A->S for the native topological coordinates.
The rows r_ij=lambda_i composed with row j of Q belong to S^d.
Suppose t in S^d is annihilated modulo p by every r_ij.
Then all coordinates of Qt belong to pA. Their finite sums with
the topological basis elements also do. Native adic approximation
and separatedness of R modulo powers of zbar imply Qt in pA^d:
for every m the remainder modulo p is in zbar^m R, whose
intersection is zero. This is the same native coordinate detection
used in exists_frame, not an assumption that Q mod p is injective.
Put x=Qt/p in A^d and y=Zt/p in S_B^d (p invertible in S_B).
By hN, x=Qs for some s in S^d. Injectivity of Q implies t=ps.
Thus no nonzero vector over D=pi(S) annihilates all reduced rows.
D is a subring of the domain R. If their rank over Frac(D) were
less than d, a nonzero vector in the common kernel over that field
could be cleared of denominators and lifted to t in S^d, a
contradiction. Choose d rows giving square N over S with
D0=det(Nbar) != 0. This replaces the maximal-row/adjugate selection
lemma at THIS caller by ordinary finite-dimensional rank over a
field; no need to prove its general semiring statement here.
The case d=0 has determinant 1 and needs no argument.

3. One determinant budget excludes the hypothetical mod-p kernel.
Taking determinants of phi(Q)=vQB gives
   phi(det Q)=v^d det Q det B.
Since phi is an automorphism fixing p and v is a unit,
if p divided det B then induction gives p^n | det Q for all n.
Separation contradicts det Q!=0. Thus b=det(Bbar)!=0.
Set K=D0*b!=0. Perfect tilt coordinates kappa_M:R->O_C/p
jointly separate elements, so fix M with kappa_M(K)!=0.
Suppose det(Qbar)=0. The valuation domain gives a nonzero kernel
vector a of minimal support, normalized by dividing by a nonzero
coordinate of least valuation, so a_nu=1. For any ring
endomorphism g preserving its kernel membership, a-g(a) is
a kernel vector with strictly smaller support if nonzero.
Thus g(a)=a. In particular every Galois element fixing S fixes
each a_i, because Qbar= rhobar*g(Qbar) implies Qbar*g(a)=0.
Do not assume a itself lifts to a vector over S.
The native Ax/tilt approximation eventually_exists_coeff_eq_of_fixed
provides, for this fixed M and all sufficiently large n, s in S^d
with kappa_(M+n)(sbar)=kappa_M(a)=kappa_(M+n)(a^(p^n)).
All finitely many coordinates can use the same n.
Put C_0=I, C_(n+1)=Bbar*phi(C_n). Frobenius applied to
Qbar C_n a^(p^n)=0 gives Qbar C_(n+1) a^(p^(n+1))=0
after cancellation of the unit vbar. Hence
   kappa_(M+n)(Qbar C_n sbar)=0.
For clarity lift C_n via the same product of B over S. For any
integral entry r with kappa_j(pi(r))=0, theta_j(r) lies in p O_C.
The surjectivity of theta_j and its kernel (phi^j E) give
r=p u+phi^j(E)w. S-linearity of lambda_i gives
lambda_i(r)=p lambda_i(u)+phi^j(E)lambda_i(w), and consequently
kappa_j(pi(lambda_i(r)))=0. Apply this to all selected rows of
Q*C_n*s. Since C_n and s have lifts in S, we conclude
   kappa_(M+n)(Nbar*C_n*sbar)=0.
The nu coordinate of kappa_(M+n)(sbar) is 1. Multiplication by
the adjugate therefore proves kappa_(M+n)(det(Nbar*C_n))=0
even in the nonreduced ring O_C/p. Merely having a nonzero
kernel vector over that quotient would NOT suffice.
By exact determinant multiplicativity before any valuation,
   det(Nbar*C_n)=D0*b^e_n, e_0=0, e_(n+1)=1+p e_n.
Thus e_n=(p^n-1)/(p-1)<=p^n-1.
In R the following exact divisibility is enough (no norm bound):
   K^(p^n)=(D0*b^e_n)*D0^(p^n-1)*b^(p^n-e_n).
Taking kappa_(M+n) gives 0 on the right, but on the left it
gives kappa_M(K)!=0, a contradiction. Thus p does not divide
det Q. This aggregates all Frobenius iterates into one scalar
exponent, matching the native determinant budget rather than
estimating individual entries. No new Galois hypothesis.

4. Saturation from the actual hA; denominator has no rank factor.
For any integral X with UY=E^h X (Y over B+), apply hA columnwise
with delta=det Q and l each row of adj(Q). Since adj(Q)Q=delta I,
all entries of adj(Q)X are divisible by delta. Obtain L integral
with adj(Q)X=delta L; multiplying by Q and cancelling nonzero
delta in A gives QL=X. In particular X=tau^h I and Y=U' give
QL=tau^h I, exactly as required in RUN74; no factor d*h.
For the remaining factorization of U use the native
exists_Ainf_approx with modulus mu^h entrywise and a common
p exponent n. Equivalently choose integral A0 and W over B+
with p^n U=A0+mu^h W. Choose t in A with mu=t E tau.
Then A0=U(p^n I-t^h U' W); multiply the right input by E^h
to apply the preceding saturation, obtaining A0=Q L0.
Consequently
   U=Q V, V=p^(-n)(L0+(t E)^h L W) over B+.
Substitute into UZ=E^h Q and cancel Q (det nonzero in B+):
   VZ=E^h I.
Finally for any g satisfying FixesThetaZ, choose r with gE=rE
by associated_smul_E and integral rho with rho*gU=U.
Then U*gZ=E^h r^h rho*gQ. The same saturation gives
QG=r^h rho*gQ for integral G. Subtract UZG and cancel U
to get gZ=ZG. This derives the remaining frame output from
the retained basis, scalar approximation and chart foundations.

5. Evidence and precise remaining work.
Original local graph exists_basis -> exists_frame -> both
frame_theorem and uniform_period_bound; latter actual callers
inspected in RUN74 and current FrameTheorem source. New human
graph: basis hN -> coordinate rank N; Frobenius -> det B!=0;
minimal support + fixed tilt approximation + coordinate
preservation + determinant exponent -> p not dividing det Q;
basis hA -> adjugate saturation -> full frame output.
Candidate removal of general exists_det_ne_zero ONLY at
exists_frame, not global pruning or root retirement.
Context key: source pin, chart, rank, U,h,v,Q,Z,B, S and
specific caller; original dependency and axiom ledgers retained.
The native hN/hA proofs themselves remain frontier items.
No inference of uniform CountI or weighted-prime bound, no RH
assumption. Published comparison substitution not established;
do not conflate E-height with tau containment.

Executed local Python/SymPy:
  for p in [2,3,5,7,11,13,17,19]:
      q=1; e=0
      for n in range(1000):
          assert (p-1)*e==q-1 and e<=q-1 and q-e>=0
          e+=q; q*=p
8000 exact integer checks; additionally checked symbolic
Q*adj(Q)=det(Q)*I in size two and negative control 2*2=0
mod 4 although neither factor is zero. These test algebra
only, not the period-ring model, valuation or proof coverage.
lean/lake/elan absent in local shell; scalar Lean declarations
below PREPARED not compiled. No native rh_scan/rh_prune/rh_reduce/
rh_auto/rh_auto_frontier or new CI dispatch this run.
Actual CI receipt checked at cathedral-research-state
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804: six named
TiltingLemma/Filling.Moments checks with classical axioms,
module_1_build timeout124 at 2700.11s, all_requested_checks_ok=false,
full_RH_replay=false. Not evidence of new validation.

RESUME HERE: prove the contraction input to exists_basis hA:
trace its Frobenius-stable coefficient set V, uniform p^N
integral lift of each extended coordinate and approximation
mod (p,xi)^m. Establish the exact rank-independent saturation
quantifiers, preserving Ainf divisor prime-to-p and the original
chart hypotheses. Audit this RUN75 determinant argument independently
and integrate at the actual frame consumers; do not redo RUN74.
HANDOFF TO Galois, integration, editor, independent audit, native replay.
-/

namespace RHGaloisRun75

theorem exponent_budget_step (p e q : ℕ) (hp : 2 ≤ p)
    (he : e+1 ≤ q) : (1+p*e)+1 ≤ p*q := by
  have h := Nat.mul_le_mul_left p he
  simp only [Nat.mul_add, Nat.mul_one] at h
  omega

theorem scalar_saturation_cancel {R : Type*} [CommRing R] [IsDomain R]
    (d x y : R) (hd : d ≠ 0) (h : d*x=d*y) : x=y :=
  mul_left_cancel₀ hd h

theorem frame_scalar_assembly {R : Type*} [CommRing R]
    (u q l c w t : R) (h₁ : u=q*l+t*c*w) (h₂ : t=q*c) :
    u=q*(l+c*c*w) := by
  rw [h₁,h₂]
  ring

#check Lift.Chart.IsPeriodMatrix.exists_basis
#check Lift.Chart.IsPeriodMatrix.exists_frame
#check Lift.Chart.eventually_exists_coeff_eq_of_fixed
#print axioms exponent_budget_step
#print axioms scalar_saturation_cancel
#print axioms frame_scalar_assembly

end RHGaloisRun75
