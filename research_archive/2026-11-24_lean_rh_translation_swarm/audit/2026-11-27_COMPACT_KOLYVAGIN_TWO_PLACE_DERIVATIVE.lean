import Lib.Cyclotomic.Kolyvagin.ComponentBound

/-!
# Independent compact C audit: derivative identity via two-place torsion cancellation
2026-11-27; AUDIT lane 10. HUMAN SOURCE-MATCHED / PARTIAL, not a kernel pass.
Source lsernau/grh-lean pin 72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission latest blob 9f4a2272265e847b3a46422b02d4b37e976bee10, including mandatory
reduction section and 26 Nov completion-first migration. Prior audit cbcefcda2cb3a40f71681c52c182980903321d6b.
Read SWARM_PROTOCOL, HANDOFF_QUEUE, AGENTS, current manuscript and latest peer
commit list (head observed 8193aed743c792455684c54b15fdc7c17cb4df4b).
Galois b1d63411 addresses rank-one prime-to-index reciprocity, not this derivative.
No physical state changes; no URT hypothesis.

Source ledger (paths relative to grh-compact/src):
* Lib/Cyclotomic/Kolyvagin/ComponentBound.lean 61d0f229eda03e81c8d89372f05f7444ca45b09b:
  exists_kolyvagin_cocycles lines 64–186 (H 98–109, hE 110–120, ev 121–142,
  cocycle and ramification 143–154, derivative 155–186);
  exists_detecting_points_component 387–452; sum_floorDiff_dvd 337–360.
* Lib/Cyclotomic/Stickelberger/GaussSums.lean b242e0965fdabcf6a8dcc3da33511507bf8bd4bf:
  exists_jacobi_family 96–end; retain its exact distribution UP TO TORSION.
* Lib/Cyclotomic/OddSha/OddShaBound.lean 71e1148ba135da7530abe211af57ba8a0d63f195:
  exists_length_shaOdd_le, consumers 124 and 127.
* Components.lean fbd540929083786c70247cfeace76a5ae9454547.

## 1. Setup and exact derivative, prior to any norms
Write the multiplicative group of algebraic units of the field (nonzero algebraic
numbers) additively. Put m=l^n, M0=N*m. For each S contained in P, use label
group of M=M0*prod(S) torsion in Q/Z. Choose a SINGLE family J from
exists_jacobi_family at p, and SINGLE roots Y with mY(x)=J(x). No compatible
choice of roots is required. p split mod M0*prod(P), each q in P congruent
1 mod c*M0; q != p,l, q coprime to M (when not in S), q coprime to c.
Write C for the fixed Galois element gamma (not for a scalar), and
F_sigma(x)=(C-sigma*C*sigma^(-1))Y(x) in mu_m, identified with Z/m.
It is m-torsion by J's cyclotomic covariance and commutativity of the
cyclotomic character. Every operator C-sigma*C*sigma^(-1) kills ALL roots
of unity, not merely mu_m. Thus for r in P and x of order dividing
M0*prod(S without r), distribution gives
    sum_{u in F_r^*} F_sigma(x+u/r)=F_sigma(r*x)-F_sigma(x).
No assertion that J's distribution is exactly 1 in multiplicative notation.

Let q not in S; A a place above q; phi a Frobenius at A.
Choose hom L:F_q^* -> Z/m surjective (m divides q-1) and g with L(g)=1.
Take integer representatives L(u); choose tau in inertia at A with
cyclotomic character g^(-1) mod q, using total ramification of Q_q(mu_q).
Both tau and all its conjugates fix mu_M; phi acts on it by q.
For M-torsion x let Y0=Y(x), Y_u=Y(x+u/q), Yq=Y(q*x).
For sigma=tau, pi=phi set
    t_u = sigma Y_{g*u} - Y_u, i = pi Y0 - Yq,
    R(sigma,pi) = sum L(u)*t_u - i.
All t_u and i lie in mu_m by J-covariance. Let
    T = sum_{u != 0} Y_u + Y0 - Yq.
T is torsion by mT being torsion (Jacobi distribution). This is true even
when q*x != x; do NOT drop Yq. Inertia and Frobenius give, modulo principal
units at A, t_u = Y_{g*u}-Y_u, i = q*Y0-Yq; all Y entries are local units
since q != p. Reindex with g^(-1), keeping integer lifts:
    sum L(u)*(Y_{g*u}-Y_u)
      = sum (L(g^(-1)*u)-L(u))*(Y_u-Y0)
      = -sum (Y_u-Y0) + sum m*k_u*(Y_u-Y0).
The last sum lies in principal units since m*(Y_u-Y0)=J(x+u/q)-J(x)
does. Therefore R(tau,phi)+T lies in principal units at A.
Apply the IDENTICAL argument to tau'=C^(-1)tau C, phi'=C^(-1)phi C and
A'=C^(-1)A (with the usual left action on places). They have the same
cyclotomic characters and residue prime. So R(tau',phi')+T lies in the
principal units at A'. It is important that these may be different places.
Any torsion element in principal units at a q-adic place has q-power order:
its prime-to-q part reduces injectively. Hence BOTH R+T have q-power order
in the SAME global torsion group, independent of place. Their difference
is q-primary and also in mu_m, hence zero since q!=l. This gives
    R(tau,phi)=R(tau',phi').
Direct expansion, using the abelian action on torsion, gives
    C^(-1)(sum L(u)*F_tau(x+u/q) - F_phi(q*x))
        = R(tau,phi)-R(tau',phi') = 0.
This proves the actual pointwise same-prime derivative identity
    sum L(u)*F_tau(x+u/q)=F_phi(q*x).
No q-power valuation estimate, division by log weights, or exact
root-of-unity distribution assumed. The proof replaces the source's
prime-to-m torsion-clearing calculation at lines 163–186 by a two-place
torsion argument. Note the q*x on RHS: q is 1 modulo M0, NOT necessarily
modulo prod(S); only AFTER the remaining weighted sum can it be removed.

## 2. Weighted shift independence, covariance and cocycle
Define Lambda_S(d) on a function of labels with values in Z/m, followed
by the O/l^n-linear weighted sum over a in (Z/M0)^* with weight
a^e psi(a); label a/M0+sum u/r, weight prod_{r in S}(L_r(u)-d_r).
All sums over units at auxiliary primes, all arithmetic in the quotient.
For any r in S the difference obtained by changing d_r is a scalar times
the Lambda_{S without r} weighted sum of
F_sigma(r*x)-F_sigma(x). By induction on |S|, Lambda_{S without r}
is independent of the other shifts; multiplication by r fixes the base
label (r=1 mod M0) and permutes every other prime's labels, translating
each L_s by a constant. Hence this difference is zero. Start at empty
S. This proves simultaneous shift independence by changing one coordinate
at a time, for arbitrary F_sigma in this family, not arbitrary functions.
In particular for q not in S, multiplication of labels by q leaves the
Lambda_S weighted sum unchanged, even if q*x != x pointwise. Applying
Lambda_S to the derivative just proved gives exactly
    kappa_{S union {q}}(tau)=kappa_S(phi)
at the SAME A, with tau chosen once independent of x. No division or
averaging over different inertia groups.

For sigma with cyclotomic multiplier a on label group M, exact identity
    F_{sigma eta}(x)=F_sigma(x)+sigma F_eta(a^(-1)*x)
follows by writing sigma^(-1)Y(x)=Y(a^(-1)*x)+torsion; the commutator
kills the correction. On mu_m, sigma multiplies by a. Reindex all labels
by a; base weight gains a^e psi(a), prime logarithms translate and
shift independence removes them. Thus kappa_S is the source twisted
cocycle with cyc^(e+1)*psi, and kappa_S(gamma)=0 since F_gamma=0.
Local constancy follows from the finitely many algebraic Y labels and
finite root group (all their stabilizers are open). At inertia off
l,p,S subject to cycloGalGroup N, the inertia element fixes mu_M.
The differences sigma Y(x)-Y(x) and the corresponding conjugate
difference are mu_m elements in principal units at the respective
places, hence zero (residue characteristic != l); Y entries are units
off p. Consequently F_sigma(x)=0 there. These are the native
inertiaOff N l (insert p S) hypotheses, not a stronger unramified
statement at places dividing N without the cyclotomic restriction.

## 3. Bottom class and exact sign
At p choose r=p^(1/m) and tame inertia tau with tau r-r=mu(1)
in the additive notation (m=1 quotient trivial). The normalized order
of J(x) at B is floorDiff c x; thus Y(x)-floorDiff(c,x)*r is a unit.
tau fixes mu_m and fixes the residue field, so by reduction rigidity
    tau Y(x)-Y(x)=floorDiff(c,x)*mu(1).
If a is gamma's cyclotomic multiplier mod M0, direct expansion (tau
fixes roots and labels) gives
    F_tau(x)/mu(1) = a*floorDiff(c,x)-floorDiff(c,a*x).
Therefore kappa_empty(tau) = [a-(a^e psi(a))^(-1)]*Bsum, with
Bsum the source sum over units of floorDiff(c,a/M0)*a^e psi(a).
Multiplication by the unit a^e psi(a) gives precisely
(cyc^(e+1) psi(gamma)-1)*Bsum=0 when the bottom cocycle vanishes on
inertia. No assumption about gamma stabilizing B; its label action
and tau at B suffice. This is lines 121–142, using the tame generator,
Jacobi valuation and local root rigidity, not a claim about arbitrary
Euler-system cocycles.

## 4. Actual finite detector consumer (387–452)
Keep the original large-prime and oddness assumptions, X != 0, e>0,
m_depth=v_l(X)+1 (distinguish this from derivative modulus m=l^m_depth).
Choose a by CRT, primitive mod l, 1 mod N, so 2, phi(N*l), a^e-1,
a^(e+1)-1 are units. Choose gamma in l-inertia with character
a^(e+1). Let Z be the nonzero l-torsion in the component; Y(T) is
the source module of e+1-twisted cocycles modulo l^m_depth with
allowed extra ramification T. J(T) means all primes in T split
mod N*l and Y(T)[l] subset Y(empty). Retain finiteness of Z and Y(empty),
Chebotarev, exact mod-l reciprocity (prior audit), odd visibility and
the source Frobenius-to-all-decomposition-places bridge.
Assume no family of m_depth detectors works. For each T of size
<=m_depth with J(T), choose a nonzero z in Z vanishing at the chosen
Frobenius at every prime in T (pad detector tuple if necessary, then
take the last nonzero l-power multiple). Thus z vanishes at ALL
decomposition groups at these primes. If a new split q detects z
then q notin T, and mod-l reciprocity implies J(T+q): every
l-torsion y allowed the additional ramification vanishes at its
inertia, and hence belongs to Y(T), then Y(empty).
For each pair of a nonzero normalized y in Y(empty) visible on
cycloGalGroup(a*N*l^m_depth) and z in Z, choose ONE prime q via
Chebotarev detecting both. The finite set Q of these choices is fixed
BEFORE selecting the bottom prime p split mod N*l^m_depth*prod(Q)
detecting the z selected for T=empty. Thus J({p}). Use the SAME
Kolyvagin family with P=Q, c=a, n=m_depth. The q choices satisfy
the stronger congruence a*N*l^m_depth as required.
Descending induction for i=m_depth,...,0:
    |S|<=i and J({p} union S) imply l^i*kappa_S in Y(empty).
Base l^m_depth kills the coefficient module. In the induction step
the i+1 assertion gives y=l^(i+1)*kappa_S in Y(empty). If y != 0,
normalization at gamma and the unit character defect force y visible
on the specified cyclotomic subgroup. Choose the z associated to
T={p} union S (size <=i+1<=m_depth); its paired q in the PRESELECTED
Q detects y and z; q is new and J(T+q). Since |S+q|<=i+1, the higher
induction step kills l^(i+1)*kappa_{S+q} on q-inertia. The same-place
derivative gives y(phi)=0, contradiction. Therefore y=0 and
l^i*kappa_S is l-torsion; J(T) places it in Y(empty). At i=0 the
bottom class is unramified at p. Section 3 and the unit character
defect yield Bsum=0. sum_floorDiff_dvd then forces (a^(e+1)-1)*X=0
mod l^m_depth, impossible since its valuation is v_l(X).
This verifies the detector recursion, not a new proof of
sum_floorDiff_dvd or IsStickelbergerBound existence. The actual
OddShaBound consumer uses the original annihilator for small
primes and detector injection for large primes, not an inference
of module length from annihilation alone. Keep the uniform integer,
all twist/modulus hypotheses, local bridges and source cost.

## 5. Evidence, graph and controls
Source-visible original local graph:
exists_length_shaOdd_le -> exists_detecting_points_component ->
exists_kolyvagin_cocycles -> exists_jacobi_family + H/hE + ev +
principalUnits/reindex/torsion-clearing + local tame generator.
Reduced human graph keeps the identical caller and Jacobi hypotheses;
replaces the last local torsion-clearing derivation with the two-place
q-primary subgroup cancellation above, no global deletion claimed.
Detector induction still depends on finite Y/Z, simultaneous
Chebotarev, reciprocity_mod_ell, odd visibility, unit CRT and
sum_floorDiff_dvd. Preserve original/reduced dependency graphs and
axiom records; no edit to shared graphs. Context cache key compact
pin, O,l,n,N,e,psi,c,p,B,Q,S,q,A,gamma, chosen J,Y,L; a local
substitution cannot globally remove a dependency. Backtrack from
pointwise q*x=x (false), and from exact Jacobi distribution (not
supplied). No root or theorem import used as premise of reconstruction.
Axioms for newly written human replacement not independently kernel
extracted; native Lean/Lake absent locally (command -v returned empty).
Prepared executable below for shared compact native runner; import is
the actual primitive module, no Main. Old engine status files checked:
45577239749 and 45576756833 pass on ORIGINAL pin only. Actual compact
run 45803534769 targeted_results.json: six named native declarations
in TiltingLemma and Filling.Moments, three standard axioms; module_1
timeout 124, all_requested_checks_ok=false, full_RH_replay=false.
No new rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier run.
No new native PASS. No claim of benchmark or full human proof.

Executed exact negative-control assertions (JS, 2026-11-27):
q=7,m=3,g=3,g^-1=5, L(1..6)=[0,2,1,1,2,0].
Coefficient L(g^-1*u)-L(u)=[2,-1,-1,-1,-1,2], all -1 mod 3,
sum 0; wrong +1 sign fails all 6. q=7, r=13, base 3:
both q,r are 1 mod base, but q*x != x for x=1/13.
Reproducible: iterate u=1, g*u mod 7 six times, assign L(u)=i mod 3;
assert each coefficient congruent -1 and sum zero; assert 6 mod 13 !=0.
These are controls of sign/quantifier only, not evidence of the theorem.

RESUME HERE: Independently derive sum_floorDiff_dvd (337–360) and
IsStickelbergerBound's actual integer supplier in StickelbergerInteger.lean,
then audit OddShaBound's uniform sum of valuations and degree at its
Ribet consumer. Do not repeat the completed derivative algebra.
HANDOFF TO integration, Galois, literature, kernel and human editor.
Verdict AGREE / PARTIAL. Human source-matched derivation of derivative
family and detector induction; native replay and uniform integer/length
bridge remain outstanding; no RH root closure.
-/

namespace RHCompactAuditKolyvagin

-- Abstract core of the new two-place argument. Q is the common
-- q-primary torsion subgroup, M the m-torsion subgroup.
theorem twoPlaceCancel {A : Type*} [AddCommGroup A]
    (Q M : AddSubgroup A) (R R' T : A)
    (hQ : R + T ∈ Q) (hQ' : R' + T ∈ Q)
    (hM : R ∈ M) (hM' : R' ∈ M)
    (hsep : ∀ x : A, x ∈ Q → x ∈ M → x = 0) :
    R = R' := by
  have hq : R - R' ∈ Q := by
    have he : R - R' = (R + T) - (R' + T) := by abel
    rw [he]
    exact Q.sub_mem hQ hQ'
  exact sub_eq_zero.mp (hsep _ hq (M.sub_mem hM hM'))

#print axioms twoPlaceCancel
end RHCompactAuditKolyvagin

#check exists_kolyvagin_cocycles
#check exists_detecting_points_component
#check sum_floorDiff_dvd
#print axioms exists_kolyvagin_cocycles
#print axioms exists_detecting_points_component
