#!/usr/bin/env python3
"""Restore the complete 2026-10-23 Cathedral/URT backup from GitHub parts."""
import json,hashlib,pathlib
here=pathlib.Path(__file__).parent
m=json.loads((here/'GITHUB_BACKUP_RESTORE_MANIFEST.json').read_text())
out=here/m['archive']
with out.open('wb') as dst:
    for entry in m['parts']:
        f=here/entry['filename'];data=f.read_bytes()
        assert len(data)==entry['size_bytes']
        assert hashlib.sha256(data).hexdigest()==entry['sha256']
        dst.write(data)
assert out.stat().st_size==m['total_bytes']
assert hashlib.sha256(out.read_bytes()).hexdigest()==m['sha256']
print('Recovered and verified:',out)