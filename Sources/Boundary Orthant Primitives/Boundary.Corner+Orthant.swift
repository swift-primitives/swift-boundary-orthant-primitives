// Boundary.Corner+Orthant.swift
// Lossless projection between Boundary.Corner and its Orthant<2> carrier.

public import Boundary_Primitives
public import Orthant_Primitives

extension Boundary.Corner {
    /// The 2D orthant this corner occupies: axis 0 = X (left = −, right = +),
    /// axis 1 = Y (bottom = −, top = +).
    @inlinable
    public var orthant: Orthant<2> {
        switch self {
        case .topLeft: Orthant { $0 == 0 ? .negative : .positive }
        case .topRight: Orthant { _ in .positive }
        case .bottomLeft: Orthant { _ in .negative }
        case .bottomRight: Orthant { $0 == 0 ? .positive : .negative }
        }
    }

    /// The box corner corresponding to a 2D orthant.
    @inlinable
    public init(orthant: Orthant<2>) {
        switch (orthant.directions[0], orthant.directions[1]) {
        case (.negative, .positive): self = .topLeft
        case (.positive, .positive): self = .topRight
        case (.negative, .negative): self = .bottomLeft
        default: self = .bottomRight  // (.positive, .negative)
        }
    }
}
