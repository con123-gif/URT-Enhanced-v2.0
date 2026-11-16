# Q161i — native hidden-source second-order span
2026-11-16 · GPT · CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING

## Original operator and proof
Use the original icosahedral 20×12 face–vertex incidence C (native convex-hull face ordering), face adjacency Laplacian L, and hidden projectors P3, P5 from Q161e/Q161h. Set Ph=P3+P5=I−C(CᵀC)⁻¹Cᵀ and h(v)=Ph[(Cv)∘(Cv)]. Its Hessian is independent of v:
D²h(v)[a,b]=2Ph[(Ca)∘(Cb)].

For each vertex basis vector e_i, the diagonal Hessian D²h[e_i,e_i]=2Ph C e_i=0. For distinct vertices i,j, the Hadamard product (Ce_i)∘(Ce_j) is supported on their common faces; it is nonzero exactly for the 30 icosahedral edges. The 66 mixed columns thus reduce to 30 edge columns. Exact rational row reduction of these 30 columns yields rank 8; their P3 and P5 projections have ranks 4 and 4 respectively. Consequently the bilinear Hessian image is the full original hidden 4₃⊕4₅ space, despite Dh(c1)=0 for all uniform inputs (Q161g/h). This is second-order accessibility, **not** a first-order 32-kernel lift and not a physical transfer construction.

## Executed certificate
`python research_archive/2026-11-16_q161i_hidden_second_order/Q161I_HESSIAN_SPAN.py` — executed locally in GPT container on 2026-11-16, exit 0:
`Q161i exact: 30 edge-mixed Hessian columns span rank 8 = 4_3 + 4_5; 12 diagonal Hessian columns vanish`.
Original operator provenance: Q161e and Q161h source definitions. No measured data, fitted parameters, historical ARF, or James material.

## Next question
Does the actual original 24-slice history→12-vertex map supply four independent nonuniform bilinear directions that make the stacked hidden-source derivative injective on the Q161a 32-dimensional kernel while preserving Q96 Ward identities? Q161b/Q161 and all physical gates remain open.
