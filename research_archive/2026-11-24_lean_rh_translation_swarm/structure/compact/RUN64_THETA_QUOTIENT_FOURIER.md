# RUN64 — rational theta functional from exact Fourier coefficients and rank-one averaging
26 Nov 2026. SOURCE-MATCHED HUMAN DERIVATION / PARTIAL global reconstruction. Integration handoff. Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude. Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207/grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Read current ONE_EQUATION_MISSION (completion-first and expanded workload; binding sole URT lane), current manuscript (including recent C period and A/B supplier integrations), protocol, AGENTS, continuity/physics state and handoff. Latest branch peer checkpoint observed 2d965f90, Landau finite gauge; f775ec50 integration; add4eea2 editor; 84ff1202 dependency. Resume own c5a8c340 real Weil cocycle, rather than redoing A/C peer estimates. The following chain is the native theta functional used in PairDefs and PairSplitting, not a replacement for the remaining quantitative A/B/C frontier.

## 1. Rational subgroup and squared-character separation
ThetaFunctional.lean (blob b21b5f01564922bbd2ed309ef614111698b2384a), 175–223; AdelicHeisenberg.lean (6d56fe0aa1762a56778d40f9086f69e721f91b14), 18–24; AdeleSelfDual.lean (aa42d91af0fb071584d798d951be5efcd739fa80), 26–40; AdditiveCharBasic.lean (b06d14a9dc6bfe9d3cefa43f038fb54d72de698e), 60–81; SpaceBasic.lean 64–68.

Let W=A_E^n, X=V.x the invertible adelic frame, J=V.J the nonsingular rational Hermitian Gram matrix and L=X^{-1}E^n with its diagonal embedding understood. Denote v_gamma=X^{-1}gamma, and rho the Heisenberg operators on the native Banach L1 vacuum model S; e=vacElem. Use the additive character psi=stdAddChar E, trivial on E, with E its own annihilator and psi nondegenerate on A_E. The native j is nonzero, H=stdForm E s is the signed standard Hermitian matrix, and (X^{-1})^* H X^{-1}=J under the diagonal embedding. Native beta(x,y)=psi((j/2)y^* H x) is alternating and unitary. In particular beta(v_gamma,v_delta)=1 since its argument is rational. Compactness of W/L is transported from A_E^n/E^n by X, and the native rational lattice is closed and discrete.

Define chi_gamma(x)=beta(x,v_gamma)^2 = psi(j gamma^* J X x). These are continuous characters of W/L. To check that the common kernel is zero on W/L, set z=Xx and for each i and a in E choose gamma=J^{-1} e_i conjugate(j^{-1}a) (the rational coordinate test in lines 208–210). Since J is Hermitian, j gamma^* J z=a z_i. If all chi_gamma(x)=1, the scalar annihilator theorem implies z_i is rational for all i, hence x in L. To check distinctness, if chi_gamma is identically one, varying z arbitrarily and choosing coordinates in A_E gives j gamma^* J=0 by nondegeneracy of psi. Thus gamma=0. Their span is a conjugation-closed unital algebra separating the compact quotient (chi_gamma chi_delta=chi_(gamma+delta)), so Stone–Weierstrass gives density; no additional unproved enumeration of all characters is needed. Do NOT replace beta^2 by beta in the subsequent commutator: this would leave the factor two uncancelled. Keep the actual standard additive character, frame and all coordinates, including the zero-dimensional case.

## 2. Invariant quotient form: an exact rank-one reduction
ThetaFunctional 225–239; Model.lean (714d037c13a76e24c2ea54b2237a37dbe08996ad), 80–105, 118–158, 194–239; PeriodicMean.lean (43a8fd17229284717d2df1f5aae1678023d879b7), 25–55.

For two arbitrary bounded rational-invariant linear functionals ell,ell' on S, put
 F_{f,f'}(x)=ell(rho(x)f) conjugate(ell'(rho(x)f')),
 B(f',f)=mean_{W/L} F_{f,f'}.
From rho(a)rho(b)=beta(a,b)rho(a+b) and |beta|=1, F(x+v_gamma)=F(x), with the phases cancelling before absolute values. F is continuous, integrable on the compact quotient with Haar probability measure. B is bounded sesquilinear: |B(f',f)| <= ||ell|| ||ell'|| ||f||_1 ||f'||_1 because rho is an L1 isometry. Simultaneous rho(y)-translation preserves B by quotient Haar translation and cancellation of beta(x,y) against its conjugate.

Write I(v,w)=integral_W v(y)rho(y)w dy. The actual Model.lean 198–215 supplier gives I(v,e)=v and I(v,w)=w(0)v. Keep its hypotheses: reproducing L1 model, complete space, normalized vacuum e with e(0)=1 and e(-y)=conjugate(e(y)), and native Haar measure. This is not a statement about arbitrary L2 vectors. With c=B(e,e), boundedness justifies moving B inside the Bochner integral:
 B(e,w)=B(I(e,e),w)
       =integral conjugate(e(y)) B(rho(y)e,w)dy
       =B(e,integral conjugate(e(y))rho(-y)w dy)
       =B(e,I(e,w))=c w(0).
For any v, B(rho(y)e,w)=B(e,rho(-y)w)=c (rho(-y)w)(0)=c w(y).
By conjugate-linear integration in the first argument,
 B(v,w)=B(I(v,e),w)=c integral conjugate(v(y))w(y)dy=c modelInner(v,w).
Thus the precise quotient mean equality at lines 235–239 follows from the actual rank-one supplier, with no separate irreducibility or scalar choice. No exchange of infinite sums is involved here.

## 3. Exact Fourier coefficient and summable expansion
ThetaFunctional 206–223,240–244. Use the original summability hypothesis supplied by summable_modelInner: for each f,f' in S, sum_gamma |modelInner(f',rho(v_gamma)f)| is finite. Its native proof invokes wiener_bound for modelInner f', the L1 premise on f', and the finite-preimage bound of the rational lattice on compact sets after the frame change. Retain those suppliers; no approximation of tails or uniform rate is claimed. This is the analytic input permitting the following exact uniform Fourier expansion.

The commutator identity is
 rho(x)rho(v_gamma)=beta(x,v_gamma)^2 rho(v_gamma)rho(x).
Apply rational invariance to the left and get
 ell(rho(x)rho(v_gamma)f)=chi_gamma(x) ell(rho(x)f).
Consequently, with the POSITIVE character convention,
 mean F_{f,f'} chi_gamma = B(f',rho(v_gamma)f)
                         = c modelInner(f',rho(v_gamma)f).
The Fourier series uses the inverse characters chi_gamma^{-1}, not chi_gamma. Absolute summability gives uniform convergence of the series of these coefficients, and the difference from F has zero integral against every chi_gamma by character orthogonality. Density from section 1, followed by testing against the conjugate of this continuous difference, shows that difference is identically zero (Haar measure has full support). At x=0 all characters equal 1, hence the native exact identity:
 ell(f) conjugate(ell'(f')) = c sum_gamma modelInner(f',rho(v_gamma)f).
This is HasSum over all finite subsets; no cutoff, shell-order dependence or inferred asymptotic cancellation. Negative route: using beta instead of beta^2 in the commutator changes the coefficient unless beta=1; a finite-frequency approximation does not yield the exact evaluation at 0 without the absolute-summability input. No URT premise.

## 4. Existence and uniqueness, without choosing an unverified nonzero functional
ThetaFunctional 248–282. For fixed u in S define P_u(f)=sum_gamma modelInner(u,rho(v_gamma)f). The individual finite partial sums are continuous linear functionals. They are pointwise bounded by summable_modelInner; uniform boundedness on the complete Banach model gives continuity of their pointwise limit. Rational invariance follows by gamma reindexing because beta(v_gamma,v_delta)=1. To establish a nonzero P_u, use the same summability with u=e and f=e and consider u_a=rho(-a)e. By unitarity of rho for modelInner and the exact commutator, 
 P_{u_a}(u_a)=sum_gamma chi_gamma(a) modelInner(e,rho(v_gamma)e).
All terms have the same absolute majorant as at a=0. The quotient mean of this uniformly convergent series is its gamma=0 coefficient, modelInner(e,e)=1. This is the native mean argument at lines 259–264. In particular some a has P_{u_a}(u_a) != 0. It does not require theta existence, lattice covolume one relative to the vacuum Haar measure, or positivity of each summand.

Take ell=P_{u_a}, c=mean |ell(rho(x)e)|^2 >=0. If c=0, section 3 with ell'=ell and f'=f would give |ell(f)|^2=0 for all f, contradicting the exhibited value. Thus c>0, and theta=c^{-1/2}ell is a bounded rational-invariant functional of mean-square one. This is exactly IsThetaFunctional; the construction replaces the native contradiction with direct choice of a nonzero witness.

For uniqueness fix such theta and choose u with theta(u)=1 (possible since theta nonzero). For another rational-invariant ell', use section 3 with ell=theta, f=u, f'=v and let c'=mean theta(rho(x)e) conjugate(ell'(rho(x)e)). Compare with the same formula for theta in both slots, where the constant is 1. It gives conjugate(ell'(v))=c' conjugate(theta(v)) for every v. Therefore ell'=conjugate(c') theta=ell'(u)theta. This is the actual one-dimensionality and exact scalar of lines 270–278. Finally the map f -> (x -> theta(rho(x)f)) is injective: if the difference f gives the zero function, section 2 gives modelInner(f,f)=0, hence f=0 by positive definiteness in Model.lean. The vacuum normalization is essential: arbitrary nonzero ell does not automatically have c=1.

## 5. Actual PairDefs consumers and normalization transport
PairDefs.lean (blob 8a5eaed1249fcc1c482e3af4f15373682fa34af1), 59–89,109–132,173–176,186–189,222–225. Let theta_i be the independently chosen normalized functionals on each standard signed line and theta a normalized functional on the standard sum. Put a(x)=theta(rho(x)e), b(x)=prod_i theta_i(rho_i(x_i)e_i). Orthogonal-sum multiplication of vacuum and beta factors gives
 a(x) conjugate(a(y)) = b(x) conjugate(b(y))
by section 3 and product of absolutely convergent line sums (finite number of factors). Choose y with a(y)!=0; such y exists by mean-square one. Then |a(y)|=|b(y)| and r=b(y)/a(y) is unitary. The equality gives b(x)=r a(x) for every x, so r theta is precisely a normalized functional with the required product of the *chosen* line theta functions. No arbitrary phase deletion. For the empty product the same identity applies.

For the transport in PairDefs 83–89 let T be bounded sigma-semilinear for the given isometric involutive field map sigma, phi a topological additive isomorphism carrying rational vectors into rational vectors, T rho_1(x)=rho(phi x)T and modelInner(T e_1,T e_1)=1. Then sigma∘theta∘T is complex-linear because sigma^2=id, rational invariant by the intertwiner, and has mean-square one: phi induces a surjective map of compact quotient groups (inclusion suffices), pushing Haar probability to Haar probability; section 2 on T e_1 gives mean 1. This checks the actual one-way inclusion in the native caller, without assuming equality of rational lattices. The trivial-cocycle Weil representation from prior RUN63 supplies the intertwining and inner preservation for the rawTheta branch at lines 109–129; if no transporting g exists the existence construction of section 4 supplies the fallback. In either case rawTheta is normalized. Then the actual data function injection, rational quasi-periodicity beta(v_gamma,x) f(v_gamma+x)=f(x), dataInner_eq_quotMean and hasSum_dataInner are precisely sections 2–4 with theta=rawTheta and c=1. PairSplitting.lean (7060d2715dc64318e5f657357bce32c32bf11772), 63–67 actually uses eq_smul for the doubled-space rational invariance proof; retain the separate Witt/doubling/mixed-term hypotheses there.

## Evidence, comparison, and remaining obligations
No harmonic search needed: the exact commutator, rank-one integration and full Fourier mean prove the target for every model vector in the original domain. Original URT candidate finite harmonic prioritization is rejected here as a replacement for the infinite equality: the arbitrary-degree/frequency tail is not controlled by ranking alone, and native absolute summability already justifies the full argument. No benchmark claimed. No numerical simulation was needed or run under the completion-first directive. Actual source bodies and caller inspected. Native graph not elaborated, no removal of global dependencies, no use of claimed RH theorem as premise. Retain the native Wiener bound, reproducing/Bochner integration and rank-one identity, scalar adelic self-duality, vacuum positivity, Fourier density and all field/frame hypotheses as named premises, not as magically discharged new primitives. These derive a local connected chain, not the entire A/B/C estimates. The unresolved primitive ledger in the current manuscript stays open.

Local command -v lean/lake/elan gave no paths. Native CI retrieved from cathedral-research-state compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json: run 45803534769, six named upstream checks list propext/Classical.choice/Quot.sound, module_1 build timeout 124, all_requested_checks_ok=false, full_RH_replay=false; no verification of this note. Prepared upstream probe only, not executed:
```lean
import Lib.Weil.Construction.PairDefs
#check Space.isDualFamily_beta_sq
#check Space.IsRatInvariant.quotMean_eq
#check Space.IsRatInvariant.hasSum_modelInner
#check Space.exists_isThetaFunctional
#check Space.IsThetaFunctional.eq_smul
#check Space.isThetaFunctional_rawTheta
#check Space.hasSum_dataInner
#print axioms Space.exists_isThetaFunctional
#print axioms Space.hasSum_dataInner
```
These probe the native statements and their axiom sets; they are not a formalization of this human exposition. Earlier archive, graph, physics gates and protected workflows untouched. Independent audit requested.

RESUME HERE: trace the actual rational-unitary invariance caller PairSplitting.lean 33–67, especially the two doubled-space splittings, their mixed-term reindexing and the nonzero tensor witness. Reuse theta uniqueness and exact phases above; retain all Witt, rational isotropic and zero-term normalization suppliers. If already covered by peers, proceed to its native theta kernel automorphy caller instead. HANDOFF TO integration/editor, theta, formal audit, kernel extractor.
