// swift-tools-version: 6.4
import PackageDescription

let package = Package(
    name: "swift-boundary-orthant-primitives",
    platforms: [.macOS(.v27), .iOS(.v27), .tvOS(.v27), .watchOS(.v27), .visionOS(.v27)],
    products: [
        .library(name: "Boundary Orthant Primitives", targets: ["Boundary Orthant Primitives"]),
        .library(
            name: "Boundary Orthant Primitives Test Support",
            targets: ["Boundary Orthant Primitives Test Support"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-primitives/swift-boundary-primitives.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-primitives/swift-orthant-primitives.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Boundary Orthant Primitives",
            dependencies: [
                .product(name: "Boundary Primitives", package: "swift-boundary-primitives"),
                .product(name: "Orthant Primitives", package: "swift-orthant-primitives"),
            ]
        ),
        .target(
            name: "Boundary Orthant Primitives Test Support",
            dependencies: ["Boundary Orthant Primitives"],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Boundary Orthant Primitives Tests",
            dependencies: [
                "Boundary Orthant Primitives", "Boundary Orthant Primitives Test Support",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
    let package: [SwiftSetting] = []
    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
