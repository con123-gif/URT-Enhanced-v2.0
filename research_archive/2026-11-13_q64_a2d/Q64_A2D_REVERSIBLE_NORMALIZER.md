# Q64 A2D — Native Q2 reversible-lift partition, and the missing Q3 normalization

Agent GPT; 2026-11-13. Status: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING for the exact finite Q2 identity; Gate A OPEN. This is a universal identity for the original Q2 successor support, not an evaluation of all 768 native Q3 dictionaries.

The original Q2 has successors h -> (2h mod 64, 2h+1 mod 64). For each x=0,...,31, rows x and x+32 share the same two successors (2x,2x+1). A reversible permutation must use each exactly once, so its local alternatives are (even,odd) and (odd,even). Let a=S_D[x,2x], b=S_D[x,2x+1], c=S_D[x+32,2x], d=S_D[x+32,2x+1] for the **original Q3 A5-twirled chronology** S_D. Its local row-conditioned probability of bijectivity is (ad+bc)/((a+b)(c+d)), provided denominators are positive. The 32 pairs have disjoint row sets and disjoint target pairs, hence the full bijection probability is the product of these factors. For a particular reversible lift sigma, conditional probability given bijectivity is exactly

    P_D(sigma | bijective) = product_x w_x(beta_x) / product_x (a_x*d_x+b_x*c_x),
    w_x(0)=a_x*d_x, w_x(1)=b_x*c_x.

In contrast, the Q64 rowwise-conditioned score is

    L_Q64(D,sigma) = product_x w_x(beta_x) / product_x ((a_x+b_x)*(c_x+d_x)).

Thus L_Q64(D,sigma) = P_D(sigma | bijective) * P_D(bijective). The latter factor can depend on D. Consequently, maximization over D of the two functionals is not logically equivalent, even though the optimal beta at a fixed D is identical. For the uniform original Q2, the probability of any one successor assignment is 2^-64, exactly 2^32 of those assignments are reversible, P(bijective)=2^-32 and each reversible lift has conditional probability 2^-32.

This identity is not a new proof that Q64's selected dictionary survives the change of normalization. In particular, this session did not reconstruct S_D numerically or recompute the 768-class ordering. No measured data, fitted constants or historical ARFs were used.

Execution: `python research_archive/2026-11-13_q64_a2d/Q64_A2D_REVERSIBLE_NORMALIZER.py` in GPT container, exit 0, Python/SymPy. The script uses native Q2 indexing and a symbolic universal polynomial identity applicable to the named original Q3 operator; it does not substitute a synthetic Q3 matrix.

RESUME HERE: Fetch and execute original `Q64_CONDITIONED_SELECTION_CERTIFICATE.py` and its Q3/Q61 imports; calculate for all 768 A5 classes the exact maximum of `product_x w_x(beta_x)/(a_x*d_x+b_x*c_x)` and compare its maximizing Q24 orbit with Q64 A1. Do not close Gate A.
