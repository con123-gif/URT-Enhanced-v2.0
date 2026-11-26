# Common-host arithmetic-to-geometry aggregate kappa budget
26 Nov 2026. SOURCE-MATCHED HUMAN DERIVATION, candidate caller replacement, native replay outstanding. RH OPEN. User requested the common-host unification breakthrough; this is a concrete local reduction, not the breakthrough closing RH.

## Actual native identity

Fix x>Fm.x1, a single native base record i0, its same host D, its constants K, and the nonempty finite weight space Omega=Lnk.Wt Fm x i0. Let T=|D.host.TT|, m=D.R.m, P=sAt L K, R_p=G.goodReps X p. All weights and local representatives are on THIS record. Write
  kbar(p,t)=meanLoc of (a,b) -> G.kapLoc X K p (addOrderOf (G.hP D p)) (G.topsPos D p t) a b,
using its actual local A/B boxes; precise mean is the one in native sum_box_product.
Native kapv is this local function of the restricted global vectors. By sum_box_product and pf_sum_Wt/pf_card_Wt, with their nonempty box guards, the mean over Omega of kapv(p,t) equals kbar(p,t), EXACTLY, before the use of MeanKappaBound. Since G.Sig=m sum_{t in R_p} kapv, exchange finite sums and obtain
  mean_{o in Omega} SigO(p,o) = m sum_{t in R_p} kbar(p,t).
Therefore define a single same-host arithmetic-geometric aggregate
  B = sum_{p in P} (log p/p) sum_{t in R_p} kbar(p,t).
Then
  mean_{o in Omega} sum_{p in P} (log p/p) SigO(p,o) = m B.
No independent choices of o, primes or host. No independence assumption on overlapping local projections. The exact box marginal identity is sufficient.

## Weaken the local arithmetic producer at the geometric consumer

Retain actual nonnegative SigO, theta=x^(-eps)>0, all admissibility and carrying-record equality guards of chosenW_of. For the native common weight cost
  W(o)=sum_{p in P} (log p/p) [2*1_{SigO(p,o)>theta}+4 SigO(p,o)]
the source term_le gives
  mean W <= (2/theta+4) m B.
There is one o with W(o)<=that bound. Transport the same avOf(o),bvOf(o) using native sAt_eq, sc_eq, Sig_eq and CoverAll where needed; not separate independently optimal weights.

Landau RUN40 (96f96c3c74c5955590813a39c58d6f93fa067f02) derives a candidate replacement for the actual loss consumer requiring only W<=1/(2x) in place of x^-9. It retains all other PrimeClassLossHypotheses and WindowsD, and supplies original ASK-Ga and IO upper bounds. It is human-derived/prepared, not yet compiled. Combining that candidate with the exact mean identity above, a sufficient new upstream interface at THIS local consumer is
  (2*x^eps+4) m B <= 1/(2*x).
No per-(p,t) quantitative bound is needed for the chosen weight at this consumer.

For illustration of genuine weakening, define S=sum_{p in P}log(p)/p. The ORIGINAL per-representative first conjunct of MeanKappaBound gives kbar(p,t)<=Nv(p,t)*x^-12, and the native Marg.sum_Nv_le gives sum_t Nv<=T. Hence B<=T*S*x^-12. The candidate consumer instead accepts the AGGREGATE
  B <= T*S*x^-4.
Indeed S<=2*x^(eps/3) by the native Mertens estimate. The existing size guards yield
  m <= x^(1/2+eps/100-eps/16),
  T <= 2*x^(2+8eps+eps/100-eps/8).
Since 2*x^eps+4<=6*x^eps, the bound on mean W is at most
  24*x^(-3/2+(10999/1200)*eps).
For 0<eps<1/52, (10999/1200)*eps<1/4, so it is <=24*x^(-5/4). For x^(1/4)>=48, this is <=1/(2x). Thus the normalized aggregate target can tolerate a factor x^8 relative to the old local x^-12 scale, in addition to allowing exceptions across p,t. This is sufficient weakening for the candidate consumer, not an established bound on actual B without the original hypothesis. If S=0, B=0 and all candidate-weight costs vanish; no division by S is required. Other MeanKappaBound conjuncts and unrelated consumers are retained.

The arithmetic input is now one weighted local mean, and its output is a geometric loss bound on exactly the same record. This reduces the producer interface rather than simply recombining the final RH inequality. It does not imply VWinAt or solve Selmer/class-group estimates, mass, rank, entropy or LinkG. Need examine actual MeanKappaBound producer and whether arithmetic estimates can supply the relaxed aggregate WITHOUT first establishing the old pointwise theorem. If that theorem is already fully supplied in an authenticated shorter chain, prefer original and do not claim a global dependency reduction.

## Evidence and handoff

Retrieved pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005:
- src/Formalism/LocalToGlobal/GlobalTheory/PowFourLtCeilThresholdPrime.lean 8166795ec6e846795d7272781119ee7d17d426c0: sum_box_product, pf_sum_kapv_le, pf_sum_Sig_le, pf_sum_Wt, pf_card_Wt, mean_SigO. Exact identity extracted from first proof before h2.
- src/Formalism/LocalToGlobal/GlobalTheory/LossRequirementsOfSmallShares.lean 287dcaae544bf078e47910aa5c9986ec501bdbd2: chosenW_of, term_le, size_alt_alt, loss_setting_family.
- src/Formalism/SizeWindowBrackets/ChainSlopeWindows/DiscriminantSettingSatisfied.lean edc32424311c076565c2e13b7657f6a5f58cfd84: joint_core, second_discriminant_bound and io_discriminant_bound.
- src/Formalism/SizeWindowBrackets/PrimeClassLossHypothesesSatisfiable.lean 3f609406f5456e034f5dfb94e9688fca6c9f95a9: lhsW and PrimeClassLossHypotheses.
Prior work inspected: 4e3a1393aeb302a808a96095fc6955bd504e8522 (native common-weight reconstruction), 96f96c3c74c5955590813a39c58d6f93fa067f02 (relaxed loss threshold), c7e8eb6143305c5381cb8ac0aeb49ab63a77d363 (principal ChainTied joint loss candidate), 4123659c5b1c7148304cf2c340a28c88f7086a8e (signed residual), 0810c534f5b8e5fb367c0a63aa44a90d688c28fd (quotient joint loss). Current mission fb152e2897b4c1c320c43b9f42ae0ec088a7da45 and manuscript fd2d51ae41d5a18a548f009918f298f1bf0e222c read. Search for prior aggregate kappa commit titles returned no hits; not an exhaustive novelty search.
Executed exact integer exponent checks: 1200+12-75+9600+12-150+400=10999 and 4*10999<52*1200. No numerical simulation or native Lean replay. No root closure, no claimed speedup.

RESUME HERE: Landau/kernel replay RUN40 before relying on relaxed loss consumer; arithmetic/geometry/dependency lanes locate actual LinkG -> MeanKappaBound supplier and determine if aggregate can be proved from weaker rank or local estimates; preserve same i0 and table transport. Implement the exact finite-sum identity at pf_sum_kapv_le and use it to replace only the first quantitative conjunct where consumed by chosenW_of. Audit all other consumers, including actual local gain conditions, before deleting any source obligation globally. Integration/editor prioritize this only if it shortens the authenticated canonical proof; no new independent RH criterion. RH OPEN.
