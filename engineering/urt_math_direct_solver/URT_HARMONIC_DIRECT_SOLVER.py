"""Mathematical solver for low-rank phase-difference interactions.

Default phase constants come from original URT; the exact inverse comes from
trigonometric factorization and the Woodbury identity. These are separable
harmonic operators, not arbitrary dense or nonlinear matrices.

Usage:
    from URT_HARMONIC_DIRECT_SOLVER import solve, urt_forcing, residual
    b = urt_forcing(10000)
    x, features = solve(b, harmonics=3)
    print(residual(x, b, features))

Time O(N*h^2+h^3), memory O(N*h) for fixed harmonic count h.
"""
from __future__ import annotations
import numpy as np
PHI=(1+np.sqrt(5))/2
ANGLE=2*np.pi/PHI**2
KAPPA=np.pi/np.e
DELTA=3/20-80*np.pi/(1053*PHI)
ETA=-np.log(DELTA)


def urt_forcing(n:int)->np.ndarray:
    if n<1: raise ValueError('n must be positive')
    i=np.arange(n)
    b=KAPPA**(i-(n-1))*np.cos(i*ANGLE)+DELTA*np.sin(2*i*ANGLE)
    t=np.linalg.norm(b)
    return b/t if t else b


def features(n:int,harmonics:int=1,angle:float=ANGLE,amplitudes=None)->np.ndarray:
    """U with K=I+UU.T. Amplitudes must be nonnegative.

    Defaults ETA*DELTA**(j-1) for j=1..harmonics. Values are
    user-chosen mathematical kernel weights, not predicted force constants.
    """
    if not (n>0 and harmonics>0): raise ValueError('n and harmonics must be positive')
    if amplitudes is None:
        amplitudes=ETA*DELTA**np.arange(harmonics)
    amplitudes=np.asarray(amplitudes,dtype=float)
    if amplitudes.shape!=(harmonics,) or (amplitudes<0).any():
        raise ValueError('amplitudes must be a length-harmonics nonnegative array')
    phase=np.arange(n)*angle
    U=np.empty((n,2*harmonics))
    for j in range(harmonics):
        w=np.sqrt(amplitudes[j]/n)
        U[:,2*j]=w*np.cos((j+1)*phase)
        U[:,2*j+1]=w*np.sin((j+1)*phase)
    return U


def solve(b, harmonics:int=1,angle:float=ANGLE,amplitudes=None):
    """Direct exact Woodbury solve for K=I+UU.T; returns (solution, U).

    Supports 1-D RHS or multiple column RHS. No eigenvalue optimization.
    """
    rhs=np.asarray(b)
    if rhs.ndim not in (1,2):raise ValueError('RHS must be vector or column matrix')
    U=features(len(rhs),harmonics,angle,amplitudes)
    small=np.eye(U.shape[1])+U.T@U
    x=rhs-U@np.linalg.solve(small,U.T@rhs)
    return x,U


def residual(x,b,U):
    b=np.asarray(b)
    return np.linalg.norm(x+U@(U.T@x)-b)/np.linalg.norm(b)


if __name__=='__main__':
    for N in (13,64,512,4096,16384):
        b=urt_forcing(N)
        x,U=solve(b,3)
        print(f'{N:6d} variables | 6x6 reduced inverse | relative residual {residual(x,b,U):.2e}')