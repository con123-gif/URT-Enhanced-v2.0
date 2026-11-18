# Q161bb — original Q101 face-source covariance purity

**Status:** THEOREM — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.

For the 30 original Q101 frustrated ground words, original rank-eight vertex projector Pl, and nonlinear twenty-face sources f_s=(C Pl s)^{odot 2}, let Sigma=(1/30) sum_s (f_s-mu)(f_s-mu)^T, mu=3/5 * 1.

The exact native-source computation gives Tr(Sigma^2)=183808/9375 and Tr(Sigma)=416/25. The previous Q161az certificate establishes [Sigma,A]=0, while Q161ba establishes native dual-face A eigenspace dimensions (1,4,5,3,3,4) and sector traces (0,32/15,368/75,16/5,0,32/5), for eigenvalues (3,-2,1,sqrt(5),-sqrt(5),0).

On any eigenspace of dimension m with sector trace w, the Frobenius inequality Tr(Sigma_sector^2)>=w^2/m holds with equality precisely when Sigma_sector=(w/m)I. Summing the six exact sector bounds gives 183808/9375, identical to the independently computed Tr(Sigma^2). Every nonnegative excess therefore vanishes. Thus Sigma is **exactly scalar** on each native A eigenspace, with eigenvalues (0,8/15,368/375,16/15,0,8/5), multiplicities (1,4,5,3,3,4), and rank 16. In particular Sigma is a polynomial in the native A (via Lagrange interpolation); no fitted coefficient or physical normalization is used.

**Execution:** standalone `python research_archive/2026-11-18_q161bb_native_covariance_purity/Q161BB_CERT.py` recomputes the 30 original sources by running the original Q161ba certificate and then performs the exact Fraction-pair purity check. Local equivalent native-operator standalone script executed exit 0, with Tr(Sigma^2)=183808/9375. The repository wrapper must be re-executed by CI after commit.

**Limits:** This is finite A5 covariance structure, not a Q96 Ward coupling, H64-to-face source derivation, 24-clock dynamics, particle mass, or ARF.

**Next question:** Can the original Q96 charged chiral vertex restricted to these rank-16 covariance sectors intertwine every native Q96 generator while transporting through the actual 24-clock?
