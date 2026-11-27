import New.Exchange.LowRankIdentity
import Mathlib.Tactic

/-!
# RUN75: eliminate the finite/real character phases in the actual exchange scalar
27 November 2026. SOURCE-MATCHED human proof; generic Lean certificates
PREPARED, not compiled. No root retirement or RH claim.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Original mirror pin leanprover-community/riemann-hypothesis@
40e56bab026552e089d7afcfeff08d2defb9c005 retained.
Mission blob a69122b6ad568910a45d2bc13961ab9da4855143, mandatory engine,
AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES and continuity
read; research state/log/protocol opening inspected. Peer titles through
f1abc81e0e8cdcc950b317c6af81289685fc5346 reviewed. Integration RUN78
42bc7348 (direct determinant support) inspected: it concerns the
nonzero contraction in thetaTerm_stdDatum_spec, NOT this finite/real
phase comparison. Continue RUN74 982eed1c without repeating its chart.

Actual source anchors:
New/Exchange/LowRankIdentity.lean efd396aa9b0681ecba5a2364546a295094866a2c,
stdExchange_of_periods, particularly lines 122–185;
New/Exchange/StableSpaces.lean 38b5bd48274f38b35b66ebb7d6e48ac565636b86,
IntegralFrame.exists_stdRowDatum_eq_stdDatum;
Lib/Weil/MixedModel/EquivariantCoefficients.lean
9b779698c36ab64b5a1964a948cb7089587a3fce,
SplitTameChar.invOnUnits_mul_div_star;
Lib/Weil/Construction/PairDefs.lean 8a5eaed1249fcc1c482e3af4f15373682fa34af1,
AutChar.spaceChar, rankTwist, pairChar, pairWeil;
New/Exchange/EqualRankValue.lean a620150b7c616d614013822be11dbdf74a694f0d,
exchange_of_partners;
New/Exchange/StandardCoefficients.lean 85616f797460e30c5134a146bd5220fadc28855c;
New/Exchange/ExchangeTheorem.lean 608b4f61af27d780e24f799937a836ecd3c1d50a.
Same-pin readable companions (not independent proof certificates):
grh/src/New/Determinant/Exchange/StableSpacesStandardData.lean
399de69a4e75deb3ad883ce2ce17a3021b894e40 and LargeTriple.lean
7f68573eed0b59e2b6d98325935e6567038b4741, specifically
exists_integral_thetaTerm_eq_of_periods and its two direct consumers.

## 1. Exact frame phase, including the zero-support branch

Work over the actual semilocal field F with integral subring O, not
a field obtained by reducing O modulo its conductor. With the same row
ordering sigma, let P=(L K I) (columns reordered by sigma) and Q be
its integral inverse with dual row blocks. Put A=dualL and M(x)=(A;x)
with the rows ordered by the same sigma. In adapted block coordinates
    M(x) P = [ I, 0; xL, x(K I) ] .
Since P,Q integral inverses, det P is an integral unit and the original
integrality guard is exactly x integral. On that guard,
    det M(x) det P = det(x(K I)).
Thus invOnUnits chi(det M)=chi(det P) invOnUnits chi(det(x(K I))),
even if the latter determinant is a nonunit: multiplication by a unit
preserves unit membership, and both extended characters vanish there.
Off the integrality guard both functions vanish. The required constant
is epsilon=chi(det P), |epsilon|=1. It can depend on the character and
frame, but NEVER on x. It must not be replaced by 1 in the complex
exchange equality. No primitivity test on x independent of the original
determinant-unit condition is needed. This is the explicit short
determinant proof of the actual frame lemma.

## 2. Finite support and the single scalar cancellation

Use the actual represented-class self-dual test pair from
stdExchange_of_periods. Write n=rank W1=2j, b=rank V', m=2b+n.
Set a=det(scaleIdele E * V'.x), Y0=det Y, q0=a Y0, y0=det y
in U(1), B=y^-1 Y and x its finite component. Let i be the idele
equal to det B at infinity and 1 at finite places, f the idele equal
to det x at finite places and 1 at infinity. Hence
    i f = det B = Y0 / y0 .
The self-dual lattice hypothesis supplies an integral invertible k
with Y_f k unitary. For integral x, x k is unitary; since its inverse
is its adjoint and the integral ring is star-stable, (x k)^-1 is
integral. Thus x^-1=k (x k)^-1 is integral and det x is a unit of
the finite integral ring. This is exactly the det_unit guard, not
just nonzero determinant. When x is not integral both slice terms
vanish. When the finite cutoff in H is false, the native integral
orthonormal completion (RUN70) rules out all integral x on the large
side; retain this geometric implication. No division by the cutoff.

On the integral branch write U=nu.baseChange, where nu is the actual
unitary character of the tame datum. Put
    F=invOnUnits chi(evalPlaces det x),
    Fstar=invOnUnits chi(evalPlaces star(det x)).
The exact native local character law is F U(f)=Fstar. Both are
nonzero on this branch. The large finite slice is epsilon F times
vacuum tensor the fixed standard column datum for (W1,W1); the small
one is Fstar times the vacuum. This follows by the block determinant
det([x A;0 D])=det x det D and multiplicativity of the extended
character on O, followed by the native namedVector/boxProd/indicator
identity. On nonintegral variable blocks both are zero. Transposition
of the small datum uses dualL^T=K of the conjugate frame, since the
finite standard form is 1. Preserve the named-vector normalization.

There are exactly three phase sources in the represented coefficient:
(a) the quotient of the large and small inverse Levi characters is
    U(q0).
Indeed gamma_L=nu^-1 upsilonU1^(b+j), gamma_S=upsilonU1^b.
By upsilon_star and restriction to norm-one ideles,
upsilonU1.baseChange=upsilon^2. Consequently the splitting-character
power in spaceChar(gamma_L,b+n) is 2(b+j)-(b+n)=b, and
that in spaceChar(gamma_S,b) is 2b-b=b. They cancel exactly, leaving
spaceChar_L / spaceChar_S = U^-1. This is BEFORE taking norms.
(b) The period callback hc divides by U(i) and by sqrt(|i|)^n.
(c) The target pairWeil has gamma_source=rankTwist(nu^-1,n)
on the large side and rankTwist(nu,n) on the small side. By pairChar
the small functional is nu(y0)^2 times the large-base functional,
with no change to its target datum or its argument. This is the
h_twist in the readable companion.

For y0 unitary, U(y0)=nu(y0/star(y0))=nu(y0)^2.
The exact TOTAL phase is therefore
    U(q0) / (U(i) U(f) nu(y0)^2) = U(a).               (P)
Proof: the denominator is U(i f y0)=U(Y0), by the one determinant
factorization; q0=a Y0. All divisions in (P) are by unit-circle
characters. We can multiply this identity by the common small
integrand, including any zero theta value, without dividing by that
integrand or l(nu), rho or the radial additive character.
Equivalently substitute F U(f)=Fstar directly in the products. The
radial character is literally the same, since both reference frames
have Gram V'.J. No independent rephasing is permissible.

The absolute factor also reduces once:
|f|=|y0|=1, hence |i|=|Y0|, and
    sqrt(|q0|)^n / sqrt(|i|)^n = sqrt(|a|)^n.          (A)
All ideles are invertible and their absolute values positive.
The shared scalar in the represented branch is now
    kappa * epsilon * U(a) * l(nu),
where kappa=vacuumFactor_large/vacuumFactor_small * sqrt(|a|)^n.
Both vacuum factors are nonzero and fixed independently of nu.
The unrepresented coefficient is zero on both sides by the earlier
support/sign proof; no division by a zero coefficient. After the
native weighted quotient integral in stages the same R multiplies
this expression, so for each character
    c_nu = R kappa epsilon U(a) l(nu).
R is nonzero and chosen BEFORE the character (weight rho and cutoff
fixed); retain the native stage measure law and integrability. The
coefficient test and partner-generation implication (RUN71–73)
therefore transfer this equality to EVERY integral standard z with
one c_nu, not a choice depending on z or the Fourier index.

## 3. Normalize only after the complex equality

Put K=|R kappa|>0. Since epsilon and U(a) have modulus 1,
    |c_nu|=K |l(nu)|.
The rank identity (b+n)-floor(m/2)=j and positivity of
L_j=lValueProdInt(nu,j) imply exactly
    K^(-2) |c_nu|^2 = L_j (|l(nu)|^2/L_j).
No lower bound for l(nu) is assumed: the identity also holds if it
vanishes. This is the normalization clause of StdExchange; its
nonvanishing later comes from the separate equal-rank/double-exchange
supplier, not this step. The same K works for all characters; taking
norms earlier would lose the phase needed for the difference map.

## 4. Evidence, original/reduced graph and limits

Original source-visible path:
exchange_of_partners -> exists_stdExchange_top ->
stdExchange_of_periods -> {exists_stdRowDatum_eq_stdDatum,
thetaTerm_stdDatum_spec, stage measure law, finite standard-level
cutoff, local character law, exact pairWeil/rankTwist, period callback,
standard coefficient vanishing, partner generation, L_j positivity}.
Proposed human replacement at this caller: explicit block determinant
plus (P),(A) and scalar normalization. Keep actual support, integrable
terms, finite cutoff, rapid slice, quotient Haar, character laws,
geometric and equal-rank suppliers. This removes an intermediate
scalar comparison from the human proof, not global native edges.
Cache key: pin, adapted D,D1, b,n, sigma, actual finite readsAt and
its star, self-dual test pair, same real data, rho and measure. No
assertion about arbitrary nonadapted frames or arbitrary ring maps
commuting with star. No URT comparison warranted.

Actual local execution: no lean or lake in PATH. Python stdlib exact
checks: phase exponent counter a:1,Y:0,y:0,xf:0; 144 rank exponent
checks for b,j=0..11; 314928 integral 2x2 frames/row tests over Z/9
(nonfield), including singular lower block and nonunit determinant
guards. Reproduce:
    import itertools
    from collections import Counter
    q=Counter(a=1,Y=1); I=Counter(Y=1,y=-2,xf=-1)
    q.subtract(I); q.subtract({'xf':1,'y':2})
    assert dict(q)=={'a':1,'Y':0,'y':0,'xf':0}
    for b,j in itertools.product(range(12),repeat=2):
      n=2*j;m=2*b+n
      assert 2*(m//2)-(b+n)==b==2*b-b
      assert b+n-m//2==j
    p=9; units=[a for a in range(p) if a%3]
    det=lambda M:(M[0]*M[3]-M[1]*M[2])%p
    mul=lambda A,B:tuple(sum(A[2*i+k]*B[2*k+j] for k in range(2))%p
                         for i in range(2) for j in range(2))
    count=0
    for P in itertools.product(range(p),repeat=4):
      d=det(P)
      if d not in units:continue
      L=(P[3]*pow(d,-1,p)%p,-P[1]*pow(d,-1,p)%p)
      for x in itertools.product(range(p),repeat=2):
        M=L+x; MP=mul(M,P)
        assert MP[:2]==(1,0)
        assert det(MP)==det(M)*d%p
        assert (det(M) in units)==(MP[3] in units)
        count+=1
    assert count==314928
These are algebra sanity checks only, not native proof tests.

Re-read actual shared CI receipt:
cathedral-research-state:compute/rh-compact-primitives-replay-20261126/
outputs/targeted_results.json (six named checks in TiltingLemma and
Filling.Moments with propext, Classical.choice, Quot.sound; one
module timeout124; all_requested_checks_ok=false; full_RH_replay=false).
No new native rh_scan/rh_prune/rh_reduce/rh_auto/frontier execution
possible locally; certificates below PREPARED, not CI PASS.
No native graph or axiom ledger overwritten, no claimed new kernel-
discharged root obligations, no weighted prime lower bound.

RESUME HERE: combine this exact StdExchange normalization with RUN74
and the actual exchange_of_partners descent. At the Theorem C
determinant-period consumer verify the common scalar is independent
of all tied family parameters (not just character at fixed mu);
do not rederive the finite/real character cancellation. Obtain actual
native replay and independent audit before retiring any root edge.
HANDOFF TO integration/editor, formal audit, native runner.
-/

namespace CompactCharacterBoxes75

theorem phase_cancel {G : Type*} [CommGroup G] (a Y q i f y : G)
    (hq : q = a * Y) (hsplit : i * f * y ^ 2 = Y) :
    q / (i * f * y ^ 2) = a := by
  rw [hq, hsplit]
  group

theorem normalization_cancel {K L ell : ℝ} (hK : K ≠ 0) (hL : L ≠ 0) :
    K⁻¹ ^ 2 * (K * ell) ^ 2 = L * (ell ^ 2 / L) := by
  field_simp
  <;> ring

#check IntegralFrame.exists_stdRowDatum_eq_stdDatum
#check SplitTameChar.invOnUnits_mul_div_star
#check stdExchange_of_periods
#print axioms stdExchange_of_periods
#print axioms phase_cancel
#print axioms normalization_cancel

end CompactCharacterBoxes75
