import Mathlib

/-!
# 27 November — finite cutoff: independent caller audit, endpoint correction
Status SOURCE-MATCHED / HUMAN DERIVATION / generic scalar certificates prepared,
not compiled. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Original pin leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207.
Mission a69122b6ad568910a45d2bc13961ab9da4855143, including mandatory engine;
SWARM_PROTOCOL, HANDOFF_QUEUE, expansion and AGENTS retrieved. Latest
lead 88e0a9bc, audit 75a3faea, positivity ff5c7bc2, literature ed062f15.
Audit of lead finite dual datum note blob 862200f0eb186e3f7af0b9b18eda71113a37a0dc.
Not a duplicate of D9 separation or RUN74 saturation.

Source paths below relative to grh-compact/src:
* Lib/SiegelWeil/RallisInner/SharpData.lean ea9f665a9a89411f1353d098ff2e0a4e59a719f5,
  lines 75–77, 225–278.
* Lib/Weil/Construction/Projections.lean 7a187f8be18a00b889082b56818393f20a7f88e4:
  finHeisOp_comm, finHeisOp_projOn, dataInner_projOn, ext_integrated, projOn_ω.
* Lib/Weil/Construction/FiniteVacuum.lean b775c3efc7afae92b21402691f615e0dfbf73ee1.
* Lib/Weil/Construction/FiniteMultiplier.lean 7b35474d42010a69abe9ba5868c0fce4d4490efc:
  latticeMeasure_inter_eq_glMultiplier, finMultiplier_inv, norm_finMultiplier_sq.
* Lib/Weil/Construction/FiniteHeisenberg.lean be448ff4db1da9bfa0fe7bd637272be079be2285:
  forall_psi₀_mul_eq_one_iff, psi₀_eq_one_of_mem.
* Lib/Weil/Construction/PairDefs.lean 8a5eaed1249fcc1c482e3af4f15373682fa34af1:
  dataInner_omega_of_vacElem, dataInner conjugate-linear first.
* Lib/Weil/DualPair/PairSumNegation.lean d2f45383d2e972574a7e749da0f2b4bb9283c6da:
  projOn_pairWeil.
* Lib/Weil/CompactLift/RallisFormula.lean 8d41f50fc88d20a40531973b916aaac7491b8e72,
  188–266.

## 1. F3–F4: exact scalar, not a determinant
The native vacuum coefficient is directly 1/conj(weilMultiplier(g)).
For a finite-only g this is 1/Delta(g^-1), as in F3.
The source intersection volume is |Delta|^-2 with the SAME Haar
normalization. Semicharacter invariance follows from preservation of
the dot product, including the trace-one adele. This agrees with F3.
For a supported g, extend the equality P_A omega(g)f =
Delta(g^-1)^-1 f on the P_A-fixed subspace using ext_integrated:
test the real polynomial vectors tensored with H(y)e where y is zero
on C=A union bar A. g fixes y, the real factor is unchanged, and
P_C P_(C^c) is the full finite vacuum projection. This is the
actual density/determining-family argument in projOn_ω; no implicit
tensor product factorization of arbitrary native vectors is needed.
Retain that determining-family lemma and normalized vacuum law as
primitive inputs. F7 scalar cancellation is before the inner
product, hence valid for either sesquilinearity convention.

## 2. F8–F10: independent contraction and weaker rank guard
The actual source uses g^-1 before splitting cases, and the finite
Hom action is h tensor (g^-1)^T. Thus in the inverted argument the
right action is Y -> Yg, not Yg^-1. Let X be any integral isotropic
M-by-n frame with selected rows equal to I, E the selection matrix.
Then E*X=X*E=I and E*E=I. Set Y=E e_l e_i^T d sigma.
In ONE exact algebraic cancellation,
    E*(I+zXX*)Y = (E*E+z E*X X*E)e_l e_i^T d sigma
                 = (1+z)e_l e_i^T d sigma.
Taking the trace after multiplication by g leaves (1+z)d sigma g_il.
This eliminates every other matrix entry before any valuation.
It works with arbitrary selected rows, not just initial rows.
Because |mu|=max(|z|,|g_il|), both Yg and kY are integral, using
the row-max choice and integrality of X. The two vectors are fixed
by H(kYg). If C0=<H(eta)u,w> is nonzero, unitarity and the exact
commutator give C0=conj(psi_0(E* kYg))*C0; hence the character is 1.
The additive character of the integral term d sigma g_il is 1.
For every integral d, psi_0(d sigma z g_il)=1; self-duality gives
sigma z g_il integral, contradicting its norm min(|z|,|g_il|)>1.
The conjugate-place closure is necessary: integrality of all
entries on C yields integrality of the inverse at A by the unitary
star relation. Thus localLevel is the actual subgroup, not just
a matrix-entry condition on A.
The cutoff proof uses only 2*n <= M, not 2*n < M. Indeed native
exists_integral_isotropic_frame already has the weak inequality,
and line 248 is the ONLY use of h in exists_dual_datum: h.le.
The remaining proof uses no strict-rank estimate. This is a local
premise weakening; the stable-range Rallis caller STILL needs
2*n < M. Do not infer boundary-case Siegel–Weil or global pruning.
At n=0 or A empty, cutoff is identically 1. The determinant
character in pairWeil is a common nonzero scalar, not the finite
multiplier. No independent phase or extra norm cost remains.

## 3. Important endpoint correction to human manuscript/lead note
At the actual RallisFormula lines 221–228, the integrable object
is NOT just the Weil matrix coefficient. Fix the original y and y'
in the rapid space and f=integrated(v,F). Define
  Phi(g) = weilMatrixCoeff_b(f,f,g) * Petersson(y',R(g)y).
The first component of inner_product_formula for (f,f) gives
Integrable Phi; this is the input to tendsto_partialIntegral.
For each finite R take A=R\\S0 and f'_A from F10, with f vacuum
off S0. Vanishing of the original lift implies the full paired
Rallis integral is zero, for this f'_A. F10 is pointwise
Phi_A=1_(localLevel(A)) Phi, including the SAME Petersson factor.
Therefore |Phi_A|<=|Phi|, one original L1 function for each fixed
y,y'. The finite sets form a directed net; the place set is
countable, so a cofinal exhaustion suffices, or use the exact
antitone set-integral convergence of the source. No uniform norm
bound on f'_A and no assertion that the bare Weil coefficient
is integrable is required. All cutoffs measurable (open subgroup).
The resulting partialIntegral is zero. The exact IsSharp.partialIntegral_eq
identifies it with c times the real integral, c=||F||_data^2 /
stdLevelIndex(J) !=0. At the edge caller, not for arbitrary v,
petersson_real_translate and K.inner_ne_zero reduce the real
integral at y'=y to nonzero scalar times Petersson(y,y).
Retain rapidity, level, sharpness, cleanliness, Rallis absolute
integrability, the real edge and the volume/mass identities.
This repairs the shorthand 'ONE original L1 Rallis coefficient'
in §5 of the lead and main manuscript. It agrees with F3–F10
under the retained source inputs; independent native replay pending.

## 4. Actual symbolic regression (not a proof or native verification)
Local Python/SymPy: first script failed because a symbolic matrix
equality was compared without expanding entries; rerun with
entrywise expansion yielded exact zeros. The test uses the split
local conjugate-pair ring, not arbitrary complex isotropic vectors.
Executed reproduction:

  import sympy as s
  from itertools import permutations
  a,b=s.symbols('a b',real=True); D=a+s.I*b
  assert s.simplify(D/(a*a+b*b)-1/s.conjugate(D))==0
  n=2;m=4
  G=s.Matrix(2,2,s.symbols('g0:4')); H=s.Matrix(2,2,s.symbols('h0:4'))
  t,Z=s.symbols('t Z'); count=0
  for rows in permutations(range(m)):
      Xp=s.zeros(m,n); Xm=s.zeros(m,n); E=s.zeros(m,n)
      for j in range(n):
          Xp[rows[j],j]=Xm[rows[j],j]=E[rows[j],j]=1
          Xp[rows[n+j],j]=1; Xm[rows[n+j],j]=-1
      assert Xm.T*Xp==s.zeros(n) and Xp.T*Xm==s.zeros(n)
      Kp=s.eye(m)+Z*Xp*Xm.T; Km=s.eye(m)-Z*Xm*Xp.T
      assert (Km.T*Kp-s.eye(m)).applyfunc(s.expand)==s.zeros(m)
      for i in range(n):
          for l in range(n):
              Y=s.zeros(m,n);Y[rows[l],i]=t
              for K,Gc,sgn in [(Kp,G,1),(Km,H,-1)]:
                  assert s.expand(s.trace(E.T*K*Y*Gc)-(1+sgn*Z)*t*Gc[i,l])==0
                  count+=1
  assert count==192

Output: complex inverse residual 0; 192 selected-row contractions,
24 unitary identities, all at boundary rank M=2n, exact symbolic.
These check orientations only; the general argument is §2.

Native lean/lake not installed locally (command -v both empty).
Latest actual state receipt reread, targeted_results.json blob
088cd2ec0e935ee1a282f10096949bcf671cc804: six named checks (Tilting,
Filling) have only propext/Classical.choice/Quot.sound; separate
module build 124 after 2700.11s. all_requested_checks_ok=false,
full_RH_replay=false. No new native PASS; old-pin engine CI is
not transferred to compact. The below scalar certificates are
prepared only; not the finite adelic native replacement or graph.
No native root obligation retired. Original/reduced graphs and
axiom evidence untouched; no coverage percentage or RH claim.

RESUME HERE: integration replace the finite-cutoff paragraph's
dominating function with the complete Phi above; note the weak
local rank guard but retain strict Rallis range. Audit lane can
replay the exact source replacement with h.le changed to h
in the existing allowed native runner and retain old bridge.
Next distinct supplier: noncoherent absolute-amplitude/exchange
with its own support/Haar hypotheses. Preserve A/C unresolved
primitives, common majorants, graph and source pins.
HANDOFF TO integration, formal audit, positivity, shared native runner.
-/

namespace RHFiniteCutoffEditor

/-- Exact local scalar cancellation, prior to taking a pairing. -/
theorem multiplier_cancel (d : ℂ) (hd : d ≠ 0) :
    d⁻¹ * d = 1 := inv_mul_cancel₀ hd

/-- The source uses this cancellation with the nonzero matrix coefficient. -/
theorem commutator_scalar (c q : ℂ) (hc : c ≠ 0)
    (h : q * c = c) : q = 1 := by
  apply mul_right_cancel₀ hc
  simpa using h

/-- The row normalization of the remaining character is done before norms. -/
theorem additive_residual (z a : ℂ) :
    (1 + z) * a - a = z * a := by ring

/-- The entire Rallis integrand, not only its first coefficient, is cut off. -/
theorem cutoff_product (onLevel : Prop) [Decidable onLevel]
    (w w' p : ℂ) (h : w' = if onLevel then w else 0) :
    w' * p = if onLevel then w * p else 0 := by
  by_cases hL : onLevel <;> simp_all

#print axioms multiplier_cancel
#print axioms commutator_scalar
#print axioms additive_residual
#print axioms cutoff_product

end RHFiniteCutoffEditor
