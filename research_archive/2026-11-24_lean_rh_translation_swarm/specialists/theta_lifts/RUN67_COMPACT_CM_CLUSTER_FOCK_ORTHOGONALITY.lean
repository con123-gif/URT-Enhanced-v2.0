import New.Curve.ConjugateGenerator
import Mathlib.Tactic

/-!
# RUN67 — soft CM compactness and finite Fock inversion at A
26 November 2026; human source-matched derivation, not native replay.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, completion-first.
Read AGENTS, protocol, handoff, lane expansion, compact manuscript, recent
peer commit list through 76590e96 (theta quotient Fourier expansion).
RUN66 917cdb64 + a2f5cd69 is the actual prior generator consumer.
Do not repeat the peer semilinear law or Fourier quotient expansion.

Source ledger (relative to grh-compact/src):
* Lib/CM/MainTheorem/ConjugateCurve.lean 6a5c1242ed3d2ef283cbafb57a7676e4a3062c52:
  conj_isogeny_mem_lattice, thetaQuotient_eq_one, exists_galConjugate,
  exists_taylorVia_twistedTranslate_theta.
* Lib/CM/LocalHeight/IsogenyIntegrality.lean 1b7411b4a950de12649c1f2cd171de834f8363fa:
  exists_conjugate_section (39–55).
* Lib/CM/Sigma/CurveTheta.lean cd276f383c2768ee6039051e407ecac800a7f0d7:
  theta zero set, scaled ideal area and isogeny section rule.
* Lib/CM/FormalGroup/FormalHeight.lean 640cabefca81dde25d092fd6ac057c3bcdd3516e:
  complex_multiplication_theta (38–55), chowla_selberg (82–128).
* Lib/Weil/Construction/FockThetaFunctions.lean 80c7d6ba1d8942e206e7420f62e85d0209c56ae4:
  exists_entireTheta_eq (64–112), translation and product formula (43–59).
* Lib/Shimura/ComplexTheta/ThetaDimension.lean ed569261cc7a60fb2f0b0acc12f804a7201ee34e:
  isCompact_range_norm_thetaShift (75–77), finrank_sq_eq_relIndex (148–197),
  thetaSpace_le_of_thetaShift_mem and schur_lemma (204–214).
* Lib/Shimura/GoodReduction/ThetaOrthogonality.lean 759f783ca424063e815a89a9626fed7be4eba028:
  sum_shift_mul_shift (209–221).
* Lib/Weil/Construction/ConjugateJetDefs.lean bdc5981f77f6b2e3f94b757118ea664a7a1f08:
  VacuumExpansion (30–36).
* New/Curve/FrameSections.lean 6bc331571971534045115e265473cfa148de9f14:
  exists_finitePart_of_isTightFrame (89–126).
* New/Curve/ConjugateGenerator.lean ad3f02ee95b950ae5a4fa98e30fd939e41837ae1:
  exists_isJetConjugate_generator (26–85).

## 1. Normalized CM section uniqueness and finite family

Retain the native conjugate-isogeny identity, proved from the conjugate
section theorem using the curve cubic, section span and section division.
Let C,D have a1(D)=sigma(a1(C)) for sigma fixing K=Q(sqrt(-d)),
d prime 7 mod 8. Write Q=theta_D/(sigma theta_C) as a formal series,
with constant term one; all operations on sigma are coefficientwise.
The native identity for each nonzero integral endomorphism a is
    Q(aX)=Q(X)^(a*bar(a)).
If Q differs from 1, let n>=1 be its first differing coefficient c!=0.
Compare exactly degree n (all intermediate terms disappear):
    c a^n = (a*bar(a)) c.
At a=2 this forces 2^n=4, n=2. At a=omega=(1+sqrt(-d))/2
it forces omega^2=omega*bar(omega). Since omega!=0, this contradicts
omega!=bar(omega). Both endomorphisms are admissible, sigma fixes them,
and their degree is their norm. Hence Q=1. No norm of sigma is used.

In particular for sigma=id and equal a1, the entire normalized theta
functions agree by Taylor uniqueness. Their zero sets are t+Lambda,
so the difference set of the common nonempty zero set recovers Lambda.
Thus their lattice, area, and scalar Hermitian form agree as well.
This establishes that choosing one curve in each a1 fibre in
ConjugateGenerator (34–36) suffices for the normalized theta height;
we need not prove uniqueness of an ordered lattice basis or a torsion
representative. Retain the actual curve zero-set theorem and analytic
identity theorem.

The invariant a1 is algebraic by the native all-p-adic-embeddings
integrality criterion and norm_a1_le_one. Its conjugate values lie in
the finite root set of a nonzero annihilating polynomial. For each
represented root choose a curve. On that curve the function
   z -> exp(-H(z,z)/2) * |theta(z)|
is continuous (H(z,z) real) and Lambda-periodic in absolute value:
the theta transformation law cancels the Gaussian modulus, and the
multiplier has modulus one. A closed fundamental parallelogram is
compact. A maximum over finitely many such parallelograms gives a
single finite M0>=1 for every curve and every translate at 0.
This supplies the exact compact-family bound in RUN66 section 4;
it does not require compactness of Gal(C/K) or continuity of sigma.
The primitive algebraicity criterion and conjugate-section/isogeny
proof remain explicit dependencies.

## 2. Soft CM period and common multiplier

Reconstruct FormalHeight 38–55, keeping the precise preceding finite
torsion-translation theorem (ConjugateCurve, last lemma).
For D=C^sigma, choose Lambda_D=v*a with v!=0 and a a fractional
O_K-ideal. Since the class group has odd order (native
classGroup_sq_bijective), choose a nonzero integral ideal c with
[c]^2=[a]. Absorb the principal ratio into u so that
    Lambda_D = uv*c^2.
Set q=Norm(c)>0, Omega=uv*q, e=q. The area formula gives
    area(D)=|uv|^2 q^2 sqrt(d)/2=|Omega|^2 sqrt(d)/2.
Since q belongs to c, q^2 belongs to c^2, so e*Omega belongs to
Lambda_D. The finite torsion-translate theorem says for each finite
S in K there is v_S in Lambda_D which simultaneously conjugates the
Taylor series of U_(x Omega0)theta_C to U_(x v_S)theta_D, x in S.
Write v_S=uv*y_S with y_S in c^2, and choose a_S=y_S/q.
Then x v_S=x Omega a_S exactly, and every a_S lies in
q^-1 O_K, whose diagonal finite-adelic images lie in q^-1 O_hat_K.
This is compact. The net over finite subsets ordered by inclusion
has a cluster point beta in that compact set (the tail closures
have the finite intersection property). Thus for any fixed finite
S and any neighborhood of beta there exists T containing S with
a_T in the neighborhood. This is exactly the MapClusterPt and
forall_exists_of_atTop use at ConjugateGenerator 69–82. No claim
that beta is an idele or equals an Artin symbol is needed.

This discharges the soft-period/cluster assembly with the same e
and Omega; it does not discharge the earlier finite simultaneous
torsion translation theorem, classGroup_sq_bijective, or the
separate Chowla–Selberg unit normalization.

## 3. Actual Fock inversion and finite Schur average

In FockThetaFunctions let T:F->entireTheta(F), restricted to finitePart.
It is linear and injective by the native real-vector separation
(eq_zero_of_realVec), and T(vac)!=0. Let Lambda0 be the rational
finite-integral lattice imaged at infinity by -realImage, and
Lambda=bar(delta)*Lambda0, delta*bar(delta)=Q>0.
Use the actual real pairing B(u,v)=star u dot v.
The exact finite-to-infinite translation law is
    T(rho(finVec(finiteImage gamma)) F)
          = U_(-realImage gamma) T(F).
The semicharacter is the inverse of the canonical archimedean
multiplier at -realImage gamma by the adelic product formula.
Since bar(delta) is integral, the vacuum invariance at integral
finite vectors makes T(vac) a theta section for Lambda with the
canonical multiplier. The nonzero section also verifies the
Appell–Humbert multiplier cocycle by comparing successive shifts;
positivity follows from B(u,u)>0 when u!=0.

For each a in Lambda^dual, choose gamma_a with
-realImage gamma_a=a: the dual lattice is rationally contained in
Lambda (native exists_nsmul_mem_of_mem_dualLattice). The native
pairing comparison is essential: commute the two finite Heisenberg
translations at gamma_a and bar(delta)*y with y finite-integral.
Transport to T and use the fact that the dual shift of T(vac)
has the same Lambda multiplier. Their commutator is consequently
one. The product formula identifies the resulting character with
psi0 evaluated against delta*finiteImage gamma_a and every rational
integral y. Density and closedness extend to all integral finite y;
self-duality of the standard finite lattice then gives
    delta*finiteImage gamma_a in O_hat_E^n.
This is the actual k(a) at lines 90–97, not a consequence of mere
counting. Retain the commutator and self-duality formulas as native
inputs. By the same identity
    Q*a=-realImage(bar(delta)*delta*gamma_a) in Lambda.
Thus Q Lambda^dual subset Lambda and every dual translate of the
nonzero T(vac) lies in the image of T. By finite theta-group
irreducibility the whole theta space lies in the image of T.
In particular the desired entire S, with the assumed normalized
translation law, is T(F) for some F in finitePart. No p-adic
integrality inferred merely from holomorphicity.

Here is a direct proof of the remaining finite orthogonality
supplier sum_shift_mul_shift. Let H be the finite-dimensional
theta space, r=dim_C H=sqrt([Lambda^dual:Lambda])>0, and let
J=Lambda^dual/Q Lambda^dual. Pick any representative a_j for
each j. Addition by any dual vector permutes J; the representative
difference lies in Q Lambda^dual subset Lambda. Thus the induced
operators U_j are invertible with U_j^-1=U_(-a_j); a representative
change modulo Lambda changes U_j only by a nonzero scalar.
Retain the exact projective translation law and theta-group
irreducibility/dimension theorem, not a supposed genuine
representation of J. For v in H and linear form ell on H,
define the rank-one operator A(w)=ell(w)v and sum
    R=sum_j U_j A U_j^-1.
Conjugating by any dual shift permutes the terms: all scalar
multipliers cancel BEFORE any estimate, since each U_j appears
with its inverse. Hence R commutes with every dual shift, so
Schur gives R=c I. Trace is invariant under conjugation and
tr(A)=ell(v). Therefore
    r*c=|J| ell(v).
Equivalently for f,g in H, evaluate the rank-one construction
with v=f and ell=evaluation at z on g, at w:
    r sum_j (U_-a_j g)(z)(U_a_j f)(w)
       = |J| f(z)g(w).
This is precisely the native sum_shift_mul_shift, with its
sqrt(index) factor and no multiplicity error. Since evaluation
functionals span the dual of H (a function annihilated by all
evaluations is zero), the equation holds for an arbitrary ell.
Choose f=T(vac), g=T(F); apply T injectivity and the shift
identity. This yields the exact VacuumExpansion equation at
FockThetaFunctions 104–112, with multiplier r and shifts
x_j=finiteImage gamma_a_j. No division by r or |J| in the
subsequent integral vacuum construction.

## 4. Caller count and phase audit

Let f=number of infinite places of E, n=rank V. The real lattice
rank is 2fn. Therefore |J|=Q^(2fn), including rank zero (one
element). The notation N in VacuumExpansion is Q=delta*bar(delta),
NOT the conductor N1(s) in ConjugateGenerator. For the original
frame delta=N1(s), Q=N1(s)^2, so |J|=N1(s)^(4fn), exactly the
RUN66 bound. The conjugate frame may instead have Q=(N1(s)*e)^2;
do not use that larger count in bounding the ORIGINAL integral
vacuum. The proof uses the original expansion coefficients and
bounds only their conjugated values via the target F'. This
preserves the claimed uniform C independent of e.

For the chosen linear form in RUN66, U_-x_j0 U_x_j acts by the
finite Heisenberg phase times U_(x_j-x_j0). The alternating
self-pairing ensures inverse sign -x; the vacuum coefficient is
zero or a root of unity by the native vacuum/Heisenberg formula
(as in ConjugateGenerator line 47). Thus r^-1 in the chosen
linear form cancels the expansion multiplier exactly, while
|J| stays on the scalar c. No phase sign is guessed and no
integrality from division by |J| is needed. The finite Fock
orthogonality now has a human source-matched derivation conditional
only on the explicitly identified Heisenberg/product formula and
theta-group foundations.

## Verification and remaining frontier

Original graph: generator -> {soft CM, compact-family, FrameSections,
Chowla–Selberg, norm_gal_vacuumRoot}; FrameSections -> FockThetaFunctions
-> {real separation, product formula, dual-lattice pairing,
ThetaDimension, ThetaOrthogonality}. Reduced human graph retains
all of these inputs, with soft CM and compact-family assembly
and finite orthogonality given above. No global dependency edge
deleted, no old-pin native checks treated as compact evidence.
Context key: pin, same curve C,D,sigma, c,q and finite S; same
WeilData, V, delta,Q, Lambda, multiplier and representative quotient.
Do not reuse with a different polarization without recomputing
the dual pairing and multiplier. No URT, no RH root imported.

Actual shared CI inspected: run 45803534769, status blob
a56e2d3afb99ed8275e81fd63c8494306e57c43f and targeted_results blob
088cd2ec0e935ee1a282f10096949bcf671cc804 on state branch. Six named
B/C checks have only propext, Classical.choice, Quot.sound; A
module build returncode 124 after 2700.11s; all_requested_checks_ok
false, full_RH_replay false. Lean, lake, elan absent locally
(command -v). Native rh_scan/prune/reduce/auto/frontier not executed
on this compact context; no fresh PASS. The independent scalar
certificates and exact native declaration probes below are prepared,
not compiled. No synthetic regressions.

RESUME HERE: derive ConjugateCurve.exists_taylorVia_twistedTranslate_theta
from its actual conjugate-section/divisor proof, including the
denominator 2n^2 and normalization constant, then reconstruct
FormalHeight.chowla_selberg at the actual generator caller
(class group product of isogeny units and Kronecker limit).
Retain all open foundational inputs (including theta-group
dimension/irreducibility, finite pairing, good reduction,
algebraicity and class group oddness) for literature/audit.
HANDOFF TO integration, editor, kernel and literature. The human RH
proof remains incomplete.
-/

namespace ThetaRun67

theorem norm_square_contradiction (w : ℂ) (hw : w ≠ 0)
    (hn : w ≠ starRingEnd ℂ w) :
    w ^ 2 ≠ w * starRingEnd ℂ w := by
  intro h
  apply hn
  exact mul_left_cancel₀ hw (by simpa [pow_two] using h)

theorem orbit_trace_scalar (r J c ell : ℂ) (hr : r ≠ 0)
    (h : r * c = J * ell) : c = J * ell / r := by
  apply (eq_div_iff hr).2
  simpa [mul_comm] using h

theorem conductor_count (N f n : ℕ) :
    (N ^ 2) ^ (2 * (f * n)) = N ^ (4 * f * n) := by
  rw [← pow_mul]
  congr 1
  ring

#print axioms norm_square_contradiction
#print axioms orbit_trace_scalar
#print axioms conductor_count
end ThetaRun67

#check CMLattice.thetaQuotient_eq_one
#check CMLattice.complex_multiplication_theta
#print axioms CMLattice.complex_multiplication_theta
#check IsAppellHumbert.sum_shift_mul_shift
#print axioms IsAppellHumbert.sum_shift_mul_shift
#check Space.exists_entireTheta_eq
#print axioms Space.exists_entireTheta_eq
#check Space.VacuumExpansion
#check Parameters.exists_isJetConjugate_generator
