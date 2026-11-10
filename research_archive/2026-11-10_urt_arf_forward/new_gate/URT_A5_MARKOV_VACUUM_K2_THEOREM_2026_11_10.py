#!/usr/bin/env python3
"""Exact A5-equivariant vacuum-switching variance from the original URT Q6 source.

Conditional vacuum transition P_t=(1-t)I+t J/5, 0<=t<=5/4.
The five normalized A4 singlets form a regular simplex in hidden 4_5.
No physical ARF or measured constant enters. --native verifies archived source.
"""
from fractions import Fraction as F
from math import comb
import argparse, contextlib, io, json, runpy
from pathlib import Path

C5=[F(7),F(7,40),-F(61,120),-F(1,24),-F(1,6),F(0)]
C=[x/4 for x in C5]

def Q(v):
    return [(v[(2*h)%64]+v[(2*h+1)%64])/2 for h in range(64)]
def mean(v):
    return sum(v)/64
def qpow(v,n):
    for _ in range(n):v=Q(v)
    return v
def K2(u):
    return C[0]+2*sum(C[d]*u**d for d in range(1,6))
def theorem():
    assert C==[F(7,4),F(7,160),-F(61,480),-F(1,96),-F(1,24),F(0)]
    assert K2(F(1))==F(71,48)
    assert K2(F(0))==F(7,4)
    assert K2(F(1,2))==F(3307,1920)
    assert K2(-F(1,4))==F(1315,768)
    def finite_var(n,u):
        return n*C[0]+2*sum((n-d)*C[d]*u**d for d in range(1,min(n,6)))
    assert finite_var(24,F(1))==F(2179,60)
    assert finite_var(24,F(1,2))==F(79583,1920)
    assert finite_var(24,F(0))==F(42)
    for h in range(64):
        v=[F(0)]*64;v[h]=F(1)
        for _ in range(6):v=Q(v)
        assert v==[F(1,64)]*64
    return {'K2_frozen':str(K2(F(1))),'K2_iid':str(K2(F(0))),
            'K2_half_mixing':str(K2(F(1,2))),
            'K2_zero_diagonal_switching':str(K2(-F(1,4))),
            'open_24_step_variance':{'frozen':'2179/60','half_mixing':'79583/1920','iid':'42'},
            'C0_to_C5':[str(x) for x in C],
            'K2_u':'7/4 + 7*u/80 - 61*u**2/240 - u**3/48 - u**4/12'}

def independent_markov_test():
    # Deliberately different, nontrivial six-bit zero-sum source:
    # g_i(h)=b_i*(Walsh_{0,1}+Walsh_{1,2}), sum_i b_i=0.
    b=[F(4),F(-1),F(-1),F(-1),F(-1)]
    w=[F((-1)**(((h>>0)&1)+((h>>1)&1))+
         (-1)**(((h>>1)&1)+((h>>2)&1))) for h in range(64)]
    gs=[[bi*wh for wh in w] for bi in b]
    assert all(sum(gs[i][h] for i in range(5))==0 for h in range(64))
    lags=[sum(mean([gs[i][h]*v for h,v in enumerate(qpow(gs[i],d))])
              for i in range(5))/5 for d in range(6)]
    assert lags==[F(8),F(4),F(0),F(0),F(0),F(0)],lags
    outcomes={}
    for t in (F(0),F(1,2),F(1),F(5,4)):
        u=1-t
        m1=[[F(0)]*64 for _ in range(5)]
        m2=[[F(0)]*64 for _ in range(5)]
        for n in range(1,10):
            q1=[Q(v) for v in m1];q2=[Q(v) for v in m2]
            avg1=[sum(q1[i][h] for i in range(5))/5 for h in range(64)]
            avg2=[sum(q2[i][h] for i in range(5))/5 for h in range(64)]
            m1new=[[gs[i][h]+u*q1[i][h]+t*avg1[h] for h in range(64)]
                   for i in range(5)]
            m2new=[[gs[i][h]**2+2*gs[i][h]*(u*q1[i][h]+t*avg1[h])+
                    u*q2[i][h]+t*avg2[h] for h in range(64)] for i in range(5)]
            m1,m2=m1new,m2new
            first=sum(map(sum,m1))/320
            second=sum(map(sum,m2))/320
            closed=n*lags[0]+2*sum((n-d)*lags[d]*u**d
                                    for d in range(1,min(6,n)))
            assert first==0 and second-first*first==closed,(t,n,second,closed)
        outcomes[str(t)]={'n_checked':'1..9','variance_n9':str(second)}
    # Independent fourth-moment tilted transfer on all 320 states, iid vacuum.
    mom=[[[F(1)]*64 for _ in range(5)]]+[
        [[F(0)]*64 for _ in range(5)] for _ in range(4)]
    for n in range(1,9):
        lm=[]
        for k in range(5):
            qk=[Q(v) for v in mom[k]]
            avg=[sum(qk[i][h] for i in range(5))/5 for h in range(64)]
            lm.append([avg]*5)
        mom=[[[sum(comb(k,j)*gs[i][h]**j*lm[k-j][i][h]
                    for j in range(k+1)) for h in range(64)]
              for i in range(5)] for k in range(5)]
        m=[sum(map(sum,mom[k]))/320 for k in range(5)]
        assert m[1]==0 and m[2]==8*n and m[4]-3*m[2]*m[2]==224*n
    outcomes['iid_fourth_cumulant']={'n_checked':'1..8','K4_rate':'224',
        'method':'independent exact 320-state moment transfer'}
    return outcomes

def native():
    root=Path(__file__).resolve().parent
    source=root/'URT_EXACT_A4_THIRD_CUMULANT_RATE_2026_11_10.py'
    if not source.is_file():
        raise FileNotFoundError('original five-solid exact source required: '+str(source))
    with contextlib.redirect_stdout(io.StringIO()):
        r=runpy.run_path(str(source))
    Q5=r['Q5'];E=r['E'];res=r['res'];Z=Q5()
    ts=[]
    for row in res:
        r2=row[5]
        factor=F(1) if r2==F(1,30) else F(2,3)
        assert factor*factor*r2==F(1,30),(r2,factor)
        ts.append([factor*x for x in row[7]])
    def dot(x,y):return sum(a*b for a,b in zip(x,y))
    signs=[1]
    for t in ts[1:]:
        d=dot(ts[0],t)
        assert abs(d)==F(1,120),d
        signs.append(-1 if d>0 else 1)
    ts=[[sgn*x for x in v] for sgn,v in zip(signs,ts)]
    assert all(dot(ts[i],ts[j])==(F(1,30) if i==j else -F(1,120))
               for i in range(5) for j in range(5))
    assert all(sum(ts[i][j] for i in range(5))==0 for j in range(20))
    gs=[[sum((Q5(F(int(x.p),int(x.q)))*e[j]
              for j,x in enumerate(ts[i])),Z) for e in E] for i in range(5)]
    assert all(sum((gs[i][h] for i in range(5)),Z)==Z for h in range(64))
    lag=[]
    for d in range(6):
        value=sum((sum((gs[i][h]*x for h,x in enumerate(qpow(gs[i],d))),Z)/64
                   for i in range(5)),Z)*6
        lag.append(value)
    assert lag==[Q5(x) for x in C],(lag,C)
    m2=[sum((gs[i][h]*gs[i][h] for i in range(5)),Z)*6 for h in range(64)]
    m4=[sum((gs[i][h]*gs[i][h]*gs[i][h]*gs[i][h]
             for i in range(5)),Z)*180 for h in range(64)]
    v=sum(m2,Z)/64
    assert v==Q5(F(7,4))
    cov=[sum((m2[h]*x for h,x in enumerate(qpow(m2,d))),Z)/64-v*v
         for d in range(1,6)]
    k4=sum(m4,Z)/64-3*v*v+6*sum(cov,Z)
    return {'native_C0_to_C5':[str(x) for x in lag],
            'native_resampled_K2':str(v),'native_resampled_K4_rate':str(k4),
            'native_K4_components':{'one_step_fourth':str(sum(m4,Z)/64),
                                    'six_variance_covariances':[str(6*x) for x in cov]},
            'status':'native_source_exact_checked'}

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--native',action='store_true');args=p.parse_args()
    out={'status':'exact_pass',
         'scope':'conditional source-level A5 vacuum Markov family; NOT physical ARFs',
         'theorem':theorem(),
         'independent_320_state_test':independent_markov_test()}
    if args.native:out['native_original_source']=native()
    print(json.dumps(out,indent=2))
