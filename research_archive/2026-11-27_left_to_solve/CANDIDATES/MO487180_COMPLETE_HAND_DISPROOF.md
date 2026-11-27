# MO487180: complete four-function counterexample

Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex (GPT-6 family;
exact serving variant not exposed), 27 November2026.

Sources: https://mathoverflow.net/questions/487180 and its explicit crosspost
https://math.stackexchange.com/questions/5029508 .
Standard floor-addition inequalities are prior mathematics. This is a complete
human disproof; the full Lean certificate is being constructed and is NOT
represented as verified or accepted. It adds zero to the checked-certificate
or official accepted totals at this checkpoint.

The question asks whether every finite nonempty set of distinct functions,
each a finite sum of floors of positive integer multiples of x, has some
positive x at which one member is strictly below every other member.

Consider
\[
\begin{aligned}
f_1(x)&=3\lfloor2x\rfloor+\lfloor3x\rfloor,\\
f_2(x)&=\lfloor x\rfloor+\lfloor2x\rfloor+2\lfloor3x\rfloor,\\
f_3(x)&=\lfloor x\rfloor+2\lfloor2x\rfloor+\lfloor4x\rfloor,\\
f_4(x)&=2\lfloor x\rfloor+\lfloor3x\rfloor+\lfloor4x\rfloor.
\end{aligned}
\]
Each is exactly four allowed terms, with respective coefficient lists
(2,2,2,3), (1,2,3,3), (1,2,2,4), (1,1,3,4). Repetition is permitted by the
source; its crosspost explicitly clarifies that the number of terms may vary.
The example even has a common number of terms.

All four functions are distinct: their respective pairs of values at
x=1/4 and x=1/3 are (0,1), (0,2), (1,1), (1,2).

We prove that every one of their pointwise values has a matching value from
another member, so a unique strict minimum is impossible. The proof works for
every real x, including all discontinuities.

Put
\[
m=\lfloor x\rfloor,\quad a=\lfloor2x\rfloor,\quad
b=\lfloor3x\rfloor,\quad c=\lfloor4x\rfloor.
\]
The standard inequalities floor(u)+floor(v) <= floor(u+v) <=
floor(u)+floor(v)+1, applied to (x,x), (2x,x), (3x,x), and (2x,2x), give
\[
2m\le a\le2m+1,\quad a+m\le b\le a+m+1,\quad
b+m\le c\le b+m+1,\quad 2a\le c\le2a+1.
\]
Let A=a-2m, B=b-3m, C=c-4m. These are integers satisfying
\[
A\in\{0,1\},\quad B-A\in\{0,1\},\quad
C-B\in\{0,1\},\quad C-2A\in\{0,1\}.
\]
If A=0, then B=0 or1. For B=0 we have B-2A=0; for B=1 the last two
constraints force C=1, giving C-B-A=0. If A=1, then B=1 or2. For B=2
we have B-2A=0; for B=1 the last two constraints force C=2, again giving
C-B-A=0. Consequently
\[
F:=b-2a+m=0\qquad\hbox{or}\qquad G:=c-b-a+m=0.
\]
Direct cancellation yields
\[
f_2=f_1+F,\qquad f_3=f_1+G,\qquad f_4=f_1+F+G.
\]
When F=0, the values pair as f1=f2 and f3=f4. When G=0, they pair as
f1=f3 and f2=f4. In either case every potential minimum has a distinct
function attaining the same value. This is a full disproof of the source
claim, using four genuine functions rather than an empty-set or duplicate
function loophole. QED.

Independent challenges: root, runtime and algebra lanes each checked the
entire source and infinite argument. The original source and crosspost,
all six crosspost comments, both one-revision histories, source-author
followups and current live/submission/Trure/global-code gates were reviewed.
The bounded primary audit found no earlier resolution; no exhaustive
historical-priority guarantee is asserted. A six-cell exact interval check
was also executed, but the proof above is an infinite algebraic argument,
not an extrapolation from numerical samples.

The final exact-target Lean certificate, execution, valid current lease,
official registration/merge and full proof acceptance remain separate stages.
