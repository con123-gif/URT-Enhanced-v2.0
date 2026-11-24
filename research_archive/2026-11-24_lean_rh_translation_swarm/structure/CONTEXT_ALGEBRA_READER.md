# Context-safe algebraic reader

Status: executed upstream exporter fixtures and large constructed graph; no full RH theorem export translated. Pin 40e56bab026552e089d7afcfeff08d2defb9c005. Exporter Test.lean v4.33.0 fixture JSON blob 2dc39052baf191b475aa0b85fbe53eb2f7452b47. 

## Exact scoped term algebra
For expression i, let d_i be the minimum number of enclosing binder slots required. bvar j requires j+1; constants, sorts and literals require 0; application takes max; lambda/Pi take max(d_type, max(d_body-1,0)); let takes max(d_type,d_value,max(d_body-1,0)); projection and metadata retain the child requirement. Induction on the constructor proves the rule. A declaration type/value must be closed; a recursor rule RHS must be closed. These are syntactic scope checks, not type checking. Every shared expression E_i is a context-parametric term, never indiscriminately reused as a closed theorem. The graph can be rendered as equations E_i(C), referencing prior IDs and push(t,C). This retains binding, type, universe, binder mode, projection and metadata information. Original name/level/declaration tables are still needed. URT's bounded score can select which equations to expand, not override their context or equality.

The fixture from Lean itself gives the dependent identity:
```
Π {v0 : Sort U1}, Π (v1 : v0), v0
λ {v0 : Sort U1}, λ (v1 : v0), v1
```
A human reads this as: for an implicit type alpha in universe u, and a term a of alpha, return a itself. The same variable index has different meanings at different binder depths; context is essential. This generic reader therefore does not equate equal-looking open subterms across contexts.

Exact expression-depth computation and shared equation emission are O(V+E) graph operations (plus output/literal sizes). Human expansion may grow exponentially: keep shared equations and cap display. Optional recursive pretty printer is bounded but not intended for deep huge terms; use equations there. Rendering uses generic Pi/lambda notation rather than inferring familiar operator notation without a verified symbol/type match. Declaration types/values rendered on upstream fixtures, not actual RH export yet.

## Actual RH-facing bridge, source-matched
Pinned src/Statements.lean blob 1cd1bce93344065936b2b392b23306254e0785ef defines DirichletLNonvanishingRightOfHalf as forall N natural, [NeZero N], chi DirichletCharacter C N, s complex, (1/2 < Re s) -> (chi != 1 or s != 1) -> L(chi,s) != 0.
Human mathematical statement: for every positive modulus N, every character modulo N, and every s with Re(s)>1/2, L(chi,s) is nonzero except the excluded principal-character point at s=1. This is an implication with the precise exception, not a claim of holomorphicity there. The present scope-aware algebra reader is designed to preserve exactly these nested binders and predicates when exported; the displayed RH-facing statement is translated directly from source, not output of the expression reader.

## Tests
{
  "fixtures": 14,
  "expressions": 121,
  "childEdges": 164,
  "openExpressions": 82,
  "declarations": 10,
  "renderedRoots": 16,
  "negativeControls": [
    "Error: bad expression ref 0",
    "Error: open declaration type",
    "Error: expansion budget exceeded; use shared equations"
  ],
  "large": {
    "expressions": 100000,
    "edges": 199998,
    "equations": 100000
  }
}

RESUME HERE: integrate name/level/term tables from typed challenge artifact, emit shared equations for real selected exported theorem roots, match types and symbols before pretty notation. Full-export retry run 45349329680 was still running at check. Do not label compiler tests as RH proof verification.