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
        .package(url: "https://github.com/khamitimur/AmazingEvent",
                 .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        .target(
            name: "AmazingCommand",
            dependencies: [
                "AmazingEvent"
            ]),
        .testTarget(
            name: "AmazingCommandTests",
            dependencies: [
                "AmazingCommand"
            ]),
    ]
)
