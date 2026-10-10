// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "AppleSiliconPhysics",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "AppleSiliconPhysics",
            targets: ["AppleSiliconPhysics"]
        ),
    ],
    targets: [
        .target(
            name: "AppleSiliconPhysics",
            dependencies: [],
            path: "SwiftPackage/Sources/AppleSiliconPhysics"
        ),
    ]
)
