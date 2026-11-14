# Q115 — All 64 original history states reduce to four possible hidden-source poles

**14 November 2026. Exact finite A5 representation theorem + original-source certificate. No physical ARF claimed.** Source operator Q112 uses Q77 original selected six-bit golden 24-clock and Q82 original icosahedral hidden P5. Historic ARF weights/values were not imported.

## Independent geometric result actually executed

The exact 12-vertex icosahedral graph has six antipodal vertex pairs; a 64-history state chooses one endpoint from each pair. All 120 graph automorphisms were independently enumerated in a local Python/networkx test. The 60 proper rotations are exactly: identity (1 element), half-turns (15), third-turns (20), fifth-turns (24). The number of fixed 64-history configurations is respectively

    χ_H(1)=64, χ_H(C2)=16, χ_H(C3)=4, χ_H(C5A)=χ_H(C5B)=4.

The A5 irreducible characters (1,3,3',4,5) imply by orthogonality the **exact representation decomposition for this 64-history action**

    **H_64 ≅ 8·1 ⊕ 0·3 ⊕ 0·3' ⊕ 4·4 ⊕ 8·5**.

Proof: m_1=(64+15·16+20·4+24·4)/60=8; m_4=(4·64+20·4−24·4)/60=4; m_5=(5·64+15·16−20·4)/60=8. For m_3 and m_3', χ(2)=-1, χ(3)=0 and the characters at the two order-5 classes are conjugate (φ and 1−φ), whose sum is one; each class has 12 elements with four fixed histories. Hence m_3=m_3'=(3·64−15·16+12·4)/60=0. Dimension: 8+16+40=64. Local original icosahedral automorphism enumeration and independent exact Q114 20-face distance projector P5 both PASSED.

This statement concerns the **six-antipodal-choice history A5 representation**, NOT any generic A5 representation of the separate 13/51 physical carrier. In particular it would be wrong to infer that the original H13 has no triplets: the two are not yet proven identical A5 modules.

## Q112/Q114 independent bridge crosscheck

Re-run the full original Q112: selected Q77 88-piece clock Krawczyk enclosures, native 60 A5 permutations of the 64 histories, original 20x12 face–vertex incidence, original face hidden P5 and G5=U_h P5 U_h^T. Reconstruct **P5(f,g) from dual graph distance only**:

    d=0 or 5: +1/5
    d=1 or 4: −2/15
    d=2 or 3: +1/30.

This exactly reproduces original Q112 P5 and therefore its exact rational G5. The Q112 nonzero golden clock offblock rigorous enclosure still applies; replacing the incidence projector with the distance kernel cannot erase it. No floating-point assumption enters this crosscheck.

## Stronger exact source theorem — FOUR poles maximum

Let P=G5 be one original hidden A5 quartet inside the 64 histories, and let K(c)=Hbits+c Abar be Q112's actual selected/A5-twirled 24-clock conditional operator, c>0. The original Hbits preserves P with eigenvalue 16, and both Hbits and Abar commute with the genuine original 60-element A5 action. The A5 character decomposition proves the entire *four-isotypic* space has dimension 4×4=16. P lies in it.

By Schur, PAP=aP exactly, where a=Tr(PA)/4. In particular Q113's within-source variance term is rigorously **zero**, rather than merely numerically ≈6.7×10^-16. Its source spectral measure

    ν_c(dλ)=(1/4)Tr[P E_{K(c)}(dλ)]

has at most **four distinct spectral energies**, each corresponding to a fourfold A5-degenerate source pole:

    ν_c = Σ_{j=1}^r w_j(c) δ_{λ_j(c)},    r≤4,
    w_j≥0, Σw_j=1.

No source weight outside the four-isotypic 16-dimensional block can appear. This is a stringent compression from the 64×64 source spectrum. The exact variance now simplifies to

    **Var(ν_c)= c² ||(I−P)A P||²_F /4 > 0   (c>0),**

using Q112's rigorous nonzero offblock witness. Consequently there are at least **two** positive-residue poles at every c>0. The exact pole count can be less than four at exceptional c; “at most four” is the unconditional theorem.

## Explicit original 4×4 source resolvent, not a fitted polynomial

The certificate constructs central A5 projectors by exact character averaging on the original 60 history permutations: P1 rank 8, P4 rank16, P5 rank40, P1+P4+P5=I. It verifies P⊂P4, Abar/Hbits invariance, and PAP=aP. Then it performs a four-column **A5-equivariant block Lanczos** iteration using K(c) and original P. Every inner block is forced to be a scalar multiple of I4 (Schur), producing an actual symmetric **4×4 multiplicity matrix M4(c)**. It checks numerically on original data:

    K(c) Q = Q [M4(c)⊗I4],
    Q Qᵀ = P4,
    ν_c(dλ)=<e1,E_{M4(c)}(dλ)e1>.

The four possible pole energies are spec M4(c); their **native nonnegative residues** are |(u_j)_1|². These residues replace assumptions about historic (4,2,2,0) weights; they are not tuned to any old fine-structure/fermion-mass targets. The certificate tests several c values as internal controls only.

**Critical caveat:** some c could make the block Krylov subspace lower than 16-dimensional; the scoped exactly-four-block numerical regression in the certificate explicitly asserts cyclicity at c=.1,1,2. If original numerical data violate it, a smaller Krylov dimension is the correct result and the test must be corrected without weakening the theorem.

## Physical status

A complete *original conditional* source-channel resolvent is now 4×4 rather than 64×64, but the primitive full moving Cathedral 190-cochain/50-vertex/24-clock positive transfer has NOT uniquely selected the clock strength c, the real-spacetime joined gauge action, the physical ARF observables or the relation between this history A5 representation and the separate physical H13⊕H51 carrier. This does NOT derive any physical alpha, mass, charge or mixing angle. Q111's seven-unit topological Berry bundle and native Wilson fractional charges also remain unjoined with this history module.

**Next mathematical decision:** derive the actual c and physical current-source observable from the primitive positive transfer, calculate the small 4×4 Schur resolvent and simultaneously use the genuine broken-charge Q106/v61 action. Do not reverse-engineer historic ARFs.
