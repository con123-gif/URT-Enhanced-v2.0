import New.Rows.GluedFormTheta

/-!
# RUN52 — C depth supplier: Katz sharpness, Frobenius jet splitting, and twelve-copy budget

26 November 2026. HUMAN SOURCE-MATCHED / PARTIAL at the deep primitive
inputs; scalar replay prepared, not compiled. Compact pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207 (main rechecked
unchanged), Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission 0abe4d55e789dd229081d1161cb7736895fe9885, current unified contract
7ad9c7c64f53c621ad20422226ad9d0b756ee28e, manuscript
69030b2d01e9f0e786a004a21b6f0043ef84bc64. Read AGENTS, continuity, queue,
protocol, expansion and latest peers. Character RUN51 2999f952, URT peer
0ce8bcf6 already supplies the three-block test form, audit bf254a7b
supplies signed repayment, integration 95a78062 supplies determinant.
Do not duplicate these. No URT premise, no old source changes.

Source ledger (source bodies inspected; not an elaborated dependency DAG):
 New/Rows/GluedFormTheta.lean c5f883f964a7a968320874ac8edad52a14678c3e
   Data.depth_indicator_jet lines 33–143.
 New/Curve/KatzDivisibility.lean 910b6f88933a9debb15df537fa834762f8da0723
   CMLattice.katz_divisibility_limit lines 15–42.
 New/Curve/FormalParameter.lean 61130bd5600a2b1f1679cfe0a18123d2c458d425
   CMLattice.exists_formal_parameter lines 132–140.
 New/Curve/DepthPairs.lean d53a0d9e22baa06916be8cc331c4394340483e3e
   Data.exists_isFrobPacking, exists_hasLargeSplit_of_pairs.
 Lib/General/Algebra/DepthBounds.lean 76c0218d912404747bba4f33b6261ddbf9e86d17
   HasLargeSplit.mul, IsCarriedBy.mul, exists_monomial_max_norm_coeff,
   IsLowestTerm.mul.
 New/Curve/LiveSum.lean 3efab3907b063bb2c59d182df981ad62862f8a1b
   localAsk, forcedPart, hasSum_live_inv_pow.
 New/Data/Weights.lean 8749d68da003347685ca36817b32cafda51a3a6a
   nominalWeight bounds.
 New/Curve/IntegralVacuum.lean c34fe7625b03009fbd5954ea00209b425ca603b1
   intVacuum, norm_intVacuum_le, exists_intVacuum_ne_zero.
 New/Rows/HeckeValueHeight.lean f61d2e3c521863d4f814e3338e37c4e2c2fd1f84
   heightLe_inv_ratio lines 160–215, actual consumer of depth.
 New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65 root anchor only.

## 1. Katz sharpness from a single submultiplicative sequence

Fix the actual CM formal group, prime p and embedding. Let rho be
nonsplitWeight, and R the native phiSeriesRing. Define
 M_n=max_{f in R}|n! [X^n] f|, c_n=M_n/p^((rho-1/(p-1))n).
The maximum exists by the actual monomial-max lemma applied to the
translated Wp derivative generator with S=1: truncated integral
coefficient substitutions are finite at each degree. This is not a
compactness assumption on C_p. In particular c_0=1. The addition
supplier says f(X+Y) is in the two-variable integral generated ring.
Its (n,k) coefficient multiplied by n! k! equals (n+k)![X^(n+k)]f
exactly, since the binomial coefficient cancels the factorial ratio.
The two-variable maximum separates: the generating monomials are
products in X and Y. Ultrametricity gives M_(n+k)<=M_n M_k.
Hence c_(n+k)<=c_n c_k.

Suppose some c_d<1. Necessarily d>0. Writing n=qd+r with 0<=r<d
gives c_n<=c_d^q max_{r<d} c_r -> 0. (If c_d=0 the conclusion is
even immediate.) The formal-parameter theorem provides e>0,
|varpi|=p^-rho, an integral S with S(0)=0 and
 S - S^(p^e)=X+pi E, |pi|<1, T in R, T(varpi X)=varpi S(X).
Legendre's |n!|>=p^(-n/(p-1)) implies
 |[X^n]S| <= c_n / |varpi|.
Thus all sufficiently late coefficients vanish on reduction to the
residue field. Its reduced S is a polynomial P with P-P^(p^e)=X.
A constant P cannot satisfy this; for degree a>=1 the left has
degree p^e*a>1, a contradiction. This proves c_n>=1 for EVERY n,
i.e. the exact native Katz lower bound, with no limiting choice of
f common to all n required. Retain the addition theorem, generator,
and formal parameter as real inputs; no new assertion about their
proof terms. This provides the filler bound hC in GluedFormTheta.

## 2. One six-copy splitting lemma; factorials cancel before norms

Use exactly the native IsFrobPacking (n,i,y), partner
 t(s)=-p^i(s)*s, multiplicities y_s. Let d be the exponent with
 d_s=p^i(s)y_s, tau=sum_s y_s e_{t(s)}, b=d+tau<=n, T=|tau|.
Write F=Theta(varpi X), |varpi|=p^-rho. The actual normal form at
each allowed inert pair is F=exp(kappa Psi) V with integral V a unit,
|kappa|=p^(1-1/(p-1))>1. One derivative replaces the current
integral series Q by
 R=(partial_t Psi)Q+kappa^-1(partial_t Q+Q V^-1 partial_t V).
This is the exact identity partial_t(QF)=kappa RF. The second
summand vanishes on reduction. The native normal-form coefficient
and noncollision clauses of IsFrobPacking ensure the unique
lowest weighted term of partial_t Psi is a unit times X_s^p^i.
The weighted order assigns weight p^sup i to unused source variables
and weight 1 to used source variables; keep the actual conditions
at each step. The product lowest-term lemma yields by induction a
single Q with |[X^d]Q|=1, and for EVERY beta
 |(beta+tau)! [X^(beta+tau)]F|
   = |kappa|^T |beta! [X^beta](QF)|.
Here multi-factorial means product across coordinates. The
successive kappa may differ as complex numbers; their norms agree.
The base Q=1, tau=0 is exact. This reconstructs the induction in
DepthPairs 111–114,128–146 conditional on the native normal-form
lowest-term supplier. Do not silently weaken the packing conditions.

Now Q=F^-1 (QF). By coefficient convolution and ultrametricity,
some gamma+beta=d satisfies
 1 <= |[X^gamma]F^-1| |[X^beta](QF)|.
Multiply the derivative identity, then cancel factorials:
 |[X^gamma]F^-1| |[X^(beta+tau)]F|
 >= |kappa|^T |beta!|/|(beta+tau)!|
 >= |kappa|^T/|tau!|.
The last inequality is the integrality of the multi-binomial
coefficient (beta+tau)!/(beta! tau!). The exponents add to b;
undoing the common rescaling multiplies by p^(rho |b|).
One copy carries Theta and five carry Theta^-1, so concatenating
the actual two splits gives six copies of total exponent b and
product at least
 p^((1-1/(p-1))T+rho|b|+v_p(tau!)).
No extra cardinality factor is paid: a maximum term in a
nonarchimedean sum suffices. This proves the convolution/factorial
part of exists_hasLargeSplit_of_pairs, not its formal-normal-form
or packing construction.

## 3. Exact exponent assembly: why twelve copies suffice

Set L0=sum_s v_p(depthLossInt(n_s)), F0=forcedPart(p),
V_n=sum_s v_p(n_s!), n=b+a componentwise, and f=#places.
The target in GluedFormTheta 82–115 is HasLargeSplit N 12 n
with threshold p^(V_n-F0-L0). Keep the same N defined there from
the maximizing monomials, not independently optimized coefficient
norms at each stage. A six-copy filler for a is supplied by the
native h6 and tight-frame constructions.

Split p: rho=1/(p-1), F0=0. Katz filler applied at n and at 0
gives twelve copies with exponent V_n>=V_n-L0.

Large non-split case: the first alternative of exists_isFrobPacking
says p inert, i=1, V_n-T<=F0+L0. Thus |b|=(p+1)T and
rho=1/(p^2-1). The six-copy exponent is EXACTLY T+v_p(tau!),
since rho(p+1)=1/(p-1). The native tight-frame lowest-term unit
construction (GluedFormTheta 95–109) fills the remaining a in six
copies with norm at least one; this uses p prime to gProd and
periodFactor norm one, not an unconditional coefficient claim.
Therefore the combined exponent is >=T>=V_n-F0-L0.

For the numerical inequality in the large-prime packing supplier:
let c=ceil(60b_scale/k), A_s=max(n_s-c,0), J_s=product of
A_s+1,...,A_s+c. The native guards give floor(A_s/p)<=c and
A_s<=w_s (using c>=x^42). Set y_s=min(n_partner,floor(A_s/p)).
Because n_s<=A_s+c, n_s! divides A_s! J_s. Legendre gives
 v_p(A_s!)=floor(A_s/p)+v_p(floor(A_s/p)!).
The latter factorial divides c!, which divides J_s by integrality
of binomial coefficients. Consequently
 v_p(n_s!)-y_s <= 2v_p(J_s)+max(w_s/p-w_partner,0).
Summation is bounded by L0+F0 because the e=1 localAsk term
occurs for inert p. This is the valuation branch of DepthPairs
46–59; the actual IsFrobPacking capacity and noncollision
verification remains separately required.

Other non-split case: the second packing alternative gives
 (1/(p-1)-rho)|n|+4 f b2-T <= F0+L0.
The Katz six-copy filler has exponent
 (rho-1/(p-1))|a|+v_p(a!).
Add before applying bounds. The combined exponent, directly collecting terms, is exactly
 rho|n|+T-(T+|a|)/(p-1)+v_p(tau!)+v_p(a!).
The native factorial estimates give v_p(tau!)>=T/(p-1)-2 f b2
and v_p(a!)>=|a|/(p-1)-2 f b2. Therefore the combined exponent
is >=rho|n|+T-4 f b2 >= |n|/(p-1)-F0-L0 >= V_n-F0-L0.
All errors are charged once, with the native degree guards.
This is the actual numerical closure of the three cases, not a
new asymptotic assumption. The coefficient carrier constructions,
including inverse carried by five from the four-square rescalings,
still need their own human proof.

## 4. Actual common scalar and caller

Before choosing p, the native depth theorem selects a fixed nonzero
vacuum value u=intVacuum(V)(finVec y) and
 Q=gProd^(24f) product_s depthLossInt(n_s), t=Q*u != 0.
Arch bound |sigma(t)|<=exp(f m b_scale/k) for EVERY automorphism
uses norm_intVacuum_le, extension/restriction of automorphisms,
ascFactorial<=power and the native magnitude guard. Keep t common;
local choices of alpha,x0 may depend on p, embedding and modulus.
The twelve-copy threshold above is the exact input to
exists_finitePart_of_isTightFrame and the indicator decomposition
exists_heis_vacElem_eq_sum_modDatum (GluedFormTheta 116–143).
Those supply the final scalar jet after cancelling Q and u and
multiplying the factorials. The finite-part comparison, exact
gProd power and arch scale proof are still explicit frontier
items, not established by the split bound alone. Once they are
supplied the native output is
 |iota(kappa0^12 product_s(n_s!) coeff_alpha(jetSeries)/t)|
 >= p^(-F0).
This is precisely the needed input hd to heightLe_inv_ratio
lines 160–215 (same n_s=p.c(s)-p.z, NOT same prime p as pair p).
Use its common t in V^|G|, then the already reconstructed
three-block test, Fourier and paired local bounds. No extra
loss of t across conjugate embeddings and no independent choice
of fit theta. Downstream signed Hecke repayment and determinant
contract remain unchanged.

Original/reduced graph: keep all existing original and reduced
graphs and axiom records. Static selected edges:
 depth_indicator_jet -> Katz sharpness + monomial maximum +
  normal form + packing + split + frame/finite-part + vacuum bounds.
 Katz -> generator/addition + formal parameter + submultiplicativity.
 split -> packing + weighted-lowest-term recurrence + convolution
  + factorial + carrier assumptions.
 depth -> actual K -> heightLe_inv_ratio -> hecke product -> (U,W,S).
Human reduction replaces the Katz contradiction and numerical
split assembly with the above proofs; no global node deletion,
no native proof-term or axiom evidence for these new candidates.
Cache context compact pin,D,prime,embedding,modulus,n,frame,N;
do not merge distinct embedding-dependent local choices.

## Native evidence (actual CI, not inferred)

Fetched status and outputs/targeted_results.json from
cathedral-research-state:compute/rh-compact-targeted-replay-20261126/
run 45799225653, 26 Nov 10:28:55Z, returncode 0, all_requested_checks_ok
true. Both RUN50 character scalar theorems and two Ribet prefix
theorems compiled, along with actual RootsOfUnityPoints (2 names),
ModuleIndex (5 names), Heights (3 names). All 14 named axioms
lists exactly propext, Classical.choice, Quot.sound; each audit_ok.
This is genuine new evidence for RUN50, NOT RUN51/RUN52 or full RH.
Previous full union graph run 45781154005 resource-blocked;
no local Lean or Lake (command -v both empty). Old native engines
different source pin; cannot execute rh_scan/prune/reduce/auto here.
Prepared checks below, no claim of compilation. No synthetic
numerical evidence or import of Main/RH theorem.

RESUME HERE: finish the remaining finite-part comparison and the
indicator decomposition at GluedFormTheta 116–143, trace
exists_finitePart_of_isTightFrame (actual gProd denominator), then
audit the normal-form/packing and five-copy inverse carrier
suppliers; hand the depth contract to the existing three-block
and signed repayment proofs. Shared kernel team can batch the
prepared local certificate when its real dependencies are built.
HANDOFF TO: integration, editor, audit, theta, kernel and URT lane
(to avoid duplicating the three-block argument).
-/

namespace CompactDepthRun52

-- Prepared real exponent assembly: no statement about the deep inputs.
theorem large_prime_exponent (T v F L V : ℝ)
    (hv : 0 ≤ v) (hpack : V - T ≤ F + L) :
    V - F - L ≤ T + v := by linarith

theorem general_split_exponent (rho q n a T vt va err F L V : ℝ)
    (ht : T*q - err ≤ vt) (ha : a*q - err ≤ va)
    (hpack : (q-rho)*n + 2*err - T ≤ F+L)
    (hfact : V ≤ q*n) :
    V-F-L ≤ rho*n+T-(T+a)*q+vt+va := by
  nlinarith

#check CMLattice.katz_divisibility_limit
#check Data.exists_isFrobPacking
#check exists_hasLargeSplit_of_pairs
#check Data.depth_indicator_jet
#print axioms large_prime_exponent
#print axioms general_split_exponent
#print axioms Data.depth_indicator_jet

end CompactDepthRun52
