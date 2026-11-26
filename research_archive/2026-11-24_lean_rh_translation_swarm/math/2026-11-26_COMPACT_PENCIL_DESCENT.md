# Compact Theorem C: finite tied-prime descent

Status: **source-matched human reconstruction of `exists_isPencil`, conditional only on its explicitly stated native arithmetic lemmas; no local Lean replay**.

This is one connected contribution to Theorem C.  It reconstructs the divisor induction that turns balanced Galois representations into a uniformly bounded pencil of tied primes, includes the linear-algebra tilting argument and the difficult unseen-class input, and follows the result into its immediate caller `exists_anticyclotomic_twist`.  It does **not** prove RH, `exists_isFitFamily`, or the remaining balanced-row and denominator suppliers.

## 1. Source, revision, and downstream link

Primary source: `lsernau/grh-lean`, commit
`72fead102f663d5c7a407964a13dc0cf9d977207`, directory
`grh-compact/src`.

| Declaration | Source path | Blob | Lines used | Immediate role |
|---|---|---|---:|---|
| `exists_isPencil` | `New/Selmer/TwistTheorem.lean` | `bdf0bed65edefd067b584695b1fac0b6acbbd754` | 31–94 | bounded tied-prime set |
| `IsPencil.length_le_of_unseen_class` | `New/Selmer/TiltingLemma.lean` | `62784266136a2936dd6f8d662b79fa051d28c470` | 94–199 | reciprocity/duality shortening criterion |
| `tilting` | `New/Selmer/TiltingLemma.lean` | `62784266136a2936dd6f8d662b79fa051d28c470` | 206–224 | all but at most `card n` slopes shorten |
| `IsBalanced`, `IsPencil`, `tieRelations` | `New/Selmer/Corepresentable.lean` | `3e401695d96b8ea826d60dadf0174d366f85d37c` | 222–256 | exact hypotheses and local relations |
| `exists_anticyclotomic_twist` | `New/Selmer/TwistTheorem.lean` | `bdf0bed65edefd067b584695b1fac0b6acbbd754` | 103–195 | common roots-of-unity twist |
| `exists_isFitFamily` | `New/Selmer/FitTwistsExist.lean` | `da769eba595af2f883eed9b82dbd322a521aea14` | 24–65 | Theorem C fit-family supplier |

Downstream chain:

\[
\texttt{exists\_isPencil}
\longrightarrow
\texttt{exists\_anticyclotomic\_twist}
\longrightarrow
\texttt{exists\_mFoldTwist\_selmerLengthLe}
\longrightarrow
\texttt{denominatorLe\_rowBudget}
\longrightarrow
\texttt{exists\_isFitFamily}
\longrightarrow C.
\]

The latest peer checkpoint `a144d8d` explicitly left the
`length_le_of_unseen_class`/`exists_isPencil` induction as the next step.  The
root-of-unity selection was already reconstructed in `fcd5da8`; this note does
not duplicate it.

## 2. Exact theorem interface

Fix a prime `ℓ`, a CM field `E`, a finite index type `ι`, finite dimensions
`n_i`, finite sets of places `S ⊆ S₀`, and

\[
z\in \operatorname{inertiaAbove}(S_0\setminus S_\ell).
\]

Let `O` be an `ℓ`-adic integer ring and
\(\rho_i:G_E\to\mathrm{GL}_{n_i}(O)\).  For every `i`, assume the full native

\[
\operatorname{IsBalanced}(\ell,S,\rho_i,L_i,\gamma_i,\beta_i,M).
\]

This includes continuity modulo \(\ell^M\), unramifiedness off `S`, full matrix
span, scalar inertia with \(s\pm1\) units, the strict residue-field inequality

\[
4n_i+2 < \#k_O,                                               \tag{2.1}
\]

coboundary compatibility with `L_i`, and the native local-length budget.  Let
`W` be a neighbourhood of `z`, and let \(a\mid\ell^M\).

For finite place sets `T,J` and slope data `x`, define exactly as the source

\[
X_{T,J,x,i}(a)=
\operatorname{Sel}_{\rho_i}\!\left(
 S\cup T\cup\bar T,
 L_i\cup\operatorname{Tie}(J,x,i)\cup\{c(\gamma_i)=0\};
 O/(a)\right),                                                \tag{2.2}
\]

where `Tie(J,x,i)` consists, on both conjugate sides, of

\[
c(\gamma_v)=t_{v,i}c(\phi_v),\qquad v\in J.                  \tag{2.3}
\]

Write \(Q_N(P_0,J,x)\) for the native `IsPencil` predicate: `J` is auxiliary,
`P₀ ∈ J`; each `x_v` supplies an anticyclotomic character modulo
\(\ell^N\); the Frobenii of the nonhelper primes have the Kronecker character
pattern; \(\phi_{P_0}\in W\); and whenever \(t_{v,i}\ne0\), both conjugate
Frobenii are trivial under \(\rho_i\bmod\ell^M\).

The conclusion, with all quantifiers preserved, is

\[
\boxed{
\exists J_0\ \forall N\ \exists P_0,J,x:\quad
Q_N(P_0,J,x),\quad |J|\le J_0,\quad
\forall i\;\operatorname{length}_O X_{J,J,x,i}(a)\le\beta_i .}
                                                                    \tag{2.4}
\]

The bound `J₀` may depend on the representations, balanced data, `a`, `W`, and
the finite index family, but not on `N`.  The theorem does not choose different
prime sets for different `i`.

## 3. Three supporting mechanisms

### 3.1 Finite lengths and the divisor step

Because \(a\mid\ell^M\), every coefficient module `O/(a)` is torsion.  The
source invokes `exists_corepresenting_coords` to inject every Selmer module in
(2.2) into a finite coordinate module.  Consequently every length used below
is finite; this is needed both for minimisation and for strict descent.

The induction is well-founded factor-by-factor in the divisor monoid.  Its
base case is a unit `a`.  Then `O/(a)=0`, so every Selmer length is zero.  A
single auxiliary helper prime `P₀` supplied by `exists_isAnticyclotomicAt`
gives `J={P₀}`, all slopes zero, and hence `J₀=1`.

For the step write the new modulus as \(\varpi a\), with `ϖ` irreducible, and
assume the theorem for `a`.  Multiplication by `ϖ` induces an injective map

\[
f:O/(a)\hookrightarrow O/(\varpi a).                          \tag{3.1}
\]

The exact kernel computation is `span {a}.ker_liftQ_eq_bot'` in source line
47.  If a Selmer class modulo \(\varpi a\) has no unit coordinate, every
coordinate is divisible by `ϖ`; division by `ϖ`, together with (3.1) and the
same Selmer relations, puts it in the image of the module modulo `a`.
Therefore

\[
\operatorname{length}X(\varpi a)
\le \operatorname{length}X(a)\le\beta_i.                     \tag{3.2}
\]

This is the source's negative branch at lines 68–73.  It is not a Nakayama
assertion without hypotheses: the coordinatewise divisibility and the
injective lifted quotient map are both used.

### 3.2 The unseen-class criterion

Suppose instead that `X_{J,J,x,i}(a)` contains a class with a unit coordinate.
`IsPencil.length_le_of_unseen_class` says its length is at most `β_i` provided
every admissible new prime `P ∉ J` has the following property.  For all local
data `l`, if **every** scalar slope `t` extends the current data to a pencil,
then

\[
X_{J,J,x,i}(a)
\subseteq
\bigl(\operatorname{eval}_{\gamma_l}
X_{J\cup\{P\},J\cup\{P\},x_t,i}(a)\bigr)
\mathop{\mathrm{comap}}\operatorname{eval}_{\phi_l}.          \tag{3.3}
\]

In words, every old class's Frobenius value is realised as the tame-inertia
value of a class satisfying the extra local condition.  This is the precise
"no new prime sees the class" premise; it is stronger than merely requiring a
nonzero evaluation.

The difficult native proof of this criterion is not hidden behind its name.
It performs these steps:

1. Convert the balanced local-length inequality into a global cardinal bound
   for relaxed cocycles, using the scalar inertia element and the alternating
   pairing from conjugate self-duality.
2. Use corepresentability and split-prime Chebotarev relations to choose a new
   split prime whose Frobenius detects a putative unit-valued class.
3. Apply reciprocity to the paired values at \(P,\bar P\).  The mirror
   relation and the unit conditions on \(s\pm1\) make the relevant local
   pairing nondegenerate.
4. Under (3.3), replace the detected Frobenius values by tame-generator values
   of classes with the new local condition.  The global reciprocity sum then
   forces the detected nonzero pairing to vanish, a contradiction.
5. Translate the resulting finite cardinal inequality back to module length,
   yielding `length X ≤ β_i`.

These are source lines 100–199 of `TiltingLemma.lean`.  They depend on every
balanced clause, not only (2.1); in particular this note does not weaken
`IsBalanced`.

### 3.3 Tilting chooses a shortening slope

For an Artinian quotient `O/I`, an `O`-module `Y`, and maps
\(\Phi_0,\Phi_1:Y\to(O/I)^m\), the source proves

\[
\operatorname{length}\bigl(Y\cap\ker(s\Phi_0-\Phi_1)\bigr)
\le
\operatorname{length}\bigl(Y\cap\ker\Phi_0\cap
\Phi_1^{-1}(\Phi_0Y)\bigr)                                  \tag{3.4}
\]

for every residue `s` outside a list of at most `m` exceptions.

Here is the actual argument, rather than the word "generic".  Let

\[
Z=\sum_s Y\cap\ker(s\Phi_0-\Phi_1).
\]

On `Z`, \(\Phi_1\) factors through \(\Phi_0\): for a vector in the `s` summand,
\(\Phi_1y=s\Phi_0y\).  Lift the induced endomorphism of `Φ₀Z` to an endomorphism
`ψ` of a free module surjecting onto `Φ₀Z`.  If `s` is not a root of the
characteristic polynomial of `ψ`, then `s-ψ` is invertible after reduction.
This gives the required injection between the quotient pieces in the two
sides of (3.4).  The characteristic polynomial has degree at most `m`, hence
at most `m` residue roots.  This is exactly source lines 209–224.

## 4. Minimal-complexity descent

Apply the induction hypothesis at modulus `a` and fixed `N`; it gives an
initial pencil `(P₀,J,x)` with

\[
g_{J,x}(a,i):=\operatorname{length}X_{J,J,x,i}(a)\le\beta_i.
\]

Among all pencils retaining these inequalities and lying below the finite
initial combined budget, choose one minimising

\[
\mathcal C(J,x)=\sum_i g_{J,x}(\varpi a,i).                  \tag{4.1}
\]

The combined budget has the form

\[
|J|+\mathcal C(J,x)\le K,                                   \tag{4.2}
\]

where `K` is the value for the initial pencil.  The source leaves `K` as an
inferred existential term; no explicit asymptotic formula is consumed later.
Finiteness from §3.1 makes (4.1) well-founded.

Assume the minimal pencil fails (3.3) for some row `i`, prime `P`, and local
datum `l`.  The nonzero relative quotient has positive finite length `r`.
Before imposing the new tie, use the module

\[
Y_k=X_{J\cup\{P\},J,x,i}(k),\qquad k\in\{a,\varpi a\},
\]

with
\(\Phi_0=\operatorname{eval}_{\gamma_l}\) and
\(\Phi_1=\operatorname{eval}_{\phi_l}\).  Apply (3.4) at both coefficient
moduli.  Each produces at most `n_i` bad residues.  By (2.1), the residue field
contains an element `v` outside both bad lists and outside zero.  Thus `v` is a
unit.

Extend the pencil by `P` and set its slope vector to

\[
t_P(i)=v^{-1},\qquad t_P(j)=0\quad(j\ne i).                  \tag{4.3}
\]

The tie for row `i` becomes the kernel of
\(v\Phi_0-\Phi_1\), up to multiplication by the unit `v`; for every other row
it is simply `ker Φ₀`.  The source's inclusions at lines 81–90 therefore give,
simultaneously for `k=a` and `k=ϖa`,

\[
\begin{aligned}
r+g_{J\cup\{P\},x',i}(k)&\le g_{J,x,i}(k),\\
g_{J\cup\{P\},x',j}(k)&\le g_{J,x,j}(k)\quad(j\ne i).
\end{aligned}                                                \tag{4.4}
\]

At `k=a`, (4.4) preserves every bound `g(a,j)≤β_j`.  At `k=ϖa`, it strictly
decreases (4.1), because `r>0`.  Adding one prime costs at most one in (4.2),
while the positive relative-length drop pays for that cost.  Hence the new
pencil still satisfies (4.2) but has smaller `C`, contradicting minimality.

Consequently (3.3) holds for every admissible extension.  The unseen-class
criterion handles the unit-valued branch, while (3.2) handles the no-unit
branch.  This proves (2.4) for `ϖa` and closes the divisor induction.

The decisive descent equation is (4.4): one slope is chosen simultaneously
outside the two finite exceptional lists, so the same new prime preserves the
old-modulus bounds and strictly lowers the new-modulus complexity.

## 5. Exact immediate consumer

`exists_anticyclotomic_twist` calls (2.4) once, at source lines 112–115, with

\[
U_i(g)\equiv \rho_i(g)\equiv1\pmod{\ell^M},
\]

and a neighbourhood `W` simultaneously enforcing the valuation bounds for all
the finitely many `val_k` families and proximity to `z` for every `ρ_i`.
Thus `J₀` is chosen **before** the root-of-unity exponent and coefficient-ring
extensions.  The caller then:

1. chooses \(\delta>0\) with \(\delta(8J_0+2)<\eta\);
2. obtains one pencil `J` with `|J|≤J₀`;
3. uses the already reconstructed roots-of-unity theorem to choose one tuple
   of \(\ell\)-power roots for all rows, value families, and powers
   \(1\le d\le m\);
4. drops the ties with `length_le_of_drop_ties`, paying determinant valuations;
5. concludes the common twist's Selmer-length and value bounds.

This ordering matters: choosing separate shortening slopes or separate twists
for each row would not satisfy the caller.

## 6. Comparison with the existing interpretation

The compact manuscript previously said only that
`exists_mFoldTwist_selmerLengthLe` supplied the common twist, and the latest
Galois checkpoint described the row budgets but explicitly left
`length_le_of_unseen_class` and `exists_isPencil` unresolved.  The correction
is that the common-twist theorem has a prior uniform finite-prime descent:

- it inducts on every divisor `a | ℓ^M`, not directly on Selmer rank;
- it minimises the sum of lengths at the larger modulus `ϖa` while preserving
  the bounds at `a`;
- its generic slope must avoid exceptional residues for **both** moduli;
- residue size (2.1), reciprocity, and the full balanced local budget are all
  used.

No premise has been deleted, and no claim is made that the source theorem has
been reproved without its native arithmetic dependencies.

## 7. Verification, failed attempts, and audit state

- The four source files above were checked out at the exact compact pin; the
  recorded blob IDs for the two callers match the mission ledger.
- The companion certificate
  `2026-11-26_COMPACT_PENCIL_DESCENT.lean` records the exact imports,
  declarations, axiom queries, and the finite descent bookkeeping lemma.
- Local `lean`, `lake`, and `elan` are unavailable.  Therefore this run does
  **not** report a native PASS.
- A finite exhaustive regression of the abstract cardinal/length bookkeeping
  was run separately; it is only a negative check against an inequality error,
  not evidence for the Selmer or reciprocity arguments.
- No RH theorem, `Main`, or preproved root theorem is imported as a shortcut.
  The compact dependency graph and unresolved axiom evidence are unchanged.

## RESUME HERE

Reconstruct the next native cluster in `TwistTheorem.exists_anticyclotomic_twist`
after the pencil: the two Fitting-polynomial constructions and their common
root-of-unity evaluation (source lines 137–195), retaining the single `J`, the
same coefficient-ring extension, every `1≤d≤m`, and the exact
`8c+η`/`B_i+η` budgets.  Then connect that cluster through
`TwistForRows.exists_mFoldTwist_selmerLengthLe` to the two actual
`denominatorLe_rowBudget` calls in `exists_isFitFamily`.  On a capable compact
runner, elaborate the companion certificate and record the actual axiom output;
do not infer PASS from the externally certified full repository.

