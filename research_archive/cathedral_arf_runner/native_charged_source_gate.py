#!/usr/bin/env python3
"""Validate *archived native* charged-matter output, not a synthetic 64x64 proxy.

Run after common_action_work/matter/microscopic_source_currents.py. This
requires actual v61 Wilson links, the charged generator registry and the
history amplitudes; refuses to substitute random matrices or guessed data.
"""
import json,pathlib,sys,numpy as np
root=pathlib.Path(__file__).resolve().parents[2]
out=root/"research_archive/2026-10-17_original_oct08_source/common_action_work/matter"
checks_path=out/"microscopic_source_currents_checks.json"
npz_path=out/"microscopic_source_currents_operators.npz"
if not checks_path.is_file() or not npz_path.is_file():
 raise SystemExit("MISSING NATIVE OUTPUT: run archived microscopic_source_currents.py first")
c=json.loads(checks_path.read_text())
assert c.get("passed") is True,"native source checks failed"
with np.load(npz_path,allow_pickle=False) as ar:
 keys=set(ar.files)
 required={"wilson_h0","sea_link_hessian","site_link_incidence","Q96","physical_generators96","current_transition_gaps","current_transition_positive_weights","mixed_nonabelian_seagull","neutral_Yukawa_D96","charged_Yukawa_D96","site_Schur_kernel","site_effective_current","site_effective_contact"}
 assert required<=keys,sorted(required-keys)
 H=ar["wilson_h0"];Pi=ar["sea_link_hessian"];inc=ar["site_link_incidence"];Q=ar["Q96"]
 assert H.shape==(192,192) and Pi.shape==(528,528) and inc.shape==(528,48) and Q.shape==(96,96)
 assert np.linalg.norm(H-H.conj().T)<1e-9
 assert np.linalg.norm(Pi@inc)<2e-10
 assert abs(np.trace(Q@Q).real-32)<1e-9
 assert np.min(ar["current_transition_gaps"])>0
 assert np.min(ar["current_transition_positive_weights"])>=0
 assert ar["neutral_Yukawa_D96"].shape==(96,96)
 assert ar["charged_Yukawa_D96"].shape==(96,96)
 assert ar["site_Schur_kernel"].shape==(4,4)
# Physical photon selection and four ARFs are NOT established by these checks.
print(json.dumps({"status":"native_archive_verified","archive_arrays":len(keys),"wilson_shape":list(H.shape),"charged_registry_shape":list(Q.shape),"link_hessian_shape":list(Pi.shape),"ward_norm":float(np.linalg.norm(Pi@inc)),"charge_index":float(np.trace(Q@Q).real),"physical_photon_residue":"unselected","four_ARFs":"not_derived","next_required":"derive photon projector and pole normalization from the native operator, then connect to URT history Schur map"},indent=2))
