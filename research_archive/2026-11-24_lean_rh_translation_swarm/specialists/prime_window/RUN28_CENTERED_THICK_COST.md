# RUN28 — centered thick-weight cost in the actual native ramp
25 Nov 2026. Lane 3. SOURCE-MATCHED human strengthening of the actual ChCore consumer, not a new RH criterion. Native replay PREPARED, not compiled. RH OPEN.

Latest mission blob 22018a6dceabd8f43dec13d548c22f3c237729ae: faithful native G(x) <= x^(1/2+9eps) on [Y,Y^(3/2)] and ten-page maximum. Accordingly pause RUN27 independent shell route, retain its archive. Read AGENTS, SWARM, HANDOFF, EXPANSION, continuity/state/runner excerpts, RUN27, live manuscript and recent commit list through ff5f42b9; inspected relevant peer diffs ee726c865 (positive-kernel thick bound), d5e73014 (shift), 93284779 (common signed kernel), d131f208 (singleton bridge), ff5f42b9 (three budgets). This result extends ee726c865 by retaining the previously discarded log-centering and exact cutoff boundary correction; not a claim to have independently discovered the prior positive-kernel estimate.

## Compact proof block for the live manuscript
In Deduction.CharacterBalanceMoves.th_le let A>0, b>0, x>=3, |A/b-x|<=1, F=|PhiSet|=fPl(H)>0, J=eta+1, y=A/b. All other native hypotheses except LipW are retained. Write T for the thick subset of complementary colors g, L for the number of thin colors, and v_g=w(partner(t,g))=b+delta_g on T, where 0<=delta_g<=J. Define
  P_g(v)=Re [ F^(-1) sum_chi chi(-g) v GPsi(D,ell,chi,A/v) ].
Native inner_eq and orthogonality give exactly
  P_g(v)=sum_n Lambda(n) Kc(n,g)(A/n-v)_+ - (A/F)log(A/v)+C_g^0,
where C_g^0 is independent of v (contains the Euler constant and all nontrivial log-derivative terms). On each prime power n=p^i, i>=1, Kc=2/|I_p| on the coset i*frob(p)+I_p and zero elsewhere. Thus Kc>=0 on the support of Lambda and sum_g Kc(n,g)=2 there. All sums with ramps are finite; n=1 contributes zero, n=0 excluded. The additive-character conjugation identity gives the minus sign in chi(-g).

Let C_g(y)=sum_{1<=n<y} Lambda(n)Kc(n,g) (strict cutoff), and
  R_g=sum_{1<=n<y} Lambda(n)Kc(n,g) max(delta_g-(A/n-b),0) >= 0.
The exact ramp difference on T is
  P_g(b)-P_g(v_g)=delta_g*C_g(y) - R_g - (A/F)log(1+delta_g/b).   (1)
For n<y, max(A/n-b,0)-max(A/n-v_g,0)=delta_g-max(delta_g-(A/n-b),0); for n>=y both ramps are zero. The nonzero remainder has precisely A/v_g<n<y. No approximation of the prime count, no absolute values or discarded log terms before this equality. In particular equality n=y never contributes an artificial boundary atom.

Since log(v_g/b)>=1-b/v_g=delta_g/v_g (log z<=z-1 applied to z=b/v_g), (1) gives the new centered thick budget
  Th.re - De.re <= sum_{g in T} delta_g*(C_g(y)-A/(F*v_g)) - sum_{g in T} R_g + 2 L A theta
                <= J sum_{g in T} max(C_g(y)-A/(F*(b+J)),0) + 2 L A theta.     (2)
Here Th and De are EXACT native expressions: hTh and CR.De_re in th_le identify the thick sum at b and all-color sum at the actual v_g. The thin estimate is unchanged: from v_g<=2b', b'X'<=xb and A>=(x-1)b, get A/v_g>=X'/3 because x>=3. ThinScales bounds each |v_g GPsi|<=A theta; |G|/F=2 and |chi(-g)|=1 imply P_g(v_g)>=-2A theta. L<=F. This proves (2) for actual ramified and unramified coefficients with arbitrary ell, without LipW.

For the original native consumer no extra hypothesis is introduced: the centered sum is <=sum_T C_g(y)<=2 psi(y), psi(y)=sum_{n<=y}Lambda(n). The elementary dyadic Chebyshev bound psi(y)<=4(log 2)y for y>=1 follows by Legendre valuations in binomial(2n,n): each prime power in (n,2n] contributes one, all other valuation terms nonnegative. Sum over powers of 2, round y up to a power of 2 (<2y unless already exact). Thus the new thick term <=8(log2)J(x+1)<6J(x+1)<=6FJ(x+1), and the thin term <=2F(x+1)b theta. This recovers exactly the conclusion of th_le, hence the original CostWindows and core's 2Q/x budget, with LipW removed **locally** in the proposed replacement. The sharper centered budget remains valid even when the pointwise uniform eta bound is replaced by a proved aggregate bound on the first line of (2), with all same-host and thin hypotheses intact. It is not necessary to prove new RH-scale estimates for C_g: the unconditional coarse bound suffices for the native argument. The pointwise geometry ASK-MAIN, character estimates, family and VWin suppliers remain essential and open in the human reconstruction. The live manuscript can use the earlier simpler coarse proof; the exact centered formula is available if its error cost becomes binding. No new manuscript section is required.

## Source and dependency ledger
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, leanprover-community/riemann-hypothesis. Exact pinned paths and blobs:
- src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean 878f5077bc382426c7da988e5a375b85deeaa7de, th_le L75–152, hTh L90–104, original LipW use L115–123, thin L124–139, comparison L140–152; core, ch_core in same file.
- src/Formalism/SizeWindowBrackets/FirstPrimeNeSecondPrime.lean 18deb7cb85d6f650a69f01fda6e0c789b9f04d89, primVal L65–66, GPsi L68–70, De L93–96, OrthoRam L116–121.
- src/Formalism/SizeWindowBrackets/ChainSlopeWindows/StronglyIrreducible.lean 94a385f59f3781ae6b1ab4beddc73850708a2bc6, conj_eq_neg L73, ortho_coset L274, orthogonality_ramified L311, Kc L446, sum_cut L619, inner_eq L655.
- src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChBalance.lean 37648715bcf507e086374e8cc476ee746fd274f4, askExp L122–196, ch_balance L200–260.
- src/Development/AutomorphicArithmetic/PrimitiveCosets/CoreGm.lean 3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d, core_gm L12–74 (ch_core at L21 and L55–60).
Latest upstream observed a85077714ca7b298f69e48798497519ed5326a89. Old ChCore path at that revision returned 404, not proof of declaration deletion; StronglyIrreducible and FirstPrimeNeSecondPrime blobs changed to b5bf0125c1a73d8adecb2bf9d18b7961eedaaecd and d3b68b896d305c56a951d35a44637dc2a862e0c0. No revision mixing.

Original source-level path retained: Main.riemannHypothesis -> rhOfAll -> rh_of_every -> everyCharacter -> TopPlug/TopShape/TopWin -> core_gm -> ch_core -> core -> th_le -> LipW/lipschitz_weight_all + ThinScales + Fourier identities. Proposed replacement at actual native consumer: th_le <- signed finite identity (1) + centered scalar inequality (2) + same thin proof + elementary Chebyshev bound. Actual call sites are not replaced in Lean; no global dependency deletion or full elaborated root-coverage assertion. Preserve original type, value, constructor, unresolved axiom and pending edges. Context key (pin,D,ell,A,b,t,u0,T2,w,actual thick subset); no caching across distinct host or weights. Backtrack to original native theorem if this replacement fails audit. Prior native statuses independently retrieved: 45577239749 pass (98.87s), 45576756833 pass (77.94s); these certify only earlier engines/conditional root, not (1) or (2). No lean/lake on PATH. No URT use.

## Local exact arithmetic check
Executed CPython, exit 0. 168 actual primes, 193 actual prime powers through 1000; 37,056 exact rational ramp identities/inequalities, including 1,172 strict cutoff crossings; one negative-delta control. Not a native host simulation, no invented Kc or field data; this checks the coefficientwise algebra only.
```python
from fractions import Fraction as F
from math import isqrt
N=1000
s=bytearray(b'\1')*(N+1);s[:2]=b'\0\0'
for p in range(2,isqrt(N)+1):
    if s[p]:s[p*p::p]=b'\0'*(((N-p*p)//p)+1)
pp=[]
for p in range(2,N+1):
    if s[p]:
        q=p
        while q<=N:pp.append((q,p));q*=p
cnt=cross=0
for A in [F(37),F(201,2),F(239),F(999)]:
    for b in [F(1),F(3,2),F(5),F(7,3)]:
        for J in [F(0),F(1,7),F(1),F(8,3)]:
            for delta in [F(0),J/2,J]:
                for n,p in pp:
                    z=A/n
                    d=max(z-b,0)-max(z-b-delta,0)
                    r=max(delta-max(z-b,0),0) if z>b else F(0)
                    assert d==(delta if z>b else 0)-r
                    assert 0<=d<=delta*(z>b)
                    cnt+=1;cross+=int(b<z<b+delta)
assert max(F(3)-F(2),0)-max(F(3)-F(1),0)<0
print('actual primes',sum(s),'prime powers',len(pp),'ramp checks',cnt,'strict crossings',cross,'negative delta control 1')
```

## Prepared Lean scalar certificate and actual-source scan (NOT COMPILED)
Extract this code to the native pinned environment (Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474); three existing engine modules on LEAN_PATH. This is a scalar component of (1)/(2), not a compiled replacement of th_le. No RH theorem import. Kernel lane to replay, inspect all resulting axioms, and prove finite-sum bridge in the same context. No CI dispatched in this run.
```lean
import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.ChCore
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3
import RHProofTermPrune

namespace RHPrimeCentered

theorem ramp_delta (z b d : ℝ) (hd : 0 ≤ d) :
    max (z-b) 0 - max (z-b-d) 0 =
      if b < z then d - max (d-(z-b)) 0 else 0 := by
  split_ifs with h
  · rw [max_eq_left (by linarith : 0 ≤ z-b)]
    by_cases k : d ≤ z-b
    · rw [max_eq_left (by linarith : 0 ≤ z-b-d),
          max_eq_right (by linarith : d-(z-b) ≤ 0)]
      ring
    · rw [max_eq_right (by linarith : z-b-d ≤ 0),
          max_eq_left (by linarith : 0 ≤ d-(z-b))]
      ring
  · rw [max_eq_right (by linarith : z-b ≤ 0),
        max_eq_right (by linarith : z-b-d ≤ 0)]
    ring

theorem centered_cost (d J C c R P : ℝ)
    (hd : 0 ≤ d) (hJ : d ≤ J) (hR : 0 ≤ R)
    (hP : P ≤ d*(C-c)-R) :
    P ≤ J*max (C-c) 0 := by
  have hj : 0 ≤ J := hd.trans hJ
  calc P ≤ d*(C-c) := by linarith
       _ ≤ d*max (C-c) 0 :=
         mul_le_mul_of_nonneg_left (le_max_left _ _) hd
       _ ≤ J*max (C-c) 0 :=
         mul_le_mul_of_nonneg_right hJ (le_max_right _ _)

theorem centered_cost_auto (d J C c R P : ℝ)
    (hd : 0 ≤ d) (hJ : d ≤ J) (hR : 0 ≤ R)
    (hP : P ≤ d*(C-c)-R) :
    P ≤ J*max (C-c) 0 := by
  rh_auto_frontier 2
  all_goals first | exact centered_cost d J C c R P hd hJ hR hP | rh_auto 2

rh_prune Deduction.CharacterBalanceMoves.th_le as RHPrimeCentered.th_le_pruned
rh_scan Deduction.CharacterBalanceMoves.th_le limit 2000
#print axioms ramp_delta
#print axioms centered_cost
end RHPrimeCentered
```
Pruning the ORIGINAL body is expected to retain hLip; it is explicitly used. Only a new checked theorem and caller bridge can remove it. Apply rh_reduce to the finite-sum replacement once formalized; do not substitute a scalar test for that proof.

RESUME HERE: integrate only the already justified coarse thick proof in the live human manuscript if space permits, then audit the actual remaining arithmetic family supplier to ensure no hidden cutoff or character estimate is omitted. Replay the native finite-sum bridge in the pinned environment; do not extend independent prime-shell detours. HANDOFF TO integration, human editor, formal audit, kernel extractor. Independent audit requested; all earlier evidence retained.