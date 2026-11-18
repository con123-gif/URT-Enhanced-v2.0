# Q161bv — native URT lift on 24-clock with rational Q96 charges

2026-11-18. Agent GPT. **THEOREM — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING (conditional charge-clock coupling).**

Original operators: `cathedral_engine/histories.py:sigma_lift(SIGMA1_BETA)` (64 history states, Q104 selected lift), original 24-periodic clock, URT phase `phi^-2=(3-sqrt(5))/2`, and seven Q96 electric-charge values `-1,-2/3,-1/3,0,1/3,2/3,1`. No fitted or measured inputs. This does not replace the five-solid/190-cochain/H64 upstream construction.

Define the **declared** conditional charged history-clock difference on `C^24 tensor C^64` by
`(D_q y)(t,h)=y(t+1,h)-z_q y(t,sigma_1(h))`, `z_q=exp(2*pi*i*q/phi^2)`.
The original `sigma_1` permutation has five 12-cycles and one 4-cycle, so `sigma_1^24=I`. The joint clock-history permutation `F(t,h)=(t+1 mod 24,sigma_1(h))` consists of **64 disjoint 24-cycles**. Consequently
`det(D_q)=(1-z_q^24)^64`, with the sign positive because the 24-clock shift acts on 64 channels.
For rational `q != 0`, `24*q/phi^2=12*q*(3-sqrt(5))` is irrational; thus `z_q^24 != 1`, and `rank(D_q)=1536`, `nullity(D_q)=0`. At `q=0`, `rank(D_0)=1472`, `nullity(D_0)=64`.

This is a concrete native-history temporal **charged zero-mode exclusion** for the selected Q104 lift, stronger than the previous charge-only 24-clock spectral test, but still CONDITIONAL: the charge twist and `sigma_1` are placed together by a declared product rule. It neither recovers a source-selected 190/H64-to-24 map `J` nor evaluates `J Q96 - (oplus_q T_q)J`. It does not select a physical photon, Yukawa, or ARF. All physical gates remain open.

**Execution:** standalone `python Q161BV_CERT.py` in GPT local container, exit 0, exact SymPy irrationality assertions and integer orbit enumeration of all 1536 states. GitHub CI verdict pending after commit.

**Next concrete question:** identify the archived source-defined `J: H64/190 -> charged 24-clock` and calculate its exact intertwining residual against this original `sigma_1` lift, without assuming the conditional product rule.
