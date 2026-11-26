import New.Rows.GluedFormTheta

/-!
# RUN53 — primitive C: inverse carrier and finite-part jet transfer

26 November 2026. HUMAN SOURCE-MATCHED, conditional on named standard
theta and integral-form inputs; executable scalar certificate prepared,
not compiled. Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Latest mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb:
primitive closure, no further determinant redesign. Manuscript
da92e9c93c8eadebdb10920dbcb89c2dd1ecf691, determinant contract
7ad9c7c64f53c621ad20422226ad9d0b756ee28e. Read AGENTS, protocol,
handoff, expansion and latest commits; math peers 95f154b6/3581235f1
address balanced-row budget, not the local depth-to-jet transfer here.
Continue RUN52 a0bc9cea without replacing its packing hypotheses.

Source ledger (actual pinned bodies inspected; not elaborated DAG):
New/Rows/GluedFormTheta.lean c5f883f964a7a968320874ac8edad52a14678c3e
  Data.depth_indicator_jet, inverse carrier and final finite-part transfer.
New/Curve/FrameSections.lean 6bc331571971534045115e265473cfa148de9f14
  Parameters.exists_finitePart_of_isTightFrame, Space.jetSeries_eq_prod.
Lib/Weil/Construction/ConjugateJetDefs.lean bdc5981f77f6b2e3f94b757118ea664a7a1a1f08
  IsTightFrame, Space.VacuumExpansion (exact cardinality and identity).
Lib/Weil/Construction/FockThetaFunctions.lean 80c7d6ba1d8942e206e7420f62e85d0209c56ae4
  Space.exists_entireTheta_eq.
Lib/Shimura/GoodReduction/ThetaOrthogonality.lean 759f783ca424063e815a89a9626fed7be4eba028
  IsAppellHumbert.sum_shift_mul_shift.
Lib/Weil/Lift/Staircase.lean 85b742026fe81e98b70d7750e17b0e99741c2a4e
  exists_heis_vacElem_eq_sum_modDatum.
Lib/CM/KroneckerLimit/LogTheta.lean 99b01af94328fe9bcfd29a14db9933e72ac5c626
  CMLattice.exists_log_theta.
Lib/General/Algebra/DepthBounds.lean 76c0218d912404747bba4f33b6261ddbf9e86d17
  IsCarriedBy.mul, exists_monomial_max_norm_coeff.
New/Curve/TightFrameExists.lean 4f2e76afa45ba54fe9040704b505b2da1865f2b4
  Parameters.exists_isTightFrame (retained full multiplicity and unit guards).
New/Curve/IntegralVacuum.lean c34fe7625b03009fbd5954ea00209b425ca603b1
  intVacuum and nonzero common value.
New/Rows/HeckeValueHeight.lean f61d2e3c521863d4f814e3338e37c4e2c2fd1f84
  heightLe_inv_ratio, hd and K consumers.

## 1. The exact five-copy inverse carrier

Fix the native p-adic place and CM curve. Write theta=exp(-L),
L(0)=0, and R=phiSeriesRing. The native log-theta lemma supplies
R_j=exp(j² L) theta(jz) in R for every j in Z_p: the pair (j,j²)
lies in normPairClosure by density of ordinary integers, whose
quadratic norm is their square. By Lagrange's four-square theorem
and compactness of Z_p^4, choose j_1,...,j_4 in Z_p with
sum j_i²=-2. Indeed every nonnegative integer is such a sum and
the nonnegative integers are dense in Z_p; the image of the compact
set is closed, including at p=2. No assertion that the j_i are
rational integers is used.

Each R_j has constant coefficient 1. The native series generator
unit theorem supplies U=(prod R_j)^(-1) in R. Multiply before
taking norms:
  prod R_j = exp(-2L) prod theta(j_i z)
           = theta(z)^2 prod theta(j_i z),
  U theta(z) prod theta(j_i z) = theta(z)^(-1).
For each linear argument mu_i and multiplicity c_i of the same
Theta in GluedFormTheta, substitute and raise to c_i. Multiplying
over i gives Theta^(-1)=H Theta prod_{b=1}^4 rescale(j_b,Theta),
where H=prod_i U(mu_i)^c_i belongs to the native multiPhiRing.
The one-copy carrier applies to H Theta and to Theta. Each
rescaling multiplies a coefficient of degree d by j_b^d, norm
at most one, so uses the SAME N. The convolution maximum lemma
IsCarriedBy.mul concatenates the five witnesses. This proves
IsCarriedBy N 5 Theta^-1 and therefore the six-copy carrier for
every H' in multiPhiRing via (H' Theta)Theta^-1=H'. This is an
actual needed RUN52 input, not an independent norm optimization.
Retain log-theta integrality and the unit theorem as named inputs.

## 2. Tight-frame to integral finite vector

Use the actual frame w_i with integer multiplicities c_i, M its
frame length, and g=piG, N=gProd=g*conj(g)>0. For the twelve
exponents alpha_b from RUN52, choose the SAME maximizing generator
exponents e(alpha_b)_i used in N(alpha_b). Their degrees are
bounded by degree(alpha_b)<=degree(a), while c_i>=3 degree(a);
thus 3 e(alpha_b)_i<=c_i. Each factor is the monomial section
with theta multiplicity c_i-3e, translated-Wp-derivative
multiplicity e, and zero middle multiplicity. All degrees are
exactly c_i, not a bound. This makes the product a theta section
on the standard rank-12 space.

For clarity the native frame lemma is stated with arbitrary
delta, a0 in the CM lattice, |delta|²=N and
area(C)=|a0|² M sqrt(d)/(2N). The actual linear forms are
 A_{i,b}(z)=(a0/conj(delta))/areaScale * sum_sigma
             conj(Phi_sigma(w_i)) z_(sigma,b).
Polarize and sum their pulled-back CM Hermitian forms with
multiplicity c_i. The exact frame identity
 sum_i c_i Phi_sigma(w_i) conj(Phi_tau(w_i))=M delta_sigma,tau
kills every off-diagonal coefficient; the area relation fixes
the diagonal coefficient to one in the source normalization.
Thus sum_i,b c_i A_{i,b}^* H_C A_{i,b}=H_std.
This is the B identity in FrameSections, not an approximate
orthonormal basis. The lattice condition on w_i and a0 ensures
that the normalized shifts at the prescribed lattice are periods.
The product section has the canonical multiplier: multiply the
CM shift laws and use the same B identity to combine exponentials.
Consequently the native Fourier/irreducibility theorem produces
F in V.finitePart with entireTheta(F) this product and vacuum
expansion for delta,N. For each rational translate gamma the
translation identity produces precisely the product of CM
twisted-translated sections; Taylor expansion of each linear
argument yields the jetSeries_eq_prod identity. Equality along
every complex line determines every homogeneous coefficient by
polynomial identity, so no analyticity at p is assumed.
The norm bound |iota(F(finVec x))|<=1 holds for ALL finite x:
finite-part local constancy lets one replace x at evaluation by
a rational finite image; each translated CM monomial-section
value is bounded by one by the native integral torsion-value
bound, after clearing the common denominator. Product yields
one, not an index factor. Retain that exact torsion-value theorem,
the lattice membership, and Fourier image/semicharacter
compatibilities; no assumption that arbitrary Weil vectors
are integral. In the caller gamma=0 and c=conj(piG)*jetScale,
so the linear coefficient scale is exactly periodFactor S.

## 3. Why the vacuum denominator is N^(24 f), including p|N

The native FockThetaFunctions proof identifies a positive
Appell-Humbert lattice L with shifts -realImage(star(delta) gamma),
finiteImage gamma in stdLattice. The vacuum's entire theta is
nonzero, and the theta map is injective by evaluation on real
vectors. Its dual-lattice translates span the theta space
(Frobenius dimension formula + irreducibility); each is the
theta of an actual finite Heisenberg translate, with delta*x_j
integral. This gives the actual F, not a new complex witness for
each coefficient.

Here is the Schur calculation in ThetaOrthogonality. Let U_a
denote theta shifts, H the theta space, h=dim H=sqrt([L*:L]).
For f,g in H and evaluation lambda_z, form
 Q=sum_j (U_{a_j} f) tensor (lambda_z U_{-a_j}).
Conjugation by every dual-lattice shift permutes the summands:
the projective phases cancel between inverse factors and
translation modulo L acts by reciprocal scalars. Hence Q
commutes with the irreducible action and is scalar. Taking trace
before any norms gives tr Q=|J| lambda_z(f), since U_-a U_a=1.
Therefore h Q=|J|lambda_z(f) Id. Apply to g, then evaluate at w:
 h sum_j (U_-a_j g)(z)(U_a_j f)(w)=|J|g(w)f(z)
with f,g or z,w interchanged as in the native lemma. Equivalently
the source identity is h sum (U_-a_j g)(z)(U_a_j f)(w)
=|J| f(z)g(w), obtained by using Q on f with rank-one image g
and swapping signs of representatives. No assumption that the
index is a p-adic unit.

The source chooses J=L*/N L*, not an unverified quotient by L.
N L* lies in L by the dual-integrality calculation and
delta*star(delta)=N. Rank L*=2 f rank(V)=24 f; hence
|J|=N^(24 f). Via the injective theta map, the Schur identity
is exactly VacuumExpansion.sum_eq, with a natural multiplier m0:
 sum_j m0 ell(rho(x_j)vac) rho(-x_j)F
      = N^(24 f) ell(F) vac
for EVERY complex linear functional ell. In particular the
index is not discarded at primes dividing N. The deep
dual-lattice realization/semicharacter and positivity premises
of FockThetaFunctions remain named; the orthogonality and
cardinality calculation itself is explicit.

## 4. Transfer to a single indicator jet, cancelling the same vacuum

Fix the common nonzero u=intVacuum(V)(finVec y) chosen BEFORE
the modulus, prime and embedding. Let kappa=vacuumScale^12,
v=vac(finVec y), so u=kappa*v. Define
  G=N^(24 f), L0prod=prod_sigma depthLossInt(n_sigma),
  t=G L0prod kappa v.
This is exactly the native common t (not a new local witness).
Its nonzero/arch bound is as in RUN52 and the native scale guard.

Choose ell=coeff_gamma o jetSeries(conj(piG)*jetScale),
gamma(sigma,b)=alpha_b(sigma). Evaluate VacuumExpansion.sum_eq
by Theta rho(y) and then apply iota. Each translated F factor
is a finite evaluation (rho_finVec and theta evaluation),
hence norm <=1 by the bound in section 2. The shift x_j has
piG*x_j integral; for the SAME modulus (conj piG) the
Staircase identity writes rho(x_j)vac as the sum over residue
matrices z of psi0(z_j,z) times the indicator modDatum(z).
Proof mechanism: subtract the support-complement part of x_j,
which is integral by the modulus annihilation condition;
its action on vac is a semicharacter scalar. On the remaining
places the name_char_eq_translate_projOn identity identifies the
translated vacuum with the primitive additive character on
the residue matrices. Expand that function in its point
indicators. All scalars are values of stdLattice.psi0, so roots
of unity and have norm one at every embedding. No division by
the number of matrices. This retains the native Heisenberg
translation identities and the exact ideal hypothesis.

By linearity, the evaluated identity is now one finite sum
over (j,z); each summand has norm <= the corresponding indicator
jet norm, since m0 is integral, the phase has norm one and the
translated F factor has norm <=1. Ultrametricity selects some
actual z=x0 with jet J such that
  |iota(G)| |iota(ell(F))| |iota(v)| <= |iota(J)|.
There is no extra factor for |J-index| or number of residues.
Here ell(F) is EXACTLY prod_b coeff_alpha_b(Phi_alpha_b):
variables for different copies are disjoint, so the coefficient
convolution has one term, not a sum requiring a lower bound.
By RUN52 its norm is >= p^(V_n-forcedPart-L), where
V_n=sum v_p(n_sigma!), L=sum v_p(depthLossInt(n_sigma)).
Let C=prod n_sigma!, so |iota(C)|=p^-V_n and
|iota(L0prod)|=p^-L. Multiplying BEFORE dividing yields
  |iota(kappa C J)| >=
    |iota(kappa G v)| p^(-forcedPart-L)
    = |iota(t)| p^(-forcedPart).
Divide only by the nonzero SAME t. Thus
  |iota(kappa C J/t)| >= p^(-forcedPart).
Also sum_b gamma(sigma,b)=n_sigma exactly. This is the local
depth_indicator_jet conclusion including p|gProd; no coprimality
premise was introduced in the transfer. Earlier non-split packing
may use its original coprimality premises, unchanged. This supplies
the hd input in heightLe_inv_ratio for n_sigma=p.c(sigma)-p.z;
its common t enters the native V^|G|. Do not replace actual fit
family, paired conjugate local witnesses or other primitive inputs.
The output is source-matched human transfer, not closure of C:
the original packing and normal-form coefficient witnesses,
arch scale and integral torsion-value/dual-lattice realization
remain required. No RH theorem imported.

Original/reduced graph: retain all original and reduced files.
Static edges added: depth_indicator_jet -> inverse carrier ->
log-theta+unit+four-square+convolution; depth -> frame sections ->
Fock theta -> dimension/Schur+dual-integrality; depth -> vacuum
expansion -> indicator decomposition -> norm/factorial transfer
-> hd -> K -> signed Hecke repayment -> (U,W,S).
Only human proofs of the carrier, Schur calculation, exact
coefficient/normalization transfer are supplied. No global
node deletion or native proof-term axiom evidence for new checks.
Cache context pin,D,frame,alpha,p,iota,modulus; t chosen once
outside last three, N coefficient function same across copies.

Actual execution: command -v lean and lake empty locally. Fetched
run 45799225653 job list (all three successful) and actual
cathedral-research-state compute/rh-compact-targeted-replay-20261126/
outputs/targeted_results.json, confirming prior RUN50 scalar checks
and existing module checks, NOT this certificate. No new native
rh_scan/prune/reduce/auto, no claim of PASS for RUN53. Old engines
use incompatible pin. No simulated proof tests.

RESUME HERE: close the actual normal-form and packing witnesses
in New/Curve/DepthPairs (especially the noncollision clauses and
small inert/ramified cases), and match the formal-group
normal-form theorem and exact valuation of its coefficients.
The inverse carrier and finite-part transfer need no further
scalar reoptimization. Ask audit to check section 3's sign
convention against the actual Schur identity; native source
identity, not an independently chosen phase, is the caller input.
HANDOFF TO: integration/editor/audit, kernel batch, theta and
arithmetic lanes. Preserve unresolved integral torsion-value,
dual-lattice realization and arch scale proofs.
-/

namespace CompactVacuumRun53

-- Real norm budget, after the native ultrametric selection.
-- All factors denote nonnegative norms; t is the nonzero common norm.
theorem common_vacuum_cancel (g v loss fac kap a j t target : ℝ)
    (ht : t = g * loss * kap * v) (htpos : 0 < t)
    (hg : 0 ≤ g) (hv : 0 ≤ v) (hk : 0 ≤ kap) (hf : 0 ≤ fac)
    (hsel : g * a * v ≤ j) (hdepth : target * loss ≤ fac * a) :
    target ≤ kap * fac * j / t := by
  apply (le_div_iff₀ htpos).2
  calc
    target * t = (target * loss) * (g * kap * v) := by rw [ht]; ring
    _ ≤ (fac * a) * (g * kap * v) :=
      mul_le_mul_of_nonneg_right hdepth (mul_nonneg (mul_nonneg hg hk) hv)
    _ = (g * a * v) * (kap * fac) := by ring
    _ ≤ j * (kap * fac) :=
      mul_le_mul_of_nonneg_right hsel (mul_nonneg hk hf)
    _ = kap * fac * j := by ring

#check CMLattice.exists_log_theta
#check Parameters.exists_finitePart_of_isTightFrame
#check Space.VacuumExpansion.sum_eq
#check Space.exists_entireTheta_eq
#check IsAppellHumbert.sum_shift_mul_shift
#check exists_heis_vacElem_eq_sum_modDatum
#check Data.depth_indicator_jet
#print axioms common_vacuum_cancel
#print axioms Data.depth_indicator_jet

end CompactVacuumRun53
