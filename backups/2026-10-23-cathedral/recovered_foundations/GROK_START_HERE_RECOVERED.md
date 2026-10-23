# Grok handoff recovery: FOUND source versus MISSING physical law
October 23, 2026. Byte-preserving recovery from the October 8 Cathedral continuation and existing earlier saved Koide script. No physics coefficients were fitted or inserted.

## ORIGINAL FOUND and tested
1. `run_joint_vacuum.py`: recovered unmodified from `Cathedral_Continuation_2026-10-08(1).zip`, archive root. Executed successfully with `--recompute`; 7 finite stages completed (cached Sobol photon sample reused), all 76 finite operator arrays checked. Needs accompanying `joint_vacuum_work/` and `derive_three_work/` in their original relative paths.
2. `flavour_work_v2/outer_history_operators.npz`: original 2 MB binary recovered from the same archive.
3. `kl_urt_koide_action.py`: exact 70-line artifact independently recovered from earlier ChatGPT Library file. Executed. It derives stationary |s|/v=1/sqrt(2) and Q=2/3 inside its *declared effective circulant action*, **but leaves the physical Koide phase delta flat and unselected**. It is not the sought microscopic action nor a pole-mass prediction.
4. `continued_physics_work/gravity/spin2_pole_identity.py` + exact tests, operators and paper: recovered. The tested Ricci-norm entropy action yields a spin-2 1/p^4 *double* pole; an Einstein/Fierz-Pauli 1/p^2 pole needs an independent derived kinetic coefficient and coframe-to-matter source coupling.

## EXACT internal rho-star state (not a new physical identification)
phi=(1+sqrt(5))/2
Delta=3/20-(80*pi)/(1053*phi) = 0.0024891898404204...
eta=-log(Delta)
L_hid=3 P_3 + 5 P_5 with rank(P_3)=rank(P_5)=4
rho_star=exp(-eta*L_hid)/Tr exp(-eta*L_hid)
        =(I_4 direct-sum Delta^2 I_4)/(4*(1+Delta^2))
p_5=Delta^2/(1+Delta^2).
This is an exact finite Gibbs identity; neither spatial coframe normalization nor a unique physical spin-2 link follows from it.

## Still genuinely not recovered as a complete physical rule
- Full microscopic V_URT action **with specified measure, chronologically ordered selection, 13D -> 18D/64D matter coupling and physical pole/current dictionary**. `Cathedral_Common_Action_2026-10-08.md` gives a general transfer trace action T(s)=P_G Wdelta(s)^(1/2) exp(-a(s)H(s)) Wdelta(s)^(1/2) P_G, T=B†B and its BKM derivatives, but it explicitly does not claim uniquely sourced full October selected action.
- An independently derived absolute unification scale M_U: the 1.8e18 GeV estimate is conditional on supplied gauge seed / RG premises and is not a top-down scale prediction.
- A physical diffeomorphism-redundant spin-2/coframe link yielding Einstein 1/p² pole and sourced G without inserting its kinetic structure.
- The physical Koide phase, absolute lepton masses and non-arbitrary couplings from a single URT history law.

## Reproduce
From this directory: `OPENBLAS_NUM_THREADS=1 python run_joint_vacuum.py`
For full finite rerun: `OPENBLAS_NUM_THREADS=1 python run_joint_vacuum.py --recompute`
Photon part reuses archived Sobol samples by default; it does NOT recompute the costly integration unless `--reintegrate-photon`.
`python kl_urt_koide_action.py` demonstrates the effective Koide action and unselected delta.
`python continued_physics_work/gravity/spin2_pole_identity.py` checks the original spin-2 pole identity.

## Provenance
Files except `kl_urt_koide_action.py` and this README/manifest are unmodified October 8 continuation members. See per-file `RECOVERY_SHA256_MANIFEST.json`. None of these tests establishes the microscopic identity of URT with nature; they restore reproducibility and prevent lost-file claims from blocking work.
