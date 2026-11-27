import C2DeterminantLift
import Lean
set_option pp.fullNames true
set_option debug.skipKernelTC false
run_cmd do
  let env := (← Lean.getEnv).setExporting false
  for name in #[`exchange_of_partners, `exchange_theorem, `explicit_matching,
                 `stdClassSum_det_modKernel_eq] do
    if (env.toKernelEnv.find? name).isSome then
      Lean.throwError "A forbidden general exchange or consumer is present in the checked environment"
  Lean.logInfo "C2_ALGEBRA_ENV_ABSENCE_PASS"
#print axioms c2_lift_inverse_determinant
#print axioms c2_lift_one_empty_columns
#print axioms c2_standard_column_empty
