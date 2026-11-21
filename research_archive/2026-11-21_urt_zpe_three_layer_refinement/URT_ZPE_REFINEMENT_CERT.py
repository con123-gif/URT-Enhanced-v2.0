#!/usr/bin/env python3
"""URT-ZPE exact three-layer refinement of the original 3D magnetic Hamiltonian.

A new layer is a real magnetic two-dimensional sheet; join it to the old
rectangular graph by its native edges. No arbitrary coupling, altered
stiffness, or fitted energy. Exact theorems in accompanying report.
The numerical test uses the actual native link phases and fail-on-error checks.
"""
from __future__ import annotations
import math
import numpy as np

PHI=(1+math.sqrt(5))/2
THETA=2*math.pi/PHI**2
ALPHA=math.pi/math.e

def phase(eps):
    assert eps in (-1, 1)
    return float(np.angle(eps*np.exp(-1j*THETA)))

def graph(dims,eps):
    """Native x,y,z links Ux=exp(if z), Uy=exp(if x), Uz=exp(if y)."""
    nx,ny,nz=dims
    assert min(dims)>=2
    f=phase(eps)
    L=np.zeros((nx*ny*nz,nx*ny*nz),dtype=complex)
    def idx(x,y,z):return x+nx*(y+ny*z)
    for z in range(nz):
        for y in range(ny):
            for x in range(nx):
                i=idx(x,y,z)
                for d,xx,yy,zz,power in ((0,x+1,y,z,z),(1,x,y+1,z,x),(2,x,y,z+1,y)):
                    if xx>=nx or yy>=ny or zz>=nz:continue
                    j=idx(xx,yy,zz)
                    w=np.exp(1j*f*power)
                    L[i,i]+=1; L[j,j]+=1
                    L[i,j]-=w; L[j,i]-=np.conj(w)
    return L

def gap2(eps):
    return 1-math.cos(abs(phase(eps))/4)

def energy(A):
    ev=np.linalg.eigvalsh(A)
    assert ev[0]>0
    return float(np.sqrt(ev).sum()),float(ev[0])

def grow_one_layer(dims,axis,eps):
    """Exact original-axis seam between old box and added layer."""
    dims2=list(dims); dims2[axis]+=1; dims2=tuple(dims2)
    L=graph(dims2,eps)
    nx,ny,nz=dims2
    def idx(x,y,z):return x+nx*(y+ny*z)
    f=phase(eps)
    B=np.zeros_like(L)
    old=[];new=[]
    for z in range(nz):
        for y in range(ny):
            for x in range(nx):
                i=idx(x,y,z)
                if (x,y,z)[axis]==dims[axis]:new.append(i)
                else:old.append(i)
    assert len(old)==math.prod(dims)
    assert len(new)==math.prod(dims2)-len(old)
    # Native seam bond phase is sampled from the exact 3D link field.
    for z in range(nz):
        for y in range(ny):
            for x in range(nx):
                co=(x,y,z)
                if co[axis]!=dims[axis]-1:continue
                shifted=list(co); shifted[axis]+=1
                i=idx(*co);j=idx(*shifted)
                p=(z,x,y)[axis]
                w=np.exp(1j*f*p)
                B[i,i]+=1;B[j,j]+=1
                B[i,j]-=w;B[j,i]-=np.conj(w)
    L0=L-B
    old_block=L0[np.ix_(old,old)]
    sheet_block=L0[np.ix_(new,new)]
    assert np.linalg.norm(old_block-graph(dims,eps),ord=np.inf)<1e-10
    assert np.max(abs(L0[np.ix_(old,new)]))<1e-10
    assert abs(np.trace(B).real-2*len(new))<1e-10
    assert np.linalg.norm(B@B-2*B,ord=np.inf)<1e-9  # each seam bond isolated
    eo,go=energy(old_block)
    es,gs=energy(sheet_block)
    ej,gj=energy(L)
    eb,g_b=energy(L0)
    assert abs(eb-(eo+es))<1e-8
    g2=gap2(eps)
    assert min(go,gs,gj,g_b)>=g2-1e-10
    work=ej-eb
    lower=len(new)/math.sqrt(12)
    upper=len(new)/math.sqrt(g2)
    assert lower-1e-8<=work<=upper+1e-8,(dims,axis,eps,work,lower,upper)
    assert work>0
    for t in (0.,.25,.5,.75,1.):
        eig=np.linalg.eigvalsh(L0+t*B)
        assert eig[0]>=g2-1e-9
    return dims2,es,work,ej

def explicit_surface_constant(eps):
    g3=1.5*gap2(eps)
    q=1-g3/12
    return 12*math.sqrt(12)*q/(1-q)**2

def test():
    for eps in (+1,-1):
        for n in (2,3,4):
            dims=(n,n,n)
            base,_=energy(graph(dims,eps))
            sum_sheet=0.; sum_work=0.; delta=0
            for axis in (2,1,0):
                dims2,es,w,new_total=grow_one_layer(dims,axis,eps)
                delta+=math.prod(dims2)-math.prod(dims)
                sum_sheet+=es;sum_work+=w
                dims=dims2
            assert dims==(n+1,n+1,n+1)
            assert delta==(n+1)**3-n**3
            directly,_=energy(graph(dims,eps))
            assert abs(base+sum_sheet+sum_work-directly)<1e-8
            assert delta/math.sqrt(12)<=sum_work<=delta/math.sqrt(gap2(eps))
            print(f'eps={eps:+d}, {n}^3 -> {n+1}^3, new={delta:3d}, '
                  f'prep={sum_sheet:.12f}, join={sum_work:.12f}, '
                  f'total_delta={directly-base:.12f}, per_new={(directly-base)/delta:.12f}')
        print(f'eps={eps:+d}, g2={gap2(eps):.12f}, '
              f'explicit_spectral_surface_C={explicit_surface_constant(eps):.4f}')
    # Exact theorem for ALL alpha>1 (with ceiling):
    # 0 <= ln(ceil(alpha*N)/N)/ln(alpha) - 1 <= 1/(alpha*N*ln alpha).
    N=12
    for k in range(7):
        m=math.ceil(ALPHA*N)
        ratio=3*math.log(m/N)/math.log(ALPHA)
        bound=3/(ALPHA*N*math.log(ALPHA))
        assert m>N and 3-1e-12<=ratio<=3+bound+1e-12
        print(f'URT step k={k}: side={N}->{m}, Gamma/H={ratio:.12f}, excess_bound={bound:.12f}')
        N=m
    print('PASS local: native 3D graph, every attached sheet, seam-only B, nonzero gap,')
    print('  exact energetic decomposition, three-stage cube completion, growth-rate bounds.')
    print('CONDITIONAL: URT does not yet force fixed physical spacing, reservoir, or GR stress.')

if __name__=='__main__':test()
