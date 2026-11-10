#!/usr/bin/env python3
"""Resumable Cathedral verification and falsification queue; no fitted ARFs."""
import argparse,datetime,hashlib,json,os,pathlib,subprocess,sys,tempfile
ROOT=pathlib.Path(__file__).resolve().parents[2]
BASE=ROOT/"research_archive/2026-11-10_urt_arf_forward/new_gate"
HERE=pathlib.Path(__file__).resolve().parent
CASES=[
("a4_cumulant","URT_EXACT_A4_THIRD_CUMULANT_RATE_2026_11_10.py"),
("a5_cubic","URT_A5_SYMMETRIC_CUBIC_SOURCE_2026_11_10.py"),
("chronology","URT_A5_CHRONOLOGY_DIRICHLET_GAP_2026_11_10.py"),
("ward_source","URT_SOURCE_SCHUR_WARD_CONTACTS_2026_11_10.py"),
("fourier","URT_NATIVE_SOURCE_24CLOCK_FOURIER_VERIFY_2026_11_10.py")]
def exact_gate():
 import sympy as s
 z=s.symbols("z"); a=[s.Rational(266,15),s.Rational(389,20),s.Rational(391,20),s.Rational(521,30)]; w=[4,2,2,0]
 g=sum(v/(z-x) for x,v in zip(a,w))
 assert s.simplify(g-20*(2400*z*z-91480*z+871257)/((15*z-266)*(20*z-391)*(20*z-389)))==0
 assert s.limit(z*g,z,s.oo)==8
 assert s.limit(z*z*(g-8/z),z,s.oo)==s.Rational(2234,15)
 assert s.limit(z**3*(g-8/z-s.Rational(2234,15)/z**2),z,s.oo)==s.Rational(500201,180)
 return {"status":"pass","evidence":"exact rational identity and moments","physical_arf":False}
def check(name,script,timeout):
 path=BASE/script
 if not path.is_file():return {"status":"missing","path":str(path.relative_to(ROOT))}
 try:
  p=subprocess.run([sys.executable,str(path)],cwd=ROOT,capture_output=True,text=True,timeout=timeout,env={**os.environ,"OPENBLAS_NUM_THREADS":"1","OMP_NUM_THREADS":"1","MKL_NUM_THREADS":"1","PYTHONHASHSEED":"0"})
  output=(p.stdout+"\n"+p.stderr)[-12000:]
  return {"status":"pass" if p.returncode==0 else "fail","returncode":p.returncode,"sha256":hashlib.sha256(output.encode()).hexdigest(),"tail":output[-1500:]}
 except subprocess.TimeoutExpired:return {"status":"timeout"}
def main():
 parser=argparse.ArgumentParser();parser.add_argument("--all",action="store_true");parser.add_argument("--timeout",type=int,default=180);args=parser.parse_args()
 statefile=HERE/"state.json"; log=HERE/"history.jsonl"
 state=json.loads(statefile.read_text()) if statefile.exists() else {"schema":1,"cursor":0,"runs":0,"last_results":{},"open_gate":"physical charged H13+H51 source-current Ward-complete observable map"}
 now=datetime.datetime.now(datetime.timezone.utc).isoformat()
 try:gate=exact_gate()
 except Exception as ex:gate={"status":"fail","error":repr(ex)}
 selected=CASES if args.all else [CASES[state["cursor"]%len(CASES)]]
 results={name:check(name,script,args.timeout) for name,script in selected}
 event={"utc":now,"revision":os.environ.get("GITHUB_SHA","local"),"cursor":state["cursor"],"exact_gate":gate,"tests":results,"scientific_status":"finite checks only; physical ARFs not derived"}
 with log.open("a",encoding="utf8") as f:f.write(json.dumps(event,sort_keys=True)+"\n")
 state["cursor"]=(state["cursor"]+len(selected))%len(CASES);state["runs"]+=1
 state["last_results"].update({n:{"status":v["status"],"utc":now} for n,v in results.items()})
 state["last_exact_gate"]={"status":gate["status"],"utc":now}
 with tempfile.NamedTemporaryFile("w",dir=HERE,delete=False) as f:
  json.dump(state,f,indent=2,sort_keys=True);f.write("\n");temp=f.name
 os.replace(temp,statefile)
 print(json.dumps(event,indent=2))
 if gate["status"]!="pass" or any(v["status"]!="pass" for v in results.values()):sys.exit(1)
if __name__=="__main__":main()
