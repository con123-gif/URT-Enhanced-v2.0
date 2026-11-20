# Q161df — original Q96/24-clock full resistance and Kirchhoff invariant

**Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Q161da and physical gates OPEN.

The original Q96 charge words are q8=(2/3,2/3,2/3,-1/3,-1/3,-1/3,-1,0), doubled and tripled and accompanied by charge conjugates. The charged squared-charge multiplicities are (4/9:36,1/9:36,1:12); 12 neutral channels are excluded by Moore–Penrose inversion. For the declared K=diag(q²)⊗L24, charge-traced effective resistance between clock sites separated by d is exactly R(d)=417 d(24-d)/24, d=0,...,23. The complete charge-traced Kirchhoff index over all 276 unordered clock pairs is 479550. R(6)=3753/2 and R(12)=2502.

**Proof.** The cycle Green kernel G(d)=575/288−d(24−d)/48 obeys L24 G=I−J/24 and has zero row sum. For each nonzero q, resistance is 2(G(0)−G(d))/q². Sum of reciprocal squared charges is 36(9/4)+36(9)+12=417. Sum over unordered clock pairs gives 417·24(24²−1)/12=479550. The standalone exact Fraction certificate asserts the difference equation at all 24 separations, the full resistance profile, and the sector-resolved sum.

**Execution:** Local Python 3 standalone certificate, exit 0 on 2026-11-20. No fitted or measured inputs. This is an invariant of the declared native charge-clock tensor, not a derived H64/Q125 embedding, physical propagator, or charge-Ward closure.

**Next question:** Identify the typed original H64/24/Q125-to-Q96 B_x and compute (I−P_E)B_x†Q96B_xE exactly.
