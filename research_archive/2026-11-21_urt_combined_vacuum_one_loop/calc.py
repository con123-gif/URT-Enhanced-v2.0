import math
# Illustrative leading-order masses in GeV; no fit or precision MSbar matching.
v=246.22
masses=[('Higgs',125.1,1,1.5),('W',80.37,6,5/6),('Z',91.1876,3,5/6),('top',163.,-12,1.5),('bottom',4.18,-12,1.5),('charm',1.27,-12,1.5),('strange',.0935,-12,1.5),('down',.0047,-12,1.5),('up',.00216,-12,1.5),('tau',1.77686,-4,1.5),('muon',.105658,-4,1.5),('electron',.000510999,-4,1.5)]
# Photon, gluons, Goldstones and minimal-SM neutrinos massless at tree minimum.
def determinant(mu):
    return [(name,n*m**4/(64*math.pi**2)*(math.log(m*m/(mu*mu))-k)) for name,m,n,k in masses]
b=sum(n*m**4 for _,m,n,_ in masses)
bbos=sum(n*m**4 for _,m,n,_ in masses if n>0)
bfer=b-bbos
bnotop=sum(n*m**4 for name,m,n,_ in masses if name!='top')
mt_zero=(bnotop/12)**.25
v0=-masses[0][1]**2*v*v/8
for mu in (163.,v,1000.):
    terms=determinant(mu); loop=sum(x[1] for x in terms)
    print('mu',mu,'terms',terms,'loop',loop,'tree',v0,'partial total',v0+loop)
    assert v0+loop<0
mu1,mu2=163.,v
assert math.isclose(sum(y for _,y in determinant(mu2))-sum(y for _,y in determinant(mu1)), -b/(32*math.pi**2)*math.log(mu2/mu1),rel_tol=1e-12)
print('boson',bbos,'fermion',bfer,'supertrace',b,'top cancellation mass',mt_zero,'explicit scale derivative',-b/(32*math.pi**2))
rho=(2.25e-12)**4
print('DE',rho,'ratio abs partial',abs(v0+sum(y for _,y in determinant(v)))/rho)
print('QCD illustrative characteristic .2 GeV^4',.2**4,'ratio to EW partial',.2**4/abs(v0+sum(y for _,y in determinant(v))))
print('PASS exact explicit scale-difference identity (numeric), sign regression at fixed masses')
