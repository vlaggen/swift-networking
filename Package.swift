// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-networking",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v10),
        .tvOS(.v10),
        .watchOS(.v3),
    ],
    products: [
        .library(name: "VlaggenNetworking", targets: ["VlaggenNetworking"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "14.0.0")),
        .package(url: "https://github.com/vlaggen/swift-network-models.git", from: "1.0.1"),
    ],
    targets: [
        .target(name: "VlaggenNetworking", dependencies: [
            .product(name: "VlaggenNetworkModels", package: "swift-network-models"),
            .product(name: "Moya", package: "Moya"),
        ], path: "./Sources"),

        .testTarget(name: "VlaggenNetworkingTests", dependencies: [
            .target(name: "VlaggenNetworking"),
            .product(name: "Moya", package: "Moya"),
        ], resources: [
            .process("Resources")
        ])
    ]
)
