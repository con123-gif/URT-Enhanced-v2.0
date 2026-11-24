# URT harmonic-scale algebra reader — native size obligations
Status: exact conditional algebra, source-matched, no change to proof premises. Original pin 40e56bab026552e089d7afcfeff08d2defb9c005; src/Formalism/SharpRestriction/ElevenLe.lean blob 75f2ab1404c69a5d1330671d96d8f6cd35e74e52. Prior native rank and normalized-size chapters supply the exact input windows.

## 1. Harmonic coordinate and linear reader
Let phi=(1+sqrt(5))/2, s=log(x)/log(phi), x=phi^s. Then c*x^(a+b*eps) = c*phi^(s*(a+b*eps)). Use the fixed rational exponent lattice (a,b)=(A,B)/400 because the native tolerances have denominator 400. Multiplication adds exponent pairs; division subtracts them only for positive denominators and appropriately directed bounds; a power scales the pair. A positive sum can be normalized by a common dominating exponent, leaving exact residuals. For a collection of terms with positive coefficients, accumulate the componentwise maximal exponent and coefficient sum in one pass. Alternatively use exact affine endpoint comparison on eps in (0,1/52). If a gap g=(A+B eps)/400 has nonnegative values at both endpoints and is not identically zero, then g>0 in the interior. At fixed eps any fixed coefficient can eventually be absorbed by x^g. This proof uses monotonicity, not floating harmonic phase as evidence. Negative/cancelling sums and unknown signs need separate verified rules. URT phi scaling is a coordinate choice; it does not supply new arithmetic premises or prove acceleration beyond standard log/tropical algebra. Fixed-dimensional exponent comparisons and graph traversals O(V+E) operations, plus big-integer bit cost and exact coefficient arithmetic. Human prose translation is not thereby guaranteed linear.

## 2. Actual native proof algebra
With tau=eps/100, delta1=x^(-eps/8), L=x^eps, n,m,k satisfy previous native windows, f=2n, r=k+m-1. SizeLa provides LaG<=x^(eps+tau). From the true source SizeKRel's 14 conjuncts, the following follow eventually from these simpler bounds (at fixed eps and family constants):
1. x^tau m^5 f L x^eps <= 2*x^(9/2+3903eps/400) <= k, since k>=x^(9/2+3996eps/400), gap 93eps/400.
2. 8 CGam m^5 f L <= k by gap 497eps/400 and absorption of 16 max(CGam,0), provided CGam is fixed/bounded uniformly in the family; negative case trivial. This is an explicitly conditional statement, not a proof of that uniformity.
5. m^2 L <= x^(1+358eps/400) <= k.
6. m sqrt(x) log x <= x^(1+379eps/400) <= k using eventual log x<=x^eps.
7. x^tau m^6 L <= x^(3+278eps/400) <= k log k, since log k>=1.
8. Under SizeQD and QS<=C n with fixed C>=1, log rdE<=log(Cn)+x^(21eps/100)<=2x^eps eventually. Then x^tau m^3 L log rdE<=2*x^(3/2+741eps/400) <= k(log k)^2. The QS bound must come from HostConst, not silently assumed for arbitrary FamP.
10. log f<=4 log x for x>=2 and eps<1/52, while m^2 L>=x^(1+342eps/400)>=x. Since 16(log x)^2<=x eventually, (log f)^2<=m^2 L.
11. log log b=eps log x (b=exp(x^eps)); x^tau L log log b<=x^(804eps/400)<=n<=r f log r for sufficiently large x. This preserves the logarithm instead of setting it to a constant.
12. x^tau L<=x^(404eps/400)<=n<=f log k eventually.
13. f=2n<=m^2 n because m>=2.
14. f<=r^2 because the native Ranks conditions give f<=k, r>=k, f>=1.
The remaining SizeKRel conjuncts 3,4,9 need the rankBudget and rS definitions/estimates, and must be kept OPEN. The above eleven implications are conditional on native size, host and uniformity premises. No independent claim of family existence.

## 3. A separate size condition is automatic
SizeRho requires
 4*szNst*x^eps*LaG/k + x^tau*log(x)*LaG/k <= x^(-2),
where szNst=2n delta1.
First term <=8*x^(-5/2-38eps/400).
Second term <=x^(-9/2-3188eps/400), using log(x)<=x^eps.
Thus the sum <=9*x^(-5/2)<=x^(-2) for x>=81 and the eventual log condition. This gives the actual source SizeRho from native SizeN,K,La and scale identities. It is not an additional numerical assumption.

## 4. Exact residual of the normalized error envelope
Earlier upper terms after division by Q are 2*x^(1/2+29eps/400), 2, 4*x^(1/2+429eps/400), 2*x^(1/2-1538eps/400). Set z=x^(-eps/400)=phi^(-s*eps/400). Factor the common scale:
 B/Q <= x^(1/2+429eps/400) * [4+2*z^400+2*x^(-1/2)*z^429+2*z^1967].
All residuals are positive and bounded by 1 before their coefficients. Hence the bracket <=10, giving the original budget; no subordinate term discarded. The normalized residual exposes which terms control the estimate and which can be made small. This is exact harmonic factoring of an upper bound, not equality with original B/Q.

## Executed certificate
{
  "lattice": 400,
  "checks": [
    {
      "id": "SizeKRel.1",
      "left": [
        1800,
        3903
      ],
      "right": [
        1800,
        3996
      ],
      "gap": [
        0,
        93
      ],
      "coeff": "2",
      "assumption": "f=2n"
    },
    {
      "id": "SizeKRel.2",
      "left": [
        1800,
        3499
      ],
      "right": [
        1800,
        3996
      ],
      "gap": [
        0,
        497
      ],
      "coeff": "16*max(CGam,0)",
      "assumption": "CGam fixed/bounded for given family; negative case immediate"
    },
    {
      "id": "SizeKRel.5",
      "left": [
        400,
        358
      ],
      "right": [
        1800,
        3996
      ],
      "gap": [
        1400,
        3638
      ],
      "coeff": "1",
      "assumption": "positive ranks"
    },
    {
      "id": "SizeKRel.6",
      "left": [
        400,
        379
      ],
      "right": [
        1800,
        3996
      ],
      "gap": [
        1400,
        3617
      ],
      "coeff": "1",
      "assumption": "log x<=x^eps eventually"
    },
    {
      "id": "SizeKRel.7",
      "left": [
        1200,
        278
      ],
      "right": [
        1800,
        3996
      ],
      "gap": [
        600,
        3718
      ],
      "coeff": "1",
      "assumption": "log k>=1"
    },
    {
      "id": "SizeKRel.8",
      "left": [
        600,
        741
      ],
      "right": [
        1800,
        3996
      ],
      "gap": [
        1200,
        3255
      ],
      "coeff": "2",
      "assumption": "SizeQD, QS<=fixed C*n; log rdE<=2*x^eps eventually; log k>=1"
    },
    {
      "id": "SizeKRel.11",
      "left": [
        0,
        804
      ],
      "right": [
        800,
        3196
      ],
      "gap": [
        800,
        2392
      ],
      "coeff": "1",
      "assumption": "b=exp(x^eps), eps log x<=x^eps eventually, r>=1 and log r>=1, f>=n"
    },
    {
      "id": "SizeKRel.12",
      "left": [
        0,
        404
      ],
      "right": [
        800,
        3196
      ],
      "gap": [
        800,
        2792
      ],
      "coeff": "1",
      "assumption": "f>=n, log k>=1"
    }
  ],
  "rho": {
    "terms": [
      {
        "c": 8,
        "e": [
          -1000,
          -38
        ]
      },
      {
        "c": 1,
        "e": [
          -1800,
          -3188
        ]
      }
    ],
    "envelope": {
      "c": 9,
      "e": [
        -1000,
        -38
      ]
    },
    "absorption": "x>=81 implies 9*x^(-5/2)<=x^(-2)"
  },
  "normalized": {
    "terms": [
      {
        "c": 2,
        "e": [
          200,
          29
        ]
      },
      {
        "c": 2,
        "e": [
          0,
          0
        ]
      },
      {
        "c": 4,
        "e": [
          200,
          429
        ]
      },
      {
        "c": 2,
        "e": [
          200,
          -1538
        ]
      }
    ],
    "peak": [
      200,
      429
    ],
    "residual": [
      {
        "c": 2,
        "e": [
          0,
          -400
        ]
      },
      {
        "c": 2,
        "e": [
          -200,
          -429
        ]
      },
      {
        "c": 4,
        "e": [
          0,
          0
        ]
      },
      {
        "c": 2,
        "e": [
          0,
          -1967
        ]
      }
    ]
  },
  "negativeControls": 4,
  "exactGridReplays": 10448
}
The grid replay tests affine margins, not native families. Analytic endpoint argument proves all margins for the entire eps interval. No numerical golden-ratio evaluation is needed.

RESUME HERE: use this conditional implication list in the manuscript and reduce the remaining native SizeKRel obligations 3,4,9 to exact rankBudget/rS. Then propagate through the other SizesAt fields and audit uniformity. Prioritize actual proof joins. Do not claim URT-specific speed improvement until measured against a conventional optimized algebra reader.
