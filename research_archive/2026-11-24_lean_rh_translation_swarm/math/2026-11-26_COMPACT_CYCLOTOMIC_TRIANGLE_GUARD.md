# Compact C: cyclotomic divisor and the Taylor--Wiles triangle guard

Status: **source-matched reconstruction of `exists_cycChar_pow_sub_one_dvd`
and its actual denominator consumer; native replay pending**.

This closes a distinct arithmetic leaf left implicit by the existing row,
tilting, Fitting, and denominator summaries.  It does not reprove the
Taylor--Wiles triangle, Ribet's element, or RH.

## 1. Pin, statements, and root path

Primary source: `lsernau/grh-lean` at
`72fead102f663d5c7a407964a13dc0cf9d977207`, paths relative to
`grh-compact/src`.

| role | declaration/path | blob |
|---|---|---|
| finite group integer | `Data.chosenGroupOrder`, `New/Data/ChosenPlaceLevels.lean` | `d6b4c62956e3ca1259fd69dd8c882a6fe021e7c3` |
| elementary divisor | `g_pow_sub_one_dvd_chosenGroupOrder`, `New/Selmer/AptTuples.lean` | `49699d4679d83a7bc7714afc53b7e2757ae4adf3` |
| cyclotomic guard | `exists_cycChar_pow_sub_one_dvd`, `New/Selmer/DenominatorBound.lean` | `5889d96fe1a6ad7926e0df09a7d183232f91c534` |
| triangle supplier | `exists_isPrimeTriangle`, `New/Selmer/TrianglePrimes.lean` | `b827965b6067ce391e85efd83fcc919fcd75848c` |
| Ribet consumer | `ribet_columns`, `New/Selmer/RibetElement.lean` | `188eeb68d437bfa58bcc30042d4eee66c2111e18` |
| diagonal operator | `BaseLevel.exists_diagOp_mem_ellIntegralForms`, `New/Patching/OnePrimeTie.lean` | `d161966411413f049b0ae5a6baee8fdd4bcc0a26` |
| determinant consumer | `norm_gram_det_le_of_operators`, `New/Selmer/DeterminantBound.lean` | `686d1d98ab6ce7bb70ff4f087d2a10cbae8b85df` |
| final family | `exists_isFitFamily`, `New/Selmer/FitTwistsExist.lean` | `da769eba595af2f883eed9b82dbd322a521aea14` |

The exact guard is

\[
 \exists h\le v_\ell(M_K),\quad
 (\ell\le h_2^2\ \lor\ h=0),\quad
 \exists\gamma\in G_E:\ 
 0<a<t\Longrightarrow \chi_\ell(\gamma)^a-1\mid\ell^h,       \tag{1}
\]

where `M_K=chosenGroupOrder`.  The root-reachable path is

\[
(1)\to\texttt{exists_isPrimeTriangle}\to\texttt{ribet_columns}
\to\texttt{exists_diagOp_mem_ellIntegralForms}
\to\texttt{denominatorLe_rowBudget}
\to\texttt{exists_isFitFamily}\to C.
\]

## 2. The two cases in (1)

### Large `ell`: the exponent is exactly zero

Assume `h2^2 < ell`.  The unit group of `ZMod ell` is cyclic.  Choose a
generator `b`, and use local cyclotomic surjectivity on inertia to choose
`gamma` whose mod-`ell` cyclotomic value is `b`.  If `0<a<t`, the native
parameter bounds give `a<ell-1=ord(b)`.  Hence `b^a != 1`.  Therefore
`chi(gamma)^a-1` has nonzero reduction mod `ell`, so it is a unit of
`Z_ell` and divides `1=ell^0`.  Set `h=0`.

This is stronger than merely bounding a valuation: no Taylor--Wiles cost is
paid at large primes.  It also explains why `gamma` is inertial in this
branch.  No chosen finite place is used.

### Small `ell`: use one chosen Frobenius

Assume `ell<=h2^2`.  `exists_chosen_notMem_placesDividing` supplies a
chosen place `v` above one of `g_i`, away from `ell`.  Take `gamma` to be an
arithmetic Frobenius at `v` and put

\[
 h=v_\ell(M_K).
\]

For `0<a<t`, the row parameters give `1<=a<=r t`; therefore

\[
 g_i^a-1\mid M_K.                                           \tag{2}
\]

This is not an unexplained LCM assertion.  `M_K` is the order of the product
of the groups `GL_(rt)(F_w)` at the chosen places.  Restricting to a
`GL_a(F_v)` block, the factor `g_i^a-1` appears in the standard order formula
for that finite general linear group.  The injected finite group order divides
`M_K`, proving (2).  Frobenius compatibility gives
`chi(gamma)^a=g_i^a` in `Z_ell`.  Finally the unit-coefficient factorization
of a nonzero integer gives

\[
 M_K\mid u\ell^{v_\ell(M_K)},\qquad u\in Z_\ell^\times,
\]

so (2), after the integral cast, implies the divisor in (1).  Here `gamma`
is a Frobenius, not the scalar-inertia element used by `IsBalanced`.

## 3. Exact substitution into the prime triangle

`denominatorLe_rowBudget` calls `exists_isPrimeTriangle` with

\[
 t=\operatorname{rankDiff}(O),\quad N=D.N,\quad y=h_2,
 \quad\text{and}\quad \gamma^{-1}.
\]

Its hypotheses are supplied separately:

1. `D.algebraMap_mem_cycloField`: `E` lies in the required cyclotomic field;
2. apt rank plus the parameter inequalities: `N+t<h2`;
3. (1), unchanged under the theorem's explicit inverse convention;
4. `ell<=h2^2 or h=0` from the same case split;
5. `4<=f` from the data;
6. the most-Frobenii neighborhood built from the auxiliary twist, the row,
   and `exists_eventually_no_eigenvalue_one`.

The output is one finite ordered index set `J`, fixed before `nu`, and for
every `nu>0` a Taylor--Wiles family satisfying `IsPrimeTriangle` with costs

\[
 h_2h\quad\text{and}\quad h_2^{22}h.                       \tag{3}
\]

Because `h<=v_ell(M_K)`, both costs are monotonically bounded by the same
chosen-group valuation.  In the large-prime branch they vanish exactly.
The proof does not replace the triangle's reciprocity laws by this scalar
bound; it supplies only the divisibility hypothesis on which those laws run.

## 4. The denominator caller and exact cancellation order

The triangle is passed to `ribet_columns` with the SAME `h`.  Its final
Ribet coefficient `d` satisfies

\[
 v_\ell(M_K^3d)\le r\,\operatorname{rowBudget}(D,\ell).     \tag{4}
\]

The earlier balanced-row, local duality, odd-Sha and first-order terms are
all inside the right side of (4); the present contribution supplies the
finite cyclotomic part of their triangle input.  The generic normalizer is
chosen before the auxiliary level so that its determinant is nonzero on the
finite set of relevant eigensystems.  `exists_diagOp_mem_ellIntegralForms`
then converts (4) into a diagonal Hecke operator `E_s` with

\[
 v_\ell(M_K^3s(\pi))\le r\,\operatorname{rowBudget}.        \tag{5}
\]

At the Gram-determinant step, use exact multiplicativity first:

\[
 |\iota(M_K^3s(\pi))|
 =|\iota(M_K^3)|\,|\iota(s(\pi))|.
\]

Only then convert (5) to the exponential lower bound required by
`norm_gram_det_le_of_operators`.  This preserves the same scalar `M_K^3` in
the integral pairing bound; taking norms earlier would obscure the matching
factor.  The determinant lemma finally gives the denominator exponent
`r*rowBudget*log ell`, exactly the statement consumed twice by
`exists_isFitFamily` for the common twist family.

Retained deep inputs are explicit: cyclotomic surjectivity on inertia,
Chebotarev/Taylor--Wiles triangle existence and reciprocity, Ribet's
first-order construction, the integral Hecke diagonal operator, and the
Gram-determinant comparison.  This note reconstructs the guard and its
substitution; it does not claim those retained inputs proved.

## 5. Verification and rejected shortcuts

Checked the eight source blobs above and the exact bodies of the guard,
triangle interface, Ribet caller, diagonal operator, and Gram determinant.
Executed exact integer regression on 3,456 tuples
`2<=g<=25`, `1<=a,k<=12`, verifying
`g^a-1 | g^(ak)-1`, plus 35,301 monotonic triangle-cost cases.  `git
diff --check` passed.

Rejected shortcuts/failures:

- identifying the two case witnesses `gamma` (inertial versus Frobenius);
- identifying either with the balanced-row scalar inertia;
- replacing the divisor statement by a numerical valuation inequality before
  the triangle call;
- choosing `J` after `nu` rather than preserving `exists J, forall nu`;
- treating (1) as a proof of the triangle's reciprocity laws;
- claiming compact native verification: local `lean`, `lake`, and `elan` are
  unavailable, and no CI result covers the companion certificate.

## RESUME HERE

Audit the next actual denominator leaf in `BaseLevel.exists_diagOp_mem_ellIntegralForms`:
the implication from the Ribet trace-ideal coefficient to integrality of the
single diagonal operator on comparison forms.  Preserve the SAME base level,
label projector, `M_K^3` scalar, auxiliary family, and quantified test forms.
Do not replace it by a generic semisimple diagonalization statement.  If that
leaf is already closed by a peer, replay the companion below on the shared
compact runner and integrate (1)--(5) into C rather than writing another
denominator overview.
