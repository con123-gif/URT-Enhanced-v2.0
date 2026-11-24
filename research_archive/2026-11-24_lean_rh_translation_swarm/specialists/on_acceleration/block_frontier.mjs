// Mixed expression/declaration reference traversal; not a Lean proof checker.
// Input signed refs: expression i -> i+1, declaration i -> -(i+1), 0 padding.
export function traverse(roots,readExpr,readDecl,visit=()=>{},mode='block',blockSize=65536){
  const need=(ok,msg)=>{if(!ok)throw Error(msg)};
  need(['stack','block','golden','periodic','descending'].includes(mode),'mode');
  need(Number.isSafeInteger(blockSize)&&blockSize>0,'blockSize');
  const pages=[new Map(),new Map()], pageBits=1<<19;
  const queues=new Map(), bins=Array.from({length:64},()=>[]);
  let pending=0,active=0,peakPending=0,peakBlocks=0,activations=0;
  // Sparse 32-way radix bitset: signed-reference IDs imply at most seven levels.
  const levels=Array.from({length:7},()=>new Map());
  function mark(k,on){
    for(const l of levels){const g=Math.floor(k/32),bit=1<<(k%32),old=l.get(g)||0,v=on?old|bit:old&~bit;
      if(v)l.set(g,v);else l.delete(g);
      if(Boolean(old)===Boolean(v))break;k=g;
    }
  }
  function highest(){let g=0;for(let i=levels.length-1;i>=0;i--){const w=levels[i].get(g);need(w,'empty radix node');g=g*32+31-Math.clz32(w)}return g}
  const counts={expressions:0,declarations:0,edges:0};
  const theta=mode==='golden'?1/((1+Math.sqrt(5))/2)**2:1/7;
  function key(r){return mode==='stack'?0:r<0?-1:Math.floor((r-1)/blockSize)}
  function bin(k){return k<0||mode==='stack'||mode==='block'?63:Math.floor(64*((k*theta)%1))}
  function add(r){
    need(Number.isInteger(r)&&Math.abs(r)<=2147483647,'invalid ref');
    if(!r)return;
    const id=Math.abs(r)-1,p=Math.floor(id/pageBits),i=id%pageBits;
    const m=pages[r>0?0:1];let a=m.get(p);
    if(!a){a=new Uint8Array(pageBits/8);m.set(p,a)}
    const mask=1<<(i&7),j=i>>3;if(a[j]&mask)return;a[j]|=mask;
    const k=key(r);let q=queues.get(k);
    if(!q){q=[];queues.set(k,q);if(mode==='descending'){if(k>=0)mark(k,true)}else bins[bin(k)].push(k);active++;peakBlocks=Math.max(peakBlocks,queues.size)}
    q.push(r);pending++;peakPending=Math.max(peakPending,pending);
  }
  for(const id of roots){need(Number.isInteger(id)&&id>=0&&id<2147483647,'root id');add(-(id+1))}
  while(active){
    let k;
    if(mode==='descending'){k=queues.has(-1)?-1:highest();if(k>=0)mark(k,false)}
    else{let b=63;while(!bins[b].length)b--;k=bins[b].pop()}
    const q=queues.get(k);active--;activations++;
    // Keep current bucket registered so newly discovered same-block refs are drained here.
    while(q.length){
      const r=q.pop(),id=Math.abs(r)-1;pending--;
      const v=r>0?readExpr(id):readDecl(id);
      need(v!=null,'missing '+r);
      const es=r>0?v:v.edges;need(es&&typeof es[Symbol.iterator]==='function','missing edges');
      counts[r>0?'expressions':'declarations']++;visit(r,id,v);
      for(const ref of es){if(ref!==0)counts.edges++;add(ref)}
    }
    queues.delete(k);
  }
  need(pending===0&&queues.size===0,'frontier accounting');
  return {...counts,peakPending,peakBlocks,activations,seenPayloadBytes:(pages[0].size+pages[1].size)*(pageBits/8)};
}
