import New.Selmer.OnePlaceDefect

/-!
RUN70 — actual initial lift-power supplier and tame chart foundation.
27 Nov 2026. Human source-matched derivations; prepared Lean probes
and scalar certificates, not newly kernel checked.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Primary compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10;
manuscript 963e42122931b8e534c39765bb2a7422b2c557d7.
Read AGENTS, swarm protocol, handoff, expansion, continuity,
RUN69 and recent peer head 784d021e166db4a478eb850dcaa9c68feacee050.
Literature RUN68/69 explicitly retain the initial z-power; do not
repeat their cut selection, cup descent, or RUN69 tame subgroup.

Source ledger (paths relative to compact src):
Lib/PadicHodge/WachKisin/HodgeFrame.lean
  158f4df424f222f593b6f2baee57a294ab221f03
  Chart 110ff, exists_chart_of_pow_mul_eq_neg 125ff,
  seriesEquiv 185ff, coord₀_coe 245, FixesThetaZ 164.
Lib/PadicHodge/WachKisin/KummerChartExists.lean
  f90f19a17f77be0aff920a5db18ae389d5898561
  wittToQpBar, fixes_roots_iff_fixesLambda,
  exists_smul_teichmuller_eq.
Lib/PadicHodge/PeriodRings/Ainf.lean
  d8c081552c611132f69033129f9a37dbd167484a
  epsTilt, epsRoot, tau, xi, mu and tilt roots.
New/Lift/SparseThickLetters.lean
  c7ac57b4aca6855d8ed64542e0b247b221325395
  exists_tameChart 124–158, killsCokernel_of_isKilledBy 81ff.
New/Lift/CokernelKillers.lean
  ba8a479cecd29393b86e3f320991c20baf108487
  mem_liftIdeal_iff 73, mul_E_pow_mem_liftIdeal_one 87,
  liftIdeal_le_of_p_pow_mem 95, mem_liftIdeal_zero_of_mem_one 149,
  exists_z_pow_mem_liftIdeal 178, killsCokernel_of_isUnramified 192.
Lib/PadicHodge/WachKisin/FrameTheorem.lean
  57d6daa6060f9f00eb27be6525460ba942a73f08, frame_theorem 52ff.
Actual root path: OnePlaceDefect -> tame_types_exponent /
crystalline local bound -> killsCokernel -> initial lift power.
This is not a new prime-window criterion.

1. Chart construction at the actual tame caller.
Normalize the valuation v(p)=1, and on the tilt use
v(u)=v(u^sharp). Let x^e v0=-p, v0 a unit of O_C, as
in exists_chart_of_pow_mul_eq_neg. Then e>0, v(x)=1/e.
Choose a tilt lift u with u^sharp=x (native untilt surjectivity).
z=[u] is nonzero, nonunit, and nonzero modulo p. The
standard A_inf z-adic completeness (the exact native input
is isAdicComplete_span_singleton) evaluates Lambda[[X]]
at z, for Lambda=W(F_{p^f}), with X mapping to z.
Given a unit series A whose theta image is v0, put
E=z^e A(z)+p. Then theta(E)=0, so E=xi B.
Here retain the fundamental Fontaine kernel statement
ker(theta)=(xi), not just the inclusion xi in the kernel.
We can check the reverse divisibility without any period
matrix or general frame theorem. Write bar for mod p.
The reduction of theta is u -> u^sharp mod p. Hence
v(bar xi)>=1. Choose w in O^flat with w^sharp=p;
[w]-p is in ker(theta), so bar xi divides w and
v(bar xi)<=v(w)=1. Thus v(bar xi)=1.
The image of A is a unit, so v(bar E)=e v(u)=1.
In the tilt valuation ring v(bar B)=0, hence bar B is
a unit. By the Witt unit criterion B is a unit in A_inf.
Therefore E and xi are associated, exactly as required
by the Chart constructor, not merely theta(E)=0.
At the actual tame caller A=-1 and v0=-1, x=varpi,
so E=p-z^e; theta(A)=-1 needs no approximation.
This gives the missing chart construction clause of RUN69,
conditional only on the retained standard Fontaine ring
facts (tilt surjectivity, kernel, adic completeness).

The chart seriesMap is injective: for nonzero f(X) first
remove the minimum finite p-valuation of its coefficients.
After reducing mod p, the least index j with nonzero
coefficient has a unit coefficient in F_{p^f}; all
subsequent terms have strictly larger tilt valuation
because v(u)>0. Their convergent sum cannot cancel
the initial term. A_inf is p-torsion-free, so the
original evaluation is nonzero. This justifies the exact
S=Lambda[[z]] identification and constant decomposition.
It does not give the stronger adic basis/coordinate
retract on arbitrary A_inf modules, which remains separate.

2. Fixers and simultaneous compatible roots.
The finite-field Teichmuller representatives under theta
are precisely 0 and the (p^f-1)-th roots of unity:
they satisfy the polynomial, are distinct because
nonzero differences reduce to units, and exhaust its
roots by degree. The theta embedding on Lambda is
injective: any nonzero Witt coefficient has the form
p^n times a unit and its image is nonzero. Galois
preserves the finite tilt field. Fixing these roots
therefore fixes their Witt representatives (by
injectivity) and then all of Lambda by its unique
convergent Witt expansion; the converse is immediate.
This supplies fixes_roots_iff_fixesLambda at the same
chart f. Fixing theta(z)=varpi and these roots is
exactly membership in the subgroup U of RUN69, no
assumption that g fixes z itself.

For the native exists_smul_teichmuller_eq, let C be
the closed subgroup in that lemma (inertia at the tame
caller), and choose u,v with the same e-th power of
their untilts. The level-n untilts u_n,v_n of their
p^n-th roots are roots of X^(e p^n)-pi. At the actual
tame caller pi=p; these are algebraic, and absolute
inertia is transitive on them by Eisenstein over the
maximal unramified extension. For each n the closed
subset C_n={g in C : g(u_n)=v_n} is nonempty.
C_(n+1) is contained in C_n because u_(n+1)^p=u_n
and similarly for v. Compactness of the closed subgroup
of G_p gives one g in all C_n. The compatible
root tower determines the tilt element, hence g[u]=[v].
Use v=a*u for the primitive e-th root a in the
finite tilt field: this supplies the actual tameGen.
Use v=epsTilt^l*u, whose untilt is the same as u,
for each l>=0. This supplies exists_smul_z(l) in
Gamma' since the inertia element fixes Lambda and
the chosen theta(z), and hence is in U. Pull back
through the actual surjective toGp. The two choices
need not be the same g. This proves the missing
compatible-root part of the KummerChart constructor.
The group normality and prime-to-p index are already
RUN69, not counted again. For theta(s) fixed on S
use continuity of theta evaluation on the convergent
series at x; each coefficient and x is fixed. No
assumption of g fixing the entire image of S in A_inf.

3. Initial z-power at every letter: exact contraction.
Fix the SAME PairingSide S, nonnegative jump bound n
and modulus p^kappa. Denote the native ideals
J_l(i)=liftIdeal(p^kappa,l,i). For the initial nonempty
set, take h=jumpBound of the extension, not a new
bound for its individual letters. By frame_theorem.2.2.1
tau^h times (1 tensor (0,c)) lies in the extension
A_inf Kisin lattice. Project to letter i; level zero
standard exponents are exactly the level-zero
Kisin letter part (native frobKisinAinf_zero and
letterProj_mem_withExponents). Projection commutes
with A_inf scalars and with projection to the trivial
quotient. Thus it lifts tau^h constantAt(i,c) for
EVERY c with the SAME multiplier and zero correction.
By mem_liftIdeal_iff, tau^h is in every J_0(i).
Also p^kappa is in each J_0(i). In A_inf, the reduction
of tau is a nonzero nonunit of the rank-one tilt
valuation ring. The reduction of z has positive
valuation. Thus some z^N is in the radical of
(p^kappa,tau^h): if h or kappa is zero this is
immediate; otherwise choose N with N v(bar z)>=
h v(bar tau), so z^N lies in (p,tau^h) and
z^(N kappa) lies in (p^kappa,tau^h).
This proves existence of an exponent simultaneously
at every letter, conditional on the exact frame and
letter projection suppliers, not by picking unrelated
exponents for each letter.

Take a LEAST common exponent a. From the actual
mul_E_pow_mem_liftIdeal_one using all u<=n,
z^a E^n lies in J_1(j) for every j.
The chart relation z^e in (E,p) yields
  z^[a+e(n+kappa)] in z^a(E,p)^(n+kappa)
                    subset (z^a E^n,p^kappa)
                    subset J_1(j).
Indeed every monomial in (E,p)^(n+kappa) either
contains E^n or contains p^kappa. This remains true
for n=0 or kappa=0. Put N=a+e(n+kappa), b=floor(N/p).
Then pb<=N<p(b+1), hence no integer in (pb,N]
is divisible by p. In particular
              v_p(N!) = v_p((pb)!).
Apply the ACTUAL mem_liftIdeal_zero_of_mem_one
with c=0, target exponent kappa'=0, original modulus
still p^kappa, and target power b, at i and j=letterFrob i.
It gives z^b in J_0(i) for every i with zero extra
p-power. Minimality of a implies a<=b. Thus
                     (p-1)a <= e(n+kappa).
This is precisely exists_z_pow_mem_liftIdeal, including
the uniform all-letter quantifier. At the tame caller
use kappa+1 and n+kappa+2<p; then a<e, which is the
required initial exponent before RUN68 good-root descent.
No new rank multiplier and no assumption that the
derivation step is valid without its retained Hodge
divisibility and common correction hypotheses.
The floor step cannot be obtained by simply dividing
z^N by z in an ideal. The factorial equality is essential.

4. Exact removal of the modulus.
Let J be liftIdeal(0,l,i), so
liftIdeal(p^(c+1),l,i)=J+(p^(c+1)).
If p^c belongs to this sum, write
p^c=j+p^(c+1)t with j in J. Exactly
                     (1-pt)p^c=j.
Since p is in the Jacobson radical of A_inf, 1-pt
is a unit, so p^c belongs to J, and then p^(c+1)
belongs to J. Thus J+(p^(c+1))=J. This is the
actual liftIdeal_le_of_p_pow_mem, without a
finite-generation hypothesis on the colon ideal J.
No claim that an arbitrary correction can be removed
before this p-power condition is met. This closes
the modulus-removal implication at both tame and
unramified callers. Native adic completeness supplies
the Jacobson condition.

Source-visible graph delta: initial lift-power supplier
now has explicit frame -> initial uniform tau multiplier,
radical -> least common exponent, level raise -> monomial
containment -> factorial-free final descent -> contraction.
Tame chart -> E association -> root fixer -> compact
tower -> tameGen and all l generators. Modulus removal
uses only local unit cancellation. Retain all original
and reduced DAG files/axiom evidence; no global edge
deletion. Open: exact integral Hodge division and
mem_liftIdeal_of_derivation, coordRetract naturality and
the frame/adic basis suppliers, plus any surviving
safe-profile/long-gap arguments not yet independently
audited. Cache keys include source pin, SAME chart,
p,e,f,z, extension h, letter permutation, same n,kappa,
fixed modulus and ideals; no interchange of J_l.
No RH, URT or Main import.

Execution: actual source retrieval and mathematical
derivation; command -v lean/lake/elan empty. Re-read
state branch compute/rh-compact-primitives-replay-20261126/
outputs/targeted_results.json blob
088cd2ec0e935ee1a282f10096949bcf671cc804:
six existing named theorem checks have three standard
axioms; module_1 build timed out (124, 2700.11s);
all_requested_checks_ok=false, full_RH_replay=false.
No new native validation or old-pin engine run claimed.
The following certificates/probes are prepared, not
executed, and do not constitute proofs of the retained
integral Hodge or frame statements.

RESUME HERE: at actual CokernelKillers.mem_liftIdeal_of_derivation
derive the common S-coordinate correction and Hodge
division from exists_lift_of_mem_liftIdeal, then audit the
factorial-payment recursion and actual unramified caller.
Check latest literature/integration first; do not repeat
the initial lift-power contraction or chart construction.
HANDOFF TO C mathematics, integration/editor, literature,
formal audit and compact kernel replay. Human RH incomplete.
-/

namespace RHGaloisRun70

theorem modulus_identity {R : Type*} [CommRing R]
    (p t j : R) (c : ℕ) (h : p^c = j + p^(c+1)*t) :
    (1-p*t)*p^c = j := by
  calc
    (1-p*t)*p^c = p^c - p^(c+1)*t := by rw [pow_succ]; ring
    _ = j := by rw [h]; ring

theorem initial_power_contraction (p e n k a : ℕ)
    (h : a ≤ (a + e*(n+k))/p) :
    a*p ≤ e*(n+k)+a := by
  have H := p.mul_le_of_le_div _ _ h
  simpa [Nat.add_comm, Nat.mul_comm] using H

#print axioms modulus_identity
#print axioms initial_power_contraction
#check Lift.exists_chart_of_pow_mul_eq_neg
#check Lift.fixes_roots_iff_fixesLambda
#check Lift.exists_smul_teichmuller_eq
#check Lift.KummerChart.PairingSide.exists_z_pow_mem_liftIdeal
#check Lift.KummerChart.PairingSide.liftIdeal_le_of_p_pow_mem
#check Lift.KummerChart.PairingSide.mem_liftIdeal_zero_of_mem_one
#print axioms Lift.KummerChart.PairingSide.exists_z_pow_mem_liftIdeal
#print axioms Lift.KummerChart.PairingSide.liftIdeal_le_of_p_pow_mem

end RHGaloisRun70
