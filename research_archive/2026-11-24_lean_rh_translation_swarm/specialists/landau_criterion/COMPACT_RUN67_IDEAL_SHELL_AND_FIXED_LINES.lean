import New.Filling.FixedLines
import Mathlib.Tactic

/-!
# RUN67 — finite content shells and the fixed-vector mass saving
27 November 2026. Human source-matched derivation, not a new kernel replay.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Original pin 40e56bab026552e089d7afcfeff08d2defb9c005 kept separate.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10; manuscript
944957c6f43b63df7a845472b31492dc0ca1cb8f and RUN66 blob
73d8c245641b59e182876df82c412fe8fa0a8d73 reviewed. Latest peer list
83de56e3,6de4f9d9,dc78b895,8b6f39e9,219694f2; manuscript expressly
retains both suppliers addressed here. No independent audit claimed.

## 1. The actual finite content shell
TopFloor.lean 9762970967aef90b3a4e025b7f2891d892c70111,
lintegral_shells_le. StandardLevel.lean ec149f4a38c54931f75c7e106ce94d1d6e65c5a4,
gauge and zeta_rank. LocalTheorem.lean 671350f97491467f09b80eafa0df13685dd8ddc6,
Gauge.lintegral_positions_le and Gauge.formMajorant_sq_le.
FlatCharts.lean cc98bd4c6c1bf499ec8298a4476f0715e9c3b2f4,
hasMatSize_sub_one_of_floorValues.

Use the native j,p,q,alpha, W=W_Z, f, e, t, n=rho+1 and
k=Shape.k; s=F.volumeExponent. Assume the native rank guard
t+10^8*n^4<=k and both head conditions, 1/g of size 1
if j!=0, f<=formMajorant, and the extra squared e-gain when
e<1. Write Lambda=2/md(alpha), e0=min(1,e),
R0=Z.massRatio, and Q(x)=Gamma.selfNormProduct at the SAME W.
The measure normalization is the native finite IntegralPlace
normalization (Plancherel c=1). All moduli of units are positive
finite. Nonzero f lies in positions: extract a nonzero pivot
from its majorant, then the two Bessel support witnesses give
x=y^-1 u y times the level subgroup. This is the final support
subargument of the source, not an arbitrary support assumption.

Take D(x) to be the vector of entries of (x-I)/g with one
extra coordinate 1. Its clearing ideal
I_x={a in R : every a D(x)_i in R}
has a principal generator c in A^x intersect R by
exists_content (the extra 1 is essential), and
H=[R:I_x]=1/md(c)>=1. On the whole shell I_x=cR
the gauge Gamma_c with alpha_c=star(c)c has
Lambda_c=2 H^2 and every x is in its positionsOfSize:
c D(x) integral implies star(c)c D(x) integral.

Set L=(10*n+1)*99*n, and choose sigma>0 with
sigma^(400*n^2)=H^-1 Lambda^L.
If sigma<1, at each active y in the hypotheses of
formMajorant_sq_le, some remaining floor has volume <=sigma^2.
Indeed, otherwise the primitive-matrix supplier of RUN66
gives integral d_i with md(d_i)>=floorVolume_i>sigma^2.
Take C=product of the d_i over the remaining floors, with
at most n terms (the empty product is 1). Each C/d_i is
integral, and md(C)>sigma^(2n). Use the gauge with parameter
alpha^(10*n+1)*star(C)C. All the inverse floor witnesses
have size 1 in that gauge, since C/d_i is integral; the
head bridge hS of FlatCharts follows by multiplying the
original size-1 condition on 1/g with size 10n. The source
close pair and near-head witnesses give (x-I)/g size 99n.
The same rescaling applied to the extra coordinate 1
and the content condition then says
c^-1*(star(C)C)^(99n) has original Gamma-size L. The
original modulus bound md_le gives
    H*md(C)^(198n) <= Lambda^L.
But md(C)^(198n)>sigma^(396n^2)>=sigma^(400n^2)
=H^-1 Lambda^L, a contradiction. This proves the cap,
including when the remaining floor set is empty (then
no such active point can exist in a remote shell).

## 2. Pay the content loss before summing
Apply formMajorant_sq_le with cap min(sigma,1)^2, the
native floor-mass allowance V <= Lambda^(9999*n), and
the assumed e-gain if e<1. Taking the smaller of the two
applicable estimates gives
    f^2 <= [min(sigma,1,e)^s Lambda^(9999*n)]^2 Q.
This includes sigma>=1 and e>=1: use the unconditional
majorant with cap 1; if e=0 no division by e is made.
For the SAME shell apply Gauge.lintegral_positions_le with
Theta=pairingNorm(W,W). The factors of unipotent mass
cancel through pairingNorm_mul_le_massRatio. Thus
    headDensity * int_shell f <=
      R0 * h^s * Lambda^(9999*n+1500000*n^3+1)
            * (2 H^2)^(50000*n^2),
where h=min(sigma,1,e).
The native dimension equality and rank guard give
s>=t+400*n^2*(200000*n^2). As h<=1, e0 and sigma,
    h^s <= e0^t * (sigma^(400*n^2))^(200000*n^2).
Multiply by H^m, where native m<9n<=50000*n^2:
the exact H exponent is m+100000*n^2-200000*n^2
= m-100000*n^2 <= 0. The Lambda exponent is
9999*n+1500000*n^3+1+200000*n^2*(10*n+1)*99*n
<= 9*10^8*n^4 (n>=1). The 2 exponent is 50000*n^2,
which is <=10^5*n^2. Consequently, for every shell,
    H^m * headDensity * int_shell f
        <= e0^t R0 Lambda^(9*10^8*n^4) 2^(10^5*n^2).
This is the actual uniform shell-mass budget, with the
source's constants (not the distinct RUN64 vector moment).

TorusMajorant.lean 9228ab231ce49ed76c8548f2f06c74138e638b15,
lintegral_le_idealZeta_mul. Apply this to the measure with
density f and the constant headDensity on positions.
The shells cover the support, indexed by finite-index
ideals; finiteness of zeta_R(m)<=2 gives countable support.
For each shell integrate its bound H^-m times the common
budget; subadditivity/Tonelli suffices (indeed the exact
content shells are disjoint). The native zeta_rank gives
zeta_R(m)<=2. Absorb 2^(1+10^5*n^2) in Lambda since
Lambda>=2 and 9*10^8*n^4+1+10^5*n^2<=10^9*n^4.
Hence
    headDensity * int f <= e0^t R0 Lambda^(10^9*n^4).
This reconstructs lintegral_shells_le conditional on the
native primitive content, frame, floor-mass, pairing and
local integral inequalities; it is NOT an independent
proof of those lower-level geometric suppliers.
It plugs into RUN66 at j=0 and the distinct frequency
consumer at t+12; do not discard general head hypotheses.

## 3. One-prime fixed-vector group and mass
FixedLines.lean a9305a4f1db1dc1cc9861ce3abe53a8a6331fdc9,
volume_nonunits_le, exists_intermediateGroup_one_prime.
Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727.
Readable companion at SAME pin:
grh/src/New/Spanning/Frames/FixedLines.lean
1e48e82aafbe528ac5e7913d5934fa7b830152e6, checked as
clarification only; constants below from compact caller.
LocalHomUnit.lean bee7de70e18e0ad7658f38984b4ff83e0ad1eb33,
index_stabilizer_GL_vector.

At each relevant w, R_w has nonunits of measure 1/q_w
by its uniformizer and normalized additive Haar. In the
finite product use union bound, not independence:
number of places <=4*numInfPlaces E <=4b/1000, and each
q_w>=b^10, so w0=vol(R minus units)<=b^-9.
B=b^9>=2. Put K0=F.congGroup, K=integral unitary,
M=F.groupMeasure, kappa=F.floorZeroForm, and
D=10^10*n^4, t=k-D. The native chain gives k>=3D+12,
so t+D=k and 6k<=9t. The full matrix dimension
r=k+1+2rho is greater than t+1 (D>=1).

For the chosen place, p is the local projection of the
global lattice stabilizer onto K. The native
exists_toPlaces_eq gives surjectivity. Let Hglob be the
inverse image under reduction of the vectorFixer w d;
the fixed vector is nonzero because the frame inclusion
is injective. The native reduction modulo g at w is
identity for p^-1(K0), by inv_gIdele_smul_mem_iff,
h.g_eq and integrality off T0 (which also forces w in T0).
Hence p^-1(K0)<=Hglob and ker p<=Hglob. Set Z=p(Hglob);
then K0<=Z<=K, with the required reduction containment.
Index preservation for surjective homomorphisms yields
[K:Z]=q^r-1: reduction is surjective by IsAdmissible,
projection to the w component is surjective by inserting
one coordinate, and idOrInvAdjoint is an automorphism.
GL_r(F_q) acts transitively on nonzero vectors (extend
each to a basis), so orbit-stabilizer gives q^r-1,
NOT the smaller index of a projective-line stabilizer.
For q>=B and r>t+1, q^(t+1)<=q^r-1. Haar disjoint
cosets now give B^(t+1) M(Z)<=M(K).

RUN66's bottom bound and the native lower bound
M(K)>=2^-n (inv_two_pow_le_groupMeasure) imply
    kappa(Z)<=M(Z) M(K0) [M(Z)+B^(-(t+1)) M(K)].
By the rarity inequality the bracket is at most
2 B^(-(t+1)) M(K). Multiplying by b^(6k)<=B^t
makes it at most (2/B) M(K)<=M(K). Finally
kappa(K)>=M(K)^2 M(K0) by restricting its nonnegative
outer integral to K0, where the phase is 1. Therefore
    kappa(Z) M(K) b^(6k) <= kappa(K) M(Z).
This is exactly the one-prime caller, with all masses
finite and positive. No Rallis formula or analytic RH
assumption is involved in this particular transfer.
The empty option simply uses Z=K and multiplier 1.

## 4. Simultaneous fixed vectors, one normalization
Partition the finite places into star-stable blocks T_i
indexed by Option Sg (each selected pair and its complement).
The place-product isomorphism phi identifies the unitary
groups, congruence and Bessel unipotent subgroups componentwise.
Its inverse assembles matrix entries from the unique block;
the unitary equation is checked coordinatewise. The additive
character is a product because the local additive arguments
sum and the character is a homomorphism. The extended
phase is likewise the product: existence of Bessel
decomposition is componentwise, and the formula for phase
on such a decomposition factors. If a component has no
decomposition the corresponding phase and the full phase
are zero. Keep the native measurable embedding and the
product-integrability hypotheses (bounded phase on compact
open Z).

If the pushed Haar is tau times the product Haar, for
Z=phi^-1(product Z_i) the identities are
    M(Z)=tau product_i M_i(Z_i),
    kappa(Z)=tau^3 product_i kappa_i(Z_i).
The inner integral contributes tau, its squared norm
tau^2, and the outer nonnegative integral contributes tau.
Fubini/Tonelli yields these exact identities, using the
same tau for K and Z. Multiply the one-prime inequalities,
with empty-option multiplier 1, then multiply both sides
by tau^4. This proves exists_intermediateGroup_lines:
    kappa(Z) M(K) (b^(6k))^#Sg <= kappa(K) M(Z).
This is the quantitative supplier at RUN66's actual
exists_finite_sieveSystem bottom consumer; the membership
condition follows from each block's containment. The source
requires a fixed vector, not just a line up to scalar.

## 5. Local frontier and verification
Original visible graph: content/ideal -> gauge cap ->
formMajorant_sq_le + lintegral_positions_le + pairingNorm ->
lintegral_shells_le -> floorZeroForm_le_main_term;
reduction surjectivity + congruence bridge + vector index +
bottom + Haar -> exists_intermediateGroup_one_prime ->
product phase/Haar -> exists_intermediateGroup_lines ->
exists_finite_sieveSystem -> Filling.Moments -> B.
Reduced human graph: same source leaves, common content
shell exponent cancellation and orbit-stabilizer, then
one common product-Haar cancellation into RUN66. No global
kernel edge removed. Retain content existence, local
geometric frame/Plancherel inequalities, reduction and
surjectivity, finite product group construction and all
other B frequency, top energy, absolute unfolding, Rallis
and Siegel-Weil suppliers. Context key: compact pin, same F,
Z,g,j,p,q,alpha,actual W_Z, m,n,k and shell I; for lines
same Sg,d,star blocks, reduction and Haar. No old graph,
axiom or protected workflow files altered.

Local command -v lean/lake/elan returned none. Re-read
historical status files b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717: actual old-pin
CI 45577239749 and 45576756833 pass. They do NOT verify
this compact file. No new native rh_scan/prune/reduce/auto/
frontier execution; no numerical or finite-test claim.
Certificates below prepared, not compiled; request existing
shared compact runner, without workflow edit. Human source
audit still required, especially modulus cap and shell
measurability. No RH theorem imported as premise, no URT.

RESUME HERE: integrate RUN66/67 into the actual finite
frequency and bottom fields, independently audit the cap
and exact constants, and finish the top correlation/energy
and absolute unfolding/Rallis suppliers if not already
supplied by peers. Keep the distinct A/C and Landau inputs
open. HANDOFF TO integration, positivity, audit, kernel.
-/

namespace CompactRun67

theorem shell_content_budget (m n : ℕ) (hm : m ≤ 50000*n^2) :
    m + 100000*n^2 ≤ 200000*n^2 := by omega

theorem shell_scale_budget (n : ℕ)
    (h1 : 1 ≤ n^4) (h2 : n ≤ n^4) (h3 : n^3 ≤ n^4) :
    9999*n+1500000*n^3+1+200000*n^2*(10*n+1)*99*n
      ≤ 9*10^8*n^4 := by
  have he : 200000*n^2*(10*n+1)*99*n =
      198000000*n^4+19800000*n^3 := by ring
  rw [he]
  omega

theorem shell_zeta_budget (n : ℕ) (h1 : 1 ≤ n^4) (h2 : n^2 ≤ n^4) :
    9*10^8*n^4+1+10^5*n^2 ≤ 10^9*n^4 := by omega

theorem fixed_exponent (k D : ℕ) (h : 3*D+12 ≤ k) :
    (k-D)+D=k ∧ 6*k ≤ 9*(k-D) := by omega

theorem fixed_mass_transfer (z K c kz kk gain a : ℝ)
    (hz : 0 ≤ z) (hK : 0 ≤ K) (hc : 0 ≤ c) (hg : 0 ≤ gain)
    (hup : kz ≤ z*c*(z+a*K))
    (hr : z ≤ a*K) (hpay : 2*a*gain ≤ 1)
    (hlow : K^2*c ≤ kk) :
    kz*K*gain ≤ kk*z := by
  have hbr : (z+a*K)*gain ≤ K := by
    calc
      (z+a*K)*gain ≤ (2*a*K)*gain :=
        mul_le_mul_of_nonneg_right (by linarith) hg
      _ = (2*a*gain)*K := by ring
      _ ≤ 1*K := mul_le_mul_of_nonneg_right hpay hK
      _ = K := one_mul _
  calc
    kz*K*gain ≤ (z*c*(z+a*K))*K*gain :=
      mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_right hup hK) hg
    _ = (z*c*K)*((z+a*K)*gain) := by ring
    _ ≤ (z*c*K)*K := mul_le_mul_of_nonneg_left hbr (by positivity)
    _ = (K^2*c)*z := by ring
    _ ≤ kk*z := mul_le_mul_of_nonneg_right hlow hz

#print axioms shell_content_budget
#print axioms shell_scale_budget
#print axioms shell_zeta_budget
#print axioms fixed_exponent
#print axioms fixed_mass_transfer
#check IntegralPlace.IsStdLevel.lintegral_shells_le
#check IntegralPlace.IsStdLevel.floorZeroForm_le_main_term
#check Filling.IsFillingLevel.exists_intermediateGroup_one_prime
#check Filling.IsFillingLevel.exists_intermediateGroup_lines
#print axioms IntegralPlace.IsStdLevel.lintegral_shells_le
#print axioms Filling.IsFillingLevel.exists_intermediateGroup_lines
end CompactRun67
