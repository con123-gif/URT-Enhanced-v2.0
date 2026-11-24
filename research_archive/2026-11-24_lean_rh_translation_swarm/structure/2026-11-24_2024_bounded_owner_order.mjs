/* STRUCTURE 2026-11-24 20:24 UTC — ONE contribution: bounded monotone owner-order optimization on the full authenticated observed role projection (and root subset), with a capped exhaustive prefix control. PARTIAL.
Preflight SWARM_PROTOCOL first, AGENTS, state, actual runner log/protocol, continuity, HANDOFF_QUEUE, expansion, CI #392 PASS (run 45475909611, not RH validity), prior structure 9b7dbd7b01eb02c4a8c4ed69a1cb259657ce87e2, dependencies 63102da (18-target producer) and 593acf8 (47-target reconciliation), integration e89edf7, audit c242308, math 1c79a786, peer acceleration a23fb0d and kernel fff5a2d commit checkpoints. Root-level log/protocol 404 corrected. Dependency fetch_commit argument schema failed then exact REST commit recovered. Next native report compute/rh-next-root-roles-20261124/status.json not yet available (404); no fabrication. External blueprint not reopened; no new source mathematics asserted.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; pinned src/Main.lean blob dbd5db70bc11b35f18fa5751216ab335321e7bfc retrieved; current upstream HEAD 9282d3a102c4aff0e6026746db2a8990f5d9cddd not adopted. Exact authenticated export role inputs from cathedral-research-state compute/rh-combined-frontier-roles-20261124/outputs/solution_frontier_roles.json blob d49fbcc22a2382039986b09ff91dd11af2ef2e7b, SHA256 9d9f461a5afebec9f020e2349a8bc359fcfdcbd7fe3e667b92c6b64a95660ad6; compute/rh-targeted-role-witness-20261124/outputs/solution_direct_roles.json blob 64b935e4ef309f6c555912a377012c7708eda510; connector retrieved by exact blob; regular contents endpoint for large report returned empty, recovered via Git blob. No independent source-export binding, Lean kernel replay or full proof coverage. Prior parser and fixed-owner tree contraction copied from structure/2026-11-24_1924_terminal_motif_exact_order.mjs blob 3b97264430e2eca7ccdb2f9dd8c047a270b19324 with obsolete owner bitmask/exact enumeration removed. All typed role records and encoded structural entries preserved separately. Whole observed view includes 40 owners not currently root-linked; they are not proved reachable or unreachable in full graph. Opaque frontier leaves are not global leaves.
Algorithm: for a legal owner order, consecutive incomparable owners can exchange iff there is no direct edge between them (an indirect path would require an intervening owner). Each candidate receives the previous exact fixed-owner grouped tree score. Accept only strict decreases, evaluate at most 128 orders including seed, stop at budget or when a complete adjacent sweep finds no improving move. Prefix control enumerates owner linear extensions with a hard cap and never labels a truncated traversal exact. Both use identical evaluation budgets and deterministic tie order. Conventional and fixed URT pi/e + golden-angle seed rankings unchanged. Global optimum known ONLY for the root subset from previous certificate (105109 roles, 107057 occurrence weights). No global claim for full observed graph. Complexity O(b*(N+M*d+G^2)+b*m^2) conservatively, b evaluation budget, m owners, G grouped jobs, M motifs, d max motif degree, plus initial graph scheduling. No universal O(N). No premises/axioms removed. Span and peak live roles/nodes are readability proxies, not human tests. TypedBytes is prior solver working-array payload only; search slots count logical JS entries not bytes; V8 runtime Date.now, process RAM unavailable here; CLI reports whole process maxRSS. Small oracle uses synthetic graphs only, not proof evidence.
Executed in tool V8 (not native Node); exact blob metadata via connector, byte hash checks only in replay CLI:
{
  "status": "PARTIAL_EXPORT_ROLE_PROJECTION_NOT_KERNEL_RECHECK",
  "budget": 128,
  "checks": 368392,
  "negative": 10,
  "oracleCases": 48,
  "oracleOrders": 3436,
  "localMisses": 3,
  "capMisses": 26,
  "results": {
    "root": {
      "nodes": 613,
      "owners": 13,
      "records": 906,
      "modes": {
        "roles": {
          "motifs": 35,
          "rows": {
            "raw/ordinary": {
              "d": 206817,
              "wd": 216087,
              "peak": 645,
              "peakNodes": 436,
              "msPerRun": 21,
              "repeats": 3
            },
            "grouped/ordinary": {
              "d": 105639,
              "wd": 107819,
              "peak": 497,
              "peakNodes": 339,
              "msPerRun": 0.3,
              "repeats": 10,
              "jobs": 39,
              "typedBytes": 3271
            },
            "adjacent/ordinary": {
              "d": 105576,
              "wd": 107756,
              "peak": 497,
              "peakNodes": 339,
              "msPerRun": 3.5,
              "repeats": 2,
              "jobs": 39,
              "typedBytes": 3271,
              "initial": 105639,
              "evaluations": 13,
              "accepted": 1,
              "complete": false,
              "local": true,
              "visited": 0,
              "maxSearchSlots": 39
            },
            "prefix/ordinary": {
              "d": 105109,
              "wd": 107099,
              "peak": 497,
              "peakNodes": 339,
              "msPerRun": 25.5,
              "repeats": 2,
              "jobs": 38,
              "typedBytes": 3250,
              "initial": 105639,
              "evaluations": 128,
              "accepted": 7,
              "complete": false,
              "local": false,
              "visited": 951,
              "maxSearchSlots": 39
            },
            "raw/centrality": {
              "d": 277795,
              "wd": 287125,
              "peak": 751,
              "peakNodes": 457,
              "msPerRun": 17,
              "repeats": 3
            },
            "grouped/centrality": {
              "d": 105639,
              "wd": 107819,
              "peak": 497,
              "peakNodes": 339,
              "msPerRun": 0.2,
              "repeats": 10,
              "jobs": 39,
              "typedBytes": 3271
            },
            "adjacent/centrality": {
              "d": 105576,
              "wd": 107756,
              "peak": 497,
              "peakNodes": 339,
              "msPerRun": 2.5,
              "repeats": 2,
              "jobs": 39,
              "typedBytes": 3271,
              "initial": 105639,
              "evaluations": 13,
              "accepted": 1,
              "complete": false,
              "local": true,
              "visited": 0,
              "maxSearchSlots": 39
            },
            "prefix/centrality": {
              "d": 105109,
              "wd": 107099,
              "peak": 497,
              "peakNodes": 339,
              "msPerRun": 25.5,
              "repeats": 2,
              "jobs": 38,
              "typedBytes": 3250,
              "initial": 105639,
              "evaluations": 128,
              "accepted": 7,
              "complete": false,
              "local": false,
              "visited": 951,
              "maxSearchSlots": 39
            },
            "raw/urt": {
              "d": 329916,
              "wd": 339612,
              "peak": 807,
              "peakNodes": 579,
              "msPerRun": 12.666666666666666,
              "repeats": 3
            },
            "grouped/urt": {
              "d": 108203,
              "wd": 110449,
              "peak": 497,
              "peakNodes": 339,
              "msPerRun": 0.2,
              "repeats": 10,
              "jobs": 38,
              "typedBytes": 3250
            },
            "adjacent/urt": {
              "d": 106185,
              "wd": 108353,
              "peak": 497,
              "peakNodes": 339,
              "msPerRun": 3,
              "repeats": 2,
              "jobs": 39,
              "typedBytes": 3271,
              "initial": 108203,
              "evaluations": 19,
              "accepted": 2,
              "complete": false,
              "local": true,
              "visited": 0,
              "maxSearchSlots": 39
            },
            "prefix/urt": {
              "d": 105109,
              "wd": 107099,
              "peak": 497,
              "peakNodes": 339,
              "msPerRun": 22,
              "repeats": 2,
              "jobs": 38,
              "typedBytes": 3250,
              "initial": 108203,
              "evaluations": 128,
              "accepted": 8,
              "complete": false,
              "local": false,
              "visited": 951,
              "maxSearchSlots": 39
            }
          }
        },
        "weighted": {
          "motifs": 38,
          "rows": {
            "raw/ordinary": {
              "d": 206817,
              "wd": 216087,
              "peak": 645,
              "peakNodes": 436,
              "msPerRun": 20.333333333333332,
              "repeats": 3
            },
            "grouped/ordinary": {
              "d": 105661,
              "wd": 107777,
              "peak": 497,
              "peakNodes": 339,
              "msPerRun": 0.2,
              "repeats": 10,
              "jobs": 40,
              "typedBytes": 3292
            },
            "adjacent/ordinary": {
              "d": 105598,
              "wd": 107714,
              "peak": 497,
              "peakNodes": 339,
              "msPerRun": 2,
              "repeats": 2,
              "jobs": 40,
              "typedBytes": 3292,
              "initial": 107777,
              "evaluations": 13,
              "accepted": 1,
              "complete": false,
              "local": true,
              "visited": 0,
              "maxSearchSlots": 39
            },
            "prefix/ordinary": {
              "d": 105137,
              "wd": 107057,
              "peak": 497,
              "peakNodes": 339,
              "msPerRun": 25,
              "repeats": 2,
              "jobs": 38,
              "typedBytes": 3250,
              "initial": 107777,
              "evaluations": 128,
              "accepted": 8,
              "complete": false,
              "local": false,
              "visited": 951,
              "maxSearchSlots": 39
            },
            "raw/centrality": {
              "d": 277795,
              "wd": 287125,
              "peak": 751,
              "peakNodes": 457,
              "msPerRun": 17,
              "repeats": 3
            },
            "grouped/centrality": {
              "d": 105661,
              "wd": 107777,
              "peak": 497,
              "peakNodes": 339,
              "msPerRun": 0.2,
              "repeats": 10,
              "jobs": 40,
              "typedBytes": 3292
            },
            "adjacent/centrality": {
              "d": 105598,
              "wd": 107714,
              "peak": 497,
              "peakNodes": 339,
              "msPerRun": 2,
              "repeats": 2,
              "jobs": 40,
              "typedBytes": 3292,
              "initial": 107777,
              "evaluations": 13,
              "accepted": 1,
              "complete": false,
              "local": true,
              "visited": 0,
              "maxSearchSlots": 39
            },
            "prefix/centrality": {
              "d": 105137,
              "wd": 107057,
              "peak": 497,
              "peakNodes": 339,
              "msPerRun": 22.5,
              "repeats": 2,
              "jobs": 38,
              "typedBytes": 3250,
              "initial": 107777,
              "evaluations": 128,
              "accepted": 8,
              "complete": false,
              "local": false,
              "visited": 951,
              "maxSearchSlots": 39
            },
            "raw/urt": {
              "d": 329916,
              "wd": 339612,
              "peak": 807,
              "peakNodes": 579,
              "msPerRun": 16,
              "repeats": 3
            },
            "grouped/urt": {
              "d": 108227,
              "wd": 110407,
              "peak": 497,
              "peakNodes": 339,
              "msPerRun": 0.3,
              "repeats": 10,
              "jobs": 38,
              "typedBytes": 3250
            },
            "adjacent/urt": {
              "d": 106209,
              "wd": 108311,
              "peak": 497,
              "peakNodes": 339,
              "msPerRun": 5,
              "repeats": 2,
              "jobs": 39,
              "typedBytes": 3271,
              "initial": 110407,
              "evaluations": 19,
              "accepted": 2,
              "complete": false,
              "local": true,
              "visited": 0,
              "maxSearchSlots": 39
            },
            "prefix/urt": {
              "d": 105137,
              "wd": 107057,
              "peak": 497,
              "peakNodes": 339,
              "msPerRun": 32,
              "repeats": 2,
              "jobs": 38,
              "typedBytes": 3250,
              "initial": 110407,
              "evaluations": 128,
              "accepted": 9,
              "complete": false,
              "local": false,
              "visited": 951,
              "maxSearchSlots": 39
            }
          }
        }
      }
    },
    "allObserved": {
      "nodes": 3293,
      "owners": 53,
      "records": 13312,
      "modes": {
        "roles": {
          "motifs": 817,
          "rows": {
            "raw/ordinary": {
              "d": 24694606,
              "wd": 25098333,
              "peak": 11714,
              "peakNodes": 2545,
              "msPerRun": 489.6666666666667,
              "repeats": 3
            },
            "grouped/ordinary": {
              "d": 6840471,
              "wd": 6903800,
              "peak": 8628,
              "peakNodes": 2180,
              "msPerRun": 8.9,
              "repeats": 10,
              "jobs": 403,
              "typedBytes": 21635
            },
            "adjacent/ordinary": {
              "d": 6764667,
              "wd": 6825184,
              "peak": 8622,
              "peakNodes": 2174,
              "msPerRun": 1178.5,
              "repeats": 2,
              "jobs": 408,
              "typedBytes": 21740,
              "initial": 6840471,
              "evaluations": 128,
              "accepted": 4,
              "complete": false,
              "local": false,
              "visited": 0,
              "maxSearchSlots": 159
            },
            "prefix/ordinary": {
              "d": 6822350,
              "wd": 6885894,
              "peak": 8628,
              "peakNodes": 2180,
              "msPerRun": 1236.5,
              "repeats": 2,
              "jobs": 403,
              "typedBytes": 21635,
              "initial": 6840471,
              "evaluations": 128,
              "accepted": 5,
              "complete": false,
              "local": false,
              "visited": 748,
              "maxSearchSlots": 159
            },
            "raw/centrality": {
              "d": 32129228,
              "wd": 32575846,
              "peak": 12125,
              "peakNodes": 2774,
              "msPerRun": 427.6666666666667,
              "repeats": 3
            },
            "grouped/centrality": {
              "d": 7463244,
              "wd": 7508489,
              "peak": 10149,
              "peakNodes": 2452,
              "msPerRun": 8.7,
              "repeats": 10,
              "jobs": 401,
              "typedBytes": 21593
            },
            "adjacent/centrality": {
              "d": 7419155,
              "wd": 7464193,
              "peak": 10149,
              "peakNodes": 2452,
              "msPerRun": 1136.5,
              "repeats": 2,
              "jobs": 404,
              "typedBytes": 21656,
              "initial": 7463244,
              "evaluations": 128,
              "accepted": 3,
              "complete": false,
              "local": false,
              "visited": 0,
              "maxSearchSlots": 159
            },
            "prefix/centrality": {
              "d": 6822350,
              "wd": 6885894,
              "peak": 8628,
              "peakNodes": 2180,
              "msPerRun": 1188.5,
              "repeats": 2,
              "jobs": 403,
              "typedBytes": 21635,
              "initial": 7463244,
              "evaluations": 128,
              "accepted": 6,
              "complete": false,
              "local": false,
              "visited": 748,
              "maxSearchSlots": 159
            },
            "raw/urt": {
              "d": 33358044,
              "wd": 33823972,
              "peak": 12607,
              "peakNodes": 3114,
              "msPerRun": 368.3333333333333,
              "repeats": 3
            },
            "grouped/urt": {
              "d": 7982517,
              "wd": 8015192,
              "peak": 10982,
              "peakNodes": 2618,
              "msPerRun": 8.4,
              "repeats": 10,
              "jobs": 384,
              "typedBytes": 21236
            },
            "adjacent/urt": {
              "d": 7948537,
              "wd": 7982059,
              "peak": 10973,
              "peakNodes": 2622,
              "msPerRun": 1079.5,
              "repeats": 2,
              "jobs": 379,
              "typedBytes": 21131,
              "initial": 7982517,
              "evaluations": 128,
              "accepted": 4,
              "complete": false,
              "local": false,
              "visited": 0,
              "maxSearchSlots": 159
            },
            "prefix/urt": {
              "d": 6822350,
              "wd": 6885894,
              "peak": 8628,
              "peakNodes": 2180,
              "msPerRun": 1085.5,
              "repeats": 2,
              "jobs": 403,
              "typedBytes": 21635,
              "initial": 7982517,
              "evaluations": 128,
              "accepted": 6,
              "complete": false,
              "local": false,
              "visited": 748,
              "maxSearchSlots": 159
            }
          }
        },
        "weighted": {
          "motifs": 820,
          "rows": {
            "raw/ordinary": {
              "d": 24694606,
              "wd": 25098333,
              "peak": 11714,
              "peakNodes": 2545,
              "msPerRun": 459.6666666666667,
              "repeats": 3
            },
            "grouped/ordinary": {
              "d": 6841633,
              "wd": 6901006,
              "peak": 8723,
              "peakNodes": 2184,
              "msPerRun": 8.8,
              "repeats": 10,
              "jobs": 406,
              "typedBytes": 21698
            },
            "adjacent/ordinary": {
              "d": 6765611,
              "wd": 6823699,
              "peak": 8718,
              "peakNodes": 2179,
              "msPerRun": 1119,
              "repeats": 2,
              "jobs": 410,
              "typedBytes": 21782,
              "initial": 6901006,
              "evaluations": 128,
              "accepted": 4,
              "complete": false,
              "local": false,
              "visited": 0,
              "maxSearchSlots": 159
            },
            "prefix/ordinary": {
              "d": 6823512,
              "wd": 6883100,
              "peak": 8723,
              "peakNodes": 2184,
              "msPerRun": 1142.5,
              "repeats": 2,
              "jobs": 406,
              "typedBytes": 21698,
              "initial": 6901006,
              "evaluations": 128,
              "accepted": 5,
              "complete": false,
              "local": false,
              "visited": 748,
              "maxSearchSlots": 159
            },
            "raw/centrality": {
              "d": 32129228,
              "wd": 32575846,
              "peak": 12125,
              "peakNodes": 2774,
              "msPerRun": 417,
              "repeats": 3
            },
            "grouped/centrality": {
              "d": 7464991,
              "wd": 7506154,
              "peak": 10180,
              "peakNodes": 2453,
              "msPerRun": 9.7,
              "repeats": 10,
              "jobs": 403,
              "typedBytes": 21635
            },
            "adjacent/centrality": {
              "d": 7420898,
              "wd": 7461858,
              "peak": 10180,
              "peakNodes": 2453,
              "msPerRun": 1161,
              "repeats": 2,
              "jobs": 406,
              "typedBytes": 21698,
              "initial": 7506154,
              "evaluations": 128,
              "accepted": 3,
              "complete": false,
              "local": false,
              "visited": 0,
              "maxSearchSlots": 159
            },
            "prefix/centrality": {
              "d": 6823512,
              "wd": 6883100,
              "peak": 8723,
              "peakNodes": 2184,
              "msPerRun": 1170,
              "repeats": 2,
              "jobs": 406,
              "typedBytes": 21698,
              "initial": 7506154,
              "evaluations": 128,
              "accepted": 6,
              "complete": false,
              "local": false,
              "visited": 748,
              "maxSearchSlots": 159
            },
            "raw/urt": {
              "d": 33358044,
              "wd": 33823972,
              "peak": 12607,
              "peakNodes": 3114,
              "msPerRun": 419.6666666666667,
              "repeats": 3
            },
            "grouped/urt": {
              "d": 7984093,
              "wd": 8014024,
              "peak": 11235,
              "peakNodes": 2634,
              "msPerRun": 10.9,
              "repeats": 10,
              "jobs": 384,
              "typedBytes": 21236
            },
            "adjacent/urt": {
              "d": 7949962,
              "wd": 7981163,
              "peak": 11190,
              "peakNodes": 2633,
              "msPerRun": 1153.5,
              "repeats": 2,
              "jobs": 379,
              "typedBytes": 21131,
              "initial": 8014024,
              "evaluations": 128,
              "accepted": 4,
              "complete": false,
              "local": false,
              "visited": 0,
              "maxSearchSlots": 159
            },
            "prefix/urt": {
              "d": 6823512,
              "wd": 6883100,
              "peak": 8723,
              "peakNodes": 2184,
              "msPerRun": 1252,
              "repeats": 2,
              "jobs": 406,
              "typedBytes": 21698,
              "initial": 8014024,
              "evaluations": 128,
              "accepted": 6,
              "complete": false,
              "local": false,
              "visited": 748,
              "maxSearchSlots": 159
            }
          }
        }
      }
    }
  }
}
RESUME HERE: once rh-next-root-roles-20261124 native output exists, extend the root-linked scheduler with role-specific recursor RHS and structural SCC handling; do not flatten package edges into proof-term references. HANDOFF TO dependencies, audit, integration, kernel and acceleration. Project OPEN.
*/
function run(A,B,clock){
 let checks=0,negative=0;
 const ck=(p,m)=>{if(!p)throw Error(m);checks++}, J=JSON.stringify;
 const pin="40e56bab026552e089d7afcfeff08d2defb9c005",digest="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e";
 for(const r of [A,B])ck(r.digest===digest&&r.bytes===61570595788&&r.n===1065214335&&r.root===14065054&&r.indexedDeclarations===1484733,"archive");
 ck(A.pin===pin&&A.reports.length===47&&B.reports.length===6,"reports");
 const own=new Map(), identities=new Map(), records=[],roles={type:0,value:0,structural:0};
 function ident(id,parts,kind){const k=J([parts,kind]);ck(Number.isSafeInteger(id)&&id>=0&&Array.isArray(parts)&&parts.length>0&&(!identities.has(id)||identities.get(id)===k),"identity");identities.set(id,k)}
 for(const z of [...B.reports,...A.reports]){
  ck(!own.has(z.id)&&z.status==="EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK","owner");own.set(z.id,z);
  ident(z.id,(z.request??z.source).name.split("."),z.kind);
  ck(z.type&&((z.kind==="ctor")?z.value===null:!!z.value),"role shape");
  for(const role of ["type","value"]){const t=z[role];if(!t)continue;let sum=0;const seen=new Set();
   for(const [index,e] of t.references.entries()){
    ident(e.target,e.nameParts,e.targetKind);const k=J([e.kind,e.target]);ck(!seen.has(k)&&["explicit_const","projection_carrier","literal_primitive"].includes(e.kind)&&Number.isSafeInteger(e.witnessExpression)&&e.witnessExpression>=0&&e.witnessExpression<=t.expressionRoot&&Number.isSafeInteger(e.distinctExpressionRecords)&&e.distinctExpressionRecords>0,"typed witness");seen.add(k);sum+=e.distinctExpressionRecords;records.push({a:e.target,b:z.id,role,index,w:e.distinctExpressionRecords,raw:e});roles[role]++;
   }ck(sum===t.referenceOccurrences,"role count");
  }
  for(const [index,e] of (z.structural??[]).entries()){ident(e.target,e.nameParts,e.kind);ck(e.encoded===-e.target-1&&z.encodedRootsAndStructuralEdges[e.edgeIndex]===e.encoded,"structural witness");records.push({a:e.target,b:z.id,role:"structural",index,w:1,raw:e});roles.structural++}
 }
 ck(records.length===13312&&own.size===53&&identities.size===3293&&J(roles)===J({type:3077,value:10233,structural:2}),"full census");
 function model(n,oo,ee,weighted){
  const O=new Set(oo),P=Array.from({length:n},()=>new Set()),S=Array.from({length:n},()=>new Set()),w=new Int32Array(n);
  for(const [a,b,v] of ee){if(a===b||!O.has(b)||v<=0)throw Error("outtree scope");P[b].add(a);S[a].add(b);const t=weighted?v:1;w[a]+=t;w[b]-=t}
  if([...Array(n).keys()].some(a=>!O.has(a)&&!S[a].size))throw Error("orphan leaf");
  const motifs=new Map();for(let a=0;a<n;a++)if(!O.has(a)){const targets=[...S[a]].sort((x,y)=>x-y),k=J([w[a],targets]);if(!motifs.has(k))motifs.set(k,{w:w[a],targets,ids:[]});motifs.get(k).ids.push(a)}
  const M=[...motifs.values()],OP=oo.map(a=>[...P[a]].filter(x=>O.has(x))),idx=new Map(oo.map((x,i)=>[x,i]));
  function metric(q){const rank=new Int32Array(n).fill(-1);if(q.length!==n)throw Error("length");q.forEach((a,i)=>{if(a<0||a>=n||rank[a]>=0)throw Error("duplicate");rank[a]=i});let d=0,wd=0;const diff=new Int32Array(n+1),open=new Int32Array(n+1);for(const [a,b,v] of ee){const t=rank[b]-rank[a];if(t<=0)throw Error("topology");d+=t;wd+=v*t;diff[rank[a]]++;diff[rank[b]]--}for(let a=0;a<n;a++)if(S[a].size){let last=-1;for(const b of S[a])last=Math.max(last,rank[b]);open[rank[a]]++;open[last]--}let r=0,l=0,peak=0,peakNodes=0;for(let i=0;i<n;i++){r+=diff[i];l+=open[i];peak=Math.max(peak,r);peakNodes=Math.max(peakNodes,l)}return {d,wd,peak,peakNodes}}
  const phi=(1+Math.sqrt(5))/2,theta=2*Math.PI/phi**2,kappa=Math.PI/Math.E;
  function kahn(mode,core){const active=core?oo:[...Array(n).keys()],ind=new Int32Array(n),score=new Float64Array(n),ready=[],out=[];for(const i of active){ind[i]=core?[...P[i]].filter(x=>O.has(x)).length:P[i].size;score[i]=mode==="ordinary"?0:S[i].size+(mode==="urt"?kappa*Math.cos((i+1)*theta):0);if(!ind[i])ready.push(i)}while(ready.length){let j=0;for(let k=1;k<ready.length;k++)if(score[ready[k]]>score[ready[j]]||score[ready[k]]===score[ready[j]]&&ready[k]<ready[j])j=k;const x=ready[j];ready[j]=ready.at(-1);ready.pop();out.push(x);for(const y of S[x])if(--ind[y]===0)ready.push(y)}if(out.length!==active.length)throw Error("cycle");return out}
  function batch(order){const seen=new Set(),out=[];for(const o of order){for(const a of [...P[o]].filter(a=>!O.has(a)&&!seen.has(a)).sort((a,b)=>w[a]-w[b]||a-b)){out.push(a);seen.add(a)}out.push(o)}return out}
  // A fixed owner order induces the reversed out-tree. Combine terminal leaves
  // of equal coefficient and parent into a job of length multiplicity.
  function solve(order,group=true,expand=true){
   const m=order.length,rank=new Int32Array(n).fill(-1);order.forEach((x,i)=>rank[x]=i);
   for(const o of order)for(const a of P[o])if(O.has(a)&&rank[a]>=rank[o])throw Error("bad owner order");
   const members=order.map(x=>[x]),parent=order.map((_,i)=>i+1),coef=order.map(x=>w[x]),count=order.map(()=>1),lookup=new Map();
   for(const motif of M){let p=m;for(const t of motif.targets)p=Math.min(p,rank[t]);if(p<0||p>=m)throw Error("earliest parent");
    if(group){const k=p+":"+motif.w;let j=lookup.get(k);if(j===undefined){j=count.length;lookup.set(k,j);parent.push(p);coef.push(motif.w);count.push(0);members.push([])}count[j]+=motif.ids.length;if(expand)members[j].push(...motif.ids)}
    else for(const a of motif.ids){parent.push(p);coef.push(motif.w);count.push(1);members.push([a])}
   }
   const k=count.length,root=m-1,rep=Int32Array.from({length:k},(_,i)=>i),tail=Int32Array.from(rep),next=new Int32Array(k).fill(-1),mass=Int32Array.from(count,(c,i)=>c*coef[i]),len=Int32Array.from(count),active=new Uint8Array(k).fill(1);
   function find(x){while(rep[x]!==x){rep[x]=rep[rep[x]];x=rep[x]}return x}
   for(let t=1;t<k;t++){let b=-1;for(let i=0;i<k;i++)if(active[i]&&i!==root&&(b<0||mass[i]*len[b]>mass[b]*len[i]))b=i;if(b<0)throw Error("no block");const a=find(parent[b]);if(a===b||!active[a])throw Error("parent");next[tail[a]]=b;tail[a]=tail[b];mass[a]+=mass[b];len[a]+=len[b];rep[b]=a;active[b]=0}
   let pos=0,cost=0;const q=[];for(let j=root;j!==-1;j=next[j]){const c=count[j];cost+=coef[j]*(c*pos+c*(c-1)/2);pos+=c;if(expand)for(const x of members[j])q.push(x)}
   if(pos!==n)throw Error("bad expansion");
   return {cost,order:expand?q.reverse():undefined,jobs:k,typedBytes:rank.byteLength+rep.byteLength+tail.byteLength+next.byteLength+mass.byteLength+len.byteLength+active.byteLength}
  }
  function brute(){let best=Infinity,paths=0;const q=[],s=new Set();function rec(){if(q.length===n){paths++;const r=metric(q);best=Math.min(best,weighted?r.wd:r.d);return}for(let a=0;a<n;a++)if(!s.has(a)&&[...P[a]].every(b=>s.has(b))){s.add(a);q.push(a);rec();q.pop();s.delete(a)}}rec();return {best,paths}}
  return {metric,kahn,batch,solve,brute,motifCount:M.length};
 }

 // The owner-order optimizer never modifies the evidence ledger.
 function bounded(M,oo,ee,seed,budget,method){
  if(!Number.isSafeInteger(budget)||budget<1)throw Error("budget");
  const O=new Set(oo),P=new Map(oo.map(x=>[x,new Set()]));
  for(const [a,b] of ee)if(O.has(a))P.get(b).add(a);
  const valid=q=>q.length===oo.length&&new Set(q).size===oo.length&&q.every(x=>O.has(x))&&q.every((x,i)=>[...P.get(x)].every(y=>q.indexOf(y)<i));
  if(!valid(seed))throw Error("invalid seed");
  let best=seed.slice(),cost=M.solve(best,true,false).cost,evaluations=1,visited=0,accepted=0,complete=false,local=false,maxSearchSlots=0;
  const initial=cost;
  function score(q){if(evaluations>=budget)throw Error("budget exceeded");evaluations++;return M.solve(q,true,false).cost}
  if(method==="adjacent"){
   while(evaluations<budget){
    let candidate=null,cost2=cost,finished=true;
    for(let i=0;i+1<best.length;i++){
     // In a valid linear extension, an adjacent pair can be exchanged
     // iff the first is not a direct prerequisite of the second.
     if(P.get(best[i+1]).has(best[i]))continue;
     if(evaluations>=budget){finished=false;break}
     const q=best.slice();[q[i],q[i+1]]=[q[i+1],q[i]];
     const c=score(q);if(c<cost2){cost2=c;candidate=q}
    }
    maxSearchSlots=Math.max(maxSearchSlots,3*oo.length);
    if(!candidate){local=finished;break}
    best=candidate;cost=cost2;accepted++;
   }
  }else if(method==="prefix"){
   // No bitmask: works with >32 owners. A cap is not a proof of optimality.
   const q=[],used=new Set();let truncated=false;
   function visit(){
    visited++;maxSearchSlots=Math.max(maxSearchSlots,q.length+used.size+best.length);
    if(q.length===oo.length){
     if(evaluations>=budget){truncated=true;return}
     const c=score(q);if(c<cost){best=q.slice();cost=c;accepted++}return;
    }
    for(const x of oo){if(truncated)return;if(used.has(x)||[...P.get(x)].some(y=>!used.has(y)))continue;used.add(x);q.push(x);visit();q.pop();used.delete(x)}
   }
   visit();complete=!truncated;
  }else throw Error("method");
  if(cost>initial||!valid(best)||evaluations>budget)throw Error("monotonicity");
  const r=M.solve(best,true,true);if(r.cost!==cost)throw Error("expansion cost");
  return {...r,initial,evaluations,accepted,complete,local,visited,maxSearchSlots,ownerOrder:best};
 }
 const byOwner=new Map([...own.keys()].map(x=>[x,[]]));for(const e of records)byOwner.get(e.b).push(e);
 const reachable=new Set([A.root]),todo=[A.root];for(let i=0;i<todo.length;i++)for(const e of byOwner.get(todo[i])??[])if(!reachable.has(e.a)){reachable.add(e.a);todo.push(e.a)}
 ck(reachable.size===613,"root census");
 const results={};
 const budget=128;
 for(const [scope,set] of [["root",reachable],["allObserved",new Set(identities.keys())]]){
  const ids=[...set].sort((a,b)=>a-b),ix=new Map(ids.map((x,i)=>[x,i])),owners=ids.filter(x=>own.has(x)).map(x=>ix.get(x)),rs=records.filter(e=>set.has(e.b));
  const edges=rs.map(e=>[ix.get(e.a),ix.get(e.b),e.w]);
  ck(edges.every(([a,b,w])=>a!==undefined&&b!==undefined&&w>0),"closed projection");
  const mass=edges.reduce((a,e)=>a+e[2],0);ck(mass<2**31&&Number.isSafeInteger(mass*ids.length),"integer arithmetic bounds");
  const original=new Map(rs.map(e=>[J([e.b,e.role,e.index]),J(e)]));ck(original.size===rs.length,"unique slots");
  function fidelity(q,rows=rs){
   const pos=new Map(q.map((x,i)=>[ids[x],i])),seen=new Set();
   ck(q.length===ids.length&&pos.size===ids.length&&ids.every(x=>pos.has(x))&&rows.length===rs.length,"view size");
   for(const e of rows){const k=J([e.b,e.role,e.index]);ck(!seen.has(k)&&original.get(k)===J(e)&&pos.get(e.a)<pos.get(e.b),"record fidelity");seen.add(k)}
  }
  const modes={};
  for(const weighted of [false,true]){
   const M=model(ids.length,owners,edges,weighted),key=weighted?"wd":"d",rows={};
   function bench(name,f,repeats){
    let r;const t=clock();for(let i=0;i<repeats;i++)r=f();const elapsed=clock()-t;
    const q=r.order??r,metric=M.metric(q);fidelity(q);
    if(r.cost!==undefined)ck(r.cost===metric[key],"objective");
    rows[name]={...metric,msPerRun:elapsed/repeats,repeats,jobs:r.jobs,typedBytes:r.typedBytes,initial:r.initial,evaluations:r.evaluations,accepted:r.accepted,complete:r.complete,local:r.local,visited:r.visited,maxSearchSlots:r.maxSearchSlots};
    return r;
   }
   for(const mode of ["ordinary","centrality","urt"]){
    bench("raw/"+mode,()=>M.kahn(mode,false),3);
    const seed=M.kahn(mode,true);
    const base=bench("grouped/"+mode,()=>M.solve(seed,true,true),10);
    const a=bench("adjacent/"+mode,()=>bounded(M,owners,edges,seed,budget,"adjacent"),2);
    const p=bench("prefix/"+mode,()=>bounded(M,owners,edges,seed,budget,"prefix"),2);
    ck(a.cost<=base.cost&&p.cost<=base.cost&&!p.complete,"actual capped search");
    if(scope==="root")ck(a.cost>=(weighted?107057:105109)&&p.cost>=(weighted?107057:105109),"prior global optimum lower bound");
   }
   modes[weighted?"weighted":"roles"]={motifs:M.motifCount,rows};
  }
  const reject=f=>{let bad=false;try{f()}catch{bad=true}ck(bad,"negative accepted");negative++};
  const M=model(ids.length,owners,edges,false),q=M.kahn("ordinary",false);
  reject(()=>fidelity(q.slice(1)));reject(()=>fidelity(q.slice().reverse()));
  reject(()=>fidelity(q,rs.slice(1)));
  const copy=rs.slice();copy[0]={...copy[0],raw:{...copy[0].raw,witnessExpression:-1}};reject(()=>fidelity(q,copy));
  reject(()=>bounded(M,owners,edges,owners.slice(1),budget,"adjacent"));
  results[scope]={nodes:ids.length,owners:owners.length,records:rs.length,modes};
 }
 // Small independent exhaustive all-node oracle. Synthetic only, not RH evidence.
 let seed=20261124,oracleCases=0,oracleOrders=0,localMisses=0,capMisses=0;
 const rand=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed};
 for(let t=0;t<24;t++){
  const m=2+t%3,n=m+3,oo=Array.from({length:m},(_,i)=>i+3),ee=[];
  for(let a=0;a<3;a++){ee.push([a,oo[rand()%m],1+rand()%4]);for(const b of oo)if(rand()%3===0)ee.push([a,b,1+rand()%4])}
  for(const a of oo)for(const b of oo)if(a<b&&rand()%3===0)ee.push([a,b,1+rand()%4]);
  for(const weighted of [false,true]){
   const M=model(n,oo,ee,weighted),s=M.kahn("ordinary",true),b=M.brute(),p=bounded(M,oo,ee,s,1000,"prefix"),a=bounded(M,oo,ee,s,128,"adjacent"),c=bounded(M,oo,ee,s,1,"prefix"),key=weighted?"wd":"d";
   ck(p.complete&&p.cost===b.best&&M.metric(p.order)[key]===b.best,"exhaustive oracle");
   ck(a.cost>=b.best&&a.cost<=a.initial&&M.metric(a.order)[key]===a.cost,"local oracle");
   ck(!c.complete&&c.evaluations===1&&c.cost===c.initial&&c.cost>=b.best,"cap oracle");
   if(a.cost>b.best)localMisses++;if(c.cost>b.best)capMisses++;
   oracleCases++;oracleOrders+=b.paths;
  }
 }
 ck(capMisses>0,"cap not exact control");
 return {status:"PARTIAL_EXPORT_ROLE_PROJECTION_NOT_KERNEL_RECHECK",budget,checks,negative,oracleCases,oracleOrders,localMisses,capMisses,results};
}

import fs from "node:fs";
import crypto from "node:crypto";
import {performance} from "node:perf_hooks";
const [a,b]=process.argv.slice(2);if(!a||!b)throw Error("usage: node certificate.mjs solution_frontier_roles.json solution_direct_roles.json");
function read(p,sha,sha256){const b=fs.readFileSync(p);if(crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==sha)throw Error("blob mismatch");if(sha256&&crypto.createHash("sha256").update(b).digest("hex")!==sha256)throw Error("SHA256 mismatch");return JSON.parse(b)}
const r=run(read(a,"d49fbcc22a2382039986b09ff91dd11af2ef2e7b","9d9f461a5afebec9f020e2349a8bc359fcfdcbd7fe3e667b92c6b64a95660ad6"),read(b,"64b935e4ef309f6c555912a377012c7708eda510"),()=>performance.now());
r.maxRssKiB=process.resourceUsage().maxRSS;console.log(JSON.stringify(r,null,2));
