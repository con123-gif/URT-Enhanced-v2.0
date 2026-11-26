# RUN58 — Definite theta kernels: common integral/archimedean scale
2026-11-26. URT specialist lane. PARTIAL, source-matched conditional reconstruction; no new Lean replay or claim of RH closure.

## Scope and provenance
Compact source: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207/grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Latest mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; compact manuscript blob 2eea9dc47d0e037627e4f4c1894f0bc86426454e; SWARM_PROTOCOL 4b77b161d6876915c15cea5a4d4a519beaf5de74; AGENTS 8db0201da965541e0487d6dd1271e010bdaa0972. Continued RUN57 commit 2fc26b5383cf2ef6d7015ca7ce5348aa169a3347. Checked the handoff, repository continuity rules and current research-state summary. No modifications to protected workflows or other lanes.

Actual consumer: New/Rows/LineArithmetic.lean (blob f6235933aecfcf1a1c82be94b4ad3edbe5057794), lines 25–41 and 54–83, calls exists_modKernel_integral_bound three times for ranks (Fin D.m, D.CarrierIndex), (Fin j, BigIndex j), (LPlusIndex j, BigIndex j), with respective degrees 0, 0, n. Its resulting lineScale is consumed in New/Rows/ComparisonForms.lean (14ef893c54f5db837ea7e4f143b2b1a444b89b5a), lines 56–73, 113–163. This is the actual Theorem C comparison chain, not a standalone physical analogy.

## 1. Exact semilinear Gaussian estimate

Source New/Rows/MemberKernels.lean (be36c0175fe559376780b105052249fc0c9f1f4f), 37–88. We reconstruct the first, scalar clause, with c nonzero as required by the actual consumer. No claim to replace its separate Schur operator clause.

Let V be the standard definite Hom-space with rank r = card(n' × n), I = Phi × n' × n, Dreal = |I| = f r (complex dimension). Write omega for the indicated finite pair Weil action, per for P.jetScale s, and Ω=P.bigOmega s>0. The admissible f0 is a finite sum of translated scaled vacua with coefficients a_x, and for every complex field automorphism υ, sum_x |υ(a_x)| ≤ B0. Keep both native character HasWeight hypotheses.

Given any automorphism σ of C, MemberKernels 37–40 gives υ fixing P.K with |υ(z)|=|σ(z)| for every z: restriction to the imaginary quadratic field is identity or conjugation, and in the latter case postcompose by conjugation. Thus all absolute-value hypotheses and conclusions are unchanged. This does not assert σ is continuous or commutes with analytic integration.

Use New/Curve/ConjugatesOfJets.lean (8b841d76bb938d8a18fd4341aa832a20b13dd9e0), 164–170, at the empty conjugation-disjoint set. It supplies a single υ-semilinear map Λ and t with |t|²=1/Ω and exact coefficientwise jet conjugation, with the prescribed place permutation. It also supplies the uniform pointwise bound
 U = exp(P.c*(P.N₁ s*r+1)^2)
on Λ applied to the finite Weil-moved translates of the integral vacuum. The character factors and semicharacter have modulus 1 under the relevant embeddings (MemberKernels 68–81); retain those identities, not an assumption of arbitrary phases.

For clarity about this supplier, the construction of Λ at ConjugatesOfJets 171–178 can be described as follows. Write J_t for jetSeries t followed by the prescribed renaming. On finitePart it is injective by eq_zero_of_jetSeries_eq_zero since |t|²>0. The generator result in New/Curve/ConjugateGenerator.lean (ad3f02ee95b950ae5a4fa98e30fd939e41837ae1) supplies the spanning translated generator and maps its coefficient-conjugated jets into the range of J_t. By finite linear combination the image of every coefficient-conjugated jet of finitePart belongs to that range. Invert J_t on its range; semilinearity follows from linearity of J_t and coefficientwise semilinearity. This explains the left-inverse construction without choosing an inverse on irrelevant series. The central-character compatibility, intertwining and quantitative pointwise estimate at lines 179–225 remain native suppliers. Lib/CM/Reciprocity/SemilinearWeilLaw.lean (f0ceeb862976ee92b3dae11a122ce465901f7994) supplies the multiplier-square identity; its ratio has modulus one since numerator and denominator are values of the weight character under complex embeddings. No new proof of CM reciprocity is asserted.

For Q and growth index L≥0 set S(y)=sum_i |y_i|² and R(y)=S(y)/(2L+2). The transformed polynomial argument from MemberKernels 82 is
 z_i = c * υ^{-1}(t * conjugate(y_{π(i)})),
where π permutes the place factor. Hence exactly
 sum_i |υ(z_i)|² = |υ(c)|² |t|² S(y) = exp(u) S(y), u=log(|υ(c)|²/Ω).
Apply the native hypothesis |υ(Q(z))| ≤ A exp(w+L R) whenever sum |υ(z_i)|² ≤ exp(u)(2L+2)R. The stated A≥0 is retained.

The jet-to-theta identity (Lib/Weil/Construction/DataProduct.lean, 6f4d0c2b91bf3fb0f9fc20e81c606d3d2ebe8bab, 32–39) and theta_integrated (Lib/Weil/Fock/RealData.lean, ad05f8711f7d34146680238349f0eaafebc0be1d, line 20) now express the coefficient-conjugated jet as the ordinary complex integral after the semilinear transformation. Never apply a discontinuous field automorphism to an integral. The Fock polynomial vector is Q(holCoord y) exp(-S/2), by Lib/Weil/Fock/FockTensor.lean (120f531824514a1f9b1352cb7110312cffd5642b), 75–91, and Lib/General/LinearAlgebra/HuaIntegral.lean (d62ceebe4b3b49aae6bc6eb3d247280abbbd8a37), 29–30.

Take the exact cancellation *before* bounding the radial tail:
    L R - S/2 = -R.
For each translated vacuum the absolute integrand is therefore at most U A exp(w) exp(-S/(2L+2)). This majorant is integrable on C^I with dμ=π^(-|I|)dLeb (Lib/General/LinearAlgebra/HaarUnique.lean, 5eacfd5a30e8994cd2be39c8a11f3a9a6414c684, 26–28). By polar integration on one complex coordinate, ∫ exp(-|z|²/a) dLeb(z)/π = a for a>0; Fubini gives a^|I|. Thus the exact majorant integral is U A exp(w)(2L+2)^|I|, not a power |I|/2. The zero-coordinate case gives 1. Summing the finite coefficients with their admissible l¹ bound gives
 |σ(jet Q (T_(c per)(omega f0)))| ≤ B0 A exp(P.c*(P.N₁ s*r+1)^2 + |I| log(2L+2) + w).
This is the first native clause at c≠0, derived from the retained semilinear and vacuum inputs. For c=0 the norm identity above is not an exp(log 0) identity; that case is not needed here and no general replacement is claimed.

## 2. One explicit scale for both conclusions

Source MemberKernels 143–167. Fix the native Data D, index types L,N and degree d before choosing any other inputs. Use G=D.gProd>0, r=card L*card N, f=D.f, δ=G², e=2fr, h=δ P.d, κ=P.vacuumScale D.s≠0, per=P.jetScale D.s≠0. These h,δ are rational integers. Write K for the native modKernelI, V for the Hom-space, F=vacuumDatum, and f0=κ^r F. Define the fixed nonzero complex constant
    C = δ^e κ^r (h per)^d.
All factors depend only on D, the ranks and d, not the modulus, q, Ψ, points, character, p or σ. The scalar jet identity and pairWeil_integrated_fin, with the native homogeneous Q hypothesis for every nonzero scalar, give the exact identity
    C K = δ^e jet Q (T_(h per)(omega f0)).
In particular the period factor is included in C; dropping it would silently change the kernel.

For the p-adic conclusion retain all the source hypotheses: qδ belongs to modulus ideal, Ψ integralAway q, p prime and coprime q, both finite points integralAbove p, polynomial has coefficients in embValRing via the indicated range of map. New/Exchange/CrudeModularData.lean (2be49b2690280e070d21691f8a569fc81e113b2b), 118–128 supplies δ^e f0 in standardData V δ. ConjugatesOfJets 112–115 preserves standardData under the finite pair Weil action, and 89–95 bounds its jet at star δ * P.d * per by 1. Since δ is a rational integer star δ=δ, this is exactly the jet of omega(δ^e f0) at h per. By linearity and the displayed identity it is C K, proving the required |ι_p(C K)|≤1 with the same C for every p. No extra coprimality between p and δ or degree bound is inserted.

For the archimedean conclusion retain q=1, both ranks≤40D.k, d≤G, ∀σ,x |σ(Ψ(x))|≤M, and ∀z in the σ-polydisc of coordinate radius G^4, |σ(Q(z))|≤B. B≥0 follows at z=0. CrudeModularData 130–139 gives admissible coefficients of f0 with B0=|ResRing|^r M. At q=1, its lines 111–113 give |ResRing|≤δ^(2f), hence B0≤δ^e M (also immediate from the quotient of O_E/δO_E).

Set T=h²/Ω. Prove the source growth hypothesis at L=d,w=0. It suffices that T(2d+2)≤G^8. For any nonnegative R and sum |σ(z_i)|²≤T(2d+2)R, scale z by σ^{-1}(exp(-R)). Every scaled coordinate has squared norm at most G^8 R exp(-2R)≤G^8, and homogeneity gives |σ(Q(z))|≤B exp(dR). Negative R is impossible since T>0. This is RUN57's radius argument with the explicit h now fixed. The rational h is fixed by all σ, so no separate conjugate size is required.

Applying section 1, then multiplying by δ^e, gives
    |σ(C K)| ≤ M B exp(H),
    H = 8 f r log G + P.c*(P.N₁ s*r+1)^2 + f r log(2d+2).
Here 8fr log G accounts for BOTH δ^e factors, one clearing standard data and one bounding the residue count. Do not omit either, and do not duplicate κ^r.

## 3. Explicit scale comparison H≤x₁

Set x=exp(D.logX), X=log x, Y=D.logX₁, b0=D.logB. Native D.scale gives 10^12 P.c≤log b0, 100 log b0≤X, 10^6 X≤Y, 10^6 Y≤b0. From the source scales in New/Data/Magnitudes.lean (306fe7e22378322422d11b1f8415fcdac75ffd6e), and New/Seesaw/IndexTypes.lean (10e0416c5d653fedde38fcd6bf895a2127a3e1a0), obtain the following coarse envelopes for the actual data:
- x is far larger than 200; b0≤x^(1/100); P.d,P.N₀≤P.c≤X≤x; log G in [20 b0,22 b0].
- k≤3x^5 (in fact k≤x^5), so each rank≤120x^5≤x^6 and r≤x^12.
- f≤exp(P.c)x^11 b0^(1/5)≤x^12, since P.c≤X/10^14 and log b0≤X/100.
- N₁=P.N₀*towerDeg(s)≤x^13, by towerDeg≤x^11 b0^(1/5) and P.N₀≤x.
- Ω≥x^(-13) and Ω>0.

First, T(2d+2) ≤ G^4 x^2 x^13 * 4G = 4x^15 G^5 ≤ G^8, since G≥exp(20b0) and b0≥10^12X. This supplies the earlier growth hypothesis, including degree zero.

Next 8fr log G≤176x^24 b0≤x^26; fr log(2d+2)≤23x^24 b0≤x^26 (G≥1 and b0≥log 4). Also P.c*(N₁ r+1)^2≤4x^51≤x^52. Consequently H≤2x^26+x^52≤x^53≤exp(Y)=D.x₁. No comparison between the much larger b=exp(b0) and x₁ is needed. Substitution proves |σ(C K)|≤exp(D.x₁) M B, the exact second conclusion of MemberKernels 143–150, for the SAME C. The large-scale inequalities are used only in the archimedean conclusion.

## 4. Candidate comparison, reproducible checks and limitations

Attempted angular/harmonic pruning of the Gaussian estimate as an alternative to the full radial majorant. This cannot be justified from the retained uniform bound on Λf alone: even in one complex coordinate, Q evaluated at conjugate(z) with Q(X)=X^m pairs against z^m exp(-|z|²/2) to give ∫ |z|^(2m) exp(-|z|²) dLeb/π=m!, while angular modes other than m give zero. The latter function is bounded for every fixed m. This is a counterexample to an inference based solely on boundedness, NOT a claim that every such function is a native Weil vector. A fixed angular cutoff does not therefore certify the arbitrary-degree statement from these premises. Direct radial cancellation is exact and has no search ordering. No URT acceleration or complexity claim; harmonic ranking not promoted to a proof assumption.

Executed in local Python 3 (exact Fraction and integer arithmetic):
```python
from fractions import Fraction as F
from math import factorial
from itertools import product
n=0
for L in range(81):
 for a in range(41):
  for b in (1,2,3,7):
   S=F(a,b); R=S/(2*L+2)
   assert L*R-S/2==-R
   n+=1
print(n) # 13284
for L in (0,1,5):
 S=F(1); R=S/(2*L+2)
 assert L*R-S != -R
def comps(k,d):
 if d==1:
  yield (k,);return
 for j in range(k+1):
  for tail in comps(k-j,d-1): yield (j,)+tail
n=0
for d in range(1,7):
 for k in range(13):
  v=0
  for a in comps(k,d):
   p=1
   for j in a:p*=factorial(j)
   v+=factorial(k)//p*p
  assert v==factorial(d+k-1)//factorial(d-1)
  n+=1
print(n) # 78
n=0
for N in range(2,41):
 for a,b in product(range(N),repeat=2):
  assert ((a-b)%N==0)==(a==b)
  n+=1
print(n) # 22139
```
Observed output: 13284 radial exponent identities; 3 negative controls for lost half; 78 radial moment combinatorial identities; 22139 alias-free residue checks. These are exact arithmetic checks, not simulation of the native Weil representation, not evidence of Gaussian integrability by themselves, not Lean or RH verification. The residue checks test the finite root-of-unity orthogonality index condition only.

Prepared minimal Lean arithmetic certificate (not executed; lean/lake absent on local PATH):
```lean
import Mathlib
theorem run58_radial_cancel (L S : ℝ) (hL : 0 ≤ L) :
    L * (S / (2*L+2)) - S/2 = -(S/(2*L+2)) := by
  have h : 2*L+2 ≠ 0 := by linarith
  field_simp
  <;> ring
#print axioms run58_radial_cancel
```
To reproduce source check in compact project use import New.Rows.MemberKernels, #check / #print axioms Parameters.norm_jet_le_of_isAdmissibleComb, exists_modKernel_integral_bound, Parameters.exists_semilinear_isJetConjugate. No native replay performed; no new axiom evidence or graph changes. Existing CI results are not evidence for this reconstruction. No RH theorem imported as a premise.

## Integration handoff
The common scale, scalar Gaussian estimate, and explicit logarithmic comparison discharge the definite-kernel consumer conditional on the named native CM and standardData suppliers. Retain the original graph edges and exact integrality conditions. The independent lineScale proof still needs its own assembly, class-sum, negative-left and polynomial-coordinate hypotheses. Do not claim the whole comparison chain complete or RH independently proved.

RESUME HERE: reconstruct the quantitative pointwise supplier in ConjugatesOfJets.lean 196–225 (the lattice-separation bound and Gaussian shifted-vacuum supremum), tracing tsum_le_of_separated and one_le_firstMinimum with their precise dimension and constants. Keep the separate CM central-character intertwining and standardData integral theta-product suppliers visible. Reuse this run's scalar majorant and common scale rather than repeating them.