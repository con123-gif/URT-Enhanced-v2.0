# Native rank envelope and exact square-root budget
Status: SOURCE-MATCHED conditional arithmetic reconstruction, executed exact integer exponent comparisons. Native family existence and remaining geometric inputs OPEN. Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005.

## Original definitions and reduction
src/Formalism/SharpRestriction/ElevenLe.lean (75f2ab1404c69a5d1330671d96d8f6cd35e74e52): szTh=eps/100, SizeN, SizeM, SizeK, SizesAt. Let x>1, 0<eps<1/52. With delta1=x^(-eps/8), expand the native scale windows:
 n in [x^(2+799eps/100), x^(2+801eps/100)]
 m in [x^(1/2-29eps/400), x^(1/2-21eps/400)]
 k in [x^(9/2+999eps/100), x^(9/2+1001eps/100)].
These are mathematical conditions on the actual chosen host, not a probabilistic cancellation heuristic. SizeM contains the square root explicitly. They imply the downstream rank premises m>=x^(1/2-eps), m<=x^(1/2+eps/2), xm<=k and k<=n^2*x^(1/2-eps). Proof: compare exponents; k/(n^2)<=x^(1/2-597eps/100), much stronger than the last required bound. All inequalities use x>1, eps>0.

## Thick-set and row density are separate
src/Formalism/SharpRestriction/GlobalSchurBounds/Chosen.lean (9a85f26989d2381da29a40abfe7bd339d20815d8): ChTT_at gives n*delta1/2<=|TT|<=2*n*delta1. SizeTT alone has a weaker lower bound n*x^(-eps/100)*delta1, so do NOT silently replace ChosenTT by SizeTT.
src/Formalism/SharpRestriction/GlobalSchurBounds/LossesSmallShares.lean (70624b10f53b29e43deb89bd9dae257403ecb61e): size_windows_of_thick_density takes ThickSetDensityEventually, selects eK=5, common eventual threshold for XL using ev_pow_le_exp and ev_two_le_rpow, then uses Fm.sizes and Fm.params at each host, numN_at, winE, winP, and size_window_at_five. In linkCore, hW0 is Win_at at i0, w13 and w14 directly provide m lower and k upper; w15 gives T2 density; ChosenTT supplies TT lower bound. Native n matches model H by hcardH and native top/thick counts by card_TT and M.card_thick_set_model_eq. S1 is exactly RestSize. This pins down the route into the final size budget, without assuming these chosen-density properties arise automatically from ranks.

## Optional tighter algebraic envelope
Use the same normalized terms as math/2026-11-24_normalized_size_budget.md, with the additional native size bounds and same chosen densities, nT2<=n, aE<=2xb, delta=nT2/n>=x^(-eps). Then
 B1/Q <= 2*x^(1/2+29eps/400)
 B2/Q <= 2
 B3/Q <= 4*x^(1/2+429eps/400)
 B4/Q <= 2*x^(1/2-1538eps/400)
because the last exponent correction is 17/8 - 597/100 = -1538/400. Thus B/Q<=10*x^(1/2+429eps/400). The same positive normalization and 26 absorption yield Gx<=x^(1/2+(C+979/400)*eps), which implies the original C+3 bound. This is an explanatory strengthening conditional on the native envelope and exact same downstream normalization, not a claimed change to the original theorem or a shortcut around geometry. No new parameters. Keep original constants in integrated manuscript unless independently audited.

## Exact certificate
All comparisons of affine exponents are integer comparisons in units 1/400, and coefficients are positive. Executed 5 comparisons and exact max/add operations in V8:
{
  "checks": [
    {
      "label": "m lower",
      "margin": [
        0,
        371
      ]
    },
    {
      "label": "m upper",
      "margin": [
        0,
        221
      ]
    },
    {
      "label": "k>=xm",
      "margin": [
        1200,
        4017
      ]
    },
    {
      "label": "k<=n^2*x^(1/2-eps)",
      "margin": [
        0,
        1988
      ]
    },
    {
      "label": "original exponent sufficient",
      "margin": [
        0,
        221
      ]
    }
  ],
  "terms": [
    [
      200,
      29
    ],
    [
      0,
      0
    ],
    [
      200,
      429
    ],
    [
      200,
      -1538
    ]
  ],
  "max": [
    200,
    429
  ],
  "afterDensity": [
    200,
    829
  ],
  "final": [
    200,
    979
  ]
}
The algebra gives a direct reusable explanation of the four required rank inequalities, avoiding repeated tactic-level replay.

RESUME HERE: mathematical critical path is now construction of Fm.sizes (SizesAt), ChosenTT, ThickSetDensityEventually and the remaining Win_at conditions, not the analytic square-root error estimate. Find native size family existence (FamP construction, admissible host design), preserve actual chosen density and all 24 SizesAt fields. Follow size_window_at_five if needed for exact Win_at budget. Existing editor should integrate this chapter with seven-input adapter and cohomology algebra, not redo them. No complete proof claim.
