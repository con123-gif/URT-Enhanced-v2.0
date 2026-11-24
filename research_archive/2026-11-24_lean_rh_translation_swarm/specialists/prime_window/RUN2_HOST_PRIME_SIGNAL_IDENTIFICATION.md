# Prime-window run 2 — identify the prime signal across the arithmetic/analytic boundary

2026-11-24. RESULT: SOURCE-MATCHED / human reconstruction of the exact host-to-Level-to-CharFamily identification and discarded-character error. Conditional on the original host assumptions, not full RH, not Lean kernel execution, no URT advantage claim. This completes the detailed prime-signal adapter missing from run 1. The arithmetic source of the window remains conditional on the geometric/host producers.

## Preflight / avoid duplicate work
Read the three swarm protocols, AGENTS, state, actual runner log/protocol, continuity, state-branch summary (unrelated physical CI PASS 45350120163, 08:02 UTC), prime run 1, peer math window_exponent_and_character_projection and analytic_zero_exclusion, character-box connected witness, theta, Galois, positivity, literature, Landau, kernel run 2, acceleration run 2, integration and editor handoffs. Those chapters already explain the +7 exponent, window selection and conditional Landau argument; do not duplicate. This chapter reconstructs the exact signal equalities and the finite-character error bound with all exceptional weights, not just names. Other peer files were inventoried; no claim of reading every historical note. No physical files changed.

PIN leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005. Current upstream independently observed d27f71347abceb76cd37dc8a5fccbe556ec2be90 (2026-11-24 07:32:48 UTC). GitHub comparison against prior run's 343b1de38bbe4c5c66f1c1c0afd7c34e8645acdf reports four commits, changed README and inbox workflows/scripts only; earlier source revisions remain different from PIN. Keep proofs version-separated.

## Pinned source ledger
C=src/Development/AutomorphicArithmetic/PrimitiveCosets/; D=src/Development/AutomorphicArithmetic/DedekindLFunctions/; F=src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/. Each SHA is the GitHub-reported blob ID at PIN. These are source references, not kernel edges.

| Path | Blob | declarations / lines |
|---|---|---|
| F/Analytic.lean | 599699b5b35f6fb7bf2ab94f5f0c577b14f35ea1 | abelian₂ 9; logDerivativeAtOne 11–12; G 14–16; sumLamChi 18–19; gChi 23–24; Induces 26–27; Induces.unique 42–66; HostRaw.dir/prim/isPrimOf_iff 102–119; kept_iff 127–134; Bounded, KeptInXp 136–138; BoundedCharsPointwise 154–156; ExceptionalCharacterKept 158–159 |
| F/ExplicitFormulaErrorOfHostConditions.lean | ed60b4b997cd4703713660b185b9e43fd95559a1 | Level 8–9; ZeroFreeAbove 24–26; Nt 32; wt 36; Gm 38; EAtH 144–151 |
| C/CoreAtH.lean | 0ba3621036f19146e7e67fa9c0e8a1c38661a097 | chr 14; HostAddCharCompatible 18–20; keptA 24–25; CoreAtH 29–41 |
| C/PrimRead.lean | 3960cf3e7d166f6664405a0d5fcb995924621ffb | prim_read_dir 6–10; prim_read_surj 12–23; prim_read_max 25–33; prim_read_Gz 35–38; prim_read_one 40–46; prim_read 48–97 |
| C/PrimInj.lean | 5720fe0139394b6e9d8c688b36ae2d6f5af10478 | prim_inj 6–27 |
| C/GmAEq.lean | 2f1a763f43d65eea1f6e61018c8b70c02d2dfa03 | character_trivial_on_generator_iff 10–14; gmA_eq_triv 16–59; gmA_eq 61–149 |
| C/SigALe.lean | e9c80e2017ec149ac559bc20c184b9264b9ec0c2 | character_trivial_first_factor 8–16; chr_bounded 18–36; sigA_le 38–60 |
| C/CardPsiA.lean | 4fe4ded735dd1ba55db3a01fc181ad794a2c4a0a | exists_comp_eq 8–24; card_PsiA_index 26–58; card_PsiA 60–63 |
| D/SplitInertia.lean | b5662cda1f3523fc53b547ee582a46bd3cd826d4 | PsiA 26; wtA 30; GmA 34–35; SigA 39–40; CharsA 56–62 |
| C/GChiEq.lean | d7abdea8d4ea78d5f4144e8781ab33dc1760069c | gChi_eq_ramp 6–14; gChi_eq 16–36 |
| C/GzEq.lean | ee8161fad71e4610eef5f9a362ec6fbee4a57e01 | Gz_eq 6–50 |
| C/LevelFamily.lean | d08c25d0cb674297482bec9a235401c14bfb22fa | level_family_wt 9–10; wt_pos 12–17; adm 19–25; sum 27–39; level_family 41–52 |
| C/CoreGm.lean | 3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d | core_gm 12–74 |
| C/Imports.lean | 2dc9b4e690951c66ffe443e279fcada259bcce13 | formB 8–19 |
| D/CharFamily.lean | 81c8dfd66d910d083d5bc88c664c7917fdbdfe96 | ramp/Gchi 10–19; CharFamily 24–32; Gm/ZeroFree 36–39 |

## 1. One signal written in three different languages
Use capital H for the host and A for the finite additive group of its frame φ; E0=(Z/2)^2. An additive character is denoted α, a primitive Dirichlet character p (a PChar) is denoted p. The finite level Λ has KEPT containing PChar.one and optional exceptional element psK. Its order field o is a natural number, so c=1/(3o+1)>0. Nt=KEPT minus one; Level.wt(p)=1 if psK=some p, else c. The zeta signal itself has weight one, whether or not the generic Level.wt(one) equals one.

The actual arithmetic host sum is GmA(D,ell,Kp,c,y)=sum_{α in Kp} wtA(c,α) Re GPsi(D,ell,α,y), where wtA=1 if α(0,h)=1 for EVERY h in A, else c. This condition is stronger than triviality on A0, which merely defines PsiA(A0). The Level signal is Gz(y)+sum_{p in Nt} Level.wt(p) Re An.gChi(p.χ,y). The analytic family signal is sum_i a_i Re Deduction.Gchi(χ_i,y). The two equalities below are exact for all real y, not estimates, and not assertions that every arithmetic host is admissible.

## 2. Exact primitive prime-power read (PrimRead:48–97)
Fix φ,H:HostAx φ and ell:AddChar(E0×A,C)→C with HostAddCharCompatible(H.raw,ell). Compatibility (CoreAtH:18–20) means for EVERY α≠0 and EVERY positive modulus N and primitive χ of modulus N with χ(n)=primVal(arith H,α,n) for EVERY natural n≠0, ell(α)=L'(χ,1)/L(χ,1). No unconditional formula for ell is inferred.

Let j(α)=H.raw.prim(chr φ α), a primitive PChar, not the uncorrected character modulo the host conductor. PrimRead:55–61 first identifies H.dir(chr φ α) with dirChar(recH H,α). Then the cited primitive_value_primitive gives for every n≠0, j(α).χ(n)=primVal(arith H,α,n), using the positive conductor. In particular this holds at n=p^k for k≥1, even at ramified primes. Replacing the primitive character by the imprimitive host character would be invalid at such primes. This underlying primitive_value_primitive proof is retained as an upstream obligation; not reconstructed here.

The zero-mode equivalence is j(α).χ=1 iff α=0 (PrimRead:64–83). A Dirichlet character is principal iff its primitive character is principal (changeLevel_primitiveCharacter and primitiveCharacter_one). If the host character is principal, evaluate on units u; for every g in φ.GG choose u with H.art(u)=g (HostDer.art_surj), and for every element of E0×A choose g mapping to it (prim_read_surj). Thus α takes value 1 everywhere; it is the zero additive character. Conversely α=0 gives the trivial host character. This is why surjectivity cannot be omitted.

For α≠0, use compatibility at j(α) to identify ell(α) with the log derivative at one. Every n in [1,floor_nat(y)] is nonzero and ≤y, so max(y/n−1,0)=y/n−1. The source rewrites the finite summands with the exact primitive values; hence GPsi=An.gChi. For α=0 the principal correction Gz=An.G supplies the equality. For y<1 the natural-floor interval is empty and no division-by-zero argument is required. The conclusion is
  (α≠0 → ell(α)=An.logDerivativeAtOne(j(α).χ)) AND for EVERY real y, GPsi(arith H,ell,α,y)=An.gChi(j(α).χ,y).
This is a transfer of the *whole weighted prime-power signal*, including the separate principal correction; it is not an estimate based on unramified primes alone.

## 3. Exact weights and no duplicated primitive character (GmAEq:61–149)
Fix Λ, φ, H, TT, x,eps,C and ell with EAtH Λ H.raw TT x eps C and HostAddCharCompatible. EAtH has all six fields o_eq, kept, ps, shares, bdG, bdL. Only relevant fields are used in this equality; none is removed from the theorem. Its kept field ensures each p∈KEPT is induced by a character θ∈Xp, where Xp comprises those θ trivial on A0 and θ(iod)=1. The ps field says if psK=some p then p is induced by φ.psC, and if psK=none then φ.psC is not kept. These are premises, not consequences of Fourier analysis.

By HostRaw.kept_iff, Kp=keptA is exactly {α:j(α)∈KEPT}. chr_bij supplies the bijection α↦θ. PrimInj:6–27 supplies injectivity of θ↦H.prim θ: if two primitive characters agree, then their inducing values agree on every host unit, since the unit's natural representative is coprime to the conductor. Artin surjectivity then makes them agree on every g; monoid hom extensionality gives equality. Thus j is injective. Surjectivity onto KEPT follows from EAtH.kept and chr_bij, so j:Kp→KEPT is bijective. The same argument ensures every α∈Kp has chr φ α∈Xp. No character is duplicated or discarded by the reindexing.

To match weights, note that on the two sign factors and A, θ(iod)=1 kills one sign factor. If additionally θ is trivial on every τ1(h) (h∈A), the remaining character depends only on the other sign factor, whose generator squares to one. Its value is +1 or −1. Hence θ=1 or θ=φ.psC, and conversely those two θ have the stated restriction (gmA_eq_triv:16–59, generator transport:10–14). Therefore for α in Kp:
- if θ=1, j(α)=PChar.one and its weight is one;
- if θ=φ.psC, it is kept. If j=one the weight is one; otherwise psK cannot be none by EAtH.ps. When psK=some p, isPrimOf_iff identifies that p with j; its weight is one;
- if θ is neither, it cannot map to one (injectivity) or to the optional psK element (the exceptional character condition plus injectivity); its weight is c.

This proves wtA(c,α)=if j(α)=one then 1 else Level.wt(j(α)), exactly as lines 94–128. Do not set every weight to c, or replace the exceptional case by an arbitrary character with a large value. Reindex the finite sum using the bijection and use section 2 termwise (129–136). Separate the principal character exactly once (137–149), obtaining
  GmA(arith H,ell,keptA Λ H.raw,c,y)=Λ.Gm(y) for EVERY real y.
This equality does not require bounds on the omitted signals. It does require the source's host/primitive and character compatibility.

## 4. Omitted-character bound (SigALe:38–60)
Fix the same Λ,φ,H,TT,x,eps,C,ell; additionally x>0. Define O=PsiA(A0) minus Kp. For α∈O, θ=chr φ α is trivial on A0. Since iod²=1, θ(iod)=+1 or −1. In the + case θ∈Xp and θ is not kept (since α∉Kp); in the − case θ∈Xm. Either case gives θ∈H.raw.Bounded Λ.KEPT, as defined at F/Analytic:136. EAtH.bdG (the original pointwise bound on bounded primitive characters) and section 2 imply
  |GPsi(arith H,ell,α,x)| ≤ x^(1/2+eps).
It is essential to retain this upstream square-root bound for the *omitted* class; it is not a consequence of their being omitted. No assumption of a pointwise bound on the retained signals.

Sum over O to get SigA≤|O| x^(1/2+eps)≤|PsiA(A0)| x^(1/2+eps), since the power is nonnegative. CardPsiA:26–63 supplies |PsiA(A0)|=4[A:A0]=4 φ.o: the character is trivial on kernel {0}×A0 of the surjection π:E0×A→E0×(A/A0), so descends uniquely. To see this, if π(u)=π(v), then u−v lies in kernel, giving α(u)=α(v)α(u−v)=α(v). Hence choose a lift per quotient point to define the descended character; independence of lift and multiplicativity follow from that same equality. Pullback is injective by surjectivity, so the finite complex character dual has cardinality of quotient, 4[A:A0], using AddChar.card_eq. Frame.index_A0_eq_o and EAtH.o_eq give 4Λ.o. Therefore
  SigA ≤ 4Λ.o x^(1/2+eps).
The absolute value here is for omitted individual complex signals, NOT for the final weighted retained sum. Negative retained values are allowed.

## 5. Finish the power-bound interface without assuming it
CoreGm:12–74 fixes Λ,eD,eL,K,cHH,eK,C,eps with eps>0 and returns a threshold x1 uniform over all later x and all φ,H,TT satisfying EAtH and CoreAtH. It applies ch_core and ch_top under the full CoreAtH unpacked hypotheses, including SizeData₂, ErrWindows, BNBoundsU, SizesA, ThinScales, CostWindows, RestSize, T2 subset A0, ell compatibility and local bounds. The source derives eD+eL≥0 inside this proof; it is not a free global assumption.

The retained-sum bound from ch_core has A=x^(1/2+(eD+eL+6)eps), plus SigA. Sections 3–4 give Λ.Gm≤A+4o B, B=x^(1/2+eps). For x≥1, eD+eL≥0 and eps>0, B≤A. Choose common threshold also ensuring x^eps≥1+4o, possible since eps>0. Then
  Λ.Gm≤(1+4o)A≤x^eps A=x^(1/2+(eD+eL+7)eps).
This is the exact final exponent absorption (CoreGm:61–74), not a proof of the antecedent from finite group algebra. The geometric and arithmetic producers of the hypotheses are separate tasks; the math and character-box chapters already map their selection into arbitrarily late windows (TopWin:68–81). FormB (Imports:8–19) uses level_family, la>1, 0<theta<1 and the supplied windows of Λ.Gm≤y^theta, setting C=1, delta=la−1. Then zeroFree_of_rpow_window applies. This identifies the direct consuming call site of the conditional prime-window theorem on the mapped root route. No claim of exhaustive full-corpus call-site search.

## 6. The Level-to-Landau identity (LevelFamily:41–52)
Choose F's finite index to be the subtype of KEPT; moduli and characters are exactly the PChar fields. They have nonzero modulus. Every primitive principal character has conductor=1 (GChiEq:21–31, LevelFamily:19–25); hence F.adm holds. This excludes imprimitive principal characters with missing Euler factors. F.a(p)=1 for p=one, and Level.wt(p) otherwise. Positivity is exact since denominator 3o+1≥1 (even when o=0).

GChiEq:6–36 proves An.gChi=Deduction.Gchi for every PChar and all y. The n=0 term vanishes by von Mangoldt(0)=0; the natural interval [1,floor_nat y] equals the remainder of the finite range. In the principal branch primitivity forces N=1, so χ(n)=1 for all n, including 0 in ZMod 1. Thus its prime sum and principal correction are the universal zeta signal. In the nonprincipal branch the same ramp and log derivative coincide definitionally after the finite-sum rewrite. GzEq:6–50 proves Gz=An.G=Deduction.G, including y<1 (empty range); on each nonempty summand max may be removed because n≤y, and endpoint n=0 contributes zero. Reindex F by KEPT, isolate one with weight one, and use these identities. Therefore for every real y, F.Gm(y)=Λ.Gm(y). Moreover for every real theta, F.ZeroFree(theta) iff Λ.ZeroFreeAbove(theta), since both quantify precisely the same primitive characters and all complex s with Re s>theta. This is an equivalence of quantified propositions, not a numerical inference. No universal nonvanishing assumed.

## 7. Execution / replay
Executed 82 literal/blob checks on the 15 pinned files above via GitHub connector and V8; exact finite V8 checks: 280 cyclic quotient-annihilator counts, 9,880 integer-scaled weighted reindex cases (including signed values and o=0), 16,640 integer absorption inequalities, 32 nonunit-weight controls, 44 prime-power principal-mod-4 versus primitive-mod-1 value checks, and 32 wrong-principal-weight counterexamples; all checks passed. Total finite checks 26,908 (plus 82 source checks). These are illustrative finite algebra regressions only, not tests of actual L-function nonvanishing or all groups. The quotient tests use cyclic groups, not surrogate native Cathedral matrices. Replay below uses Python standard library and the pinned git checkout (the Python version is provided for reproducibility, not separately executed in this session).

```python
import subprocess
P="40e56bab026552e089d7afcfeff08d2defb9c005"
C="src/Development/AutomorphicArithmetic/PrimitiveCosets/"
for f,sha,terms in [
 ("LevelFamily.lean","d08c25d0cb674297482bec9a235401c14bfb22fa",["if ψ = PChar.one then 1 else Λ.wt ψ","Finset.sum_coe_sort"]),
 ("GmAEq.lean","2f1a763f43d65eea1f6e61018c8b70c02d2dfa03",["Finset.sum_image hinj","gmA_eq_triv","hE.ps"]),
 ("PrimRead.lean","3960cf3e7d166f6664405a0d5fcb995924621ffb",["primitive_value_primitive","@hell ψ hψ","HostDer.art_surj"]),
 ("SigALe.lean","e9c80e2017ec149ac559bc20c184b9264b9ec0c2",["hE.bdG","card_PsiA, hE.o_eq"]),
 ("CardPsiA.lean","4fe4ded735dd1ba55db3a01fc181ad794a2c4a0a",["exists_comp_eq","AddChar.card_eq"]),
 ("CoreGm.lean","3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d",["gmA_eq","sigA_le","1 + 4 * (Λ.o : ℝ)"]),
 ("Imports.lean","2dc9b4e690951c66ffe443e279fcada259bcce13",["level_family Λ","Deduction.zeroFree_of_rpow_window"])]:
    data=subprocess.check_output(["git","show",P+":"+C+f])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=data).decode().strip()==sha
    for t in terms: assert t in data.decode(),(f,t)
counts=[0]*6
for n in range(1,65):
    for o in range(1,n+1):
        if n%o: continue
        m=sum(1 for a in range(2) for b in range(2) for k in range(n)
              if all(k*o*j%n==0 for j in range(n//o)))
        assert m==4*o
        counts[0]+=1
for o in range(65):
    for m in range(1,17):
        for sp in range(-1,m):
            vals=[(i*17+o*7+m)%41-20 for i in range(m)]
            d=3*o+1
            a=vals[0]*d+sum(vals[i]*(d if i==sp else 1) for i in range(1,m))
            b=sum(vals[i]*(d if i==0 or i==sp else 1) for i in reversed(range(m)))
            assert a==b
            counts[1]+=1
    for r in range(1,33):
        for t in range(8):
            A,B,Q=r,r+t,1+4*o+t
            assert A<=B and B+4*o*A<=Q*B
            counts[2]+=1
for o in range(1,33):
    assert 3*o+1!=1
    counts[3]+=1
    assert 7*(3*o+1)+11!=7+11
    counts[5]+=1
for p in [2,3,5,7,11,13,17,19,23,29,31]:
    for k in range(1,5):
        assert ((p==2)==(1!=(p**k%2)))
        counts[4]+=1
assert counts==[280,9880,16640,32,44,32],counts
print(counts, sum(counts))
```

No Lean installation or kernel export executed in this run; no proof-coverage percentage, no novel RH theorem, no URT speed result. Source graph counts cannot replace kernel closure. Independent audit request: review j injectivity/surjectivity, the full exceptional weight branch, and the distinction A0 vs A, including imprimitive corrections and source positivity. Require exact pinned producer of primitive_value_primitive before marking primitive prime-power read fully reconstructed.

RESUME HERE: follow PrimRead:60's actual primitive_value_primitive definition through CoreAtH→RecH→GaloisMapComplexConjugation/its imports, reconstruct the local ramified and unramified p^k values from inertia and Frobenius and then the finite n≠0 statement; inspect GPsi and primVal actual definitions. Preserve conductor-level reduction and all zero/ramification exceptions. Coordinate with Galois and Landau lanes; do not redo their pole or geometry work.
HANDOFF TO: formal audit, math, integration, proof editor, Galois arithmetic, character boxes, Landau criterion. The three-stage exact prime-signal identification and omitted-class bound are ready for independent review.
