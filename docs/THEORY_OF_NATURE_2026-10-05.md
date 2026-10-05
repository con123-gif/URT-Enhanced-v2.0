# Newton's Cathedral / URT — Candidate Theory of Nature

**Date:** 2026-10-05  
**Status:** Candidate theory specification. Internal finite mathematics is distinguished from physical identifications and prospective empirical tests.

## 1. Fundamental statement

Nature is modeled as a finite positive history-selection machine whose admissible histories generate information geometry:

[
oxed{
	ext{possibility/history}
	o
	ext{URT selection}
	o
	ext{selected state}
	o
	ext{information geometry}
	o
	ext{geometry + gauge + matter}
	o
	ext{spacetime + cosmology}
}
]

URT selects admissible histories. Entropy/Kubo-Mori geometry structures the selected state.

The fundamental finite transfer is positive:

[
T=B^dagger Bge0.
]

The response geometry is generated from the selected vacuum state (ho_star), not from a separately normalized gravity sector.

---

## 2. Finite geometric backbone

The nontrivial spatial branch is

[
D=3,qquad N=13,
]

with centred icosahedral data

[
V=12,quad E=30,quad F=20,quad |A_5|=60.
]

The shell decomposes as

[
mathbb R^{12}=1oplus3oplus3'oplus5
]

and the centred Laplacian has spectrum

[
oxed{
0^{(1)},,
(6-sqrt5)^{(3)},,
7^{(5)},,
(6+sqrt5)^{(3)},,
13^{(1)}
}.
]

The six icosahedral axes are the physical/internal split of the standard (D_6	o H_3) golden construction. With symmetric conference operator (S),

[
S^2=5I_6,
]

[
P_pm=rac12left(Ipmrac{S}{sqrt5}ight),
]

and

[
M=rac{I+S}{2},
qquad M^2=M+I.
]

Hence

[
M|_3=phi I,qquad M|_{3'}=-phi^{-1}I.
]

Therefore

[
oxed{
alpha_{m URT}
=
rac{|lambda_{3'}|}{lambda_3}
=
phi^{-2}
}
]

and

[
oxed{
Delta	heta
=
2pialpha_{m URT}
=
rac{2pi}{phi^2}.
}
]

The same (M) preserves the (D_6) lattice and cycles the three nonzero discriminant classes of

[
D_6^*/D_6congmathbb Z_2^2.
]

---

## 3. Hopf topology, antipodal grading and the origin of the URT radial factor

The shell carries the binary-icosahedral lift

[
A_5	o2Isubset SU(2).
]

The twenty congruent triangular faces divide the sphere into equal solid angles

[
Omega_f=rac{4pi}{20}=rac{pi}{5}.
]

For the spin-(	frac12) Hopf/Berry connection the face phase is

[
oxed{gamma_f=rac{Omega_f}{2}=rac{pi}{10}},
]

so

[
20gamma_f=2pi,qquad c_1=1.
]

Let (Pi) exchange opposite dodecahedral face states. On the twenty-face carrier,

[
H_+=1oplus4_5oplus5,
qquad
H_-=3oplus3'oplus4_3.
]

The hidden incidence kernel is

[
oxed{
H_{m hid}=4_3oplus4_5.
}
]

Its KO-6 grading is therefore the restriction of antipodal parity:

[
oxed{
Gamma_F
=
Pi|_{H_{m hid}}
=
-P_{4_3}+P_{4_5}.
}
]

The hidden dodecahedral Laplacian is

[
oxed{
L_{m hid}
=
3P_{4_3}+5P_{4_5}
=
4I+Gamma_F.
}
]

Affinely normalize the two hidden levels:

[
Q
=
rac{L_{m hid}-3I}{5-3}
=
P_{4_5}
=
rac{I+Gamma_F}{2}.
]

Thus (Q^2=Q) and the dimensionless selector semigroup is

[
mathcal R_eta=e^{-eta Q}
=
P_{4_3}+e^{-eta}P_{4_5}.
]

For one normalized selector unit,

[
mathcal R_1|_{4_5}=e^{-1}.
]

The positive scalar channel is orientation-even and therefore sees the ten antipodal face pairs. Its unsigned projective Hopf phase is

[
Phi_{m proj}
=
10rac{pi}{10}
=
pi.
]

The candidate one-step radial selector weight is therefore

[
oxed{
kappa
=
Phi_{m proj}e^{-1}
=
rac{pi}{e}.
}
]

Together with the golden angular ratio,

[
oxed{
q_{m URT}
=
rac{pi}{e}
exp!left(irac{2pi}{phi^2}ight)
}
]

and

[
oxed{
Omega
=
ln(pi/e)+i,2pi/phi^2.
}
]

**Status discipline:** the finite identities entering this derivation are exact. The final identification of the primitive radial observable with the integrated projective scalar selector weight is the present parameter-free theory identification and must be tested by the complete transfer/continuum dictionary.

---

## 4. Dual rails and the master bandwidth

Let (	au_n(A)=operatorname{Tr}(A)/n).

On the twenty-face carrier,

[
oxed{
d_{m cl}
=
	au_{20}(P_3)
=
rac3{20}.
}
]

The centred 13-cell has one nonuniform radial singlet,

[
	au_{13}(P_{m rad})=rac1{13}.
]

The nine-dimensional exhaust response has

[
operatorname{Herm}(9)
=
mathbb RIoplusoperatorname{Herm}_0(9),
]

so

[
81=1+80
]

and

[
	au_{81}(P_{m tf})=rac{80}{81}.
]

The internal golden branch contributes (phi^{-1}), while the projective scalar Hopf sector contributes (pi). Therefore

[
oxed{
d_star
=
piphi^{-1}
rac1{13}
rac{80}{81}
=
rac{80pi}{1053phi}.
}
]

Hence

[
oxed{
Delta
=
d_{m cl}-d_star
=
rac3{20}-rac{80pi}{1053phi}
=
0.002489189840420375ldots
}
]

The two rails cannot coincide exactly because (d_{m cl}) is algebraic while (d_star) is a nonzero algebraic multiple of transcendental (pi).

---

## 5. Selected vacuum and entropy geometry

Define

[
eta_Delta=-lnDelta.
]

Then

[
e^{-eta_Delta}=Delta
]

and the selector amplitude is

[
oxed{
mathcal R_{eta_Delta}
=
P_{4_3}+Delta P_{4_5}.
}
]

The master state is its normalized Gram state,

[
oxed{
ho_star
=
rac{
mathcal R_{eta_Delta}^dagger
mathcal R_{eta_Delta}
}{
operatorname{Tr}
mathcal R_{eta_Delta}^dagger
mathcal R_{eta_Delta}
}
=
rac{
I_4oplusDelta^2I_4
}{
4(1+Delta^2)
}.
}
]

Thus the small hidden probability is

[
p_5=rac{Delta^2}{1+Delta^2}.
]

The responsive entropy is

[
S_{m resp}=k_BH_2(p_5),
]

with

[
oxed{
delta S_{m resp}
=
2k_Beta_Delta,delta p_5.
}
]

The local information metric is the BKM Hessian,

[
oxed{
g_{m BKM}
=
chi_{35}I_{16},
}
]

where

[
rac{chi_{35}}{k_B}
=
8eta_Delta
rac{1+Delta^2}{1-Delta^2}.
]

---

## 6. One response carrier for geometry and interactions

Because

[
Gamma_F|_{4_3}=-1,qquad
Gamma_F|_{4_5}=+1,
]

every

[
Xinoperatorname{Hom}(4_3,4_5)
]

is grading-odd:

[
{Gamma_F,X}=0.
]

The complete response carrier is

[
operatorname{Hom}(4_3,4_5)
cong4otimes4
=
1oplus3oplus3'oplus4oplus5.
]

The physical routing is

[
oxed{
16
=
1_Y
oplus3_W
oplus(3'oplus5)_C
oplus4_g.
}
]

The four-sheet differential calculus is

[
mathcal A_square=mathbb C^4,
qquad
D_square=J_4-I_4,
]

[
Omega^0_square=operatorname{Diag}(M_4),
qquad dim=4,
]

[
Omega^1_square=operatorname{OffDiag}(M_4),
qquad dim=12.
]

Hence

[
oxed{
M_4
=
4_{m geometry}
oplus12_{m gauge}.
}
]

Define the unified finite superconnection

[
oxed{
mathbb A
=
d_{m base}
+
delta_square
+
X,
}
]

with generalized curvature

[
oxed{mathbb F=mathbb A^2.}
]

The candidate fundamental response action is the relative-information functional around (ho_star); its quadratic response is fixed by the BKM Hessian. Separate arbitrary gauge and gravity normalizations are not permitted as fundamental inputs.

---

## 7. Gauge and matter sector

The finite algebra is

[
oxed{
mathcal A_F
=
mathbb Coplusmathbb Hoplus M_3(mathbb C).
}
]

With KO-dimension six and unimodularity,

[
oxed{
G_{m SM}
=
rac{SU(3)	imes SU(2)	imes U(1)}{mathbb Z_6}.
}
]

A minimal generation with (
u_R) has hypercharges

[
Y_Q=rac16,quad
Y_u=rac23,quad
Y_d=-rac13,quad
Y_L=-rac12,quad
Y_e=-1,quad
Y_
u=0,
]

with the archived anomaly checks closed algebraically.

The parent finite trace gives

[
K_Y:K_2:K_3=20:12:12,
]

and therefore

[
g_Y^2:g_2^2:g_3^2=rac35:1:1,
qquad
sin^2	heta_W=rac38
]

at the parent normalization point.

---

## 8. History and flavour

The canonical history carrier is

[
oxed{
H_{64}=H_{13}oplus H_{51}.
}
]

Species loading occurs before hidden elimination.

The typed Yukawa seed is

[
Y_f^{(0)}=S+delta Y_f
]

with (S:3	o3') the golden bridge and

[
delta Y_f=operatorname{mat}(Dz_f).
]

Primitive charge words:

[
u=(1,3,-4),quad
d=(1,-3,2),quad
e=(-3,-3,6),quad

u=(-3,3,0).
]

For each species, hidden history is eliminated by the exact Feshbach map

[
Sigma_f(z)
=
B_f(zI_{51}-D_f)^{-1}C_f,
]

[
mathcal F_f(z)
=
zI_{13}-A_f-Sigma_f(z).
]

Physical poles are to be obtained target-free from

[
oxed{det K_f(z)=0.}
]

Mixing then follows from the resulting diagonalizing frames,

[
V_{m CKM}=U_u^dagger U_d,
qquad
U_{m PMNS}=U_e^dagger U_
u.
]

Observed masses and mixing angles are forbidden as selector inputs.

---

## 9. Gravity and continuum physics

The geometry quartet (4_g) is the unique coframe response sector. The finite entropy variation is

[
delta S
=
2k_Beta_Delta,delta p_5.
]

The active continuum dictionary is

[
	ext{centred 13-cell}
leftrightarrow
	ext{small causal diamond},
]

[
	ext{12-shell}
leftrightarrow
	ext{diamond waist},
]

[
4_3oplus4_5
leftrightarrow
	ext{hidden interior},
]

and at the variation level

[
oxed{
delta S_{m Cathedral}
=
delta S_{m Casini}.
}
]

The theory does not postulate a separate fundamental Einstein action. Its claim is that local Lorentz invariance, the unique coframe sector, entropy equilibrium and the infrared two-derivative limit place the geometry sector in the Einstein-Hilbert universality class.

Similarly, the gauge sectors must approach Yang-Mills in the infrared as the leading local gauge-invariant continuum operators of the same finite response machine.

The finite machine is therefore taken as UV/fundamental; Standard Model QFT and GR are its candidate infrared universality class.

---

## 10. Dimensionless physical outputs and units

The theory is fundamentally dimensionless.

No measured (M_Z), particle mass, Newton constant or laboratory length is a fundamental axiom.

A dimensional laboratory datum may be used only after all dimensionless ratios have been frozen, as a unit conversion.

The internal electromagnetic scalar remains

[
oxed{
alpha_{m root}^{-1}
=
137
+
rac{17572}{1215}Delta
-
rac9{65}Delta^2
=
137.035999178195ldots
}
]

and its identification with the physical electromagnetic current residue is a decisive continuum test.

Retained finite cosmology ratios are

[
oxed{
Omega_m=rac6{19},
qquad
Omega_Lambda=rac{13}{19}.
}
]

They are candidate outputs whose continuum Friedmann derivation remains a physical gate.

---

## 11. Fundamental object

The candidate theory is summarized by

[
oxed{
mathfrak C
=
left(
mathcal H,,
T=B^dagger B,,
Gamma_F,,
mathcal A_F,,
mathcal R_{m URT},,
ho_star,,
g_{m BKM},,
mathbb A
ight).
}
]

Every physical observable must be obtained as a spectrum, pole, residue, holonomy, response, correlation function or controlled continuum limit of this object.

No additional freely adjustable dimensionless coupling is allowed.

---

## 12. Falsification gates

The candidate theory fails if any required physical identification needs a new free dimensionless parameter, or if prospective calculations/experiments contradict the frozen machine. In particular:

1. target-free (H_{64}) dynamics must produce the physical three-family flavour structure;
2. the continuum electromagnetic current must identify (alpha_{m root}) without an extra multiplier;
3. the gauge sectors must acquire the Standard Model current algebra and continuum normalization from the same state;
4. the (4_g) sector must produce a universal massless spin-2 infrared response;
5. entropy/coframe coarse graining must yield the Einstein universality class;
6. dimensionless mass ratios must follow from the transfer spectrum/history machine;
7. prospective predictions must be frozen before comparison.

Agreement with quantities already known during construction is not counted as independent validation.

---

## 13. Current verdict

Newton's Cathedral / URT is now sufficiently specified to be treated as a **candidate theory of nature** rather than merely a collection of mathematical motifs.

That statement is internal and methodological, not empirical certification.

The remaining program is verification of one already-defined machine:

[
oxed{
	ext{finite URT/Cathedral}
longrightarrow
	ext{target-free observables}
longrightarrow
	ext{continuum Standard Model + gravity}
longrightarrow
	ext{blind experimental tests}.
}
]
