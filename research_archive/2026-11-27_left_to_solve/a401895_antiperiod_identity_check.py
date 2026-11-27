from pathlib import Path
import json

def R(x,h):
    return int(str(x).zfill(h)[::-1])

checks=0
small=[]
for h in range(1,5):
    B=10**h
    for K in range(7,B):
        if K%10 not in [7,8]:
            continue
        q=R(K-1,h)
        assert 0<=q<B and R(K,h)==q+B//10
        E=20*(B+1)**2-3*K*(10*q+B+11)
        F=20*(B+1)**2-30*K*(B-q)
        assert -10*B*B<F<20*(B+1)**2
        for t in [3,5,7]:
            T=B**t
            G=(T+1)//(B+1)
            assert G*(B+1)==T+1
            n=K*G
            r=R(n,h*t)
            assert r==(q+1)*G+T//10-1
            assert 10*(B+1)**2*(3*n*r-2*(T*T-1))==(T+1)*(F-E*T)
            assert E*T!=F
            checks+=1
        if B==10:
            small.append(dict(K=K,q=q,E=E,F=F))
    if h>=2:
        assert 20*(B+1)**2<B**3
report=dict(purpose="Exact support for the symbolic anti-period identity; not a length search or full A401895 proof.", checked_h=[1,2,3,4],checked_t=[3,5,7],exact_identity_instances=checks,small_B10_t3_cases=small,result="All assertions passed",lean_verification=False,accepted_full_problem=False)
Path(__file__).with_name("A401895_ANTIPERIOD_IDENTITY_CHECK.json").write_text(json.dumps(report,indent=2)+"\n")
print(json.dumps(report,indent=2))
