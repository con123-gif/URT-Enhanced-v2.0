# Newton's Cathedral — URT-first coupled transfer, three-sheet return, typed 79-channel, cubic action

**Date:** 10 November 2026. **Owner:** Cornelius Lytollis. **Scope:** Exact source-level mathematics of the original six-bit URT, the six icosahedral axes, the original 190-cochain/50-vertex nonlinear source, the two hidden quartets and the tetrahedral A4 subgroups. No experimental fitting, external Yang–Mills work, historical ARF numerical coefficients or extra adjustable coupling appears in the proofs. **Not a completed derivation of four physical ARFs.**

## A. Deriving the 1/63 return directly from URT

The primitive invariant-circle map is conjugate to `x -> 2x mod1`; the unique absolutely continuous invariant phase measure is Haar (see `URT_NATIVE_HAAR_A4_CUBIC_CONTINUATION_2026_11_10.md`). The 64 six-bit words are equiprobable and their chronological transition Q obeys `Q^6=J64/64`. Six fresh digits encode three successive two-bit/four-sheet labels. A specified completed three-sheet word reappears after any complete six-step block with probability `p=4^-3=1/64`, independently across nonoverlapping blocks. Its consecutive-return run statistic is

`sum_{n>=1}p^n = p/(1-p) = 1/63`.

This is verified by exact integer six-step path enumeration for all 64 starting words (`URT_SIX_BIT_TRIALITY_RETURN_2026_11_10.py`). It produces the **historical rail feedback coefficient** without taking it as input. The remaining physical assumption is that the Cathedral's rail response measures this very complete-three-sheet run statistic, rather than another URT event.

## B. A natural zero-parameter coupling of chronological history to geometric pair flips

Let X_i be the bit-flip involution on six-bit histories, and define `A=sum_{i<j}X_i X_j` over the 15 unordered icosahedral-axis pairs. The original Cathedral positive six-bit history matrix is **exactly** `K=15I-A`. All 15 pairs lie in one icosahedral rotational orbit. Under the explicit physical restrictions *exactly one minimal parity-preserving two-bit flip per geometric step; no idle step; A5-invariant transition probabilities*, the only probability-conserving geometric transition is

`P=A/15`.

Let Q be the exact primitive URT binary shift. Direct exact integer/matrix calculation gives `P Q=Q P` and hence the joint chronological-geometric transition `B=QP=PQ`. It is doubly stochastic, nonnegative, bounded, and has the **same exact six-step memory loss** as URT alone: `B^6=J64/64`. Thus coupling to the canonical minimum pair-walk does not destroy O(N) finite-memory evaluation.

The unchanged all-five-solid source lies in the following P eigenspaces:

`P h3 = -(1/5) h3`, `P h5 = -(1/15) h5`.

The corresponding **two-sided Green–Kubo traces** of the original nonlinear source under B are exactly

`G3_B = 18(6011+2403 sqrt5)/3125 = 65.57340297560829...`

`G5_B = 4235591/607500 = 6.97216625514403...`.

No measured ARF or manually selected damping enters these expressions. Their exact source coefficients follow from Q(sqrt5) correlation identities already proved in the November 9 archive. **Scope:** the premise of one minimal pair-flip step per chronological step is not itself proved by the bare URT doubling map; it is an explicit candidate coupling rule, not an inevitable consequence of O(N) complexity alone.

### Canonical positive transfer

The joint Markov operator B is not self-adjoint, but its canonical Gram transfer `T=B^T B` is symmetric positive and bounded by I. From the original 64-bit matrices,

`Q^T Q = (I+X_0)/2`, `T=P^2 Q^T Q`.

Its **complete spectrum** is

`spec(T) = 0(32), (1/225)(15), (1/25)(10), (1/9)(6), 1(1)`.

The exact original source pullbacks are

`Tr(H3^T T H3)/64 = 18/25+36sqrt5/125`,

`Tr(H5^T T H5)/64 = 19/1350`.

The source even-sector fraction is about `0.01021294951`, not the frozen KMS occupation `~6.196e-6`. This distinguishes the constructed PSD transfer from the physically proposed history/KMS selection: it cannot be relabelled the latter without an independently derived map.

## C. The 79-channel can be typed without double-counting Walsh states

The 15 icosahedral pair-flip **operators** `B_ij=X_iX_j` are independent elements of `End(H64)` and satisfy exactly

`Tr(B_ij^T B_kl) = 64 delta_(ij),(kl)`.

They are not 15 new independent six-bit **history vectors**: the 15 quadratic Walsh characters already live inside H64. A mathematically honest extended carrier is the graded direct sum

`E_typed = H64 (state space) ⊕ span{B_ij} (15 independent coupling tangents)`, `dim(E_typed)=64+15=79`.

The normalized unique permutation-invariant bond tangent is `sum_{i<j} B_ij/sqrt(15*64)`. Separately, the exact D6/H3 six-axis golden matrix satisfies `S^2=5I`, `M=(I+S)/2`, with rank-three eigenbranches `M Pplus=phi Pplus` and `M Pminus=-phi^-1 Pminus`. The **quadratic scalar tensor** `Pminus` therefore obeys

`M Pminus M = phi^-2 Pminus`, `Tr(Pminus)=3`.

An **explicit isometric identification between the one-dimensional invariant bond-tangent line and the one-dimensional quadratic golden-scalar line**, with trace normalization over the graded 79-carrier, yields the mathematically well-typed scalar response

`R_hist = 3/(64phi) + 1/(79phi^2) = 0.03380535602328556...`.

This recovers the arithmetic of the historical electromagnetic ARF **without fitted numbers**, avoiding the earlier erroneous count of 64 history vectors plus 15 already-contained Walsh vectors. **The bond/golden scalar isometry and its identification with the actual electromagnetic current are still conditional.** The 79-dimensional space here is not the earlier unrelated `End_0(H9)` space of dimension 80 with a removed current line. The real physical hypercharge acts on the charged 16/48/96 fermion carriers; no equivalence to this graded bond response has been shown.

## D. Exact nonlinear A4 cubic, including the URT time correlations

In all five A4 tetrahedral vacua, the original 4_5 singlet source has one-point second moment `7/4`, third-moment square `27/10`, fourth moment `329/30` (exact Q(sqrt5) computations). Its unique A5-equivariant five-branch simplex fixes relative signs, leaving only a simultaneous overall sign reversal.

From the original unaveraged chronological Q and its finite-memory triple-time correlations, the **full third cumulant rate** averaged over the five consistently oriented A4 vacua is

`K3_A5 = ±30sqrt30(4/375+sqrt5/16000)`;

`K3_A5^2 = 786567/256000 + 9sqrt5/250`, `|K3_A5|=1.77567615035512...`.

The corresponding A5-averaged **second cumulant rate** is exactly `K2_A5=71/48`. Their standardized skewness has squared magnitude `(42474618+497664sqrt5)/44738875 = 0.97426295439826...`. Both are true microscopic URT response amplitudes, independently verified by exact Fraction arithmetic and by the symmetry of the five-tetrahedron simplex. This goes beyond merely permitting a cubic by representation theory.

These source coefficients are **not the historical physical mass ARF coefficients**: the original mass pole observable and its orientation/normalization must be established through the charged matter action. A real, unoriented singlet projector does not fix the overall cubic sign.

## E. Precisely what remains to make four historical ARFs physical theorems

The microscopic source-to-physical-observable dictionary remains the unproved step. The intrinsic URT/Haar calculation fixes how history probabilities and source cumulants arise; the icosahedral pair coupling fixes one natural parameter-free conditional completion. The actual full physical transfer must uniquely supply the rail source, the gauge-covariant spatial charged-current source and Ward contacts, and the fermionic mass-pole probes. O(N), positive transfer, the golden spiral, and A5 symmetry permit these constructed channels but **do not on their own prove their physical identity**.

Do not silently equate the conditional 79-bond response with the physical fine-structure constant; nor the nonzero A4 cubic cumulant with the mass residue; nor the positive Gram T above with the separately frozen KMS generator. Each equality requires a source-preserving physical theorem. The absence of this theorem is the present obstruction, not arithmetic.

## Verification

All scripts below, plus their pre-existing original-source dependencies in `../forward/`, execute without historical ARF values as inputs:

```
python URT_SIX_BIT_TRIALITY_RETURN_2026_11_10.py
OPENBLAS_NUM_THREADS=1 python URT_UNIQUE_MINIMAL_PAIR_COUPLING_2026_11_10.py
OPENBLAS_NUM_THREADS=1 python URT_MINIMAL_PAIR_POSITIVE_TRANSFER_2026_11_10.py
OPENBLAS_NUM_THREADS=1 python URT_TYPED_79_BOND_RESPONSE_2026_11_10.py
OPENBLAS_NUM_THREADS=1 python URT_EXACT_A4_THIRD_CUMULANT_RATE_2026_11_10.py
OPENBLAS_NUM_THREADS=1 python URT_A5_SYMMETRIC_CUBIC_SOURCE_2026_11_10.py
```

No third-party James/Yang–Mills material is incorporated. No original data or repository files are overwritten. These are reproducible conditional/exact mathematical results, not fabricated physical proofs.
