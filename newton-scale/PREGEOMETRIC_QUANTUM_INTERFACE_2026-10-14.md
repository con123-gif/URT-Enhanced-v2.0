# Newton–Platonic pregeometric interface: exact information-preserving lift

14 October 2026. Standalone mathematics; optional Cathedral interpretation.

## Hypothesis being tested
Below an unknown physical transition, conventional particle, field and even spacetime degrees of freedom may cease to be fundamental. Five Platonic hidden-cube labels should therefore be treated as *history relations*, not presumed to be five points inside pre-existing metric spacetime. This is an hypothesis, not evidence quantum mechanics breaks at Planck.

## Exact five-simplex state operators
The five alternating tetrahedral modes in the inscribed cube compound generate a real 4-simplex. In the zero-sum four-space H4 ⊂ R5, with P=I5−J5/5, define Q_j=(5/4)P|j><j|P. Then Q_j^2=Q_j, Tr Q_j=1, Tr Q_i Q_j=1/16 (i!=j), sum Q_j=(5/4)P. Consequently M_j=sqrt(4/5)Q_j form a complete 5-outcome positive quantum instrument on H4.

## Two inequivalent history operations
*Coherent lift*: V|ψ>=sum_j |j>⊗M_j|ψ>, mapping H4 isometrically into C5⊗H4. V†V=I_H4. No information is irreversibly lost in the unobserved joint state; recursively retaining all record spaces supports arbitrarily deep coherent histories. This is conventional complex Hilbert-space mechanics (not a proof of something beyond quantum).

*Discarded-history map*: Phi(X)=sum_j M_j X M_j†=(4/5)sum_j Tr(Q_j X)Q_j. It is rank-one measure-and-prepare, hence entanglement-breaking. Exact rational 25x25 superoperator calculation gives eigenvalues 1 once, 3/4 four times, 0 twenty times on End(R5); restricting to End(H4) gives **1(x1),3/4(x4),0(x11)**. The surviving traceless sector is the simplex irrep 4. Under the A5 decomposition End(H4)=1+3+3prime+4+5, the 3+3prime+5 directions are annihilated in ONE pass. Thus using Phi as the universal fine-scale-to-quantum dynamical law is inconsistent with preserving those channels; the coherent lift is essential if those sectors are to survive and emerge later. This limitation is local to Phi, not a no-go for any sub-quantum framework.

The conditional cube-label transition is M_ij=4/5 if i=j, 1/20 otherwise, spectrum 1,3/4(x4). The nontrivial classical label memory contracts as (3/4)^n, while the coherent full history remains isometric. A log-length exponent under the **additional** Newton geometric identification ell_n=ell0 phi^-2n is -ln(3/4)/(2ln phi)=0.2989141761, but no physical clock or transition length follows from it.

## Physical constraints on a sub-quantum law
If "subquantum" means an actual non-Hilbert ontology, rather than a pregeometric quantum information substrate, this construction does NOT provide it. A local, measurement-independent, single-outcome classical hidden-variable model cannot reproduce the experimentally confirmed Bell-inequality violations. A deeper law must either retain a sufficiently coherent/nonclassical operational structure or specify which Bell assumptions it modifies, while recovering all successful quantum predictions.

An actual physics emergence proof requires:
1. A microscopic coherent dynamical law, not only an isometric embedding.
2. An observable algebra and Born-rule/measurement/entanglement interpretation with Bell correlations.
3. A coarse-graining/continuum map recovering effective canonical quantum fields, Lorentzian light cones and universal stress-energy sourcing.
4. A physical crossover prediction separating Newton Scale's pregeometric sector from ordinary quantum gravity, without setting the crossover by hand equal to Planck.
5. Held-out measurements.

There is no physical proof of a sub-Planck transition here, and no inference that arbitrary Euclidean refinements are operational measurable distances.

## Related external approaches
Oriti, *Disappearance and emergence of space and time in quantum gravity* (2014), https://doi.org/10.1016/j.shpsb.2013.10.006; group field theory condensate cosmology and quantum pregeometry literature. Bell tests: https://www.nobelprize.org/prizes/physics/2022/popular-information/ .

## Reproduce
Run newton-scale/pregeometric_coherent_history_exact.py using SymPy. All operator-eigenvalue checks use exact rational matrices.
