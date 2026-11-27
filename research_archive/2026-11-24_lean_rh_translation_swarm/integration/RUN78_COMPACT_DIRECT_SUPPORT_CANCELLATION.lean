import New.Exchange.LowRankIdentity
import Mathlib.Tactic

/-!
# RUN78 integration: one determinant support cancellation at the actual exchange caller
27 November 2026. SOURCE-MATCHED human reduction and prepared generic
Lean certificate; not compiled, not native root retirement, not RH.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Original pin leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005,
src/Main.lean blob dbd5db70bc11b35f18fa5751216ab335321e7bfc read again.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob a69122b6ad568910a45d2bc13961ab9da4855143, including mandatory
engine; SWARM_PROTOCOL, HANDOFF_QUEUE, AGENTS, research state/log/protocol
and continuity inspected. Latest peer checkpoints through e9d6914f:
85d03bf7 adapted orbit, a26c8f8c finite probes, 0e9b893e incompatible
amplitude phase, 0a9f1882 dual datum, 982eed1c real period, bdfcbcdc
uniform period, d8ec62f2 marked Hecke, d12d3e65 zero-term index,
e8b07e40 compact projector, 7e6fe010 masked determinant, 4a597803
CM transport, 3fe5ad1a/e9d6914f flag rank. These are separate supplier
checkpoints, not new kernel checks. This run resumes integration
847ff2e5 (blob 072e30c2ada0139589a223d165f9a7fe878a15aa).

## 1. One equation removes an intermediate inverse and involution comparison

Actual source anchors (compact, authenticated):
- New/Exchange/LowRankIdentity.lean efd396aa9b0681ecba5a2364546a295094866a2c,
  thetaTerm_stdDatum_spec:27–61, especially 50–57.
- Lib/Weil/DualPair/FourierCoefficient.lean f2756c5504bd6cdc8b38c8cf17c4310ec5d38ff8,
  hasIntegrableTerms_integrated_name:111–132.
- Lib/Weil/DualPair/KernelDecay.lean 591247fdbe42900da1ac55c3c9d2ff733f235804,
  coordMatrix and both nonzero lemmas:20–39; exists_norm_name_le:80–132.

Fix the source's actual adapted splitting, finite ReadsAt map pi,
nontrivial coefficient ring R, y in the nonzero support of the standard
datum, g_source=p=radicalElt(c,z)*levi(q,g), and the same N as in
thetaTerm_stdDatum_spec. Do not change Phi or its support. Write
C=(D.k|D.i), A=pi(y * coordMatrix(p,C)_f). The actual block identity
at LowRankIdentity:51–57 rewrites the matrix in the determinant
character as U=A B N, where B is the finite-mapped source parabolic
block (fromBlocks q _ 0 _) in the displayed source identity. All
products below are after the appropriate finite ring map, including N.
The source invOnUnits and nonzero character support at line 50 imply
U is a square unit matrix: retain this exact unit guard, not merely
det(U) != 0. Set W=B N. Hence A has the explicit right inverse
W U^-1. Transposition gives the native HasLeftInv(A^T) with witness
(W U^-1)^T, as required by hasIntegrableTerms_integrated_name.
Neither B nor N needs a separately constructed inverse for this guard.

More directly, if D0 is ANY matrix with D0 != 0 and compatible row
dimension, the contraction D0 A cannot vanish, by the single identity

    (D0 A) W U^-1 = D0.                                  (C)

Proof: associate the products, replace AW with U, and use U U^-1=I.
No norm, determinant bound, dimension argument or commutation of pi
with the involution is needed. In the actual source the nonzero
D0 is pi((coordMatrix(h,d)_f)^*) where d is the rational nonzero short
isotropic column. To check it without assuming pi preserves star,
write coordMatrix(h,d)=L d_ad with L=h^-1.mat T.x^-1 invertible.
Taking the adjoint BEFORE applying pi gives

    D0 = (pi o snd o toAdele)(d^*) * pi((L_f)^*).

The right factor is invertible because adjoint takes invertibles to
invertibles and any unital ring hom preserves an explicit inverse.
The left factor is nonzero because the composite unital map from the
field E into nontrivial R is injective and star on E is bijective.
Consequently D0 != 0. The rational denominator multiplying C is
nonzero in E and hence maps to a unit in R; it does not alter
the nonzero contraction. Equivalently replace W by its inverse
scalar multiple in (C).

Thus the exact same source determinant unit both supplies the
transpose-left-inverse interface and directly rules out the zero
contraction used in exists_norm_name_le. At the native caller X=1
in coordMatrix_mul_ne_zero. This proof bypasses the generic detour
through mul_coordMatrix_ne_zero, pi composed with starRingAut,
and an auxiliary invertible X. For a general X it suffices that
pi(M X_f) have a right inverse; do not require X invertible
separately for that implication. The native declarations and all
other callers retain their original hypotheses. No proof that a
general Phi has the determinant support is asserted; this proof is
for the source's actual standard datum only.

## 2. Integration into the existing absolute-exchange spine

Independently inspected exists_norm_name_le:80–88: quantifier order
is exists C, forall v g h ell rho H. Therefore the constant really
is independent of the finite index set and its phase-aligned
functional in RUN77. The proof uses a fixed local-constancy modulus M
for the named finite datum, a fixed rational-to-adelic fundamental
domain with bounded real and integral finite coordinates, and an
isotropic additive Heisenberg action (101–108), then quotMean_translate
and name_eq_zero_of_invariant (110–116) before the real shift bound
(117–132). These are retained native analytic suppliers, not proved
by (C). With rho=1, the fixed denominator and fixed column norm,
the actual support gives the first alternative uniformly; H<=2
is already included in the native estimate. No extra stable-range
inequality is introduced for LowRankIdentity.

The now-short human dependency chain at this consumer is:
  determinant-unit support + exact parabolic block identity
    -> (C) + injective field map + adjoint of an invertible
    -> nonzero short-shift contraction
    -> existing uniform named-data decay + finite phase alignment
    -> absolute theta-term bound (RUN77), N=0 for integrability
    -> HasIntegrableTerms on the same finite-volume quotient
    -> Fourier coefficient expansion and stabilizer unfolding.
For the last arrow retain continuity, rational-left-invariance,
Gram-unit guard, Witt transitivity and exact quotient Haar.
Do not infer a quantitative prime discrepancy from this chain.

Separate Rallis caller: prefer the independently audited positive
adapted orbit majorant (85d03bf7) plus finite Schwartz probes
(a26c8f8c) over the earlier unadapted-vacuum peak, conditional on
the same stable-range classical convergence and exact model
comparison. Keep the strict rank at Rallis, original full L1 product
for its cutoff limit, and its own graph unfolding. Do not conflate
these two absolute suppliers or repeat the incompatible orbit
phase proof (0e9b893e).

Original graph remains intact. Reduced human edges for the actual
standard datum: support_nonzero <- determinant_unit, block_identity,
rational_injection, adjoint_invertible, cancellation C.
Retain all other edges, including native support, Heisenberg/real
decay, Haar, and unresolved A/B/C and prime inequality. Context
key: compact SHA, S,T,D,p,ReadsAt,pi,N,actual Phi,short d,
fixed denominator, all h and finite phase tests; not transferable
to a different support or singular Gram without a new argument.

## 3. Executed tests and verification boundaries

Local command -v lean and lake gave no paths. Native rh_prune,
rh_scan, rh_reduce, rh_auto, rh_auto_frontier not executed here;
candidate generic rectangular certificate below is PREPARED only.
The source original root was read for provenance, not imported.
No URT heuristic needed for exact cancellation.

Local Python exhaustive small-ring regression (not the proof):
    from itertools import product
    m=6; n=0; singular=0
    for a,b,u,v in product(range(m),repeat=4):
        det=(a*u+b*v)%m
        if det not in (1,5): continue
        r,s=u*pow(det,-1,m)%m,v*pow(det,-1,m)%m
        assert (a*r+b*s)%m==1
        for d in range(m):
            assert ((d*a)%m==0 and (d*b)%m==0)==(d==0)
            n+=1
    for a,b,c,d in product(range(m),repeat=4):
        if (a*d-b*c)%m in (1,5): continue
        if a%6 in (1,5):
            assert (a*pow(a,-1,m))%m==1
            singular+=1
    assert 2!=0 and (3*2)%6==0
    assert (0*1+1*0)==0
    print(n,singular,2)
Actual output: 1728, 288, 2. The second loop takes A=(1,0),
N=(1,0)^T, a noninvertible B and unit top-left entry; it shows
separate invertibility of B is unnecessary for this algebraic
guard. First negative control: U=2 in Z/6, D0=3, nonzero
determinant alone fails. Second: A=(1,0)^T, D0=(0,1) over a
field; without right inverse, contraction can vanish. These are
algebraic regression controls only, not original adelic data.

Actual CI receipts reread on cathedral-research-state:
compute/rh-recursive-reduction-strip-root-20261125/status.json
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc, returncode 0;
compute/rh-proof-term-prune-native-20261125/status.json
7da354941e402b6f8b364ed03d8c5c82d27b7717, returncode 0.
These are the earlier conditional root/engine checks only.
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
088cd2ec0e935ee1a282f10096949bcf671cc804: six named checks,
standard three axioms, module_1_build timeout 124 after 2700.11s;
all_requested_checks_ok=false, full_RH_replay=false.
No new native check or axiom output claimed. No schedule changes.

RESUME HERE: at LowRankIdentity:50–57 replay the original block
identity and the determinant-unit witness using (C), then use the
actual HasIntegrableTerms caller with the RUN77 uniformity.
Next mathematical integration target is the exact exchange_of_partners
descent consuming character boxes RUN74 (real period/graph), including
finite epsilon and equal-rank normalization. Retain support, rapidity,
quotient-Haar, and all other outstanding premises. HANDOFF TO
integration/editor, character boxes, audit and existing native runner.
The weighted prime-window bound for every epsilon remains OPEN.
-/

namespace RHIntegrationSupport78
open Matrix

/-- Rectangular support contraction cancels the determinant unit exactly. -/
theorem contraction_cancel
    {R i k j : Type*} [CommRing R] [Fintype i] [Fintype k]
    [Fintype j] [DecidableEq k]
    (D : Matrix i k R) (A : Matrix k j R)
    (W : Matrix j k R) (V : Matrix k k R)
    (h : (A * W) * V = 1) :
    ((D * A) * W) * V = D := by
  calc
    ((D * A) * W) * V = D * ((A * W) * V) := by
      simp only [Matrix.mul_assoc]
    _ = D := by rw [h, Matrix.mul_one]

/-- The same identity proves the required nonzero contraction. -/
theorem contraction_ne_zero
    {R i k j : Type*} [CommRing R] [Fintype i] [Fintype k]
    [Fintype j] [DecidableEq k]
    (D : Matrix i k R) (A : Matrix k j R)
    (W : Matrix j k R) (V : Matrix k k R)
    (h : (A * W) * V = 1) (hD : D ≠ 0) : D * A ≠ 0 := by
  intro hz
  apply hD
  have e := contraction_cancel D A W V h
  rw [hz, Matrix.zero_mul, Matrix.zero_mul] at e
  exact e.symm

end RHIntegrationSupport78

#check Space.coordMatrix_mul_ne_zero
#check Space.Splitting.hasIntegrableTerms_integrated_name
#check Space.Splitting.centreCoeff_eq_integral_stabilizer
#print axioms RHIntegrationSupport78.contraction_cancel
#print axioms RHIntegrationSupport78.contraction_ne_zero
