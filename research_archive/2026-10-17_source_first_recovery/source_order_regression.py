#!/usr/bin/env python3
"""Verify the exact source-before-retained-projection ordering of the archived
October 8 species-loaded URT/H64 decoder. No observed mass or phase inputs.
Usage: python source_order_regression.py [path/to/golden_species_operators.npz]
"""
from pathlib import Path
import sys, json, numpy as np
src=Path(sys.argv[1]) if len(sys.argv)>1 else Path(__file__).with_name('golden_species_operators.npz')
z=np.load(src)
R=z['retained13_frame']; H=z['hidden51_frame']
F=z['F5']; Q3=z['Qplus']; Q5=z['Qminus']; D=np.column_stack((F,Q3,Q5))
P=R@R.T; E=D@D.T; L=z['affine_L_plus']
realrank=lambda A: int(np.linalg.matrix_rank(np.vstack((A.real,A.imag)),tol=1e-9))
assert np.linalg.norm(R.T@R-np.eye(13))<1e-10
assert np.linalg.norm(D.T@D-np.eye(13))<1e-10
assert np.linalg.norm(P@P-P)<1e-10 and np.linalg.norm(E@E-E)<1e-10
assert np.linalg.norm(E-z['decoded_projector'])<1e-10
assert abs(np.trace(P@E)-5)<1e-10
assert abs(np.linalg.norm(P-E)-4)<1e-10
assert realrank(L)==13 and realrank(L@R)==5 and realrank(L@H)==8
out={'source_npz':str(src),'retained_vs_decoder_projector_distance_F':float(np.linalg.norm(P-E)),'common_dim':float(np.trace(P@E)),'ranks':{'real_decoder_full':realrank(L),'on_retained13':realrank(L@R),'on_hidden51':realrank(L@H)},'species':{}}
for j,name in enumerate(('u','d','e','nu')):
 s=z['real_history_sources'][j]
 amp=z['complex_amplitude_sources'][j]
 reconstructed=L@s
 assert np.linalg.norm(reconstructed-amp)<1e-10
 assert np.linalg.norm(P@s)<1e-10
 assert np.linalg.norm((np.eye(64)-E)@s)<1e-10
 assert np.linalg.norm(L@(P@s))<1e-10
 A=z[f'{name}_source_only_A']
 sigma=np.sort(np.linalg.svd(A,compute_uv=False))
 Q_root=float((sigma@sigma)/(sigma.sum()**2))
 out['species'][name]={'source_norm':float(np.linalg.norm(s)),
 'retained13_source_norm':float(np.linalg.norm(P@s)),
 'hidden51_source_norm':float(np.linalg.norm(H.T@s)),
 'source_amplitude_norm':float(np.linalg.norm(amp)),
 'source_only_singular_values':sigma.tolist(),
 'conditional_singular_Koide_Q':Q_root}
print(json.dumps(out,indent=2))