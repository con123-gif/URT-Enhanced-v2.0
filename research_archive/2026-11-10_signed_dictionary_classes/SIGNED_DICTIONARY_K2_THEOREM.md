# Q12 — Signed six-axis dictionary classification and exact native K₂ spectra

**2026-11-10 · GPT · Gate A · OBSTRUCTION · CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING**

## Hypotheses and operator provenance

Use the exact icosahedral face-source output of the archived five-Platonic 50→8→12 portal, reconstructed by \`research_archive/2026-11-10_signed_a5_covariance/signed_a5_covariance.py\` (Q11): the 20-face hidden \`P5\`, five rank-one A4 normalizer lines \`v_i\`, and the six signed antipodal icosahedral axes. The time transfer is the **fixed** 64-state de Bruijn URT \`Q[h,2h]=Q[h,2h+1]=1/2\`, with \`Q^6=J/64\`. The signed dictionary \`D=(2a_i+s_i)_{i=0}^5\` assigns one of six axes and one endpoint sign to each successive URT bit. The original π/φ/e scale-phase dynamics, 190-cochain source, 24-clock and charged H13⊕H51/Wilson observable map remain separate: this certificate **does not derive or identify them**.

## Theorem and exact certificate

1. There are \`6!·2^6 = 46080\` signed dictionaries. Proper A5 acts freely by the induced signed permutations on the six axes, so there are exactly **768 A5 orbits of 60**. Simultaneous central inversion of all six endpoints commutes with proper A5 but is not itself a proper rotation; it pairs the 768 classes into **384**.
2. For each A5 class take the lexicographically least dictionary and evaluate the **five-vacuum normalized K₂ multiset** with the *original fixed Q*. Joint source/vacuum covariance proves the multiset is independent of which dictionary in the same A5 orbit is chosen, even though \`[Q,T_g] ≠ 0\` for nonidentity proper rotations. Indeed, if \`D'=T_g∘D\`, the native source line at the same time index satisfies \`v_{π_g(i)}(D'h)=c_i v_i(Dh)\`, and the line norm satisfies \`r²_{π_g(i)}=c_i² r²_i\`. Hence all time correlations, and K₂, agree after vacuum permutation without conjugating Q.
3. Exact enumeration gives **56 distinct K₂ multisets** among the 768 proper-A5 classes. Precisely **16 spectra occur in eight A5 classes each**, and **40 occur in sixteen classes each** (16·8+40·16=768). Global inversion preserves the quartic source pointwise; consequently the 384 A5×inversion classes still have 56 distinct K₂ multisets (multiplicities four or eight). There are collisions beyond inversion: \`D=(0,2,4,6,8,10)\` and \`D'=(0,2,5,6,9,11)\` are in different A5 and central-inversion classes but share \`(5/6,25/24,67/48,33/16,33/16)\`.
4. The source lines have entries in \`Q(√5)\` with denominators dividing 60. With \`g_h=(a_h+b_h√5)/60\`, the exact \`Q^6\` formula evaluates the variance using integer pairs: \`K₂=[⟨g,g⟩+2∑_{d=1}^5⟨g,Q^d g⟩]/r²\`. The irrational coefficient vanishes in all 768 representative calculations. The certificate independently checks the optimized integer expression against Q11's separate exact Q-iteration for 25 nontrivial cases and checks 300 transported vacuum-line identities.

**Status and limitation.** This is an exact classification of the specified finite native hidden-5 **source** K₂ response, not a selection of one physical dictionary. It does not establish an ARF, photon residue, charged Ward-complete observable or a unique source-to-matter map. No measured or historical ARF value enters the calculation.

**Reproduce:** \`python research_archive/2026-11-10_signed_dictionary_classes/signed_dictionary_classes.py\`. Local GPT execution: Python 3.13.5, SymPy 1.14.0, NetworkX 3.6.1, 2026-11-10, exit 0, ~3.6 s. The script is fail-on-error. GitHub CI remains pending until its next orchestrator verdict.

**Next concrete question (Q14):** For the displayed non-parity-colliding dictionary pair, calculate the exact five-vacuum **third-cumulant** multisets using the archived Q6 tilted-transfer/Poisson recursion. Does K₃ distinguish the K₂ collision without introducing a free coefficient?
