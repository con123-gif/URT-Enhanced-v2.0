"""Verify saved joint-vacuum results; optionally reproduce their finite calculations.

Default checks the executed records, source provenance and finite operator files.
--recompute runs finite calculations and reuses the saved replicated photon data.
--reintegrate-photon reruns the expensive Sobol integration instead of reusing it.
"""
from pathlib import Path
import argparse
import hashlib
import json
import os
import subprocess
import sys
import time
import numpy as np

ROOT = Path(__file__).resolve().parent
WORK = ROOT/'joint_vacuum_work'
SCRIPTS = [
    ('joint_vacuum_work/entropy_diamond.py', 'entropy_diamond_checks.json'),
    ('joint_vacuum_work/gravity/joint_selected_vacuum.py', 'gravity/joint_selected_vacuum_checks.json'),
    ('joint_vacuum_work/species/shared_species_vacuum.py', 'species/shared_species_vacuum_checks.json'),
    ('joint_vacuum_work/species/bridge_spurion_witness.py', 'species/bridge_spurion_witness_checks.json'),
    ('joint_vacuum_work/species/verify_full64_deformations.py', 'species/full64_deformation_checks.json'),
    ('joint_vacuum_work/photon/correlated_hat_k5.py', 'photon/correlated_hat_k5_checks.json'),
    ('joint_vacuum_work/review/total_vacuum_review.py', 'review/total_vacuum_review_checks.json'),
]

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--recompute', action='store_true')
    parser.add_argument('--reintegrate-photon', action='store_true')
    args = parser.parse_args()
    started = time.monotonic()
    logs = WORK/'run_logs'
    logs.mkdir(exist_ok=True)
    receipts = []
    environment = dict(os.environ)
    environment['OPENBLAS_NUM_THREADS'] = '1'
    cached = WORK/'photon/correlated_hat_k5_scramble_data.json'
    original_hash = hashlib.sha256(cached.read_bytes()).hexdigest()
    if args.recompute or args.reintegrate_photon:
        for script, _ in SCRIPTS:
            command = [sys.executable, str(ROOT/script)]
            if script.endswith('correlated_hat_k5.py') and not args.reintegrate_photon:
                command.append('--verify-cached')
            result = subprocess.run(command, cwd=ROOT, env=environment,
                                    capture_output=True, text=True)
            (logs/(Path(script).stem+'.log')).write_text(result.stdout+result.stderr)
            receipts.append({'script': script, 'exit_code': result.returncode})
            if result.returncode:
                print((result.stdout+result.stderr)[-4000:])
                raise SystemExit('Failed: '+script)
            print('Reproduced '+script, flush=True)
    validations = {}
    for _, relative in SCRIPTS:
        data = json.loads((WORK/relative).read_text())
        passed = data.get('passed', data.get('all_checks_pass', False))
        assert passed is True, relative
        if 'checks' in data:
            assert data['checks'] and all(value is True for value in data['checks'].values()), relative
        validations[relative] = {'executed_record_passed': True,
                                'named_checks': len(data.get('checks', {}))}
        for name, expected in data.get('source_sha256', {}).items():
            assert hashlib.sha256((ROOT/name).read_bytes()).hexdigest() == expected, name
    count = 0
    for path in sorted(WORK.rglob('*.npz')):
        with np.load(path, allow_pickle=False) as arrays:
            for key in arrays.files:
                value = arrays[key]
                if np.issubdtype(value.dtype, np.number):
                    assert np.all(np.isfinite(value)), (path, key)
                count += 1
    if not args.reintegrate_photon:
        assert hashlib.sha256(cached.read_bytes()).hexdigest() == original_hash
    receipt = {
        'mode': 'recompute_finite' if args.recompute or args.reintegrate_photon else 'validate_executed_records',
        'photon_data_reintegrated': args.reintegrate_photon,
        'steps': receipts, 'records': validations,
        'finite_operator_arrays': count, 'source_hashes_match': True,
        'photon_scramble_data_sha256': hashlib.sha256(cached.read_bytes()).hexdigest(),
        'all_records_pass': True, 'elapsed_seconds': time.monotonic()-started,
        'scope': 'Declared finite calculations and source identities; not a full interacting Nature certificate.',
    }
    (ROOT/'joint_vacuum_run_receipts.json').write_text(json.dumps(receipt, indent=2)+'\n')
    print(json.dumps(receipt, indent=2))

if __name__ == '__main__':
    main()
