# Theta lifts run 3 — integer nonvanishing and the gamma-pole guard

2026-11-24. RESULT: SOURCE-MATCHED human proof of the actual heckeL_ne_zero helper, plus a CONDITIONAL reconstruction of LInt2 from the Tate functional equation and original triple hypotheses. Exact source declaration GlobalTheory.ThK.Dbl.lInt2 and its supplying functional-equation proof still not located: do not mark that dependency closed. No Lean kernel execution or URT speed claim.

## Continuity and revision
Read the three swarm protocols, AGENTS, docs/RESEARCH_STATE, actual runner log/protocol, continuity, recent peer lane handoffs, integration manuscript spine, theta runs 1 and 2. Prior physical CI PASS 45360853226 (09:20 UTC) is unrelated to RH. Resume the LInt2 obligation left by run 2; no duplication of the induction or the Landau lane's Dirichlet line-one argument. Original source leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005. Current main c9883164b0b3d762cee21f889d03d59a53b3ba3b; comparison with previous observation 0e40c084e27c44a3584e271cb14e7dd3bce9aa63 shows extensive Lean source migration, including removed files. Current CloseSph blob b456f1f9f5defbd9056afcb978e2ff2612fb02cd (calls lInt2 at line 1733), ExistsIsHeckeLOfCompleted c07281b01222bb83c5f412abf58d65cccde968fe (definition LInt2 at 157, original heckeL_ne_zero helper no longer in that file), HeckeLNeZeroNat 393f7d432b9214d5373496e471973c4ae84a3eaf. Do NOT merge graphs or infer semantic equivalence. Continue with original pin.

## Source ledger
T=src/Development/WeilBound/ThetaLifts/; D=src/Development/AbelianVarietyTheory/.
- A T/SphericalLattices/SphericalClosure/CloseSph.lean 9a15ec479fb007975f15b6df7fe5fe46615e4f8f, lines 102 and 126.
- B T/LatticeBasics/ExistsIsHeckeLOfCompleted.lean a9870cbfacc6ffa1c17c95759232ef2ffff16239, 17–72,74–103,105–127,129–160,162–173,175–179.
- C T/LatticeBasics/GoodNe.lean db5a77ed007a052eb89fe1419815d2f2d25588f4, 20–30.
- D1 D/BlockTheory/DivisorBase/WeilTensorModels.lean 4d0d94fd3fd9368e5428c05402979d6dd5123b4d, 332–395.
- E D/BlockTheory/DivisorBase/CompletedLStripBounds.lean 1bdbf18d79ab19073e0c72867a8a2e75b66c3269, 12–17,32–49.
- F D/PublishedTheorems/Divisors₂/HeckeTateFunctionalEquationCM.lean a5ffc620467a060d7b31be9eaf198dedb081d180, 205–229,244–249.
- G D/Proofs/DivisorProofs/HeckeLNeZeroNat.lean 998eeb6c8239496943757f7e742548dd94e39361, 10–21.
- H D/PublishedTheorems/Divisors₂/IsCMTypeEmbedding.lean f903a88f78de55eb9654f028c747fa01cbf96cbf, 15–32.
- I D/Proofs/AdelicLatticeProofs/EulerProductNeZeroOneOfEntire.lean 959b1b46ae3f86d2ed5010941ca5012452d9607a, 95–end.
- Additional inspected: D/Proofs/TwistedOperators/HeckeLEntireAndNonzeroAtOneHolds.lean c01065ba01809142bda080d78a6bf1731d17a1ef; T/LatticeBasics/BotAsm.lean de3e30d43431c4ea373b47a59dc6aeaa4371d70a; src/GroundTheory/GlobalFields/TateThesis/GlobalZeta.lean 22e04bacda7799db391ba0b8e6b547d55cbd7afa.

## 1. The exact target, not RH
Fix F,E number fields with Algebra F E, sigma, base B, ranks a,a', geometry G, characters X, Weil representations om,om', and h:IsTriple B G X om om'. Keep all field/typeclass, CM, geometry, ramification, representation and character conditions. Put d=a+a' and nu=X.alpha/X.beta. B LInt2 states:
For each chi in the two-element set {nu,nu^(-1)}, there exists an entire f_chi:C→C such that f_chi(s)=charL chi empty s on Re(s)>1 and f_chi(z)≠0 for every integer z with -d<=2z. This is the UNCOMPLETED Hecke L-function, despite the variable Lambda in LInt2. No claim of nonvanishing for all complex points in a half-plane follows from this integer-only theorem.

A explicitly uses lInt2 to supply LInt2 to nonZeroBottom_of_doubling_integral. The declaration body of lInt2 is not in B (B ends after the definition), and is not in the same file A. Exact GitHub search and the indexed search both returned no hits, despite known calls; tree of ThetaLifts has 828 entries; inspected candidate import paths (including BotAsm, HodgeTateFromSandwich, GoodNe, NormZeta, EulerHalf, EndCore, PolZero, BadFactor, FinLevel, ConstHecke, LatticeBasics and core candidate paths), not an exhaustive transitive source scan. Failure of search is NOT evidence that the declaration is absent or is an axiom.

## 2. Actual helper B: converting completed to uncompleted entire function
Given an entire completed function Lambda for unitary HChar chi with infinity exponents n_i, E defines
  A_n(s)=product_i [2 (2 pi)^(-(s+|n_i|/2)) Gamma(s+|n_i|/2)].
IsCompletedL means entire and, for Re(s)>1, Lambda(s)=A_n(s) times the Euler product (with an explicitly convergent HasProd witness).
B exists_isHeckeL_of_completed constructs L(s)=Lambda(s) product_i [(2(2 pi)^(-(s+|n_i|/2)))^(-1) Gamma(s+|n_i|/2)^(-1)]. This is entire: the constant-base power is nonzero and holomorphic, and reciprocal Gamma is entire, including at its zeros. On Re(s)>1 every Gamma argument has positive real part; cancellation of the nonzero factors recovers the convergent Euler product, which is exactly IsHeckeL.

F completed_eq_mul proves the opposite identity Lambda(s)=A_n(s)L(s) for every s where no shifted argument is a nonpositive integer. It first extends the identity for reciprocal archFactor times Lambda to the whole plane by the identity theorem and then multiplies by the nonzero archFactor at an allowed s. Do not cancel Gamma at a pole. B shift_ne verifies that 2z+|n_i|>0 for integer z excludes all arguments -j (j a natural number): equality would give 2z+|n_i|=-2j<=0.

## 3. Actual helper B: the integer nonvanishing reflection
B heckeL_ne_zero takes explicitly hFE:GlobalTheory.Published.HeckeTateFunctionalEquation, a totally complex number field, finite CM embedding type phi, unitary HChar chi, HasInf chi phi n, and at least one nonzero n_i. It returns an entire uncompleted L, with L(z)≠0 for every integer z satisfying ALL 2z+|n_i|>0.
H supplies unitary inverse, negated infinity exponents, and a finitely supported exact conductor exponent family for chi^(-1). Invoke hFE on chi^(-1), exponent -n and that family. This gives completed functions Lambda' for chi^(-1), Lambda for chi (using inv_inv and neg_neg), with
  Lambda'(s)=archEps(-n) finEps(chi^(-1),conductor,s) Lambda(1-s).
Use section 2 twice to obtain L and L' and their entire Euler product agreements.

For z>=1, G IsHeckeL.ne_zero_nat gives L(z)≠0. At z>1 this is the exponential Euler-product identity, not a merely termwise nonzero infinite product. At z=1 G invokes the entire regularization of the Dedekind zeta product, coefficient bound <=1, summability for real part >1, nonempty prime index and the theorem I eulerProduct_ne_zero_one_of_entire. Entirety of L is an explicit premise. The proof of I and the regularized Dedekind zeta producer remain separate dependencies; do not replace by convergence of Euler product at 1.

For z<=0, t=1-z>=1, so L'(t)≠0 by G for the inverse character. All t+|-n_i|/2>0. F completed_eq_mul at t gives Lambda'(t)≠0 (each archimedean factor and L' nonzero). Rewrite Lambda'(t) using hFE, 1-t=z, and F completed_eq_mul at z using the supplied strict Gamma guard. This yields a nonzero product with rightmost factor L(z), hence L(z)≠0. The exact source extracts nonzeroness of the right factor twice; it does not divide by an unproved root number. This is an ordinary functional-equation reflection of INTEGER values to integers >=1; it does not cross to or imply nonvanishing throughout the critical strip.

The source F defines hFE as a proposition with exact finitary conductor and epsilon factors, and entire completed functions satisfying the equation for ALL complex s. The helper assumes that proposition; the file name PublishedTheorems is not proof of its availability. The actual supplier on the lInt2 route is still an unresolved source-provenance obligation, not an identified axiom. Historical Tate theory is relevant, but no independently inspected primary-text-to-formal-equation normalization equivalence is claimed here.

## 4. Conditional adapter from the original geometry to LInt2
This is our mathematical reconstruction from the above actual source lemmas, NOT an assertion that the unlocated source body of lInt2 uses precisely this sequence.

From C, nu is Hecke (continuity and trivial on diagonal principal units survive the quotient). Its exponent at w is m(w)=B.malpha(w)-B.mbeta(w), by multiplying archimedean character powers and the nonzero phase base. The inverse character is also Hecke with exponent -m, by continuity of inversion, triviality on principal units, and reciprocal of the finite product of integer powers. All characters remain circle-valued, not arbitrary nonunitary characters.

D1 Geo.IsGood.kappa supplies the crucial bound m(w)>d at EVERY infinite place. In particular m(w)>0 and the finite type of infinite places of a number field is nonempty; hence the nonzero exponent premise. D1 Base.IsGood.cm supplies the CM extension, with E totally complex. B isCMType_emb verifies that choosing the B.emb(w) over each real place of F enumerates exactly one embedding up to conjugation: restriction to F identifies the place and the quadratic CM extension has exactly two embeddings over it, conjugate to each other. B exists_hchar_unitary constructs H via the inverse tensor-adele equivalence followed by chi and Circle.toUnits, verifies continuity, principal-unit triviality and matching local values, and transfers infinity exponents. It is not enough merely to assert that chi extends to some global HChar without preserving local factors. For chi=nu or nu^(-1), the resulting n(w)=+m(w) or -m(w) and |n(w)|=m(w)>d.

Now for ANY integer z with -d<=2z, for EVERY w,
  2z+|n(w)| >= -d+m(w)>0.
This is precisely the strict Gamma guard in B heckeL_ne_zero, including z=0 and negative integers. Thus assuming hFE we obtain entire L with all those integer values nonzero. B eq_charL transfers the right-half-plane identity from the HChar L-function to the target charL with empty exclusion set: local character equality gives unramified equivalence and equality of uniformizer values, hence identical factor families; uniqueness of convergent products gives equality. Apply the argument separately to the two choices chi; the result has the full quantifier pattern of LInt2. No new geometric or arithmetic inequality is required. The remaining source-specific gap is locating lInt2's actual proof and hFE producer and confirming no hidden additional hypotheses.

The strict inequality is mathematically essential to this argument: for even d and m=d, take z=-d/2; the argument of Gamma becomes zero. Equality of the weight bound cannot justify gamma cancellation. This is a negative control for the GUARD, not a counterexample to the original admissible theorem. In run 2, the shifted doubling arguments z=d/2-i satisfy -d<=2z by n<d, so section 4 supplies exactly the nonvanishing needed there conditional on hFE. Thus we have a local explanation of why geometry keeps the negative-integer factors away from trivial zeros. No implication for arbitrary Hecke or Dirichlet L-functions at negative integers.

## 5. Executed evidence and replay
In tool V8, refetched 9 immutable blobs, matched connector-reported Git blob SHA and 37 exact source substring anchors. Executed 408000 nonnegative-right integer cases (z>=1), 106080 reflected cases (z<=0), 51 strict-bound negative controls for both signs of the exponent. These are exact bounded integer checks, not an analytic proof or Lean run. General inequalities above establish the unbounded guard; no numerical tests can validate the analytic functional equation. Source checks preserved original hypotheses; conditional adapter explicitly retains hFE. No Lean executable in local environment. No exact kernel edge exported. Replay against pinned checkout:
```python
from pathlib import Path
import hashlib
T="src/Development/WeilBound/ThetaLifts/"
D="src/Development/AbelianVarietyTheory/"
rows=[
(T+"SphericalLattices/SphericalClosure/CloseSph.lean","9a15ec479fb007975f15b6df7fe5fe46615e4f8f",[(102,"GlobalTheory.ThK.Dbl.LInt2 := GlobalTheory.ThK.Dbl.lInt2"),(126,"nonZeroBottom_of_doubling_integral h_GlobalTheory_ThK_KReal h_GlobalTheory_ThK_Dbl_LInt2")]),
(T+"LatticeBasics/ExistsIsHeckeLOfCompleted.lean","a9870cbfacc6ffa1c17c95759232ef2ffff16239",[(17,"theorem exists_hchar_unitary"),(74,"theorem isCMType_emb"),(105,"theorem exists_isHeckeL_of_completed"),(129,"theorem shift_ne"),(134,"theorem heckeL_ne_zero (hFE"),(147,"hL.ne_zero_nat hu"),(149,"hL'.ne_zero_nat hu'"),(158,"rw [fe, show 1 -"),(160,"exact right_ne_zero_of_mul (right_ne_zero_of_mul hΛ')"),(162,"theorem eq_charL"),(175,"def LInt2 : Prop")]),
(T+"LatticeBasics/GoodNe.lean","db5a77ed007a052eb89fe1419815d2f2d25588f4",[(20,"theorem isHecke_nu"),(24,"theorem hasExp_nu"),(24,"B.mα w - B.mβ w"),(30,"zpow_sub₀")]),
(D+"BlockTheory/DivisorBase/WeilTensorModels.lean","4d0d94fd3fd9368e5428c05402979d6dd5123b4d",[(342,"def Chars.ν (X : Chars F E) : Chr F E := X.α / X.β"),(363,"kappa : ∀ w, ((a + a' : ℕ) : ℤ) < B.mα w - B.mβ w"),(362,"even : Even (a + a')"),(388,"structure IsTriple")]),
(D+"BlockTheory/DivisorBase/CompletedLStripBounds.lean","1bdbf18d79ab19073e0c72867a8a2e75b66c3269",[(12,"def archFactor"),(15,"def IsCompletedL"),(16,"Differentiable ℂ Λ ∧ ∀ s : ℂ, 1 < s.re")]),
(D+"PublishedTheorems/Divisors₂/HeckeTateFunctionalEquationCM.lean","a5ffc620467a060d7b31be9eaf198dedb081d180",[(205,"theorem completed_eq_mul"),(223,"entire_eq_of_halfPlane"),(244,"def HeckeTateFunctionalEquation : Prop"),(249,"Λ s = archEps n * finEps χ a s * Λ' (1 - s)")]),
(D+"Proofs/DivisorProofs/HeckeLNeZeroNat.lean","998eeb6c8239496943757f7e742548dd94e39361",[(10,"theorem IsHeckeL.ne_zero_nat"),(12,"rcases hs.eq_or_lt"),(13,"dedekindZeta_eulerProduct_mul_sub_one_entire"),(15,"eulerProduct_ne_zero_one_of_entire"),(21,"Complex.exp_ne_zero")]),
(D+"PublishedTheorems/Divisors₂/IsCMTypeEmbedding.lean","f903a88f78de55eb9654f028c747fa01cbf96cbf",[(15,"theorem exists_exponents"),(25,"theorem hasInf_inv"),(30,"theorem isUnitary_inv")]),
(D+"Proofs/AdelicLatticeProofs/EulerProductNeZeroOneOfEntire.lean","959b1b46ae3f86d2ed5010941ca5012452d9607a",[(95,"theorem _root_.GlobalTheory.eulerProduct_ne_zero_one_of_entire")])
]
count=0
for path,sha,anchors in rows:
    b=Path(path).read_bytes()
    assert hashlib.sha1(b"blob "+str(len(b)).encode()+b"\0"+b).hexdigest()==sha,path
    lines=b.decode().split("\n")
    for i,s in anchors:
        assert s in lines[i-1],(path,i,s)
        count+=1
assert count==37
positive=reflected=controls=0
for d in range(0,101,2):
    for m in range(d+1,d+41):
        for z in range(-d//2,101):
            for e in (m,-m):
                assert 2*z+abs(e)>0
                if z>=1: positive+=1
                else:
                    assert 1-z>=1 and 2*(1-z)+abs(-e)>0
                    reflected+=1
    assert 2*(-d//2)+abs(d)==0
    controls+=1
assert (positive,reflected,controls)==(408000,106080,51)
print("source anchors",count,"integer guards",positive,reflected,"negative controls",controls)
```

This Python replay is supplied, not executed against a local checkout; actual tool checks used pinned connector text and blob IDs plus V8 integer loops.

RESUME HERE: ask dependency/acceleration lane for actual pinned source declaration index or use git grep -n -E 'theorem lInt2|def lInt2|lemma lInt2|theorem GlobalTheory\.ThK\.Dbl\.lInt2|HeckeTateFunctionalEquation_holds' PIN -- src (GitHub indexed searches failed). Obtain exact definition file and actual hFE supplier, verify the adapter above against its body and prove the matching exponent inverse step. Separately trace the line-one regularization producer G→I with literature lane, then resume base scalar polZero_of; do not redo Gamma guard or induction. If source not yet accessible via index, proceed with polZero_of while retaining lInt2 producer OPEN.
HANDOFF TO: proof editor, integration, formal audit, literature, Landau and dependency lanes. Use integer-only nonvanishing chapter conditionally; do not report exact lInt2 proof extracted or Tate functional equation validated. No physical queue or gates changed.
