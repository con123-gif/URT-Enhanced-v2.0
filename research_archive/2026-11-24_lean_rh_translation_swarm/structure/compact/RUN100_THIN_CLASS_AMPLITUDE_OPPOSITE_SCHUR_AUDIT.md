# RUN100 — Opposite Schur weights and the thin class-amplitude bound (B2)
28 November 2026. PARTIAL / independent human source audit, not fresh Lean replay.
Resume RUN99 (580ced4f23b667a8592b75daf47fe05b2ecacfeb), equation (99.5).
Preferred existing derivation: integration/2026-11-26_COMPACT_THIN_CLASS_VOLUME_KERNEL.md,
blob 06f07be1986616e2068cfa1bdb5641e075da450b, V12–V13. This is an
audit and a single uniform normalization, not a new root theorem.

Preflight: mission 3adc76221a978016e3505cdf3e36ad688354d7d7, spine
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, ledger
579ecc1cafdb28eae7d1c97565700c571dfa7484, manuscript
619ae01be98c32e053eef1c8bcd44ccddd0664e7 (thin-class paragraphs),
SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS and
relevant physical state/log/protocol excerpts consulted. Binding URT
allocation amendment 99cfbd1f04c3a4c6d02c21a8fde207f2121aef20 read
at exact revision. RUN100 commit search returned no entries.
Physical CI 46113603893 is not RH replay evidence.

## 1. Native anchors and premises

Alpöge–Sernau and collaborators: lsernau/grh-lean@
72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
- New/Filling/ThinClasses.lean 6ae40a38e407331b9954067c833c34a62277b2e5:
  tsum_schurIntegral_le 48–51, tsum_amplitudeAbs_class_le 131–149.
- New/Filling/SchurTest.lean bcb1fd28783bdeb4d0e3c7d83559d0ef99cecdea:
  classSize 65–67; boxCutoff 103, schurWeight 107–108,
  schurIntegral 114–115, cut support 121–123, amplitudeAbs_sq_le 131–140.
- New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727:
  size hypotheses 42–58, termPosition 233, termsOver 237, besselKernel
  263–264, columnDim 268, mainEnergy 276, besselEnergy 289,
  tailScale 292, admissibility N_le / energy and cardinal bounds 307–313,
  classCutoff 356–357, amplitudeAbs 366–367.
- New/Filling/BoxPartition.lean 53f11966247a892d94cf688e8b366e887a92f641:
  xRowsIndex 341–342, minorNorm 361–362, classGauge 366–367,
  HasLevel.minorNorm_pos 401–402, HasLevel.inv 404–405.
- New/Filling/CrudeBoundDefs.lean 0ba0d2532b14c414b9032466b79e10d4d60c3d18:
  countWeight 85–86, termDiscNorm 102.
- New/Filling/NearTerms.lean bd8a969f8d1bda48ca0468c28a8a62bc78e280ce:
  tailScale_pow_four 285–286, of_size_bounds 288–293.
- New/Filling/BlockBound.lean 6c68e80e3b1ea2b7983696716305493a37f2b1fd:
  actual consumer enorm_amplitudeSum_le_classSize 368–394, thin invocation 386.

Same admissible S, StablyUnram E, CMType E, same term hk over (c,s,c')
and hlevel : HasLevel j gamma; Side.cut. Let h=varrho, n=h+1,
0<=j<=n, m=min(h,j), k=shape.k, f=numInfPlaces E,
tau=b^(kf/4)>=2, nu=unipCovolume>0, d_B=card BesselCoord,
C=card Classes, R=card(reducedImage besselS), E1=besselEnergy=R C d_B,
M=countWeight(0)=R C/N^(kf).
C>0 from the actual c, R>0 from of_size_bounds, N,g,b>0.
Write D=minorNorm(j,gamma)>0, I+=xRowsIndex(j,termPosition c c' gamma),
I-=xRowsIndex(j,(termPosition c c' gamma)^-1). Both are positive
by the existing level/index supplier used in ThinClasses 69 and its
inverse-level instance. In particular the infinite-index sentinel zero
is not present here. Keep the actual thin premise termDiscNorm<=N^f D.
Then x=classGauge=N^f D/(I+ I-)>0. All quantities refer to SAME S.

## 2. One opposite-weight pairing, including infinite classes

Let L=classUnip0(c), H=classUnip0(c'), X=L gamma H.
For delta in X, write z=(ratToInf delta)^-1 y,
a(y)=boxCutoff_c(y), b(z)=boxCutoff_c'(z),
U(y)=product_v ||W_v^cut(y_v)||, V(z)=product_v ||W_v^cut(z_v)||,
and r(y,z)=product_v [frameVolume(y_v)/frameVolume(z_v)]^(k+n)>0.
The squared norm of the tensor product in Setup.263–264 factors
exactly as U²V² by summing squared absolute values over the product
coordinate set. Cut support (SchurTest.121–123) and the native box
partition support ensure the original cutoff amplitude integrand
equals a b U V; no claim that boxCutoff equals classCutoff globally.

The nonnegative integrands for the two Schur integrals in common y
coordinates are a b U² r and a b V²/r. The second uses Haar
left-translation invariance with z=delta^-1 y, not a new measure.
Frame volumes are strictly positive, so their product is exactly
(a b U V)². Cauchy–Schwarz gives the actual native
A_delta²<=P_delta Q_delta, with A=amplitudeAbs(c,c',delta),
P=schurIntegral(c,c',delta), Q=schurIntegral(c',c,delta^-1).
This is SchurTest.131–140, with the measurable nonnegative
integrands, native Haar measure and cut-support supplier retained.

Inversion is a bijection X -> H gamma^-1 L:
(l gamma h)^-1=h^-1 gamma^-1 l^-1, with inverse the same map.
The swapped term lies over (c',s^-1,c) and has level j, using hk.inv
and hlevel.inv. Its termPosition is the inverse by Setup.233.
The frameProducts matrix for gamma^-1 is the conjugate transpose
of that for gamma by unitarity of gamma; the leading j-by-j block
transforms likewise, and its determinant absolute norm is unchanged.
The same N normalization gives D(gamma^-1)=D(gamma).
No equality I+=I- is required.

RUN99 (99.5) now bounds the sums of P and Q over X by the finite reals
    B+ = nu d_B tau² (b^4 g)^(-mkf) (I+/sqrt(D))^(k+1),
    B- = nu d_B tau² (b^4 g)^(-mkf) (I-/sqrt(D))^(k+1).
In particular all individual P,Q,A are finite; even a zero
Schur sum is harmless. For any finite F subset X, ordinary real
Cauchy–Schwarz after finite ENNReal conversion yields
    sum_F A <= sqrt((sum_F P)(sum_F Q)) <= sqrt(B+ B-).
Take the supremum over finite F, the nonnegative ENNReal tsum.
This proves the native infinite sum estimate without assuming
amplitude summability first or dividing by either Schur sum:
    sum_X A <= U0 := nu d_B tau² (b^4 g)^(-mkf)
                         (I+ I-/D)^((k+1)/2).          (100.1)
The exponent here denotes a positive real square root of the
(k+1)-st power, including k even. This independently audits V12.

## 3. A single normalized energy envelope for all levels

Define the positive common denominator
    Z=M g^(2mkf) x^(k+1)>0,
and E_j=mainEnergy if j>h, otherwise
E_j=tau^13/(tau^32)^j * E1. The original classSize is
tau² sqrt(E_j/Z). E1 and E_j are nonnegative by native size guards.
The entire scalar budget is the exact identity
    U0² Z/(nu² tau^4)
      = d_B² M b^(-8mkf) N^(f(k+1))
      = N^f d_B E1 /(tau^32)^m.                       (100.2)
The first equality cancels the SAME two indices I+ I-, minor D
and g powers. The second uses countWeight(0), columnDim,
besselEnergy, and tau^4=b^(kf). No quotient by E1, d_B, or
a Schur sum is taken. All division here is by known positives.

Instead of presenting independent budgets for j<=h and j=n,
use one common lower envelope
    E_j >= tau^13 E1/(tau^32)^m.                       (100.3)
At j<=h it is equality since m=j; otherwise m=h, and
tau^13/(tau^32)^m <= tau^13 <= tau^44, so the exact
admissible guard tau^44 E1<=mainEnergy implies it. This is
a uniform inequality, not an assertion that the two energies coincide.

The native N<=b^(60n), k>=2000n give even N^f<=tau, because
60nf<=kf/4 and b>=1. Native d_B<=b^(2kf)=tau^8. Thus
    N^f d_B E1/(tau^32)^m
      <= tau^9 E1/(tau^32)^m
      <= E_j.                                         (100.4)
The original proof used the looser N^f<=tau^5; the same classSize
bound follows either way. This sharper budget is noted only to
certify a common margin, not as a proposal to alter downstream constants.
No need for a separate full-level normalization or the stronger
full-level equality I+=I-=1 (used later at the thick caller).
Equations (100.2)–(100.4) imply U0²<=nu² tau^4 E_j/Z.
All factors are nonnegative, hence take the nonnegative square root:
    sum_X amplitudeAbs(c,c',delta)
       <= ofReal(nu classSize(j,classGauge(j,c,c',gamma))). (100.5)
This is precisely ThinClasses.131–149, retaining its full hypotheses.
The actual BlockBound.386 caller is in the complement of K,
where not_lt supplies termDiscNorm<=N^f D; stability and the
near-representative partition remain as in the native proof.
No claim of the thick-class result or changed theorem interface.

## 4. Failed shortcuts and verification

- Replace absolute amplitudes by complex amplitudes in Cauchy–Schwarz:
  the thin theorem bounds a nonnegative sum, not a signed cancellation.
- Drop the cut support or use full W: the boxCutoff identity need not hold.
- Invert within the same double coset with unchanged c,c': wrong in general;
  swap the subgroups, classes, reduction and position.
- Set I+=I- or both equal one for all j: unjustified; only their product
  cancels in (100.2). At the thick consumer the top-level index is separate.
- Drop the N^f numerator of classGauge: misses N^(f(k+1)) in (100.2).
- Use b^(-8mkf)=tau^(-8m): wrong by a factor of four in the exponent.
- Divide by E1 or presume amplitude summability: neither needed;
  finite-subset Cauchy–Schwarz and nonnegative budgets suffice.
- Identify E_j with the lower-level formula at the top: false in general;
  (100.3) is only a lower bound from the native energy guard.

Actual verification: fetched the pinned source bodies and definitions
listed above, RUN99 checkpoint, V12–V13, current ledger and manuscript.
Derived (100.1)–(100.5) independently by exact inversion, conventional
Cauchy–Schwarz and algebra over all native parameters; checked boundary
j=0 (m=0, no negative power singularity) and j=n (m=h). No fresh
Lean execution or performance test. This is a human source-matched
audit, conditional on the previously supplied Schur-integral bound
and original support/Haar/index primitives, not a new kernel receipt.
URT structural grouping selected the opposite pairing and common
denominator; all validity comes from standard mathematics. No O(N)
or speed claim. B2 root and full RH reconstruction remain OPEN.

RESUME HERE: independently audit the distinct thick-class representative
selection and orbit-weight identity in BlockBound.enorm_amplitudeSum_le_classSize_top
304–329, using the existing open-cell note
integration/2026-11-26_COMPACT_OPEN_CELL_CONTRACTION.md
(blob edde7b6245ec51d4326f2cd50545021acbdb9ba0). Do not rederive its
already-audited packet scalar or the thin V12–V13.
HANDOFF TO integration/audit: (100.1)–(100.5) independently audit V12–V13;
the uniform envelope is sufficient for the original interface.
Preserve all primitive dependencies and native replay requirements.
