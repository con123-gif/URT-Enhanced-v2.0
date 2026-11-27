import Lib.DiscreteSeries.Theta.LocalThetaCorrespondence
import Mathlib.Tactic

/-!
# RUN75 — one polar average, direct off-cone cancellation and Casimir transfer
2026-11-27. SOURCE-MATCHED / human mathematical replacement candidates,
not native verification or full RH. Credit Alpöge, Sernau, Anthropic
collaborators and Claude. Compact source pin lsernau/grh-lean@
72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Original pin
leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005
src/Main.lean blob dbd5db70bc11b35f18fa5751216ab335321e7bfc re-read.
Mission a69122b6ad568910a45d2bc13961ab9da4855143, mandatory engine,
SWARM_PROTOCOL, HANDOFF_QUEUE, AGENTS, continuity, latest peer commits read.
Observed branch head fced77632c2a9b46f8141eddd7c28b4ab5ea7947.
Previous dependency RUN74 e8b07e408557a80747858e12afe502f81d7bbd63.
Peer integration 42bc7348, audit 85d03bf7, editor 38cee09b work on
different global exchange/majorant branches; no duplicate.

Actual source anchors (compact):
* Lib/DiscreteSeries/Rigidity/KernelFixes.lean
  b7c9218680d4848f11347c91dd6a952ee9b1a0ca:
  exists_integration_by_parts, integratedRep_dsKernel_casimir,
  integratedRep_eq_zero_of_notMem_rootCone, re_integratedRep_dsKernel_pos.
* Lib/DiscreteSeries/Theta/LocalThetaCorrespondence.lean
  2a5c865a64dcbd1a9c75218fcc4d93ee4b4c6bf8:
  OscillatorPair.re_inner_integratedRep_pos, integratedRep_fix,
  exists_bump_integratedRep_eq. Read actual bodies; these are the
  two downstream consumers of positivity/Casimir and Howe generation.
* Lib/DiscreteSeries/FlenstedJensen/PsiBasic.lean
  d888fafb9db9b1a5e78aa2551a1480f0cf057d20: dsCoeff_polar, dsCoeff_inv,
  dsCoeff_neg, weightMinors_unitary_inv.
* Lib/DiscreteSeries/FlenstedJensen/KTypeProjection.lean
  f6c936f970a93a7318e5ea3ebe61f8c7dae77d2a:
  integral_conj_weightMinors_mul_dsCoeff (including off-cone branch).
* Lib/DiscreteSeries/FlenstedJensen/PsiDecay.lean
  2ca9efe4949fe0b10512153a3562daf2b97d2edf: weightMinors_pos.
* Lib/DiscreteSeries/FlenstedJensen/RepresentationDefs.lean
  94fea15fbc65ed74c2a44e83dda2cd423d39fbea: weightMinors, IsUnitaryRep,
  IsDerivedAction, IsKHighest, GlModule.casimir.
* Lib/DiscreteSeries/CuspKernel/SchurOrthogonality.lean
  7be5411c2c4c3662db6f10be4c7fda7f63c27287:
  integrable_norm_pow_smul, formalDegree_pos, dsCoeff_schur_orthogonality.

## 1. Audit of RUN74 compact projector
The order in IsKHighest is decreasing l, i.e. increasing -l;
IsKDominant makes the exterior power differences nonnegative in that order.
The determinant twist accounts for negative weights. On K each threshold
minor splits over the sign blocks, and the determinant denominators split
as well. Peter-Weyl and finite-dimensional compact highest-weight theory
give the exact scalar identity in RUN74. A simpler implementation is
to use the Hilbert completion of the positive invariant form B:
the canonical map X -> H is bounded and injective (not necessarily
an isometry for the original Banach norm), pi extends to a strongly
continuous unitary representation on H by density and unitarity.
Its isotypic orthogonal projectors commute with the compact action and
the derived action on the supplied vectors. For each type the orbit
of the projected vector is finite-dimensional by the matrix-coefficient
expansion of the character integral. Highest-weight uniqueness and
Peter-Weyl completeness force the given highest vector into the single
correct isotypic summand. Compact Schur averaging then proves
  A_nu x = int_K conj(m_nu(k)) pi(k)x dk = c_nu x,
  c_nu = int_K |m_nu|^2 = 1/dim V_nu > 0.
For X complete the Bochner integral in X maps to the same Hilbert
integral by boundedness and injectivity; when X is incomplete the
scalar identities extend through its Banach completion (compact action
uniformly bounded) and the Hilbert map may cease to be injective on
that completion. In that case retain RUN74's original Banach
Peter-Weyl proof, rather than infer injectivity on the completion.
This is a same-lane recheck, not an independent audit. The classical
compact background remains an explicit replacement premise.

## 2. Positive kernel: two compact integrals become ONE positive one
G = U(diag eps), K with probability Haar, x=iota(v), Lambda lowest K-type,
m=weightMinors Lambda, c=kTypeNormSq>0, D=formalDegree>0, psi=dsCoeff.
Retain hg, hu, hd, hv, complete X and weighted integrability from
KernelFixes. B is conjugate-linear in its first argument. Put
  F(g)=D conj(psi(g)) B(x,pi(g)x).
Let Q(g)=int_{KxK} F(p g q^-1) dp dq.
Absolute integrability on KxKxG follows by Tonelli and left/right Haar
invariance from integrability of F (native weighted bound and B bounded).
Consequently int_G Q = int_G F. For each g=k0 z with z positive definite
in G, absorption of k0 in p gives Q(g)=Q(z).
The source dsCoeff_polar is exactly
  psi(p z q^-1)= (1/c) int_K m(pu) conj(m(qu))/d_z(u) du,
  d_z(u)=weightMinors(-paramAddRho l)(u* z u)>0.
The denominator is real strictly positive by weightMinors_pos.
All these integrands for fixed z are continuous on a compact domain;
d_z has positive minimum. Substitute the conjugate polar formula
into Q and change p'=pu, q'=qu. The argument of pi becomes
p' (u^-1 z u) q'^-1, with scalar weights conj(m(p')) m(q').
The q' average is exactly A_Lambda x=c x by inversion and
m(k^-1)=conj(m(k)). The p' average of conj(m(p')) B(x,pi(p')y)
is B(A_Lambda x,y)=c B(x,y), by invariance, inversion and
conjugate-linearity. Therefore the single identity is
  Q(g)=D*c * int_K B(x,pi(u^-1 z u)x)/d_z(u) du.             (POS)
No unspecified Haar or formal-degree scalar. In particular the two
compact factors c^2 cancel the denominator c to leave c, not 1/c.
Conjugation by u preserves positive definiteness. The source hp says
each numerator is strictly positive as a real complex number. Thus
Q(g)>0 everywhere, and its integral has strictly positive real part
(nonzero full-support Haar, integrability). This is the exact conclusion
re_integratedRep_dsKernel_pos, at re_inner_integratedRep_pos on the
actual joint harmonic Phi with B=realInner. No prior discrete series
existence or stronger noncompact irreducibility assumption.

Weaker sufficient premise: x != 0 and Re B(x,pi(z)x)>=0 for all
positive definite z. Then Re Q>=0 everywhere by (POS). Moreover Q is
continuous by locally uniform boundedness of the compact translates
(strong continuity, compact p,q, bounded B and psi). At identity
d_1=1 and Q(1)=D*c*B(x,x)>0. Haar full support makes its integral
strictly positive. This weakens hp at THIS consumer if the oscillator
supplier can exploit it; no change to other calls of hp.inner_pos.
The x!=0 guard is essential (zero vector counterexample); strict
positivity near identity alone cannot eliminate negative contributions
elsewhere. Do not confuse (POS) with a pointwise assertion F(g)>=0.

## 3. Off-cone: cancel BEFORE norm or Hilbert witness
In integratedRep_eq_zero_of_notMem_rootCone keep arbitrary y in G,
highest weight nu, q:nu-Lambda outside rootCone. Source derives
K-dominance hnu using hu and hd; retain that step. Let A_nu x=c_nu x
as above. Weighted integrability ensures the vector integral
T_y=integratedRep pi l.dsKernel (pi(y)x) exists. Right invariance
of Haar yields T_y=D int_h conj(psi(h y^-1)) pi(h)x dh.
Insert A_nu and change variables h'=h k, then invert k in K:
  c_nu T_y
    = D int_h [int_K conj(m_nu(k)) conj(psi(h k^-1 y^-1)) dk]
                  pi(h)x dh
    = D int_h conj(int_K conj(m_nu(k)) psi(h k y^-1) dk)
                  pi(h)x dh
    = 0.                                                     (CONE)
Here the compact projection is the actual KTypeProjection at the
two arguments (h,y^-1). q implies nu != Lambda because zero belongs
to rootCone. Fubini is valid: before changing variables, the integrand
is bounded in norm by the weighted integrable translated psi times
a fixed compact action bound on pi(k); after change the same L1
bound holds by Haar invariance. Right translations by fixed y
preserve integrability with the polynomial norm weight by
submultiplicativity. Since c_nu>0, T_y=0. No construction of a
separating B witness or separate Hilbert realization inside this
off-cone proof. Equivalently do this scalarwise for all bounded
functionals and separate by Hahn-Banach. Do not remove hu globally:
it still supplies growth, dominance and the other consumers.

## 4. Integration by parts via one finite translation difference
Set P(f)=D int_G f(g) pi(g) dg in strong operator sense on
(-l).DsModule. For Y real in the unitary Lie algebra and u=iota(v),
H_g(t)=f(g exp(tY)) pi(g exp(tY))u has derivative
  H'_g(t) = [(Yf)(h)pi(h)u + f(h)pi(h)iota(rho(Y)v)],
  h=g exp(tY).
Each summand at t=0 is integrable in g by the SAME source
integrable_norm_pow_smul hg.neg for f and Yf and the fixed vectors.
For t in [0,1], the integral of the norm is independent of t by
right Haar, so joint Fubini is valid; no pointwise uniform-in-g
dominating derivative required. The fundamental theorem of calculus
at each g, then Haar cancellation of H_g(1)-H_g(0), gives
  P(f)iota(rho(Y)v) = -P(Yf)iota(v).
Extend complex-linearly using the real form decomposition
Y=Y1+iY2; no differentiation in complex group directions.
By dsCoeff_neg, P(dsGenerator for -l)=integratedRep pi l.dsKernel.
Linearity in f follows from integrability. Transfer the full
Casimir (source casimirK at signs 1) by applying the identity twice:
  sum_ab P(f)iota(rho(E_ab)rho(E_ba)v)
    = sum_ab P(E_ba E_ab f)iota(v)
    = P(Omega f)iota(v).
The two minus signs and the index swap are exact; no norm or sign
inequality involved. Omega on the negative-parameter generator is
c(-l)=c(l), by CasimirOnPsi and twoRho_neg. This yields the actual
integratedRep_dsKernel_casimir, preserving the all-Y,f,v statement
needed in exists_bump_integratedRep_eq, not just the Casimir special
case. integratedRep_fix uses the exact scalar Casimir, not a bound.
Retain CasimirOnPsi, right derivative smoothness, growth and decay.

## 5. Frontier / verification
Original source-visible: oscillator positive -> re_integratedRep_dsKernel_pos
-> compact scalar projector + skew integral + polar formula; oscillator
generation -> integratedRep_eq_zero_of_notMem_rootCone -> compact
projector + off-cone KTypeProjection + separating B witness;
partner fix -> integratedRep_dsKernel_casimir -> exists_integration_by_parts.
Candidate: (POS), (CONE), finite translation identity and the two-sign
Casimir transfer directly at these same callers. The actual
nonconstant/off-cone KTypeProjection, strong-integral bound, polar
formula, CasimirOnPsi, oscillator inner positivity or weaker nonnegative
premise and Howe argument remain. No global graph deletions; all
old graphs/axioms remain intact, including original CorG/prime windows.
No claim that this path exhausts the native root. No URT invoked.
Local command -v lean/lake/elan found none. Cannot execute native
rh_scan/prune/reduce/auto/frontier. Prepared scalar checks below are
NOT new kernel verification of POS/CONE; no numerical simulation
substituted for proof. Existing CI receipt re-read on
cathedral-research-state:
compute/rh-compact-targeted-replay-20261126/outputs/targeted_results.json
blob 23de197bd48f404ca2074c69676de289c4f7934e,
all_requested_checks_ok=true, full_RH_replay=false. It lists scalar
and RootsOfUnityPoints, ModuleIndex, Heights checks with only
propext, Classical.choice, Quot.sound; none of this file's new claims.
No new CI PASS. Original and candidate reduced source graphs are
described above; not an elaborated dependency graph.

RESUME HERE: read actual OscillatorPair.inner_pos and Howe argument
consumers, see whether nonnegativity suffices to eliminate a strict
positivity supplier; audit the remaining polynomial module
invariance at exists_bump_integratedRep_eq. Keep both sides of the
Casimir transfer and exact fixed-vector conclusion. Request batch
replay of native KernelFixes and LocalThetaCorrespondence through
existing compact CI, with axioms and proof-term roles, when available.
HANDOFF TO integration/editor, audit and kernel extractor.
RH OPEN; no weighted prime-window bound or central mR <= fa(log b)^5
derived by this local result.
-/

namespace RHDependencyRun75

theorem polar_mass_cancel (D c I : ℂ) (hc : c ≠ 0) :
    D / c * (c * c * I) = D * c * I := by
  field_simp
  <;> ring

theorem off_cone_cancel (c T : ℂ) (hc : c ≠ 0) (h : c * T = 0) :
    T = 0 := (mul_eq_zero.mp h).resolve_left hc

theorem two_sign_transfer (a b c : ℂ) (h₁ : a = -b) (h₂ : b = -c) :
    a = c := by rw [h₁, h₂, neg_neg]

end RHDependencyRun75

#check @HCParam.IsKHighest.integral_conj_weightMinors_smul
#check @integratedRep_eq_zero_of_notMem_rootCone
#check @re_integratedRep_dsKernel_pos
#check @exists_integration_by_parts
#check @integratedRep_dsKernel_casimir
#check @OscillatorPair.re_inner_integratedRep_pos
#check @OscillatorPair.integratedRep_fix
#check @OscillatorPair.exists_bump_integratedRep_eq
#print axioms RHDependencyRun75.polar_mass_cancel
#print axioms RHDependencyRun75.off_cone_cancel
#print axioms RHDependencyRun75.two_sign_transfer
#print axioms re_integratedRep_dsKernel_pos
#print axioms integratedRep_eq_zero_of_notMem_rootCone
#print axioms integratedRep_dsKernel_casimir
