"""Independent checks of the URT structure compiler (no numerical fitting)."""
import unittest
import numpy as np
from URT_structure_engine import (DiagonalLowRank, phase_features, harmonic_solver,
     BlockTridiagonal, radial_quartic_solve,urt_boundary,oscillator_response, solve_problem,
     URT_ANGLE)


class StructureTests(unittest.TestCase):
    def test_lowrank_real_complex_and_singular_core(self):
        rng=np.random.default_rng(420)
        for complex_case in (False,True):
            n=38;r=4
            U=rng.normal(size=(n,r))*(.1)
            b=rng.normal(size=n)
            if complex_case:
                U=U+1j*rng.normal(size=(n,r))*.1
                b=b+1j*rng.normal(size=n)
            d=1+rng.random(n)
            core=np.diag([2,0,1,.5])
            op=DiagonalLowRank(d,U,core)
            x,cert=op.solve(b)
            dense=np.diag(d)+U@core@U.conj().T
            self.assertTrue(cert.stable)
            self.assertLess(np.linalg.norm(x-np.linalg.solve(dense,b)),1e-11)
    def test_harmonics_arbitrary_phase(self):
        rng=np.random.default_rng(100)
        n=107;h=3
        p=rng.uniform(-7,9,n)
        w=[0.2,1.7,0.4]
        U=phase_features(p,h,w)
        K=np.eye(n)+U@U.T
        op=DiagonalLowRank(np.ones(n),U)
        b=rng.normal(size=n)
        x,cert=op.solve(b)
        self.assertLess(cert.relative_residual,1e-12)
        self.assertLess(np.linalg.norm(K@x-b),1e-11)
    def test_urt_large(self):
        n=16384
        op=harmonic_solver(n,3,weights=[5,1,.1])
        b=np.cos(np.arange(n)*URT_ANGLE)
        x,cert=op.solve(b)
        self.assertLess(cert.relative_residual,1e-12)
        self.assertEqual(cert.reduced_dimension,6)
    def test_chain_vs_dense(self):
        rng=np.random.default_rng(144)
        t=15;d=3
        diag=np.array([4*np.eye(d)+rng.random((d,d))*.0 for _ in range(t)])
        coupling=.2*rng.normal(size=(t-1,d,d))
        op=BlockTridiagonal(diag,coupling)
        b=rng.normal(size=t*d)
        x,cert=op.solve(b)
        dense=np.zeros((t*d,t*d))
        for k in range(t):
            dense[k*d:(k+1)*d,k*d:(k+1)*d]=diag[k]
            if k<t-1:
                dense[(k+1)*d:(k+2)*d,k*d:(k+1)*d]=coupling[k]
                dense[k*d:(k+1)*d,(k+1)*d:(k+2)*d]=coupling[k].T
        self.assertLess(np.linalg.norm(dense@x-b)/np.linalg.norm(b),1e-12)
        self.assertTrue(cert.stable)
    def test_scalar_nonlinear(self):
        n=191
        op=harmonic_solver(n,3,weights=[3,.8,.1],diagonal=1.3)
        b=np.cos(np.arange(n)*URT_ANGLE)/np.sqrt(n)
        x,t,cert=radial_quartic_solve(op,b,g=.6)
        self.assertLess(cert.relative_residual,1e-10)
        self.assertAlmostEqual(t,.6*np.vdot(x,x).real,places=11)
    def test_physics_oscillator(self):
        n=72
        b=np.sin(np.arange(n)*URT_ANGLE)
        weights=np.array([.8,.1])
        x,cert=oscillator_response(n,b,omega=1.3,harmonics=2,weights=weights)
        U=phase_features(np.arange(n)*URT_ANGLE,2,weights)
        K=(5-1.3**2+1j*1.3*.1)*np.eye(n)+U@U.T
        self.assertLess(np.linalg.norm(K@x-b)/np.linalg.norm(b),1e-12)
        self.assertTrue(cert.stable)
    def test_boundary(self):
        for n in [13,64,125]:
            xminus,terminal,sensitivity=urt_boundary(n,target=0,x0=1)
            self.assertLess(abs(terminal),1e-10)
            self.assertGreater(sensitivity,0)
    def test_dispatch_and_dense_fallback(self):
        b=np.linspace(-1,1,100)
        x,c=solve_problem({'kind':'harmonic','b':b,'harmonics':2,'weights':[1,.2]})
        self.assertLess(c.relative_residual,1e-11)
        A=np.diag([2.,3.,4.])+np.ones((3,3))*.05
        x,c=solve_problem({'kind':'dense','b':[1.,0.,-1.],'matrix':A})
        self.assertEqual(c.method,'dense numerical fallback')
        self.assertLess(c.relative_residual,1e-12)
        with self.assertRaises(ValueError):
            solve_problem({'kind':'arbitrary-nonlinear','b':b})

    def test_no_arbitrary_matrix_claim(self):
        # The interface cannot claim structure on unprovided arbitrary dense K.
        rng=np.random.default_rng(40)
        bad=np.eye(6)+rng.normal(size=(6,6))
        with self.assertRaises(ValueError):
            DiagonalLowRank(np.ones(6),bad.reshape(3,12))

if __name__=='__main__':unittest.main(verbosity=2)
