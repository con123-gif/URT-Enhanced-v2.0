#!/usr/bin/env python3
"""Executable exact finite icosahedron -> Golay -> Leech selection audit.

This constructs a new *candidate* Golay parity transfer, and does not claim
that it is the canonical URT H_64 transfer B_star^dagger B_star.
"""
import json, math
from collections import Counter
import numpy as np
import networkx as nx
from scipy.linalg import expm

# Canonical NetworkX icosahedral graph. No observed physics or fitted inputs.
G = nx.icosahedral_graph()
A = nx.to_numpy_array(G, nodelist=range(12), dtype=np.int64)
I = np.eye(12, dtype=np.int64)
J = np.ones((12, 12), dtype=np.int64)
D = J - A  # diagonal 1, non-neighbor 1, neighbors 0
M = np.concatenate((I, D), axis=1) % 2  # classical generator (12 x 24)
H = np.concatenate((D, I), axis=1) % 2  # parity check; same row space since D^2 = I mod 2
assert np.all(np.sum(A, axis=1) == 5)
assert np.all((D @ D) % 2 == I)
assert np.all((M @ M.T) % 2 == 0)
assert np.all((M @ H.T) % 2 == 0)
assert np.linalg.matrix_rank(M[:, :12]) == 12

# Derive the canonical antipodal involution as unique distance-3 pairs.
lengths = dict(nx.all_pairs_shortest_path_length(G))
P = np.zeros_like(A)
for i in range(12):
    opposite = [j for j in range(12) if lengths[i][j] == 3]
    assert len(opposite) == 1
    P[i, opposite[0]] = 1
assert np.array_equal(A @ A, 3 * I + 2 * J - 2 * P)
assert np.array_equal(D @ D, 3 * I + 4 * J - 2 * P)

# Exhaust all 2^12 free bits, no external code library used.
words = np.array([[(n >> j) & 1 for j in range(12)] for n in range(4096)], dtype=np.int8)
code = np.concatenate((words, ((words.astype(np.int64) @ D) % 2).astype(np.int8)), axis=1)
weights = np.sum(code, axis=1).astype(int)
dist = dict(sorted((int(x), int(n)) for x, n in Counter(weights).items()))
assert dist == {0:1,8:759,12:2576,16:759,24:1}, dist
assert np.array_equal((code.astype(np.int64) @ H.T) % 2, np.zeros((4096,12), dtype=np.int64))
assert len(np.unique(code, axis=0)) == 4096

# Derive exact projector without ever constructing a 2^24 x 2^24 matrix.
# On a basis state |x>, Q_i(x)=(-1)^(H_i x mod 2).
# P(x)=product_i [1+Q_i(x)]/2 is exactly 1 for c in C and 0 otherwise.
tests = []
for n in (0,1,2,17,123,456,1023,4095):
    c = code[n].astype(np.int64)
    syndrome_c = (H @ c) % 2
    assert not np.any(syndrome_c)
    for flip in (0,4,11,12,17,23):
        x = c.copy(); x[flip] ^= 1
        syndrome_x = (H @ x) % 2
        assert np.any(syndrome_x)   # no weight-1 word is in Golay code
        tests.append((n, flip, int(np.sum(syndrome_x))))

# Leech minimal vectors: three proven families. Construct all integer tuples
# (scale by 1/sqrt(8) for actual Λ24 minimal squared norm 4).
type_a = []
for i in range(24):
    for j in range(i+1,24):
        for si in (-1,1):
            for sj in (-1,1):
                v = np.zeros(24,dtype=np.int8)
                v[i]=4*si; v[j]=4*sj
                type_a.append(v)
type_a = np.asarray(type_a,dtype=np.int8)

# Octads 3759, even-minus sign configurations 2^7=128 each.
OCTADS = code[weights == 8].astype(bool)
type_b = np.empty((759*128,24),dtype=np.int8)
pointer = 0
for octad in OCTADS:
    idx = np.flatnonzero(octad)
    for m in range(256):
        if m.bit_count()%2: continue
        signs=np.array([1-2*((m>>k)&1) for k in range(8)],dtype=np.int8)
        v = np.zeros(24,dtype=np.int8);v[idx]=2*signs
        type_b[pointer]=v;pointer+=1
assert pointer == 97152

# Sign patterns of the 4096 Golay codewords; exceptional position is -3.
type_c = np.empty((4096*24,24),dtype=np.int8)
pointer = 0
for c in code:
    sign = (1 - 2 * c).astype(np.int8)
    for j in range(24):
        v=sign.copy();v[j]=-3*sign[j]
        type_c[pointer]=v;pointer+=1
assert pointer == 98304
assert len(type_a)==1104 and len(type_b)==97152 and len(type_c)==98304
for family in (type_a,type_b,type_c):
    assert np.all(np.einsum('ij,ij->i', family.astype(np.int32),family.astype(np.int32))==32)
# No duplicate minimal vectors between or within the families.
shell=np.concatenate((type_a,type_b,type_c))
assert len(shell)==196560
assert len(np.unique(shell,axis=0))==196560

# Exact nearest-neighbor condition by inner products on a reproducible sample;
# full all-pairs test would need 19 billion comparisons, so not claimed.
rng=np.random.default_rng(20261025)
for _ in range(100):
    v = shell[int(rng.integers(len(shell)))].astype(np.int32)
    ix=rng.integers(0,len(shell),size=4096)
    prods = shell[ix].astype(np.int32) @ v
    assert np.all((prods<=16)|(prods==32))

# Existing 13-cell: shell icosahedron plus unit-weight center; strictly positive
# heat transfer on real 13-mode signals is NOT a 24-bit Golay code projection.
A13=np.zeros((13,13),dtype=np.int64);A13[1:,1:]=A;A13[0,1:]=1;A13[1:,0]=1
L13=np.diag(np.sum(A13,axis=1))-A13
sp13=np.linalg.eigvalsh(L13)
assert np.allclose(sp13,[0]*1 + [6-math.sqrt(5)]*3 + [7]*5 + [6+math.sqrt(5)]*3 + [13])
E13=expm(-0.1*L13)
assert np.min(np.linalg.eigvalsh(E13)) > 0
# Apply natural graph heat separately to both 12-site halves, after 0.1 graph time.
L12=5*I-A
E12=expm(-0.1*L12)
gen=M[0].astype(float)
heat_out=np.r_[E12@gen[:12],E12@gen[12:]]
heat_departure=float(np.max(np.minimum(np.abs(heat_out),np.abs(heat_out-1))))
assert heat_departure>0.01  # NOT a codeword (not even all binary)

# Conditional, no-fit maximum entropy model: identify each syndrome check's
# excited-state probability with existing Cathedral hidden-sector p5.
# The transfer is T_delta = product_i [ (1-Q_i)+Delta^2 Q_i ],
# where Q_i=(I-S_i)/2. Its 2^24 eigenstates group into 2^12 syndromes,
# each of degeneracy 2^12; syndrome weight k has eigenvalue Delta^(2k).
phi=(1+math.sqrt(5))/2
Delta=3/20-80*math.pi/(1053*phi)
eta=-math.log(Delta)
p5=Delta*Delta/(1+Delta*Delta)
syndrome_degeneracies={int(k):4096*math.comb(12,k) for k in range(13)}
assert sum(syndrome_degeneracies.values())==2**24
Z=4096*(1+Delta*Delta)**12
pcode=(1-p5)**12
exact_k_probs={int(k):math.comb(12,k)*(p5**k)*(1-p5)**(12-k) for k in range(13)}
assert abs(sum(exact_k_probs.values())-1)<1e-12
h2 = -p5*math.log(p5)-(1-p5)*math.log1p(-p5)
maxent=12*(math.log(2)+h2)
info=12*(math.log(2)-h2)

# The missing physical matching condition can be expressed as an intertwiner
# V between Cathedral and 24-bit spaces satisfying P_G V = V P_phys.
# Such V and P_phys have not been deduced by this computation.
report={
 "icosahedron_input":{"vertices":12,"edges":30,"centered_vertices":13,"13_graph_eigenvalues_approx":np.round(sp13,10).tolist()},
 "generator":{"matrix_shape":[12,24],"D_squared_mod2_is_I":True,"self_dual":True,"doubly_even":True,"minimum_distance":8,"codewords":4096,"weight_distribution":dist},
 "parity_projection":{"total_bitstrings":2**24,"admissible_bitstrings":4096,"selection_fraction":1/4096,"independent_checks":12,"check_weight_each":8,"total_tested_single_flip_syndromes":len(tests)},
 "leech_minimal_shell":{"A_two_fours":int(len(type_a)),"B_eight_twos":int(len(type_b)),"C_one_three_twenty_three_ones":int(len(type_c)),"total":int(len(shell)),"all_distinct":True,"all_norm_squared_unscaled":32,"scaled_norm_squared":4},
 "13_mode_heat_transfer":{"t":0.1,"smallest_positive_eigenvalue":float(np.min(np.linalg.eigvalsh(E13))),"natural_12+12_heat_binary_departure":heat_departure,"Golay_projector_from_heat":False},
 "conditional_maximum_entropy_extension":{"delta":Delta,"eta_delta":eta,"single_check_excitation_p5":p5,"Gibbs_beta":2*eta,"rank":2**24,"partition_Z":Z,"all_checks_satisfied_probability":pcode,"expected_failed_checks":12*p5,"entropy_nats":maxent,"information_vs_uniform_nats":info,"multiplicities":syndrome_degeneracies,"interpretation":"Requires physical identification of Golay syndrome checks with Cathedral hidden p5 and a max-entropy model; not a derivation of canonical H64 transfer."},
 "status":"An exact parity-projector positive transfer is constructible from the graph; equivalence to canonical Cathedral H64 T_star is unproved and not established here."
}
with open('/mnt/data/cathedral_golay_leech_selection_results.json','w') as f:json.dump(report,f,indent=2)
print(json.dumps(report,indent=2))