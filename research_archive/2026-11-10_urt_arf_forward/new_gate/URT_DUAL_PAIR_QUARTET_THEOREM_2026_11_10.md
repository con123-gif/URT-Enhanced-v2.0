# Exact distance-two quartet completion and source-rank/vertex-identifiability theorem
**10 November 2026. Original no-fit analysis, extending the archived A5-symmetric third cumulant and face-to-edge theorem.**

## Construction
The original five-Platonic cochain space has dimension 14+26+26+62+62=190; the native icosahedral component has 12 vertices, 30 edges and 20 triangular faces. The existing unsigned edge-face incidence D (30×20) and face Laplacian L satisfy DᵀD=6I−L. The two hidden projectors P3,P5 have rank four and eigenvalues L P3=3P3, L P5=5P5. Their charge-two 64-history sources, H13⊕H51 carrier and original 24-clock action are inherited unchanged.

**New canonical bijection:** Each unordered distance-two vertex pair p={i,j} has exactly two common neighbours u,v, themselves adjacent. The two faces {i,u,v} and {j,u,v} meet at the edge {u,v}. Conversely every edge has exactly two opposite third vertices, forming a distance-two pair. Hence the map κ:p↦{u,v} is a bijection between the 30 distance-two pairs and the 30 edges, commuting with all 60 proper A5 rotations. Let Π be its 30×30 permutation matrix, and define B[p,f]=1 precisely when f is either of the two faces containing p's common-neighbour edge. Then the **exact identity**

**B=ΠD,  BᵀB=DᵀD=6I−L**

holds entrywise. This proves equality of the *entire* 20-mode singular spectra, not merely the hidden quartet spectra.

Consequently the normalized maps into distance-two Weyl-pair space are **Td3=BP3/√3, Td5=BP5**, with Td3ᵀTd3=P3, Td5ᵀTd5=P5, Td3ᵀTd5=0. The distance-two quartet isotypic projector is **Π4(distance2)=BP3Bᵀ/3+BP5Bᵀ**, rank eight. The standalone test compares it entrywise with an independently computed integer A5 character projector over all 60 proper rotations. The existing nearest-neighbour maps Te3=DP3/√3 and Te5=DP5 give the other rank-eight projector. Thus all **four** A5 quartet copies in Sym²H13 are explicitly constructed: two on edges, two on distance-two pairs. This is geometric pairing representation theory, not a fermion mass prediction.

## A second exact selection rule
Define the antipodal cross-incidence R (30 distance-two pairs ×30 edges) by R[p,{i,j}]=1 when p={antipode(i),j} or {i,antipode(j)}. Its exact rank is 15, and
**R D P3=0, R D P5=2 B P5**.
Thus this natural A5-equivariant but non-invertible map *annihilates* the odd hidden 4_3 and doubles the even 4_5. The direct common-neighbour bijection Π, by contrast, transmits both. The two maps are distinct and have different physical selection consequences if a microscopic action chooses one.

## Source-rank theorem and non-uniqueness
Stack edge and distance-two maps into 60-dimensional target pair space:
S±,a=(Te,a; ±Td,a)/√2, for a=3,5, and S±=S±,3+S±,5. Exact identities give S±ᵀS±=P3+P5, S+ᵀS−=0. The two 8-dimensional ranges together exhaust the full 16-dimensional quartet pair sector. A **single native 4_3⊕4_5 source has only eight independent spatial directions**, so it cannot excite all 16 independent pair channels through one linear source map. The natural normalized S+ and S− are distinct and equally A5-equivariant. More generally S3(α)=(cosα Te3;sinα Td3), S5(β)=(cosβ Te5;sinβ Td5) preserve the source norms for every α,β. These angles are *mathematical witnesses of non-uniqueness*, not fitted parameters or proposed physics. A5 symmetry, charge selection and normalization therefore do not uniquely select a charged-matter vertex.

## Clock and Ward preservation
For either normalized embedding, the inherited conditional charge-two 24-clock Gaussian Schur kernel has 24×8=**192 nonzero source-supported eigenvalues**, with the original masses 18 and 16 and weights 1 and Δ² (Δ=3/20−80π/(1053φ)); changing spatial embedding leaves those nonzero eigenvalues invariant. The executable verifies generic temporal gauge covariance and the full second Ward cancellation: source acceleration + Wilson seagull + Schur relaxation. It also verifies the first/second phase contacts of a **conditional** spatially Wilson-anchored charge-two Weyl pair. The latter is not an already-derived spatial gauge action: face-to-site anchoring and actual H13⊕H51 charge/chirality remain missing.

## Verification, boundary, next step
The new identities were independently reconstructed and **executed locally** with exact SymPy incidence matrices, 60 proper A5 rotations, rational hidden projectors, and the native 24-clock. An independent exact 64-history reconstruction reproduced the archived n5 24/20/20 levels, the n3(n5) polynomial and dark K3=3/128. The committed short script reuses the archived original face-edge theorem and reruns the new exact identities and Ward checks; a post-commit run against GitHub-hosted files is not claimed.

**Proved:** exact dual pair incidence and projector completeness, parity-selective cross-incidence, rank-eight source ceiling, non-uniqueness of normalized geometric embeddings, and conditional clock Ward consistency. **Not proved:** that the original π/φ/e recursion selects Π or R, a unique charged-matter vertex/normalization, a fermion/gauge pole residue, or any of the four historical ARFs.

**Precise unsolved theorem:** derive from the archived microscopic H13⊕H51 action which (if any) of the explicit edge/distance-two intertwiners is dynamically selected, including spatial Wilson anchors and the full fermion-loop Ward contacts; then evaluate a defined gauge-invariant physical pole/residue. Source statistics, including the exact A5-symmetric third cumulant, are not themselves physical ARFs.

Reproduce: from new_gate, OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python URT_DUAL_PAIR_QUARTET_2026_11_10.py. No historical ARF targets, fits, James work or third-party Yang–Mills inputs.