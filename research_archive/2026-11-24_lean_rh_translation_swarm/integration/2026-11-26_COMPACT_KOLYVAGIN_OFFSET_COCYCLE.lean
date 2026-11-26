import Lib.Cyclotomic.Kolyvagin.ComponentBound

/-!
# Integration: Jacobi -> offset-free Kolyvagin derivative -> actual C caller
2026-11-26. HUMAN SOURCE-MATCHED, independent review of peer 4c8f4b0b
and connected reconstruction of the native hE/H/cocycle steps. Not a new
kernel-checked proof. Credit Alpöge, Sernau, Claude and collaborators.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; latest manuscript
blob 3fa86279f0ca475a1738cf84a4979d5d3d196311; AGENTS 8db0201d, protocol
4b77b161, queue bbc46df7. Latest integration 2d288dd4 already incorporates
the balanced-row audit d064b084 and the geometric gauge; do not redo them.

## 1. Source-matched audit of the actual Jacobi family
GaussSums.lean b242e0965fdabcf6a8dcc3da33511507bf8bd4bf,
exists_jacobi_family: the six outputs really do match peer RUN53
specialists/literature_provenance/RUN53_COMPACT_JACOBI_FAMILY.lean.
For p prime, n=p-1, omega the Teichmuller lift at the chosen B, zeta a
primitive p-th root, G_k=sum_(a=1..n) omega(a)^(-k) zeta^a. Expansion in
pi=zeta-1 shows the first unit coefficient at j=k: lower coefficients
are zero modulo p by finite-field power sums, and the k-th is -1/k!.
Since ord_B pi=1/n, this yields ord_B G_k=k/n, including k=0 and p=2.
This directly supplies the injective S:Z/n->Q/Z with fracRep S(t)
equal to the normalized Gauss valuation. In multiplicative notation

  J(S(t)) = G(t)^c G(-ct) / (G(ct) G(-t)^c).

The multiplicative character factor of the Galois action cancels in
the ratio; off-p units and absolute values at every complex embedding
follow from G(t)G(-t)=chi_t(-1)p for nontrivial t and G(0)=-1.
At B its valuation is floorDiff c x, not 2 floorDiff c x.
For gcd(c,r)=1 the floor distribution follows by permuting c j mod r,
and subtracting the identical constant (c-1)(r-1)/2 for -x.
The quotient prod_b J(x+b/r)/J(rx) has valuation zero at EVERY place
above p, by Galois transport; off p it is a unit. Every complex
conjugate has modulus one, so Kronecker gives torsion. For q|p-1,
q-torsion characters reduce to 1 above EVERY q, and G(t) is a unit
there; the same ratio gives the principal-unit output.
This independently checks the peer's signs and all-place quantifiers
against the actual native lemma. Keep Hensel, finite cyclotomic field
and valuation facts, Galois transitivity, Kronecker (proved in peer).
No global proof-graph edges removed. This paragraph replaces the
unexpanded Jacobi construction in manuscript section 6f, not the
entire odd-Sha theorem.

## 2. Lift-independent derivative and exact distribution
Actual caller ComponentBound.lean 61d0f229eda03e81c8d89372f05f7444ca45b09b,
exists_kolyvagin_cocycles. Use native additive notation for algebraic
multiplicative units from here. Put m=l^n, M0=N*m. Fix the SAME p, B,
gamma, c, P with q in P satisfying q=1 mod c*M0 and p=1 mod
M0*prod P. For x killed by M=M0*prod I (I subset P), choose m*y(x)=J(x)
and an identification mu:Z/m -> mu_m. Set

  A_g = gamma - g gamma g^-1  (difference of endomorphisms),
  mu(F_g(x)) = A_g y(x).

A_g J(x)=0 by Jacobi equivariance since gamma and its conjugate
have equal cyclotomic action. Thus A_g y(x) is killed by m. A_g kills
ALL torsion, not only m-torsion, since every finite cyclotomic Galois
group is abelian. Consequently F_g is independent of the roots y.
If q|M and q prime to c, then
  m*(sum_(b mod q) y(x+b/q)-y(q*x))
      = sum_b J(x+b/q)-J(q*x)
is torsion by Jacobi distribution. Hence the expression in parentheses
itself is torsion, and A_g kills it. Injectivity of mu gives

  sum_(b mod q) F_g(x+b/q)=F_g(q*x).                 (D)

This proves the actual D in native hE without a compatible choice
of lifts, and without illicit division by m in the coefficient ring.
In particular F_gamma=0.

## 3. Offset independence at the native Lambda caller
For S subset I write
  Lambda_S(d,F)=sum_(a in (Z/M0)^*) a^e psi(a)
    sum_(u_q in (Z/q)^*, q in S)
     prod_(q in S)(L_q(u_q)-d_q)
     F(a/M0 + sum_(q in S)u_q/q),
with L_q the SAME additive discrete logarithm modulo m selected
by the native proof. Values and coefficients are taken in O/(m);
the inner index is UNITS, not all q residues. For q in S, T=S\{q},
write x=a/M0+sum_(r in T)u_r/r. By (D),
  sum_(u in (Z/q)^*)F(x+u/q)=F(q*x)-F(x).
Multiply by the other weights and sum. Since q=1 mod M0, the base
coordinate a/M0 stays unchanged. Multiplication by q permutes
each other unit index u_r, and the identity
L_r(q^-1 u_r')=L_r(u_r')-L_r(q) changes its offset to
d'_r=d_r+L_r(q). The total unweighted q-sum is therefore exactly

  Lambda_T(d',F)-Lambda_T(d,F).                      (E)

By induction on |S| this is zero for F=F_g: for T empty the two
offset vectors agree; otherwise the inductive offset independence
on T gives equality. Changing d_q changes Lambda_S by a scalar
multiple of (E), hence not at all. Change offsets one at a time:

  Lambda_S(d,F_g)=Lambda_S(0,F_g) for EVERY d.         (I)

No averaging over d or norm inequality, no division in O/(m).
This is native hE. It also explains why the original q=1 mod M0
guard cannot simply be dropped.

## 4. Exact twisted cocycle identity, same witnesses
Let a_g denote the cyclotomic residue of g on M (a unit), and
b_g its residue on m. Direct expansion of the three conjugates
g gamma g^-1 gives A_(gh)=A_g+g A_h g^-1. By Jacobi equivariance,
g^-1 y(x)-y(a_g^-1*x) is m-torsion, killed by A_h. As g mu(z)
=mu(b_g*z), injectivity gives

  F_(gh)(x)=F_g(x)+b_g F_h(a_g^-1*x).                (C)

In the second summand of Lambda_S(0,F_(gh)), reindex a,u_q by
multiplication by a_g. The base coefficient a^e psi(a) becomes
a_g^e psi(a_g) times the new base coefficient (well-defined modulo
m and N); the logarithm factors become L_q(u'_q)+L_q(a_g).
The changed offsets disappear by (I). Thus for the actual
kappa_S(g)=Lambda_S(0,F_g),
  kappa_S(gh)=kappa_S(g)+(cyc^(e+1) psi)(g) kappa_S(h),
  kappa_S(gamma)=0.
This is the algebraic cocycle and normalization part of the
native exists_kolyvagin_cocycles; the same finite family is used
for all S. Continuity follows since only finitely many algebraic
y(x) occur for the fixed M, each having open stabilizer; g and
g^-1 act continuously on these finite orbits and cyclotomic
residues. Preserve all remaining local inputs: tame inertia
ramification, bottom valuation evaluation ev at B, and the
Frobenius-to-inertia equality with the actual local generator.
Do NOT assert they follow merely from (C). These are the
remaining parts to audit against peer 2e61d8c6 and the source,
before using the descending component argument in manuscript 6f.

## Root context and remaining frontier
GaussSums.exists_jacobi_family -> ComponentBound.exists_kolyvagin_cocycles
-> ComponentBound large-prime detection -> OddShaBound.exists_length_shaOdd_le
(blob 71e1148ba135da7530abe211af57ba8a0d63f195)
-> New/Selmer/FitTwistsExist.exists_isFitFamily
(da769eba595af2f883eed9b82dbd322a521aea14)
-> New/Endgame/LongForms.Data.integral_forms_long
(9eff36cf003ac398fbd24361e80e95a03d0b0e05) -> compact star inequality.
This is an explicit source-role chain, not a new elaborated kernel graph.
No original or reduced graphs overwritten. Other C primitives remain:
actual balanced crystalline local bounds, row/comparison construction,
and independent audit of Greenberg-Wiles and reciprocity. A/B primitives
and analytical guards unchanged. No circular use of the RH conclusion.

## Execution and certificate
Local command -v lean/lake returned neither executable. The native
old-pin reduction engines cannot be imported into this new toolchain
without port and checking. Historical bounded compact replay
45799225653 jobs pick/run/record were fetched and all succeeded;
state targeted_results.json 23de197bd48f404ca2074c69676de289c4f7934e
explicitly states full_RH_replay=false. That output is not a verification
of this file. New native result: NOT RUN. The following scalar
regression was executed using exact integer residues in JS:
- M0=3, m=3, Q=[7,13,19], generators [3,2,2].
- c=1..8 excluding multiples of Q, every subset S of Q.
- F(x)=floorDiff c x on grid denominator M0 prod S.
- Check D for every grid x and every q in S (129528 cases).
- Compute Lambda with weights a, logs of the indicated generators
  mod 3, for every offset vector in (Z/3)^S; compare to zero-offset
  value (448 cases). All equal. These are exact scalar diagnostics
  for (D)/(I), not a test of Galois cocycles or an RH proof.
- Native declaration probes and generic scalar offset-erasure certificate
  below PREPARED, not compiled. No axiom claims from this file.

RESUME HERE: integrate sections 1-4 into manuscript 6f, replacing its
unexpanded Jacobi construction and explicitly separating the bottom
and Frobenius-to-inertia local step. Read actual ev and the terminal
three branches of exists_kolyvagin_cocycles; audit the tame generator,
coefficient twist and local principal-unit rigidity against the
source and RUN52. Keep d064b084 balanced-row audit and complex-gauge
work in place. Independent audit of these human arguments and native
replay required. HANDOFF TO editor, mathematics, literature,
formal audit and shared compact native runner.
-/

open scoped BigOperators

namespace IntegrationKolyvagin

theorem eraseOffset {R : Type*} [CommRing R] {ι : Type*}
    (s : Finset ι) (L F : ι → R) (d : R)
    (h : ∑ i ∈ s, F i = 0) :
    (∑ i ∈ s, (L i - d) * F i) = ∑ i ∈ s, L i * F i := by
  classical
  simp_rw [sub_mul]
  rw [Finset.sum_sub_distrib, ← Finset.mul_sum, h, mul_zero, sub_zero]

end IntegrationKolyvagin

#check exists_jacobi_family
#check exists_kolyvagin_cocycles
#print axioms exists_jacobi_family
#print axioms exists_kolyvagin_cocycles
#print axioms IntegrationKolyvagin.eraseOffset
