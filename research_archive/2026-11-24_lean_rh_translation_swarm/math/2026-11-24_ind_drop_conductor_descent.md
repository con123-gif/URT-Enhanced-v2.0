# MATH lane — `QH.ind_drop`: conductor identification behind the Jacobi-twist modulus change

**Date:** 2026-11-24  
**Result:** SOURCE-MATCHED reconstruction of the exact theorem `QH.ind_drop`, with a finite arithmetic regression attached.  
**Status:** PARTIAL for the full RH reconstruction. This is neither a Lean kernel replay nor a proof of the analytic inputs or RH.

## Source pin and scope

Upstream repository: `leanprover-community/riemann-hypothesis` at the required revision
`40e56bab026552e089d7afcfeff08d2defb9c005`.

| Pinned source | Git blob | Role |
|---|---|---|
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/IndDrop.lean` | `1fc497069c8499edef750d4264a106e442dcb1ef` | theorem reconstructed |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/TwistPrim.lean` | `5443adc0075731900672030d140d5d8c85b668f7` | canonical primitive Jacobi twist |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/IndUnique.lean` | `d0784c03bdc5ca1b96fdd39a5a9fbb846a63cc0e` | uniqueness in the sigma type of modulus-character pairs |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/PrimeSetTwoBounds.lean` | `45616f33334b6ef360b18a8e64c0eb325f9463b8` | exact definition of `Ind` |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/pairEx.lean` | `0020840fcf9b97e9e6e834c591e8516b9875e003` | sole downstream call in `pairEx_box` |

The upstream default branch no longer contains `IndDrop.lean` at this path (direct retrieval returned
404), so every statement below is tied to the pinned revision rather than silently read from current
HEAD.

## 1. Exact statement and definitions

For a Dirichlet character `psi` of level `N`,

`Ind psi f M := psi.IsPrimitive ∧ ∀ n, Coprime(n,M) → psi(n mod N)=f(n)`.

Thus the final argument is a **testing modulus for admissible integers**. It is not necessarily the
level of `psi` and does not assert a divisibility relation between two levels.

The theorem quantifies over naturals `N0,q,M,N`, a character `xi` modulo `N0`, and a character `chi`
modulo `N` (with `[NeZero N]`). Its hypotheses are

1. `0 < N0`;
2. `q.Prime`;
3. `q != 2`;
4. `not q divides N0`;
5. `M != 0`;
6. `Ind chi (fun n => xi(n) * J(q,n)) M`.

Its conclusion is

`Ind chi (fun n => xi(n) * J(q,n)) (N0*q)`.

No premise says `M | N0*q`, `N0*q | M`, or `q` is coprime to `M`. The proof therefore cannot be a
restriction or extension of coprimality by divisibility alone.

## 2. Construct the canonical primitive twist

Split the input induction as

- `chi.IsPrimitive`; and
- for every `n` coprime to `M`,
  `chi(n mod N)=xi(n mod N0) J(q,n)`.

The conductor `f=xi.conductor` is nonzero and divides `N0`. Hence `q∤N0` implies `q∤f`: if `q|f`,
transitivity with `f|N0` contradicts the hypothesis.

Apply pinned `QH.twist_prim` to `xi.primitiveCharacter` at the prime `q`. The hypotheses used here are
exactly primitive-character primitivity, `q.Prime`, `q!=2`, and `q∤f`. It returns a character

`psi : DirichletCharacter C (f*q)`

such that

1. `psi.IsPrimitive`;
2. `psi != 1`; and
3. for every natural `n`,
   `psi(n mod f*q)=xi.primitiveCharacter(n mod f) * J(q,n)`.

`ind_drop` deliberately discards item 2: nonprincipality is not needed for this conductor argument.
It does not discard primitivity or the evaluation formula.

## 3. The change-level equality is local, not global

Because `f|N0`, `xi` is the change of level of its primitive character. The equality of evaluations
used by the proof is only

`Coprime(n,N0) → xi(n mod N0)=xi.primitiveCharacter(n mod f)`.

It comes from `DirichletCharacter.changeLevel_eq_cast_of_dvd'` and
`changeLevel_primitiveCharacter`. The coprimality guard is essential: away from units modulo `N0`,
the change-level character can vanish even when the primitive character at conductor `f` does not.
The proof never claims equality for every integer.

## 4. Identify `chi` and `psi` by primitive uniqueness

Invoke `QH.ind_unique` with the two levels `N` and `f*q` and comparison modulus

`L = M*N0*q`.

The required `L!=0` follows separately from `M!=0`, `N0>0`, and the nonzero prime `q`. Now let
`n` be coprime to `L`. Since `M|L` and `N0|L`, coprimality descends to both factors:

1. `Coprime(n,M)`, so the input induction gives
   `chi(n mod N)=xi(n mod N0) J(q,n)`;
2. `Coprime(n,N0)`, so the guarded change-level equality changes the right-hand side to
   `xi.primitiveCharacter(n mod f) J(q,n)`;
3. the twist formula identifies that product with `psi(n mod f*q)`.

Thus the two primitive characters agree on every integer coprime to the nonzero comparison modulus.
Pinned `ind_unique` concludes equality in the dependent sigma type

`⟨N,chi⟩ = ⟨f*q,psi⟩ : Sigma (fun n => DirichletCharacter C n)`.

This is stronger than a loose pointwise statement: `Sigma.mk.inj_iff` first forces
`N=f*q` and then gives heterogeneous equality of the characters. After substituting the level
equality, `eq_of_heq` yields ordinary equality `chi=psi`. This dependent-type transport is the
difficult step hidden by the phrase “uniqueness of primitive inducing characters.”

`ind_unique` itself is an imported proved theorem, not an axiom silently removed here. Its pinned
proof lifts both characters to a common level, uses equality on units, and combines
`factorsThrough_gcd` with primitivity to force equality of the conductors and then the characters.

## 5. Re-establish induction at `N0*q`

Keep the original proof that `chi` is primitive. After the identification `chi=psi`, let
`n` satisfy `Coprime(n,N0*q)`. Because `N0 | N0*q`, it follows that `Coprime(n,N0)`. Therefore

`chi(n) = psi(n)`

`= xi.primitiveCharacter(n) J(q,n)` by the twist formula

`= xi(n) J(q,n)` by the guarded change-level equality.

This is precisely the second conjunct of `Ind chi (...) (N0*q)`. Notice that `M` has disappeared
from the target only after the primitive character has been identified; no direct set inclusion
between `Coprime(-,M)` and `Coprime(-,N0*q)` was asserted.

## 6. Downstream call and correction to the earlier interpretation

Pinned `pairEx_box` uses this theorem only in the branch `(i,j)=(1,0)`. It passes

- theorem `N0 := 8*M0`;
- theorem `M := 2*M0*q*d`;
- target testing modulus `(8*M0)*q`.

The earlier MATH chapter correctly reported the conductor construction and uniqueness step, but
called the target modulus “smaller” and described `ind_drop` as dropping an excess `d`-factor. That
language is unsafe. In the concrete witness `M0=1,q=11,d=263`, the source testing modulus is `5786`
and the target is `88`; neither divides the other. What changes is the coprimality domain after the
primitive inducing character has been identified, not a modulus by arithmetic cancellation.

The application also preserves the needed hypotheses: `q` is prime, `q!=2`, `q∤8*M0`, and
`2*M0*q*d!=0`. The conclusion supplies exactly the `Ind ... (8*M0*q)` premise expected by `GoodQ`.

## Independently executed checks

Executed locally with Python 3.12:

```text
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_ind_drop_conductor_descent.py
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_ind_drop_conductor_descent.py
```

The checker validates all five pinned source/blob entries and required report anchors. It exhaustively
checks the two coprimality restrictions used above over deterministic finite ranges, checks that a
prime excluded from `N0` is excluded from every divisor representing a possible conductor, and
evaluates a concrete change-level/Jacobi-twist fixture. That fixture confirms equality on the guarded
unit domain while exhibiting `n=2` as a counterexample to the forbidden global change-level equality.
It also verifies the actual `pairEx_box` source and target moduli need not divide one another.

These are regression checks for the arithmetic routing, not a replacement for Lean elaboration or
for the theorem `ind_unique`.

## Failed attempts / limitations

- Direct retrieval of `IndDrop.lean` from upstream current HEAD returned 404; the pinned commit was
  required.
- Treating the result as divisibility monotonicity fails on the concrete downstream moduli
  `5786` and `88`.
- Removing the coprimality guard from the change-level equality fails at the attached fixture's
  `n=2`.
- Allowing `q|N0` does not justify `twist_prim`; for example `N0=15,q=3,f=3` violates its
  `q∤f` premise.
- Allowing `M=0` makes the comparison modulus zero and violates the explicit `ind_unique` premise.
- No local checkout of the full Lean dependency graph is present, so this run does not claim a
  kernel replay. The current upstream deletion also prevents interpreting the pinned theorem as an
  unchanged current API.

## RESUME HERE

Trace pinned `QH.ind_unique` one layer deeper: reconstruct the common-level lifts, the exact
`factorsThrough_gcd` implications in both directions, and how primitivity converts them into the two
conductor divisibilities that force equality of levels. Preserve its `M!=0` premise and dependent
sigma equality; do not repeat `ind_drop`, `pairEx`, or the completed witness extraction.

**HANDOFF TO:** MATH, character-box, dependency, audit, integration.
