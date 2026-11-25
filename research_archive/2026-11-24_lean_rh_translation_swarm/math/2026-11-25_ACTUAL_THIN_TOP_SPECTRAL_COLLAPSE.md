# Actual native thin/top spectral collapse: two scalar reference tests replace uniform thin-scale hypothesis
25 Nov 2026. User requests a serious breakthrough. New source-matched human reduction of the actual weight-window interface; no RH closure or Lean replay. Continues cb92aa3a and 53e08a78; resolves their missing distinction between native top and genuinely thin weights. This is a conditional replacement at the principal-host averaged core, not a claim that all upstream character or geometry machinery has already been removed.

## 1. Actual native weights, not model weights
Pinned P=40e56bab026552e089d7afcfeff08d2defb9c005.
DataParams2.lean defines a=xb, b'=a/X', X'=exp(x^(eps/3)), w''=b'/(x n), with exact three windows:
- thick v in [b,b+eta+1];
- top v in [bT(s)+b'/x,bT(s)+b'/x+eta];
- truly thin v in [w'',w''+eta].
bT(s)>=b'. QuadraticLogDerivCongr.lean numN_at uses P.teta to prove eta<=w''/x. Its nodes_at transports these genuine windows through eTau and gOfM before merging top/true-thin into the broad <=2b' condition. Mod.w and w_tie identify actual arithmetic weights with wj of carrying family member; all selected family members retain the common bT tables and aT tables (CoverAll/Mod.pt_w). Do not replace arbitrary SizesA weights by these bounds without the native producer. For the bT upper bound, numN_at explicitly uses P.bT_le and Nstar* x^eps*LaG/k; keep that premise in full. SizeRho, when the nonnegative second term is retained, gives Nstar*x^eps*LaG/k<=x^-2/4, since Nstar=szNst=2n delta1. Thus on the same actual scale and parameter-choice witnesses:
 bT(s)<= b'*(1+x^-2/4).
Alternatively WinOK together with RankVal and SizeLa gives the stronger eventual O(x^(-5/2+small eps)) relative width. This alternative needs actual transport of WinOK/Val, not asserted for arbitrary CoreAtH.

Use G=C2 x C2 x H, h=|H|=n, F=2h, A0=H principal specialization, T=TT, r=|T|>0, d=|T2|/h>0, A_t=a(t)>0 and S=sum_t A_t. Source aT_win and Mod.av_facts give a<=A_t<=a+b (even tighter native window). Write Amax=max_t A_t. The source cconj=((1,1),0), topPl(t)=((0,0),t), and gOfM((0,i),k)=(((-1)^i,1),iota(k)). Host.topPlaces=TT.image tau1. Thus off-Phi g=(1,i,k) maps to partner=(0,1-i,k+t); thick J_u in C0={(1,0,k)}, with fraction d at each k; top g in C1={(1,1,k)} iff k+t in T, independent of u; truly thin = complement of these two sets. This is a disjoint partition. No assumption that top and true-thin are identical or that TT is all H.

## 2. Two actual reference scales suffice
Set B_L=w''+eta, B_T=b'(1+1/x+x^-2/4)+eta. Both bound their respective actual weights from above, and both <=2b' for x>=3 under eta<=w''/x. Define y_L=a/B_L, y_T=a/B_T. Both >=X'/2. All actual y=A_t/v in the respective class satisfy y>=y_ref. With U_g(y)=Re[(1/F) sum_chi chi(-g) GPsi(chi,y)/y], positive Fourier prime-power kernel gives U_g(y)>=U_g(y_ref)-log(y/y_ref)/F. Here
 log(y/y_ref)=log(A_t/a)+log(B_ref/v)<=3/x
uniformly: A_t/a<=1+1/x; B_L/v<=1+1/x; B_T/v<=(1+1/x+x^-2/4+eta/b')/(1+1/x)<=1+1/x for x>=3, eta/b'<=1/(x^2 n). More conservative 3/x bound suffices. Summing over thin positions (at most F) leaves total normalized centering loss <=3 S/x per lift, irrespective of the enormous ratio b'/w''=xn. This uses actual geometry windows, not the unproved spread condition of the previous note.

For each character chi write z_chi(y)=GPsi(chi,y)/y. At the two fixed reference arguments, let B_chi=(S/F) sum_{g in off-Phi} chi(-g) minus the thick fraction coefficient (d S/F) sum_{g in C0} chi(-g). This is supported on the FOUR characters trivial on H, with sum abs B_chi=2S (as in cb92aa3a). Define T_chi=(1/F) sum_{t,s in T} A_t chi(-(1,1,s-t)). The truly-thin coefficient is B_chi-T_chi; top coefficient T_chi. These coefficients are exact because the uniform average over u removes translations in C0 and top is independent of u.

NEW two-scalar test, one for each reference:
 L_ref=Re sum_chi (B_chi-T_chi) z_chi(y_L),
 T_ref=Re sum_chi T_chi z_chi(y_T).
Then sum_t mean_u sum_{g nonthick} A_t U_g(A_t/v_ug) >= L_ref+T_ref-3S/x.
This proves the local replacement of all-character uniform ThinScales in ChCore.core by a one-sided bound on TWO explicit scalar spectral contractions (or their sum). No evaluation at every individual weight. No approximation of signs. The new test uses every character in the top autocorrelation where necessary; it is NOT merely four character evaluations at both scales unless TT=H or another appropriate support theorem holds. Thus correct the earlier idea of using four alone: the native top class is not a whole coset.

## 3. Group-cardinality loss disappears also for top class
Write chi(a,b,k)=(-1)^(alpha*a+beta*b) xi(k) with xi in dual H. T_chi factors as (-1)^(alpha+beta)/(2h) * (sum_t A_t xi(t)) * conjugate(sum_s xi(s)).
By exact finite Fourier orthogonality and Cauchy-Schwarz:
 sum_chi |T_chi| <= 2 sqrt(r sum_t A_t^2) <= 2r Amax.
Therefore sum_chi |B_chi-T_chi| <= 2S+2r Amax. Original ThinScales implies the new reference lower bound immediately if |z_chi(y_L)|,|z_chi(y_T)|<=theta, since y_L,y_T>=X'/2. In fact only these TWO fixed point bounds, or the much weaker signed tests, suffice. Since Amax<=a+b, S>=ra, rAmax/S<=1+1/x, total Fourier cost <=(6+4/x) S theta. No h factor, no |TT| factor beyond the natural total S.

## 4. Consequence in the actual principal averaged core
Retain ch_balance, actual same-host geometric mean gap B=mean_u gapA(u), m>0, d>0, Q=r m b. Prior thick loss bound 2d(eta+1)psi(A_t/b) remains. Combining all t and m lifts gives
 F_signed(x)<=R+2B/(Qd)
 +16 log(2)(eta+1)(x+1)/b
 +(2m/(Qd))*(3S/x - L_ref - T_ref).
Here R is the previously proved direct signed derivative shift. Native theta=exp(-c6*x^(eps/8)), d>=x^-eps, so the replacement reference cost from (6+4/x)S theta is o(1); the weight mismatch cost 6S/(r b x d)<=6(1+1/x)/d=O(x^eps), negligible relative to RH-scale x^(1/2+eps). This is substantially weaker than the original cost requirement 2b/x per (u,t,j): it does NOT preserve that stronger numerical constant, but is absorbable in the final asymptotic RH exponent. Thick loss remains absorbable by native CostWindows or its density-improved version. The two scalar reference tests could also be bounded directly without uniform per-character ThinScales. Need formal replacement proof at actual CoreAtH/ChainTied caller and verify that auxiliary consumers are unaffected. No proof of B on the actual host; this does not settle geometry, cohomology, signed prime cancellation or RH. Original full native premises imply this local estimate; new weaker premises are not yet installed in Lean.

## Evidence
Pinned source exact blobs: Formalism/LocalRingCardinality/DataParams2 (actual filename DataParams₂.lean) 50914500995df91e2646d91a6c5c99a7e603a51b; Formalism/SharpRestriction/GlobalSchurBounds/QuadraticLogDerivCongr.lean 7828c8b1060818fe158e23f87f1ad9e2efcf79eb (Mod.w, w_tie, av_facts, nodes_at, numN_at, thick_iff, R1, W1); Formalism/SharpRestriction/ElevenLe.lean 75f2ab1404c69a5d1330671d96d8f6cd35e74e52 (SizeRho, SizeN/K/La); Formalism/SharpRestriction/GrowthBounds/IsResidueClassZero.lean 9fbb7879d0519f9a136e190551422881ef5d2f0b (Nstar); Formalism/ThickAverageLoss/PartnersToFactorsAt.lean d3c1d8a4d1dcd4b282b14960b5a7b6525115e0af (cconj,topPl); Formalism/LocalRingCardinality/DataHost.lean 7e9af8ab364965c62be250ae93974098141598c0 (topPlaces); Formalism/SizeWindowBrackets/FirstPrimeNeSecondPrime.lean 18deb7cb85d6f650a69f01fda6e0c789b9f04d89 (partner); ChCore 878f5077bc382426c7da988e5a375b85deeaa7de; StronglyIrreducible 94a385f59f3781ae6b1ab4beddc73850708a2bc6.
Actual V8 regression: 528 nonempty finite subset cases on H=(C2)^k of sizes 2,4,8,16, 6186 exact integer Fourier convolution equalities, 528 exact squared Cauchy bounds. These are finite algebra controls, not native host data. Proof uses all finite abelian H. No Lean replay.
RESUME HERE: apply this native-weight-specific replacement in actual principal CoreAtH, prepare Lean bridge for two reference spectral sums and O(x^eps) loss. Work on actual geometry B, not more equivalent RH criteria. HANDOFF TO character, geometry, math, kernel, audit, integration. RH OPEN.
