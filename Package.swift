// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Liquid",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "Liquid",
            targets: ["Liquid"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "CLiquid",
            dependencies: []),
        .target(
            name: "Liquid",
            dependencies: ["CLiquid"]),
        .testTarget(
            name: "LiquidTests",
            dependencies: ["CLiquid", "Liquid"]),
    ]
)
