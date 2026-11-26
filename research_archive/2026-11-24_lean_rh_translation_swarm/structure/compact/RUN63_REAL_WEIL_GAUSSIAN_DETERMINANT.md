# RUN63 — real Weil cocycle by one exact block determinant

26 November 2026. HUMAN-DERIVED / SOURCE-MATCHED; independent audit and native replay pending. Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude. This is the real-action supplier left in RUN62 (ce737b234ea5aa8d7d89ac27669731649fe9f25f), and is used with its finite-action conclusion at adelicAction, not a proof of RH by itself.

Preflight: mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion-first, sole URT allocation), current manuscript d6bcd68693074c5d4220541d68c61a222287cb42, SWARM_PROTOCOL 4b77b161d6876915c15cea5a4d4a519beaf5de74, AGENTS 8db0201da965541e0487d6dd1271e010bdaa0972, HANDOFF_QUEUE bbc46df7d7716a6d8863275b5271801eacfaad0d; initial research state/log/protocol and continuity read. Orchestrator summary 3e615af9fbb34a34848889a3b0676a0167ed6320 reports run 45894031998, not new Lean verification. Latest peer Landau e1e5b353 (integral frame/Eichler) concerns a distinct supplier. No prior files edited.

## 1. Native premises and the normalized Gaussian

Source pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Paths relative to grh-compact/src. FockAction.lean (Lib/Weil/Fock/) f2a0545bf5c404049acfd55205c8b19b6841dc0a, realAction lines 23–50; FockVacuum.lean 1588e00d7d10acc78160d31ae357fe4f4dc117cc; Lib/General/LinearAlgebra/HaarUnique.lean 5eacfd5a30e8994cd2be39c8a11f3a9a6414c684, integral_gauss and map_mulVec_haar; Lib/General/LinearAlgebra/HuaIntegral.lean, realHeis, realVac, posProj, principalMinor_sign and inverse formulas (principalMinor_sign_eq_det is in FockVacuum). Lib/DiscreteSeries/Haar/UnitaryNorm.lean 8b8e1396db15092582d473497d7a29b3c1f43059 supplies U.norm_det.

Let n be the finite coordinate count, S the diagonal sign involution, P=(I+S)/2 and Q=I-P. Thus P,Q are complementary orthogonal projections. Let g,h preserve S under conjugate transpose, and k=gh. Each is invertible, with |det g|=|det h|=|det k|=1 (take determinants in g* S g=S). Consequently each preserves the actual normalized Lebesgue measure dμ(z)=π^(-n)dλ(z), since the real Jacobian of a complex linear map is |det g|². The Heisenberg bicharacter is β(x,y)=exp((y*Sx-x*Sy)/2), invariant under simultaneous action. Vacuum e(x)=exp(-x*x/2); T(v)=P+Qv and Δ(v)=conj det T(v). T(v) is block lower triangular relative to P,Q with diagonal I and the negative-negative principal block of v. Since v^-1=S v* S, its negative block is the adjoint of that of v, and Δ(v^-1)=conj Δ(v). Δ(1)=1 and Δ is continuous. No Euclidean unitarity of g,h is assumed.

For an accretive complex matrix A (A+A* positive definite), the exact integral with this normalization is ∫exp(-z*Az)dμ(z)=1/det A. Here is a human proof of the unshifted case used in realAction, following the native congruence idea. Write A=B+iC with B positive definite and C Hermitian. Diagonalize B^(-1/2) C B^(-1/2) by a unitary V, with real eigenvalues t_j. Set W=V* B^(1/2), so A=W* diag(1+i t_j)W. The integrand is absolutely integrable, bounded by exp(-λ_min(B)||z||²). Changing variables by W and applying Fubini gives |det W|^-2 times the product of the scalar integrals. In polar coordinates each equals ∫_0^∞ exp(-(1+i t_j)s)ds=(1+i t_j)^-1, since dλ/π and s=r². Thus the product is exactly 1/det A, not 1/|det A|. This also proves det A≠0. The empty-coordinate case uses the empty determinant and product 1. No analytic continuation or harmonic truncation is needed. This is only the unshifted specialization; do not discard other uses of the shifted native theorem.

## 2. Exact matrix factorization at the actual cocycle

The realAction cocycle integral is

 I(g,h)=∫∫ e(hx)e(ky)β(x,y)e(x+y) dμ(x)dμ(y).

Expanding the exponent, with z=(x,y), gives exp(-z*Az), where

 A = (1/2) [[h*h+I, 2P], [2Q, k*k+I]].

In particular the two off-diagonal blocks differ; replacing β by its absolute value would change A. Put J=diag(h,k). Then A+A*=J*J+[[I,I],[I,I]], which is positive definite because J is invertible and the second term has quadratic form ||x+y||²≥0. Hence Fubini applies and the realCoordSum measure is exactly the product normalized measure; the dimension is 2n and the scaling is π^(-2n). By the previous section I(g,h)=1/det A.

The following direct block calculation explains the native factorization before determinants. Set H=T(h)=P+Qh, C=T(k^-1)k=Pk+Q, D=T(g^-1)k=Pk+Qh. The actual identity in FockAction is

 A = [[H,Q],[0,C]]* [[P,-Q],[I,I]] [[I,I],[-H,-H+D]].       (F)

Indeed the last two factors multiply to [[H,P],[I-H,C]], using QH=Qh and QD=Qh. Multiplying on the left gives blocks
 H*H, H*P, QH+C*(I-H), QP+C*C.
Now H*H=P+h*Qh=(h*h+I)/2 by h*Sh=S; H*P=P; QH+C*(I-H)=Qh+(k*P+Q)(Q-Qh)=Q; QP+C*C=k*Pk+Q=(k*k+I)/2 by k*Sk=S. This proves (F) in every signature, including P=0 or Q=0, before applying any determinant inequality.

The middle determinant is 1 (subtract the first block column from the second, or use the lower-right identity Schur complement P+Q=I). The last determinant is det D (subtract the first block column from the second). Thus
 det A = conj(det H det C) det D
       = Δ(h) conj(det T(k^-1)) conj(det k) det T(g^-1) det k
       = Δ(h) Δ(k^-1) Δ(g).                            (D)
The last equality uses |det k|²=1 and the inverse-minor relation, retaining the phase. All multiplier factors are nonzero: alternatively to the native inverse-minor argument, set g=I in (D) and use det A≠0, obtaining |Δ(h)|²≠0 for every h. There is no circular assumption of the cocycle.

Consequently the actual real multiplier cocycle is
 Δ(g)Δ(h)Δ((gh)^-1) I(g,h)=1.
This is the last field of realAction; the other fields are the continuous form- and Haar-preserving action, continuous multiplier, value at identity and inverse relation already checked above. Retain the IsVacuum instance below. The identity contains no bounds, eigenvalue search, or individual Gaussian phase choice.

## 3. Vacuum and actual adelic consumer

FockVacuum supplies the real vacuum instance; its basic reproducing identity can also be seen directly. In native holCoord ζ(y)=conjugate y on positive coordinates and y on negative coordinates. Expanding the exponent gives
 β(y,x)e(x-y)=e(x)e(y)exp(ζ(y)*ζ(x)).
Thus ∫e(y)β(y,x)e(x-y)dμ(y)=e(x), since each scalar Gaussian times the exponential of a one-sided complex linear term has normalized integral 1 (angular integration annihilates all positive degrees; absolute integrability follows from Gaussian domination of exp(C||y||)). The stronger two-point translated kernel identity follows by substituting y→y+a and bicharacter covariance of the kernel; equivalently apply the reproducing formula to β(a,y)e(y-a), factoring β(a,x) after translation. This is the same vacuum, with e(0)=1, e(-x)=conj e(x), |e|≤1, ∫|e|²=1, e integrable and continuous. For its exponential-weight integrability use C||y||-||y||_2²/2≤C²-||y||_2²/4 (||y||≤||y||_2, C≥0; for C<0 the estimate is immediate). This supplies the Gaussian domination in FockVacuum, not a new Schwartz space or altered measure.

Actual downstream: Lib/Weil/Construction/ThetaFunctional.lean b21b5f01564922bbd2ed309ef614111698b2384a, adelicAction lines 145–168, combines realAction (on the block group of archimedean places) with RUN62's finite finAction via adelicSum. The product measure is precisely vacuumMeasure; each bicharacter and vacuum factors, and the multipliers multiply by the block principal-minor identity. Absolute integrability follows from the real Gaussian estimate and compact finite support. Fubini therefore gives cocycle 1 at the actual adelic action. WeilOperators.lean 78ab91ea471ba9b7f57c1955b05e2cf04edaafef, weilRep, weilRep_heisOp and conj_delta_mul_weilRep_vacElem, then give the representation law and intertwiner used in the common comparison-line argument. In particular the vacuum coefficient at zero is 1/conj Δ(g), with Δ now the actual adelic multiplier. Keep the existing finite proof, orthogonal-sum/abstract model results, arithmetic/CM suppliers and theta functional existence/uniqueness separate. This is a human-derived supplier at the native caller, not a global proof-graph deletion.

## 4. Failed candidate and verification boundary

URT/harmonic angular ranking offers no reason to search when the determinant factorization (F) is exact. A norm-only replacement would lose the phase: in the one-coordinate negative signature, h=1 and g=k=e^(iθ), Δ(k^-1)Δ(g)=1; for general g,h in mixed signature the product in (D) need not be positive real. Already the scalar accretive A=1+i has Gaussian integral (1-i)/2, not 1/√2. The angular orthogonality in section 3 is exact, not truncation. No URT speedup or asymptotic complexity claim, no synthetic diagnostics. Same-pin long readable FockAction path returned 404; compact source alone controls this argument. Native engines on old toolchain are not proof of this new source. No new Lean run, CI receipt or kernel closure. Suggested native checks, not executed:
    import Lib.Weil.Fock.FockAction
    import Lib.Weil.Construction.ThetaFunctional
    #check integral_gauss
    #check realAction
    #check adelicAction
    #print axioms realAction
    #print axioms adelicAction

RESUME HERE: integrate (F)–(D) at realAction and adelicAction, then derive the actual rational Heisenberg dual-family and quotient Fourier coefficient identities in ThetaFunctional.lean (isDualFamily_beta_sq, IsRatInvariant.quotMean_eq, hasSum_modelInner), retaining rational lattice self-duality and the Wiener supplier; check against existing RUN55 convergence note rather than duplicate it. HANDOFF TO integration and independent audit: this exact determinant and Gaussian argument, in conjunction with RUN62, supplies the real and finite trivial-cocycle inputs to the same adelic action. Do not wait for URT. External certification is distinct from our incomplete human reconstruction.
