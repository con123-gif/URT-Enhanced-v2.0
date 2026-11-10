#!/usr/bin/env python3
"""Finite exact Taylor derivatives of the 64-history URT tilted transfer.

Q^6=P_Haar makes the Poisson inverse a finite sum on mean-zero histories.
For --native, load the archived exact five A4 hidden-5 scalar sources and
compute individual K2/K3/K4 without changing their source definitions.
"""
from fractions import Fraction as F
from math import comb
import argparse,json,runpy,contextlib,io
from pathlib import Path

def q(v):
    return [(v[(2*h)%64]+v[(2*h+1)%64])/2 for h in range(64)]
def mean(v):
    return sum(v)/64
def dot(v,w):
    return [a*b for a,b in zip(v,w)]
def centered_poisson(rhs):
    zero=rhs[0]-rhs[0]
    assert mean(rhs)==zero
    out=[zero]*64
    cur=rhs
    for _ in range(6):
        out=[x+y for x,y in zip(out,cur)]
        cur=q(cur)
    assert all(x==zero for x in cur)
    assert all(x==y for x,y in zip([a-b for a,b in zip(out,q(out))],rhs))
    return out

def cumulants(g,order=4):
    assert len(g)==64
    zero=g[0]-g[0];one=zero+1
    six=g
    for _ in range(6):six=q(six)
    assert all(x==mean(g) for x in six), 'Q^6 not Haar'
    r=[[one]*64];lam=[one];gp=[[one]*64]
    for n in range(1,order+1):
        gp.append(dot(gp[-1],g))
        src=[zero]*64
        for k in range(1,n+1):
            qr=q(r[n-k]);power=gp[k]
            src=[x+comb(n,k)*a*b for x,a,b in zip(src,power,qr)]
        l=mean(src)
        lam.append(l)
        rhs=src[:]
        for k in range(1,n+1):
            rhs=[x-comb(n,k)*lam[k]*rv for x,rv in zip(rhs,r[n-k])]
        rn=centered_poisson(rhs)
        assert mean(rn)==zero
        r.append(rn)
    k=[zero]*(order+1)
    for n in range(1,order+1):
        k[n]=lam[n]-sum(comb(n-1,j-1)*k[j]*lam[n-j] for j in range(1,n))
    return k[1:]


def finite_cumulants(g,n,order=4):
    """Independent finite-time transfer moments, not eigenvalue perturbation."""
    zero=g[0]-g[0];one=zero+1
    powers=[[one]*64]
    for j in range(1,order+1):powers.append(dot(powers[-1],g))
    v=[[one]*64]+[[zero]*64 for _ in range(order)]
    for _ in range(n):
        qv=[q(x) for x in v]
        v=[[sum((comb(k,j)*powers[j][h]*qv[k-j][h] for j in range(k+1)),zero) for h in range(64)] for k in range(order+1)]
    m=[mean(x) for x in v]
    k=[zero]*(order+1)
    for i in range(1,order+1):
        k[i]=m[i]-sum(comb(i-1,j-1)*k[j]*m[i-j] for j in range(1,i))
    return k[1:]

def native():
    root=Path(__file__).resolve().parent
    source=root/'URT_EXACT_A4_THIRD_CUMULANT_RATE_2026_11_10.py'
    if not source.is_file():
        raise FileNotFoundError('native exact source script must be adjacent: '+str(source))
    with contextlib.redirect_stdout(io.StringIO()):
        r=runpy.run_path(str(source))
    Q5=r['Q5'];E=r['E'];res=r['res']
    result=[];total4=Q5()
    for i,row in enumerate(res):
        t=row[7]
        coeff=[Q5(F(int(x.p),int(x.q))) for x in t]
        g=[sum((coeff[j]*e[j] for j in range(20)),Q5()) for e in E]
        K=cumulants(g,4)
        assert K[0]==Q5()
        assert K[1]==row[6]
        assert K[2]==row[3]
        F24=finite_cumulants(g,24)
        F25=finite_cumulants(g,25)
        assert all(F25[j]-F24[j]==K[j] for j in range(4)),(i,F24,F25,K)
        total4+=K[3]/Q5(F(int((row[5]**2).p),int((row[5]**2).q)))
        result.append({'vacuum':i,'raw_K2':str(K[1]),'raw_K3':str(K[2]),'raw_K4':str(K[3]),'norm_squared':str(row[5]),'unit_K4':str(K[3]/Q5(F(int((row[5]**2).p),int((row[5]**2).q)))),'independent_24_to_25_step':'exact_pass'})
    assert total4/5==Q5(F(845671,57600),F(4271,800))
    return {'five_vacua':result,'A5_mean_unit_K4':str(total4/5)}

def selftest():
    for h in range(64):
        v=[F(0)]*64;v[h]=F(1);x=v
        for _ in range(6):x=q(x)
        assert x==[F(1,64)]*64
    for bitset in ((0,), (0,1)):
        g=[F((-1)**sum((h>>bit)&1 for bit in bitset)) for h in range(64)]
        k=cumulants(g,6)
        assert k[:4]==[F(0),F(1),F(0),F(-2)],(bitset,k)
        assert k[4]==0 and k[5]==16,(bitset,k)
    k=cumulants([F(3,7)]*64,5)
    assert k==[F(3,7),F(0),F(0),F(0),F(0)],k
    return 'exact 64-history Q^6, two iid Rademacher sources through K6, constant source through K5'

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--native',action='store_true');a=p.parse_args()
    evidence=selftest()
    out={'status':'exact_pass','verification':evidence,'theorem':'all-order finite six-step Poisson recursion for cumulants of tilted URT Q','physical_ARFs':'not derived'}
    if a.native:out['native_five_vacua']=native()
    print(json.dumps(out,indent=2))
