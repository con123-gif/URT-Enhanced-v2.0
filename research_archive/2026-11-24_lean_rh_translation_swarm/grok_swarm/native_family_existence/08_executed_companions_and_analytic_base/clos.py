import os,sys
root='/workspace/rh_orig/src'
def imps(m):
    p=os.path.join(root,*m.split('.'))+'.lean'
    if not os.path.exists(p): return None
    return [l.split()[1] for l in open(p) if l.startswith('import ')]
def closure(st):
    seen={}
    while st:
        m=st.pop()
        if m in seen: continue
        r=imps(m); seen[m]=r
        if r: st+=[x for x in r if not x.startswith('Mathlib')]
    return seen
if __name__=='__main__':
    for f in sys.argv[1:]:
        st=[l.split()[1] for l in open(f) if l.startswith('import ') and not l.split()[1].startswith('Mathlib')]
        s=closure(st)
        print(f, len([k for k,v in s.items() if v is not None]), 'missing', [k for k,v in s.items() if v is None][:3])
