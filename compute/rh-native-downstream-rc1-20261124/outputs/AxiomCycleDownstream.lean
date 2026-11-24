module
public import AxiomCycleBase
namespace CathedralAxiomCycleDownstream
open CathedralAxiomCycle
@[expose] public def aliasPlain : Witness := Witness.plain
@[expose] public def consume : Witness → Nat := fun _ => 0
@[expose] public def guardTag : Prop := guardProp
@[expose] public def cleanTag : Prop := True
end CathedralAxiomCycleDownstream
#print axioms CathedralAxiomCycleDownstream.aliasPlain
#print axioms CathedralAxiomCycleDownstream.consume
#print axioms CathedralAxiomCycleDownstream.guardTag
#print axioms CathedralAxiomCycleDownstream.cleanTag
