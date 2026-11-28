# RUN104 — Exact packet-to-cell mass ratio and weaker local packet premise
28 November 2026. PARTIAL — source-matched human alternative at an actual
B2 primitive/caller; no fresh Lean replay. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. Continue RUN103 29e5c5e3.
Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Preflight: mission 3adc76221a978016e3505cdf3e36ad688354d7d7,
spine 1c4608f2190154fd4bc4b38fc77db10ec5e60e64,
ledger 579ecc1cafdb28eae7d1c97565700c571dfa7484,
manuscript (especially 838), root AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE,
expansion, binding amendment 99cfbd1f04c3a4c6d02c21a8fde207f2121aef20,
and state/log/protocol/continuity retrieved. Latest peer 157aec2c
addresses Moments, not this cell estimate; other recent energy/rank
replacements are distinct. Physical CI 46132821924 is not RH replay.
The existing lead O11 and peer RUN56 are already human-derived:
integration/2026-11-26_COMPACT_OPEN_CELL_CONTRACTION.md
(edde7b6245ec51d4326f2cd50545021acbdb9ba0) section 5 and
specialists/positivity_geometry/compact/RUN56_NATIVE_SUPPORT_AND_PACKET_AUDIT.lean
(416a9ae2474fdca95faf40ac326bf22548542a64) section 2.
RUN57_PACKET_MASS_DEGREE.lean (744d7e69092df9317e96d005bad1ea5e49f9c9f9)
and RUN58_GAUSS_IDEAL_ZETA.lean (9c7ebf4d419d295b2b607fc88eccb1e1981a5374)
already supply their conditional mass derivations. Do not redo these.
This delta instead cancels the dyadic factor exactly and exposes the
much weaker packet premise sufficient at the thick-class caller.

## Actual source
- New/Filling/SchurTest.lean bcb1fd28783bdeb4d0e3c7d83559d0ef99cecdea,
  classSize 65–67, IsNear.le_classSize_and_cellMass_le 72–99.
- New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727,
  42–58 (scale guards), 148–162 (frame and covolume/siegel constants),
  247 (boxSize), 268–318 (energy, packet, scale and admissibility).
- New/Filling/CrudeBoundDefs.lean 0ba0d2532b14c414b9032466b79e10d4d60c3d18,
  countWeight, termDiscNorm; New/Filling/NearTerms.lean
  bd8a969f8d1bda48ca0468c28a8a62bc78e280ce, 225–236, 302–305.
- New/Filling/BesselSystem.lean 847e2869ed2c189c30f6efef85e7c1f2451058,
  cellMass 44–45.
- New/Filling/FillingAdmissible.lean b52e37db6879e90b3592d2bc5d2a78140c79c86d,
  actual instance supplying the packet field. New/Filling/BlockBound.lean
  6c68e80e3b1ea2b7983696716305493a37f2b1fd, 331–358 actual consumer.

## 1. Exact local sensitivity identity
Retain the SAME admissible S, near gamma with X=termDiscNorm(gamma)>=1,
h=varrho, n=h+1, k=|kappa|, f=#infinite places, H=100000n^4,
rho=boxSize=b^(2n²), tau^4=b^(kf), g=S.g, N=S.N, nu=unipCovolume.
Let d_B=#BesselCoord, Deg=besselDegree, D=mainEnergy, c_G=openCellConst,
V=volÔ, rd=rootDiscr, F=frameScaleProd, l_va=frameScaleSq(v,a),
L=product l_va, C0=countWeight(0), P=packetConst, a=classSize_top(X).
All denominators positive by the same native guards; D>0 because
columnDim is positive and mass and degree positive, not just D>=0.
The native CM volume formula is V=(2/rd)^f and |disc E|=rd^(2f).
Define the normalized packet ratio (RUN57 P1/P2)
  Q=P / [D Deg c_G^f / V^n * (nu F/d_B)^2].
This Q is NOT a new independent parameter. The native packet field
gives Q<=1+b^-9; for the local sensitivity statement we do not use
that bound yet. Let M=product_v cellMass_v and R=M/(nu a/2)^2.

The actual normalized local discriminants multiply to L²X by
NearTerms.233. Expanding the exact definition of cellMass gives
  M=rho^(9nHf) 2^((k-1)f) d_B² /
        [Deg c_G^f (L² X)^(H+k-1)].
Also a²=tau^4 D/(C0 g^(2hkf) X^(k+1)).
Use P=C0 N^(kf) g^[fh(2k+2h+1)] siegelConst and
siegelConst=(pi^k/((k-1)! N^k))^f |disc E|^(1/4) V^k.
Substitute before any estimates. The class counts, degree, coordinate
count, N^(kf) and all common k-dependent frame powers cancel. In
particular the factor 2^((k-1)f) cancels against the 2^((k+n)f)
from V^(k+n), instead of being bounded as a separate exponential
loss. The exact result is

  R = Q * [4 / 2^((n+1)f)] *
      b^(18n³Hf-kf) * (F²/L^[2(H+k-1)]) *
      [((k-1)!/pi^k) rd^(k+n-1/2)]^f /
      [g^[fh(2h+1)] X^(H-2)].                       (104.1)

This is an equality, not just the upper bound P1 of the prior audit.
It is valid at the actual thick term, independently of the numerical
packet field. The finite place and mass-ratio suppliers remain unchanged.

## 2. One uniform guard and the weaker local premise
For a frame coordinate with i=h-a, its exponent in F²/L^[2(H+k-1)]
is 4i-2H+2<0. Because |kappa_v|>=1, l_va>=1/N. Summing over
i=0,...,n-1 gives 2n(n-H); hence this ratio is <=N^[2nf(H-n)]
<=b^[120n²f(H-n)]. This is the same frame sum as peer RUN56.
Now group the remaining factorial and discriminant instead of paying
separate k-sized budgets. The native size guard gives
(200fk rd)^1000<=b, rd>=1, k,f>=1; hence k rd<=b^(1/1000)
and rd<=b^(1/1000). Using (k-1)!<=k^k and pi>=1,
  ((k-1)!/pi^k) rd^(k+n-1/2)
       <= (k rd)^k rd^n <= b^((k+n)/1000).
Since n,f>=1, 4/2^((n+1)f)<=1. The factors g^[fh(2h+1)]
and X^(H-2) are >=1. It follows directly from (104.1) that
  R <= Q b^{f[18n³H+120n²(H-n)+(k+n)/1000-k]}.      (104.2)
The actual native guards n>=100001 and k>=512000n^9 imply
  18n³H+120n²(H-n)
   <=1800000n^7+12000000n^6
   <=30000n^9 <= k/16,
where the second inequality uses n>=10 (n²>=100 and n³>=1000).
Also n<=k, so (k+n)/1000<=k/500. Consequently
  R <= Q b^(-9kf/10).                               (104.3)
Indeed 1-1/16-1/500=1871/2000 >9/10.
No extra estimate of the two-powers or arbitrary size parameter.

For THIS consumer only, the sufficient packet hypothesis is therefore
  Q <= b^(9kf/10), equivalently Q <= tau^(18/5).
The native sharp field implies it because 1+b^-9<=2<=b
and 9kf/10>=1 on the actual domain. Thus M<=(nu a/2)^2 with
the native conclusion, and substantial unused slack. In particular
the sharp near-one packet estimate is not needed for the thick-class
mass comparison in isolation. It remains needed at other consumers;
do NOT globally weaken IsAdmissible or remove its dependency.

## 3. Caller junction (reuse, not rederive)
The separate cutoff floor a>=q=b^(-k³f) is already established in
peer RUN56 section 2 from besselEnergy_le, X<=b^(11n³f) (native
near-leading-minor estimate), g<=b^23 and the native scale guard.
It uses no Q. Keep that floor and the joint support/cutoff inputs
from RUN102. With its notation, the direct probability integration
gives ||C|| <= sqrt(M)+nu q/2 = (nu a/2)(sqrt(R)+q/a).
Substitute R<=1 from (104.3) and q/a<=1 to get exactly ||C||<=nu a.
RUN103 then applies to the stable partition. This is the actual
local interface, not a substitute for the independent packet bound
at coherent energy or for the open-cell analytic construction.

## Rejected shortcuts / status
- Treat Q as independently optimized or assume a stronger mass law.
- Drop X^(2-H) without the native X>=1; for X tending to zero it diverges.
- Forget the factor 4 from the caller's half-amplitude square.
- Bound V with the wrong discriminant convention or drop the 2^f.
- Apply upper bounds to l with a negative exponent (wrong direction).
- Infer the cutoff floor from the cell-mass comparison; they are
  separate. Likewise, weakening this local packet premise does not
  remove the coherent packet normalization or the global mass inputs.
- Claim an improved RH theorem, actual speedup, or native replay
  from (104.1)–(104.3).

Verification: independently inspected pinned bodies and derived exact
equality (104.1), elementary universal bounds (104.2)–(104.3), and
the local weakening at the actual RUN102 caller. Ordinary algebra and
positive inequalities suffice. No fresh Lean execution or numerical
benchmark; earlier scalar checks not rerun or claimed as new tests.
Existing RUN56–58 proofs and native B2 receipts are retained. This is
a local human replacement under the stated premises, not a missing
global primitive closed or an independent formal certification of RH.

RESUME HERE: inspect SchurTest.amplitudeAbs_sq_le (131–140) at the
actual ThinClasses.tsum_amplitudeAbs_class_le caller; determine
whether the two opposite weights are exactly reciprocal on the
common nonzero support, and audit the extended-real Cauchy step,
reusing RUN100 rather than reopening the packet or tube arithmetic.
HANDOFF TO integration/audit: local packet sensitivity (104.3)
is sufficient for the thick branch alone; keep sharp packet field
for other consumers and existing native replay obligations.
