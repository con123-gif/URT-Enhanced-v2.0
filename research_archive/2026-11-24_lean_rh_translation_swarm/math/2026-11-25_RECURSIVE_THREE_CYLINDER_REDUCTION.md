# Full Lean recursive reduction: three one-sided counts with polynomial slack suffice for LinkIRR
25 November 2026. Status: source-matched human replacement implication, conditional; no Lean replay, no RH proof, no URT. User explicitly requests recursively removing redundant mathematical issues from the full Lean proof. Read updated ONE_EQUATION_MISSION (3bc50a36), latest peer commits including 91a5aa50 (Green weight comparison), 15f1c982 (K-theory alternative), 0ea93dcb (CountI integer), 223e6835 (signed prime signal), and actual pinned source below. This is a local theorem replacement in the actual TopG route, not a claim that all global uses of cylinder counts may be deleted.

## Source and exact consumers
Pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005.
- src/Formalism/LocalToGlobal/GlobalTheory/IrreducibleOfCountSizes.lean (2efa6ef6c2656baf12829c32a79a363cbee84f22): CountAllRows requires every k and every subset S of Tup D k, with two-sided relative error epsC; WeightAllRows requires nonnegativity and upper weights for all finite bad-label sets.
- src/Formalism/LocalToGlobal/GlobalTheory/ConcNP.lean (46c3d780cdf9e5173a57f8c0c82f674ccd64eed2): delp_of_allRows uses hcount only at (0,univ) and the two sets Sk below. It destructures LabelCountGoodInjective into hT3a,hinj,hlab,hgood and never uses hlab. link_irreducible_all_rows -> delp_of_allRows, linkIRR_of_allRows. weight_numbers_bound supplies the quantitative Wg estimate.
- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/LinkIRROfJoinEx.lean (729b4c2ffec74b50b97d31067c9575a1c1e50767) supplies weights and sizes to linkIRR_of_allRows.
- src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/LinkIrr.lean (278e3fba595f2f3643c163ed6297b12330ef7d51) builds the closed LinkIRR property with Cs=6 from irrC, Green, selection, and eventual counts.
- same directory TopShape.lean (3f791ca182db235c4a8ff582d3f038019320d5cd) shape_closed_link_n_of_green uses irrC,cIc,hcI only in closed_linkIRR_of_join_count, passed to topDesWin. Therefore a replacement of this branch with a proven weaker input is legitimate; other parts of TopShape remain untouched. The generic TopShapeAlt proposition must be specialized or replaced, not claimed to have changed definition.
- src/Formalism/SharpRestriction/LevelLetterCocycles/CylinderCountFamily.lean (f336de094ed6f8dae4cb935a041821612a2c502f) is a separate family consumer and must not silently lose its own hypotheses.

## Exact local reduction
Fix the actual AllRows A at D, T=Fin D.what₂.Dall, good rows exactly image(A.inc) with A.inc injective, goodTuple iff both local labels good. Write n=Dall, m=Drows, dS=DstarE A A.B.e >0. For k=0,1 define B_k={tau in T: not goodAt D k (A.labAll k tau)} and S_k=image of B_k under labAll k. These are precisely native Sk. Set b_k=|B_k|, p_k=locShare D A.eVec k S_k, W_k=Wg with actual host parameters.

Native structural facts imply n>=m and n-m<=b0+b1 by union of bad row sets. The exact label-count identity need only hold for the two S_k cylinders and the full cylinder: dimT(full)=n and dimT(cyl(k,S_k))=b_k. The exact eT_one / DstarE formula supplies model mass dS*p_k for each bad cylinder. No label injectivity on all of T is assumed; multiplicities are counted by the native preimages, not the image size. A.inc injectivity and hgood are retained.

Original CountAllRows plus WeightAllRows imply
 n >= (1-epsC)*dS,  b_k <= (1+epsC)*dS*p_k, p_k<=W_k.
Only these directions are used. In particular, the upper total bound and lower bad-population bounds can be discarded in this branch. The universal local weight nonnegativity is unnecessary for this *final counting inference*: the bad upper inequality itself implies p_k>=0 if its multiplier is positive. Do not remove nonnegativity from the separate upstream local-weight producer, which uses it.

## Stronger replacement: polynomial distortion is sufficient
For each fixed family Fm let eta=Fm.ez>0. Fix any real a,b>=0, independent of x and i in that family (may depend on family). At all sufficiently large x and all i, replace the exponentially precise universal counting assumptions by:
  dS>0, n >= x^(-a)*dS,
  b_0+b_1 <= x^b*dS*(W_0+W_1).
These are two one-sided inequalities, the second can be supplied by two individual upper counts with p_k<=W_k. Retain structural good-row identity and SizesRec with original ranges. For x>=1, n>0; the defining what₂.D_eq gives delp=(n-m)/n>=0. Hence
  delp <= x^(a+b)*(W_0+W_1)
       <= 2*x^(a+b+3*Cs+3)*exp(-x^(eta/6))
       <= exp(-x^(eta/7))    eventually.
The last inequality follows by taking logs: x^(eta/6)-x^(eta/7) dominates log 2+(a+b+3Cs+3)log x, since eta>0. This is exactly LinkIRR at every eligible index, with a threshold uniform in i. Thus epsC(cIc,r,f), its positivity/half-bound proof, symmetric relative counting, hSF share adapter and global all-cylinder quantification are not necessary inputs to this *replacement local LinkIRR branch*. The existing exp-error result is more than enough (for sufficiently large x, epsC<=1/2 and choose a=b=1, x>=2). No new estimate on real geometric counts is proved here.

For an alternative closed-family supplier keep the same quantifier scope as irrC: each family eventually has an A for every x,i satisfying the structural identities and these two one-sided estimates with fixed family exponents. Apply the elementary argument familywise, then use the original Closed.imp/closed_of_mem pattern. A new Lean proof of that specialized assembly remains to be written. Original TopG's other suppliers, CountI/II/V, and prime inequality remain unproved by this simplification.

## Executed source checks
Via GitHub connector/V8 read ConcNP, TopShape, LinkIrr and verified exact source blobs above. In delp_of_allRows body hcount appears exactly 3 times (binder extraction and two use sites, one of the latter universally over k:Fin 2 with Sk fixed); hlab appears only once (destructuring). Manually inspected exact use hcount k ((Sk k : Finset (Tup D k)) : Set (Tup D k)) as well as hcount 0 Set.univ. TopShape irrC and cIc each appear twice (binder and sole call); closed_linkIRR_of_join_count and downstream linkIRR_of_join_ex exact anchors verified. No cohomology or cylinder computations performed, no synthetic matrices, no native kernel replay or CI. Full current peer archive and latest upstream revision not audited; no cross-revision assertions.

RESUME HERE: locate the native producer of irrC for this actual TopShapeAlt route and derive ONLY n >= x^(-a)dS and b0+b1 <= x^b*dS*(W0+W1), with the actual geometric data and uniform family scope. Do not prove the unused lower bad-count and upper total-count inequalities, or expand arbitrary cylinders, unless needed by a distinct retained consumer. Consider direct bad-row rank estimate. HANDOFF TO geometry, theta, integration, editor, audit, dependency. RH OPEN.
