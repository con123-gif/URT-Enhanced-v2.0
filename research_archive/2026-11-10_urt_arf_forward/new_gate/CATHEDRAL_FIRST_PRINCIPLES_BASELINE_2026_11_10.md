# Whole-Cathedral baseline: exact 640-dimensional kernel and nonuniqueness theorem

10 November 2026. Original first-principles diagnostic; no fitting or historical ARF targets.

The five Platonic cellular spheres have (V,E,F)=(4,6,4),(8,12,6),(6,12,8),(20,30,12),(12,30,20). Direct sum cochains have dimensions (50,90,50). Rank d0=45, rank d1=45, so Hodge–Dirac D has dim ker D=190−2(45+45)=10 (one H0 and one H2 per sphere).

Let Q[h,2h mod64]=Q[h,(2h+1) mod64]=1/2, and S the 24-state cyclic shift. On H=C^190⊗C^64⊗C^24⊗C^64 define the stacked Bx=((D⊗I)x,(I⊗(I−Q)⊗I)x,(I⊗I⊗(I−S)⊗I)x), with identities on other factors. Then L=B†B is positive and T=(I+L)^−1 is a positive contraction. Since Q^6=J/64, ker(I−Q)=span(1); similarly ker(I−S)=span(1). Consequently ker L=ker D⊗ker(I−Q)⊗ker(I−S)⊗C^64, with exact dimension 10×1×1×64=640. Total dimension is 18,677,760. This is a formal tensor construction; no dense 18-million-dimensional matrix is built.

**Nonuniqueness:** Positivity and the specified factor symmetries do not select T uniquely. For any c>0, (I+cL)^−1 has those properties, but different nontrivial spectra. The unit coefficient above is a declared convention, not a derived physical parameter. Moreover the 64 matter states remain dynamically uncoupled, so this baseline predicts no physical masses or ARFs.

The complete Cathedral still requires derived D6→H3 intertwining, native five-solid history pullback, hidden 4_3/4_5 source interaction, 24-clock gauge Ward-complete coupling and H13⊕H51 charged-matter vertex. They are not silently replaced by the tensor product.

Independent NumPy assertions checked all cochain dimensions and Euler identities, rank(Q)=32, rank(I−Q)=63, Q^6=J/64, rank(I−S)=23, and the exact kernel count. No third-party Yang–Mills material.
