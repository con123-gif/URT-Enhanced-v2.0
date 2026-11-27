#!/usr/bin/env node
/*
RUN85 — A2 propagate to actual Theorem A and A/B joint witness.
27 Nov 2026; source-matched PREPARED, not native replayed.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
87e949a9ea899dd09d297aa30f59df4d1b533fc4, 261b9e8bf027af37e6abe6920deb544b23352d48.
Read AGENTS, SWARM, HANDOFF, EXPANSION, RUN81–84, peer acceleration
2e18ca4e (different jet overlay), prime 65a6c3fb and B2/C2 receipts.

Specific gap: RUN84's seven named theorem replacements stop below actual A.
LocalStatement uses exists_chain_eq_sum independently in the archimedean
norm bound, and gaugeLe_chain independently in the ordinary and marked
local gauge bounds. The index theorem consumes FOUR gauge branches,
not merely the marked one. short_forms consumes THREE distinct suppliers:
span, size, index. LongForms consumes short_forms alongside enough_forms.
Retarget all these proof constants jointly, in topological order, with
unchanged statements, universes and all other proof terms. Preserve same
D, q, S, B, twists, numerical constraints, all-conjugate and local bounds.
This is a proof-transport candidate, no new mathematical premise or
claimed proof of those retained primitive estimates.

A further independent path is Data.filling, a DEFINITION rather than a
theorem, with classAut_columnLevel_eq_bot inside Filling.mk. Do not pass
this to the theorem-only transport function or assert global old-leaf
absence: dependent type occurrences and proof-irrelevant structure
fields require separate native definitional-equality and graph audit.
Keep B4 and enough_forms untouched. Also retain old A1/A2 jet overlays
and their failure receipts; they concern a different supplier.

Actual shared run 46023465491 status 07a2b14930c38095e6771ae9ed1a10a3cf1bf678:
error rc=1, original LocalStatement build rc=0 (3199.21s) but
A1 transport and A2 patched build failed; A2 original probe rc=0,
splice rc=0, rebuild rc=1 (39.38s), receipt
566a91c8625dd1f17e13f7722b9286c0bd1b3402. No replacement PASS.
This run executed source checks on connector-returned actual pinned files:
14 edge anchors across 9 callers, 14 damaged-edge controls rejected,
enough_forms retained, definition boundary identified. No native Lean
/lake/elan present locally. No rh_scan/prune/reduce/auto/frontier run,
no URT comparison or native axiom claim. Actual original/reduced direct
source graph in spec; do not mistake it for complete kernel graph.
All A1–A3, B/C/D/E/V and transitive obligations retained.

RESUME HERE: in a reused ORIGINAL pinned LongForms environment, generate
RUN84 first; this script consumes its exact generated candidate, extends
the import and appends the nine transports. Run the generated module
with lake env lean --tstack=400000, preserve log, exact source and
manifest. Require native exit 0, original RUN84 leaf/seven checks and
nine new checks, no new axioms, exact types and value-edge guards.
If a prior leaf fails, repair it FIRST; do not launch another cold build
merely for this extension. Then export constructor-inclusive graph for
actual old/new A and LongForms roots using accepted strict 4.35 adapter,
report surviving old-leaf paths, including Data.filling if reachable.
HANDOFF TO kernel, acceleration, integration, audit. RH/star OPEN.
*/
import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import {execFileSync} from 'node:child_process';
const pin="72fead102f663d5c7a407964a13dc0cf9d977207";
const paths=["New/Columns/LocalStatement.lean","New/Endgame/ShortAndEnough.lean","New/Endgame/LongForms.lean","New/Filling/FillingData.lean"];
const hashes=["9d5bd0d698b0db2850cbd306d8d400d7e99a3547","b99eea0689be372d84362c58272b705e104b6a3a","9eff36cf003ac398fbd24361e80e95a03d0b0e05","0ef8b0dfe13173b16bd0a8820a4924f10124e278"];
const spec=[
  [
    "Data.IsGoodDatum.gaugeLe_markOperator_pow",
    0,
    [
      [
        "Data.IsGoodDatum.gaugeLe_chain",
        "gaugeLe_chain"
      ]
    ]
  ],
  [
    "Data.weylNormSq_Bmu_le",
    0,
    [
      [
        "Data.exists_chain_eq_sum",
        "exists_chain_eq_sum"
      ]
    ]
  ],
  [
    "Data.IsGoodDatum.gaugeLe_one",
    0,
    [
      [
        "Data.IsGoodDatum.gaugeLe_chain",
        "gaugeLe_chain"
      ]
    ]
  ],
  [
    "Data.IsGoodDatum.gaugeLe_Bmu_of_isMarked",
    0,
    [
      [
        "Data.IsGoodDatum.gaugeLe_markOperator_pow",
        "gaugeLe_markOperator_pow"
      ]
    ]
  ],
  [
    "Data.IsGoodDatum.gaugeLe_collisionSum",
    0,
    [
      [
        "Data.IsGoodDatum.gaugeLe_markOperator_pow",
        "gaugeLe_markOperator_pow"
      ]
    ]
  ],
  [
    "Data.IsGoodDatum.gaugeLe_pow_jetCeil_smul",
    0,
    [
      [
        "Data.IsGoodDatum.gaugeLe_collisionSum",
        "gaugeLe_collisionSum"
      ]
    ]
  ],
  [
    "Data.exists_indexDvd_Bmu_divisible",
    0,
    [
      [
        "Data.IsGoodDatum.gaugeLe_Bmu_of_isMarked",
        "gaugeLe_Bmu_of_isMarked"
      ],
      [
        "Data.IsGoodDatum.gaugeLe_pow_jetCeil_smul",
        "gaugeLe_pow_jetCeil_smul"
      ],
      [
        "Data.IsGoodDatum.gaugeLe_collisionSum",
        "gaugeLe_collisionSum"
      ],
      [
        "Data.IsGoodDatum.gaugeLe_one",
        "gaugeLe_one"
      ]
    ]
  ],
  [
    "Data.short_forms",
    1,
    [
      [
        "Data.span_short_ramifiedColumns",
        "span_short_ramifiedColumns"
      ],
      [
        "Data.weylNormSq_Bmu_le",
        "weylNormSq_Bmu_le"
      ],
      [
        "Data.exists_indexDvd_Bmu_divisible",
        "exists_indexDvd_Bmu_divisible"
      ]
    ]
  ],
  [
    "Data.exists_family_covolumeSq_le",
    2,
    [
      [
        "Data.short_forms",
        "short_forms"
      ]
    ]
  ]
];
const oldSpec=new Set(["Data.IsGoodDatum.gaugeLe_chain","Data.exists_chain_eq_sum","Data.span_short_ramifiedColumns"]);
function body(s,n,kind="lemma"){const a=s.indexOf(kind+" "+n);if(a<0)throw Error("missing declaration "+n);const t=s.slice(a);const b=t.slice(1).search(/\n(?:\/--|lemma |theorem |variable |include |omit |seal |noncomputable def |def |end\b)/);return b<0?t:t.slice(0,b+1);}
function has(t,n){return new RegExp("(^|[^A-Za-z0-9_])"+n+"(?![A-Za-z0-9_])","m").test(t);}
function check(t,deps){for(const [,n] of deps)if(!has(t,n))throw Error("missing edge "+n);}
const assert=(ok,msg)=>{if(!ok)throw Error(msg)};
const blob=s=>crypto.createHash("sha1").update("blob "+Buffer.byteLength(s)+"\\0".replace("\\0","\0")).update(s).digest("hex");
const root=path.resolve(process.argv[2]||"."), inFile=path.resolve(process.argv[3]||"theta84-out/ThetaTransportRun84.lean"), out=path.resolve(process.argv[4]||"theta85-out");
assert(execFileSync("git",["-C",root,"rev-parse","HEAD"],{encoding:"utf8"}).trim()===pin,"wrong pin");
assert(out!==root&&!out.startsWith(root+path.sep),"external output required");
const ss=paths.map((p,i)=>{const s=fs.readFileSync(path.join(root,"grh-compact/src",p),"utf8");assert(blob(s)===hashes[i],"modified "+p);return s});
let edges=0,negative=0;
for(const [n,i,deps] of spec){const t=body(ss[i],n);check(t,deps);for(const [,d] of deps){edges++;const changed=t.replace(new RegExp("(^|[^A-Za-z0-9_])"+d+"(?![A-Za-z0-9_])","gm"),"$1REMOVED85");try{check(changed,deps)}catch(e){negative++}}}
assert(edges===14&&negative===14,"source controls failed");
assert(has(body(ss[2],"Data.exists_family_covolumeSq_le"),"enough_forms"),"B branch changed");
assert(has(body(ss[3],"Data.filling","noncomputable def"),"classAut_columnLevel_eq_bot"),"definition frontier changed");
const input=fs.readFileSync(inFile,"utf8");
const prior=JSON.parse(fs.readFileSync(path.join(path.dirname(inFile),"source_manifest.json"),"utf8"));
assert(prior.pin===pin&&prior.generated_blob===blob(input)&&prior.source_edge_checks===9&&prior.negative_controls_rejected===9,"wrong RUN84 manifest");
assert(input.split("import New.Columns.ChainValuation\n").length===2&&input.includes("THETA84_LEAF_CHECKED"),"wrong RUN84 input");
const seen=new Set(oldSpec);
let tail="\n\nrun_cmd do\n";
for(const [n,,deps] of spec){
 for(const [d] of deps)assert(seen.has(d),"not topological: "+d);
 const fresh=n+"_run85";
 const subs=deps.map(([d])=>"(\u0060\u0060"+d+", \u0060\u0060"+d+(oldSpec.has(d)?"_run84":"_run85")+")").join(", ");
 tail+="  theta84Transport \u0060\u0060"+n+" \u0060\u0060"+fresh+"\n    #["+subs+"]\n";
 seen.add(n);
}
for(const [n] of spec)tail+="\n#print axioms "+n+"\n#print axioms "+n+"_run85\n";
const generated=input.replace("import New.Columns.ChainValuation\n","import New.Endgame.LongForms\n")+tail;
assert(!/^import (?:Main|New\.Main)\b/m.test(generated),"forbidden import");
fs.mkdirSync(out,{recursive:true});
fs.writeFileSync(path.join(out,"ThetaTransportRun85.lean"),generated,{flag:"wx"});
fs.writeFileSync(path.join(out,"source_manifest.json"),JSON.stringify({pin,paths,hashes,spec,edges,negative,run84_blob:blob(input),generated_blob:blob(generated),native_verified:false,full_RH_replay:false},null,2),{flag:"wx"});
console.log("RUN85 source checks complete; NOT native PASS");
