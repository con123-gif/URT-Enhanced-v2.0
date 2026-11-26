# RUN62 — finite Weil cocycle, exact support and four-orbit sign
26 November 2026. HUMAN-DERIVED / SOURCE-MATCHED, pending independent audit and native replay. This supplies the finite representation-law obligation left in RUN61 (825590bbc046023da6d59ea5d5f9727abecc3615), not a new RH proof or a claim of root closure. Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.

Preflight: current mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion-first, primitive closure and sole URT allocation), manuscript 9870fca9396c2306122e15b676aeef4b71233d74 (live retained finite Weil cocycle), SWARM_PROTOCOL 4b77b161d6876915c15cea5a4d4a519beaf5de74, AGENTS 8db0201da965541e0487d6dd1271e010bdaa0972, HANDOFF_QUEUE bbc46df7d7716a6d8863275b5271801eacfaad0d; research state/log/protocol and continuity initial sections checked. Latest orchestrator summary b1f0baef62ec78a8715e1e8773c22c11fef1e781, run 45887406115, is not evidence of new Lean verification.

## 1. Actual finite quotient and exact phase
Source: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Paths below relative to grh-compact/src. Lib/Weil/Construction/ThetaFunctional.lean b21b5f01564922bbd2ed309ef614111698b2384a lines 21–64; FiniteHeisenberg.lean be448ff4db1da9bfa0fe7bd637272be079be2285 lines 22–82; FiniteMultiplier.lean 7b35474d42010a69abe9ba5868c0fce4d4490efc lines 154–178. The longer same-pin grh/src/Lib/Weil/Construction/FiniteCocycle.lean 95a1a7150947cec925f4f3b75eeae0bc1fd588 lines 63–256 clarifies the phases and quotient; the compact statements and bodies control the reconstruction.

Write L=Ohat^ι, μ(L)=1, D(g)=finMultiplier(g), ψ=psi0, c0=traceOneAdele, x*y=hermitian dot product. Retain the full WeilData, CMType and finite index-set hypotheses. In particular ψ(z+bar z)=1, ψ is trivial on Ohat, c0 integral with c0+bar c0=1, D(g) nonzero, D(g^-1)=conj D(g). Put sc(x)=ψ(c0 x*x/2). For x in L, sc(x)^2=1. For arbitrary x,y,
    sc(x) sc(y) β(x,y) = ψ(bar c0 y*x) sc(x+y).
Indeed the difference of the exponents is -[bar c0 y*x + c0 x*y]/2, a sum of an adele and its conjugate; no division by 2 in Ohat is required. The integrand defining the actual cocycle c(g,s) is
    finVac(sx) finVac(gsy) β(x,y) finVac(x+y)
    = 1_M(x,y) ψ(bar c0 y*x),
where M={(x,y): x+y∈L, sx∈L, gsy∈L}. Unitary invariance of sc and sc(x+y)^2=1 on M give this identity before taking any norms.

M is a compact Ohat-module: a closed subset of s^-1 L × (gs)^-1 L. H=M∩(L×L) is open in M, so Q=M/H is finite. For (x,y),(X,Y) in M with d=X-x and e=Y-y in L, use
    Y*X-y*x = (X+Y)*d - X*d + e*(x+y) - e*y.
The first and third terms are integral by membership in M and d,e∈L. X*d is integral because (sX)*(sd) is a pairing of lattice vectors; e*y is integral because (gs e)*(gs y) is such a pairing. Thus multiplying by bar c0 leaves the difference integral. Define γ(q)=bar c0 y*x at any representative (x,y) of q. Its character value F(q)=ψ(γ(q)) is well-defined, and for t∈Ohat,
    F(tq)=ψ(bar t t γ(q)),  F(0)=1.
If t s^-1 is integral, tx=(t s^-1)(sx) lies in L, and t(x+y) lies in L, hence ty∈L and tq=0. This uses only the s^-1 condition, not a condition on (gs)^-1.

The integrand is bounded on compact support, hence absolutely integrable; product Haar/Fubini and the finite equal-volume cosets give
    I = μ²(H) Σ_Q F(q).
On L×L the x+y condition is automatic, and H=(L∩s^-1L)×(L∩(gs)^-1L). The native saturation measure identity gives μ²(H)=|D(s)|^-2 |D(gs)|^-2. Therefore the definition c(g,s)=D(g)D(s)D((gs)^-1)I implies the exact equation
    c(g,s) D(s^-1) D(gs) = D(g) Σ_Q F(q).             (G)
Both conjugate multiplier pairs cancel their respective inverse squared moduli, with phases intact. This proves the actual exists_gauss_sum_finProjAction output including its quantified annihilation and scaling clauses. Do not replace γ by a globally well-defined adelic quadratic form: only its character value and its scaled character values are independent of representatives.

## 2. Radical, support reduction and split place
ThetaFunctional 69–102, WeilOperators.lean 78ab91ea471ba9b7f57c1955b05e2cf04edaafef lines 33–72; FiniteMultiplier 104–108, 121–126, 193–200; Lib/Adelic/Adeles/LocalComponents.lean bae4e852f02d8f66cb3bbba5fe0e4eabab644555 lines 108–135.

If s∈Kf then t=1 kills Q, so Q={0}, ΣF=1. D(s^-1)=1 and D(gs)=D(g) by integral double-coset invariance; (G) yields c(g,s)=1. In particular c(g,1)=1. The actual projective operators are isometric using precisely c(g,1)=1; the triple identity on the unit vacuum gives |c(g,s)|=1. This is not assuming the desired representation law. The normalized cocycle identity follows from associativity of the operators; its right radical R={s:∀g, c(g,s)=1} is a subgroup. For completeness: for a,b∈R, c(g,ab)=c(g,a)c(ga,b)/c(a,b)=1; if a∈R then 1=c(g,1)=c(g,a^-1)c(ga^-1,a)/c(a^-1,a)=c(g,a^-1). The restricted product decomposition proves R=Gf once it contains Kf and every subgroup supported on one conjugate pair {w,bar w}.

For s supported on a split pair, one may assume (s^-1)_w integral: choose local saturation u with u and (s^-1)_w u integral, and b supported on that pair with b_w=u^-1. Both b^-1 and (bs)^-1 are integral at w, so membership of b and bs in R proves membership of s. This uses the actual local split embedding and saturation, not an assumption that s itself is integral.

For any s supported on {w,bar w}, split g=a b with a supported there and b trivial there. Then b commutes with s and multipliers of disjoint supports multiply. Cancel D(b)≠0 in (G):
    c(g,s) D(s^-1) D(as) = D(a) Σ_Q F(q).          (G_w)
Here Q still comes from the original g,s; no replacement of its definition is needed. Let t be the integral idempotent equal to 0 at bar w and 1 elsewhere. In the split case use the preceding integrality at w; in the nonsplit case w=bar w. In both cases t s^-1 is integral and tQ=0.

For split w, e=1-t acts as the identity on Q but bar e e=0, so F(q)=F(eq)=ψ(0)=1. The exact multiplier phase formula at split support is D(x)=|D_GL(x_cut)|² conj χ_f(det x_cut), where x_cut is the component at w and identity elsewhere. Since cut(as)cut(s^-1)=cut(a), the character factors cancel in D(a)/(D(as)D(s^-1)); the remaining ratio of positive squared norms is positive. Thus (G_w) makes c(g,s) a positive real number. Together with |c|=1 this proves c(g,s)=1, including phases.

## 3. Inert place: eliminate sign ambiguity using algebraic integers
ThetaFunctional 103–116 and GaussSumSign.lean 566ee1f28f107f6ad7374661ffbdadcae36abafc lines 8–24. Exact additional premises: Lib/General/NumberTheory/UpsilonValues.lean 18542b1f3515424a8b876adaa40571b22f3c7810 lines 27–37 (WeilData extends StablyUnram and SplittingChar, υ at fixed-place uniformizers = -1); Lib/Adelic/Adeles/CoprimeValuation.lean dfbe623d47a503fc1fc654731005fda8c9fa1dea 231–246 (primitive 5040th root supplies i,ω with i²=-1, bar i=-i, ω+bar ω=1, ωbarω=2); Lib/General/Algebra/InertResidue.lean 641e43f8b9a3b4f07d8374120051b7a2116cde3f 21–29. FiniteMultiplier 143–152 gives the local power formula. Lib/Adelic/Witt/SpaceOperations.lean 42d0ff55145da26c116891f9822c3a3dfddec57a 178–187 supplies an Ohat-unit ε with bar ε ε=-1.

When w=bar w, the residue involution fixes a finite field of size r and the whole residue field has r² elements. Explicitly the residue characteristic is odd since otherwise ωbarω=0 forces ω=barω=0, contradicting ω+barω=1. Reduction of i²=-1 and bar i=-i then shows the involution is nontrivial. A nontrivial involution of a finite field has fixed field of index 2, with conjugation the r-th power map. Since i has order four, i^r=-i implies r≡3 mod 4. Set R0=-r, so R0≡1 mod 4. The three multipliers in (G_w) are nonnegative integer powers of R0 by the local saturation exponent and υ_inert. Thus for some A,B∈N,
    c R0^A = S R0^B,   S=Σ_Q F(q).
All F(q) are roots of unity: the finite-adele additive character has finite order on each argument (native isOfFinOrder_ψf, AdditiveCharBasic.lean); equivalently a positive integer multiple of the argument of ψ lies in Ohat. Scaling by ε permutes Q and sends F to its conjugate, hence S is real. Since |c|=1 and R0≠0, c=±1.

There is no 2-torsion in Q: tQ=0 and t-2 is a unit (it equals -2 at w, -1 elsewhere), so 2q=0 implies q=0. Multiplication by i acts on Q with square -1 and preserves F because bar i i=1. Every nonzero orbit therefore has exactly four elements. Partition Q into these orbits and {0}. Write
    S=1+4U,  U=Σ_{one representative per nonzero orbit} F(q).
U is an algebraic integer, as a sum of roots of unity. If c=-1 then
    R0^B U = -(R0^A+R0^B)/4.
The left side is an algebraic integer, while the right side is rational and hence must be an integer. But R0^A+R0^B≡2 mod 4. Contradiction. Therefore c=1. This is precisely eq_one_of_orbits and its application in the compact source. No estimate of the magnitudes of individual Gauss sums, no truncation, and no choice of a branch of a square root is used.

This is an exact symmetry reduction of the full Gauss sum to the orbit congruence; it does not assume S itself is positive. In fact the signs of the two powers R0^A and R0^B matter. A norm-only argument fails to distinguish c=-1; dropping the residue congruence also fails (take Q={0}, F(0)=1, R0=-1, A=1,B=0,c=-1). The no-2-torsion guard is essential to this orbit proof: without it nonzero orbits can have length one or two, so the factor four is not justified. 

## 4. Actual consumer and verification boundary
For every g,s, the preceding three cases establish c(g,s)=1 with the same D from finite saturation; hence finAction is the actual multiplier action with trivial cocycle (ThetaFunctional 118–121). Combine its identity with the retained realAction and product measure under adelicSum to obtain adelicAction (129–168): the real and finite cocycle integrals factor with the original product multipliers, each gives 1, and the product Haar map transports the vacuum. The existing abstract weilRep is then a monoid homomorphism (WeilOperators 66–76). This discharges the specific representation-law dependency of RUN61's finite-vacuum permutation and manuscript's same-witness semilinear comparison, without using the final RH theorem. Retain the actual real-action/Fock, self-duality, normNegOne and saturation inputs, global theta-functional existence/uniqueness and downstream theta-space suppliers. No global dependency deletion or change in axioms asserted.

URT candidate: phase-by-phase harmonic search/truncation has no role once exact four-orbit invariance is proved. Norm-only search cannot decide the sign; the direct algebraic-integer congruence resolves it without search. No measured URT speedup, no synthetic finite test counts, no O(N) claim. Independently checkable symbolic derivation only. Environment command -v lean; command -v lake; command -v elan produced no executable. Proposed native checks (not run):
```lean
import Lib.Weil.Construction.ThetaFunctional
#check eq_one_of_orbits
#check stdLattice.exists_gauss_sum_finProjAction
#check stdLattice.finProjAction_cocycle_eq_one_of_mem
#check stdLattice.mem_cocycleRadical
#check finAction
#check adelicAction
#print axioms stdLattice.mem_cocycleRadical
#print axioms adelicAction
```
No new CI receipt or native kernel closure. External formal certification is distinct from incomplete human reconstruction. Existing protected workflows and prior graphs unchanged.

RESUME HERE: independently audit (G), (G_w) and the inert sign in this note at actual finAction/adelicAction; then reconstruct the real vacuum-action supplier in Lib/Weil/Fock/FockAction.lean and its exact determinant/measure normalization, before extending the global theta-space arguments. HANDOFF TO integration and independent audit: merge sections 1–4 at the finite Weil cocycle dependency of the A/C manuscript; do not wait on URT.