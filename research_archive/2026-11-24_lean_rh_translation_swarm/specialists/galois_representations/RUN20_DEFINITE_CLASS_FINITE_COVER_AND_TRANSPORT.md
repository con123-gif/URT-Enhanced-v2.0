# RUN20 — definite-form class transport and finite double-coset cover
2026-11-25. SOURCE-MATCHED local reconstruction; global dependency closure OPEN. Continuity: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, research state/log/protocol/continuity excerpts, CI #411 (02:22:47Z, physical checks only), RUN17 and RUN19, 16 latest commit titles and 14 peer commit file/patch handoffs (editor manuscript tail additionally fetched). External blueprint not reopened; some full peer files not read. RUN19 explicitly assigned this frontier; no duplicate found. No Cathedral physical changes.

## Provenance
Source leanprover-community/riemann-hypothesis, P=40e56bab026552e089d7afcfeff08d2defb9c005. Observed upstream H=c40250a50104b7e02e7d74f658d00fa7b1f4827c (2026-11-25 02:09:34 UTC), 126 ahead, 0 behind previous 4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061, compare returned 300 files (not exhaustive).
D=src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/; B=src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/ScalarCommutation/.
- P D/FiniteDoubleCosetDefiniteHermitianFormLevel.lean 70e22df080db715cc6051bb145acd84d761d21c9; H moved into D/FiniteDoubleCosetDefiniteHermitianFormLevelStatement.lean 891c6c097d69c881dfc0d8fac96306ad030bbaef. CCF P18–28 H94–104; ccf_holds P30–31 H106–107; finite_of_cover P33–42 H109–118; cover_of_relIndex P44–59 H120–135; inT_of_TC, TC_of_inT, psiAway_psiAway_inv P67–78 H143–154; cover_KHT P80–155 H156–231; finite_doubleCoset P161–168 H237–244.
- P D/FiniteDoubleCosetDefiniteHermitianFormLevelStatement.lean 17920b4e7c8780a2c0482950a1f30d772e63488c L8–12, H same path L259–263.
- P B/ClsMove.lean d1b6a517ac22e8d91cdc633be22eaedd9d1cf2c0 L19–181; H moved into B/SpecOfF.lean 704b31e6ae950a7e8271a5ee3c90d26ea2bdab52 L87–249. Six declarations identical after trimming.
- P B/SpecOfF.lean 2a619e581a3f64fd8a548f6dc7ad614a8b591ebf L138–227; H same path L1449–1538.
- P B/TypeSlice.lean 1c176ad18a52ea0eaa699e930cfcd2381a09b283 L53–62,104–106; H dcac4541d897050320fb28100f751caf3d80fe0a L88–97,139–141.
- P D/DformRelEquivalence.lean 401f8891e1c2fa029e38186ed3954a0b488799d6 L16–31 (equivalence).
- P D/BorelFiniteClassNumberCentraliserTorusStatement.lean 4e885888b095fc213c539329d11fd46675ac939f; PolynomialZeroLocusCoordinatesStatement.lean 8de31dde746277b27c2808acb32d3682964f98ca; ExistsUnitaryCentralizerOfCommutePadicPointsSpliStatement.lean 39a239996ad96657ff358c631147773a57dbb812. These three wrappers explicitly invoke the very same named native suppliers now called directly in H; no independent proof of those suppliers yet.

## 1. Why an eigenvector survives change of definite-form representative
Fix p prime, HTGroup G, complex module V, representation xi of A=G.C^units × Q^units, subgroup K of G.GAf, arbitrary index type J, functions psi_j,e and scalars theta_j. HasEig supplies a definite form B, adelic trivialization (x,t,hx), and a nonzero form Phi with op(K,e)Phi=Phi and op(K,psi_j)Phi=theta_j Phi for EVERY j. Form conditions: left covariance for the rational subgroup via its embedding and xi; right invariance for K × Kp(G). No finite-dimensionality or finite J needed for clsMove itself.

The equivalence relation on forms is beta'=s y beta y* with y a unit, s a positive rational. Its reflexive witnesses are (1,1), symmetry uses (y^-1,s^-1), transitivity uses (y'y,s's). The anti-homomorphism reverses products; central scalars commute. Positivity is preserved under inverse and multiplication. Thus the generated equivalence relation used by Quot reduces to the relation itself, not just a formal zigzag. Choose q=[B], B'=Quot.out q and use that relation to obtain y,s.

At the away-from-p algebra, denote the images of y,s by Y,T, and trivializations by x beta x*=t, x' beta' x'^*=t'. Directly invert the first identity to get x^-1 (x^-1)* = t^-1 beta. With beta'=T Y beta Y*, c=x'Yx^-1 satisfies
c c* = x'Y (t^-1 beta) Y* x'^* = t^-1 T^-1 t'.
This is sim_triv: c together with that multiplier belongs to G.GAf. For a similitude z of beta' with multiplier r, the algebraic identity (y^-1 z y) beta (y^-1 z y)*=r beta follows by substituting beta'=s y beta y* and cancelling the units (sim_conj). The rational scalar component r is unchanged, hence its positive sign is unchanged. In conj_emb take d=(c, inclG(G,1)(locC(G,(y,1)))); for every gamma' in grp(B') there is gamma in grp(B) with gamma'=a gamma a^-1 for a=(y,1) and iota'(gamma')=d iota(gamma)d^-1. The first component follows from the explicit c identity, the scalar component from commutativity of the scalar group, the p component from the homomorphism inclG∘locC.

Define Phi'(g)=xi(a)Phi(d^-1 g). For every gamma', use d^-1 iota'(gamma')g=iota(gamma)d^-1 g and xi(a)xi(gamma)=xi(gamma')xi(a) to get the new left covariance. Right K×Kp invariance follows by associativity. The map is injective on functions: if Phi'=0, evaluate at dg and apply xi(a^-1) to obtain Phi(g)=0. Moreover op(K,f) commutes with this change for every f, by the definition as a finsum over G.GAf/K of f(h.out)Phi(g(h.out,1)); left translation commutes with right translation, xi(a) is complex-linear and an additive equivalence, so it preserves finsum even as defined for infinite support. This is op_move, not an unjustified rearrangement of an infinite series. Thus the same Phi' is nonzero, e-fixed, and has every original eigenvalue. HasEigCls follows with the single q and Phi' before quantification on j. This proves the native clsMove chain (including the two ring identities), not existence of HasEig itself.

## 2. Why the double cosets are actually finite
Fix p prime, G with G.a=1 (retained in theorem even though final intro does not use its proof), level L, subgroup K' of Gr G 1 commensurable with K0=KHT p G.m G.n 1 G.Fw, and EACH definite B. H0=G.GAf × Gr G 1, Gamma=B.emb.range, K1=L.K.toSubgroup. Need finite Gamma\H0/(K1×K'), independently of finiteness of the number of B-classes (the latter is a separate SpecOfF premise).

CCF is the exact imported arithmetic cover input, for EVERY finite-dimensional Q-algebra D with ring structure, anti-homomorphism sigma:D→D^op, beta,y in D, prime p, and subgroup U of the product of the away and p local unit/similitude groups with module topologies. If U contains the simultaneous TC points in an open identity neighborhood O, there is a finite set S such that every simultaneous TC point z decomposes z=dg(gamma) s u with s∈S,u∈U and rational pair gamma satisfying the similitude equation and commuting with y. The rational multiplier need not be positive. ccf_holds applies the Borel class number theorem to the polynomial group-locus construction and classNumberFinite_holds. Those inputs are not implied by the group-cover proof below.

Apply CCF to D=G.C, sigma=G.star, beta=B.beta and y=1. Choose x,t from B.trivAf. Take U as product of the inverse images of the away-level subgroup (included in ambient units) under psiAway(G,x) and of K0 under psiP(G). The source constructs O1, O2 via exists_open_psiAway_mem_conj_level and TorCls.OpenP.openp, both open containing 1. Their product works because TC for y=1 and InT for y=1 are equivalent by the similitude equation and trivial commutation with 1 (inT_of_TC, TC_of_inT). Apply CCF to get S before choosing g∈H0.

For each g, lift g1 by psiAway(G,x^-1) (the inverse identity follows by cancellation), and lift g2 by the imported local centralizer-at-p theorem with y0=1 and B.sym, whose commuting premise is automatic. These are simultaneous TC points z=(z1,z2). Get z=dg(gamma)s u. The group grp(G,B.beta) imposes positivity of the rational multiplier, so gamma might not yet belong to it. THIS IS WHY THE SIGN BRANCH IS ESSENTIAL:
- If no negative multiplier exists, all gamma arising here have positive multiplier (rational units are nonzero).
- If a negative similitude exists, choose one fixed gm before choosing g, and enlarge S to S2=S ∪ dg(gm)S. If gamma is positive take delta=gamma and s'=s. If gamma is negative take delta=gamma gm^-1, s'=dg(gm)s. The imported form_mul_inv identity gives the similitude equation for delta, its multiplier is positive because a negative times the inverse of a negative is positive, and dg(delta)s'=dg(gamma)s. In either case delta belongs to grp and s' belongs to S2. No assumption of positivity for the CCF rational factor.
Consequently |S2|≤2|S| (an explanatory finite bound, not a new source premise).

Define Psi=(psiAway(G,x),psiP(G)) on the ambient product and fH:H0→ambient target by the subtype inclusion in the first component and identity in the second. fH is injective. Set S0=fH^-1(Psi(S2)), finite because S2 is finite and fH injective. Membership of u in U gives k∈K1×K0 with Psi(u)=fH(k). The native toAfF_eq_psiAway and formGroupToPadicPointsDegreeOne_eq_unitaryPoints give Psi(dg(delta))=fH(B.emb delta); local lifts give Psi(z)=fH(g). Apply Psi to z's factorization; then fH((B.emb delta)^-1 g k^-1)=Psi(s'). Hence h=(B.emb delta)^-1 g k^-1 belongs to S0, and g=(B.emb delta) h k. This constructs the finite cover for K1×K0 in cover_KHT. No assumption that every Psi(s') is itself an H0 point; the preimage and injectivity are necessary.

## 3. Changing the level and obtaining a finite-dimensional form space
Use the first relative-index component of commensurability: [K0:K0∩K'] is finite, i.e. K'.relIndex K0≠0 in the source convention. Choose T representatives for the left cosets K0/(K0∩K') and regard them as (1,t) in H0. For any k=(k1,k0) in the original cover, k0=t u with u∈K0∩K'. The native quotient lemma writes u as an inverse; either expression gives the same membership. Then g=gamma (h(1,t))(k1,u). S0 T is finite, giving cover_of_relIndex without requiring K'⊂K0 or normality. The map S0 T→Gamma\H0/(K1×K') is surjective by the covering decomposition, yielding finite_of_cover and finite_doubleCoset. In particular the proof gives the explanatory bound
#double cosets ≤ 2|S| [K0:K0∩K'].
No numerical value is asserted for the source's S.

For SpecOfF use K'=Kp(G)=K0 with reflexive commensurability. For every q in DFCls G, evaluate forms on a chosen representative r_c for each double coset. This gives a complex-linear map L: forms→V^C. If all evaluations are zero, write g=iota(gamma)r_c k and use the exact left covariance and right invariance to infer Phi(g)=xi(gamma)Phi(r_c)=0. Therefore L injective and dim forms≤|C|dim V, hence finite-dimensional (forms_fin). Finite-dimensional V is needed here; existence of the class cover alone is insufficient. The separate hypothesis Finite(DFCls G) makes the direct product of these finite-dimensional form spaces finite-dimensional. Together with clsMove, these supply the actual nonzero common eigenvector and finite spaces to specAlg (RUN18–19). Then SpecOfF→specData→specTopG→PlanEx→Pack→GeoOne→local–global compatibility→EveryCharacter→RH is the existing source-level consumer chain; authenticated raw-term root paths not newly established here.

## 4. Upstream audit
22 comparisons of full declaration slices (trim outer whitespace; stop at next declaration or section boundary): 15 exact, 7 different, all statement prefixes unchanged (ccf_holds checked by its explicit CCF signature; body uses term syntax). Changes:
1. ccf_holds now calls TorCls.Borel.classes_finite and TorLoc.exists_locus directly, instead of wrappers. P wrapper bodies explicitly target these exact declarations.
2. finite_of_cover and forms_fin adapt DoubleCoset.out_eq' and explicit arguments to DoubleCoset.eq.
3. cover_KHT now calls TorCls.centraliser_at_p directly, P wrapper explicitly targets it.
4. finite_doubleCoset extracts hK.1.relIndex_ne_zero instead of hK.1 (adapted commensurability API).
5. wrapper finite_doubleCoset_definiteHermitianForm_level retains exact native target, removes alternative tactics.
6. specOfF calls DefClassFin.finite_doubleCoset directly instead of that wrapper.
This resolves the changed supplier at the source-wrapper level. Do NOT assert unchanged deep supplier proofs or kernel compatibility.

## 5. Reproducible source certificate
Executed GitHub connector + V8: 12 blob metadata matches, 22 declaration comparisons (15 equal/7 changed), 20 exact source anchors, no Lean compilation. This checkout replay implements the same comparisons and anchor checks (not separately executed in a local checkout):
~~~python
import subprocess, sys, re
repo=sys.argv[1]
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="c40250a50104b7e02e7d74f658d00fa7b1f4827c"
D="src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/"
B="src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/ScalarCommutation/"
spec=[
(P,D+"FiniteDoubleCosetDefiniteHermitianFormLevel.lean","70e22df080db715cc6051bb145acd84d761d21c9"),
(H,D+"FiniteDoubleCosetDefiniteHermitianFormLevelStatement.lean","891c6c097d69c881dfc0d8fac96306ad030bbaef"),
(P,D+"FiniteDoubleCosetDefiniteHermitianFormLevelStatement.lean","17920b4e7c8780a2c0482950a1f30d772e63488c"),
(P,B+"ClsMove.lean","d1b6a517ac22e8d91cdc633be22eaedd9d1cf2c0"),
(H,B+"SpecOfF.lean","704b31e6ae950a7e8271a5ee3c90d26ea2bdab52"),
(P,B+"SpecOfF.lean","2a619e581a3f64fd8a548f6dc7ad614a8b591ebf"),
(P,B+"TypeSlice.lean","1c176ad18a52ea0eaa699e930cfcd2381a09b283"),
(H,B+"TypeSlice.lean","dcac4541d897050320fb28100f751caf3d80fe0a"),
(P,D+"DformRelEquivalence.lean","401f8891e1c2fa029e38186ed3954a0b488799d6"),
(P,D+"BorelFiniteClassNumberCentraliserTorusStatement.lean","4e885888b095fc213c539329d11fd46675ac939f"),
(P,D+"PolynomialZeroLocusCoordinatesStatement.lean","8de31dde746277b27c2808acb32d3682964f98ca"),
(P,D+"ExistsUnitaryCentralizerOfCommutePadicPointsSpliStatement.lean","39a239996ad96657ff358c631147773a57dbb812")]
def git(*a): return subprocess.check_output(["git","-C",repo,*a]).decode()
S=[]
for ref,path,sha in spec:
    key=ref+":"+path
    assert git("rev-parse",key).strip()==sha
    S.append(git("show",key))
def decl(s,n):
    a=s.splitlines()
    i=next(i for i,l in enumerate(a) if l.startswith(n+" "))
    j=next((j for j in range(i+1,len(a)) if re.match(r"^(private theorem |theorem |def |structure |end\b|section\b|namespace\b|variable\b|-- =====|set_option\b)",a[j])),len(a))
    return "\n".join(a[i:j]).strip()
rows=[
(0,1,["def CCF","theorem ccf_holds","theorem finite_of_cover","theorem cover_of_relIndex","theorem inT_of_TC","theorem TC_of_inT","theorem psiAway_psiAway_inv","theorem cover_KHT","theorem finite_doubleCoset"]),
(2,1,["theorem _root_.GlobalTheory.T.finite_doubleCoset_definiteHermitianForm_level"]),
(3,4,["private theorem sim_triv","private theorem sim_conj","private theorem mem_forms_move","private theorem op_move","private theorem conj_emb","theorem clsMove"]),
(5,4,["private theorem forms_fin","def SpecOfF","theorem UpperTheory.Gal.Spc.specOfF"]),
(6,7,["def HasEig","def HasEigCls","def ClsMove"])]
changed=[]
n=0
for a,b,ns in rows:
    for name in ns:
        x,y=decl(S[a],name),decl(S[b],name)
        if x!=y: changed.append(name)
        assert x.split(":= by")[0].strip()==y.split(":= by")[0].strip() or name=="theorem ccf_holds"
        n+=1
assert n==22
assert changed==["theorem ccf_holds","theorem finite_of_cover","theorem cover_KHT","theorem finite_doubleCoset","theorem _root_.GlobalTheory.T.finite_doubleCoset_definiteHermitianForm_level","private theorem forms_fin","theorem UpperTheory.Gal.Spc.specOfF"]
anchors=[
(0,"let Neg : Prop"),(0,"let gm : G.Cˣ × ℚˣ := if h : Neg then h.choose else 1"),
(0,"(hS₂.image Ψ).preimage hfH.injOn"),(0,"form_mul_inv G.star"),
(0,"mul_pos_of_neg_of_neg"),(0,"hK.1 S hS hcov"),
(0,"QuotientGroup.mk_out_eq_mul"),(1,"hK.1.relIndex_ne_zero"),
(1,"_root_.GlobalTheory.TorCls.centraliser_at_p"),(2,"exact @GlobalTheory.DefClassFin.finite_doubleCoset"),
(3,"eqvGen_iff"),(3,"ξ y (Φ (d⁻¹ * g))"),(3,"rw [AddEquiv.map_finsum]"),
(3,"t' * T⁻¹ * t⁻¹"),(5,"FiniteDimensional.of_injective L"),
(5,"Subgroup.Commensurable.refl _"),(8,"refine ⟨y' * y, s' * s, mul_pos hs' hs"),
(9,"exact @GlobalTheory.TorCls.Borel.classes_finite"),(10,"exact @GlobalTheory.TorLoc.exists_locus"),
(11,"exact @GlobalTheory.TorCls.centraliser_at_p")]
for i,a in anchors: assert a in S[i],a
print("12 source blobs; 22 comparisons; 15 identical; 7 changed; 20 anchors")
~~~
RESULT: DONE local source reconstruction of definite form transport and finite-cover reduction; PARTIAL on deep class-number and local-centralizer inputs and root authentication. No synthetic automorphic matrices, no Lean replay, no URT benchmark. Prior frob_laws, relocated SpecAlg/PTracePow/PProjTrace gaps remain. Source comparison is not a substitute for axiom or kernel audit.

RESUME HERE: expand the native GlobalTheory.TorCls.Borel.classes_finite proof in pinned D/BorelFiniteClassNumberCentraliserTorus.lean, specifically how the polynomial group-locus, functoriality and continuity transport classNumberFinite_holds to CCF; preserve all assumptions. Ask dependency/kernel lane for role-labelled direct references and authenticated Main path for specAlg (peer manifest 13962369, value root 1059646507), specOfF (13965895, value root 1059842589), and finite_doubleCoset, without rescanning the full export. Integration owns CoreAll/rest. HANDOFF TO Galois, integration, dependency, kernel, literature, audit, editor. Project OPEN.
