// Lane 11, 25 Nov 2026 — actual native evidence gate for the same-host frontier.
// SOURCE-MATCHED / executed JS evidence audit; not new Lean compilation.
// Read latest mission cd0a176134d46b5b624896e56843a24915c14477, AGENTS,
// SWARM, HANDOFF, EXPANSION, continuity, research state/log/protocol (long
// files inspected in part), current living proof; peer 12705f08 batch,
// fedd3a7e integration repair. Pin 40e56bab026552e089d7afcfeff08d2defb9c005.
// Upstream HEAD advanced to 91b273530883b723ef4422436e0dc3557749325a;
// do not mix sources. Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
// Recovered prior unattached e4df9aa0; do NOT attach stale commit over peers:
// Landau peer already independently repaired header parser; actual retry
// 45652878741 failed after 29 pinned modules and 3 engine modules compiled,
// on RH32SingletonPoleData line 175 measurability and unqualified scan/prune.
// Integration fedd3a7e prepared function extensionality and qualification fix.
// Do not duplicate that repair or treat sorryAx caused by failed elaboration
// as an upstream axiom. Original poleData/poleData_char listed only standard axioms.
// Actual batch peer runner b1d97b002dc2ced76d083a7cfa55081d5fd55a4c
// records ROOT_SCAN lines but does not enforce root identity/missing counts
// or require axiom evidence for every generated prune bridge.
// This gate preserves pending frontier counts, flags missing nodes, and
// generates bridge audit obligations. A bounded scan never proves completeness.
// Usage: node thisfile.mjs --status SOURCE.lean status.json (always partial)
// or node thisfile.mjs --log SOURCE.lean compile.log RETURN_CODE (full log).
// Local check never retires a root-reachable mathematical premise; actual
// caller bridges and context-specific typed dependency ledger still required.
// RESUME HERE: integrate assess() as post-replay gate in peer batch runner,
// rerun peer repaired analytic overlay, and provision pinned host modules
// for eight-module host DAG, run all five commands already present in overlays.
// For each PRUNED line run #print axioms dst and dst.original in fresh importer;
// verify exact original statement and actual caller. No protected files changed.
// HANDOFF TO integration, acceleration, audit, Landau. RH OPEN.
// No URT measurement or new mathematical premise proved in this run.
import fs from 'node:fs';
function commands(source){const scans=[],prunes=[],axioms=[];for(const line of source.split(/\r?\n/)){let m;if(m=/^rh_scan ([\p{L}\p{N}_.₂]+) limit (\d+)\s*$/u.exec(line))scans.push({root:m[1],limit:Number(m[2])});else if(m=/^rh_prune (\S+) as (\S+)\s*$/.exec(line))prunes.push({root:m[1],dst:m[2]});else if(m=/^#print axioms (\S+)\s*$/.exec(line))axioms.push(m[1]);else if(/^(rh_scan|rh_prune|#print axioms)\s/.test(line))throw Error("unhandled audit command "+line)}return {scans,prunes,axioms}}
function assess(source,log,returncode,complete){const c=commands(source),errors=[],pending=[],bridges=[],seen=new Map(),scanRows=[],missing=[];const allowed=new Set(["propext","Classical.choice","Quot.sound"]);for(const line of log.split(/\r?\n/)){let m;if(m=/^'([^']+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)$/.exec(line.trim())){const ax=(m[2]||"").split(",").map(x=>x.trim()).filter(Boolean);if(seen.has(m[1])&&JSON.stringify(seen.get(m[1]))!==JSON.stringify(ax))errors.push("conflicting axiom output: "+m[1]);seen.set(m[1],ax);if(ax.some(x=>!allowed.has(x)))errors.push("unexpected axioms: "+m[1]+" "+ax.join(","));}else if(m=/ROOT_SCAN root=(\S+) visited=(\d+) values=(\d+) noValue=(\d+) axioms=(\d+) missing=(\d+) pending=(\d+)/.exec(line)){scanRows.push({root:m[1],visited:+m[2],values:+m[3],noValue:+m[4],axioms:+m[5],missing:+m[6],pending:+m[7]});}else if(m=/^MISSING (\S+)/.exec(line.trim()))missing.push(m[1]);}if(returncode!==0)errors.push("nonzero compiler return code "+returncode);if(!complete)errors.push("partial log, cannot certify candidate");if(/\b(?:error:|declaration uses .sorry.)/.test(log))errors.push("compiler error or sorry warning");for(const {root,limit} of c.scans){const rows=scanRows.filter(r=>r.root===root);if(rows.length!==1){errors.push("missing or duplicate scan "+root);continue;}const r=rows[0];if(r.missing||r.visited!==r.values+r.noValue||r.visited>limit||r.visited<1)errors.push("invalid or missing dependency scan "+root);if(r.pending)pending.push({root,count:r.pending});}for(const name of c.axioms){const matches=[...seen.keys()].filter(s=>s===name||(!name.includes(".")&&s.endsWith("."+name)));if(matches.length!==1)errors.push("missing or ambiguous axiom output "+name);}for(const {root,dst} of c.prunes){const esc=root.replace(/[.*+?^${}()|[\]\\]/g,"\\$&");const hits=[...log.matchAll(new RegExp("PRUNED "+esc+": (\\d+) -> (\\d+) binders; original bridge checked","g"))];const none=[...log.matchAll(new RegExp("NO_BINDER_REDUCTION "+esc+"(?=\\s|$)","g"))];if(hits.length+none.length!==1){errors.push("missing or duplicate prune result "+root);continue;}if(hits.length){if(+hits[0][2]>=+hits[0][1])errors.push("invalid prune count "+root);bridges.push({root,dst,requiredAxiomAudits:[dst,dst+".original"]});}}for(const name of missing)errors.push("unresolved dependency "+name);return {status:errors.length?"FAILED_OR_INCOMPLETE":bridges.length?"LOCAL_CHECK_REQUIRES_BRIDGE_AXIOMS":"LOCAL_CHECK_ONLY",errors,pending,bridges,scanRows,axioms:Object.fromEntries(seen),note:"No caller integration, complete kernel graph or proof of the arithmetic premise inferred."}}
const observed={
  "actualRun": "https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45652878741",
  "actualReturn": 1,
  "actualWallSeconds": 252.4,
  "actualSourceStatusBlob": "3b96d6794eccfcc6a96c35ca97c7cf0c270e7f83",
  "baselineStatus": "pass",
  "hostCandidates": [
    {
      "path": "specialists/kernel_extractor/RHPrincipalNativeWindow.lean",
      "blob": "c258bec00bd1fca7a2a42df88a62350d835af6b3",
      "commands": {
        "scans": [
          {
            "root": "UpperTheory.Top.zeroFreeAll_of_topG",
            "limit": 2000
          },
          {
            "root": "UpperTheory.Comparison₂.level_gm_le_on_family_scales",
            "limit": 2000
          },
          {
            "root": "UpperTheory.Comparison₂.formB",
            "limit": 2000
          },
          {
            "root": "RHPrincipalNative.principal_rh",
            "limit": 2000
          }
        ],
        "prunes": [
          {
            "root": "RHPrincipalNative.principal_right_of_window",
            "dst": "RHPrincipalRightPruned"
          }
        ],
        "axioms": [
          "RHPrincipalNative.cyc_one_kept",
          "RHPrincipalNative.cyc_one_gm",
          "RHPrincipalNative.principal_window_of_topG",
          "RHPrincipalNative.principal_right_of_window",
          "RHPrincipalNative.principal_rh",
          "RHPrincipalSearch",
          "RHPrincipalAuto",
          "RHPrincipalFrontier"
        ]
      }
    },
    {
      "path": "specialists/kernel_extractor/RHSelectedRecordDivisionBudget.lean",
      "blob": "245f73aaca57278fb8cba7726a08dc353e61f55c",
      "commands": {
        "scans": [
          {
            "root": "UpperTheory.Top.divinN_at",
            "limit": 2000
          },
          {
            "root": "UpperTheory.Top.topDesWin",
            "limit": 2000
          },
          {
            "root": "UpperTheory.Top.topDesWin_recordBudget",
            "limit": 2000
          }
        ],
        "prunes": [
          {
            "root": "UpperTheory.Top.divinN_at",
            "dst": "RHNativeDivinNPruned"
          },
          {
            "root": "UpperTheory.Top.divinN_at_budget",
            "dst": "RHBudgetDivinNPruned"
          },
          {
            "root": "UpperTheory.Top.topDesWin_recordBudget",
            "dst": "RHTopDesWinBudgetPruned"
          }
        ],
        "axioms": [
          "UpperTheory.Top.divinN_at",
          "UpperTheory.Top.divinN_at_budget",
          "UpperTheory.Top.recordBudget_of_hypVWide",
          "UpperTheory.Top.topDesWin_recordBudget",
          "UpperTheory.Top.topDesWin_original_via_recordBudget",
          "UpperTheory.Top.recordBudget_auto",
          "UpperTheory.Top.recordBudget_frontier"
        ]
      }
    },
    {
      "path": "specialists/kernel_extractor/RHWideHostWindowTransport.lean",
      "blob": "31efce9c74ce3e8802475810d82662ea927355b6",
      "commands": {
        "scans": [
          {
            "root": "UpperTheory.T3.supplyOfAdmOf",
            "limit": 2000
          },
          {
            "root": "UpperTheory.T3.supplyOfAdmOfWide",
            "limit": 2000
          },
          {
            "root": "UpperTheory.Top.shape_closed_link_n_of_green_record",
            "limit": 2000
          },
          {
            "root": "RHPrincipalNative.principal_rh_wide",
            "limit": 2000
          }
        ],
        "prunes": [
          {
            "root": "UpperTheory.Top.winPairsWide",
            "dst": "RHWinPairsWidePruned"
          },
          {
            "root": "UpperTheory.Top.supplyChiWide",
            "dst": "RHSupplyChiWidePruned"
          }
        ],
        "axioms": [
          "UpperTheory.Top.winPairs",
          "UpperTheory.Top.winPairsWide",
          "UpperTheory.T3.supplyOfAdmOf",
          "UpperTheory.T3.supplyOfAdmOfWide",
          "UpperTheory.Top.supplyChiWide",
          "UpperTheory.Top.shape_closed_link_n_of_green_record",
          "RHPrincipalNative.principal_rh_wide"
        ]
      }
    },
    {
      "path": "specialists/kernel_extractor/RHPrincipalUnitPage400.lean",
      "blob": "3d32c7efea215291658e4b22f531c5c596e2cfc1",
      "commands": {
        "scans": [
          {
            "root": "UpperTheory.Top.fieldChi",
            "limit": 2000
          },
          {
            "root": "UpperTheory.Top.fieldChi_unit400",
            "limit": 2000
          },
          {
            "root": "UpperTheory.Top.winPairs",
            "limit": 2000
          },
          {
            "root": "UpperTheory.Top.winPairs_unit400",
            "limit": 2000
          },
          {
            "root": "UpperTheory.Top.supplyChi_principal400",
            "limit": 2000
          }
        ],
        "prunes": [
          {
            "root": "UpperTheory.Top.fieldChi_unit400",
            "dst": "RHFieldChiUnitPruned"
          },
          {
            "root": "UpperTheory.Top.winPairs_unit400",
            "dst": "RHWinPairsUnitPruned"
          }
        ],
        "axioms": [
          "UpperTheory.Top.fieldChi",
          "UpperTheory.Top.fieldChi_unit400",
          "UpperTheory.Top.winPairs_unit400",
          "UpperTheory.Top.vwin400_of_401",
          "UpperTheory.T3.supplyOfAdmOf_unit400",
          "UpperTheory.Top.supplyChi_principal400",
          "UpperTheory.Top.supplyChi_principal400_original_bridge"
        ]
      }
    },
    {
      "path": "specialists/kernel_extractor/RHPrincipalDirectWindow400.lean",
      "blob": "25a16cf6533e461bae3a463fbd78c65f86acca34",
      "commands": {
        "scans": [
          {
            "root": "UpperTheory.Top.winPairs",
            "limit": 2000
          },
          {
            "root": "UpperTheory.Top.winPairsDirect400",
            "limit": 2000
          },
          {
            "root": "UpperTheory.T3.supplyOfAdmOfDirect400",
            "limit": 2000
          },
          {
            "root": "RHPrincipalNative.principal_rh_direct400",
            "limit": 2000
          }
        ],
        "prunes": [
          {
            "root": "UpperTheory.Top.winPairsDirect400",
            "dst": "RHWinPairsDirect400Pruned"
          },
          {
            "root": "UpperTheory.Top.supplyChiDirect400",
            "dst": "RHSupplyChiDirect400Pruned"
          }
        ],
        "axioms": [
          "UpperTheory.Top.vwinDirect400_of_wide",
          "UpperTheory.Top.vwinDirect400_of_original",
          "UpperTheory.Top.winPairsDirect400",
          "UpperTheory.T3.supplyOfAdmOfDirect400",
          "UpperTheory.Top.supplyChiDirect400",
          "UpperTheory.Top.supplyChiDirect400_original_bridge",
          "RHPrincipalNative.principal_rh_direct400"
        ]
      }
    }
  ],
  "actualFailed": {
    "status": "FAILED_OR_INCOMPLETE",
    "errors": [
      "unexpected axioms: Deduction.rh32_principal_pole_data propext,sorryAx,Classical.choice,Quot.sound",
      "unexpected axioms: Deduction.rh32_right_of_window propext,sorryAx,Classical.choice,Quot.sound",
      "nonzero compiler return code 1",
      "partial log, cannot certify candidate",
      "compiler error or sorry warning",
      "invalid or missing dependency scan poleData",
      "invalid or missing dependency scan lemmaL",
      "invalid or missing dependency scan rh32_principal_pole_data",
      "invalid or missing dependency scan rh32_right_of_window",
      "missing or duplicate prune result rh32_right_of_window",
      "unresolved dependency poleData",
      "unresolved dependency lemmaL",
      "unresolved dependency rh32_principal_pole_data",
      "unresolved dependency rh32_right_of_window"
    ],
    "pending": [],
    "bridges": [],
    "scanRows": [
      {
        "root": "poleData",
        "visited": 1,
        "values": 0,
        "noValue": 0,
        "axioms": 0,
        "missing": 1,
        "pending": 0
      },
      {
        "root": "lemmaL",
        "visited": 1,
        "values": 0,
        "noValue": 0,
        "axioms": 0,
        "missing": 1,
        "pending": 0
      },
      {
        "root": "rh32_principal_pole_data",
        "visited": 1,
        "values": 0,
        "noValue": 0,
        "axioms": 0,
        "missing": 1,
        "pending": 0
      },
      {
        "root": "rh32_right_of_window",
        "visited": 1,
        "values": 0,
        "noValue": 0,
        "axioms": 0,
        "missing": 1,
        "pending": 0
      }
    ],
    "axioms": {
      "Deduction.poleData": [
        "propext",
        "Classical.choice",
        "Quot.sound"
      ],
      "Deduction.poleData_char": [
        "propext",
        "Classical.choice",
        "Quot.sound"
      ],
      "Deduction.rh32_principal_pole_data": [
        "propext",
        "sorryAx",
        "Classical.choice",
        "Quot.sound"
      ],
      "Deduction.rh32_right_of_window": [
        "propext",
        "sorryAx",
        "Classical.choice",
        "Quot.sound"
      ]
    },
    "note": "No caller integration, complete kernel graph or proof of the arithmetic premise inferred."
  },
  "peerRepair": {
    "blob": "3503e256477e1244f88d483719577514f50929aa",
    "old": [
      {
        "root": "poleData",
        "limit": 2000
      },
      {
        "root": "lemmaL",
        "limit": 2000
      },
      {
        "root": "rh32_principal_pole_data",
        "limit": 2000
      },
      {
        "root": "rh32_right_of_window",
        "limit": 2000
      }
    ],
    "new": [
      {
        "root": "Deduction.poleData",
        "limit": 2000
      },
      {
        "root": "Deduction.lemmaL",
        "limit": 2000
      },
      {
        "root": "Deduction.rh32_principal_pole_data",
        "limit": 2000
      },
      {
        "root": "Deduction.rh32_right_of_window",
        "limit": 2000
      }
    ]
  },
  "totals": {
    "hostScans": 20,
    "hostPrunes": 10
  },
  "upstream": "91b273530883b723ef4422436e0dc3557749325a"
};
const [mode,src,input,rc]=process.argv.slice(2);
if(!mode){console.log(JSON.stringify(observed,null,2));}
else if(mode==='--status'||mode==='--log'){
 const source=fs.readFileSync(src,'utf8'),raw=fs.readFileSync(input,'utf8');
 const s=mode==='--status'?JSON.parse(raw):null;
 const r=assess(source,s?s.tail:raw,s?s.returncode:Number(rc),!s);
 console.log(JSON.stringify(r,null,2));if(r.status==='FAILED_OR_INCOMPLETE')process.exitCode=1;
}else throw Error('use --status or --log');
