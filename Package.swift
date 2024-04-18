// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "feather-scripts",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .tvOS(.v17),
        .watchOS(.v10),
        .visionOS(.v1),
    ],
    products: [
        .library(name: "FeatherScripts", targets: ["FeatherScripts"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log", from: "1.0.0"),
        .package(
            url: "https://github.com/feather-framework/feather-component",
            .upToNextMinor(from: "0.5.0")
        ),
    ],
    targets: [
        .target(
            name: "FeatherScripts",
            dependencies: [
                .product(name: "Logging", package: "swift-log"),
                .product(
                    name: "FeatherComponent",
                    package: "feather-component"
                ),
            ]
        ),
        .testTarget(
            name: "FeatherScriptsTests",
            dependencies: [
                .target(
                    name: "FeatherScripts"
                )
            ]
        ),
    ]
)
