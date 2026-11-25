# One arithmetic-selected translation suffices for geometric witness construction
25 November 2026. New local theorem: replaces the all-translation geometric coverage premise of native CharacterBalanceMoves.core by one selected geometric witness, with exactly the original downstream numerical bound. Human proof, finite exact regression; no native Lean replay and no RH closure. This is a different route from the averaged thin improvements: here use the original pointwise cost bound, not an averaged error bound at a single point.

## 1. Selection before geometry
Pinned P=40e56bab026552e089d7afcfeff08d2defb9c005. Keep the actual arithmetic D,ell, TT,T2, a, m,b,x and A0<=H, with T2 subset A0. All these are known before the choice of translation-specific geometric weights. Define
    J(u)=sum_{t in TT} Re Th(D,ell,T2,b,a(t)/b,u,t), u in A0,
where Th is the exact ChCore.lean function. Note J does NOT involve w, geometric word spaces, ranks of their quotients, heights or loss data. The subgroup A0 is finite nonempty. Choose u* to be any maximizer of J (tie break by a fixed order if wanted).

Native sum_Th (proved by sum_A orthogonality) gives
    mean_{u in A0} J(u) = b*d/2 * sum_{t in TT} Re sum_{chi in PsiA A0} chi(e1(t))*GPsi(chi,a(t)/b),
with d=|T2|/|H|. Consequently if the original hY holds,
    |TT|*m*b*d/2*Y <= m J(u*).
Proof: multiply hY by m*b*d/2>=0, and use mean J<=max J. This is arithmetic only. No assumption about geometry for every u. Works for arbitrary A0, not only principal A0=H.

## 2. Single-witness replacement theorem
Require the native hx,hb and all shared scale/size/host conditions as usual. Replace (i) SizesA conditions universal over u in A0 by their restriction to u*, (ii) the all-translation hTop by
    gapA(D,N,ell,TT,a,w,u*) <= Err,
where the weights w at u* are actual geometric weights, not an invented model, (iii) any geometry existence requirement at every u by a same-host witness at u*. Retain original ThinScales and CostWindows or an independently proved POINTWISE replacement at u*. Do not use the recent averaged thin budget here.

At this ONE selected u*, native th_le and ch_balance yield
    m J(u*) <= gapA(u*) + 2*|TT|*m*b/x <= Err + 2*|TT|*m*b/x.
This is literally the proof of ChCore.core's local hu at u*, with the same hK from CostWindows, the same positivity and cutoff guards, and the same exact normalization. Combine with section 1:
    |TT|*m*b*d/2*Y <= Err + 2*|TT|*m*b/x.
This is EXACTLY the original conclusion of core, including its numerical constant. The subsequent proposition_size_bound does not need geometry at the other translations. No new bounds on the remaining geometric witness have been proved; in particular one must construct the witness selected by J, not an arbitrary convenient one.

## 3. Actual caller opportunity and quantifier audit
QuadraticLogDerivCongr.lean linkGLOBAL_of obtains common i0,av,bv,hadm,hloss from hLo FIRST. Then it invokes Fm.CoverAll for all u0 in (Fm.D x i0).R.A, chooses a function pt and packages Mod. But the arithmetic host M.e and M.AD are defined solely from i0, M.TT from Fm.TTn x, M.T2 from i0, M.a from av, and ell is obtained by hChr x hxCh i0 M.e M.AD rfl HEq.rfl, independently of pt. Move this ell selection before CoverAll. All J parameters are already available at this stage. Choose u* now, then require only that one carrying member with host.u0.val=hval(u*) and common tables. The old hCov implies that single requirement. The existing pointwise ch_top is applied by CoreGm via hcov, and its data type admits U0=Unit; a redesigned local CoreAtHOne package with tr(())=u* could transport the same one geometric witness rather than insist on coverage of all φ.A0. The original CoreAtH and ChainTied structures still require coverage, so this is a proposed replacement interface, not a change already replayed through the caller. The other uniform family premises and upstream proofs of their validity are not thereby eliminated; inspect their actual consumers before changing them. No circular choice of a,b or ell after u* is permitted. If i0,av,bv depend on geometry as in native hLo, they must still be selected before the arithmetic maximization.

In the principal host h=|H| grows at least x^(2+8eps) under native RankVal. The new consumer needs ONE witness rather than h; this is a reduction in required geometric witness instances, NOT a proven runtime factor or a proof that constructing one is easy. It also does not prove that arbitrary pointwise bounds hold on the maximizing translation. It may be substantially useful if a direct geometric construction can be targeted at u*, avoiding CoverAll and the large family assembly. Alternatively require a witness with J>=mean J - delta; the exact output then has added m delta, and an RH-scale loss can be tolerated. Do not treat that flexibility as a supplied existence theorem.

## 4. Native source evidence
- src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean 878f5077bc382426c7da988e5a375b85deeaa7de: Th, sum_A, sum_Th, th_le, core local hu and averaged h1/h2.
- src/Formalism/SharpRestriction/GlobalSchurBounds/QuadraticLogDerivCongr.lean 7828c8b1060818fe158e23f87f1ad9e2efcf79eb: Mod, e/AD/TT/T2/a, linkGLOBAL_of, hLo then hCov then hChr, hcut, L1-L8.
- src/Development/AutomorphicArithmetic/PrimitiveCosets/CoreAtH.lean 0ba3621036f19146e7e67fa9c0e8a1c38661a097: arbitrary U0 with tr coverage, shared geometric data and scale conditions.
- src/Development/AutomorphicArithmetic/PrimitiveCosets/CoreGm.lean 3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d: hcov used to instantiate pointwise ch_top at each u.
- src/Development/AutomorphicArithmetic/PrimitiveCosets/LevelGmLeOnFamilyScales.lean de994949e6fd2d7238cfcb1c19d361ccdfe904fc: tiedCore_of_chainTied supplies tr=id and all translations.
- src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/PairRowIffQdRows.lean 688162690ac7cbfe620037fcee8e451e7116f45b: RankVal.
Latest peer work inspected including a31ec62d (signed thin), cc5937fc (actual thin scales), b0afce1d (L2 obstruction), fcdd6e85 (integral cotangent). No exhaustive archive reread or Lean replay.

## 5. Actual finite regression
Exact V8 signed-integer translation sums over cyclic H of size 1..32, every nonempty initial segment T2 shifted by off=0..3, nonempty TT and deterministic signed row z. Verified full translation mean, max>=mean, existence of a selected witness and one-point transfer with a positive explicit loss. 2112 cases, 8448 exact integer assertions, 1984 cases with strict max>mean. These are abstract finite group regression checks; no actual host geometry or RH numerical evidence. Algebraic theorem in sections 1-2 is independent of this finite test.
RESUME HERE: formalize max selection plus one-translation transfer in Lean and construct an actual CoreAtHOne caller; trace CoverAll producer to determine whether targeting one prescribed translation genuinely removes construction obligations. Do not repeat already verified root adapter. HANDOFF TO geometry, dependency, kernel, math, integration, audit. RH OPEN.
