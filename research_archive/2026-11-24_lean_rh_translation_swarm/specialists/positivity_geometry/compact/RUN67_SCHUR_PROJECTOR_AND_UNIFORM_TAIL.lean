import New.Filling.FillingData
import Lib.DiscreteSeries.FlenstedJensen.TailBounds
import Mathlib.Tactic

/-!
# RUN67 — Schur projector, uniform norm-ball tails, and coordinate orthogonality
27 November 2026. HUMAN SOURCE-MATCHED DERIVATION, conditional on stated
primitive inputs. Independent audit and native replay pending.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion-first);
manuscript blob 1a5e180894e9f437ed9454097c99896366afc188.
AGENTS, protocol, handoff, expansion, RUN66 6f2682c4 and latest peer
results 0eea741e, 82c6ba00, f3101086, 3af9c4a3 read. Their rank-zero,
Tate duality, Artin reciprocity, CM arguments are distinct consumers.

Actual caller New/Filling/FillingData.lean blob 0ef8b0dfe13173b16bd0a8820a4924f10124e278,
Data.exists_besselSystem: uses isIdempotentKernel_psiInFrame, then
exists_isBesselFunction (BesselExistence d24e51a59e3048dfa5279c6e39055f4c2cea38ad),
HasPeakAt.exists_cut_isCutPair and IsBesselFunction.hasSchurBound_of_convolve_eq
(BesselCut c9e66fa71ab3aff125e672b9fc93caac9f03fa5d).
This is the upstream supplier of RUN63, not another cutoff calculation.
BandLimits 20ff4e65c2599fc8b752dbb93673ed65053e2216 and OpenCellBound
054e3375d3ef6c96633ab3c2e44b38df52a94755 are downstream consumers.

## 1. Direct norm-ball covering and integration, with all constants

Source Lib/DiscreteSeries/Haar/RegularRepL2.lean
6a3f37e076f6d5fce2dc6943adf74cf3b003e7e8:
measure_ball_le_covering, integral_decay_le, lintegral_decay_le.
Let J be a Hermitian involution of size n>=1, G=U(J), j:S->G
a continuous proper homomorphism, nu right invariant, finite on compacts,
Borel. Retain the native measurable-group conditions. For g in G,
||g^-1||=||g|| and ||g||>=1. Fix y in G and R,D>=1.
In the real normed matrix space of dimension d=2n², choose a maximal
1/(DR)-separated set in {j(s)y: ||j(s)y||<=R}.
Disjoint open balls of radius 1/(2DR) about its points fit inside the
ball of radius R+1/(2DR); ordinary Lebesgue volume scaling gives at most
(1+2DR²)^d <= (3DR²)^d points. Thus a finite maximal set exists
(greedy selection terminates), even if j is not injective.
Choose representatives t_i in S. Every s in the ball satisfies
||j(s)y-j(t_i)y||<=1/(DR) for some i. Multiplying on the right by
(j(t_i)y)^-1 gives ||j(s t_i^-1)-1||<=1/D. Consequently
  nu{||j(s)y||<=R} <= (3DR²)^d nu{||j(s)-1||<=1/D}.
Only right invariance is needed; no left-invariance assumption on S.
Properness makes the small ball compact, hence finite measure.

Write M=nu{||j(s)-1||<=1}, c natural, c>8n²=4d.
Tonelli with the identity r^-c=c int_r^infty t^(-c-1)dt for r>=1 yields
  int (2/||j(s)y||)^c dnu
   <= 2^c 3^d M c/(c-2d)
   <= 2^(c+1) 3^d M <= 16^c M.
Indeed c-2d>c/2 and d<=c, 2^(c+1)3^d<=2*6^c<=16^c
for c>=1. This is uniform in the translate y; no hidden group-volume
factor. It supplies the actual graph majorant in exists_isBesselFunction,
and the L1 decay and Fubini premises below.

## 2. Direct Schur product from the native compact projector

Source Lib/DiscreteSeries/CuspKernel/SchurOrthogonality.lean
7be5411c2c4c3662db6f10be4c7fda7f63c27287:
integral_mul_dsCoeff_translate, dsCoeff_schur_orthogonality,
toL2_spec, isUnitaryCasimirGe_dsAction.
Let psi=l.dsCoeff, l with actual large gap 500n³+A; K=maxCompactU,
probability Haar dk, m=weightMinors(l.lowestKType), C=int_K |m|²>0.
Retain EXACT native compact projection, not an assumed existence of
discrete series:
  int_K conj(m(k)) psi(x k b) dk = C psi(x) psi(b).    (P)
KTypeProjection.lean f6c936f970a93a7318e5ea3ebe61f8c7dae77d2a,
integral_conj_weightMinors_mul_dsCoeff at nu=lowestKType.
This particular primitive remains to be reconstructed or externally
matched, not discharged by naming Flensted-Jensen.
Also retain psi(g^-1)=conj psi(g), psi(1)=1 from PsiBasic
d888fafb9db9b1a5e78aa2551a1480f0cf057d20,
and uniform |psi(g)|<=min(1,(2/||g||)^c) for c<=gapThreshold
from PsiDecay 2ca9efe4949fe0b10512153a3562daf2b97d2edf.
Choose c=8n²+1, permitted by the gap. Section 1 makes psi L1,
hence L2 using |psi|<=1. Haar on G is bi-invariant (native
HaarMass 42de495a5f363eb79517e968a648b18639535835, standard inversion
for unimodular Haar). I0=int_G |psi|² is finite and positive by
continuity, psi(1)=1 and positivity of Haar on open sets; d0=1/I0.

For I(x,a)=int_G psi(x y a) conj psi(y) dy, insert (P) and use Fubini:
  C psi(x) I(1,a)
   = int_G int_K conj m(k) psi(x k y a) conj psi(y) dk dy
   = int_G psi(x z a) [int_K conj m(k) conj psi(k^-1 z) dk] dz
   = C I(x,a).
Last equality: conj psi(k^-1 z)=psi(z^-1 k), then (P) at x=z^-1,b=1.
Absolute integrability follows from |psi|<=1, bounded m on compact K,
and L1 of psi(y); after substitution also right/left Haar invariance.
Next substitute z=(y a)^-1 in I(1,a): psi(ya)=conj psi(z)
and conj psi(y)=psi(a z). Thus I(1,a)=I(a,1)=psi(a)I0.
Cancel the single C>0 and I0>0. The exact decisive identity is
  d0 int_G psi(x y a) conj psi(y) dy = psi(x) psi(a).  (S)
In particular E=d0 psi has E*E=E for the source convolution convention
with E(y^-1) and psi evaluated at translated y; E(y^-1)=conj E(y).
Conjugate by the SAME unitary frame p, retaining the native
measurePreserving_frameEquiv; no extra factor of K volume.
This is the projector actually used in BesselExistence to interchange
the graph average and group convolution. Absolute Fubini there follows
from section 1 uniformly in group translate, times L1 of E.
No new circular use of irreducibility or the claimed RH theorem.

For the differentiated kernel keep native compact-bump smearing:
every vector in D_l=U(g)psi equals smear(psi,beta), beta compact smooth.
The positive coefficient int bump*|psi|² gives a smear of psi itself
by the same K projection; closure under right derivatives gives all
of D_l. For any such vector f the matrix coefficient identity
  <sqrt(d0) psi, R(g) sqrt(d0) f> = f(g)
follows by inserting the smear and (S), justified by compact support
and psi L1. Thus evaluation <=||sqrt(d0)f|| by Cauchy-Schwarz.
The generator has norm 1. The exact scaled L2 inner product
  <sqrt(d0)f,R(x)sqrt(d0)h> = d0 int h(gx) conj f(g) dg
is immediate. Keep Casimir eigenvalue and derivative-filtration bound
as independent native representation inputs for RUN63.

## 3. Cayley path Lipschitz and degree-weighted tail

Source Lib/DiscreteSeries/FlenstedJensen/TailBounds.lean
3c13565c8bfecf91497747b0fe7cd7e39e50369c:
norm_dsCoeff_sub_le, half_le_norm_dsCoeff, measure_ball_le_integral_dsCoeff,
integral_tail_le. Use beta=n+L+1 >= n+1. For g=1+A, ||A||<1,
let B_t=1+(1-t)A/2, N_t=1+(1+t)A/2, C_t=N_t B_t^-1
on 0<=t<=1. Neumann series gives ||B_t^-1||<=2.
Since A*J+JA+A*JA=0, direct expansion gives
N_t* J N_t - B_t* J B_t = t(A*J+JA+A*JA)=0.
Thus C_t lies in G, C_0=1, C_1=g, and
  C'_t=A B_t^-1+(t/2) A B_t^-1 A B_t^-1,
  ||C'_t||<=4||A||, ||C_t^-1||=||C_t||<=3.
The actual first-derivative generator estimate from
isKHighest_dsGenerator / norm_apply_le_of_mem_filtration gives
||dR(Y)psi||_(scaled L2) <= (n+1)^4(L+n+1)||Y||
for the complexified matrix Lie direction Y. Retain that bound.
Apply section 2's evaluation estimate along x C_t, with
Y=C_t^-1 C'_t, so derivative magnitude <=12 beta^5||A||.
Integration on [0,1] yields the native weaker constant 100 beta^5.
For ||A||>=1 use |psi|<=1 to get the same bound directly.
Consequently |psi(g)|>=1/2 on ||g-1||<=1/(200 beta^5).
This ball has Haar volume <=4 I0=4/d0 by integrating |psi|².
Section 1 covering with D=200 beta^5 gives for R>=1
  d0 vol{||g||<=R} <=4 (600 beta^5 R²)^d
                     <=4 (2000 beta^6)^d R^(2d).
Use exactly the same layer integral for c>4d to obtain
  d0 int_G (2/||g||)^c dg <=8 (2000 beta^6)^d 2^c.
This is the original integral_tail_le constant used in BesselCut.
No asymptotic constants or formal degree normalization are changed.

## 4. Coordinate orthogonality at the filling consumer

New/RealPlace/BesselOrthonormal.lean blob 7d412ab10f96adecb5ede2bfa386efc89916ec9c,
BesselSystem.orthonormal. Let W be the full function in the actual
Bessel system; all its coordinates are L1 and bounded, hence pairwise
products L1. Let H=int_Q W(y) W(y)* dnu_Q(y), with Q=U\G.
The native compact-small-group equivariance and invariance of quotient
measure under that group give rep(k) H rep(k)*=H. The latter follows
by the native measurePreserving_conj_bessel and Haar left translation,
not a claim that arbitrary left translation acts on U\G.
Therefore H commutes with the actual irreducible unitary rep.
Schur's lemma gives H=c I. Taking the trace, using the normalized
full L2 mass |I|, gives c |I|=|I|. If I is empty the coordinate theorem
is vacuous; otherwise c=1. Thus int W_i conj W_j=delta_ij exactly.
This is independent of the approximating cut function's mass;
do not assume cut coordinates orthonormal.

## Evidence / remaining primitives
Original and replacement source-visible dependency subgraphs:
original: FillingData -> BesselExistence / BesselCut -> SchurOrthogonality
  -> KTypeProjection, PsiDecay, smearing, Haar volume; BesselCut -> TailBounds
  -> RegularRepL2, generator bound; BesselOrthonormal -> quotient invariance.
replacement: same consumers -> (S), direct norm-ball covering/Tonelli,
  Cayley path and trace identity -> SAME retained primitive inputs.
No global deletion of KTypeProjection, PsiDecay, smearing, Haar
normalizations, generator/Casimir bound, quotient invariance, or deeper
Siegel-Weil/Rallis inputs. No changes to shared original graphs/axiom ledger.
Source bodies checked, not elaborated term pruning. Lean/lake absent
(command -v for both returned no path); rh_scan/rh_prune/rh_reduce/rh_auto
cannot be invoked here. The scalar replacement and native declaration/axiom
probes below are prepared only, NOT compiled. Existing shared CI jobs
45799225653,45577239749,45576756833 retrieved: all run and record jobs
reported success; no implication for these new probes. No synthetic tests,
no native PASS claim, no closure of theorem B or RH manuscript.

RESUME HERE: derive the actual PsiDecay determinant-minor/Fischer
supplier, then the KTypeProjection analytic continuation/circle mean
at nu=lowestKType. Check exact Flensted-Jensen external theorem
identification with normalization if shorter, not by theorem name alone.
Continue independently on the deeper Siegel-Weil/Rallis actual consumers.
HANDOFF TO: integration/editor, literature and formal audit.
-/

namespace RHPositivityRun67

-- Exact scalar step in both layer estimates, with denominator guard.
theorem layer_ratio_le_two (c d : ℝ) (hd : 0 ≤ d) (hc : 4*d < c) :
    c / (c - 2*d) ≤ 2 := by
  have hp : 0 < c - 2*d := by linarith
  apply (div_le_iff₀ hp).2
  linarith

-- The squared near-identity estimate controls the degree times ball mass.
theorem ball_mass_bound (d0 v i0 : ℝ) (hd : 0 < d0)
    (hn : d0 * i0 = 1) (h : v / 4 ≤ i0) : d0 * v ≤ 4 := by
  have hh : v ≤ 4*i0 := by linarith
  calc
    d0*v ≤ d0*(4*i0) := mul_le_mul_of_nonneg_left hh hd.le
    _ = 4 := by nlinarith

end RHPositivityRun67

#check dsCoeff_schur_orthogonality
#check isIdempotentKernel_psiInFrame
#check integral_tail_le
#check BesselSystem.orthonormal
#print axioms RHPositivityRun67.layer_ratio_le_two
#print axioms RHPositivityRun67.ball_mass_bound
#print axioms dsCoeff_schur_orthogonality
#print axioms integral_tail_le
#print axioms BesselSystem.orthonormal
