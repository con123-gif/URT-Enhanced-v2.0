import New.Curve.JetDivisibility

/-!
# RUN56 — reconstruct the Schur-jet primitive by a single null frame
2026-11-26, prime-window lane. Compact source lsernau/grh-lean
72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb: primitive focus.
Prior run 5b79a6d9ef2efb4c8b423eb709e65dd51a20b1de.
Latest peer heads read 11745699, 266421eb, f4015a87, bb09b6c2,
0807db85, 40f4331a, 40e57948 (theta stage-support, not this jet
primitive). Human source-matched reconstruction, pending independent
audit; scalar checks below prepared, not compiled.

Native source ledger, relative to grh-compact/src:
New/Curve/JetDivisibility.lean 5f6e6f63dc7bfc35aedc136ae8330510d3493f06
 lines 24–53 exists_null_coupling_frames; 65–end norm_schurJet_le.
New/Curve/LiveSum.lean 3efab3907b063bb2c59d182df981ad62862f8a1b
 lines 69–73 couplingCount.
New/Core/ModuleIndex.lean 214cc116f97852925f444db42bfa36cf563af508
 lines 20,24–25,68–73 IndexDvd, comap, of_det_dvd.
Lib/GLn/SchurModule/SchurMatrix.lean 8c91b4b7888c99e604df5fa2dd38a130b4fea7bb
 lines 93–103 integral coefficient extraction, 148–150 expansion.
New/Curve/ThetaProducts.lean 044e906a110715710a4a60c0b06d73d70483afda
 lines 86–92 thetaProducts_normal_form.
New/Curve/ConjugatesOfJets.lean 8b841d76bb938d8a18fd4341aa832a20b13dd9e0
 lines 55–83 norm_jetSeries_le.
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
 Data.IsGoodDatum.mem_raises -> exists_move_markOperator ->
 gaugeLe_markOperator_pow -> exists_indexDvd_Bmu_divisible.
New/Columns/TwistedHeckeType.lean ccae44b8b21d1bface80bc3c8b10370a48c8ea48
 Columns.hasType_markOperator, separate supplier.
New/TwistedHecke/ElementaryDivisors.lean 1373fd6d510b5df87bfde3b6a0d7bdce4c7ee307
 hasType_twisted_hecke, of_pairing, exists_depth_factorization,
 exists_projector. These are not closed in this run.

## 1. Construct simultaneous frames, not independently optimized pairs

Fix all parameters of exists_null_coupling_frames: O=valRingCp p,
finite places Phi, finite row index n, arbitrary integral Y, finite
coupling set S, partner maps pr_e, heights h<N, multiplicities kappa,
exception set ev and theta in O (theta=0 permitted in this lemma).
For each edge (e,sigma) write sigma'=pr_e sigma, q=p^e. Let t be the
number of height-one columns outside ev, r the number of other
columns, B the total boxes of the latter, at each endpoint. Use
native definitions, including h=0 if present. A frame row at height
h consists of h coefficients, applied to the first h coordinates of
each row of Y. Denote its transformed row vector by m.

Choose the following linear congruences simultaneously, on the SAME
frame M_{tau,h} at each place and height. A source congruence has
modulus theta^(1/q) (choose a root in O by algebraic closedness);
a target congruence has modulus theta. Congruences on a whole frame
row mean one per coordinate. All are O-linear in the frame row,
with integral coefficients:
- If t_sigma/q <= r_sigma'+t_sigma', constrain each coordinate
  of the source h=1 row when sigma is not in ev. Otherwise constrain
  the target row's dot product with Y_sigma(.,0)^q, for every target
  height, except h'=1 when sigma' in ev.
- For each source h != 1 row, constrain its dot product with
  the coordinatewise q-th root of Y_sigma'(.,0), modulo theta^(1/q).
- If B_sigma/q <= B_sigma', constrain all coordinates of each
  source h != 1 row; otherwise all coordinates of each target h'!=1
  row. Empty rows at h=0 create no pairing. Source h=0 dot
  congruences, if listed, have zero functional and only overcount.

To obtain M, collect all chosen linear congruences for each
(tau,h) as a map O^h -> O^c. The diagonal image in O^c with entries
equal to their moduli (or 1 for omitted conditions) has IndexDvd
dividing the product of moduli, by the determinant lemma.
Pull back along this map using IndexDvd.comap and take the input
family to be the standard basis of O^h. Its witness matrix M has
det M dividing the same product, and every row satisfies all
the conditions. Thus no independence or transverse-intersection
assumption on the congruences is needed. This works also for
self-edges, repeated edges and noninjective partner maps; all the
conditions on the same frame are collected before taking its
determinant. A finite product of determinant costs is enough,
including the zero-modulus case (trivial norm lower bound).

For each edge the sum of exponents of |theta|, weighted by kappa,
is EXACTLY
 C_e(sigma)=min(t_sigma/q,r_sigma'+t_sigma')
             +r_sigma/q+min(B_sigma/q,B_sigma').
Indeed the first and third choices select the smaller cost; a full
coordinate constraint costs h times a single constraint. The middle
term pays for one linear form per non-height-one column, not all
its coordinates. Summing this cost over edges gives the native
product lower bound prod_{tau,h}|det M|^kappa >= |theta|^sum C.
For theta=0 use native zero-power convention. No assertion that the
chosen determinant is optimal; overlap may improve it.

## 2. Verify the full null condition on these same frames

Let g:O->R be ANY map into a commutative ring of characteristic p
killing theta, not necessarily a field or reduced ring. In R,
(q-th powers) are additive. A source row constrained modulo a
q-th root of theta has its q-th power zero after g, and a target
row constrained modulo theta is zero after g. For each pair of
heights h,h' which is not exempt (exempt iff h=1 and
(sigma in ev or (h'=1 and sigma' in ev))), the pairing of transformed
rows sum_a m_a^q m'_a vanishes:
- h=h'=1, or h=1<h': first choice either kills the source row's
  q-th power or kills the dot product of the target row with
  the raw source height-one q-th power. The source height-one
  frame is a scalar, so its extra factor does not matter.
- h!=1, h'=1: the middle constraint's q-th power kills the
  dot product against raw target height-one Y; multiply by its
  frame scalar.
- h!=1, h'!=1: third choice kills one full row in the required
  orientation.
The statements include all row indices in the corresponding
Fin h and Fin h'; h=0 or h'=0 is vacuous. This reconstructs
exists_null_coupling_frames with its original universal ring-map
and characteristic-p quantifiers. It is important NOT to infer
g(theta^(1/q))=0 from g(theta)=0 in a ring with nilpotents.

## 3. Bound the Schur jet without a coefficient-count loss

Keep h_kappa: FitsRanks n n' kappa, N=card n', B=boxes kappa N
and the exact native nonnegative integral charge g(tau,h,b) on
tableau boxes. Let m be the total charge for the fixed output
tableau i'. For every e in S, sigma, h,b the native charge guard
says that on an exempt pair at least one of g(sigma,1,b),
g(pr_e sigma,h,b) is nonzero.

Let L(P)=(P(partial)Theta)(0). Expand a row-substituted basis
minor product in the integral Schur basis with its determinant
power (sum_schur_smul_nablaBasis). Apply L to the coefficients in
the derivative variables. This yields a polynomial in the row
substitution variables with coefficients L(schur entries).
More precisely its coordinate expansion in the input Weyl basis
recovers the entries of the Schur jet. The native
coord_mem_of_coeff_mem applies for the additive subgroup given
by any norm ball: integer basis coefficients commute with passage
to the additive quotient by that subgroup. Linear independence of
the same basis over the square-zero extension Z plus this quotient
forces each coordinate to vanish in the quotient. This is why one
does not pay a denominator to extract the Schur coordinates.
The valuation-ring evaluation lemma exists_val_coeff_le_val_eval
then selects integral values Y for all substitution variables at
which the polynomial norm dominates ALL its coefficient norms.
Equivalently over the infinite residue field of Cp, divide by a
maximal-norm nonzero coefficient and choose a residue-field point
where the resulting nonzero polynomial is nonzero; lift the point
to O. The zero polynomial is immediate.

For these actual Y choose the simultaneous M from sections 1–2.
Set z(tau,b,a;h,i) equal to p^g(tau,h,b) times the transformed
Y row for that place and b, zero in all other place/b blocks.
In the linear substitution Z determined by z the Frobenius
pairings cancel: for nonexempt terms use section 2; for exempt
ones the charge guard kills at least one factor in characteristic p.
All constants of Z vanish, and its coefficients lie in O.
Consequently the native IsIntegralOnNullCone hypothesis gives
integral coefficients through degree B of Theta after substitution
by varpi Z. This is precisely where the normal form of the
actual CM theta series is needed; it is not deduced from the
frame construction.

Multilinearity of every determinant in the selected minor
product gives the EXACT factor
 D = varpi^B p^m prod_{tau,h} det(M_tau,h)^kappa(tau,h).
It multiplies the original polynomial jet evaluated at Y, by
the determinant product identity and the jet chain rule. Take
norms only after this identity. On the substituted integral
series expand the remaining derivative polynomial as a signed
sum of monomials, each of total degree B. Nonarchimedean
triangle inequality bounds the norm by the largest term, with
no factor counting determinant permutations. For a derivative
monomial with exponent vector d the jet is d! times its
integral coefficient.

## 4. Factorial error and the actual native valuation

For any 0<=u<=B, Legendre gives v_p(u!)=sum_{j>=1} floor(u/p^j).
If L=floor(log_p B), retain j=1,...,L, each losing at most one.
The discarded geometric tail is u*p^-L/(p-1)<p/(p-1).
More exactly the sum of digit formula gives
 v_p(u!)=(u-s_p(u))/(p-1)>=u/(p-1)-(L+1),
since u has at most L+1 base-p digits each <=p-1.
For B=0 use v_p(0!)=0 and the native Nat.log convention.
There are at most |Phi| N^3 possible derivative variables in the
minor expansion (for each place, one rank-index of size N and
sum_{h<N} h row coordinates), hence
 v_p(d!) >= B/(p-1)-|Phi| N^3 (p.log B+1).
This is the precise native error and is uniform in every tableau.

Write |varpi|=p^-rho, |theta|=p^omega and C=sum C_e(sigma).
By section 1, |D|>=p^(-rho B-m+omega C)>0 (the norm hypotheses
of norm_schurJet_le force both nonzero). Divide the preceding
monomial bound by this SAME |D|. It yields
 v_p(schurJet) >= (1/(p-1)-rho) B + omega C
                   - |Phi| N^3(p.log B+1) - m.
Use extended valuation +infinity when the jet vanishes; in
native norm notation this is exactly norm_schurJet_le.
No prime-distribution theorem or assumption on RH is used.

At the actual caller Data.IsGoodDatum.mem_raises, the
normal-form theorem supplies rho=nonsplitWeight and
omega=(chiK(d,p)-1)/2, with S the live couplings up to p.log B.
Therefore the bracket in the norm exponent is the native
jetExponent, NOT a new loss budget. The charge guard must still
be proved for the exact diagonal/J choices (native proof uses
marked conjugation and disjointness); the final conversion of
charge and determinant-twist valuations to markExponent+liftLoss
is not claimed reconstructed here. For standard data the native
norm_jetSeries_le transfers the bound: the tight-frame finite
part expansion uses M=p(d*N1)^6+1 coprime to p, integral vacuum
norm and p-integral coefficients; linearity and the ultrametric
triangle inequality then transport the uniform theta-product
estimate to the standard-data jet. The actual finite-part
construction, theta normal form and the charge verification
remain referenced, not derived by the scalar argument.

Original dependency path retained:
IndexDvd + integral q-th roots -> null frames -> Schur
coefficient extraction + null-cone integrality + factorial ->
norm_schurJet_le -> norm_jetSeries_le/mem_raises ->
exists_move_markOperator -> gaugeLe_markOperator_pow ->
A local index/divisibility -> Data.short_forms -> star.
Reduced human path proves the null-frame cost and Schur
valuation argument without a pairwise independent determinant
or norm expansion. No global elaborated edges removed; original
and reduced graph archives and axiom records untouched.
Separate marked Hecke primitive: Columns.hasType_markOperator
uses double coset model, parahoric injectivity and
hasType_twisted_hecke (depth factorization, approximate projector,
of_pairing and mod-p flag/cone bounds). NOT implied by jet proof.

## Executed checks and independent verification limits

Exact finite regression in local Python (not Lean): 34,992
coupling-cost identities, 253,692 nonexempt height-pair coverage
assertions, 227,250 factorial bounds. No failures. Reproducer:
  from itertools import product
  from fractions import Fraction as F
  ncover=ncost=nfact=0
  for p,e in product((2,3,5,13),range(1,4)):
   q=p**e
   for a,b in product(product(range(3),repeat=3),repeat=2):
    for ev,evp in product((False,True),repeat=2):
     t=0 if ev else a[0]; tp=0 if evp else b[0]
     r=sum(a[1:]); rp=sum(b[1:])
     B=sum((i+1)*c for i,c in enumerate(a) if i)
     Bp=sum((i+1)*c for i,c in enumerate(b) if i)
     c=t<=q*(rp+tp); d=B<=q*Bp
     def sel(h,side,basis):
      if h==1 and ((ev if side else evp) or basis!=side):return False
      return (d if basis and h!=1 else ((basis!=side) or c))==side
     cost=sum(F(a[h-1] if side else b[h-1],q if side else 1)*
       (h if basis else 1) for h,side,basis in
       product(range(1,4),(False,True),(False,True)) if sel(h,side,basis))
     assert cost==min(F(t,q),rp+tp)+F(r,q)+min(F(B,q),Bp)
     ncost+=1
     for h,k in product(range(1,4),repeat=2):
      if h==1 and (ev or (k==1 and evp)):continue
      assert sel(h,True,True) or sel(k,False,True) or (
        k==1 and sel(h,True,False)) or (h==1 and sel(k,False,False))
      ncover+=1
  for p in (2,3,5,13,17):
   for B in range(1,301):
    log=0;q=p
    while q<=B:log+=1;q*=p
    for n in range(B+1):
     s=0;q=p
     while q<=n:s+=n//q;q*=p
     assert F(n,p-1)-(log+1)<=s<=F(n,p-1)
     nfact+=1
  assert (ncost,ncover,nfact)==(34992,253692,227250)
These are regressions of the native combinatorial cost and
factorial arguments, not finite-to-infinite reasoning. No
native Lean/Lake installed locally. Prepared scalar checks below
uncompiled. No native rh_scan/rh_prune/rh_reduce/rh_auto/frontier
on this pin here; the old tools are not replayed or silently
ported. Actual CI status 45799225653 success, state blob
77cc3483ee5f43ab83ffdaf4bd1f31cecdccef35. Actual latest primitive
replay 45803534769 ERROR, 5147.99 s, state blob
a56e2d3afb99ed8275e81fd63c8494306e57c43f; peer kernel RUN30
records the A timeout with partial B/C native checks. Neither
validates this file; no new kernel or axiom PASS asserted.

RESUME HERE: audit the Schur coefficient-to-evaluation transport
and the exact charge guard plus determinant balance at mem_raises.
Then reconstruct the marked Hecke primitive via the actual
hasType_twisted_hecke proof (of_pairing and depth-factorization
determinant budget), coordinate with theta lane. Keep its
projector and flag/cone estimates visible. Do not repeat RUN55
scalar loss bounds. Request shared targeted kernel check of
JetDivisibility alone if resource permitted (no protected changes).
HANDOFF TO integration/editor (sections 1–4), formal audit,
theta/character (charge and marked Hecke), kernel (separate
native probe). Human RH reconstruction remains incomplete.
-/

namespace PrimeWindowRun56

lemma choose_min_cost (a b : ℝ) :
    (if a ≤ b then a else b) = min a b := by
  split_ifs with h
  · exact (min_eq_left h).symm
  · exact (min_eq_right (le_of_not_ge h)).symm

lemma coupling_cost (t r B t' r' B' : ℝ) :
    (if t ≤ r' + t' then t else r' + t') + r +
      (if B ≤ B' then B else B') =
      min t (r' + t') + r + min B B' := by
  rw [choose_min_cost, choose_min_cost]

lemma jet_valuation_budget (v fac frame scale charge err base rho omega C B : ℝ)
    (hv : fac + frame + scale + charge ≤ v)
    (hf : base * B - err ≤ fac)
    (hframe : omega * C ≤ frame)
    (hscale : scale = -(rho * B)) :
    (base - rho) * B + omega * C - err + charge ≤ v := by
  rw [sub_mul]
  linarith

#check exists_null_coupling_frames
#check norm_schurJet_le
#print axioms choose_min_cost
#print axioms coupling_cost
#print axioms jet_valuation_budget
end PrimeWindowRun56
