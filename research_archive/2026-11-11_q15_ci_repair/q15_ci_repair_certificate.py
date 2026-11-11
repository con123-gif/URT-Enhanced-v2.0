#!/usr/bin/env python3
"""Q15 CI repair regression on the *native* Q11 -> Q12 -> Q15 source chain.

The earlier Q15 CI failure was KeyError('K'): the native quadratic field K
belongs to Q11 and is stored under Q12's `ns` variable. Exercise the actual
nested runpy imports and exact 768-class calculation. No synthetic inputs.
"""
from contextlib import redirect_stdout
from io import StringIO
from pathlib import Path
import json
import runpy

root = Path(__file__).resolve().parents[1]
q15 = root / '2026-11-11_signed_dictionary_k23' / 'native_joint_k23.py'
assert q15.is_file(), q15
buf = StringIO()
with redirect_stdout(buf):
    q15_globals = runpy.run_path(str(q15))
result = json.loads(buf.getvalue())
q12_globals = q15_globals['ns']
assert 'K' not in q12_globals, 'namespace changed: review the regression'
assert 'ns' in q12_globals and 'K' in q12_globals['ns']
assert q15_globals['_src']['K'] is q12_globals['ns']['K']
assert q15_globals['K'] is q12_globals['ns']['K']
assert result['proper_A5_classes'] == 768
assert result['distinct_joint_signatures'] == 96
assert result['multiplicity_distribution'] == {'8': 96}
assert result['nonparity_collision_pairs'] == 576
assert result['finite_time_24_to_25'] == 'exact 10/10'
D = (0,2,4,6,8,10)
E = (0,2,8,10,7,4)
assert q12_globals['spectrum'](D) == q12_globals['spectrum'](E)
assert q15_globals['signature'](D) == q15_globals['signature'](E)
assert result['nonparity_collision_witness'] == [list(D),list(E)]
assert result['physical_ARFs'] == 'not derived'
print(json.dumps({
    'result':'VERIFIED-ARCHIVE: native Q15 namespace repair and exact K2-I3 obstruction',
    'nested_Q11_K_lookup':'exact pass',
    'Q12_K_missing_as_expected':True,
    'proper_A5_classes':768,
    'distinct_joint_signatures':96,
    'signature_multiplicity':8,
    'nonparity_collision_pairs':576,
    'exact_witness':[list(D),list(E)],
    'finite_time_K3_24_to_25':'exact 10/10',
    'physical_ARFs':'not derived'
},sort_keys=True,indent=2))
