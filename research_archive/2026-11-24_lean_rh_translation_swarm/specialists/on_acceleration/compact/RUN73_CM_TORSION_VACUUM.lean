import Lib.CM.MainTheorem.ConjugateCurve
import Lib.Weil.Construction.FockThetaFunctions
import Mathlib.Tactic

/-!
# RUN73 — exact CM torsion normalization and finite Weil vacuum supplier
2026-11-27. Source-matched human derivation, with upstream premises explicitly
retained. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Latest mission a77b7242e95a26f4e6f337b39ab75169228d6acd, editor
0a3ccf19 (manuscript blob d3d4b13233d81e40b5aad8ed8df79be69f367181),
integration stand-back 3028d752, and peer positivity 29129d5a, character
1f40f707. Read protocol, handoff, expansion and AGENTS. This advances the
integral vacuum foundation of A; RUN63's numerical suppliers are not redone.
Prior checkpoint RUN72 2a198f505994f93fe9008462058c61431bfb905c.

## Actual source ledger (compact paths relative to grh-compact/src)
- Lib/CM/MainTheorem/ConjugateCurve.lean 6a5c1242ed3d2ef283cbafb57a7676e4a3062c52:
  conj_isogeny_mem_lattice, thetaQuotient_eq_one,
  exists_galConjugate, exists_taylorVia_twistedTranslate_theta.
- Lib/CM/LocalHeight/IsogenyIntegrality.lean 1b7411b4a950de12649c1f2cd171de834f8363fa:
  thetaQuotient, taylorAtZero_monomialSection, exists_conjugate_section.
- Lib/CM/Sigma/CurveTheta.lean cd276f383c2768ee6039051e407ecac800a7f0d7:
  CMLattice, twistedTranslate, sections, theta zeros, theta evenness,
  multiplier_eq_neg_sigmaSign.
- Lib/CM/FormalGroup/FormalHeight.lean 640cabefca81dde25d092fd6ac057c3bcdd3516e:
  complex_multiplication_theta (consumer).
- Lib/Shimura/ComplexTheta/ThetaDimension.lean ed569261cc7a60fb2f0b0acc12f804a7201ee34e:
  finrank_sq_eq_relIndex, thetaSpace_le_of_thetaShift_mem, schur_lemma.
- Lib/Shimura/GoodReduction/ThetaOrthogonality.lean 759f783ca424063e815a89a9626fed7be4eba028:
  sum_shift_mul_shift.
- Lib/Weil/Construction/FockThetaFunctions.lean 80c7d6ba1d8942e206e7420f62e85d0209c56ae4:
  entireTheta_translate_finiteImage, semichar_finiteImage,
  Space.exists_entireTheta_eq.
- Lib/Weil/Construction/ConjugateJetDefs.lean bdc5981f77f6b2e3f94b757118ea664a7a1a1f08:
  Space.VacuumExpansion.
- New/Curve/FrameSections.lean 6bc331571971534045115e265473cfa148de9f14:
  Parameters.exists_finitePart_of_isTightFrame (consumer).
- New/Curve/ConjugateGenerator.lean ad3f02ee95b950ae5a4fa98e30fd939e41837ae1:
  exists_isJetConjugate_generator (RUN72 consumer).
The readable companion grh/src/Lib/CM/ConjugateCurve.lean
57cdc875440bfb5cb46ab67915289432d9e1621b was checked for the pointwise
normalization argument. Compact theorem statements and witnesses control.

## 1. Self-isogeny quotient law with no general isogeny-conjugacy premise

Fix d prime 7 mod 8, K=Q(sqrt(-d)), sigma fixing K, CM data C,D with
a1(D)=sigma(a1(C)). Write T for Taylor series at zero, s_C for the
sigma *function* (not the automorphism), and Q=T theta_D/(sigma T theta_C).
Both theta series have constant term 1; Q is a formal unit with Q(0)=1.
Retain the actual exists_conjugate_section: for every point z of D
there is y in C and a nonzero multiplier mu, with a degree-m section
f of C transported to a degree-m section g of D having
Tg=Q^m sigma(Tf) and g(z)=mu^m sigma(f(y)).
Retain taylorAtZero_monomialSection, the simple theta zero and sigma
zero loci, and the native section pullback by an isogeny.

Only self-isogenies by nonzero a in O_K are needed for this quotient.
They act on both lattices, sigma(a)=a, and their common degree N is
a*conj(a)>0, by the real lattice determinant. Transport the sections
theta_C(a z) (degree N) and s_C(a z)^2 (degree 2N) to A and B on D.
The degree-1 and degree-2 monomial identities for theta_D and s_D^2
and formal rescaling give, before taking any norms,
    T(B(z)*theta_D(a z)^2)=T(s_D(a z)^2*A(z)^2).
Indeed both sides are Q(z)^(2N)*Q(a z)^2 times the same conjugated
product of the original two Taylor series. Equality of entire functions
follows by analytic uniqueness, without applying sigma to arbitrary
analytic limits or asserting its continuity.

At a zero of theta_D(a z), s_D(a z) is nonzero since the zero sets
are t_D+Lambda_D and Lambda_D, with t_D not in Lambda_D.
Hence A vanishes there. The denominator theta_D(a z) has only
simple zeros (a != 0), and A and that denominator have identical
degree-N automorphy. The quotient extends holomorphically across
all zeros, is lattice-periodic, and is bounded on a compact
fundamental parallelogram, hence constant by Liouville.
At zero A(0)=theta_D(0)=1, so the constant is 1. On Taylor series,
cancel the common formal unit sigma(T theta_C(a z)) to obtain
    Q(a z)=Q(z)^N.
This is the self-isogeny clause consumed by thetaQuotient_eq_one.
The general isogeny-conjugacy lemma still has another consumer in
exists_galConjugate, so it is NOT removed globally.

## 2. Two endomorphisms force Q=1

If Q != 1 let k>=1 be the first nonzero coefficient c of Q-1.
Taking the coefficient of z^k in the exact identity above gives
    c a^k=N c, hence a^k=N.
There is no contribution from products of two or more terms of Q-1
because their degree is at least 2k. For a=2, N=4, so k=2.
For a=sqrt(-d)=2*quadGen(d)-1 in O_K, N=d, the same equality gives
    -d=a^2=d,
contradicting d>0. Thus Q=1. This alternative uses the two actual
self-endomorphisms and not an arbitrary assumption that theta
coefficients are algebraic. The use of sqrt(-d) rather than quadGen
in the final coefficient comparison is legitimate since both are
in O_K and fixed by sigma. The previous existence and monomial
transport suppliers are retained. In particular this works for
sigma.symm as used by the finite-set theorem.

## 3. One torsion translate witness, including the zero midpoint case

Now assume Lambda_C=Omega O_K. Fix a finite set S of K. Choose one
nonzero integer n with n*S subset O_K (clear denominators simultaneously)
and write u=Omega/(2 n^2). Apply the conjugate-section result in the
reverse direction D -> C with tau=sigma^-1 at u. Since Q=1, obtain
one w in C (the complex plane, viewed as a point of D) and mu != 0
such that every degree-m section f of D transports to a section g of
C with Tg=tau(Tf) and g(u)=mu^m tau(f(w)).
For each a in O_K, precompose f by a and use degree m*N(a).
Since tau fixes a, analytic uniqueness gives the SAME transported
evaluation
    g(a u)=mu^(m*N(a)) tau(f(a w)).
For a=0 this equation also follows directly by evaluating series
at zero (N(0)=0). Thus zero loci transfer in both directions at
all such points. This uses the same w and mu for all m,f,a, not a
separate point for each translate.

Apply to the degree-two monomial s_D^2 at a=2n^2. Since Omega is
a C period and s_C^2 is the reverse-conjugate section, the transferred
zero implies v=2n^2*w is a D period. This v is chosen before s in S.

Fix s in S. Set f_C(z)=U_{s Omega} theta_C(n z), and
f_D(z)=U_{s v} theta_D(n z), where U_y theta(z)=exp(-(H(y,z)+H(y,y)/2))
theta(z+y), exactly the native sign convention. Both are degree-n^2
sections by the isogeny pullback and n*s integral. Let g be the
reverse-conjugate of f_D. At a zero z of f_C,
    n z+s Omega+t_C in Lambda_C.
Since 2t_C is a period, twice the point without t_C is a period;
multiplying by n gives 2n^2 z+2n*s*Omega in Lambda_C.
Using Lambda_C=2n^2*u O_K, write z=(b-2n*s)u with b in O_K.
At that point n z+s Omega=n b u. By transferred zeros of the
degree-one theta monomial, theta_D(n b w)=0. The corresponding
point z'=(b-2n*s)w is a zero of f_D since
    n(b-2n*s)w+s(2n^2*w)=n b w.
Because b-2n*s is integral, the same transported evaluation gives
g(z)=0. The two sections g,f_C have equal degree and multiplier,
and f_C has simple zeros since n != 0. The quotient argument
of section 1 gives g=c*f_C for some constant c.

To determine c, put p=n^2*s*u and p'=n^2*s*w. At z=-n*s*u,
the shift exponent in U_(2p) theta_C(-p) cancels exactly:
H(2p,-p)+H(2p,2p)/2=-2H(p,p)+2H(p,p)=0.
Thus U_(2p) theta_C(-p)=theta_C(p), and similarly for D.
Transport the unshifted section theta_D(n z) and f_D at the
SAME a=-n*s, same degree n^2, same mu and same N(a). Since theta
is even, this gives
    theta_C(p)=L*tau(theta_D(p')),
    c*theta_C(p)=L*tau(theta_D(p')),
where L=mu^(n^2*N(a)) != 0.
If theta_C(p) != 0, cancel it and obtain c=1.

If theta_C(p)=0, then theta_D(p')=0 too. For either curve E,
theta_E(q)=0 implies q+t_E is a period; hence 2q is a period
and (2t_E+2q)/2 is a period. The actual
multiplier_eq_neg_sigmaSign and sigmaSign definition give multiplier
(2q)=-1. Since theta_E(0)=1, U_(2q) theta_E(0)=-1.
Comparing the constant Taylor coefficients of g and f_D now gives
c*(-1)=tau(-1)=-1, again c=1. The zero-midpoint case cannot be
discarded by a generic nonvanishing assumption.

Thus T f_C=tau(T f_D). The coefficient rescaling factors n^k are
nonzero for every k and are fixed by sigma. Apply sigma and cancel
n^k coefficientwise to obtain exactly
    sigma T(U_(s Omega)theta_C)=T(U_(s v)theta_D)
for every s in the given finite set, with one v in Lambda_D.
This supplies the finite-set conjugacy in RUN72 section 1.
Still retained: existence of the conjugate CM curve, section
transport and monomial conjugacy, simple sigma/theta zeros,
section pullback and exact multiplier identity. No identification
with the Artin map required.

## 4. Exact theta-group averaging and vacuum expansion

Fix the positive Appell-Humbert data (L,B,chi) from the native
Space.exists_entireTheta_eq. Let H be the space of theta sections,
h=dim_C H>0, and retain the actual Frobenius theorem
finrank_sq_eq_relIndex: h^2=[L^vee:L] and the shifts U_a span End(H).
In particular shifts generate the orbit span of every nonzero
section: choose any linear functional l with l(f)=1; the rank-one
map x -> l(x)g sends f to arbitrary g and is a linear combination
of shifts. This proves the exact orbit span consumer without a
separate additional irreducibility premise.

For finite T and representatives a_j in L^vee whose multiset
is permuted modulo L by every dual translation, let
    A_z(x)=sum_j (U_-a_j x)(z) U_a_j f.
Conjugating the rank-one summands by U_b permutes them modulo L.
Every scalar cocycle and lattice multiplier cancels against its
inverse in the two factors. In fact each summand is
U_a_j (f tensor ev_z) U_a_j^-1, since U_-a_j U_a_j=Id.
Thus A_z commutes with every shift, hence with End(H), so
A_z=c Id. Trace of each summand is f(z) (trace of rank one,
or cyclicity), so
    h A_z = |T| f(z) Id.
Evaluation on g at w gives the actual
sum_shift_mul_shift with h=floor sqrt([L^vee:L]) (an exact integer).
No norm, separate orbit comparison or choice of a basis enters.

For the native Fock theorem, denote the scalar d of that theorem
by delta, with delta integral, delta*star(delta)=N>0; this is NOT
the quadratic discriminant d in sections 1-3. Let T0=entireTheta,
which is injective by the native real-vector uniqueness lemma.
The lattice L is the image of rational gamma with finiteImage
gamma in stdLattice under -realImage(star(delta)*gamma).
The translated vacuum T0(vac) is nonzero and in H by the actual
product-formula identity semichar_finiteImage and standard vacuum
invariance. The given S also belongs to H by the normalized-shift
condition. For each a in L^vee choose gamma_a rational with
-realImage(gamma_a)=a: a common integer multiple of a lies in L,
then divide the corresponding rational coordinate. The native
translation identity gives U_a T0(vac)=T0(rho(finVec x_a)vac),
x_a=finiteImage gamma_a. Hence the just-proved orbit span and
stability of finitePart under translations produce F in finitePart
with T0(F)=S. This is existence, not just a bound on an assumed F.

The required integrality of the finite representatives is
delta*x_a in stdLattice. For all rational y with finiteImage y
in stdLattice, the shift at -realImage(star(delta)*y) acts by the
same lattice multiplier on T0(vac) and U_a T0(vac), because a is
dual. Use the translation law, nonzero vacuum and injectivity to
deduce that the finite Heisenberg commutator has character 1.
The native finite pairing moves star(delta) from the second
argument to delta in the first. Rational finite images in the
open standard lattice are dense there. Continuity of that character
and the standard lattice annihilator identity
mem_stdLattice_iff_psi0 now give delta*x_a integral. This retains
the actual finite Heisenberg/annihilator theorem, not a claim that
a rational representative is automatically integral.

Consequently N a=-realImage(star(delta)*(delta*gamma_a)) lies in L.
Use the finite additive quotient J=L^vee/N L^vee, not L^vee/L:
N L^vee subset L, so addition by each dual vector permutes the
representatives modulo L. As L^vee has rank 2*f*r with f infinite
places and r coordinate rank, |J|=N^(2*f*r), including rank zero.
Apply the exact averaging identity with f=T0(vac), g=T0(F).
For any w,z it says
    h sum_j T0(rho(finVec(-x_j))F)(z)
             T0(rho(finVec x_j)vac)(w)
      = |J| T0(vac)(z) T0(F)(w).
Fix z and use injectivity of T0 in the variable w to obtain an
identity of vectors. Apply ANY complex-linear functional ell to
that vector identity; then use injectivity in z. This gives
    sum_j h*ell(rho(finVec x_j)vac)*rho(finVec(-x_j))F
      = |J|*ell(F)*vac.
Here multiplication of vectors denotes scalar multiplication.
It is exactly Space.VacuumExpansion with multiplier h, chosen
representatives x_j, and |J| as above. This avoids an incorrect
claim that evaluation functionals span the dual of an infinite
dimensional ambient space. The cardinality for RUN72's frame is
N=N1^2, hence |J|=N1^(4*f*r), not N1^(2*f*r).
All choices of F and representatives precede ell.

## Integration and remaining frontier

These supply actual local interfaces of RUN72:
finite-set conjugacy -> complex_multiplication_theta -> common finite
adele and same conjugate frame; orthogonality -> exists_entireTheta_eq
-> frame-section construction -> uniform vacuum scalar and conjugacy.
Both chains feed exists_isJetConjugate_generator, then RUN71 uniform
bound -> RUN70 stage -> RUN69 global and the local jet foundation of A.
The primitive Frobenius dimension theorem, theta/section transport
(especially exists_conjugate_section), conjugate curve existence
(including preservation of the two-torsion restrictions), exact
finite pairing and Fock translation/product formula, frame local
height integrality, Chowla-Selberg and vacuumRoot norm remain.
The earlier marked Hecke HasType/elementary divisor suppliers and
B/C remain open. No inference of RH or the outer-shell prime bound.

Original and reduced global dependency graphs and all existing
axiom evidence are unchanged. The above is a local conditional
source-level replacement; no claim of elaborated graph coverage
or globally removed edge. Cache contexts: compact pin; C,D,sigma,
S,n,u,w,mu; E,delta,N,V,B,L,J,F, same vacuum and all ell.
The isogeny supplier remains at its other consumer; no URT.

Execution: local command -v lean/lake/elan returned none. Native
rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier not run on this pin.
Actual state receipt compute/rh-compact-primitives-replay-20261126/
outputs/targeted_results.json 088cd2ec0e935ee1a282f10096949bcf671cc804
was inspected: six named checks with standard propext, Classical.choice,
Quot.sound; module_1_build timeout 124 after 2700.11s;
all_requested_checks_ok=false, full_RH_replay=false.
The following executable Lean certificates are PREPARED, not compiled;
their scope is the exact scalar substeps and native declaration probes,
not a formal proof of the entire human argument. No PASS or speed claim.
Use the existing shared native runner; no protected workflow edits.

RESUME HERE: discharge exists_conjugate_section by explicit cubic
coordinates at ordinary points and the theta-zero point, including
the homogeneous scalar mu and the degree-m monomial span; then
connect the actual conjugate-curve existence and exact same-frame
local integrality to RUN72. Independently audit the finite
Heisenberg pairing normalization in Space.exists_entireTheta_eq
and the marked Hecke caller. Do not repeat the already derived
torsion normalization or RUN63 numerical estimates.
HANDOFF TO integration/editor, theta lane, independent audit,
shared native runner. Human RH reconstruction remains incomplete.
-/

namespace RHAccelerationRun73

theorem two_pow_eq_four (n : ℕ) (h : (2 : ℕ)^n = 4) : n = 2 := by
  cases n with
  | zero => norm_num at h
  | succ n =>
    cases n with
    | zero => norm_num at h
    | succ n =>
      cases n with
      | zero => rfl
      | succ k =>
        have hp : 0 < (2 : ℕ)^k := by positivity
        simp only [pow_succ] at h
        omega

theorem leading_obstruction (d a : ℂ) (hd : d ≠ 0) (n : ℕ)
    (h2 : (2 : ℕ)^n = 4) (ha : a^2 = -d) (hn : a^n = d) : False := by
  have h := two_pow_eq_four n h2
  subst n
  apply hd
  linear_combination (ha - hn) / 2

theorem torsion_recenter (n s b u : ℂ) :
    n*((b-2*n*s)*u)+s*(2*n^2*u) = n*b*u := by ring

theorem midpoint_exponent (H : ℂ) : -2*H+(4*H)/2 = 0 := by ring

theorem cancel_common_value (c u v k : ℂ) (hu : u ≠ 0)
    (h : u = k*v) (h' : c*u = k*v) : c = 1 := by
  have hz : (c-1)*u = 0 := by linear_combination h' - h
  rcases mul_eq_zero.mp hz with hz | hz
  · exact sub_eq_zero.mp hz
  · exact (hu hz).elim

theorem zero_midpoint (c : ℂ) (h : c*(-1) = -1) : c = 1 := by
  linear_combination -h

#check CMLattice.thetaQuotient_eq_one
#check CMLattice.exists_taylorVia_twistedTranslate_theta
#check IsAppellHumbert.sum_shift_mul_shift
#check Space.exists_entireTheta_eq
#print axioms two_pow_eq_four
#print axioms leading_obstruction
#print axioms torsion_recenter
#print axioms midpoint_exponent
#print axioms cancel_common_value
#print axioms zero_midpoint
#print axioms CMLattice.exists_taylorVia_twistedTranslate_theta
#print axioms Space.exists_entireTheta_eq

end RHAccelerationRun73
