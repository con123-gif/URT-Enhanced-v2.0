import Mathlib
import Development.AutomorphicArithmetic.AutomorphicVarieties.LevelCohomology.TorsClass
import Development.AutomorphicArithmetic.AutomorphicVarieties.HeightAndVanishing.CountZ
import Development.AutomorphicArithmetic.AutomorphicVarieties.HeightAndVanishing.FinalLe

/-!
RUN36 AUDIT / lane 10 / 2026-11-25. AGREE with peer RUN37's
all-positive-twist exceptional vanishing human argument; strengthen it.
No new Lean/kernel/root closure; certificate PREPARED, not compiled.

Mission blob cd0a176134d46b5b624896e56843a24915c14477; upstream pin
40e56bab026552e089d7afcfeff08d2defb9c005, toolchain Lean 4.33.1 /
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Peer 490330a62ee7e9ec1772a179448eb2ae9ec1e0e2, RUN37 blob
7df72275807b97f1e55b993ab4b993ba4ed85b14; living proof blob
464e82f81f646d4af85e1f5f70d379026df46261.
Reviewed latest lane results, mission, swarm protocol, AGENTS,
research state/protocol, handoff, baseline CI records.

ONE RESULT: remove both the residue-weight split and dependence on the
native zOne branch from the human vanishing argument at l=3,7.
Even full decomposition vanishing at l can be replaced by inertia
vanishing, provided the FULL action image (not just mod l) agrees.

Let G=G_Q, F=Q(zeta_l), H=G_F, M=QO l O, alpha=cyclotomic^(-e),
I=inertia at a fixed place over l. Native Chr.V(l,e,1) is the
length of ShaU for this scalar representation. Native shaFam includes
ALL inertia groups and decomposition groups over l. Fix any class
killed by l. By divisibility of M, subtract a global coboundary to
obtain a continuous representative z with l*z(g)=0 for every g.
This uses exactly the native tors_class/qoFacts mechanism.

Because restriction to I is a coboundary, choose m with
z(i)=(alpha(i)-1)m for all i in I. The decisive equation is

  l*(alpha(g)-1)m = l*(alpha(i)-1)m = l*z(i) = 0,
  where i in I satisfies alpha(i)=alpha(g).

Such i exists: the cyclotomic extension Q_l(zeta_(l^n))/Q_l
is totally ramified of degree phi(l^n) for every n. Thus the
cyclotomic image of I is all Z_l^*, by compactness and the compatible
finite quotients. This is a classical local field input, not a new
axiom or a kernel-verified native supplier here. Subtract the same
coboundary globally. The new z0 is still M[l]-valued and now
vanishes identically on I. Crucially, no claim l*m=0 is required;
the argument works even when (l-1)|e and alpha mod l is trivial.

On H the action on M[l] is trivial, hence z0|H is a continuous
homomorphism. It vanishes on inertia away from l because the FULL
cyclotomic action is trivial there and the original local restriction
was a coboundary. It vanishes at every inertia over l: if n lies in
I intersect H, the cocycle identity gives z0(g n g^-1)=alpha(g)z0(n)
since H acts trivially on M[l]. This kills all conjugates.
Consequently z0|H factors through the ideal class group by
unramified abelian class field theory; F is totally imaginary.

For l=3 Minkowski's bound is 2 sqrt(3)/pi < 2.
For l=7 it is (4/pi)^3*(6!)/(6^6)*49 sqrt(7)
< 31360/6561 < 5, using pi>3 and sqrt(7)<8/3.
There are no ideals of norms 2,3,4 in Q(zeta_7):
ord_7(2)=3 and ord_7(3)=6; 7 is ramified.
Thus both class groups are trivial. More generally it suffices that
their order is prime to l. The image of z0|H is l-torsion, so zero.

Now z0 factors through Delta=Gal(F/Q) of order l-1.
For S=sum_{h in Delta} z0(h), summing z0(gh)=z0(g)+g S termwise
gives (l-1)z0(g)=S-gS. Division by l-1 on M[l] is valid.
So z0 is a coboundary, and the original l-torsion class is zero.
Every continuous cocycle has finite image by compactness and
discreteness; M is l-primary torsion (qoFacts). Each class is killed
by some power of l. Induction from zero l-torsion gives ShaU=0.
Native V'_le_V then gives Vlen(O,1,e)=0 for every e>=1.
No parity split, no invocation of zOne necessary in this human
proof for these two primes; original zOne remains in fallback graph.

Caller audit: native HostOdd shows odd order chiP forces conductor
dividing h.q when l differs from 2,q1,d; BchiFacts guarantees the
strict q1,d guards on the same host. Principal h.q=1 gives trivial
Dirichlet character. RUN37 identifies Bchi(1)={3,7}; that
principal arithmetic identification is retained, not proved in Lean
here. Native RedPrime uses evenSet, prime-to-index, enough roots,
all original finiteness conditions; do not replace those by this
vanishing statement. HostIndex gives index dividing a power of 2
at principal conductor. Native sumIn consumes CountII,V,Vs,IV.
The principal no-layer replacement still needs a full checked
sumIn assembly with the actual coefficient/character sets and the
principal arithmetic identification, plus SumOut, 2-primary ThmBa,
ThmBc and all remaining same-host/root suppliers.

Original graph (source-visible):
sumIn <- CountIV <- LayerLe and odd-order character bounds;
RUN37 vanishing <- zOne (divisible e) OR residue unit argument
(nondivisible e), class field + torsion + V'_le_V.
Reduced graph (human, principal only):
sumInNoLayer37 <- zero exceptional term <- full inertia-image
normalization + class-group prime-to-l + finite quotient averaging
+ torsion-class argument + V'_le_V.
Do not remove generic CountIV or zOne for other callers.
Context/cache key: pin, l, e, O, QO, same host, full local image,
chosen I, H, actual character triviality, all local conditions.
Do not cache by mod-l image alone or extrapolate to irregular primes.

Source ledger, relative to upstream src/Development/AutomorphicArithmetic/AutomorphicVarieties:
LevelCohomology/TorsClass.lean abccc2d2c3aadebdafc35fc4297c8a9281447f58
GaloisLibrary/SelmerTransport/ConjStableShaFam.lean 578402a7b2aea9f24d31473aab4486dd43055fb2
GaloisLibrary/SelmerTransport/Places.lean f820992a67840914d259c93cee63a4fc5c5baa26
GaloisLibrary/SelmerTransport/QoFacts.lean 60ed9851ed491e8ed36de2ee042dd9f5aa34fddd
CharacterLevelBounds/ShaFamMono.lean f1b517fa7cddda3e25b5a7ba89c1e57096bbf59e
HeightAndVanishing/CountZ.lean 5601df23547fac2586abcd3717f6ae7c468e8b03
HeightAndVanishing/HostOdd.lean 5f07a8b95886a4620a985eded3c6500137e7efd5
HeightAndVanishing/BchiFacts.lean c96defe3b3c64107975bbc8a056d2d39cca9bfea
HeightAndVanishing/HostIndex.lean ccc755aa50d8c7e732d74d5d6bd211f7d903c419
HeightAndVanishing/RedPrime.lean 9b5f1ab583d11365a37d6db8b573168f825ecbe7
HeightAndVanishing/FinalLe.lean a5962f0dfe251e6b4db935e87d7c15aacf279d2e

Executed independent exact arithmetic checks, 4944 normalization
configurations (480 admitted), 224 finite quotient cocycle
identities, Minkowski bound and residue orders, four negative
controls (two primes each). Reproduction (Python 3.8+):

from fractions import Fraction as F
from math import factorial,gcd
B=F(4,3)**3*F(factorial(6),6**6)*49*F(8,3)
assert B==F(125440,26244) and B<5
for a,k in [(2,3),(3,6)]:
    assert pow(a,k,7)==1 and all(pow(a,j,7)!=1 for j in range(1,k))
checks=admitted=avg=0
for p in (3,7):
    for k in (1,2,3):
        q=p**k
        U=[a for a in range(q) if gcd(a,p)==1]
        for e in range(1,2*(p-1)+1):
            actions={pow(a,-e,q) for a in U}
            for m in range(q):
                checks+=1
                if all(p*(a-1)*m%q==0 for a in actions):
                    admitted+=1
                    for g in U:
                        assert p*(pow(g,-e,q)-1)*m%q==0
    n=p-1
    for a in range(1,p):
        for s in range(p):
            z=[sum(pow(a,j,p)*s for j in range(i))%p for i in range(n+1)]
            if z[n]: continue
            m=-sum(z[:-1])*pow(n,-1,p)%p
            for i in range(n):
                assert z[i]==(pow(a,i,p)-1)*m%p
                avg+=1
    q=p**3; e=p-1
    I=[a for a in range(q) if gcd(a,p)==1 and pow(a,p-1,q)==1]
    assert len(I)==p-1 and len({a%p for a in I})==p-1
    assert all(p*(pow(a,-e,q)-1)%q==0 for a in I)
    assert p*(pow(1+p,-e,q)-1)%q!=0
    assert (p*1)%p==0 and 1%p!=0
assert (checks,admitted,avg)==(4944,480,224)

Negative controls: Teichmuller subgroup surjects mod l, but fails
the full normalization equation at e=l-1 modulo l^3.
A cyclic quotient of order l with trivial action has nonzero
additive cocycle, so prime-to-l quotient guard cannot be dropped.

These tests check algebra and rational bounds only, not number-field
or kernel verification. Local lean/lake absent (PATH checked).
Native baseline status blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
7da354941e402b6f8b364ed03d8c5c82d27b7717 report pass for prior
45577239749 and 45576756833, not this theorem. Actual Landau replay
45652878741 had return 1, preserved in peer 3f25eb66; no pass inferred.
Native source search PTSha returned no hit; not pursued on principal
no-layer path. SumIn.lean guessed path failed; FinalLe.lean actual.
No URT advantage claimed. No new root closure. Original graphs and
axiom records retained, no upstream proof assumed as shortcut.

RESUME HERE: formalize the full inertia-image equality and
class-field restriction on M[l] at l=3,7; integrate the normalization
certificate into the actual Chr.V trivial-character supplier, then
replay sumInNoLayer37, preserving all root-reachable open leaves.
HANDOFF TO prime-window, kernel, integration, human-proof editor.
-/

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual Formalism.HC
  ReciprocityTheory.Gal Formalism.GaloisCohomology UpperTheory.V
  UpperTheory.V.Base UpperTheory.Top UpperTheory.V.HV

namespace RHAudit36

-- Exact normalization: full action image is the only local image premise.
theorem normalizeAtInertia {G R M : Type*} [CommRing R]
    [AddCommGroup M] [Module R M]
    (a : G → R) (z : G → M) (I : Set G) (m : M) (p : R)
    (htors : ∀ g, p • z g = 0)
    (hlocal : ∀ i ∈ I, z i = a i • m - m)
    (himage : ∀ g, ∃ i ∈ I, a i = a g) :
    (∀ g, p • (z g - (a g • m - m)) = 0) ∧
    (∀ i ∈ I, z i - (a i • m - m) = 0) := by
  constructor
  · intro g
    obtain ⟨i, hi, heq⟩ := himage g
    have hfix : p • (a g • m - m) = 0 := by
      rw [← heq, ← hlocal i hi]
      exact htors i
    rw [smul_sub, htors g, hfix, sub_zero]
  · intro i hi
    rw [hlocal i hi, sub_self]

-- Actual native length interface. The nontrivial arithmetic supplier
-- hzero is intentionally explicit, not asserted or hidden in a tactic.
theorem trivialVlenOfZero
    (Ω : Type) [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω]
    (l : ℕ) [Fact l.Prime] (c : Coef l) (N : ℕ) [NeZero N]
    (e : ℕ)
    (hzero : Chr.V l e (1 : G ℚ Ω →* c.Oˣ) = 0) :
    Vlen Ω c e (1 : DirichletCharacter c.O N) = 0 := by
  have hd : Chr.dirG ℚ Ω (1 : DirichletCharacter c.O N) = 1 := by
    ext σ
    simp [Chr.dirG]
  unfold Vlen
  rw [hd]
  exact le_antisymm ((Chr.V'_le_V l N e 1).trans hzero.le) bot_le

end RHAudit36

-- Axiom evidence requested on actual native and proposed interfaces.
#print axioms RHAudit36.normalizeAtInertia
#print axioms RHAudit36.trivialVlenOfZero
#print axioms UpperTheory.V.X.zOne
#print axioms UpperTheory.V.HV.sumIn

-- Engine replay (when loaded by the pinned replay harness):
-- rh_scan RHAudit36.normalizeAtInertia limit 2000
-- rh_scan RHAudit36.trivialVlenOfZero limit 2000
-- rh_scan UpperTheory.V.HV.sumIn limit 2000
-- rh_prune RHAudit36.normalizeAtInertia as RH36InertiaPruned
-- rh_reduce / rh_auto / rh_auto_frontier: target the same normalization
-- theorem with exact lemma as fallback; retain hzero at actual caller.
