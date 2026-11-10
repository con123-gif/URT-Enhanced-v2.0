# Newton's Cathedral / URT — exact A5 signed-history and charge-two matter-intertwiner gate

**10 November 2026. Original add-only result; no experimental inputs or fitted ARFs.**

## Native source and typing

This calculation continues the existing **190-cochain all-five-Platonic source** (`14+26+26+62+62=190`), with its 50-vertex harmonic bridge, 20-face icosahedral incidence, rank-four hidden projectors `P3`, `P5`, and the 64 signed histories. The archived native source-to-history theorem proves `H64 Uh P3=18 Uh P3`, `H64 Uh P5=16 Uh P5` and charge `+2` for each hidden source. Its 24-clock Schur/Wilson calculation and first/second Ward contacts are retained **unchanged**; no 24-fold multiplier is applied to the new representation multiplicities. This note computes a new **A5 representation and charged-matter gate**, not a replacement for the complete spatial source, and it does not assume that all five non-icosahedral solids individually carry a literal spatial A5 rotation action. The common 3+5 harmonic bridge to the icosahedral face sector is an existing specified dictionary, not a uniqueness consequence of the primitive `pi/phi/e` recursion.

## Theorem A — full 64-history A5 representation

Construct the icosahedron's 12 vertices as the left cosets `A5/C5`. The nontrivial element of `N_A5(C5)/C5=C2` acts on the right as the antipodal map. A signed history selects one vertex from each of the six antipodal pairs; there are `2^6=64`. A5 permutes these histories. The permutation character on the five A5 conjugacy classes, ordered `(1,2A,3A,5A,5B)` with sizes `(1,15,20,12,12)`, is

```
chi_64 = (64,0,4,4,4).
```

The exact character inner products yield the surprising decomposition

```
H64 as A5-module = 4*(1 + 3 + 3' + 4 + 5).
```

For the centered icosahedral 13-carrier, `H13=2*1+3+3'+5`, with character `(13,1,1,3,3)`. Therefore **an abstract A5-complement** has

```
H51 = 2*1 + 3*3 + 3*3' + 4*4 + 3*5
chi_51=(51,-1,3,1,1).
```

Complete reducibility proves existence of such a complement, but **does not specify a canonical embedding** of the 13-carrier into the 64 histories or identify this abstract complement with a particular physical H51 matter action. That requires an additional intertwiner.

## Theorem B — exact joint H64 energy / A5 content

The native pair-flip Hamiltonian is `Hbits=15 I64 - sum_(i<j) X_i X_j`. Its Walsh-weight `k` eigenvalue is `E(k)=2 k(6-k)` (so `0,10,16,18,16,10,0` for `k=0..6`). It commutes with the full signed-axis A5 action. Exact traces of the 60 group permutations on every Walsh weight give

| Energy | Dimension | Exact A5 decomposition |
|---|---:|---|
| 0 | 2 | `2*1` |
| 10 | 12 | `2*3 + 2*3'` |
| 16 | 30 | `2*1 + 2*4 + 4*5` |
| 18 | 20 | `2*3 + 2*3' + 2*4` |

The original native source injects one hidden quartet `4_5` into energy 16 and one `4_3` into energy 18, by the already verified native isometry `Uh`. Hence **each of these two energy eigenspaces contains a second A5 quartet orthogonal to the source-coupled quartet**. The statement is about the linear source image; it does not say that the complementary quartets cannot interact through other terms.

## Theorem C — an exact A5 versus unaveraged chronology obstruction

The original six-bit dyadic transition is `Q[h,2h]=Q[h,2h+1]=1/2` (indices modulo 64). Consider all signed permutations of the six axes, `C2^6 ⋊ S6`, of order `64*720=46080`. An exhaustive integer-exact certificate finds that only the **identity** and **simultaneous complement of all six bits** commute with Q. There is also a short proof: if `f(x)_j=x_{p(j)} XOR c_j` commutes with the shift-and-append kernel, then for `j<5` the left successor's `j`th bit cannot depend on the newly appended bit, and matching the first five successor bits forces `p(j+1)=p(j)+1` and `c(j+1)=c(j)`; hence `p(j)=j` and all `c(j)` are equal. These are precisely identity and global complement.

A5's rotational action is faithful and **does not contain global complement** (that is central inversion of the icosahedron, not a proper rotation). Thus

```
{g in A5 : rho(g) Q = Q rho(g)} = {identity}.
```

This holds for **any fixed ordering** of the six antipodal axes. In contrast, `Q^6=J64/64` exactly, so six-step Haar mixing commutes with all A5. The native pair-flip Hamiltonian commutes with A5 at every step; the **unaveraged primitive chronological shift does not**. Therefore an A5-averaged third cumulant is a valid symmetric *ensemble response*, but cannot be silently treated as an A5-equivariant one-step dynamical vertex. An equivariant clock/axis-ordering lift, or a justified dynamical averaging principle, is missing.

## Theorem D — explicit source-to-H13 matter selection and Ward contact

The centered icosahedral carrier has A5 character `(13,1,1,3,3)`. Using `chi_Sym²(g)=[chi(g)^2+chi(g²)]/2`, the exact decomposition is

```
Sym²(H13) = 6*1 + 4*3 + 4*3' + 4*4 + 9*5, dimension 91.
Lambda²(H13) = 1*1 + 6*3 + 6*3' + 4*4 + 5*5, dimension 78.
End(H13) = 7*1 + 10*3 + 10*3' + 8*4 + 14*5, dimension 169.
```

Consequently `Hom_A5(4,H13)=0`: a native hidden quartet **cannot couple linearly to a bare H13 one-particle state through an A5 intertwiner**. However a charge-one two-component Weyl fermion has a **flavor-symmetric Lorentz-scalar pair** (antisymmetric spinor contraction), which transforms in `Sym²(H13)` and has charge `+2`. The quartet appears in exactly four distinct pair sectors:

```
3 ⊗ 3' -> 4 (once)
3 ⊗ 5  -> 4 (once)
3'⊗ 5  -> 4 (once)
Sym² 5 -> 4 (once).
```

The two native charge-two hidden quartets `4_3` and `4_5` thus admit **eight** independent A5- and diagonal-U(1)-allowed *candidate* Weyl-pairing tensors in H13. This counts allowable tensor structures, not eight derived coupling strengths, eight physical forces or eight pole residues. It assumes the chosen Weyl field carries uniform diagonal charge `+1`; the actual Standard Model charge assignment and chirality structure have not been derived from the native source. Adding the H51 matter carrier cannot remove the already-allowed H13 tensor space without an additional symmetry or dynamical constraint.

The **full H13⊕H51 matter carrier** can also be counted without reducing to H13. Under the additional, explicitly conditional assumption that all 64 components are charge-one Weyl flavors and that the abstract A5 complement is used as the H51 module, the exact symmetric-square character is `chi_Sym²(H64)=(2080,32,10,10,10)`. Its decomposition is

```
Sym²(H13⊕H51) = 50*1 + 98*3 + 98*3' + 138*4 + 178*5.
```

The **138** quartet copies split precisely as `4` in `Sym² H13`, `44` in `H13⊗H51`, and `90` in `Sym² H51`. Hence two independent native hidden quartets allow **276** symmetry-permitted charge-two Weyl-pair tensors in the *unrestricted uniform-charge 64-flavor hypothesis*. These are not 276 physical interactions or fitted couplings. Actual species charges, chirality, source localization and the native history energy projections may remove most or all of these structures. An independent exhaustive count of fixed unordered pairs of the 64 signed histories reproduces the `2080,32,10,10,10` character, rather than relying only on the symmetric-square character formula.

An independent **integer** check builds the 60-element A5 permutation representation on the 13 carrier sites and its 91-dimensional symmetric-square representation. For the quartet central idempotent `P4=(4/60)sum_g chi4(g) rho_Sym²(g)=M/15`, it verifies exactly `M²=15 M`, `Tr(M)=240`, `rank(M)=16`. Independent numerical restriction to each of the four listed tensor sectors gives quartet rank **4** in each.

For charge-two `h` and a charge-two fermion pair `B(psi,psi)`, the local Yukawa *candidate* `2 Re[h†B]` is gauge invariant. The first Ward contact is `(-2i+2i)h†B=0`; the second is `(-4+8-4)h†B=0`, where the middle term is the cross contact. These **local Yukawa contacts** do not replace the separately proved temporal Wilson seagull, source rotation or history-relaxation contacts in the 24-clock Schur action. A bare `h†(bar psi psi)` is not invariant if the Dirac bilinear is neutral. In the original Haar six-bit ensemble the mean hidden source is zero, so a first-order *mean-field* fermion mass from a linear h Yukawa vanishes; higher-order self-energies are not excluded.

## Scope, falsification and next mathematical step

**Proved and independently checked:** exact A5 character and energy decomposition of the native 64 signed histories; abstract H51 multiplicities; the two bright/two complementary quartet structure conditional on the archived native source embedding; the exact incompatibility of the one-step dyadic chronology with all nonidentity A5 rotations; four allowed H13 Weyl-pair quartet sectors per native hidden quartet, and the full conditional 138-quartet Sym²(H13⊕H51) count; charge-two Yukawa Ward contacts. All character results are exact in `Q(sqrt5)`, and the 91-dimensional central projector check is integer-exact.

**Ruled out:** (i) an A5-equivariant **linear** hidden-quartet-to-H13 one-particle vertex, (ii) identifying the unaveraged dyadic Q with an A5-equivariant one-step transfer, (iii) assuming A5×U1 alone uniquely determines four physical couplings: eight distinct H13 Weyl-pair tensor structures remain available for two hidden quartets (and 276 in the unrestricted uniform-charge full 64-flavor Weyl model). This does not falsify a more restrictive original charged-matter action.

**Still hypotheses:** the native all-five-solid harmonic pullback and the six-bit geometric-history dictionary, the physical identification of H13/H51 with fermion species, and any Weyl pairing vertex (not present as a fixed unique coefficient in the original source). The A5 source projection is not a global geometric A5 action on every individual Platonic solid. The 24-clock has not been promoted to a new matter-gauge kinetic term in this calculation.

**Precise unsolved theorem:** derive from the primitive pi/phi/e recursion and **the original full 190-cochain gauge-covariant action** a canonical equivariant chronological lift and a unique normalized charged-matter vertex on `H13⊕H51` that selects/weights these allowed intertwiners, including every Wilson/source/Schur/fermion Ward contact; then calculate gauge-invariant fermion and gauge pole positions/residues and compare with the four historical ARFs. The new results restrict that task but do **not** supply a source-to-physical-pole proof. No historical ARF number was inserted.

## Reproduction

From this directory, with `numpy` and `sympy` installed:

```
OPENBLAS_NUM_THREADS=1 python URT_H13_A5_CHARGE_TWO_PAIRING_CERTIFICATE_2026_11_10.py
OPENBLAS_NUM_THREADS=1 python URT_H64_A5_CHRONOLOGY_MULTIPLICITIES_2026_11_10.py
```

The executable certificates are independent of previously computed decimal outputs. The existing A5-symmetric cubic theorem, neutral two-quartet cumulant theorem and original source-Schur Ward theorem were read before this derivation; they are not overwritten.
