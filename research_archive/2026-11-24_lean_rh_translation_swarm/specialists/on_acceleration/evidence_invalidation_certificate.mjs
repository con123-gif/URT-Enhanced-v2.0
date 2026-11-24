import fs from 'node:fs';
import {performance} from 'node:perf_hooks';
import {check} from './evidence_invalidation.mjs';
const file=process.argv[2];if(!file)throw Error('usage: node evidence_invalidation_certificate.mjs path/to/2026-11-24_0800_TYPED_ROOT_OBLIGATION_GRAPH.json');
const g=JSON.parse(fs.readFileSync(file,'utf8'));if(g.upstream_pin!=='40e56bab026552e089d7afcfeff08d2defb9c005')throw Error('wrong pin');
const before=process.memoryUsage().rss;const result=check(g,()=>performance.now());
console.log(JSON.stringify({...result,rss_before_bytes:before,rss_after_bytes:process.memoryUsage().rss,process_max_rss_kib:process.resourceUsage().maxRSS},null,2));
