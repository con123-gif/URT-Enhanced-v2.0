import Lib.DiscreteSeries.Theta.LocalThetaCorrespondence

/-!
# Dependency RUN77 — exact smoothing witness at the Howe consumer
27 November 2026. SOURCE-MATCHED independent human audit of the actual
stability premise; proposed native caller helper PREPARED, NOT COMPILED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Old pin 40e56bab026552e089d7afcfeff08d2defb9c005 Main.lean blob
dbd5db70bc11b35f18fa5751216ab335321e7bfc re-read; not imported.
Mission blob 3adc76221a978016e3505cdf3e36ad688354d7d7; live spine
67e542df1b5557b2e1314643931ef1355bbdc50d; live ledger
073d86374ebc415e217a2732814dde7b0f3dfb9d. SWARM_PROTOCOL, HANDOFF_QUEUE,
AGENTS, continuity and current CI read. Prior RUN76 bd652fd1d9d0b5c8ec88414a239b8ec47d96a714.
Recent peer commits a62382a8 (outer index and B2 receipt), 3b3629d3
(short forms), ef27878d (marked Hecke), 263f1763 (marked jet) checked.
Observed recent commit a62382a86087c9b58b704d0ba1d9889563917379
(not a CAS assertion about head). This is not a new global Howe proof.

## Source-matched local reduction / audit
* Lib/DiscreteSeries/CuspKernel/BumpConvolution.lean
  b62172c4d3b2e75c7466ecfd73ed40c080ad062f:
  Bumps, bumpDeriv, integrable_bump_inv_smul, smear, hasDerivAt_smear.
* Lib/DiscreteSeries/Theta/LocalThetaCorrespondence.lean
  2a5c865a64dcbd1a9c75218fcc4d93ee4b4c6bf8:
  isDerivedAction_integratedRep, exists_bump_integratedRep_eq (hG argument).
* Lib/DiscreteSeries/Rigidity/KernelFixes.lean
  b7c9218680d4848f11347c91dd6a952ee9b1a0ca:
  map_integratedRep, exists_bump_conv_dsKernel, integratedRep_fix_of_isKHighest.
* Lib/DiscreteSeries/CuspKernel/SchurOrthogonality.lean
  7be5411c2c4c3662db6f10be4c7fda7f63c27287:
  exists_smear_dsCoeffSmooth_eq (separate rightDeriv_smear caller).
* Lib/DiscreteSeries/Theta/HoweArgument.lean
  4a68183128d5be3f39e8a5ed7556bac698b3f4b6:
  IsJointHarmonic.howe_argument, hG actual premise.

Fix the actual oscillator pair, positive ranks, matching joint harmonic
Phi, gap and native weighted integrability. Write H for the target real
unitary group USign eps', pi' for its representation on the native
complete normed Fock space, iota(P)=pi(e_l)polyVector(P), w=iota(Phi).
The partner representation commutes with the source representation.
The native isDerivedAction_integratedRep supplies
 d/dt pi'(exp(tY))iota(P)|_0 = iota(rho'(Y)P)
for Y in the REAL unitary Lie algebra, extending complex linearly.

For beta in Bumps eps' define S(beta)=integral beta(y^-1) pi'(y)w dy.
Strong continuity and compact support after inversion give a genuine
Bochner integral. map_integratedRep identifies this with the actual
integratedRep pi' (beta o inv) w. In particular S is linear.
The source's G.range.comap iota is exactly the polynomial submodule
 M={P : exists beta, S(beta)=iota(P)}.
No closedness of range, injectivity of iota, or nonzero w is required
for the stability statement (nonzero and h0 remain elsewhere).

For continuous F:H->E and smooth compact beta, left Haar translation
x=g*y gives the exact formula, without inversion of the measure,
 smear(F,beta)(g)=integral beta(x^-1*g) F(x) dx.                 (A)
The inversion of beta in the original definition is indispensable.
For g=exp(tY), differentiate the bump, NOT F. The pointwise derivative
is the RIGHT derivative D_Y beta at x^-1*g. There is no minus sign.
If K=tsupport beta, then for g in a relatively compact neighborhood U
the integrand in (A) vanishes outside the single compact set Ubar*K^-1.
To dominate the difference quotient at g0 take a compact neighborhood
of g0 containing the curve segment. If x outside Ubar*K^-1 both values
are zero. Otherwise x ranges over this fixed compact and x^-1*g(t)
over a compact set. Smoothness of beta, continuous differentiability
of the exponential curve and compactness bound the t derivative there
uniformly (or use the ambient local Lipschitz bound and differentiability
of the curve, as in hasDerivAt_smear). Multiply by the bounded continuous
norm of F on that same compact and its indicator. Haar is finite on
compact sets, so dominated differentiation is valid. For the actual
real exponential curve no higher derivative of F is used. This proves
 d/dt smear(F,beta)(exp(tY))|_0 = S(D_Y beta)                   (B)
with F(x)=pi'(x)w. D_Y beta remains smooth and supported in K:
off K the function vanishes on a neighborhood so its derivative
is zero there. The native bumpDeriv restricts rightDeriv using
exactly this support fact, including the complex linear extension.

For P in M choose the ACTUAL beta witnessing iota(P)=S(beta).
Linearity of the bounded pi'(g) allows passage through the integral,
so pi'(g)iota(P)=smear(F,beta)(g). Comparing the two derivatives
by uniqueness gives the decisive equality
                    iota(rho'(Y)P)=S(D_Y beta).                (C)
For any complex matrix X write X=Y+iZ with Y,Z real unitary Lie
directions via eq_unitaryLiePart_add_I_smul. By complex linearity
of iota,rho',S,bumpDeriv, (C) gives
                    iota(rho'(X)P)=S(bumpDeriv X beta).         (D)
Thus the exact witness for hG is bumpDeriv X beta, not a limit in
the image. The same beta works for all X, and the proof only
requires derivatives of the original polynomial vector and
continuity of the orbit, not arbitrary vectors being analytic.
As an orientation check, pi'(h)S(beta)=S(beta_h) with
beta_h(u)=beta(u*h), support K*h^-1; no use of right Haar is needed
for this change of variables either. The reversed direction
beta(h^-1*u) is not the same on a noncommutative group.
Group stability alone cannot prove Lie stability of a nonclosed
range: difference quotients in that range may have limits outside.
Reject that shortcut. No artificial norm estimate or URT used.

## Actual caller / surviving frontier
The source hG of IsJointHarmonic.howe_argument is precisely
forall X, M in (T.swap.oscRows X).invtSubmodule. Equation (D)
supplies its body pointwise. The original h0 is still the
separate exists_bump_conv_dsKernel + integratedRep_fix argument.
The root-cone hc and row compact lowerings/weight relations K,L
remain; use RUN76's single-root candidate only after its independent
audit and replacement replay. This step is an audit of an existing
native proof, not a new removal of its derivative/integrability
dependencies. No global closure claimed.

Re-read actual Lib/Weil/Lift/Edge.lean
5e5f40a06dd7a9a358e92987277eca74705f8f57: isHalfEdge_of_oscillatorPair
chooses local bumps for monomial (.curry a w) 1, then sums products
over P.support. New/Rows/MemberOrthogonality.lean
aca8828d477a4510ab80964e1572f34ef220a2c1: descentsVanish_hypSum
uses hO.isEdge.2.lift_isForm_and_eq_realConv and its .2 equality,
under its realPairWeil polynomial, automorphic and conjugate-form
conditions. The local witness audited here feeds that caller
through RUN68, not the prime-window inequality directly.
Original source-visible chain retained:
 C -> ComparisonForms/HeckeValueHeight -> MemberOrthogonality
 -> descentsVanish_hypSum -> swapped half edge -> isHalfEdge_of_oscillatorPair
 -> exists_bump_integratedRep_eq -> howe_argument -> hG
 -> isDerivedAction_integratedRep + map_integratedRep +
 hasDerivAt_smear + bumpDeriv + real Lie decomposition.
Candidate exposition for hG: (A) -> compact support domination
 -> (B) -> (C) -> (D). No node removed from original proof-term,
 type, constructor, value or axiom evidence. These are visible
 source edges, not a full elaborated root graph. Cache context:
 (pin, actual pair, l,l',Phi,P,beta,X,caller,role). Do not reuse
 a stability witness from another oscillator pair.

## Actual verification receipt (separate B2 branch)
Read state branch compute/rh-compact-b2-human-replay-20261127/status.json
blob d9eb4d1dc47d7dc52f36bc13b41b3eea170b667d and
outputs/b2_native_results.json blob a5dba18064d92bade88f3133b7217addcfe9b9ff.
Run https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45986308748
completed 2026-11-27 11:14:10Z; exit 0, 8 new helper proofs, 6 original
caller probes, standard axioms only; negative missing-projector-guard
exit 1 as intended. caller_replacements_checked=false,
human_assembly_verified=false, full_RH_replay=false. Actual B2 helper
verification, NOT verification of this C-branch certificate.
Orchestrator summary 10:59 run 45983787433 is a distinct status.
Local command -v lean/lake/elan returned none. No native rh_scan,
rh_prune, rh_reduce, rh_auto or rh_auto_frontier execution this run.
The helper below extracts the exact hG source proof as a named
statement for caller replay; syntax/elaboration untested here.
No competing CI job or workflow modification. Preserve prior
old-pin conditional root and prune receipts; never import claimed RH.

RESUME HERE: replay the named smoothing_preimage_invariant helper
against the compact pin in the shared runner, substituting its body
for the hG argument of exists_bump_integratedRep_eq and recording
original/reduced reachable declaration and axiom edges (including
constructor roles). This is the concrete C3 caller validation;
if the source fragment fails to elaborate, repair the exact binder
context rather than replacing it by a scalar test.
HANDOFF TO integration/editor, kernel and audit. RH remains OPEN.
-/

namespace RHDependencyRun77

open Finset MeasureTheory Fintype GlModule Matrix.Norms.L2Operator

variable {R C I} [Fintype R] [Fintype C] [Fintype I] {η} {ε ε' l l' Φ}
  {T : @FockDualPair R C ε ε' I} {π π'}
  (hp : OscillatorPair (η := η) T π π') [Nonempty R] [Nonempty C]
  (hΦ : IsJointHarmonic T l l' Φ)

/-- Extract the actual stability premise from the native local theta caller.
Prepared source-context certificate; needs compact native replay. -/
lemma smoothing_preimage_invariant :
    let ι := (integratedRep π l.dsKernel).1 ∘ₗ polyVector η
    let G := .proj 1 ∘ₗ smear _ (hp.column_rep.unitary_rep.1 (ι Φ))
    ∀ Y y, y ∈ G.range.comap ι → T.swap.oscRows Y y ∈ G.range.comap ι := by
  intro ι G Y y hy
  have d := hp.isDerivedAction_integratedRep hΦ
  have v := hp.column_rep.unitary_rep
  have a (α : Bumps ε') : integratedRep π' (α.1.1 ·⁻¹) (ι Φ) = G α :=
    (map_integratedRep v (integrable_bump_inv_smul _ α) 1 (ι Φ)).trans (by aesop)
  rcases hy with ⟨β, e⟩
  exact ⟨bumpDeriv Y β, eq_unitaryLiePart_add_I_smul ε' Y ▸ by
    simp [G, map_add, fun Y ↦
      (d Y y).unique (by simpa [map_integratedRep v (integrable_bump_inv_smul ..) (π' _),
        ← e, ← a] using (hasDerivAt_smear _ β (v.1 _) (hasDerivAt_expU Y 1 0)))]⟩

end RHDependencyRun77

#check @hasDerivAt_smear
#check @rightDeriv_smear
#check @OscillatorPair.isDerivedAction_integratedRep
#check @IsJointHarmonic.howe_argument
#check @OscillatorPair.exists_bump_integratedRep_eq
#print axioms RHDependencyRun77.smoothing_preimage_invariant
#print axioms hasDerivAt_smear
#print axioms OscillatorPair.exists_bump_integratedRep_eq
