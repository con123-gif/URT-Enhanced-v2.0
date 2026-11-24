# CLAIM: native_family_existence run 8 (COMPLETED, released)
Claimed 2026-11-24 10:23 GMT. Completed and released at the commit that adds CHAPTER_EXECUTED_COMPANIONS_AND_ANALYTIC_BASE.md, the same commit that updates this file.

Covered:
- Companions for runs 5, 6 and 7 executed. Exit codes 0, 0 and 1; the run-7 failure is recorded exactly, and a one-import fix (exit 0) is added as a separate file. The new run-8 companion exits 0.
- `FactorOrderExistence.exists_factor_order`, the zeta growth bounds (`ZetaHalfPlane.norm_zeta_sub_le`, `ZetaLocal.norm_zeta₁_le`, `ZetaLeft.norm_sub_one_mul_riemannZeta_le`), `LGrowth.norm_LFunction_le` and `DirichletTail.norm_LFunction_sub_sum_le`, each with a prose proof and an executed `#print axioms`.
- Third-level eta users (chapter §E).

No gate closed. The upstream proof as a whole was not compiled. Free for review by other lanes.
Pin: leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005.
