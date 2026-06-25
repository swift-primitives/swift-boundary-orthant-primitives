# Boundary Orthant Primitives

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

A lossless projection between rectangle corners and their per-axis sign vectors — bridges `Boundary.Corner` to `Orthant<2>` so neither primitive carries a dependency on the other.

---

## Quick Start

`Boundary.Corner` (a named corner of a rectangle) and `Orthant<2>` (a per-axis vector of `.positive` / `.negative` directions) are independent primitives: neither package depends on the other. This package is the per-carrier bridge between them, adding `.orthant` and `init(orthant:)` so a corner can travel as its sign vector and back without loss.

```swift
import Boundary_Orthant_Primitives

// A named corner carries its per-axis signs as a 2D orthant.
let signs = Boundary.Corner.topRight.orthant
print(signs.directions[0], signs.directions[1])   // positive positive

// Recover the corner from any orthant — the projection is lossless.
let corner = Boundary.Corner(orthant: signs)       // .topRight

// `opposite` commutes with the projection: flipping the corner
// flips every axis sign, and vice versa.
let lhs = Boundary.Corner.bottomLeft.opposite.orthant
let rhs = Boundary.Corner.bottomLeft.orthant.opposite
print(lhs == rhs)                                  // true
```

The mapping is fixed: axis 0 is the X axis (`left = .negative`, `right = .positive`), axis 1 is the Y axis (`bottom = .negative`, `top = .positive`). Round-tripping any of the four corners through `.orthant` and `init(orthant:)` returns the same corner.

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-primitives/swift-boundary-orthant-primitives.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Boundary Orthant Primitives", package: "swift-boundary-orthant-primitives"),
    ]
)
```

Requires Swift 6.3.1 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26 (or the matching Linux / Windows toolchain).

---

## Architecture

Two library products. Depends only on `Boundary Primitives` (for `Boundary.Corner`) and `Orthant Primitives` (for `Orthant<2>`), both of which it re-exports.

| Product | Target | Purpose |
|---------|--------|---------|
| `Boundary Orthant Primitives` | `Sources/Boundary Orthant Primitives/` | The bridge: `Boundary.Corner.orthant` and `Boundary.Corner.init(orthant:)`, the lossless projection onto `Orthant<2>`. Re-exports `Boundary Primitives` and `Orthant Primitives`. |
| `Boundary Orthant Primitives Test Support` | `Tests/Support/` | Re-exports the main target for test consumers. |

Foundation-free.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 26 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
