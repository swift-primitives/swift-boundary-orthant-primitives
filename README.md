# swift-boundary-orthant-primitives

The lossless projection between `Boundary.Corner` and its `Orthant<2>` carrier — a per-carrier
bridge ([MOD-014]) adding `.orthant` and `init(orthant:)` so the bare `Boundary.Corner` enum
carries no `Orthant` dependency.

```swift
import Boundary_Orthant_Primitives

Boundary.Corner.topRight.orthant        // Orthant<2>(repeating: .positive)
Boundary.Corner(orthant: someOrthant)   // the matching corner
```

## License

Apache License 2.0. See [LICENSE](LICENSE.md).
