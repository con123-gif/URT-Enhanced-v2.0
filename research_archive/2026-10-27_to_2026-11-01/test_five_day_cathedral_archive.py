"""Finite checks for the Cathedral five-day research archive (27 Oct–1 Nov 2026).
Run: python research_archive/2026-10-27_to_2026-11-01/test_five_day_cathedral_archive.py
Requires numpy. No continuum QFT or theory-of-nature conclusion follows.
"""
import cmath
import math
import unittest
import numpy as np

PHI = (1 + math.sqrt(5)) / 2
DELTA = 3 / 20 - 80 * math.pi / (1053 * PHI)
ETA = -math.log(DELTA)

class FiveDayArchiveTests(unittest.TestCase):
    def test_platonic_hodge_moments(self):
        # (vertices, edges, faces, vertex degree, face perimeter)
        solids = ((4, 6, 4, 3, 3), (8, 12, 6, 3, 4),
                  (6, 12, 8, 4, 3), (20, 30, 12, 3, 5),
                  (12, 30, 20, 5, 3))
        self.assertEqual(sum(v+e+f for v,e,f,d,k in solids), 190)
        self.assertEqual(sum(8*e for v,e,f,d,k in solids), 720)
        fourth = [2*(v*d*(d+1)+f*k*(k+1)) for v,e,f,d,k in solids]
        self.assertEqual(fourth, [192,432,432,1200,1200])
        self.assertEqual(sum(fourth), 3456)
        self.assertEqual(2*len(solids), 10)

    def test_a5_exterior_square_character(self):
        chi5 = [5,1,-1,0,0]
        chi5_square = [5,5,-1,0,0]
        exterior = [(a*a-b)/2 for a,b in zip(chi5,chi5_square)]
        chi3 = np.array([3,-1,0,PHI,1-PHI])
        chi3p = np.array([3,-1,0,1-PHI,PHI])
        chi4 = np.array([4,0,1,-1,-1])
        np.testing.assert_allclose(exterior,chi3+chi3p+chi4)
        self.assertEqual(exterior[0],10)

    def test_gibbs_bkm_and_kms(self):
        self.assertTrue(0<DELTA<1)
        rho = np.diag([1/(4*(1+DELTA**2))]*4+
                      [DELTA**2/(4*(1+DELTA**2))]*4)
        self.assertAlmostEqual(float(np.trace(rho)),1)
        self.assertTrue(np.all(np.linalg.eigvalsh(rho)>0))
        self.assertAlmostEqual(math.exp(-2*ETA),DELTA**2)
        chi = 8*ETA*(1+DELTA**2)/(1-DELTA**2)
        self.assertAlmostEqual(chi,47.96697830338,places=7)

    def test_n_throat_and_entropy_correction(self):
        for n in (2,4,10):
            pc = np.ones((n,n))/n
            pr = np.eye(n)-pc
            self.assertLess(np.linalg.norm(pc@pr),1e-12)
            ev = sorted(np.linalg.eigvalsh(pc+DELTA**2*pr),reverse=True)
            self.assertAlmostEqual(ev[0],1)
            np.testing.assert_allclose(ev[1:],[DELTA**2]*(n-1),atol=1e-13)
            self.assertEqual(4+4*n+4*(n-1),8*n)
        nstar = 1+DELTA**-2  # formal real-valued crossover
        pcommon = 1/(1+(nstar-1)*DELTA**2)
        self.assertAlmostEqual(pcommon,.5)
        full = -pcommon*math.log(pcommon)-(nstar-1)*(DELTA**2/2)*math.log(DELTA**2/2)
        self.assertAlmostEqual(full,math.log(2)+.5*math.log(nstar-1))
        self.assertGreater(full,math.log(2))

    def test_24_step_berry_phase(self):
        u = [np.array([1,cmath.exp(2j*math.pi*k/24)])/math.sqrt(2)
             for k in range(24)]
        z = np.prod([np.vdot(u[k],u[(k+1)%24]) for k in range(24)])
        self.assertAlmostEqual(z.real,-math.cos(math.pi/24)**24,places=12)
        self.assertAlmostEqual(z.imag,0,places=12)
        self.assertAlmostEqual(((z/abs(z))**5).real,-1,places=12)

    def test_cern_density_from_projector(self):
        sx = np.array([[0,1],[1,0]],dtype=complex)
        sy = np.array([[0,-1j],[1j,0]],dtype=complex)
        sz = np.diag([1,-1]).astype(complex)
        th,az = .9,1.3
        n = (math.sin(th)*math.cos(az),math.sin(th)*math.sin(az),math.cos(th))
        nt = (math.cos(th)*math.cos(az),math.cos(th)*math.sin(az),-math.sin(th))
        np_ = (-math.sin(th)*math.sin(az),math.sin(th)*math.cos(az),0)
        mat = lambda t:t[0]*sx+t[1]*sy+t[2]*sz
        P,dt,dp = (np.eye(2)+mat(n))/2,mat(nt)/2,mat(np_)/2
        f = (-1j*np.trace(P@(dt@dp-dp@dt))).real
        self.assertAlmostEqual(f,math.sin(th)/2,places=12)

    def test_golden_fraction_recursion(self):
        x = 0
        for _ in range(24):
            x = (1-x)/(2-x)
        self.assertAlmostEqual(x,46368/121393,places=14)
        self.assertLess(abs(x-PHI**-2),2e-10)

if __name__=="__main__":
    unittest.main()
