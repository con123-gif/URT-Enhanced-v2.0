# Run 2 — two lifts and CoreAll descent
2026-11-24. SOURCE-MATCHED PARTIAL. Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005; observed main b37b32c236352418f6edf1ed85dd2e4b14420686; no cross-version equivalence claimed. Read coordination and peer checkpoints; physical CI 45352595797 PASS unrelated to this result.

## Source inventory
Under src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/:
- ThetaParseval/TwoUpOKOfSteps.lean 2541114bdfb87393944243f95ca756280bd57e5d
- IntegralStructures/CrystallineDescent/LimOddOfLimFinOdd.lean e4aaa0fc9f7a97c792916cf6346e3fd624fa3268
- IntegralStructures/CrystallineDescent/ToCoreK.lean e4235a62a4bce78539c94be995d8f5a0ff59fac3
- IntegralStructures/CrystallineInputs/CoreAllOfRowStarCore.lean a4054e96f51401b00acb7a5443040abdc94fa549
- IntegralStructures/CrystallineInputs/CoreAllOfRowStarCoreInp.lean 894cd3878a45a90662e07a57502169d65829ca79
- IntegralStructures/Development.lean 4d4d9506494734f28fce7d39bac1a50650ecf148
Under src/Development/AbelianVarietyTheory/:
- Definitions/GaloisGeometry/CyclicStrongAtCusp.lean 8b43b079fcf131124b5d37f7a237c8594e84e0ba
- Proofs/SatakeParameters/CoreAllOfCore.lean 772df3c313452d83df2afe50d8373a098cc1ea92 (parallel adapter, not asserted to be the actual call).

## Human argument
twoUpOK_of_steps requires TLiftK, ChrPairs, UpOf, BaseNG. BaseNG supplies Bs, delta, ideal and geometric data hG,hX,hW. TLiftK supplies threshold d0 and hd. Set t=2(d0+n)+1. Finite range of original weights on infinite places of the maximal real subfield times Fin n gives lower bound b. ChrPairs is applied with weight bound 2b-(n+t), at w0 and its original hypothesis hw0, and supplies kappa,m,chiX,chiW,mX,mW,psi,p and compatibility fields. For each j, unpack eight fields of hj j; apply hd in dimension n+t using the first six fields, original U and weights, and the inequality from a7 and b. UpOf uses a8 to obtain IsUp U lam kappa m U' lam' (psi j) (p j). Choose j=0,1, retain hne,hu,hu' and hκ, and parity he.add_odd. This proves the adapter, not the producers ChrPairs, UpOf or BaseNG. twoUpOK_of_k supplies Chr.chrPairs_holds, upOf, baseNG.

toCoreK applies toCore to that result. Remaining independent inputs are ClosedPhi, DescOffT, LimFinOdd. limOdd_of_limFinOdd specializes using ha.pos and ha; limU_of_limOdd uses ClosedPhi. rowCsd_of combines joinUp_holds, JacquetShalikaRigidity, gk_holds, quadLift strongTC_holds and rigidity, and joinGL_holds hD (joinAll_holds hT (joinU_holds hL)). joinUp_holds uses stepDown_holds, csdLift_holds, ramUnr_holds, oneUs_holds and existence of quadratic CM extension split at place. stepDown_holds uses isoOne, patchOne with oneTower/oneConj, and all four sphDown clauses. joinEnd_holds followed by core_of_rowStarCore gives Core. None of these imported premises is eliminated.

## Core to CoreAll, exact scope
Core = Ex .csd AND for every c:Sph, SphericalLevelCondition .csd c. CoreAll replaces .csd with .all in both fields. SphericalLevelCondition quantifies over CM number field E, algebraic closure Ω, prime l, ring equivalence Qbar l to C, rank a>=1, cusp representation π and Hecke character χ of maximal real subfield, InScope s l π χ, every weakly attached r, every w satisfying PlaceOK s w, every multiset B of nonzero complex Satake parameters with HasSat. Conclusion SphAt c: unr gives Frobenius eigenvalues away from l; dR and crys give respective ClauseAt; phi compares characteristic polynomials of wdAt and satWD for every Weil element, for all local prime, tied Ainf, place-over, ring and bridge data satisfying Induces. satWD uses inverse Satake eigenvalues and twist (1-a)/2. Do not replace spherical conditions with arbitrary ramified compatibility.

Actual adapter coreAll_of_core_inp takes Inp and Core. Ex .good from ex_good_of_ex_csd; unrg and crysg from corresponding csd clauses. Ex .all from ex_all_of_good hI exg unrg. Four branches: unr from unrg; dR from good dR obtained from csd dR; crys from crysg; phi from crysg and good phi (which requires both csd crys and csd phi). CoreAllOfRowStarCore supplies inp_holds. The underlying proofs use twists and inverse twists for csd→good, quadratic CM base change split at w and transport/descent for good→all. Ex .all uses infinite family of quadratic CM lifts, CMBasePatch, cofinite agreement and Frobenius descent. These are separate proof obligations; do not equate existence with compatibility of every weakly attached representation.

## Executed check
V8 finite integer regression: for n=1..100 and d0=0..100, t=2(d0+n)+1 is positive odd and n+t>d0, 10100 cases succeeded. General identity n+t-d0=d0+3n+1 proves inequality for natural d0 and positive n. Replay Python: for n in range(1,101): for d in range(101): assert (2*(d+n)+1)%2==1 and n+2*(d+n)+1>d (use nested lines). Source blob IDs supplied by connector, not independently hashed. No Lean execution, no kernel proof validation, no URT speed claim. Row0.row0b definition still not located; recursive tree response did not expose expected names, so do not infer its weakening conditions.

RESUME HERE: follow actual imports of InertCharpoly/CharPolOfInert.lean and locate Row0, Row0b, Row0.row0b; reconstruct exact place/rank guard weakening and compare with galois_realisation_of_rank_two. Then unpack Inp and inp_holds in InputsOf.lean. 
HANDOFF TO: integration, audit, theta, character-box, proof editor. No physical files changed.
