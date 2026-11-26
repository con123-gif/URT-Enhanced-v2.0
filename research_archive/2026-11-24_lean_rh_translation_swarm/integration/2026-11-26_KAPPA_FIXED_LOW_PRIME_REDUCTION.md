# Common-host kappa budget: eliminate low-prime weight selection
26 Nov 2026. Human source-derived reduction; native replay pending. RH OPEN.
Continues 394fdbf60c9d340486f5e57ad4c5e20a7ac7bf6f, using the actual definition of kapLoc rather than treating all local errors as random or independent. Current mission fb152e2897b4c1c320c43b9f42ae0ec088a7da45.

## Fixed regime is explicit

On the SAME host D,L,X,K let x=L.sc.x, P=sAt L K, p0=L.sc.p0 D.R.k, m=D.R.m, T=|D.host.TT|. Split P=P_low disjoint union P_high at p0. For each candidate p and representative t in goodReps X p write N_{pt}=|topsPos D p t|. For candidate p, class=inertClass, so stepP=hP (not signal). The representative t=bs(hP) y is fixed by bs(hP): bs_orb writes y=t+i*hP and bs_step gives bs(hP)y=bs(hP)t. Therefore its fibre topsOn is exactly the top points in its cyclic orbit: one direction follows bs_orb, reducing i modulo the finite order of hP; the other follows bs_step by induction. The map from Fin(addOrderOf hP) to that orbit is injective (native Marg.phi_injective proof immediately before sum_Nv_le). Thus N_{pt}=Nv X p t. In particular sum_t N_{pt}<=T by native sum_Nv_le, for the SAME candidate p.

Set c_low=K.kII*(rG L.sc)^2*D.R.k*x^(-Scale.A), nonnegative under native K.Nonneg.
For p<p0 the native definition of kapLoc is exactly min(1,c_low*N_{pt}), independent of either local or global weight table. Consequently
  s_p := SigO(p,o) = m sum_t min(1,c_low*N_{pt})
for EVERY admissible o. This is an exact expression; no MeanKappaBound or small-share weight existence is used. In particular 0<=s_p<=m*T*c_low. On the nonempty box marginal the local mean equals this same constant; the low-prime pointwise clause of MeanKappaBound and its low-prime average clause can be obtained from the SAME scalar c_low<=x^-12, not independent hypotheses.

## Explicit scale estimate

DataParams.Av5_eq gives Scale.A=26 for the native 0<eps<1/52. Here hExp=2+8eps, hence 4*hExp+9<26. The native rG is fixed once eps is fixed. Under the retained native upper n<=2*x^(2+8eps+eps/100) (weaker than the upper n in size_alt_alt when its prefactor is omitted) and k<=n^2*x^(1/2-eps) (ParameterChoice'.k_up with R0=n*x^-eps),
  k<=4*x^(9/2+(15+1/50)*eps).
Since 9/2+(15+1/50)/52<5, eventually k<=x^5. Fix K and eps before the threshold; K.kII*rG^2 is constant. For x sufficiently large,
  c_low <= K.kII*rG^2*x^-21 <= x^-20.
This proves the low-prime pointwise bound kapv<=Nv*x^-20 and low-prime mean bound with the same constant on the actual weight boxes. It uses native SIZE and orbit hypotheses, not an independently supplied local distribution estimate. It is stronger than the required x^-12 low part. No claim that the native proof has not already obtained this estimate.

## One remaining high-prime average (not a solved high estimate)

Use theta=x^-eps and w_p=log(p)/p. Let S_low=sum_{P_low}w_p and define the exact deterministic cost
  W_low=sum_{P_low}w_p*(2*1_{s_p>theta}+4*s_p).
Under the preceding scale bounds, m*T <= 2*x^(5/2+(8+2/100-1/16-1/8)*eps), so eventually m*T*x^-20<=theta. The low-prime indicator then vanishes identically for all o, and W_low<=4*m*T*x^-20*S_low. The Mertens bound S_low<=2*x^(eps/3) makes this o(x^-1) with fixed eps and constants. It is not necessary to optimize this fixed part or include it in the high-prime threshold majorization.

Let B_high=sum_{P_high}w_p sum_t meanLoc(kapI(p,t)).
By the exact native box-marginal identity from 394fdbf6 and the native nonnegativity, the mean high-prime cost is <=(2*x^eps+4)*m*B_high. Hence one common weight vector attains
  W(o) <= W_low + (2*x^eps+4)*m*B_high.
The candidate RUN40 consumer permits W(o)<=1/(2x). Therefore for large x the high-prime condition alone
  B_high <= 1/[4*x*m*(2*x^eps+4)]
suffices, since W_low<=1/(4x) eventually. The same table transport and actual carrying-record requirements remain. The stricter native W<=x^-9 consumer can also be used with a correspondingly stronger high-prime bound; do not remove its other users.

The source locates the genuine high-prime supplier as AuxBlock8.adm8 in SmallOrderPrimes, under IsGoodOrbit, L2<goodU, 3*Gp<=n', p0<=p<X', not InBand0, and HypI. It gives nonnegativity and meanLoc kapI<=Cm*N_{pt}*N1/x^(A/2), i.e. exponent -13 before N1. With ALL those guards established at candidate p,t, and uniform Cm and CbLarge K (N1<=K.CN log x), the high-prime bound would be
  B_high <= Cm*N1*T*S_high*x^-13.
This even supplies the original stronger local x^-12 scale eventually. Thus the real remaining work is authenticating the actual adm8/formal-group supplier and the candidate-to-HypI/other side-condition bridge, or proving the relaxed weighted aggregate directly from its proof. No high-prime estimate is assumed true in this note. A declaration named adm8 is a predicate, not evidence that it holds. If native adm8 and guards are already supplied in a short authenticated proof, use that proof instead of further weakening.

## Sources and status
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005:
- Formalism/SharpRestriction/GrowthBounds/IsResidueClassZero.lean 9fbb7879d0519f9a136e190551422881ef5d2f0b: G.Consts.Nonneg, rG, CbLarge, Inst.bs_orb, bs_step, stepP, reps, topsOn, Nv, topsPos, kapIIf, kapLoc, Cand, Sig, meanLoc, MeanKappaBound.
- Formalism/SharpRestriction/GrowthBounds/SmallOrderPrimes.lean a35ad58d20f072b48cbb03f619f1bf0f1501e66f: AuxBlock8.adm8, HypI, admitted, Conclusion2, WReq, PointsLemma.
- Formalism/LocalRingCardinality/DataParams.lean 6dc2612028528e242333116820c35775ba802c37: Av5_eq, R0, ParameterChoice'.k_up.
- Formalism/LocalToGlobal/GlobalTheory/PowFourLtCeilThresholdPrime.lean 8166795ec6e846795d7272781119ee7d17d426c0: Marg phi injection, sum_Nv_le, sum_box_product, pf_sum_kapv_le and pf_sum_Wt.
- Formalism/LocalToGlobal/GlobalTheory/LossRequirementsOfSmallShares.lean 287dcaae544bf078e47910aa5c9986ec501bdbd2: size_alt_alt, chosenW_of, term_le and actual common table selection.
Previous RUN40 96f96c3c74c5955590813a39c58d6f93fa067f02 prepared but not native verified. Current step is conditional exact human algebra from fetched source definitions, no fresh Lean replay or numerical simulation. No unconditional root obligation retired.

RESUME HERE: locate the actual proof yielding AuxBlock8.adm8 (not just the predicate); audit whether its underlying formal-group/kernel estimate can be used under the weaker aggregate budget. Establish candidate-to-HypI guards on the same host and replay the low-prime scalar lemma in existing pinned CI. Do not rerun finite tests of averaging or derive more alternative RH criteria. HANDOFF TO geometry/local-gain, Landau, kernel, dependency, audit and integration.
