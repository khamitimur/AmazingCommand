// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "AmazingCommand",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v11),
        .tvOS(.v11),
        .watchOS(.v4)
    ],
    products: [
        .library(
            name: "AmazingCommand",
            targets: ["AmazingCommand"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "AmazingCommand",
            dependencies: [
            ]),
        .testTarget(
            name: "AmazingCommandTests",
            dependencies: [
                "AmazingCommand"
            ]),
    ]
)
