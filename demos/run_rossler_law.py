import numpy as np
from core.metrics import (
    lyapunov_rosenstein,
    D_KY_from_l1_proxy,
    tau_avalanche,
    delta_metric,
)

def rossler(dt=1e-3, T=4000.0, a=0.2, b=0.2, c=5.7):
    N = int(T / dt)
    x, y, z = 1.0, 1.0, 1.0
    xs = np.empty(N, float)
    for i in range(N):
        dx = -y - z
        dy = x + a*y
        dz = b + z*(x - c)
        x += dx*dt; y += dy*dt; z += dz*dt
        xs[i] = x
    return xs

def prepare_series():
    raw = rossler()
    raw = raw[len(raw)//3:]   # remove transient
    step = max(1, len(raw)//5000)
    return raw[::step]

def main():
    ts = prepare_series()

    l1 = lyapunov_rosenstein(ts, m=3, delay=20, evolve=200, exclude=100)
    DKY = D_KY_from_l1_proxy(l1)
    tau = tau_avalanche(np.diff(ts), pct=90, xmin_quantile=0.6)
    delt = delta_metric(DKY, tau)

    print("==== Lytollis Law on Rössler ====")
    print(f"λ1    = {l1}")
    print(f"D_KY  = {DKY}")
    print(f"τ     = {tau}")
    print(f"δ     = {delt}")

if __name__ == "__main__":
    main()
