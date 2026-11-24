# Theta lifts RUN15 — holomorphic coefficient and exact local weight

2026-11-24. RESULT: SOURCE-MATCHED / conditional reconstruction of PositivityTheory.SiegelWeilFormula.AStep.holCoef_pf, both conclusions, with holPhi, local weight, character, group splitting and continuity suppliers. RH project OPEN; no new RH theorem, kernel replay, or URT speed claim.

## Continuity
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state/log/protocol and continuity excerpts; CI checkpoint 395 is general Cathedral PASS only. Read RUN14 in full and inspected latest swarm commit messages, plus recent handoff notes from Landau, prime, integration, editor, geometry, literature, character boxes, math and Galois. Structure/dependency/kernel/acceleration/audit handoff bodies not all recovered (connector commit responses did not expose their Markdown patches); their recent commit messages concern role-aware extraction/scheduling and error budgets, not this theorem. Editor RUN14 incorporation explicitly assigns holCoef_pf to theta. Blueprint identified from queue, not independently reread. No physical queue or gate changes.

Source P=40e56bab026552e089d7afcfeff08d2defb9c005, leanprover-community/riemann-hypothesis. Observed current upstream H=9282d3a102c4aff0e6026746db2a8990f5d9cddd, 2026-11-24 18:24:32 UTC, PR #1313, unchanged from RUN14. At H HolCoefPf.lean returns 404, WeightFactorDilation.lean has blob af33a1646bad1e439bed89dfa516318b09da0f2f, with stab_row:71, det_row:89, weight_factor_dilation:121. This is source-path drift only: no equivalence or deletion claim. H directory listing was not parseable. All mathematical arguments below refer to P, with paths relative to src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/.

## 1. Precise theorem
HolCoefPf:52–58. Fix number fields F,E and Algebra F E, sigma:E→ₐ[F]E, H:Hyps, d:SD sigma, R:RD d, L:LD d, infinite place w, Fourier data hc:CoefData d.b nb lam Gcal, rational Fourier labels T,T' satisfying L.IsSub T T', A:d.G→C continuous and invariant on the left under every gamma in rat2 sigma d.Y. Fix pp,qq natural, e integer, and the pure signature disjunction (pp=d.m,qq=0) OR (pp=0,qq=d.m). For EVERY g the function y↦A(g R.iota(w)y) is IsHolW pp qq e. Write B(x)=fc d.B.psi d.b nb lam Gcal A T x. Then:
(i) for every real tau and every y in GR(d.n) with IsDil (Pi.single L.i0 1) tau y, and every x, B(R.iota(w)y x)=exp(tau*d.m) B(x);
(ii) for EVERY uM,nu,Ucal satisfying L.UData uM nu Ucal, EVERY u and x, B(uM(u)x)=B(x).
No m<n hypothesis in this theorem itself. No assumption B is nonzero, no division by B, and no claim arbitrary mixed signatures meet IsHolW. L.IsSub (LowerRankDatum:121–122) requires both distinguished row and column zero and the exact lower-rank submatrix T'. CoefData and UData are retained as packages, including their measure normalizations. IsHolW (16–18) is representation by a holomorphic function on the positive imaginary matrix domain times F0 pp qq e, evaluated at zOf(y) if q=0 and at -(zOf(y))^H otherwise.

## 2. Fourier averaging preserves holomorphic weight
HolCoefPf:13–50, HolomorphicTheta/HolomorphicAverageUniform:15–68. For fixed x', the Fourier coefficient on x'R.iota(w)y can be written as an average of A(c(beta) R.iota(w)y) times u(beta), where u(beta)=psi(-Tr_AE/AF tr(T beta)). Choose a compact K in the adelic additive unipotent space meeting each rational translate (nF_cocompact). For every beta choose gamma(beta) rational with gamma(beta)+beta∈K. Put c(beta)=nb(gamma(beta)+beta)x'. Rational left invariance and nb_add/nb_rat imply
 A(c(beta)g)=A(nb(beta)x'g).
The character u has modulus one and the restricted measure lam|Gcal is finite (mass one). The image nb(K)x' is compact. Crucially the arbitrary choice gamma(beta) need not be shown measurable: the INTEGRAND is equal pointwise to the original continuous expression in beta for each y. Thus its AE strong measurability follows directly. Apply H.holT.2 to get IsHolW for the coefficient as a function of y.

The actual Holtb.holomorphic_average_uniform producer chooses a holomorphic H_g for each g. Put f(beta,W)=H_{c(beta)}(W)u(beta); H_g(bmap_q(y))=A(g iota(y))/F0(y) because F0(y)≠0. Surjectivity of bmap_q transfers integrand measurability to every W in the domain. For a domain point W0 use bmap_local to obtain a positive-radius ball and a compact set S of local lifts y of all its points. Continuity bounds |A| by K0 on c-space compact × S; continuous nonvanishing |F0| has strictly positive minimum a0 on S. Hence |f(beta,W)|≤K0/a0 uniformly on the ball, using |u|≤1. The finite measure and differentiableOn_integral_of_bdd yield a holomorphic integral of f. Factor F0(y) outside the integral to obtain IsHolW. This is the original compact-lift domination argument, not an unjustified interchange of derivative and integral. bmap_local, bmap_surj, nonvanishing weight and differentiation theorem remain imported obligations. Holtb.holT pairs holomorphic_translation_levi with this averaging theorem; its first member is retained, not assumed from the averaging argument.

## 3. Exact local additive character and splitting
CharacterW1TraceExp:15–41 constructs beta1 from the upper-right frame block of R.iota(w)xN for mR(xN)=nU(h). It satisfies R.iota(w)xN=nb(beta1), cw_w(beta1)=zeta h, all other infinite projections zero and finite part zero. This follows from component formulas and Place.cw_ext, then frame injectivity. The localized Fourier label is
 betaW = -4 pi zeta cw_w(T).
The character identity at 46–103 is psi(tt(T beta1))=exp(i tr(betaW h)). The factor -4pi is exact: the native definition multiplies 2pi by -2. The form relation cw(T)^T+epsilon conjugate(cw(T))=0 holds on the additive subgroup by closure induction, so zeta cw(T) is Hermitian in both branches (epsilon=-1,zeta=1) and (epsilon=1,zeta=i). For Hermitian h, tr(zeta cw(T)h) is real, by adjoint, trace cyclicity and conjugation. The finite/off-w components of tr(T beta1) vanish. Place.psi_trace_at gives the native character phase with the real-part expression; the just-proved reality permits its replacement by the complex trace. No sign or 2π normalization chosen to match a target.

For x' commuting with the local subgroup, use KSing.fc_shift and the character identity to get
 B(x' iota(xN y))=exp(i tr(betaW h)) B(x' iota(y)).
Apply H.holT.1 to the holomorphic function from section 2: if mR(xx)=diag(a,a') and a^H betaW a=betaW, then
 B(x' iota(xx y))=F0(pp,qq,e;xx) B(x' iota(y)).
To obtain a formula at every x, not just specially chosen x', use decW_pf (DilExPf:33–36). Actual suppliers KSplitW.decompW and commW (ThetaSplitting/SplitW:62–92) construct y0 from the w-frame Z_w via conjugation D_zeta Z_w D_zeta^{-1}; let x'=x iota(y0)^{-1}. Its w-frame is I, since iota(y0) has the same w-frame as x. At w this identity commutes with the local subgroup; off-w and at finite projections the local embedding has identity components. Component extensionality and frame injectivity show x' commutes with every iota(y). Thus x=x'iota(y0), and
 B(iota(xx)x)=F0(pp,qq,e;xx) B(x)
 whenever the stated block and stabilizer conditions hold (HolCoefPf:76–81). This uses actual commuting decomposition, not a global commutativity assumption.

## 4. Single invariant-subspace identity for both matrix stabilizers
WeightFactorDilation:13–40. Write beta=betaW and let v be the i0 coordinate vector. L.IsSub implies beta v=0 and v^H beta=0. Any matrix M supported on row i0 is v r for a row r. Therefore beta M=0 and M^H beta=0; expansion yields (I+M)^H beta(I+M)=beta. No diagonal condition is needed for this identity. In particular a diagonal D differing from I only at i0 has D^H beta D=beta (the native stab_diag uses entrywise proof). For local shear determinant, the SEPARATE hypothesis M_i0,i0=0 gives r v=0. The rank-one determinant lemma gives det(I+v r)=1+r v=1 (42–51); equivalently M^2=0 and I+M invertible. Do not silently require invertibility or determinant one for arbitrary row-stabilizer inputs. Source uses replicateCol/replicateRow and Matrix.det_one_add_replicateCol_mul_replicateRow.

## 5. Weight on both branches
WeightFactorDilation:53–90. For a block-diagonal group element diag(a,a'), the group equation InG implies a^H a'=I. The exact weight is
 F0=(det(a)det(a'))^e * det(a')^{-pp} * det(a')^{-qq}.
If det(a)=1, take determinants in a^H a'=I to obtain det(a')=1, so F0=1 for all pp,qq,e. For the single-coordinate dilation D_tau=diag(1,...,exp(tau),...,1), a=D_tau, a'=D_{-tau}; their determinants are exp(tau), exp(-tau), both nonzero. Hence
 F0=exp(tau*(pp+qq)).
The exponent e cancels because det(a)det(a')=1. Pure signature gives pp+qq=d.m; apply the block weight formula and stab_diag to obtain (i). Notice the weight calculation alone works for arbitrary pp,qq; the theorem's pure-signature premise is nonetheless preserved, and one cannot infer the actual holomorphic input for mixed signatures. Compare RUN8: this is the exact exp(tau*m) competing with exp(tau*(2n-m)) at s0, not a fitted weight.

## 6. From a local shear to the entire adelic shear family
HolCoefPf:87–110. B is continuous by fcCont (FcCont:65–98): near x0 choose compact neighborhood N, use the rational translate representatives K and the compact image of K×N under (beta,x)↦nb(beta)x. Continuity bounds A there; since |u(beta)|=1 and measure finite, dominated continuity applies. Rational shear invariance follows from H.fcConj (RUN13), separately from the local condition. To supply H.uEx (RUN14) local condition, fix arbitrary u and y with uM(u)=iota(w)y. UData gives upper block I+S, S=sum_j u_j E_{i0,em(j)}, and some lower block a'. Put M=cw_w(S). The embedding-range premise em(j)≠i0 makes M supported only on row i0 with diagonal M_i0,i0=0. The local frame conjugation D_zeta cw_w(inFrame(iota y)) D_zeta^{-1}=mR(y) makes mR(y) block diagonal, upper block I+M and lower block zeta I cw_w(a') zeta^{-1} I. Thus stab_row, det_row and weight_factor_det_one imply B(iota(w)y x)=B(x). Both rational and local conditions now supplied, H.uEx extends invariance to every u and every x, proving (ii). This explicitly fills the separate local premise previously left open in RUN14. The original normalized Haar and rational density suppliers are not replaced by the row argument.

## 7. Dependency record and reproducibility
Consumer AStep.holCoef in AdelicDilations/DegCut:36–42 forwards the entire statement and hypotheses, with holA:29–32 supplying the pure-signature input from exists_isHolW_iteratedDeriv. Holtb.holT is a named native supplier, not a published black box. These are static source-body call references, not authenticated elaborated dependency edges. Classical rank-one determinant, group factorization, dominated holomorphic integration and Haar Fourier covariance are standard mechanisms; no novel mathematics or external attribution inferred merely from source names. No explicit sorry/admit seen in the displayed targeted proof bodies; no transitive axiom or placeholder audit. Keep the precise local translation Levi theorem, singular Fourier testing producer, character normalization, compact representative domain, topology and bmap local-lift leaves open. No claim that the full proof or this reformulation has been independently Lean checked.

Executed in connector JavaScript: 120/120 literal source line anchors and 9/9 expected returned Git blob IDs matched; zero failures. This verifies provenance only, not mathematical correctness. The following compact replay checks all 9 original file bytes by Git object ID and representative line anchors (not separately run here).
```python
import subprocess
P="40e56bab026552e089d7afcfeff08d2defb9c005"
b="src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/"
rows=[
("AdelicDilations/HolCoefPf.lean","a837d56f6202729ebe9ae87402622de560350bff",[(13,"theorem holPhi"),(44,"H.holT.2"),(52,"theorem holCoef_pf"),(55,"hpq"),(69,"nbw1"),(75,"H.holT.1"),(80,"decW_pf"),(83,"stab_diag"),(88,"H.uEx"),(89,"H.fcConj"),(110,"weight_factor_det_one")]),
("AdelicDilations/WeightFactorDilation.lean","dbef763e7431e8901d7f53cfa7704bee4e37cad9",[(13,"theorem stab_diag"),(24,"theorem stab_row"),(27,"β * M = 0"),(33,"Mᴴ * β = 0"),(42,"theorem det_row"),(51,"det_one_add_replicateCol_mul_replicateRow"),(59,"theorem weight_factor_blocks"),(66,"theorem weight_factor_det_one"),(74,"theorem weight_factor_dilation")]),
("AdelicDilations/CharacterW1TraceExp.lean","00c869282dafb70a8a29c546a42a021717b63f50",[(15,"theorem nbw1"),(43,"def betaW"),(46,"theorem character_w1_trace_exp"),(74,"hAh"),(87,"Place.psi_trace_at"),(92,"Matrix.trace_mul_comm")]),
("AdelicDilations/DilExPf.lean","7ce58e2ad6ad969143b52e74378a56d96f406ef3",[(33,"theorem decW_pf"),(35,"KSplitW.decompW"),(36,"KSplitW.commW")]),
("ThetaSplitting/SplitW.lean","9e524db98a4e669e8c3f608abe1cb1e8d3f0df02",[(29,"theorem cw_iota"),(62,"theorem decompW"),(82,"theorem commW"),(86,"Place.cw_ext")]),
("AdelicDilations/FcCont.lean","cde3c01a796de6eb1cad61b1666f03bc5567f63a",[(65,"theorem fcCont"),(80,"IsFiniteMeasure"),(86,"continuousAt_of_dominated")]),
("HolomorphicTheta/HolomorphicAverageUniform.lean","0fd4083591381494ee126f661b677a56e0ed49d6",[(15,"theorem holomorphic_average_uniform"),(30,"differentiableOn_integral_of_bdd"),(41,"bmap_local"),(45,"exists_isMinOn"),(68,"theorem holT")]),
("AdelicDilations/DegCut.lean","1079d74072e904d278cba232030edc7bee2c9e2a",[(29,"theorem holA"),(32,"exists_isHolW_iteratedDeriv"),(42,"holCoef_pf H")]),
("LowerRankDatum.lean","1d324fa137e699a8f3c49efeaccd9cf1b6f9da5b",[(16,"def IsHolW"),(36,"def HolT"),(117,"def UData"),(121,"def IsSub"),(164,"def UEx")])]
n=0
for path,sha,anchors in rows:
    raw=subprocess.check_output(["git","show",P+":"+b+path])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()==sha,path
    lines=raw.decode().splitlines()
    for i,s in anchors:
        assert s in lines[i-1],(path,i,s)
        n+=1
print(len(rows),"raw blob checks;",n,"representative anchors")
```

## RESUME HERE
Reconstruct the first member of HolT, the exact theorem holomorphic_translation_levi, in src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/CayleyCosetSums/HolomorphicTranslationLevi.lean (imported at HolomorphicAverageUniform:2 and used at 68), focusing on how holomorphicity extends a real unipotent translation character to the full tube domain and implies the Levi stabilizer law; retain both q=0 and q≠0 branches, all positivity/connectedness premises and actual imported lemmas. Do not repeat RUN15 weight, averaging or RUN14 density. Request role-labelled root witnesses for AStep.holCoef_pf, holPhi, stab_diag, stab_row, det_row, weight_factor_dilation, weight_factor_det_one, decW_pf, character_w1_trace_exp, fcCont, Holtb.holT and Holtb.holomorphic_average_uniform. HANDOFF TO theta, integration, editor, audit, kernel, dependencies, acceleration, literature. Project OPEN.
