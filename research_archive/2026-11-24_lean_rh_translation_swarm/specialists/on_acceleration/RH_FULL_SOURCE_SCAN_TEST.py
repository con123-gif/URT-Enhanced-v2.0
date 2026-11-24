#!/usr/bin/env python3
"""Offline fail-on-error validation of RH full source import engine."""
import gzip, json, os, pathlib, tempfile, unittest
from RH_FULL_SOURCE_SCAN import report, index, closure, urt_priorities

class RHIndexTests(unittest.TestCase):
    def test_reversible_import_graph_and_provenance(self):
        with tempfile.TemporaryDirectory() as t:
            root=pathlib.Path(t)/'src';root.mkdir()
            (root/'Main.lean').write_text('import A B\n')
            (root/'A.lean').write_text('/- import FAKE -/\nimport C\n')
            (root/'B.lean').write_text('import C\n')
            (root/'C.lean').write_text('import Mathlib\n')
            (root/'Unrelated.lean').write_text('theorem u : True := trivial\n')
            out=pathlib.Path(t)/'out';d=report(root,out,None)
            self.assertEqual(d['total_lean_modules'],5)
            self.assertEqual(d['reachable_import_modules'],4)
            self.assertEqual(d['reachable_import_edges'],4)
            self.assertEqual(d['external_import_count'],1)
            self.assertEqual(d['warm_source_bytes_reopened'],0)
            self.assertLess(d['urt_rank2_max_residual'],1e-10)
            with gzip.open(out/'root_import_dag.json.gz','rt') as f:g=json.load(f)
            self.assertEqual({tuple(e) for e in g['edges']},{('Main','A'),('Main','B'),('A','C'),('B','C')})
            self.assertEqual(g['outside_imports'],['Mathlib'])
            with gzip.open(out/'source_file_shas.json.gz','rt') as f:shas=json.load(f)
            self.assertIn('Unrelated',shas)
            self.assertNotIn('FAKE',shas)

    def test_incremental_invalidations(self):
        with tempfile.TemporaryDirectory() as t:
            root=pathlib.Path(t)/'src';root.mkdir()
            for name,data in [('Main','import A\n'),('A','import B\n'),('B','def x := 1\n')]:
                (root/f'{name}.lean').write_text(data)
            cache=pathlib.Path(t)/'cache.json'
            nodes,a=index(root,cache)
            self.assertEqual(a['reparsed'],3)
            nodes,b=index(root,cache)
            self.assertEqual(b['reparsed'],0)
            self.assertEqual(b['source_bytes_reopened'],0)
            p=root/'B.lean';p.write_text('def x := 2\n')
            os.utime(p,ns=(p.stat().st_atime_ns,p.stat().st_mtime_ns+1000000000))
            nodes,c=index(root,cache)
            self.assertEqual(c['reparsed'],1)
            self.assertEqual(c['reverse_invalidations'],3)

    def test_named_fixed_rank_model_is_not_a_proof(self):
        order=['Main','A','B'];edges=[('Main','A'),('Main','B')]
        x,r=urt_priorities(order,edges)
        self.assertEqual(len(x),3)
        self.assertLess(r,1e-12)

    def test_missing_root_is_detected(self):
        with self.assertRaises(ValueError):closure({'A':{'imports':[]}})

if __name__=='__main__':unittest.main(verbosity=2)
