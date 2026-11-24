# Human-readable local correspondence: guarded map, separator and exponent
2026-11-24. Source-matched conditional reconstruction, continuation of integration/2026-11-24_0900_RECT_FIELD_PROOF_GRAPH.json. Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005. No new proof assumptions or physics. The entire RH reconstruction remains incomplete. This chapter is a substantive human mathematical derivation, not an exporter benchmark.

## Source ledger
- GoodMap: src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/GoodMap.lean (blob 1223776d8052ec8c0e7fba84b94780fda55a60f2)
- JunkEx: src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/JunkEx.lean (blob f3c62285ff5d609ea0032c5f0be843451a897570)
- Expo: src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/ExponentMulAbsPow.lean (blob 0ef94a48be4acf09edadefd011f3110fa43caefe)
- NonTame: src/Development/AutomorphicArithmetic/WhittakerHecke/TameInertiaCharacterFrobeniusConjEqPow.lean (blob aa1a06aca447102686d4276eecc8273ef576ed4c)
- CuspEx: src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/CuspEx.lean (blob 3c2550dd844817d87bf5eacae0fb1498df8603b0)
Exact types: Foundations/LocalLanglands/RecTTransport.lean, GoodMap, JunkEx, Expo, CuspT. Preserve all ambient number field, algebraic closure, place, local Artin, and smoothness assumptions.

## 1. Shared algebra: the character action
Write k for the completion, a for the local Artin map, T_chi x for x.tw chi, and S_chi V for V.lpTwist(chi comp a). All characters are smooth and unit-valued. Source clBasic/wDBasic give
T_psi T_chi x=T_(chi psi)x, T_1 x=x;
S_psi S_chi V=S_(chi psi)V, S_1 V=V.
In particular inverse twisting cancels. These identities are proved in GoodMap.tw_tw_inv', eq_tw_of_tw_eq, lpTwist_lpTwist' and reused in CuspEx.twist_twist. Define psi=chi*chi'^{-1}. If T_chi y=T_chi' y', then y'=T_psi y. This is a single group-action lemma; both domains must be retained, with smoothness and correct Artin pullback. Do not identify the two representations.

## 2. The good map is well-defined
Fix all ambient data and ha. GoodCusp is the source's rank-one or depth-zero-twist predicate (the latter includes a continuous p-adic field isomorphism). Define R(x,V) by either (i) x is rank-one chi and V is the Weil-Deligne character chi comp a, or (ii) there exist the stipulated p-adic isomorphism, cuspidal depth-zero y, parameter W with Par(a,y,W), smooth chi, x=T_chi y and V=S_chi W. No general depth-zero assumption on x.

For a good cuspidal x, existence follows by the rank-one construction or by invariance of cuspidality under twist followed by parEx on y. Uniqueness has four cases:
- two rank-one presentations: parOne character injectivity identifies chi;
- two depth-zero presentations: if x=T_chi y=T_chi' y', then y'=T_(chi/chi') y. Since both y and y' are depth-zero and y has positive rank, twTame implies chi/chi' is tame. parTw transports Par to (y', S_(chi/chi') W); parUniq identifies that parameter with W'. Twist by chi' and use the shared action to conclude S_chi W=S_chi' W';
- rank-one vs depth-zero: if x=ofChar(psi)=T_chi y, inverse twist identifies y=ofChar(psi/chi). The source parOne depth-zero iff tame gives tameness of psi/chi. Its rank-one parameter is Par, hence equals W by parUniq; twist by chi to obtain the original rank-one parameter;
- reverse mixed case follows by symmetry.
The relation is equivariant under every smooth further twist: in either case multiply the stored character by the new one, using parOne or the two group actions. Define r0(x)=epsilon V.R(x,V), using a nonempty WD type. For every existing R witness it equals that witness by uniqueness. This constructs the three GoodMap fields: rank-one agreement, equivariance on good cuspidal inputs, and Par for cuspidal depth-zero inputs over the indicated p-adic isomorphism (choose the trivial twist of the parEx witness). No claim epsilon selects a valid parameter for arbitrary bad input. This is the full local composition in GoodMap.lean, conditional on the cited substantive parEx/parUniq/parTw/parOne/twTame and basic laws.

## 3. Frobenius algebra produces the bad-branch separator
For n>=2 put q=normV(w)>1. JunkEx.exists_frobAut: given finite field K of cardinal q^n, characteristic p, q divides p^k=|K|, hence q=p^j. The q-power map f is an automorphism (iterate Frobenius, finite injective implies bijective). f^n=id because z^{q^n}=z. If 0<m<n and f^m=id, a generator b of K^* would satisfy b^{q^m-1}=1, so q^n-1 divides q^m-1, impossible. Thus order(f)=n.

JunkEx.junkData constructs K and a surjective homomorphism pi from inertia to the ADDITIVE group of K (Lean Multiplicative K), with open kernel and pi(Frob t Frob^{-1})=f(pi(t)). Exact construction: choose c in w but not w^2; extend the number field to L with a place u of residue degree n, inertia fixing L and c remaining a uniformizer. Frobenius restricts to a place-preserving automorphism of L and extends continuously to its completion. Use its residue field K, the valuation subring O, residue rho and the unit-residue logarithm l from exists_unit_residue_logarithm_of_roots_of_unity. Map inertia into the inertia over L by restriction/extension (the source proves this map is surjective); apply local Artin a_L and l to define pi. The logarithm is additive on the unit-value subgroup and surjective there; Artin maps inertia onto this subgroup. Its kernel contains the open preimage of the ball (b-1)/c^2 in O, since such b are closer to one than the uniformizer scale; continuity gives openness. Integral approximation in the completion shows rho(i z)=f(rho(z)); the uniformizer is fixed by i because c is from E. Artin transport and the residue-log equivariance prove the conjugation identity. Retain the field extension theorem, local reciprocity, residue-log existence, approximation and transport as upstream obligations, not established by the Frobenius arithmetic.

Now choose additive character psi of K whose automorphism stabilizer in <f> is trivial (exists_addChar_invariant_iff_finiteField_aut_eq_one). Set eta_j=psi o f^j o pi for integer j. Direct substitution yields eta_j(Frob t Frob^{-1})=eta_(j+1)(t). Surjectivity of pi and invertibility of f imply eta_j=eta_k iff f^(j-k)=1 iff n divides j-k. Each eta value has |K|-th power one; eta_0 kernel is open since it contains pi kernel. Apply indEx with Frobenius degree one, determinant parameter 1, orbit length n, obtaining irreducible J of dimension n whose inertia characteristic polynomial is product_{j=0}^{n-1}(X-eta_j(t)). The determinant at Frobenius is 1; on inertia the determinant is the product of eta values, hence a root of unity. Every Weil element is Frobenius to an integer power times inertia, so |det J(sigma)|=1.

Separation from every twist of a tame V: suppose eta_0 and eta_1 agree on wild inertia. Let chi=eta_0/eta_1. The source isWild_frob implies chi(Frob t Frob^{-1})=chi(t)^q (apply chi to Frob t Frob^{-1} t^{-q}, which is wild). Iterate n times. Because chi factors through pi and f^n=1, chi(t)=chi(t)^{q^n}=1. This gives eta_0=eta_1, contradicting n>=2 and the exact orbit law. Hence there is a wild t with eta_0(t) != eta_1(t). Any tame V is trivial on wild inertia, so after a scalar character twist its inertia characteristic polynomial at this t has only one root. Equality to J would force eta_0(t)=eta_1(t) (evaluate the polynomials at each root). Impossible. This is stronger than the conditional separation demanded by JunkEx. The source theorem invokes the exact induction existence and wild-inertia laws; no assumption of the ordinary tame local correspondence for arbitrary bad x.

## 4. Central-character exponent, shared with the separator
For each x choose its unique smooth central character omega_x using clBasic. Let d=rank(x)>0 and beta(omega) be the quasi-character exponent, so |omega(z)|=|z|^beta(omega). Define e(x)=beta(omega_x)/d. The twist x.nu(s) has the same rank and central character omega_x * absPow(s)^d. At a uniformizer, the logarithm of its modulus is -log q (q>1), so beta of that character is beta(omega_x)+ds. Hence e(x.nu(s))=e(x)+s. If J has dimension d and determinant modulus one, the twist J.lpTw(e(x)) has determinant modulus |a(sigma)|^(d e(x))=|omega_x(a(sigma))|. This proves both Expo fields. It does not prove complex determinant equality on the bad branch; division by d requires positive rank.

## 5. Assemble and prove the guarded cusp map
Define r(x)=r0(x) for GoodCusp(x) and J_rank(x).lpTw(e(x)) otherwise. For a bad cuspidal x, rank is positive and not one, hence >=2, so J is available. The eleven CuspT fields follow:
1–2 irreducibility and rank: for good rank-one use parOne; good twisted depth-zero use Par and twist invariance; bad use J and twist invariance.
3 rank-one agreement: rank-one is good.
4 real twists: GoodCusp is invariant under twist; good uses GoodMap and identification of absPow pullback; bad uses rank invariance, e(x.nu(s))=e(x)+s and lpTw_add.
5 absolute central law: good complex central law implies modulus; bad uses Expo and determinant normalization.
6–7 good twist and complex central law: equivariance; for depth-zero parameter the central character under twist is omega*chi^rank, while the determinant multiplies by the pullback of chi to the same power; rank-one from parOne and uniqueness of central character.
8 dual on good x: rank-one inverse character; depth-zero dual remains depth-zero and cuspidal, parDual and parUniq identify its parameter, and dual reverses a character twist. GoodCusp is preserved under dual.
9 injectivity with GOOD TARGET y: equality of parameters gives equal ranks. If x and y are good of rank one, equality of rank-one parameter evaluations and surjectivity of a identify their characters. For two higher-rank good inputs, x=T_chi u,y=T_chi' v, undo S_chi; r0(u)=S_(chi'/chi) r0(v). The two depth-zero parameters are tame and positive rank; wDBasic and tameArt imply chi'/chi is tame. Then parTw and the second (input-uniqueness) field of parUniq identify u=T_(chi'/chi)v; retwist to obtain x=y. For bad x and good y, rank equality excludes rank one; express y=T_chi v with the stipulated p-adic isomorphism and depth-zero v. Undo the real twist e(x) in equality, giving J_rank(x)=S_(chi * absPow(-e(x))) r0(v). But r0(v) is tame by Par, contradicting JunkEx. This is exactly the guarded cross-branch exclusion; no injectivity claim between two bad inputs.
10 good depth-zero implies tame: rank-one uses parOne; other good inputs provide the isomorphism needed to apply Par directly to x when DZ x.
11 TypeAt: for the inflated finite-field type, the native DzType.lDepth theorem gives depth-zero, and the continuous isomorphism provides GoodCusp via the trivial twist. Then the Par.type field gives the required type relation with all original parameters unchanged.
Thus CuspEx holds conditional on the named leaves. RecTExists uses this map and extends by segment sums; the 12-field assembly already exists in the preceding integration graph. Keep the guards distinct from an assertion of full LLC on bad objects.

## 6. Executed actual source algebra read
Re-fetched all five pinned blobs and checked 29 anchors. The selected mathematical argument graph, not a kernel DAG, was read once per node using URT q=(pi/e) exp(2pi i/phi^2) and bounded recurrence R=(1+q sum parents)/(1+|q| arity). The exact graph was retained; neither score nor reuse count is a proof premise. The shared character action supports GoodMap, Expo, and cusp injectivity without repeating the algebra.
```json
{
  "certificate": {
    "sourceFiles": 5,
    "anchors": 29,
    "sharedNodes": 26,
    "edges": 43,
    "rootScore": [
      0.07093824325476251,
      -0.10303904906976172
    ],
    "reuse": [
      [
        "twist-group",
        6
      ],
      [
        "par-uniqueness",
        2
      ],
      [
        "rank-one",
        4
      ],
      [
        "tame-transfer",
        2
      ],
      [
        "goodMap",
        4
      ],
      [
        "Frobenius-order",
        2
      ],
      [
        "eta-orbit",
        2
      ],
      [
        "JunkEx",
        2
      ],
      [
        "central-character",
        2
      ],
      [
        "Expo",
        2
      ]
    ],
    "status": "source-matched chapter graph, not kernel dependency closure"
  },
  "graph": [
    [
      "twist-group",
      []
    ],
    [
      "par-existence",
      []
    ],
    [
      "par-uniqueness",
      []
    ],
    [
      "rank-one",
      []
    ],
    [
      "tame-transfer",
      []
    ],
    [
      "good-rel-exists",
      [
        "par-existence",
        "rank-one"
      ]
    ],
    [
      "good-rel-unique",
      [
        "twist-group",
        "par-uniqueness",
        "rank-one",
        "tame-transfer"
      ]
    ],
    [
      "good-rel-equivariant",
      [
        "twist-group",
        "rank-one"
      ]
    ],
    [
      "goodMap",
      [
        "good-rel-exists",
        "good-rel-unique",
        "good-rel-equivariant"
      ]
    ],
    [
      "field-extension",
      []
    ],
    [
      "residue-log",
      []
    ],
    [
      "Artin-transport",
      []
    ],
    [
      "Frobenius-order",
      []
    ],
    [
      "junkData",
      [
        "field-extension",
        "residue-log",
        "Artin-transport",
        "Frobenius-order"
      ]
    ],
    [
      "additive-character",
      []
    ],
    [
      "eta-orbit",
      [
        "additive-character",
        "Frobenius-order"
      ]
    ],
    [
      "wild-contradiction",
      [
        "eta-orbit"
      ]
    ],
    [
      "induction",
      []
    ],
    [
      "JunkEx",
      [
        "junkData",
        "eta-orbit",
        "wild-contradiction",
        "induction"
      ]
    ],
    [
      "central-character",
      []
    ],
    [
      "exponent-shift",
      [
        "central-character",
        "twist-group"
      ]
    ],
    [
      "Expo",
      [
        "exponent-shift",
        "central-character"
      ]
    ],
    [
      "good-basic",
      [
        "goodMap",
        "rank-one",
        "twist-group"
      ]
    ],
    [
      "good-injection",
      [
        "goodMap",
        "par-uniqueness",
        "tame-transfer",
        "twist-group"
      ]
    ],
    [
      "cross-separation",
      [
        "JunkEx",
        "goodMap",
        "twist-group",
        "Expo"
      ]
    ],
    [
      "CuspEx",
      [
        "goodMap",
        "JunkEx",
        "Expo",
        "good-basic",
        "good-injection",
        "cross-separation"
      ]
    ]
  ],
  "readout": [
    [
      "twist-group",
      [
        1,
        0
      ]
    ],
    [
      "par-existence",
      [
        1,
        0
      ]
    ],
    [
      "par-uniqueness",
      [
        1,
        0
      ]
    ],
    [
      "rank-one",
      [
        1,
        0
      ]
    ],
    [
      "tame-transfer",
      [
        1,
        0
      ]
    ],
    [
      "good-rel-exists",
      [
        -0.21271459900945394,
        0.4715043256940475
      ]
    ],
    [
      "good-rel-unique",
      [
        -0.42838846335978914,
        0.5553584823632224
      ]
    ],
    [
      "good-rel-equivariant",
      [
        -0.21271459900945394,
        0.4715043256940475
      ]
    ],
    [
      "goodMap",
      [
        0.1248823097268596,
        -0.43505393812003473
      ]
    ],
    [
      "field-extension",
      [
        1,
        0
      ]
    ],
    [
      "residue-log",
      [
        1,
        0
      ]
    ],
    [
      "Artin-transport",
      [
        1,
        0
      ]
    ],
    [
      "Frobenius-order",
      [
        1,
        0
      ]
    ],
    [
      "junkData",
      [
        -0.42838846335978914,
        0.5553584823632224
      ]
    ],
    [
      "additive-character",
      [
        1,
        0
      ]
    ],
    [
      "eta-orbit",
      [
        -0.21271459900945394,
        0.4715043256940475
      ]
    ],
    [
      "wild-contradiction",
      [
        0.37721820313384125,
        -0.26342725510214926
      ]
    ],
    [
      "induction",
      [
        1,
        0
      ]
    ],
    [
      "JunkEx",
      [
        -0.03971542775591072,
        -0.0135028833837112
      ]
    ],
    [
      "central-character",
      [
        1,
        0
      ]
    ],
    [
      "exponent-shift",
      [
        -0.21271459900945394,
        0.4715043256940475
      ]
    ],
    [
      "Expo",
      [
        -0.01178267120793757,
        0.06426337920889563
      ]
    ],
    [
      "good-basic",
      [
        -0.1054759102187699,
        0.4543379844099152
      ]
    ],
    [
      "good-injection",
      [
        -0.23535457858295464,
        0.49979341589934223
      ]
    ],
    [
      "cross-separation",
      [
        0.06851897619010455,
        0.20727103466803903
      ]
    ],
    [
      "CuspEx",
      [
        0.07093824325476251,
        -0.10303904906976172
      ]
    ]
  ]
}
```
No synthetic speed benchmark or kernel recheck; full export retry GitHub run 45349329680 still in_progress on inspection. Human chapter is conditional, not the full RH proof.

RESUME HERE: replace the still-open ParEx/ParUniq/ParTw substantive leaves with exact source-derived constructions, beginning with the depth-zero ParEx parameter producer and preserving the isomorphism and regular-character hypotheses. Then merge this chapter into latest editor manuscript. The full export retry must actually finish before claiming complete proof-term coverage.
HANDOFF TO: proof_editor, literature_provenance, galois_representations, integration, audit.
