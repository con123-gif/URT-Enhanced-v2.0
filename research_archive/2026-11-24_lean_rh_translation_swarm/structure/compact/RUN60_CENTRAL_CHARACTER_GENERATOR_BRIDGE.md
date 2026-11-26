# RUN60 — Exact rank-one central character and conjugate-generator bridge for the comparison kernel

26 November 2026. Status: HUMAN SOURCE-MATCHED, PARTIAL; no new Lean replay. Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude. Primary pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207/grh-compact, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. All upstream paths relative to grh-compact/src. Read current ONE_EQUATION_MISSION (completion-first and binding allocation amendment), HUMAN_PROOF_COMPACT, SWARM_PROTOCOL, AGENTS, HANDOFF_QUEUE, Cathedral continuity/state/log/protocol and state-branch summary. Existing orchestrator 45872505490 at 9db13f3 is not verification of this argument. Peers a599aa5c, 8e256416, 3e2dbd91, 38418a9b, 12c745a41, 29eb0e94, c3b2fad4, 3392d9c7 address distinct A/B/C and crystalline blocks. Resume own RUN59 1adb27d4. No physics/protected workflow changes.

## 1. Construct the actual finite theta generators with a common frame

Source New/Curve/ConjugateGenerator.lean ad3f02ee95b950ae5a4fa98e30fd939e41837ae1, 26–85; New/Curve/FrameSections.lean 6bc331571971534045115e265473cfa148de9f14, 89–126; New/Curve/TightFrameExists.lean 4f2e76afa45ba54fe9040704b505b2da1865f2b4, 57–66; Lib/Weil/Construction/ConjugateJetDefs.lean bdc5981f77f6b2e3f94b757118ea664a7a1a1f08, 19–36. Write N=P.N₁ s>0, r=card n, f=#infinite places of E=P.E s. All signs of the standard space are positive. For embeddings tau and sigma' of E in the CM type, distinct embeddings have distinct images of zeta (E=K(zeta)); the geometric sum of their quotient to powers j=0,...,N-1 is zero unless they agree. Each zeta^j lies in the native integral lattice after finiteImage. Repeating the N vectors N times gives the frame of length N² with sum of w_i(tau) conjugate(w_i(sigma')) equal to N² times the Kronecker delta. This is the specific frame at ConjugateGenerator 38–39, not the more difficult arbitrary-length frame theorem.

Apply FrameSections.exists_finitePart_of_isTightFrame to the CM curve with delta=N, norm(delta)=N², a=Omega₀ in its lattice, M=N², and degree-one monomial (1,0) for every repeated vector and every coordinate. The area condition reads area(C)=|Omega₀|² sqrt(d)/2. It supplies F in finitePart with theta(F)=1, all finite values integral at every p, and a VacuumExpansion indexed by a nonempty finite J of size H=(N²)^(2fr)=N^(4fr), with shifts x_j, and an integer m. Its exact identity for every complex-linear functional ell is
    m sum_j ell(rho(x_j)vac) rho(-x_j)F = H ell(F) vac.                 (1)
Here rho(x) abbreviates V.rho(finVec x). Since theta(F)=1 and vac is nonzero, m>0. Taking ell=theta proves vac lies in the span of the translates of F. That span is stable under every rho(x) by the Heisenberg multiplication law (the scalar factors are nonzero). Since the finite part is precisely the span of the vacuum translates (FinitePart.lean 174ee272107a50267fcde8c0ea06aa73f5572fe5, 16–29, with finHeisOp differing from rho by a nonzero semicharacter), it equals the span of the translates of F. No irreducibility of an unspecified global representation is needed.

Apply dataInner(vac,-) to (1) at ell=theta; the right side is H and hence some q_j=dataInner(vac,rho(-x_j)F) is nonzero. Fix this j. With ell=m^{-1} dataInner(vac,rho(-x_j)(-)), (1) becomes the exact normalized expansion
    c vac = sum_i a_i rho(-x_i)F,
    c=H q_j/m !=0,  a_i=dataInner(vac,rho(-x_j)rho(x_i)vac).           (2)
Each a_i is zero or a product of finite additive character values: use the Heisenberg law, PairDefs.lean 8a5eaed1249fcc1c482e3af4f15373682fa34af1 dataInner_rho_of_vacElem, and the finite vacuum coefficient of AdelicHeisenberg.lean 6d56fe0aa1762a56778d40f9086f69e721f91b14, 12–16. Therefore a_i is zero or a root of unity, not just a complex scalar of modulus one. Evaluating (2) at any finite x, the additional rho phase is likewise a root of unity and the shifted F values are integral by FrameSections. The p-adic triangle inequality proves |iota_p(c vac(x))|<=1 simultaneously for every prime, embedding and x. This is the same c before all primes and automorphisms, as required at ConjugateGenerator 27–29; no division by m in a valuation estimate is needed.

## 2. Exact CM coefficient matching for the conjugate frame

Retain the actual CM reciprocity supplier Lib/CM/FormalGroup/FormalHeight.lean 640cabefca81dde25d092fd6ac057c3bcdd3516e, complex_multiplication_theta 38–55. It supplies for each field automorphism sigma fixing K a conjugate curve D, Omega !=0 with area(D)=|Omega|²sqrt(d)/2, e>0 with Omega e in its lattice, and a_S in K clustering at beta in the finite adeles of K as finite S grows. For every x in S it supplies equality of the sigma-conjugate Taylor series of the translate by x Omega₀ and the Taylor series on D translated by x Omega a_S. Do not replace this by a generic assertion that complex automorphisms are continuous.

Construct F' with the SAME repeated frame, delta=N e, norm(delta)=(N e)² and a=Omega e. The ratio a/conj(delta) is now Omega/N, so the area condition again holds exactly. Set b=finite-adele inclusion of beta into E, independent of rank. For a rational translation gamma in E^n the finite list of arguments of the degree-one theta factors is
    t_ij = -Tr_(E/K)(gamma_i conjugate(zeta^j))/N.
These are elements of K, by the trace formula TightFrameExists 12–13. For the target F', use local constancy at b finiteImage(gamma): the cluster condition yields one sufficiently large S containing ALL t_ij and with a_S finiteImage(gamma) in the neighborhood on which the translated F' is unchanged. It is important that the same S and scalar a_S are used for every factor of the product. FrameSections 93–97 gives the corresponding theta product and Taylor series for these rational translations. Apply the CM identities factor by factor. The original linear substitution at scale per=periodFactor*areaScale/Omega₀ has coefficient periodFactor*conjugate(Phi_tau(zeta^j))/N; the conjugate curve has coefficient Omega*t*conjugate(Phi_tau'(zeta^j))/(N*areaScale). Set
    t = sigma(periodFactor) * areaScale / Omega.
Permuting the places via placePerm makes the two coefficients identical (the conjugation on E commutes with its embeddings; do not claim this for arbitrary complex coefficients). Thus the whole products are equal as formal series after the native variable renaming. Local constancy of rho(x)F and rho(bx)F', and density of finiteImage(E^n), extend the equality to every finite adelic x. This is equality in the locally constant translated-vector maps, NOT a limiting continuity assertion for sigma. The native norm_gal_vacuumRoot and Chowla–Selberg period identity, exactly as used at ConjugateGenerator 66–68, supply |t|²=1/bigOmega; those scalar period identities are retained, not replaced. The definitions of per and areaScale are in PeriodDefs.lean 7dcfa329642087071f8bc9f1976e004eb7fb20ef, 40–51.

In particular the constant term gives sigma(F(finVec x))=(F')(finVec(b x)) via theta_rho and FrameSections' constant term identity, with the same signs as the native theta evaluation. The degree-one monomial theta shifts on the finitely many conjugate CM curves are uniformly bounded: ConjugateGenerator 33–36 uses integrality/algebraicity of a₁ and compactness of the range of normalized shift norms; keep those two suppliers. Let the chosen upper bound for a factor be exp(M), M>=0. There are N²r factors, so each conjugated F finite value is <=exp(M N²r). Applying sigma to (2) and evaluating finite x introduces only roots of unity or zero as coefficients, and gives the upper bound H exp(M N²r). Since f<=N and log N<=N, log H=4fr log N<=4N²r. The source choice C=ceil(M)+4 therefore suffices:
    |sigma(c vac(finVec x))| <= exp(C N²r).
The root-of-unity argument applies even though arbitrary field automorphisms need not preserve complex norms. This reconstructs the finite expansion and bound, conditional on the explicitly retained CM, frame existence, period and compact-shift suppliers.

## 3. Rank-one central character: extract the scalar equality BEFORE extending to the whole space

Actual caller New/Curve/ConjugatesOfJets.lean 8b841d76bb938d8a18fd4341aa832a20b13dd9e0, 164–195. Fix sigma and b from section 2. In rank one (the source deliberately uses stdSpace E Unit, even if the target rank is zero), write R(x)=rho(finVec x), J=jetSeries(per), J'=renamed jetSeries(t). The generator relation is
    sigma(J(R(x)F)) = J'(R(bx)F')                                   (3)
for ALL finite adeles x. Both generators are nonzero: theta(F)=1, and at x=0 the constant coefficient of (3) is 1, hence theta(F')=1. Both jet maps are injective on finitePart (FrameSections 42–46: nonzero scale, vanishing all restrictions to complex lines and entire-function uniqueness imply zero vector). per !=0 and t !=0 by the period identities.

For scalar adeles the multiplication law for R has cocycle
    B(x,u)=psi₀(half * conjugate(u) * x)
with the source Heisenberg convention R(x)R(u)=B(x,u) R(x+u) (if expressed with the inverse convention both sides of the following identity invert). FiniteHeisenberg.lean be448ff4db1da9bfa0fe7bd637272be079be2285, 20–39, 78–82; all signs positive. FinitePart 34–45 gives simultaneous local constancy of R(x)F and R(x)F'. Choose positive rational integer k with R(k)F=F and R(bk)F'=F': use the compact two-point set {1,b} and the common zero neighborhood, as in AdeleTopology.lean 4ef9cd90918e4a0bae2e3d42e99c29cad9da8aa2, 83–94. Crucially this does NOT yet use b invertible. Each nonzero rational integer k is a unit in the finite adeles.

For arbitrary x, the two equalities are R(x+k)F=B(x,k)^(-1)R(x)F and R(b(x+k))F'=B(bx,bk)^(-1)R(bx)F'. Compare (3) at x+k and x, use coefficientwise sigma semilinearity, and cancel the nonzero series J'(R(bx)F') (R(bx) is invertible even if b is not). This gives the exact scalar equality
    sigma(B(x,k))=B(bx,bk).
For arbitrary z in the finite adeles put x=2 z/k, legitimate because k is a unit. Since conjugate(k)=k,
    sigma(psi₀(z)) = psi₀(b conjugate(b) z).                         (4)
This proves exactly hψ at ConjugatesOfJets 186–193, for all z and independently of target rank. It does not assume that sigma fixes all roots of unity, that b is a unit, or that a finite set of characters separates all adeles. The small stabilizer is a means of extracting the cocycle for arbitrary x, not a truncation.

## 4. Construct the semilinear map on the actual span and supply its caller

For arbitrary standard rank, let F,F' and J,J' be as above. For f in finitePart choose any finite representation f=sum_i a_i R(x_i)F and set
    Lf=sum_i sigma(a_i) R(b x_i)F'.
By (3), J' of the right side equals sigma(Jf). If a different representation is chosen the difference has J' zero, hence is zero by injectivity on finitePart. Thus L is well-defined and sigma-semilinear, satisfies J' L= sigma J on finitePart, and is injective there. This is the mathematical content of the restricted linear left inverse in ConjugatesOfJets 173–178, without making any assertion about its values outside the image. The original source extends it to the ambient space using a linear left inverse; extend the map from a basis of finitePart to the ambient space if that statement is required. No continuity of this extension is used.

For a generator R(x)F and any y,
    L(R(y) R(x)F)=sigma(B(y,x)) R(b(y+x))F'
                =B(by,bx) R(b(y+x))F'= R(by) L(R(x)F).
The middle equality follows from (4) applied to half*sum coordinate conjugate(x_i)y_i, which is an arbitrary finite adele. Extend over all finite linear combinations using semilinearity. This proves hϱ at ConjugatesOfJets 194–195 in the actual space, including rank zero. With (4) and hϱ we can now invoke the precise upstream lemma Space.semilinear_intertwines_weil (Lib/CM/Reciprocity/SemilinearWeilLaw.lean f0ceeb862976ee92b3dae11a122ce465901f7994, 37–42) with the required conjugate-disjoint set R. It supplies b a unit, a scalar c0 and unitary scalar adele z, L(vac)=c0 omega(z)vac, the exact multiplierRatio intertwining and the formula on named Schwartz–Bruhat vectors. Since L is injective on finitePart and vac !=0, c0 !=0. In particular the unit property of b is a CONCLUSION of this native supplier, not used in the proof of (4).

This supplies the generator/central-character/span part of the previously open interface at ConjugatesOfJets 172–195. Combining the result with the RUN59 uniform estimate yields the exact quantitative conjugate-jet input to MemberKernels.norm_jet_le_of_isAdmissibleComb (41–88) and exists_modKernel_integral_bound (143–167), conditional on the retained native CM, frame, period, finite Weil and theta-model suppliers. The same c from (2), same b and same t are used throughout their respective quantifiers. The c0 of the intertwiner is distinct from the integral scale c.

## Verification, unsuccessful shortcut, remaining dependencies

The exact rank-one comparison proves all characters by one symbolic cancellation, so no harmonic frequency enumeration is required. A candidate URT finite-frequency shortcut was rejected: equality only on finitely many fixed arguments cannot imply equality of the characters on the whole finite adeles; the proof above instead allows arbitrary x through k^{-1}. No performance claim; no redundant finite diagnostic. Source statements and bodies retrieved at the pin; local command -v lean and command -v lake returned no executable. No new native run or axiom evidence; no PASS for this human proof. Existing original/reduced graphs are preserved unchanged. Prepared native inspection (not executed):
```lean
import New.Rows.MemberKernels
#check Parameters.exists_isJetConjugate_generator
#print axioms Parameters.exists_isJetConjugate_generator
#check Space.semilinear_intertwines_weil
#print axioms Space.semilinear_intertwines_weil
#check Parameters.exists_semilinear_isJetConjugate
#print axioms Parameters.exists_semilinear_isJetConjugate
```
Retain the original CM reciprocity theorem with its exact finite-cluster hypothesis, the degree-one frame-to-theta existence and vacuum expansion, the compactness/algebraicity shift bound and period normalization, the full finite Weil intertwining proof, and theta/packing dependencies of RUN59. Do not cite the whole native generator theorem as a premise for the reconstruction, nor assert these named suppliers have already all been human-proved. External formal certification remains distinct from the unfinished human proof.

RESUME HERE: reconstruct the self-duality-to-unit factorization b=u a and the vacuum projection comparison in SemilinearWeilLaw.lean 43–79, then audit the exact normalized coefficient conventions in (2) and the CM product transport at MemberKernels. This is a genuine remaining supplier chain, not a request to optimize the already sufficient comparison exponent.
HANDOFF TO: integration/editor and formal audit; merge sections 1–4 with RUN59 and the existing comparison line, preserving retained suppliers. Other lanes need not wait.
