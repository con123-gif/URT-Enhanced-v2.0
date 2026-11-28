import New.Filling.Setup

/-!
# RUN101 — exact packet/Gram/volume cancellation at weighted B3 caller
28 November 2026. SOURCE-MATCHED human derivation and PREPARED Lean helper,
not native replay. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7 /
1c4608f2190154fd4bc4b38fc77db10ec5e60e64 / 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, continuity, swarm/handoff/expansion, latest peer RUN94 and RUN100,
integration sieve-exponent closure and depth-discounted moment. This closes
the scalar normalization explicitly left conditional in b4804e50 section 4;
it is not a repeated frequency-exponent or shell-budget derivation.

## Actual native normalization, including the crucial predecessor
Sources under grh-compact/src:
* New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444,
  lines 131–139, 150–164 (actual r and calibration).
* New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727,
  148–157 (frameScaleSq, frameScaleProd, unipCovolume), 271–284
  (besselDegree, mainEnergy, packetConst), 316–318 (packetConst_mul_mass_le).
* New/Filling/FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7,
  156–169 (top block multiplier), 235–242 (bottom multiplier).
* New/Filling/GlobalSieve.lean 0ad01a3eec4c5dcd2a51bb1d9773f7834970e372,
  172–179 (sieve conclusion).

Use physical K=shape.k, n=rho+1, f=numInfPlaces E, b=S.b.
IMPORTANT: the local k in Moments' r is NOT K. Line 132 splits K
as Nat.succ k (zero excluded by omega); hence k=K-1. Set
l_va=S.frameScaleSq v a>0, L=prod_(v,a<n) l_va,
M=prod_(v,a<n) l_va^(K-1+2*(rho-a)).
Then frameScaleProd=M L exactly, since Fin.rev(a)=rho-a.
Let c=openCellConst>0, C=(sqrt c)^f, d=card S.BesselCoord>0,
V=volÔ(E)^n>0, D=besselDegree>0, nu=unipCovolume>0,
E0=mainEnergy>=0. The source scale is r=C M/d, C²=c^f;
the sieve prefactor is V/L². The packet guard is precisely
    packetConst <= (1+b^-9) E0 D C²/V * (nu M L/d)^2.
Multiply by V/L², cancel L² and V BEFORE any inequality:
    packetConst * V/L² <= (1+b^-9) E0 D (nu r)^2.
Every cancellation has a positive denominator. No unproved equality
between packetConst and its bound, nor division by E0.
If one incorrectly uses K in r, a leftover L^-2 results; no assumption
L>=1 is available or needed in the actual argument.

## Exact weighted calibration
For proper-prefix tags alpha, h=b^(-6K), c_alpha>=0,
P=sum c_alpha, A=sum c_alpha h^depth(alpha). For each alpha the actual
bottom bound is (1+b^-6) h^depth. Apply the previously derived common
head/Gram transport and convex SieveSystem to get the ONE global bound:
    sum c_alpha r² * truncatedEnergy_alpha
    <= (1+b^-6) packetConst V/L² *
       [ (1+b^-10)^f/D * (1+b^-6) A
          + D^-1 b^-10 h^f P ].
Thus the preceding source cancellation gives, after division by r² nu²,
    (sum c_alpha truncatedEnergy_alpha)/nu²
    <= (1+u)(1+a) E0 [(1+u)(1+v)^f A + v h^f P],
where u=b^-6, a=b^-9, v=b^-10. In particular the exact affine coefficients
in the previous note can be taken as
    coeff_A=(1+u)^2(1+a)(1+v)^f E0,
    coeff_P=(1+u)(1+a) v h^f E0.
They majorize, not necessarily equal, the actual normalized coefficients.
For every proper prefix depth j<f, 0<h<=1 implies h^f<=h^j;
therefore h^f P<=A, including all zero weights (no division by P at
this scalar step). The convex-system step itself handles P=0 separately.
For f<=b (native f<=b/1000 is stronger), f*v<=a<=1/2.
Binomial coefficients satisfy choose(f,j)<=f^j; hence
    (1+v)^f <= sum_(j>=0) (f v)^j = 1/(1-f v) <= 1+2a.
Now a,v<=u<=1/32 and
    (1+u)(1+a)[(1+u)(1+2a)+v]
    <= (1+u)^2(1+4u+2u²)
    = 1+6u+11u²+8u³+2u⁴ <= 1+7u <= 1+b^-4.
The penultimate inequality uses 11u+8u²+2u³<=1 for u<=1/32;
the last uses b²>=7. All factors nonnegative.
Consequently the exact source packet, scale and degree factors DO
supply the weighted link-energy calibration (1+b^-4) A E0, without
the previously conditional affine-coefficient identification.
The finite cutoff/Gram and local arithmetic hypotheses remain those
of the earlier notes; the ENNReal supremum and directed limits are
unchanged. The full-mask terminal case still uses the old crude route.
No claim that weighted Moments, B3/B4, the star or RH is closed.

## Actual verification
Local SymPy executed exactly these three assertions:
cancel(packet_bound*V/L**2-(1+a)*E0*D*(nu*r)**2)==0;
cancel(packet_bound*V/L**2/((1+a)*E0*D*(nu*(C*M*L/d))**2))==1/L**2;
expand((1+u)**2*(1+4*u+2*u**2))==1+6*u+11*u**2+8*u**3+2*u**4.
All 3 passed (positive symbolic variables); middle assertion is a
negative control for the incorrect predecessor normalization. This is
symbolic algebra, not native Lean verification. The following generic
finite-product lemma preserves the precise cancellation interface.
Lean/lake absent from local PATH. The previous convex-leaf queue
status.json, outputs/convex_receipt.json and convex_compile.log all
returned 404 on the state branch; this is no verdict. No duplicate job
or protected workflow change. No native rh_scan/prune/reduce/auto/frontier
or new dependency/axiom result. Original graph retained: packet guard,
local top kernels, sieve, Gram matching, common cutoff and crude energy.
The reduced path removes no global dependency at this stage.
RESUME HERE: inspect the queued RUN100 convex-leaf receipt; on acceptance,
compile this helper alongside the actual weighted GlobalSieve caller,
matching the native r after K=succ k and packet guard, and inspect the
complete caller axioms/graph. On RUN100 failure repair its actual first
diagnostic before combining. Do not repeat this cancellation or the
peer RUN100 exact-shell budget. HANDOFF integration / Landau / audit.
-/

noncomputable section
open Finset
open scoped BigOperators
set_option debug.skipKernelTC false
set_option Elab.async false

namespace PositivityPacketCalibration

theorem packet_scale_cancel {I : Type} [Fintype I]
    (l : I → ℝ) (p : I → ℕ)
    (C d V D nu E0 packet a : ℝ)
    (hl : ∀ i, 0 < l i) (hd : 0 < d) (hV : 0 < V)
    (hp : packet ≤ (1+a)*E0*D*C^2/V *
       (nu * (∏ i, l i ^ (p i + 1))/d)^2) :
    packet * (V / (∏ i, l i)^2) ≤
       (1+a)*E0*D*(nu*(C*(∏ i, l i ^ p i)/d))^2 := by
  classical
  have hL : 0 < ∏ i, l i := Finset.prod_pos (fun i _ ↦ hl i)
  have hsplit : (∏ i, l i ^ (p i+1)) =
      (∏ i, l i ^ p i) * (∏ i, l i) := by
    simp only [pow_succ, Finset.prod_mul_distrib]
  calc
    _ ≤ ((1+a)*E0*D*C^2/V *
        (nu*(∏ i, l i ^ (p i+1))/d)^2) *
        (V/(∏ i, l i)^2) :=
      mul_le_mul_of_nonneg_right hp (div_nonneg hV.le (sq_nonneg _))
    _ = _ := by
      rw [hsplit]
      field_simp [hV.ne', hd.ne', hL.ne'] <;> ring

#print axioms packet_scale_cancel

end PositivityPacketCalibration
