module
public import AxiomCycleDownstream
namespace CathedralAxiomCycleThird
open CathedralAxiomCycle CathedralAxiomCycleDownstream
@[expose] public def aliasAgain : Witness := aliasPlain
@[expose] public def viaConsumer : Nat := consume Witness.plain
end CathedralAxiomCycleThird
#print axioms CathedralAxiomCycleThird.aliasAgain
#print axioms CathedralAxiomCycleThird.viaConsumer
