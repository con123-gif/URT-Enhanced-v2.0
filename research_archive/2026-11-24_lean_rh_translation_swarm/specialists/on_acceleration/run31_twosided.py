#!/usr/bin/env python3
"""Exact prime-power regression and matched benchmark; not native geometry or Lean."""
import json, math, resource, statistics, time

def require(ok, msg):
    if not ok: raise RuntimeError(msg)

def primes_to(n):
    s=bytearray(b'\1')*(n+1); s[:2]=b'\0\0'
    for p in range(2,math.isqrt(n)+1):
        if s[p]: s[p*p::p]=b'\0'*((n-p*p)//p+1)
    return [p for p in range(2,n+1) if s[p]]

def leg(p,q):
    z=pow(p%q,(q-1)//2,q)
    return -1 if z==q-1 else z

def direct(rows,A,B):
    return [c*sum(max(a-B*n,0) for a in A) for n,p,c in rows]

def reduced(rows,A,B,X):
    require(A and all(abs(a-X)<=B for a in A),'height range')
    lo,hi=min(A),max(A); S=sum(A); T=len(A)
    hinges={n:sum(max(a-B*n,0) for a in A)
            for n in range(lo//B+1,(hi-1)//B+1)}
    require(len(hinges)<=2,'boundary count')
    return [c*(S-T*B*n if B*n<=lo else 0 if B*n>=hi else hinges[n])
            for n,p,c in rows]

def timed(fn):
    ts=[]
    for _ in range(7):
        start=time.perf_counter_ns(); v=fn(); ts.append((time.perf_counter_ns()-start)/1e6)
    return v,ts[0],statistics.median(ts[1:]),ts

def main():
    B=1024; N=40000; ps=primes_to(N); q,d=3,23
    require(q%8==3 and d%16==7 and leg(q,d)==1,'admissible quadratic pair')
    rows=[]
    for p in ps:
        n=p; k=1
        while n<=N:
            a,b=leg(p,d)**k,leg(p,q)**k
            c=(1-a)*(1+b)
            require(c in (0,2,4),'projection coefficient')
            rows.append((n,p,c)); n*=p; k+=1
    rows.sort(); checks=0; bench=[]
    # Actual prime-power coefficients; heights are controlled rational inputs.
    X=39971*B+B//2
    for T in (64,256,1024):
        A=[X+(ps[j]*37)%(2*B+1)-B for j in range(T)]
        A[:3]=[X-B,X,X+B]
        R=[r for r in rows if B*r[0]<=max(A)]
        v,dc,dw,ds=timed(lambda:direct(R,A,B))
        w,rc,rw,rs=timed(lambda:reduced(R,A,B,X))
        require(v==w,'missed coefficient'); checks+=len(R)
        bench.append(dict(T=T,rows=len(R),direct_cold_ms=dc,direct_warm_ms=dw,reduced_cold_ms=rc,reduced_warm_ms=rw,direct_samples_ms=ds,reduced_samples_ms=rs))
        for n,p,c in R:
            h=max(X-B*n,0)
            for a in A:
                diff=a*h-X*max(a-B*n,0)
                if a<=X: require(0<=diff<=B*n*(X-a),'left normalized hinge')
                else: require(diff<=0,'right normalized hinge')
                checks+=1
    # Boundary stress includes the genuine consecutive prime powers 8 and 9.
    X2=8*B+B//2; A2=[X2-B,8*B,9*B,X2+B]
    require(direct(rows,A2,B)==reduced(rows,A2,B,X2),'two boundary fixture'); checks+=len(rows)
    require(any(p in (q,d) and c>0 for n,p,c in rows),'ramified nonzero')
    try: reduced(rows,[X-2*B],B,X)
    except RuntimeError: pass
    else: raise RuntimeError('out-of-range control not rejected')
    # Omitting the real boundary hinge loses a positive coefficient.
    active=next(n for n,p,c in rows if c>0 and n>3)
    xx=active*B; aa=[xx-B,xx+B]
    require(any(v!=w for v,w in zip(direct(rows,aa,B),[c*(sum(aa)-2*B*n if B*n<=min(aa) else 0) for n,p,c in rows])),'boundary omission control')
    return dict(primes=len(ps),prime_powers=len(rows),quadratic_pair=[q,d],exact_checks=checks,negative_controls=2,bench=bench,peak_rss_kib=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,scope='genuine primes and quadratic coefficients; controlled heights, not native geometry; cold=first in-process call')

if __name__=='__main__': print(json.dumps(main(),indent=2))
