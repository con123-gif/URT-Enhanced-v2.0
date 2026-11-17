# Q161ay — native Q101 ground-orbit covariance split by original six-history readout

**Result:** THEOREM; CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.

Original Q101 operators are the golden-coordinate icosahedron, its 20×12 face incidence C, the rank-eight projector Pl, and the 30 frustrated words (sum s=4; edge sum=-6). The source is f_s=(C Pl s)^{⊙2}. The original Q161ac six-axis history readout B has B_{if}=8/225 when face f meets antipodal vertex axis i, zero otherwise; each row has ten entries. Its exact Gram is BBᵀ=(128/16875)I₆+(256/50625)J₆. Let Σ=E[(f−μ)(f−μ)ᵀ] from the original 30 states, Π=Bᵀ(BBᵀ)⁻¹B, H=I−Π.

The exact projected covariance is **BΣBᵀ=(47104/6328125)(I₆−J₆/6)**. Thus its eigenvalues are 47104/6328125 (multiplicity five) and zero (multiplicity one). The original face-source covariance has total trace 416/25. Its visible component has trace Tr(ΠΣ)=368/75 and its invisible component has trace Tr(HΣ)=176/15; rank(HΣH)=11, although dim ker B=14. The 14-dimensional invisible *space* is not the same as the 11-dimensional excited covariance support.

**Proof:** The certificate constructs all original 30 frustrated words and their exact face sources, computes Σ over rationals and √5, constructs B directly from original antipodal axis-face incidence, and asserts all identities with SymPy. The six-axis covariance is proportional to the standard A5 permutation fiveplet projector, with the constant channel absent because Σ1=0. Orthogonality ΠH=0 proves the trace split. No measured values, ARF coefficients, or fitted inputs enter.

**Execution:** Standalone original-operator SymPy calculation executed locally, exit 0, 2026-11-17. CI must execute the committed certificate separately; no physical Ward covariance is inferred from this projection.

**Limit:** This is a source-geometry covariance diagnostic, not a derived five-solid/190-cochain/H64/24-clock charged action. Q96 Ward covariance and physical mass/coupling normalization remain open.

**Next concrete question:** Construct the original Q96 charged source action on the eleven excited HΣH directions and test [Q96 charge generators, source coupling]=0 with the native 24-clock transport, without introducing a new mass insertion.
