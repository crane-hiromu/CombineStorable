// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Storable",
    products: [
        .library(
            name: "Storable",
            targets: ["Storable"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Storable",
            dependencies: []),
        .testTarget(
            name: "StorableTests",
            dependencies: ["Storable"]),
    ]
)
