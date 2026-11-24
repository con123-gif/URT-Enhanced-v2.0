# Run 4 — divisor-row compatibility and the exact theta factorisation

2026-11-24. RESULT: SOURCE-MATCHED conditional human reconstruction, with finite algebra regression. Follow the actual hDivG producer left by Run 3, and unpack its thTheta field to the orthogonal-projection argument. No Lean replay, full proof, or URT acceleration claim.

## Continuity and version lock

Read swarm protocols and handoff queue, AGENTS, research state, actual runner log/protocol, continuity, CI summary 45373263454 PASS (physical checks, not RH), character-box Runs 1–3, current integration, theta, Galois, prime-window, kernel, acceleration and math handoffs. The peer theta lane has the coefficient-line/Gram problem, not this coordinate factorisation. Prior rank equality and explicit projection right inverse are retained, not repeated. The shared blueprint is noted in the handoff queue; this run relies on the original source rather than its exposition. Blueprint PDF not independently reread here.

All source paths below refer to leanprover-community/riemann-hypothesis at 40e56bab026552e089d7afcfeff08d2defb9c005. Upstream main now 2d0c622a3464ba41ad98fca9086bab54fb74e303 (commit time 2026-11-24 10:32:46 UTC); old AtHDivGOfMi path returned 404; OpenOrbitOfUnramifiedExponents blob cd72ff6e51662304cba84cfdf0b4881bcb5870a2; LiftCuspFormSpaceThetaMapEqData blob 6dcf961fb69628b653b5c24c718eb6ab5da619ab; TupUsed blob 75d0c9ab4b61ad880ede5f2030dde47a018bd8da. These are changed since pin. No equivalence across revisions established.

## 1. The actual arithmetic producer

OpenOrbitOfUnramifiedExponents.lean 43,54–55,69 obtains BkLaw for every WPt q from q.x.nx.2.1.2.down and applies bk_law_entries_alt with hB and hMi.1; the result is hDivG in the OpenParameterStatements record. Do not use the parallel earlier bk_law_entries for Bundle rather than BundleCondition.

AtHDivGOfMiStatement delegates to at_hDivG_main_alt. AtHDivGOfMi.lean 60–67 passes five real-group propositions to hDivG_linked_of_mIstar2: DiscreteSeriesCover, HarishChandraModules, CasselmanWallach, HarishChandraFinite, CuspRapidDecay. Its signature also requires WeilRepresentationUnitaryPair and DiscreteSeriesExists; these are unused in this particular forwarding body but are retained in the original statement. Fix hL:RecTExists, extension N, SExt S and GeoP Gamma, hence parameter p. Assume hB for every context K and WPt q and the linked MIstar2 row property hM. The result is a linked SlotDivisorCondition on the same parameter.

The mechanism of transfer (37–44) is important: take the same slot S and proof hS from hM; for each selected family and permissible x,hx,i, use the original built-bundle evidence (t x hx i).1. Built.ind recovers a concrete q,b', its BundleWitness w, and the equality he of dependent bundle triples; cast the predicate along he.symm. No new independent family or choice of a new bundle per condition. Local implication hDivG_of_mIstar2 (50–58) works in the real package from w.y.y, then transports by w.y.eq to b.

Specifically the local hypotheses are hC (five propositions above), TwIn x=w.x, intersection/base-change Holds x.R x.F (w.y.intersectionNumber_baseChange), BkLaw of the actual D and MIstar2 on the same realisation. The call pairing_definite_base_vanish_of_miStar2 uses Ok3 1, TypesSep3, WeakCharacterisation, PrimRows3, and the selected sEE and MIstar2. It produces BtVanish, not rationality. Separately divisionPairing_rational_on_rationalPoints' derives RationalMapValues D from hC, Pins and Holds; BkLaw maps that to D.BuRational. These are different necessary inputs to divisionRows_pairing_vanishes_of_rational_pairing_law (BkLawEntries.lean 40–46).

That theorem invokes the second conjunct of divisionCompatible_at_readIdentifications with x.mjH, ex.idx, the rationality just obtained, and BtVanish. Its DivRows3 output is converted via rowConditions_at_companion_from_readings and DivRows3.toG, then divRows3G_iff transports between the Formalism.L2.DIV and GlobalTheory.Cp records. None of these record adapters proves existence of Pins, Holds, MIstar2, BkLaw, or the real-group propositions.

## 2. Separate six obligations, not one unexplained geometric axiom

The actual theorem GlobalTheory.divTied3_read gives a DivDef3 record and a function producing DivRows3. Its dependent parameters are D:D7; finite group G; Pl0,I0,T; family A3; number field Ks with algebra structure over the indicated coefficient extension (Algebra Ks D.what₂.LL); real data R, face F, group comparison cG, base record X0, compatible readings Y,Z,C, sEE, divisor data Xd, JM; Pins R F, Holds R F, five real-group assumptions hC, and the conditional GrpTie from the two group-cardinality identities. The latter is consumed using pins_card_index_ranks. The second conjunct additionally takes MjHTie, IdxDefs, BuRational and BtVanish.

Its six fields (DivisionCompatibleAtReadIdentifications.lean 38–46):
1. sharpRR: the sharp-level Hermitian lattice compatibility from rowLattices_metrics_agree_of_realGroupTheorems.
2. baseRR: the corresponding base-level compatibility from that same theorem.
3. divisionRows_rationalLift: zero-space spanning from zeroSubspace_spanned_by_dataZeroSubspace_lifts.
4. thTheta: hthT, obtained **before** the four added arguments hMj,hIdx,hBu,hBt, by liftCuspFormSpace_thetaMap_eq_data.
5. num: the concrete number identities from numbers_eq_concreteNumbers_at_baseLevel (requires hMj,hIdx).
6. colsBk: rational pairing equals column pairing, consuming hBu,hBt.

This is a useful proof-graph refinement: rationality and base-tuple vanishing are necessary to the full DivRows3 constructor, but not used to establish hthT locally. We must retain them for colsBk and for the full downstream record. This does not prove the four other independent inputs or make MIstar2 dispensable globally.

## 3. Human proof of the theta-coordinate commutative diagram

Fix the same D,G,A3,Ks,R,F,cG,X0,Y,Z with Pins R F and Holds R F. For every i:Fin D.R.m, t:T, and every x in the coefficient-field coordinate space of dimension lDim(D,A3.A,F.P0,F.ψ0,i,t), set j=i+1. Write

    E = lZ0(...,i,t),   P = lPrj(...,i,t),   H = lH(...,i,t)
    A(x) = thetaP(Y.tup(t),j)(jMt(Y.tup(t),j)(Y.eMt(i,t,x)))
    C(x) = R.thG(i,t)(R.jV(i,t)(liftForm(...,i,t,x)))
    B(z) = Z.jW(i)((A3.indefDown(s0Of(R,F)).θ(i,t)) z)
    e = Y.mj.eW(i).

The desired statement is A(x)=B(Px), in the actual complex target space. The source distinguishes the coordinate field D.what₂.LL and the complex target; the jW and reading maps are embedded/semilinear as typed, not claimed to be complex-linear on the coefficient-field domain. The projection formula is valid over the field.

Proof (LiftCuspFormSpaceThetaMapEqData.lean 128–172):
* e is injective, by inj_of_norm_sq using RealDat.nP_pos and Y.mj.eW_norm (23–25); it identifies a read target with the concrete good-form space. T1 states eA(x)=C(x). T1 is not a definition or a general consequence of linearity.
* BlockDat.lf_l_proj obtains IsOrthProj H E P from the selected BlockHyp, built from hH.ok.ok2.conj, irr and lifts i t. Thus for every z, hform(H,Ez,x-EPx)=0 (hform_orth). Write r=x-EPx.
* T2, the theorem liftLevelForm_orthogonal_killed_by_thetaMap, gives C(r)=0. Since liftForm, R.jV and R.thG preserve subtraction, C(x)=C(EPx).
* For z=Px, liftMatrix_computes_lift_rational identifies the complex lift of the rational matrix output with theta applied to cr.toL(z), from hR.lifts0.1 and hR.ratTh. levelFormCoordinateMap_levelZero identifies cr.toL(z) with the level form of Ez. liftWeight_complexPoint_eq_twist identifies the same matrix output with the twist of goodForm. The phase is removed by the actual pin hP.phs i (phase equals one), not by assuming arbitrary phase conventions. Applying Tw.out to the identity gives C(Ez)=goodForm(z lifted by θ), which is eB(z) by eW_jW.
* Consequently eA(x)=C(x)=C(EPx)=eB(Px). Injectivity of e gives A(x)=B(Px).

The two cancellations have different justifications: orthogonal residual annihilation (T2) and target embedding injectivity. Neither follows from the prior right-inverse P E=I alone. The source produces a separate ThDef3 record (independence, spanning, OLatTie via li_span and lat_of); that record is retained as a distinct obligation, not silently absorbed into this equality.

## 4. What actually proves T1 and T2

T1 wrapper invokes thetaP_read. Its body uses used-tuple coverage from hP.char.tup.mu_used, transported by D.plEq.symm and the read maps. The theta adjoint is represented by a tensor map w with membership and lowest-K-type restriction from thetaAdjoint_at_lift_eq_lowestKType_restriction; the theta pin Y.tied.lift.theta connects this to the read target. Via Y.tupT_tup and Y.mtRead, the original input and its reconstructed lowest-type input agree under the injective extV. The difference of tensor maps is in the specified Wall multiplicity subspace and vanishes on every tuple of lowest K-types. LowTypeDetermined.eq_zero_of_lowT then gives equality; injectivity of tensor lift and of the target model finishes T1. This is a source-matched assembly, not a new proof of lowest-K-type determination.

T2 wrapper invokes thG_eq_zero_of_orth. It constructs the Core, eH laws, KFormL, JIsoL, RatZ and the unitary lift hypotheses from Pins, Holds, primitive links, and the family model. It identifies opV(idemOf X) with the twist of eH, which fixes range θ'. The input f0=liftForm(x) is fixed by the level idempotent. Hence goodAt applied to f0 agrees with idemOf X applied to it. For z in the intersection of the preimage of range adjoint θ' with range of the good projector, range_toF and goodR_eq write z as a level-zero coordinate vector. hJ transports the assumed hform(H,Ez,x)=0 to the Hilbert inner product, using the explicit csum_lvlForm identity. theta_eq_zero_of_orth then kills the concrete lift. Tw.out and hP.phs i remove the twist and phase. These are the native premises of T2; arbitrary orthogonality does not imply that an arbitrary map annihilates the residual.

## 5. Quantifier transfer into the rank step

ThThetaG has the exact shape forall i,t, Used0 D(P.I.tup t) -> forall x, A(x)=B(Px) (here P also denotes the selected RowSideFamily in the Lean names, not the matrix). ThTheta is the same statement without the Used0 guard. DivRows3.toG restricts to the guarded case, and DivRows3G.toRows recovers the unguarded form only using TupAllUsed, namely forall t, Used0 D(P.I.tup t). Its source is the actual indefinite realisation Q.charW.tup.mu_used and D.plEq transport (BaseRankEqOfRealisation.lean 29–36), as in Run 2. No extra induction over i or t is needed; a single universal coverage proof discharges the guard for every t. An arbitrary used subset is insufficient.

With the *same* selected bundle and maps from Run 3, the earlier rank proof may use A=B∘P and the separately established surjectivity P. Surjectivity of P is not derived from the commutative diagram and the diagram is not derived from surjectivity. Both are necessary for the composition step (plus Run 2's bijective row map and row-count conditions).

## 6. Source ledger

Prefix T = src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/
Prefix A = src/Development/AbelianVarietyTheory/
Prefix I = A/Proofs/IwasawaDecomposition/
The following 17 connector-reported Git blob IDs were matched in a fresh fetch at the pin; 93 additional literal source anchors were checked (110 total). Anchors are source references rather than elaborated dependency edges.

- T/OpenOrbitOfUnramifiedExponents.lean 23e99cafd00e39835cfea1dba8431620b1bd9605: 43,54–55,69.
- T/AtHDivGOfMiStatement.lean c3166fc7fbc61cab9ee3aea4e97bc4d3f32669d4: 20–21.
- T/AtHDivGOfMi.lean 719d08273c86ce336f1b3a933cb42bf856e3186b: 30–67.
- A/Proofs/GlobalInterpolation/BkLawEntries.lean df437b3d83e05611f2fb1ff00e5043e76d0da17b: 40–46.
- I/RowConditionsAtCompanionFromReadings.lean 88e576fd7cf16e48a5b3b0388d346a1d3f0dbfd2: 14–17.
- I/DivisionCompatibleAtReadIdentifications.lean b6594122a28670a9dca1e61b23f5be9594f7f877: 22–46.
- I/DivisionCompatibleAtReadIdentificationsStatement.lean 177af5c6db7dba139da090fad705db744787566c: 14–15.
- I/LiftCuspFormSpaceThetaMapEqDataStatement.lean 1e4844972e2f5c0238dd34dcaa58bfa9f5dc4560: 9–10.
- I/LiftCuspFormSpaceThetaMapEqData.lean a20be49929e4ff6bd3d51e37e7906f937cafd2ac: 19–25,128–172.
- I/ThetaMapHilbertModelEqConcreteThetaMapFamilyThreStatement.lean 4a0d74d7c7e61dceb29556772123b2653a6706d8: 10.
- I/ThetaMapHilbertModelEqConcreteThetaMapFamilyThre.lean 7be4c6062b527ff56103791bf0ba20ff950bd8c0: 39–86.
- I/LiftLevelFormOrthogonalKilledByThetaMapStatement.lean f0dd303e6d8a6e4e290e8567f7cf38ddfbf2ba7c: 10.
- I/LiftLevelFormOrthogonalKilledByThetaMap.lean 509b52666c58017793f0ea974a7c7afe5b6ce808: 76–151.
- I/LiftMatrixComputesLiftRational.lean 69fe4305219cbaef466a84cab165940b380fd2b4: 173–175,290–303.
- src/Formalism/LocalToGlobal/Divisibility/TupUsed.lean 478364841e4931ae1cf32aa2dd7e2d95253e2336: 56–66,80,135–142.
- A/Definitions/GlobalTwisting/DivRows3GIff.lean 166a6de2b326fbebc98327ba49fa5eeed790cdc4: 123–125.
- T/BaseRankEqOfRealisation.lean 73832da09224c40d0aed60316629b1b80d6c55d1: 29–36.

Additional manually read inputs: A/Proofs/DivisorProofs/PairingDefiniteBaseVanishOfMiStar2.lean e0489b746f830aebe4b416e30f2a1bfe8862567c; I/DivisionPairingRationalOnRationalPoints.lean b738c81753e971b9d37c226eecdc46233dea0eca; its Statement wrapper 722b04b5fcb46eeb1b1e87e638686a1f561ada7a; T/MainTheoremPublishedInputsThird.lean d832bbf654cf584acc935f3af621f96ec60c5953. Source replay: git show PIN:path and git hash-object --stdin, verify all listed hashes and cited ranges. Source anchors checked include Built.ind, cast this.symm, w.y.eq, hB(divisionPairing_rational_on_rationalPoints'), thTheta := hthT, BlockDat.lf_l_proj, T1, T2, hform_orth, liftMatrix_computes_lift_rational, levelFormCoordinateMap_levelZero, liftWeight_complexPoint_eq_twist, hP.phs, Tw.out, eW_injective, LowTypeDetermined.eq_zero_of_lowT, theta_eq_zero_of_orth, and thTheta_of_G hU h.thTheta.

## 7. Executed exact finite regression

This is a finite algebra test, not a substitute for the actual number-field or theta objects. Test projection onto a nonzero vector E in Q^3 with positive diagonal H and P=E^t H/(E^t H E), clearing denominators. The factorising map uses a fixed two-component output (2,-3). Negative controls: a nonzero orthogonal residual can survive an unrelated coordinate map; a noninjective target comparison can hide inequality; a proper used-tuple subset permits false unguarded conclusions. Actual V8 test (replay in Node):

```js
const dot=(a,b)=>a.reduce((s,v,i)=>s+v*b[i],0);
const vectors=[];for(let a=-2;a<=2;a++)for(let b=-2;b<=2;b++)for(let c=-2;c<=2;c++)vectors.push([a,b,c]);
let cases=0,orth=0,factors=0,negativeAnnihilation=0,negativeNoninjective=0,guards=0,guardNeg=0;
for(const E of vectors){if(E.every(v=>!v))continue;
 for(let h1=1;h1<=3;h1++)for(let h2=1;h2<=3;h2++)for(let h3=1;h3<=3;h3++){
  const w=E.map((v,i)=>v*[h1,h2,h3][i]),d=dot(w,E);if(d<=0)throw Error("positive");
  for(const x of vectors){const num=dot(w,x),r=x.map((v,i)=>d*v-E[i]*num);
   if(dot(w,r)!==0)throw Error("orthogonality");orth++;
   const a=[2*num,-3*num],b=[2*dot(w,E)*num,-3*dot(w,E)*num];
   if(a.some((v,i)=>v*d!==b[i])||dot(w,r)!==0)throw Error("factorization");factors++;cases++;
   if(r.some(v=>v!==0))negativeAnnihilation++;
  }
 }
}
for(let a=-2;a<=2;a++)for(let b=-2;b<=2;b++)for(let c=-2;c<=2;c++){if(b!==c){const u=[a,b],v=[a,c];if(u[0]!==v[0]||u[1]===v[1])throw Error("negative");negativeNoninjective++;}}
for(let n=1;n<=8;n++)for(let mask=0;mask<(1<<n);mask++)for(let truth=0;truth<(1<<n);truth++){
 if((mask&truth)!==mask)continue;guards++;const all=(1<<n)-1;if(mask===all&&truth!==all)throw Error("guard");if(mask!==all&&truth!==all)guardNeg++;
}
console.log({cases,orth,factors,negativeAnnihilation,negativeNoninjective,guards,guardNeg});
```
Observed cases=418500, orth=418500, factors=418500, negativeAnnihilation=405648 (nonzero residual witnesses), negativeNoninjective=100, guards=9840, guardNeg=9330. No failures. No original hypotheses removed. Source anchor checks are static, not an independent elaboration. No full-proof denominator or URT speed claim; no physics files changed.

RESUME HERE: follow GlobalTheory.T.zeroSubspace_spanned_by_dataZeroSubspace_lifts from divTied3_read (line 43) into ZeroSubspaceSpannedByDataZeroSubspaceLiftsStatement and its actual implementation; prove why the same rational level-zero coordinate image spans the complex Z0, distinguishing a span equality from pointwise surjectivity over the number field. Preserve tuple guard and Pins/Holds hypotheses. Coordinate lowest-K-type and unitary theta leaves with theta lane; do not repeat the factorisation, projection right inverse, or rank equality. The other five record fields remain explicit dependencies at their respective source proofs.
HANDOFF TO: integration, proof editor, formal audit, theta, Galois and math. Mark the hthT local argument source-matched conditional, and preserve every remaining field of DivRows3 and the upstream MIstar2/BkLaw/real-group inputs.
