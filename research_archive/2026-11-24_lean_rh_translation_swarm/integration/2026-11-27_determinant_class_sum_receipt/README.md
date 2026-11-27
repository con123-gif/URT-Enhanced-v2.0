# Determinant class sum — local kernel PASS

27 November 2026. The complete original statement of stdClassSum_det_modKernel_eq has now passed actual Lean 4.35.0 kernel compilation through the restricted standard/finite determinant route. **Both complete original statements have passed local kernel compilation and the four-root dependency audit. Reciprocal height and RH remain OPEN.**

Fix the original field, positive even rank \(m\) and weight tuple \(c\). One real \(C\), chosen before the entire admissible modulus/character family, gives
\[
  \gamma S(g)=1,\qquad \|\gamma\|^2=C/\Pi,
  \quad
  \Pi=\operatorname{lValueProd}
  (\mathfrak m.\mathrm{places},\alpha^{-1}\upsilon^{m/2},m/2).
\]
Here \(S\) is exactly the native \(K_f\) class sum with finite datum \(\chi(\det)\) and polynomial \(\prod_\tau\mathrm{letterMinor}_\tau^{c_\tau}\). The complete original declaration type is checked definitionally; no premise or quantitative condition is dropped.

The real-matching interface supplies one reference polynomial and a coefficient \(\kappa(x)\) that works for every equivariant functional at these fixed weights. The checked finite exchange supplies a common rapid \(x\), a common \(D\), and for every actual admissible member a nonzero \(b\) with \(\|b\|^2=D\Pi\). The two real-action laws connect these witnesses to the actual period. Real invariance and the finite tame determinant law turn its quotient integral into the original class sum. With the matched empty polynomial and the original character twist, the small side becomes the rank-zero Haar volume \(V_0\). Thus \(\kappa(x)S(g)=bV_0\). Take \(\gamma=\kappa(x)/(bV_0)\) and \(C=\|\kappa(x)\|^2/(D\|V_0\|^2)\). The source retains the exact nonzero-volume normalization; it never sets \(V_0=1\).

Accepted replay 11: **exit 0, 64.18 s**, both theorem axiom reports contain only propext, Classical.choice and Quot.sound, complete original-type comparison passed, and all three checked suppliers are consumed. [Exact source](../C2_DETERMINANT_CLASS_SUM.lean), [compiler receipt](determinant_class_sum_results.json), [compiler log](compile.log) and [input/command manifest](input_manifest.json). Source blob 67473a75e141e04e3bed87f97e57cb5979c7bce1; checked module SHA256 d843f574fe7e9714679d3f80bd4e55d88d8ae9abc05c23c2cc59caebea861644.

The [finite exchange](../C2_DETERMINANT_EXCHANGE.lean) already has a complete constructor-inclusive graph audit. The [explicit real interfaces](../C2_REAL_MATCHING_STANDARD.lean) passed their own minimal-import kernel replay and whole-environment target-absence guard. This new consumer has passed both its direct guards and its complete transitive old/new graph audit. Ten earlier failures are preserved under failed_attempt_1 through failed_attempt_10, with exact source, logs and rejected axiom reports.

The [CarrierXi transport](../C2_DETERMINANT_CARRIER_TRANSPORT.lean) has also passed: exit 0, 90.66 s, standard axioms only, complete original type preserved. Its proof body substitutes only the checked determinant supplier and retains run79_explicit_matching. [Exact Carrier receipt](../2026-11-27_determinant_carrier_receipt/). Source 5083aea866074ba1e52b025342752df605581c78; module SHA256 57f51647df44c31eebb6e9e04a1264e1eeceba15c556657db6e13210b753bf01.

The [four-root complete graph audit](../2026-11-27_determinant_carrier_graph_receipt/) passed all four independent verifiers and all 35 guards: 119,299 union declarations, 3,865,789 edges, zero missing endpoints. The determinant closure decreases from 119,088 to 119,078; general exchange and the original determinant suppliers are absent transitively. The Carrier closure grows from 119,213 to 119,250 and retains its separate nonzero-complement branch reaching general exchange. No global removal or C2 closure follows. Next: reconcile the rank-two consumer in New/Selmer/ValueFamilies with its integral-measure and L-value ratio inputs, and independently replay the exact new chain on the shared compute host.
