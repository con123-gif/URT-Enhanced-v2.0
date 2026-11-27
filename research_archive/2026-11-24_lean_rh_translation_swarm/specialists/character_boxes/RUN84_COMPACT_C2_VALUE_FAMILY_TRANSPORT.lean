import New.Selmer.ValueFamilies
import C2DeterminantClassSum
import Lean

/-!
RUN84 — actual rank-two integral-measure and p-adic family caller attachment.
27 November 2026. PREPARED; native replay outstanding.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
New/Selmer/ValueFamilies.lean blob 22b608a059e66ce3154e8e8e2d42d779cff0acad.
Latest mission/spine/obligation blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
509fdba8772c61988cbe780d414d726579db7f54,
b094c82e0c910f74a6f7b31dbcc0351f9053deab.
Read peer integration/2026-11-27_C2_CALLER_WORK.md and determinant receipt.
Accepted determinant class-sum source 67473a75e141e04e3bed87f97e57cb5979c7bce1,
object SHA256 d843f574fe7e9714679d3f80bd4e55d88d8ae9abc05c23c2cc59caebea861644,
native exit 0, 64.18 s, standard axioms, complete original type comparison.
Four-root determinant/Carrier graph accepted; separate Carrier complement
still reaches general exchange. 354 extra uncached modules on this import
path per peer record. Do not start another independent cold build.

Mathematical interface: fix the SAME D, ramified p. The z>1 branch of
exists_isIntegralMeasure uses p.intAlgPart and remains untouched. For the
z=1 branch c=p.c-1, rank m=2 in the determinant supplier (not the exponent
m of the measure statement). For each admissible tame character define
Lambda(t)=detPeriod(Fin 2, p.nu*t*upsilonU1, c, D.modulus(t,2), p.psi*t.psi).
The new supplier preserves the original one C before all moduli/characters,
the individual nonzero gamma, gamma*S=1 and |gamma|^2=C/Pi. It is the exact
same class sum as the native caller, not an arbitrary period. Keep the
chosen group order, common integral bound N, exact detPeriod comparison,
nonvanishing F(1), all integral-away embeddings, and Euler factors unchanged.
The z=1 measure is F(t)=|D.chosenGroupOrder*N*Lambda(t)|^2 with exponent
m=1 and K=univ (Fin 2). The native twist identity is
F(t)/F(1)=levelNorm(t)^m*ratio(t)^(m+1). In the other branch m=0.
No divide by F(1) until the native nonzero witness has been supplied.
At the actual p-adic consumer exists_isFamily, preserve the same ramified
p, chosen place w not over ell, sign s, auxiliary Q, avatar, and the
integral measure witness. The norm of levelNorm is one by coprimality
with ell, not because every level norm equals 1. Retain the norm relation,
finite Euler factors, tame generator estimates, and the exact valuation
inequality. Do not turn this into a proof of the measure or Selmer
primitives independent of the original retained suppliers.

Use proof-term substitution (as already accepted in
C2_DETERMINANT_CARRIER_TRANSPORT.lean), with exact universe and complete
type checks before each change. Only these two direct supplier references
are substituted, in two distinct actual caller declarations. No import
New.Main or claimed RH theorem. The original proof expressions and
all pending primitives are retained in the source environment. A separate
transitive audit must test whether alternate paths still reach the old
determinant or general exchange, including via p.intAlgPart or other
suppliers. No such absence is claimed here.

Executed static checks in connector JS: fetched exact ValueFamilies blob;
two actual source declaration blocks; one unique supplier reference per
block; two inverse substitutions restored original blocks exactly.
Local command -v lean and command -v lake returned no executable.
No new Lean, rh_scan/prune/reduce/auto, axiom or graph execution. Below
native proof-transport certificates and guards are PREPARED, not PASS.
RUN82-83 exact source and original C2Combined route remain distinct
pending replay; do not silently replace their Carrier dependency here.

RESUME HERE: integration/shared runner build the pinned ValueFamilies
dependency path once with authenticated existing determinant module, compile
this exact file as C2ValueFamilies, check both new declarations and
axioms, then export constructor-inclusive original/new four-root graphs
with supplier reachability and alternate-path checks. Preserve any failure.
HANDOFF TO integration / native runner / Galois audit. Root RH OPEN.
-/

set_option pp.fullNames true
set_option debug.skipKernelTC false

open Lean in
run_cmd do
  let entries : List (Name × Name × Name × Name) := [
    (``Data.Pair.exists_isIntegralMeasure, `Data.Pair.run84_exists_isIntegralMeasure,
      ``stdClassSum_det_modKernel_eq, ``c2_stdClassSum_det_modKernel_eq),
    (``exists_isFamily, `run84_exists_isFamily,
      ``Data.Pair.exists_isIntegralMeasure, `Data.Pair.run84_exists_isIntegralMeasure)]
  for (originalName, candidateName, oldName, newName) in entries do
    let oldSupplier ← Lean.getConstInfo oldName
    let newSupplier ← Lean.getConstInfo newName
    unless oldSupplier.levelParams == newSupplier.levelParams do
      Lean.throwError "RUN84 universe parameter mismatch: {oldName}"
    let sameSupplier ← Lean.Elab.Command.liftTermElabM do
      Lean.Meta.isDefEq oldSupplier.type newSupplier.type
    unless sameSupplier do
      Lean.throwError "RUN84 supplier statement changed: {oldName}"
    let original ← Lean.getConstInfo originalName
    let some value := original.value? (allowOpaque := true) |
      Lean.throwError "RUN84 original lacks proof value: {originalName}"
    unless value.getUsedConstants.contains oldName do
      Lean.throwError "RUN84 source lacks advertised direct edge: {originalName}"
    let replaced := value.replace fun expression ↦
      match expression with
      | .const name levels =>
          if name == oldName then some (.const newName levels) else none
      | _ => none
    let deps := replaced.getUsedConstants
    unless deps.contains newName do
      Lean.throwError "RUN84 replacement lacks new supplier: {newName}"
    for forbidden in [oldName, originalName, candidateName] do
      if deps.contains forbidden then
        Lean.throwError "RUN84 retained old supplier or caller alias: {forbidden}"
    Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
      name := candidateName
      levelParams := original.levelParams
      type := original.type
      value := replaced
    })
    let candidate ← Lean.getConstInfo candidateName
    let same ← Lean.Elab.Command.liftTermElabM do
      Lean.Meta.isDefEq original.type candidate.type
    unless same do
      Lean.throwError "RUN84 complete caller statement changed: {candidateName}"
    Lean.logInfo m!"RUN84_VALUE_FAMILY: {candidateName}: original type and direct edges"

#print axioms Data.Pair.run84_exists_isIntegralMeasure
#print axioms run84_exists_isFamily
