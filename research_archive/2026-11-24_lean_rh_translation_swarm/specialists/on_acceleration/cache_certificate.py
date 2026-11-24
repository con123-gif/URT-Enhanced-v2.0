#!/usr/bin/env python3
"""Run synthetic incremental/cache checks and separate-process benchmark.
Optional --upstream checks four exact pinned original Git blobs.
"""
import argparse, hashlib, json, pathlib, subprocess, sys, tempfile
from git_context_cache import run, changed, lex, graph, PIN
P=pathlib.Path
MANIFEST=[('src/Main.lean','dbd5db70bc11b35f18fa5751216ab335321e7bfc'),('src/Supplements/Kernels/MainTheoremsAll.lean','dfba1103254494332179b9c893fabe94ac6a45a1'),('src/Supplements/Kernels/MainTheoremsCritical.lean','34d133d368c93518bf52927bada45b00ec5fe982'),('src/Supplements/Kernels/MainTheorems.lean','6a542d7ce969a791fd12ce575f587e6bc29044bf')]
def git(repo,*a): return subprocess.check_output(['git','-C',str(repo),*a])
def setup(repo):
    repo.mkdir();git(repo,'init','-q');git(repo,'config','user.email','fixture@example.invalid');git(repo,'config','user.name','Fixture');(repo/'src').mkdir()
def put(repo,path,txt):
    p=repo/path;p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes(txt if isinstance(txt,bytes) else txt.encode())
def commit(repo):
    git(repo,'add','.');git(repo,'commit','-qm','fixture');return git(repo,'rev-parse','HEAD').decode().strip()
def core_equal(a,b):
    for k in ('records','graph','candidate_index'): assert a[k]==b[k],k

def check(root,upstream=None):
    if upstream:
        r=root/'real';setup(r)
        for path,sha in MANIFEST:
            b=git(upstream,'show',PIN+':'+path);assert hashlib.sha1(f'blob {len(b)}\0'.encode()+b).hexdigest()==sha;put(r,path,b)
        rev=commit(r);a=run(r,rev,root/'real.db','fixture-env');b=run(r,rev,root/'real.db','fixture-env');core_equal(a,b)
        assert b['stats']['source_bytes_read']==0 and a['graph']['reachable']==4
        assert a['candidate_index']['riemannHypothesis'][0][0]=='Main' and a['candidate_index']['rhOfAll'][0][0]=='Supplements.Kernels.MainTheorems'
        assert not a['graph']['lexically_clean_closed_context']['Main']
    assert lex(b'/- import Fake /- nested -/ -/\npublic import Real\n-- import Bad\ntheorem x : True := by trivial')['imports']==['Real']
    assert lex(b'import\n  X\ntheorem x : True := by trivial')['flags']
    assert lex('import «a b».C\n'.encode())['imports']==['«a b».C']
    r=root/'synthetic';setup(r);n=10000
    for i in range(n):
        text=(f'import M{i-1}\n' if i%100 else '')+f'theorem common : True := by trivial\n-- unique {i}\n-- padding '+('x'*512)+'\n'
        put(r,f'src/M{i}.lean',text)
    put(r,'src/Main.lean',''.join(f'import M{i}\n' for i in range(99,n,100))+'theorem root : True := by trivial\n')
    rev=commit(r);db=root/'synth.db';summary={};full=[]
    for label in ('cold','warm'):
        out=root/(label+'.json')
        cmd=[sys.executable,str(P(__file__).with_name('git_context_cache.py')),str(r),rev,str(db),'--environment','fixture-env','--out',str(out)]
        summary[label]=json.loads(subprocess.check_output(cmd));full.append(json.loads(out.read_text()))
    a,b=full;core_equal(a,b);assert a['graph']['reachable']==n+1 and a['graph']['local_edges']==n
    assert len(a['candidate_index']['common'])==n and b['stats']['misses']==0
    p=r/'src/M0.lean';orig=p.read_bytes();p.write_bytes(orig.replace(b'padding',b'changed'));assert p.stat().st_size==len(orig)
    rev2=commit(r);c=run(r,rev2,db,'fixture-env');diff=changed(a['graph']['context_keys'],c['graph']['context_keys'])
    assert set(diff)=={'Main'}|{f'M{i}' for i in range(100)} and c['stats']['misses']==1
    d=run(r,rev2,root/'fresh.db','fixture-env');core_equal(c,d)
    e=run(r,rev2,db,'different-env');assert len(changed(c['graph']['context_keys'],e['graph']['context_keys']))==n+1
    (r/'src/M0.lean').unlink();rev3=commit(r);f=run(r,rev3,db,'fixture-env');assert ['M1','M0'] in [list(z) for z in f['graph']['boundary_edges']];assert not f['graph']['lexically_clean_closed_context']['Main'];assert f['stats']['misses']==0
    try: graph({'Main':{'oid':'x','imports':['Main'],'flags':[]}},'env');raise AssertionError('cycle not rejected')
    except ValueError: pass
    summary.update({'source_edit_bytes':c['stats']['source_bytes_read'],'fresh_edit_bytes':d['stats']['source_bytes_read'],'context_invalidated':len(diff),'environment_invalidated':n+1,'exact_output_match':True,'source_pin_test':bool(upstream),'status':'PASS_SYNTHETIC_AND_OPTIONAL_PINNED_SUBSET_NOT_KERNEL'})
    return summary
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--upstream',type=P);p.add_argument('--out',type=P);a=p.parse_args()
    with tempfile.TemporaryDirectory() as td: result=check(P(td),a.upstream)
    out=json.dumps(result,indent=2)+'\n';print(out,end='')
    if a.out:a.out.write_text(out)
