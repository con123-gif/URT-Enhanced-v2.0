# Newton's Cathedral — Q125 finite-state physical-transition calculation
**Executed and independently rechecked 17 November 2026.**  This note is about a specified finite continuous-time heat-bath model, not a claimed prediction of physical seconds or cosmological baryogenesis.

## Native geometry and exact spectrum

The golden icosahedron has 12 vertices, 30 edges and 20 triangular faces. Its active-center energy is

\[
E(s,c)=\sum_{\langle ij\rangle}s_i s_j-\varphi c\sum_i s_i,
\qquad \varphi=(1+\sqrt5)/2.
\]

Exhaustive enumeration of all 8192 states gives 444 states with \(E\le-10\), in three exact levels:

- 60 minima at \(E_g=-8-2\sqrt5\),
- 240 intermediates at \(E_i=-9-\sqrt5\),
- 144 saddles at \(E_s=-10\).

The native undirected 13-contact flip graph has exactly 1032 edges: 360 ground-to-intermediate, 600 intermediate-to-saddle, and 72 central-contact saddle-to-saddle. It is connected. This agrees with the original native Q124/Q125 archive. The original Q125 exact source calculation separately certifies 720 nonzero coherent wedge currents and 312 zero currents. **These distributions are not interchangeable:** the 480 lower-strength coherent links are not the 360 ground-to-intermediate graph edges.

The two exact nonzero coherent current magnitudes are \(j_1=8\sqrt5/5\) (480 links) and \(j_2=4+12\sqrt5/5\) (240 links), yielding
\[
\sum_{\langle xy\rangle}J_{xy}^2
=480j_1^2+240j_2^2=16896+4608\sqrt5.
\]
On Q96 with both offdiagonal directions,
\(\mathrm{Tr}H_{\rm ch}^2=192\sum J^2=3244032+884736\sqrt5\).

## Exact channel separation and physical-open-system candidate

Original Q125's source \(f_{s,c}\) depends only on outer spins \(s\). On all 72 central flip links \((s,+1)\leftrightarrow(s,-1)\), \(f_{s,+1}=f_{s,-1}\), and because \(W^T=-W\), \(J_{s+,s-}=\tfrac12 f_s^T W f_s=0\).

Thus for \(C=\mathrm{diag}(c_x)\otimes I_{Q96}\), the source-native coherent Hamiltonian has the exact conservation law \([H_{\rm ch},C]=0\). **Coherent evolution alone cannot reverse the central contact.**  This is a physical distinction between coherent charged transport and thermally activated reversal.

A candidate charge-covariant completely positive dynamics is obtained from jump operators
\[
L_{y\leftarrow x}=\sqrt{\nu r_{xy}}\,|y\rangle\langle x|\otimes U_{yx},\qquad
r_{xy}={1\over1+e^{\beta(E_y-E_x)}},
\]
where \(Q_yU_{yx}=U_{yx}Q_x\) is the Q124 native charge-compatible transport and \(\nu\) is a positive attempt frequency (not yet derived). The standard Lindblad dissipator constructed from these jumps is trace preserving, completely positive and charge covariant. The classical diagonal rates obey local detailed balance \(r_{xy}/r_{yx}=e^{-\beta(E_y-E_x)}\). Combining it with \(-i[H_{\rm ch},\cdot]\) is a **proposed** coherent-dissipative evolution, not an established KMS stationary quantum theory: \([H_{\rm ch},\mathrm{diag}(E)]\) need not vanish.

The central spin expectation in this candidate obeys the exact operator identity
\[
{d\over dt}\langle C\rangle=-\nu\left(P_{\rm saddle,c+}-P_{\rm saddle,c-}\right),
\]
where the two terms are the total diagonal probabilities in the 72 saddle states of each central orientation. This follows because each saddle central flip has zero energy difference and heat-bath jump rate \(\nu/2\). No outer flip changes \(c\), and the coherent term commutes with \(C\).

## Executed dimensionless thermal reversal calculation

The 444-state *classical* heat-bath generator is \(Q_{xy}=r_{xy}\) on each native link and \(Q_{xx}=-\sum_{y\sim x}r_{xy}\). Similarity by \(\pi_x\propto e^{-\beta E_x}\) yields a real symmetric nonnegative matrix, which was diagonalized directly (444×444). Setting \(\nu=1\) defines the unit of time; its physical calibration is open.

At the frozen \(\beta=\eta_\Delta=-\log\Delta=5.9957979867413\):

- exact numerical slowest nonzero eigenvalue: \(\lambda_1=7.044035094572\times10^{-7}\),
- asymptotic Eyring formula \((29/15)e^{-2(\sqrt5-1)\beta}=7.063308006337\times10^{-7}\), ratio \(0.997271404\),
- next eigenvalue: approximately \(2.3097194\times10^{-4}\), separating the slow center-reversal mode by factor \(328\),
- effective *late-time* symmetric two-basin forward rate: \(\lambda_1/2\approx3.52201755\times10^{-7}\) per unit attempt time; slow relaxation time \(1/\lambda_1\approx1.41964\times10^6\) time units,
- equilibrium populations: ground \(0.9975872126824\), intermediate \(0.00241191260877\), saddle \(8.74708851272\times10^{-7}\),
- mean central-flip traffic at equilibrium: \(P_{\rm saddle}/2=4.37354425636\times10^{-7}\) flips per unit attempt time.

At symmetric equilibrium \(P_{\rm saddle,c+}=P_{\rm saddle,c-}\), so \(d\langle C\rangle/dt=0\). A physical CP-odd bias and baryon-number-violating gauge mechanism must be separately derived to connect this reversal to baryogenesis; the geometric saddle alone does not fix \(n_B/n_\gamma\).

## +2 relative-sheet resonant filter

Using the actual 20-face dual dodecahedral Laplacian \(L_D=3I-A_D\), with \(A_D\) joining faces that share an edge (not \(6I-CC^T\)), the exact identity \(C^TC=15I-2L_I\) holds. For a general relative-sheet shift \(\delta\), define
\[
D_\delta=L_I C^T-C^T(L_D+\delta I_{20}).
\]
Its squared singular spectrum on \(1\oplus3\oplus3'\oplus5\) is
\[
15\delta^2\;(\times1),\quad
(5+2\sqrt5)(2-\delta)^2\;(\times3),\quad
(5-2\sqrt5)(2-\delta)^2\;(\times3),\quad
3(4-\delta)^2\;(\times5).
\]
At \(\delta=2\), this gives exactly \(0^{(6)},12^{(5)},60^{(1)}\); the triplets alone are resonant. \(\delta=0\) resonates the singlet and \(\delta=4\) the quintet. This is a precise six-dimensional selection rule *conditional on choosing the resonance criterion*, not a determination of physical sheet energies or spacetime masses.

## Research status and next physical test

This calculation closes **the thermal crossover timescale in units of the chosen heat-bath attempt clock** and proves that coherent and thermal central-reversal channels are distinct. It does not derive the physical microscopic attempt frequency, the coherent-to-dissipative normalization, OS reflection positivity, or electroweak baryon-number violation.

Next physical test: construct and measure the gauge/topological charge transported along the **72 central-flip reversal paths**, using native Q96 SU(2) transport plus spacetime Wilson loops. If their topological charge is zero, the finite saddle is not automatically an electroweak sphaleron. If nonzero, derive the anomaly and real-time rate relation; do not infer it from the 444-state graph alone.

## Reproducibility

Run `python cathedral_444_physical_reversal.py` from the same directory. Uses NumPy/SciPy/SymPy. Calculation was executed successfully in the current session, including repeated \(\beta=3,4,\eta_\Delta,7.5,9\) eigenvalue checks. **No changes made to the user's GitHub repository.**