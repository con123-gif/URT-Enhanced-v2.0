"""Finite regressions of the analytic rectangular-gap and seam-locality proof."""
from itertools import product
import numpy as np
from math import pi,sqrt,cos

def rect(w,h,f,t=1,cut=None,x0=0,y0=0):
    L=np.zeros((w*h,w*h),complex)
    for x,y in product(range(w),range(h)):
        i=x*h+y
        for dx,dy in ((1,0),(0,1)):
            X,Y=x+dx,y+dy
            if X>=w or Y>=h:continue
            j=X*h+Y; a=t if dx and X+x0==cut else 1
            z=np.exp(1j*f*(x+x0)) if dy else 1
            L[i,i]+=a;L[j,j]+=a;L[i,j]-=a*z;L[j,i]-=a*np.conj(z)
    return L
phi=(1+sqrt(5))/2; theta=2*pi/phi**2
for f in (-theta,pi-theta):
    g=1-cos(abs(f)/4); count=0
    for w,h in product(range(2,9),range(2,10)):
        e=np.linalg.eigvalsh(rect(w,h,f));assert e[0]>=g-1e-11 and e[-1]<=8+1e-11
        count+=1
    for N in (4,6,8,10,12):
        a=N//2
        for t in (0,.3,1):
            L=rect(N,N,f,t,cut=a);u=np.exp(1j*f*a*np.tile(np.arange(N),N));L=u[:,None]*L*u.conj()[None,:]
            assert np.max(abs(L-rect(N,N,f,t,cut=0,x0=-a)))<1e-12
            e=np.linalg.eigvalsh(L);assert e[0]>=g-1e-11 and e[-1]<=8+1e-11
            big=rect(N+4,N+4,f,t,cut=0,x0=-a-2);K=np.eye(N*N)-L/8;Kb=np.eye((N+4)**2)-big/8
            for y in range(N):
                b=np.zeros(N*N);b[(a-1)*N+y]=1;b[a*N+y]=-1
                bb=np.zeros((N+4)**2);bb[(a+1)*(N+4)+y+2]=1;bb[(a+2)*(N+4)+y+2]=-1
                v=b.copy();vv=bb.copy()
                for k in range(min(y,N-1-y,a-1)):
                    assert abs(b@v-bb@vv)<1e-12
                    v=K@v;vv=Kb@vv
    print('flux',f,'g',g,'rectangles',count,'seam gauge/moment tests pass')
p=(3,5,7,11)
vec=list(product((-1,0,1),repeat=len(p)))
def sig(a,b):
    q=[-a[j]*b[i] for i in range(len(p)) for j in range(i+1,len(p))]
    s=[((p[i]-1)//2)*((p[j]-1)//2) for i in range(len(p)) for j in range(i+1,len(p))]
    return sum(q),sum(x*y for x,y in zip(q,s))%2
add=lambda a,b:tuple(x+y for x,y in zip(a,b))
phaseadd=lambda a,b:(a[0]+b[0],(a[1]+b[1])%2)
for a,b,c in product(vec,vec,[(1,0,0,0),(0,-1,0,0),(0,0,1,0),(0,0,0,-1)]):
    assert phaseadd(sig(a,b),sig(add(a,b),c))==phaseadd(sig(b,c),sig(a,add(b,c)))
for i,j in product(range(4),repeat=2):
    ei=tuple(int(k==i) for k in range(4));ej=tuple(int(k==j) for k in range(4))
    a,b=sig(ei,ej),sig(ej,ei);assert a[0]-b[0]==(1 if i<j else -1 if i>j else 0)
print('exact cocycle regression:',len(vec)**2*4,'triples; inverse exchange orientation verified')
