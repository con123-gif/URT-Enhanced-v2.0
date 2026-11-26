import New.Data.DataExist
import New.Endgame.LongForms

/-!
# RUN27 compact kernel lane — actual fixed-scale caller adapter, 26 Nov 2026
Status: human source-matched audit; executable candidate PREPARED, NOT compiled.
Mission blob 23f64d503b7d64bb13b9667156b499021038d742, compact source
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Claude and collaborators per upstream.
Latest peers read: 2b574cee (fixed-modulus PNT shortcut), 20a967d4 (analytic
endgame), 4f4bf8eb (residue/common-twist audit), 28039ee4 (shared source graph),
d18891b2 (odd-Sha integration). This lane prepares the missing actual compact
caller adapter, not another PNT derivation or old-pin prime-window criterion.

CI evidence: run 45781154005, compute/rh-compact-union-graph-20261126/status.json
reports status=error, returncode=1, RESOURCE_BLOCKED before compilation.
All outer Actions jobs concluded success, but this is NOT native graph PASS.
resources.json blob d18de391ad0d5a970ecaa201a9687335f1d76523 records
4 effective CPUs, 16,759,427,072 bytes RAM, 92,718,592,000 free temporary bytes.
Publisher recommends 12 cores/24 GB for its 1–2-hour build. No release assets
returned by upstream releases API; no ready compiled environment established.
Local command -v lean/lake/elan returned no executable.
No requeue, guard override, protected workflow change, or new axiom evidence.
The old-pin engine CI does not apply automatically to compact 4.35.0.
Original graph and RUN26 certificate preserved intact.

## Actual source and independent audit (29 source assertions executed in V8)
- New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65:
  original star and eventually_primeError_le_rpow consumer.
- New/Data/DataExist.lean 634c6a1f88791a3bb770326785b70411e8289b41:
  actual forall-eventually x, exists D with x equality, log x1 = x^(eps/6),
  lower bound on log x1, log log b = eps log x, towerDeg/log b <= #thick.
- New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a:
  exact remainder_eq, A, B. A produces one q>0, B_s=q projectedPoincare_s;
  B supplies t using the unscaled maps. Nonzero q makes the ranges equal.
- New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05:
  upper family is a basis chosen from image2 B t S. The same y is fed to
  index t _ y and size for each sigma. C receives exactly i, hn, I, hV;
  its volume heights use the SAME IsFitFamily witness o. No independent
  optimization or mismatch of A and B witnesses.
- New/Endgame/PrimeError.lean 63eb3d79d95ad815878e623b96f237240058c8e2:
  original lambdaClass, primeError, logDerivMean, polar supplier.

## Fixed scale proof of the precise replacement premise
For fixed P, fixed eps>0, use the unconditional fixed-progression PNT
with exponential square-root error as in peer 2b574cee. For M=1,N0,
A_M(y)=sum_{n<=y} lambdaClass(d,M,n)=y/phi(M)+E_M(y), where
|E_M(y)| <= C y exp(-c sqrt(log y)) for y>=2, with c>0 and C fixed.
The CRT sum of weights on units mod Md is phi(d) and nonunit prime
powers contribute O_P(log y). Both moduli and d are fixed here.
By the exact ramp integral and Euler-product normalization (peer
2b574cee and the actual PrimeError definitions), not an arbitrary
centering constant:
R_M(y)=-int_y^infty E_M(v)/v^2 dv.
Hence |R_M(y)|<=2 C (sqrt(log y)/c+1/c^2) exp(-c sqrt(log y)).
At the ORIGINAL data scale y=x1 with log y=x^(eps/6), this is
O_{P,eps}(x^(-A)) for every fixed A>0, because x^(eps/12)/log x -> infinity.
Using X=towerDeg(D.s)/#D.thick <= log b=x^eps, X>=0, the triangle bound
R_N0(x1)-X R_1(x1) <= |R_N0(x1)|+X|R_1(x1)|
is at most x^(-1000000) eventually, uniformly in ALL such D.
For instance choose A=1000002; eps<1/100, so (1+x^eps) C x^-A
<= x^-1000000 eventually. The threshold depends on P and eps, not D.
This is precisely hTail below, since x=exp(D.logX).
No uniformity over growing d; common d selected first in the Landau consumer.
All denominator positivity and the original native scale guard retained.

## Original/reduced source roles
Original: eventual error <- exists_data + IsPolar.exists_window_sub_mul_le
+ isPolar_primeError (two applications) + D' scale update + star + remainder_eq
+ HasLogBound. Reduced candidate: eventual error <- exists_data + hTail
+ star + remainder_eq + HasLogBound, with original D, no D' and no moments.
hTail is separately supplied by the above classical external PNT route.
The polar identity itself remains required by the final Landau consumer.
The star premise remains OPEN in our human reconstruction, including A/B/C.
This is a source-level local caller replacement, not a measured global kernel
edge deletion. Importing New.Main or Main would obscure the bridge; neither
is imported here. No claimed RH theorem used. No native rh_scan/rh_prune/
rh_reduce/rh_auto/frontier execution or PASS for this file.

RESUME HERE: on the approved capable compact environment, place this file
alongside the RUN26 shared graph driver; run lake env lean on this file,
check actual errors and #print axioms, then instantiate hStar with the
independently derived A/B/C chain and hTail with formal fixed-PNT theorem
only if available. Keep native original proof as fallback. No duplicate
large CI job on the observed under-capacity runner. HANDOFF TO integration,
formal audit and acceleration: use the human fixed-scale cut with exact
normalization and uniform-in-D threshold, not a newly verified native result.
-/

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module

namespace CompactFixedScale

/-- Same native conclusion; tail hypothesis concerns only the distant
original data scale, not the target x. The two assumptions are explicit. -/
lemma eventual_primeError_of_star_and_fixedTail
    (P : Parameters) {ε : ℝ} (h : 0 < ε / 6 ∧ ε < 1 / 100)
    (hStar : ∀ D : Data P, D.m * D.remainder ≤ D.logB ^ 2 * D.budget)
    (hTail : ∀ᶠ x in atTop, ∀ D : Data P,
      D.x = x → log D.x₁ = x ^ (ε / 6) →
      log (log D.b) = ε * log x →
      towerDeg D.s / log D.b ≤ #D.thick →
      primeError P.d P.N₀ D.x₁ -
        towerDeg D.s / #D.thick * primeError P.d 1 D.x₁ ≤
          exp (-(1e6 * D.logX))) :
    ∀ᶠ x in atTop, primeError P.d P.N₀ x ≤ x ^ (8 * ε + 2⁻¹ - 1) := by
  filter_upwards [h.elim (exists_data P), hTail] with x ⟨D, eqx, hx1, l, e, H'⟩ W
  have w := W D eqx hx1 e H'
  subst x
  simp only [log_exp, Set.mem_preimage, ← exp_mul] at *
  obtain := D.hasLogLower_of_le H', D.scale
  calc primeError P.d P.N₀ D.x =
      D.m * D.remainder / D.m / D.a / #D.thick +
      (primeError P.d P.N₀ D.x₁ -
        towerDeg D.s / #D.thick * primeError P.d 1 D.x₁) := by
        simp [remainder_eq, tops, card_placeClass_eq, field, HasLogBound.pos D, ne_of_gt]
    _ ≤ D.logB ^ 2 * D.budget / D.m / D.a / #D.thick +
        exp (-(1e6 * D.logX)) := by grw [hStar D, w]
    _ ≤ _ := D.le_of_hasLogBound (by grind)

#print axioms eventual_primeError_of_star_and_fixedTail

end CompactFixedScale
