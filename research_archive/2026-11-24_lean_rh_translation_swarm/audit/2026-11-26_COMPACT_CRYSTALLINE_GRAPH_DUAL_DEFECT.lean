import New.Selmer.RibetElement

/-!
# Formal audit: crystalline graph-to-dual defect, 26 November 2026
Status: human source-matched derivation, scalar/finite regression executed in JS,
Lean certificate PREPARED, NOT RUN. No new kernel-verified closure.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Read latest ONE_EQUATION_MISSION.md blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb
(binding primitive-closure focus), HUMAN_PROOF_COMPACT.md 65e891f727a8e97c821570e0d86b22b9daadbb4e,
SWARM_PROTOCOL, HANDOFF_QUEUE, AGENTS, repository state/protocol headers.
Resume previous audit d064b084, not the URT lane.

## 1. Actual graph construction (BlocksAndCocycles.lean
2bc5a11b2127e4b46eb4f57bfc1bd12f64c1ef55, obeyingCocycles.exists_graph_subrepresentation)
Let R be the native DVR, a = ell^m, W the finite product of column matrix lattices
with left multiplication action, A the span of U(g)-1. An obeying cocycle c
takes values in L/aL; relation obedience makes t:A -> L/aL well-defined,
t(U(g)-1)=c(g). The two identities
U(h)(U(g)-1)=(U(hg)-1)-(U(h)-1) and
rho(h)c(g)=c(hg)-c(h)
make t equivariant. Artin-Rees gives k with
A intersect a^(k+1) W contained in a A. Thus t extends to
A+a^(k+1)W by t(z+a^(k+1)v)=t(z), since it vanishes on a A.
Its graph Y projects injectively into W, is finite torsion-free (hence free
over the DVR), and contains the points (U(g)-1,c(g)) and (a^(k+1)v,0).
Upon restriction along the actual eta:Gamma->G, Y belongs to the SAME
InClass F K U as the columns by jointly injective maps to the column
lattices (PairingDefs.lean f977b856d5aa41125d21f6629a5f144d2da094d4).
In particular the graph is potentially crystalline. For the cocycle
alpha(g)=(U(eta(g))-1,c(eta(g))) in Y,
a^(k+1) alpha(g) = g y0-y0 with y0=(a^(k+1)1,0).
The saturation property of crystalline cocycles (of_smul) therefore gives
alpha in Z_f(Y). Its second projection maps alpha to c restricted along eta.
Do not silently assume the torsion cocycle c is reduction of a cocycle in L;
its crystalline lift at this step is in Y.

Failed simplification: extend t to all W without Artin-Rees. Over Z_2,
A=2Z_2, t(2)=1 mod 2, no extension to Z_2 exists, since 2t(1)=0.
This also rules out replacing the Artin-Rees exponent by 1 universally.

## 2. Actual dual pairing witness (RowBalanced.lean
ab1371acacfb1c5f262146456a380a9111ce6444, relLength_obeyingCocycles_le)
Let L=matrixLattice(rho.comp eta), q:L->L/aL, L'=L^vee(1).
Each restricted obeying cocycle s is t(alpha) with Y as above; the other
branch s in qZ_f(L) simply uses Y=L, alpha its given crystalline preimage
and t=q. Both branches are needed. The native R-linear t:Y->L/aL is
equivariant. Projectivity of Y lifts it to an R-linear p:Y->L (not necessarily
equivariant). The defect g.p-p lies in a Hom(Y,L) because q is equivariant.
Define psi_p(y,z)=z(p(y)) in R(1), z in L'. Its twisted-dual coboundary
is exactly the pairing of (g.p-p) with z. Dividing by a, permissible in
the torsion-free integral Hom, yields the cocycle (g.psi_p-psi_p)/a;
it is crystalline by saturation from the coboundary a times it, in the
native potentially crystalline twisted dual of Y tensor L'. Choose the
Z_ell-linear f:R->Z_ell yielding perfect scalar pairing as in
CrystallineDuality.exists_perfect_pairing; this is NOT an arbitrary trace.
The tuple (m,psi_p,f, divided coboundary, its equality) is the actual
Pairing witness in RowBalanced. Apply the definition of cupOrthogonal
to Y, this witness and alpha to get the coboundary in B2 required by
IsPotCrys.relIndex_dvd_of_orthogonal. Continuity of s follows by composing
the crystalline cocycle with q p, using the native continuous_comp
and ell^m-torsion hypotheses. Do not infer continuity merely from the
abstract global definition of obeyingCocycles.

## 3. Correct index orientation, no equality of relation annihilators assumed
Let S=image of restricted obeying cocycles, A0=q Z_f(L),
B=obeying(relationsOn Z_f(L)) modulo a, H=cupOrthogonal(InClass F K U,L').
A0 subset B by comp_mem_obeying.
Restriction r gives exact quotient A/(A intersect r^-1 B) isomorphic
to S/(S intersect B); here A denotes the GLOBAL obeying module.
Thus its length <= length S/(S intersect A0). Both S and A0 consist
of continuous cocycles and are orthogonal to H by section 2.
Native IsPotCrys.relIndex_dvd_of_orthogonal
(CrystallineDuality.lean 85cabaf4fb3b68704ccdc040c34a6b4339ca9cc1)
gives
  [S:S intersect A0] divides [Z_f(L'):Z_f(L') intersect H].
This is the actual direction (the notation A0.relIndex S is easy to reverse).
Taking ell-primary lengths gives precisely relLength_obeyingCocycles_le,
with no assumption B=A0. If the dual index is infinite the finite length
argument is interpreted as the native extended-length inequality.
Do not equate cocycles with H^1. Retain the open embedding, topology,
perfect scalar pairing, saturation, local duality and same InClass.
The exact local duality proof itself remains a retained standard/native
supplier; no blanket axiom certification by this audit.

## 4. Transport at the actual RibetElement.sum_blockLoss_le consumer
(RibetElement.lean 188eeb68d437bfa58bcc30042d4eee66c2111e18,
lines 80ff, consumed by ribet_columns at line 148).
The single reindexing equivalence of sigma-block coordinates identifies
the chosen column u_pi with the diagonal block representation. Each
row block embeds equivariantly as a single coordinate into that column;
thus the SAME column class supplies all block classes. Conversely its
jointly injective block projections ensure each allowed jump occurs
in a block. Keep the row's local equality T=T0 on every decomposition
group and all column lattice conditions. Intersecting local relation
conditions costs at most the sum of local relative lengths: diagonal
map into the product of quotients is injective on the quotient by the
intersection. Apply section 3 at every v|ell, then OnePlaceDefect.
For the native x=1 on the row, x=D.t on each of the t rank-one blocks,
the bound is [G_ell:j_v(Gamma_v)] times rank_i*(loss/x).
The per-place sum is <= n_v*(r*loss+t*floor(loss/D.t))
<= n_v*(r+1)*loss since t<=D.t. Sum n_v <= 2D.f by the
actual complex-embedding count; r>=1; hence <= 4r D.f loss.
No extra factor t on the row, no independent choices of common column,
no weakening of the eventually-all-O quantifier. This retains the native
pointwise OnePlaceDefect, not the speculative aggregate replacement.

## Remaining primitive (not discharged)
OnePlaceDefect.lean 709e688740863f10dbbb284446ca20c0ba2a280a:
Tate dual sends jump u to -u-1, not -u. Its tame branch uses
tame_types_exponent and crystalline branch uses crystalline_defect_le
(7b7ba1c2ac12f09651b5c1285109ff0435258e79). The latter has three branches:
ell<=Q sparse thick, ell>Q with lambdaLoss>=h^3 two-size bound,
otherwise few-low-jumps/zero-defect. Retain every quantitative chart,
spacing, size and conductor condition from the original statements.
These branches and their Kisin cokernel estimates are still needed.
The graph-to-dual transport above does not prove them.
Original root and axiom graph unchanged; local proof-role chain:
ribet_columns -> sum_blockLoss_le -> {relLength_obeyingCocycles_le,
block_defect_le_at_place}; first -> {exists_graph_subrepresentation,
InClass.of_jointly_injective, projective lifting, of_smul, cupOrthogonal,
IsPotCrys.relIndex_dvd_of_orthogonal}; second -> {tame_types_exponent,
crystalline_defect_le, normLength_defect_le}. No edge retired globally.
No URT, no native engine claim: lean/lake absent locally.

## Executed regressions (V8 JS; exact BigInt, not p-adic proof)
Reproduction:
let counts={orthogonalCases:0,wrongOrientation:0,missingOrthogonality:0,
jumpPairs:0,wrongDualShift:0,rankBudget:0};
for(const p of [2n,3n,5n,7n])for(let m=1;m<=7;m++)
for(let a=0;a<=m;a++)for(let s=0;s<=m;s++)for(let h=0;h<=m;h++){
 const lhs=p**BigInt(Math.max(0,a-s)),rhs=p**BigInt(Math.max(0,h-(m-a)));
 if(h>=m-Math.min(a,s)){
  if(rhs%lhs!==0n)throw Error("index");counts.orthogonalCases++;
  if(lhs%rhs!==0n)counts.wrongOrientation++;
 } else if(rhs%lhs!==0n)counts.missingOrthogonality++;
}
for(let u=-100;u<=100;u++){let v=-u-1;
 if(Number(u<0)+Number(v<0)!==1||-v-1!==u)throw Error("dual");
 counts.jumpPairs++;if(Number(u<0)+Number(-u<0)!==1)counts.wrongDualShift++;
}
for(let r=1;r<=30;r++)for(let f=1;f<=30;f++)
for(let t=1;t<=r;t++)for(let loss=0;loss<=10;loss++){
 if(2*f*(r*loss+t*Math.floor(loss/t))>4*r*f*loss)throw Error("budget");
 counts.rankBudget++;
}
Output: orthogonalCases=2156, wrongOrientation=1344,
missingOrthogonality=1344, jumpPairs=201, wrongDualShift=1, rankBudget=153450.
The cyclic models have A0=p^a, S=p^s, H=p^h in Z/p^m with perfect pairing.
The budget regression samples t<=r only; the algebraic proof and Lean
certificate below use the actual weaker t<=D.t. No model proves the
native p-adic or Kisin premise.

Actual prior CI evidence read from cathedral-research-state:
compute/rh-compact-targeted-replay-20261126/outputs/targeted_results.json
blob 23de197bd48f404ca2074c69676de289c4f7934e: all_requested_checks_ok
true, ten native and four scalar checks, standard three axioms, NOT
these new declarations. Latest manuscript records primitive replay
45803534769 as partial/error (six checks, JetExponentBound timeout).
No protected workflow touched or new job launched.

RESUME HERE: independently expand the three branches of crystalline_defect_le
against the exact KummerChart exponent lemmas and prove the size/spacing
inequalities used by block_defect_le_at_place; run the prepared probes
in the shared bounded replay queue, not a separate full build.
HANDOFF TO: mathematics, integration, kernel extractor.
Verdict: AGREE/PARTIAL, human reconstruction of graph/duality caller;
no full RH proof claim.
-/

namespace CompactCrystallineGraphAudit

theorem dual_jump_partition (u : ℤ) : (u < 0 ∧ ¬ (-u-1 < 0)) ∨
    (¬ (u < 0) ∧ -u-1 < 0) := by omega

theorem dual_jump_involution (u : ℤ) : -(-u-1)-1 = u := by ring

theorem block_budget (r t D loss f : ℕ) (hr : 1 ≤ r)
    (ht : t ≤ D) : 2*f*(r*loss+t*(loss/D)) ≤ 4*r*f*loss := by
  have hh : t*(loss/D) ≤ loss := calc
    _ ≤ D*(loss/D) := Nat.mul_le_mul_right _ ht
    _ = (loss/D)*D := Nat.mul_comm _ _
    _ ≤ loss := Nat.div_mul_le_self _ _
  have rr : loss ≤ r*loss := by
    simpa using Nat.mul_le_mul_right loss hr
  have hs : r*loss+t*(loss/D) ≤ 2*(r*loss) := by omega
  calc
    _ ≤ 2*f*(2*(r*loss)) := Nat.mul_le_mul_left _ hs
    _ = _ := by ring

end CompactCrystallineGraphAudit

#check obeyingCocycles.exists_graph_subrepresentation
#check relLength_obeyingCocycles_le
#check block_defect_le_at_place
#check sum_blockLoss_le
#print axioms relLength_obeyingCocycles_le
#print axioms block_defect_le_at_place
#print axioms CompactCrystallineGraphAudit.dual_jump_partition
#print axioms CompactCrystallineGraphAudit.block_budget
