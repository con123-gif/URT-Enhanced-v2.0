# Q161: exact all-11-direction stationary-flux theorem and CI source repair

Date: 2026-11-17. Status **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING** for discrete stationarity; finite Hessian stability **CI PENDING**, continuum and physical observables **OPEN**.

## Independent first-principles result
On the native 4D (6\times2^3) lattice, let (d_j\) be the three spatial shifts and the eight \((1,b_1,b_2,b_3)\) temporal shifts, with \(b_i\in\{0,-1\}\). The candidate gauge angles (in units of \(\pi\)) are \(a_i=3/4\) spatial and \(a_{(1,b)}=-1/4+(3/4)m\), where \(m=-\sum_i b_i\). These reproduce the previously found nonzero triangular flux \(3\pi/2\).

On allowed fermion momenta (p_0=(2t+1)\pi/6\), (p_i=\pi n_i\) ((t=0,\dots,5\), (n_i\in\{0,1\}\)), define the involution
\[
S(t,n_1,n_2,n_3)=(-t\bmod6,1-n_1,1-n_2,1-n_3).
\]
For all 11 directions and all 48 momenta, the exact rational identities are
\[
p\cdot d_j+a_j+(Sp)\cdot d_j+a_j/3\equiv0\pmod{2\pi},
\quad
p\cdot d_j+2a_j/3+(Sp)\cdot d_j+2a_j/3\equiv0\pmod{2\pi}.
\]
For the temporal links, the phase sums reduce to \(\pi(t+t')/3\), which is 0 or 2\(\pi\) since \(t'=(-t)\bmod6\). For spatial links each sum is exactly 2\(\pi\).

Thus \(E_{q=1}^2(p)=E_{q=1/3}^2(Sp)\) and \(\partial_{A_j}E_1^2(p)=-3\partial_{A_j}E_{1/3}^2(Sp)\), independent of the original Wilson constants r,M and of the KMS spectral weights. Q96 multiplicities 3 and 9 cancel. For q=2/3, \(E^2(p)=E^2(Sp)\) and its derivatives are opposite. Charge conjugates cancel analogously. Therefore **the original finite graded spectral logdet has zero first gauge variation at Astar for any nonnegative fixed chiral mass-squared spectrum whose logdet is defined**, not just the Q125 chosen transfer. This does NOT establish positivity of the second variation, a unique vacuum, a photon pole or a continuum field theory.

Certificate: `Q161_FLUX_EXACT_STATIONARITY.py`, stdlib fractions, 1056 exact checks; **executed locally with exit 0** (2026-11-17).

## Source-native certificate repair
The original `Q161_GRADED_NONZERO_FLUX_NATIVE_CERT.py` references `k` in `mu2=(k*np.r_[er,el])**2` **without defining k**. GitHub orchestrator summary at 2026-11-17T14:13:00Z reported FAIL for `research.q161_graded_nonzero_flux_native` (run 44095436434). The repaired source explicitly sets `k_KMS=float(v.DELTA)/(1+float(v.DELTA)**2)`, then uses that in `mu2`. This is the already frozen KMS scale, not a fit or compensating parameter. No Hessian sign, threshold or original operator is changed. Full native CI must be rerun: **do not label 481-positive assertion as source-native verified until that test returns exit 0**. If a new assertion fails, preserve the counterexample and original data; do not tune the test to pass.

## RESUME HERE
Run the registered native `research.q161_graded_nonzero_flux_native` after this correction. Once (and only once) 481-mode finite result is verified, compute low-momentum photon polarization around this nonzero-flux stationary vacuum for multiple NS using the native 11-link Wilson current and Q125 Q96 mass spectrum, keeping the triangle flux invariant. Determine actual \(Z_t,Z_s\) and \(c_{\rm eff}\) without enforcing isotropy or fitting a regulator. Original ungraded Q152 is not a premise.

## 2026-11-17 further exact upgrade: larger-volume and signed-flux pair

The phase involution extends beyond the 48-site (6\times2^3) box to **every** even spatial side (N_s=2n\) and every antiperiodic temporal length (N_t=6m\), for the same 11 geometric displacement types and the same Astar. On fermion momenta (p_0=\pi(2t+1)/N_t\), (p_i=2\pi n_i/N_s\), set
\[
t'=N_t/6-t-1\pmod{N_t},\qquad n_i'=N_s/2-n_i\pmod{N_s}.
\]
Then (p_0+p_0'=\pi/3\pmod{2\pi}\) and (p_i+p_i'=\pi\pmod{2\pi}\). Thus for each of the 11 link directions (d_j\), the Wilson phases of charge 1 and 1/3 satisfy (\theta_1(p)+\theta_{1/3}(p')=0\pmod{2\pi}\), as do the two charge-2/3 phases. Hence the Q96 charge multiplicity cancellation of the graded determinant **persists on the full even-volume sequence**. The same involution maps the continuous Brillouin torus to itself; an appropriately defined thermodynamic momentum integral is also stationary. **No Hessian positivity or physical Lorentz invariance follows from stationarity.**

The 12 oriented temporal/spatial triangle classes each carry exactly (3\pi/2\), giving (W_{\rm tri}(Astar)=e^{i(1/3)(3\pi/2)}=i\), while the charge-conjugate background gives (-i\). These configurations are **not gauge-equivalent** because their local minimal-charge Wilson loops differ. Equal (+q/-q\) Q96 multiplicities imply (\Gamma(A)=\Gamma(-A)\), so the two stationary orientations have exactly equal action. This is a **conditional finite gauge-flux doublet**, not established spontaneous CP breaking or baryogenesis.

Independent certificate uses only exact Fraction arithmetic: test volumes ((N_t,N_s)=(6,2),(6,4),(6,6),(12,2),(12,4),(12,6),(18,4),(24,8)\); 409,728 phase congruences and all 12 triangle types passed in the model sandbox. Stored in `Q161_FLUX_EXACT_STATIONARITY.py`. The registered native graded 481-mode CI is separately pending; do not mark it PASS until it executes.
