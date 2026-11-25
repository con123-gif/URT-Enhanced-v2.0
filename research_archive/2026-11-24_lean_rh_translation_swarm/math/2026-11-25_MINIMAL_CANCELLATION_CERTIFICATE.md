# Minimal cancellation certificate — user-directed simplification
25 November 2026. Status: conditional human algebra, source-matched, NOT full RH proof or Lean replay.

Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005. Source route: Main -> rhOfAll -> allChi -> everyCharacter -> third-place theta/Green/TopG -> windowInequality_of_artinInputs -> core_gm / formB -> zeroFree_of_rpow_window. Source names are from actual fetched bodies, not a kernel dependency census. Keep newer Claim.zeta revision separate.

## 1. Exact mechanism: finite Fourier projection
ChBalance.lean, ch_balance: ASK - MAIN = De. For unramified p, character orthogonality selects the Frobenius power:
  (1/|Phi|) sum_chi conjugate(chi(g)) chi(i*frob(p)) = 2 1[g=i*frob(p)].
Ramified inertia averaging and exceptional primes are retained in HostFactsS; no arbitrary random-phase assumption.
ChCore.lean, CharacterBalanceMoves.sum_A, sum_Th: averaging over the subgroup A0 annihilates every character nontrivial on A0. This projects exactly onto PsiA(A0), not all characters, and explains the cancellation mechanism without invoking URT as an axiom.

## 2. Weaker sufficient hypothesis for the actual character-balance branch
Let Q=|TT| m b>0, d=|T2|/|H|>0, X=x^(1/2+eps), G=GmA-SigA, and B=(1/|A0|) sum_{u in A0} gapA(u).
Preserve all premises of ChCore.lean CharacterBalanceMoves.core except its pointwise hTop. Replace hTop: forall u, gapA(u)<=Err by B<=Err.
Proof: th_le and ch_balance imply for each u, sum_{t,j} Re Th(u,t)<=gapA(u)+2Q/x. Summing over u, dividing by |A0|, and using sum_Th gives (m b d/2) sum_t Re sum_{psi in PsiA} psi(e1 t) GPsi(psi,a(t)/b)<=B+2Q/x. The unchanged one_char estimate gives the sum over t >= |TT|(G-4X). Consequently
  (Q d/2)(G-4X) <= B + 2Q/x.
Thus:
  GmA <= SigA + 4X + 2B/(Q d) + 4/(x d).
This only requires controlling the actual subgroup average, not each translate separately. It is a direct generalization of the proof body (the earlier zeta-only branch already uses an average, so do not claim averaging itself as novel). To use a weighted mean supplied elsewhere, prove that it is the same subgroup average or a valid upper bound; no replacement by an unrelated mean. No assertion that the existing geometric construction automatically supplies this weaker bound.
gmA_eq transfers GmA to Level.Gm given native host compatibility. sigA_le bounds the discarded-character sum by 4*Level.o*X under EAtH, but an independent direct bound on the combined right side would suffice instead.

## 3. Exact normalized four-term error and balanced scale
For the SizeWindows hypotheses in GrowthBoundGivesRiemannHypothesis.lean and proposition_size_bound in LipschitzWeightAndMinimum.lean, write P=x^(C eps), n=|H|, nT=|TT|, nT2=|T2|. Divide the error bracket by Q:
  Err/Q <= P[(aE/(m b))(1+m^2/k) + 2(n/nT)m*x^eps + (nT2/nT)(k/n^2)*x^(2eps)].
Use aE<=2xb, k>=xm, n/nT<=2*x^(eps/8), k<=n^2*x^(1/2-eps). Keep d in the last term:
  Err/Q <= P[2x/m+2+4m*x^(9eps/8)+2d*x^(1/2+9eps/8)].
Combine with the average certificate:
  Level.Gm <= SigA + 4X + (2P/d)[2x/m+2+4m*x^(9eps/8)]
              + 4P*x^(1/2+9eps/8) + 4/(xd).
All denominators positive from native SizeWindows. No extra assumption eps<=1. The last term of the bracket loses no inverse-density factor after division.

If the host construction permits freely choosing m within its native size bounds, then A/m+Bm with A=2x, B=4*x^(9eps/8) is minimized at
  m_opt = (1/sqrt(2))*x^(1/2-9eps/16),
  minimum = 4*sqrt(2)*x^(1/2+9eps/16).
For fixed eps>0 the ratio m_opt/x^(1/2-eps) grows as x^(7eps/16)/sqrt(2); for sufficiently small fixed eps (e.g. 0<eps<1/2), integer rounding is asymptotically negligible and the optimum is within the native m interval at sufficiently large x. This does NOT establish freedom to choose m with valid host geometry, k, error windows or family coverage. If such freedom were proved and d>=x^(-eps), the leading normalized error exponent would be 1/2+(C+25/16)eps rather than the coarse 1/2+(C+21/8)eps. The source's actual bounds already suffice conditionally as eps tends to zero; optimization is a possible simplification, not necessary for RH.

## 4. Next mathematical task
Find a direct bound for the subgroup-averaged discrepancy B (or the combination with SigA) on arbitrarily large multiplicative windows, with fixed uniform exponent constants. Prove host/family coverage for a family containing the trivial character; RH alone does not require proving every Dirichlet L-function zero-free, though the existing source chooses that stronger goal. Check whether a single fixed native level already provides such windows without invoking TopG for all primitive characters. Do not assume it does; preserve quantifier order and uniformity in eps. A one-sided bound is sufficient by Landau; no need for an absolute prime discrepancy bound. No claim of a shorter unconditional proof, new theorem of RH, or URT speedup.

Sources fetched this turn: ChBalance.lean, ChCore.lean, ChTop.lean, CoreGm.lean, GmAEq.lean, SigALe.lean, LevelFamily.lean, WindowInequalityOfArtinInputs.lean, lemmaL.lean, landauWindow.lean, GrowthBoundGivesRiemannHypothesis.lean, LipschitzWeightAndMinimum.lean. Exact source paths in pinned upstream under DedekindLFunctions/LandauTheorems, PrimitiveCosets and Formalism/SizeWindowBrackets. Human derivation only; no Lean execution.
