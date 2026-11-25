# RUN23 — actual tied-window arithmetic-to-Landau supplier and revision relocation
2026-11-25. RESULT: SOURCE-MATCHED independent bridge reconstruction, not an unconditional arithmetic estimate or kernel path. Focus shifts from elementary library expansions to substantive source wiring.

## Provenance
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN22, RUN15, continuity/research state/log/protocol excerpts; inspected 14 recent peer commits (including prime RUN23, kernel RUN23, dependencies 0512, acceleration RUN23, editor 0456). CI checkpoint #420 run 45549913981 PASS predates this result; general Cathedral CI is not RH validation. Blueprint link noted, PDF not reread. Prior RUN15 already covered the final family wrapper; this run independently reconstructs the *supplier of its window premise* and records precise proof direction. Prime owns ask/deficit and audit owns core_gm exponent details; no duplication of their internal derivations.

P=40e56bab026552e089d7afcfeff08d2defb9c005. H=27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59, latest observed upstream unchanged since RUN22. Old pinned standalone ZeroFreeOfRpowWindow path returned 404 at H; actual H clump confirmed in CharacterBoxes/ZeroFreeAllOfTopG.lean, not deletion. Source receipts below: each blob and anchor fetched and checked this run, not inferred from imports. Additional inspected source P TopDefs.lean blob 9c0be4e7d8d1508e725334e768a74d5837bbd851, CoreAtH.lean 0ba3621036f19146e7e67fa9c0e8a1c38661a097, Supply.lean b104f034fc9c13758e280d1b7d33ac1ea370663a, EveryCharacterOfLiteratureOfVWin.lean a13ba1f8c38d4dbf2ddd809fbf9610a007936c24 L810–814 and FockModels/EveryCharacterE.lean 01e60174b728fc6b473a308c5bf5dbffbe017afe. Exact intervening theta-to-plugAll call chain not yet authenticated in this run. Dependency lane has cached authenticated manifest and targeted signed-root job pending; request exact Landau identities rather than rescan.

## 1. Actual conditional suppliers (P)
Fix primitive character ψ. TopG is the proposition: for every la>1 and request G, if HostExW la G.req and every member of G.cls la has HypV, then FamilyClassConnected (G.cls la). It is NOT assumed unconditional here. Set la=3/2 as in plugWin, G=GChi ψ; Supply.lean defines GChi as the conjunction EAtH(Level.cyc ψ) with constant 4 and VVle on the host. G.cls la is the conjunction of Windows la and the pointwise request for every x>Fm.x1 and i. SupplyChi supplies the HostExW input from VWinAt ψ 401 and admissibleClassesTwistedChar; the latter remains a separate arithmetic obligation.

zeroFreeAll_of_topG uses hypV_of_cls to take threshold Fm.x1+1 for HypV, and eFamC_of_cls to take C=4, threshold Fm.x1+1, rewriting Fm.L_x and Fm.L_eps. It extracts fixed eD,eL,ε1>0 from FamilyClassConnected, then for each ε∈(0,ε1) a family with the required EFamC, Windows and ChebyshevInequalityOnFamilyWindows. Do not swap this order: eD,eL are fixed before ε, family may vary with ε, and thresholds may vary with the family. The tied predicate is ChainTied; tiedCore_of_chainTied selects a valid index i and converts to FamCoreConstantBounds. It does not imply bounds at points outside Win.

WindowInequalityOfArtinInputs supplies ChebyshevInequalityOnWindows using core_gm: for fixed ε>0, Fm, EFamC witness (C,xE) and tied witness (K,cHH,eK,CL,x0), core_gm gives x1. For x≥max(x1,max(x0,xE)) in Win, tied data yields an index i and EFamC applies at that same i. Thus
    Λ.Gm(x) ≤ x^(1/2+(eD+eL+7)ε).
CoreAtH premises (unchanged) include host additive character compatibility, data x and ε identities, bounds on eDiv/eLoss/cHH, coverage of A0 by tr, IdentU, SizeData₂, ErrWindows, BNBoundsU, SizesA, ThinScales, CostWindows, RestSize, T2⊆A0; no claim these are supplied by generic analysis. See audit/prime lanes for individual suppliers.

## 2. Exact exponent and arbitrary-window quantifier (TopWin level_of_tiedWin)
Take any retained ψ and any complex s with σ=Re(s)>1/2. Define m=min(σ−1/2,1/2)>0, θ=1/2+m/2, A=eD+eL+7. Then 1/2<θ≤3/4<1 and θ<σ, even for σ≥1. Choose
    ε=min(ε1/2, m/[2(|A|+1)]).
This is strictly positive, less than ε1, and Aε≤|A|ε≤m/2. No sign premise A≥0 and no upper bound on ε1 needed. Now select Fm for this ε and obtain the above estimate from h112 with threshold X. Given arbitrary Y0, use HasWindows with lower endpoint max(Y0,X,1); obtain Y≥that endpoint and [Y,Y^la]⊆Win. For every y therein, y≥1, hence
    Λ.Gm(y) ≤ y^(1/2+Aε) ≤ y^θ.
Therefore HasWindows {y | Λ.Gm(y)≤y^θ} la. This uses existence of arbitrarily far windows, not eventual validity for all y. Taking Y≥1 is essential for exponent monotonicity and avoids empty reversed real-power intervals. Apply FormBAt la with 0<θ<1; since θ<σ, L(ψ,s)≠0. All quantifiers match source. This is a conditional proof of Λ.ZeroFreeLevel. No exceptional real zero or pole has been ignored: the analytic criterion retains positive real residue, the family admissibility below, and RUN12–16 analytic hypotheses.

## 3. Actual analytic junction and logical direction
P PrimitiveCosets/Imports.lean formB: LevelFamily gives a finite CharFamily indexed by Λ.KEPT, weights 1 at PChar.one and Λ.wt otherwise, positive by source. A primitive trivial character has conductor equal to its level and conductor 1, so is level 1; hence every other member is nonprincipal, as required by CharFamily.adm. Sum identity includes the zeta term exactly once, and ZeroFree F θ iff Λ.ZeroFreeAbove θ by index subtype equivalence. Set δ=la−1>0 (δ=1/2 for plugWin) and C=1. The identity 1+δ=la translates the exact window; apply Deduction.zeroFree_of_rpow_window, then transfer the conclusion by the family equivalence. No need for a global upper bound, absolute bound, or converse criterion.

The source call direction is
  plugWin -> zeroFreeAll_of_topG -> zeroFreeOn_of_tiedWin_cyc -> zeroFreeOn_of_tiedWin -> level_of_tiedWin (uses supplied FormBAt).
  zeroFreeAll_of_topG -> formB -> zeroFree_of_rpow_window -> lemmaL.
  zeroFreeAll_of_topG -> level_gm_le_on_family_scales -> windowInequality_of_artinInputs -> core_gm.
These are explicit source term references/argument transport, not kernel-level edges. Mathematical implication runs from arithmetic supplier + analytic theorem to zero exclusion, not vice versa. Root source segment riemannHypothesis -> rhOfAll -> allChi -> FinalTheorems.everyCharacter -> everyCharacter_of_row -> every_character_of_literature_of_vWin is inspected; the latter calls every_character_of_theta_integrals_local_matching. EveryCharacterE has an explicit plugAll invocation but exact intervening declaration path and value-role witness still outstanding. Do not assert whole Main reachability solely from this adjacency. Imprimitive transfer is subsequent; do not apply principal-pole exclusion backwards.

## 4. Revision comparison
At H clump L1202–1208 lemmaL and L1228–1231 zeroFree_of_rpow_window use θ≥0, with no θ<1 premise. H formB L1248–1306 passes hθ0.le; retains the external FormB shape. H TopWin L81–106 retains the pinned θ choice and tied window composition. P still requires 0<θ<1. The present argument satisfies both versions, no need to change pins or assume wholesale equivalence. H proof refactors level_family into formB; do not count as missing solely from path relocation.

## 5. Reproducible source checks and finite algebra
Each row is [revision, path, Git blob SHA, anchors]. Reproduce with git show REV:PATH, git rev-parse REV:PATH, checking the recorded line snippets. No Lean elaboration executed.
```json
[
 {
  "ref": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "path": "src/Main.lean",
  "sha": "dbd5db70bc11b35f18fa5751216ab335321e7bfc",
  "anchors": [
   {
    "line": 4,
    "text": "riemannHypothesis : RiemannHypothesis := rhOfAll"
   }
  ]
 },
 {
  "ref": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "path": "src/Supplements/Kernels/MainTheorems.lean",
  "sha": "6a542d7ce969a791fd12ce575f587e6bc29044bf",
  "anchors": [
   {
    "line": 9,
    "text": "rh_of_every allChi"
   },
   {
    "line": 7,
    "text": "UpperTheory.FinalTheorems.everyCharacter"
   }
  ]
 },
 {
  "ref": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "path": "src/Development/AutomorphicArithmetic/CharacterBoxes/MainConclusion.lean",
  "sha": "ee340012ab19713a8acfecf8adc6a331cbc2f1a4",
  "anchors": [
   {
    "line": 8,
    "text": "every_character_of_literature_of_vWin"
   },
   {
    "line": 11,
    "text": "galoisLocalGlobalStrong_recParameter"
   }
  ]
 },
 {
  "ref": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "path": "src/Development/AutomorphicArithmetic/CharacterBoxes/EveryCharacter.lean",
  "sha": "6ac769568b67f85f33565ba3e1eef7b91f53c55f",
  "anchors": [
   {
    "line": 10,
    "text": "zeroFreeAll_of_topG (la := 3 / 2)"
   },
   {
    "line": 18,
    "text": "imprimitive (UpperTheory.Top.plugWin"
   }
  ]
 },
 {
  "ref": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "path": "src/Development/AutomorphicArithmetic/CharacterBoxes/ZeroFreeAllOfTopG.lean",
  "sha": "54d1b4b84e8c4b97c98379f0bf1bd6bf2f3b2da1",
  "anchors": [
   {
    "line": 28,
    "text": "zeroFreeOn_of_tiedWin_cyc"
   },
   {
    "line": 29,
    "text": "UpperTheory.Comparison₂.formB"
   },
   {
    "line": 33,
    "text": "eFamC_of_cls ψ la Fm c, c.1, d"
   }
  ]
 },
 {
  "ref": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "path": "src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/TopWin.lean",
  "sha": "a6ac464a67f99a546566ee3a3e0fd1db1f4c2550",
  "anchors": [
   {
    "line": 75,
    "text": "exists_small_eps (eD + eL + 7)"
   },
   {
    "line": 79,
    "text": "max x1 1"
   },
   {
    "line": 88,
    "text": "level_of_tiedWin c (d la b) e"
   }
  ]
 },
 {
  "ref": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "path": "src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/Window.lean",
  "sha": "099d96fec932b03a505ea79a81c45bcc3fbf0ea3",
  "anchors": [
   {
    "line": 8,
    "text": "∀ y : ℝ, ∃ Y : ℝ"
   },
   {
    "line": 13,
    "text": "h (max y x0)"
   },
   {
    "line": 25,
    "text": "0 < θ → θ < 1"
   }
  ]
 },
 {
  "ref": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "path": "src/Development/AutomorphicArithmetic/PrimitiveCosets/WindowInequalityOfArtinInputs.lean",
  "sha": "c349e34925ac26b8bc76bd36e9b91562f86d6b8d",
  "anchors": [
   {
    "line": 22,
    "text": "max x1 (max x0 xE)"
   },
   {
    "line": 21,
    "text": "core_gm Λ eD eL K cHH eK C eps he"
   }
  ]
 },
 {
  "ref": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "path": "src/Development/AutomorphicArithmetic/PrimitiveCosets/LevelGmLeOnFamilyScales.lean",
  "sha": "de994949e6fd2d7238cfcb1c19d361ccdfe904fc",
  "anchors": [
   {
    "line": 30,
    "text": "windowInequality_of_artinInputs"
   },
   {
    "line": 13,
    "text": "tiedCore_of_chainTied"
   }
  ]
 },
 {
  "ref": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "path": "src/Development/AutomorphicArithmetic/PrimitiveCosets/Imports.lean",
  "sha": "2dc9b4e690951c66ffe443e279fcada259bcce13",
  "anchors": [
   {
    "line": 13,
    "text": "zeroFree_of_rpow_window F (δ := la - 1) (C := 1) hθ0 hθ1"
   },
   {
    "line": 12,
    "text": "rw [← hZ]"
   }
  ]
 },
 {
  "ref": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "path": "src/Development/AutomorphicArithmetic/PrimitiveCosets/LevelFamily.lean",
  "sha": "d08c25d0cb674297482bec9a235401c14bfb22fa",
  "anchors": [
   {
    "line": 12,
    "text": "level_family_wt_pos"
   },
   {
    "line": 19,
    "text": "level_family_adm"
   },
   {
    "line": 42,
    "text": "Deduction.ZeroFree F θ ↔ Λ.ZeroFreeAbove θ"
   }
  ]
 },
 {
  "ref": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "path": "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean",
  "sha": "2ed00ad3aa862f3e522686557fb8f559b17fc002",
  "anchors": [
   {
    "line": 11,
    "text": "(hθ : 0 < θ) (hθ1 : θ < 1) (hδ : 0 < δ)"
   },
   {
    "line": 14,
    "text": "lemmaL F hθ hθ1 hδ"
   }
  ]
 },
 {
  "ref": "27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59",
  "path": "src/Development/AutomorphicArithmetic/CharacterBoxes/ZeroFreeAllOfTopG.lean",
  "sha": "c3bcece31e76be6368af5af4647f1ad30012fd3b",
  "anchors": [
   {
    "line": 1228,
    "text": "theorem zeroFree_of_rpow_window (F : CharFamily) {θ δ C : ℝ} (hθ : 0 ≤ θ)"
   },
   {
    "line": 1231,
    "text": "lemmaL F hθ hδ"
   },
   {
    "line": 1300,
    "text": "hθ0.le (by linarith)"
   }
  ]
 },
 {
  "ref": "27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59",
  "path": "src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/TopWin.lean",
  "sha": "9cda00fdcd8975f638995190ed0182cd97cced33",
  "anchors": [
   {
    "line": 88,
    "text": "exists_small_eps (eD + eL + 7)"
   },
   {
    "line": 101,
    "text": "level_of_tiedWin c (d la b) e"
   }
  ]
 }
]
```
Finite BigInt arithmetic with exact rational comparisons and integer threshold cases, executed in V8 (replace final console.log with standard Node invocation). This checks only the parameter/threshold algebra; it is NOT numerical evidence about L-function zeros or native arithmetic family existence.
```js
function certificate(){let n=0,w=0,controls=0;const ck=(b,m)=>{if(!b)throw Error(m)}; // use common denominator 2D for sigma and theta, eps as positive rational eN/eD
for(let D=2n;D<=40n;D++)for(let S=D+1n;S<=4n*D;S++)for(let C=-20n;C<=20n;C++)for(let E of [1n,2n,7n]){ // sigma=S/(2D), eps1=E/10; gap=min(S-D,D)/(2D)
const M=S-D<D?S-D:D,T=2n*D+M; // theta=T/(4D)
const a=C<0n?-C:C;let en=E,ed=20n;const bn=M,bd=4n*D*(a+1n);if(bn*ed<en*bd){en=bn;ed=bd}
ck(en>0n&&en*10n<E*ed,"epsilon");ck(T>0n&&T<4n*D&&T<2n*S,"theta");ck(C*en*4n*D<=M*ed,"exponent");n++}
for(let y=-12;y<=12;y++)for(let x1=-12;x1<=12;x1++)for(let extra=0;extra<=12;extra++){let Y=Math.max(y,x1,1)+extra;ck(Y>=y&&Y>=x1&&Y>=1,"window threshold");w++}
ck(2n*3n>4n,"unrestricted eps can exceed gap");controls++;ck(1n<2n,"zero gap excluded by strict sigma premise");controls++;ck(1/2**0.5<1&&Math.pow(.5,1)<Math.pow(.5,.5),"base below one reverses exponent order");controls++;return{rational_parameter_cases:n,window_threshold_cases:w,controls}}
console.log(JSON.stringify(certificate()));
```
Actual output {"rational_parameter_cases":302211,"window_threshold_cases":8125,"controls":3}; 14 source blobs / 32 literal anchors matched. No added assumptions. Third control demonstrates base restriction; first control is example of exponent overshoot. No independent kernel validation or URT advantage shown. No physical gate changes.

## RESUME HERE
Request cached signed-root manifest identities and explicit value-role paths for UpperTheory.Top.zeroFreeAll_of_topG, UpperTheory.Comparison₂.formB, Deduction.zeroFree_of_rpow_window, Formalism.HC.level_of_tiedWin and core_gm. Next reconstruct *exact* remaining intervening call declarations from every_character_of_theta_integrals_local_matching to EveryCharacterE's plugAll (coordinate with theta/editor, no duplicate derivation), then authenticate the path from root using dependency lane's targeted export. Keep core_gm arithmetic inequalities and family construction as independently outstanding premises until supplied. HANDOFF TO dependencies, kernel, acceleration, theta, editor, integration, prime, audit. Full RH OPEN.
