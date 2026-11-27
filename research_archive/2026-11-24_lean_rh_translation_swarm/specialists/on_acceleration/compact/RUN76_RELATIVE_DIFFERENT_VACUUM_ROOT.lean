import New.Curve.ConjugateGenerator
import Mathlib.Tactic

/-!
# RUN76 — relative different norm removes the imaginary-generator branch
27 November 2026. HUMAN SOURCE-MATCHED replacement candidate at actual
Theorem A scale consumer; Lean certificates PREPARED, not compiled.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Original pin leanprover-community/riemann-hypothesis@
40e56bab026552e089d7afcfeff08d2defb9c005; compact pin lsernau/grh-lean@
72fead102f663d5c7a407964a13dc0cf9d977207. Mission blob
a69122b6ad568910a45d2bc13961ab9da4855143 including mandatory unified
engine, protocol, handoff, expansion, AGENTS consulted. Read latest
peer 80f4ff6e (finite refinement), f1abc81e (marked index) and
b892a87c (KLF and independent audit of RUN75), distinct from this
task. Resume RUN75 0aa83347; its period product remains unchanged.

Actual source ledger (compact paths relative to grh-compact/src):
* New/Curve/PeriodDefs.lean 7dcfa329642087071f8bc9f1976e004eb7fb20ef:
  vacuumRoot, norm_gal_vacuumRoot, periodFactor, jetScale.
* New/Curve/ConjugateGenerator.lean ad3f02ee95b950ae5a4fa98e30fd939e41837ae1:
  exists_isJetConjugate_generator, actual convert congr of norm_gal_vacuumRoot
  and chowla_selberg.
* New/Data/WeilDataOfE.lean 8baa0621fbd228428a1226da1a8e98aa1251740d:
  alpha, v_alpha_mul_relDifferentGen, instWeilDataE.
* New/Data/Different.lean 44f64349db3642e89b752cc92979999edac5c185:
  relDifferent_spec, dvd_norm_c0, coprime_N1_d, prod_phi_eq_norm,
  different_eq_span_relDifferentGen_mul, prod_varpi_eq_rootDiscr_pow.
* Lib/ClassField/HeckeCharacter/SplittingCharOnU1.lean
  12af091740ccb57e363bf3b37c208f9b95fe059e:
  WeilData.exists_chiFin_pow_eq_prod.
* Lib/CM/FormalGroup/FormalHeight.lean 640cabefca81dde25d092fd6ac057c3bcdd3516e:
  chowla_selberg and complex_multiplication_theta (hA).
Same-pin readable grh/src/New/Derivatives/Field/WeilData.lean
5b87f72478ee0d1fa057c381bca5720540717c3d and
grh/src/Lib/ClassField/HeckeCharacter/AlgebraicValues.lean
6141c68e008e302d2053f94cb1ef859212d3413f agree on root and chiFin powers.

## 1. No Galois continuity or norm preservation assumption

Let f=[E:K]>0 (also number of complex infinite places), h=class
number of E, c=chiFin(alpha), and s0=vacuumRoot. The definition and
nonzero c give s0^f=c^-1 by the principal complex root identity.
In fact ANY such root works for the scalar assertion.

For an arbitrary finite idele x, choose y in E^times generating
the h-th power of its fractional ideal. Then x^h/y is a finite
unit at every finite place. The splitting character is unramified
and the idele norm of these units is one, so chiFin ignores that
ratio. At a principal finite idele y, global Hecke triviality
gives upsilon(y_fin)=prod_v (Phi_v(y)/|Phi_v(y)|)^-1.
The finite idele norm of y is prod_v |Phi_v(y)|^-2 by the product
formula. Hence the EXACT product, not just a norm equality, is

  chiFin(x)^h = prod_v conjugate(Phi_v(y)).

This is the compact exists_chiFin_pow_eq_prod proof; no claim to
establish its primitive class number or splitting character existence.
Here the CM type is ALL embeddings over K, so the product is
N_{E/K}(bar y) in K^times, by prod_phi_eq_norm. For x=alpha write
q=N_{E/K}(bar y). Then s0^(fh)=q^-1 in K^times. Every sigma over K
fixes that power, hence |sigma(s0)|^(fh)=|s0|^(fh) and positivity of
fh gives |sigma(s0)|=|s0|. This uses only multiplicativity of
absolute value and sigma fixing K, never continuity of sigma.
Since |upsilon(alpha)|=1 and c=upsilon(alpha)|alpha|^-1/2,

  (|sigma(s0)|^2)^f = |alpha|.                         (1)

Root choice can vary only by a root of unity; no phase choice is
needed for (1). Keep the actual source s0 unchanged for jet transport.

## 2. Shorter exact discriminant argument at this caller

Let D_rel be the relative different ideal of E/K, and
I(alpha)=prod_w w^ord_w(alpha) the fractional ideal of alpha.
The actual local identity v_alpha_mul_relDifferentGen says
I(alpha) * conjugate(I(alpha)) = D_rel^-1.

For completeness this local relation follows directly from the
actual alpha definition: the relative different is generated
by the nonzero derivative P'(zeta), divides N1, and is invariant
under conjugation because the relative trace pairing is invariant.
If w divides D_rel then its rational prime p divides N1, hence
p divides (d+1)/4 by dvd_norm_c0. Since c0*bar c0=(d+1)/4
and c0+bar c0=1, exactly one of c0 and bar c0 belongs to w.
At that place exactly one of alpha and bar alpha has order
-ord_w(D_rel); at every other place both orders are zero.
This proves the ideal equality including primes of zero different
order and does not choose a generator of imaginary phase.

The norm of a finite idele is the inverse absolute norm of its
fractional ideal. Conjugation permutes primes preserving residue
cardinalities. Take the absolute ideal norm of the exact equality:

  |alpha|^2 = N_{E/Q}(D_rel).

The discriminant tower formula and the fundamental discriminant
of K (d prime, d=7 mod 8) give

  N_{E/Q}(D_rel) = |disc(E)| / d^f
                 = (rd(E)/sqrt(d))^(2f).

Combine with (1) and use injectivity of the positive 2f-th power:

  |sigma(s0)|^2 = rd(E)/sqrt(d)      for EVERY sigma over K.    (2)

This replaces the human branch using prod_varpi_eq_rootDiscr_pow,
infinitePlace_apply_varpi and the choice of a unit making the
different generator purely imaginary, at THIS consumer only.
The exact relative different, its divisibility, trace pairing
and discriminant tower are retained. The native Weil construction
may still use different generators elsewhere; no global pruning.
No new asymptotic, prime distribution or RH assumption.

## 3. Actual ConjugateGenerator scale, all constants cancel

Retain the SAME C=cmCurve, D=C^sigma, U=chosen Chowla-Selberg
unit, omega=Omega(sigma) from complex_multiplication_theta.
Let A=area(D), R=rd(E), H=sqrt(d), Q=exp(gamma-Re L'/L(1,chi_K)).
RUN75, independently reviewed at b892a87c, gives
A*|sigma(U)|^2 = pi*Q*(2*pi/H).
The actual hA is A=|omega|^2 H/2. The source defines
t=sigma(periodFactor)/omega*areaScale, periodFactor=s0/U,
areaScale^2=2*pi/H. Thus using (2), before any estimates,

  |t|^2 = (R/H)*pi/(A*|sigma(U)|^2)
        = R/(2*pi*Q)
        = 1/bigOmega.

All denominators are positive. This establishes the scalar
normalization under the retained CM suppliers; it does not prove
the full jet conjugacy or generator theorem by itself. The same
choice of t and same B and F' used by the original proof survive.
No extra absolute value loss or fitted constants.

## 4. Actual arithmetic check, not proof by sampling

Executed in local Python with SymPy exact integers and modular
orders. For actual admissible (N0,d,s) parameters, independently
computed the contribution of ONE K prime over each p dividing
N1 by cyclotomic ramification index e, residue degree b,
number g of primes, and different exponent a*e-p^(a-1).
Compared with the separate cyclotomic discriminant formula.
Reproducible code (one indentation level inside this comment):

    from sympy import factorint, totient, n_order, isprime, gcd
    n=0
    for N0 in (18480,36960,55440):
      d=next(N0//2-1+j*N0 for j in range(10000)
             if isprime(N0//2-1+j*N0))
      for s in (0,1,4,12):
        c=5; z=s
        while z>=3: z//=3; c+=1
        N=N0*3**c*2**s; f=int(totient(N)); A={}; D={}
        assert d%8==7 and gcd(N,d)==1
        for p,a in factorint(N).items():
          p=int(p); a=int(a); M=N//p**a
          assert ((d+1)//4)%p==0
          e=(p-1)*p**(a-1)
          b=int(n_order(p,M)) if M>1 else 1
          g,r=divmod(f,e*b); assert r==0
          diff=a*e-p**(a-1)
          A[p]=g*b*diff
          D[p]=f*a-f//(p-1)
          assert A[p]==D[p]
          assert 2*A[p]!=D[p]
        absDE={p:2*v for p,v in D.items()}; absDE[d]=f
        assert all(2*A.get(p,0)==v-(f if p==d else 0)
                   for p,v in absDE.items())
        n+=1
    print(n)

Output count 12, exit 0; doubled-side negative controls rejected
for every tested p. Not an actual computation of enormous field
elements, class groups, or sigma; exact independent exponent
regression conditional on the standard cyclotomic local formulas.

## 5. Frontier and verification

Original local source graph retained:
ConjugateGenerator -> norm_gal_vacuumRoot ->
{chiFin power, prod_phi_eq_norm, alpha local unit, product formula,
prod_varpi_eq_rootDiscr_pow, infinitePlace_apply_varpi}.
Reduced human candidate: same chiFin power -> fixed K power ->
{alpha ideal equality, conjugation invariance, norm tower} -> (2);
combine with RUN75 at actual scale consumer.
No native node or axiom retired. Context key: compact pin, actual
P,s,K,E,CM type,f,h,alpha,y,s0,sigma,D_rel,I,rd,d,
same curve/unit/omega, and all embeddings. Do not transfer
fixed-power argument to general CM types not consisting of all
embeddings over K. The remaining A/B/C and weighted prime-window
obligations persist. No original URT comparison or speed claim.

Local command -v lean/lake returned neither. Actual CI receipts
read: cathedral-research-state compute/rh-recursive-reduction-strip-root-
20261125/status.json b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
compute/rh-proof-term-prune-native-20261125/status.json
7da354941e402b6f8b364ed03d8c5c82d27b7717, both pass for earlier
conditional root and tools only. Compact run 45803534769
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
088cd2ec0e935ee1a282f10096949bcf671cc804: six named checks with
propext, Classical.choice, Quot.sound; Theorem A build timeout 124
after 2700.11s; all_requested_checks_ok=false, full_RH_replay=false.
No new native rh_scan/prune/reduce/auto/frontier execution or PASS.
Prepared generic certificates below are not native model replay.

RESUME HERE: integration/editor splice (1)-(2) and section 3 at
the actual ConjugateGenerator scale caller; independent audit
verify fractional ideal norm orientation and f exponent.
Acceleration next trace the actual hJ frame cardinality and
uniform M bound through New/Curve/FrameSections.lean at the same
caller; if already supplied, choose the surviving primitive
finite-frame existence/tightness supplier rather than repeating
the scale argument. Retain all previous checkpoints.
HANDOFF TO integration/editor, independent audit, kernel and theta.
RH remains OPEN.
-/

namespace RHAccelerationRun76

theorem fixed_power_norm (sigma : ℂ ≃+* ℂ) (z : ℂ) (n : ℕ)
    (hn : 0 < n) (h : sigma (z^n) = z^n) :
    ‖sigma z‖ = ‖z‖ := by
  apply (pow_left_inj₀ (norm_nonneg _) (norm_nonneg _) hn.ne').1
  rw [← norm_pow, ← norm_pow, ← map_pow, h]

theorem discriminant_cancel (u A R : ℝ) (f : ℕ)
    (hf : 0 < f) (hu : 0 ≤ u) (hR : 0 ≤ R)
    (h₁ : u^f = A) (h₂ : A^2 = (R^f)^2) : u = R := by
  apply (pow_left_inj₀ hu hR hf.ne').1
  apply (pow_left_inj₀ (pow_nonneg hu _) (pow_nonneg hR _) (by decide : (2:ℕ) ≠ 0)).1
  rw [h₁, h₂]

theorem scale_cancel (R H P Q A O U : ℝ)
    (hH : 0 < H) (hP : 0 < P) (hQ : 0 < Q)
    (hO : 0 < O) (hU : 0 < U)
    (hA : 2*A = O*H) (hPeriod : A*U = P*Q*(2*P/H)) :
    (R/H)/U/O*(2*P/H) = R/(2*P*Q) := by
  have hApos : 0 < A := by nlinarith [mul_pos hO hH]
  calc
    (R/H)/U/O*(2*P/H) = (R/H)*P/(A*U) := by
      rw [show A = O*H/2 by linarith]
      field_simp [ne_of_gt hH, ne_of_gt hO, ne_of_gt hU] <;> ring
    _ = R/(2*P*Q) := by
      rw [hPeriod]
      field_simp [ne_of_gt hH, ne_of_gt hP, ne_of_gt hQ] <;> ring

#print axioms fixed_power_norm
#print axioms discriminant_cancel
#print axioms scale_cancel
#check Parameters.norm_gal_vacuumRoot
#check Parameters.exists_isJetConjugate_generator
#check WeilData.exists_chiFin_pow_eq_prod
#check Parameters.v_alpha_mul_relDifferentGen
end RHAccelerationRun76
