# Native 24-clock A5 no-go: a Wilson clock cannot repair the primitive chronology by itself

**10 November 2026. Exact original mathematical result; physical four ARFs remain OPEN.** This is an add-only obstruction theorem for the *unchanged* all-five-Platonic 190-cochain / 64 signed-history / 24-clock / native hidden-quartet / H13⊕H51 program. No target ARF, experimental parameter or third-party Yang–Mills input is used.

## 1. Native operators and precise scope

Use the original unaveraged six-bit chronology
`Q[h,2h mod 64]=Q[h,(2h+1) mod 64]=1/2`, and the original A5 action `rho(g)` on the six antipodal icosahedral axes. The existing exact centralizer theorem proves `Stab_A5(Q)={1}`. Its native 24-clock charge-two Wilson shift has `(U_theta y)_t = exp(2i theta_t)y_(t+1)`, with periodic indices, and the charged-source Schur block is
`A_E = E I24 + (pi/e)^2 (U_theta-I)^dagger (U_theta-I)`, with `E=18` on native source-bright `4_3` and `E=16` on native source-bright `4_5`. The full H64 has further energies, but the native hidden source couples only to these two quartets. The all-five-solid harmonic pullback, 64-history source dictionary, H13⊕H51 charged-matter carrier and existing Ward contacts are *unchanged*.

We test the specific proposed shortcut: use the **existing clock alone**, without additional frames or altered Wilson links, to carry a unitary ordinary A5 action `R(g)` commuting with the native clock kinetic operator, so that the tensor chronology becomes A5-equivariant under `rho(g) tensor R(g)`. This does **not** exclude entangled history-clock representations, altered link dynamics, frame-dependent source maps, projective representations or added degrees of freedom.

## 2. Theorem: every Wilson-clock eigenspace has dimension at most two

Let `Theta=sum_(t=0)^23 theta_t`. A diagonal unitary gauge change moves the link phases into a uniform phase `Theta/24`. Hence the exact clock Laplacian eigenvalues are
`ell_m(Theta)=2-2 cos((2 pi m - 2 Theta)/24)`, `m=0,...,23`.

For distinct `m,n`, equality of two eigenvalues requires their angles to agree up to a sign modulo `2pi`. The positive branch implies `m=n (mod 24)`, while the negative branch determines at most one distinct partner. Therefore **every eigenspace has dimension 1 or 2, for every real Wilson holonomy Theta**.

Every ordinary complex irreducible representation of A5 has dimension `1,3,3',4,5`. In particular A5 has no nontrivial one- or two-dimensional complex representation. If a unitary representation `R:A5 -> U(24)` commutes with the native Wilson Laplacian, it preserves each eigenspace, and its restriction to every one- or two-dimensional eigenspace is necessarily trivial. Consequently

`[R(g), (U_theta-I)^dagger(U_theta-I)]=0 for all g  ==> R(g)=I24 for all g.`

This is stronger than the argument based on the golden angle's irrationality: it holds even at holonomies with twofold clock degeneracies.

For the original uniform golden clock `theta_t=2pi/phi^2`, `2Theta/pi=96/phi^2` is irrational, so all 24 eigenvalues are distinct. The two source-bright Schur blocks have numerical minima `16.010228725137853` and `18.01022872513785`; this independently agrees with the archived holonomy theorem.

## 3. Corollary: factorized clock covariance cannot restore one-step A5

Any factorized A5 action preserving the original Wilson kinetic operator has `rho(g) tensor I24` on the original history-clock carrier. For nonzero clock operator `A_E`,

`[rho(g) tensor I24, Q tensor A_E] = [rho(g),Q] tensor A_E`.

Since the original A5 centralizer of Q is trivial, the right-hand side is nonzero for each nonidentity `g`. **Therefore the original 24-clock, by itself and with its unchanged Wilson dynamics, cannot turn the unaveraged primitive Q into a one-step A5-equivariant chronological transfer by a factorized A5 action.**

The executable reconstructs the full 60-element A5 action independently from `A5/C5`, certifies that the group is perfect, verifies that exactly one A5 element commutes with Q, and gives an exact counterexample: for the A5 rotation `(0,1,3,4,2)` at history `h=0`, the rotated successors are `{24,26}` but successors after rotation are `{48,49}`. It checks the original charge-two golden Wilson spectrum directly with a 24x24 Hermitian matrix, including both E=16 and E=18 minima.

## 4. Interpretation and boundaries

**PROVED:** (i) clock Wilson Laplacian multiplicity <=2 at every holonomy, (ii) every ordinary A5 representation commuting with this clock Laplacian is trivial, (iii) the unchanged factorized clock cannot repair the primitive Q's one-step A5 obstruction. All are exact finite statements. The numerical spectrum is a separate regression check.

**FALSIFIED:** the shortcut of identifying the native 24 temporal clock with a symmetry-restoring A5 action while retaining its existing charge-two Wilson kinetic operator and a factorized group action.

**NOT FALSIFIED:** the already archived 60-frame A5-covariant lift (a separate 60-fold classical frame), a nonfactorized history-clock action, a dynamically transforming geometric frame, or any future Ward-complete charged matter theory. The 24 clock still supplies physical temporal Wilson holonomy and its existing seagull/source-rotation/Schur/fermion Ward contacts; no such contact is dropped or recomputed here. The result does not derive electromagnetic normalization, fermion poles, the rail correction or any historical ARF.

**Precise next unsolved step:** Derive an A5-equivariant *nonfactorized* or explicitly frame-dependent source-to-H13⊕H51 charged vertex from the original pi/phi/e recursion and the complete 190-cochain action. It must preserve the primitive fixed-frame six-step cumulants, retain all 24-clock Wilson/source/Schur/fermion Ward contacts, select and normalize the previously counted matter intertwiners, and yield genuine physical pole observables. No free coupling may be inserted.

## Independent reproduction

Run `OPENBLAS_NUM_THREADS=1 python URT_NATIVE_CLOCK_A5_NO_GO_2026_11_10.py` in this directory. It is standalone (NumPy only), does not import prior archive code, and uses no ARF targets.
