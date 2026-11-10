# Synchronized history-clock transfer and exact dark-mode clock selection

Original first-principles *conditional construction*, 10 November 2026. No fitting and no historical ARF inputs. Retains the 190-cochain Hodge factor, 64 signed histories, 24 clock positions and 64 matter carrier, but **does not claim** to derive their coupling to matter.

Define Q[h,2h mod64]=Q[h,(2h+1) mod64]=1/2 and let S be the cyclic 24-clock shift (S f)(t)=f(t+1). The synchronized update U=Q⊗S advances history and clock simultaneously. Q^6=P=J64/64; S^24=I. Thus U^6=P⊗S^6, U^24=P⊗I. Rank U=32×24=768; rank(I−U)=1535, so the fixed state is one-dimensional. However U^24 retains 24 clock phases; this is not total mixing.

For centered history source g5 and dark contrast d from the archived all-five-solid source, C_d5(k)=E[d Q^k g5]. Its exact generating polynomial, independently checked against the 64-history labels, is

G_d5(z)=−(3√5/40) z(z+1)(z²−2z+2).

A 24-clock Fourier mode f_m(t)=exp(2πimt/24) satisfies Sf_m=ζ_m f_m with ζ_m=exp(2πim/24). Therefore the synchronized forward dark-to-hidden response in that mode is **exactly** G_d5(ζ_m). No new coupling coefficient is introduced.

**Exact clock selection theorem:** G_d5(ζ_m)=0 for a 24th root of unity ζ_m if and only if m=12. Proof: ζ≠0, ζ+1=0 iff ζ=−1 (m=12), while ζ²−2ζ+2=0 has roots 1±i, whose modulus is √2, not 1. All other 23 clock Fourier modes have nonzero dark-to-five forward response. In particular m=0 gives −3√5/20; m=6 gives −3√5/20−(9√5/40)i.

This is an exact *neutral* chronology/clock mode selection, not a charge-two physical Wilson vertex or photon coupling. The full 190×64×24×64 space is a carrier; no matter interaction or four physical ARFs is derived. Positivity/uniqueness of a physical transfer still requires additional principles. An explicit 1536×1536 matrix check and independent Fourier-polynomial checks pass in the accompanying Python program.
