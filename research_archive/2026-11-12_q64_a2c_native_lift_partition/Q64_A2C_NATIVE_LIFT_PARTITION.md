# Q64 A2C — Exact native reversible-lift partition

Status: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Gate A remains open.

Let Q2 be the original six-bit successor adjacency, Q2[h,k]=1 precisely for k=2h or 2h+1 modulo 64. Let S_D be the original Q3 A5-twirled chronology, and let p_D(h,k)=S_D[h,k]/(S_D[h,2h]+S_D[h,2h+1]) on these two successors, assuming nonzero denominators as in Q64 A1.

For x=0,...,31 put a_x=p_D(x,2x), b_x=p_D(x+32,2x). Both rows x and x+32 have the same two destinations {2x,2x+1}. Bijectivity of a Q2-respecting map forces opposite destination choices. Thus every reversible lift is indexed by 32 bits and there are exactly 2^32 lifts.

**Exact partition identity.** Under the *additional premise* that all 64 row destinations are sampled independently according to p_D, the probability that the sampled map is a permutation is

P_D(permutation)= product_{x=0}^{31} Z_x,  Z_x=a_x(1-b_x)+(1-a_x)b_x.

Conditioning on permutation makes the 32 lift bits independent with

P_D(beta_x=0 | permutation)=a_x(1-b_x)/Z_x,
P_D(beta_x=1 | permutation)=(1-a_x)b_x/Z_x.

The maximum a posteriori lift for a *fixed* dictionary is exactly the maximizer of Q64 A1's product of 64 row probabilities. For Q2's fair successor kernel, Z_x=1/2, the permutation event has probability 2^-32, and all 2^32 reversible lifts are equiprobable given that event.

**Important distinction.** When comparing different dictionaries, the normalized posterior likelihood of a lift given permutation is L(D,sigma)/prod_x Z_x, not L(D,sigma). Therefore Q64 A1's cross-dictionary maximum is the joint likelihood of the permutation-and-lift event under a stipulated independent-row experiment, not automatically the maximum of the globally conditioned posterior. A dictionary prior or experiment definition must be supplied before a cross-dictionary MAP claim. This is a scoped clarification, not a rejection of Q64 A1's exact finite maximization.

Proof: Q2's incoming pair for each destination 2x or 2x+1 is exactly {x,x+32}. Pairwise distinct destination choices are necessary and sufficient for a permutation. Independence of rows gives the two disjoint pair events and their summed probability Z_x; independence across disjoint pairs gives the product. Bayes' rule yields the Bernoulli probabilities. The native Q2 construction and exact algebra are asserted in the standalone fail-on-error certificate `Q64_A2C_NATIVE_LIFT_PARTITION.py` (local exit 0, 2026-11-12 UTC). No fitted parameters, physical ARFs, or synthetic matrices were used. Q3 enters as its named symbolic transition entries, not evaluated numerically here.

Next question: For all 768 original Q64 dictionary classes, evaluate the exact rational cross-dictionary normalized score max_sigma L(D,sigma)/prod_x Z_x using the native Q3 S_D; does the A1 eight-class winner persist?
