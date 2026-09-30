import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import math

# ============================================================
# North Star Vortex–Electrostatic Reactor
# Reduced-order URT control and energy-balance model
# ============================================================

# Geometry
h = 0.30
R = 0.08
Vpl = math.pi * R**2 * h / 3.0

# Constants
qe = 1.602176634e-19
E_fus = 8.7e6 * qe

# Updated proton-rich fuel mix
n_ion = 1.0e21
p_to_B = 10.0
nB = n_ion/(1.0+p_to_B)
np_ = p_to_B*nB
ne = np_ + 5.0*nB
Zeff = (np_ + 25.0*nB)/ne

# Operating targets retained for the first North Star update
Ti_target = 600.0
Te_over_Ti = 1.0/6.0
omega_target = 1.0e5
Vbias_target = 600.0e3

def reactivity_surrogate(Ti_keV):
    """Anchored to <sigma v>=2e-21 m^3/s at 600 keV; not a full kinetic fit."""
    T = max(float(Ti_keV), 1e-6)
    return 2e-21*math.exp(-(math.log(T/600.0)/0.85)**2)

def reactor_powers(Ti_keV):
    Te_eV = max(1.0, Te_over_Ti*Ti_keV*1e3)
    Pfus = np_*nB*reactivity_surrogate(Ti_keV)*E_fus*Vpl
    # Simple non-relativistic bremsstrahlung diagnostic.
    Pbrem = 1.69e-38*Zeff*ne**2*math.sqrt(Te_eV)*Vpl
    return Pfus, Pbrem

Cth = 1.5*Vpl*qe*1e3*(n_ion + ne*Te_over_Ti)

# URT contraction controller
alpha = math.pi/math.e
beta = 0.235
theta_H = 2.4

def urt_phi(p):
    if abs(p) <= math.pi:
        return math.sin(p)
    return math.copysign(1.0, p)

def urt_step(p, error, gain):
    u = np.clip(gain*error, -4.0, 4.0)
    return beta*(alpha*(p-theta_H*urt_phi(p))+u)

def simulate(tau_E_nominal=1.0, urt_enabled=True, t_end=2.0,
             dt=5e-4, max_aux_power=8e5):
    N = int(t_end/dt)+1
    t = np.linspace(0,t_end,N)

    omega=np.zeros(N); Vbias=np.zeros(N); Ti=np.zeros(N)
    vortex_cmd=np.zeros(N); Vbias_cmd=np.zeros(N); Paux=np.zeros(N)
    tau_E=np.zeros(N); Pfus=np.zeros(N); Pbrem=np.zeros(N)
    p=np.zeros((N,3))

    omega[0]=0.75*omega_target
    Vbias[0]=0.80*Vbias_target
    Ti[0]=450.0

    eta_alpha=0.60
    Pf0,Pb0=reactor_powers(Ti_target)
    W0=Cth*Ti_target
    Paux_base=max(0.0,W0/tau_E_nominal+Pb0-eta_alpha*Pf0)

    for k in range(N-1):
        tk=t[k]
        errors=np.array([
            (omega_target-omega[k])/omega_target,
            (Vbias_target-Vbias[k])/Vbias_target,
            (Ti_target-Ti[k])/Ti_target
        ])

        if urt_enabled:
            gains=[18.0,18.0,22.0]
            for j in range(3):
                p[k+1,j]=urt_step(p[k,j],errors[j],gains[j])

            vortex_cmd[k]=np.clip(
                1.0+1.4*np.tanh(p[k+1,0]),0.20,2.20
            )
            Vbias_cmd[k]=Vbias_target*np.clip(
                1.0+0.9*np.tanh(p[k+1,1]),0.20,1.80
            )
            Paux[k]=np.clip(
                Paux_base+7e5*np.tanh(p[k+1,2]),0.0,max_aux_power
            )
        else:
            p[k+1]=p[k]
            vortex_cmd[k]=1.0
            Vbias_cmd[k]=Vbias_target
            Paux[k]=min(Paux_base,max_aux_power)

        # Disturbance schedule
        vortex_load=0.35 if 0.350 <= tk <= 0.420 else 0.0
        bias_leak=0.25 if 0.750 <= tk <= 0.840 else 0.0
        confinement_multiplier=0.55 if 1.150 <= tk <= 1.350 else 1.0

        # Fast actuator plant
        tau_omega=0.012
        tau_bias=0.008

        domega_dt=(
            omega_target*vortex_cmd[k]*(1-vortex_load)-omega[k]
        )/tau_omega

        dVbias_dt=(
            Vbias_cmd[k]*(1-bias_leak)-Vbias[k]
        )/tau_bias

        # Reduced confinement coupling
        vortex_factor=max(0.10,omega[k]/omega_target)**0.70
        bias_factor=max(0.10,Vbias[k]/Vbias_target)**0.35
        tau_eff=max(
            tau_E_nominal*confinement_multiplier*vortex_factor*bias_factor,
            5e-5
        )
        tau_E[k]=tau_eff

        pf,pb=reactor_powers(Ti[k])
        Pfus[k]=pf
        Pbrem[k]=pb

        W=Cth*max(Ti[k],0.0)
        dTi_dt=(
            Paux[k]+eta_alpha*pf-pb-W/tau_eff
        )/Cth

        omega[k+1]=max(0.0,omega[k]+dt*domega_dt)
        Vbias[k+1]=max(0.0,Vbias[k]+dt*dVbias_dt)
        Ti[k+1]=max(1.0,Ti[k]+dt*dTi_dt)

    vortex_cmd[-1]=vortex_cmd[-2]
    Vbias_cmd[-1]=Vbias_cmd[-2]
    Paux[-1]=Paux[-2]
    tau_E[-1]=tau_E[-2]
    Pfus[-1],Pbrem[-1]=reactor_powers(Ti[-1])

    return pd.DataFrame({
        "time_s":t,
        "omega_rad_s":omega,
        "Vbias_V":Vbias,
        "Ti_keV":Ti,
        "vortex_command":vortex_cmd,
        "Vbias_command_V":Vbias_cmd,
        "Paux_W":Paux,
        "tau_E_s":tau_E,
        "Pfus_W":Pfus,
        "Pbrem_W":Pbrem
    }), Paux_base

if __name__ == "__main__":
    closed,Pbase=simulate(1.0,True)
    openloop,_=simulate(1.0,False)
    original,Pold=simulate(1e-4,True,t_end=0.010,dt=1e-6)

    closed.to_csv("north_star_urt_timeseries.csv",index=False)

    print("Plasma volume:",Vpl,"m^3")
    print("Updated nominal auxiliary power:",Pbase/1e3,"kW")
    print("Original 100 us required auxiliary power:",Pold/1e9,"GW")
    print("URT final Ti:",closed.Ti_keV.iloc[-1],"keV")
    print("Fixed-control final Ti:",openloop.Ti_keV.iloc[-1],"keV")

    plt.figure()
    plt.plot(closed.time_s,closed.omega_rad_s/omega_target,label="omega/target")
    plt.plot(closed.time_s,closed.Vbias_V/Vbias_target,label="Vbias/target")
    plt.plot(closed.time_s,closed.Ti_keV/Ti_target,label="Ti/target")
    plt.axhline(1.0,linestyle="--")
    plt.xlabel("time (s)")
    plt.ylabel("normalized state")
    plt.legend()
    plt.tight_layout()
    plt.show()