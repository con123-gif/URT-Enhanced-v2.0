import Mathlib

/-!
# Formal audit — a single native positive adapted datum majorizes the entire rational theta sum
27 November 2026. AGREE / PARTIAL. Source-matched human argument, conditional
on the explicitly retained native model and classical stable-range convergence;
not a kernel replay or a proof of RH. Credit Alpöge, Sernau, Anthropic
collaborators and Claude.

Original pin leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob a69122b6ad568910a45d2bc13961ab9da4855143 (mandatory engine read);
SWARM_PROTOCOL 4b77b161d6876915c15cea5a4d4a519beaf5de74;
HANDOFF_QUEUE bbc46df7d7716a6d8863275b5271801eacfaad0d; AGENTS and
research state/protocol and current CI inspected.
Peer integration native bridge blob a51ebd8c94f0c26b46aa68b250e54d6eaf0c130d,
dual datum blob 862200f0eb186e3f7af0b9b18eda71113a37a0dc.
Read recent literature RUN74 a26c8f8c, Landau RUN74 0a9f1882,
URT RUN78 0e9b893e, prime RUN76 d12d3e6. Landau/URT already independently
audit F3--F10 and the weak-rank local premise; do not count those again.
Agreement with their use of ext_integrated rather than postulating a tensor
factorization of the native Banach space. This run audits and strengthens
the common absolute supplier at the distinct Rallis caller.

## 1. Retain the exact finite-probe zero-term argument (literature RUN74)
Let P be the complete splitting, L0=P.lagrangian, X the native data
Banach space, E0 its bounded zero evaluation, and Omega the native split
Weil action. For L=gamma^-1 L0 use E_L=E0 Omega(gamma,1). This follows
from zeroTerm_isometrySplitting applied to gamma^-1, composition with P,
and independence of splitting; the inverse in the label is essential.
The actual Iwasawa law has gamma*kappa acting on P's frame by a, with
kappa in maxCompact. Thus gamma=(gamma*kappa)*kappa^-1, and
    |E_L(f)| = sqrt(ideleAbs det(a))^M |E0 Omega(kappa^-1,1) f|.
No inverse on a. The coefficient is strictly positive, since a is GL.
The same equality holds for operator norms after taking the supremum.
For each k in the fixed compact K the nonzero functional E0 Omega(k)
has a nonzero value on an adapted vacuum orbit vector by ext_of_vacElem.
Rescale the vector and use continuity to get a neighborhood with value
of modulus >1. Compactness gives a finite set of probes, chosen before
L. Uniform boundedness on K gives R, so
    ||E_L|| <= R sum_j |E_L(v_j)|.
Absolute classical Eisenstein convergence on these actual Schwartz
probes proves summability. AGREE with this orientation and quantifier
order, conditional on the rational phase bridge and classical theorem.
This avoids the unadapted-vacuum phase issue; no claim to have independently
reconstructed the whole classical theorem or the native representation.

## 2. New reduction: the SAME adapted orbit supplies a positive theta majorant
Take the actual complete Hom splitting D=P.homSource T.
Write Q=Mat_(M,r)(A_E) in rational target coordinates, and define
    J f(x)=theta_0(P.sourceTerm T (T.x^-1 x) f).
By sourceTerm_eq_mixedTerm this is evaluation of D.mixedTerm(vec(x)).
The source theta expansion is exactly theta(f)=sum_(xi rational) Jf(xi).
Let v0 be an adapted vacuum. The native adapted formula and the explicit
vacuumFn show
    Jv0(x_inf,x_f)=c G(x_inf) 1_Lambda(x_f),
where c!=0, G a strictly positive real Gaussian, Lambda a compact open
additive lattice in Q_f. Indeed the adapted formula uses the squared
modulus of vacuumFn; the finite character has norm one, also above 2.
The adelic invertible adapted coordinate change simply pulls back the
lattice and Gaussian. The zero-dimensional complement theta value is
a fixed nonzero scalar (its data space is one-dimensional). Absorb it
in c. Normalize v0 by c^-1. No new finite splitting-character choice.
No unadapted vacuum peak or phase regularity is needed for this argument.

Use exists_tsum_mixedTerm_le, with its actual vector-space compact B
pulled back through matToVec. Let C be its fixed M times the operator
norm of the complement theta. For every h and every f, the exact target
pullback gives J(Omega(1,h)f)(xi)=Jf(h_rat^-1 xi).
Here h_rat is T.x * h.mat * T.x^-1, not the standard-coordinate h.mat
acting directly on rational xi. The map xi -> vec(h_rat^-1 xi) is additive,
injective, sends the rational lattice to a discrete subgroup, and is
the same map as at ZeroTermHeight:137 with dyadicDiag(0)=1. Therefore
    sum_(xi rational) |Jf(h_rat^-1 xi)|
       <= C ||f|| # {xi rational : h_rat^-1 xi in B}.       (A)
This is an absolute sum of all terms, stronger than a bound on
|theta(Omega(1,h)f)|; no rearrangement of a conditionally convergent
series. At x=0 the larger window B*integral matrices in the general
native torus estimate is unnecessary. Every count is finite by
discreteness and compactness, including r=0.

Now project B to Q_inf and Q_f, both compact. Since Lambda is open,
Q_f/Lambda is discrete. The image of the compact finite projection
of B in this quotient is finite. Choose representatives a_1,...,a_J
of its distinct cosets, ONCE before h and f. If B is empty the
bound is trivial. Extend each a_j by zero infinite coordinate.
By the exact pure-translation mixed Heisenberg law (frequency and
complement coordinates zero), there exists a native orbit vector
v_j=rho(-l(a_j)) (c^-1 v0) with
    Jv_j(x)=G(x_inf) 1_(a_j+Lambda)(x_f).
Here l(a_j) denotes the pure-translation vector of D at vec(a_j);
the minus sign follows the native f[x+a] law. No projective factor
survives because frequency=0. The complex linearity of theta_0
preserves the chosen normalization. Each of these is a genuine
native vector and has the same Schwartz--Bruhat Gaussian/lattice shape.

Let m_B=min_(x_inf in proj_inf B) G(x_inf)>0 and set
    v_B=m_B^-1 sum_j v_j.
Then Jv_B>=0 EVERYWHERE and Jv_B>=1 on B. Crucially this is a single
native datum in the finite linear span of the SAME adapted orbit
already used in the rational-phase and finite-probe proofs. No
surjectivity of the native model onto all Schwartz functions and
no separate arbitrary classical positive majorant need be asserted.
The finite cosets can be chosen disjoint, but only coverage is needed.

Combining (A) with this exact majorization yields the decisive bound
    sum_(xi rational) |Jf(h_rat^-1 xi)|
        <= C ||f|| theta(Omega(1,h) v_B).                    (B)
The right side is real nonnegative by termwise target covariance
and the exact theta expansion, without an assumption about signs
of general native theta functions. It is also rational-left-invariant:
for rational tau the change xi -> tau^-1 xi bijects the rational
matrix set. Continuity/measurability comes from the native theta
functional and target representation. Classical stable-range
absolute theta convergence on the ONE Schwartz--Bruhat image Jv_B
proves integrability of this positive function on the quotient
with native Haar (probability Haar times the finite volume).
This step invokes ONLY the retained classical convergence theorem,
NOT native siegel_weil or theta_normalisedTorus_le to prove its
own convergence. It does not require the full classical-to-native
comparison at arbitrary source adelic points. The rank condition
M>2r stays in the classical stable-range input.

Thus (B) supplies the original required common N(h) for ALL native f,
and also absolute summability of their rational theta terms in L1
uniformly in ||f||. This gives a common majorant from the same adapted
core even if one avoids the unadapted vacuum peak argument, and
avoids introducing a second unrelated family of classical vectors.
It is an alternative to bridge (19)--(20), not a contradiction to it.

## 3. Actual caller, dependency invariant, remaining premises
SharpData.inner_product_formula:166--167 needs both the sum of norms
of zero-term operators and a common integrable theta majorant.
Its only use of H in line 191 is H _ 0. Combine the finite-probe
argument of section 1 with (B) for the SAME graph complete splitting
and height-reduced doubled datum d(g,g'). The rapid-form bound
line 175--178 controls integral ||d||. Tonelli first bounds the
nonnegative absolute theta sum by C integral N times integral ||d||;
the signed Fubini swap at 189--192 then follows. Keep the separate
absolute graph unfolding at 179--186, graph cancellation, normalization,
quotient Haar and rapid-form inputs. No need to control uniform
norms of the varying sharp datum f'_A in the later cutoff limit.

Original human edges: identity theta majorant <- mixed Wiener window
+ target covariance + arbitrary positive classical Schwartz Phi
+ classical convergence. Zero-term norm bound <- unadapted vacuum
peak/phase or finite-probe lemma.
Reduced human edges: theta majorant <- mixed Wiener window + exact
adapted formula and pure translations + finite lattice coset cover
+ exact target covariance and theta expansion + classical convergence
on v_B. Zero-term norm bound <- literature finite probes with
positive Iwasawa scalar. Both use the already retained adapted orbit.
The actual native dependency graph remains unchanged; other callers
of the full torus estimate retain it. Context key: source pin, same
S,T,P,D, same J, normalization, adapted coordinates and B, all
h,f, strict rank and quotient Haar. No premise is globally deleted
by this audit. Open: full upstream kernel coverage, remaining A/C
primitive suppliers, noncoherent absolute amplitude/exchange and
weighted prime lower bound for every epsilon on arbitrarily distant
windows. URT not needed.

Exact source receipts, fetched bodies:
- Lib/Weil/MixedModel/ZeroTerm.lean e26a6037c53efb630f1dd8cf959aef3e0855fc5d:
  575--590 exact mixed law and uniform Wiener count; 613--619 adapted formula.
- Lib/Weil/Construction/AdelicHeisenberg.lean 6d56fe0aa1762a56778d40f9086f69e721f91b14:
  12--24 vacuumFn and adelicHeis; modulus-square removes finite phase.
- Lib/Weil/DualPair/PairSplitting.lean 7060d2715dc64318e5f657357bce32c32bf11772:
  264--288 sourceTerm, coordinate change, theta sum, translation.
- Lib/SiegelWeil/Formula/ZeroTermHeight.lean 0a910704dae028b30156fc8ab362d3425e50ada8:
  77--90 splitting independence, rational inverse; 112--114 target
  pullback; 129--142 actual count; 150--156 parabolic norm formula.
- Lib/Weil/Construction/PairDefs.lean 8a5eaed1249fcc1c482e3af4f15373682fa34af1:
  227--229 ext_of_vacElem.
- same-pin readable grh/src/Lib/Adelic/Witt/IwasawaDecomposition.lean
  5d19000318957195c1d4176e2bc9d351f25639e8:614--624 gamma*kappa convention.
- Lib/SiegelWeil/RallisInner/SharpData.lean ea9f665a9a89411f1353d098ff2e0a4e59a719f5:
  150--195 actual two-bound use.
- Lib/SiegelWeil/Formula/SiegelWeilFormula.lean 4277ff0a84d10e7e1f73516d9ff76505072899ea:
  20--35 native identity and convergence; not used as premise for (B).
External classical convergence remains exactly the Liu 2011 Thm 2.1(1)
input verified by earlier literature lane; no new external theorem invoked.

## 4. Executed and prepared evidence
Local command -v lean and lake empty, so native rh_scan/rh_prune/
rh_reduce/rh_auto/rh_auto_frontier not executed here. Generic finite
cover lemma below prepared only; it is not a kernel certificate of
the native mixed-model argument. Failed lookup at compact/src and
src was corrected to grh-compact/src; readable grh/src SharpData is
different and not used for actual compact caller matching.
Actual local Python residue-partition negative-control test:
    from itertools import product
    checks=neg=0
    for m in (2,3,4,5):
      for d in (1,2):
        Q=list(product(range(m),repeat=d))
        for a in Q:
          for x in Q:
            assert int(x==a)<=sum(int(x==b) for b in Q)
            assert sum(int(x==b) for b in Q)==1
            checks+=2
        assert any(x!=Q[0] for x in Q); neg+=1
    print(checks,neg)
Actual output 2064,8; checks only finite cover/partition algebra,
not native convergence. The unshifted single lattice fails to cover
general compact windows; the translated positive finite sum fixes it.
The actual historical CI state branch status JSONs for runs 45577239749
and 45576756833 returned status pass and returncode 0, conditional root
and bounded scan only. Compact replay targeted_results.json explicitly
has six named B/C axiom checks (propext, Classical.choice, Quot.sound),
A module build returncode 124, all_requested_checks_ok=false,
full_RH_replay=false. No new kernel discharge or axiom result.
Original graph evidence and all prior records preserved.

RESUME HERE: integration/editor use (B) and literature finite probes
as the common adapted-core convergence proof at SharpData:166 and 191;
kernel lane replay the finite cover inequality and actual native
instantiation when environment available. Next audit the noncoherent
absolute-amplitude/exchange at its actual caller, not the already
audited phase cancellation of URT RUN78; retain the native absolute
window bounds. HANDOFF TO integration, literature, positivity,
kernel extractor, editor. RH remains OPEN.
-/

namespace RHAuditAdaptedMajorant

/-- The finite positive-cover scalar step; compactness and model
    identities are separate premises. Prepared, not compiled. -/
theorem finite_positive_cover {ι : Type*} (s : Finset ι)
    (q : ι → ℝ) (m : ℝ) (hm : 0 < m)
    (hq : ∀ i ∈ s, 0 ≤ q i)
    (hc : ∃ j ∈ s, m ≤ q j) :
    1 ≤ m⁻¹ * ∑ i ∈ s, q i := by
  obtain ⟨j, hj, hjq⟩ := hc
  have hs : q j ≤ ∑ i ∈ s, q i :=
    Finset.single_le_sum (fun i hi => hq i hi) hj
  have h := mul_le_mul_of_nonneg_left (hjq.trans hs) (inv_nonneg.mpr hm.le)
  simpa [ne_of_gt hm] using h

#print axioms finite_positive_cover
end RHAuditAdaptedMajorant
