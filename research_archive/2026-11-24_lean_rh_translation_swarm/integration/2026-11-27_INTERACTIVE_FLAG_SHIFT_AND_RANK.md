# Agreeing characters: one flag-shift equation and the intersection rank

27 November 2026. Human derivation of the actual CrudeEnergy flag-propagation step and an additional rank formulation, under the native Eichler, character and frame hypotheses. No native replay or root retirement. Credit Alpöge, Sernau, Anthropic collaborators and Claude. Source pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src.

Continuity: HUMAN_PROOF_COMPACT.md editor RUN62 already supplies amplitude absolute convergence and weight change; RUN78 already supplies incompatible-character cancellation. Do not repeat them. This note attacks the next explicit RUN78 obstruction, CrudeEnergy.lean 46–82. Prior manuscript search found no named human reconstruction of hasCommonFlagVector_of_le or CharsAgree.exists_hasLevel; other worker branches/notes were not exhaustively searched. No claim of external novelty.

## 1. One quotient equation

Let F=frameImage 1, G=frameImage gamma, and let r be the number of frame columns (rho+1). Both column maps are injective. Put F_i=span(f_0,...,f_i), G_i=span(g_0,...,g_i), with F_-1=G_-1=0. Write S for the forward shift of coefficient vectors, Sx=(0,x_0,...,x_(r-2)). A common flag vector at a is exactly Fx=Gy with x,y supported in [0,a], leading entries c,c'. For a<r-1 define Q_a=V/(F_a+G_a). Then the native agreeing-character condition implies

    [F Sx - G Sy] in Q_a = 0.                         (1)

Here is the source-matched argument, retaining the exact finite character and rationality. For any E-linear covector l annihilating F_a+G_a, choose v with h(v,-)=l gamma by nondegeneracy of the actual rational Hermitian Gram. Thus h(gamma v,-)=l. The common vector w=Fx=Gy is isotropic at this step because its support excludes the last nonisotropic frame column. In EichlerFlag.exists_mem_besselU_eq_eichlerMap take the index a+1, coefficient vectors x and y, respectively, and the paired covectors l and l gamma. The prefix annihilation and support guards of that lemma are exactly the ones just imposed. For every t in E use the actual source scalar lambda=S.g*S.varpi*(-t). The two Eichler transformations are conjugate by gamma: their common first vector is lambda*w, their auxiliary vectors are gamma*v and v, and the coefficient TraceOne.tau*h(v,v) is unchanged by the isometry. This follows term by term from eichlerMap_mulVec; no normalizer assumption is needed. Their simple-root sums are lambda*l(F Sx) and lambda*l(G Sy). The native unipotentChar and selfDualChar, with exactly this scalar lambda, convert CharsAgree to

    psi_f(t * (l(F Sx)-l(G Sy)))=1    for every t in E,

with the actual additive-character convention (inverting both sides is immaterial). This is the scalar character calculation in CrudeEnergy.lean 54–63, not a replacement choice of conductor. By density of rational E in the finite adeles and the native additive-character separation eq_of_psi_f, the difference is zero. Thus every covector annihilating F_a+G_a annihilates F Sx-G Sy. Finite-dimensional double annihilator proves (1).

Equation (1) gives lower-prefix corrections u,v with F Sx-G Sy=Fu-Gv, both supported in [0,a]. The pair (Sx-u,Sy-v) is common, supported in [0,a+1], with leading entries STILL c,c'. Iterate to any b>=a, retaining exactly the same leading entries. At the final index the native star_mul_last_eq_of_frameImage_eq (equivalently compare norms with the isotropic prefix orthogonal to the last nonzero-norm column) gives c*star(c)=c'*star(c'). This reconstructs hasCommonFlagVector_of_le from the actual finite Eichler and character suppliers, not an assumption of flag alignment.

## 2. Consequence: intersection rank is a terminal interval

Let I_a=F_a intersect G_a. For any nonzero w in F_{r-1} intersect G_{r-1}, its two unique coefficient vectors have the SAME highest nonzero index: otherwise apply the preceding norm equality at the larger index, giving a nonzero field norm equal to zero. Consequently I_a=F_a intersect G_{r-1}=F_{r-1} intersect G_a.

For w in I_a, taking its two leading coefficients defines a linear map I_a/I_(a-1) -> E^2. Its image contains no nonzero vector with either coordinate zero. Hence it has dimension at most one, and when nonzero it is the graph (c_a*t,t) for a unique c_a in E with c_a*star(c_a)=1. The shift argument (1) propagates any nonzero such pair at a to every later b, with the same coefficients, so all later quotients have dimension one and c_b=c_a. Therefore either I=0 and j=r, or a unique minimal j with I_j nonzero exists. With the common norm-one scalar c, for all a:

    dim I_a = max(0,a+1-j),
    rank [F_<=a, -G_<=a] = 2(a+1)-max(0,a+1-j).       (2)

In particular rank [F,-G]=r+j and dim I=r-j. This is a direct rank formula from the source propagation premise. It is also equivalent to the minimal IsNormalForm index: choose the common leading pair (c,1) at each a>=j; if j=r the empty normal form uses c=1. Any smaller index would give an earlier nonzero quotient. This proves the minimal-normal-form vanishing subargument M in CharsAgree.exists_hasLevel: if Gy=Fx and y_i=0 for i>=j, then either w=0 or its common highest index is <j, impossible. Both coefficient vectors then vanish by injectivity.

For the second-moment exposition, (1) and (2) package the recursive flag geometry and the minimal-normal-form rank obstruction without repeating a reverse induction over flag vectors followed by a separate coefficient-elimination induction. Do NOT identify rank [F,-G] with the rank or leading minor of frameProducts: the latter needs the separate Hermitian discriminant and normal-form pairing argument.

## Evidence and remaining work

Read actual compact source CrudeEnergy.lean blob da67bf862a4c5e72ab6a81a7dfb462545cd8833f (46–82); CrudeBoundDefs.lean 0ba0d2532b14c414b9032466b79e10d4d60c3d18 (56–64, HasLevel, CharsAgree); EichlerFlag.lean 3da2606a049a092719b779802cb8ead3af7141ce (164–170, exists_mem_besselU_eq_eichlerMap); Lib/DiscreteSeries/Bruhat/EichlerMaps.lean c1d16d7a700fa344bce743a2ead6ecee7ab0fa8a (eichlerMap_mulVec). Retain native frame injectivity, last-column norm identity, rational Hermitian Gram, TraceOne, exact selfDualChar normalization and finite-adele density. This is a mathematical derivation, not a compiled certificate or claim that new source theorems were executed. No native checker run, no CI PASS asserted. Original graph unchanged; no changes to shared manuscript, schedules, or protected files.

RESUME HERE: independently audit (1) against the exact source character normalization and both Eichler guards; then use (2) at CrudeEnergy.lean 73–82 and establish the leading-minor nonvanishing and termDisc=0 equivalence from norm_sq_middle_part_eq and the paddedLeading kernel. Those are the remaining guards for CharsAgree.exists_hasLevel; do not call the full theorem completed. Connect to energy_le_of_level_lt and weighted pair-count only after that. The prime-error inequality and ten-page RH reconstruction remain incomplete.
