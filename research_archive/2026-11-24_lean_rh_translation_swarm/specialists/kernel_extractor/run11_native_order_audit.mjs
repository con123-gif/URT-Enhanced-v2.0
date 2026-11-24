/*
RUN11 — 2026-11-24, kernel extractor, REVIEW / PARTIAL.
Original RH pin 40e56bab026552e089d7afcfeff08d2defb9c005; latest observed upstream 307cef33f046955ee79dba47e0d828d06496d75f (17:03:26Z, batch PR #1266). Main blob 67c65badc15f80a1db65df1c84dc7a4928fc410f and toolchain blob 0e037f58f9a1aa2d5139277bcc4be0061ebeeb05 unchanged from RUN10; no full revision equivalence checked. Native experiment is synthetic, not the RH theorem.

Preflight: AGENTS, swarm protocol/queue/expansion, research state/log/protocol and continuity excerpts, physics CI checkpoint #382 PASS (unrelated), RUN9/10, acceleration RUN11, recent integration, editor, audit, structure, dependency, prime, Landau, theta, Galois, geometry, literature, math and boxes handoffs inspected. External blueprint not reread. No physical queue changes.

RESULT: previously blocked exact isolated collector experiment now ran natively, returncode 0, 22.48 seconds, https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45434018114. Lean 4.37.0-rc1 commit 0b77e12952ad39077d80d8bd6b66d601f225c321. Exact upstream collector body identical to the generated copy after isolating namespace. Independent V8 audit executed on fetched authenticated Git blobs; actual output below. Native three fresh queries all see guardProp. Shared queries see axiom counts [1,0,1], [1,1,1], [1,0,0] for respective orders W,P,G; P,W,G; G,W,P. Public imported cache agrees with the first order; this is consistent with, not a trace of, actual compiler export ordering. Order dependence of isolated native collector is now demonstrated, rather than just a graph hypothesis. It is an axiom-reporting/reference-policy issue, not a kernel soundness defect or evidence against RH. W/P/G denote Witness/plain/guarded.

Why first-root proof works under restricted hypotheses: finite fully resolved directed graph, no external imported-cache shortcuts, DFS visits every reachable vertex or encounters it previously discovered. Each newly discovered axiom is inserted into current accumulator and unioned into the saved parent accumulator on return. Induction on the DFS tree shows root accumulator contains all discovered axioms, no others. Every reachable vertex is discovered because all outgoing edges of each first visit are traversed, so root result is exact. Intermediate cache entries are not necessarily full reachable sets: a back edge to an active ancestor returns the empty sentinel and the descendant may never be updated. Later queries can reuse these incomplete entries. If an imported external cache is incomplete, even a new root with empty local cache can inherit the omission; a hypothetical downstream graph tests this prediction, not native execution. In the fixture, constructor-inclusive collector policy adds W->P,G; this is not a claim that guardProp is logically needed to construct Witness.plain. For general Lean graph, preserve separate expression, structural and metadata edges; unresolved references invalidate completeness. Do not blindly reuse a shared incomplete cache. SCC-condensation or full independent visited traversal yields exact graph reachability subject to complete edges. See RUN6 for exhaustive abstract tests; present check is native-order reconciliation and the external-cache boundary.

Inputs (Git blob IDs, use exact files from cathedral-research-state):
{
  "status": [
    "compute/rh-native-cycle-rc1-isolated-20261124/status.json",
    "7210d4c206b200af35c8d290bbedc06909dc5eb8"
  ],
  "report": [
    "compute/rh-native-cycle-rc1-isolated-20261124/outputs/rc1_result.json",
    "b16d10ce49ce3876b3d287db6ab6c6133f66aa2f"
  ],
  "log": [
    "compute/rh-native-cycle-rc1-isolated-20261124/outputs/fresh.log",
    "3e3d8e690b96d71c6448ad4186b73ea0f965d6a7"
  ],
  "copy": [
    "compute/rh-native-cycle-rc1-isolated-20261124/outputs/FreshCycle.lean",
    "ce2919ca00746b24f89c7228e3bea4870fce790f"
  ],
  "source": [
    "compute/rh-native-cycle-rc1-isolated-20261124/outputs/CollectAxioms.lean",
    "e789f33849debe5cc1f1d9bc60aa3e54a56df0d9"
  ],
  "graph": [
    "compute/rh-native-cycle-witness-20261124/outputs/plain.jsonl",
    "e5096a6d88ffc80f98fdc73c75f9f67f73b9f41d"
  ]
}
Native output SHA256 per status: fresh.log 0b526d62f2137957080cce1b6d8776777c9ffb96f12dddbf9967fe23593ba7ea; rc1_result.json 80d6656d7bcc4d4d0e25b50e643e815c26913d461a0a21986724c51330bd0a23; source b39bd22253a76816ee6d24284e69674d0b491be343fd71f9ee9376833d1485f6; copy 4abd305ed2c51b159a6e380c4ca17a8d8f26d8cf01f84aa3c37cb382325c6229. Local V8 authenticated blob identities and executed audit; Node CLI below additionally hashes all six files locally, not executed in this run. Reproduce: node run11_native_order_audit.mjs STATE_BRANCH_CHECKOUT_ROOT

Actual V8 output:
{
  "status": "NATIVE_FIXTURE_LOG_REPLAY_AND_FINITE_GRAPH_MODEL_NOT_RH_RECHECK",
  "checks": 54,
  "negative": 3,
  "nativeWallSeconds": 22.48,
  "nativeOrders": 3,
  "modeledOrders": [
    {
      "roots": [
        "CathedralAxiomCycle.Witness",
        "CathedralAxiomCycle.Witness.plain",
        "CathedralAxiomCycle.Witness.guarded"
      ],
      "axiomCounts": [
        1,
        0,
        1
      ],
      "misses": [
        "CathedralAxiomCycle.Witness.plain"
      ]
    },
    {
      "roots": [
        "CathedralAxiomCycle.Witness",
        "CathedralAxiomCycle.Witness.guarded",
        "CathedralAxiomCycle.Witness.plain"
      ],
      "axiomCounts": [
        1,
        1,
        0
      ],
      "misses": [
        "CathedralAxiomCycle.Witness.plain"
      ]
    },
    {
      "roots": [
        "CathedralAxiomCycle.Witness.plain",
        "CathedralAxiomCycle.Witness",
        "CathedralAxiomCycle.Witness.guarded"
      ],
      "axiomCounts": [
        1,
        1,
        1
      ],
      "misses": []
    },
    {
      "roots": [
        "CathedralAxiomCycle.Witness.plain",
        "CathedralAxiomCycle.Witness.guarded",
        "CathedralAxiomCycle.Witness"
      ],
      "axiomCounts": [
        1,
        1,
        1
      ],
      "misses": []
    },
    {
      "roots": [
        "CathedralAxiomCycle.Witness.guarded",
        "CathedralAxiomCycle.Witness",
        "CathedralAxiomCycle.Witness.plain"
      ],
      "axiomCounts": [
        1,
        0,
        0
      ],
      "misses": [
        "CathedralAxiomCycle.Witness",
        "CathedralAxiomCycle.Witness.plain"
      ]
    },
    {
      "roots": [
        "CathedralAxiomCycle.Witness.guarded",
        "CathedralAxiomCycle.Witness.plain",
        "CathedralAxiomCycle.Witness"
      ],
      "axiomCounts": [
        1,
        0,
        0
      ],
      "misses": [
        "CathedralAxiomCycle.Witness.plain",
        "CathedralAxiomCycle.Witness"
      ]
    }
  ],
  "downstreamPrediction": "incomplete imported cache can propagate; not native-tested"
}

Cross-lane coordination: acceleration RUN11 verified manifest membership (not typed edges) for GlobalTheory.divTied3_read 6078879, GlobalTheory.T.divisionCompatible_at_readIdentifications 6078946, Deduction.poleData_abstract 868460, Deduction.landau_cauchy 869149, Deduction.landau_pole_asym 869232, PositivityTheory.Xj7N.norm_small_le 9616555, PositivityTheory.Xj7N.local_unit_map_surjective 9613757, ModelDimension.cusp_form_extension_vanishing 9616232. Theta candidate PositivityTheory.SiegelWeilFormula.Avac.iwaQ_of' 8981975 needs source namespace confirmation; don't merge candidate with suffix. Dependency lane owns targeted projection; six-anchor prior run failed expected unqualified name (actual exact qualified namespace reconciled), not hard closure. Request adding these IDs and newly requested Galois/integration roots to next combined projection; no duplicated archive scan. No new source-to-export equality, no full RH kernel replay, no URT performance claim.

RESUME HERE: add a separate downstream module using only Witness.plain (define a theorem/def whose type and value are inspected) and compare its public #print axioms with the independently exported expression and constructor-inclusive graph. Preserve exact compiler pin; label whether external cache undercount actually propagates. Coordinate one combined targeted-role projection with dependency/acceleration lanes using manifest IDs above. HANDOFF TO dependencies, acceleration, audit, editor, integration, boxes, Landau, theta, geometry. Project OPEN.
*/
import fs from "node:fs";
import path from "node:path";
import crypto from "node:crypto";
const specs={
  "status": [
    "compute/rh-native-cycle-rc1-isolated-20261124/status.json",
    "7210d4c206b200af35c8d290bbedc06909dc5eb8"
  ],
  "report": [
    "compute/rh-native-cycle-rc1-isolated-20261124/outputs/rc1_result.json",
    "b16d10ce49ce3876b3d287db6ab6c6133f66aa2f"
  ],
  "log": [
    "compute/rh-native-cycle-rc1-isolated-20261124/outputs/fresh.log",
    "3e3d8e690b96d71c6448ad4186b73ea0f965d6a7"
  ],
  "copy": [
    "compute/rh-native-cycle-rc1-isolated-20261124/outputs/FreshCycle.lean",
    "ce2919ca00746b24f89c7228e3bea4870fce790f"
  ],
  "source": [
    "compute/rh-native-cycle-rc1-isolated-20261124/outputs/CollectAxioms.lean",
    "e789f33849debe5cc1f1d9bc60aa3e54a56df0d9"
  ],
  "graph": [
    "compute/rh-native-cycle-witness-20261124/outputs/plain.jsonl",
    "e5096a6d88ffc80f98fdc73c75f9f67f73b9f41d"
  ]
};
function audit(x){
 let checks=0,negative=0;
 const ck=(v,m)=>{if(!v)throw Error(m);checks++},eq=(a,b)=>JSON.stringify(a)===JSON.stringify(b);
 const st=JSON.parse(x.status),j=JSON.parse(x.report);
 ck(st.returncode===0&&st.status==="pass"&&st.sha==="9ecf527c82febc3e37af5366e4724993bebda240","native run identity");
 ck(st.run_url.endsWith("/45434018114")&&st.tail.includes("0b77e12952ad39077d80d8bd6b66d601f225c321"),"toolchain identity");
 ck(j.status==="NATIVE_SYNTHETIC_ISOLATED_UPSTREAM_COLLECTOR_COPY_NOT_RH_RECHECK","scope");
 const body=(s,n)=>{const a="namespace "+n+"\n",b="\nend "+n+"\n";ck(s.split(a).length===2&&s.split(b).length===2,"namespace boundary");return s.split(a)[1].split(b)[0]};
 const orig=body(x.source,"CollectAxioms"),copy=body(x.copy,"CathedralFreshCollectAxioms");
 ck(orig===copy,"upstream collector exact body");
 ck(orig.includes("seen := s.seen.insert c #[]")&&orig.includes("seen   := s.seen.insert c result")&&orig.includes("env.checked.get.find? c"),"sentinel mechanism");
 ck(x.source.includes("allNames.mapM fun name")&&x.source.includes("CollectAxioms.runM privateEnv do"),"shared export mechanism");
 ck(x.copy.includes("fun _ _ => none")&&x.copy.includes("order.mapM fun n"),"isolated experiment controls");
 const lines=x.log.trim().split("\n");
 const records=p=>lines.filter(l=>l.startsWith(p)).map(l=>JSON.parse(l.slice(p.length)));
 ck(lines.length===6&&eq(records("CYCLE_RESULT "),j.rows)&&eq(records("CYCLE_SHARED "),j.shared_orders),"native logs reproduce report");
 const rec=x.graph.trim().split("\n").map(JSON.parse),hdr=rec[0],ft=rec.at(-1);
 ck(hdr.schema==="cathedral-kernel-v2"&&ft.nodes===4&&ft.missing===0,"older actual graph header/footer");
 const name=id=>{ck(Array.isArray(id)&&id.every(z=>z.length===2&&z[0]==="s"&&typeof z[1]==="string"),"fixture tagged identity");return id.map(z=>z[1]).join(".")};
 const ns=rec.filter(z=>z.record==="node"),g=new Map();
 for(const z of ns){const n=name(z.id);ck(!g.has(n)&&n===z.display,"unique node");const deps=[...z.type_constants,...z.value_constants,...(z.kind==="inductive"?z.constructors:[])].map(name);g.set(n,{deps,ax:z.kind==="axiom"});}
 const w="CathedralAxiomCycle.Witness",p=w+".plain",q=w+".guarded",a="CathedralAxiomCycle.guardProp";
 ck(g.size===4&&eq(g.get(w).deps,[p,q])&&eq(g.get(p).deps,[w])&&eq(g.get(q).deps,[a,w])&&g.get(a).ax&&g.get(a).deps.length===0,"actual ordered fixture edges");
 for(const z of g.values())for(const d of z.deps)ck(g.has(d),"closed graph");
 function exact(root,graph=g){const seen=new Set(),todo=[root],out=new Set();while(todo.length){const n=todo.pop();if(seen.has(n))continue;seen.add(n);if(!graph.has(n))throw Error("missing "+n);const v=graph.get(n);if(v.ax)out.add(n);todo.push(...v.deps)}return [...out].sort()}
 // Return-value equivalent to the isolated collector's save/clear/merge accumulator
 // for this finite graph, retaining the empty active sentinel and completed cache.
 function cached(order,graph=g,ext=new Map()){const seen=new Map();function visit(n){if(ext.has(n)){const v=ext.get(n);seen.set(n,v);return v}if(seen.has(n))return seen.get(n);if(!graph.has(n))throw Error("missing "+n);seen.set(n,[]);const z=graph.get(n),out=new Set(z.ax?[n]:[]);for(const d of z.deps)for(const ax of visit(d))out.add(ax);const v=[...out].sort();seen.set(n,v);return v}return order.map(visit)}
 for(const row of j.rows){ck(eq(exact(row.root),[a]),"oracle");ck(eq(cached([row.root])[0],row.fresh),"fresh root");}
 ck(eq(j.cache_disagreements,[p]),"recorded imported disagreement");
 ck(eq(j.rows.map(r=>r.cached),[[a],[],[a]]),"public cached result");
 for(const row of j.shared_orders)ck(eq(cached(row.roots),row.axioms),"shared order exact native agreement");
 const perms=[];for(const u of [w,p,q])for(const v of [w,p,q])if(u!==v){const t=[w,p,q].find(z=>z!==u&&z!==v),roots=[u,v,t],axioms=cached(roots);ck(eq(axioms[0],exact(u)),"fresh first root");perms.push({roots,axiomCounts:axioms.map(z=>z.length),misses:roots.filter((z,i)=>!eq(axioms[i],exact(z)))})}
 // A hypothetical downstream declaration depends solely on the already cached plain.
 const graph=new Map(g);graph.set("downstream",{deps:[p],ax:false});
 ck(eq(exact("downstream",graph),[a]),"hypothetical cross-module oracle");
 ck(eq(cached(["downstream"],graph,new Map([[p,[]]]))[0],[]),"incomplete imported entry can propagate even on a fresh root");
 ck(eq(cached(["downstream"],graph,new Map([[p,[a]]]))[0],[a]),"complete imported entry control");
 const broken=new Map(g);broken.delete(a);try{exact(w,broken);throw Error("accepted deletion")}catch(e){ck(e.message==="missing "+a,"deletion rejected");negative++}
 try{cached([w],broken);throw Error("accepted deletion")}catch(e){ck(e.message==="missing "+a,"cached model deletion rejected");negative++}
 const corrupted=x.copy.replace("seen := s.seen.insert c #[]","seen := s.seen.insert c #[c]");ck(body(corrupted,"CathedralFreshCollectAxioms")!==orig,"body mutation rejected");negative++;
 return {status:"NATIVE_FIXTURE_LOG_REPLAY_AND_FINITE_GRAPH_MODEL_NOT_RH_RECHECK",checks,negative,nativeWallSeconds:st.wall_s,nativeOrders:j.shared_orders.length,modeledOrders:perms,downstreamPrediction:"incomplete imported cache can propagate; not native-tested"};
}
const root=process.argv[2];if(!root)throw Error("provide checkout of cathedral-research-state");
const inputs={};for(const [k,[p,sha]] of Object.entries(specs)){const buf=fs.readFileSync(path.join(root,p));const got=crypto.createHash("sha1").update("blob "+buf.length+"\0").update(buf).digest("hex");if(got!==sha)throw Error("Git blob mismatch "+k);inputs[k]=buf.toString("utf8")}
console.log(JSON.stringify(audit(inputs),null,2));
