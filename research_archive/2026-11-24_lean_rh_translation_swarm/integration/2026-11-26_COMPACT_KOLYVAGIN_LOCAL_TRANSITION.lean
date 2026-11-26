import Lib.Cyclotomic.Kolyvagin.ComponentBound

/-!
# Integration RUN56: independent local Kolyvagin transition audit
26 Nov 2026. HUMAN SOURCE-MATCHED, NOT NATIVE REPLAY.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; protocol
4b77b161d6876915c15cea5a4d4a519beaf5de74. Read latest manuscript,
lead primitive ledger, unified determinant and peer handoffs. This is
an independent REVIEW of literature RUN52 (blob aa9f09ebbb9745fb7946eb3117451d2e19da0f15),
not a novel Euler-system construction. It completes the three explicitly
retained local branches of integration 40f4331a at their actual caller.

SOURCE: Lib/Cyclotomic/Kolyvagin/ComponentBound.lean
61d0f229eda03e81c8d89372f05f7444ca45b09b, exists_kolyvagin_cocycles
(actual proof body, ev and last three goals; native hE, H, U, W).
Lib/Cyclotomic/Stickelberger/GaussSums.lean
b242e0965fdabcf6a8dcc3da33511507bf8bd4bf, exists_jacobi_family.
Retain all guards: m=l^n (n=0 trivial); M0=N*m; I subset P;
M=M0*prod I; q in P-I, q=1 mod c*M0; p=1 mod M0*prod P;
q != p,l and gcd(q,M)=gcd(q,c)=1. Coefficients O/(m).
Same J, roots y(x) with m*y(x)=J(x), gamma, root identification
mu: Z/m -> mu_m, F_g and Lambda as in integration 40f4331a.
Use additive notation on multiplicative algebraic units. Let U_A be
the principal-unit subgroup at a place A.

1. Ramification. For g in inertia at A above r outside l,p,I,
fixing the Nth roots, inertia also fixes all roots of order
m*prod I, so fixes the Mth roots. Thus g^-1 y(x)-y(x) is in mu_m.
Both y(x) and gamma y(x) are local units because the corresponding
Jacobi elements are units away from p. Inertia acts trivially on
residue units; g^-1 y(x)-y(x) belongs to U_A. Prime-to-r root
rigidity makes it zero. Then
mu(F_g(x))=(1-g)gamma y(x) is again in mu_m intersect U_A=0.
Hence kappa_I(g)=0 for exactly inertiaOff N l (insert p I).
No claim of vanishing at l or at the auxiliary ramified places.

2. Bottom. At B over p take a root r0 with m*r0=p, and a tame
inertia tau such that tau r0-r0=mu(1), supplied by native local
tame-generator existence. Let f(x)=floorDiff c x. Then
y(x)-f(x)*r0 is a local unit. Its inertia difference is m-torsion
because J(x) and p are fixed by inertia at p (p prime to M0).
Prime-to-p rigidity makes that difference zero. Hence
tau y(x)-y(x)=f(x)*mu(1). Apply the same argument to gamma y(x)
whose mth multiple is J(a_gamma*x), giving
F_tau(x)=a_gamma*f(x)-f(a_gamma*x), with a_gamma reduced on m.
Reindex the base sum with cyclotomic residue a_gamma on M0;
multiply by w(a_gamma)=a_gamma^e psi(a_gamma). The identity is
w(a_gamma)*kappa_empty(tau)
 = (a_gamma^(e+1)*psi(a_gamma)-1)*Lambda_empty(0,f).
Thus vanishing of kappa_empty on inertia implies precisely the
native bottom-class floor sum is annihilated. No division by w
is required; no stronger unit hypothesis introduced.

3. Frobenius-to-inertia. Let A over q, phi arithmetic Frobenius
with residue action q-power; choose u0 in (Z/q)^* with L_q(u0)=1
in Z/m. The local cyclotomic inertia lemma supplies tau with action
u0^-1 on mu_q and trivial action on mu_M. This SAME tau works
for all x killed by M. Let L(u) be integer lifts of L_q(u);
Y=y(x), y_u=y(x+u/q), Yq=y(q*x), with y_0=Y.
Define actual root-of-unity discrepancies
 t_u=tau y_(u0*u)-y_u in mu_m,
 t_phi=phi Y-Yq in mu_m.
These follow from Jacobi equivariance on q*M and M respectively.
Define
 T=sum_units L(u)*t_u-t_phi,
 D=sum_units L(u)*(y_(u0*u)-y_u)-q*Y+Yq,
 D0=Yq-sum_(b mod q)y_b.

Since inertia fixes residue units and phi acts by q-power,
T-D lies in U_A. The central exact identity (before any norm) is
 D-D0 = sum_units C(u)*(y_u-Y),
 C(u)=L(u0^-1*u)-L(u)+1, m|C(u), sum_units C(u)=q-1.
Proof: reindex the first weighted sum by multiplication by u0,
then use sum C=q-1, including the b=0 term Y in D0.
For EVERY place A' over q, m*(y_u-Y) lies in U_A' by the
Jacobi principal-unit relation. Thus D-D0 belongs to U_A'
at every such place. D0 is torsion by the Jacobi distribution:
its m-fold multiple is torsion, so D0 itself is torsion.
Consequently T-D0 is torsion and lies in U_A. Its prime-to-q
part is trivial by injective reduction of prime-to-q roots;
therefore it is q-primary torsion, and lies in U_A' at every
place above q. Hence T-D belongs to U_A' at ALL those places.

This all-place step is essential: it licenses gamma(T-D) in U_A
even when gamma does not fix A. A congruence just at A does NOT
license conjugation. No choice of compatible local mth roots,
no division by m modulo the coefficient ring, no assumption
that gamma commutes with tau or phi.

Now use the actual F_g definition. From the root discrepancies,
 tau^-1 y_u = y_(u0*u)-tau^-1 t_u,
 phi^-1 Yq = Y-phi^-1 t_phi.
Reduction of tau and phi on the relevant local units gives
 mu(F_tau(x+u/q)) = gamma(y_u-y_(u0*u)+t_u) modulo U_A,
 mu(F_phi(q*x)) = gamma(Yq-q*Y+t_phi) modulo U_A.
For the second, q*phi^-1 acts identically on mu_m because
phi has cyclotomic action q and q is prime to m. For the first
tau is trivial on mu_m. These are congruences, not equality
of Galois automorphisms. Subtract after weighting:
 mu(sum_units L(u)*F_tau(x+u/q)-F_phi(q*x))
 = gamma(T-D) modulo U_A = 0 modulo U_A.
The left is in mu_m; since q prime to m, it is zero. Injectivity
of mu gives the exact local equality
 sum_units L_q(u)*F_tau(x+u/q)=F_phi(q*x).   (FI)
Apply Lambda_I(0), use H (reindex by q), q=1 mod M0 hence w(q)=1,
and hE (offset independence, already reconstructed in 40f4331a):
 kappa_(I union {q})(tau)=kappa_I(phi).
This is the actual final clause of exists_kolyvagin_cocycles.

4. Consumer and preserved frontier. Insert the above human
supplier in manuscript section 6f immediately before the descending
induction. The same cocycle family, p and auxiliary primes feed
exists_detecting_points_component and nsmul_component_eq_zero,
then OddShaBound.exists_length_shaOdd_le (71e1148ba135da7530abe211af57ba8a0d63f195),
FitTwistsExist.exists_isFitFamily (da769eba595af2f883eed9b82dbd322a521aea14),
LongForms.Data.integral_forms_long (9eff36cf003ac398fbd24361e80e95a03d0b0e05).
No new global bound or new kernel dependency deletion. All original
and reduced graph evidence unchanged. Preserve standard local
tame inertia and cyclotomic root rigidity, Kummer/Artin reciprocity,
finiteness and actual detecting-point descent; other C primitive
balanced crystalline/row/comparison suppliers and A/B unchanged.
Prior independent literature RUN54 audits the descent itself.
This closes the explicit local exposition gap conditional on
these native standard inputs, not RH or Theorem C as a whole.

5. Executed diagnostic (local Python, exact integer arithmetic).
For every prime 3<=q<100, every divisor m>1 of q-1 and u0 with
L(u0)=1 mod m, use integer lifts 0..m-1 of discrete logs of a
primitive root. Check C divisibility (74348 coefficients),
sum C=q-1, D-D0 equality for five deterministic integer assignments
(5910 cases), and perturb C(1) by +1 (1182 negative controls).
Independent finite cyclic rigidity check: for primes 3<=q<30,
2<=m<50 coprime to q, all t mod m*q^2, assert if m*t=0 mod
m*q^2 and t=0 mod m then t=0 (2787433 predicate evaluations).
These are arithmetic diagnostics ONLY, not Galois/Lean tests.
No failed arithmetic check. Native lean/lake not found locally.
Old-pin rh_prune/rh_scan/rh_auto are not executable here and not
silently reused across pins. Compact targeted native receipt
45799225653, targeted_results.json blob
23de197bd48f404ca2074c69676de289c4f7934e, re-read actual results:
full_RH_replay=false. The earlier primitive run 45803534769 is
reported in the current manuscript as partial B/C checks and A
timeout; a guessed status.json path returned 404, not new evidence.
No native compilation or axiom result for this new file.
The lemma below is a prepared additive-quotient scalar certificate;
it is not a formalization of the full local field argument.

RESUME HERE: independently audit the crystalline graph-to-dual
local defect caller using actual scaledCupBounds_of_cut_windows
and few_low_jumps, retaining chart hypotheses. Merge the existing
peer results without repeating the unified determinant, offset
argument, local transition or odd-Sha descent. Batch native checks
of this note and actual ComponentBound probes only through the
shared runner with approved resources; do not override guards.
HANDOFF TO editor, literature, C mathematics, formal audit, kernel.
-/

open scoped BigOperators

namespace IntegrationKolyvaginLocal

/-- A coefficient divisible by m annihilates the corresponding
difference in the quotient by the local principal-unit subgroup. -/
theorem divisible_coeff_sum_zero {ι A : Type*} [AddCommGroup A]
    (s : Finset ι) (m : ℤ) (k : ι → ℤ) (y : ι → A) (Y : A)
    (h : ∀ i ∈ s, m • (y i - Y) = 0) :
    ∑ i ∈ s, (m * k i) • (y i - Y) = 0 := by
  apply Finset.sum_eq_zero
  intro i hi
  rw [mul_comm m (k i), mul_smul, h i hi, smul_zero]

end IntegrationKolyvaginLocal

#check IsFrob.sub_nsmul_mem_principalUnits
#check eq_of_mem_principalUnits
#check mem_cycloGalGroup_of_inertia
#check exists_inertia_cycChar_eq
#check exists_kolyvagin_cocycles
#print axioms IntegrationKolyvaginLocal.divisible_coeff_sum_zero
#print axioms exists_kolyvagin_cocycles
