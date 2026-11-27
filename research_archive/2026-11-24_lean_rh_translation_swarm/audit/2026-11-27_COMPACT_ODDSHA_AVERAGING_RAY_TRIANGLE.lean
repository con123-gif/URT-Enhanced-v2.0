import Lib.Cyclotomic.OddSha.OddShaBound
import New.Selmer.TateTwistSteps

/-!
# AUDIT lane 10: character transfer, ray-class detector and Tate-twist triangle
2026-11-27. HUMAN SOURCE-MATCHED / PARTIAL. No new native kernel closure.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Read current mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10,
SWARM_PROTOCOL, AGENTS, HANDOFF_QUEUE, current manuscript and peer head
2203bfae9dbf0472c80db5e855d17c2180754bfa. Resume 19061b0f, whose
uniform scalar length budget retained these suppliers. Follow the current
completion-first compact mission; no unrelated outer-shell/URT detour.

Source ledger (relative to grh-compact/src):
* Lib/Cyclotomic/OddSha/OddShaBound.lean 71e1148ba135da7530abe211af57ba8a0d63f195:
  exists_detecting_points_cocycles, exists_length_shaOdd_le (hZ, hPhi).
* Lib/Cyclotomic/Kolyvagin/Components.lean fbd540929083786c70247cfeace76a5ae9454547:
  cycPowDirichlet, vanishingCocycles, component.
* Lib/ClassField/Places/SelmerDefs.lean ce10f7c03f6155db4ccd49bc228eb03bc23e2347:
  tateTwist, shaLocalSet, shaOdd.
* Lib/ClassField/Global/Avatars.lean dd2be51ae27b881c0f436d4aa3cb1f777c96f0aa:
  index_pow_at_places_le 44–50, exists_detecting_points_hom 213–235.
* New/Selmer/TateTwistSteps.lean 941e383bd401d51e8a8c2d856320ef61c7fa17e7:
  add_conjGal_mem_evenClasses, hasTriangleCost_tateTwist.
* New/Selmer/Corepresentable.lean 3e401695d96b8ea826d60dadf0174d366f85d37c:
  IsPrimeTriangle, IsNewPlaces.cycInv_withConjInv.
* New/Selmer/RibetFirstOrder.lean a05cb18d1ee62520f104d41361099db4b23cbe1f:
  HasTriangleCost, exists_mem_fittingIdeal_block.
Also checked explanatory companion grh/src/Lib/Cyclotomic/OddSha.lean at
same pin. Do not import companion proofs as if they were compact terms.

## 1. Exact character averaging: both hZ and hPhi
Let G=G_Q, H=G_E embedded as closed subgroup, K=G_Q(mu_N) subset H,
Q=G/K, D=phi(N), c=cmConj with c^2=1. E is abelian CM in Q(mu_N).
Fix e>0, B=O/l^n, a(g)=cyc(g)^(-e), and an actual x in shaOdd.
Thus x is a locally constant a-cocycle on H, odd under c, unramified off l,
and zero on the decomposition groups in ker(cyc) above l. Write
U_psi=cyc^e psi, as in Components. All formulas in B; scalar values are units.
For u,g in G define b_u(g)=u(cgc g^(-1))u^(-1) in K, hence in H.
Its cyclotomic character is 1 and its preimage in H is unique by injection.
In particular x(bk)=x(b)+x(k), not a general homomorphism property of x.
With the actual section s of Q chosen with s(1)=1, put
    T_psi(u,g)=U_psi(u)x(b_u(g)),
    z_psi(g)=sum_{t in Q} T_psi(s(t),g).
For k in K, using the cocycle identity with a(b)=1,
    x(k b k^-1)=a(k)x(b).
Since psi(k)=1, U_psi(k)a(k)=1, so T(ku,g)=T(u,g).
This uses K, NOT arbitrary H: psi need not vanish on H.
Exact group multiplication gives
    b_u(gh)=b_u(g)b_(ug)(h).
Both factors have trivial cyclotomic character, so
    T(u,gh)=T(u,g)+U_psi(g)^(-1) T(ug,h).
Right multiplication permutes Q; lift-independence before summing yields
    z_psi(gh)=z_psi(g)+U_psi(g)^(-1)z_psi(h).
Continuity: b_u(g) is continuous as a G-valued commutator and as an
H-valued map by closed embedding; finite sums of locally constant terms
are locally constant. b_u(c)=1 gives z_psi(c)=0.
For g in K in the specified inertia off l or decomposition above l
with cyc(g)=1, write b_u(g)=w_(uc) w_u^-1 where w_v=v g v^-1.
Both w_v lie in K and satisfy the corresponding local vanishing
condition at the conjugated place of E; hence x(w_v)=0 and x(b)=0.
Retain the restriction of inertia and decomposition to H, the actual
place transport and the cyclotomic-kernel requirement. No assertion that
all g above l vanish. This proves exactly hZ: z_psi in component l e psi n.

Now for g in H, sum over all characters of Q using the native sum_characters_eq
with the actual enough-roots O hypothesis. Orthogonality in O, then reduction
to B, avoids division by D and works when l divides D:
    A(g):=sum_psi z_psi(g)=D x(b_1(g))
        =D(x(cgc)-x(g))=-2D x(g).
Because z_psi(c)=0, the cocycle gives
    z_psi(cgc)=U_psi(c)^(-1) z_psi(g)=U_psi(c) z_psi(g).
The last sign is exactly +1 or -1 in O, before passing to B.
If every odd-relative z_psi is zero, the even terms cancel in the difference,
and thus
    0=A(cgc)-A(g)=4D x(g).
This is hPhi, with no division by 2, D, or any difference of roots of unity.
Do not use character idempotents 1/D or infer x=0 at l|4D.
More generally the exact difference equals -2 sum_{U_psi(c)=-1} z_psi(g).
Using the existing 4X_e^2 component annihilation, apply hPhi to 4X_e^2 x,
with linearity of the same transfer, so Y_e=4D*4X_e^2 kills x.
Retain this original sufficient factor (no optimization needed).

## 2. Ray-class quotient and universal detecting set, including l=2
For K0=Q(mu_M), M=N*l^2>=4, set d=[K0:Q]<=M and S=places over l.
Class field theory for the totally complex K0 gives a finite abelian
quotient of G_K0^ab detecting all continuous homomorphisms killed by M
and unramified outside S. Explicitly use finite ideles I, principal P,
U=all finite local units, J=ideles that are M-th powers at S and
units outside S. Then Q0=I/(PJ) is finite; I/(PU) is the ideal class
group, and (PU)/(PJ) need not be defined as a quotient since J need not
be a subgroup of U. Instead use the intermediate P U J:
    [I:PJ]=[I:PUJ]*[PUJ:PJ].
The first factor divides h_K0; the second is an image of U/(U cap J),
whose order divides I_M=[I:idelesPowAt S M], since U cap J=U cap
idelesPowAt S M. The Artin image quotient has order dividing [I:PJ].
Every such homomorphism kills J, by local reciprocity (units off S,
M-th powers at S), and P, by global reciprocity (no real places).
Artin surjectivity as in Avatars then gives the required factorization.
Choose finite cyclic factors of the resulting quotient with orders m_i>=2.
The product divides h_K0 I_M. Lifts p_i of their generators detect every
such homomorphism and give m_i x(p_i)=0. This is the actual hom detector,
not just an upper bound on a group unrelated to x.

The local index bound in Avatars uses the finite extension local power
index |K_v^*/K_v^{*M}| <= M^2 * |M|_v^(-1): valuation contributes M,
finite roots of unity at most M, and the pro-prime-unit free rank gives
the local norm factor (structure theorem for local units). Multiplying
over S, with product of local norms bounded by M^d, gives I_M<=M^(2|S|+d).
Retain local-field finiteness and local power index theorem.
Since |S|<=d, |disc K0|<=M^d (cyclotomic discriminant), and the native
Minkowski class number bound h_K0<=(2^d |disc|)^(d+1),
    h_K0 I_M <= 2^(M^3+5M^2+M)
using M<=2^M. Thus #p<=M^3+5M^2+M. Add at most phi(M) lifts of the
actual image of G_E -> (Z/M)^*, so total <= M^3+5M^2+2M <= M^4
for M>=4 (divide by M and use M^3-M^2-5M-2>=0).
When N<=y and l<=y^2, M<=y^5, hence <= y^20.
These lifts and p_i are chosen before O,n,e.

If z is any allowed Tate-twist cocycle over G_E vanishing on this fixed
set, induction on k with l^k z=0 proves z=0. k=0 trivial. For k+1,
apply induction to l z, which is still in the module and zero at the
same points. Then l z=0, hence M z=0. The source uses M z for the
induction instead; either proves the needed M z=0.
For g in G_K0, cyc(g)=1 mod l^2, so the inverse twist acts trivially
on M-torsion (and certainly on l-torsion); restriction is a genuine
homomorphism, locally constant and unramified off l by restriction of
inertia, and the chosen p_i make it zero. For any g in G_E choose
a representative r of its image modulo M; g=k r, k in G_K0, so
z(g)=z(k)+a(k)z(r)=0. The representatives need cover only the actual
image, not assert surjectivity onto the entire unit group.
This completes the detecting-set supplier in 19061b0f. The e=0
class-number length bound there remains separate. For positive e, the
large-prime component detectors and the small-prime set just proved,
with the SAME Y_e, give the original uniform integer length estimate.
No new class-group asymptotic or assumed RH.

## 3. Exact Tate-twist triangle caller (TateTwistSteps)
Let Z, e in Fin t, nu, triangle and b satisfy the actual
hasTriangleCost_tateTwist hypotheses, C=l^h, d(g)=cycInv(g)^e-1.
Let L=shaLocalSet l E e, and S<=Z cap ker eval_L with ALL tame
evaluations zero and the matching Frobenius pairs equal.
Use the same L in HasTriangleCost. For the positive e associated to
j, z+z^c is even and vanishes at the local L, with exactly the same
ramification set. At the paired points tau'_i=(tau_i^c)^-1 and
phi'_i=(phi_i^c)^-1 the inverse-twist acts trivially in B by
IsNewPlaces.cycInv_withConjInv. Thus z(tau_i)-z(tau'_i)
=(z+z^c)(tau_i), and the same at phi_i. Earlier equality pairs give
precisely the zero values required by tri.step. Hence C times the
jth tame-pair difference is zero. No claim of equality before C.

The local relative length is bounded by
relLength Z (obeying(crysRels(tateTwist))). Indeed Z intersect the
crystalline relation module vanishes on L: at the chosen local chart
the single evaluation relation is zero on every integral crystalline
cocycle, by crysCocycles.apply_eq_zero_of_cyclotomicGp and the actual
localChart.isWeilPair_zero_iff; for e=0 use the inertia case in that
chart. Transport to other places by G_E conjugation, using that the
specified element acts trivially under the twist (inertia for e=0,
cyc=1 for e>0). The cocycle formula gives
z(x g x^-1)=a(x)z(g) when a(g)=1, so zero transfers. Retain the
local crystalline chart theorem and its Frobenius witness as in native;
not inferred from local vanishing of arbitrary torsion cocycles.
This is the inclusion used by relLength_le_of_inj 1 at the caller.

S is unramified off l because ALL tame evaluations vanish, via
tri.isNewPlaces.mem_selmerModule_of_tame_eq_zero.
For e=0, S lies in shaOdd (no parity restriction), so its relative
length modulo C-torsion is bounded by length shaOdd.
For e>0 define F(z)=z^c-z; it lies in shaOdd, without halving.
If F(z)=0 then z is even. Apply tri.coboundary to z+z^c=2z, using
the matching Frobenius equalities to get
    4 d(gamma) z(g) = d(g) [4 z(gamma)].
Hence 4d(gamma) z is a coboundary in Z (Z is a module). By the actual
H hypothesis, d(gamma) times this coboundary is zero, giving
    4 d(gamma)^2 z = 0.
The original triangle divisibility 4d(gamma)^2 | C implies Cz=0.
Consequently ker(F|S) subset S[C], and
    length(S/S[C]) <= length(im F) <= length(shaOdd).
The first inequality is a SURJECTION S/ker F -> S/S[C], not an
injection of S/S[C] into shaOdd; F need not annihilate S[C].
Combine both bounds with the exact hb to obtain HasTriangleCost.
This matches RibetElement's use in the block Fitting coefficient
bound at RibetFirstOrder.exists_mem_fittingIdeal_block. No additional
assumption that 2, d(gamma), or C are units; do not omit either
factor 2 in the two applications of the even sum. No new global
root-node deletion or arithmetic conclusion beyond this caller.

## 4. Exact regression evidence, local Python executed
Finite-group checks of transfer and averaging signs (not a replacement
for arithmetic Galois hypotheses). G=D_(2m) x C2, H=K=C_m,
c a reflection, Q=C2 x C2, coefficient Z/q, e=0,1 as a sign-action
model (trivial on H). Results: 760 normalization checks, 373632
cocycle equalities, 982 character sums, 982 parity differences;
212 cases with x(g) nonzero but all z_psi(g)=0, illustrating why
one cannot drop the factor 4D in bad characteristic.
Concrete negative control: m=4,q=4,x(r)=2. Then x is nonzero
and odd, but all commutator evaluations and transfers vanish.
This refutes the stronger unscaled transfer-injectivity claim,
not a counterexample to an arithmetic theorem with extra local conditions.
99 count bound checks at y=2..100. Reproduce:
    from itertools import product
    counts=[0,0,0,0]; neg=0
    for m in range(2,9):
      G=list(product(range(m),range(2),range(2)))
      mul=lambda g,h:((g[0]+(-1)**g[1]*h[0])%m,g[1]^h[1],g[2]^h[2])
      inv=lambda g:((-(-1)**g[1]*g[0])%m,g[1],g[2])
      c=(0,1,0)
      conj=lambda u,g:mul(mul(u,g),inv(u))
      b=lambda u,g:conj(u,mul(conj(c,g),inv(g)))
      chars=list(product(range(2),repeat=2)); reps=[(0,i,j) for i,j in chars]
      for q in (2,3,4,5,6,8,9):
        for v in range(q):
          if m*v%q: continue
          x=lambda g:g[0]*v%q
          for e in (0,1):
            def U(chi,g):return (-1)**(e*g[1]+chi[0]*g[1]+chi[1]*g[2])
            def z(chi,g):return sum(U(chi,u)*x(b(u,g)) for u in reps)%q
            for chi in chars:
              assert z(chi,c)==0;counts[0]+=1
              for g,h in product(G,repeat=2):
                assert (z(chi,mul(g,h))-z(chi,g)-U(chi,g)*z(chi,h))%q==0
                counts[1]+=1
            for g in G:
              if g[1:]!=(0,0):continue
              assert (sum(z(chi,g) for chi in chars)+2*len(chars)*x(g))%q==0
              counts[2]+=1
              assert (sum(z(chi,conj(c,g))-z(chi,g) for chi in chars)-4*len(chars)*x(g))%q==0
              counts[3]+=1
              if x(g) and all(z(chi,g)==0 for chi in chars):neg+=1
    assert counts==[760,373632,982,982] and neg==212
    for y in range(2,101):
      M=y**5
      assert M**3+5*M*M+2*M<=M**4==y**20

## 5. Dependency/axiom ledger and handoff
Source-visible path: star_inequality -> integral_forms_long -> fit/Ribet
-> hasTriangleCost_tateTwist -> odd-Sha bound plus crystalline relLength,
triangle step/coboundary and tame removal. Odd-Sha -> hZ/hPhi, hom
detector, local index and class-number bounds, previous Stickelberger
integer and derivative detector. Replaced human subgraph by exact group
and additive identities, with all external class field/local field,
finite Fourier, cyclotomic, chart, triangle and quantitative premises
retained. Original/reduced graph and axiom files untouched; no global
edge claimed deleted. Context cache key: compact pin,E,N,K,O,l,n,e,
actual x and section, actual triangle and same Z,L,S,C, local chart.
Native lean/lake unavailable; cannot use old-pin engines on this compact
module. Prepared scalar checks and named native probes below.
Actual CI receipts re-read: 45577239749 status blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
45576756833 blob 7da354941e402b6f8b364ed03d8c5c82d27b7717: old-pin
conditional reduction pass only. Compact 45803534769 targeted_results
blob 088cd2ec0e935ee1a282f10096949bcf671cc804: six named theorem
checks with propext, Classical.choice, Quot.sound; module_1_build
timed out 124, all_requested_checks_ok=false, full_RH_replay=false.
No new native PASS, no claim of full human proof. The full Lean
certificates below are PREPARED, not executed.

RESUME HERE: integrate this hZ/hPhi and detector into the previous
uniform length derivation 19061b0f; use the exact Tate-twist quotient
surjection at the actual Ribet caller. Next audit the local chart
crysRels -> evaluation-zero bridge and the remaining integral block
row-defect / paired Q,g local budget in RibetElement, matching the
already available peer derivations before replacing anything.
HANDOFF TO integration, editor, Galois, literature and shared kernel runner.
AGREE / PARTIAL: character averaging, universal ray-class detector and
triangle relative-length argument source-matched; retained deep
suppliers and native verification still required.
-/

namespace RHCompactAuditOddShaTransfer

theorem parityDifference {R : Type*} [CommRing R]
    (A B D x : R) (ha : A = -2*D*x) (hb : B = 2*D*x)
    (he : B = A) : 4*D*x = 0 := by
  linear_combination ha - hb + he

theorem trianglePayment {R : Type*} [CommRing R]
    (d C x : R) (h : 4*d^2*x = 0) (hd : 4*d^2 ∣ C) :
    C*x = 0 := by
  obtain ⟨q, rfl⟩ := hd
  calc
    (4*d^2*q)*x = q*(4*d^2*x) := by ring
    _ = 0 := by rw [h, mul_zero]

#print axioms parityDifference
#print axioms trianglePayment
end RHCompactAuditOddShaTransfer

#check exists_detecting_points_hom
#check exists_detecting_points_cocycles
#check exists_length_shaOdd_le
#check hasTriangleCost_tateTwist
#print axioms exists_detecting_points_hom
#print axioms exists_detecting_points_cocycles
#print axioms exists_length_shaOdd_le
#print axioms hasTriangleCost_tateTwist
