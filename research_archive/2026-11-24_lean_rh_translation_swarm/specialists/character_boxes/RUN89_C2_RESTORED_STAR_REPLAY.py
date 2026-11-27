#!/usr/bin/env python3
"""RUN89 (character boxes): artifact-backed reciprocal-height/star replay.
27 November 2026. PREPARED; native compiler NOT executed in this run.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission/spine/ledger: 3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.

Actual connector preflight: source and state blobs retrieved, original build exit
0 (9557.24s), all 12 C2 interface receipts individually have compiler exit 0,
axiom audit true, and matching base object and exact earlier dependency roster.
Artifact 15234434421 of run 46055305146 is listed unexpired (900881325 bytes
outer ZIP), inner original cache 792898966 bytes. Neither archive was
downloaded/extracted here. The separate C1 budget split remains ERROR.
All four source blobs and their axiom probes retrieved. Local lean/lake
absent; git network DNS failed. No new native execution, axiom or graph PASS.

Two specific replay defects avoided: the earlier interface driver loads
base/environment.log from the old temporary workspace; this driver obtains
fresh lake env and checks every retained object before use. The earlier graph
pair driver rejects duplicate roots, so comparing both RUN86 and RUN87 to
the same original cannot be one pair-list invocation. Export the six unique
roots once and compare membership under exact original/candidate masks.
No assumptions changed, no new mathematics discharged; same D, y, n,
index, fit family, both signed heights, and all-conjugate volume bound.
Keep all previous graph and axiom receipts; do not infer global deletion.

RESUME HERE: in shared pinned original workspace with artifact 15234434421
extracted to a directory containing retained_cache_wrapper.json and
c2_value_family/, run this file with --artifact that directory,
--compact-root original grh-compact, --lean-bin pinned compiler bin,
--out fresh external directory. It restores only the authenticated original
cache, checks module bytes, uses fresh paths, compiles the four modules
in order and exports the six-root graph once. --extend-original permits
building only missing original LongForms/DataExist imports in this same
workspace. Do not cold-build separately. First native error is the next
repair; otherwise integrate the exact graph comparison. No Main import,
no root obligation retired, no claim of RH closure.
HANDOFF TO integration/kernel/audit and Galois (RUN89 late-budget fusion separate).
"""
import argparse, hashlib, json, os, pathlib, re, subprocess, sys, tomllib
from pathlib import Path
HERE = Path(__file__).resolve().parent
SWARM = HERE.parents[1]
sys.path.insert(0, str(SWARM / "integration"))
sys.path.insert(0, str(SWARM / "specialists/kernel_extractor"))
import run_compact_b2_native_replay as native
from build_b2_sequential import flatten_options
from prepare_native_graph_exporter import execute_graph
from compressed_graph_input import archive_before_audit
import RUN26_COMPACT_GRAPH as graph

M = json.loads(r'''{"pin":"72fead102f663d5c7a407964a13dc0cf9d977207","mathlib":"56a005855ea17e0b0958f73ec801ae140b0a1679","cache_sha":"63bbe26668b47f81149ef5f5e06033168489076b68eb22509fa40bcc518a9603","cache_bytes":792898966,"base_source":"aba46120ca4118decd864f817b51bcca2bc31c19","base_module":{"name":"C2Combined","artifacts":[{"name":"C2Combined.olean","bytes":11035600,"sha256":"4ef847efc76e509f2e1f581b38a73cc76e8c31085a031eabf68d97b09ad6c46a"}]},"chain":[{"source_blob":"1b945d4df64ade81cb8ccf5f345a52668afc5f7a","compiled_module":{"name":"C2StandardExchange","artifacts":[{"name":"C2StandardExchange.olean","bytes":640504,"sha256":"9f4256154fcef86ce5f586bcfe41b6c23a1ea741f1d75d321062beb7a82108a8"}]},"checked_interface_dependencies":[]},{"source_blob":"052a8d386b6573cac924804cbc7640a34957b045","compiled_module":{"name":"C2DeterminantLift","artifacts":[{"name":"C2DeterminantLift.olean","bytes":186912,"sha256":"c01028a6552e518437792dd9b0a6b2778d9cba80bceca79745093f110b2bdd1d"}]},"checked_interface_dependencies":[]},{"source_blob":"acefc3125d97bd02906c555c35e46722d6a31a6b","compiled_module":{"name":"C2DeterminantExchange","artifacts":[{"name":"C2DeterminantExchange.olean","bytes":1098992,"sha256":"d81b5d903e8894c3d357e538efe0b510f5a45d0898e4be698b70bd045655f28a"}]},"checked_interface_dependencies":[{"source_blob":"1b945d4df64ade81cb8ccf5f345a52668afc5f7a","module":{"name":"C2StandardExchange","artifacts":[{"name":"C2StandardExchange.olean","bytes":640504,"sha256":"9f4256154fcef86ce5f586bcfe41b6c23a1ea741f1d75d321062beb7a82108a8"}]}},{"source_blob":"052a8d386b6573cac924804cbc7640a34957b045","module":{"name":"C2DeterminantLift","artifacts":[{"name":"C2DeterminantLift.olean","bytes":186912,"sha256":"c01028a6552e518437792dd9b0a6b2778d9cba80bceca79745093f110b2bdd1d"}]}}]},{"source_blob":"45fc666e330b42e0c38605f22e190748168e3a9d","compiled_module":{"name":"C2RealMatchingStandard","artifacts":[{"name":"C2RealMatchingStandard.olean","bytes":236832,"sha256":"9876af8036a8b57c3c059e9132b741a5034ebf73bda85def79a66e6886dc77af"}]},"checked_interface_dependencies":[]},{"source_blob":"67473a75e141e04e3bed87f97e57cb5979c7bce1","compiled_module":{"name":"C2DeterminantClassSum","artifacts":[{"name":"C2DeterminantClassSum.olean","bytes":2026936,"sha256":"15b315021a15c21c085511f70e95da388b1212219a27eac965a99e841770f53c"}]},"checked_interface_dependencies":[{"source_blob":"1b945d4df64ade81cb8ccf5f345a52668afc5f7a","module":{"name":"C2StandardExchange","artifacts":[{"name":"C2StandardExchange.olean","bytes":640504,"sha256":"9f4256154fcef86ce5f586bcfe41b6c23a1ea741f1d75d321062beb7a82108a8"}]}},{"source_blob":"052a8d386b6573cac924804cbc7640a34957b045","module":{"name":"C2DeterminantLift","artifacts":[{"name":"C2DeterminantLift.olean","bytes":186912,"sha256":"c01028a6552e518437792dd9b0a6b2778d9cba80bceca79745093f110b2bdd1d"}]}},{"source_blob":"acefc3125d97bd02906c555c35e46722d6a31a6b","module":{"name":"C2DeterminantExchange","artifacts":[{"name":"C2DeterminantExchange.olean","bytes":1098992,"sha256":"d81b5d903e8894c3d357e538efe0b510f5a45d0898e4be698b70bd045655f28a"}]}},{"source_blob":"45fc666e330b42e0c38605f22e190748168e3a9d","module":{"name":"C2RealMatchingStandard","artifacts":[{"name":"C2RealMatchingStandard.olean","bytes":236832,"sha256":"9876af8036a8b57c3c059e9132b741a5034ebf73bda85def79a66e6886dc77af"}]}}]},{"source_blob":"5083aea866074ba1e52b025342752df605581c78","compiled_module":{"name":"C2DeterminantCarrierTransport","artifacts":[{"name":"C2DeterminantCarrierTransport.olean","bytes":1493520,"sha256":"57f51647df44c31eebb6e9e04a1264e1eeceba15c556657db6e13210b753bf01"}]},"checked_interface_dependencies":[{"source_blob":"1b945d4df64ade81cb8ccf5f345a52668afc5f7a","module":{"name":"C2StandardExchange","artifacts":[{"name":"C2StandardExchange.olean","bytes":640504,"sha256":"9f4256154fcef86ce5f586bcfe41b6c23a1ea741f1d75d321062beb7a82108a8"}]}},{"source_blob":"052a8d386b6573cac924804cbc7640a34957b045","module":{"name":"C2DeterminantLift","artifacts":[{"name":"C2DeterminantLift.olean","bytes":186912,"sha256":"c01028a6552e518437792dd9b0a6b2778d9cba80bceca79745093f110b2bdd1d"}]}},{"source_blob":"acefc3125d97bd02906c555c35e46722d6a31a6b","module":{"name":"C2DeterminantExchange","artifacts":[{"name":"C2DeterminantExchange.olean","bytes":1098992,"sha256":"d81b5d903e8894c3d357e538efe0b510f5a45d0898e4be698b70bd045655f28a"}]}},{"source_blob":"45fc666e330b42e0c38605f22e190748168e3a9d","module":{"name":"C2RealMatchingStandard","artifacts":[{"name":"C2RealMatchingStandard.olean","bytes":236832,"sha256":"9876af8036a8b57c3c059e9132b741a5034ebf73bda85def79a66e6886dc77af"}]}},{"source_blob":"67473a75e141e04e3bed87f97e57cb5979c7bce1","module":{"name":"C2DeterminantClassSum","artifacts":[{"name":"C2DeterminantClassSum.olean","bytes":2026936,"sha256":"15b315021a15c21c085511f70e95da388b1212219a27eac965a99e841770f53c"}]}}]},{"source_blob":"2bc7219f8db7e72f6cff11b4ac29c2f9a84ce261","compiled_module":{"name":"C2DeterminantFixedLine","artifacts":[{"name":"C2DeterminantFixedLine.olean","bytes":197656,"sha256":"5f5a44c5bb1f0c50ab6aa36c909a03505e2f5df4c6b72b6a3fb8b3f7e1979d78"}]},"checked_interface_dependencies":[]},{"source_blob":"3f9228248dd81112be16a0f6e1b79170715683f0","compiled_module":{"name":"C2DeterminantWeilAction","artifacts":[{"name":"C2DeterminantWeilAction.olean","bytes":236656,"sha256":"a7e17fe3ad75baa522dac169a9304c101dbcbfa840692a4e800d4627f073f04e"}]},"checked_interface_dependencies":[]},{"source_blob":"e70b65e517b843ab4f1ce6e438879e80463db998","compiled_module":{"name":"C2DeterminantContinuousLine","artifacts":[{"name":"C2DeterminantContinuousLine.olean","bytes":280968,"sha256":"224a7d4afd34c960c3f7ecefdf930598bf6f08148b76acc4e646da2c25e587d1"}]},"checked_interface_dependencies":[{"source_blob":"2bc7219f8db7e72f6cff11b4ac29c2f9a84ce261","module":{"name":"C2DeterminantFixedLine","artifacts":[{"name":"C2DeterminantFixedLine.olean","bytes":197656,"sha256":"5f5a44c5bb1f0c50ab6aa36c909a03505e2f5df4c6b72b6a3fb8b3f7e1979d78"}]}},{"source_blob":"3f9228248dd81112be16a0f6e1b79170715683f0","module":{"name":"C2DeterminantWeilAction","artifacts":[{"name":"C2DeterminantWeilAction.olean","bytes":236656,"sha256":"a7e17fe3ad75baa522dac169a9304c101dbcbfa840692a4e800d4627f073f04e"}]}}]},{"source_blob":"aaec88856a302d40e1e501395da463f7a0f28d50","compiled_module":{"name":"C2DirectRealMatching","artifacts":[{"name":"C2DirectRealMatching.olean","bytes":286704,"sha256":"4c0b38b80b84ded660285c4f8b7a8fef9fb7c2d22f46ebe68ef6674b6d06fe6b"}]},"checked_interface_dependencies":[{"source_blob":"2bc7219f8db7e72f6cff11b4ac29c2f9a84ce261","module":{"name":"C2DeterminantFixedLine","artifacts":[{"name":"C2DeterminantFixedLine.olean","bytes":197656,"sha256":"5f5a44c5bb1f0c50ab6aa36c909a03505e2f5df4c6b72b6a3fb8b3f7e1979d78"}]}},{"source_blob":"3f9228248dd81112be16a0f6e1b79170715683f0","module":{"name":"C2DeterminantWeilAction","artifacts":[{"name":"C2DeterminantWeilAction.olean","bytes":236656,"sha256":"a7e17fe3ad75baa522dac169a9304c101dbcbfa840692a4e800d4627f073f04e"}]}},{"source_blob":"e70b65e517b843ab4f1ce6e438879e80463db998","module":{"name":"C2DeterminantContinuousLine","artifacts":[{"name":"C2DeterminantContinuousLine.olean","bytes":280968,"sha256":"224a7d4afd34c960c3f7ecefdf930598bf6f08148b76acc4e646da2c25e587d1"}]}},{"source_blob":"45fc666e330b42e0c38605f22e190748168e3a9d","module":{"name":"C2RealMatchingStandard","artifacts":[{"name":"C2RealMatchingStandard.olean","bytes":236832,"sha256":"9876af8036a8b57c3c059e9132b741a5034ebf73bda85def79a66e6886dc77af"}]}}]},{"source_blob":"1c1c1a5370e06e831e900cae35cdc68cb0eebd37","compiled_module":{"name":"C2DirectDeterminantTransport","artifacts":[{"name":"C2DirectDeterminantTransport.olean","bytes":3178704,"sha256":"7fe2d3bce78da632daf4c67a5f457b0c75866722ebd4af64321b008ce301f418"}]},"checked_interface_dependencies":[{"source_blob":"1b945d4df64ade81cb8ccf5f345a52668afc5f7a","module":{"name":"C2StandardExchange","artifacts":[{"name":"C2StandardExchange.olean","bytes":640504,"sha256":"9f4256154fcef86ce5f586bcfe41b6c23a1ea741f1d75d321062beb7a82108a8"}]}},{"source_blob":"052a8d386b6573cac924804cbc7640a34957b045","module":{"name":"C2DeterminantLift","artifacts":[{"name":"C2DeterminantLift.olean","bytes":186912,"sha256":"c01028a6552e518437792dd9b0a6b2778d9cba80bceca79745093f110b2bdd1d"}]}},{"source_blob":"acefc3125d97bd02906c555c35e46722d6a31a6b","module":{"name":"C2DeterminantExchange","artifacts":[{"name":"C2DeterminantExchange.olean","bytes":1098992,"sha256":"d81b5d903e8894c3d357e538efe0b510f5a45d0898e4be698b70bd045655f28a"}]}},{"source_blob":"45fc666e330b42e0c38605f22e190748168e3a9d","module":{"name":"C2RealMatchingStandard","artifacts":[{"name":"C2RealMatchingStandard.olean","bytes":236832,"sha256":"9876af8036a8b57c3c059e9132b741a5034ebf73bda85def79a66e6886dc77af"}]}},{"source_blob":"67473a75e141e04e3bed87f97e57cb5979c7bce1","module":{"name":"C2DeterminantClassSum","artifacts":[{"name":"C2DeterminantClassSum.olean","bytes":2026936,"sha256":"15b315021a15c21c085511f70e95da388b1212219a27eac965a99e841770f53c"}]}},{"source_blob":"5083aea866074ba1e52b025342752df605581c78","module":{"name":"C2DeterminantCarrierTransport","artifacts":[{"name":"C2DeterminantCarrierTransport.olean","bytes":1493520,"sha256":"57f51647df44c31eebb6e9e04a1264e1eeceba15c556657db6e13210b753bf01"}]}},{"source_blob":"2bc7219f8db7e72f6cff11b4ac29c2f9a84ce261","module":{"name":"C2DeterminantFixedLine","artifacts":[{"name":"C2DeterminantFixedLine.olean","bytes":197656,"sha256":"5f5a44c5bb1f0c50ab6aa36c909a03505e2f5df4c6b72b6a3fb8b3f7e1979d78"}]}},{"source_blob":"3f9228248dd81112be16a0f6e1b79170715683f0","module":{"name":"C2DeterminantWeilAction","artifacts":[{"name":"C2DeterminantWeilAction.olean","bytes":236656,"sha256":"a7e17fe3ad75baa522dac169a9304c101dbcbfa840692a4e800d4627f073f04e"}]}},{"source_blob":"e70b65e517b843ab4f1ce6e438879e80463db998","module":{"name":"C2DeterminantContinuousLine","artifacts":[{"name":"C2DeterminantContinuousLine.olean","bytes":280968,"sha256":"224a7d4afd34c960c3f7ecefdf930598bf6f08148b76acc4e646da2c25e587d1"}]}},{"source_blob":"aaec88856a302d40e1e501395da463f7a0f28d50","module":{"name":"C2DirectRealMatching","artifacts":[{"name":"C2DirectRealMatching.olean","bytes":286704,"sha256":"4c0b38b80b84ded660285c4f8b7a8fef9fb7c2d22f46ebe68ef6674b6d06fe6b"}]}}]},{"source_blob":"7e912b212aa0a365106cca2e7a0c30a17eb65ff6","compiled_module":{"name":"C2ValueFamilyTransport","artifacts":[{"name":"C2ValueFamilyTransport.olean","bytes":7517784,"sha256":"df09a2527a08d97db0c9ee168e5585ed30491c6bbe853ef5c4d60df0e788f2c2"}]},"checked_interface_dependencies":[{"source_blob":"1b945d4df64ade81cb8ccf5f345a52668afc5f7a","module":{"name":"C2StandardExchange","artifacts":[{"name":"C2StandardExchange.olean","bytes":640504,"sha256":"9f4256154fcef86ce5f586bcfe41b6c23a1ea741f1d75d321062beb7a82108a8"}]}},{"source_blob":"052a8d386b6573cac924804cbc7640a34957b045","module":{"name":"C2DeterminantLift","artifacts":[{"name":"C2DeterminantLift.olean","bytes":186912,"sha256":"c01028a6552e518437792dd9b0a6b2778d9cba80bceca79745093f110b2bdd1d"}]}},{"source_blob":"acefc3125d97bd02906c555c35e46722d6a31a6b","module":{"name":"C2DeterminantExchange","artifacts":[{"name":"C2DeterminantExchange.olean","bytes":1098992,"sha256":"d81b5d903e8894c3d357e538efe0b510f5a45d0898e4be698b70bd045655f28a"}]}},{"source_blob":"45fc666e330b42e0c38605f22e190748168e3a9d","module":{"name":"C2RealMatchingStandard","artifacts":[{"name":"C2RealMatchingStandard.olean","bytes":236832,"sha256":"9876af8036a8b57c3c059e9132b741a5034ebf73bda85def79a66e6886dc77af"}]}},{"source_blob":"67473a75e141e04e3bed87f97e57cb5979c7bce1","module":{"name":"C2DeterminantClassSum","artifacts":[{"name":"C2DeterminantClassSum.olean","bytes":2026936,"sha256":"15b315021a15c21c085511f70e95da388b1212219a27eac965a99e841770f53c"}]}},{"source_blob":"5083aea866074ba1e52b025342752df605581c78","module":{"name":"C2DeterminantCarrierTransport","artifacts":[{"name":"C2DeterminantCarrierTransport.olean","bytes":1493520,"sha256":"57f51647df44c31eebb6e9e04a1264e1eeceba15c556657db6e13210b753bf01"}]}},{"source_blob":"2bc7219f8db7e72f6cff11b4ac29c2f9a84ce261","module":{"name":"C2DeterminantFixedLine","artifacts":[{"name":"C2DeterminantFixedLine.olean","bytes":197656,"sha256":"5f5a44c5bb1f0c50ab6aa36c909a03505e2f5df4c6b72b6a3fb8b3f7e1979d78"}]}},{"source_blob":"3f9228248dd81112be16a0f6e1b79170715683f0","module":{"name":"C2DeterminantWeilAction","artifacts":[{"name":"C2DeterminantWeilAction.olean","bytes":236656,"sha256":"a7e17fe3ad75baa522dac169a9304c101dbcbfa840692a4e800d4627f073f04e"}]}},{"source_blob":"e70b65e517b843ab4f1ce6e438879e80463db998","module":{"name":"C2DeterminantContinuousLine","artifacts":[{"name":"C2DeterminantContinuousLine.olean","bytes":280968,"sha256":"224a7d4afd34c960c3f7ecefdf930598bf6f08148b76acc4e646da2c25e587d1"}]}},{"source_blob":"aaec88856a302d40e1e501395da463f7a0f28d50","module":{"name":"C2DirectRealMatching","artifacts":[{"name":"C2DirectRealMatching.olean","bytes":286704,"sha256":"4c0b38b80b84ded660285c4f8b7a8fef9fb7c2d22f46ebe68ef6674b6d06fe6b"}]}},{"source_blob":"1c1c1a5370e06e831e900cae35cdc68cb0eebd37","module":{"name":"C2DirectDeterminantTransport","artifacts":[{"name":"C2DirectDeterminantTransport.olean","bytes":3178704,"sha256":"7fe2d3bce78da632daf4c67a5f457b0c75866722ebd4af64321b008ce301f418"}]}}]}],"stages":[{"path":"integration/C2_SINGLE_WITNESS_COMBINED.lean","module":"C2SingleWitnessCombined","guard":"C2_SINGLE_WITNESS:","sha":"4be058901f7072efd82b3711281fae7b913f1712","probes":["c2_norm_map_le_exp_half","c2_heightLe_of_sq","c2_heightLe_reciprocal_budget","c2_heightLe_squared_one_no_negative","HeightLe.nonneg","c2_isAlgebraic_of_arch","c2_heightLe_nonneg_arch","c2_heightLe_single_witness_budget"]},{"path":"specialists/character_boxes/RUN86_COMPACT_C2_SINGLE_WITNESS_TO_STAR.lean","module":"C2SingleWitnessToStar","guard":"RUN86_SINGLE_WITNESS:","sha":"e81bcf8064bf50effbbccf7f87b565e068bf2304","probes":["Data.run86_single_witness_integral_forms_long","run86_single_witness_star_inequality"]},{"path":"specialists/character_boxes/RUN87_COMPACT_C2_FUSED_TO_STAR.lean","module":"C2FusedToStar","guard":"RUN87_DIRECT_GUARDS:","sha":"535c2f6a161a3eb569ddc0250707d55059fd706e","probes":["Data.run87_fused_integral_forms_long","run87_fused_star_inequality"]},{"path":"specialists/character_boxes/RUN88_COMPACT_STAR_ORIGINAL_GRAPH_CONTROL.lean","module":"C2StarComparison","guard":"RUN88_STAR_COMPARISON:","sha":"f5dad5105eb110d016e3a177841e9701a03cf675","probes":["run88_original_star_inequality","run86_single_witness_star_inequality","run87_fused_star_inequality","Data.run87_fused_integral_forms_long"]}],"roots":["Data.integral_forms_long","Data.run86_single_witness_integral_forms_long","Data.run87_fused_integral_forms_long","run88_original_star_inequality","run86_single_witness_star_inequality","run87_fused_star_inequality"],"receipt_blobs":["2146cd28915a80aa467d64de6ecd0f659e71f389","baa074ee974e8e916d580d3386fd17b71d2af8f7","413058eacfda8683f5fb28c68148fd45d1bf1770","392d253a5f2e412aa5b741a78ee3dbec55b7c9d4"]}''')
DIRS = ["earlier/C2StandardExchange","earlier/C2DeterminantLift","earlier/C2DeterminantExchange","earlier/C2RealMatchingStandard","earlier/C2DeterminantClassSum","earlier/C2DeterminantCarrierTransport","C2DeterminantFixedLine","C2DeterminantWeilAction","C2DeterminantContinuousLine","C2DirectRealMatching","C2DirectDeterminantTransport","C2ValueFamilyTransport"]
def digest(path):
    with path.open("rb") as f:
        return hashlib.file_digest(f, "sha256").hexdigest()

def need(ok, reason):
    if not ok: raise RuntimeError(reason)

def check_module(directory, module, blob):
    name = module["name"]
    need(re.fullmatch(r"[A-Za-z_][A-Za-z_0-9]*", name), "bad module name")
    need(native.git_blob((directory / (name+".lean")).read_bytes()) == blob, "source mismatch "+name)
    for obj in module["artifacts"]:
        need(Path(obj["name"]).name == obj["name"], "invalid artifact path")
        f = directory / obj["name"]
        need(f.stat().st_size == obj["bytes"] and digest(f) == obj["sha256"], "object mismatch "+name)

def main():
    ap=argparse.ArgumentParser()
    for n in ("artifact","compact-root","lean-bin","out"): ap.add_argument("--"+n,type=Path,required=True)
    ap.add_argument("--extend-original",action="store_true")
    a=ap.parse_args()
    root, art, bin, out = (x.resolve() for x in (a.compact_root,a.artifact,a.lean_bin,a.out))
    out.mkdir(parents=True,exist_ok=False)
    state={"full_RH_replay":False,"human_assembly_verified":False,"all_requested_checks_ok":False,
           "new_Lean_execution":False,"steps":{},"input_manifest":M}
    def save(): native.dump(out/"run89_results.json",state)
    save()
    env=os.environ.copy()
    env["PATH"]=str(bin)+os.pathsep+env["PATH"]
    env.update(LEAN_NUM_THREADS="2",LEAN_ABORT_ON_PANIC="1")
    def step(label, argv, timeout):
        receipt=native.step(argv,root,env,out/(label+".log"),timeout)
        state["steps"][label]=receipt
        save()
        need(receipt["returncode"]==0,"first failed phase: "+label)
        return receipt
    try:
        need(native.capture(["git","rev-parse","HEAD"],root)==M["pin"],"wrong compact pin")
        need(native.capture(["git","rev-parse","HEAD"],root/".lake/packages/mathlib")==M["mathlib"],"wrong mathlib")
        subprocess.run(["git","diff","--exit-code",M["pin"],"--","src","lakefile.toml"],cwd=root,check=True)
        version=native.capture([bin/"lean","--version"])
        need("4.35.0" in version and "eb6cafb7290e8bd5f2937522d8d804f58f02bafc" in version,"wrong compiler")
        cache=art/"native_c1_oleans.tar.zst"
        wrapper=art/"retained_cache_wrapper.json"
        need(native.git_blob(wrapper.read_bytes())==M["receipt_blobs"][0],"wrong cache receipt")
        need(cache.stat().st_size==M["cache_bytes"] and digest(cache)==M["cache_sha"],"wrong cache bytes")
        value=art/"c2_value_family"
        for path,sha in [(value/"earlier/interface_pipeline_results.json",M["receipt_blobs"][1]),
                         (value/"value_family_pipeline_results.json",M["receipt_blobs"][2]),
                         (value/"earlier/base/c2_replacement_results.json",M["receipt_blobs"][3])]:
            need(native.git_blob(path.read_bytes())==sha,"wrong retained receipt "+str(path))
        base=value/"earlier/base"
        check_module(base,M["base_module"],M["base_source"])
        dirs=[base]
        for d,q in zip(DIRS,M["chain"]):
            path=value/d
            check_module(path,q["compiled_module"],q["source_blob"])
            dirs.append(path)
        state["artifact_module_objects_authenticated"]=len(dirs)
        save()
        step("restore_original",["tar","--zstd","-xf",cache,"-C",root],900)
        original=root/".lake/build/lib/lean"
        for m in ("New/Selmer/FitTwistsExist","New/Selmer/ValueFamilies","New/Rows/Carrier"):
            need((original/(m+".olean")).is_file(),"missing original object "+m)
        missing=[m for m in ("New.Endgame.LongForms","New.Data.DataExist","Statements")
                 if not original.joinpath(*m.split(".")).with_suffix(".olean").is_file()]
        state["missing_original_modules"]=missing
        save()
        if missing:
            need(a.extend_original,"missing original imports; use --extend-original in shared workspace")
            step("extend_original",["lake","build",*["+"+m+":olean" for m in missing]],14400)
        setup=subprocess.check_output(["lake","env","python3","-c",
            "import os,json; print(json.dumps({k:os.environ[k] for k in ['LEAN_PATH','LEAN_SRC_PATH','LEAN_SYSROOT','LD_LIBRARY_PATH','PATH'] if k in os.environ}))"],
            cwd=root,env=env,text=True,timeout=300)
        (out/"fresh_environment.log").write_text(setup)
        env.update(json.loads(setup.strip().splitlines()[-1]))
        native_path=env["LEAN_PATH"]
        need(all(Path(x).exists() for x in native_path.split(os.pathsep) if x),"invalid fresh Lean path")
        lake=tomllib.loads((root/"lakefile.toml").read_text())
        opts=list(lake.get("moreLeanArgs",[]))+list(flatten_options(lake["leanOptions"]))
        for s in M["stages"]:
            raw=(SWARM/s["path"]).read_bytes()
            need(native.git_blob(raw)==s["sha"],"source changed "+s["module"])
            module=s["module"]
            dest=out/module
            dest.mkdir()
            src=dest/(module+".lean")
            src.write_bytes(raw)
            env["LEAN_PATH"]=os.pathsep.join([str(dest),*map(str,dirs),native_path])
            state["new_Lean_execution"]=True
            save()
            run=step(module,[bin/"lean",*opts,"-Dpp.fullNames=true","-Ddebug.skipKernelTC=false","-j","2","-R",dest,"-o",dest/(module+".olean"),src],3600)
            run.update(native.audit(out/(module+".log"),s["probes"]))
            run["guard_observed"]=s["guard"] in (out/(module+".log")).read_text()
            save()
            need(run["axiom_audit_ok"] and run["guard_observed"],"missing native evidence "+module)
            run["object_sha256"]=digest(dest/(module+".olean"))
            dirs.append(dest)
            save()
        env["LEAN_PATH"]=os.pathsep.join([*map(str,dirs),native_path])
        roots=M["roots"]
        need(len(set(roots))==6,"duplicate or missing graph roots")
        rawgraph=out/"six_root_graph.jsonl"
        result=execute_graph(value/"earlier/native_exporter",root,env,bin,"C2StarComparison",roots,rawgraph,out/"graph.log",5400)
        state["steps"]["graph_export"]=result
        save()
        need(result["returncode"]==0 and result["axiom_audit_ok"],"graph export/axioms failed")
        graph.ROOTS=roots
        packed=archive_before_audit(rawgraph)
        graph.audit_union(packed,out,out)
        summary=json.loads((out/"union_summary.json").read_text())
        need(summary["missing"]==0 and all(x["exit"]==0 for x in summary["per_root"].values()),"graph incomplete")
        watched={}
        wanted=set(roots)|{"c2_exists_isFitFamily","c2_heightLe_single_witness_budget","Data.exists_family_covolumeSq_le",
          "Data.heightLe_volume_rows","Data.heightLe_volume_ratio_sq","Data.volume_iota_eq_prod_liftVolume","denominatorLe_rowBudget"}
        hist=summary["mask_histogram"]
        with (out/"root_membership.jsonl").open() as f:
            for line in f:
                row=json.loads(line)
                name=".".join(str(x[1]) for x in row["id"])
                if name in wanted: watched[name]=row["root_mask"]
        def reaches(i,name): return bool(watched.get(name,0)&(1<<i))
        checks={name:reaches(i,name) for i,name in enumerate(roots)}
        for i in (1,2,4,5):
            checks[str(i)+":single_witness"]=reaches(i,"c2_heightLe_single_witness_budget")
        for i in (2,5):
            checks[str(i)+":fit"]=reaches(i,"c2_exists_isFitFamily")
        for i in (3,4,5):
            checks[str(i)+":family"]=reaches(i,"Data.exists_family_covolumeSq_le")
        for i in (0,1,2,3,4,5):
            for name in ("Data.heightLe_volume_rows","Data.heightLe_volume_ratio_sq","Data.volume_iota_eq_prod_liftVolume","denominatorLe_rowBudget"):
                checks[str(i)+":"+name]=reaches(i,name)
        def delta(i,j):
            return {"only_left":sum(v for m,v in hist.items() if int(m)&(1<<i) and not int(m)&(1<<j)),
                    "only_right":sum(v for m,v in hist.items() if int(m)&(1<<j) and not int(m)&(1<<i))}
        comparisons={roots[i]+" -> "+roots[j]:delta(i,j) for i,j in [(0,1),(0,2),(1,2),(3,4),(3,5),(4,5)]}
        native.dump(out/"six_root_comparison.json",{"checks":checks,"watched":watched,"comparisons":comparisons,
            "full_RH_replay":False,"original_star_source_control_not_upstream_object":True})
        need(all(checks.values()),"missing expected reachable supplier")
        state.update(all_requested_checks_ok=True,graph_receipt=summary)
        save()
    except Exception as exc:
        state["failure"]=str(exc); save(); raise

if __name__=="__main__": main()
