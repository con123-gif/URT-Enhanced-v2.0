# RUN61 — Finite vacuum normalization and exact semilinear orbit reduction

26 November 2026. HUMAN SOURCE-MATCHED / PARTIAL; not a native replay. Credit the compact proof authors and contributors. Source pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207/grh-compact; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. All upstream paths below relative to grh-compact/src. Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, manuscript blob 1516dd75e274c4ec8e060f618c3aba9384c055e4. Latest peer 2ce507a2 already supplies the semilinear fixed-line and unit factorization argument; do not duplicate it. This note supplies its retained finite vacuum coefficient and gives a direct finite-orbit replacement for the repeated fixed-line argument. RUN60 622fbfec remains unchanged.

## 1. Saturation and the normalization integer

Sources Lib/Weil/Construction/FiniteMultiplier.lean (7b35474d42010a69abe9ba5868c0fce4d4490efc), lines 18–48, 78–119, 154–191. Write A=finite adeles of the CM field E, O=integral adeles, Lambda=O^n; use the actual WeilData. For g in GL_n(A), at each finite place w the elementary divisor theorem over the DVR gives g_w=P diag(pi^a_i) Q, with P,Q integral invertible. Set d_i=max(0,-a_i), u_w=Q^-1 diag(pi^d_i). Then u_w and g_w u_w are integral; u_w^-1=l_w+m_w g_w with l_w=diag(1_{a_i>=0})Q and m_w=diag(1_{a_i<0})P^-1. This is an exact entrywise identity, including a_i=0. At all good places take u=1,l=1,m=0. There are only finitely many bad places, since g and g^-1 are adelic. These choices assemble into the actual Sat witness, not merely a collection of local inverses.

For H=Lambda intersect g^-1 Lambda, uLambda=H: the forward inclusion uses the two integral matrices, the reverse uses u^-1=l+mg. In particular any two saturators differ on the right by an integral invertible matrix, so their determinant valuations coincide. Since chiFin is insensitive to local unit factors (native chiFin_congr; retain the splitting-character hypothesis), Delta(g)=chiFin(det u) is independent of the choice. Its exact positive normalization is

    J=[Lambda:H]=product_w q_w^(sum_i d_i)=|det u|_A^-1=|Delta(g)|^2.

Here q_w is the residue field size and |upsilon|=1. Haar(Lambda)=1 implies Haar(H)=1/J, with J a nonzero integer, not a real approximation.

For inverse g, gu is a saturator: (gu)^-1=m+l g^-1. Thus Delta(g^-1)=chiFin(det g) Delta(g). For conjugate transpose, transpose the local Smith form and conjugate places; elementary divisors are permuted by place conjugation, so the splitting character identity upsilon(star x)=conj(upsilon(x)) and conjugation invariance of the idele norm yield Delta(g*)=conj Delta(g). For g unitary, g*=g^-1 and |det g|_A=1, hence

    upsilon(det g) Delta(g)=conj Delta(g).

These are the native inverse and phase relations; no norm-only substitute for Delta is legitimate.

## 2. Exact finite vacuum sum and its coefficient

Sources Lib/Weil/Construction/FiniteHeisenberg.lean (be448ff4db1da9bfa0fe7bd637272be079be2285) 20–82; FiniteVacuum.lean (b775c3efc7afae92b21402691f615e0dfbf73ee1) 29–80; Projections.lean (7a187f8be18a00b889082b56818393f20a7f88e4) 29–36, 61–62, 111–152, 210–220; PairDefs.lean (8a5eaed1249fcc1c482e3af4f15373682fa34af1) 193–210; WeilOperators.lean (78ab91ea471ba9b7f57c1955b05e2cf04edaafef) 21–23, 66–82; AdelicHeisenberg.lean (6d56fe0aa1762a56778d40f9086f69e721f91b14) 12–16; MixedModel/AdelicSum.lean (49baa2583b79e2ffc4fff7dc791415866c03071d) 252–269. The actual finite part is the span of H(x)v (FinitePart.lean 174ee272107a50267fcde8c0ea06aa73f5572fe5, 16–29, 50–61). In this section use H(x) for the operator and H_g=Lambda intersect g^-1 Lambda for the lattice.

Write v for normalized vacuum, sc(x)=psi0(c0/2 * x*x), H(x)=sc(x)rho(x). Here c0+bar c0=1, c0 integral, and x*x denotes hermitian dot product. The actual character psi0 is trivial on O, psi0(star z)=psi0(z)^-1. Thus sc(x)^2=1 for x in Lambda; indeed its square is psi0(c0*x*x) with integral argument. The vacuum matrix coefficient of rho is 1_Lambda(x)sc(x). Therefore the normalized coefficient of H is exactly 1_Lambda(x). Since H is unitary and the inner form positive definite, H(t)v=v for t in Lambda (the squared norm of the difference is 2-2=0). From the multiplication law

    H(x)H(y)=psi0(bar c0 * y*x) H(x+y)

the vacuum translates over distinct cosets modulo Lambda are orthogonal, and representatives of one coset differ only by a nonzero character scalar. Consequently a finite vector admits an orthonormal coset expansion once representatives are fixed. No assertion of an arbitrary infinite basis or finite truncation is needed.

Evaluate the native Weil integral on v at finite g (real component identity). The normalized Haar measure is the product in adelicSum coordinates (ThetaFunctional.lean, see section 4). The archimedean factor is the identity on its vacuum by the reproducing formula. Fubini is justified by integrability of the vacuum and the norm-isometric Heisenberg translates. The finite integrand is 1_Lambda(y) sc(y)rho(gy)v. Because g preserves the hermitian form, sc(y)=sc(gy), so this integrand is 1_Lambda(y) H(gy)v *before* taking any norms. For t in H_g, gt in Lambda, and

    H(gy)H(gt)v=psi0(bar c0 * (gt)* gy) H(g(y+t))v=H(g(y+t))v

since y,t in Lambda, g is unitary and the character argument is integral. The left hand side is H(gy)v. Thus the vector itself, not merely its norm, is constant on each H_g coset in Lambda. With normalized measure and section 1 this gives

    omega(g)v = Delta(g)/J sum_{q in Lambda/H_g} H(g q)v.       (1)

The summands are well-defined independently of representatives q. Distinct q give distinct cosets gq modulo Lambda, so they are orthonormal. The zero coset gives v. Hence

    <v,omega(g)v> = Delta(g)/J = 1/conj Delta(g),
    ||omega(g)v||^2 = J |Delta(g)/J|^2 = 1.

This recovers exactly the coefficient convention in the peer's semilinear argument and the native omega_vacElem_sum, without using that coefficient as a premise for (1). It also gives finite-part stability by the retained Weil covariance on every generator. It does NOT independently prove the representation law of omega.

## 3. One permutation replaces all g-dependent fixed-line scalars

Actual caller Lib/CM/Reciprocity/SemilinearWeilLaw.lean (f0ceeb862976ee92b3dae11a122ce465901f7994) 17–30, 37–79, and New/Rows/MemberKernels.lean (be36c0175fe559376780b105052249fc0c9f1f4f) 47–88, 143–167. Retain RUN60 central character and jet intertwining inputs, peer 2ce507a2 factorization b=u a with u scalar unitary and a integral adelic unit, and L semilinear for sigma. Use the peer's notation gamma for its vacuum scalar (not a new scalar for each g).

For completeness, the identity fixed line is immediate from the coset expansion above: H(y), y in Lambda, acts diagonally on H(x)v by psi0(x*y) via the commutator, since H(y)v=v. If the coset of x is nonzero, some y in Lambda gives a nontrivial character, by the exact native self-duality (FiniteVacuum 62–68). Thus a vector fixed for all y has only the zero-coset coefficient. Applying omega(u)^-1 to L v gives the identity fixed line because a Lambda=Lambda; hence L v=gamma omega(u)v. This uses the actual representation and covariance.

For every g, a commutes with g and preserves both Lambda and H_g in both directions. It induces a permutation of the finite set Lambda/H_g. Also the RUN60 character law transports sc, so L H(x)=H(bx)L on the finite part. Apply L to (1), using sigma(J)=J and only finite semilinearity:

    L omega(g)v
      = gamma sigma(Delta(g))/J omega(u) sum_q H(g a q)v
      = gamma sigma(Delta(g))/J omega(u) sum_q H(g q)v
      = [sigma(Delta(g))/Delta(g)] omega(g)Lv.              (2)

The middle equality is exact because the individual summands in (1) are representative-independent. This replaces the native family of fixed-line scalar choices j(g) and the intermediate functional comparison k by one fixed-line calculation and one finite permutation. On H(x)v extend (2) by covariance and L H(gx)=H(bgx)L; scalar b commutes with g. Extend by semilinearity to the entire finite part. This is the exact finite Weil intertwining conclusion, not just agreement of absolute values or a relation modulo phase. The separate split-set Schrödinger formula remains supplied by peer 2ce507a2 and must use the same u,gamma.

Finally the native square identity follows without interchanging sigma and complex conjugation: J=upsilon(det g) Delta(g)^2 is rational, so
    (sigma(Delta(g))/Delta(g))^2=upsilon(det g)/sigma(upsilon(det g)).
There is no assertion that sigma preserves arbitrary complex absolute values. Discarding the splitting-character phase would lose the exact ratio: the scalar identities J=1 and Delta=i, sigma=complex conjugation give ratio -1, not +1.

## 4. Retained upstream representation obligation and validation status

The actual group law is in Lib/Weil/Construction/ThetaFunctional.lean, blob b21b5f01564922bbd2ed309ef614111698b2384a: stdLattice.finProjAction, exists_gauss_sum_finProjAction, finProjAction_cocycle_eq_one_of_mem, mem_cocycleRadical, finAction and adelicAction. The latter also defines the product vacuumMeasure. Its finite cocycle proof uses the split support argument and inert four-orbit Gauss sign, not just the vacuum norm calculation above. Lib/Weil/Construction/GaussSumSign.lean (566ee1f28f107f6ad7374661ffbdadcae36abafc) 8–24 is the relevant primitive. Do not infer multiplicativity from unit vacuum norm. The self-duality of psi0 depends on the actual WeilData different-ideal normalization (FiniteHeisenberg 41–47). These dependencies remain open in this note, as do the global theta automorphy/CM inputs previously recorded. There is no deletion from the original graph or axiom ledger.

URT comparison: the candidate finite harmonic truncation of the lattice-character separation was rejected: fixed line requires the unrestricted annihilator equality. The complete orbit permutation in (2) eliminates g-dependent scalar choices algebraically, with no search, no heuristic ranking, and no unsupported complexity claim. No redundant synthetic finite diagnostics were run. Direct proof above is an independently checkable human derivation.

Actual environment check: command -v lean, lake and elan returned no executable. Native probes prepared for the compact runner, not executed:
```lean
import Lib.CM.Reciprocity.SemilinearWeilLaw
#check Sat.exists_saturating
#check norm_finMultiplier_sq
#check Space.omega_vacElem_sum
#check Space.dataInner_omega_of_vacElem
#check Space.semilinear_intertwines_weil
#print axioms Space.omega_vacElem_sum
#print axioms Space.semilinear_intertwines_weil
```
Prior primitive receipt d07359dc70c3f9f28e4858c835e5fa5424b6f539: six successful unrelated native probes, standard three axioms, one build timeout 124. Orchestrator run 45880170759 is not verification of this new note. No new Lean closure. External formal certification remains distinct from unfinished human proof.

RESUME HERE: reconstruct the actual finite cocycle supplier in ThetaFunctional.lean, beginning with exists_gauss_sum_finProjAction and its finite quotient and phase, then split support and inert sign via GaussSumSign.eq_one_of_orbits. Check the exact WeilData assumptions (roots of unity, integral trace-one element, residue characteristic) before integration. Do not redo the already completed determinant and scalar comparison budgets. HANDOFF TO integration and independent audit: use sections 1–3 at peer 2ce507a2's finite coefficient and multiplier consumers, retaining the actual cocycle and different-ideal inputs.
