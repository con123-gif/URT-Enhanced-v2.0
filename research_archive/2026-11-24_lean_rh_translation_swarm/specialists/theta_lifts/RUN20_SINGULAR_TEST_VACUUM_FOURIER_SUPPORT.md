# RUN20 — Singular tests annihilate the lower-rank vacuum
2026-11-25. RESULT: DONE local SOURCE-MATCHED human reconstruction; global linkage and imported analytic suppliers PARTIAL/OPEN. Baseline P=40e56bab026552e089d7afcfeff08d2defb9c005 in leanprover-community/riemann-hypothesis. Observed latest commit H=c40250a50104b7e02e7d74f658d00fa7b1f4827c. Prior theta RUN19 bdb5bc7664e9bb15ff64b30452b385dd56b163e1 assigned this exact task; no duplicate found in recent peer commits. Read AGENTS, swarm protocol, handoff queue, expansion, research state/log/protocol and continuity excerpts, CI summary 45529563830 (physics checks only). Inspected recent peer commit diffs and available RESUME HERE notes for integration, dependency, structure, math, audit, acceleration, kernel, prime, Landau, Galois, windows, literature, geometry and editor; not all full peer files or external blueprint reread. No changes to physics queue. Kernel run20 c50fdeaf supplies TLiftK witness work, not a confirmed root path for this local theorem.
 
All paths below relative to src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/; C= CayleyCosetSums/, M=MollifiedIntegrability/. Native namespace PositivityTheory.Rg.Sw.HSt.L3 for the local producers; HSt.lt3 consumes them. This is a source reference chain, not an elaborated kernel DAG.

## 1. The exact statement and test condition
IsSingTest:13–35 defines J=[[0,I],[-I,0]], G={g:g†Jg=J}, K={g∈G:g†g=I}, Herm(s)_{ij}=(s_ij+s_ji)/2+i(s_ij−s_ji)/2 on real n×n coordinates, nU(S)=[[I,S],[0,I]], u1(g)=i C_g+D_g. All determinants are complex; integration uses the native volume on the real coordinate space. A test ψ is continuous, compactly supported, and for EVERY Hermitian β with det β=0,
    ∫ ψ(s) exp(2π i tr(β Herm(s))) ds = 0.
This is vanishing on singular frequencies, not support of ψ in the singular set, nor pointwise Fourier vanishing everywhere. No differentiability of ψ is required. From LocTauAlt:18 and SecondCoordMulInner:16, fz(m,e,0,g)=det(g)^e det(u1(g))^(−m).
C/EventuallyUnit:64–66: for natural m,n with m<n, integer e (including negative), arbitrary y,b∈G, and every such ψ,
    ∫ fz(m,e,0,y nU(Herm(s)) b) ψ(s) ds = 0.
No extra nonsingular-block hypothesis in this final statement. n≥1 follows; m=0 is allowed.

## 2. The central Fourier mechanism (C/TraceTransposeMul:18–30; C/InnerGen:13–151)
For X∈C^(m×n), the all-true Gram matrix G_X= X†X by the actual definition (TraceTransposeMul:19). rank(G_X)≤rank(X)≤m<n, so det G_X=0. This strict inequality is needed for this universal rank statement: at m=n choose X=I. That control does not assert failure of every possible conclusion outside the hypotheses.

For invertible R∈C^(n×n), Hermitian H0, define B_s=R^(-1)(H0+Herm(s))(R^(-1))†. B_s is Hermitian; I−i B_s is invertible (M/GaussM:85, since the Hermitian eigenvalues are real, or use the native quadratic-form contradiction). Factor
    RR†−i(H0+Herm(s))=R(I−i B_s)R†.
The original imported Gaussian base theorem (InnerGen:60–68, exact parameters ε≡true, c=t=1, P=1) gives
    secN(B_s)=(π^n/det(I−i B_s))^m
            =∫ evX(1,X) gs(1,X) exp(i tr(B_s G_X)) dX.
Here evX and gs are native polynomial evaluation and Gaussian weight, not fitted replacements. Thus the target integrand ψ(s) det(RR†−i(H0+Herm(s)))^(−m) equals ψ(s) secN(B_s) times the constant
    [det R det R† π^n]^(−m).
The denominators are all nonzero by invertibility of R, Hermiticity of B_s, and π≠0. No restriction m>0 needed.

Set A_X=(R^(-1))† G_X R^(-1). Hermitian congruence preserves Hermiticity and singularity. By cyclicity and transpose invariance of trace,
    tr(B_s G_X)=tr(H0 A_X)+tr(Herm(s)^T A_X^T)
              =tr(H0 A_X)+tr(A_X Herm(s)).
The original source uses Q=A_X^T and inner_gen:13–34 with β=Q^T/(2π)=A_X/(2π). Transposition preserves Hermiticity and determinant zero; scaling by the nonzero real number 1/(2π) preserves them. Therefore
    ∫ ψ(s) exp(i tr(B_s G_X)) ds
    =exp(i tr(H0 A_X)) ∫ ψ(s) exp(2π i tr(β Herm(s))) ds=0.
This is a Gaussian mixture of Fourier modes of rank at most m, not a numerical cancellation. The original Fubini obligation is essential: |exp(i tr(B_s G_X))|=1 because trace of product of two Hermitian matrices is real (M/GaussM:28–42). The joint continuous integrand is dominated in absolute value by |ψ(s)| |evX(1,X) gs(1,X)|. The first factor is integrable by continuous compact support, the second by M/ContinuousGramX:12 integP (supplier GI.integP). InnerGen:94–111 supplies product integrability and :145–151 swaps integrals. Hence core2 yields
    ∫ ψ(s) det(RR†−i(H0+Herm(s)))^(−m) ds=0.
Gaussian base and GI.integP bodies not expanded here; they remain genuine imported obligations, not assumed new axioms.

## 3. Translate the group integral to the Gaussian kernel (C/Imports:35–93; C/SecondCoordMulInner:25–88; C/VanishInv:13–25)
First assume the lower-left block C of y is invertible. Let D be its lower-right block, U=u1(b), V=v1(b)=i A_b+B_b, P0=VU^(-1). From b†Jb=J, U†V−V†U=2iI. This implies U invertible: if Uv=0 then the quadratic form of the left side is zero, whereas the right is 2i||v||². The analogous argument works for all group elements.
Also yJy†=J follows using y^(-1)=−Jy†J, and its lower-right block gives CD†=DC†, hence C^(-1)D Hermitian. Multiplying U†V−V†U by (U^(-1))† and U^(-1) gives
    P0−P0†=2i (U^(-1))† U^(-1).
Choose R=(U^(-1))†, H0=(P0+P0†)/2+C^(-1)D, κ=det C i^n det U. R invertible, H0 Hermitian, κ≠0. The block multiplication identities give
    u1(y nU(S)b)=C V+(CS+D)U
               = C i[RR†−i(H0+S)] U.
Taking determinants gives factor's exact identity for every complex matrix S. As det nU(S)=1, the full integrand for S=Herm(s) is the kernel from section 2 times constant
    (det y det b)^e κ^(−m).
Thus vanish_inv follows, including e negative. No division by the integral itself.

## 4. Remove the invertible lower-left block premise (C/DetFirstCayleyBlockNeGroup:14–68; C/EventuallyUnit:14–110)
Use the lower shear nbar(t)=[[I,0],[tI,I]], t real. It belongs to G; its right action changes C to C+tD. The polynomial p(z)=det(C+zD) cannot be identically zero because at z=−i,
    p(−i)=(-i)^n det(iC+D)≠0.
The last nonvanishing uses the group relation U†V−V†U=2iI as above (native proof uses the negative of that identity). A nonzero polynomial has finitely many real roots, so for every sufficiently small nonzero t, C+tD is invertible. This is a punctured-neighborhood assertion, not an assertion about t=0.

Let F(t)=∫ fz(m,e,0,y nbar(t)nU(Herm(s))b)ψ(s) ds. All group products lie in G, both det(g) and det u1(g) are nonzero, and ψ is continuous. On the fixed compact topological support of ψ the integrand is jointly continuous, so continuous_parametric_integral_of_continuous gives continuity of F (EventuallyUnit:87–99). The full integral equals the integral on this support (95–97). From vanish_inv, F(t)=0 on the punctured neighborhood. Continuity and uniqueness of the limit give F(0)=0; nbar(0)=I. This proves vanish_all without the generic-block assumption, including cases y=I where C=0. The proof does not assume the original group itself is compact.

## 5. Exact consumer and remaining linkage
C/MultiplicityOneTestOperatorsAlt:33–37 (SingularTestsKillVacuum) additionally quantifies over a compact topological group Kg with measurable/Borel structures, Haar measure μ, continuous homomorphism ι:Kg→M2 n whose image is exactly InK, continuous ρ:Kg→C, ψ as above and a,b,x∈G. All premises retained even if some are unused in the final zero step. For each k, xι(k)a∈G; apply vanish_all with y=xι(k)a. Then the inner integral in tOp (LocTauAlt:29–31) is identically zero, so its ρ-weighted Haar integral is zero. This is exactly HSt.lt3 (C/SingularTestsKillVacuum:11–22), supplied to locTau := asmLT lt1 lt2 lt3 crux. RUN19 showed how this supplies c(0)=0, while Crux supplies c'(0)≠0. This is NOT a claim of annihilation of all sections or all Fourier modes. The argument has conventional Gaussian, Hermitian linear algebra, Fourier and continuity ingredients; no independent bibliographic attribution or new published result status established for these particular local theorems. No explicit sorry in the examined bodies is not a transitive axiom audit. The root linkage to every_character_of_literature_of_vWin still needs authenticated role-labelled kernel paths.

## 6. Source changes and actual checks
H consolidates the local chain in C/LocTau.lean (blob unchanged from previous H=4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061). H declaration lines: det_first_cayley_block_ne_group 676, factor 721, det_gram_eq_zero 801, inner_gen 839, core2 863, vanish_inv 1000, eventually_unit 1035, vanish_all 1079, lt3 1146, locTau 1172. Old EventuallyUnit path returns 404 at H; this is relocation not proof deletion. H has refactored helper usage (e.g. L1118 HolB.inG_mul). No assertion of complete semantic equivalence or repinning.
Executed connector JS source checks against P and H: 14/14 GitHub blob identifiers matched, 90/96 initial exact line anchors matched; all 6 mismatches were indexing errors confined to C/Imports, corrected and independently refetched (6/6). Thus final 96/96 anchor checks across initial and corrected checks. These are source checks, not Lean kernel replay. The following independently runnable subset reproduces all blob checks and representative anchors from a local upstream clone containing both revisions. Python version not executed here; no numerical analytic integration or URT performance measured.

```python
import subprocess
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="c40250a50104b7e02e7d74f658d00fa7b1f4827c"
b="src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/"
C="CayleyCosetSums/"
M="MollifiedIntegrability/"
rows=[
(P,"IsSingTest","af75ada6fed52177eab6c5bd3a2258dcce4e0253",35,"β.det = 0"),
(P,C+"TraceTransposeMul","9e129ea98882af52e5f238a4063f5233363e657f",18,"theorem det_gram_eq_zero"),
(P,C+"InnerGen","98604ff1bb0b3fa1a7c931f0031104a6e2f78527",148,"integral_integral_swap"),
(P,C+"Imports","14df8fc98bcf307b0b16a96a57f878403f15063c",67,"refine ⟨(U⁻¹)ᴴ"),
(P,C+"SecondCoordMulInner","cd3af656f93724f39e4a14232ced38fea3933e36",72,"theorem v_rel"),
(P,C+"VanishInv","4b0760dfd873607b259c4e42c9b72ae5e30e52e3",25,"core2 hmn"),
(P,C+"DetFirstCayleyBlockNeGroup","5515771ef76f44555954c26829ef628956fcc547",35,"theorem det_first_cayley_block_ne_group"),
(P,C+"EventuallyUnit","621544f98c39cbc5821667b090d78d8ef6acaf16",103,"vanish_inv"),
(P,C+"SingularTestsKillVacuum","b06d4dc436e74ee31390b189c3c965312fb51593",21,"L3.vanish_all"),
(P,C+"MultiplicityOneTestOperatorsAlt","20397fb5abbb0c9c8cb7bae6bd5a7a5a8c4c72f7",33,"def SingularTestsKillVacuum"),
(P,C+"LocTauAlt","c68017f4832d14fb672e9e27fdd3a9eab3e7436a",31,"∫ k"),
(P,M+"GaussM","3b4d1dfe6c9fc26983b00a4cbf5f009ab076d9b5",36,"theorem norm_phase"),
(P,M+"ContinuousGramX","af44b2ce9918243f39d49cd701032e70df63cec7",12,"theorem integP"),
(H,C+"LocTau","918a2e1a9b30cf9c2f00b7a2d3deb09e7f11e860",1172,"asmLT lt1 lt2 lt3 crux"),
]
for rev,name,sha,line,needle in rows:
    raw=subprocess.check_output(["git","show",rev+":"+b+name+".lean"])
    actual=subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()
    assert actual==sha,(name,actual,sha)
    assert needle in raw.decode().splitlines()[line-1],(name,line)
print(len(rows),"source blobs and representative anchors matched")
```

## RESUME HERE
Expand CrxMa.stepA_Z in the RUN19 Crux0 contradiction: identify the exact singular test to determinant-derivative implication and all analytic/smoothness premises. Then pos_int and dpDual; keep Gaussian base / GI.integP deep obligations and prior CR.crLem_of, KSing.lamSing_of in the queue. Request authenticated role-labelled paths for HSt.lt3, HSt.L3.vanish_all, core2, factor, eventually_unit and HSt.locTau (prior manifest 8996470). HANDOFF TO theta, dependency, kernel, integration, audit, editor, literature. Full RH reconstruction OPEN; no Lean-kernel or URT improvement claim.
