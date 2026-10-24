# COMPLETE HIDDEN-EIGHT ELECTROMAGNETIC CURRENT SOURCE MAP — EXACT 11/11 TRANSVERSE MODES
2026-10-24. Executed independent SymPy **exact rational** 30x30 operator checks. No measured alpha, historical alpha polynomial, or fitted coupling. This is a finite native, unit-hopping Peierls model, NOT a completed physical IR photon 1PI action.

## 1. Hidden-8 quartet projectors and native link currents
On the original 20-face dual dodecahedron define L=3I−A, native integer face chirality W, P=−W²/15=P3+P5 with P3=P(5I−L)/2 and P5=P(L−3I)/2. Both have rank4.

For each one of the 30 oriented dodecahedral links, take R_e to be the real skew first derivative of the original 60 two-hop Peierls hopping paths; physical Hermitian first source operator is H_e=i R_e. The native icosahedral geometry gives integer R_e and rational P3,P5.

An HS-unit imaginary antisymmetric Hermitian basis of hidden current generators naturally splits into
- intra 4_3: wedge²(4_3), 6 generators;
- cross 4_3↔4_5: 4_3⊗4_5, 16 generators;
- intra 4_5: wedge²(4_5), 6 generators.
Total 28, exactly the imaginary anti-symmetric Hermitian eight-state sector.

Their basis-independent **rational current Gram matrices on 30 links** are
- G33[e,f]=−Tr(P3 R_e P3 R_f)=0 for ALL e,f;
- G55[e,f]=−Tr(P5 R_e P5 R_f);
- G35[e,f]=−2 Tr(P3 R_e P5 R_f).

Let F be the exact dual pentagonal face-to-link incidence, K=F Fᵀ the native cycle Maxwell operator, and P_T its rank11 nonzero spectral projector. Define the rank5 eigenspace projector P_edge5 at K eigenvalue 6, and rank6 P_edge6 at K eigenvalues 5−sqrt5,5+sqrt5.

Exact **30x30 matrix** certificates:
  P_T G35 P_T=(16/15)P_edge5;
  P_T G55 P_T=G55=(32/9)P_edge6;
  G33=0.
Therefore **all eleven** transverse cycle modes are sourced:
  P_T (G33+G35+G55) P_T
     = (16/15) P_edge5 + (32/9) P_edge6
with source rank 11 exactly. The cross-quartet fiveplet covers 5 directions, and the intra-4_5 antisymmetric triplets cover the other 6. The earlier 5/11 result was for the restricted cross-quartet source only, not the full hidden eight-current source.

The unprojected cross-quartet Gram has exact characteristic polynomial
  det(xI−G35) = x^15 (x−16/15)^9 [x²−(16/5)x+256/225]^3.
Its 16 nonzero/zero source singular values squared are 0×1, 16/15×9 and (8/15)(3±sqrt5)×3 each, reproducing golden 3±sqrt5 triplets from integer Peierls currents. Intra-4_5 has
  det(xI−G55)=x^24 (x−32/9)^6.
The physical rank11 transverse Gram charpoly is
  det(xI−P_T G_total P_T)=x^19(x−16/15)^5(x−32/9)^6.

## 2. No-fit Kubo–Mori weighting from frozen rho_star
With the ORIGINAL hidden state rho_star=diag(aI4,bI4),
  a=1/[4(1+Delta²)], b=Delta²a, eta=−ln Delta,
the Kubo–Mori covariance on a **Hilbert-Schmidt-unit** off-quartet tangent is the logarithmic mean
  ell(a,b)=(a−b)/(ln a−ln b)=(a−b)/(2eta)=0.020847675533681317...
and on a 4_5 intraquartet tangent is b=1.5490069176638457e−6.
Consequently, the native hidden density's canonical quadratic current-noise covariance *restricted to 11 physical link cycles* is

  **P_T Cov_KM(J,J) P_T
     = (16/15)ell(a,b) P_edge5
       +(32/9)b P_edge6.**

Parameter-free within this finite source model:
  fiveplet current variance = 0.022237520569260073;
  six-triplet current variance = 0.000005507580151693674;
  ratio = 3(1−Delta²)/(20 eta Delta²)=4037.620871013863.

This fully resolves source representation completeness and its information-metric weighting *within the defined finite source*. It does **not** make it an isotropic 4D Maxwell action. The strong anisotropy is a calculable requirement for the actual URT history dynamics/coframe continuum to address.

## 3. Separate Coulomb/charge index matching
The native dual vertex Coulomb Green G=L⁺ obeys 15Tr G=137. Its chiral source response −Tr(W²G)=32, split exactly 12+20. Independently, the charged one-generation 16-state registry gives three-generation particle+conjugate lepton Q² trace 12 and quark Q² trace 20. These are matching indices, not yet an operator map that directly identifies matter charges with photon source operators.

## 4. Physical completion (not claimed)
A full derivation of alpha(0) would require that the selected, unnormalised **physical** H64 history and its gauge-covariant 4D continuum transfer determine the single transverse 1PI Maxwell q² residue K_gamma from the complete current-current/contact kernel. It must include and normalize *both* native sectors, not insert a measured alpha, and explain the correction to integer 137. No such equality has been asserted or presumed in these finite exact theorems.

Proof script fully executed and provided as conversation artifact: `cathedral_native_hidden_current_complete_photon_2026_10_24.py`; exact JSON data `cathedral_native_hidden_current_complete_photon_results.json`.
