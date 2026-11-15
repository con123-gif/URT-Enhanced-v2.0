# Q125a — Exact native all-five hidden-source to genuine Q96 charged coherent operator

Date 2026-11-15. CONDITIONAL PHYSICAL IDENTIFICATION. No old Q77 selected-history clock, no old ARF targets, no fitted constants.

The original Q101 all-five Platonic 190-cochain/50→8→12/H64 source is run and the actual hidden C, P3, P5, W and Pl are reused. Q124's original 444 excited golden-reversal configurations and 1032 shortest SU2/Q96 unitary charged links are also rerun, as is the actual v61 original 192/528 Wilson.

For each original spin configuration x, take f_x=(C Pl s_x) elementwise squared and h3=P3 f, h5=P5 f. The actual hidden W obeys P3 W P5 + P5 W P3 = W. Therefore the canonical antisymmetrized source current is exactly J_xy = [h3_x^T W h5_y - h3_y^T W h5_x]/2 = f_x^T W f_y/2.

Exact exhaustive Q(sqrt5) arithmetic over all 1032 genuine one-spin links (not rounded floating bins):
- J=+8sqrt5/5 on 240 links; J=-8sqrt5/5 on 240.
- J=+(4+12sqrt5/5) on 120; J=-(4+12sqrt5/5) on 120.
- J=0 on 240 outer-contact links and all 72 central-contact reversal links.
Hence 720 nonzero genuine chiral source links and exactly two absolute nonzero strengths with ratio (3+sqrt5)/2 = phi^2. Squared sum over links is exactly 16896+4608sqrt5.

Construct an actual 42624-dimensional *block sparse* charged Weyl operator using Q124's existing three-generation plus conjugate Q96 connection: Hch_xy=i J_xy U96_xy for real native edges, and zero elsewhere. Because J is real antisymmetric and U96_yx=U96_xy†, Hch is Hermitian. Exact source-native Q96 Ward transport gives Q_x U96_xy=U96_xy Q_y, hence Hch commutes with the global physical charge matrix. Its exact source-defined spectral second moment is Tr(Hch^2)=192(16896+4608sqrt5)=3244032+884736sqrt5. The Python certificate verifies ALL 1032 original charged links, and the exact link-current distribution in Q(sqrt5), not synthetic matrices.

To join the original 528 real-space Wilson gauge links without pretending its 48 sites are icosahedral nodes, define the **conditional** 444×96×192 Hermitian family:
Hjoin(A;k) = k Hch⊗I192 + directsum_x sum_q P_x(q)⊗h_v61(q A).
The original statewise Q96 charge projectors transport across all edges: P_x(q) U_xy=U_xy P_y(q). Therefore BOTH pieces commute at every spatial gauge A. Under 48-site gauge transformation omega, the full operator is gauge conjugated by directsum_x sum_q P_x(q)⊗exp(iq omega). Its first and second gauge Ward identities follow exactly and all 528 links enter the original Wilson. The certificate independently runs the untouched native v61 192 Wilson and checks gauge conjugation plus the first/second gradient derivatives for all seven original charge values. The full matrix is represented exactly as sparse blocks; no fabricated gigantic operator.

This closes a concrete coherent *hidden source -> charged Q96 -> native 192/528 Wilson* mathematical interface for this chosen action, beyond Q124's purely heat-bath charge transport. It does NOT derive the Q125 full physical solution. The minimum-norm Q101 50→8→12 source chart and Q105/Q124 SU2 shortest transport are specified earlier model choices. The overall relative kinetic k, selection of the actual 24-dynamics/time, the proper coherent-dissipative combination, physical orientation selection, a stable 528-link gauge vacuum, continuum 4D photon residue, physical alpha and fermion mass ARFs remain open. The zero source amplitude on all 72 central flips means the prior Q124 *dissipative* path is needed for reversal in this defined model.

Run the original-source registered certificate:
python research_archive/2026-11-15_q125_native_hidden_charged_join/Q125_NATIVE_WEDGE_CHARGED_COUPLING.py

The independent local exact all-444, 1032-source-current and 1032-Q16 Ward script exited 0. Native Q101/Q124/actual v61 GitHub CI is separate and must pass before being labelled CI-verified. Do not substitute a synthetic Wilson, selected Q77 history or measured values.
