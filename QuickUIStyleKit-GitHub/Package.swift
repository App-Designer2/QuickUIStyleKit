// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "QuickUIStyleKit",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "QuickUIStyleKit",
            targets: ["QuickUIStyleKit"]
        ),
    ],
    targets: [
        .target(
            name: "QuickUIStyleKit",
            dependencies: []
        ),
        .testTarget(
            name: "QuickUIStyleKitTests",
            dependencies: ["QuickUIStyleKit"]
        ),
    ]
)
