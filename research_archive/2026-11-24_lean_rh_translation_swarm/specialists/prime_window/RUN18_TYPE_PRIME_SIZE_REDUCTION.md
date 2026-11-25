# RUN18 — TypePrimeSizeConds and reduced admission equivalence
2026-11-25. RESULT: SOURCE-MATCHED / independent human proof; exact finite V8 regression executed. The actual native constructor of AdmF and root reachability remain PARTIAL. No Lean replay or URT improvement.

P = 40e56bab026552e089d7afcfeff08d2defb9c005. H = b2f365a68500e2bde98cd60a2324263fc62fba10 (upstream commits head at inspection; compare API says 204 commits ahead of RUN17 head 9282d3a102c4aff0e6026746db2a8990f5d9cddd). No cross-version implication between the two differently defined admission predicates.

## Preflight
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN16/17, research-state/log/protocol/continuity excerpts and CI summary #404 (00:09:32Z, 45512681764; physical checks, not RH). Inspected latest 25 working-branch commit subjects and six peer commit diffs, including dependency/kernel/integration/editor/audit/Landau. Read prime lane and dependency directory indices. None of the inspected checkpoints duplicates this TypePrimeSizeConds derivation. Other peer full notes and blueprint PDF not reopened. No physics changes. Direct GitHub code-search API returned zero for TypePrimeSizeConds, AdmFam, AuxBlock8.AdmF; absence of hits is not proof of absence of a caller. Fall back to the explicit next conjunct in RUN17's handoff rather than claiming a native constructor.

## Pinned sources
Paths relative to https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/ .
- SharpRestriction/GrowthBounds/SmallOrderPrimes.lean blob a35ad58d20f072b48cbb03f619f1bf0f1501e66f L232–244: AuxBlock8.TypePrimeSizeConds and admitted. AdmF L256–260.
- SharpRestriction/ElevenLe.lean blob 75f2ab1404c69a5d1330671d96d8f6cd35e74e52: szTh L11; SizeM L27–29; SizeLa L68; SizeDel L105–113 (specifically conjuncts 1,4,7); SizeW L115; SizesAt L134–138 (24 conjuncts, no weakening).
- LocalRingCardinality/DataParams₂.lean blob 50914500995df91e2646d91a6c5c99a7e603a51b: Scale L9–17, L/b/a/X'/b'/w'' L27–39; SizeData₂.Sc_pos and Sc_eq L144–148.
- SharpRestriction/GrowthBounds/IsResidueClassZero.lean blob 9fbb7879d0519f9a136e190551422881ef5d2f0b: hG L37, N1 L43, Nm L49, La L58. In particular G.La(K,s) is NOT SizeData₂.LaG or SizeData₂.La.
- SharpRestriction/GrowthBounds/UnramifiedQuadraticSetting.lean blob c36e22ceab2885a6ab812f6187bfd1a86472a6ec: orbitWindowCount L247–248.
- SharpRestriction/GrowthBounds/LogarithmicSums/StarNum.lean blob 47c8e4430e4150f61202b8afa77ca2b6369c8043: St.cGE/cNE L38–40, Gp_le L57–92, first_count_le_log L94–134, k_le_x_pow_six L136–142, one_le_k L144–146.
- SharpRestriction/ParConsts.lean blob c3a5cddc3af0b027ad62b50a79cdb008712613a6: FamP.sizes L44, GK_nonneg L55; no displayed strict GK.La field.
- SharpRestriction/FamCore.lean blob 44cd54c38881086724fdf7f10f32b7d8e80e35b3: Win_unb/Ix_win/L_x/L_eps L79–85; **FamCore.exists_pt already exists at P L138–142**, correcting RUN17's claim that this was introduced at H. This is a provenance correction, not a change to its proof.
- SharpRestriction/GrowthBounds/LogarithmicSums/Conclusion1OfGainBoundAll.lean blob a37d19e7affc2c873c5a325fb25af7bf7834d9a0: Pf.AdmFam L156–159.

## Theorem 1: the entire native type-prime size predicate is eventually equivalent to strict positivity of the fixed coefficient
Fix epsilon, Fm:FamP epsilon, and K:G.Consts, fixed before the family variable x. No assumption on K besides the positivity on the right is needed for this equivalence:
  (exists T>1, forall x>=T, forall i:Fm.Ix x, TypePrimeSizeConds (Fm.D x i) (Fm.L x i) K) iff K.La>0.
The native predicate at one instance is SizesAt L AND 4*Sc <= La(K,s)*b'/k AND Nm+1 <= w''(n). Keep every native field in SizesAt. The proof below supplies the latter two bounds rather than deleting them.

Write x=s.x>1, e=s.eps>0, E=x^e, q=x^(e/100)>0, k=D.R.k, m=D.R.m, N=Nm(D)=D.R.N(m) (natural cast), d=D.s.Del (cast), B=s.b'>0, W=s.w''(D.R.n), G=L.LaG, c=K.La. Scale gives b=exp(E)>1, a=x*b>1, log a=log x+E, X'=exp(x^(e/3))>0 and B=a/X'>0. St.one_le_k gives k>=1. SizeM implies m>0 because x^(-e/100)*sqrt(x*delta1)>0, hence natural m>=1. SizeLa gives E<=G<=Eq. Sc=4kd>0. SizeDel includes:
  N*m^10<=d,
  k*Sc<=W,
  4*q*k^2*d<=G*B.
SizeW gives sqrt(b)<=W. These are the only extra inequalities needed from SizesAt for the two numeric conjuncts.

### Lower bound on the native logarithmic count
Unfold N1=orbitWindowCount(rG,delta1,hG,x). Since the ceiling of a nonnegative maximum dominates that maximum, and the maximum dominates its second argument,
  N1 >= (hG+3)*log_2 x >= log_2 x
because hG=2+8e and x>1. Thus N1>=1 also follows directly from the natural-ceiling-plus-one formula.
If c>0, choose a natural M>=1 with c*M^2>=4 (e.g. max(1,ceil(2/sqrt c))). Whenever x>=2^M,
  La=c*N1^2*log a >= c*M^2*E >=4E.
The choice M depends only on the fixed c, not i or epsilon or primes. This is a sufficient threshold, not an optimized one.

### Cloud-size conjunct
Use the stronger SizeDel conjunct 7, not the weaker conjunct 6:
  4*q*k^2*d <= G*B <= E*q*B.
Cancel q>0, then multiply by 4:
  4*Sc*k = 16*k^2*d <= 4E*B <= La*B.
Divide by k>0 to get exactly 4*Sc<=La*B/k. This avoids the incorrect substitution G=La and does not require comparing their full asymptotic expansions.

### Thin-window conjunct
From m>=1 and N>=0, N<=N*m^10<=d. Hence
  W>=k*Sc=4*k^2*d>=4N.
When N>=1 (a natural cast), 4N>=N+1. If N=0, SizeW gives W>=sqrt(exp(E))>1, so again W>=N+1. This argument uses no unverified integrality of d.

### Family uniformity and converse
Choose T=max(2^M,Fm.x1+1,2). Fm.sizes and Fm.L_x apply at every x>=T and every i. The foregoing pointwise proof gives the exact predicate uniformly. Conversely, if eventual TypePrimeSizeConds holds, FamCore.exists_pt at the claimed T gives a genuine i with x>=T and x>Fm.x1. Its Sc>0, B>0 and k>0 force La>0 from the cloud inequality. Since N1>=1 and log a>0, c>0. No vacuous tail, no requirement that every fibre be nonempty.

## Theorem 2: reduce the full admission obligation, preserving equivalence
Fix Fm,K,X,Y,C31,Ce,Cm before quantifying over delta. Let R_P be the conjunction of the following ten pinned predicates:
  adm1(C31), adm2, adm3, ArchimedeanSignatureMatching, adm6, adm7, adm8(Cm), adm9(Ce), unitBoundAtTwistedPlaces, admG1.
All are independent of A.delta by their displayed arguments in admitted. Write Eventual(R) := exists T>1, forall x>=T, forall i, R at the native instance.
Then at P:
  Pf.AdmFam(Fm,K,X,Y,C31,Ce,Cm) iff (K.La>0 AND Eventual(R_P)).
Forward: specialize delta=1, project the ten predicates and TypePrimeSizeConds, and apply Theorem 1's nonvacuous converse. Reverse: fix arbitrary delta>0. From RUN16/17's direct adm5 estimates, fixed c>0 and native SizesAt supply a uniform T5(delta). The estimates are log Qp<=38*cGE*ell^2*x^(e/8) for p<p0 and <=cGE*ell*x^(11e/24) for p<X'; La is between c*x^e and 2*c*cNE^2*ell^2*x^e for large x. With h=delta/4, log x=integral_1^x dt/t <= (x^h-1)/h <= x^h/h, sufficient thresholds are x^(delta/2)>=608*cGE/delta^2, x^(3delta/4)>=4*cGE/delta, x^(delta/2)>=32*c*cNE^2/delta^2, x^delta>=1/c, and x^(e/2)>=2/e. Choose the maximum with e-base exp(1), Fm.x1+1, the threshold of R_P and the TypePrimeSizeConds threshold from Theorem 1. Every native admission conjunct then holds at every x>=that maximum, every i, and the two strict prime ranges remain unchanged. This is a human derivation using source theorem statements, not an elaborated Lean proof.
For AdmF the existential C31>0, Ce>=0, Cm>=0 stays outside all thresholds. No claim that the ten residual predicates or positivity are already supplied by an actual native family. This is a reduction of proof obligations via explicit implication, not erasure of any source hypothesis.

## Upstream drift check
At H SmallOrderPrimes blob ad70c916f276a693ddd51cb9387c38ebaeb4ffb7 L224–236 and L241–245: TypePrimeSizeConds identical, but admitted drops adm2 and adm3. Theorem 2 holds separately at H with its eight residual conjuncts (not a proof of P from H).
H ElevenLe blob d50ba186f15218ca02e6325933f7a35280ec9ea8 L51,67–69,108,145–153,155,174–178: six corresponding definitions textually identical. H DataParams₂ blob 3d693d76e763b7b9d7c5679c223ac91cc92692 L69–81,188–190: six scale definitions identical and Sc fields unchanged. H IsResidueClassZero blob 0622fc3b6d32afcdece44b5bac2496fd8ab099a6 L75,81,87,96: four definitions identical. H UnramifiedQuadraticSetting blob 26de9f0d204e2e8f94a78c9154dea3a6b63e4936 L296–297: orbitWindowCount identical. H StarFam blob 7878557c8ff202e27b0351868ce2c98dee2c71e0 L91–94,110–146,147–188,189–196,197–200: six migrated blocks cGE,cNE,Gp_le,first_count_le_log,k_le_x_pow_six,one_le_k textually identical to P StarNum (trimmed outer whitespace). H ParConsts blob fc2f52e63147d43cf955a6d46e40c8ba4d975399 L78,89; FamCore blob 8896ac9d04495274664eafac6935ce3457655f6b L91–97,150–154; AdmFam blob 953add6ebe3b00d58e2ac3d9d9e41bd4f67bbdc8 L173–176: required fields and quantifier scopes preserved. No full upstream diff/kernel dependency replay.

## Exact executable finite regression (Node/V8)
The integer envelopes represent inequalities, not native D7 objects or a proof of asymptotics. The thin test includes zero N and a lower W>=2 proxy for W>1. The propositional test models already-established eventual suppliers, not pointwise truth tables of actual Lean predicates. Four negative witnesses address weakened cloud bound, c=0, empty fibre, and missing zero-N lower W.
```js
const counts={threshold:0,cloud:0,thin:0,logic:0,negative:0};
const ck=(ok,k)=>{if(!ok)throw Error(k);counts[k]++};
for(let a=1n;a<=12n;a++)for(let b=1n;b<=12n;b++){
  let M=1n;while(a*M*M<4n*b)M++;
  for(let N=M;N<=M+5n;N++)for(let E=1n;E<=6n;E++){
    const ell=1n+N, laNum=a*N*N*(E+ell);
    ck(a*N*N>=4n*b&&laNum>=4n*b*E,"threshold");
    for(let S=1n;S<=4n;S++)for(let k=1n;k<=4n;k++)for(let D=1n;D<=4n;D++){
      const sc=4n*k*D, G=E*S, B=(4n*S*k*k*D+G-1n)/G;
      ck(G<=E*S&&4n*S*k*k*D<=G*B&&4n*sc*k<=4n*E*B&&4n*sc*k*b<=laNum*B,"cloud");
    }
  }
}
for(let m=1n;m<=8n;m++)for(let k=1n;k<=8n;k++)for(let n=0n;n<=12n;n++)for(let u=0n;u<=5n;u++){
  const D=n*m**10n+u, w=4n*k*k*D>2n?4n*k*k*D:2n;
  ck(n<=D&&4n*n<=w&&n+1n<=w,"thin");
}
for(const n of [10,8])for(let mask=0;mask<(1<<n);mask++)for(const pos of [false,true]){
  const rest=mask===(1<<n)-1;
  const adm5=pos, type=pos;
  ck((rest&&adm5&&type)===(pos&&rest),"logic");
}
ck(4n*20n<=10n*8n&&4n*10n*5n>10n*8n&&4n*20n>4n*8n,"negative");
ck(0n*1n<4n*1n,"negative");
ck([].every(()=>false),"negative");
ck(1n>0n&&4n*0n<0n+1n,"negative");
console.log(counts);
```
Actual execution: {"threshold":5184,"cloud":331776,"thin":4992,"logic":2560,"negative":4}. 344512 positive assertions + 4 negative witness assertions. No CI or Lean kernel validation of this note.

## RESUME HERE
Authenticate the actual typed incoming caller of Pf.AdmFam/AdmF and the fixed GK.La supplier (root path or explicit nonreachability, not import-based inference). If unavailable, independently derive ArchimedeanSignatureMatching's rho/rhoB and two band sums using FamP.rho_le, exact CbLarge and integer-power counting; do not assume K.CN is large enough or replace strict guards. Audit Theorems 1–2 independently, including the c>0 necessity, strengthened SizeDel use, zero-N case and threshold quantifiers, and update integrated chapter if accepted.
HANDOFF TO audit, dependencies, kernel, integration, editor, prime_window. Project OPEN.
