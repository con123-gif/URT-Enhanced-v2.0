# RUN77 — exact polarized Heisenberg comparison for the identity-only Siegel–Weil route

Date 2026-11-27. Status: human algebraic derivation, independent audit requested, no new Lean replay. This addresses the remaining model-comparison guard in the latest ONE_EQUATION_MISSION (read blob c960cfc62fc12f5c44f9327d0cd5507ab386c7ea), not a claim of complete human RH. Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

## 0. Allocation and prior work

Read binding allocation and completion-first amendments, HUMAN_PROOF_COMPACT, SWARM_PROTOCOL, AGENTS, HANDOFF_QUEUE, research state/log/protocol and continuity rules. Previous RUN76 resume was the level-N named last-column gauge and conjugated split action. Those already have peer derivations (theta_lifts/RUN62_COMPACT_LEVEL_DATUM_PHASE_AND_RESTRICTION.lean, prime_window/COMPACT_RUN64_LEVEL_CHARACTER_GAUGE.lean, kernel_extractor/compact/RUN48_LEVEL_CHARACTER_STANDARD_GAUGE.lean; search located the exact supplier names); do not count a duplicate as new closure. Inspected native TwistedHeckeType.lean 31–135 and LocalStatement.lean 285–308. Pivot to actual open B guard in mission; no lane synchronization required.

Source anchors (all compact, at the pin above):
- Lib/Adelic/Adeles/AdditiveCharDefs.lean, blob 728f522d61a606eb68ec5ed337cf1dbc2c515463, definitions of stdAddChar and finite character.
- Lib/Weil/Construction/AdelicHeisenberg.lean, blob 6d56fe0aa1762a56778d40f9086f69e721f91b14, 18–24, adelicHeis.
- Lib/Weil/Periods/BesselIntegral.lean, blob b7eb71106debb76e1b97526f7c540b7d4d28bed8, 33–35, homBicharacter_eq.
- Lib/Weil/MixedModel/ZeroTerm.lean, blob e26a6037c53efb630f1dd8cf959aef3e0855fc5d, 99–115, 201–206, frame Gram and radicalElt.
- Lib/Weil/DualPair/PairSplitting.lean, blob 7060d2715dc64318e5f657357bce32c32bf11772, onHom, vecAtPoint_hom, sourceTerm_eq_mixedTerm, hasSum_theta_sourceTerm, sourceTerm_varrho, sourceTerm_levi, sourceTerm_radicalElt.
- Yifeng Liu, Arithmetic theta lifting and L-derivatives for unitary groups, I, Algebra & Number Theory 5 (2011), 856–859, section 2A, Theorem 2.1(1). https://msp.org/ant/2011/5-7/ant-v5-n7-p.pdf . Inspected the four page images. The explicit unipotent, Levi, Fourier and target actions are the comparison data; the global equality is invoked only under m>2p, with coherent rational target and probability quotient measure.

## 1. Exact additive character including finite places

Let E/F be the native CM extension, tau complex conjugation, j in E^× with bar(j)=-j, and psi_F the global additive character negative at infinity and positive on a rational approximation to the finite part: psi_F(u)=exp(-2 pi i sum_real u_v) exp(2 pi i Tr_F/Q a) where u_f-a belongs to the integral finite adeles. Existence of a by additive strong approximation; independent of choice since trace of an algebraic integer is integral. This character is nontrivial and trivial on diagonal F.

For t in A_E, choose c in E approximating its finite part modulo integral finite adeles. The finite part of Tr_E/F(t-c) is integral, since trace preserves local integral rings, also at split places. Trace transitivity gives the same positive exponential as in the native definition. At infinity each complex place contributes 2 Re(t). Thus exactly

    stdAddChar_E(t) = psi_F(Tr_E/F t).

No self-dual measure or archimedean sign is being guessed here. Liu allows a nontrivial global additive character in section 2A.

## 2. Rational polarization and the factor -2j

Let S be the completely split hermitian source of rank 2p with rational hyperbolic frame (K,L), K* J_S K=L* J_S L=0 and K* J_S L=L* J_S K=I. Target T of rank m has rational hermitian Gram H=J_T. The case p=0 is immediate (singleton polarization); take p>0 below. Write a native rational Hom matrix X in that frame as (A,B)=(X K,X L), with X,Y arbitrary adelic points for character identities. The adjoint formula and cyclic trace give

    tr(Y^dagger X) = tr(B_Y* H A_X + A_Y* H B_X).

Set Q=diag(I,-2j I), and use new row coordinates

    (a,b)=(A,-2j B),       g'=Q^-1 g Q

where g on the right is the source matrix in frame (K,L). Indeed Q* [[0,I],[I,0]] Q=(-2j) J0 with J0=[[0,I],[-I,0]], so conjugation identifies the unitary groups and sends the parabolic preserving K to the upper parabolic. The dual action is exactly (a,b) -> h (a,b) g'^-1, as follows by multiplying X on the left and right. All maps are rational and invertible. In particular the first coordinate a=X K, its rational lattice Mat_(m,p)(E), and its zero are unchanged.

Define the symmetric F-bilinear pairing on the two matrix copies

    q(a,b) = (1/2) Tr_E/F tr(b* H a).

Nondegeneracy follows from that of H and of the field trace pairing. The native alternating form is

    Omega(X,Y) = Tr_E/F [j tr(Y^dagger X)]
               = q(a_X,b_Y)-q(a_Y,b_X).

To check: b_Y*=2j B_Y*, b_X=-2j B_X, and Tr_E/F(j tr(A_Y* H B_X)) = -Tr_E/F(j tr(B_X* H A_Y)) by conjugation. Consequently the native bicharacter is exactly psi_F(Omega(X,Y)/2), not psi_F(Omega(X,Y)).

This row-dual identification is also checked directly against the explicit classical Schrödinger formulas below, avoiding a convention-dependent assertion about which argument of the skew-hermitian tensor form is linear.

## 3. Actual mixed-model Heisenberg action

Let Jf(a)=theta_0(sourceTerm(T.x^-1 a) f), the comparison map used in the mission. In native coordinates the Hom point is T.x^-1 X S.x, and the frame columns are S.x^-1 K,S.x^-1 L, so multiplying gives T.x^-1 A,T.x^-1 B. The target metric conversion (T.x)^* H T.x=stdForm_T converts the native standard-form trace to H. The remaining complement is zero for this split source, so its Heisenberg translation is the identity. Substitute the exact sourceTerm_varrho formula and the character identity of section 1. For y of rational-frame coordinates (a0,b0),

    J(rho(y)f)(a) =
      psi_F(q(a,b0) + q(a0,b0)/2) Jf(a+a0).

Denote this Weyl operator W(a0,b0). Multiplying two such operators yields

    W(a,b) W(c,d)
      = psi_F((q(a,d)-q(c,b))/2) W(a+c,b+d).

The phase agrees with section 2 for every adelic vector. No truncation, omitted character phase, or restriction to rational adelic points.

## 4. Three explicit generator checks (and target)

These checks identify the classical symplectic action with the native one rather than relying on names of forms or a choice of tensor convention. On Schwartz functions let M_C multiply by psi_F(tr(C a* H a)/2), C=C*, let D_U f(a)=f(aU), and let Fourier Fq have kernel psi_F(q(a,y)) and the self-dual measure (constant character and determinant multipliers do not affect conjugation). Liu pp.858–859 gives these actions, with the indicated scalar factors on D_U and Fq; use the matrix trace contraction in his Fourier pairing. The self-dual measure gives unitary Fourier on L2.

- For n(C)=[[I,C],[0,I]], M_C W(a0,b0) M_C^-1 = W(a0,b0-a0 C). Expand (a+a0)*H(a+a0); trace of the cross term is 2 q(a,a0 C), and the constant term is q(a0,a0 C). This is precisely right multiplication of (a0,b0) by n(C)^-1. As an extra independent sign check, native radicalElt(0,z) in frame (K,L) is [[I,-j^-1 z],[0,I]], z=z*. Conjugation by Q gives n(2z). The native sourceTerm_radicalElt phase is stdAddChar_E(tr(z a*H a)/2) = psi_F(tr(z a*H a)), since the matrix trace is fixed by tau. Liu's moment matrix is a*H a/2 and C=2z, hence the same phase.
- For m(U)=diag(U,U^{*-1}), D_U W(a0,b0) D_U^-1 = W(a0 U^-1,b0 U*), by trace cyclicity. This is right multiplication by m(U)^-1. Conjugation by Q leaves the native Levi unchanged. The native sourceTerm_levi uses a -> h^-1 a U, as expected; no claim that scalar Levi multipliers match on arbitrary nonrational elements is needed.
- For w=J0, Fq W(a0,b0) Fq^-1 = W(b0,-a0). Indeed use translation invariance and substitute t=y+a0 in the Fourier integral; the phase becomes q(a+b0,t)-q(a,a0)-q(a0,b0)/2. This is the action of w^-1 on the row. This checks the plus Fourier sign. If one writes an opposite Fourier convention the group element must be correspondingly inverted; it is not permissible to flip just the modulation.
- For target h, pullback f(a)->f(h^-1 a) conjugates W(a0,b0) to W(h a0,h b0) because h*Hh=H. The native target action in the mission has exactly that pullback.

Liu p.857 states the source rational unitary group is generated by its parabolic and w. Thus the explicit classical operators implement the same rational symplectic covariance as native rho after J. The checks are independent of a choice of rational basis ordering or splitting character scalar. In particular any classical global splitting character satisfying the standard restriction is eligible for the rational-phase argument, not an arbitrary incompatible central character.

## 5. Exact handoff to identity-only comparison

On the Hilbert completion from the mission, provided its bounded J, irreducibility and adapted vacuum hypotheses hold, both native and transported classical rational operators implement the same automorphisms of W. Schur's lemma for the irreducible Heisenberg representation makes their ratio a scalar. Use native and classical rational theta invariance on the common Schwartz domain, and the mission's nonzero theta vacuum, to force that scalar to 1 on each rational source element. Section 2 shows the rational sum and zero evaluation use exactly the same a, not a rescaled lattice. Section 4 identifies the target pullback. The conditional identity-only Siegel–Weil shortcut now has its explicit polarization and central-character calculation, for independent audit at OneVector and SharpData. Apply Liu Theorem 2.1(1) only with m>2p and coherent target, and convert the probability Haar measure to the native quotient mass. Keep both previous absolute-convergence bounds. Do not infer any identity for arbitrary nonrational source elements, a full Banach norm comparison, or the deletion of any formal dependency.

## 6. Method and limitations

URT-inspired search: isolate a single shared rational scaling of the second polarized block and reuse the common trace pairing instead of separately matching every Weil multiplier. Validation is conventional exact field/matrix algebra and the displayed generator calculations. Rejected candidates: b=jB (factor-of-two mismatch), b=+2jB with unchanged classical plus-Fourier/unipotent convention (sign mismatch), character equality inferred only from infinity (finite trace omitted), and replacing rational matrix sums by a transformed integral lattice. No harmonic approximation or complexity/speedup claim. This run performed source and literature reads and the human derivation, not Lean replay or executable theorem verification. No new kernel-verified closures. External formal certification is distinct from the incomplete human reconstruction.

RESUME HERE: independent audit of the Fourier pairing and frame metric conversion against PairSplitting, then insert this calculation into the mission's identity-only convergence and rational-phase argument at OneVector/SharpData, retaining all analytic and global splitting premises. Do not repeat already sufficient level-N or central-equivariance work. Preserve schedules and protected files.
