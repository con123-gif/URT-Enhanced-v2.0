# Native word symmetry: exact obstruction to common irreducible orbit shortcut
25 November 2026. Human exact finite-dimensional result applied to the native operators under their existing positivity and high-redundancy premises. No native Lean replay, no RH closure. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005. Continues 7284c64ada6e268825e9167bd8d1f2ff432e1f13. Current mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc and peers a987e3f9, 6821df81 inspected.

## What the real source actually says
DataS.lean 05d6c08d180bf9804c8cf33b5873fc0c43e93bb4 defines letter : Word -> Fin(k-2) -> Bool and letter_inj, not a group law or transitive action. u_letter changes a highest-weight coordinate by Del when its letter changes. StandingNumericalData.lean (pinned source retrieved) explicitly requires u != v -> uS(D,u,tau) != uS(D,v,tau) at every tau. The actual word column types therefore have distinct highest weights (in the native chamber). RelevantZeroGramTerms.lean d008b93b66125f83b7adb112628b058dde3b1096 defines IsColsType using a word-specific real frame and IsHCTypeU, and
  c0(u)=volN(u)*volH(u)/dimPi(u),
  Kmat(u,v)=(c0(u)c0(v))^(-1/2)*Pu(u)^* Pu(v),
  PiU(u)=orthogonal projection onto ramCu(D,u).
RhoDetPrimeEqMuTildeMulChiPow.lean 6ab57a7f313a9f8c351005051933a60a22a0da08: s_HH identifies the ambient dimension with Dall; s_Cu identifies each column dimension with duS. AdmissibleBoundsFromSource.lean 1caea89b8fb520994d0250597e3e6ec76147506e defines Q0(Ws,Pi), with arbitrary finite word subset Ws and source/target compressions, plus Conclusion1. It requires Kpp(u,v)=0 for distinct words, NOT Kmat(u,v)=0. Its off-diagonal estimate is an upper bound on the remaining Kmat. LinkSPos.lean 2d432770f9789b2d8fce517648366d7f0184c885 and ThmSOwn.lean a38627e2c6d69c1a56c31507dd3981dda2597e7a trace the four actual diagonal/off-diagonal estimates to Kloosterman/row and automorphic counting producers.
Thus injective binary coding does not provide an action commuting with the actual Q0. Local irreducibility at each word-specific frame is not a common irreducible action on HH.

## Native Gram rank obstruction (exact proof)
Fix one actual host and finite Ws, all c0(u)>0 as needed for normalization. Put A_u=Pu(u)/sqrt(c0(u)), d_u=dim Cu(u), R=sum d_u, D=dim HH=Dall. On the direct sum E=oplus Cu(u) let A be the concatenated map, K=A^*A, Q=AA^*. Then K_uv is exactly the native Kmat, and rank K<=D. For R>D, at least R-D eigenvalues of K vanish. Hence
  ||K-I_E||_HS^2 >= R-D.
By the exact block decomposition, with Ediag=sum_u ||K_uu-I||_HS^2 and Off=sum_{u!=v} ||K_uv||_HS^2,
  Ediag+Off >= max(0,R-D).
In particular, if the native aggregate diagonal error is <=e R, then
  Off >= max(0,(1-e)R-D).                  [1]
The diagonal estimate used by the native frame reduction has e=eF or a directly retained aggregate diagonal budget; the conclusion applies wherever that budget is established. At native high redundancy (sg=Dstar/R <=1/100, Dall/Dstar<=2), D/R<=1/50. For e<=1/4, [1] forces Off>=0.73 R. This is a theorem on the actual normalized word kernels, not numerical surrogate evidence. No individual pair is asserted nonzero, only the total.

Stronger exact identity. Write z=sum_u tr(K_uu-I), S=tr Q=R+z. The nonzero spectra of K and Q coincide, so
  D ||Q-(S/D)I||_HS^2
      = D(Off+R+2z+Ediag)-(R+z)^2.        [2]
In particular Off >= (R+z)^2/D-R-2z-Ediag (ordinary Welch bound with actual signed diagonal correction). Equality holds precisely when Q=(S/D)I, D>0. Unlike replacing the word data by a symmetric model, [2] keeps the exact native Pu and c0. The lower bound shows why the off-diagonal energy is necessarily large even in the ideal tight-frame limit. Spectral uniformity requires balance of the off-diagonal energy, not its vanishing.

For a common compact-group action on HH and equivariant A_u from pairwise inequivalent irreducible Cu(u), the intertwiner A_u^* A_v is zero for u!=v by Schur. (Same conclusion for isotypic source blocks supported on disjoint types.) In the above high-redundancy, low-diagonal-defect regime this is impossible by [1]. Thus a proposed proof which simply identifies all the distinct native word types with equivariant maps for one common compact action preserving those types cannot work. It does NOT rule out a more subtle action mixing types or a different source-matched symmetry. Nor does it show Q is not scalar: redundant tight frames have nonzero overlaps.

## Actual next issue
The nondegenerate kernel terms left after exact Kpp cancellation must produce the near-Welch balance in [2]; this is where the true TheoremSSelected/row main and non-generic estimates matter. It is not sufficient to average over a fictitious full hypercube or independently twirl Q: that changes the actual maps used in the lattice-slope argument. Preserve the original four clauses and all same-host data. The exact identity [2] gives a useful audit target for proposed shorter kernel proofs: bound its signed excess on the actual selected Ws, without claiming the equality or the required asymptotic upper estimate has been proved.

Verification: actual pinned source definitions retrieved (DataS, StandingNumericalData, RelevantZeroGramTerms, RhoDetPrime..., AdmissibleBoundsFromSource, LinkSPos, ThmSOwn, RowsPos); exact algebraic proof above. No new numeric evidence, no claim of native matrix computation, no Lean compilation. This is a negative result for the obvious exact-symmetry shortcut and a positive necessary identity, not an RH breakthrough. Preserve the existing argument.
RESUME HERE: follow TheoremSSelected to the actual nondegenerate pair sums and determine if their signed excess over the Welch baseline can be bounded by a direct arithmetic identity; do not assume common equivariance or discard the native kernel estimates. HANDOFF TO theta, geometry, formal audit, integration/editor.
