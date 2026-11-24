module
public import Lean
public section
namespace KernelFixture
axiom witness : True
private theorem hidden : True := witness
theorem bridge : True := hidden
opaque natValue : Nat := 137
opaque strValue : String := "kernel literal fixture"
end KernelFixture
