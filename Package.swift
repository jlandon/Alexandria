// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Alexandria",
    platforms: [
        .iOS(.v8),
    ],
    products: [
        .library(name: "Alexandria", targets: ["Alexandria"]),
    ],
    targets: [
        .target(name: "Alexandria", dependencies: []),
        .testTarget(name: "AlexandriaTests", dependencies: ["Alexandria"]),
    ],
    swiftLanguageVersions: [.v5]
)
