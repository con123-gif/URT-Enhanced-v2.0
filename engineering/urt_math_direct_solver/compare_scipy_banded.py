"""Independent matched SciPy baseline: block-local + URT harmonic rank-six.

The matrices and right-hand sides are *identical* in both methods. Reports
reconstruction residual, relative error and end-to-end Python wall time.
Expected: compiled SciPy solve_banded often substantially outperforms this
reference Python block elimination despite both having O(N) asymptotics.

Run from this directory:
 OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python compare_scipy_banded.py
Requires NumPy and SciPy. Times depend on hardware and BLAS implementation.
"""
import json,time
import numpy as np
from scipy.linalg import solve_banded
from URT_structure_engine import (BlockTridiagonal,LocalPlusGlobalResonance,
                                  urt_features,URT_ANGLE)

def test_one(n,repeat=3):
    blocks=np.tile(np.array([[[3.]]]),(n,1,1))
    lower=np.tile(np.array([[[-1.]]]),(n-1,1,1))
    U=urt_features(n,3,weights=[.7,.2,.02])
    b=np.cos(np.arange(n)*URT_ANGLE)
    ab=np.zeros((3,n))
    ab[0,1:]=-1
    ab[1,:]=3
    ab[2,:-1]=-1
    oldtimes=[];newtimes=[]
    for _ in range(repeat):
        t=time.perf_counter()
        base=BlockTridiagonal(blocks,lower)
        model=LocalPlusGlobalResonance(base,U)
        old,cert=model.solve(b)
        oldtimes.append(time.perf_counter()-t)
        t=time.perf_counter()
        # One compiled tridiagonal solve for 1 RHS and 6 harmonic columns
        # followed by a small 6x6 Woodbury correction.
        ans=solve_banded((1,1),ab,np.column_stack((b,U)),check_finite=False)
        Y=ans[:,1:]
        fast=ans[:,0]-Y@np.linalg.solve(np.eye(6)+U.T@Y,U.T@ans[:,0])
        newtimes.append(time.perf_counter()-t)
    applied=lambda x: 3*x-np.r_[0.,x[:-1]]-np.r_[x[1:],0.]+U@(U.T@x)
    rel=np.linalg.norm(applied(fast)-b)/np.linalg.norm(b)
    difference=np.linalg.norm(old-fast)/np.linalg.norm(fast)
    assert rel<1e-12 and difference<1e-12
    return dict(n=n,methods=["Python block elimination + Woodbury","SciPy solve_banded + Woodbury"],
        Python_time_median_s=float(np.median(oldtimes)),
        scipy_time_median_s=float(np.median(newtimes)),
        Python_over_scipy_time_ratio=float(np.median(oldtimes)/np.median(newtimes)),
        relative_equation_residual=float(rel),
        relative_solution_difference=float(difference))

if __name__=="__main__":
    results=[test_one(n) for n in (4096,16384,65536)]
    print(json.dumps(results,indent=2))
    print("PASS: same problem, same answer; SciPy comparison included.")
