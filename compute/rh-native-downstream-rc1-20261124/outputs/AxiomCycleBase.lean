module

namespace CathedralAxiomCycle
public axiom guardProp : Prop
public inductive Witness : Type where
  | plain : Witness
  | guarded : guardProp → Witness

#print axioms Witness
#print axioms Witness.plain
#print axioms Witness.guarded
end CathedralAxiomCycle
