import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.lemmaL
import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.WindowHypOfRpow
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
INTEGRATION RUN 11 — 25 Nov 2026 — repair actual failed native verification.
Status: PREPARED, NOT kernel-checked. Original RUN32 commentary below is
historical; its previously executed tests are not rerun claims here.

Mission read first, current blob cd0a176134d46b5b624896e56843a24915c14477;
SWARM, AGENTS, research state/protocol, handoff and live proof consulted.
Peer checkpoints through f5cc7b7b, 04a29a86, 620547cb, d88dd2af,
da4b14d1, dc06e2cf, 5c0c691c, 90346486, a64416c7, 6cfc019c,
842611bb, 0051cd44, 027167d4, 12705f08; prior integration 841814dc.
No new arithmetic premise or claimed RH result imported.

Actual evidence: state branch
compute/rh-landau-diagonal-root-header-fix-20261125/status.json
and job.log.tail.txt, run 45652878741, 252.4s, exit 1. Native compilation
of 29 pinned upstream modules plus three engine modules returned zero.
Index 032 RH32SingletonPoleData failed at original line 175: Measurable
(re composed with Gchi 1 composed with Real.exp) did not match
Measurable (fun u => G (Real.exp u)). Four unqualified scan names
were MISSING; prune errored "not a visible theorem". Original Deduction.poleData
and poleData_char axiom output is propext, Classical.choice, Quot.sound.
Failed candidate rh32_principal_pole_data and rh32_right_of_window
showed sorryAx in addition; this is failed elaboration, not evidence that
the upstream theorem has sorryAx. General CI 45654218337 does not test
this candidate. Baseline engine runs 45577239749/45576756833 remain PASS.

Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. Original peer path
specialists/landau_criterion/RUN32_SINGLETON_POLE_DATA.lean at 0051cd44,
blob d65329bb19571dd9af6a20b44b5525456a82323b, preserved.
Patch: prove equality of the two measurable functions by funext,
using the already established principal Gchi identity pointwise,
then transport measurability by equality. No new assumption.
Qualify the four scan roots and one prune source since engine
RHProofTermPrune.lean uses env.find? on src.getId without namespace
resolution. Engine source blob f6d3e7f6047a7895ecf183be3fb54c203f4fc46a.
Keep original/reduced graph, axiom ledger, conditional endpoint and all
VWinAt(1,401), same-host uniform arithmetic, geometry, entropy and gain
obligations intact. No URT speedup asserted.

Executed: connector read of actual CI logs and pinned original; six
unique forward replacements, six unique inverse replacements and exact
byte-for-byte reconstruction of original source before adding this
comment (13 assertions plus original blob check). Local command -v lean
and command -v lake found neither. No native test of this patch, no
new CI submission. Later RUN33 modules were not reached in failed run.

RESUME HERE: Landau/kernel lane, use this file as RH32SingletonPoleData.lean
in a temporary copy of run_diagonal_root_native_v2.sh (original blob
c00a872bfac3d26cef8dd25e11970ae4299fca2a); change only the RUN32
copy_checked path and expected blob to this integration file and its
retrieved blob. Preserve old runner and sources. Inspect first failure
and all axiom checks; qualify later scan names if actual replay requires.
Do not report PASS until actual new CI output; do not infer proof of [E].
Then return to upstream window suppliers, not additional endpoints.
-/

/-!
RUN32 — directly construct singleton pole data at the native Landau caller.
25 November 2026. Human/source-matched mathematical reduction; native
certificate PREPARED, NOT compiled. The arithmetic window is unchanged.

Mission read first: b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc (unified
engine, ten-page cap, shared pyramid). SWARM 4b77b161d6876915c15cea5a4d4a519beaf5de74,
HANDOFF bbc46df7d7716a6d8863275b5271801eacfaad0d, EXPANSION
c8152d0751072ed693046ada46f8dbcc93d24aab, AGENTS
8db0201da965541e0487d6dd1271e010bdaa0972, continuity
61459cfddab270c187cf628ed60b84749d290a0c, current live manuscript
and openings of research state/log/protocol inspected. Recent peer
commits b158e108 (exceptional kernel), 46b28d29 (unit page),
3003c0aa (slice), d41c3276 (row count), 38b6cc25 (covolume) read
with changed proof blocks/handoffs. Own RUN28/29/30/31 read. Peer
d131f208 RHPrincipalNativeWindow.lean uses formB and the full family
PoleData. This run supplies a direct replacement of that actual
consumer, not another window inequality. No assertion that every
peer archive or external blueprint was reread.

Pin leanprover-community/riemann-hypothesis
40e56bab026552e089d7afcfeff08d2defb9c005. Exact blobs relative to
src/Development/AutomorphicArithmetic/DedekindLFunctions:
CharFamily.lean 81c8dfd66d910d083d5bc88c664c7917fdbdfe96
LandauZeroFreeCriterion.lean 54fd0de979e0dad6ac7709ad8ecbec8a29e21872
LandauTheorems/poleData.lean 1f7fdc4409d2f1185700764c51d5c17a907d76e1
LandauTheorems/mellinGchiModOne.lean 11776c96437e9a4e53fbc3ff06c5e2e8e3c640bc
LandauTheorems/GchiConj.lean 63cdd6a1ec3e729a5465803a19ebcf5ab9c9577c
LandauTheorems/GchiGrowth.lean 0adbad2399f91f6cd547c9195d4464ccb5512d45
LandauTheorems/measurableGchi.lean 3b014d914efcdcf58e8de1823570aeb3c64babf3
LandauTheorems/lemmaL.lean 6c37aebd05121b6d68e3532d8529f0ce8357386f
LandauTheorems/landauWindow.lean 7915058f10b33a52652290cd887cbccdc00e676a
LandauTheorems/WindowHypOfRpow.lean dde1c159371538875c28374574ca7e452b0450d9
LandauTheorems/WindowHypUOfWindowHyp.lean 701f0502ae106ab89e390105cd9c98e6cf881e1a
LandauTheorems/CharFamilyLFunctionNeZeroOfOneLeRe.lean e3aaad883b956e2d45c50bdf6d58367d6f9ef109
LandauTheorems/ZeroFreeOfRpowWindow.lean 2ed00ad3aa862f3e522686557fb8f559b17fc002.
PrimitiveCosets/LevelFamily.lean (relative AutomorphicArithmetic)
d08c25d0cb674297482bec9a235401c14bfb22fa.
Actual pinned bodies inspected. Latest upstream commit observed
d91ae2678eea19a0c3045ffca37f1da757c2e719 (13:24:11 UTC, merge #3142);
advanced since RUN31. No claim of equivalence of new head, no mixing.

## Editor-ready reduction (replace family pole construction, not Landau)

Let G be the native principal centered ramp. For the unique character
modulo one, chi(n)=1 for every n (including n=0, whose Mangoldt weight
vanishes); Gchi(1,x) is exactly the complex embedding of G(x).
Set g(u)=G(exp u), Z={rho: Re rho>0 and zeta(rho)=0}.
Use just ONE application of the pinned poleData_char at the modulus-one
character. It supplies the transform Phi, analyticity away from zeros
in Re>0, the local pole expansion, and isolation. In particular with
H(s)=(s-1)zeta(s), H(1)=1, H'(1)=gamma, the source abstract transform
simplifies exactly to
  Phi(s) = -zeta'(s)/(s(s-1)zeta(s))
           -1/(s-1)^2+(1+gamma)/(s-1).
The apparent pole at one cancels because H is regular there; this is
not the same as assuming zeta regular at one.

At a zero rho of multiplicity m>0, the coefficient of (s-rho)^(-1)
is
  c = -m/(rho(rho-1)).
No inverse-character transform, conjugate family, summed multiplicity
S, positivity of a family of weights or finite-sum interchange is
needed for this construction. The scalar multiplier is nonzero,
because rho is neither 0 nor 1. If rho happens to be real, line-one
nonvanishing implies 0<rho<1, hence c=m/(rho(1-rho))>0. Thus even
the native generic real-pole alternative can be retained, without
requiring an additional proof of absence of positive real zeros.
Measurability and growth use measurable_Gchi and Gchi_growth at
the SAME character, with no finite family sum. Laplace equality
is exactly the one supplied by poleData_char, since Gchi is real.
These facts construct all seven fields of PoleData g Phi Z directly.

For any 0<theta<1, delta>0 and actual WindowHypU g theta delta, apply
the UNCHANGED native landau_window to get Re rho<=theta for every
rho in Z. A zero with Re rho>theta would belong to Z, contradiction.
If starting from the canonical pointwise power window, use the
existing windowHyp_of_rpow and windowHypU_of_windowHyp with the
actual singleton family F already identified by the peer adapter.
Only its equality Gm F=G is consumed, not its zero-free predicate
or any other character. This is a caller-level sufficient bridge.
The arithmetic/topological/geometric construction of [E] and all
same-host quantifiers remain unchanged. The fixed delta=1/2 and
theta=1/2+9eps with sufficiently small eps are legitimate here.
No stronger quantitative bound on primes was obtained this run.

Original local source graph (not complete proof-term graph):
formB -> level_family -> zeroFree_of_rpow_window -> lemmaL
-> poleData(F) -> poleData_char(chi) and poleData_char(inv chi)
+ Gchi_conj + poleData_inv_zero + family sum positivity/analyticity
-> landau_window, with line-one exclusion and WindowHypU conversion.
Overlay: same Gm=G identification and same windows -> WindowHypU;
one poleData_char(1) + measurable_Gchi(1) + Gchi_growth(1)
+ scalar residue sign -> PoleData g Phi Z -> same landau_window.
All original graph, constructor/type/value roles and unresolved
axioms retained. Importing poleData.lean does not by itself remove
its general definitions from the environment; the candidate proof
value does not invoke the generic family theorem. No global
dependency deletion without native scans and caller verification.
Cache context (source pin, principal mod-one character, theta, delta,
actual Gm=G equality). Fall back to original formB if necessary.
No URT comparison claimed.

## Executed exact check and independent native baseline

Local Python/SymPy, exit 0, four symbolic identities: abstract transform
equals canonical transform; pole principal part subtraction factors
exactly; real and imaginary parts of rho(rho-1) are as claimed.
Reproduce:
PYTHON BEGIN
import sympy as S
s,r,m,D,g=S.symbols('s r m D g', nonzero=True)
Q=lambda z: 1/(z*(z-1))
abstract=-(1/(s-1)+D-s*g+1-s)*Q(s)
canonical=-D*Q(s)-1/(s-1)**2+(1+g)/(s-1)
assert S.cancel(abstract-canonical)==0
assert S.cancel(-m*Q(s)/(s-r)+m*Q(r)/(s-r)-m*(s+r-1)/(s*(s-1)*r*(r-1)))==0
b,t=S.symbols('b t',real=True)
num=S.expand((b+S.I*t)*(b-1+S.I*t))
assert S.simplify(S.re(num)-(b*(b-1)-t*t))==0
assert S.simplify(S.im(num)-t*(2*b-1))==0
print('4 exact symbolic identities; exit 0')
PYTHON END
Denominators interpreted only away from 0,1,rho. These identities
do not certify an analytic continuation theorem or the new Lean code.

Local command -v lean/lake returned no paths. Actual CI status JSON
retrieved: 45577239749 blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
pass, 98.87s; 45576756833 blob 7da354941e402b6f8b364ed03d8c5c82d27b7717
pass, 77.94s. Conditional strip root axioms propext, Classical.choice,
Quot.sound; bounded rh_of_right scan 2000 visited, 324 pending, no
binder removal. These existing jobs are NOT verification of this file.
Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
No new CI job submitted; no new kernel axiom ledger asserted.
No imported claimed RH theorem. No proof of [E].

RESUME HERE: native replay of principal_pole_data and
principal_right_of_window, checking actual source signatures and
axioms; compare original generic family and specialized proof-value
reachable graphs in pinned environment. Keep all missing upstream
arithmetic/geometry leaves. Do not expand manuscript if the existing
one-paragraph singleton proof suffices.
HANDOFF TO integration/editor, kernel extractor, formal audit.
-/

open Complex MeasureTheory Set Filter Topology
noncomputable section
namespace Deduction

theorem rh32_principal_Gchi (x : ℝ) :
    Gchi (1 : DirichletCharacter ℂ 1) x = (G x : ℂ) := by
  have h2 : ∀ n : ℕ, (1 : DirichletCharacter ℂ 1) n = 1 :=
    fun n => MulChar.one_apply (isUnit_of_subsingleton _)
  apply Complex.ext <;>
    simp [Gchi, G, ramp, h2, Complex.re_sum, Complex.im_sum,
      Complex.mul_re, Complex.mul_im]

def rh32_Z : Set ℂ := {ρ | 0 < ρ.re ∧ riemannZeta ρ = 0}

theorem rh32_principal_pole_data :
    ∃ Φ : ℂ → ℂ, PoleData (fun u => G (Real.exp u)) Φ rh32_Z := by
  obtain ⟨Φ, hInt, hAn, hPol, hIso⟩ :=
    poleData_char (1 : DirichletCharacter ℂ 1) (Or.inl rfl)
  simp only [DirichletCharacter.LFunction_modOne_eq] at hAn hPol hIso
  refine ⟨Φ, ?_⟩
  refine PoleData.mk ?_ ?_ ?_ ?_ ?_ ?_ ?_
  · have h := Complex.measurable_re.comp
      ((measurable_Gchi (1 : DirichletCharacter ℂ 1)).comp Real.measurable_exp)
    have he : (Complex.re ∘ Gchi (1 : DirichletCharacter ℂ 1) ∘ Real.exp) =
        (fun u : ℝ => G (Real.exp u)) := by
      funext u
      change (Gchi (1 : DirichletCharacter ℂ 1) (Real.exp u)).re = G (Real.exp u)
      rw [rh32_principal_Gchi, Complex.ofReal_re]
    rw [he] at h
    exact h
  · obtain ⟨C, hC⟩ := Gchi_growth (1 : DirichletCharacter ℂ 1)
    refine ⟨C, fun u hu => ?_⟩
    have h := hC (Real.exp u) (Real.one_le_exp hu)
    rw [rh32_principal_Gchi, Complex.norm_real, Real.norm_eq_abs] at h
    simpa only [sq, ← Real.exp_add, two_mul] using h
  · intro s hs
    simpa only [rh32_principal_Gchi] using hInt s hs
  · intro ρ hρ
    exact hρ.1
  · intro s hs
    have hpos : 0 < s.re := hs.1
    have hs0 : s ≠ 0 := by
      intro he
      simp [he] at hpos
    have hn : riemannZeta s ≠ 0 := fun hz => hs.2 ⟨hpos, hz⟩
    exact (hAn s hs0 hn).differentiableAt.differentiableWithinAt
  · intro z _
    filter_upwards [hIso z] with w hw hwZ
    exact hw hwZ.2
  · intro ρ hρ
    have hp : 0 < ρ.re := hρ.1
    have hz : riemannZeta ρ = 0 := hρ.2
    have hr0 : ρ ≠ 0 := by
      intro he
      simp [he] at hp
    have hrlt : ρ.re < 1 := by
      by_contra hn
      exact riemannZeta_ne_zero_of_one_le_re (le_of_not_gt hn) hz
    have hr1 : ρ ≠ 1 := by
      intro he
      simp [he] at hrlt
    obtain ⟨m, hm, h, han, hev⟩ := hPol ρ hr0
    have hm0 : m ≠ 0 := fun he => (hm.mp he) hz
    have hmpos : (0 : ℝ) < m := by exact_mod_cast Nat.pos_of_ne_zero hm0
    refine ⟨(m : ℂ) * (-1 / (ρ * (ρ - 1))), ?_, ?_, h, han, hev⟩
    · exact mul_ne_zero (by exact_mod_cast hm0)
        (div_ne_zero (by norm_num) (mul_ne_zero hr0 (sub_ne_zero.mpr hr1)))
    · intro him
      have hrx : ρ = (ρ.re : ℂ) := by
        apply Complex.ext <;> simp [him]
      have hc : (m : ℂ) * (-1 / (ρ * (ρ - 1))) =
          (((m : ℝ) * (-1 / (ρ.re * (ρ.re - 1)))) : ℝ) := by
        push_cast
        rw [← hrx]
      rw [hc, Complex.ofReal_re, Complex.ofReal_im]
      exact ⟨mul_pos hmpos (div_pos_of_neg_of_neg (by norm_num)
        (mul_neg_of_pos_of_neg hp (by linarith))), rfl⟩

theorem rh32_right_of_windowU {θ δ : ℝ} (hθ : 0 < θ)
    (hθ1 : θ < 1) (hδ : 0 < δ)
    (hW : WindowHypU (fun u => G (Real.exp u)) θ δ) :
    ∀ s : ℂ, θ < s.re → riemannZeta s ≠ 0 := by
  obtain ⟨Φ, hP⟩ := rh32_principal_pole_data
  intro s hs hz
  exact (not_le_of_gt hs)
    (landau_window hP hθ hθ1 hδ hW s ⟨hθ.trans hs, hz⟩)

theorem rh32_right_of_window (F : CharFamily)
    (hF : ∀ y, Gm F y = G y) {θ δ C : ℝ}
    (hθ : 0 < θ) (hθ1 : θ < 1) (hδ : 0 < δ)
    (h : ∀ Y₀ : ℝ, ∃ Y : ℝ, Y₀ ≤ Y ∧
      ∀ y ∈ Icc Y (Y ^ (1 + δ)), G y ≤ C * y ^ θ) :
    ∀ s : ℂ, θ < s.re → riemannZeta s ≠ 0 := by
  have hf : ∀ Y₀ : ℝ, ∃ Y : ℝ, Y₀ ≤ Y ∧
      ∀ y ∈ Icc Y (Y ^ (1 + δ)), Gm F y ≤ C * y ^ θ := by
    simpa only [hF] using h
  have hw := windowHypU_of_windowHyp F hδ (windowHyp_of_rpow F hδ hf)
  have he : gm F = fun u => G (Real.exp u) := by
    funext u
    exact hF _
  rw [he] at hw
  first
  | (rh_reduce 2 using [rh32_right_of_windowU]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact rh32_right_of_windowU hθ hθ1 hδ hw

rh_scan Deduction.poleData limit 2000
rh_scan Deduction.lemmaL limit 2000
rh_scan Deduction.rh32_principal_pole_data limit 2000
rh_scan Deduction.rh32_right_of_window limit 2000
rh_prune Deduction.rh32_right_of_window as RH32PrincipalRightPruned
#print axioms poleData
#print axioms poleData_char
#print axioms rh32_principal_pole_data
#print axioms rh32_right_of_window

end Deduction
